require "pry"
require "sanctuary"
require "sanctuary/planter/parser"
require "sanctuary/planter/generator"

module Sanctuary
  module Planter
    class CLI
      def self.start
        if ARGV.include?("-i")
          classes_array = Sanctuary::Planter::Parser.parse_plant_uml(ARGV[1])
          plant_array = Sanctuary::Planter::Parser.generate_plant_data_objects(classes_array)
          plant_array.each do |plant|
            Sanctuary::Planter::Generator.generate_file_from_plant(plant)
          end
        else
          system("vim", "tmp.puml")
          classes_array = Sanctuary::Planter::Parser.parse_plant_uml("./tmp.puml")
          plant_array = Sanctuary::Planter::Parser.generate_plant_data_objects(classes_array)
          plant_array.each do |plant|
            Sanctuary::Planter::Generator.generate_file_from_plant(plant)
          end
          File.delete("./tmp.puml") if File.exists? ("./tmp.puml")
        end
      end
    end
  end
end