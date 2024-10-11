servers=[
    {
        :hostname => "ans-server",
        :cpu => 2,
        :ram => 2048,
        :script => "sh /vagrant/scripts/ans-server.sh"
    },
    {
        :hostname => "db-server",
        :cpu => 2,
        :ram => 2048,
        :script => "sh /vagrant/scripts/db-server.sh"
    },
    {
        :hostname => "web-server",
        :cpu => 2,
        :ram => 2048,
        :script => "sh /vagrant/scripts/web-server.sh"
    },
]

Vagrant.configure(2) do |config|
    servers.each do |machine|

        config.vm.define machine[:hostname] do |node|
            node.vm.box = "ubuntu/xenial64"
            node.vm.hostname = machine[:hostname]

            node.vm.provider "virtualbox" do |vb|
                vb.name = machine[:hostname]
                file_logs = File.join(Dir.pwd, "logs/ubuntu-xenial-16.04-cloudimg-console.log")
                vb.customize ["modifyvm", :id, "--memory", machine[:ram], "--cpus", machine[:cpu]]
                vb.customize ["modifyvm", :id, "--nic2", "hostonly", "--hostonlyadapter2", "VirtualBox Host-Only Ethernet Adapter"]
                vb.customize ["modifyvm", :id, "--uartmode1", "file", file_logs]
            end
            node.vm.provision "shell", inline: machine[:script], privileged: true, run: "once"
            node.trigger.after :up do |trigger|
                trigger.info = "Copying SSH keys to folder keys"
                trigger.run = {inline: "bash scripts/copy-key.sh #{machine[:hostname]}"}
            end
            node.trigger.after :destroy do |trigger|
                trigger.info = "Remove SSH keys from folder keys"
                trigger.run = {inline: "bash scripts/delete-key.sh #{machine[:hostname]}"}
            end
        end
        config.vm.synced_folder "shared", "/vagrant", disabled: false
        
    end
end