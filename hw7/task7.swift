//Создание проекта с использованием MVVM
//Создадим модели данных:
struct Friend {let name: Stringlet age: Int}
struct Group {let name: Stringlet members: [Friend]}
struct Photo {let title: Stringlet imageURL: String}
//Представления (Views): определю классы представлений.
class FriendListView {func displayFriends(_ friends: [Friend]) {for friend in friends {print("Name: (friend.name), Age: (friend.age)")}}}
class GroupListView {func displayGroups(_ groups: [Group]) {for group in groups {print("Group Name: (group.name)")for member in group.members {print("Member: (member.name)")}}}}
class PhotoView {func displayPhoto(_ photo: Photo) {print("Title: (photo.title), ImageURL: (photo.imageURL)")}}
//Модели представлений (ViewModels):
class FriendListViewModel {var friends: [Friend] = []
func fetchFriends() {
// Загрузка списка друзей из сети
friends = DataService.shared.fetchFriendsFromNetwork()
}

}
class GroupListViewModel {var groups: [Group] = []
func fetchGroups() {
// Загрузка списка групп из сети
groups = DataService.shared.fetchGroupsFromNetwork()
}

}
class PhotoViewModel {var photo: Photo
init(photo: Photo) {
self.photo = photo
}

}
//Рефакторинг кода После создания базовой структуры проекта, важно провести рефакторинг кода с учетом принципов SOLID.
//Например, вынесем логику получения данных из ViewModel в отдельный сервис.class DataService {static let shared = DataService()
func fetchFriendsFromNetwork() -> [Friend] {
// Здесь должен быть код для получения списка друзей из сети
return [Friend(name: "John", age: 30), Friend(name: "Alice", age: 25)]
}
func fetchGroupsFromNetwork() -> [Group] {
// Здесь должен быть код для получения списка групп из сети
let friend1 = Friend(name: "John", age: 30)
let friend2 = Friend(name: "Alice", age: 25)

return [Group(name: "Family", members: [friend1, friend2])]
}

}
//Подключение SwiftLintЧтобы подключить SwiftLint к проекту, установите его через CocoaPods и добавьте скрипт запуска в ваш проект.
//После этого запустите SwiftLint и исправьте все ошибки и предупреждения.
//Покрытие кода тестами
class ViewModelTests: XCTestCase {
func testFetchFriends() {
let viewModel = FriendListViewModel()
viewModel.fetchFriends()
XCTAssertFalse(viewModel.friends.isEmpty)
}

func testFetchGroups() {
let viewModel = GroupListViewModel()
viewModel.fetchGroups()
XCTAssertFalse(viewModel.groups.isEmpty)
}

}
// UI-тесты для проверки отображения данных на экране
