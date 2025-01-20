@interface TVHPreviewingListView
+ (TVHPreviewingListView)new;
- (BOOL)_shouldLayoutListOnRightSide;
- (BOOL)_shouldLayoutPreviewOnLeftSide;
- (BOOL)_shouldLayoutPreviewOnRightSide;
- (BOOL)animatesPreviewTransition;
- (BOOL)isListViewBackdropHidden;
- (BOOL)listViewRespectSafeAreaInsets;
- (BOOL)previewOnRightSide;
- (BOOL)previewViewRespectSafeAreaInsets;
- (CGRect)_adjustedFrameForPreviewFrame:(CGRect)a3;
- (CGRect)_headerViewFrame;
- (CGRect)_listHeaderViewFrameWithHeaderViewFrame:(CGRect)a3;
- (CGRect)_listViewBackdropViewFrameWithListViewFrame:(CGRect)a3;
- (CGRect)_listViewFrameWithYOffset:(double)a3;
- (CGRect)_previewFrameWithListViewFrame:(CGRect)a3;
- (NSDirectionalEdgeInsets)listHeaderViewMargin;
- (NSDirectionalEdgeInsets)listViewBackdropMargin;
- (NSDirectionalEdgeInsets)listViewMargin;
- (NSDirectionalEdgeInsets)previewViewMargin;
- (TVHListView)listView;
- (TVHPreviewingListView)init;
- (TVHPreviewingListView)initWithCoder:(id)a3;
- (TVHPreviewingListView)initWithFrame:(CGRect)a3;
- (TVHPreviewingListView)initWithFrame:(CGRect)a3 itemSize:(CGSize)a4;
- (TVHPreviewingListView)initWithFrame:(CGRect)a3 listViewLayout:(id)a4;
- (UIFocusGuide)listFocusGuide;
- (UIFocusGuide)previewFocusGuide;
- (UIImage)backgroundImage;
- (UIImageView)backgroundImageView;
- (UIView)headerView;
- (UIView)listHeaderView;
- (UIView)previewView;
- (UIVisualEffectView)listViewBackdropView;
- (double)_listViewContentWidth;
- (double)_listViewSafeAreaInsetTop;
- (double)_listViewWidth;
- (double)_listViewX;
- (double)_previewViewAnimationDuration;
- (unint64_t)listViewBackdropStyle;
- (void)_insertListViewBackdropViewAndPreviewView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAnimatesPreviewTransition:(BOOL)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setListFocusGuide:(id)a3;
- (void)setListHeaderView:(id)a3;
- (void)setListHeaderViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setListViewBackdropHidden:(BOOL)a3;
- (void)setListViewBackdropHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setListViewBackdropMargin:(NSDirectionalEdgeInsets)a3;
- (void)setListViewBackdropStyle:(unint64_t)a3;
- (void)setListViewBackdropView:(id)a3;
- (void)setListViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setListViewRespectSafeAreaInsets:(BOOL)a3;
- (void)setPreviewFocusGuide:(id)a3;
- (void)setPreviewOnRightSide:(BOOL)a3;
- (void)setPreviewView:(id)a3;
- (void)setPreviewView:(id)a3 completion:(id)a4;
- (void)setPreviewViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setPreviewViewRespectSafeAreaInsets:(BOOL)a3;
@end

@implementation TVHPreviewingListView

+ (TVHPreviewingListView)new
{
  return 0LL;
}

- (TVHPreviewingListView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHPreviewingListView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHPreviewingListView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHPreviewingListView)initWithFrame:(CGRect)a3 listViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHPreviewingListView;
  v10 = -[TVHPreviewingListView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = -[TVHListView initWithFrame:listViewLayout:]( objc_alloc(&OBJC_CLASS___TVHListView),  "initWithFrame:listViewLayout:",  v9,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    sub_100068A10((id *)&v10->super.super.super.isa, v11);
  }

  return v10;
}

