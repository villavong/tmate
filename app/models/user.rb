class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  has_attached_file :profile_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_img, content_type: /\Aimage\/.*\z/


  acts_as_messageable

  def mailboxer_name
    self.username
  end

  def mailboxer_email(object)

    self.email

      # or whatever address the email is to be sent to
  end

end
