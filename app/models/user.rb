class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_summary_forms

  	def feed
	  	@LOWEST_HIERARCHY_LVL = 4
	  	if hierarchy > -1
	  		ProjectSummaryForm.where(hierarchy_lvl: hierarchy..@LOWEST_HIERARCHY_LVL)
	  	else
	  		ProjectSummaryForm.where(hierarchy_lvl: hierarchy)
		end
	end
end
