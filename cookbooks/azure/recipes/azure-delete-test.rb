require 'chef/provisioning/azure_driver'
with_driver 'azure'

# with_chef_server "https://chefserverp01.cloudapp.net/organizations/jet",
# with_chef_server "https://api.opscode.com/organizations/cloudeval_org",
#   :client_name => Chef::Config[:node_name],
#   :signing_key_filename => Chef::Config[:client_key]

machine_batch do
  1.upto(3) do |i|
    machine "jetdemo#{i}" do
      machine_options({
        :bootstrap_options => {
          :cloud_service_name => "jetdemo#{i}",
          :storage_account_name => "jetdemo#{i}",
          :vm_size => "Small",
          :vm_user => "chef",
          #:vm_name => 'rlupochefdemo2',
          :location => 'East US'
        },
        :image_id => 'a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-R2-201412.01-en.us-127GB.vhd',
        :password => "R34ll!fe"
      })
    end
  end
  action :destroy
end