require 'rails_helper'

describe Api::V1::BucketlistsController, type: :controller do
  # let(:user) { FactoryGirl.create(:user) }
  let!(:my_bucket) { FactoryGirl.create(:bucketlist) }
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:bucketlist)
  }

  let(:invalid_attributes) { { name: nil } }

  let(:valid_session) { }

  describe "GET #index" do
    it "lists all the created bucket lists" do
      bucketlist = Bucketlist.create! valid_attributes
      get :index #, session: valid_session
      bucket = JSON.parse(response.body)
      
      expect(response.status).to be 200     
      expect(bucket[-2]["name"]).to eq my_bucket.name
      expect(bucket[-1]["name"]).to eq bucketlist.name
    end
  end

  describe "GET #show" do
    it "returns the requested bucketlist" do
      get :show, params: {id: my_bucket.id} # , session: valid_session
      bucket_name = JSON.parse(response.body)["name"]

      expect(response.status).to be 200
      expect(bucket_name).to eq my_bucket.name
    end
  end

  describe "GET #new" do
    xit "assigns a new bucketlist as @bucketlist" do
      get :new, params: {}#, session: valid_session
      expect(assigns(:bucketlist)).to be_a_new(bucketlist)
    end
  end

  describe "GET #edit" do
    xit "assigns the requested bucketlist as @bucketlist" do
      bucketlist = bucketlist.create! valid_attributes
      get :edit, params: {id: bucketlist.to_param}, session: valid_session
      expect(assigns(:bucketlist)).to eq(bucketlist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      xit "creates a new bucketlist" do
        expect {
          # post :create, params: {bucketlist: valid_attributes}, session: valid_session
          post :create, params: {bucketlist: valid_attributes}
        }.to change(bucketlist, :count).by(1)
      end

      xit "assigns a newly created bucketlist as @bucketlist" do
        post :create, params: {bucketlist: valid_attributes}
        expect(assigns(:bucketlist)).to be_a(bucketlist)
        expect(assigns(:bucketlist)).to be_persisted
      end
    end

    context "with invalid params" do
      xit "assigns a newly created but unsaved bucketlist as @bucketlist" do
        post :create, params: {bucketlist: invalid_attributes}
        expect(assigns(:bucketlist)).to be_a_new(bucketlist)
      end

      xit "returns error message" do
        post :create, params: {bucketlist: invalid_attributes}
        expect(response.body).to include("Invalid parameters")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      xit "updates the requested bucketlist" do
        bucketlist = bucketlist.create! valid_attributes
        put :update, params: {id: bucketlist.to_param, bucketlist: new_attributes}, session: valid_session
        bucketlist.reload
        skip("Add assertions for updated state")
      end

      xit "assigns the requested bucketlist as @bucketlist" do
        bucketlist = bucketlist.create! valid_attributes
        put :update, params: {id: bucketlist.to_param, bucketlist: valid_attributes}, session: valid_session
        expect(assigns(:bucketlist)).to eq(bucketlist)
      end

      xit "redirects to the bucketlist" do
        bucketlist = bucketlist.create! valid_attributes
        put :update, params: {id: bucketlist.to_param, bucketlist: valid_attributes}, session: valid_session
        expect(response).to redirect_to(bucketlist)
      end
    end

    context "with invalid params" do
      xit "assigns the bucketlist as @bucketlist" do
        bucketlist = bucketlist.create! valid_attributes
        put :update, params: {id: bucketlist.to_param, bucketlist: invalid_attributes}, session: valid_session
        expect(assigns(:bucketlist)).to eq(bucketlist)
      end

      xit "re-renders the 'edit' template" do
        bucketlist = bucketlist.create! valid_attributes
        put :update, params: {id: bucketlist.to_param, bucketlist: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    xit "destroys the requested bucketlist" do
      bucketlist = bucketlist.create! valid_attributes
      expect {
        delete :destroy, params: {id: bucketlist.to_param}, session: valid_session
      }.to change(bucketlist, :count).by(-1)
    end

    xit "redirects to the bucketlists list" do
      bucketlist = bucketlist.create! valid_attributes
      delete :destroy, params: {id: bucketlist.to_param}, session: valid_session
      expect(response).to redirect_to(bucketlists_url)
    end
  end
end
