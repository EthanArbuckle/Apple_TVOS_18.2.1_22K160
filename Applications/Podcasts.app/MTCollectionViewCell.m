@interface MTCollectionViewCell
+ (Class)_contentViewClass;
+ (double)estimatedHeight;
+ (double)maximumContentWidth;
+ (id)_multiSelectCheckmarkImage;
+ (id)_multiSelectNotSelectedImage;
- (BOOL)exposedActions;
- (BOOL)isEditing;
- (BOOL)isSwipeEnabled;
- (BOOL)showsMoreButton;
- (BOOL)userSwiping;
- (CGRect)contentRectForEditControlWidth:(double)a3;
- (CGRect)editingControlRectInBounds:(CGRect)a3;
- (MTActionButtonContainerView)actionButtonsContainer;
- (MTCollectionView)collectionView;
- (MTCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTCollectionViewCellDelegate)delegate;
- (MTUIFocusedTouchGestureRecognizer)dismissOnTouchRecognizer;
- (UIButton)deleteButton;
- (UIButton)moreButton;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)defaultActionButtonsXOriginForScrollFrame:(CGRect)a3 andActionContainerSize:(CGSize)a4;
- (double)targetXOffsetForExposedActions;
- (id)contentView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)mt_collectionView;
- (id)scrollView;
- (unint64_t)swipeState;
- (void)addDismissRecognizer;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureSubviews;
- (void)deleteButtonTapped:(id)a3;
- (void)dismissDelete:(id)a3;
- (void)exposeActionsAnimated:(BOOL)a3;
- (void)hideActionsAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)moreButtonTapCancelled:(id)a3;
- (void)moreButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)removeDismissRecognizer;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewExposedDelete;
- (void)scrollViewHidDelete;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActionButtonsContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDismissOnTouchRecognizer:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setMoreButton:(id)a3;
- (void)setOpen:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)setShowsMoreButton:(BOOL)a3;
- (void)setSwipeEnabled:(BOOL)a3;
- (void)setSwipeState:(unint64_t)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUserSwiping:(BOOL)a3;
@end

@implementation MTCollectionViewCell

+ (double)estimatedHeight
{
  return 100.0;
}

+ (double)maximumContentWidth
{
  return 1.79769313e308;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIScrollView, a2);
}

+ (id)_multiSelectCheckmarkImage
{
  v2 = (void *)qword_1002B6BC0;
  if (!qword_1002B6BC0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:]( &OBJC_CLASS___UIImage,  "imageNamed:",  @"UITintedCircularButtonCheckmark.png"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 imageWithRenderingMode:2]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 _imageThatSuppressesAccessibilityHairlineThickening]);
    v6 = (void *)qword_1002B6BC0;
    qword_1002B6BC0 = v5;

    v2 = (void *)qword_1002B6BC0;
  }

  return v2;
}

+ (id)_multiSelectNotSelectedImage
{
  v2 = (void *)qword_1002B6BC8;
  if (!qword_1002B6BC8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:]( &OBJC_CLASS___UIImage,  "imageNamed:",  @"UIRemoveControlMultiNotCheckedImage.png"));
    [v3 size];
    double v5 = v4;
    double v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.780392157,  0.780392157,  0.8,  1.0));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:]( &OBJC_CLASS___UIImage,  "_tintedImageForSize:withTint:effectsImage:maskImage:style:",  v8,  0LL,  v3,  0LL,  v5,  v7));
    v10 = (void *)qword_1002B6BC8;
    qword_1002B6BC8 = v9;

    v2 = (void *)qword_1002B6BC8;
  }

  return v2;
}

