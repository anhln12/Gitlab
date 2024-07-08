# Install gitlab ubuntu

https://packages.gitlab.com/gitlab/gitlab-ee
```
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee=14.9.1-ee.0
```

Please configure a URL for your Gitlab  instance by setting 'external_url'
configuration in /etc/gitlab/gitlab.rb file.
Then, you can start your GitLab instance by running the following command:
     sudo gitlab-ctl reconfigure

nano /etc/gitlab/gitlab.rb file
external_url 'http://gitlab.example.com'

cat /etc/gitlab/initial_root_password
