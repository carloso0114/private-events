module UsersHelper
  def u_list(use, eve)
    table = ''
     eve.each do |event|
      if use.id == event.creator_id.to_i
       table += render inline: '<tr>'
       table += render inline: "<td>#{event.description} </td>"
       table += render inline: '</tr>'
      end
    end
      table.html_safe
  end

  def attending
    name = ''
        @user.attended_events.each do |att|
            name += render inline: "<p>#{att.description}</p>"
        end
    name.html_safe
  end

end
