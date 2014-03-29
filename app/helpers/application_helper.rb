module ApplicationHelper
  def link_to_back(url=:back)
    link_to '<i class="glyphicon glyphicon-circle-arrow-left"></i><span>Back</span>'.html_safe, url, class: "btn btn-default"
  end

  def link_to_home()
    link_to '<i class="glyphicon glyphicon-home"></i><span>Home</span>'.html_safe, '/', class: "btn btn-default"
  end

  def link_to_download(software)
    link_to '<i class="glyphicon glyphicon-download"></i><span>Download</span>'.html_safe, download_software_path(software), class: "btn btn-success"
  end

  def link_to_request_access(software)
    if current_user.requests.where(software_id: software.id).count > 0
      link_to '<i class="glyphicon glyphicon-time"></i><span>Waiting</span>'.html_safe, '', class: "btn btn-default"
    else
      link_to '<i class="glyphicon glyphicon-lock"></i><span>Request</span>'.html_safe, new_software_request_path(software), class: "btn btn-warning"
    end
  end

  def link_to_edit(object)
    link_to '<i class="glyphicon glyphicon-pencil"></i><span>Edit</span>'.html_safe, object, class: "btn btn-default"
  end

  def link_to_licenses(software)
    link_to '<i class="glyphicon glyphicon-book"></i><span>Licenses</span>'.html_safe, software_licenses_path(software), class: "btn btn-default"
  end

  def alert_warning(message)
    ('<div class="alert alert-warning">
      <i class="glyphicon glyphicon-exclamation-sign"></i><span>'+message+'</span>
    </div>').html_safe
  end
end
