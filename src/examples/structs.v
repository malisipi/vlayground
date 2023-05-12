struct Size {
// mut keyword is used
//  to define mutable fields
// pub keyword is used
//  to define public fields
//
// By default, all fields are
//  private and immutable.
pub mut:
	width  int
	height int
}

// Structs can have methods.
fn (s &Size) area() int {
	return s.width * s.height
}

// Structs can be embedded in other structs.
struct Button {
	Size
	title string
}

mut button := Button{
	title: 'Click me'
	height: 2
}

button.width = 3

// With embedding, the struct Button
//  will automatically have get all the
//   fields and methods from the struct
//    Size, which allows you to do:
assert button.area() == 6
// If you need to access embedded
//  structs directly, use an explicit
//   reference like `button.Size`:
assert button.Size.area() == 6
// Conceptually, embedded structs are
//  similar to mixins in OOP,
//   not base classes.

println(button)
