require 'mongo'
require 'bson'
require 'lotus/model/adapters/abstract'
require 'lotus/model/adapters/implementation'
require 'lotus/model/adapters/mongodb/command'
require 'lotus/model/adapters/mongodb/collection'
require 'lotus/model/adapters/mongodb/coercer'

module Lotus
  module Model
    module Adapters
      class MongodbAdapter < Abstract
        include Implementation
        include Mongo

        attr_reader :connection

        def initialize(mapper, options = {})
          super(mapper)

          @connection = MongoClient.new(
            options.fetch(:host, 'localhost'),
            options.fetch(:port, 27017)
          )[options.fetch(:database)]
        end

        def create(collection, entity)
          _command(collection).create(entity)
        end

        def find(collection, id)
          _command(collection).find(id)
        end

        private

        def _command(collection)
          Mongodb::Command.new(_collection(collection))
        end

        def _collection(name)
          Mongodb::Collection.new(@connection, _mapped_collection(name))
        end
      end
    end
  end
end
