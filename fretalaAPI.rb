require 'json'
require 'net/http'
require 'base64'

class FretalaAPI
  #FRETALA_SANDBOX_URL = 'sandbox.freta.la'
  FRETALA_SANDBOX_URL = '0.0.0.0'
  FRETALA_PRODUCTION_URL = 'api.freta.la'

  def initialize(environment, settings)
    throw 'environment must be sandbox or production' if not ['production', 'sandbox'].include? environment
    @environment = environment
    if @environment == 'production'
      @url = FRETALA_PRODUCTION_URL
    else
      @url = FRETALA_SANDBOX_URL
    end

    @clientId = settings['clientId']
    @clientSecret = settings['clientSecret']
    @username = settings['username']
    @password = settings['password']
    @token = ''
  end

  def authenticate()
    data = {
      'grant_type' => 'password',
      'username' => @username,
      'password' => @password
    };
    res = performRequest('POST', '/authenticate', data.to_json, true)
    @token = res['access_token']
    return @token
  end
  def getCards()
    authenticate()
    performRequest('GET', '/cards')
  end

  def insertCard(card)
    authenticate()
    performRequest('POST', '/cards', card.to_json)
  end

  def deleteCard(cardToken)
    authenticate()
    performRequest('DELETE', 'cards/'+cardToken)
  end

  def insertFrete(frete)
    authenticate()
    performRequest('POST', '/fretes', frete.to_json)
  end

  def cost(route)
    performRequest('POST', '/fretes/cost', route.to_json)
  end

  def buildHeaders(auth=false)
    headers = {
      'Content-Type' =>  'application/json'
    }
    if(auth)
      headers['Authorization'] = 'Basic ' + Base64.encode64(@clientId + ':' + @clientSecret)
    elsif(@token != '') 
      headers['Authorization'] = 'Bearer ' + @token
    end
    return headers;
  end

  def performRequest(type, path, data='', auth=false)
    #http = Net::HTTP.new(@url, 443)
    http = Net::HTTP.new(@url, 8080)
    #http.use_ssl = true
    headers = buildHeaders(auth)
    if type == 'POST'
      request = Net::HTTP::Post.new(path, headers)
      request.body = data
    elsif type == 'GET'
      request = Net::HTTP::Get.new(path, headers)
    elsif type == 'PUT' 
      request = Net::HTTP::Put.new(path, headers)
      request.body = data
    elsif type == 'DELETE'
      request = Net::HTTP::Delete.new(path, headers)
    else
      throw 'Request type ' + type + ' is not valid'
    end

    response = http.request(request)
    json = JSON.parse(response.body)
    if response.code != '200' && response.code != '204'
      if(auth)
        throw json['error_description']
      else
        throw json['message']
      end
    end
    @token = ''
    return json
  end

  private :buildHeaders, :performRequest

end
