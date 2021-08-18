## Summary

- The objective of the project is to create a unified api testing suite for all Ryanair services, that is modular, easy to extend and trivial for the end user to operate.  
- The project is based on Karate DSL.  
- It will be integrated with Cucumber Studio projects repository and reporting services.  


## Prerequisite

1. JDK 8 (JAVA_HOME variable is set in path)
2. Apache maven:
    - Download the latest version from [Maven](https://maven.apache.org/download.cgi)
    - Extract to /opt/
    - Edit __.bash_profile__ inside user directory
    - Add 'export PATH=/opt/apache-maven-3.8.1/bin:$PATH' (replace 3.8.1 with downloaded maven version)


## Execution

### Booking services
Inside project directories (booking and user details)) run testing suites

- api test suite: `mvn clean test -Denv=Dev -PapiTests`
