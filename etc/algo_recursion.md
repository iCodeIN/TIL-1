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



#### N-Queens Problem ([Code](https://github.com/joshua-qa/practice-java/blob/master/inflearn/Recursion/Queens.java))

-   Backtracking

-   상태공간트리를 이용해서 시각적으로 표현 가능.

    -   상태공간트리란? 찾는 해를 포함하는 트리.

        -   즉, 해가 존재한다면 그것은 반드시 이 트리의 어떤 한 노드에 해당함

        -   따라서 이 트리를 체계적으로 탐색하면 해를 구할 수 있음

        -   상태공간 트리의 모든 노드를 탐색해야 하는 것은 아님

            예를 들어서, `[1,1]`에 말을 놓은 상태에서 `[2,1]` 밑에 있는 노드를 탐색할 필요가 없음

            이미 `1,1`과 `2,1`에 말을 놓는 순간 충돌이 발생하므로 그 이후의 상태를 고려할 필요가 없다는 것!

-   이런 경우에서 Recursion 설계 시, 매개변수는 내가 현재 트리의 어떤 노드에 있는지를 지정해야 한다.

-   cols에 저장된 level 값은 이미 충돌이 없음이 보장된 상태이고, 따라서 마지막으로 삽입되는 말이 이전에 놓인 말들과 충돌하는지 체크하면 끝

```
// 매개변수 level은 현재 노드가 트리에서 몇 level인지 표시
// 전역변수 cols에 말이 어디 놓였는지 표시, cols[i] = j인 경우 i번째 말은 (i,j)에 놓인거다.
// return type은 boolean으로. (성공이냐 실패냐 판정)
int[] cols = new int[N+1];
boolean queens( int level )
{
  if (!promising(level)) // 상태공간트리에서 (꽝)으로 판정 받은 경우
  	return false;
  else if (level == N) // promising 테스트를 통과했다는 가정하에 level == N이면 모든 말이 놓였다는 의미로 성공 판정
  	report true;
  
  // level+1번째 말을 각각의 열에 놓은 후 recursion 호출
  for (int i = 1; i <= N; i++) {
    cols[level+1] = i;
    if (queens(level+1))
    	return true;
  }
  return false;
}

boolean promising(int level) {
  for(int i = 1; i < level; i++) {
 	 if(cols[i] == cols[level]) {
  		return false;
 	 } else if(level - i == Math.abs(cols[level]-cols[i])) { // 같은 대각선에 놓였는지 검사
 		 return false;
 	 }
  }
  return true;
}
```

#### Output

```
(1, 1)
(2, 5)
(3, 8)
(4, 6)
(5, 3)
(6, 7)
(7, 2)
(8, 4)
O#######
####O###
#######O
#####O##
##O#####
######O#
#O######
###O####
```

