## JPA Pagination 할 때 ORA-00933 에러 나는 경우

Spring Boot에 JPA 써보려고 간단하게 샘플 코드를 짜봤는데 문제가 생겼다.

단건 조회나 리스트 조회는 금방 성공했는데, 페이지네이션을 시도해봤더니 오라클 에러가 발생했다. ㅠㅠ

```java
@GetMapping("/lists")
public Page<Store> lists(Pageable pageable) {
    return storeSearchDao.findAll(pageable);
}
```

컨트롤러를 이렇게 작성하고 해보니까 Hibernate 로그도 쿼리를 잘 만들어 준 것 같은데.. 이런 에러가 자꾸 발생하는 것이었다.

`ORA-00933 SQL 명령어가 올바르게 종료되지 않았습니다`

조금 찾아보니 Dialect 문제였고, application.properties에 다음과 같은 설정을 추가했더니 해결되었다.

```java
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.Oracle10gDialect
```

그런데 해결하고나니 한 가지 의문점이 생겼다. 회사에서 사용하는 오라클 버전은 11g인데, 10g용 Dialect를 사용해도 되는 것인가?

인텔리제이에서 hibernate-core.jar에 들어있는 org.hibernate.dialect 패키지를 보니 오라클 관련해서는 다음과 같은 Dialect 클래스들이 들어있었다.

* OracleDialect
* Oracle8iDialect
* Oracle9Dialect
* Oracle9iDialect
* Oracle10gDialect
* Oracle12cDialect

11g 용이 없었다.

검색을 조금 해본 결과 스택오버플로우에서 외국형들이 다음과 같이 써주셨다.

> Dialect of Oracle 11g is same as Oracle 10g (org.hibernate.dialect.Oracle10gDialect).

즉 11g에서 사용해야 하는 경우 10g용을 쓰면 되는 것이다.

* 원본 링크 : https://stackoverflow.com/questions/4369944/hibernate-dialect-for-oracle-database-11g
