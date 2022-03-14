class Namable
  def initialize(name = 'Unknown')
    @name = name
  end

  # Implement a method called correct_name that will raise a NotImplementedError
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
