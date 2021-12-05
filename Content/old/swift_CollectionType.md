---
date: 2021-02-28 19:29
description: Swift CollectionType
tags: Swift
---


### Swift의 3가지 컬렉션 타입
먼저 컬렉션 타입이란.

컬렉션 타입은 데이터들의 집합이라 할 수 있다.
Swift에서 컬렉션 타입이란 지정된 타입의 데이터들의 묶음이다.

굳이 지정된 타입이라고 하는 이유는 Swift에서는 컬렉션 타입들이 모두 제네릭 컬렉션으로 구현되어 있기 때문이다.


### 제네릭(Generic)이란
제네릭이란 컬렉션 타입에 여러가지 데이터 타입들을 담을 수 있도록 지정할 수 있다는 의미이다.</br>
튜플처럼 하나의 컬렉션 타입에 여러개의 데이터 타입들을 담을 수 있다는 것은 아니고 하나의 컬렉션 타입은 하나의 데이터 타입만을 담을 수 있다.

### 컬렉션 타입의 종류

#### 배열 (Array)
Swift에서 배열은 같은 데이터 타입의 값들을 순서대로 저장하는 리스트이다.</br>
그리고 배열은 중복 값을 저장할 수 있는데 어차피 순서가 정해져 있어서 구분할 수 있기 때문이다.

#### 세트 (Set)
Swift에서 세트는 같은 데이터 타입의 값들을 순서없이 저장하는 리스트이다.</br>
순서가 없다는 점만 빼면 배열과 비슷한데, 세트에서는 순서가 없기 때문에 서로 같은 값들을 구분할 수 없다.</br>
따라서 세트에서는 중복된 값을 허용하지 않는다.</br>
이러한 특징 때문에 스위프트 공식 문서에서도 세트는 순서가 중요하지 않거나, 세트에 저장된 각 값들이 유일한 값일 때 사용하라고 한다.</br>
세트는 집합 연산을 할 수 있는 특별한 기능이 있다.

#### 딕셔너리 (Dictionary)
Swift에서 딕셔너리는 순서없이 키(Key)와 값(Value) 한 쌍으로 데이터를 저장하는 컬렉션 타입이다.</br>
다른 컬렉션 타입과 마찬가지로 딕셔너리의 키와 값은 각각 데이터 타입을 지정하면 동일한 데이터 타입만 사용 가능하다.</br>