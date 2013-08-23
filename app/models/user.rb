class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# HIERARCHY RANKS
# 0 = Super Admin
# 1 = Admin
# 2 = Supervisor
# 3 = Employee
# 4 = Member


  has_many :project_summary_forms

  	def feed(user_id)
	  	@LOWEST_HIERARCHY_LVL = 4
	  	@user_id = user_id
	  	if hierarchy > -1
	  		ProjectSummaryForm.where(hierarchy_lvl: hierarchy..@LOWEST_HIERARCHY_LVL)
	  	else
	  		ProjectSummaryForm.where(hierarchy_lvl: hierarchy)
		end
		@submitted_psf = ProjectSummaryForm.where(user_id: @user_id)
	end
end
