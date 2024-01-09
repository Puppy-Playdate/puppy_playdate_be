require 'rails_helper'

RSpec.describe DogSerializer, type: :request do
  describe "Dog Serializer" do
    it "serailizes data to JSON" do
      user = create(:user)
      dogs = create_list(:dog, 5, user: user)

      user_id = user.id

      get api_v1_user_dogs_path(user_id)

      expect(response).to be_successful

      users_dogs = JSON.parse(response.body)["data"]

      expect(users_dogs.count).to eq(5)

      users_dogs.each do |dog|
        expect(dog).to have_key("id")
        expect(dog["id"]).to be_a(String)

        expect(dog).to have_key("type")
        expect(dog["type"]).to eq("dog")

        expect(dog).to have_key("attributes")
        expect(dog["attributes"]).to be_a(Hash)

        expect(dog["attributes"]).to have_key("name")
        expect(dog["attributes"]["name"]).to be_a(String)

        expect(dog["attributes"]).to have_key("breed")
        expect(dog["attributes"]["breed"]).to be_a(String)

        expect(dog["attributes"]).to have_key("age")
        expect(dog["attributes"]["age"]).to be_a(Integer)

        expect(dog["attributes"]).to have_key("size")
        expect(dog["attributes"]["size"]).to be_a(String)

        expect(dog["attributes"]).to have_key("neutered")
        expect(dog["attributes"]["neutered"]).to be_a(TrueClass).or be_a(FalseClass)
      end
    end
  end 
end