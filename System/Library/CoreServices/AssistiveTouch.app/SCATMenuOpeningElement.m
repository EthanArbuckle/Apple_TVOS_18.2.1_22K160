@interface SCATMenuOpeningElement
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (SCATMenuOpeningElement)initWithFrame:(CGRect)a3;
- (UIImage)backdropMaskImage;
- (id)accessibilityLabel;
- (void)setBackdropMaskImage:(id)a3;
@end

@implementation SCATMenuOpeningElement

- (SCATMenuOpeningElement)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SCATMenuOpeningElement;
  v3 = -[SCATMenuOpeningElement initWithFrame:]( &v17,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SCATMenuOpeningElement setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v5 = -[_UIBackdropView initWithPrivateStyle:]( objc_alloc(&OBJC_CLASS____UIBackdropView),  "initWithPrivateStyle:",  2030LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"SCAT_alwaysTap_mask"));
    -[SCATMenuOpeningElement setBackdropMaskImage:](v4, "setBackdropMaskImage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](v5, "inputSettings"));
    [v7 setGrayscaleTintMaskImage:v6];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](v5, "inputSettings"));
    [v8 setColorTintMaskImage:v6];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](v5, "inputSettings"));
    [v9 setFilterMaskImage:v6];

    -[SCATMenuOpeningElement addSubview:](v4, "addSubview:", v5);
    v10 = objc_alloc(&OBJC_CLASS___UIImageView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"SCAT_alwaysTap_glyph"));
    v12 = -[UIImageView initWithImage:](v10, "initWithImage:", v11);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v12,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATMenuOpeningElement addSubview:](v4, "addSubview:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  9LL,  0LL,  v5,  9LL,  1.0,  0.0));
    v18[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  10LL,  0LL,  v5,  10LL,  1.0,  0.0));
    v18[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    -[SCATMenuOpeningElement addConstraints:](v4, "addConstraints:", v15);
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return sub_10002B014(@"ALWAYS_TAP_MENU");
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningElement backdropMaskImage](self, "backdropMaskImage"));
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)backdropMaskImage
{
  return self->_backdropMaskImage;
}

- (void)setBackdropMaskImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end