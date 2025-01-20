@interface TVSSImageContentView
- (CGSize)intrinsicContentSize;
- (TVSSImageContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (UIImageView)imageView;
- (UIView)backgroundColorView;
- (id)_imageContent;
- (unint64_t)visualizedControlState;
- (void)_updateAppearance;
- (void)_updateContent;
- (void)setBackgroundColorView:(id)a3;
- (void)setContent:(id)a3;
- (void)setImageView:(id)a3;
- (void)setVisualizedControlState:(unint64_t)a3;
@end

@implementation TVSSImageContentView

- (TVSSImageContentView)initWithFrame:(CGRect)a3
{
  CGRect v43 = a3;
  SEL v41 = a2;
  v42 = 0LL;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TVSSImageContentView;
  v42 = -[TVSSImageContentView initWithFrame:]( &v40,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v42, v42);
  if (v42)
  {
    v42->_visualizedControlState = 0LL;
    id v10 = -[TVSSImageContentView layer](v42, "layer");
    [v10 setAllowsGroupBlending:0];

    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundColorView = v42->_backgroundColorView;
    v42->_backgroundColorView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v42->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSImageContentView addSubview:](v42, "addSubview:", v42->_backgroundColorView);
    id v39 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 5LL);
    v38 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v39,  2LL);
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v42->_imageView;
    v42->_imageView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v42->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v42->_imageView, "setContentMode:", 4LL);
    -[UIImageView setPreferredSymbolConfiguration:](v42->_imageView, "setPreferredSymbolConfiguration:", v38);
    -[TVSSImageContentView addSubview:](v42, "addSubview:", v42->_imageView);
    id v35 = -[TVSSImageContentView leadingAnchor](v42, "leadingAnchor");
    v34 = -[UIView leadingAnchor](v42->_backgroundColorView, "leadingAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    v45[0] = v33;
    id v32 = -[TVSSImageContentView trailingAnchor](v42, "trailingAnchor");
    v31 = -[UIView trailingAnchor](v42->_backgroundColorView, "trailingAnchor");
    id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v45[1] = v30;
    id v29 = -[TVSSImageContentView topAnchor](v42, "topAnchor");
    v28 = -[UIView topAnchor](v42->_backgroundColorView, "topAnchor");
    id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
    v45[2] = v27;
    id v26 = -[TVSSImageContentView bottomAnchor](v42, "bottomAnchor");
    v25 = -[UIView bottomAnchor](v42->_backgroundColorView, "bottomAnchor");
    id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
    v45[3] = v24;
    id v23 = -[TVSSImageContentView leadingAnchor](v42, "leadingAnchor");
    id v22 = -[UIImageView leadingAnchor](v42->_imageView, "leadingAnchor");
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
    v45[4] = v21;
    id v20 = -[TVSSImageContentView trailingAnchor](v42, "trailingAnchor");
    id v19 = -[UIImageView trailingAnchor](v42->_imageView, "trailingAnchor");
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
    v45[5] = v18;
    id v17 = -[TVSSImageContentView topAnchor](v42, "topAnchor");
    id v16 = -[UIImageView topAnchor](v42->_imageView, "topAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
    v45[6] = v15;
    id v14 = -[TVSSImageContentView bottomAnchor](v42, "bottomAnchor");
    id v13 = -[UIImageView bottomAnchor](v42->_imageView, "bottomAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v45[7] = v12;
    v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 8LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSImageContentView _updateAppearance](v42, "_updateAppearance");
    v36 = v42;
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarActiveItemIdentifierTrait);
    v37 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL);
    id v7 = -[TVSSImageContentView registerForTraitChanges:withAction:](v36, "registerForTraitChanges:withAction:");

    objc_storeStrong((id *)&v38, 0LL);
    objc_storeStrong(&v39, 0LL);
  }

  v9 = v42;
  objc_storeStrong((id *)&v42, 0LL);
  return v9;
}

