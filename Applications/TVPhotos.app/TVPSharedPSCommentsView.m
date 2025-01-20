@interface TVPSharedPSCommentsView
- (Class)commentsClass;
- (NSString)commentsCellReuseIdentifier;
- (NSString)headerCellReuseIdentifier;
- (NSString)subHeaderCellReuseIdentifier;
- (TVPCommentsPageView)commentsView;
- (TVPSharedPSCommentsViewDataSource)dataSource;
- (TVPSharedPSCommentsViewDelegate)delegate;
- (UIView)headerView;
- (UIView)subHeaderView;
- (id)_latestCommentIndexPathForCommentsView;
- (id)dequeueReusableViewForIdentifier:(id)a3;
- (id)preferredFocusEnvironments;
- (void)_scrollToLastComment;
- (void)layoutSubviews;
- (void)registerClass:(Class)a3 forCommentsWithReuseIdentifier:(id)a4;
- (void)registerClass:(Class)a3 forHeaderWithReuseIdentifier:(id)a4;
- (void)registerClass:(Class)a3 forSubheaderWithReuseIdentifier:(id)a4;
- (void)reloadCommentsData;
- (void)setCommentsCellReuseIdentifier:(id)a3;
- (void)setCommentsClass:(Class)a3;
- (void)setCommentsView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderCellReuseIdentifier:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setSubHeaderCellReuseIdentifier:(id)a3;
- (void)setSubHeaderView:(id)a3;
@end

@implementation TVPSharedPSCommentsView

- (void)registerClass:(Class)a3 forHeaderWithReuseIdentifier:(id)a4
{
  id v11 = a4;
  objc_storeStrong((id *)&self->_headerCellReuseIdentifier, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_headerView, "superview"));

  if (v7)
  {
    -[UIView removeFromSuperview](self->_headerView, "removeFromSuperview");
    headerView = self->_headerView;
    self->_headerView = 0LL;
  }

  v9 = (UIView *)objc_alloc_init(a3);
  v10 = self->_headerView;
  self->_headerView = v9;

  -[TVPSharedPSCommentsView addSubview:](self, "addSubview:", self->_headerView);
}

- (void)registerClass:(Class)a3 forSubheaderWithReuseIdentifier:(id)a4
{
  id v11 = a4;
  objc_storeStrong((id *)&self->_subHeaderCellReuseIdentifier, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_subHeaderView, "superview"));

  if (v7)
  {
    -[UIView removeFromSuperview](self->_subHeaderView, "removeFromSuperview");
    subHeaderView = self->_subHeaderView;
    self->_subHeaderView = 0LL;
  }

  v9 = (UIView *)objc_alloc_init(a3);
  v10 = self->_subHeaderView;
  self->_subHeaderView = v9;

  -[TVPSharedPSCommentsView addSubview:](self, "addSubview:", self->_subHeaderView);
}

- (void)registerClass:(Class)a3 forCommentsWithReuseIdentifier:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->_commentsClass, a3);
}

- (void)setDataSource:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_dataSource, v6);
  LOBYTE(p_dataSource) = objc_opt_respondsToSelector(v6, "subHeaderViewInCommentsView:");

  *(_BYTE *)&self->_dataSourceFlags = *(_BYTE *)&self->_dataSourceFlags & 0xFE | p_dataSource & 1;
}

- (void)reloadCommentsData
{
  commentsView = self->_commentsView;
  if (commentsView) {
    -[TVPCommentsPageView reloadData](commentsView, "reloadData");
  }
  -[TVPSharedPSCommentsView setNeedsLayout](self, "setNeedsLayout");
}

- (id)dequeueReusableViewForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:self->_headerCellReuseIdentifier])
  {
    id v5 = &OBJC_IVAR___TVPSharedPSCommentsView__headerView;
  }

  else
  {
    if (![v4 isEqualToString:self->_subHeaderCellReuseIdentifier])
    {
      id v6 = 0LL;
      goto LABEL_7;
    }

    id v5 = &OBJC_IVAR___TVPSharedPSCommentsView__subHeaderView;
  }

  id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
LABEL_7:

  return v6;
}

