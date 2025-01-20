@interface TVHCollectionView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)layoutBelowDisabled;
- (NSDirectionalEdgeInsets)_directionalContentInsetFromContentInset:(UIEdgeInsets)a3;
- (NSDirectionalEdgeInsets)directionalContentInset;
- (NSIndexPath)indexPathForCurrentFocusedItem;
- (TVHCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (UIEdgeInsets)_contentInsetFromDirectionalContentInset:(NSDirectionalEdgeInsets)a3;
- (UIEdgeInsets)gradientBoundsInsets;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)playButtonRecognizer;
- (UIView)overlayLayoutView;
- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6;
- (void)_longPressAction:(id)a3;
- (void)_performBlockWithFocusedCellIndexPath:(id)a3;
- (void)_performWithoutLayoutBelow:(id)a3;
- (void)_playButtonAction:(id)a3;
- (void)_updateOverlayLayoutGuide;
- (void)adjustedContentInsetDidChange;
- (void)configureDefaultGradientMaskForDirection:(int64_t)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutBelowIfNeeded;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionalContentInset:(NSDirectionalEdgeInsets)a3;
- (void)setGradientBoundsInsets:(UIEdgeInsets)a3;
- (void)setIndexPathForCurrentFocusedItem:(id)a3;
- (void)setLayoutBelowDisabled:(BOOL)a3;
@end

@implementation TVHCollectionView

- (TVHCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  v4 = -[TVHCollectionView initWithFrame:collectionViewLayout:]( &v11,  "initWithFrame:collectionViewLayout:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[TVHCollectionView setContentInsetAdjustmentBehavior:](v4, "setContentInsetAdjustmentBehavior:", 2LL);
    v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v5,  "_playButtonAction:");
    playButtonRecognizer = v5->_playButtonRecognizer;
    v5->_playButtonRecognizer = v6;

    -[UITapGestureRecognizer setAllowedPressTypes:](v5->_playButtonRecognizer, "setAllowedPressTypes:", &off_100106C50);
    -[UITapGestureRecognizer setDelegate:](v5->_playButtonRecognizer, "setDelegate:", v5);
    -[TVHCollectionView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_playButtonRecognizer);
    v8 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v5,  "_longPressAction:");
    longPressRecognizer = v5->_longPressRecognizer;
    v5->_longPressRecognizer = v8;

    -[UILongPressGestureRecognizer setAllowedPressTypes:]( v5->_longPressRecognizer,  "setAllowedPressTypes:",  &off_100106C68);
    -[UILongPressGestureRecognizer setDelegate:](v5->_longPressRecognizer, "setDelegate:", v5);
    -[TVHCollectionView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_longPressRecognizer);
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  id v4 = a3;
  -[TVHCollectionView setDelegate:](&v9, "setDelegate:", v4);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v4,  "collectionView:didPlayItemAtIndexPath:") & 1;
  if ((objc_opt_respondsToSelector(v4, "collectionView:shouldHandleLongPressForItemAtIndexPath:") & 1) != 0) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v5;
  if ((objc_opt_respondsToSelector(v4, "collectionView:didLongPressItemAtIndexPath:") & 1) != 0) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v6;
  char v7 = objc_opt_respondsToSelector(v4, "collectionViewCanBecomeFocused:");

  if ((v7 & 1) != 0) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v8;
}

- (void)setDirectionalContentInset:(NSDirectionalEdgeInsets)a3
{
}

- (NSDirectionalEdgeInsets)directionalContentInset
{
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (UIView)overlayLayoutView
{
  overlayLayoutView = self->_overlayLayoutView;
  if (!overlayLayoutView)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___UIView);
    double v5 = self->_overlayLayoutView;
    self->_overlayLayoutView = v4;

    -[UIView setAutoresizingMask:](self->_overlayLayoutView, "setAutoresizingMask:", 0LL);
    -[UIView setHidden:](self->_overlayLayoutView, "setHidden:", 1LL);
    -[TVHCollectionView addSubview:](self, "addSubview:", self->_overlayLayoutView);
    -[TVHCollectionView _updateOverlayLayoutGuide](self, "_updateOverlayLayoutGuide");
    overlayLayoutView = self->_overlayLayoutView;
  }

  return overlayLayoutView;
}

