@interface PBAppSwitcherCollectionViewCell
- (PBAppSwitcherCollectionViewCell)initWithFrame:(CGRect)a3;
- (PBAppSwitcherItem)appSwitcherItem;
- (PBAppSwitcherTitleView)titleView;
- (TVSUIOuterShadowView)shadowView;
- (UIView)containerView;
- (UIView)dimmingView;
- (UIView)itemContentView;
- (UIView)sceneView;
- (double)contentCornerRadius;
- (id)_accessibilitySemanticContextForElement:(id)a3;
- (void)_setContentAlpha:(double)a3;
- (void)_setDimingAlpha:(double)a3;
- (void)_setShadowRadius:(double)a3 alpha:(double)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppSwitcherItem:(id)a3;
- (void)setContentCornerRadius:(double)a3;
- (void)setSceneView:(id)a3;
@end

@implementation PBAppSwitcherCollectionViewCell

- (PBAppSwitcherCollectionViewCell)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewCell;
  v3 = -[PBAppSwitcherCollectionViewCell initWithFrame:]( &v34,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainWorkspace]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 geometry]);
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v8, v10, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCell contentView](v3, "contentView"));
    [v16 center];
    -[UIView setCenter:](v15, "setCenter:");

    v17 = objc_alloc_init(&OBJC_CLASS___PBAppSwitcherTitleView);
    titleView = v3->_titleView;
    v3->_titleView = v17;

    -[UIView addSubview:](v15, "addSubview:", v3->_titleView);
    v19 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v8, v10, v12, v14);
    itemContentView = v3->_itemContentView;
    v3->_itemContentView = v19;

    v21 = v3->_itemContentView;
    v35.origin.x = v8;
    v35.origin.y = v10;
    v35.size.width = v12;
    v35.size.height = v14;
    double MidX = CGRectGetMidX(v35);
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    -[UIView setCenter:](v21, "setCenter:", MidX, CGRectGetMidY(v36));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_itemContentView, "layer"));
    [v23 setAllowsGroupOpacity:0];

    -[UIView addSubview:](v15, "addSubview:", v3->_itemContentView);
    v24 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v8, v10, v12, v14);
    dimmingView = v3->_dimmingView;
    v3->_dimmingView = v24;

    v26 = v3->_dimmingView;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[UIView addSubview:](v3->_itemContentView, "addSubview:", v3->_dimmingView);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCell contentView](v3, "contentView"));
    [v28 addSubview:v15];

    containerView = v3->_containerView;
    v3->_containerView = v15;
    v30 = v15;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_containerView, "layer"));
    [v31 setAllowsGroupOpacity:0];

    if (UIAccessibilityIsReduceMotionEnabled()) {
      -[PBAppSwitcherCollectionViewCell _setFocusSpeedBumpEdges:](v3, "_setFocusSpeedBumpEdges:", 2LL);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCell layer](v3, "layer"));
    [v32 setAllowsGroupOpacity:0];
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewCell;
  -[PBAppSwitcherCollectionViewCell dealloc](&v3, "dealloc");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    [v4 contentScale];
    CGAffineTransformMakeScale(&v25, v6, v6);
    containerView = self->_containerView;
    CGAffineTransform v24 = v25;
    -[UIView setTransform:](containerView, "setTransform:", &v24);
    [v4 contentOffset];
    double v9 = v8;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCell contentView](self, "contentView"));
    [v10 center];
    double v12 = v11;
    double v14 = v13;

    -[UIView setCenter:](self->_containerView, "setCenter:", v9 + v12, v14);
    [v4 snapshotOffset];
    CGAffineTransformMakeTranslation(&v24, 0.0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    id v17 = [v16 userInterfaceLayoutDirection];

    if (v17 == (id)1)
    {
      CGAffineTransformMakeScale(&t2, -1.0, 1.0);
      CGAffineTransform v21 = v24;
      CGAffineTransformConcat(&v23, &v21, &t2);
      CGAffineTransform v24 = v23;
    }

    itemContentView = self->_itemContentView;
    CGAffineTransform v23 = v24;
    -[UIView setTransform:](itemContentView, "setTransform:", &v23);
    dimmingView = self->_dimmingView;
    CGAffineTransform v23 = v24;
    -[UIView setTransform:](dimmingView, "setTransform:", &v23);
    shadowView = self->_shadowView;
    CGAffineTransform v23 = v24;
    -[TVSUIOuterShadowView setTransform:](shadowView, "setTransform:", &v23);
    [v4 contentAlpha];
    -[PBAppSwitcherCollectionViewCell _setContentAlpha:](self, "_setContentAlpha:");
    [v4 dimmingAlpha];
    -[PBAppSwitcherCollectionViewCell _setDimingAlpha:](self, "_setDimingAlpha:");
    [v4 shadowAlpha];
    [v4 shadowBlurRadius];
    -[PBAppSwitcherCollectionViewCell _setShadowRadius:alpha:](self, "_setShadowRadius:alpha:");
    [v4 textAlpha];
    -[PBAppSwitcherTitleView setTitleOpacity:](self->_titleView, "setTitleOpacity:");
    -[PBAppSwitcherTitleView setHidden:](self->_titleView, "setHidden:", [v4 isHeaderHidden]);
    -[UIView setHidden:](self->_itemContentView, "setHidden:", [v4 isContentHidden]);
    [v4 cornerRadius];
    -[PBAppSwitcherCollectionViewCell setContentCornerRadius:](self, "setContentCornerRadius:");
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewCell;
  -[PBAppSwitcherCollectionViewCell layoutSubviews](&v12, "layoutSubviews");
  CGFloat y = CGRectZero.origin.y;
  titleView = self->_titleView;
  -[PBAppSwitcherCollectionViewCell bounds](self, "bounds");
  -[PBAppSwitcherTitleView sizeThatFits:](titleView, "sizeThatFits:", v5, v6);
  double v8 = v7;
  double v10 = v9;
  v13.origin.x = 30.0;
  v13.origin.CGFloat y = y;
  v13.size.width = v8;
  v13.size.height = v10;
  -[PBAppSwitcherTitleView setFrame:]( self->_titleView,  "setFrame:",  30.0,  -(CGRectGetHeight(v13) * 0.5 + 58.0),  v8,  v10);
  shadowView = self->_shadowView;
  -[UIView frame](self->_itemContentView, "frame");
  -[TVSUIOuterShadowView frameForAlignmentRect:](shadowView, "frameForAlignmentRect:");
  -[TVSUIOuterShadowView setFrame:](self->_shadowView, "setFrame:");
}

