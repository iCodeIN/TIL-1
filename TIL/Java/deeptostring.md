#### 배열 내용물 한번에 출력하기

특정 상황에서 한눈에 볼 수 있도록 배열에 있는 내용을 찍어봐야 할 때가 있다.

다행히 Arrays 클래스에는 두가지 메서드가 있다.

(사실 그동안 일일히 찍어봤다...)

굳이 줄바꿈을 해가면서 출력할 필요가 없다면 다음과 같은 방법으로 확인해보면 된다.

* 일차원 배열인 경우 : `Arrays.toString`
* 다차원 배열인 경우 : `Arrays.deepToString`

```java
import java.util.Arrays;

public class Test {
    public static void main(String[] args) {
        int[] test = {1,2,3,4};
        int[][][] array = new int[5][5][5];

        for(int i = 0; i < 5; i++) {
            for(int j = 0; j < 5; j++) {
                for(int k = 0; k < 5; k++) {
                    array[i][j][k] = i+j+k;
                }
            }
        }

        System.out.println(Arrays.toString(test));
        System.out.println(Arrays.deepToString(array));
    }
}
```

* 실행 결과

```
[1, 2, 3, 4]
[[[0, 1, 2, 3, 4], [1, 2, 3, 4, 5], [2, 3, 4, 5, 6], [3, 4, 5, 6, 7], [4, 5, 6, 7, 8]], [[1, 2, 3, 4, 5], [2, 3, 4, 5, 6], [3, 4, 5, 6, 7], [4, 5, 6, 7, 8], [5, 6, 7, 8, 9]], [[2, 3, 4, 5, 6], [3, 4, 5, 6, 7], [4, 5, 6, 7, 8], [5, 6, 7, 8, 9], [6, 7, 8, 9, 10]], [[3, 4, 5, 6, 7], [4, 5, 6, 7, 8], [5, 6, 7, 8, 9], [6, 7, 8, 9, 10], [7, 8, 9, 10, 11]], [[4, 5, 6, 7, 8], [5, 6, 7, 8, 9], [6, 7, 8, 9, 10], [7, 8, 9, 10, 11], [8, 9, 10, 11, 12]]]
```

* 참고한 사이트
    * https://docs.oracle.com/javase/7/docs/api/java/util/Arrays.html
    * http://stack07142.tistory.com/16