@interface SCATVisualScrollerContainerView
- (BOOL)updateFocusState:(int64_t)a3;
- (CALayer)borderLayer;
- (SCATVisualScrollerContainerView)initWithAxis:(int64_t)a3;
- (SCATVisualScrollerContainerView)initWithCoder:(id)a3;
- (SCATVisualScrollerContainerView)initWithFrame:(CGRect)a3;
- (SCATVisualScrollerContainerViewScrollingDelegate)delegate;
- (SCATVisualScrollerView)scrollDownView;
- (SCATVisualScrollerView)scrollLeftView;
- (SCATVisualScrollerView)scrollRightView;
- (SCATVisualScrollerView)scrollUpView;
- (UIView)scrollerContainerView;
- (UIVisualEffectView)backgroundView;
- (id)description;
- (int64_t)axis;
- (void)layoutSubviews;
- (void)setAxis:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBorderLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollDownView:(id)a3;
- (void)setScrollLeftView:(id)a3;
- (void)setScrollRightView:(id)a3;
- (void)setScrollUpView:(id)a3;
- (void)setScrollerContainerView:(id)a3;
@end

@implementation SCATVisualScrollerContainerView

- (SCATVisualScrollerContainerView)initWithCoder:(id)a3
{
  return -[SCATVisualScrollerContainerView initWithAxis:](self, "initWithAxis:", 0LL);
}

