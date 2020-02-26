# 타입스크립트 퀵스타트 챕터 5

## 연산자
타입스크립트는 자바스크립트와 동일한 산술 연산자를 지원한다 🙂

* 지원 목록
  * 사칙연산
  * 나머지 연산 (`%`)
  * 지수 연산자 (`**`)
    * ES7(ES2016) 에서 지원하는 연산자라고 함
    * Math.pow를 대체할 수 있음!
    * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Exponentiation
* 타입이 다른 피연산자 간의 더하기
  * 자바스크립트처럼, 문자열 결합(concatenation)으로 인식함
  * TS의 경우 이를 허용하지 않는 예외 상황이 있으니 주의!
    * `Number` + `Boolean`
    * `Boolean` + `Boolean`
* 산술 연산자 사용 시 주의점
  * 자바스크립트보다 엄격하게 타입을 체크하는 특성상, 자바스크립트에서 허용되던 것이 금지되는 경우가 있음
  * 예를 들어, String 타입의 숫자를 연산식에 사용할 수 없음
  ```typescript
  // The left-hand side of an arithmetic operation must be of type 'any', 'number', 'bigint' or an enum type.
  console.log("253" / 2);
  // The right-hand side of an arithmetic operation must be of type 'any', 'number', 'bigint' or an enum type.
  console.log(2 * "1234");
  ```

### 비교, 논리, 조건 연산자
* 비교 연산자
  |연산자 기호|연산 예|의미|
  |---------|--------|--------|
  |== |a == b| a와 b의 값이 같은지 비교|
  |===|a === b| a와 b의 값과 타입이 모두 같은지 비교|
  |!= |a != b| a와 b의 값이 다른지 비교|
  |!==|a !== b| a와 b의 값과 타입이 다른지 비교|
  |>  |a > b| a가 b보다 큰지 비교|
  |<  |a < b| a가 b보다 작은지 비교|
  |>= |a >= b| a가 b보다 크거나 같은지 비교|
  |<= |a <>= b| a가 b보다 작거나 같은지 비교|
  * 타입스크립트에서 비교 연산자 사용시 주의점
    * 피연산자 간에 타입이 다르면 연산을 허용하지 않음
      * 타입 안전성을 고려하기 때문🙂
    * `==` 보다는 `===`, `!=` 보다는 `!==` 권장
* 논리 연산자
  * `&&`, `||`, `!`
  * 논리 연산자의 경우 피연산자끼리 타입이 일치하지 않아도 됨
* 조건 연산자
  * `?:`
  * 피연산자 3개를 사용하는 삼항 연산자 (ternary operator)

### 불리언 타입
어떤 값에 대해 Boolean 메서드를 이용해 타입을 변환하려면?

``` typescript
Boolean(-1) // true
Boolean(1) // true
Boolean(0) // false
Boolean("abc") // true
```

> 0을 제외한 숫자나 문자열이 Boolean 타입으로 바뀔 때에도 true가 된다

### 부정 연산자
* 부정 연산자를 두번 사용할 수 있다 (`!!`)
  * 부정의 부정은 참이므로, 그대로 참이 된다
* 문자열에 부정 연산자를 사용하는 경우, false가 된다
  * 예를 들어 `"shua"`는 조건문에서 true이고, Boolean으로 변환했을 때에도 true임
    * 이런 경우 부정 연산자를 사용하면 false가 되는 것은 자명하다


## 디스트럭처링
타입스크립트는 ES6의 디스트럭처링 (destructuring)을 지원한다.

객체의 구조를 분해하여 할당이나 확장과 같은 연산을 수행할 수 있다.

자료형에 따라, `객체 디스트럭처링` / `배열 디스트럭처링`으로 나뉜다.

* 참고 자료
  * https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
  * https://poiemaweb.com/es6-destructuring
    * 디스트럭처링이 무엇인지 명확하게 알 수 있는 페이지

### 객체 디스트럭처링 (object destructuring)
* 객체 리터럴에서 변수명에 대응하는 속성값을 추출해 변수로 할당하는 데 유용함
  * 객체의 속성값을 변수에 할당하는 것 : destructuring assignment
  ```typescript
  let { id, username } = { id: "shua", username = "슈아" };

  console.log(id); // shua
  console.log(username); // 슈아
  ```