- (MTCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
  v3 = -[MTCollectionViewCell initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  double v4 = v3;
  if (v3)
  {
    -[MTCollectionViewCell configureSubviews](v3, "configureSubviews");
    -[MTCollectionViewCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1LL);
  }

  return v4;
}

- (void)configureSubviews
{
  v3 = (UIScrollView *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0LL);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0LL);
  -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1LL);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1LL);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setScrollsToTop:](self->_scrollView, "setScrollsToTop:", 0LL);
  -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_scrollView, "setPreservesSuperviewLayoutMargins:", 1LL);
  -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 16LL);
  double v5 = self->_scrollView;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  -[UIScrollView addSubview:](v5, "addSubview:", v6);

  double v7 = self->_scrollView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  -[UIScrollView insertSubview:below:](v7, "insertSubview:below:", v8, v9);

  v10 = objc_alloc(&OBJC_CLASS___UIImageView);
  id v11 = [(id)objc_opt_class(self) _multiSelectNotSelectedImage];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[UIImageView initWithImage:](v10, "initWithImage:", v12);
  editingControl = self->_editingControl;
  self->_editingControl = v13;

  -[UIImageView sizeToFit](self->_editingControl, "sizeToFit");
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_editingControl);
  -[MTCollectionViewCell setShowsMoreButton:](self, "setShowsMoreButton:", 1LL);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
  id v6 = -[MTCollectionViewCell hitTest:withEvent:](&v12, "hitTest:withEvent:", a4, a3.x, a3.y);
  double v7 = (UIImageView *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
  }

  else
  {
    v8 = 0LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
  [v9 setSwipeGesture:v8];

  if (v7)
  {
  }

  if (v7 == self->_editingControl || v7 == (UIImageView *)self->_scrollView)
  {
    v10 = self;

    double v7 = (UIImageView *)v10;
  }

  return v7;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
  -[MTCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
  double y = CGPointZero.y;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v4, "setContentOffset:", CGPointZero.x, y);
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (-[MTCollectionViewCell isEditing](self, "isEditing") != a3)
  {
    self->_editing = v5;
    if (-[MTCollectionViewCell exposedActions](self, "exposedActions"))
    {
      if (!v5) {
        -[MTCollectionViewCell hideActionsAnimated:](self, "hideActionsAnimated:", v4);
      }
    }

    else
    {
      -[MTCollectionViewCell setSwipeEnabled:](self, "setSwipeEnabled:", !v5);
    }

    -[MTCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    double v7 = 0.3;
    if (!v4) {
      double v7 = 0.0;
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001010D4;
    v8[3] = &unk_10023FF98;
    v8[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v8, v7);
  }

- (void)setSelected:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
  -[MTCollectionViewCell setSelected:](&v9, "setSelected:");
  editingControl = self->_editingControl;
  id v6 = (void *)objc_opt_class(self);
  if (a3) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 _multiSelectCheckmarkImage]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 _multiSelectNotSelectedImage]);
  }
  v8 = (void *)v7;
  -[UIImageView setImage:](editingControl, "setImage:", v7);
}

- (BOOL)isSwipeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  unsigned __int8 v3 = [v2 isScrollEnabled];

  return v3;
}

- (void)setSwipeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  [v4 setScrollEnabled:v3];
}

- (BOOL)userSwiping
{
  return (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)3
      || (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)1;
}

- (BOOL)exposedActions
{
  return (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)2
      || (id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)1;
}

- (void)setShowsMoreButton:(BOOL)a3
{
  if (self->_showsMoreButton != a3)
  {
    self->_showsMoreButton = a3;
    if (a3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell moreButton](self, "moreButton"));
      v9[0] = v4;
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton"));
      v9[1] = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton"));
      v8 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    [v7 setActionButtons:v6];

    -[MTCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (CGRect)contentRectForEditControlWidth:(double)a3
{
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (-[MTCollectionViewCell isEditing](self, "isEditing")
    && !-[MTCollectionViewCell exposedActions](self, "exposedActions"))
  {
    double v10 = v10 - a3;
    unsigned int v13 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
    double v14 = -0.0;
    if (!v13) {
      double v14 = a3;
    }
    double v6 = v6 + v14;
  }

  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.double y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)editingControlRectInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 bounds];
  double v10 = v9;

  +[UIView mt_layoutMarginsForWidth:](&OBJC_CLASS___UIView, "mt_layoutMarginsForWidth:", v10);
  double MaxX = v11;
  -[UIImageView frame](self->_editingControl, "frame");
  double v14 = v13;
  double v16 = v15;
  -[MTCollectionViewCell bounds](self, "bounds");
  double v18 = IMRoundToPixel((v17 - v16) * 0.5);
  LODWORD(v8) = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  unsigned int v19 = -[MTCollectionViewCell isEditing](self, "isEditing");
  if ((_DWORD)v8)
  {
    if (v19 && !-[MTCollectionViewCell exposedActions](self, "exposedActions"))
    {
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v25) - MaxX - v14;
    }

    else
    {
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v24);
    }
  }

  else if (!v19 || -[MTCollectionViewCell exposedActions](self, "exposedActions"))
  {
    double MaxX = -v14;
  }

  double v20 = MaxX;
  double v21 = v18;
  double v22 = v14;
  double v23 = v16;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
  -[MTCollectionViewCell layoutSubviews](&v48, "layoutSubviews");
  -[MTCollectionViewCell bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[MTCollectionViewCell editingControlRectInBounds:](self, "editingControlRectInBounds:");
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  -[UIImageView setFrame:](self->_editingControl, "setFrame:");
  if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
  {
    v49.origin.CGFloat x = v4;
    v49.origin.CGFloat y = v6;
    v49.size.CGFloat width = v8;
    v49.size.CGFloat height = v10;
    double MaxX = CGRectGetMaxX(v49) - v12;
  }

  else
  {
    v50.origin.CGFloat x = v12;
    v50.origin.CGFloat y = v14;
    v50.size.CGFloat width = v16;
    v50.size.CGFloat height = v18;
    double MaxX = CGRectGetMaxX(v50);
  }

  -[MTCollectionViewCell contentRectForEditControlWidth:](self, "contentRectForEditControlWidth:", MaxX);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v29, "setFrame:", v4, v6, v8, v10);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  [v30 frame];
  double v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v33, "sizeThatFits:", v8, v10);
  double v35 = v34;
  double v37 = v36;

  -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:]( self,  "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:",  v4,  v6,  v8,  v10,  v35,  v37);
  double v39 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v40, "setFrame:", v39, v32, v35, v37);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  [v41 contentOffset];
  double v43 = v42;

  if ((id)-[MTCollectionViewCell swipeState](self, "swipeState") == (id)2 && v43 < v35)
  {
    else {
      double v44 = v35;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    objc_msgSend(v45, "setContentOffset:animated:", 0, v44, 0.0);
  }

  v51.origin.CGFloat x = v39;
  v51.origin.CGFloat y = v32;
  v51.size.CGFloat width = v35;
  v51.size.CGFloat height = v37;
  double v46 = v8 + CGRectGetWidth(v51);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v47, "setContentSize:", v46, v10);
}

