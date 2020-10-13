class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.google_oauth2_data"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def authenticatable_salt
  #   "#{super}#{session_token}"
  # end

  # def invalidate_all_sessions!
  #   self.session_token = SecureRandom.hex
  # end

end
