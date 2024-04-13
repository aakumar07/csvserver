# The csvserver assignment


Problem 1
1  Run the container image infracloudio/csvserver:latest in background and check if it's running. 
2  If it's failing then try to find the reason, once you find the reason, move to the next step. 
3  Write a bash script gencsv.sh to generate a file named inputFile whose content looks like: 
0, 234
1.	These are comma separated values with index and a random number. 
o	Running the script with two arguments as ./gencsv.sh 2 8, should generate the file inputFile with 7 such entries in current directory. Where the index of first entry is 2 and the last entry is 8.
2.	Run the container again in the background with file generated in (3) available inside the container (remember the reason you found in (2)).
3.	Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.
4.	Same as (4), run the container and make sure, 
o	The application is accessible on the host at http://localhost:9393
o	Set the environment variable CSVSERVER_BORDER to have value Orange.
The application should be accessible at http://localhost:9393, it should have the 7 entries from inputFile and the welcome note should have an orange color border.
Solution:
Step1: Write script for generating the random number using using given range like start & end values.

 
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/3279b970-5e37-496d-9a12-d84bd597f63c)

 ![image](https://github.com/aakumar07/csvserver/assets/126548776/7ce2c153-faa6-43b7-9da3-aff3287ce85d)



 Stpe 2: Create docker image (infracloudio/csvserver:latest )using docker hub using command like
 
![image](https://github.com/aakumar07/csvserver/assets/126548776/08854c47-2da4-4a4c-b70e-34115ee01049)

docker pull infracloudio/csvserver:latest
Step 3: Create a docker container respective image
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/c9a78724-24cd-429a-8ba4-cbf3629aad10)

Step 4: Check The docker container port 
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/646d4e72-94ac-4480-88b1-c7bf879bb89b)
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/c5e94a7b-0b2f-415f-b759-01bcc7f954c8)


 
Docker ps 
Docker ps -a
Dokcer inspect docker container id
![image](https://github.com/aakumar07/csvserver/assets/126548776/9b3eb82c-05e2-443a-aacb-315c2bd3e08d)

 
Step 5: Create the container as given port and mount the volume as well and assigned the environment variable’s.
docker run -d --name csvserver -v /home/ec2-user/inputFile.csv:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver

 ![image](https://github.com/aakumar07/csvserver/assets/126548776/23f2907e-ddb4-4875-bb6b-3e2e25995a2a)

 ![image](https://github.com/aakumar07/csvserver/assets/126548776/1a69ff88-1cfa-4f0a-8a1a-7547d69b655a)


 

Problem 2
1.	Delete any containers running from the last part.
2.	Create a docker-compose.yaml file for the setup from part I.
3.	Use an environment variable file named csvserver.env in docker-compose.yaml to pass environment variables used in part I.
4.	One should be able to run the application with docker-compose up.

Solution:
   Step 1: Create the csvserver.env and pass the variable’s init
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/ec9790e5-f30f-4fd6-80aa-472496426af0)

Step 2: Install the docker compose 
 
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/dd7acc9c-371c-40ea-abf1-067eb2d50d01)

 ![image](https://github.com/aakumar07/csvserver/assets/126548776/2b8b0b22-4acc-46c7-b2b6-21387609539f)


Step 3: Create the docker-compose.yml
 
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/e7bab11c-48c8-42c6-a840-257887a97d88)
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/4e9e70f8-86a7-4442-bed6-b859f3125e85)
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/007ad977-8ca9-40e1-bd60-8531f7011a5b)



 
Problem 3
1.	Delete any containers running from the last part.
2.	Add Prometheus container (prom/prometheus:v2.45.2) to the docker-compose.yaml form part II.
3.	Configure Prometheus to collect data from our application at <application>:<port>/metrics endpoint. (Where the <port> is the port from I.5)
4.	Make sure that Prometheus is accessible at http://localhost:9090 on the host.
5.	Type csvserver_records in the query box of Prometheus. Click on Execute and then switch to the Graph tab.
The Prometheus instance should be accessible at http://localhost:9090, and it should show a straight line graph with value 7 (consider shrinking the time range to 5m).
Solution:
 Step 1: Create the Prometheus container  using image as (prom/prometheus:v2.45.2)
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/edef0184-1445-473a-838b-fbab9d807fb9)
![image](https://github.com/aakumar07/csvserver/assets/126548776/7c259fd8-de3a-4fbe-bca7-9547e568de3f)


 
Step 2: set configuration Prometheus container in /etc/Prometheus/Prometheus.yml
 
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/2f5c98e4-3a8c-44c8-9fd6-db077a73164a)
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/0d3bbcd0-a766-4266-b22f-bf73a39b7ab9)


Step 3: Crete the docker-compose file
 
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/83234258-9505-43ad-8f2d-88c824f76297)
 ![image](https://github.com/aakumar07/csvserver/assets/126548776/d275170c-b032-4202-bd85-a0369c8ec290)


Stpe 4: access the csvserver_records
   
   ![image](https://github.com/aakumar07/csvserver/assets/126548776/bf34bee4-34dc-497b-a247-3f6fadbc4be0)
   ![image](https://github.com/aakumar07/csvserver/assets/126548776/713c587d-5ece-4bd0-8041-cd23ff67ba4c)
   ![image](https://github.com/aakumar07/csvserver/assets/126548776/6fb59c28-156e-467e-82d9-31711d2531f4)
   ![image](https://github.com/aakumar07/csvserver/assets/126548776/9b582e08-0835-422d-9e84-b8bacc8dee31)









