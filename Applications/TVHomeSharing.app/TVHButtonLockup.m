@interface TVHButtonLockup
+ (id)_contentViewWithLockupLayout:(id)a3;
+ (id)_titledButtonLockup;
+ (id)moreButtonLockup;
+ (id)moreContextMenuButtonLockupWithDataSource:(id)a3;
+ (id)playOrResumeVideoButtonLockupWithPlayedState:(unint64_t)a3;
+ (id)playOrResumeVideoButtonLockupWithPlayedState:(unint64_t)a3 existingButtonLockupLockup:(id)a4;
+ (id)playVideoButtonLockup;
+ (id)playVideoButtonTitle;
+ (id)resumeVideoButtonLockup;
+ (id)resumeVideoButtonTitle;
+ (id)seasonsButtonLockup;
+ (id)shuffleButtonLockup;
- (NSString)title;
- (TVHButtonLockup)initWithButtonLayout:(id)a3;
- (TVHButtonLockup)initWithLayout:(id)a3;
- (UIColor)titleTextColor;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation TVHButtonLockup

- (TVHButtonLockup)initWithLayout:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHButtonLockup)initWithButtonLayout:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHButtonLockup;
  v3 = -[TVHLockup initWithLayout:](&v8, "initWithLayout:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](v3, "_buttonLockupContentView"));
    [v5 focusedSizeIncrease];
    v7.receiver = v4;
    v7.super_class = (Class)&OBJC_CLASS___TVHButtonLockup;
    -[TVHLockup setFocusedSizeIncrease:](&v7, "setFocusedSizeIncrease:");
  }

  return v4;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](self, "_buttonLockupContentView"));
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](self, "_buttonLockupContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](self, "_buttonLockupContentView"));
  [v5 setTitle:v4];
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](self, "_buttonLockupContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 title]);

  return (NSString *)v3;
}

- (void)setTitleTextColor:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](self, "_buttonLockupContentView"));
  [v5 setTitleTextColor:v4];
}

- (UIColor)titleTextColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup _buttonLockupContentView](self, "_buttonLockupContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 titleTextColor]);

  return (UIColor *)v3;
}

+ (id)_contentViewWithLockupLayout:(id)a3
{
  id v3 = a3;
  id v4 = -[TVHButtonLockupContentView initWithButtonLayout:]( objc_alloc(&OBJC_CLASS___TVHButtonLockupContentView),  "initWithButtonLayout:",  v3);

  return v4;
}

+ (id)shuffleButtonLockup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _titledButtonLockup]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"shuffle"));
  [v2 setImage:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"SHUFFLE_TITLE" value:0 table:0]);
  [v2 setTitle:v5];

  return v2;
}

+ (id)moreButtonLockup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _titledButtonLockup]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"ellipsis"));
  [v2 setImage:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"MORE_TITLE" value:0 table:0]);
  [v2 setTitle:v5];

  return v2;
}

+ (id)moreContextMenuButtonLockupWithDataSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___TVHButtonLockupLayout);
  -[TVHButtonLockupLayout setType:](v4, "setType:", 1LL);
  id v5 = -[TVHContextMenuButtonLockup initWithButtonLayout:]( objc_alloc(&OBJC_CLASS___TVHContextMenuButtonLockup),  "initWithButtonLayout:",  v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"ellipsis"));
  -[TVHButtonLockup setImage:](v5, "setImage:", v6);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"MORE_TITLE" value:0 table:0]);
  -[TVHButtonLockup setTitle:](v5, "setTitle:", v8);

  -[TVHContextMenuButtonLockup setDataSource:](v5, "setDataSource:", v3);
  return v5;
}

+ (id)seasonsButtonLockup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _titledButtonLockup]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"rectangle.fill.on.rectangle.fill"));
  [v2 setImage:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"SEASONS_BUTTON_TITLE" value:0 table:0]);
  [v2 setTitle:v5];

  return v2;
}

+ (id)playVideoButtonLockup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _titledButtonLockup]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"play.fill"));
  [v3 setImage:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 playVideoButtonTitle]);
  [v3 setTitle:v5];

  return v3;
}

+ (id)resumeVideoButtonLockup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _titledButtonLockup]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"play.fill"));
  [v3 setImage:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 resumeVideoButtonTitle]);
  [v3 setTitle:v5];

  return v3;
}

+ (id)playOrResumeVideoButtonLockupWithPlayedState:(unint64_t)a3
{
  if (a3 == 2) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 resumeVideoButtonLockup]);
  }
  else {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 playVideoButtonLockup]);
  }
  return v3;
}

+ (id)playOrResumeVideoButtonLockupWithPlayedState:(unint64_t)a3 existingButtonLockupLockup:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (a3 == 2) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 resumeVideoButtonTitle]);
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 playVideoButtonTitle]);
    }
    v9 = (void *)v7;
    [v6 setTitle:v7];
    id v8 = v6;
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([a1 playOrResumeVideoButtonLockupWithPlayedState:a3]);
  }

  return v8;
}

+ (id)playVideoButtonTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"PLAY_VIDEO_BUTTON_TITLE" value:0 table:0]);

  return v3;
}

+ (id)resumeVideoButtonTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"RESUME_VIDEOBUTTON_TITLE" value:0 table:0]);

  return v3;
}

+ (id)_titledButtonLockup
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVHButtonLockupLayout);
  -[TVHButtonLockupLayout setType:](v2, "setType:", 1LL);
  id v3 = -[TVHButtonLockup initWithButtonLayout:](objc_alloc(&OBJC_CLASS___TVHButtonLockup), "initWithButtonLayout:", v2);

  return v3;
}

@end