class ApiVersion


  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  def matches?(request)
    result = check_headers(request.headers) || default
    # puts " ************************************ marcher says is is #{result}"
    result
  end

  private

  def check_headers(headers)

    # check version from Accept headers; expect custom media type 'todos'
    accept = headers[:accept]
    # puts " ******************************* accepr #{accept} "
    accept && accept.include?("application/vnd.todos.#{version}+json")

  end

end