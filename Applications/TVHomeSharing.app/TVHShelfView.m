@interface TVHShelfView
+ (TVHShelfView)new;
- (CGSize)_collectionViewSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHCollectionView)collectionView;
- (TVHShelfView)init;
- (TVHShelfView)initWithCoder:(id)a3;
- (TVHShelfView)initWithFrame:(CGRect)a3;
- (TVHShelfView)initWithFrame:(CGRect)a3 layout:(id)a4;
- (UIView)headerView;
- (double)headerViewBaseY;
- (id)_shelfViewLayout;
- (id)preferredFocusEnvironments;
- (void)_updateHeaderViewFrameAnimated:(BOOL)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setHeaderView:(id)a3;
- (void)setHeaderViewBaseY:(double)a3;
- (void)updateHeaderViewFrameWithAnimationCoordinator:(id)a3;
@end

@implementation TVHShelfView

+ (TVHShelfView)new
{
  return 0LL;
}

- (TVHShelfView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHShelfView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHShelfView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHShelfView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHShelfView;
  v10 = -[TVHShelfView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[TVHShelfView tvh_setDebugLayoutColorType:](v10, "tvh_setDebugLayoutColorType:", 12LL);
    v12 = -[TVHCollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___TVHCollectionView),  "initWithFrame:collectionViewLayout:",  v9,  x,  y,  width,  height);
    collectionView = v11->_collectionView;
    v11->_collectionView = v12;

    -[TVHCollectionView setAutoresizingMask:](v11->_collectionView, "setAutoresizingMask:", 18LL);
    v14 = v11->_collectionView;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVHCollectionView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[TVHCollectionView setShowsVerticalScrollIndicator:](v11->_collectionView, "setShowsVerticalScrollIndicator:", 0LL);
    -[TVHCollectionView setShowsHorizontalScrollIndicator:]( v11->_collectionView,  "setShowsHorizontalScrollIndicator:",  0LL);
    -[TVHCollectionView setAlwaysBounceHorizontal:](v11->_collectionView, "setAlwaysBounceHorizontal:", 1LL);
    -[TVHCollectionView _setContentInsetAdjustmentBehavior:]( v11->_collectionView,  "_setContentInsetAdjustmentBehavior:",  2LL);
    -[TVHCollectionView tvh_setDebugLayoutColorType:](v11->_collectionView, "tvh_setDebugLayoutColorType:", 9LL);
    -[TVHShelfView addSubview:](v11, "addSubview:", v11->_collectionView);
    v11->_headerViewBaseY = 1.79769313e308;
  }

  return v11;
}

- (void)setHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[UIView tvh_setDebugLayoutColorType:](*p_headerView, "tvh_setDebugLayoutColorType:", 2LL);
    if (*p_headerView) {
      -[TVHShelfView addSubview:](self, "addSubview:");
    }
    -[TVHShelfView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }
}

- (void)updateHeaderViewFrameWithAnimationCoordinator:(id)a3
{
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVHShelfView;
  -[TVHShelfView layoutSubviews](&v34, "layoutSubviews");
  -[TVHShelfView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView headerView](self, "headerView"));
  if (v11)
  {
    CGFloat v32 = v6;
    CGFloat v33 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView _shelfViewLayout](self, "_shelfViewLayout"));
    [v12 headerViewMargin];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    double v21 = v8 - v16 - v20;
    objc_msgSend(v11, "sizeThatFits:", v21, v10 - v14 - v18);
    if (v22 >= v21) {
      double v24 = v21;
    }
    else {
      double v24 = v22;
    }
    if (v23 >= v10 - v14 - v18) {
      double v25 = v10 - v14 - v18;
    }
    else {
      double v25 = v23;
    }
    if ([v11 effectiveUserInterfaceLayoutDirection] == (id)1)
    {
      double v16 = sub_100095340(v16, v14, v24, v25, v33, v32, v8, v10);
      double v14 = v26;
      double v24 = v27;
      double v25 = v28;
    }

    objc_msgSend(v11, "setFrame:", v16, v14, v24, v25);
    -[TVHShelfView setHeaderViewBaseY:](self, "setHeaderViewBaseY:", v14);
    v35.origin.double x = v16;
    v35.origin.double y = v14;
    v35.size.double width = v24;
    v35.size.double height = v25;
    double v29 = v18 + CGRectGetMaxY(v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView collectionView](self, "collectionView"));
    objc_msgSend(v30, "setFrame:", 0.0, v29, v8, v10 - v29);

    -[TVHShelfView _updateHeaderViewFrameAnimated:withAnimationCoordinator:]( self,  "_updateHeaderViewFrameAnimated:withAnimationCoordinator:",  0LL,  0LL);
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView collectionView](self, "collectionView"));
    -[TVHShelfView bounds](self, "bounds");
    objc_msgSend(v31, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView headerView](self, "headerView"));
  double v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", width, height);
    double v9 = v8;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView _shelfViewLayout](self, "_shelfViewLayout"));
    [v10 headerViewMargin];
    double v12 = v11;
    double v14 = v13;

    double v15 = v14 + v9 + v12 + 0.0;
  }

  else
  {
    double v15 = 0.0;
  }

  -[TVHShelfView _collectionViewSizeThatFits:](self, "_collectionViewSizeThatFits:", width, height);
  double v17 = v15 + v16;

  double v18 = width;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView collectionView](self, "collectionView"));
  double v5 = v2;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (CGSize)_collectionViewSizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView _shelfViewLayout](self, "_shelfViewLayout", a3.width, a3.height));
  [v4 collectionViewContentSize];
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (id)_shelfViewLayout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView collectionView](self, "collectionView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionViewLayout]);

  return v3;
}

