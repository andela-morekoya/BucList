Module Api
  Module V1
    class BucketlistsController < ApplicationController
      # before_action :set_user
      before_action :set_bucketlist, only: [:show, :update, :destroy]

      # GET /bucketlists
      def index
        render json: Bucketlist.all
      end

      # GET /bucketlist/1
      def show
        render json: @bucketlist
      end

      # POST /bucketlists
      def create
        @bucketlist = Bucketlist.new(bucketlist_params)

        if @bucketlist.save
          render json: @bucketlist
        else
          render :new
        end
      end

      # PATCH/PUT /bucketlists/1
      def update
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist
        else
          render :edit
        end
      end

      # DELETE /bucketlists/1
      def destroy
        @bucketlist.destroy
        render json: 'Bucketlist was successfully destroyed.'
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
  end
end

