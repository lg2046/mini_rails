require_relative "connect_adapter"

module MiniRails
  class Model
    @@connect_adapter = PostgresAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def self.find(id)
      self.new @@connect_adapter.find(table_name, id)
    end

    def self.all
      @@connect_adapter.find_all(table_name).map {|hash| self.new hash}
    end

    def self.table_name
      name + "s"
    end
    
    def method_missing(method, *args, &blk)
      if @attributes.keys.include? method.to_s
        @attributes[method.to_s]
      else
        super
      end
    end
  end
end