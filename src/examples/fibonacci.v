fn fib(n int) u64 {
	// To define a array of specific type,
    //  use the following syntax.
	// Here we define an array of int
    //  with the length of n + 2.
	mut f := []u64{len: n + 2}
	f[0] = 0
	f[1] = 1

	for i := 2; i <= n; i++ {
	    f[i] = f[i - 1] + f[i - 2]
	}

	return f[n]
}

// main function is the entry point
//  of the program.
fn main() {
	for i in 0 .. 6 {
	    println(fib(i))
	}
}
