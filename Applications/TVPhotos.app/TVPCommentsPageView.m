@interface TVPCommentsPageView
- (BOOL)_performPageScrollByEvaluatingOffset:(double)a3;
- (BOOL)_scrollToNextItem;
- (BOOL)_scrollToPreviousItem;
- (BOOL)canBecomeFocused;
- (BOOL)isMaxDownScrollLimitReached;
- (BOOL)isPageScroll;
- (TVPCommentsPageView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (UISwipeGestureRecognizer)downSwipeGestureRecognizer;
- (UISwipeGestureRecognizer)upSwipeGestureRecognizer;
- (UITapGestureRecognizer)downScrollGestureRecognizer;
- (UITapGestureRecognizer)upScrollGestureRecognizer;
- (double)contentBeginYOffset;
- (double)contentHeight;
- (double)offsetToAlignLastLine;
- (double)pageOverlap;
- (double)pageScrollFinalYOffset;
- (double)pageScrollIncrementalYOffset;
- (double)pageScrollStartYOffset;
- (int64_t)_nextSectionWithItems;
- (int64_t)_previousSectionWithItems;
- (int64_t)currentIndex;
- (int64_t)currentSection;
- (int64_t)itemIndex;
- (int64_t)maxItems;
- (int64_t)sectionIndex;
- (void)_handleDownScrollButtonGesture:(id)a3;
- (void)_handleUpScrollButtonGesture:(id)a3;
- (void)_resetPageScrollOffsets;
- (void)_startPageScroll:(double)a3;
- (void)reloadData;
- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5;
- (void)setContentBeginYOffset:(double)a3;
- (void)setContentHeight:(double)a3;
- (void)setDownScrollGestureRecognizer:(id)a3;
- (void)setDownSwipeGestureRecognizer:(id)a3;
- (void)setFlowLayoutDefaultAttributes:(id)a3;
- (void)setIsMaxDownScrollLimitReached:(BOOL)a3;
- (void)setIsPageScroll:(BOOL)a3;
- (void)setItemIndex:(int64_t)a3;
- (void)setMaxItems:(int64_t)a3;
- (void)setOffsetToAlignLastLine:(double)a3;
- (void)setPageOverlap:(double)a3;
- (void)setPageScrollFinalYOffset:(double)a3;
- (void)setPageScrollIncrementalYOffset:(double)a3;
- (void)setPageScrollStartYOffset:(double)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setUpScrollGestureRecognizer:(id)a3;
- (void)setUpSwipeGestureRecognizer:(id)a3;
@end

@implementation TVPCommentsPageView

- (TVPCommentsPageView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVPCommentsPageView;
  v10 = -[TVPCommentsPageView initWithFrame:collectionViewLayout:]( &v21,  "initWithFrame:collectionViewLayout:",  v9,  x,  y,  width,  height);
  v11 = v10;
  if (v10)
  {
    -[TVPCommentsPageView setFlowLayoutDefaultAttributes:](v10, "setFlowLayoutDefaultAttributes:", v9);
    v11->_itemIndedouble x = 0LL;
    v11->_maxItems = 0LL;
    v11->_sectionIndedouble x = 0LL;
    v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v11,  "_handleUpScrollButtonGesture:");
    upScrollGestureRecognizer = v11->_upScrollGestureRecognizer;
    v11->_upScrollGestureRecognizer = v12;

    -[UITapGestureRecognizer setDelegate:](v11->_upScrollGestureRecognizer, "setDelegate:", v11);
    -[UITapGestureRecognizer setAllowedPressTypes:]( v11->_upScrollGestureRecognizer,  "setAllowedPressTypes:",  &off_1000D1B28);
    v14 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v11,  "_handleUpScrollButtonGesture:");
    upSwipeGestureRecognizer = v11->_upSwipeGestureRecognizer;
    v11->_upSwipeGestureRecognizer = v14;

    -[UISwipeGestureRecognizer setDelegate:](v11->_upSwipeGestureRecognizer, "setDelegate:", v11);
    -[UISwipeGestureRecognizer setDirection:](v11->_upSwipeGestureRecognizer, "setDirection:", 4LL);
    v16 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v11,  "_handleDownScrollButtonGesture:");
    downScrollGestureRecognizer = v11->_downScrollGestureRecognizer;
    v11->_downScrollGestureRecognizer = v16;

    -[UITapGestureRecognizer setDelegate:](v11->_downScrollGestureRecognizer, "setDelegate:", v11);
    -[UITapGestureRecognizer setAllowedPressTypes:]( v11->_downScrollGestureRecognizer,  "setAllowedPressTypes:",  &off_1000D1B40);
    v18 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v11,  "_handleDownScrollButtonGesture:");
    downSwipeGestureRecognizer = v11->_downSwipeGestureRecognizer;
    v11->_downSwipeGestureRecognizer = v18;

    -[UISwipeGestureRecognizer setDelegate:](v11->_downSwipeGestureRecognizer, "setDelegate:", v11);
    -[UISwipeGestureRecognizer setDirection:](v11->_downSwipeGestureRecognizer, "setDirection:", 8LL);
    -[TVPCommentsPageView addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_upScrollGestureRecognizer);
    -[TVPCommentsPageView addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_downScrollGestureRecognizer);
    -[TVPCommentsPageView addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_upSwipeGestureRecognizer);
    -[TVPCommentsPageView addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_downSwipeGestureRecognizer);
    -[TVPCommentsPageView _resetPageScrollOffsets](v11, "_resetPageScrollOffsets");
    v11->_isMaxDownScrollLimitReached = 0;
    -[TVPCommentsPageView setPageOverlap:](v11, "setPageOverlap:", 35.0);
  }

  return v11;
}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int64_t v9 = (int64_t)[v8 row];
  int64_t v10 = (int64_t)[v8 section];

  id v11 = -[TVPCommentsPageView numberOfSections](self, "numberOfSections");
  if ((v10 & 0x8000000000000000LL) == 0
    && v10 < (uint64_t)v11
    && (v9 & 0x8000000000000000LL) == 0
    && v9 < (uint64_t)-[TVPCommentsPageView numberOfItemsInSection:](self, "numberOfItemsInSection:", v10))
  {
    self->_itemIndedouble x = v9;
    self->_sectionIndedouble x = v10;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  self->_itemIndex,  self->_sectionIndex));
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVPCommentsPageView;
  -[TVPCommentsPageView scrollToItemAtIndexPath:atScrollPosition:animated:]( &v13,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v12,  a4,  v5);
}

