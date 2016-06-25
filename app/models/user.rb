class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

	has_many :memberships
	has_many :groups, through: :memberships

	has_many :tasks

  has_many :invites, foreign_key: :invitee_id, class_name: "Invite"
  has_many :invites, foreign_key: :inviter_id, class_name: "Invite"

	has_many :assignments

	has_many :assignments_given, foreign_key: :assigner_id, class_name: 'Assignment'
	has_many :delegated_tasks, through: :assignments_given, source: :task

	has_many :assignments_received, foreign_key: :assignee_id, class_name: 'Assignment'
	has_many :assigned_tasks, through: :assignments_received, source: :task

	has_many :completions
	has_many :completed_tasks, through: :completions, source: :task

private

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.search_user(search)
      where("LOWER(email) LIKE LOWER(?)", "%#{search}%")
  end

end
