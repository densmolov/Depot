class User < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  has_secure_password

  after_destroy :ensure_the_admin_remains

  private
  def ensure_the_admin_remains
    if User.count.zero?
      raise "Last user cannot be removed!"
    end
  end

end
