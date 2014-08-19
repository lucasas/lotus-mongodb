module Lotus
  module Model
    module Adapters
      module Mongodb
        class Command
          def initialize(collection)
            @collection = collection
          end

          def create(entity)
            @collection.insert(entity)
          end

          def find(id)
            @collection.find(id)
          end
        end
      end
    end
  end
end
