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
    end
  end
end
