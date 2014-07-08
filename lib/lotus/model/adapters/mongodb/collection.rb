module Lotus
  module Model
    module Adapters
      module Mongodb
        class Collection
          def initialize(connection, collection)
            @connection, @collection = connection, collection
          end

          def insert(entity)
            @connection[@collection.name].insert(_serialize(entity))
          end

          private

          def _serialize(entity)
            @collection.serialize(entity)
          end
        end
      end
    end
  end
end
