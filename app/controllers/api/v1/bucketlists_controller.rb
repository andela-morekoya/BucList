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
      def create
        @bucketlist = Bucketlist.new(bucketlist_params)

        if @bucketlist.save
          render json: @bucketlist, status: 201
        else
          render json: @bucketlist.errors, status: 400
        end
      end

      # PATCH/PUT /bucketlists/1
      def update
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist, status: 200
        else
          render json: @bucketlist.errors, status: 400
        end
      end

      # DELETE /bucketlists/1
      def destroy
        @bucketlist.destroy
        head 204
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_bucketlist
          @bucketlist = Bucketlist.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def bucketlist_params
          params.require(:bucketlist).permit(:name)
        end
    end
#   end
# end
