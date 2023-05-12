module main

// Consts
const (
    codes_list = ["Welcome", "String Interpolation", "Fibonacci", "Structs"]
    example_codes = {
        "welcome": $embed_file("examples/welcome.v").to_string()
        "string_interpolation":$embed_file("examples/string_interpolation.v").to_string()
        "fibonacci":$embed_file("examples/fibonacci.v").to_string()
        "structs":$embed_file("examples/structs.v").to_string()
    }
    host_urls = ["play.vlang.io/run", "play.vosca.dev/run"]
)

struct AppData {
    host string = host_urls[0]
}