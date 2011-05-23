package centercarservice.financeiro

import java.text.Normalizer.Form;

import centercarservice.financeiro.Salario
import centercarservice.cadastro.Funcionario

class CaixaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "listSalariosAPagar", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[caixaInstanceList: Caixa.list(params), caixaInstanceTotal: Caixa.count()]
	}

	def create = {
		def caixaInstance = new Caixa()
		caixaInstance.properties = params
		return [caixaInstance: caixaInstance]
	}

	def save = {
		def caixaInstance = new Caixa(params)
		if (caixaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'caixa.label', default: 'Caixa'), caixaInstance.id])}"
			redirect(action: "show", id: caixaInstance.id)
		}
		else {
			render(view: "create", model: [caixaInstance: caixaInstance])
		}
	}

	def show = {
		def caixaInstance = Caixa.get(params.id)
		if (!caixaInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caixa.label', default: 'Caixa'), params.id])}"
			redirect(action: "list")
		}
		else {
			[caixaInstance: caixaInstance]
		}
	}

	def edit = {
		def caixaInstance = Caixa.get(params.id)
		if (!caixaInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caixa.label', default: 'Caixa'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [caixaInstance: caixaInstance]
		}
	}

	def update = {
		def caixaInstance = Caixa.get(params.id)
		if (caixaInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (caixaInstance.version > version) {

					caixaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'caixa.label', default: 'Caixa')]
					as Object[], "Another user has updated this Caixa while you were editing")
					render(view: "edit", model: [caixaInstance: caixaInstance])
					return
				}
			}
			caixaInstance.properties = params
			if (!caixaInstance.hasErrors() && caixaInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'caixa.label', default: 'Caixa'), caixaInstance.id])}"
				redirect(action: "show", id: caixaInstance.id)
			}
			else {
				render(view: "edit", model: [caixaInstance: caixaInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caixa.label', default: 'Caixa'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def caixaInstance = Caixa.get(params.id)
		if (caixaInstance) {
			try {
				caixaInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'caixa.label', default: 'Caixa'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'caixa.label', default: 'Caixa'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caixa.label', default: 'Caixa'), params.id])}"
			redirect(action: "list")
		}
	}
}
