---
date: 2021-12-11 23:18
description: UserDefaults와 CoreData
tags: iOS, Swift
---

## UserDefaults와 CoreData로 디바이스에 데이터를 저장해보자.

<br/>
### <b class="bold">UserDefaults</b>와 <b class="bold">CoreData</b>는 둘 다 디바이스에 데이터를 저장할 수 있는 기능을 제공해준다.
### 둘의 <b class="heavy">차이점</b>과 <b class="heavy">장단점</b>, <b class="heavy">사용방법</b>에 대해 간단히 정리해보자.
<br/>

## UserDefaults?

### 애플의 개발자 문서를 참고하면
<br/>
<img src="/images/userDefaultsImage.png"/>

<blockquote><b class="inyong">앱을 실행하는 동안 지속적으로 키-값 쌍을 저장하는 사용자의 기본 데이터베이스에 대한 인터페이스입니다.</b></blockquote>

### 이라 정의되어있다.
<br/>
### <b class="heavy">키-값의 쌍</b>을 저장하는 것을 보니 <b class="bold">딕셔너리</b> 구조라는 것을 알 수 있다!

## UserDefaults 사용하기

### 사용하는 방법은 생각보다 쉽다.
<br/>

<img src="/images/userDefaultsCodeImage.png"/>

### 코드는 주석으로 설명해놨다.
### <b class="heavy">UserDefaults</b>는 <b class="heavy">Foundation</b>에 있는 클래스이기 때문에 꼭 import해주자.
### <b class="heavy">UserDefaults</b>에 값을 추가하는 <b class="heavy">set()</b>의 첫번째 인자에 저장할 데이터를 넣어주면 되는데, 첫번째 매개변수의 자료형이 <b class="heavy">Any</b>인 set()이 있기 때문에 특별히 자료형에 구애받지 않는다.

### 이러한 특징을 가진 <b class="bold">UserDefaults</b>는 사용자 기본 설정과 같은 단일 데이터 값에 적합하다.

## CoreData?
### 마찬가지로 애플의 개발자 문서를 참고하면
<br/>
<img src="/images/coreDataImage.png"/>

<blockquote><b class="inyong">단일 장치에서 데이터를 유지 또는 캐시하거나 CloudKit을 사용하여 여러 장치에 데이터를 동기화합니다.</b></blockquote>
### 이라 정의되어있다.
<br/>
### <b class="bold">CoreData</b>는 앱에서 모델 계층 개체를 관리하는 데 사용하는 <b class="bold">프레임워크</b>이다.


### <b class="bold">CoreData</b>에는 <b class="heavy">Persistenced, 변경 사항 Undo & Redo, 백그라운드 데이터 작업, 동기화, 버전 관리 및 Migration 기능</b>을 제공한다.

### 우리가 데이터를 저장할 때 사용하는 기능은 <b class="bold">Persistenced</b>으로

<blockquote><b class="inyong">Core Data는 개체를 저장소에 매핑하는 세부 정보를 추상화하여 데이터베이스를 직접 관리하지 않고도 Swift 및 Objective-C에서 데이터를 쉽게 저장할 수 있도록 합니다.</b></blockquote>

### 라고 정의되어있다.

## CoreData 사용하기
### 프로젝트를 생성할 때 <b class="bold">Use Core Data</b>를 체크하고 생성해준다.
<br/>

<img src="/images/projectInitImage.png"/>

### 체크를 안하고 생성한 프로젝트에 적용하려면 <b class="heavy">ApplDelegate</b> 파일을 수정해 줘야한다.

```swift
// MARK: - Core Data stack

lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
    */
    // DataCore와 같은 이름으로 세팅
    let container = NSPersistentContainer(name: "blogEx")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             
            /*
             Typical reasons for an error here include:
             * The parent directory does not exist, cannot be created, or disallows writing.
             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
             * The device is out of space.
             * The store could not be migrated to the current model version.
             Check the error message to determine what the actual problem was.
             */
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()
```

### 새 파일을 만들듯이 <b class="heavy">data Model</b>파일을 생성해준 후, 해당 소스코드를 <b class="<b class="heavy"">AppDelegate</b>에 추가해주고 이름을 똑같이 수정해주면 된다.
<br/>

<img src="/images/dataCoreModelImage.png"/>

