
---
date: 2021-02-28 19:29
description: QuickSort Algorithm
tags: Algorithm
---

### QuickSort 알고리즘이란
- QuickSort 알고리즘은 pivot을 기준으로 pivot보다 작은 값을 pivot 왼쪽에, 큰 값을 pivot 오른쪽에 정렬하는 알고리즘이다. (오름차순 기준)

- pivot을 기준으로 해 좌우로 값을 보내고 난 후 start에서 pivot - 1, pivot + 1에서 last를 재귀 호출해 주면 된다.

- 코드 주석을 확인하며 디버깅하면 무슨 뜻인지 쉽게 알 수 있을 것이다.

보통 pivot은 배열의 중간 값으로 많이 정한다고 하는데 아래 예제에서는 배열의 마지막 값으로 정했다.

```java
import java.util.Scanner;

public class QuickSort {
    public int partition(String A[], int first, int last) {

        String pivot = A[last]; // 정렬 기준이 될 pivot을 배열 맨 마지막 원소로 정함.
        int i = first - 1; // 정렬할

        for (int j = first; j < last; j++) { // first부터 last까지 반복
            if (A[j].compareTo(pivot) < 0) { // j번째와 pivot을 비교하여 j번째가 더 작으면 조건 true
                // compareTo 연산자는 두개의 값을 비교함. (리턴 값이 음수인 경우 A[j]이 pivot 보다 사전적으로 앞서있음을 말함.)

                // pivot보다 j번째가 작으면 ++i번째와 스왑
                // i번째가 pivot을 기준으로 정렬된 개수를 의미
                String temp = A[++i];
                A[i] = A[j];
                A[j] = temp; // swapping.
            }
        }
        // 반복문이 끝나고 i번째와 pivot값을 바꾸면 pivot을 기준으로 작은 값은 왼쪽 큰 값은 오른쪽으로 정렬이 끝났다는 뜻.
        String temp = A[i + 1];
        A[i + 1] = A[last];
        A[last] = temp;
        return i + 1; // 기준 원소 위치로 리턴.
    }

    public void quickSort(String A[], int first, int last) {
        if (first < last) { // 원소가 2개 이상일 경우에만 정렬 작업 수행하도록 하는 조건문.
            int pivot = partition(A, first, last); // first, last기준으로 A배열 정렬.
            quickSort(A, first, pivot - 1); // 재귀 알고리즘으로 기준값 미만인 경우 왼쪽 부분 정렬.
            quickSort(A, pivot + 1, last); // 재귀 알고리즘으로 기준값 미만인 경우 왼쪽 부분 정렬.
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("");
        System.out.print("단어 수 입력: ");
        int num = sc.nextInt(); // 입력 받은 단어 수 num 변수에 저장.

        String wordArray[] = new String[num]; // num 크기의 배열 wordArray 선언.
        QuickSort Q = new QuickSort(); // QuickSort 타입의 변수 Q 선언. > quickSort 메소드를 불러오기 위함.

        System.out.print(num + "개의 단어 입력: ");
        for (int i = 0; i < wordArray.length; i++) {
            wordArray[i] = sc.next();
        }

        System.out.print("퀵 정렬 결과: ");
        // 퀵 정렬 시작.
        Q.quickSort(wordArray, 0, num - 1);
        for (int i = 0; i < wordArray.length; i++) {
            System.out.print(wordArray[i] + " ");
        }
    }
}
```