- (id)scrollView
{
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
    id v4 = -[MTCollectionViewCell contentView](&v8, "contentView");
    double v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue(v4);
    double v6 = self->_scrollView;
    self->_scrollView = v5;

    scrollView = self->_scrollView;
  }

  return scrollView;
}

- (id)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UIView);
    double v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }

  return contentView;
}

- (MTActionButtonContainerView)actionButtonsContainer
{
  actionButtonsContainer = self->_actionButtonsContainer;
  if (!actionButtonsContainer)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___MTActionButtonContainerView);
    double v5 = self->_actionButtonsContainer;
    self->_actionButtonsContainer = v4;

    actionButtonsContainer = self->_actionButtonsContainer;
  }

  return actionButtonsContainer;
}

- (MTCollectionView)collectionView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UICollectionView);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  }
  else {
    double v6 = 0LL;
  }
  return (MTCollectionView *)v6;
}

- (id)mt_collectionView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTCollectionView);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  }
  else {
    double v6 = 0LL;
  }
  return v6;
}

- (UIButton)deleteButton
{
  if (!self->_deleteButton)
  {
    double v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    deleteButton = self->_deleteButton;
    self->_deleteButton = v3;

    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIButton setTintColor:](self->_deleteButton, "setTintColor:", v5);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    -[UIButton setBackgroundColor:](self->_deleteButton, "setBackgroundColor:", v6);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 18.0));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_deleteButton, "titleLabel"));
    [v8 setFont:v7];

    -[UIButton addTarget:action:forControlEvents:]( self->_deleteButton,  "addTarget:action:forControlEvents:",  self,  "deleteButtonTapped:",  64LL);
    double v9 = self->_deleteButton;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"Delete" value:&stru_100248948 table:0]);
    -[UIButton setTitle:forState:](v9, "setTitle:forState:", v11, 0LL);

    else {
      uint64_t v12 = 1LL;
    }
    -[UIButton setAutoresizingMask:](self->_deleteButton, "setAutoresizingMask:", v12);
  }

  return self->_deleteButton;
}

- (UIButton)moreButton
{
  if (!self->_moreButton)
  {
    double v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    moreButton = self->_moreButton;
    self->_moreButton = v3;

    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIButton setTintColor:](self->_moreButton, "setTintColor:", v5);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemMidGrayTintColor](&OBJC_CLASS___UIColor, "_systemMidGrayTintColor"));
    -[UIButton setBackgroundColor:](self->_moreButton, "setBackgroundColor:", v6);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 18.0));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_moreButton, "titleLabel"));
    [v8 setFont:v7];

    -[UIButton addTarget:action:forControlEvents:]( self->_moreButton,  "addTarget:action:forControlEvents:",  self,  "moreButtonTapped:",  64LL);
    -[UIButton addTarget:action:forControlEvents:]( self->_moreButton,  "addTarget:action:forControlEvents:",  self,  "moreButtonTapCancelled:",  256LL);
    double v9 = self->_moreButton;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"More" value:&stru_100248948 table:0]);
    -[UIButton setTitle:forState:](v9, "setTitle:forState:", v11, 0LL);

    else {
      uint64_t v12 = 1LL;
    }
    -[UIButton setAutoresizingMask:](self->_moreButton, "setAutoresizingMask:", v12);
  }

  return self->_moreButton;
}

