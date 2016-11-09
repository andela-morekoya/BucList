module Api
  module V1
    class ItemsController < ApplicationController
      include Messages
      include ControllerHelper
      before_action :authenticate_request
      before_action :set_bucketlist
      before_action :set_item, only: [:show, :edit, :update, :destroy]

      def index
        render json: @bucketlist.items, status: :ok
      end

      def show
        render json: @item, status: :ok
      end

      def create
        @item = @bucketlist.items.build(item_params)
        create_resource(@item)
      end

      def update
        update_resource(@item, item_params)
      end

      def destroy
        @item.destroy
        head 204
      end

      private

      def set_item
        @item = @bucketlist.items.find_by(id: params[:id])
      end

      def set_bucketlist
        @bucketlist = Bucketlist.find_by(id: params[:bucketlist_id])
        authorize_user
      end

      def item_params
        params.permit(:name, :done)
      end
    end
  end
end
