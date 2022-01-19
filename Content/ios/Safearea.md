---
date: 2022-01-19 21:28
description: Safe Area에 대해서
tags: iOS, Swift
---

## Safe Area란 ?

### iOS 11이 되며 기존의 <b class="bold">topLayoutGuide</b>, <b class="bold">bottomLayoutGuide</b>를 대신해 나오게 되었다.
### 이는 <b class="heavy">iPhone X</b>가 출시되며 노치가 생겼기 때문이기도 한데 아래 그림을 보면 이해가 빠르다.

<br/>
<img src="/images/safeareaImage.png"/>
<br/>

### 사진과 같이 <b class="heavy">iPhone 8</b>에 있던 홈버튼이 없어지면서 <b class="heavy">iPhone X</b> 에서 휴대폰은 돌렸을 때 하단부분에 여백이 생기게 된것이다. 
### 위 그림의 회색부분이 <b class="heavy">Safe Area</b>이다.
### 녹색 부분에 상태바, 내비게이션바, 탭바 등이 위치하게 돼도 View가 가려지지 않기 위해 제공되는 마진이다.
### 하지만 어플의 특성상 <b class="bold">SafeAreaInsets</b>을 적용해야할 수도 무시해야 할 수도 있다.

## StoryBoard에서의 Safe Area

<br/>
<img src="/images/storyboardsafeareaImage.png"/>
<br/>

### 사진과 같이 푸른색으로 표시된 부분이 <b class="heavy">Safe Area</b>이다.
### UI를 만들고 <b class="heavy">Safe Area</b>를 기준으로 <b class="heavy">Contraints</b>를 주게 되면 적용이되고, <b class="heavy">SuperView</b>를 기준으로 <b class="heavy">Contraints</b>를 주게 되면 <b class="heady">SafeAreaInsets</b>를 무시한 채로 적용된다.

<br/>
<img src="/images/inspectorsafeareaImage.png"/>
<br/>

### 혹은 위 사진에 보이는 <b class="heavy">ViewController</b>의 <b class="heavy">Inspector</b>에 <b class="heavy">Use Safe Area Layout Guides</b>의 체크를 해제하면 아예 사용하지 않을 수도 있다.

## 코드에서의 Safe Area

```swift
// 자료형은 UIEdgeInsets 이다.
self.view.safeAreaInsets
```

### 코드를 통해 <b class="heavy">Contraints</b>를 줄 때 위 코드를 통해 뷰의 <b class="heavy">Safe Area</b> 마진값을 추가할 수 있다.

<br/>

### 어플의 특성 상 Safe Area를 무시해야하는 영상이나 사진에 대해서는 어쩔 수 없지만 Apple은 웬만하면 지켜주는 것을 권장한다 

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://devmjun.github.io/archive/SafeArea_1">devmjun</a>
</li>
<li>
    <a href="https://babbab2.tistory.com/134">babbab2</a>
</li>
</ul>
