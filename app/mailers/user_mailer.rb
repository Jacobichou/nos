class UserMailer < ActionMailer::Base
  default from: "potarts02@gmail.com"
  HIGHEST_HIER_LVL = 0
  URL_BASE = 'http://nos.nccf-online.org/'

  def email_notify(hierarchy_lvl, item, item_type) # first arg: lowest hierarchy level required to view or be notified of item activity
                                                  # second arg: accepts an object; e.g. passing a psf_item grants access to the psf's data;
                                                  # third arg: string for identifying mailer template to send

  	@item = item
  	@who = User.where(hierarchy: HIGHEST_HIER_LVL..hierarchy_lvl)
  	@login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s

  	# !DO! build link directly to submission
    case item_type
    when "psf"
      @who.each do |person|
        mail(to: person.email, subject: 'NOSSYM Notification')
      end
    when "psf-update"
      @who.each do |person|
        mail(to: person.email, 
              subject: 'NOSSYM Notification',
              template_name: 'psf_update')
      end
    end
  end

  def notify_approved(item) # only notifies user who submitted item
    @item = item
    @who = item.user.email
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s

    mail(to: @who, subject: '[NOSSYM Notification] Item Approval')
  end

  def notify_unapproved(item) # only notifies user who submitted item
    @item = item
    @who = item.user.email
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s

    mail(to: @who, subject: '[NOSSYM Notification] Item Unapproved')
  end

  def notify_discarded(item) # only notifies user who submitted item
    @item = item
    @who = item.user.email
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s

    mail(to: @who, subject: '[NOSSYM Notification] Item Discarded')
  end

  def send_checklist(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Checklist Details')
  end

  def send_checklist_facilities(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Facilities Checklist Details')
  end

  def send_checklist_comm(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Communications Checklist Details')
  end

  def send_checklist_finance(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Finance Checklist Details')
  end

  def send_checklist_worship(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Worship Checklist Details')
  end

  def send_checklist_hospitality(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Hospitality Checklist Details')
  end

  def send_checklist_decorations(item, person)
    @item = item
    # @specifics = @item
    # @specifics = ProjectSummaryForm.select('budget, revenue, objectives, facilities, comm, worship_council, day_staff, menu, greeters, ushers, decorations').where(id: @item.id)
    @who = person
    @login_url = URL_BASE + 'project_summary_forms/' + @item.id.to_s
    
    mail(to: @who, subject: '[NOSSYM Notification] Decorator Checklist Details')
  end
end # end file
