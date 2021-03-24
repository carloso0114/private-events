module UsersHelper
  def u_list(use, eve)
    table = ''
    eve.each do |event|
      next unless use.id == event.creator_id.to_i

      table += render inline: '<tr>'
      table += render inline: "<td>#{event.description} </td>"
      table += render inline: '</tr>'
    end
    table.html_safe
  end

  def attending
    name = ''

    @user.attended_events.each do |att|
      if att.date > @time
        name += render inline: "<p>#{att.description}</p>"
        name += render inline: "<p>#{att.date}</p>"
      end
    end
    name.html_safe
  end

  def attending_past
    name = ''
    @user.attended_events.each do |att|
      if att.date < @time
        name += render inline: "<p>#{att.description}</p>"
        name += render inline: "<p>#{att.date}</p>"
      end
    end
    name.html_safe
  end
end