- (TVHPreviewingListView)initWithFrame:(CGRect)a3 itemSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHPreviewingListView;
  v6 = -[TVHPreviewingListView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v6)
  {
    v7 = -[TVHListView initWithFrame:itemSize:]( objc_alloc(&OBJC_CLASS___TVHListView),  "initWithFrame:itemSize:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height,  width,  height);
    sub_100068A10((id *)&v6->super.super.super.isa, v7);
  }

  return v6;
}

- (void)setBackgroundImage:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView backgroundImage](self, "backgroundImage"));
  unsigned __int8 v5 = [v4 isEqual:v7];

  if ((v5 & 1) == 0)
  {
    v6 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView backgroundImageView](self, "backgroundImageView"));
    -[UIImageView removeFromSuperview](v6, "removeFromSuperview");
    if (v7)
    {
      if (!v6)
      {
        v6 = objc_alloc_init(&OBJC_CLASS___UIImageView);
        -[TVHPreviewingListView setBackgroundImageView:](self, "setBackgroundImageView:", v6);
        -[TVHPreviewingListView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0LL);
      }

      -[UIImageView setImage:](v6, "setImage:");
      -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
    }

    else
    {
      -[TVHPreviewingListView setBackgroundImageView:](self, "setBackgroundImageView:", v6);
    }
  }
}