- (void)setFlowLayoutDefaultAttributes:(id)a3
{
  id v3 = a3;
  [v3 setMinimumInteritemSpacing:0.0];
  [v3 setMinimumLineSpacing:25.0];
  [v3 setScrollDirection:0];
}

- (int64_t)currentIndex
{
  return self->_itemIndex;
}

- (int64_t)currentSection
{
  return self->_sectionIndex;
}

- (void)reloadData
{
  self->_itemIndedouble x = 0LL;
  self->_maxItems = 0LL;
  self->_sectionIndedouble x = 0LL;
  self->_contentHeight = 0.0;
  self->_contentBeginYOffset = 0.0;
  -[TVPCommentsPageView _resetPageScrollOffsets](self, "_resetPageScrollOffsets");
  self->_isMaxDownScrollLimitReached = 0;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPCommentsPageView;
  -[TVPCommentsPageView reloadData](&v3, "reloadData");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_handleUpScrollButtonGesture:(id)a3
{
  id v11 = a3;
  if (self->_maxItems
    || (id v4 = -[TVPCommentsPageView numberOfItemsInSection:](self, "numberOfItemsInSection:", self->_sectionIndex),
        (self->_maxItems = (int64_t)v4) != 0))
  {
    if (self->_isPageScroll)
    {
      if (self->_isMaxDownScrollLimitReached) {
        self->_isMaxDownScrollLimitReached = 0;
      }
      -[TVPCommentsPageView frame](self, "frame");
      double pageScrollIncrementalYOffset = self->_pageScrollIncrementalYOffset;
      if (pageScrollIncrementalYOffset + v5 == self->_pageScrollFinalYOffset)
      {
        self->_double pageScrollIncrementalYOffset = pageScrollIncrementalYOffset - self->_offsetToAlignLastLine;
        self->_offsetToAlignLastLine = 0.0;
        double v7 = self->_pageScrollIncrementalYOffset;
      }

      else
      {
        double v9 = v5;
        -[TVPCommentsPageView pageOverlap](self, "pageOverlap");
        double v7 = self->_pageScrollIncrementalYOffset - (v9 - v10);
        self->_double pageScrollIncrementalYOffset = v7;
      }

      -[TVPCommentsPageView setContentOffset:animated:](self, "setContentOffset:animated:", 1LL, 0.0, v7);
      if (self->_pageScrollIncrementalYOffset == self->_pageScrollStartYOffset) {
        -[TVPCommentsPageView _resetPageScrollOffsets](self, "_resetPageScrollOffsets");
      }
    }

    else if (self->_isMaxDownScrollLimitReached)
    {
      self->_isMaxDownScrollLimitReached = 0;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  self->_itemIndex,  self->_sectionIndex));
      -[TVPCommentsPageView scrollToItemAtIndexPath:atScrollPosition:animated:]( self,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v8,  1LL,  1LL);
    }

    else
    {
      -[TVPCommentsPageView _scrollToPreviousItem](self, "_scrollToPreviousItem");
    }
  }
}