- (SCATVisualScrollerContainerView)initWithFrame:(CGRect)a3
{
  return -[SCATVisualScrollerContainerView initWithAxis:]( self,  "initWithAxis:",  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (SCATVisualScrollerContainerView)initWithAxis:(int64_t)a3
{
  v86.receiver = self;
  v86.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerContainerView;
  v4 = -[SCATCustomFocusingView initWithFrame:]( &v86,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_axis = a3;
    -[SCATVisualScrollerContainerView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4007LL));
    v6 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v75);
    -[UIVisualEffectView setAutoresizingMask:](v6, "setAutoresizingMask:", 18LL);
    -[UIVisualEffectView setClipsToBounds:](v6, "setClipsToBounds:", 1LL);
    -[SCATVisualScrollerContainerView setBackgroundView:](v5, "setBackgroundView:", v6);
    -[SCATVisualScrollerContainerView addSubview:](v5, "addSubview:", v6);
    v7 = objc_alloc_init(&OBJC_CLASS___UIView);
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18LL);
    -[SCATVisualScrollerContainerView setScrollerContainerView:](v5, "setScrollerContainerView:", v7);
    -[SCATVisualScrollerContainerView addSubview:](v5, "addSubview:", v7);
    -[UIView setClipsToBounds:](v7, "setClipsToBounds:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView layer](v5, "layer"));
    [v9 addSublayer:v8];

    -[SCATVisualScrollerContainerView setBorderLayer:](v5, "setBorderLayer:", v8);
    objc_initWeak(&location, v5);
    if (a3)
    {
      v10 = -[SCATVisualScrollerView initWithTriangle:]( objc_alloc(&OBJC_CLASS___SCATVisualScrollerView),  "initWithTriangle:",  3LL);
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = sub_1000544F0;
      v79[3] = &unk_100121EE8;
      v76 = &v80;
      objc_copyWeak(&v80, &location);
      -[SCATVisualScrollerView setActivateActionHandler:](v10, "setActivateActionHandler:", v79);
      id v11 = sub_10002B014(@"Scroll-Left");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[SCATVisualScrollerView setAccessibilityLabel:](v10, "setAccessibilityLabel:", v12);

      -[SCATVisualScrollerContainerView setScrollLeftView:](v5, "setScrollLeftView:", v10);
      -[UIView addSubview:](v7, "addSubview:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView leftAnchor](v10, "leftAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView leftAnchor](v5, "leftAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14]);
      [v15 setActive:1];

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView topAnchor](v10, "topAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView topAnchor](v5, "topAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17]);
      [v18 setActive:1];

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView bottomAnchor](v10, "bottomAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView bottomAnchor](v5, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);
      [v21 setActive:1];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView rightAnchor](v10, "rightAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView centerXAnchor](v5, "centerXAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);
      [v24 setActive:1];

      v25 = -[SCATVisualScrollerView initWithTriangle:]( objc_alloc(&OBJC_CLASS___SCATVisualScrollerView),  "initWithTriangle:",  1LL);
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472LL;
      v77[2] = sub_100054554;
      v77[3] = &unk_100121EE8;
      v26 = &v78;
      objc_copyWeak(&v78, &location);
      -[SCATVisualScrollerView setActivateActionHandler:](v25, "setActivateActionHandler:", v77);
      id v27 = sub_10002B014(@"Scroll-Right");
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      -[SCATVisualScrollerView setAccessibilityLabel:](v25, "setAccessibilityLabel:", v28);

      -[SCATVisualScrollerContainerView setScrollRightView:](v5, "setScrollRightView:", v25);
      -[UIView addSubview:](v7, "addSubview:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView rightAnchor](v25, "rightAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView rightAnchor](v5, "rightAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v30]);
      [v31 setActive:1];

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView topAnchor](v25, "topAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView topAnchor](v5, "topAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33]);
      [v34 setActive:1];

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView bottomAnchor](v25, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView bottomAnchor](v5, "bottomAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v36]);
      [v37 setActive:1];

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView leftAnchor](v25, "leftAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView centerXAnchor](v5, "centerXAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v39]);
      [v40 setActive:1];

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView heightAnchor](v5, "heightAnchor"));
      +[SCATVisualScrollerView scrollerSize](&OBJC_CLASS___SCATVisualScrollerView, "scrollerSize");
      v43 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToConstant:v42 + 20.0]);
      [v43 setActive:1];
    }

    else
    {
      v44 = -[SCATVisualScrollerView initWithTriangle:]( objc_alloc(&OBJC_CLASS___SCATVisualScrollerView),  "initWithTriangle:",  0LL);
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472LL;
      v83[2] = sub_100054428;
      v83[3] = &unk_100121EE8;
      v76 = &v84;
      objc_copyWeak(&v84, &location);
      -[SCATVisualScrollerView setActivateActionHandler:](v44, "setActivateActionHandler:", v83);
      id v45 = sub_10002B014(@"Scroll-Up");
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      -[SCATVisualScrollerView setAccessibilityLabel:](v44, "setAccessibilityLabel:", v46);

      -[SCATVisualScrollerContainerView setScrollUpView:](v5, "setScrollUpView:", v44);
      -[UIView addSubview:](v7, "addSubview:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView leftAnchor](v44, "leftAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView leftAnchor](v5, "leftAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v48]);
      [v49 setActive:1];

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView topAnchor](v44, "topAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView topAnchor](v5, "topAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v51]);
      [v52 setActive:1];

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView rightAnchor](v44, "rightAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView rightAnchor](v5, "rightAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v54]);
      [v55 setActive:1];

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView bottomAnchor](v44, "bottomAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView centerYAnchor](v5, "centerYAnchor"));
      v58 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v57]);
      [v58 setActive:1];

      v25 = -[SCATVisualScrollerView initWithTriangle:]( objc_alloc(&OBJC_CLASS___SCATVisualScrollerView),  "initWithTriangle:",  2LL);
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472LL;
      v81[2] = sub_10005448C;
      v81[3] = &unk_100121EE8;
      v26 = &v82;
      objc_copyWeak(&v82, &location);
      -[SCATVisualScrollerView setActivateActionHandler:](v25, "setActivateActionHandler:", v81);
      id v59 = sub_10002B014(@"Scroll-Down");
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      -[SCATVisualScrollerView setAccessibilityLabel:](v25, "setAccessibilityLabel:", v60);

      -[SCATVisualScrollerContainerView setScrollDownView:](v5, "setScrollDownView:", v25);
      -[UIView addSubview:](v7, "addSubview:", v25);
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView leftAnchor](v25, "leftAnchor"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView leftAnchor](v5, "leftAnchor"));
      v63 = (void *)objc_claimAutoreleasedReturnValue([v61 constraintEqualToAnchor:v62]);
      [v63 setActive:1];

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView bottomAnchor](v25, "bottomAnchor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView bottomAnchor](v5, "bottomAnchor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v65]);
      [v66 setActive:1];

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView rightAnchor](v25, "rightAnchor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView rightAnchor](v5, "rightAnchor"));
      v69 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v68]);
      [v69 setActive:1];

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView topAnchor](v25, "topAnchor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView centerYAnchor](v5, "centerYAnchor"));
      v72 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v71]);
      [v72 setActive:1];

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView widthAnchor](v5, "widthAnchor"));
      +[SCATVisualScrollerView scrollerSize](&OBJC_CLASS___SCATVisualScrollerView, "scrollerSize");
      v43 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToConstant:v73 + 20.0]);
      [v43 setActive:1];
    }

    objc_destroyWeak(v26);
    objc_destroyWeak(v76);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerContainerView;
  -[SCATVisualScrollerContainerView layoutSubviews](&v26, "layoutSubviews");
  -[SCATVisualScrollerContainerView bounds](self, "bounds");
  double width = v27.size.width;
  double height = v27.size.height;
  CGRect v28 = CGRectInset(v27, -7.0, -7.0);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double v7 = v28.size.width;
  double v8 = v28.size.height;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  objc_msgSend(v9, "setFrame:", x, y, v7, v8);

  if (width >= height) {
    double v10 = height;
  }
  else {
    double v10 = width;
  }
  double v11 = v10 * 0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView layer](self, "layer"));
  [v12 setCornerRadius:v11];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView backgroundView](self, "backgroundView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 layer]);
  [v14 setCornerRadius:v11];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView scrollerContainerView](self, "scrollerContainerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
  [v16 setCornerRadius:v11];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v17 bounds];
  double v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v20 bounds];
  double v22 = v21;

  if (v19 >= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v19;
  }
  double v24 = v23 * 0.5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v25 setCornerRadius:v24];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerContainerView;
  id v3 = -[SCATVisualScrollerContainerView description](&v9, "description");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  if (self->_axis) {
    v6 = @"Horizontal";
  }
  else {
    v6 = @"Vertical";
  }
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Axis:%@",  v4,  v6));

  return v7;
}

