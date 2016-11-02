# Module Api
#   Module V1
    class Api::V1::ItemsController < ApplicationController
      # before_action :set_user
      before_action :set_item, only: [:show, :edit, :update, :destroy]

      # GET /items
      def index
        render json: Item.all, status: 200
      end

      # GET /item
      def show
        render json: @item, status: 200
      end

      # POST /items
      def create
        @item = Item.new(item_params)

        if @item.save
          render json: @item, status: 201
        else
          render json: @item.errors, status: 400
        end
      end

      # PATCH/PUT /items/1
      def update
        if @item.update(item_params)
          render json: @item, status: 200
        else
          render json: @item.errors, status: 400
        end
      end

      # DELETE /items/1
      def destroy
        @item.destroy
        head 204
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_item
          @item = Item.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def item_params
          params.require(:item).permit(:name, :done)
        end
    end
#   end
# end
