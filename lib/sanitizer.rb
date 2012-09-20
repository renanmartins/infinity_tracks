class Sanitizer
  def self.sanitize string
    string.gsub(/[^a-zA-Z0-9_ ]+/, "")
  end
end