- (BOOL)updateFocusState:(int64_t)a3
{
  v71.receiver = self;
  v71.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerContainerView;
  -[SCATCustomFocusingView updateFocusState:](&v71, "updateFocusState:");
  -[SCATVisualScrollerContainerView bounds](self, "bounds");
  if (!a3)
  {
    CGRect v73 = CGRectInset(*(CGRect *)&v5, -2.0, -2.0);
    double x = v73.origin.x;
    double y = v73.origin.y;
    double width = v73.size.width;
    double height = v73.size.height;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
    objc_msgSend(v33, "setFrame:", x, y, width, height);

    *(void *)&double v35 = objc_opt_class(self, v34).n128_u64[0];
    objc_msgSend(v36, "unfocusedStateBorderThickness", v35);
    double v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
    [v39 setBorderWidth:v38];

    *(void *)&double v41 = objc_opt_class(self, v40).n128_u64[0];
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "unfocusedStateColor", v41));
LABEL_7:
    id v58 = v43;
    id v59 = [v58 CGColor];
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
    [v60 setBorderColor:v59];

    objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
    CGRect v27 = v26;
    LODWORD(v28) = 1053609165;
    goto LABEL_8;
  }

  if (a3 == 2)
  {
    CGRect v74 = CGRectInset(*(CGRect *)&v5, -2.0, -2.0);
    double v44 = v74.origin.x;
    double v45 = v74.origin.y;
    double v46 = v74.size.width;
    double v47 = v74.size.height;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
    objc_msgSend(v48, "setFrame:", v44, v45, v46, v47);

    *(void *)&double v50 = objc_opt_class(self, v49).n128_u64[0];
    objc_msgSend(v51, "unfocusedStateBorderThickness", v50);
    double v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
    [v54 setBorderWidth:v53];

    *(void *)&double v56 = objc_opt_class(self, v55).n128_u64[0];
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "focusedGroupStateColor", v56));
    goto LABEL_7;
  }

  if (a3 != 1) {
    goto LABEL_9;
  }
  CGRect v72 = CGRectInset(*(CGRect *)&v5, -7.0, -7.0);
  double v9 = v72.origin.x;
  double v10 = v72.origin.y;
  double v11 = v72.size.width;
  double v12 = v72.size.height;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  objc_msgSend(v13, "setFrame:", v9, v10, v11, v12);

  *(void *)&double v15 = objc_opt_class(self, v14).n128_u64[0];
  objc_msgSend(v16, "focusedStateBorderThickness", v15);
  double v18 = v17;
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v19 setBorderWidth:v18];

  *(void *)&double v21 = objc_opt_class(self, v20).n128_u64[0];
  id v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "focusedStateColor", v21));
  id v24 = [v23 CGColor];
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v25 setBorderColor:v24];

  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  CGRect v27 = v26;
  LODWORD(v28) = 1.0;
LABEL_8:
  [v26 setOpacity:v28];

LABEL_9:
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v61 bounds];
  double v63 = v62;

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v64 bounds];
  double v66 = v65;

  if (v63 >= v66) {
    double v67 = v66;
  }
  else {
    double v67 = v63;
  }
  double v68 = v67 * 0.5;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerContainerView borderLayer](self, "borderLayer"));
  [v69 setCornerRadius:v68];

  return 1;
}

- (SCATVisualScrollerContainerViewScrollingDelegate)delegate
{
  return (SCATVisualScrollerContainerViewScrollingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATVisualScrollerView)scrollUpView
{
  return self->_scrollUpView;
}

- (void)setScrollUpView:(id)a3
{
}

- (SCATVisualScrollerView)scrollDownView
{
  return self->_scrollDownView;
}

- (void)setScrollDownView:(id)a3
{
}

- (SCATVisualScrollerView)scrollLeftView
{
  return self->_scrollLeftView;
}

- (void)setScrollLeftView:(id)a3
{
}

- (SCATVisualScrollerView)scrollRightView
{
  return self->_scrollRightView;
}

- (void)setScrollRightView:(id)a3
{
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (CALayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)scrollerContainerView
{
  return self->_scrollerContainerView;
}

- (void)setScrollerContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end