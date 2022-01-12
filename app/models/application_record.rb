class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  # def set_defaults(attr_value_hash = {})
  #   puts "hello from set_defaults :"
  #   puts self
  #   attr_value_hash.each do |key, value|
  #     instance_variable_set("@#{key}".to_sym, value)
  #   end
  # end

  private

  def attributes_defined(attributes_array = [])
    attributes_array.all? { |attribute| !attribute.nil? }
  end
end
