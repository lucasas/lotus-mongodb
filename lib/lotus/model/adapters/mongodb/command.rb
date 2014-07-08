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
        end
      end
    end
  end
end
