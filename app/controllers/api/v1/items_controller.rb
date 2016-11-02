module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: [:show, :edit, :update, :destroy]

      def index
        render json: Item.all, status: 200
      end

      def show
        render json: @item, status: 200
      end

      def create
        @item = Item.new(item_params)

        if @item.save
          render json: @item, status: 201
        else
          render json: @item.errors, status: 400
        end
      end

      def update
        if @item.update(item_params)
          render json: @item, status: 200
        else
          render json: @item.errors, status: 400
        end
      end

      def destroy
        @item.destroy
        head 204
      end

      private

      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.require(:item).permit(:name, :done)
      end
<<<<<<< HEAD
    end
  end
=======
class ItemsController < ApplicationController
  # before_action :set_user
  before_action :set_item, only: [:login, :show, :edit, :update, :destroy]

  # GET /items
  def show
    @items = Item.all
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name)
    end
>>>>>>> write test for BucketlistsController #show #index
=======
    end
  end
>>>>>>> fix rubocop issues
end