- (id)preferredFocusEnvironments
{
  if (self->_commentsView)
  {
    commentsView = self->_commentsView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &commentsView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___TVPSharedPSCommentsView;
  -[TVPSharedPSCommentsView layoutSubviews](&v33, "layoutSubviews");
  -[TVPSharedPSCommentsView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained headerViewForLikesInCommentsView:self]);

  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  [v9 commentsView:self sizeForHeaderView:v8];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v11, v13);
  if ((*(_BYTE *)&self->_dataSourceFlags & 1) == 0) {
    goto LABEL_4;
  }
  id v14 = objc_loadWeakRetained((id *)&self->_dataSource);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 subHeaderViewInCommentsView:self]);

  id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  [v16 commentsView:self sizeForHeaderView:v15];
  double v18 = v17;
  double v20 = v19;

  [v8 frame];
  objc_msgSend(v15, "setFrame:", 0.0, CGRectGetMaxY(v34) + 25.0, v18, v20);
  if (v15)
  {
    [v15 frame];
    double MaxY = CGRectGetMaxY(v35);
  }

  else
  {
LABEL_4:
    [v8 frame];
    double MaxY = CGRectGetMaxY(v36);
  }

  double v22 = MaxY + 25.0;
  double v23 = v6 - v22;
  commentsView = self->_commentsView;
  if (commentsView)
  {
    -[TVPCommentsPageView setFrame:](commentsView, "setFrame:", 0.0, v22, v4, v23);
  }

  else
  {
    v25 = objc_alloc(&OBJC_CLASS___TVPCommentsPageView);
    v26 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
    v27 = -[TVPCommentsPageView initWithFrame:collectionViewLayout:]( v25,  "initWithFrame:collectionViewLayout:",  v26,  0.0,  v22,  v4,  v23);
    v28 = self->_commentsView;
    self->_commentsView = v27;

    -[TVPCommentsPageView registerClass:forCellWithReuseIdentifier:]( self->_commentsView,  "registerClass:forCellWithReuseIdentifier:",  self->_commentsClass,  self->_commentsCellReuseIdentifier);
    v29 = self->_commentsView;
    id v30 = objc_loadWeakRetained((id *)&self->_dataSource);
    -[TVPCommentsPageView setDataSource:](v29, "setDataSource:", v30);

    v31 = self->_commentsView;
    id v32 = objc_loadWeakRetained((id *)&self->_delegate);
    -[TVPCommentsPageView setDelegate:](v31, "setDelegate:", v32);

    -[TVPSharedPSCommentsView addSubview:](self, "addSubview:", self->_commentsView);
  }

  -[TVPSharedPSCommentsView _scrollToLastComment](self, "_scrollToLastComment");
}

- (void)_scrollToLastComment
{
  if (self->_commentsView)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSCommentsView _latestCommentIndexPathForCommentsView]( self,  "_latestCommentIndexPathForCommentsView"));
    if (v3)
    {
      double v4 = v3;
      -[TVPCommentsPageView scrollToItemAtIndexPath:atScrollPosition:animated:]( self->_commentsView,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v3,  1LL,  0LL);
      double v3 = v4;
    }
  }

- (id)_latestCommentIndexPathForCommentsView
{
  double v3 = (char *)-[TVPCommentsPageView numberOfSections](self->_commentsView, "numberOfSections");
  commentsView = self->_commentsView;
  double v5 = v3 - 1;
  uint64_t v6 = (uint64_t)-[TVPCommentsPageView numberOfItemsInSection:](commentsView, "numberOfItemsInSection:", v3 - 1);
  if (v6 < 1) {
    id v7 = 0LL;
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v6 - 1,  v5));
  }
  return v7;
}

- (TVPSharedPSCommentsViewDataSource)dataSource
{
  return (TVPSharedPSCommentsViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (TVPSharedPSCommentsViewDelegate)delegate
{
  return (TVPSharedPSCommentsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)subHeaderView
{
  return self->_subHeaderView;
}

- (void)setSubHeaderView:(id)a3
{
}

- (Class)commentsClass
{
  return self->_commentsClass;
}

- (void)setCommentsClass:(Class)a3
{
}

- (TVPCommentsPageView)commentsView
{
  return self->_commentsView;
}

- (void)setCommentsView:(id)a3
{
}

- (NSString)headerCellReuseIdentifier
{
  return self->_headerCellReuseIdentifier;
}

- (void)setHeaderCellReuseIdentifier:(id)a3
{
}

- (NSString)subHeaderCellReuseIdentifier
{
  return self->_subHeaderCellReuseIdentifier;
}

- (void)setSubHeaderCellReuseIdentifier:(id)a3
{
}

- (NSString)commentsCellReuseIdentifier
{
  return self->_commentsCellReuseIdentifier;
}

- (void)setCommentsCellReuseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end