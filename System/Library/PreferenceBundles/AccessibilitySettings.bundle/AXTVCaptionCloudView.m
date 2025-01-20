@interface AXTVCaptionCloudView
+ (CGSize)preferredSize;
- (AXTVCaptionCloudView)initWithFrame:(CGRect)a3;
- (id)_cloudImageForIndex:(unint64_t)a3;
- (id)_cloudImageSequence;
- (id)_subtitleImageWithText:(id)a3 size:(CGSize)a4;
- (id)currentSlide;
- (id)nextSlide;
- (void)_startBackgroundAnimation;
- (void)_stopBackgroundAnimation;
- (void)_updateSubtitleImage;
- (void)appearanceSettingsChanged:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)showNextImage;
@end

@implementation AXTVCaptionCloudView

+ (CGSize)preferredSize
{
  double v2 = 644.0;
  double v3 = 362.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (AXTVCaptionCloudView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___AXTVCaptionCloudView;
  double v3 = -[AXTVCaptionCloudView initWithFrame:]( &v35,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AXTVCaptionCloudView bounds](v3, "bounds");
    CGRect v37 = CGRectInset(v36, -20.0, -20.0);
    double x = v37.origin.x;
    double y = v37.origin.y;
    double width = v37.size.width;
    double height = v37.size.height;
    v9 = objc_alloc(&OBJC_CLASS___UIImageView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView _cloudImageForIndex:](v4, "_cloudImageForIndex:", 0LL));
    v11 = -[UIImageView initWithImage:](v9, "initWithImage:", v10);
    cloudView1 = v4->_cloudView1;
    v4->_cloudView1 = v11;

    -[UIImageView setFrame:](v4->_cloudView1, "setFrame:", x, y, width, height);
    v13 = objc_alloc(&OBJC_CLASS___UIImageView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView _cloudImageForIndex:](v4, "_cloudImageForIndex:", 1LL));
    v15 = -[UIImageView initWithImage:](v13, "initWithImage:", v14);
    cloudView2 = v4->_cloudView2;
    v4->_cloudView2 = v15;

    -[UIImageView setFrame:](v4->_cloudView2, "setFrame:", x, y, width, height);
    v17 = objc_alloc(&OBJC_CLASS___UIView);
    -[AXTVCaptionCloudView bounds](v4, "bounds");
    v18 = -[UIView initWithFrame:](v17, "initWithFrame:");
    cloudContainer = v4->_cloudContainer;
    v4->_cloudContainer = v18;

    -[UIView setClipsToBounds:](v4->_cloudContainer, "setClipsToBounds:", 1LL);
    -[UIView addSubview:](v4->_cloudContainer, "addSubview:", v4->_cloudView1);
    -[UIView addSubview:](v4->_cloudContainer, "addSubview:", v4->_cloudView2);
    -[AXTVCaptionCloudView addSubview:](v4, "addSubview:", v4->_cloudContainer);
    -[UIView setIsAccessibilityElement:](v4->_cloudContainer, "setIsAccessibilityElement:", 1LL);
    v20 = v4->_cloudContainer;
    id v28 = AXTVLocString( @"subtitle.preview.label.spoken",  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)v35.receiver);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[UIView setAccessibilityLabel:](v20, "setAccessibilityLabel:", v29);

    -[UIView setAccessibilityTraits:](v4->_cloudContainer, "setAccessibilityTraits:", UIAccessibilityTraitImage);
    v30 = objc_alloc(&OBJC_CLASS___UIImageView);
    -[AXTVCaptionCloudView bounds](v4, "bounds");
    v31 = -[UIImageView initWithFrame:](v30, "initWithFrame:");
    subtitleView = v4->_subtitleView;
    v4->_subtitleView = v31;

    -[AXTVCaptionCloudView addSubview:](v4, "addSubview:", v4->_subtitleView);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v33 addObserver:v4 selector:"appearanceSettingsChanged:" name:kMACaptionAppearanceSettingsChangedNotification object:0];
    [v33 addObserver:v4 selector:"appearanceSettingsChanged:" name:kFigSubtitleRendererNotification_NeedsLayout object:0];
  }

  return v4;
}

- (void)dealloc
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[AXTVCaptionCloudView _stopBackgroundAnimation](self, "_stopBackgroundAnimation");
  subtitleRenderer = self->_subtitleRenderer;
  if (subtitleRenderer) {
    CFRelease(subtitleRenderer);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVCaptionCloudView;
  -[AXTVCaptionCloudView dealloc](&v5, "dealloc");
}

