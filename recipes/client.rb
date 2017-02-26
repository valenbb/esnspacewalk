# Register server to Spacewalk
bash 'spacewalk_registration' do
  user 'root'
  code <<-EOH
    rpm -Uvh http://yum.spacewalkproject.org/2.6-client/RHEL/7/x86_64/spacewalk-client-repo-2.6-0.el7.noarch.rpm
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum -y install rhn-client-tools rhn-check rhn-setup rhnsd m2crypto yum-rhn-plugin
    rpm -Uvh http://paladin.myxingfu.net/pub/rhn-org-trusted-ssl-cert-1.0-1.noarch.rpm
    rhnreg_ks --serverUrl=http://paladin.myxingfu.net/XMLRPC --activationkey=1-centos-el7
    cp /etc/yum/pluginconf.d/rhnplugin.conf /tmp
    mv /etc/yum.repos.d /etc/yum.repos.d.prespace
    EOH
  flags "-x"
end

