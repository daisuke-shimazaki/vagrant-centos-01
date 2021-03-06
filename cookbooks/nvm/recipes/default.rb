#
# Cookbook Name:: nvm
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/usr/local/nvm" do                                            
    repository "git://github.com/creationix/nvm.git"
    notifies :run, "bash[nvm.sh]"                                 
  end
 
  bash "nvm.sh" do                                                     
    code <<-EOH
      . /usr/local/nvm/nvm.sh                                      
      nvm install v0.10.1                                               
    EOH
    action :nothing                                                        
  end
 
  template "/etc/profile.d/nvm.sh" do                      
    source "nvm.sh.erb"
    mode 00644
  end
