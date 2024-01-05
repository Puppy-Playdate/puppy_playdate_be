require 'rails_helper'

describe "Dogs API", type: :request do
  describe "Dogs Index" do
    it "sends a list of dogs" do
      user = create(:user)
      dog_list = create_list(:dog, 5, user: user)

      get api_v1_user_dogs_path(user.id, dog_list)

      expect(response).to be_successful

      dogs = JSON.parse(response.body, symbolize_names: true)

      expect(dogs[:data].count).to eq(5)

      dogs[:data].each do |dog|
        expect(dogs).to be_a(Hash)
        expect(dogs[:data]).to be_an(Array)
        
        expect(dog).to have_key(:id)
        expect(dog[:id]).to be_an(String)
        
        expect(dog).to have_key(:attributes)
        
        expect(dog[:attributes]).to have_key(:name)
        expect(dog[:attributes][:name]).to be_a(String)

        expect(dog[:attributes]).to have_key(:breed)
        expect(dog[:attributes][:breed]).to be_a(String)

        expect(dog[:attributes]).to have_key(:age)
        expect(dog[:attributes][:age]).to be_a(Integer)

        expect(dog[:attributes]).to have_key(:size)
        expect(dog[:attributes][:size]).to be_a(String)

        expect(dog[:attributes]).to have_key(:neutered)
        expect(dog[:attributes][:neutered]).to be_a(TrueClass).or be_a(FalseClass)
      end
    end
  end

  describe "Dog Show" do
    it "can get one Dog by its id" do
      user = create(:user)
      dog = create(:dog, user: user)
      
      get "/api/v1/users/#{:user_id}/dogs/#{:dog_id}"
      
      dog_request = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry   
  
      expect(response).to be_successful
      expect(dog_request).to be_a(Hash)
      
      expect(dog_request[:data]).to have_key(:id)
      expect(dog_request[:data][:id]).to be_an(String)
  
      expect(dog_request[:data][:attributes]).to have_key(:name)
      expect(dog_request[:data][:attributes][:name]).to be_a(String)
  
      expect(dog_request[:data][:attributes]).to have_key(:email)
      expect(dog_request[:data][:attributes][:email]).to be_a(String)
    end
  end

  describe "Dog Create" do
    it "can create a new Dog" do
      dog_params = ({
                      name: 'James Sullivan',
                      email: 'james.p.sullivan@aol.com',
                      password: "gw45635yhethet5"
                    })
      headers = {"CONTENT_TYPE" => "application/json"}
    
      post api_v1_dogs_path, headers: headers, params: JSON.generate(dog: dog_params)
      
      created_dog = Dog.last

      expect(response).to be_successful
      expect(created_dog.name).to eq(dog_params[:name])
      expect(created_dog.email).to eq(dog_params[:email])
      expect(created_dog.password).to eq(dog_params[:password_digest])
    end

    it "sad path; will send an error if dog is not created" do 
      dog_params = ({
        name: "",
        email: 'james.p.sullivan@aol.com',
        role: 1,
        password: "gw45635yhethet5"
      })
      headers = {"CONTENT_TYPE" => "application/json"}
  
      post api_v1_dogs_path, headers: headers, params: JSON.generate(dog: dog_params)

      expect(response).to_not be_successful 
      expect(response).to have_http_status(401)
    end
  end

  describe "Dog Update" do
    it "can update an existing dog" do
      id = create(:dog).id
      previous_name = Dog.last.name
      dog_param = { name: "P. Sherman" }
      headers = {"CONTENT_TYPE" => "application/json"}
    
      patch api_v1_dog_path(id), headers: headers, params: JSON.generate({dog: dog_param})
  
      dog = Dog.find_by(id: id)
      expect(response).to be_successful
      expect(dog.name).to_not eq(previous_name)
      expect(dog.name).to eq("P. Sherman")
      expect(dog.email).to eq(dog.email)
    end

    it "sad path; will send an error if dog is not created" do 
      dog_params = ({
        name: "",
        email: 'james.p.sullivan@aol.com',
        password: "gw45635yhethet5"
      })
      headers = {"CONTENT_TYPE" => "application/json"}
  
      post api_v1_dogs_path, headers: headers, params: JSON.generate(dog: dog_params)
      expect(response).to_not be_successful 
      expect(response).to have_http_status(401)
    end
  end

  describe "Dog Destroy" do
    it "can destroy an dog" do
      
      dog = create(:dog)
    
      expect(Dog.count).to eq(1)
    
      delete api_v1_dog_path(dog.id)
    
      expect(response).to be_successful
      expect(Dog.count).to eq(0)
      expect{Dog.find(dog.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end