class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

	has_many :memberships
	has_many :groups, through: :memberships

	has_many :tasks

  has_many :invites_received, foreign_key: :invitee_id, class_name: "Invite"
  has_many :invites_given, foreign_key: :inviter_id, class_name: "Invite"

	has_many :assignments

	has_many :assignments_given, foreign_key: :assigner_id, class_name: 'Assignment'
	has_many :delegated_tasks, through: :assignments_given, source: :task

	has_many :assignments_received, foreign_key: :assignee_id, class_name: 'Assignment'
	has_many :assigned_tasks, through: :assignments_received, source: :task

	has_many :completions
	has_many :completed_tasks, through: :completions, source: :task

  has_many :messages

  has_many :messages_sent, foreign_key: :sender_id, class_name: "Message"
  has_many :messages_received, foreign_key: :receiver_id, class_name: "Message"

  validates :name, presence: true
  has_many :conversations, through: :messages


  def find_incomplete_tasks
    self.tasks.select do |task|
      task.completions.length == 0
    end
  end

    def high_priority
      self.incomplete_assigned_tasks.select do |task|
        task.priority == "3"
      end
    end

    def med_priority
      self.incomplete_assigned_tasks.select do |task|
        task.priority == "2"
      end
    end

    def low_priority
      self.incomplete_assigned_tasks.select do |task|
        task.priority == "1"
      end
    end

  def incomplete_assigned_tasks
    self.assigned_tasks.select do |task|
      task.completions.length == 0
    end
  end

  def initials
    self.name.split(' ').map{|name|name[0]}.join('')
  end

  def first_name
    self.name.split(' ')[0]
  end

  def last_name
    self.name.split(' ')[-1]
  end

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

  def list_conversations
    self.conversations
  end

end
