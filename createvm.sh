#A script to create a vm in google cloud

gcloud -q compute instances create test --zone europe-west2-c

gcloud compute firewall-rules create "allow-port80" --allow tcp:80 --target-tags "port80"

gcloud compute instances add-tags test --tags "port80"