- (UIImage)backgroundImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView backgroundImageView](self, "backgroundImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setHeaderView:(id)a3
{
  unsigned __int8 v5 = (UIView *)a3;
  headerView = self->_headerView;
  id v7 = v5;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[UIView tvh_setDebugLayoutColorType:](v7, "tvh_setDebugLayoutColorType:", 12LL);
    -[TVHPreviewingListView addSubview:](self, "addSubview:", v7);
    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setListViewMargin:(NSDirectionalEdgeInsets)a3
{
  if (self->_listViewMargin.leading != a3.leading
    || self->_listViewMargin.top != a3.top
    || self->_listViewMargin.trailing != a3.trailing
    || self->_listViewMargin.bottom != a3.bottom)
  {
    self->_listViewMargin = a3;
    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setListViewRespectSafeAreaInsets:(BOOL)a3
{
  if (self->_listViewRespectSafeAreaInsets != a3)
  {
    self->_listViewRespectSafeAreaInsets = a3;
    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setListViewBackdropStyle:(unint64_t)a3
{
  if (self->_listViewBackdropStyle != a3)
  {
    self->_listViewBackdropStyle = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listViewBackdropView](self, "listViewBackdropView"));
    [v4 removeFromSuperview];

    -[TVHPreviewingListView setListViewBackdropView:](self, "setListViewBackdropView:", 0LL);
    -[TVHPreviewingListView setListViewBackdropMargin:]( self,  "setListViewBackdropMargin:",  NSDirectionalEdgeInsetsZero.top,  NSDirectionalEdgeInsetsZero.leading,  NSDirectionalEdgeInsetsZero.bottom,  NSDirectionalEdgeInsetsZero.trailing);
    if (self->_listViewBackdropStyle)
    {
      unsigned __int8 v5 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
      v10 = -[UIVisualEffectView initWithEffect:](v5, "initWithEffect:", v6);

      -[TVHPreviewingListView setListViewBackdropView:](self, "setListViewBackdropView:", v10);
      if (self->_listViewBackdropStyle == 2)
      {
        double v7 = 36.0;
        -[UIVisualEffectView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", 36.0);
        double v8 = 41.0;
        double v9 = 36.0;
      }

      else
      {
        double v8 = 0.0;
        double v7 = 90.0;
        double v9 = 0.0;
      }

      -[TVHPreviewingListView setListViewBackdropMargin:](self, "setListViewBackdropMargin:", v8, v7, v9, v7);
      -[TVHPreviewingListView _insertListViewBackdropViewAndPreviewView]( self,  "_insertListViewBackdropViewAndPreviewView");
    }
  }

- (BOOL)isListViewBackdropHidden
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listViewBackdropView](self, "listViewBackdropView"));
  [v2 alpha];
  BOOL v4 = v3 != 0.0;

  return v4;
}

- (void)setListViewBackdropHidden:(BOOL)a3
{
}

- (void)setListViewBackdropHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  -[UIVisualEffectView alpha](self->_listViewBackdropView, "alpha");
  if (v7 != v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10006914C;
    v10[3] = &unk_1000FD818;
    v10[4] = self;
    *(double *)&v10[5] = v6;
    double v8 = objc_retainBlock(v10);
    double v9 = v8;
    if (v4) {
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x10000LL,  v8,  0LL,  0.2,  0.0);
    }
    else {
      ((void (*)(void *))v8[2])(v8);
    }
  }

- (void)setListHeaderView:(id)a3
{
  unsigned __int8 v5 = (UIView *)a3;
  listHeaderView = self->_listHeaderView;
  double v8 = v5;
  if (listHeaderView != v5)
  {
    -[UIView removeFromSuperview](listHeaderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_listHeaderView, a3);
    -[UIView tvh_setDebugLayoutColorType:](v8, "tvh_setDebugLayoutColorType:", 8LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
    -[TVHPreviewingListView insertSubview:above:](self, "insertSubview:above:", v8, v7);

    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setListHeaderViewMargin:(NSDirectionalEdgeInsets)a3
{
  if (self->_listHeaderViewMargin.leading != a3.leading
    || self->_listHeaderViewMargin.top != a3.top
    || self->_listHeaderViewMargin.trailing != a3.trailing
    || self->_listHeaderViewMargin.bottom != a3.bottom)
  {
    self->_listHeaderViewMargin = a3;
    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setPreviewView:(id)a3
{
}

- (void)setPreviewView:(id)a3 completion:(id)a4
{
  double v7 = (UIView *)a3;
  id v8 = a4;
  previewView = self->_previewView;
  if (previewView != v7)
  {
    v10 = previewView;
    v11 = v7;
    objc_storeStrong((id *)&self->_previewView, a3);
    -[UIView tvh_setDebugLayoutColorType:](self->_previewView, "tvh_setDebugLayoutColorType:", 10LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewFocusGuide](self, "previewFocusGuide"));
    if (v11)
    {
      v29 = v11;
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
      [v12 setPreferredFocusEnvironments:v13];
    }

    else
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
      v28 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
      [v12 setPreferredFocusEnvironments:v14];
    }

    [v12 setEnabled:v11 != 0];
    unsigned int v15 = -[TVHPreviewingListView animatesPreviewTransition](self, "animatesPreviewTransition");
    double v16 = 1.0;
    if (v15) {
      double v16 = 0.0;
    }
    -[UIView setAlpha:](v11, "setAlpha:", v16);
    -[TVHPreviewingListView _insertListViewBackdropViewAndPreviewView]( self,  "_insertListViewBackdropViewAndPreviewView");
    -[TVHPreviewingListView _previewViewAnimationDuration](self, "_previewViewAnimationDuration");
    double v18 = v17;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000694A4;
    v26[3] = &unk_1000FCEA8;
    v27 = v10;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000694B0;
    v21[3] = &unk_1000FED88;
    v22 = v27;
    double v25 = v18;
    v23 = v11;
    id v24 = v8;
    v19 = v11;
    v20 = v27;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v26,  v21,  v18);
  }
}

- (void)setPreviewOnRightSide:(BOOL)a3
{
  if (self->_previewOnRightSide != a3)
  {
    self->_previewOnRightSide = a3;
    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setPreviewViewRespectSafeAreaInsets:(BOOL)a3
{
  if (self->_previewViewRespectSafeAreaInsets != a3)
  {
    self->_previewViewRespectSafeAreaInsets = a3;
    -[TVHPreviewingListView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___TVHPreviewingListView;
  -[TVHPreviewingListView layoutSubviews](&v52, "layoutSubviews");
  -[TVHPreviewingListView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v51 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TVHPreviewingListView _headerViewFrame](self, "_headerViewFrame");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView headerView](self, "headerView"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[TVHPreviewingListView _listHeaderViewFrameWithHeaderViewFrame:]( self,  "_listHeaderViewFrameWithHeaderViewFrame:",  v13,  v15,  v17,  v19);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listHeaderView](self, "listHeaderView"));
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  v53.origin.double x = v13;
  v53.origin.double y = v15;
  v53.size.double width = v17;
  v53.size.double height = v19;
  double MaxY = CGRectGetMaxY(v53);
  v54.origin.double x = v22;
  v54.origin.double y = v24;
  v54.size.double width = v26;
  v54.size.double height = v28;
  double v31 = MaxY + CGRectGetMaxY(v54);
  -[TVHPreviewingListView listHeaderViewMargin](self, "listHeaderViewMargin");
  -[TVHPreviewingListView _listViewFrameWithYOffset:](self, "_listViewFrameWithYOffset:", v31 + v32);
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  CGFloat v37 = CGRectGetMinY(v55) + -10.0;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listFocusGuide](self, "listFocusGuide"));
  objc_msgSend(v38, "_setManualLayoutFrame:", 0.0, v37, v51, 10.0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listViewBackdropView](self, "listViewBackdropView"));
  -[TVHPreviewingListView _listViewBackdropViewFrameWithListViewFrame:]( self,  "_listViewBackdropViewFrameWithListViewFrame:",  x,  y,  width,  height);
  objc_msgSend(v39, "setFrame:");
  objc_msgSend(v39, "setHidden:", -[TVHPreviewingListView listViewBackdropStyle](self, "listViewBackdropStyle") == 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
  objc_msgSend(v40, "setFrame:", x, y, width, height);
  [v40 setNeedsLayout];
  -[TVHPreviewingListView _previewFrameWithListViewFrame:](self, "_previewFrameWithListViewFrame:", x, y, width, height);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewView](self, "previewView"));
  [v49 frame];
  if (CGRectIsEmpty(v56)) {
    [v49 sizeToFit];
  }
  [v49 frame];
  if (CGRectIsEmpty(v57)) {
    objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);
  }
  -[TVHPreviewingListView _adjustedFrameForPreviewFrame:](self, "_adjustedFrameForPreviewFrame:", v42, v44, v46, v48);
  objc_msgSend(v49, "setFrame:");
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewFocusGuide](self, "previewFocusGuide"));
  objc_msgSend(v50, "_setManualLayoutFrame:", v42, v44, v46, v48);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHPreviewingListView;
  -[TVHPreviewingListView didUpdateFocusInContext:withAnimationCoordinator:]( &v15,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  if (![v7 isDescendantOfView:self])
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listFocusGuide](self, "listFocusGuide"));
    double v16 = v9;
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    [v11 setPreferredFocusEnvironments:v14];

    [v11 setEnabled:1];
