---
date: 2022-01-01 22:40
description: NotificationCenter 동작 방식 & 활용 방안
tags: iOS, Swift
---

## NotificationCenter란?

<br/>
<img src="/images/notificationImage.png"/>
<br/>

<blockquote><b class="inyong">등록된 관찰자에게 정보를 브로드캐스트할 수 있도록 하는 알림 디스패치 메커니즘입니다.</b></blockquote>

<br/>
### 쉽게 말해 <b class="heavy">NotificationCenter</b>는 객체로부터 어떤 이벤트를 받아 자신에게 등록된 객체들에게 알림을 보내주는 객체이다. <b class="heavy">NotificationCenter</b>는 싱글톤으로 구성되어 있어 사용자가 인스턴스를 만들지 않고 <b class="heavy">NotificationCenter</b>를 부를 수 있다.
<br/>
### 아래는 예제를 살펴보기 전에 먼저 알아둬야하는 내용이다.
<br/>
### - <b class="heavy">NotificationCenter</b>에 자신의 정보를 등록하여 알림을 받고자 하는 객체를 <b class="bold">Observer</b>라고 한다.
### - 객체가 <b class="heavy">NotificationCenter</b>로 이벤트를 보내는 행위를 <b class="bold">Post</b>라 한다.
### - <b class="heavy">NotificationCenter</b>는 싱글톤이기 때문에 이벤트를 여러개 만들기 위해서는 식별자가 필요한데 이를 <b class="bold">NotificationName</b>로 관리한다.

## 예제 살펴보기
```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickBtnPost(_ sender: Any) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "Post"), 
            object: nil)
    }
}
```
### 버튼을 누르면 Post라는 이름의 이벤트를 <b class="heavy">NotificationCenter</b>에 보내는 코드이다.
### 해당 이벤트를 받을 <b class="heavy">Observer</b>를 생성해보자.

```swift
class ObserverViewController: UIViewController {

    @IBOutlet weak var hiddenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, 
            selector: #selector(showLabel), 
            name: NSNotification.Name(rawValue: "Post"),
            object: nil)
    }
    
    @objc func showLabel(){
        hiddenLabel.layer.isHidden = false
    }
}
```
### <b class="heavy">Post</b>라는 이벤트가 날라오면 Hidden으로 설정한 UILabel이 false가 되는 showLabel 함수를 실행하는 <b class="heavy">Observer</b>이다.

### 이처럼 <b class="heavy">NotificationCenter</b>는 객체 간의 통신을 더 쉽게 도와주는 클래스이다.
### 엄청 간단한 예제를 통해 어느정도 이해한 것 같지만 훨씬 다양한 상황에 사용할 수 있는 것 같다. 기회가 된다면 여러 상황에 맞는 예제를 다뤄보고싶다.

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://developer.apple.com/documentation/foundation/notificationcenter">Developer Apple</a>
</li>
<li>
    <a href="https://baked-corn.tistory.com/42">이동건의 이유있는 코드</a>
</li>
</ul>
