
# State Manager

## Introduction

State Manager is a flexible and efficient state management solution for Flutter applications. It provides various types of state containers to handle different scenarios, from simple state management to asynchronous operations and persistent storage.

## Key Concepts

**1. StateContainer:** The core class for managing state and notifying listeners of changes.

**2. AsyncStateContainer:** Handles asynchronous state with built-in loading and error management.

**3. PersistentStateContainer:** Extends StateContainer to automatically persist state to local storage.

**4. ScopedStateContainer:**  Manages multiple StateContainers, each associated with a unique key.

**5. StateConsumer:** A widget that rebuilds when the state in a StateContainer changes.

**6. StateExtension:**  Provides convenient methods for watching and reading state in StatefulWidgets.

## Usage Examples

### Basic State management

```
// Create a StateContainer
final counterContainer = StateContainer<int>(0);

// Use StateConsumer to rebuild UI when state changes
StateConsumer<int>(
  container: counterContainer,
  builder: (context, count) => Text('Count: $count'),
)

// Update state
counterContainer.setState(counterContainer.state + 1);
```

### Asynchronous State Management

```
final userContainer = AsyncStateContainer<User>();

// Fetch user data
userContainer.setState(fetchUserData());

// Use StateConsumer to handle loading, error, and data states
StateConsumer<User?>(
  container: userContainer,
  builder: (context, user) {
    if (userContainer.isLoading) return CircularProgressIndicator();
    if (userContainer.error != null) return Text('Error: ${userContainer.error}');
    if (user == null) return Text('No user data');
    return Text('User: ${user.name}');
  },
)
```

### Persistent State

```
final themeContainer = PersistentStateContainer<String>(
  'light',
  key: 'app_theme',
  fromJson: (json) => json,
  toJson: (theme) => theme,
);

// The state will be automatically loaded from and saved to SharedPreferences
```

### Scoped State

```
final todoListsContainer = ScopedStateContainer<List<Todo>>();

// Get or create a container for a specific todo list
final workTodos = todoListsContainer.getContainer('work', []);
final personalTodos = todoListsContainer.getContainer('personal', []);
```

### Using StateExtension in StatefulWidgets

```
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final SimpleState<int> _counter;

  @override
  void initState() {
    super.initState();
    _counter = watchState(counterContainer);
  }

  @override
  Widget build(BuildContext context) {
    return Text('Count: ${_counter.value}');
  }
}
```

## Authors

- [@ankit-apk](https://github.com/ankit-apk)