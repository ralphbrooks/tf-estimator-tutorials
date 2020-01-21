export BUCKET=gs://rab-bigquery-bucket




#curl -O https://archive.ics.uci.edu/ml/machine-learning-databases/reuters21578-mld/reuters21578.tar.gz
#mkdir temp reuters
#tar -zxvf reuters21578.tar.gz -C temp/
#mv temp/*.sgm reuters/ && rm -rf temp
#gsutil -m cp -R reuters $BUCKET

# Is this all occuring within cloudshell?
git clone https://github.com/ralphbrooks/tf-estimator-tutorials.git
git config --global user.email "ralph_brooks@yahoo.com"
git config --global user.name "Ralph Brooks"



# ----------------- INSTALL CONDA

cd ~
sudo apt-get update
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
~/miniconda/bin/conda init bash
# Bashrc is sourced so that I don't have to reboot
source ~/.bashrc
rm -f Miniconda3-latest-Linux-x86_64.sh



cd ~/tf-estimator-tutorials/00_Miscellaneous/text-similarity-analysis/etl

# I am doing an install based on Python3 code
$HOME/miniconda/bin/pip install tensorflow==2.1.0
$HOME/miniconda/bin/pip install tensorflow-hub==0.7.0
$HOME/miniconda/bin/pip install tensorflow-transform==0.21.0
$HOME/miniconda/bin/pip install bs4==0.0.1
$HOME/miniconda/bin/pip install nltk==3.4.5


# Verification of google cloud storage

cd ~
mkdir dataflow
touch dataflow/file1
gsutil cp -r dataflow gs://rab-bigquery-bucket

cd tf-estimator-tutorials/00_Miscellaneous/text-similarity-analysis/etl
chmod +x run_pipeline.sh
./run_pipeline.sh