class Object
  def self.const_missing(const)
    require "controllers/#{const.to_s.underscore}"
    Object.const_get const
  end
end