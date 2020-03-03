# 타입스크립트 퀵스타트 챕터 7 (작성중)

## 클래스와 인터페이스

### 타입스크립트에서의 OOP

자바스크립트의 경우 ES6으로 올라오면서 OOP 요소에 대한 지원을 어느 정도 해주기 시작했지만, 타 언어에 비해 여러모로 부족한 점이 있다.  
클래스에 대해서는 지원하지만, 인터페이스 개념이 없다던가 접근 제한자를 지원하지 않는다던가...

타입스크립트의 경우 그런 부족한 점을 커버할 수 있는 요소들을 아래와 같이 지원하고 있다.

* 인터페이스
  * 인터페이스 키워드로 `interface`를 사용하며, 인터페이스 구현은 `implements` 사용
* 접근 제한자
  * `private`, `public`, `protected`
* final 제한자
  * 타입스크립트 2.0부터 `readonly` 라는 키워드로 제공

### 클래스 선언과 객체 생성

* 클래스 선언
  * 클래스명 앞에 class 붙여서 선언
    ```typescript
    class Shua {
        name: string;
        age: number;

        constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
        }

        getName(): string {
            return this.name;
        }
    }
    ```

* 객체 생성
  * new 키워드 사용
  ```typescript
  let shuaInstance = new Shua("shua", 0);
  ```