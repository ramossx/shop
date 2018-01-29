class ItemcommentsController < ApplicationController
	before_action :authenticate_user!

	def create
	params[:itemcomment][:item_id] = params[:item_id]
	params[:itemcomment][:user_id] = current_user.id
	@comment = Itemcomment.create(itemcomments_params)

	if @comment.save
		redirect_to item_path(params[:item_id])
	else
		@comment.errors.full_messages.each do |msg|
		@msg = msg
	end
flash[:notice] = "#{@msg}"
redirect_to item_path(params[:item_id])
	end
end

	private
	def itemcomments_params
		params.require(:itemcomment).permit(:user_id, :item_id, :text)

	end

end
