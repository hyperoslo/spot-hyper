class GetIP

  attr_reader :request

  def initialize request
    @request = request
  end

  def remote_ip
    request.env["HTTP_X_FORWARDED_FOR"].try(:split, ',').try(:last) || request.env["REMOTE_ADDR"
  end

end
