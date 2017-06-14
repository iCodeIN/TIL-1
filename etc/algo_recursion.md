## Recursion

*   모든 순환(재귀)함수는 반복문(iteration)으로 변경 가능
    *   모든 반복문을 recursion으로 표현하는 것도 가능
*   Recursion은 복잡한 알고리즘을 단순하고 알기쉽게 표현하는 것을 가능하게 함
    *   하지만 함수 호출에 따른 오버헤드가 있음
    *   오버헤드의 예) 매개변수 전달, 액티베이션 프레임 생성 등
*   순환(재귀)함수는 반드시 베이스 조건이 필요하다. 즉, 순환되지 않고 종료되는 Case가 필요하다는 것.
    *   모든 Case는 결국 베이스 조건으로 수렴해야 함!

#### 순환적 알고리즘 설계

*   암시적(implicit) 매개변수를 명시적(explicit) 매개변수로 바꾸어라!

#### Recursion Example

```java
public static int binarySearch(String[] items, String target, int begin, int end) {
  if (begin > end) {
    return -1;
  } else {
    int middle = (begin+end) / 2;
    int compResult = target.compareTo(items[middle]);
    if (compResult == 0) {
      return middle;
    } else if (compResult < 0) {
      return binarySearch(items, target, begin, middle-1);
    } else {
      return binarySearch(items, target, middle+1, end);
    }
  }
}
```



#### Maze Problem ([Code](https://github.com/joshua-qa/practice-java/blob/master/inflearn/Recursion/Maze.java))

```
boolean findPath(x,y)
	if (x,y) is either on the wall or a visited cell
		return false;
	else if (x,y) is the exit
		return true;
	else
		mark (x,y) as a visited cell;
		for each neighbouring cell (x`,y`) of (x,y) do
			if findPath(x`,y`)
				return true;
		return false;
```

