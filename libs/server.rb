require './libs/handler'

# proxy = Ritm::Proxy::Launcher.new(ca_crt_path: 'insecure_ca.crt',
#                                   ca_key_path: 'insecure_ca.key')

# $proxy = Ritm::Proxy::Launcher.new

def proxy_start
  $proxy = Ritm::Proxy::Launcher.new
  $proxy.start
end

def proxy_stop
  $proxy.shutdown
end