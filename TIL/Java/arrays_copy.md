#### Array 복사 방법

원래 배열 복사하는 방법으로 두 가지를 쓰고 있었다.

* 미리 만들어놓고 `System.arraycopy` 쓰기
* 만들면서 `Arrays.copyOf` 쓰기

그런데 copyOf 같은 경우 복사할 길이만 지정이 되고, 인덱스 지정은 안된다.

검색해보니 `Arrays.copyOfRange` 메서드를 쓰면 된다고 한다.

```
public static <T> T[] copyOfRange(T[] original, int from, int to)
```

> Copies the specified range of the specified array into a new array. The initial index of the range (from) must lie between zero and original.length, inclusive. The value at original[from] is placed into the initial element of the copy (unless from == original.length or from == to). Values from subsequent elements in the original array are placed into subsequent elements in the copy. The final index of the range (to), which must be greater than or equal to from, may be greater than original.length, in which case null is placed in all elements of the copy whose index is greater than or equal to original.length - from. The length of the returned array will be to - from.

> The resulting array is of exactly the same class as the original array.

범위 지정 잘해서 복사해주면, 원하는 인덱스 범위만큼 복사된 배열을 얻을 수 있다.

* 사용 예시
```java
char[] text = in.next().toCharArray();
for(int l = 0; l < text.length; l++) {
    char[] newText = Arrays.copyOfRange(text, l, text.length);
    int[] pi = getPi(newText);

    for (int i = 0; i < pi.length; i++) {
        if (pi[i] > ans) {
            ans = pi[i];
        }
    }
}
```