require 'pathname'
require 'yaml'
require 'json_spec/cucumber'

def last_json
  @json
end

class Env

  def load_file
    config = YAML.load_file(File.join(File.dirname(__FILE__), 'env.yml'))
  end

  def self.user_password
    config = load_file
    @user = config['user']['user']
    @password = config['user']['password']
    @user_and_password= "#{@user}:#{@password}"
  end

  def self.exchanges
    config = load_file
    default(config)
    @port_ex = config['Exchanges-services']['port']
    @root_ex ="#{@host}:#{@port_ex}#{@extension}#{@version}"
  end

  def self.room
    config = load_file
    default(config)
    @port = config['Room-Manager']['port']
    @root ="#{@host}:#{@port}#{@extension}#{@version}"
  end

  def self.load_file
    config = YAML.load_file(File.join(File.dirname(__FILE__), 'env.yml'))
  end

  def self.default(config)
    @extension = config['general_data']['extension']
    @version = config['general_data']['version']
    @host = config['general_data']['host']
  end

  # Author: Pablo Ramirez
  def self.host_port_db
    config = load_file
    @host_db = config['Data-Base']['host']
    @port_db = config['Data-Base']['port']
    @host_port_es = "#{@host_db}:#{@port_db}"

  end

  # Author: Pablo Ramirez
  def self.data_base_es
    config = load_file
    @db = config['Data-Base']['database_es']
  end

  # Author: Pablo Ramirez
  def self.data_base_rm
    config = load_file
    @db_rm = config['Data-Base']['database_rm']
  end

  # Author: Pablo Ramirez
  def self.host_subscriptions
    config = load_file
    @host_subs = config['Subscriptions']['host']
  end

  # Author: Pablo Ramirez
  def self.port_subscriptions
    config = load_file
    @port_subs = config['Subscriptions']['host']
  end

  # Author: Pablo Ramirez
  def self.body_subscriptions
    config = load_file
    default(config)
    @host_subs = config['Subscriptions']['host']
    @port_subs = config['Room-Manager']['port']
    @not_subs = config['Subscriptions']['notifications']
    @not_url = "#{@extension}#{@version}#{@not_subs}"
    @body = {host: @host_subs, port: @port_subs, notificationUrl: @not_url}
  end

  # Author: Pablo Ramirez
  def self.key_header_es
    config = load_file
    @header = config['Subscriptions']['Exchange-Calendar']
    # Author: Pablo Ramirez
  end

  # Author: Pablo Ramirez
  def self.value_header_es
    config = load_file
    @user = config['user']['user']
  end

  # Author: Pablo Ramirez
  def self.key_header_rm
    config = load_file
    @header = config['Room-Manager']['Credentials']
  end

  # Author: Pablo Ramirez
  def self.endpoint_subscriptions
    config = load_file
    @endpoint = config['Subscriptions']['endpoint']
  end

  # Author: Pablo Ramirez
  def self.hostname
    config = load_file
    @server = config['general_data']['server']
    @domain = config['general_data']['domain']
    @host = "#{@server}.#{@domain}"
  end

  # Author: Pablo Ramirez
  def self.body_services
    config = load_file
    @user = config['user']['user']
    @pass = config['user']['password']
    @body = {hostname: Env.hostname, username: @user, password: @pass}
  end

  # Author: Pablo Ramirez
  def self.timer
    config = load_file
    @sleep = config['Sleep']['time']
  end
end




