class GlobalSetting < ActiveRecord::Base
  enum setting_type: [:string, :number, :boolean]
  validates :name, uniqueness: true

  def self.[](name)
    self.find_by_name(name.to_s)
  end
end
