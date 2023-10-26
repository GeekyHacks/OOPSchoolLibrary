require 'json'

# mixin
module PreserveData
  @serializer = JSON

  def self.serializer
    @serializer
  end

  def serialize
    obj = {}
    instance_variables.each do |var|
      obj[var] = instance_variable_get(var)
    end

    self.class.serializer.dump(obj)
  end

  def unserialize(string)
    obj = self.class.serializer.parse(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end
end
