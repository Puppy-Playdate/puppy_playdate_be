require 'rails_helper'

RSpec.describe ErrorSerializer do
  describe '#serialize_json' do
    it 'serializes the error object correctly' do
      error_object = ErrorMessage.new(404, 'Not Found')
      serializer = ErrorSerializer.new(error_object)

      expected_result = {
        errors: [
          {
            status: '404',
            title: 'Not Found'
          }
        ]
      }

      expect(serializer.serialize_json).to eq(expected_result)
    end

    it 'serializes a 401 Unauthorized error' do
      error_object = ErrorMessage.new(401, 'Unauthorized Access')
      serializer = ErrorSerializer.new(error_object)

      expected_result = {
        errors: [
          {
            status: '401',
            title: 'Unauthorized Access'
          }
        ]
      }

      expect(serializer.serialize_json).to eq(expected_result)
    end

    it 'serializes a 500 Internal Server Error' do
      error_object = ErrorMessage.new(500, 'Internal Server Error')
      serializer = ErrorSerializer.new(error_object)

      expected_result = {
        errors: [
          {
            status: '500',
            title: 'Internal Server Error'
          }
        ]
      }

      expect(serializer.serialize_json).to eq(expected_result)
    end
  end
end