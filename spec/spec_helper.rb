require File.join(File.dirname(__FILE__), '..', 'lib', 'bom-weather')

class Hash
  def without(attribute)
    self.delete(attribute) unless self[attribute.to_sym].nil?
    return self
  end
end