- (CGSize)intrinsicContentSize
{
  id v13 = self;
  SEL v12 = a2;
  CGSize v11 = CGSizeZero;
  id location = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSImageContent);
  if ((objc_opt_isKindOfClass(location, v2) & 1) != 0)
  {
    [location size];
    v9.double width = v3;
    v9.double height = v4;
    CGSize v11 = v9;
  }

  +[TVSSConstants itemDiameter](&OBJC_CLASS___TVSSConstants, "itemDiameter");
  if (sub_100128650(v11.width, v11.height, CGSizeZero.width, CGSizeZero.height))
  {
    sub_1001286AC();
    v14.double width = v5;
    v14.double height = v6;
  }

  else
  {
    CGSize v14 = v11;
  }

  objc_storeStrong(&location, 0LL);
  double height = v14.height;
  double width = v14.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setVisualizedControlState:(unint64_t)a3
{
  if (self->_visualizedControlState != a3)
  {
    self->_visualizedControlState = a3;
    -[TVSSImageContentView _updateAppearance](self, "_updateAppearance");
  }

- (void)setContent:(id)a3
{
  CGFloat v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_content != location[0])
  {
    objc_storeStrong((id *)&v4->_content, location[0]);
    -[TVSSImageContentView _updateContent](v4, "_updateContent");
    -[TVSSImageContentView _updateAppearance](v4, "_updateAppearance");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_imageContent
{
  content = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSImageContent);
  return sub_100128838(content, v2);
}

- (void)_updateContent
{
  CGFloat v5 = self;
  v4[1] = (id)a2;
  id v2 = -[TVSSImageContentView _imageContent](self, "_imageContent");
  v4[0] = [v2 image];

  CGFloat v3 = -[TVSSImageContentView imageView](v5, "imageView");
  -[UIImageView setImage:](v3, "setImage:", v4[0]);

  objc_storeStrong(v4, 0LL);
}

- (void)_updateAppearance
{
  id v26 = self;
  SEL v25 = a2;
  id v9 = -[TVSSImageContentView traitCollection](self, "traitCollection");
  BOOL v10 = [v9 userInterfaceStyle] == (id)2;

  BOOL v24 = v10;
  id v11 = -[TVSSImageContentView _imageContent](v26, "_imageContent");
  unsigned __int8 v12 = [v11 allowsFilters];

  char v23 = v12 & 1;
  id v13 = -[TVSSImageContentView _imageContent](v26, "_imageContent");
  unsigned __int8 v14 = [v13 allowsSelectedBackground];

  char v22 = v14 & 1;
  id location = 0LL;
  id v20 = 0LL;
  id v19 = 0LL;
  id v18 = 0LL;
  unint64_t visualizedControlState = v26->_visualizedControlState;
  if (visualizedControlState <= 8) {
    __asm { BR              X8 }
  }

  char v16 = 0;
  if ((v23 & 1) != 0)
  {
    if (v24) {
      uint64_t v8 = kCAFilterPlusL;
    }
    else {
      uint64_t v8 = kCAFilterPlusD;
    }
    id v17 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v8);
    char v16 = 1;
    objc_storeStrong(&location, v17);
  }

  else
  {
    objc_storeStrong(&location, 0LL);
  }

  if ((v16 & 1) != 0) {

  }
  id v2 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  CGFloat v3 = v20;
  id v20 = v2;

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v18, 0LL);
  -[UIImageView setTintColor:](v26->_imageView, "setTintColor:", v20);
  CGFloat v5 = -[TVSSImageContentView imageView](v26, "imageView");
  id v4 = -[UIImageView layer](v5, "layer");
  [v4 setCompositingFilter:location];

  -[UIView setBackgroundColor:](v26->_backgroundColorView, "setBackgroundColor:", v18);
  id v7 = -[TVSSImageContentView backgroundColorView](v26, "backgroundColorView");
  CGFloat v6 = -[UIView layer](v7, "layer");
  -[CALayer setCompositingFilter:](v6, "setCompositingFilter:", v19);

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (unint64_t)visualizedControlState
{
  return self->_visualizedControlState;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (void)setBackgroundColorView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end