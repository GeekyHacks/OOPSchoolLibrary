require 'json'

module PreserveData
  @@serializer = JSON

  def serialize
    obj = {}
    instance_variables.each do |var|
      obj[var] = instance_variable_get(var)
    end
    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end

  def save_to_json_file(filename)
    data = self.serialize
    File.open(filename, 'w') { |file| file.write(data) }
  end

  def load_from_json_file(filename)
    return unless File.exist?(filename)

    content = File.read(filename)
    self.unserialize(content)
  end
end
