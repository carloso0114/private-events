module EventsHelper
  def u_name
    name = ''
    @user.each do |use|
      if use.id == @event.creator_id.to_i
        name += render inline: "<p> #{use.username} </p>"
      end
    end
    name.html_safe
  end

  def attenders
    name = ''
    
      
        @event.attendees.each do |att|
            name += render inline: "<p>#{att.username}</p>"
        end

    name.html_safe
  end


end
