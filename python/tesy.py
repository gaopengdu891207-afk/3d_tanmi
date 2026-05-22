import sys

def main():
    # 接收Godot传参
    args = sys.argv[1:]
    print("Python收到参数：",args)
    
    # 检查参数是否存在
    if not args:
        print("错误：请提供一个数字参数")
        print("用法：python3 python/tesy.py <数字>")
        return
    
    # 运算/AI逻辑
    try:
        res = int(args[0]) * 2
        print(res)
    except ValueError:
        print("错误：参数必须是整数")

if __name__ == "__main__":
    main()