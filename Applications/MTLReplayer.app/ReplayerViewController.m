@interface ReplayerViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)setColorPixelFormat:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDisplayTextureEncoder:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation ReplayerViewController

- (void)loadView
{
  id v3 = objc_msgSend( objc_alloc((Class)MTKView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[ReplayerViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ReplayerViewController;
  -[ReplayerViewController viewDidLoad](&v5, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  [v3 setBackgroundColor:v4];

  self->_orientationMask = 30LL;
}

- (void)setDevice:(id)a3
{
  id v10 = a3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    -[ReplayerViewController loadView](self, "loadView");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
    [v4 setDevice:v10];
    [v4 setColorPixelFormat:81];
    [v4 setPaused:1];
    [v4 setAutoResizeDrawable:1];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v5 bounds];
    objc_msgSend(v4, "setBounds:");

    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
    [v6 setColorspace:CGColorSpaceCreateWithName(kCGColorSpaceSRGB)];
    v7 = -[Renderer initWithMetalKitView:](objc_alloc(&OBJC_CLASS___Renderer), "initWithMetalKitView:", v4);
    renderer = self->_renderer;
    self->_renderer = v7;

    v9 = self->_renderer;
    [v4 drawableSize];
    -[Renderer mtkView:drawableSizeWillChange:](v9, "mtkView:drawableSizeWillChange:", v4);
    [v4 setDelegate:self->_renderer];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006850;
    block[3] = &unk_10000C7E0;
    block[4] = self;
    id v12 = v10;
    dispatch_sync(&_dispatch_main_q, block);
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)setDisplayTextureEncoder:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 device]);
  [v6 setDevice:v5];

  -[Renderer setDisplayTextureEncoder:](self->_renderer, "setDisplayTextureEncoder:", v4);
  [v6 draw];
}

- (void)setOrientation:(int64_t)a3
{
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    else {
      unint64_t v5 = qword_1000080D8[a3 - 1];
    }
    self->_orientationMask = v5;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100006848;
    v6[3] = &unk_10000C830;
    v6[4] = self;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v6);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000683C;
    block[3] = &unk_10000C808;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (unint64_t)supportedInterfaceOrientations
{
  return self->_orientationMask;
}

- (void)setColorPixelFormat:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
  [v4 setColorPixelFormat:a3];
}

- (void).cxx_destruct
{
}

@end