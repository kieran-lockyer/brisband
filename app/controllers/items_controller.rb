class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    session[:item_id] = params[:id]
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if params[:item][:images]
      @item.images.attach(params[:item][:images])
    end
  
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        if params[:item][:images]
          @item.images.attach(params[:item][:images])
        end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image_attachment
    imageblob = ActiveStorage::Blob.find_signed(params[:id])
    blob_id = imageblob.id
    imageattachment = ActiveStorage::Attachment.find_by(blob_id: blob_id)
    @item = Item.find(imageattachment.record_id)

    if imageattachment != nil && imageattachment.purge
      imageblob.purge
    end
    
    redirect_to edit_item_path(@item)
  end

  def flag
    item = Item.find(params[:id])
    item.flagged = true
    item.save

    redirect_to items_path
  end

  def unflag
    item = Item.find(params[:id])
    item.flagged = false
    item.save

    redirect_to admin_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:brand, :model, :description, :price, :for_sale, :images)
    end

    def check_permissions
      if !@item.can_change?(current_user)
        redirect_to(request.referrer || root_path, :alert => "You are not authorized to perform that 		          action!")
      end
    end
end
