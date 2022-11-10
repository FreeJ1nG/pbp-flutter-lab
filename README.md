# Counter 7

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