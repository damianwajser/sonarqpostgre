# sonarqpostgre
Docker Image with sonar and postgre db </br>
en el settings.xml:
```xml
<profiles>
	<profile>
			<id>sonar</id>
			<activation>
				<activeByDefault>true</activeByDefault>
			</activation>
			<properties>
				<!-- Optional URL to server. Default value is http://localhost:9000 -->
				<sonar.host.url>http://localhost:9000</sonar.host.url>
			</properties>
		</profile>
		<profile>
			<id>downloadSources</id>
			<properties>
				<downloadSources>true</downloadSources>
				<downloadJavadocs>true</downloadJavadocs>
			</properties>
		</profile>
	</profiles>
	<!-- activeProfiles
   | List of profiles that are active for all builds.
   |-->
	<activeProfiles>
		<activeProfile>sonar</activeProfile>
		<activeProfile>downloadSources</activeProfile>
	</activeProfiles>
  ```
## to build run
docker-compose build </br>
docker-compose up -d </br>
mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent install -Dmaven.test.failure.ignore=true -DskipTests=false sonar:sonar
