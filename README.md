# TCCarouselView

**TCCarouselView** 一个使用基于UICollectionView的简易无限轮播的功能组件，没有过于冗余的功能，十分轻量级。

## TCCarouselView的使用
在需要用到的地方 `#import <TCCarouselView.h>`

在需要集成轮播视图的界面中创建UI：

```Objective-C
// 创建只需要alloc init
TCCarouselView *carouselView = [[TCCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 3)];
self.carouselView = carouselView;
// 设置代理，目的是点击跳转
self.carouselView.delegate = self;
// 设置图片URL数组，可以是本地的路径，也可以网路URL
self.carouselView.imageUrls = array;
[self.view addSubview:self.carouselView];
```

## 安装
1. CocoaPods安装：
```
pod 'TCCarouselView' 
```
2. 下载ZIP包,解压后将`TCCarouselView`资源文件拖到工程中。

## 其他
为了不影响您项目中导入的其他第三方库，本库没有依赖任何其他框架，可以放心使用。
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果您有什么建议可以Issues我，谢谢
* 后续我会持续更新，为它添加更多的功能，欢迎star :)

