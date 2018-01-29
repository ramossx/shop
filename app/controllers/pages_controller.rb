class PagesController < ApplicationController
  def index
  	@categories=Categorie.all
  end

  def about
  end
end
