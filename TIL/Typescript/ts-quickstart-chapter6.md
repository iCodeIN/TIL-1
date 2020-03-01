# 타입스크립트 퀵스타트 챕터 6

- [타입스크립트 퀵스타트 챕터 6](#%ed%83%80%ec%9e%85%ec%8a%a4%ed%81%ac%eb%a6%bd%ed%8a%b8-%ed%80%b5%ec%8a%a4%ed%83%80%ed%8a%b8-%ec%b1%95%ed%84%b0-6)
  - [함수](#%ed%95%a8%ec%88%98)
    - [기명 함수와 익명 함수](#%ea%b8%b0%eb%aa%85-%ed%95%a8%ec%88%98%ec%99%80-%ec%9d%b5%eb%aa%85-%ed%95%a8%ec%88%98)
      - [기명 함수 (named function)](#%ea%b8%b0%eb%aa%85-%ed%95%a8%ec%88%98-named-function)
      - [익명 함수 (anonymous function)](#%ec%9d%b5%eb%aa%85-%ed%95%a8%ec%88%98-anonymous-function)
      - [자바스크립트 함수의 불안전성](#%ec%9e%90%eb%b0%94%ec%8a%a4%ed%81%ac%eb%a6%bd%ed%8a%b8-%ed%95%a8%ec%88%98%ec%9d%98-%eb%b6%88%ec%95%88%ec%a0%84%ec%84%b1)
      - [타입 안전성을 갖춘 타입스크립트](#%ed%83%80%ec%9e%85-%ec%95%88%ec%a0%84%ec%84%b1%ec%9d%84-%ea%b0%96%ec%b6%98-%ed%83%80%ec%9e%85%ec%8a%a4%ed%81%ac%eb%a6%bd%ed%8a%b8)
    - [매개변수의 활용](#%eb%a7%a4%ea%b0%9c%eb%b3%80%ec%88%98%ec%9d%98-%ed%99%9c%ec%9a%a9)
      - [기본 초기화 매개변수 (default-initialized parameter)](#%ea%b8%b0%eb%b3%b8-%ec%b4%88%ea%b8%b0%ed%99%94-%eb%a7%a4%ea%b0%9c%eb%b3%80%ec%88%98-default-initialized-parameter)
      - [나머지 매개변수 (rest parameter)](#%eb%82%98%eb%a8%b8%ec%a7%80-%eb%a7%a4%ea%b0%9c%eb%b3%80%ec%88%98-rest-parameter)
      - [선택 매개변수 (optional parameter)](#%ec%84%a0%ed%83%9d-%eb%a7%a4%ea%b0%9c%eb%b3%80%ec%88%98-optional-parameter)
      - [함수 오버로드 (function overloads)](#%ed%95%a8%ec%88%98-%ec%98%a4%eb%b2%84%eb%a1%9c%eb%93%9c-function-overloads)
    - [익명 함수의 이해와 활용](#%ec%9d%b5%eb%aa%85-%ed%95%a8%ec%88%98%ec%9d%98-%ec%9d%b4%ed%95%b4%ec%99%80-%ed%99%9c%ec%9a%a9)
      - [익명 함수와 화살표 함수 (arrow function)](#%ec%9d%b5%eb%aa%85-%ed%95%a8%ec%88%98%ec%99%80-%ed%99%94%ec%82%b4%ed%91%9c-%ed%95%a8%ec%88%98-arrow-function)
      - [객체 리터럴의 선언과 객체 리터럴 타입의 선언 (object literal)](#%ea%b0%9d%ec%b2%b4-%eb%a6%ac%ed%84%b0%eb%9f%b4%ec%9d%98-%ec%84%a0%ec%96%b8%ea%b3%bc-%ea%b0%9d%ec%b2%b4-%eb%a6%ac%ed%84%b0%eb%9f%b4-%ed%83%80%ec%9e%85%ec%9d%98-%ec%84%a0%ec%96%b8-object-literal)
    - [익명 함수의 함수 타입](#%ec%9d%b5%eb%aa%85-%ed%95%a8%ec%88%98%ec%9d%98-%ed%95%a8%ec%88%98-%ed%83%80%ec%9e%85)
      - [익명 함수의 타입 선언](#%ec%9d%b5%eb%aa%85-%ed%95%a8%ec%88%98%ec%9d%98-%ed%83%80%ec%9e%85-%ec%84%a0%ec%96%b8)
    - [콜백 함수의 타입 선언과 활용](#%ec%bd%9c%eb%b0%b1-%ed%95%a8%ec%88%98%ec%9d%98-%ed%83%80%ec%9e%85-%ec%84%a0%ec%96%b8%ea%b3%bc-%ed%99%9c%ec%9a%a9)
- [느낀점](#%eb%8a%90%eb%82%80%ec%a0%90)

## 함수

타입스크립트의 함수는 자바스크립트와 비교했을 때, 매개변수나 리턴값에 타입을 추가할 수 있다는 장점이 있다.

그리고 함수를 변수에 할당할 때 함수 타입을 추가해서 타입 안정성을 강화할 수 있다는 특징도 가지고 있다.

### 기명 함수와 익명 함수
자바스크립트의 함수는 선언 방식에 따라 아래 두 종류로 나뉜다.

* 기명 함수 (named function)
* 익명 함수 (anonymous function)

타입스크립트도 자바스크립트와 동일한 형태로 함수를 선언하고, 호출한다.

#### 기명 함수 (named function)
기명 함수의 경우 `function 키워드`와 함수명을 기입해 아래와 같이 선언하게 된다.

```typescript
function shuaFunction(arg1, arg2) {
    ...
}
```

기명 함수는 호출될 때 호이스팅이 발생한다.

즉, 함수를 선언하기 전에도, 함수를 선언한 후에도 호출할 수 있다는 것이다🙂

#### 익명 함수 (anonymous function)
기명 함수의 경우 호출 시 호이스팅 문제로 인해 함수 호출이 복잡해질 수 있다.

이를 보완하는 방법으로 변수에 익명 함수를 할당하는 방법이 있다.

```typescript
let addNumber = function(a, b) {
    return a + b;
}
```

이렇게 변수에 익명 함수를 할당하여 함수를 호출하게 되면, 할당 시점 이후부터 함수를 호출할 수 있어서 호이스팅을 방지할 수 있다. (호출 시점 제한)

#### 자바스크립트 함수의 불안전성
자바스크립트는 기본적으로 느슨한 타입 언어(loosely typed language)이기 때문에 매개변수의 타입이나 반환 타입은 없지만, 프로그램이 실행될 때 동적으로 타입을 할당해 추론된 타입이 지정된다.

이런 특징으로 인하여 브라우저 환경에서도 빠른 속도를 보장한다고 한다.  
-> 타입을 사용하지 않아서 빠르다는데, 궁금하니까 개인적으로 관련 내용을 좀 찾아봐야겠음👀

타입이 없어서 발생하는 문제점이 있다면, 런타임 때 의도하지 않은 타입 변환이 일어날 수 있다는 점이다.

문자열 타입이 숫자로 변환되거나, 그 반대의 경우가 발생할 수도 있고 이는 아래와 같은 예시에서 확인할 수 있다.

```javascript
function shuaFunction(numberString) {
    return numberString + 1234;
}

let result = shuaFunction("1234");
console.log(typeof result, result); // string 12341234
```

이 코드를 실행하기 전까지만 해도, 결과를 좀처럼 예상할 수 없었다.  
실행 결과를 통해 문자열 결합이 일어났다는 것을 알았으나, 매번 코드를 작성하면서 이런 문제를 방지하기 위한 노력을 기울여야 한다면 적지 않게 번거로울 것이다.

덕분에 자바스크립트에서는 타입에 관련된 문제를 막기 위해, 매개변수의 검증이나 타입 캐스팅을 수행하는 작업을 거쳐야 한다.

* 함수의 매개변수에 대한 타입 검증
  * 타입이 일치하지 않으면 타입 캐스팅
* 함수의 연산을 수행한 후에, 반환값에 대한 타입 캐스팅
* 함수 호출 결과에 따른 타입 캐스팅

작업량이 많지 않다면 부담스럽지 않은 작업일 수도 있으나, 업무에서 이런 작업이 계속 반복되는 경우 생산성이 떨어질 수 밖에 없다.

더군다나 타입캐스팅으로 불필요한 자원을 소비해 성능에도 나쁜 영향을 줄 수 있다.

#### 타입 안전성을 갖춘 타입스크립트

반면 타입스크립트의 경우 함수의 매개변수 타입이나 반환 타입을 추가할 수 있어, 타입 안전성을 강화하는데 도움을 준다.

이렇게 타입 지정 하는 것을 타이핑 (typing)이라고 한다.

### 매개변수의 활용

#### 기본 초기화 매개변수 (default-initialized parameter)
타입스크립트는 ES6에서 추가된 기본 초기화 매개변수를 지원한다.

> 개인적으로 이 부분에 대해 찾아봤는데, `default-initialized parameter` 로 검색하면 특별히 나오는게 없다.  
> MDN에서는 `기본 함수 매개변수 (default function parameter)`로 설명하고 있으니 참고!
> https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Functions/Default_parameters

`기본 초기화 매개변수`는 함수 매개변수에 초깃값을 설정하는 경우, 해당 매개변수에 인수를 전달하지 않고 호출해도 설정된 초기값으로 매개변수 초기화를 해준다는 것이다.

사용법을 보면 알겠지만, 다른 언어에서 흔히 봤을법한 기능이다. (PHP, Kotlin 등)

```typescript
function shuaTest(name: string, nickname: string = "shua") {
    console.log(nickname);
}

shuaTest("슈아"); // output : shua
```

타입스크립트에서의 기본 초기화 매개변수는 컴파일 옵션에 따라 만들어지는 코드의 차이가 있는데, 그 차이점은 아래와 같다.

* ES3, ES5
  * 해당 기능을 지원하지 않기 때문에, 함수 내에 조건문이 삽입된다.
  * 값이 전달되지 않았는지 조건문으로 체크하여, 기본값을 넣는 식으로 처리된다.
  ```javascript
  function shuaTest(name, nickname) {
    if (nickname === void 0) { nickname = "shua"; }
    console.log(nickname);
  }
  shuaTest("슈아");
  ```
* ES6
  * 기존 코드와 별 차이없이 처리되며 타입표기만 제거된다.
  ```javascript
  function shuaTest(name, nickname = "shua") {
    console.log(nickname);
  }
  shuaTest("슈아");
  ```

#### 나머지 매개변수 (rest parameter)
나머지 매개변수도 ES6에서 제안된 특징으로, 개수가 정해지지 않은 인수를 배열로 받을 수 있는 기능이다.

자바의 `...`을 생각하면 된다. 나머지 매개변수에 대한 자세한 설명은 [MDN - Rest 파라미터](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Functions/rest_parameters) 에 잘 나와있다.

```typescript
function shuaRestParameter(name: string, nickname: string, ...restParameter) {
    console.log(restParameter);
}

shuaRestParameter("shua", "슈아"); // []
shuaRestParameter("shua", "슈아", "asdf", "fdsa"); // [ 'asdf', 'fdsa' ]
```

나머지 매개변수는 0개 이상의 요소를 받을 수 있으며, 0개를 전달하는 경우 빈 배열이 전달된다. (위 예시 참고)

타입을 제한하지 않을 수도 있으나, 나머지 매개변수로 받으려는 타입을 제한하는 경우에는 `string[]` 같은 배열 타입으로 지정해주면 된다.

`기본 초기화 매개변수`가 그랬듯이, 나머지 매개변수도 ES6 미만 컴파일 / ES6 컴파일이냐에 따라 만들어지는 코드의 차이가 있다.

#### 선택 매개변수 (optional parameter)
기본적으로 함수 호출 시에는 매개변수 선언 개수만큼 인수를 전달해야하지만, 일부 매개변수를 생략하려는 경우 optional paramater를 사용할 수 있다.

사용법은 선택 매개변수로 지정하려는 매개변수에 `?`를 붙이면 된다.

```typescript
function shuaOptional(name: string, nickname?: string) {
    ...
}

shuaOptional("shua");
```

선택 매개변수의 경우 일부 제약사항이 있는데, 초깃값 설정을 함께 사용할 수 없다는 것이다.  
-> 꼭 넣고자 한다면 함수 내에서 매개변수 undefined 체크를 한 뒤에 초깃값 세팅

#### 함수 오버로드 (function overloads)
함수 오버로드는, 함수명은 같으면서 매개변수와 반환 타입이 다른 함수를 여러 개 선언할 수 있는 특징을 얘기한다.

컴파일 시간에 가장 적합한 오버로드를 선택해서 컴파일 하므로, 실행 시에 런타임 비용이 발생하지 않는다는데 나중에 따로 찾아봐야겠다.

오버로드 사용법 및 주의점에 대한 것은 아래와 같다.

***

* **각 오버로딩에 대해 독립된 블록으로 선언하지 못함**

예를 들어서, 아래와 같이 쓸 수는 없다는 것이다. 자바의 오버로딩을 생각하면 안된다. 🤔

```typescript
function shuaOverload(name: number, nickname: number): number {
    return name;
}
function shuaOverload(name: string | number, nickname: any): any {
    return name;
}

// 중복된 함수 구현입니다. (ts 2393)
```

올바른 예시는 아래와 같다.

```typescript
function shuaOverload(name: string, nickname: string): string;
function shuaOverload(name: number, nickname: number): number;
function shuaOverload(name: boolean): boolean;
function shuaOverload(name: any, nickname?: any): any {
    return name;
}
```

[ts-for-jsdev 문서](https://ahnheejong.gitbook.io/ts-for-jsdev/03-basic-grammar/function) 의 설명에 따르면 타입스크립트의 함수 오버로딩은 아래와 같은 특징을 가진다.

* 함수는 하나 이상의 타입 시그니처를 가질 수 있다.
* 함수는 단 하나의 구현을 가질 수 있다.

왜 이렇게 구현이 되었을까? 이유는 자바스크립트에 오버로딩이라는 개념이 없기 때문일 것이다.

[zerocho 블로그 문서](https://www.zerocho.com/category/JavaScript/post/59c17a58f40d2800197c65d6) 설명에 따르면, 자바에서 오버로딩 하듯이 함수를 선언하는 경우 가장 아래에 선언한 함수가 같은 이름의 함수들을 죄다 덮어씌워버린다.  
실제로 해당 내용을 테스트해보면 그 결과를 바로 확인할 수 있다.

```javascript
function overload() {
  console.log("매개변수 0개");
}

function overload(i, j) {
  console.log("매개변수 "+ i + " 그리고 " + j);
}

function overload(d) {
  console.log("매개변수 " + d);
}

overload();
overload(8, 9);
```

이 코드의 실행 결과는 가장 아래에 선언한 overload 메서드가 실행된다.

***

* **구체적인 타입을 명시한 시그니처를 먼저 쌓고나서, 그 타입들을 모두 커버하는 형태로 가장 아래에 함수를 선언해야 한다.**

참고로 책에서는 이렇게 설명하고 있다.

> 가장 일반적인(general) 함수 (매개변수를 any 타입으로 선언)의 시그니처를 가장 아래에 선언하고 그 위로 구체적인(specific) 타입을 명시한 함수의 시그니처를 쌓는 방식으로 선언해야 합니다. 그러면 선언된 함수의 시그니처에 맞게 인수를 넘겨 호출할 수 있습니다.

책의 설명에서 실제 동작과 약간 다른 포인트가 있다면 `매개변수를 any 타입으로 선언`이라는 설명이다. 

아래 예시를 다시 한 번 살펴보자. 

```typescript
function shuaOverload(name: string, nickname: string): string;
function shuaOverload(name: number, nickname: number): number;
function shuaOverload(name: boolean): boolean;
function shuaOverload(name: any, nickname?: any): any {
    return name;
}
```

꼭 가장 아래에 선언하는 함수는 매개변수를 any 타입으로 선언해야할까? 그렇지 않다. 아래와 같이 Union Type을 써도 동작한다.
```typescript
function shuaOverload(name: string, nickname: string): string;
function shuaOverload(name: number, nickname: number): number;
function shuaOverload(name: boolean): boolean;
function shuaOverload(name: string | number | boolean, nickname?: string | number): any {
    return name;
}
```

즉, `구체적인 타입을 명시한 시그니처들의 타입들을 모두 커버하는 형태`로 선언해야 한다는 말이 좀 더 맞다.

***

* **매개변수 개수에 변화를 주려면 Optional Parameter를 활용한다**

오버로딩이라고 해서 무턱대고 시그니처마다의 매개변수 개수를 다르게 할 수 있는 것이 아니라, 이게 생략될 수도 있다는 의미로 Optional Parameter를 지정해줘야한다.

위에 예시로 들었던 코드를 다시 살펴보면, 세번째 시그니처에서 `nickname` 매개변수를 생략했음에도 불구하고 오류없이 동작하는 것을 알 수 있다. 그 이유는 선언된 함수에서 `nickname?: any` 로 명시했기 때문이다.

> 타입스크립트 오버로딩으로 검색해서 나오는 일부 블로그의 경우, 매개변수의 개수가 같아야 한다고 잘못 서술해놓은 글이 보이는데.. Optional Parameter를 사용하면 그렇지 않다는 것을 알아두어야 한다.

***

* 참고 자료
  * https://www.typescriptlang.org/docs/handbook/functions.html
    * 생각보다 설명이 자세하진 않으므로 다양한 자료를 검색해서 읽어보길 추천
  * https://hyunseob.github.io/2016/11/18/typescript-function/
    * 읽어보길 추천
  * https://ahnheejong.gitbook.io/ts-for-jsdev/03-basic-grammar/function
    * 읽어보길 추천

### 익명 함수의 이해와 활용

#### 익명 함수와 화살표 함수 (arrow function)
arrow function은 ES6 표준에 포함된 특징이며, 익명 함수를 좀 더 간략하게 표현할 수 있는 방법이다.

Python, Java 8에서 말하는 람다 함수 (lambda function)와 같으며, 표현식 예시는 아래와 같다.

`( 매개변수 목록 ) => { 함수 블록 }`

* 매개변수 목록이 하나도 없는 경우는 `()`로 표현하며, 1개인 경우는 소괄호 생략이 가능하다.
* 함수 블록에 중괄호가 있는 경우, 반환값이 있으면 return을 이용하여 반환해야 한다.
* arrow function을 변수에 할당하여 호출하지 않으려면, 즉시 호출 함수 (Immediately Invoked Function)를 사용해야 한다.
  ```typescript
  (x => console.log(x))(3); // 3
  ```
  * 즉시 호출 함수에 대해서는 [MDN 페이지](https://developer.mozilla.org/ko/docs/Glossary/IIFE) 참고

#### 객체 리터럴의 선언과 객체 리터럴 타입의 선언 (object literal)

* 객체 리터럴이란?
  * 여러 속성과 값을 한 단위로 묶어서 표현할 수 있는 객채
  * 함수 역시 객체이므로 속성값에 할당할 수 있음
    * 이렇게 할당한 익명 함수 내부에서 객체 프로퍼티를 참조하려면 this 키워드를 사용
    ```typescript
    let info = {
        name: "shua",
        nickname: function () {
            console.log("닉네임 : " + this.name);
        }
    };

    info.nickname(); // 닉네임 : shua
    ```
* 인터페이스를 이용해 객체 리터럴의 타입을 정의하고, 코드 어시스트가 작동하도록 하는 기법도 있음
  * 개인적으로 그렇게 필요해보이지는 않음 🤔
    ```typescript
    interface InfoType {
        name: string;
        nickname(this: InfoType): void;
    }

    let info: InfoType = {
        name: "shua",
        nickname: function (this: InfoType) {
            console.log("닉네임 : " + this.name);
        }
    };

    info.nickname();
    ```

### 익명 함수의 함수 타입

#### 익명 함수의 타입 선언

익명 함수의 매개변수에도 타입을 지정할 수 있으며, 반환값 역시 타입을 지정할 수 있다.

그리고 이렇게 지정한 타입을 별도로 분리하여 함수 타입으로 선언할 수도 있다. 예시는 아래와 같다.

`let shuaFunction: (name: string, nickname: string) => void = (name, nickname) => { console.log(name) };`

함수 타입을 사용하면 익명 함수에 타입을 추가하지 않아도 타입 안전성이 보장된다는 장점이 있지만, 매번 이렇게 선언해주는 것은 번거로울 것이다.

type 앨리어스를 이용해 분리 선언하면, 이렇게 선언한 타입을 이후에도 재활용할 수 있다.

```typescript
type shuaType = (str1: string, str2: string) => void;

let shuaFunction: shuaType = (name, nickname) => {
    console.log(name);
};
let shuaFunction2: shuaType = (name, nickname) => {
    console.log(name + " : " + nickname);
};

shuaFunction("shua", "슈아"); // shua

shuaFunction2("shua", "슈아"); // shua : 슈아
```

### 콜백 함수의 타입 선언과 활용

* 콜백 함수(callback function)란?
  * 또 다른 함수의 매개변수로 전달될 수 있는 함수
  * 콜백 함수를 전달받는 함수의 경우 상위 처리를 담당하며, 고차 함수(higher-order function)라고 불림
    * 고차 함수는 하나 이상의 콜백 함수를 전달받거나 하나 이상의 함수를 결과로 반환해 주는 특성이 있음
    * 콜백 함수를 인수로 받아서 사용하는 경우, 고차 함수 실행이 끝난 다음의 후속 처리를 콜백 함수에서 실행할 수 있음
  * 자바스크립트에서의 대표적인 예시로 `setTimeout`이 있음
    * 아래 코드에서 `setTimeout`이 고차 함수, 내부에 있는 `function() { ... }` 부분이 콜백 함수임
  ```typescript
  setTimeout(function() {
    console.log("shua");
  }, 1000);
  ```
* 콜백 함수의 타입 안정성
  * 콜백 함수의 선언을 외부로 분리하면 함수를 간결하게 호출할 수 있고, 타입을 지정하여 타입 안정성을 확보할 수도 있음
    ```typescript
    type shuaType = (nickname: string) => void;

    let shuaCallback: shuaType = (nickname) => {
        console.log("닉네임 : " + nickname);
    };

    function shuaFunction(nickname: string, callback) {
        return callback(nickname);
    }

    shuaFunction("shua", shuaCallback); // 닉네임 : shua
    ```

# 느낀점
이전 챕터보다 내용이 많아져서, 두번으로 나눠 정리했다.

시중에서 찾아볼 수 있는 자료 중, 조금씩 잘못 서술된 자료들이 있다는 것을 알았고 레퍼런스 문서와 잘 쓴 문서들을 찾는 것이 중요하다고 느꼈다.

중간에도 잠깐 언급했지만 이 책도 가끔씩 이게 팩트인지 찾아봐야 하는 설명들이 있기 때문에, 너무 책만 맹신하지 말고 다양하게 찾아보며 공부해야겠다😀

* 책에서 잘 이해가 안가거나 애매한 설명이 있는 경우, 잘 쓰여진 문서나 레퍼런스 문서를 꼭 참고하기
* 예제 코드를 그대로 받아적지 말고 조금씩 커스텀 해가면서 직접 작성하기. 그리고 실행 결과 꼭 확인하기.
