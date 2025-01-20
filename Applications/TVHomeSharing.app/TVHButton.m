@interface TVHButton
+ (id)playMusicButton;
+ (id)playSlideshowButton;
+ (id)setScreenSaverButton;
+ (id)shuffleButton;
+ (id)sortButton;
+ (id)sortContextMenuButtonWithDataSource:(id)a3 delegate:(id)a4;
- (BOOL)_canHandlePresses:(id)a3;
- (CGRect)_contentFrame;
- (CGSize)_textLabelSizeWithMaxSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)symbolImageName;
- (NSString)text;
- (TVHButton)initWithFrame:(CGRect)a3;
- (UIImage)symbolImage;
- (UILabel)textLabel;
- (UIVisualEffectView)backgroundEffectView;
- (_UIFloatingContentView)floatingContentView;
- (unint64_t)_currentControlState;
- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateTextLabel;
- (void)_updateViewColors;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setBackgroundEffectView:(id)a3;
- (void)setFloatingContentView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSymbolImage:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVHButton

+ (id)playMusicButton
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVHButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"PLAY_MUSIC_BUTTON_TITLE" value:0 table:0]);
  -[TVHButton setText:](v2, "setText:", v4);

  -[TVHButton setSymbolImageName:](v2, "setSymbolImageName:", @"play.fill");
  return v2;
}

+ (id)shuffleButton
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVHButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"SHUFFLE_TITLE" value:0 table:0]);
  -[TVHButton setText:](v2, "setText:", v4);

  -[TVHButton setSymbolImageName:](v2, "setSymbolImageName:", @"shuffle");
  return v2;
}

+ (id)sortButton
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVHButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"SORT_TITLE" value:0 table:0]);
  -[TVHButton setText:](v2, "setText:", v4);

  return v2;
}

+ (id)sortContextMenuButtonWithDataSource:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___TVHSortContextMenuButton);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"SORT_TITLE" value:0 table:0]);
  -[TVHButton setText:](v7, "setText:", v9);

  -[TVHSortContextMenuButton setDataSource:](v7, "setDataSource:", v6);
  -[TVHSortContextMenuButton setDelegate:](v7, "setDelegate:", v5);

  return v7;
}

+ (id)playSlideshowButton
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVHButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"PLAY_SLIDESHOW_TITLE" value:0 table:0]);
  -[TVHButton setText:](v2, "setText:", v4);

  -[TVHButton setSymbolImageName:](v2, "setSymbolImageName:", @"play.fill");
  return v2;
}

+ (id)setScreenSaverButton
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVHButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"SET_AS_SCREENSAVER_TITLE" value:0 table:0]);
  -[TVHButton setText:](v2, "setText:", v4);

  return v2;
}

- (TVHButton)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHButton;
  v3 = -[TVHButton initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    floatingContentView = v3->_floatingContentView;
    v3->_floatingContentView = v4;

    -[_UIFloatingContentView setCornerRadius:](v3->_floatingContentView, "setCornerRadius:", 12.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v3->_floatingContentView, "setContinuousCornerEnabled:", 1LL);
    -[TVHButton addSubview:](v3, "addSubview:", v3->_floatingContentView);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIBlurEffect _effectWithStyle:invertAutomaticStyle:]( &OBJC_CLASS___UIBlurEffect,  "_effectWithStyle:invertAutomaticStyle:",  5001LL,  1LL));
    v7 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v6);
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = v7;

    -[UIVisualEffectView _setContinuousCornerRadius:](v3->_backgroundEffectView, "_setContinuousCornerRadius:", 12.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView visualEffectContainerView]( v3->_floatingContentView,  "visualEffectContainerView"));
    [v9 addSubview:v3->_backgroundEffectView];

    v10 = objc_alloc_init(&OBJC_CLASS___UILabel);
    textLabel = v3->_textLabel;
    v3->_textLabel = v10;

    v12 = v3->_textLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleFootnote));
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_textLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setMinimumScaleFactor:](v3->_textLabel, "setMinimumScaleFactor:", 0.7);
    -[UILabel setOpaque:](v3->_textLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v3->_textLabel, "setBackgroundColor:", 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v3->_floatingContentView, "contentView"));
    [v14 addSubview:v3->_textLabel];
  }

  return v3;
}

