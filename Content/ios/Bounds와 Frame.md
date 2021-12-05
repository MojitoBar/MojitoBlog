---
date: 2021-12-05 22:18
description: Bounds와 Frame의 차이
tags: iOS, Swift
---

## Bounds와 Frame의 차이는?

<br/>
### <b class="heavy">Bounds</b>와 <b class="heavy">Frame</b>는 기본적으로 좌표 시스템을 나타내는 <b class="bold">UIView</b>의 프로퍼티이며 <b class="bold">CGRect</b>를 상속받고 있다.
<br/>

## Bounds?

### 애플의 개발자 문서를 참고하면
<br/>
<img src="/images/boundsImage.png"/>

<blockquote><b class="inyong">자체 좌표계에서 뷰의 위치와 크기를 설명하는 경계 사각형.</b></blockquote>

### 이라 정의되어있다.
<br/>
### <b class="heavy">Bounds</b>의 핵심은 <b class="bold">자체 좌표계</b>라는 것에 있다.
<br/>
### <b class="heavy">Bounds</b>는 왼쪽 상단을 기준으로 (0, 0)을 기본값으로 가진다. 아래 예시 이미지를 보면 금방 이해할 수 있다.
<br/>
<img src="/images/boundsexImage1.png"/>
<br/>
### 이미지의 녹색 사각형이 디바이스 화면, 빨간점이 기준이 되는 <b class="bold">(0, 0)</b>이다.
### <b class="heavy">Bounds</b>는 해당 아이템을 <b class="bold">(x, y)</b>을 기준으로 보여주겠다 라는 뜻이다.
<br/>
<blockquote><b class="inyong">x, y를 변경하면 어떻게 될까?</b></blockquote>

```swift
imageView.bounds.origin.x = 280
imageView.bounds.origin.y = 70
```

<img src="/images/boundsexImage2.png"/>
<br/>
### 이미지 자체 좌표계에서 기준이 되는 빨간점이 이동한 것을 확인할 수 있다!
<br/>
### 이런 특징 때문에 <b class="heavy">ScrollView</b>, <b class="heavy">CollectionView</b> 에서 <b class="heavy">contentSize</b>를 설정해줬을 때 스크롤 효과를 낼 수 있는 것이다.


## Frame?

### 그렇다면 <b class="heavy">Frame</b>은 뭘까?
<br/>
<img src="/images/frameImage.png"/>

<blockquote><b class="inyong">상위 뷰의 좌표계에서 뷰의 위치와 크기를 설명하는 프레임 사각형.</b></blockquote>

### 마찬가지로 애플의 개발자 문서를 참고하면 위와 같이 정의되어 있다.
<br/>
### <b class="heavy">Frame</b>의 핵심은 <b class="bold">상위 뷰의 좌표계</b>라는 것에 있다.
<br/>
### <b class="heavy">Frame</b>도 마찬가지로 왼쪽 상단을 기준으로 <b class="bold">(0, 0)</b>을 기본값으로 가지는데, 이때 <b class="bold">(0, 0)</b>의 기준이 되는 것이 바로 <b class="heavy">상위 뷰의 좌표계</b>라는 것이다. 
<br/>
### 아래 예시 이미지를 보면 금방 이해할 수 있다.
<br/>
<img src="/images/frameexImage1.png"/>
<br/>
### 이미지의 노란색 사각형이 디바이스 화면, 빨간점이 기준이 되는 <b class="bold">(0, 0)</b>, 큰 회색 사각형이 상위 뷰이다. <b class="heavy">Frame</b>은 자신의 <b class="bold">상위 뷰의 좌표</b>를 기준으로 (x, y)에 보여주겠다 라는 뜻이다.
<br/>
<blockquote><b class="inyong">x, y를 변경하면 어떻게 될까?</b></blockquote>

```swift
imageView.frame.origin.x = 40
imageView.frame.origin.y = 60
```

<img src="/images/frameexImage2.png"/>
<br/>
### 상위 뷰인 <b class="heavy">superview</b>를 기준으로 빨간점이 이동한 것을 확인할 수 있다!
<br/>
### <b class="heavy">Frame</b>은 상위 뷰를 기준으로 하므로 항상 <b class="heavy">superview</b>가 필요하다.

<br/>
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://yagom.net/forums/topic/%EC%95%BC%EA%B3%B0%EB%8B%B7%EB%84%B7-%EC%A7%88%EB%AC%B8%EB%AA%A8%EC%9D%8C-5/">YAGOM 질문모음</a>
</li>
<li>
    <a href="https://zeddios.tistory.com/203">ZeddiOS</a>
</li>
</ul>
