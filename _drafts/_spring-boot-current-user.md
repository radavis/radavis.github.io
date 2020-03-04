# Spring Boot: Current User

How do we get the currently logged in user within Spring Boot?

## Via `SecurityContextHolder`

```java
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
String currentPrincipalName = authentication.getName();
```

[source](https://stackoverflow.com/a/31160173/2675670)


## Within a Controller

```java
@Controller
public class SecurityController {
 
    @RequestMapping(value = "/username", method = RequestMethod.GET)
    @ResponseBody
    public String currentUserName(Principal principal) {
        return principal.getName();
    }
}
```

[source](https://www.baeldung.com/get-user-in-spring-security)


## Via the HTTP Request

```java
@Controller
public class GetUserWithHTTPServletRequestController {
 
    @RequestMapping(value = "/username", method = RequestMethod.GET)
    @ResponseBody
    public String currentUserNameSimple(HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        return principal.getName();
    }
}
```

https://mkyong.com/spring-security/get-current-logged-in-username-in-spring-security/

https://stackoverflow.com/questions/37499307/whats-the-principal-in-spring-security