- (void)_handleDownScrollButtonGesture:(id)a3
{
  id v14 = a3;
  if (self->_maxItems
    || (id v4 = -[TVPCommentsPageView numberOfItemsInSection:](self, "numberOfItemsInSection:", self->_sectionIndex),
        (self->_maxItems = (int64_t)v4) != 0))
  {
    if (self->_contentHeight == 0.0)
    {
      -[TVPCommentsPageView contentSize](self, "contentSize");
      self->_contentHeight = v5;
    }

    -[TVPCommentsPageView frame](self, "frame");
    double v7 = v6;
    if (self->_isPageScroll)
    {
      if (!-[TVPCommentsPageView _performPageScrollByEvaluatingOffset:]( self,  "_performPageScrollByEvaluatingOffset:",  v6)
        && -[TVPCommentsPageView _scrollToNextItem](self, "_scrollToNextItem"))
      {
        -[TVPCommentsPageView _resetPageScrollOffsets](self, "_resetPageScrollOffsets");
      }
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  self->_itemIndex,  self->_sectionIndex));
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCommentsPageView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v8));

      [v9 frame];
      self->_contentBeginYOffset = v10;
      [v9 frame];
      if (v11 <= v7)
      {
        double v12 = self->_contentHeight - (v7 + self->_contentBeginYOffset);
        if (v12 <= 0.0)
        {
          self->_isMaxDownScrollLimitReached = 1;
        }

        else
        {
          [v9 frame];
          if (v12 >= v13)
          {
            -[TVPCommentsPageView _scrollToNextItem](self, "_scrollToNextItem");
          }

          else
          {
            self->_isMaxDownScrollLimitReached = 1;
            -[TVPCommentsPageView setContentOffset:animated:]( self,  "setContentOffset:animated:",  1LL,  0.0,  v12 + self->_contentBeginYOffset);
          }
        }
      }

      else
      {
        -[TVPCommentsPageView _startPageScroll:](self, "_startPageScroll:", v7);
      }
    }
  }
}

- (void)_startPageScroll:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  self->_itemIndex,  self->_sectionIndex));
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVPCommentsPageView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v5));

  self->_isPageScroll = 1;
  [v10 frame];
  double v7 = v6;
  [v10 frame];
  self->_pageScrollFinalYOffset = v7 + v8;
  [v10 frame];
  self->_double pageScrollIncrementalYOffset = v9;
  self->_pageScrollStartYOffset = v9;
  -[TVPCommentsPageView _performPageScrollByEvaluatingOffset:](self, "_performPageScrollByEvaluatingOffset:", a3);
}

- (void)_resetPageScrollOffsets
{
  if (self->_isPageScroll)
  {
    self->_isPageScroll = 0;
    self->_pageScrollFinalYOffset = 0.0;
    self->_double pageScrollIncrementalYOffset = 0.0;
    self->_pageScrollStartYOffset = 0.0;
    self->_offsetToAlignLastLine = 0.0;
  }

- (BOOL)_performPageScrollByEvaluatingOffset:(double)a3
{
  double v5 = self->_pageScrollFinalYOffset - self->_pageScrollIncrementalYOffset;
  if (v5 <= a3 + a3)
  {
    if (v5 <= a3) {
      return 0;
    }
    double v8 = v5 - a3;
    self->_offsetToAlignLastLine = v8;
    double pageScrollIncrementalYOffset = self->_pageScrollIncrementalYOffset;
  }

  else
  {
    -[TVPCommentsPageView pageOverlap](self, "pageOverlap");
    double pageScrollIncrementalYOffset = a3 - v6;
    double v8 = self->_pageScrollIncrementalYOffset;
  }

  self->_double pageScrollIncrementalYOffset = v8 + pageScrollIncrementalYOffset;
  BOOL v9 = 1;
  -[TVPCommentsPageView setContentOffset:animated:](self, "setContentOffset:animated:", 1LL, 0.0);
  return v9;
}

- (BOOL)_scrollToNextItem
{
  itemIndedouble x = self->_itemIndex;
  if (itemIndex == self->_maxItems - 1)
  {
    int64_t v4 = -[TVPCommentsPageView _nextSectionWithItems](self, "_nextSectionWithItems");
    if (v4 == -1)
    {
      BOOL v7 = 0;
      self->_isMaxDownScrollLimitReached = 1;
    }

    else
    {
      int64_t v5 = v4;
      self->_maxItems = (int64_t)-[TVPCommentsPageView numberOfItemsInSection:]( self,  "numberOfItemsInSection:",  v4);
      double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  v5));
      BOOL v7 = 1;
      -[TVPCommentsPageView scrollToItemAtIndexPath:atScrollPosition:animated:]( self,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v6,  1LL,  1LL);
    }
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  itemIndex + 1,  self->_sectionIndex));
    -[TVPCommentsPageView scrollToItemAtIndexPath:atScrollPosition:animated:]( self,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v8,  1LL,  1LL);

    return 1;
  }

  return v7;
}

