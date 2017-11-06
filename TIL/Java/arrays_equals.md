#### char array 비교

그동안 Char형 배열을 같은지 비교할 때 `String.valueOf`사용해서 비교했었는데 그럴 필요가 없다는 것을 알았다.

* 예시
```java
char[] ca = "asdf".toCharArray();
char[] ca2 = "asdf".toCharArray();

boolean flag = Arrays.equals(ca, ca2);

System.out.println(flag ? "true" : "false");
```

* 실행결과
```
true
```