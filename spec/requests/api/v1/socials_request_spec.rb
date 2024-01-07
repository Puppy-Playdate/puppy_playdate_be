require 'rails_helper'

describe "Socials API", type: :request do
  describe "Socials Index" do
    it "sends a list of socials" do
      # user = create(:user)
      # up_dog = create(:dog, user: user)
      socials_list = create_list(:social, 5)
      # user_social = UserSocial.create!(user_id: user.id, social_id: socials_list.first.id)
      # user_social = UserSocial.create!(user_id: user.id, social_id: socials_list.last.id)
      
      # This commented portion of test data I believe will be needed more for a Users socials index and a users socials show page. Only created socials since a social does not belong to a user but shares a relation via the join page   

      get api_v1_socials_path
      
      expect(response).to be_successful

      socials = JSON.parse(response.body, symbolize_names: true)
      expect(socials[:data].count).to eq(5)
      
      socials[:data].each do |social|
        expect(social).to be_a(Hash)
        # require 'pry'; binding.pry
        expect(socials[:data]).to be_an(Array)
        
        expect(social).to have_key(:id)
        expect(social[:id]).to be_an(String)
        
        expect(social).to have_key(:attributes)
        
        expect(social[:attributes]).to have_key(:name)
        expect(social[:attributes][:name]).to be_a(String)

        expect(social[:attributes]).to have_key(:breed)
        expect(social[:attributes][:breed]).to be_a(String)

        expect(social[:attributes]).to have_key(:age)
        expect(social[:attributes][:age]).to be_a(Integer)

        expect(social[:attributes]).to have_key(:size)
        expect(social[:attributes][:size]).to be_a(String)

        expect(social[:attributes]).to have_key(:neutered)
        expect(social[:attributes][:neutered]).to be_a(TrueClass).or be_a(FalseClass)
      end
    end
  end

  describe "Socials Show" do
    xit "can get one Social by its id" do
      user = create(:user)
      dog = create(:dog, user: user)
      
      get api_v1_user_dog_path(user.id, dog.id)

      dog_request = JSON.parse(response.body, symbolize_names: true) 

      expect(response).to be_successful
      expect(dog_request).to be_a(Hash)
      
      expect(dog_request[:data]).to have_key(:id)
      expect(dog_request[:data][:id]).to be_an(String)
  
      expect(dog_request[:data][:attributes]).to have_key(:name)
      expect(dog_request[:data][:attributes][:name]).to be_a(String)
  
      expect(dog_request[:data][:attributes]).to have_key(:breed)
      expect(dog_request[:data][:attributes][:breed]).to be_a(String)

      expect(dog_request[:data][:attributes]).to have_key(:age)
      expect(dog_request[:data][:attributes][:age]).to be_a(Integer)

      expect(dog_request[:data][:attributes]).to have_key(:size)
      expect(dog_request[:data][:attributes][:size]).to be_a(String)

      expect(dog_request[:data][:attributes]).to have_key(:neutered)
      expect(dog_request[:data][:attributes][:neutered]).to be_a(TrueClass).or be_a(FalseClass)
    end
  end

  describe "Social Create" do
    xit "can create a new Social" do
      user = create(:user)
      dog_params = ({
                      name: 'James Sullivan',
                      breed: 'Pitbull',
                      age: 3,
                      size: "medium",
                      neutered: true
                    })
      headers = {"CONTENT_TYPE" => "application/json"}
    
      post api_v1_user_dogs_path(user.id, dog_params), headers: headers, params: JSON.generate(dog: dog_params)
      
      created_dog = Dog.last

      expect(response).to be_successful
      expect(created_dog.name).to eq(dog_params[:name])
      expect(created_dog.breed).to eq(dog_params[:breed])
      expect(created_dog.age).to eq(dog_params[:age])
      expect(created_dog.size).to eq(dog_params[:size])
      expect(created_dog.neutered).to be(true).or be(false)
    end

    xit "sad path; will send an error if social is not created" do 
      user = create(:user)
      dog_params = ({
        name: "",
        breed: 'Pitbull',
        age: 3,
        size: "medium",
        neutered: true
      })
      headers = {"CONTENT_TYPE" => "application/json"}
  
      post api_v1_user_dogs_path(user.id, dog_params), headers: headers, params: JSON.generate(dog: dog_params)

      expect(response).to_not be_successful 
      expect(response).to have_http_status(401)
    end
  end

  describe "Social Update" do
    xit "can update an existing social" do
      user = create(:user)
      dog = create(:dog, user: user)
      previous_name = Dog.last.name
      dog_param = { name: "P. Sherman" }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch api_v1_user_dog_path(user.id, dog.id), params: dog_param
      up_dog = Dog.find_by(id: dog.id)
      expect(response).to be_successful
      expect(up_dog.name).to_not eq(previous_name)
      expect(up_dog.name).to eq("P. Sherman")
    end

    xit "sad path; will send an error if dog is not created" do 
      user = create(:user)
      dog = create(:dog, user: user)
      previous_name = Dog.last.name
      dog_param = { name: "" }
      headers = {"CONTENT_TYPE" => "application/json"}
  
      patch api_v1_user_dog_path(user.id, dog.id), params: dog_param
      expect(response).to_not be_successful 
      expect(response).to have_http_status(422)
    end
  end

  describe "Social Destroy" do
    xit "can destroy an Social" do
      user = create(:user)
      dog = create(:dog, user: user)
    
      expect(Dog.count).to eq(1)
    
      delete api_v1_user_dog_path(user.id, dog.id)
    
      expect(response).to be_successful
      expect(Dog.count).to eq(0)
      expect{Dog.find(dog.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end