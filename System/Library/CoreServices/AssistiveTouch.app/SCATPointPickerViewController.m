@interface SCATPointPickerViewController
- (Class)classForPointPickerView;
- (NSString)prompt;
- (SCATMenu)menu;
- (SCATPointPickerView)pointPickerView;
- (SCATPointPickerViewController)init;
- (SCATPointPickerViewController)initWithElementManager:(id)a3 menu:(id)a4;
- (int64_t)pickerType;
- (unsigned)currentDisplayID;
- (void)dealloc;
- (void)loadView;
- (void)menuWillAppear:(id)a3;
- (void)menuWillDisappear:(id)a3;
- (void)setCurrentDisplayID:(unsigned int)a3;
- (void)setMenu:(id)a3;
- (void)setPrompt:(id)a3;
- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
@end

@implementation SCATPointPickerViewController

- (SCATPointPickerViewController)init
{
  return -[SCATPointPickerViewController initWithElementManager:menu:]( self,  "initWithElementManager:menu:",  0LL,  0LL,  _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATPointPicker.m",  220LL,  "-[SCATPointPickerViewController init]",  @"Should call -initWithMenu: instead.").n128_f64[0]);
}

- (SCATPointPickerViewController)initWithElementManager:(id)a3 menu:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATPointPickerViewController;
  v8 = -[SCATElementManagerViewController initWithElementManager:](&v11, "initWithElementManager:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_menu, a4);
    -[SCATMenu registerMenuObserver:](v9->_menu, "registerMenuObserver:", v9);
    v9->_currentDisplayID = 1;
  }

  return v9;
}

- (void)loadView
{
  id v3 = objc_alloc_init(-[SCATPointPickerViewController classForPointPickerView](self, "classForPointPickerView"));
  [v3 setAutoresizingMask:18];
  -[SCATPointPickerViewController setView:](self, "setView:", v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATPointPickerViewController;
  -[SCATPointPickerViewController dealloc](&v3, "dealloc");
}

- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController view](self, "view"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  unsigned int v16 = [v6 _accessibilityDisplayId];
  if (v16 <= 1) {
    uint64_t v17 = 1LL;
  }
  else {
    uint64_t v17 = v16;
  }
  self->_currentDisplayID = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController pointPicker](self, "pointPicker"));
  [v18 setCurrentDisplayID:v17];

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SCATPointPickerViewController;
  -[SCATElementManagerViewController willPresentWithDisplayContext:animated:]( &v19,  "willPresentWithDisplayContext:animated:",  v6,  v4);
}

- (SCATPointPickerView)pointPickerView
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController view](self, "view"));
  objc_opt_class(&OBJC_CLASS___SCATPointPickerView, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) == 0) {
    *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATPointPicker.m",  286LL,  "-[SCATPointPickerViewController pointPickerView]",  @"The view for a SCATPointPickerViewController must be a kind of SCATPointPickerView.").n128_u64[0];
  }
  return (SCATPointPickerView *)-[SCATPointPickerViewController view](self, "view", v7);
}

- (void)setPrompt:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 setPrompt:v4];
}

- (NSString)prompt
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController pointPickerView](self, "pointPickerView"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 prompt]);

  return (NSString *)v3;
}

- (Class)classForPointPickerView
{
  return (Class)objc_opt_class(&OBJC_CLASS___SCATPointPickerView, a2);
}

- (void)menuWillAppear:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000A8784;
  v3[3] = &unk_100121D18;
  v3[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.15);
}

- (void)menuWillDisappear:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000A881C;
  v3[3] = &unk_100121D18;
  v3[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.15);
}

- (SCATMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (unsigned)currentDisplayID
{
  return self->_currentDisplayID;
}

- (void)setCurrentDisplayID:(unsigned int)a3
{
  self->_currentDisplayID = a3;
}

- (void).cxx_destruct
{
}

- (int64_t)pickerType
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SCATPointPickerViewController, a2);
  NSRequestConcreteImplementation(self, a2, v4);
  return 0LL;
}

@end