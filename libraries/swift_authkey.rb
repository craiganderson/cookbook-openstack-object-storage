module Swiftauthkey
  def get_swift_authkey()
    # determine authkey to use
    if node['openstack']['object-storage']['swift_secret_databag_name'].nil?
      node['openstack']['object-storage']['authkey']
    else
      swift_secrets = Chef::EncryptedDataBagItem.load 'secrets', node['openstack']['object-storage']['swift_secret_databag_name']
      swift_secrets['swift_authkey']
    end
  end
end
