package redis

import "core:fmt"
import "core:testing"

@(test)
TestParseArrayReply :: proc(t: ^testing.T) {
	data: string = "*1\r\n$1\r\na"

	reader := Reader_new(transmute([]byte)(data))
	rsp, err := reader->parse_recv()
	defer Resp_free(&rsp)
	fmt.printfln("rsp=%v, err=%v", rsp, err)
}
