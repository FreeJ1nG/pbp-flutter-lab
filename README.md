# Counter 7 (Tugas 7)

## Stateless and Stateful Widgets
Stateful widget is a widget that can change when a user interacts with it, whereas a stateless widget never changes. Icon, IconButton, and Text are examples of stateless widgets.

## Widgets
The following widgets were used for the creation of this app:
- `Scaffold`, visual layout structure
- `AppBar`, used alongside scaffold, acts as a toolbar
- `Center`, centers the content
- `Row`, creates a Row layout (Left to right)
- `Column`, creates a column layout (Top to bottom)
- `Text`, a text widget
- `TextStyle`, applies style to text
- `Spacer`, inserts a div/box that expands to the max capacity
- `FloatingActionButton`, creates a floating action button
- `FloatingActionButton`, specifies the location of a floationg action button

## `setState()`
`setState()` function notifies the framework that the internal state of the object has changed. It causes the framework to schedule a build for this State object. The variables that are affected by `setState()` depends on what variable you pass inside the `setState()` function.

## `const` and `final`
`const` and `final` are both immutable at its core. The difference is that the variable declared using `const` must have its value known at compile-time, whilst `final` must have its value known at run-time.

## Implementation
I made a `FloatingActionButton` widget that consists of a `Row` widget, which elements are ordered by the `MainAxisAlignment.spaceBetween` property.

The `Row` widget will now have 2 elements, the decrement button and increment button, each of which will be placed on the extremes of the `Row` (left and rightside).

Add a `Column` widget for displaying wether the number displayed is odd or even, this can be done with a `Text` widget and a simple ternary operator as follow `_counter % 2 == 0 ? 'GENAP' : 'GANJIL'`.

For the bonus assignment, we shall add a ternary operator on the decrement button, such as `_counter % 2 == 0 ? [Show Decrement Button] : Spacer()`. `Spacer` is a widget that expands so that our increment button stays on the right.

# Flutter Form (Tugas 8)

## `Navigator.push` and `Navigator.pushReplacement`

When we use `push()`, we're pushing the new route into the stack. If we use `pushReplacement()` instead, we're replacing the top of the stack with the new route. In essence, using `pushReplacement()` would not go back to the previous page when `navigator.pop()` is called, but `push()` would still be able to do that, since the previous route is still in the stack.

## Widgets used

The widgets I used were `Form` widgets, such as `TextFormField`, `DropdownButtonFormField`, and other widgets for styling purposes such as `BoxStyle` and `TextStyle`. `TextFormField` provides a way for users to input for submission purposes. Some general layout widgets were also used, like `Padding`, `Container`, `SizedBox`, and so on.

## Types of events
- `onPressed`, an event that is triggered when a widget is pressed
- `onChanged`, an event that is triggered when a value of an input field is changed
- `onSaved`, an event that is triggered on file save
- `onTap`, handles on click event
- ...

## How Navigator works

When we navigate to another screen, we use the push methods and Navigator widget adds the new screen onto the top of the stack. Naturally, the pop methods would remove that screen from the stack.

## Implementation

1. I made A new `drawer.dart` file specifying a reusable drawer widget

2. Make a form that accepts String `title`, int `nominal`, String `transactionType` and date as the inputs in `tambah_budget.dart`.

3. Make a `Transaction` class in `models/transaction_data.dart`

```dart
class Transaction {
  String? title;
  num? nominal;
  String? transactionType;
  DateTime? date;

  Transaction(this.title, this.nominal, this.transactionType, this.date);
}
```

4. Pass `transactions` and `saveTransaction` to each of the widgets.

5. Show the data in `transactions` in `data.dart`

6. Style and decorate

# Flutter Web Service Integration (Tugas 9)

## Is JSON models necessary
No it is not necessary since you could serialize JSON inline by using the `json.decode()` function. Creating a factory function inside a model to parse the JSON object just makes for an easier experience of fetching data.

## Widgets
I moved the drawer widget to `drawer.dart` to make it more accessible to the other files, I also seperated the pages into a `pages` file, the components (such as drawer) to a `components` file, and the fetch logic (such as `fetchWatchlist`) to an `api` file.

## How to get JSON
First of all you just pass the url to the API. Once the response is received, you essentially get a JSON object in the form of a string. To actually process the string, you need to convert it back into JSON format, which you could do using the `json.decode()` function. Once you do that, you can access each of the key values of the JSON object.

## Implementation
Adding a new page is pretty much the same, just add a new ListTile to the drawer widget.
For the `watchlist_data.dart`, I just grabbed the data from https://andrew-pbp-tugas2.herokuapp.com/mywatchlist/json/ which contains the data I made on Tugas 3. Once I decoded the data, I then create a local variable that stores all the data. When I tap a certain movie, I redirect the page to the details page which I passed a certain context beforehand so that it displays the appropriate information.