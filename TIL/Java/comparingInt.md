#### comparingInt 사용법 (Java)
Collections.sort 쓰면 람다식으로 Comparator을 넣어줄 때가 있다.

그런데, IntelliJ 쓰면서 다음과 같이 입력하면 회색 밑줄이 쳐진다.
```Java
Collections.sort(graph, (o1, o2) -> o1.cost - o2.cost);
```

해당 줄에 마우스를 오버하면, Comparator.comparingInt로 바꿀 수 있다고 알려준다.

공식 문서를 확인하면 다음과 같이 알려주고 있다.
```
static <T> Comparator<T> comparingInt(ToIntFunction<? super T> keyExtractor)

Accepts a function that extracts an int sort key from a type T, and returns a Comparator<T> that compares by that sort key.
The returned comparator is serializable if the specified function is also serializable.
```

이제 위에 쓴 코드를 수정해보자.

```Java
Collections.sort(graph, Comparator.comparingInt(p -> p.cost));
```

두 Int값을 비교한다는 것을 직관적으로 알 수 있게 되었다. (comparingInt니까...)