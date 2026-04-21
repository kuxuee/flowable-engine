Flowable
========

[![Maven Central](https://img.shields.io/maven-central/v/org.flowable/flowable-engine?label=Maven%20Central)](https://central.sonatype.com/search?q=g:org.flowable%20%26%26%20%28a:flowable-engine%20a:flowable-cmmn-engine%20a:flowable-dmn-engine%29)
[![Docker](https://shields.io/docker/pulls/flowable/flowable-rest)](https://hub.docker.com/r/flowable/flowable-rest)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/flowable/flowable-engine/blob/main/LICENSE)

![Flowable Actions CI](https://github.com/flowable/flowable-engine/actions/workflows/main.yml/badge.svg?branch=main)

Homepage: https://www.flowable.org/

## flowable / flowəb(ə)l /
* a compact and highly efficient workflow and Business Process Management (BPM) platform for developers, system admins and business users.
* a lightning fast, tried and tested BPMN process engine, CMMN case engine and DMN rule engine written in Java.  It is Apache 2.0 licensed open source, with a committed community.
* can run embedded in a Java application, or as a service on a server, a cluster, and in the cloud.  It integrates perfectly with Spring.  With a rich Java and REST API, it is the ideal engine for orchestrating human or system activities.

## Introduction

### License

Flowable is distributed under the Apache V2 license (http://www.apache.org/licenses/LICENSE-2.0.html).

### Download

The Flowable downloads can be found on https://www.flowable.org/downloads.html.

### Sources

The distribution contains most of the sources as jar files. The source code of Flowable can be found on https://github.com/flowable/flowable-engine.

### JDK 17+

Flowable V7 runs on a Java higher than or equal to version 17. Use the JDK packaged with your Linux distribution or go to [adoptium.net](https://adoptium.net/) and click on the *Latest LTS Release* button. There are installation instructions on that page as well. To verify that your installation was successful, run `java -version` on the command line. That should print the installed version of your JDK.

[Flowable V6](https://github.com/flowable/flowable-engine/tree/flowable6.x) is still maintained and supports Java 8+.

### DM8 Local Build

This repository includes a helper script for building the customized Flowable artifacts with DM8 support and installing them into the local Maven repository.

Run the script from the project root:

```bat
build-dm8-local.bat
```

By default it will:

1. Set the project version to `8.1.0-dm8-SNAPSHOT`
2. Run `clean install -DskipTests`

This is equivalent to:

```bat
.\mvnw versions:set -DnewVersion=8.1.0-dm8-SNAPSHOT -DgenerateBackupPoms=false
.\mvnw clean install -DskipTests
```

You can also provide a custom version:

```bat
build-dm8-local.bat 8.1.0-company-dm1
```

After the script finishes, the customized Flowable artifacts will be available in the local Maven repository and can be referenced from another project using the same version number.

### Using The Customized Artifacts In Another Project

After running the local build script, reference the customized Flowable version from your main project.

Example Maven dependencies:

```xml
<properties>
    <flowable.version>8.1.0-dm8-SNAPSHOT</flowable.version>
    <dm.jdbc.version>8.1.1.193</dm.jdbc.version>
</properties>

<dependencies>
    <dependency>
        <groupId>org.flowable</groupId>
        <artifactId>flowable-spring-boot-starter-process</artifactId>
        <version>${flowable.version}</version>
    </dependency>

    <dependency>
        <groupId>com.dameng</groupId>
        <artifactId>DmJdbcDriver18</artifactId>
        <version>${dm.jdbc.version}</version>
    </dependency>
</dependencies>
```

Example Spring Boot configuration:

```yaml
spring:
  datasource:
    driver-class-name: dm.jdbc.driver.DmDriver
    url: jdbc:dm://127.0.0.1:5236?schema=FLOWABLE
    username: FLOWABLE
    password: your-password

flowable:
  database-schema-update: true
  database-schema: FLOWABLE
```

If you are using an older DM JDBC driver, append `comOra=true` to the JDBC URL.

### Flowable Design

Flowable offers a free to use Flowable Cloud Design application, which you can use to model CMMN, BPMN, DMN and other model types. You can register via the Flowable account registration page to get started https://www.flowable.com/account/open-source.

### Contributing

Contributing to Flowable: https://github.com/flowable/flowable-engine/wiki.

### Reporting problems

Every self-respecting developer should have read this link on how to ask smart questions: http://www.catb.org/~esr/faqs/smart-questions.html.

After you've done that you can post questions and comments on https://forum.flowable.org and create issues in https://github.com/flowable/flowable-engine/issues.
