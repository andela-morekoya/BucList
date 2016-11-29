module Api
  module V1
    class BucketlistsController < ApplicationController
      include Messages
      include ControllerHelper
      before_action :authenticate_request
      before_action :set_bucketlist, only: [:show, :update, :destroy]

      def index
        @bucketlists = current_user.bucketlists.search(params[:q])

        if params[:page] || params[:limit]
          @bucketlists = @bucketlists.paginate(params[:limit], params[:page])
        end

        render json: @bucketlists, status: :ok
      end

      def show
        render json: @bucketlist, status: :ok
      end

      def create
        @bucketlist = current_user.bucketlists.build(bucketlist_params)
        create_resource(@bucketlist)
      end

      def update
        update_resource(@bucketlist, bucketlist_params)
      end

      def destroy
        @bucketlist.destroy
        head 204
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find_by(id: params[:id])
        authorize_user
      end

      def bucketlist_params
        params.permit(:name)
      end
    end
  end
end