- (void)didMoveToWindow
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView window](self, "window"));

  if (v3)
  {
    self->_shouldHandleUpdates = 1;
    -[AXTVCaptionCloudView _updateSubtitleImage](self, "_updateSubtitleImage");
    -[AXTVCaptionCloudView _startBackgroundAnimation](self, "_startBackgroundAnimation");
  }

  else
  {
    self->_shouldHandleUpdates = 0;
  }

- (id)nextSlide
{
  unint64_t v2 = self->_viewIndex + 1;
  self->_viewIndedouble x = v2;
  double v3 = &OBJC_IVAR___AXTVCaptionCloudView__cloudView2;
  if ((v2 & 1) == 0) {
    double v3 = &OBJC_IVAR___AXTVCaptionCloudView__cloudView1;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)currentSlide
{
  if ((self->_viewIndex & 1) != 0) {
    unint64_t v2 = &OBJC_IVAR___AXTVCaptionCloudView__cloudView1;
  }
  else {
    unint64_t v2 = &OBJC_IVAR___AXTVCaptionCloudView__cloudView2;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (void)showNextImage
{
  unint64_t v3 = self->_cloudIndex + 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView _cloudImageSequence](self, "_cloudImageSequence"));
  self->_cloudIndedouble x = v3 % (unint64_t)[v4 count];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView nextSlide](self, "nextSlide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView currentSlide](self, "currentSlide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView _cloudImageForIndex:](self, "_cloudImageForIndex:", self->_cloudIndex));
  [v5 setImage:v7];

  [v5 setAlpha:1.0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_2469C;
  v14[3] = &unk_65530;
  id v15 = v5;
  id v8 = v5;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v14, 4.9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_24744;
  v12[3] = &unk_65530;
  id v13 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_24750;
  v10[3] = &unk_661F0;
  v10[4] = self;
  id v11 = v13;
  id v9 = v13;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v12,  v10,  1.0);
}

- (void)appearanceSettingsChanged:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_247FC;
  v3[3] = &unk_65530;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (id)_cloudImageForIndex:(unint64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView _cloudImageSequence](self, "_cloudImageSequence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);
  v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", v6, v8));

  return v9;
}

- (id)_cloudImageSequence
{
  if (qword_805C8 != -1) {
    dispatch_once(&qword_805C8, &stru_66210);
  }
  return (id)qword_805C0;
}

- (void)_startBackgroundAnimation
{
  if (!self->_cloudTimer)
  {
    unint64_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    cloudTimer = self->_cloudTimer;
    self->_cloudTimer = v3;

    dispatch_source_set_timer((dispatch_source_t)self->_cloudTimer, 0LL, 0x12A05F200uLL, 0LL);
    objc_initWeak(&location, self);
    objc_super v5 = self->_cloudTimer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_24A14;
    v6[3] = &unk_654A0;
    objc_copyWeak(&v7, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v5, v6);
    dispatch_resume((dispatch_object_t)self->_cloudTimer);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

- (void)_stopBackgroundAnimation
{
  cloudTimer = self->_cloudTimer;
  if (cloudTimer)
  {
    dispatch_source_cancel((dispatch_source_t)cloudTimer);
    v4 = self->_cloudTimer;
    self->_cloudTimer = 0LL;
  }

- (void)_updateSubtitleImage
{
  id v9 = AXTVLocString(@"AXCaptionExampleText", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[AXTVCaptionCloudView frame](self, "frame");
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCloudView _subtitleImageWithText:size:](self, "_subtitleImageWithText:size:", v10, v11, v12));

  -[UIImageView setImage:](self->_subtitleView, "setImage:", v14);
}

- (id)_subtitleImageWithText:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 scale];
  float v10 = v9;

  double y = CGRectZero.origin.y;
  v19.double width = width;
  v19.double height = height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v10);
  UIGraphicsGetCurrentContext();
  CFStringRef v17 = kCMTextMarkupAttribute_TextPositionPercentageRelativeToWritingDirection;
  v18 = &off_70268;
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  p_subtitleRenderer = &self->_subtitleRenderer;
  if (!*p_subtitleRenderer) {
    FigCoreTextSubtitleRendererCreate(kCFAllocatorDefault, p_subtitleRenderer);
  }
  FigSubtitleRendererDrawSubtitleTextDirect(CGRectZero.origin.x, y, width, height + -10.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v15;
}

- (void).cxx_destruct
{
}

@end