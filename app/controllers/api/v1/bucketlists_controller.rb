module Api
  module V1
    class BucketlistsController < ApplicationController
      include Messages
      before_action :authenticate_request
      before_action :set_bucketlist, only: [:show, :update, :destroy]
      
      def index
        @bucketlists = (current_user.bucketlists.search(params[:q]) \
          if params[:q]) || current_user.bucketlists.all

        if params[:page] || params[:limit]
          @bucketlists = @bucketlists.paginate(params[:limit], params[:page]) 
        end

        render json: { bucketlists: @bucketlists }, status: :ok
      end

      def show
        render json: { bucketlist: @bucketlist }, status: :ok
      end

      def create
        @bucketlist = current_user.bucketlists.build(bucketlist_params)

        if @bucketlist.save
          render json: { bucketlist: @bucketlist }, status: :created
        else
          render json: { errors: not_created('Bucketlist') }, \
                 status: :bad_request
        end
      end

      def update
        if @bucketlist.update(bucketlist_params)
          render json: { bucketlist: @bucketlist }, status: :ok
        else
          render json: { errors: not_updated('Bucketlist') }, \
                 status: :bad_request
        end
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

      def authorize_user
        unless current_user.id == @bucketlist.user_id 
          render json: { errors: no_access }, status: :forbidden  
        end
      end
    end
  end
end