* 객체 디스트럭처링에서 가능한 작업
  * 할당 시 할당받을 속성이 없다면, 새 변수를 선언하고 초기화해놓을 수 있음
  ```typescript
  let { id, username = "슈아" } = { id: "shua" };

  console.log(id); // shua
  console.log(username); // 슈아
  ```
  * 할당하려는 객체 속성에 새로운 이름을 부여하고 싶으면 property renaming을 이용할 수 있음
  ```typescript
  let { id: newName1, username: newName2 = "슈아" } = { id: "shua" };

  console.log(newName1); // shua
  console.log(newName2); // 슈아
  ```
* 매개변수 선언
  * 메서드에 디스트럭처링 매개변수를 선언할 수 있으며, 기본값을 설정할 수도 있음
  ```typescript
  function printUserInfo({ id, username = "슈아" }) {
      console.log(id);
      console.log(username);
  }
  printUserInfo({ id: "shua" });
  ```
* type 키워드
  * type 키워드를 사용하여 매개변수의 타입을 선언하고, 객체 디스트럭처링을 수행할 수 있음
    * `type t { a: string, b?: number }`
    * 선택 연산자 (`?`)를 사용하여 '생략할 수 있는 매개변수'를 표현 가능
      * 위 예시의 경우 a는 생략 불가하며, b는 생략 가능

### 배열 디스트럭처링 (array destructuring)
* 배열 요소를 간결한 방법으로 변수에 할당할 수 있음
  * ES5였으면 아래와 같은 방식으로 할당했어야 할 것이다😂😂
  ```javascript
  var nums = [1, 2, 3];

  var num1 = nums[0]; 
  var num2 = nums[1];
  var num3 = nums[2];
  ```
  * 배열 디스트럭처링 예시
  ```typescript
  let nums = [1, 2, 3];

  let [num1, num2, num3] = nums;
  ```
* 심지어 중간 요소만 변수에 할당하는 것도 가능
  * `let [ , num2, ] = nums;`
* 변숫값을 서로 교환하는 것도 가능
  * `[nums3, nums2] = [nums2, nums3]`
  ```typescript
  let nums = [1, 2, 3];

  let [num1, num2, num3] = nums;
  [num3, num2] = [num2, num3];

  console.log(num1); // 1
  console.log(num2); // 3
  console.log(num3); // 2
  ```
* 객체 디스트럭처링이 그랬듯이, 배열 디스트럭처링도 기본값 지정 가능
  * `let [num1, num2, num3, num4 = 4] = nums`
* 매개변수 전달
  * 메서드에 배열을 전달할 때, 배열 요소를 디스트럭처링 매개변수로 전달할 수 있음
  * `function destructuringSample([arg1, arg2]: [number, string]) { ... }`
  ```typescript
  function destructuringSample([arg1, arg2]: [number, string]) { 
    console.log(arg1); // 1234
    console.log(arg2); // shua
  }

  destructuringSample([1234, "shua"]);
  ```

## 전개 연산자
타입스크립트는 ES6의 Spread Operator를 지원한다.

전개 연산자는 `...` 으로 표현하는데, 아래 세 가지 경우로 사용된다.  
-> 변수에 `...변수명` 형식으로 붙여서 씀
* 나머지 매개변수를 선언할 때
* 배열 요소를 확장할 때
* 객체 요소를 확장할 때

* 참고 자료
  * https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Spread_syntax
  * https://joshua1988.github.io/es6-online-book/spread-operator.html

### 배열 요소 확장
Array concatenation에 전개 연산자를 사용할 수 있다.
```typescript
let numbers = [40, 50];
let numbers2 = [10, 20, 30, ...numbers];

console.log(numbers2); // [ 10, 20, 30, 40, 50 ]
```
-> 꼭 끝에 붙여야 하는 것이 아니라, 위치를 조정할 수 있음 (맨앞도 가능하고~ 중간도 가능하고~)

디스트럭처링에서의 활용은 아래와 같다.

```typescript
let [id, ...nickname] = ["shua", "슈아", "joshua", "조슈아"];
console.log(id); // shua
console.log(nickname); // [ '슈아', 'joshua', '조슈아' ]
```

### 객체 요소 확장
배열 요소 확장과 동일하게 써먹을 수 있다.

```typescript
let shua = { id: "shua" };

let userInfo = { ...shua, nickname: "슈아" };

console.log(userInfo); // { id: 'shua', nickname: '슈아' }
```

## 느낀 점
책이 내가 원하는 깊이만큼 설명을 해주고 있다는 느낌을 받았다. 그리고 이 내용을 읽고 직접 정리하다보니 좀 더 기억에 잘 남는 것 같다.

특히 전개 연산자나 디스트럭처링에 대해 제대로 알 수 있어서 좋았음!