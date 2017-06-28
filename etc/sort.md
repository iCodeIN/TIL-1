#### merge sort ([Code Link](https://github.com/joshua-qa/practice-java/blob/master/inflearn/Sort/Merge.java))
분할정복법의 대표적인 예시중 하나다.
[Big-O Cheatsheet](http://bigocheatsheet.com/) 참고하면 나오지만, 최악의 경우에도 O(n log n)을 보장하는 정렬 알고리즘이다.
정렬 과정에서 추가 배열이 필요하다는 특징이 있다.
왜 O(n log n)인지, quick sort와 비교했을 때 어떤지에 대해서 [이 곳](http://thrillfighter.tistory.com/315)에 나와있다.

```
mergeSort(A[], p, r) { // A[p...r]을 정렬
    if (p < r) {
        q = (p+r) / 2; // binarySearch처럼 중간 지점을 찾음
        mergeSort(A, p, q); // q 기준으로 앞 부분 정렬 (Recursion)
        mergeSort(A, q+1, r); // q 기준으로 q+1부터 뒷 부분 정렬 (Recursion)
        merge(A, p, q, r); // 정렬한 값 합병
    }
}

merge(A[], p, q, r) { // 정렬되어 있는 두 배열 A[p...q]와 A[q+1...r]을 합쳐서 하나의 정렬된 배열을 만듬
    int i = p, j = q+1, k = p;
    int tmp[A.length()];
    while (i <= q && j <= r) {
        if (A[i] <= A[j]) {
            tmp[k++] = A[i++];
        } else {
            tmp[k++] = A[j++];
        }
    }

    while (i <= q) {
        tmp[k++] = A[i++];
    }
    while (j <= r) {
        tmp[k++] = A[j++];
    }
    for (int i = p; i <= r; i++) {
        A[i] = tmp[i];
    }
}
```

#### quick sort ([Code Link](https://github.com/joshua-qa/practice-java/blob/master/inflearn/Sort/Quick.java))
merge sort와 더불어 분할정복법의 대표적인 예시중 하나다.

* 분할 : 배열을 다음과 같은 조건이 만족되도록 두 부분으로 나눈다.
elements in lower parts <= elements in upper parts
* 정복 : 각 부분을 순환적으로 정렬한다.
* 합병 : nothing to do

* Pivot의 선택
    * 첫번째 값이나 마지막 값을 Pivot으로 선택
        * 이미 정렬된 데이터 혹은 거꾸로 정렬된 데이터가 최악의 경우
        * 현실의 데이터는 랜덤하지 않으므로 (거꾸로) 정렬된 데이터가 입력으로 들어올 가능성은 매우 높음
        * 따라서 좋은 방법이라고 할 수 없음
    * Median of Three
        * 첫번째 값과 마지막 값, 그리고 가운데 값 중에서 중간값(median)을 Pivot으로 선택
        * 최악의 경우 시간복잡도가 달라지지는 않음
    * Randomized Quicksort
        * Pivot을 랜덤으로 선택
        * no worst case instance, but worst case execution
        * 평균 시간복잡도 O(n log n)

```
* 정렬할 배열이 주어짐. 마지막 수를 기준(pivot)으로 삼음
[31, 8, 48, 73, 11, 3, 20, 29, 65, 15(pivot)]

* 기준보다 작은 수는 기준의 왼쪽에, 나머지는 기준의 오른쪽에 오도록 재배치 (분할) 한다.
[8, 11, 3, 15(pivot), 31, 48, 20, 29, 65, 73]

* 기준의 왼쪽과 오른쪽을 각각 순환적으로 정렬한다. (정렬 완료)
[3, 8, 11, 15, 20, 29, 31, 48, 65, 73]
```

```
quickSort(A[], p, r) { // A[p...r]을 정렬한다
    if (p < r) {
        q = partition(A, p, r); // 분할
        quickSort(A, p, q-1); // pivot 기준 왼쪽 부분배열 정렬
        quickSort(A, q+1, r); // pivot 기준 오른쪽 부분배열 정렬
    }

    partition(A[], p, r) {
        x = A[r] // pivot
        i = p-1;
        for j<-p to r-1
            if(A[j] <= x) {
                i = i+1;
                exchange A[i] and A[j];
            }
        exchange A[i+1] and A[r];
        return i+1;
    }
}
```