- (void)_updateHeaderViewFrameAnimated:(BOOL)a3 withAnimationCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView headerView](self, "headerView"));
  if (!v7) {
    goto LABEL_15;
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfView collectionView](self, "collectionView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForCurrentFocusedItem]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 cellForItemAtIndexPath:v9]);
  [v7 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  if (!v10) {
    goto LABEL_5;
  }
  CGFloat v18 = v11;
  [v10 frame];
  -[TVHShelfView convertRect:fromView:](self, "convertRect:fromView:", v8);
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  id v27 = -[TVHShelfView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  uint64_t v28 = v20;
  uint64_t v29 = v22;
  uint64_t v30 = v24;
  uint64_t v31 = v26;
  if (!v27)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v28);
    v53.origin.double x = v13;
    v53.origin.double y = v18;
    v53.size.CGFloat width = v15;
    v53.size.double height = v17;
    if (MinX > CGRectGetMaxX(v53)) {
      goto LABEL_5;
    }
LABEL_7:
    -[TVHShelfView headerViewBaseY](self, "headerViewBaseY");
    uint64_t v36 = 0LL;
    double v34 = v38 + -25.0;
    double v35 = 0.12;
    goto LABEL_8;
  }

  double MaxX = CGRectGetMaxX(*(CGRect *)&v28);
  v52.origin.double x = v13;
  v52.origin.double y = v18;
  v52.size.CGFloat width = v15;
  v52.size.double height = v17;
  if (MaxX >= CGRectGetMinX(v52)) {
    goto LABEL_7;
  }
LABEL_5:
  -[TVHShelfView headerViewBaseY](self, "headerViewBaseY");
  double v34 = v33;
  double v35 = 0.5;
  uint64_t v36 = 1LL;
LABEL_8:
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000743E0;
  v46[3] = &unk_1000FE078;
  id v47 = v7;
  CGFloat v48 = v13;
  double v49 = v34;
  CGFloat v50 = v15;
  CGFloat v51 = v17;
  v39 = objc_retainBlock(v46);
  v40 = v39;
  if (v4)
  {
    if (v6)
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1000743F4;
      v44[3] = &unk_1000FEA20;
      v45 = v39;
      [v6 addCoordinatedAnimationsForAnimation:v36 animations:v44 completion:0];
      v41 = v45;
    }

    else
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_100074400;
      v42[3] = &unk_1000FEA20;
      v43 = v39;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v42,  0LL,  v35);
      v41 = v43;
    }
  }

  else
  {
    ((void (*)(void *))v39[2])(v39);
  }

LABEL_15:
}

- (TVHCollectionView)collectionView
{
  return self->_collectionView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (double)headerViewBaseY
{
  return self->_headerViewBaseY;
}

- (void)setHeaderViewBaseY:(double)a3
{
  self->_headerViewBaseY = a3;
}

- (void).cxx_destruct
{
}

@end