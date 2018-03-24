## Spring Boot Gson Converter 설정하기

주말에 하도 시간이 남아서 업무하다 막힌걸 보는데, 해결하느라 한두시간 잡아먹었다.

spring boot에서는 HTTP Message converter로 Jackson을 사용하는데, 이걸 gson으로 바꿔서 쓰고 싶었던 것이다.
각종 레퍼런스나 사이트를 찾아가며 설정을 적용해봤지만 동작하지 않았고 하는 수 없이 Jackson을 써야하나...라는 생각까지 들었다 ㅠㅠ

물론 해결법은 아주 간단했다..

application.properties에 다음 한 줄을 추가해주면 된다.

```
spring.http.converters.preferred-json-mapper=gson
```

이거 하겠다고 사이트 찾아가면서 CustomConfig 만들고 customConverters 메서드 써주고 난리도 아니었는데, 역시 문서는 잘 찾아봐야한다.

참고한 곳은 http://springboot.tistory.com/2

[공식문서](https://docs.spring.io/spring-boot/docs/current/reference/html/common-application-properties.html)에서는 해당 설정값을 다음과 같이 설명하고 있다.

```
# HTTP message conversion
spring.http.converters.preferred-json-mapper= # Preferred JSON mapper to use for HTTP message conversion. By default, auto-detected according to the environment.

Google 번역기 돌린결과
HTTP 메시지 변환에 사용할 기본 JSON 매퍼입니다. 기본적으로 환경에 따라 자동 감지됩니다.
```
