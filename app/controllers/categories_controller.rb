class CategoriesController < ApplicationController

def show

	@categorie=Categorie.find(params[:id])
	@items=Item.where(categorie_id: @categorie.id)
	if current_user !=nil
	@orders=[]
	@items.each do |item|
		@orders[item.id]=Order.where(user_id: current_user.id ,item_id: item, stats: false).first

	end

	else
	@orders=nil
	end
end

def edit
	@categorie=Categorie.find(params[:id])
end

def update
	@categorie=Categorie.find(params[:id])
    @categorie.update(cat_params)
end

private
def cat_params
params.require(:categorie).permit(:name,:description,:photo)
end
end
