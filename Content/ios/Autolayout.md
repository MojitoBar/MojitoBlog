---
date: 2022-01-08 21:12
description: AutoLayout을 코드로 작성하는 방법?
tags: iOS, Swift
---

## AutoLayout?

### <b class="bold">AutoLayout</b>은 뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 뷰에 배치된 제약 조건에 따라 동적으로 계산하는 것이다.

<br/>
<img src="/images/storyboardautolayoutImage.png"/>
<br/>

### <b class="heavy">StoryBoard</b>에서 <b class="heavy">AutoLayout</b>을 사용하는 방법은 위 사진과 같다.
### 가시적으로 보기 쉽다는 장점이 있지만, 동적으로 생성되는 객체와 같은 경우엔 코드로 <b class="heavy">AutoLayout</b>을 작성해야만 한다.
### 코드로 <b class="heavy">AutoLayout</b>을 작성하는 방법은 <b class="bold">NSLayoutConstraint</b>, <b class="bold">Layout Anchor</b>, <b class="bold">Visual Format Language</b> 3가지가 있다.

## NSLayoutConstraint

<br/>
<img src="/images/nslayoutImage.png"/>
<br/>

<blockquote><b class="inyong">제약 기반 레이아웃 시스템이 충족해야 하는 두 사용자 인터페이스 개체 간의 관계입니다.</b></blockquote>

### 애플은 <b class="heavy">NSLayoutConstraint</b>를 위와 같이 설명한다.
### <b class="heavy">iOS 6</b>때 도입된 방법으로 아래와 같이 작성한다.

```swift
let constraint = NSLayoutConstraint(
    item: someView,
    attribute: .height,
    relatedBy: .equal,
    toItem: button,
    attribute: .height,
    multiplier: 1,
    constant: 0
)
NSLayoutConstraint.activate([constraint])
```
### 위 코드는 <b class="heavy">someView</b>에 <b class="heavy">AutoLayout</b>을 적용하는 코드이다. 

## Layout Anchor
```swift
class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 오토레이아웃과 기존의 오토리사이징 마스크가 충돌하는 것을 막기 위해
        button.translatesAutoresizingMaskIntoConstraints = false

        // 버튼의 수직, 수평 anchor 를 전체 뷰의 수직 수평에 맞추는 제약 생성
        var constraintX: NSLayoutConstraint
        constraintX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        var constraintY: NSLayoutConstraint
        constraintY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        // 생성된 제약을 적용
        constraintX.isActive = true
        constraintY.isActive = true
    }
}
```

### <b class="heavy">Anchor</b>를 통해서 <b class="heavy">AutoLayout</b>을 구현한 코드이다.
### <b class="heavy">NSLayoutConstraint</b>로 구현하는 것 보다 가독성이 좋아보이기도 한다.

## Visual Format Language
### <b class="heavy">Visual Format Language</b>는 <b class="heavy">ASCII-art</b>를 사용하여 제약조건을 정의한느 방법이다. 제약조건의 표현을 시각적인 묘사로 표현한다.

```swift
let views = ["myView" : myView]
let formatString = "|-[myView]-|"
 
let constraints = NSLayoutConstraint.constraints(withVisualFormat: formatString, options: .alignAllTop, metrics: nil, views: views)
 
NSLayoutConstraint.activate(constraints)
```

### 시각적인 묘사로 표현하다보니 규칙을 먼저 숙지해야하는데 <a href="https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html">링크</a> 를 통해 확인해볼 수 있다.
### 처음 보는 방법이며 가장 많이 사용되지 않는 방법인 것 같다.

<br/>
<br/>

### <b class="heavy">AutoLayout</b>를 구현하기 위한 3가지 방법에 대해 알아봤는데, 3가지 방법 모두 코드가 너무 길어지고 가독성이 좋은지 잘 모르겠다.
### 실제로 많은 프로젝트에서는 위 3가지 방법을 사용하기 보단 <b class="bold">SnapKit</b>과 같은 <b class="heavy">AutoLayout Library</b> 를 더 많이 사용하는 것 같다.

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://hyunsikwon.github.io/ios/iOS-AutoLayout-01/">낸슥iOS</a>
</li>
<li>
    <a href="https://github.com/jwonyLee/TIL/blob/master/iOS/Interview/Autolayout-code.md">jwonyLee</a>
</li>
</ul>
