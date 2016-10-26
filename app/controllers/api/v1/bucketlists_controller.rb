# Module Api
#   Module V1
    class Api::V1::BucketlistsController < ApplicationController
      # before_action :set_user
      before_action :set_bucketlist, only: [:login, :show, :edit, :update, :destroy]

      # GET /bucketlists
      def index
        render json: Bucketlist.all
      end

      # GET /bucketlist
      def show
        render json: @bucketlist
      end

      # GET /bucketlists/new
      def new
        @bucketlist = Bucketlist.new
      end

      # GET /bucketlists/1/edit
      def edit
      end

      # POST /bucketlists
      def create
        @bucketlist = Bucketlist.new(bucketlist_params)

        if @bucketlist.save
          redirect_to @bucketlist, notice: 'Bucketlist was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /bucketlists/1
      def update
        if @bucketlist.update(bucketlist_params)
          redirect_to @bucketlist, notice: 'Bucketlist was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /bucketlists/1
      def destroy
        @bucketlist.destroy
        redirect_to bucketlists_url, notice: 'Bucketlist was successfully destroyed.'
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

