module UsersHelper
  def u_list(use, eve)
    table = ''
     eve.each do |event| 
      if use.id == event.creator_id.to_i
       table += render inline: '<tr>'
       table += render inline: "<td> #{event.description} </td>"      
       table += render inline: '</tr>'
      end
    end
      table.html_safe
  end
end
