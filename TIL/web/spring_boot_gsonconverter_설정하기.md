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

## 그렇게 생각했었으나... (4월 5일 추가)

Swagger와 log 관련 filter & interceptor 들을 적용하자마자 동작하지 않았다.

처음엔 내가 뭔가 잘못 설정했다고 판단하고 열심히 수정해보고 로그도 찍어보고, 중간에 request body를 누가 뺏어먹는거 아닌가 싶은 마음에 InputStream 읽어와서 출력도 해보고..

이걸로 야근하다가 포기하고 집 와서 디버그를 모든 스텝 일일히 들어가보고 돌린 결과, 원인을 찾았다.

몇몇 설정을 위해 WebMvcConfigurationSupport를 상속받아와서 작업한 WebMvcConfig 클래스가 있었고, 이걸로 인해 내가 세팅한 값이 먹통이 되었다.

AbstractMessageConverterMethodArgumentResolver 라는 클래스를 보면, 다음과 같은 코드가 있다.

```java
try {
    message = new EmptyBodyCheckingHttpInputMessage(inputMessage);

    for (HttpMessageConverter<?> converter : this.messageConverters) {
        Class<HttpMessageConverter<?>> converterType = (Class<HttpMessageConverter<?>>) converter.getClass();
        GenericHttpMessageConverter<?> genericConverter =
                (converter instanceof GenericHttpMessageConverter ? (GenericHttpMessageConverter<?>) converter : null);
        if (genericConverter != null ? genericConverter.canRead(targetType, contextClass, contentType) :
                (targetClass != null && converter.canRead(targetClass, contentType))) {
...생략...

    return body;
}
```
디버그 돌려가지고 여기에 있는 messageConverters 리스트를 확인해보니, 내가 설정한 GsonHttpMessageConverter가 들어가있지 않았다. ㅠㅠ

그래서 WebMvcConfigurationSupport에 있는 `configureMessageConverters(List<HttpMessageConverter<?>> converters)` 메서드를 오버라이드 해서 직접 넣어주면 해결이 될까 싶어서 시도한 결과 성공했다.

```java
@Configuration
public class asdf1234WebMvcConfig extends WebMvcConfigurationSupport {
    
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new GsonHttpMessageConverter());
        super.configureMessageConverters(converters);
    }
}
```

다시 디버그를 돌려보니 messageConverters 리스트에 Gson 컨버터가 들어간 것을 확인할 수 있었다.

다음에 이런 경우가 있으면 무작정 검색만 해보지 말고, 이번처럼 디버그를 꼼꼼하게 해보도록 노력해야겠다.