- (void)configureDefaultGradientMaskForDirection:(int64_t)a3
{
  double v4 = -[TVHGradientMaskConfiguration initWithCollectionView:direction:]( objc_alloc(&OBJC_CLASS___TVHGradientMaskConfiguration),  "initWithCollectionView:direction:",  self,  a3);
  -[TVHGradientMaskConfiguration gradientLengths](v4, "gradientLengths");
  -[TVHCollectionView _setGradientMaskLengths:](self, "_setGradientMaskLengths:");
  -[TVHGradientMaskConfiguration gradientInset](v4, "gradientInset");
  -[TVHCollectionView _setGradientMaskEdgeInsets:](self, "_setGradientMaskEdgeInsets:");
  -[TVHGradientMaskConfiguration gradientBoundsInset](v4, "gradientBoundsInset");
  -[TVHCollectionView setGradientBoundsInsets:](self, "setGradientBoundsInsets:");
}

- (void)layoutBelowIfNeeded
{
  if (!-[TVHCollectionView layoutBelowDisabled](self, "layoutBelowDisabled"))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
    -[TVHCollectionView layoutBelowIfNeeded](&v3, "layoutBelowIfNeeded");
  }

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  -[TVHCollectionView layoutSubviews](&v3, "layoutSubviews");
  -[TVHCollectionView _updateOverlayLayoutGuide](self, "_updateOverlayLayoutGuide");
}

- (BOOL)canBecomeFocused
{
  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionView delegate](self, "delegate"));
    unsigned __int8 v5 = [v4 collectionViewCanBecomeFocused:self];

    return v5;
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
    return -[TVHCollectionView canBecomeFocused](&v6, "canBecomeFocused");
  }

- (void)setContentInset:(UIEdgeInsets)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100047FB0;
  v3[3] = &unk_1000FE078;
  UIEdgeInsets v4 = a3;
  v3[4] = self;
  -[TVHCollectionView _performWithoutLayoutBelow:](self, "_performWithoutLayoutBelow:", v3);
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  -[TVHCollectionView adjustedContentInsetDidChange](&v3, "adjustedContentInsetDidChange");
  -[TVHCollectionView _updateOverlayLayoutGuide](self, "_updateOverlayLayoutGuide");
}

- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  -[TVHCollectionView _getGradientMaskBounds:startInsets:endInsets:intensities:]( &v14,  "_getGradientMaskBounds:startInsets:endInsets:intensities:",  a3,  a4,  a5,  a6);
  -[TVHCollectionView gradientBoundsInsets](self, "gradientBoundsInsets");
  if (a3)
  {
    CGFloat v12 = v8 + a3->origin.y;
    a3->origin.x = v9 + a3->origin.x;
    a3->origin.y = v12;
    CGFloat v13 = a3->size.height - (v8 + v10);
    a3->size.width = a3->size.width - (v9 + v11);
    a3->size.height = v13;
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  -[TVHCollectionView didUpdateFocusInContext:withAnimationCoordinator:]( &v18,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  if ([v7 isDescendantOfView:self])
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          CGFloat v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v12));
          if ([v7 isDescendantOfView:v13])
          {
            id v9 = v12;

            goto LABEL_13;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIEdgeInsets v4 = (UITapGestureRecognizer *)a3;
  unsigned __int8 v5 = v4;
  if ((UITapGestureRecognizer *)self->_longPressRecognizer == v4)
  {
    char delegateFlags = (char)self->_delegateFlags;
    if ((delegateFlags & 4) != 0)
    {
      BOOL v6 = 0;
      uint64_t v10 = 0LL;
      double v11 = &v10;
      uint64_t v12 = 0x2020000000LL;
      char v13 = 0;
      if ((delegateFlags & 2) != 0)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_100048388;
        v9[3] = &unk_1000FE0A0;
        v9[4] = self;
        v9[5] = &v10;
        -[TVHCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v9);
        BOOL v6 = *((_BYTE *)v11 + 24) != 0;
      }

      _Block_object_dispose(&v10, 8);
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else if (self->_playButtonRecognizer == v4)
  {
    BOOL v6 = *(_BYTE *)&self->_delegateFlags & 1;
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIPanGestureRecognizer);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  BOOL v10 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIScreenEdgePanGestureRecognizer);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0) {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_longPressRecognizer == a3;
}