LABEL_8:

    goto LABEL_9;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listFocusGuide](self, "listFocusGuide"));
  [v8 setEnabled:0];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewView](self, "previewView"));
  if (v9)
  {
    unsigned int v10 = [v7 isDescendantOfView:v9];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewFocusGuide](self, "previewFocusGuide"));
    if (v10)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
      double v18 = v12;
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      [v11 setPreferredFocusEnvironments:v13];
    }

    else
    {
      double v17 = v9;
      double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      [v11 setPreferredFocusEnvironments:v12];
    }

    goto LABEL_8;
  }

- (void)_insertListViewBackdropViewAndPreviewView
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listViewBackdropView](self, "listViewBackdropView"));
  double v4 = v3;
  if (v3)
  {
    double v5 = (TVHPreviewingListView *)objc_claimAutoreleasedReturnValue([v3 superview]);

    if (v5 != self) {
      -[TVHPreviewingListView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, v10);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewView](self, "previewView"));
  double v7 = v6;
  if (v6)
  {
    double v8 = (TVHPreviewingListView *)objc_claimAutoreleasedReturnValue([v6 superview]);

    if (v8 != self)
    {
      if (v4) {
        id v9 = v4;
      }
      else {
        id v9 = v10;
      }
      -[TVHPreviewingListView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7, v9);
    }
  }
}