- (BOOL)_scrollToPreviousItem
{
  itemIndedouble x = self->_itemIndex;
  if (itemIndex)
  {
    int64_t v4 = (char *)(itemIndex - 1);
    sectionIndedouble x = self->_sectionIndex;
  }

  else
  {
    int64_t v6 = -[TVPCommentsPageView _previousSectionWithItems](self, "_previousSectionWithItems");
    if (v6 == -1) {
      return 0;
    }
    int64_t v7 = v6;
    self->_maxItems = (int64_t)-[TVPCommentsPageView numberOfItemsInSection:]( self,  "numberOfItemsInSection:",  v6);
    int64_t v4 = (char *)-[TVPCommentsPageView numberOfItemsInSection:](self, "numberOfItemsInSection:", v7) - 1;
    sectionIndedouble x = v7;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v4,  sectionIndex));
  BOOL v9 = 1;
  -[TVPCommentsPageView scrollToItemAtIndexPath:atScrollPosition:animated:]( self,  "scrollToItemAtIndexPath:atScrollPosition:animated:",  v8,  1LL,  1LL);

  return v9;
}

- (int64_t)_nextSectionWithItems
{
  sectionIndedouble x = self->_sectionIndex;
  while (sectionIndex < (uint64_t)-[TVPCommentsPageView numberOfSections](self, "numberOfSections") - 1)
  {
  }

  return -1LL;
}

- (int64_t)_previousSectionWithItems
{
  sectionIndedouble x = self->_sectionIndex;
  while (sectionIndex-- >= 1)
  {
  }

  return -1LL;
}

- (double)pageOverlap
{
  return self->_pageOverlap;
}

- (void)setPageOverlap:(double)a3
{
  self->_pageOverlap = a3;
}

- (UITapGestureRecognizer)upScrollGestureRecognizer
{
  return self->_upScrollGestureRecognizer;
}

- (void)setUpScrollGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)downScrollGestureRecognizer
{
  return self->_downScrollGestureRecognizer;
}

- (void)setDownScrollGestureRecognizer:(id)a3
{
}

- (UISwipeGestureRecognizer)upSwipeGestureRecognizer
{
  return self->_upSwipeGestureRecognizer;
}

- (void)setUpSwipeGestureRecognizer:(id)a3
{
}

- (UISwipeGestureRecognizer)downSwipeGestureRecognizer
{
  return self->_downSwipeGestureRecognizer;
}

- (void)setDownSwipeGestureRecognizer:(id)a3
{
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(int64_t)a3
{
  self->_itemIndedouble x = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndedouble x = a3;
}

- (int64_t)maxItems
{
  return self->_maxItems;
}

- (void)setMaxItems:(int64_t)a3
{
  self->_maxItems = a3;
}

- (BOOL)isPageScroll
{
  return self->_isPageScroll;
}

- (void)setIsPageScroll:(BOOL)a3
{
  self->_isPageScroll = a3;
}

- (BOOL)isMaxDownScrollLimitReached
{
  return self->_isMaxDownScrollLimitReached;
}

- (void)setIsMaxDownScrollLimitReached:(BOOL)a3
{
  self->_isMaxDownScrollLimitReached = a3;
}

- (double)pageScrollIncrementalYOffset
{
  return self->_pageScrollIncrementalYOffset;
}

- (void)setPageScrollIncrementalYOffset:(double)a3
{
  self->_double pageScrollIncrementalYOffset = a3;
}

- (double)pageScrollFinalYOffset
{
  return self->_pageScrollFinalYOffset;
}

- (void)setPageScrollFinalYOffset:(double)a3
{
  self->_pageScrollFinalYOffset = a3;
}

- (double)pageScrollStartYOffset
{
  return self->_pageScrollStartYOffset;
}

- (void)setPageScrollStartYOffset:(double)a3
{
  self->_pageScrollStartYOffset = a3;
}

- (double)offsetToAlignLastLine
{
  return self->_offsetToAlignLastLine;
}

- (void)setOffsetToAlignLastLine:(double)a3
{
  self->_offsetToAlignLastLine = a3;
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (void)setContentHeight:(double)a3
{
  self->_contentHeight = a3;
}

- (double)contentBeginYOffset
{
  return self->_contentBeginYOffset;
}

- (void)setContentBeginYOffset:(double)a3
{
  self->_contentBeginYOffset = a3;
}

- (void).cxx_destruct
{
}

@end