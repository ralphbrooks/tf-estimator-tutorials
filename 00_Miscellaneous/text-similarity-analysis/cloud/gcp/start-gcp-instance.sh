gcloud beta compute --project=rab-bigquery instances create instance-1 --zone=us-central1-c --machine-type=n1-highmem-2 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=898555433680-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=ubuntu-1804-bionic-v20200108 --image-project=ubuntu-os-cloud --boot-disk-size=50GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1 --reservation-affinity=any

gcloud compute --project=rab-bigquery firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

gcloud compute --project=rab-bigquery firewall-rules create default-allow-https --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server
# basic SSH command
gcloud beta compute --project "rab-bigquery" ssh --zone "us-central1-c" "instance-1"

# SSH Tunnel

gcloud compute ssh "businesstaxgnes-6" --project "semanticsearch-262908" --zone "us-central1-a" -- -L 8000:localhost:8888
jupyter lab --allow-root --port=8888