- (double)_previewViewAnimationDuration
{
  unsigned int v2 = -[TVHPreviewingListView animatesPreviewTransition](self, "animatesPreviewTransition");
  double result = 0.2;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (CGRect)_headerViewFrame
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView headerView](self, "headerView"));
  if (v3)
  {
    -[TVHPreviewingListView _listViewSafeAreaInsetTop](self, "_listViewSafeAreaInsetTop");
    double y = v4;
    -[TVHPreviewingListView bounds](self, "bounds");
    CGFloat width = v6;
    id v9 = objc_msgSend(v3, "sizeThatFits:", v6, v8 - y);
    double height = v10;
    CGFloat x = 0.0;
  }

  else
  {
    CGFloat x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_listHeaderViewFrameWithHeaderViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listHeaderView](self, "listHeaderView"));
  if (v8)
  {
    -[TVHPreviewingListView listHeaderViewMargin](self, "listHeaderViewMargin");
    double v10 = v9;
    double v12 = v11;
    double v36 = v13;
    double v15 = v14;
    -[TVHPreviewingListView _listViewContentWidth](self, "_listViewContentWidth");
    double v17 = v16 - v12;
    if (-[TVHPreviewingListView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
      [v18 contentInset];
      double v20 = v19;

      -[TVHPreviewingListView _listViewX](self, "_listViewX");
      double v22 = v15 + v20 + v21;
    }

    else
    {
      -[TVHPreviewingListView _listViewX](self, "_listViewX");
      double v22 = v12 + v26;
    }

    double v25 = v17 - v15;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v37);
    if (BSFloatIsZero(v28, MaxY))
    {
      -[TVHPreviewingListView _listViewSafeAreaInsetTop](self, "_listViewSafeAreaInsetTop");
      double MaxY = v29;
    }

    double v23 = v10 + MaxY;
    -[TVHPreviewingListView bounds](self, "bounds");
    objc_msgSend(v8, "sizeThatFits:", v25, v30 - v23 - v36);
    if (v31 == 0.0) {
      double v24 = 190.0;
    }
    else {
      double v24 = v31;
    }
  }

  else
  {
    double v22 = CGRectZero.origin.x;
    double v23 = CGRectZero.origin.y;
    double v25 = CGRectZero.size.width;
    double v24 = CGRectZero.size.height;
  }

  double v32 = v22;
  double v33 = v23;
  double v34 = v25;
  double v35 = v24;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (double)_listViewSafeAreaInsetTop
{
  unsigned int v3 = -[TVHPreviewingListView listViewRespectSafeAreaInsets](self, "listViewRespectSafeAreaInsets");
  double result = 0.0;
  if (v3) {
    -[TVHPreviewingListView safeAreaInsets](self, "safeAreaInsets", 0.0);
  }
  return result;
}

- (double)_listViewX
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[TVHPreviewingListView listViewMargin](self, "listViewMargin");
  double v12 = v11;
  double v14 = v13;
  id v15 = -[TVHPreviewingListView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (-[TVHPreviewingListView _shouldLayoutListOnLeftSide](self, "_shouldLayoutListOnLeftSide"))
  {
    if (v15) {
      return v14;
    }
    else {
      return v12;
    }
  }

  else
  {
    v20.origin.CGFloat x = v4;
    v20.origin.CGFloat y = v6;
    v20.size.CGFloat width = v8;
    v20.size.CGFloat height = v10;
    double MaxX = CGRectGetMaxX(v20);
    -[TVHPreviewingListView _listViewWidth](self, "_listViewWidth");
    double v19 = MaxX - v18;
    if (v15) {
      return v19 - v12;
    }
    else {
      return v19 - v14;
    }
  }

- (double)_listViewContentWidth
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 listViewLayout]);

  [v3 itemSize];
  double v5 = v4;

  return v5;
}

- (double)_listViewWidth
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView listView](self, "listView"));
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;

  -[TVHPreviewingListView _listViewContentWidth](self, "_listViewContentWidth");
  return v7 + v5 + v8;
}

