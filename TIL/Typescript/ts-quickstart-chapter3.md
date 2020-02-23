## 타입스크립트 퀵스타트 챕터 3

### 변수 선언

* var 선언자의 특징
  * 호이스팅
    * 선언한 변수가 스코프의 최상위로 끌어올려지는 현상
      * 예를 들면, 할당을 먼저하고 변수를 나중에 선언하는 것도 가능
    * 선언된 위치와 관계없이, 같은 스코프라면 어디서든 호출되기 때문에 주의할 필요가 있음
      * 가독성을 떨어뜨리는 문제도 있음
  * 함수 레벨 스코프는 지원하나, 블록 레벨 스코프 미지원
    ```javascript
    var name = "shua";
    
    function funcScope() {
    	var name = "joshua";
    }
    
    funcScope();
    console.log(name);
    // output : shua
    
    if (true) {
    	var name = "joshua";
    }
    
    console.log(name);
    // output : joshua
    ```
  * if 문 내부와 외부를 같은 스코프로 인식하기 때문에, 내부에서 선언된 변수가 외부 변수에 영향을 줄 수 있음
* let
  * var 선언자가 가지고 있는 문제를 방지할 수 있는 선언자
  * 특성
    * 같은 블록 내에서 같은 이름의 변수를 중복 선언할 수 없음
    * 변수를 초기화하기 전에 접근할 수 없음 (호이스팅 방지)
    * 선언할 변수에 블록 레벨 스코프 적용
* const
  * ES6에서도 지원하고~ 타입스크립트에서도 지원하고~
  * let이랑 비교하기
    * 동일한 점 : 호이스팅 방지, 블록 레벨 스코프 적용
    * 다른 점 : const는 선언할 때 초기화만 가능하며, 재할당이 불가하다
      
      * const는 변수를 상수로 선언할 때 사용!
    * 재할당이 불가하지만 객체 리터럴 속성값을 변경하는 건 가능
      ```javascript
      const name = "shua";
      name = "joshua";
      // error
      
      const info = {
      	name: "shua",
      };
      
      info.name = "joshua";
      
      console.log(info);
      // output : { name: 'joshua' }
      ```
* 블록 레벨 스코프
  * 블록 레벨 스코프를 지원하는 대표적인 선언은 아래와 같음
    * let, const
    * class, interface, type alias, enum

### 타입 검사와 타입 선언
* 언어에서 수행하는 타입 검사는 크게 정적 타입 검사와 동적 타입 검사가 있음
* 점진적 타입 검사
  * 타입스크립트와 파이썬 등이 지원하는 방식
  * 컴파일 시간에 타입 검사를 수행하면서, 필요에 따라 타입 선언의 생략을 허용
    * 암시적 형변환이 일어남
    * https://www.typescriptlang.org/docs/handbook/type-inference.html 여기도 나중에 읽어봐야겠음
* 동적 타이핑
  * 타입스크립트는 타입을 선언하지 않는 경우 입력값에 따라 타입이 결정됨
    * 숫자가 들어온 경우 number, 문자열인 경우 string, 배열이나 객체 리터럴이면 object 타입으로 추론되는 식임