- (void)setSymbolImageName:(id)a3
{
  id v10 = a3;
  if (!-[NSString isEqualToString:](self->_symbolImageName, "isEqualToString:"))
  {
    v4 = (NSString *)[v10 copy];
    symbolImageName = self->_symbolImageName;
    self->_symbolImageName = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleFootnote));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:withConfiguration:",  self->_symbolImageName,  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 imageWithRenderingMode:2]);

    -[TVHButton setSymbolImage:](self, "setSymbolImage:", v9);
    -[TVHButton _updateTextLabel](self, "_updateTextLabel");
    -[TVHButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    text = self->_text;
    self->_text = v4;

    -[TVHButton _updateTextLabel](self, "_updateTextLabel");
    -[TVHButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton textLabel](self, "textLabel"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6 + 80.0;
  if (v7 >= 230.0) {
    double v8 = v7;
  }
  else {
    double v8 = 230.0;
  }

  double v9 = 66.0;
  double v10 = v8;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton floatingContentView](self, "floatingContentView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton backgroundEffectView](self, "backgroundEffectView"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[TVHButton _contentFrame](self, "_contentFrame");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = -[TVHButton _textLabelSizeWithMaxSize:](self, "_textLabelSizeWithMaxSize:", v17, v19);
  double v24 = UIRectCenteredIntegralRectScale(v21, 0.0, 0.0, v22, v23, v14, v16, v18, v20, 0.0);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  id v31 = (id)objc_claimAutoreleasedReturnValue(-[TVHButton textLabel](self, "textLabel"));
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHButton;
  id v4 = a3;
  -[TVHButton traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVHButton _updateViewColors](self, "_updateViewColors");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHButton;
  id v6 = a4;
  -[TVHButton didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton floatingContentView](self, "floatingContentView"));
  objc_msgSend( v7,  "setControlState:withAnimationCoordinator:",  -[TVHButton _currentControlState](self, "_currentControlState"),  v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002C6F4;
  v8[3] = &unk_1000FCEA8;
  v8[4] = self;
  [v6 addCoordinatedAnimations:v8 completion:0];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHButton _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[TVHButton _setHighlighted:animated:](self, "_setHighlighted:animated:", 1LL, 1LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHButton;
    -[TVHButton pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v6, v7);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHButton _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[TVHButton _setHighlighted:animated:](self, "_setHighlighted:animated:", 0LL, 1LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHButton;
    -[TVHButton pressesCancelled:withEvent:](&v8, "pressesCancelled:withEvent:", v6, v7);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHButton _canHandlePresses:](self, "_canHandlePresses:", v6))
  {
    -[TVHButton _setHighlighted:animated:](self, "_setHighlighted:animated:", 0LL, 1LL);
    -[TVHButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000LL);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHButton;
    -[TVHButton pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v6, v7);
  }
}

- (void)_updateTextLabel
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton symbolImage](self, "symbolImage"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVHButton text](self, "text"));
  double v5 = (void *)v4;
  if (v3)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
    -[NSTextAttachment setImage:](v6, "setImage:", v3);
    __int16 v16 = -4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v16,  1LL));
    objc_super v8 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
    NSAttributedStringKey v17 = NSAttachmentAttributeName;
    double v18 = v6;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    double v10 = -[NSMutableAttributedString initWithString:attributes:](v8, "initWithString:attributes:", v7, v9);

    if (v5)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSAttributedString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"  %@", v5));
      double v13 = -[NSAttributedString initWithString:](v11, "initWithString:", v12);

      -[NSMutableAttributedString appendAttributedString:](v10, "appendAttributedString:", v13);
      double v14 = v10;
    }

    else
    {
      double v14 = 0LL;
    }
  }

  else if (v4)
  {
    double v14 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v4);
  }

  else
  {
    double v14 = 0LL;
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton textLabel](self, "textLabel"));
  [v15 setAttributedText:v14];

  -[TVHButton _updateViewColors](self, "_updateViewColors");
}

- (unint64_t)_currentControlState
{
  else {
    uint64_t v3 = 0LL;
  }
  return v3 | -[TVHButton isHighlighted](self, "isHighlighted");
}

- (BOOL)_canHandlePresses:(id)a3
{
  id v4 = a3;
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHButton;
  -[TVHButton setHighlighted:](&v7, "setHighlighted:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton floatingContentView](self, "floatingContentView"));
  objc_msgSend(v6, "setControlState:animated:", -[TVHButton _currentControlState](self, "_currentControlState"), v4);
}

- (void)_updateViewColors
{
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }
  id v5 = (id)v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton textLabel](self, "textLabel"));
  [v4 setTextColor:v5];
}

- (CGRect)_contentFrame
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton floatingContentView](self, "floatingContentView"));
  [v2 bounds];
  if (v3 >= 80.0) {
    double v5 = v3 + -80.0;
  }
  else {
    double v5 = v3;
  }
  if (v3 >= 80.0) {
    double v6 = 40.0;
  }
  else {
    double v6 = 0.0;
  }
  if (v4 >= 20.0) {
    double v7 = 10.0;
  }
  else {
    double v7 = 0.0;
  }
  if (v4 >= 20.0) {
    double v8 = v4 + -20.0;
  }
  else {
    double v8 = v4;
  }

  double v9 = v6;
  double v10 = v7;
  double v11 = v5;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGSize)_textLabelSizeWithMaxSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButton textLabel](self, "textLabel"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  if (v7 >= width) {
    double v10 = width;
  }
  else {
    double v10 = v7;
  }
  if (v9 >= height) {
    double v11 = height;
  }
  else {
    double v11 = v9;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end