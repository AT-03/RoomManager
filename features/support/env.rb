require 'pathname'
require 'yaml'

def find_config_file(filename)
  root = Pathname.pwd
  until root.root?
    root.find do |path|
      return path.to_s if path.file? && path.basename.to_s.equal?(filename)
    end
    root = root.parent
  end
  raise 'Configuration file '
end

def load_app_config_file(filename)
  config_file = find_config_file(filename)
  config = YAML.load_file(config_file)
  @app_context = config['app']['rootPath']
  config
end

def afte_config(config)
  # read config file
  config = load_app_config_file('env.yml')
  # Load application config parameters
  @app_user = config['app']['admin_user']
  @app_pass = config['app']['admin_pass']
  @app_host = config['app']['host']
  @app_port = config['app']['port']
  @app_root = config['app']['rootPath']
end
