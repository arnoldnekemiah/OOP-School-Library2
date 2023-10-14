class Corrector
  def correct_name(name)
    corrected_name = name.capitalize
    corrected_name = corrected_name[0...10] if corrected_name.length > 10
    corrected_name
  end
end
