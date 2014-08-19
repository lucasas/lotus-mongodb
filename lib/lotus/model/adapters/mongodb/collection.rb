module Lotus
  module Model
    module Adapters
      module Mongodb
        class Collection
          def initialize(connection, collection)
            @connection, @collection = connection, collection
          end

          def insert(entity)
            entity.id = _id = @connection[@collection.name].insert(_serialize(entity))
          end

          def find(id)
            document = @connection[@collection.name].find_one(id)
            _deserialize(document).first
          end

          private

          def _serialize(entity)
            @collection.serialize(entity)
          end

          def _deserialize(*documents)
            @collection.deserialize(documents)
          end
        end
      end
    end
  end
end
