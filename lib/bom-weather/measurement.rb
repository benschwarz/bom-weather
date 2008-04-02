module BOMWeather
  class Measurement
    attr_accessor :name, :value, :unit, :unit_abbreviation, :type_code
    
    def initialize(params={})
      @name, @value, @unit, @unit_abbreviation, @type_code = params[:name], params[:value], params[:unit], params[:unit_abbreviation], params[:type_code]
    end
    
    include Validatable
    validates_presence_of :name, :value, :unit, :unit_abbreviation, :type_code
  end
end