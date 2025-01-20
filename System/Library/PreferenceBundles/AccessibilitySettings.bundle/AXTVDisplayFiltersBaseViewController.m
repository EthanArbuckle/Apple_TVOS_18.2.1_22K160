@interface AXTVDisplayFiltersBaseViewController
+ (CGSize)preferredPreviewImageSize;
- (TSKPreviewViewController)axPreviewViewController;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)setAxPreviewViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTVDisplayFiltersBaseViewController

+ (CGSize)preferredPreviewImageSize
{
  double v2 = 644.0;
  double v3 = 362.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVDisplayFiltersBaseViewController;
  -[AXTVDisplayFiltersBaseViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVDisplayFiltersBaseViewController;
  -[AXTVDisplayFiltersBaseViewController viewDidLoad](&v5, "viewDidLoad");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_339D4,  kAXSInvertColorsEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_super v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v4,  self,  (CFNotificationCallback)sub_339D4,  kMADisplayFilterSettingsChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_axPreviewViewController)
  {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    axPreviewViewController = self->_axPreviewViewController;
    self->_axPreviewViewController = v5;

    v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"DisplayFilterPreview",  v8));

    v10 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v9);
    [(id)objc_opt_class(self) preferredPreviewImageSize];
    -[UIImageView setBounds:](v10, "setBounds:", 0.0, 0.0, v11, v12);
    -[TSKPreviewViewController setContentView:animated:]( self->_axPreviewViewController,  "setContentView:animated:",  v10,  0LL);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVDisplayFiltersBaseViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
  if (![v14 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVDisplayFiltersBaseViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 localizedDescription]);

    v14 = (void *)v16;
  }

  -[TSKPreviewViewController setDescriptionText:](self->_axPreviewViewController, "setDescriptionText:", v14);
  v17 = self->_axPreviewViewController;

  return v17;
}

- (TSKPreviewViewController)axPreviewViewController
{
  return self->_axPreviewViewController;
}

- (void)setAxPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end