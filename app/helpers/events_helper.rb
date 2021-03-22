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
    @user.each do |use|
      @attendances.each do |at|
        if use.id == at.user_id.to_i
          name += render inline: "<p> #{use.username} </p>"
        end
      end
    end
    name.html_safe
  end

end
