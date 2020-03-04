[source](https://www.baeldung.com/spring-http-logging)

```java
@Configuration
public class RequestLoggingFilterConfig {
 
    @Bean
    public CommonsRequestLoggingFilter logFilter() {
        CommonsRequestLoggingFilter filter
          = new CommonsRequestLoggingFilter();
        filter.setIncludeQueryString(true);
        filter.setIncludePayload(true);
        filter.setMaxPayloadLength(10000);
        filter.setIncludeHeaders(false);
        filter.setAfterMessagePrefix("REQUEST DATA : ");
        return filter;
    }
}
```

```xml
<!-- logback.xml -->
<logger name="org.springframework.web.filter.CommonsRequestLoggingFilter">
    <level value="DEBUG" />
</logger>
```

Or...


```no-highlight
# application.properties
logging.level.org.springframework.web.filter.CommonsRequestLoggingFilter=
  DEBUG
```
