#### 자바 우선순위 큐 (PriorityQueue)

우선순위 큐 두개를 이용해서 중앙값 문제를 풀 일이 있었다.

현재의 중앙값보다 작은 값을 왼쪽에, 큰 값은 오른쪽에 넣는 식으로 maxHeap / minHeap을 관리하는 것인데 다음과 같이 작성해주면 된다.

```java
static PriorityQueue<Integer> max = new PriorityQueue<>(new Comparator<Integer>() {
    @Override
    public int compare(Integer o1, Integer o2) {
        return o2 - o1;
    }
});
static PriorityQueue<Integer> min = new PriorityQueue<>(new Comparator<Integer>() {
    @Override
    public int compare(Integer o1, Integer o2) {
        return o1 - o2;
    }
});
```

compare 작성 할 때 순서를 헷갈리지 말아야한다.

maxHeap의 경우는 중앙값보다 작은 값들 중에서 `가장 큰 값`이 뽑아져 나올 수 있도록 구현해야한다. 따라서 o2 - o1.

minHeap의 경우는 중앙값보다 큰 값들 중에서 `가장 작은 값`이 뽑아져 나올 수 있도록 구현해야한다. 따라서 o1 - o2.


그리고 우선순위 큐를 활용해서 다익스트라 등의 문제를 해결할 수 있다.

굳이 선언부 안에 compare을 오버라이드 할 필요는 없고, Comparable 클래스를 만들어줘도 괜찮다.

```java
private void dijkstra(int n) {
    Queue<Vertex> visit = new PriorityQueue<>();

    visit.offer(new Vertex(n, 0));

    while(!visit.isEmpty()) {
        Vertex curr = visit.poll();

        if(curr.dist > shortest[curr.x]) {
            continue;
        }

        for(Vertex v : graph.get(curr.x)) {
            if(shortest[v.x] > curr.dist + v.dist) {
                shortest[v.x] = curr.dist + v.dist;
                visit.offer(new Vertex(v.x, shortest[v.x]));
            }
        }
    }
}

class Vertex implements Comparable<Vertex> {
    int x;
    int dist;
    public Vertex(int x, int dist) {
        this.x = x;
        this.dist = dist;
    }

    @Override
    public int compareTo(Vertex that) {
        if(this.dist > that.dist) {
            return 1;
        } else if(this.dist < that.dist) {
            return -1;
        }
        return 0;
    }
}
```