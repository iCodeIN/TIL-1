## 특정 문자열을 반복한 String 만들기 (Java)

패킷 전송할 문자열 결합하면서, 삽입할 공백 문자열을 만들어주는 메서드가 있었는데 당시에 급해서 하드코딩으로 구현해놨었다.

그래서 이걸 지저분하지 않게 한줄로 끝내고 싶어서 어떻게 하면 될지 찾아봄.

#### 방법 1 (replace 사용)
```java
private static final int FIELD_SIZE = 12;
private static String getSpace(int length) {
    return new String(new char[FIELD_SIZE - length]).replace("\0", " ");
}
```

#### 방법 2 (nCopies 사용)
```java
private static final int FIELD_SIZE = 12;
private static String getSpace(int length) {
    return String.join("", Collections.nCopies(FIELD_SIZE - length, " "));
}
```

#### 방법 3 (Apache Commons StringUtils 사용)
```java
private static final int FIELD_SIZE = 12;
private static String getSpace(int length) {
    return StringUtils.repeat(" ", FIELD_SIZE - length);
}
```

#### 방법 4 (Stream 사용)
```java
import static java.util.stream.Collectors.joining;

private static final int FIELD_SIZE = 12;
private static String getSpace(int length) {
    return Stream.generate(() -> " ").limit(FIELD_SIZE - length).collect(joining());
}
```

