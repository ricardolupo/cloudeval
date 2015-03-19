require 'chef/provisioning/azure_driver'
with_driver 'azure'
machine_options = {
  :bootstrap_options => {
    :cloud_service_name => 'rlupochefdemo02',
    :storage_account_name => 'rlupochefdemo02',
    :vm_size => "Small",
    #:vm_name => 'rlupochefdemo2',
    :location => 'East US'
   },
 # Until SSH keys are supported (soon)
   #:image_id => 'rlcoreimagep01-20150209-623909',
   :image_id => 'a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-R2-201412.01-en.us-127GB.vhd',
   :password => "xxxxxxx"
}

machine 'rlupochefdemo02' do
  machine_options machine_options
end