### 만들어진 <b class="heavy">data Model</b> 파일을 열어보면 위 그림과 같이 생겼다. 아래에 있는 <b class="bold">Add Entity</b>를 눌러 새로운 엔티티를 생성해준다. 여기서 <b class="heavy">Entity</b>는 CoreData에 저장될 객체를 의미한다. (예를 들어 최근검색어의 검색 객체.)
### 추가로 오른쪽 아래있는 <b class="bold">AddAttribute</b> 버튼으로 속성을 추가해 준다. 여기서는 테스트를 위해 id와 string을 생성해주었다.
<br/>

<img src="/images/managedCodegenImage.png"/>

### 우리는 <b class="heavy">CoreData</b>가 생성한 managed object subclass 및 프로퍼티 또는 기능을 편집할 것이기 때문에 <b class="heavy">Codegen</b>속성을 바꿔줄 필요가 있다. 인스펙터에서 Codegen을 <b class="heavy">Manual/None</b>으로 바꿔주자.
<br/>

<img src="/images/createManagedObjectImage.png"/>

### 그 후 위 사진과 같이 Editor에서 <b class="heavy">Create NSManagedObejct Subclass...</b> 버튼을 눌러 클래스 파일을 생성해준다.
### 그럼 우리가 생성했던 Entity의 extension을 xcode가 자동으로 만들어준다.
### 마지막으로 <b class="heavy">CoreDataManager</b> 파일을 만들어 get, set, delete 등의 기능을 추가해 주면 끝이다.
### 아래는 <b class="heavy">CoreDataManager</b> 파일의 소스코드이다.


```swift
import UIKit
import CoreData

enum CoreDataName: String {
    case entity = "Entity"
}

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    // MARK: - 해당 정보를 저장한다
    func saveEntity(id: Int16, name: String, completion: @escaping (Bool) -> Void) {
        guard let context = self.context,
              let entity = NSEntityDescription.entity(forEntityName: CoreDataName.entity.rawValue, in: context)
        else { return }
        
        guard let Entity = NSManagedObject(entity: entity, insertInto: context) as? Entity else { return }
        
        Entity.id = id
        Entity.string = name
        
        do {
            try context.save()
            completion(true)
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    // MARK: - 해당 정보를 가져온다.
    func getEntity(ascending: Bool = false) -> [Entity]{
        var models: [Entity] = [Entity]()
        
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: CoreDataName.entity.rawValue)
            fetchRequest.sortDescriptors = [idSort]
            
            do{
                if let fetchResult: [Entity] = try context.fetch(fetchRequest) as? [Entity] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("Could not fetch: \(error), \(error.userInfo)")
            }
        }
        return models
    }
    // MARK: - 해당 정보를 삭제한다.
    func deleteEntity(id: Int16, onSuccess: @escaping ((Bool) -> Void)) {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: CoreDataName.entity.rawValue)
        do {
            if let results: [Entity] = try context!.fetch(fetchRequest) as? [Entity] {
                if results.count != 0 {
                    context?.delete(results[Int(id)])
                }
            }
        } catch let error as NSError {
            print("Could not fatch🥺: \(error), \(error.userInfo)")
            onSuccess(false)
        }
        contextSave { success in
            onSuccess(success)
        }
    }
}

extension CoreDataManager {
    fileprivate func filteredRequest(id: Int16) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
            = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataName.entity.rawValue)
        fetchRequest.predicate = NSPredicate(format: "index = %@", NSNumber(value: id))
        return fetchRequest
    }
    
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Could not save🥶: \(error), \(error.userInfo)")
            onSuccess(false)
        }
    }
}

```
<br/>

<img src="/images/coreDataCodeImage.png"/>

### 코드를 테스트해보면 잘 작동하는 것을 확인할 수 있다.
### <b class="heavy">CoreData</b>는 딕셔너리로 관리되는 <b class="heavy">UserDefaults</b>와는 달리 데이터베이스가 기반이기 때문에 더 복잡하고 큰 객체를 다룰때 용이하게 사용될 것 같다.

## 참고자료
<ul>
<li>
    <a href="https://hyerios.tistory.com/8">hyerios tistory blog</a>
</li>
<li>
    <a href="https://zeddios.tistory.com/987">ZeddiOS</a>
</li>
</ul>
