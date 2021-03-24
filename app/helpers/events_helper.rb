module EventsHelper
  def u_name
    name = ''
    @user.each do |use|
      if use.id == @event.creator_id.to_i
        name += render inline: "<%= link_to '#{use.username}', user_path('#{use.id}') %> <br>"
      end
    end
    name.html_safe
  end

  def attenders
    name = ''
    @event.attendees.each do |att|
      name += render inline: "<%= link_to '#{att.username}', user_path('#{att.id}') %> <br>"
    end
    name.html_safe
  end

  def attending_for_event
    name = ''

    @events.each do |att|
      if att.date > @time
        name += render inline: "<p>#{att.description}</p>"
        name += render inline: "<p>#{att.date}</p>"
      end
    end
    name.html_safe
  end

  def attending_past_event
    name = ''

    @events.each do |att|
      if att.date < @time
        name += render inline: "<p>#{att.description}</p>"
        name += render inline: "<p>#{att.date}</p>"
      end
    end
    name.html_safe
  end
end
