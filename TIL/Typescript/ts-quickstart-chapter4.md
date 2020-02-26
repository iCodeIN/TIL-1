# 타입스크립트 퀵스타트 챕터 4

## 조건문
ts에서는 자바스크립트에서 쓰던 if 문과 switch 문을 사용할 수 있다.

### if 문 사용 시 타입 제약
* if 문에 지정하는 조건은 boolean 타입이어야 함
  * 물론 if 문에 사용할 변수도 boolean 타입으로 선언해야 함
  * string 타입(빈 값 : false, 나머지 : true) 이나 number 타입 (0 : false, 나머지 : true)으로 조건을 넣는 것은 권장하지 않음
    * 해석이 필요하고 명시적이지 않음..

### switch 문과 폴스루
* 자바스크립트의 switch 문과 형식이 같음
* 표현식에 사용할 변수에 타입 지정 가능
  * 이렇게 사용하는 경우, case 절에 선언한 값의 타입이 일치하게 됨
  ```typescript
  let command: number = 0;

  switch (command) {
      case 0:
          console.log(0);
          break;
      case 1:
          console.log(1);
          break;
  }
  ```
  * 타입을 제한하지 않는 경우 any 사용
* 폴스루(`fall-through`)란?
  * case 절에서 break를 생략하여 다음 case 절이 실행되는 경우, 이런 상태를 fall-through라고 함
  ```typescript
  let input = 0;

  switch (input) {
      case 0:
          console.log("shua");
      case 1:
          console.log("joshua");
          break;
  }
  ```
  ```
  출력
  shua
  joshua
  ```
  * 폴스루는 개발자가 고의로 발생시키는 경우도 있음
    * 여러 case 절에서 처리하는 로직이 같은 경우 편의상 break 생략
    * 컴파일러 옵션에 `noFallthroughCaseInSwitch` 옵션을 true로 넣으면 허용하지 않도록 설정 가능
      * 이렇게 설정하더라도, case 절에 아무런 명령문을 넣지 않을 때에는 해당 부분에 한하여 폴스루 허용 처리
  ```typescript
  let input = 0;

  switch (input) {
      case 0:
      case 1:
          console.log("shua");
          break;
  }
  ```
  ```
  출력
  shua
  ```

## 반복문
* for 문
  * 기본 for 문의 경우 자바스크립트와 동일
    * 타입스크립트에서는 ES6에서 지원되는 let 키워드와 타입 지정 가능하다는 특징이 있음
    * let 키워드를 쓰면 블록 레벨 스코프를 적용받을 수 있기 때문에, 타입스크립트의 for 문을 쓰는 경우 let 키워드 사용
* for in 문
  * ES5의 for in 문을 생각하면 됨
  * https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Statements/for...in
* for of 문
  * ES6 표준에 추가된 특징 (TS 1.5부터 지원)
  * for in 문이 인덱스를 이용하여 값을 가져올 수 있었다면, for of는 바로 값을 가져올 수 있음
    * java의 개선된 for 문을 생각하면 될 듯
  ```typescript
  for (variable of iterable) {
      // code
  }
  ```
  * iterable이란?
    * 반복 가능한 객체
    * 배열, 문자열, DOM 컬렉션, Map, Set 등
  * const 사용 가능
    * 일반 for 문에서는 const 사용 불가
    * 그렇지만 for of 문은 Symbol.iterator의 구현을 통해 각 iteration 값의 요소를 가져오기 때문에 const 사용 가능
* for of 문에 대해 ES5 버전 호환
  * 기본적으로는 별 문제 없이 컴파일 가능하나.. Map / Set은 compilerOptions target이 es2015일 때 가능
    * Map 객체의 경우 ES6부터 사용할 수 있기 때문!
* while 문, do-while 문
  * 자바스크립트와 동일


## 느낀 점
php 코딩하면서 아래와 같은 코드를 사용할 일이 있었는데, 이 것을 폴스루라는 표현으로 부른다는 것을 처음 알았다.
```php
switch ($value) {
    case 0:
    case 1:
    case 2:
        echo $value;
        break;
    case 3:
        break;
    default:
        break;
}
```
그 전까지는 온갖 핑계를 대가며 제대로 들여다보지 않았으나, 타입스크립트의 매력을 알게 됨과 동시에 ES6을 잘 알아둬야할 이유도 깨닫게 되었다.

아직까지 적응이 필요하지만, '이게 내가 쓰던 저 언어에서 하던 짓이랑 비슷하구나' 같은 식으로 받아들이면서 코드를 두드려보니 이해하기 좀 더 쉬운 것 같다!