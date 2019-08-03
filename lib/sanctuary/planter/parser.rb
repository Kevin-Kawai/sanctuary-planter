require "sanctuary/planter/plant"

module Sanctuary
  module Planter
    module Parser
      def self.parse_plant_uml(path)
        classes = []
        File.open(path) do |file|
          reading = false
          lines_read = ""
          file.each do |line|
            if line.include?("TYPE")
              reading = true
            end
            if reading
              lines_read << line
            end
            if line.include?("}")
              reading = false
              classes << lines_read.split("\n")
              lines_read = ""
            end
          end
        end

        classes
      end

      def self.generate_plant_data_objects(classes_array)
        classes_array.map do |klass|
          fields = []
          methods = []
          plant_template = klass[0].split(":")[1].chomp
          name = klass[1].split("class")[1].split(" ")[0].chomp
          klass[2..(klass.length - 2)].each do |line|
            if line.include?("()")
              methods << line.strip
            else
              fields << line.strip
            end
          end

          Sanctuary::Planter::Plant.new(name, fields, methods, plant_template)
        end
      end
    end
  end
end