* 타입 계층도
  * 타입스크립트의 점진적 타입 시스템은 아래와 같은 특성이 있음
    * 타입을 생략할 수 있음
    * 암시적 형변환이나 여러 타입을 결합해 새로운 타입을 정의하는 것을 허용
  * 계층도는 책 또는 [이곳](https://www.google.com/search?q=typescript+type+hierarchy&source=lnms&tbm=isch&sa=X&ved=2ahUKEwicnYHPvOfnAhUJrpQKHYnLDR4Q_AUoAXoECA0QAw&biw=1920&bih=937)을 참고
  * 최상위 타입은 any

#### 타입
* 기본 타입 (primitive types)
  * string, number, boolean 같은 내장 타입들
* 객체 타입
  * 속성을 포함하고 있으며, call signature / construct signature 등으로 구성된 타입
  * 타입스크립트 지원 객체 타입 종류
    * Array, Tuple, Function, Constructor, Class, Interface
* 기타 타입
  * 유니언
    * 2개 이상의 타입을 하나의 타입으로 정의
      * `var test: number | string;`
  * 인터섹션
    * 2개 타입을 합쳐 하나로 만들 수 있음
      ```javascript
      interface A {
      	door: number;
      }
      interface B {
      	window: number;
      }
      
      let intersection: A & B { door: 1, window: 2 };
      ```
  * 특수 타입  
  * void, null, undefined



#### 변수에 타입 지정
* 형식
  * `var <변수 식별자>:<타입> = <값>;`
  * `var width: number = 10;`

#### 자바스크립트 내장 타입
* 자바스크립트에서 지원하는 내장 타입으로 기본 타입, 객체 타입, 함수 타입이 있음
* boolean, number, string
  * 명시적으로 global object를 통해 직접 생성 가능
    * `let type1 = new Number(123);`
  * 타입이 객체이기 때문에 실제 값은 valueOf로 호출하여 사용해야함
* 그 외 symbol (ES6), null, undefined, object, function
* symbol 타입
  * ES6에 추가된 내장 타입
  * object property 의 유일하게 불변적인 식별자로 사용
    * `let shua = Symbol("shua");`
  * 객체 리터얼의 속성 키로 사용할 수 있음
* enum 타입
  * ES6에 제안된 타입
  * 컴파일 시간에 평가되며, 계층도 기준으로는 number의 하위 타입임
    * 자바스크립트로 컴파일된 후에는 객체 타입이 되므로, typeof를 사용하면 object로 표시
  * 상수 enum으로 선언할 수도 있음 (const enum)
  * 초깃값으로 숫자, 문자열 할당 가능
    * 문자열의 경우는 TS 2.4부터 지원하는 스펙
    * enum에 할당한 초깃값에 문자열이 없는 경우 연산식도 포함할 수 있지만, 문자열이 하나라도 있는 경우는 포함할 수 없음
      ```javascript
      enum A {
      	a = 10, b = 20, c = 30 << 2 // 허용
      }
      enum B {
      	a = "str", b = 20 // 허용
      }
      enum C {
      	a = "str", b = 20, c = 30 << 2 // 에러
      }
      ```
  * enum에 나열한 속성들은 0-base index로 상수와 연결되어 있음
    * `enum Food { Chicken, Pizza, Rice }` 인 경우 `Food.Chicken` 의 Index는 0
  * 접근은 속성 접근과, 인덱스 접근으로 가능
    * 속성 접근 : `let food1 = Food.Pizza`
    * 인덱스 접근 : `let food2 = Food["Chicken"]`

#### 타입스크립트 내장 타입
* any 타입
  * 어떤 타입의 값도 받아들일 수 있으며, 최소한의 타입 검사만 수행
  * 자바스크립트의 변수 선언과 동일한 동작을 수행
  * 타입 결과를 예측할 수 없을 때 유연한 대처 가능
  * any 타입이라도 최소한의 정적 타입 검사는 수행함
    * 선언되어 있지 않은 속성에 접근할 때!
  * object 타입
    * any 타입과 비슷하지만, 속성 유무를 검사하는 시점이 다름
      * any 타입 : 속성의 유무를 런타임 시에 검사
      * object 타입 : 컴파일 시간에 검사
  * noImplicitAny 옵션
    * TS의 경우 기본적으로 매개변수 타입을 생략하는 경우 any로 추론됨
    * 그렇지만 명시적으로 any 타입임을 선언하고 싶을 때, 컴파일러 옵션을 설정할 수 있음
      * tsconfig.json의 compilerOptions 밑에 `"noImplicitAny": true`
  
* 배열 타입
  * 요소 타입에 `[]`를 붙여 선언
  * string, number, boolean 뿐 아니라 class / interface도 가능
  * 먼저 빈배열로 선언하고 `push()`  메서드를 이용하여  요소를 추가할 수 있음
    ```javascript
    let food: string[] = [];
    food.push("pizza");
    ```
  * any 타입으로도 지정할 수 있으며, 유니언 타입을 이용하여 배열에 들어갈 타입을 제어할 수도 있음
    ```javascript
    let noBoolean = (number | string)[] = ["shua", 1234];
    noBoolean.push(false); // 에러
    ```
  
* 제네릭 배열 타입
  * TS 0.9부터 지원
  * `Array<T>` 형태로 선언
    * `let food: Array<string> = ["pizza", "chicken", "rice"];`
  * 타입을 참조할 때는 타입 쿼리를 사용
    * typeof를 사용하면 참조할 변수의 타입을 얻어올 수 있음
    * `let food2: typeof food = ["sushi", "fish"];`
  * 제네릭 배열은 내장 타입 외에 객체 타입도 받을 수 있음
    * 익명 함수도 가능
      ```javascript
      let anonymousFoods: Array<() => string> = [() => "pizza", () => "chicken"];
      console.log(anonymousFoods[0]());
      // output : pizza
      ```
  
* 튜플 타입
  * 배열 요소에 대응하는 n개에 대한 타입  
    -> 튜플이면 당연히 2개만 될 줄 알았는데 n개여서 조금 신기....
  * TS 2.7 이전에는 튜플 타입에 선언된 개수를 초과한 요소에 대해 유니언 타입을 적용 받았으나, 현재는 요소 수를 제대로 검사하고 있음
    ```javascript
    let x: [string, number] = ["tuple", 100];
    console.log(typeof x, typeof x[0], typeof x[1]);
    // output : object string number
    
    let x2: [string, number] = ["tuple", 100, "asdf"]; // 에러
    ```
* void, null, undefined
  * void 타입은 null과 undefined의 상위 타입이며, 반환값이 없을 때 지정하는 타입
    * 해당 타입들만 할당할 수 있음
  * 선언한 변수에 null이나 undefined를 할당하지 못하도록 컴파일러 옵션을 설정할 수 있음
    * `strictNullChecks`
      * https://www.typescriptlang.org/docs/handbook/compiler-options.html
  * null은 object로 간주되며, undefined는 아직 초기화되지 않음을 의미함

### 느낀 점

하루만에 챕터 3을 끝냈는데, 생각 이상으로 ES에 대해 잘 설명해주고 있는 책인 것 같다.

덕분에 긴가민가했던 개념들도 복습할 수 있었고 타입스크립트가 얼마나 매력적인지도 이 챕터를 통해서 느낄 수 있었다. 자바와 코틀린을 하다온 나에게는 익숙한 것들도 있어서 더욱..

신규 프로젝트에 타입스크립트를 사용하게 되었으니, 이참에 잘 배워봐야겠다!