- (void)setAppSwitcherItem:(id)a3
{
  double v5 = (PBAppSwitcherItem *)a3;
  appSwitcherItem = self->_appSwitcherItem;
  if (appSwitcherItem != v5)
  {
    -[PBAppSwitcherItem removeObserver:forKeyPath:context:]( appSwitcherItem,  "removeObserver:forKeyPath:context:",  self,  @"iconImage",  off_10046C400);
    -[PBAppSwitcherItem removeObserver:forKeyPath:context:]( self->_appSwitcherItem,  "removeObserver:forKeyPath:context:",  self,  @"displayName",  off_10046C408);
    double v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    double v10 = sub_10013EAF8;
    double v11 = &unk_1003CFEB8;
    objc_super v12 = self;
    double v7 = v5;
    CGRect v13 = v7;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v8);
    -[PBAppSwitcherItem addObserver:forKeyPath:options:context:]( v7,  "addObserver:forKeyPath:options:context:",  self,  @"iconImage",  0LL,  off_10046C400,  v8,  v9,  v10,  v11,  v12);
    -[PBAppSwitcherItem addObserver:forKeyPath:options:context:]( v7,  "addObserver:forKeyPath:options:context:",  self,  @"displayName",  0LL,  off_10046C408);
    objc_storeStrong((id *)&self->_appSwitcherItem, a3);
  }
}

- (void)setSceneView:(id)a3
{
  double v5 = (UIView *)a3;
  sceneView = self->_sceneView;
  if (sceneView != v5)
  {
    -[UIView removeFromSuperview](sceneView, "removeFromSuperview");
    if (v5)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCell itemContentView](self, "itemContentView"));
      [v7 bounds];
      -[UIView setFrame:](v5, "setFrame:");
      -[UIView _setContinuousCornerRadius:](self->_sceneView, "_setContinuousCornerRadius:", self->_contentCornerRadius);
      [v7 insertSubview:v5 atIndex:0];
    }

    objc_storeStrong((id *)&self->_sceneView, a3);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10046C400 == a6)
  {
    titleView = self->_titleView;
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherItem iconImage](self->_appSwitcherItem, "iconImage"));
    -[PBAppSwitcherTitleView setImage:](titleView, "setImage:", v14);
  }

  else if (off_10046C408 == a6)
  {
    CGFloat v15 = self->_titleView;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherItem displayName](self->_appSwitcherItem, "displayName"));
    -[PBAppSwitcherTitleView setTitle:](v15, "setTitle:", v16);

    -[PBAppSwitcherCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

  else
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___PBAppSwitcherCollectionViewCell;
    -[PBAppSwitcherCollectionViewCell observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)setContentCornerRadius:(double)a3
{
  self->_contentCornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_sceneView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_dimmingView, "_setContinuousCornerRadius:", a3);
}

- (void)_setContentAlpha:(double)a3
{
}

- (void)_setDimingAlpha:(double)a3
{
}

- (void)_setShadowRadius:(double)a3 alpha:(double)a4
{
  shadowView = self->_shadowView;
  if (!shadowView) {
    goto LABEL_4;
  }
  -[TVSUIOuterShadowView shadowRadius](shadowView, "shadowRadius");
  if (v8 != a3)
  {
    shadowView = self->_shadowView;
LABEL_4:
    -[TVSUIOuterShadowView removeFromSuperview](shadowView, "removeFromSuperview");
    uint64_t v9 = -[TVSUIOuterShadowView initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:]( objc_alloc(&OBJC_CLASS___TVSUIOuterShadowView),  "initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:",  1LL,  26.6666667,  -3.0,  0.0,  a3);
    id v10 = self->_shadowView;
    self->_shadowView = v9;

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_shadowView);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10013EF28;
    v11[3] = &unk_1003CFF08;
    v11[4] = self;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v11);
  }

  -[TVSUIOuterShadowView setAlpha:](self->_shadowView, "setAlpha:", a4);
}

- (id)_accessibilitySemanticContextForElement:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCell appSwitcherItem](self, "appSwitcherItem", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCSemanticContextFactory applicationSemanticContextWithName:bundleIdentifier:]( &OBJC_CLASS___TVSCSemanticContextFactory,  "applicationSemanticContextWithName:bundleIdentifier:",  v4,  v5));

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 linkedDataDictionary]);
  return v7;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (PBAppSwitcherItem)appSwitcherItem
{
  return self->_appSwitcherItem;
}

- (PBAppSwitcherTitleView)titleView
{
  return self->_titleView;
}

- (UIView)itemContentView
{
  return self->_itemContentView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (TVSUIOuterShadowView)shadowView
{
  return self->_shadowView;
}

- (double)contentCornerRadius
{
  return self->_contentCornerRadius;
}

- (void).cxx_destruct
{
}

@end