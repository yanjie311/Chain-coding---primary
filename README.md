# Chain-coding---primary
* 只是在工程中写了`.h` 和 `.m`文件，如果想用链式编程创建按钮直接把文件拖入工程引入头文件调用即可，我们可以定义上下和左右结构的按钮，具体的调用参照下面的代码：

```
WYJLinkerButton* sender1 = [WYJLinkerButton creatButton:CGRectMake(100, 100, 100, 100)];
    sender1.ImageEdgInsets(20,0,60,60)
    .TitleEdgInsets(0,63,100,23)
    .ImagePrams(@"newcreate_click.png",1)
    .TitlePrams(@"你好", 17, [UIColor grayColor], 1)
    .ClickAction(sender1);
    [self.view addSubview:sender1];
```