- (void)deleteButtonTapped:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView", a3));
  [v4 swipeEnded:self];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate"));
  [v5 cellDidPressDelete:self];
}

- (void)moreButtonTapped:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate", a3));
  char v5 = objc_opt_respondsToSelector(v4, "cellDidPressMore:");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate"));
    [v6 cellDidPressMore:self];
  }

- (void)moreButtonTapCancelled:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  unsigned int v5 = [v4 isDragging];

  if (v5) {
    -[MTCollectionViewCell moreButtonTapped:](self, "moreButtonTapped:", v6);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTCollectionViewCell;
  -[MTCollectionViewCell applyLayoutAttributes:](&v9, "applyLayoutAttributes:", v4);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    if ([v6 isOpen])
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 swipedCellIndexPath]);

      if (!v8) {
        [v6 setOpen:0];
      }
    }

    -[MTCollectionViewCell setOpen:animated:](self, "setOpen:animated:", [v6 isOpen], 0);
  }
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    -[MTCollectionViewCell exposeActionsAnimated:](self, "exposeActionsAnimated:", a4);
    -[MTCollectionViewCell addDismissRecognizer](self, "addDismissRecognizer");
  }

  else
  {
    -[MTCollectionViewCell hideActionsAnimated:](self, "hideActionsAnimated:", a4);
    -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
  }

- (void)dismissDelete:(id)a3
{
}

- (void)addDismissRecognizer
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell dismissOnTouchRecognizer](self, "dismissOnTouchRecognizer"));
  [v4 addGestureRecognizer:v3];
}

- (void)removeDismissRecognizer
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell superview](self, "superview"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell dismissOnTouchRecognizer](self, "dismissOnTouchRecognizer"));
  [v3 removeGestureRecognizer:v4];

  -[MTCollectionViewCell setDismissOnTouchRecognizer:](self, "setDismissOnTouchRecognizer:", 0LL);
}

- (MTUIFocusedTouchGestureRecognizer)dismissOnTouchRecognizer
{
  dismissOnTouchRecognizer = self->_dismissOnTouchRecognizer;
  if (!dismissOnTouchRecognizer)
  {
    id v4 = objc_alloc(&OBJC_CLASS___MTUIFocusedTouchGestureRecognizer);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    id v6 = -[MTUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:]( v4,  "initWithFocusedView:touchAllowance:",  v5,  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    double v7 = self->_dismissOnTouchRecognizer;
    self->_dismissOnTouchRecognizer = v6;

    -[MTUIFocusedTouchGestureRecognizer addTarget:action:]( self->_dismissOnTouchRecognizer,  "addTarget:action:",  self,  "dismissDelete:");
    dismissOnTouchRecognizer = self->_dismissOnTouchRecognizer;
  }

  return dismissOnTouchRecognizer;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v42 = a3;
  [v42 contentOffset];
  if (v4 == 0.0
    || ([v42 contentOffset],
        ((-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL") ^ (v5 >= 0.0)) & 1) == 0))
  {
    objc_msgSend(v42, "setContentOffset:", 0.0, 0.0);
    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    [v32 frame];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    [v42 frame];
    -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:]( self,  "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
    double v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
    objc_msgSend(v41, "setFrame:", v40, v34, v36, v38);

    uint64_t v31 = 0LL;
LABEL_16:
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", v31);
    goto LABEL_17;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  [v6 frame];
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v42 frame];
  -[MTCollectionViewCell defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:]( self,  "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
  double v16 = v15;
  LODWORD(v6) = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  v43.origin.CGFloat x = v8;
  v43.origin.CGFloat y = v10;
  v43.size.CGFloat width = v12;
  v43.size.CGFloat height = v14;
  double Width = CGRectGetWidth(v43);
  if (!(_DWORD)v6) {
    double Width = -Width;
  }
  double v18 = v16 + Width;
  [v42 contentOffset];
  double v20 = v18 + v19;
  double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v21, "setFrame:", v20, v10, v12, v14);

  if ((id)-[MTCollectionViewCell swipeState](self, "swipeState") != (id)3)
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    [v22 contentOffset];
    double v24 = v23;

    else {
      double v25 = v24;
    }
    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
    {
      double v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
      [v26 _contentScrollInset];
      double v28 = v27;

      if (v28 == 0.0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
        objc_msgSend(v29, "_setContentScrollInset:", 0.0, v12, 0.0, 0.0);
      }
    }

    -[MTCollectionViewCell targetXOffsetForExposedActions](self, "targetXOffsetForExposedActions");
    if (v25 < fabs(v30)) {
      uint64_t v31 = 1LL;
    }
    else {
      uint64_t v31 = 2LL;
    }
    goto LABEL_16;
  }

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton", a3, a4.x, a4.y));
  [v7 frame];
  double v8 = CGRectGetWidth(v13) * 0.899999976;

  double x = a5->x;
  unsigned int v10 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  double v11 = -x;
  if (!v10) {
    double v11 = x;
  }
  if (v11 >= v8)
  {
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 1LL);
    -[MTCollectionViewCell targetXOffsetForExposedActions](self, "targetXOffsetForExposedActions");
    a5->double x = v12;
    -[MTCollectionViewCell addDismissRecognizer](self, "addDismissRecognizer");
  }

  else
  {
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 3LL);
    a5->double x = 0.0;
    -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
  }

- (void)exposeActionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 1LL);
  -[MTCollectionViewCell targetXOffsetForExposedActions](self, "targetXOffsetForExposedActions");
  double v6 = v5;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
  objc_msgSend(v7, "setContentOffset:animated:", v3, v6, 0.0);
}

- (void)hideActionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MTCollectionViewCell swipeState](self, "swipeState"))
  {
    -[MTCollectionViewCell setSwipeState:](self, "setSwipeState:", 3LL);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
    objc_msgSend(v5, "setContentOffset:animated:", v3, CGPointZero.x, CGPointZero.y);

    if (-[MTCollectionViewCell mt_isRTL](self, "mt_isRTL"))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
      [v6 _contentScrollInset];
      double v8 = v7;

      if (v8 != 0.0)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView"));
        objc_msgSend(v9, "_setContentScrollInset:", 0.0, 0.0, 0.0, 0.0);
      }
    }
  }

  -[MTCollectionViewCell removeDismissRecognizer](self, "removeDismissRecognizer");
}

