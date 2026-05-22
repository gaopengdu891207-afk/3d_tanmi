extends Node
# 调用本地python执行脚本
func call_python():
	var out = []
	# 路径根据自己电脑修改
	var cmd = "python"
	var args = ["test.py","参数1"]
	OS.execute(cmd, args, out, true)
	print("返回结果：",out)
