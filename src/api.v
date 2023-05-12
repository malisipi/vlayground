module main

import net.http
import json

struct PlayResp {
	output string
//	buildOutput string
	error string
}

fn playground_run(host string, code string) PlayResp {
	form := http.post_form("https://"+host, {"code":code}) or { return PlayResp{error:"No Internet Connection"} }
	return json.decode(PlayResp, form.body) or {PlayResp{error:"JSON Decode Error"}}
}