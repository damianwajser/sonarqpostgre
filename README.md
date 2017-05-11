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
clonar el proyecto y dentro del mismo: </br>
docker-compose build </br>
docker-compose up -d </br></br>
## ahora en el proyecto que se quiera analizar:
mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent install -Dmaven.test.failure.ignore=true -DskipTests=false sonar:sonar
</br>
Entrar a http://localhost:9000

## opcion con plugin en pom
En el pom.xml:
```xml
<build>
		<plugins>
			 <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                
                <configuration>
                    <skip>${maven.test.skip}</skip>
                    <output>file</output>
                    <append>true</append>
                </configuration>
                <executions>
                    <execution>
                        <id>jacoco-initialize</id>
                        <goals>
                            <goal>prepare-agent</goal>
                        </goals>
                    </execution>
                    <execution>
                        <id>jacoco-site</id>
                        <phase>verify</phase>
                        <goals>
                            <goal>report</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
	    </plugins>
	    </build>
```
Correr mvn clean install sonar:sonar
