# auto-vscode


自动生成vscode配置文件，包括：
```
c_cpp_properties.json
launch.json
settings.json
tasks.json
```

将脚本移至`/usr/local/bin`：
```bash
mv vscode.sh /usr/local/bin
sudo chmod +x /usr/local/bin/vscode.sh
```

创建别名：
```bash
vim ~/.bashrc
```

添加以下内容：
```bash
alias vscode="/usr/local/bin/vscode.sh"
```

生效：
```bash
source ~/.bashrc
```

使用方法：
```bash
vscode g++
```

然后就可以使用`F5`调试运行C++代码啦。







