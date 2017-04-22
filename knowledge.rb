def attribute(arg, &block)
  m_name = arg
  #self.method("#{arg.keys[0]}=", arg.values[0]) if arg.is_a? Hash
  m_name, val = arg.first if arg.is_a? Hash
  
  define_method "#{m_name}?" do
  	instance_variable_defined?("@#{m_name}".to_sym)
  end

  define_method "#{m_name}=" do |val|
  	instance_variable_set("@#{m_name}".to_sym, val)
  end

  define_method "#{m_name}" do
  	if instance_variables.include? "@#{m_name}".to_sym
  	  instance_variable_get "@#{m_name}"
  	else
  	  #val = arg.is_a?(Hash) ? arg.values[0] : val
  	  instance_variable_set("@#{m_name}", val)
  	end
  end
end
