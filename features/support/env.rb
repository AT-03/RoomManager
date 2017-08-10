require 'pathname'
require 'yaml'
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
#
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
end




