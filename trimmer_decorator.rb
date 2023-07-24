require_relative 'base_decorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    trimmed = @nameable.correct_name[0...10]
    trimmed.length == @nameable.correct_name.length ? trimmed : "#{trimmed}..."
  end
end
