module main

import malisipi.mui

fn run_code(event_details mui.EventDetails, mut app &mui.Window, mut app_data &AppData){
    unsafe {
        code := app.get_object_by_id("code")[0]["text"].str.replace("\0","")
        resp := playground_run(app_data.host, code)
        if resp.error.len > 1 {
        	$if android || android_mode? {
	        	app.create_dialog(typ: "messagebox", message: resp.error, title: "Error")
		} $else {
			mui.messagebox("Vlayground - Error", resp.error, "ok", "error")
		}
        } else {
        	$if android || android_mode? {
			app.create_dialog(typ: "messagebox", message: resp.output, title: "Output")
		} $else {
			mui.messagebox("Vlayground - Output", resp.output, "ok", "info")
		}
        }
    }
}

fn load_code(event_details mui.EventDetails, mut app &mui.Window, mut app_data &AppData){
    unsafe {
        app.get_object_by_id("code")[0]["text"].str = 
            example_codes[event_details.value.to_lower().replace(" ", "_")]
    }
}

fn main(){
    mut app_data := AppData{}
    window_width := $if android || android_mode? { 405 } $else { 800 }
    window_height := $if android || android_mode? { 720 } $else { 600 }
    mut window := mui.create(title: "Vlayground", draw_mode: .system_native, width: window_width, height: window_height, app_data: &app_data)
    window.label(id: "app_name", text: "Vlayground", x: 0, y: 0, width: "100%x -30", height:30, text_align: 0)
    window.button(id: "run", text:"▶️", icon:true, x: "# 0", y: 0, width: 30, height: 30, onclick: run_code)
    window.selectbox(id: "example", text: codes_list[0], list: codes_list, x: 0, y: 30, width: "50%x", height: "30", onchange: load_code)
    window.selectbox(id: "host", text: app_data.host, list: host_urls, x: "# 0", y: 30, width: "50%x", height: "30")
    window.textarea(id: "code", x: 0, y: 60, width: "100%x -15", height: "100%y -60" codefield: true, text: example_codes["welcome"])
    window.scrollbar(id: "code_scroll", x: "# 0", y: 60, width: 15, height: "100%y -60", connected_widget: window.get_object_by_id("code")[0], vertical: true)
    window.run()
}
