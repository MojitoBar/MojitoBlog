---
date: 2021-02-28 19:29
description: SwiftUI Remove ListSeparator
tags: SwiftUI
---

### SwiftUI List
SwiftUI에서 List Struct를 사용하다 보면 분리선을 없애고 싶을 때가 있다.<br>

구글링하면 버전별로 수많은 방법이 나오는데 가장 깔끔한 방법을 찾은 것 같다.

### NoSeparatorList
```Swift
struct NoSeparatorList<Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
        
    var body: some View {
        if #available(iOS 14.0, *) {
           ScrollView {
               LazyVStack(spacing: 0) {
                self.content()
             }
           }
        } else {
            List {
                self.content()
            }
            .onAppear {
               UITableView.appearance().separatorStyle = .none
            }.onDisappear {
               UITableView.appearance().separatorStyle = .singleLine
            }
        }
    }
}
```
    
해당 struct를 선언해주고 List사용하듯 쓰면 구분 선 없이 List를 사용할 수 있다.

### NoSeparatorList 사용 예
```Swift
NoSeparatorList{
    ForEach(items){item in
        // use item
    }    
}
```
