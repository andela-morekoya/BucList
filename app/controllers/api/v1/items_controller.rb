module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_with_token

      def index
        render json: Item.all, status: :ok
      end

      def show
        render json: @item, status: :ok
      end

      def create
        set_bucketlist
        @item = @bucketlist.items.build(item_params)

        if @item.save
          render json: @item, status: :created
        else
          render json: @item, status: :bad_request
        end
      end

      def update
        if @item.update(item_params)
          render json: @item, status: :ok
        else
          render json: @item, status: :bad_request
        end
      end

      def destroy
        @item.destroy
        head 204
      end

      private

      def set_item
        @item = Item.find_by(id: params[:id])
      end

      def set_bucketlist
        @bucketlist = Bucketlist.find_by(id: params[:bucketlist_id])
      end

      def item_params
        params.require(:item).permit(:name, :done)
      end
    end
  end
end
