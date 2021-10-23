puppet agent -t 
puppetserver ca list --all
puppet module install puppetlabs/apache 
puppet apply -e 'include apache'

puppet config print 
puppet config print config 

puppet config print manifest --section master --environment production 

puppet apply /etc/puppertlabs/code/environments/production/manifests/site.pp

puppet agent -t 

# to create additional env
mkdir /etc/puppertlabs/code/environments/dev/manifests/...

puppet config set environment dev --section=agent 


# in the agent
puppet config print runinterval 
expr 1800 / 60

puppet agent -t 


puppet describe service 
puppet resource service chronyd 
# must be running state 
cat  $(puppet config print config)

norify { hello: 
    message => "hello 1" },


puppet resource --types 

puppet describe package 
puppet resource service chronyd 
puppet resource package chronyd 

puppet module list 
puppet module install puppetlabs/stdlib
# installing in a share folder makes it avaiable to all environments 
puppet module install -i /etc/puppetlabs/code/modules puppetlabs/stdlib


craete a custom module 
vim chrony/manifests/init.pp
class chrony {
    package {
        'chrony': ensure => 'installed',
    },
    service { 'chrony':
        ensure  => 'running',
        enable  => true,
        require => Package['chrony']
    }
}


puppet module search apache 


yum install puppet-bolt

bolt command run whoami -t 127.0.0.1 -u root -p Password1 --no-host-key-check 



