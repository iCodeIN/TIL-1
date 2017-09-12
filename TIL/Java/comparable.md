#### compareTo 작성 시 주의할 점 (Java)
Minimum Spanning Tree 문제를 풀면서, 우선순위 큐를 쓸 일이 있었다.

ArrayList에 간선을 넣고 cost 순으로 정렬해서 반복문을 돌려줘도 됐지만, 아예 우선순위 큐에 넣어주고 하나씩 빼는 식으로 구현하는게 더 빠른 것을 문제 풀다가 알게 된 것이다.

그래서 별도로 만든 Edge 클래스에 Comparable 인터페이스를 구현하고 compareTo 메서드를 오버라이딩 했다.

그런데, 잘 작성했다고 생각한 코드에서 잘못된 결과가 나오고 있었다...

이유는 간단했는데 compareTo 메서드를 반대로 작성한 것이다.

```java
@Override
public int compareTo(Edge o) {
    return o.cost - this.cost;
}
```

이렇게 작성하면 우선순위 큐에 넣고 뺐을 때 내림차순으로 가져오게 된다.
내림차순으로 구현할 필요가 있는 경우 이게 맞지만, 내가 풀고 있던 문제는 cost가 낮은 순서대로 가져와야 하는 것이기 때문에 올바르지 않다.

```java
@Override
public int compareTo(Edge o) {
    return this.cost - o.cost;
}
```

이렇게 작성해서 성공적으로 '맞았습니다'를 볼 수 있었다.

앞으로는 순서를 헷갈리지 않도록 주의해야겠다.