---
date: 2022-02-13 20:58
description: defer 이란? - (2)
tags: iOS, Swift
---

## defer의 실행 순서
### <b class="bold">defer</b>는 코드의 실행 순서에 관여하는 기능이니만큼 규칙을 확실하게 인지하고 있어야한다.
### - 기본적으로 <b class="heavy">defer</b>는 선언된 역순으로 실행되는 <b class="heavy">Stack</b>형식이다.
### - 현재 코드 블록을 빠저나가기 전에 실행된다.

```swift
func Print() {
    defer {
        print("첫번째 defer")
    }
    defer {
        print("두번째 defer")
    }
    defer {
        print("세번째 defer")
    }
    defer {
        print("네번째 defer")
    }
    defer {
        print("다섯번째 defer")
    }
    defer {
        print("여섯번째 defer")
    }
}
```

### 역순으로 실행되기 때문에 위 예제 코드를 실행시 아래와 같은 결과를 확인할 수 있다.

```
여섯번째 defer
다섯번째 defer
네번째 defer
세번째 defer
두번째 defer
첫번째 defer
```

## 중첩 코드 블럭에서의 defer 실행 순서

### 다음은 조금 더 복잡한 중첩 코드 블럭에서의 예제를 살펴보자.

```swift
func test() {
    defer {
        print("test 1")
    }

    for i in 0..<2 {
        defer {
            print("test 2")
        }

        if i % 2 == 0 {
            defer {
                print("test 3")
            }

            print("test 4")
        }
    }

    defer {
        print("test 5")
    }

    print("test 6")
}
```

### 위 코드의 결과는 아래와 같다.

```
test 4
test 3
test 2
test 2
test 6
test 5
test 1
```

### 블럭 단위로 끊어보면 이해하기 쉽다.
### - 맨 먼저 가장 안쪽에 있는 if문 코드 블럭이 가장 먼저 끝나기 때문에 그 안에 있는 <b class="heavy">defer</b>가 먼저 출력된다. 따라서 `test 4`를 출력하고 코드 블럭이 끝나기 직전에 `test 3`을 출력한다.
### - 다음으로는 for문 코드 블럭이 끝난다. 따라서 쌓여있던 `test 2`가 두번 출럭된다.
### - 마지막으로 끝나는 test()의 코드 블럭의 `test 6`을 출력한 뒤 순서대로 쌓여있던 `test 1`와 `test 6`이 역순으로 출력된다.

## Defer가 호출되지 않는 경우

### <b class="heavy">defer</b>가 스택에 담기기 전에 코드 블럭이 종료되면 이후의 <b class="heavy">defer</b>는 호출되지 않는다.

```swift
func test() {
    defer {
        print("test 1")
    }

    return

    defer {
        print("test 2")
    }
}
```

### 위 예제에서는 첫번째 <b class="heavy">defer</b>가 스택에 쌓이고 바로 함수가 종료된다.
### 따라서 두번째 <b class="heavy">defer</b>는 스택에 쌓이지 않게 되기 때문에 `test 1`만 출력된다.
### 이 외에도 <b class="heavy">throw</b>로 오류를 발생시키거나 <b class="heavy">guard문</b>으로 함수가 종료되도 똑같이 이후의 <b class="heavy">defer</b>는 호출되지 않는다.

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://swieeft.github.io/2020/02/26/defer.html">swieeft</a>
</li>
</ul>
