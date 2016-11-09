module Api
  module V1
    class BucketlistsController < ApplicationController
      include Messages
      before_action :set_bucketlist, only: [:show, :update, :destroy]
      before_action :authenticate_request

      def index
        @bucketlists = Bucketlist.search_and_paginate(params)
        render json: { bucketlists: @bucketlists }, status: :ok
      end

      def show
        render json: @bucketlist, status: :ok
      end

      def create
        @bucketlist = current_user.bucketlists.build(bucketlist_params)

        if @bucketlist.save
          render json: @bucketlist, status: :created
        else
          render json: { error: not_created('Bucketlist') }, \
                 status: :bad_request
        end
      end

      def update
        if @bucketlist.user_id == current_user.id
          if @bucketlist.update(bucketlist_params)
            render json: @bucketlist, status: :ok
          else
            render json: { error: not_updated('Bucketlist') }, \
                   status: :bad_request
          end
        else
          render json: { error: no_access }, status: :forbidden
        end
      end

      def destroy
        if @bucketlist.user_id == current_user.id
          @bucketlist.destroy
          head 204
        else
          render json: { error: no_access }, status: :forbidden
        end
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find(params[:id])
      end

      def bucketlist_params
        params.permit(:name)
      end
    end
  end
end