- (double)targetXOffsetForExposedActions
{
  unsigned int v3 = -[MTCollectionViewCell mt_isRTL](self, "mt_isRTL");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  [v4 frame];
  double Width = CGRectGetWidth(v8);
  if (v3) {
    double v6 = -Width;
  }
  else {
    double v6 = Width;
  }

  return v6;
}

- (void)setSwipeState:(unint64_t)a3
{
  unint64_t swipeState = self->_swipeState;
  if (swipeState != a3)
  {
    self->_unint64_t swipeState = a3;
    -[MTCollectionViewCell setEditing:]( self,  "setEditing:",  -[MTCollectionViewCell exposedActions](self, "exposedActions"));
    if (!-[MTCollectionViewCell exposedActions](self, "exposedActions") || a3 == 2 && swipeState == 1)
    {
      if (!-[MTCollectionViewCell exposedActions](self, "exposedActions") && (a3 || swipeState != 3)) {
        -[MTCollectionViewCell scrollViewHidDelete](self, "scrollViewHidDelete");
      }
    }

    else
    {
      -[MTCollectionViewCell scrollViewExposedDelete](self, "scrollViewExposedDelete");
    }
  }

- (void)scrollViewHidDelete
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
  [v3 swipeEnded:self];
}

- (void)scrollViewExposedDelete
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell mt_collectionView](self, "mt_collectionView"));
  [v3 swipeBegan:self];
}

- (double)defaultActionButtonsXOriginForScrollFrame:(CGRect)a3 andActionContainerSize:(CGSize)a4
{
  double width = a4.width;
  CGFloat height = a3.size.height;
  CGFloat v6 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unsigned int v9 = -[MTCollectionViewCell mt_isRTL]( self,  "mt_isRTL",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  a4.width,  a4.height);
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = v6;
  CGFloat v13 = height;
  if (v9) {
    return CGRectGetMinX(*(CGRect *)&v10) - width;
  }
  else {
    return CGRectGetMaxX(*(CGRect *)&v10);
  }
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (MTCollectionViewCellDelegate)delegate
{
  return (MTCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)swipeState
{
  return self->_swipeState;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setDismissOnTouchRecognizer:(id)a3
{
}

- (void)setActionButtonsContainer:(id)a3
{
}

- (void)setDeleteButton:(id)a3
{
}

- (void)setMoreButton:(id)a3
{
}

- (void)setUserSwiping:(BOOL)a3
{
  self->_userSwiping = a3;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (void).cxx_destruct
{
}

@end