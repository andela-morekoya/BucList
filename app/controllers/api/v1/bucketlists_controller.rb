module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_with_token

      def index
        render json: Bucketlist.all, status: 200
      end

      def show
        render json: @bucketlist, status: 200 
      end

=======
# Module Api
#   Module V1
    class Api::V1::BucketlistsController < ApplicationController
      # before_action :set_user
      before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]

      # GET /bucketlists
      def index
        render json: Bucketlist.all, status: 200
      end

      # GET /bucketlist
      def show
        render json: @bucketlist, status: 200
      end

      # POST /bucketlists
>>>>>>> write test for BucketlistsController #show #index
      def create
        @bucketlist = Bucketlist.new(bucketlist_params)
        if @bucketlist.save
<<<<<<< HEAD
<<<<<<< HEAD
          render json: @bucketlist, status: 201
        else
          render json: @bucketlist, status: 400
        end
      end

      def update
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist, status: 200
        else
          render json: @bucketlist, status: 400
        end
      end

      def destroy
        @bucketlist.destroy
        head 204
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find(params[:id])
      end

      def bucketlist_params
        params.require(:bucketlist).permit(:name, user: current_user)
      end
    end
  end
end
=======
          redirect_to @bucketlist, notice: 'Bucketlist was successfully created.'
=======
          render json: @bucketlist, status: 201
>>>>>>> convert controller specs to feature tests
        else
          render json: @bucketlist.errors, status: 400
        end
      end

      def update
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist, status: 200
        else
          render json: @bucketlist.errors, status: 400
        end
      end

      def destroy
        @bucketlist.destroy
        head 204
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find(params[:id])
      end

      def bucketlist_params
        params.require(:bucketlist).permit(:name)
      end
    end
<<<<<<< HEAD
#   end
# end
<<<<<<< HEAD

>>>>>>> write test for BucketlistsController #show #index
=======
>>>>>>> convert controller specs to feature tests
=======
  end
end
>>>>>>> fix rubocop issues
