package centercarservice.financeiro

import centercarservice.financeiro.Salario

class SalarioController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[salarioInstanceList: Salario.list(params), salarioInstanceTotal: Salario.count()]
	}

	def create = {
		def salarioInstance = new Salario()
		salarioInstance.properties = params
		return [salarioInstance: salarioInstance]
	}

	def saveWithFuncionario = {
		def salarioInstance = new Salario(params)
		if (salarioInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'salario.label', default: 'Salario'), salarioInstance.id])}"
			redirect(action: "show", id: salarioInstance.id)
		}
		else {
			render(view: "create", model: [salarioInstance: salarioInstance])
		}
	}

	def save = {
		def salarioInstance = new Salario(params)
		if (salarioInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'salario.label', default: 'Salario'), salarioInstance.id])}"
			redirect(action: "show", id: salarioInstance.id)
		}
		else {
			render(view: "create", model: [salarioInstance: salarioInstance])
		}
	}

	def show = {
		def salarioInstance = Salario.get(params.id)
		if (!salarioInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salario.label', default: 'Salario'), params.id])}"
			redirect(action: "list")
		}
		else {
			[salarioInstance: salarioInstance]
		}
	}

	def edit = {
		def salarioInstance = Salario.get(params.id)
		if (!salarioInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salario.label', default: 'Salario'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [salarioInstance: salarioInstance]
		}
	}

	def update = {
		def salarioInstance = Salario.get(params.id)
		if (salarioInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (salarioInstance.version > version) {

					salarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'salario.label', default: 'Salario')]
					as Object[], "Another user has updated this Salario while you were editing")
					render(view: "edit", model: [salarioInstance: salarioInstance])
					return
				}
			}
			salarioInstance.properties = params
			if (!salarioInstance.hasErrors() && salarioInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'salario.label', default: 'Salario'), salarioInstance.id])}"
				redirect(action: "show", id: salarioInstance.id)
			}
			else {
				render(view: "edit", model: [salarioInstance: salarioInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salario.label', default: 'Salario'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def salarioInstance = Salario.get(params.id)
		if (salarioInstance) {
			try {
				salarioInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'salario.label', default: 'Salario'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'salario.label', default: 'Salario'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salario.label', default: 'Salario'), params.id])}"
			redirect(action: "list")
		}
	}
}
