@interface SASiriTVMultiStocksView
- (CADisplayLink)displayLink;
- (CGSize)intrinsicContentSize;
- (NSArray)stocks;
- (NSMutableArray)stockViews;
- (NSTimer)timer;
- (SASiriTVMultiStocksView)initWithStocks:(id)a3;
- (UIScrollView)scrollView;
- (void)_createExtraSubviews;
- (void)_createSubviews;
- (void)_updateScrollView:(id)a3;
- (void)layoutSubviews;
- (void)setDisplayLink:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setStockViews:(id)a3;
- (void)setStocks:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation SASiriTVMultiStocksView

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___SASiriTVMultiStocksView;
  -[SASiriTVMultiStocksView layoutSubviews](&v44, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
  [v3 contentSize];
  double v5 = v4;
  -[SASiriTVMultiStocksView bounds](self, "bounds");
  double v7 = v6;

  if (v5 <= v7)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
    [v21 contentSize];
    double v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
    [v24 contentSize];
    double v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v23, v26);

    -[SASiriTVMultiStocksView bounds](self, "bounds");
    double MidX = CGRectGetMidX(v46);
    -[SASiriTVMultiStocksView bounds](self, "bounds");
    double MidY = CGRectGetMidY(v47);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
    objc_msgSend(v19, "setCenter:", MidX, MidY);
  }

  else
  {
    -[SASiriTVMultiStocksView _createExtraSubviews](self, "_createExtraSubviews");
    -[SASiriTVMultiStocksView bounds](self, "bounds");
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView displayLink](self, "displayLink"));
    if (v17) {
      goto LABEL_6;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_updateScrollView:"));
    -[SASiriTVMultiStocksView setDisplayLink:](self, "setDisplayLink:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView displayLink](self, "displayLink"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v19 addToRunLoop:v20 forMode:NSRunLoopCommonModes];
  }

LABEL_6:
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews", 0LL));
  id v31 = [v30 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v41;
    double v34 = 53.0;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v30);
        }
        v36 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        [v36 intrinsicContentSize];
        double v38 = v37;
        objc_msgSend(v36, "setFrame:", v34, 0.0, v37, v39);
        double v34 = v34 + v38 + 53.0;
      }

      id v32 = [v30 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v32);
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  [v3 intrinsicContentSize];
  double v5 = v4;

  double v6 = UIViewNoIntrinsicMetric;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (SASiriTVMultiStocksView)initWithStocks:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SASiriTVMultiStocksView;
  double v5 = -[SASiriTVMultiStocksView init](&v10, "init");
  double v6 = v5;
  if (v5)
  {
    -[SASiriTVMultiStocksView setStocks:](v5, "setStocks:", v4);
    double v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
    -[SASiriTVMultiStocksView setStockViews:](v6, "setStockViews:", v8);

    -[SASiriTVMultiStocksView _createSubviews](v6, "_createSubviews");
  }

  return v6;
}

- (void)setStocks:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_stocks != v5)
  {
    objc_storeStrong((id *)&self->_stocks, a3);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) removeFromSuperview];
        }

        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
    [v11 removeAllObjects];

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView displayLink](self, "displayLink"));
    [v12 invalidate];

    -[SASiriTVMultiStocksView setDisplayLink:](self, "setDisplayLink:", 0LL);
    -[SASiriTVMultiStocksView _createSubviews](self, "_createSubviews");
    -[SASiriTVMultiStocksView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_createSubviews
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIScrollView);
  -[SASiriTVMultiStocksView addSubview:](self, "addSubview:", v3);
  -[SASiriTVMultiStocksView setScrollView:](self, "setScrollView:", v3);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stocks](self, "stocks", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    double v8 = 0.0;
    double v9 = 53.0;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        double v12 = objc_alloc(&OBJC_CLASS___SASiriTVStockView);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stocks](self, "stocks"));
        __int128 v14 = -[SASiriTVStockView initWithStock:comparison:]( v12,  "initWithStock:comparison:",  v11,  (unint64_t)[v13 count] > 1);

        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
        [v15 addSubview:v14];

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
        [v16 addObject:v14];

        -[SASiriTVStockView intrinsicContentSize](v14, "intrinsicContentSize");
        double v9 = v9 + v17 + 53.0;
        -[SASiriTVStockView intrinsicContentSize](v14, "intrinsicContentSize");
        if (v8 < v18) {
          double v8 = v18;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  else
  {
    double v8 = 0.0;
    double v9 = 53.0;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
  objc_msgSend(v19, "setContentSize:", v9, v8);
}

- (void)_createExtraSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
  id v4 = [v3 count];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stocks](self, "stocks"));
  id v6 = [v5 count];

  if (v4 != (id)(2LL * (void)v6))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stocks](self, "stocks", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v11);
          __int128 v13 = objc_alloc(&OBJC_CLASS___SASiriTVStockView);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stocks](self, "stocks"));
          __int128 v15 = -[SASiriTVStockView initWithStock:comparison:]( v13,  "initWithStock:comparison:",  v12,  (unint64_t)[v14 count] > 1);

          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
          [v16 addSubview:v15];

          double v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
          [v17 addObject:v15];

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v9);
    }
  }

- (void)_updateScrollView:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView", a3));
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6 + 1.0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
  objc_msgSend(v10, "setContentOffset:", v9, v8);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
  id v29 = (id)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView window](self, "window"));
  [v29 bounds];
  objc_msgSend(v12, "convertRect:fromView:", v29);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v30.origin.x = v14;
  v30.origin.y = v16;
  v30.size.width = v18;
  v30.size.height = v20;
  double MaxX = CGRectGetMaxX(v30);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView window](self, "window"));
  [v22 bounds];
  double MinX = CGRectGetMinX(v31);

  if (MaxX < MinX)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
    [v24 removeObjectAtIndex:0];

    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView stockViews](self, "stockViews"));
    [v25 addObject:v29];

    [v29 bounds];
    double v27 = v9 - (v26 + 53.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVMultiStocksView scrollView](self, "scrollView"));
    objc_msgSend(v28, "setContentOffset:", v27, v8);

    -[SASiriTVMultiStocksView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSArray)stocks
{
  return self->_stocks;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
}

- (NSMutableArray)stockViews
{
  return self->_stockViews;
}

- (void)setStockViews:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end