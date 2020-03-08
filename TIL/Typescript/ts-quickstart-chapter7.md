# 타입스크립트 퀵스타트 챕터 7 (작성중)
- [타입스크립트 퀵스타트 챕터 7 (작성중)](#%ed%83%80%ec%9e%85%ec%8a%a4%ed%81%ac%eb%a6%bd%ed%8a%b8-%ed%80%b5%ec%8a%a4%ed%83%80%ed%8a%b8-%ec%b1%95%ed%84%b0-7-%ec%9e%91%ec%84%b1%ec%a4%91)
  - [클래스와 인터페이스](#%ed%81%b4%eb%9e%98%ec%8a%a4%ec%99%80-%ec%9d%b8%ed%84%b0%ed%8e%98%ec%9d%b4%ec%8a%a4)
    - [타입스크립트에서의 OOP](#%ed%83%80%ec%9e%85%ec%8a%a4%ed%81%ac%eb%a6%bd%ed%8a%b8%ec%97%90%ec%84%9c%ec%9d%98-oop)
    - [클래스 선언과 객체 생성](#%ed%81%b4%eb%9e%98%ec%8a%a4-%ec%84%a0%ec%96%b8%ea%b3%bc-%ea%b0%9d%ec%b2%b4-%ec%83%9d%ec%84%b1)
    - [상속 관계와 포함 관계](#%ec%83%81%ec%86%8d-%ea%b4%80%ea%b3%84%ec%99%80-%ed%8f%ac%ed%95%a8-%ea%b4%80%ea%b3%84)
      - [합성 관계](#%ed%95%a9%ec%84%b1-%ea%b4%80%ea%b3%84)
      - [집합 관계](#%ec%a7%91%ed%95%a9-%ea%b4%80%ea%b3%84)
      - [접근 제한자 (access modifier)](#%ec%a0%91%ea%b7%bc-%ec%a0%9c%ed%95%9c%ec%9e%90-access-modifier)
      - [부모 클래스의 멤버를 이용하기 (super, this 키워드)](#%eb%b6%80%eb%aa%a8-%ed%81%b4%eb%9e%98%ec%8a%a4%ec%9d%98-%eb%a9%a4%eb%b2%84%eb%a5%bc-%ec%9d%b4%ec%9a%a9%ed%95%98%ea%b8%b0-super-this-%ed%82%a4%ec%9b%8c%eb%93%9c)
      - [기본 접근 제한자](#%ea%b8%b0%eb%b3%b8-%ec%a0%91%ea%b7%bc-%ec%a0%9c%ed%95%9c%ec%9e%90)
    - [추상 클래스 (abstract class)](#%ec%b6%94%ec%83%81-%ed%81%b4%eb%9e%98%ec%8a%a4-abstract-class)

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

### 상속 관계와 포함 관계

* 상속 관계
  * is-a 관계
  * 타입스크립트는 extends 키워드로 상속을 지원하며, 단일 상속만 지원함
  * 자식 클래스에서 부모 클래스의 생성자를 호출하려면 `super()` 메서드 사용
    * 사용하지 않는 경우 TS2377 오류 발생하므로, 자식 클래스 생성자에서 꼭 사용해 주어야함
```typescript
class Main {
  constructor() {
    console.log("main");
  }
}

class Sub extends Main {
  constructor() {
    super();
    console.log("sub");
  }
}
```

* 포함 관계
  * has-a 관계
  * 클래스가 다른 클래스를 포함하는 관계이며, `합성 관계`와 `집합 관계`로 나뉨

#### 합성 관계
전체가 부분을 포함하며, 강한 관계이다.
```typescript
class Room {

}

class House {
    private room;
    constructor() {
        this.room = new Room();
    }
}
let house = new House();
console.log(house); // House { room: Room {} }
house = null;
console.log(house); // null
```
위 코드의 경우 House 클래스 내부에 Room 클래스를 갖고 있으며, 수명주기를 함께 한다는 특징이 있다.

House 객체가 생성될 때 내부에 있는 Room 객체도 하나 생성되며, House 객체가 null이 되면 가지고 있던 Room 객체 역시 null이 된다.

#### 집합 관계
합성 관계와는 달리 약한 관계이다.
```typescript
class Room {

}

class House {
    private room: Room;
    constructor(room: Room) {
        this.room = room;
    }
}
let room = new Room();
let house = new House(room);
console.log(house); // House { room: Room {} }
house = null;
console.log(room); // Room {}
```
위 코드의 경우 외부에서 생성된 Room 객체를 전달하고 있기 때문에, 추후에 House 객체가 null이 되더라도 Room 객체는 그대로 남아있게 된다. (수명주기를 함께하지 않음)

#### 접근 제한자 (access modifier)

ES6에서는 지원하지 않는 접근 제한자도 타입스크립트에서는 매우 잘 지원한다.

타입스크립트에서 사용 가능한 접근 제한자는 아래와 같이 3개가 있다.

* public
  * 상속이 가능하며, 객체를 통한 외부 접근이 가능
* protected
  * 객체를 통한 외부 접근은 불가하나 상속은 가능함 (자식 클래스에서 접근 가능)
* private
  * 상속 불가 및 외부 접근 불가

#### 부모 클래스의 멤버를 이용하기 (super, this 키워드)
* super 키워드
  * 부모 클래스의 공개 멤버에 접근할 때 사용
    * 부모 클래스의 멤버 변수를 직접 호출해서 가져올 수는 없으니 주의
* this 키워드
  * 부모 클래스에서 상속 받은 멤버와, 현재 클래스의 멤버에 접근할 때 사용

#### 기본 접근 제한자
접근 제한자 선언을 생략한 경우, default access modifier가 적용된다.

* 적용될 수 있는 대상
  * 클래스 멤버 변수
  * 멤버 메서드
  * 클래스 get/set 프로퍼티
  * 생성자의 매개변수

기본 접근 제한자는 대체로 public이지만, 생성자 매개변수에 접근 제한자가 생략되면 생성자 내부에서만 접근할 수 있게 되는 특징이 있다.

(접근 제한자나 readonly가 붙는 경우 매개변수 속성이 되어, 멤버 변수가 됨)

### 추상 클래스 (abstract class)
추상 클래스는 구현 메서드와 추상 메서드를 동시에 가질 수 있는 클래스다.

구현 메서드는 실제 구현을 포함한 메서드이고, 추상 메서드는 구현 내용이 없이 선언만 되어있는 메서드이다.

```typescript
abstract class Sample {
  abstract sampleMethod(); // 추상 메서드
  abstract sampleVariable: String; // 추상 멤버변수
  public implementationMethod(): void {
    console.log('abstract class test');
    this.sampleMethod();
  }
}
```

추상 클래스를 상속 받는 경우, 자식 클래스에서 추상 메서드를 반드시 구현해줘야하며 추상 멤버 변수의 경우에도 자식 클래스에서 선언해줘야 한다.

-> 자식 클래스도 추상 클래스인 경우에는 부모 추상 클래스의 메서드를 구현하지 않아도 된다. (물론 그 자식 추상 클래스를 상속 받는 일반 클래스는 넘겨 받은 추상 클래스의 메서드를 다 구현해야함)  
이런 케이스의 경우 부모 추상 클래스가 가지고 있던 추상 메서드 + 추상 멤버 변수에 자식 추상 클래스의 추상 메서드를 곁들일 수 있으며, 그 예시는 아래와 같다.

```typescript
abstract class Sample {
    abstract sampleMethod(); // 추상 메서드
    abstract sampleVariable: String; // 추상 멤버변수
    public implementationMethod(): void {
        console.log('abstract class test');
        this.sampleMethod();
    }
}

abstract class Sample2 extends Sample {
    abstract sampleMethod2();
}

class Sample3 extends Sample2 {
    sampleMethod2() {
        console.log("sample method2");
    }

    sampleMethod() {
        console.log("sample method");
    }
    sampleVariable: String;
}

let sample3 = new Sample3();

sample3.implementationMethod();
sample3.sampleMethod();
sample3.sampleMethod2();
```

출력
```
abstract class test
sample method
sample method
sample method2
```

유의 사항이 있다면 abstract 키워드는 static이나 private과 함께 선언할 수 없다는 것이다.