- (CGRect)_listViewFrameWithYOffset:(double)a3
{
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = -[TVHPreviewingListView listViewMargin](self, "listViewMargin");
  double v15 = v14;
  double v17 = v16;
  if (BSFloatIsZero(v13, a3))
  {
    -[TVHPreviewingListView _listViewSafeAreaInsetTop](self, "_listViewSafeAreaInsetTop");
    a3 = v18;
  }

  double v19 = v15 + a3;
  v28.origin.CGFloat x = v6;
  v28.origin.CGFloat y = v8;
  v28.size.CGFloat width = v10;
  v28.size.CGFloat height = v12;
  CGFloat v20 = CGRectGetHeight(v28) - v19 - v17;
  -[TVHPreviewingListView _listViewX](self, "_listViewX");
  double v22 = v21;
  -[TVHPreviewingListView _listViewWidth](self, "_listViewWidth");
  double v24 = v23;
  double v25 = v22;
  double v26 = v19;
  double v27 = v20;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGRect)_listViewBackdropViewFrameWithListViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (-[TVHPreviewingListView listViewBackdropStyle](self, "listViewBackdropStyle"))
  {
    -[TVHPreviewingListView listViewBackdropMargin](self, "listViewBackdropMargin");
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    if (-[TVHPreviewingListView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection")) {
      double v16 = v15;
    }
    else {
      double v16 = v11;
    }
    double v17 = x - v16;
    double v18 = y - v9;
    double v19 = v15 + width + v11;
    double v20 = v13 + height + v9;
  }

  else
  {
    double v20 = 0.0;
    double v19 = 0.0;
    double v18 = 0.0;
    double v17 = 0.0;
  }

  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_previewFrameWithListViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat rect = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[TVHPreviewingListView bounds](self, "bounds");
  CGFloat v51 = v8;
  CGFloat v52 = v7;
  CGFloat v50 = v9;
  CGFloat v11 = v10;
  -[TVHPreviewingListView previewViewMargin](self, "previewViewMargin");
  double v53 = v12;
  double v54 = v13;
  double v15 = v14;
  double v17 = v16;
  -[TVHPreviewingListView listViewMargin](self, "listViewMargin");
  double v19 = v18;
  double v21 = v20;
  unsigned int v22 = -[TVHPreviewingListView _shouldLayoutPreviewOnRightSide](self, "_shouldLayoutPreviewOnRightSide");
  id v23 = -[TVHPreviewingListView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  id v24 = v23;
  if (v22)
  {
    double v48 = v15 + v21;
    double v25 = v17 + v19;
    v55.origin.CGFloat x = x;
    v55.origin.double y = rect;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v55);
    CGFloat v27 = v51;
    CGFloat v28 = v52;
    v56.origin.CGFloat x = v52;
    v56.origin.double y = v51;
    CGFloat v29 = v50;
    v56.size.CGFloat width = v50;
    v56.size.CGFloat height = v11;
    double v30 = CGRectGetMaxX(v56);
    double v31 = v48;
    if (v24) {
      double v31 = v25;
    }
    double v32 = v31 + MaxX;
    double v33 = v30 - (v31 + MaxX);
    if (v24) {
      double v34 = v15;
    }
    else {
      double v34 = v17;
    }
    double v35 = v33 - v34;
  }

  else
  {
    if (v23) {
      double v36 = v15 + v21;
    }
    else {
      double v36 = v17 + v19;
    }
    if (v23) {
      double v32 = v17;
    }
    else {
      double v32 = v15;
    }
    v57.origin.CGFloat x = x;
    v57.origin.double y = rect;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    double v35 = CGRectGetMinX(v57) - v32 - v36;
    CGFloat v27 = v51;
    CGFloat v28 = v52;
    CGFloat v29 = v50;
  }

  CGRect v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView headerView](self, "headerView", *(void *)&v48));
  v38 = v37;
  if (v37)
  {
    [v37 frame];
    double MaxY = CGRectGetMaxY(v58);
    CGFloat v40 = v11;
  }

  else
  {
    unsigned int v41 = -[TVHPreviewingListView previewViewRespectSafeAreaInsets](self, "previewViewRespectSafeAreaInsets");
    double MaxY = 0.0;
    CGFloat v40 = v11;
    if (v41) {
      -[TVHPreviewingListView safeAreaInsets](self, "safeAreaInsets", 0.0);
    }
  }

  double v42 = v53 + MaxY;
  v59.origin.CGFloat x = v28;
  v59.origin.double y = v27;
  v59.size.CGFloat width = v29;
  v59.size.CGFloat height = v40;
  CGFloat v43 = CGRectGetHeight(v59) - v42 - v54;

  double v44 = v32;
  double v45 = v42;
  double v46 = v35;
  double v47 = v43;
  result.size.CGFloat height = v47;
  result.size.CGFloat width = v46;
  result.origin.double y = v45;
  result.origin.CGFloat x = v44;
  return result;
}

