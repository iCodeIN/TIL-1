## 반복주기 3 

*   편의상 H2라는 데이터베이스를 사용하는데, pom.xml에 dependency 추가해주는 것만으로 설치가 가능하다. oracle / mysql / postgresql 등이 초기에 설치 및 세팅하는데 시간이 들어가는걸 생각하면, 이쪽이 훨씬 편하긴 하다..

    *   좀 더 찾아본 결과 성능 면에서도 크게 뒤지지 않는다고 한다.

* 템플릿은 https://github.com/slipp/web-application-server 이용

* http://localhost:8080/h2-console

* spring-boot-jpa starter도 설치해준다. jpa를 사용하면 데이터베이스를 다루기가 얼마나 쉬워지는지 알 수 있다.

* 이번에도 유용한 STS(이클립스) 단축키를 배웠다. Ctrl + Alt + ↓ (블록 지정한 텍스트를 하단에 Paste 해줌)

* 데이터 관리하는 클래스는 domain 패키지에 보관

* 데이터베이스와 매핑하는 어노테이션을 추가. @Entity (javax.persistence.Entity)

* 고유 식별을 위한 primary key (@Id)

* h2 jdbc 세팅

    ```
    spring.datasource.url=jdbc:h2:mem:AZ;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
    spring.datasource.driverClassName=org.h2.Driver
    spring.datasource.username=sa
    spring.datasource.password=
    spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
    ```

* jpa를 사용할 때 repository용 interface를 만들고, 컨트롤러에서는 @Autowired를 이용하여 repository를 주입한다.

    *   참고용 링크 : http://expert0226.tistory.com/195 (Autowired에 대한 설명)

* 데이터를 넣을 때는 repository.save(obj) / 모델에 데이터를 담아보낼 때는 repository.findAll()

* 중복을 제거하는 것은 중요한 일이다.

    *   GetMapping / PostMapping에 똑같이 users라고 쓰지말고 RequestMapping 사용하자.
    *   mustache를 활용해서 반복되는 템플릿을 include 해오는 식으로 분리할 수 있다.
        *   `{{> /include/navigation}}` 

*   static에 있던 view를 템플릿으로 옮기면서 컨트롤러를 직접 구현하는 실습을 했다. 어떤식으로 URL 매핑을 하는지 감을 잡을 수 있었다.

*   이 시점부터 여러가지 자신감이 붙어서 프로젝트를 두개로 분리했다. 개인 프로젝트를 이거 기반으로 조금 변경해서 진행하는 프로젝트와, 이 실습 내용을 그대로 반복하는 반복주기용 프로젝트.