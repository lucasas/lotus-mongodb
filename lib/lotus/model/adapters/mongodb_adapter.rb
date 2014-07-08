require 'moped'
require 'lotus/model/adapters/implementation'
require 'lotus/model/adapters/mongodb/command'
require 'lotus/model/adapters/mongodb/collection'

module Lotus
  module Model
    module Adapters
      class MongodbAdapter
        include Implementation

        def initialize(mapper, uris, database)
          @mapper, @connection = mapper, Moped::Session.new(uris)
          @connection.use(database)
        end

        def create(collection, entity)
          _command(collection).create(entity)
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
