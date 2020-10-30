### ElasticFlow Docker-Compose Extended to include Nginx Proxy Authentication.


###### Installation Instructions (Tested: Ubuntu 20.04.1 LTS Server)
--------------------------------------------------
 

##### 1. Downloading files 

 Download files with Git Clone 

##### 2. Install Required Packages 
```
 sudo apt install -y openjdk-8-jdk apache2-utils

```

--------------------------------------------------

##### 3. First build filesystem

```
sudo mkdir /var/lib/elastiflow_es

sudo chown -R 1000:1000 /var/lib/elastiflow_es
```

--------------------------------------------------


##### 4. Create User and password


``` 
sudo htpasswd -c ./nginx/conf.d/htpasswd <username>
```

`Default User (Username:Password) = test : test`


(You can delete default user in ./nginx/conf.d/htpasswd)


--------------------------------------------------


##### 5. Run

```
 docker-compose up -d
```

```
After some seconds go to `http://<server_ip>:5601`
```

```
If still seeing 502 Bad Gateway please wait for at least 3 minutes 
(Kibana may take long to start)
```

--------------------------------------------------
 
## Contact
**Pasiphae R&D Lab**

Website: [Pasiphae Lab](https://www.pasiphae.eu) **|** Email: info@pasiphae.eu

Developer: Nikolaos Astyrakakis
