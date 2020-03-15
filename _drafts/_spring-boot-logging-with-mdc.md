# Spring Boot Logging with Mapped Diagnostic Context (MDC)

**Problem**: Our logs are simply streams of text. How do we know which log
entries came from the same client?

## Mapped Diagnostic Context (MDC)

Logging frameworks use MDC (a map, e.g.- keys & values) to add **context** to
the entries within our logs.


## Adding MDC via a (Servlet) Filter

```java
package com.springbootdev.examples.slf4j.mdc.springbootslf4jmdcsupport.filter;

import org.slf4j.MDC;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import java.io.IOException;

@Component
public class MdcLogEnhancerFilter implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException
    {
        MDC.put("userId", "www.SpringBootDev.com");
        MDC.put("src", request.getRemoteHost());
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
```

```
# application.properties
logging.pattern.level = %X{userId}%5p
```

## Adding MDC via a implementation of the `HandlerInterceptorAdapter` interface

A `HandlerInterceptor` executes either before or after a controller handles
a request.

```java
public class ServiceInterceptor extends HandlerInterceptorAdapter {

    private final static Logger LOGGER = Logger.getLogger(ServiceInterceptor.class);   

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        MDC.put("userId", request.getHeader("UserId"));
        MDC.put("sessionId ", request.getHeader("SessionId"));
        MDC.put("requestId", request.getHeader("RequestId"));
    }
}
```

pattern: `%X{userId} %X{sessionId} %X{requestId} - %m%n`


## My Stab @ it

```java

package mil.af.bespin.briceapi.config.security;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.slf4j.MDC;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class PrincipalHandlerInterceptor extends HandlerInterceptorAdapter {
    private final Logger logger = LoggerFactory.getLogger(PrincipalHandlerInterceptor.class);

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        logger.error("got here");
        Principal principal = request.getUserPrincipal();
        MDC.put("name", principal.getName());
        MDC.put("ip", request.getRemoteAddr());
    }
}

```

## Using MDCInsertingServletFilter

```java
@Bean
public MDCInsertingServletFilter mdcInsertingServletFilter() {
    return new MDCInsertingServletFilter();
}
```

## Another One

```java
@Component
public class RequestFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            // Setup MDC data:
            String mdcData = String.format(“[userId:%s | requestId:%s] “, user(), requestId());
            MDC.put(“mdcData”, mdcData); //Variable ‘mdcData’ is referenced in Spring Boot’s logging.pattern.level property
            chain.doFilter(request, response);
        } finally {
            // Tear down MDC data:
            // ( Important! Cleans up the ThreadLocal data again )
            MDC.clear();
        }
    }
}
```

pattern layout: `%X{req.remoteHost} %X{req.requestURI}%n%d - %m%n`

pattern layout: `%X{req.*}%n%d - %m%n`

[source](http://jelinden.blogspot.com/2015/05/spring-boot-and-logging-with-logback.html)

## Resources

* [Enhance Application Logging with MDC (springbootdev.com)](https://springbootdev.com/2018/02/05/spring-boot-slf4j-enhance-the-application-logging-with-slf4j-mapped-diagnostic-context-mdc/)
* [MDC: A Better Way of Logging (dzone)](https://dzone.com/articles/mdc-better-way-of-logging-1)
* [Slf4j MDC servlet filter (closed issue on spring-boot repo)](https://github.com/spring-projects/spring-boot/issues/7927)
* [Spring Boot: Servlet Filter (tutorialspoint)](https://www.tutorialspoint.com/spring_boot/spring_boot_servlet_filter.htm)
* [LOGBack: MDC: MDCInsertingServletFilter](http://logback.qos.ch/manual/mdc.html#mis)
* [Examples](https://github.com/search?q=in%3Afile+language%3Ajava+springframework+Filter+MDC&type=Code)

https://medium.com/@moelholm/spring-boot-enhance-your-logging-fa7d2c49f489
http://logback.qos.ch/xref/chapters/mdc/UserServletFilter.html
