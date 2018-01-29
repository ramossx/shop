class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_order, only:[:update,:destroy]

	def index
		@orders=[];
    	@orders=Order.where(user_id: current_user.id)
   	    @order=nil
	end

	def create
		@order=Order.create(user_id: current_user.id, item_id: params[:id], counts: 1, stats: false)
		redirect_to orders_path
	end

	def update
		@order.update(order_params)
	    redirect_to orders_path
	end

	def destroy
		@order.destroy
		redirect_to orders_path
	end

	def plus
		pp @order=Order.where(user_id: current_user.id,item_id: params[:id],stats: false).first
		if @order !=nil
		@order.update(counts: @order.counts+1)
	end
		redirect_to orders_path	
	end

	def minus
		@order=Order.where(user_id: current_user.id,item_id: params[:id],stats: false).first
		if @order != nil
		    if @order.counts>1
		        @order.update(counts: @order.counts-1)
	        end
	    end
	    redirect_to orders_path
	end

	def confirm
		pp @orders=Order.where(user_id: current_user.id,stats: false)
		@orders.each do |order|
			pp order.update(stats: true, oriental_at: params[:time][:org_at]+" "+params[:time][:tim_at])
		end
		redirect_to orders_path
	end

	private

	def order_params
		params.require(:order).permit(:user_id,:item_id,:counts)
	end

	def set_order
		@order=Order.find(params[:id])
	end


end
	