@interface MTTableView
- (BOOL)adjustContentOffsetForRefreshControlAsNeeded;
- (BOOL)allowsFooterViewsToFloat;
- (BOOL)disableRefreshControlWhileEditing;
- (BOOL)sectionFooterFloatingDisabled;
- (UIColor)bottomFillColor;
- (UIEdgeInsets)insetsFromRefreshControl;
- (UIView)overlayView;
- (id)preferredFocusEnvironments;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)disablePullToRefresh;
- (void)enablePullToRefresh;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustContentOffsetForRefreshControlAsNeeded:(BOOL)a3;
- (void)setBottomFillColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDisableRefreshControlWhileEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setOverlayView:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setSectionFooterFloatingDisabled:(BOOL)a3;
- (void)setTableFooterView:(id)a3;
- (void)updateRefreshControlEnabledState;
@end

@implementation MTTableView

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView layoutSubviews](&v28, "layoutSubviews");
  if (self->_bottomFillView)
  {
    BOOL v3 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
    -[MTTableView bounds](self, "bounds");
    double x = v29.origin.x;
    CGFloat y = v29.origin.y;
    double width = v29.size.width;
    CGFloat height = v29.size.height;
    double MaxY = CGRectGetMaxY(v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView tableHeaderView](self, "tableHeaderView"));
    [v9 frame];
    double v10 = CGRectGetMaxY(v30);

    v31.origin.double x = x;
    v31.origin.CGFloat y = y;
    v31.size.double width = width;
    v31.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v31);
    if (v10 >= MinY) {
      double v12 = v10;
    }
    else {
      double v12 = MinY;
    }
    v32.origin.double x = x;
    v32.origin.CGFloat y = v12;
    v32.size.double width = width;
    v32.size.CGFloat height = height;
    -[UIView setFrame:](self->_bottomFillView, "setFrame:", x, v12, width, (MaxY - CGRectGetMinY(v32)) * 1.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView backgroundView](self, "backgroundView"));

    bottomFillView = self->_bottomFillView;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView backgroundView](self, "backgroundView"));
      -[MTTableView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", bottomFillView, v15);
    }

    else
    {
      -[MTTableView sendSubviewToBack:](self, "sendSubviewToBack:", self->_bottomFillView);
    }

    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v3);
  }

  if (self->_overlayView)
  {
    -[MTTableView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[MTTableView bounds](self, "bounds");
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    -[MTTableView contentInset](self, "contentInset");
    overlayView = self->_overlayView;
    double v26 = -v25;
    v33.origin.double x = v17;
    v33.origin.CGFloat y = v19;
    v33.size.double width = v21;
    v33.size.CGFloat height = v23;
    double v27 = CGRectGetWidth(v33);
    v34.origin.double x = v17;
    v34.origin.CGFloat y = v19;
    v34.size.double width = v21;
    v34.size.CGFloat height = v23;
    -[UIView setFrame:](overlayView, "setFrame:", 0.0, v26, v27, CGRectGetHeight(v34));
  }

- (void)setTableFooterView:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTableView tableFooterView](self, "tableFooterView"));

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___MTTableView;
    -[MTTableView setTableFooterView:](&v6, "setTableFooterView:", v4);
  }
}

- (void)setOverlayView:(id)a3
{
  id v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  objc_super v6 = v4;

  -[MTTableView addSubview:](self, "addSubview:", v6);
}

- (void)setBottomFillColor:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_bottomFillColor, a3);
  -[UIView removeFromSuperview](self->_bottomFillView, "removeFromSuperview");
  bottomFillView = self->_bottomFillView;
  if (!bottomFillView)
  {
    objc_super v6 = objc_alloc(&OBJC_CLASS___UIView);
    -[MTTableView bounds](self, "bounds");
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_bottomFillView;
    self->_bottomFillView = v7;

    bottomFillView = self->_bottomFillView;
  }

  -[UIView setBackgroundColor:](bottomFillView, "setBackgroundColor:", v9);
  -[MTTableView addSubview:](self, "addSubview:", self->_bottomFillView);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView setEditing:animated:](&v5, "setEditing:animated:", a3, a4);
  -[MTTableView updateRefreshControlEnabledState](self, "updateRefreshControlEnabledState");
}

