module Sanctuary
  module Planter
    class Plant
      attr_accessor :name, :fields, :methods, :plant_template
      def initialize(name, fields, methods, plant_template)
        @name = name
        @fields = fields
        @methods = methods
        @plant_template = plant_template
      end
    end
  end
end