# require "rails_helper"

# RSpec.describe Api::V1::SessionsController, type: :controller do
#   let(:user) { FactoryGirl.create(:user, password: "correct") }

#   describe "#create" do
#     context "with correct login details" do
#       it "renders user's authentication token" do
#         login_details = { email: user.email, password: "correct"}

#         process :create, method: :post, params: { user: login_details } 

#         expect(response.body).to include "token"
#       end
#     end

#     context "with incorrect login details" do
#       it "should reject login" do
#         login_details = { email: user.email, password: "wrong"}

#         process :create, method: :post, params: { user: login_details }

#         expect(response.status).to eq "4"
#       end
#     end
#   end

#   describe "#delete" do
#     it "logs out user" do
#       post :destroy, session: { email: user.email, password: user.password }

#       expect(response.status).to eq 204
#     end
#   end
# end
# # {"users":[{"email":"try@here.com","password":"unsecure"}]}