- (void)setDisableRefreshControlWhileEditing:(BOOL)a3
{
  if (self->_disableRefreshControlWhileEditing != a3)
  {
    self->_disableRefreshControlWhileEditing = a3;
    -[MTTableView updateRefreshControlEnabledState](self, "updateRefreshControlEnabledState");
  }

- (void)updateRefreshControlEnabledState
{
  if (-[MTTableView disableRefreshControlWhileEditing](self, "disableRefreshControlWhileEditing")
    && -[MTTableView isEditing](self, "isEditing"))
  {
    -[MTTableView disablePullToRefresh](self, "disablePullToRefresh");
  }

  else
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIRefreshControl superview](refreshControl, "superview"));

      if (!v4) {
        -[MTTableView enablePullToRefresh](self, "enablePullToRefresh");
      }
    }
  }

- (void)disablePullToRefresh
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView setRefreshControl:](&v2, "setRefreshControl:", 0LL);
}

- (void)enablePullToRefresh
{
  if (!-[MTTableView disableRefreshControlWhileEditing](self, "disableRefreshControlWhileEditing")
    || (-[MTTableView isEditing](self, "isEditing") & 1) == 0)
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIRefreshControl superview](refreshControl, "superview"));

      if (v4)
      {
        objc_super v5 = self->_refreshControl;
        v6.receiver = self;
        v6.super_class = (Class)&OBJC_CLASS___MTTableView;
        -[MTTableView setRefreshControl:](&v6, "setRefreshControl:", v5);
      }
    }
  }

- (void)setRefreshControl:(id)a3
{
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView setRefreshControl:](&v6, "setRefreshControl:", v5);

  -[MTTableView updateRefreshControlEnabledState](self, "updateRefreshControlEnabledState");
}

- (UIEdgeInsets)insetsFromRefreshControl
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView refreshControl](self, "refreshControl"));
  char v4 = objc_opt_respondsToSelector(v3, "_appliedInsets");

  if ((v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView refreshControl](self, "refreshControl"));
    [v5 _appliedInsets];
    CGFloat top = v6;
    CGFloat left = v8;
    CGFloat bottom = v10;
    CGFloat right = v12;
  }

  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView setContentInset:](&v3, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setContentSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView setContentSize:](&v3, "setContentSize:", a3.width, a3.height);
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView encodeRestorableStateWithCoder:](&v3, "encodeRestorableStateWithCoder:", a3);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTableView;
  -[MTTableView decodeRestorableStateWithCoder:](&v3, "decodeRestorableStateWithCoder:", a3);
}

- (id)preferredFocusEnvironments
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTableView;
  id v3 = -[MTTableView preferredFocusEnvironments](&v13, "preferredFocusEnvironments");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)v4;
  double v6 = &__NSArray0__struct;
  if (v4) {
    double v6 = (void *)v4;
  }
  id v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView tableHeaderView](self, "tableHeaderView"));
  unsigned int v9 = [v8 canBecomeFocused];

  if (v9)
  {
    id v10 = [v7 mutableCopy];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView tableHeaderView](self, "tableHeaderView"));
    [v10 insertObject:v11 atIndex:0];

    id v7 = v10;
  }

  return v7;
}

- (BOOL)allowsFooterViewsToFloat
{
  if (-[MTTableView sectionFooterFloatingDisabled](self, "sectionFooterFloatingDisabled")) {
    return 0;
  }
  else {
    return -[MTTableView _headerAndFooterViewsFloat](self, "_headerAndFooterViewsFloat");
  }
}

- (UIColor)bottomFillColor
{
  return self->_bottomFillColor;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)sectionFooterFloatingDisabled
{
  return self->_sectionFooterFloatingDisabled;
}

- (void)setSectionFooterFloatingDisabled:(BOOL)a3
{
  self->_sectionFooterFloatingDisabled = a3;
}

- (BOOL)adjustContentOffsetForRefreshControlAsNeeded
{
  return self->_adjustContentOffsetForRefreshControlAsNeeded;
}

- (void)setAdjustContentOffsetForRefreshControlAsNeeded:(BOOL)a3
{
  self->_adjustContentOffsetForRefreshControlAsNeeded = a3;
}

- (BOOL)disableRefreshControlWhileEditing
{
  return self->_disableRefreshControlWhileEditing;
}

- (void).cxx_destruct
{
}

@end