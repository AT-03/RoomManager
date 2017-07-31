require 'pathname'
require 'yaml'

def find_config_file(filename)
  root = Pathname.pwd
  while not root.root?
    root.find do |path|
      if path.file? && path.basename.to_s.equal?  (filename)
        return path.to_s
      end
    end
    root = root.parent
  end
  raise 'Configuration file'
end

def load_app_config_file(filename)
  config_file = find_config_file(filename)
  config = YAML.load_file(config_file)
  @app_context = config['app']['rootPath']
  config
end

def afterconfiguration(config)
  # read config file
  config = load_app_config_file('env.yml')
  # Load application config parameters
  @app_user = config['app']['admin_user']
  @app_pass = config['app']['admin_pass']
  @app_host = config['app']['host']
  @app_port = config['app']['port']
  @app_root = config['app']['rootPath']
  @app_exchange = config['app']['Exchange-Credentials']
  @app_credentials = config['app']['Credentials']
end
