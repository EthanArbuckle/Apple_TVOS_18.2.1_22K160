@interface TVPContextMenuBackgroundView
- (TVPContextMenuBackdropView)backdropView;
- (TVPContextMenuBackgroundView)initWithFrame:(CGRect)a3;
- (UIView)tintView;
- (void)_configureForUserInterfaceStyle:(int64_t)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)setBackdropView:(id)a3;
- (void)setTintView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPContextMenuBackgroundView

- (void)_configureForUserInterfaceStyle:(int64_t)a3
{
  v4 = &kCAFilterDarkenBlendMode;
  if (a3 == 2) {
    v4 = &kCAFilterLightenBlendMode;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView tintView](self, "tintView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);
  [v6 setCompositingFilter:v7];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPContextMenuBackgroundView;
  -[TVPContextMenuBackgroundView _setContinuousCornerRadius:](&v7, "_setContinuousCornerRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView backdropView](self, "backdropView"));
  [v5 _setContinuousCornerRadius:a3];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView tintView](self, "tintView"));
  [v6 _setContinuousCornerRadius:a3];
}

- (void)_setCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPContextMenuBackgroundView;
  -[TVPContextMenuBackgroundView _setCornerRadius:](&v7, "_setCornerRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView backdropView](self, "backdropView"));
  [v5 _setCornerRadius:a3];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView tintView](self, "tintView"));
  [v6 _setCornerRadius:a3];
}

- (TVPContextMenuBackgroundView)initWithFrame:(CGRect)a3
{
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___TVPContextMenuBackgroundView;
  v3 = -[TVPContextMenuBackgroundView initWithFrame:]( &v56,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc(&OBJC_CLASS___TVPContextMenuBackdropView);
    -[TVPContextMenuBackgroundView bounds](v4, "bounds");
    objc_super v7 = -[TVPContextMenuBackdropView initWithFrame:](v6, "initWithFrame:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackdropView backdropLayer](v7, "backdropLayer"));
    [v8 setAllowsInPlaceFiltering:0];
    [v8 setReducesCaptureBitDepth:1];
    [v8 setScale:0.0625];
    id v9 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    objc_msgSend(v8, "setShadowColor:", objc_msgSend(v9, "CGColor"));

    LODWORD(v10) = 1045220557;
    [v8 setShadowOpacity:v10];
    objc_msgSend(v8, "setShadowOffset:", 0.0, 4.0);
    [v8 setShadowRadius:48.0];
    v53 = v8;
    [v8 setShadowPathIsBounds:1];
    -[TVPContextMenuBackdropView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVPContextMenuBackgroundView addSubview:](v4, "addSubview:", v7);
    backdropView = v4->_backdropView;
    v4->_backdropView = v7;
    v12 = v7;

    v13 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVPContextMenuBackgroundView bounds](v4, "bounds");
    v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    -[TVPContextMenuBackgroundView addSubview:](v4, "addSubview:", v14);
    tintView = v4->_tintView;
    v4->_tintView = v14;
    v16 = v14;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterGaussianBlur));
    [v17 setCachesInputImage:0];
    [v17 setValue:@"low" forKey:kCAFilterInputQuality];
    [v17 setValue:&__kCFBooleanTrue forKey:kCAFilterInputDither];
    [v17 setValue:&__kCFBooleanTrue forKey:kCAFilterInputNormalizeEdges];
    [v17 setValue:&__kCFBooleanTrue forKey:kCAFilterInputHardEdges];
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_100101B60));
    v55 = v17;
    [v17 setValue:v18 forKey:kCAFilterInputRadius];

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterColorSaturate));
    [v54 setCachesInputImage:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_100101B68));
    [v54 setValue:v19 forKey:kCAFilterInputAmount];

    v58[0] = v17;
    v58[1] = v54;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
    [v8 setFilters:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  &stru_1000CB308));
    -[TVPContextMenuBackdropView setBackgroundColor:](v12, "setBackgroundColor:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  &stru_1000CB328));
    -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView traitCollection](v4, "traitCollection"));
    -[TVPContextMenuBackgroundView _configureForUserInterfaceStyle:]( v4,  "_configureForUserInterfaceStyle:",  [v23 userInterfaceStyle]);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackdropView leadingAnchor](v12, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView leadingAnchor](v4, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51]);
    v57[0] = v50;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackdropView trailingAnchor](v12, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView trailingAnchor](v4, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
    v57[1] = v46;
    v49 = v12;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackdropView topAnchor](v12, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView topAnchor](v4, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v44]);
    v57[2] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackdropView bottomAnchor](v12, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView bottomAnchor](v4, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v41]);
    v57[3] = v39;
    v24 = v16;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v16, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView leadingAnchor](v4, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v37]);
    v57[4] = v35;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v16, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView trailingAnchor](v4, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);
    v57[5] = v27;
    v40 = v16;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v16, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView topAnchor](v4, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);
    v57[6] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v24, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView bottomAnchor](v4, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
    v57[7] = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 8LL));

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v36);
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPContextMenuBackgroundView;
  id v4 = a3;
  -[TVPContextMenuBackgroundView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackgroundView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v7 != v6) {
    -[TVPContextMenuBackgroundView _configureForUserInterfaceStyle:](self, "_configureForUserInterfaceStyle:", v6);
  }
}

- (TVPContextMenuBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end