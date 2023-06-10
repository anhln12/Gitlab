# GitLab - Restore Backup

**Step 1** − First, login to your GitLab server using SSH (Secure Shell).

**Step 2** − Before restoring the backup copy, first make sure backup copy is in the /var/opt/gitlab/backups directory.
```
sudo cp 1685512847_2023_05_31_14.1.1_gitlab_backup.tar /var/opt/gitlab/backups/
sudo chown git:git /var/opt/gitlab/backups/1685512847_2023_05_31_14.1.1_gitlab_backup.tar
```

**Step 3** − You can check the backup copy by using the ls -l command which is described in the Create Backup job chapter.

**Step 4** − Now, stop the processes which are related to the database by using the below commands:

```
sudo gitlab-ctl stop unicorn
sudo gitlab-ctl stop sidekiq
```
![image](https://github.com/anhln12/gitlab/assets/18412583/ceadb7cd-ba7a-411f-b608-448cfeaefe04)


**Step 5** − You can verify status of the GitLab services by using the below command

```
sudo gitlab-ctl status
```

**Step 6** − Now, restore the backup by using the timestamp of the backup copy

```
sudo gitlab-rake gitlab:backup:restore BACKUP = 1685512847_2023_05_31_14.1.1
```
![image](https://github.com/anhln12/gitlab/assets/18412583/be121c00-a807-4af1-9204-ba4c612f4672)


**Step 7** − Restart the GitLab components by using the below command

```sudo gitlab-ctl restart```

**Step 8** − Now check the GitLab by sanitizing the database as shown below
```sudo gitlab-rake gitlab:check SANITIZE = true```

error:

yum remove gitlab-ce

yum install gitlab-ce-14.1.1-ce.0.el7.x86_64

gitlab-ctl reconfigure

[Gitlab-ce]/[RHEL7][reconfigure]Get stuck on first reconfigure

systemctl restart gitlab-runsvdir.service
