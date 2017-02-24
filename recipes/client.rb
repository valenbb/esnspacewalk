# Register server to Spacewalk
bash 'spacewalk_registration' do
  user 'root'
  code <<-EOH
    rpm -Uvh http://yum.spacewalkproject.org/2.6-client/RHEL/7/x86_64/spacewalk-client-repo-2.6-0.el7.noarch.rpm
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum -y install rhn-client-tools rhn-check rhn-setup rhnsd m2crypto yum-rhn-plugin
    rpm -Uvh http://atsspacewalk.crd.ge.com/pub/rhn-org-trusted-ssl-cert-1.0-1.noarch.rpm
    rpm --import http://atsspacewalk.crd.ge.com/pub/RPM-GPG-KEY-CentOS-7
    rpm --import http://atsspacewalk.crd.ge.com/pub/RPM-GPG-KEY-EPEL-7
    rpm --import http://atsspacewalk.crd.ge.com/pub/RPM-GPG-KEY-GRC-Spacewalk
    rpm --import http://atsspacewalk.crd.ge.com/pub/RPM-GPG-KEY-nux.ro
    rpm --import http://atsspacewalk.crd.ge.com/pub/RPM-GPG-KEY-redhat-release
    rhnreg_ks --serverUrl=http://paladin.myxingfu.net/XMLRPC --activationkey=1-centos-el7
    mv /etc/yum/pluginconf.d/rhnplugin.conf /tmp
    mv /etc/yum.repos.d /etc/yum.repos.d.prespace
    EOH
    flags "-x"
end

