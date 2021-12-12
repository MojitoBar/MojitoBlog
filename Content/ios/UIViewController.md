---
date: 2021-12-12 22:18
description: UIViewController란?
tags: iOS, Swift
---

## 앱 화면의 콘텐츠를 표시하는 로직과 관리를 담당하는 객체?

### 바로 <b class="bold">UIViewController</b>가 그 역할을 한다.
### 애플에서는 UIViewController를 아래와 같이 설명한다.

<br/>
<img src="/images/uiviewcontrollerImage.png"/>
<blockquote><b class="inyong">UIKit 앱의 뷰 계층 구조를 관리하는 개체입니다.</b></blockquote>
<br/>
### 뷰 컨트롤러는 앱 내부 구조의 기초이다. 모든 앱에는 적어도 하나의 <b class="heavy">ViewController</b>가 있으며 대부분의 앱에는 여러개의 <b class="heavy">ViewController</b>가 있다. 각 뷰 컨트롤러는 인터페이스와 기본 데이터 간의 상호작용을 관리한다.
### 앱에서 매우 중요한 역할을 하기 때문에 <b class="heavy">ViewController</b>는 거의 모든 작업의 중심에 있다. <b class="heavy">ViewController</b>의 주요 역할로는 <b class="bold">View 관리</b>, <b class="bold">이벤트 처리</b>, <b class="bold">뷰 전환</b> 등이 있다.

<br/>

### <b class="heavy">ViewController</b>에는 두 가지 유형이 있다.
- <b class="heavy">Content ViewController</b>는 앱 콘텐츠의 개별 부분을 관리하며 사용자가 만드는 주요 유형의 ViewController다.
- <b class="heavy">Container ViewController</b>는 다른 뷰 컨트롤러에서 정보를 수집하고 탐색을 용이하게 하거나 해당 뷰 컨트롤러의 콘텐츠를 다르게 표시하는 방식으로 정보를 제공한다.

<br/>
### 대부분의 앱은 두 가지 유형의 ViewController가 혼합되어 있다.

## Content ViewController?
### 가장 대표적인 예로 UIViewController를 상속받아 화면에 보여줄 새로운 뷰를 구현할 때를 들 수 있다.

```swift
class MainViewController: UIViewController
{
    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        textLabel?.text = "텍스트 입니다만..."
    }
}
```
### 위 코드를 보면 <b class="heavy">MainViewController</b>가 <b class="heavy">Content ViewController</b>라고 말할 수 있다. 
<br/>

## Container ViewController?
### 보통 직접 무언가를 보여주는 역할은 없으며, ViewController 간에 부모-자식 관계를 형성하여 자신만의 방식으로 자식을 관리하는 역할을 맡는 ViewController이다. <b class="bold">UINavigationController</b>를 예로 들 수 있다.
<br/>

<img src="/images/navigationviewImage.png"/>

<br/>
### 위 사진과 같이 하위 컨트롤러들을 관리하는 역할을 하는 놈은 <b class="heavy">Container ViewController</b>라고 한다.
### <b class="heavy">Container ViewController</b> 사용하는 가장 큰 이유는 로직을 분리하여 단일 책임원칙을 지키기 위해서라고 생각한다. 예를 들어 <b class="heavy">UINavigationController</b> 같은 경우에는 라우팅 역할을 하는 VC를 따로 분리해 나중에 있을 유지보수나 테스트에서 이점을 가져갈 수 있다.

###  

<br/>
## 참고자료
<ul>
<li>
    <a href="https://developer.apple.com/documentation/uikit/uiviewcontroller">UIViewController</a>
</li>
<li>
    <a href="https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/index.html#//apple_ref/doc/uid/TP40007457">The Role of View Controllers</a>
</li>
</ul>
