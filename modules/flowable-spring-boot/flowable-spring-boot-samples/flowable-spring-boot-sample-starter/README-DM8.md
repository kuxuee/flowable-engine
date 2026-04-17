# DM8 Template For The Starter Sample

This sample now includes a DM8 profile configuration in
`src/main/resources/application-dm8.properties`.

## 1. Add the DM8 JDBC driver

Add your DM8 JDBC jar to the sample application. If your environment does not expose the
driver from a Maven repository, install it into your local or private Maven repository first.

Example dependency:

```xml
<dependency>
    <groupId>com.dameng</groupId>
    <artifactId>DmJdbcDriver18</artifactId>
    <version>${dm.jdbc.version}</version>
</dependency>
```

## 2. Adjust the connection parameters

Edit `src/main/resources/application-dm8.properties` and update:

- `spring.datasource.url`
- `spring.datasource.username`
- `spring.datasource.password`
- `flowable.database-schema`

The default template assumes:

- host: `127.0.0.1`
- port: `5236`
- schema / user: `FLOWABLE`

## 3. Start the sample with the DM8 profile

```bash
mvn spring-boot:run -Dspring-boot.run.profiles=dm8
```

Or run the packaged application with:

```bash
java -jar target/flowable-spring-boot-sample-starter-*.jar --spring.profiles.active=dm8
```

## Notes

- Flowable now auto-detects `DM DBMS` and reuses its Oracle-compatible SQL path.
- If you are on an older DM JDBC driver, append `comOra=true` to the JDBC URL.
