---
date: 2022-01-09 22:12
description: hugging, resistance에 대해서
tags: iOS, Swift
---

## Priority

<br/>
<img src="/images/huggingImage.png"/>
<br/>

### <b class="heavy">StoryBoard</b>에서 오브젝트를 클릭하면 위 사진과 같이 두개의 <b class="bold">Priority</b>를 설정할 수 있다.

## Hugging Priority
### 우선순위가 높으면 내 크기는 유지. 우선순위가 낮으면 내 크기를 늘림.

<br/>
<img src="/images/huggingerrorImage.png"/>
<br/>

### 위 사진과 같은 상황이라 가정해보자.
### 두 Label이 있는데 width를 지정해주지 않고 leading, trailing, top만 지정해줬다면 사진과 같은 오류를 볼 수 있을 것이다.
### 두 Label사이의 거리를 10이라 지정해준다면 공간이 비는데, <b class="heavy">Hugging Priority</b>가 같으니 어떤 녀석을 늘려서 맞춰야할지 모르겠다는 뜻이다.

<br/>
<img src="/images/251changeImage.png"/>
<br/>

### 따라서 둘 중 하나의 우선순위를 바꿔주면 오류를 해결할 수 있는데, 위 사진은 왼쪽 Label의 우선순위가 더 높은 상태이다.

## Resistance Priority
### 우선순위가 높으면 내 크기는 유지. 우선순위가 낮으면 내 크기를 줄임.
### <b class="heavy">Hugging Priority</b>와는 반대로 두 오브젝트 사이의 거리가 부족할 때 필요한 우선순위이다.
<br/>
### 만약 위 Hugging과 똑같은 상황에 Label의 text가 20글자라면 두 Label의 사이가 부족할 것이다.
### 이때 <b class="heavy">Resistance Priority</b>를 조절해 하나는 <b class="bold">abcd...</b>, 나머지 하나는 <b class="bold">abcdefghijk</b> 이런식으로 전부 보여줄 수가 있다는 것이다.

<br/>
<br/>
<br/>
<br/>

### 두 우선순위를 더욱 쉽게 이해하기 위해서는 <b class="heavy">Intrinsic Size</b>에 대해 알면 좋을 것 같다! 다음 포스팅으로 알아볼 예정이다.
### 내가 개발하면서 두 우선순위를 사용해본적은 한번도 없다... 그런 상황을 못 만났다기 보단 보통 안 오는 상황인 것 같다.

<br/>
## 참고자료
<ul>
<li>
    <a href="https://eunjin3786.tistory.com/43">eungding</a>
</li>
</ul>
