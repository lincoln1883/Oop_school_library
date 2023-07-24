class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has no implemented method #{__method__} "
  end
end
