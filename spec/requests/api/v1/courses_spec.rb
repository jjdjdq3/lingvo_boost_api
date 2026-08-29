require 'swagger_helper'

RSpec.describe 'Api/V1/Courses', type: :request do
  path '/api/v1/courses' do
    get 'List of courses' do
      tags 'Courses'
      produces 'application/json'
      
      parameter name: :level, in: :query, type: :string, description: 'Filter by level', required: false

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 courses: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       title: { type: :string },
                       level: { type: :string }
                     },
                     required: ['id', 'title', 'level']
                   }
                 }
               },
               required: ['courses']

        let(:level) { 'A1' }
        
        run_test! 
      end  
    end
  end
end