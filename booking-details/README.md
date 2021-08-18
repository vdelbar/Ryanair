## Summary

- The objective of the project is to have the greatest possible coverage of simulated test scenarios and available to be consumed by third parties.
- Validation and calls are based on the Swagger contract defined by the Tech team


## Prerequisite

1. JDK 8 (JAVA_HOME variable is set in path)
2. Apache maven: 
    - Download the latest version from [Maven](https://maven.apache.org/download.cgi)
    - Extract to /opt/
    - Edit __.bash_profile__ inside user directory 
    - Add 'export PATH=/opt/apache-maven-3.8.1/bin:$PATH' (replace 3.8.1 with downloaded maven version)

## Execution

Inside  project directory runs testing suites

- api test suite: `mvn clean test -Denv=Dev -PapiTests`




