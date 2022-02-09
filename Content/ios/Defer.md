---
date: 2022-02-10 00:15
description: defer 이란? - (1)
tags: iOS, Swift
---

## defer 이란?
### <b class="bold">defer</b>가 무엇인지에 대해 간단히 알아보려한다.
### 자주 쓰는 기능은 아니지만 적절한 상황에 사용하면 유용할 것 같다.
### 기본적으로 <b class="heavy">defer</b>은 현재 코드 블럭을 나가기 전에 꼭 실행하게 도와주는 기능입니다.

```swift
func Print() {
    defer {
        print("Print 함수 끝나요~")
    }
    
    print("헬로 월드!!")
}
```

### 위 코드의 결과는 아래와 같다.
```
헬로 월드!!
Print 함수 끝나요~
```
### <b class="heavy">Print</b> 함수의 코드 블럭이 끝나기 전에 <b class="heavy">defer</b>가 호출된 것을 볼 수 있다.

### 다음은 <b class="heavy">defer</b>의 실행순서와 <b class="heavy">defer</b>을 호출하지 않는 경우에 대해 알아보자.

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://swieeft.github.io/2020/02/26/defer.html">swieeft</a>
</li>
</ul>
