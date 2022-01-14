class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def attributes_defined(attributes_array = [])
    attributes_array.all? { |attribute| !attribute.nil? }
  end
end
