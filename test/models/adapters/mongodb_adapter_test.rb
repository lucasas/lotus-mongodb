require "test_helper"

describe Lotus::Model::Adapters::MongodbAdapter do
  before do
    DummyUser = Struct.new(:id, :name, :age) do
      include Lotus::Entity
    end
  end

  let(:mapper) do
    Lotus::Model::Mapper.new do
      collection :users do
        entity DummyUser

        attribute :id, String
        attribute :name, String
        attribute :age, Integer
      end
    end.load!
  end

  let(:collection) { :users }

  let(:adapter) do
    Lotus::Model::Adapters::MongodbAdapter.new(
      mapper, host: MONGODB_HOST, database: MONGODB_DATABASE
    )
  end

  describe "#create" do
    let(:entity) { DummyUser.new name: "Lucas Souza", age: 29 }

    it "stores the record" do
      adapter.create(collection, entity)
      adapter.find(collection, entity.id).must_equal entity
    end
  end
end
