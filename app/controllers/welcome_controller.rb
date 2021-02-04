class WelcomeController < ApplicationController
    def index
      cookies[:curso] = "Curso de ruby on rails com - Jackson Pires[COOKIE]"
      session[:curso] = "Curso de ruby on rails com - Jackson Pires[session]"
      @meu_nome = params[:nome]
      @curso = params[:curso]
    end
  end
  