- (void)_playButtonAction:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000484E8;
  v3[3] = &unk_1000FE0C8;
  v3[4] = self;
  -[TVHCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v3);
}

- (void)_longPressAction:(id)a3
{
  if ([a3 state] == (id)1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000485B4;
    v4[3] = &unk_1000FE0C8;
    v4[4] = self;
    -[TVHCollectionView _performBlockWithFocusedCellIndexPath:](self, "_performBlockWithFocusedCellIndexPath:", v4);
  }

- (void)_updateOverlayLayoutGuide
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVHCollectionView overlayLayoutView](self, "overlayLayoutView"));
  if (v13)
  {
    -[TVHCollectionView adjustedContentInset](self, "adjustedContentInset");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[TVHCollectionView contentSize](self, "contentSize");
    objc_msgSend(v13, "setFrame:", -v6, -v4, v10 + v6 + v11, v8 + v4 + v12);
  }
}

- (void)_performWithoutLayoutBelow:(id)a3
{
  double v4 = (void (**)(void))a3;
  BOOL v5 = -[TVHCollectionView layoutBelowDisabled](self, "layoutBelowDisabled");
  -[TVHCollectionView setLayoutBelowDisabled:](self, "setLayoutBelowDisabled:", 1LL);
  v4[2](v4);

  -[TVHCollectionView setLayoutBelowDisabled:](self, "setLayoutBelowDisabled:", v5);
}

- (void)_performBlockWithFocusedCellIndexPath:(id)a3
{
  double v10 = (void (**)(id, void *))a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionView window](self, "window"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 screen]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedView]);

  if (v6)
  {
    while (1)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
        break;
      }
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 superview]);

      double v6 = (void *)v8;
      if (!v8) {
        goto LABEL_8;
      }
    }

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionView indexPathForCell:](self, "indexPathForCell:", v6));
    if (v9) {
      v10[2](v10, v9);
    }
  }

- (UIEdgeInsets)_contentInsetFromDirectionalContentInset:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  double leading = a3.leading;
  CGFloat top = a3.top;
  id v7 = -[TVHCollectionView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v7) {
    double v8 = trailing;
  }
  else {
    double v8 = leading;
  }
  if (v7) {
    double v9 = leading;
  }
  else {
    double v9 = trailing;
  }
  double v10 = top;
  double v11 = bottom;
  result.right = v9;
  result.CGFloat bottom = v11;
  result.left = v8;
  result.CGFloat top = v10;
  return result;
}

- (NSDirectionalEdgeInsets)_directionalContentInsetFromContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  id v7 = -[TVHCollectionView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v7) {
    double v8 = right;
  }
  else {
    double v8 = left;
  }
  if (v7) {
    double v9 = left;
  }
  else {
    double v9 = right;
  }
  double v10 = top;
  double v11 = bottom;
  result.double trailing = v9;
  result.CGFloat bottom = v11;
  result.double leading = v8;
  result.CGFloat top = v10;
  return result;
}

- (NSIndexPath)indexPathForCurrentFocusedItem
{
  return self->_indexPathForCurrentFocusedItem;
}

- (void)setIndexPathForCurrentFocusedItem:(id)a3
{
}

- (UITapGestureRecognizer)playButtonRecognizer
{
  return self->_playButtonRecognizer;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (UIEdgeInsets)gradientBoundsInsets
{
  double top = self->_gradientBoundsInsets.top;
  double left = self->_gradientBoundsInsets.left;
  double bottom = self->_gradientBoundsInsets.bottom;
  double right = self->_gradientBoundsInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientBoundsInsets:(UIEdgeInsets)a3
{
  self->_gradientBoundsInsets = a3;
}

- (BOOL)layoutBelowDisabled
{
  return self->_layoutBelowDisabled;
}

- (void)setLayoutBelowDisabled:(BOOL)a3
{
  self->_layoutBelowDisabled = a3;
}

- (void).cxx_destruct
{
}

@end