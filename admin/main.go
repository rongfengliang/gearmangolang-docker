package main

import (
	"encoding/json"
	"fmt"
	"net"

	"github.com/appscode/g2/gearadmin"
)

func main() {
	c, err := net.Dial("tcp", "app:4730")
	if err != nil {
		panic(err)
	}
	defer c.Close()
	admin := gearadmin.NewGearmanAdmin(c)
	status, _ := admin.Status()
	datas, _ := json.Marshal(status)
	//fmt.Printf("%#v\n", status)
	fmt.Printf("%#v\n", string(datas))

}
