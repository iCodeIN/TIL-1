## Maven Dependency 설정 시 주의할 점 (Scope)

책 실습해보다가 H2 DB를 사용할 일이 있어서 다음과 같이 등록했는데, 막상 코드를 실행시켜보니 클래스를 찾을 수 없다는 예외가 떴다.
```
<!-- https://mvnrepository.com/artifact/com.h2database/h2 -->
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <version>1.4.196</version>
    <scope>test</scope>
</dependency>
```

찾아보니, 다음과 같은 내용을 확인할 수 있었다.

> test : 일반적인 어플리케이션 사용에 대해서는 의존관계가 필요없고, 테스트 컴파일과 실행 시점에만 사용됨.
>
>출처: http://homo-ware.tistory.com/43

[이 링크](https://stackoverflow.com/questions/4008011/java-classnotfoundexception-for-org-h2-driver) 에서도, test scope를 빼라는 답변이 있었고, scope를 제거한 뒤에 다시 확인해보니 잘 동작했다.

mvnrepository.com 에서 그대로 복사해와서 붙여넣고 확인을 안하는 버릇이 있었는데, 앞으로는 붙여넣더라도 scope를 한 번 확인해보는 습관을 들여야겠다.