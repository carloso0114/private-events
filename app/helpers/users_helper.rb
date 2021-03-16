module UsersHelper
  def u_list(use, eve)
    table = ''
     eve.each do |event| 
      if use.id == event.user_id
       table += render inline: '<tr>'
       table += render inline: "<td><%= #{event.user_id} %></td>"
       table += render inline: "<td> #{event.description} </td>"
       table += render inline: '</tr>'
      end
    end
      table.html_safe
  end
end
