module ApplicationHelper
  def edit_and_destroy_buttons(item)
    unless current_user.nil?
      edit = link_to('Edit', url_for([:edit, item]), class:"btn btn-primary omanappi")
      del = link_to('Destroy', item, method: :delete,
                    data: {confirm: 'Are you sure?' }, class:"btn btn-danger omanappi")
      raw("#{edit} #{del}")
    end
  end

  def round(param)
    number_with_precision(param, precision: 1)
  end

end