- (CGRect)_adjustedFrameForPreviewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListView previewView](self, "previewView"));
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (v9 <= width && v11 <= height)
  {
    CGFloat x = UIRectCenteredIntegralRect(v12);
    CGFloat y = v14;
    double width = v15;
    double height = v16;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)_shouldLayoutListOnRightSide
{
  return -[TVHPreviewingListView _shouldLayoutPreviewOnLeftSide](self, "_shouldLayoutPreviewOnLeftSide");
}

- (BOOL)_shouldLayoutPreviewOnLeftSide
{
  return !-[TVHPreviewingListView _shouldLayoutPreviewOnRightSide](self, "_shouldLayoutPreviewOnRightSide");
}

- (BOOL)_shouldLayoutPreviewOnRightSide
{
  BOOL v3 = -[TVHPreviewingListView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 0LL;
  return -[TVHPreviewingListView previewOnRightSide](self, "previewOnRightSide") ^ v3;
}

- (BOOL)previewOnRightSide
{
  return self->_previewOnRightSide;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (TVHListView)listView
{
  return self->_listView;
}

- (NSDirectionalEdgeInsets)listViewMargin
{
  double top = self->_listViewMargin.top;
  double leading = self->_listViewMargin.leading;
  double bottom = self->_listViewMargin.bottom;
  double trailing = self->_listViewMargin.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (BOOL)listViewRespectSafeAreaInsets
{
  return self->_listViewRespectSafeAreaInsets;
}

- (unint64_t)listViewBackdropStyle
{
  return self->_listViewBackdropStyle;
}

- (UIView)listHeaderView
{
  return self->_listHeaderView;
}

- (NSDirectionalEdgeInsets)listHeaderViewMargin
{
  double top = self->_listHeaderViewMargin.top;
  double leading = self->_listHeaderViewMargin.leading;
  double bottom = self->_listHeaderViewMargin.bottom;
  double trailing = self->_listHeaderViewMargin.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (NSDirectionalEdgeInsets)previewViewMargin
{
  double top = self->_previewViewMargin.top;
  double leading = self->_previewViewMargin.leading;
  double bottom = self->_previewViewMargin.bottom;
  double trailing = self->_previewViewMargin.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setPreviewViewMargin:(NSDirectionalEdgeInsets)a3
{
  self->_previewViewMargin = a3;
}

- (BOOL)animatesPreviewTransition
{
  return self->_animatesPreviewTransition;
}

- (void)setAnimatesPreviewTransition:(BOOL)a3
{
  self->_animatesPreviewTransition = a3;
}

- (BOOL)previewViewRespectSafeAreaInsets
{
  return self->_previewViewRespectSafeAreaInsets;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIVisualEffectView)listViewBackdropView
{
  return self->_listViewBackdropView;
}

- (void)setListViewBackdropView:(id)a3
{
}

- (NSDirectionalEdgeInsets)listViewBackdropMargin
{
  double top = self->_listViewBackdropMargin.top;
  double leading = self->_listViewBackdropMargin.leading;
  double bottom = self->_listViewBackdropMargin.bottom;
  double trailing = self->_listViewBackdropMargin.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setListViewBackdropMargin:(NSDirectionalEdgeInsets)a3
{
  self->_listViewBackdropMargin = a3;
}

- (UIFocusGuide)previewFocusGuide
{
  return self->_previewFocusGuide;
}

- (void)setPreviewFocusGuide:(id)a3
{
}

- (UIFocusGuide)listFocusGuide
{
  return self->_listFocusGuide;
}

- (void)setListFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end