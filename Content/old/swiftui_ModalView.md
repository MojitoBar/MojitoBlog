---
date: 2021-02-28 19:29
description: SwiftUI Simple ModalView Example
tags: SwiftUI
---


### SwiftUI List
SwiftUI에서 ModalView를 띄우는 가장 쉬운 방법이다.<br>

FullScreen Modal밖에 띄우지 못한다는 것이 단점이지만, ios에서 제공하는 가장 안정적인 view이기도 하고 여러 부가 옵션을 사용할 수 있다는 장점이 있다..

### ModalView
```Swift
Button(action: {
    // some action...
}, label: {
    // some label...
})
.sheet(isPresented: self.$showModal, content: {
    // some modalview content
})
```
Button 속성으로 위와 같은 코드를 적어주면 된다.<br>
content안에 적은 코드가 ModalView로 보이게 된다.
