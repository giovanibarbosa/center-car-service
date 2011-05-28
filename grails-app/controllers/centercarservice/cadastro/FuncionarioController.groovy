package centercarservice.cadastro

import centercarservice.financeiro.Salario

class FuncionarioController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def listSalariosAPagar = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def salarios = Salario.list()
		Set funcionariosInstanceList = new HashSet()
		for(Salario s : salarios) {
			if (s.getPago() == "Nao") {
				funcionariosInstanceList.add s.getFuncionario()
			}
		}
		return [funcionariosInstanceList  : funcionariosInstanceList , funcionariosInstanceListTotal: funcionariosInstanceList.size()]
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[funcionarioInstanceList: Funcionario.list(params), funcionarioInstanceTotal: Funcionario.count()]
	}

	def create = {
		def funcionarioInstance = new Funcionario()
		funcionarioInstance.properties = params
		return [funcionarioInstance: funcionarioInstance]
	}

	def save = {
		def funcionarioInstance = new Funcionario(params)
		if (funcionarioInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), funcionarioInstance.id])}"
			redirect(controller:"salario", action: "saveWithFuncionario", id: funcionarioInstance.id)
		}
		else {
			render(view: "create", model: [funcionarioInstance: funcionarioInstance])
		}
	}

	def show = {
		def funcionarioInstance = Funcionario.get(params.id)
		if (!funcionarioInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])}"
			redirect(action: "list")
		}
		else {
			[funcionarioInstance: funcionarioInstance]
		}
	}

	def edit = {
		def funcionarioInstance = Funcionario.get(params.id)
		if (!funcionarioInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [funcionarioInstance: funcionarioInstance]
		}
	}

	def update = {
		def funcionarioInstance = Funcionario.get(params.id)
		if (funcionarioInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (funcionarioInstance.version > version) {

					funcionarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'funcionario.label', default: 'Funcionario')]
					as Object[], "Another user has updated this Funcionario while you were editing")
					render(view: "edit", model: [funcionarioInstance: funcionarioInstance])
					return
				}
			}
			funcionarioInstance.properties = params
			if (!funcionarioInstance.hasErrors() && funcionarioInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), funcionarioInstance.id])}"
				redirect(action: "show", id: funcionarioInstance.id)
			}
			else {
				render(view: "edit", model: [funcionarioInstance: funcionarioInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def funcionarioInstance = Funcionario.get(params.id)
		if (funcionarioInstance) {
			try {
				funcionarioInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])}"
			redirect(action: "list")
		}
	}
}
