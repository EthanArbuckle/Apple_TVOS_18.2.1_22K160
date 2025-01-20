@interface SASiriTVSnippetViewController
- (BOOL)canBePresentedFullScreen;
- (CGSize)preferredContentSize;
- (ChartUpdater)chartUpdater;
- (NSArray)stocks;
- (NSLayoutConstraint)speakableTextToMultiStockViewConstraint;
- (NSLayoutConstraint)topConstraint;
- (SASiriTVAttributionView)attributionView;
- (SASiriTVChartView)chartView;
- (SASiriTVInfoView)infoView;
- (SASiriTVMultiStocksView)multiStocksView;
- (UILabel)speakableTextLabel;
- (UIVisualEffectView)effectView;
- (double)_speakableTextToMultiStockViewConstant;
- (id)chartData;
- (void)_createChartViewIfNeeded;
- (void)_preparePresentationForFullscreen:(BOOL)a3;
- (void)chartUpdater:(id)a3 didFailWithError:(id)a4;
- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4;
- (void)didUpdateInteractiveTransitionWithFullScreenFraction:(double)a3;
- (void)loadView;
- (void)setAceObject:(id)a3;
- (void)setAttributionView:(id)a3;
- (void)setChartData:(id)a3;
- (void)setChartUpdater:(id)a3;
- (void)setChartView:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setMultiStocksView:(id)a3;
- (void)setSpeakableTextLabel:(id)a3;
- (void)setSpeakableTextToMultiStockViewConstraint:(id)a3;
- (void)setStocks:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginInteractiveTransition;
- (void)willEndInteractiveTransitionFromFullScreenFraction:(double)a3 toFullScreenFraction:(double)a4 velocity:(CGPoint)a5;
@end

@implementation SASiriTVSnippetViewController

- (CGSize)preferredContentSize
{
  double v2 = 1920.0;
  double v3 = 230.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)loadView
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___SASiriTVSnippetViewController;
  -[SASiriTVSnippetViewController loadView](&v47, "loadView");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setAllowsGroupBlending:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v5));

  v6 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v46);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v6,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  [v7 addSubview:v6];

  -[SASiriTVSnippetViewController setEffectView:](self, "setEffectView:", v6);
  v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
  -[UILabel setFont:](v8, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController currentUtterance](self, "currentUtterance"));
  -[UILabel setText:](v8, "setText:", v10);

  -[UILabel setAdjustsFontSizeToFitWidth:](v8, "setAdjustsFontSizeToFitWidth:", 1LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v6, "contentView"));
  [v11 addSubview:v8];

  -[SASiriTVSnippetViewController setSpeakableTextLabel:](self, "setSpeakableTextLabel:", v8);
  v13 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  5LL,  0LL,  v14,  5LL,  1.0,  0.0));
  [v13 addObject:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  6LL,  0LL,  v16,  6LL,  1.0,  0.0));
  [v13 addObject:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  3LL,  0LL,  v18,  3LL,  1.0,  0.0));
  [v13 addObject:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  4LL,  0LL,  v20,  4LL,  1.0,  0.0));
  [v13 addObject:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  3LL,  0LL,  v22,  3LL,  1.0,  33.0));

  -[SASiriTVSnippetViewController setTopConstraint:](self, "setTopConstraint:", v23);
  [v13 addObject:v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v8, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 layoutMarginsGuide]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 leadingAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintGreaterThanOrEqualToAnchor:v27]);
  [v13 addObject:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v29,  9LL,  0LL,  v8,  9LL,  1.0,  0.0));
  [v13 addObject:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 layoutMarginsGuide]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 trailingAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintLessThanOrEqualToAnchor:v34]);
  [v13 addObject:v35];

  v36 = objc_alloc(&OBJC_CLASS___SASiriTVMultiStocksView);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
  v38 = -[SASiriTVMultiStocksView initWithStocks:](v36, "initWithStocks:", v37);

  -[SASiriTVMultiStocksView setTranslatesAutoresizingMaskIntoConstraints:]( v38,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  [v39 addSubview:v38];

  -[SASiriTVSnippetViewController setMultiStocksView:](self, "setMultiStocksView:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v40,  5LL,  0LL,  v38,  5LL,  1.0,  0.0));
  [v13 addObject:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v42,  6LL,  0LL,  v38,  6LL,  1.0,  0.0));
  [v13 addObject:v43];

  -[SASiriTVSnippetViewController _speakableTextToMultiStockViewConstant]( self,  "_speakableTextToMultiStockViewConstant");
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v38,  3LL,  0LL,  v8,  4LL,  1.0,  v44));
  [v13 addObject:v45];
  -[SASiriTVSnippetViewController setSpeakableTextToMultiStockViewConstraint:]( self,  "setSpeakableTextToMultiStockViewConstraint:",  v45);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SASiriTVSnippetViewController;
  -[SASiriTVSnippetViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
  v5 = (char *)[v4 count];

  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    -[SASiriTVSnippetViewController _createChartViewIfNeeded](self, "_createChartViewIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
    [v6 setHidden:1];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
    [v9 setStock:v8];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController delegate](self, "delegate"));
  id v11 = [v10 isPresentedFullScreen];

  -[SASiriTVSnippetViewController _preparePresentationForFullscreen:](self, "_preparePresentationForFullscreen:", v11);
  double v12 = 0.0;
  if ((_DWORD)v11) {
    double v12 = 1.0;
  }
  -[SASiriTVSnippetViewController didUpdateInteractiveTransitionWithFullScreenFraction:]( self,  "didUpdateInteractiveTransitionWithFullScreenFraction:",  v12);
}

- (void)setAceObject:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stocks", 0));
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = -[Stock initWithSiriStockObject:]( objc_alloc(&OBJC_CLASS___Stock),  "initWithSiriStockObject:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v11));
        if (v12) {
          [v6 addObject:v12];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v9);
  }

  -[SASiriTVSnippetViewController setStocks:](self, "setStocks:", v6);
  if ([v6 count] == (char *)&dword_0 + 1)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartUpdater](self, "chartUpdater"));

    if (!v13)
    {
      v15 = (void *)objc_opt_new(&OBJC_CLASS___ChartUpdater, v14);
      -[SASiriTVSnippetViewController setChartUpdater:](self, "setChartUpdater:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartUpdater](self, "chartUpdater"));
      [v16 setDelegate:self];
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 stocks]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 chartData]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartUpdater](self, "chartUpdater"));
    if (v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v18 chartData]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dataUsingEncoding:4]);
      [v20 parseData:v22];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      [v20 updateChartForStock:v22 interval:0];
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController viewIfLoaded](self, "viewIfLoaded"));
    if (v23)
    {
      -[SASiriTVSnippetViewController _createChartViewIfNeeded](self, "_createChartViewIfNeeded");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
      [v26 setStock:v25];
    }
  }

  -[SASiriTVSnippetViewController _speakableTextToMultiStockViewConstant]( self,  "_speakableTextToMultiStockViewConstant");
  double v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue( -[SASiriTVSnippetViewController speakableTextToMultiStockViewConstraint]( self,  "speakableTextToMultiStockViewConstraint"));
  [v29 setConstant:v28];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController delegate](self, "delegate"));
  else {
    BOOL v31 = 0LL;
  }

  -[SASiriTVSnippetViewController _preparePresentationForFullscreen:](self, "_preparePresentationForFullscreen:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  [v32 layoutIfNeeded];
}

- (void)setStocks:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController currentUtterance](self, "currentUtterance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController speakableTextLabel](self, "speakableTextLabel"));
  [v7 setText:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController multiStocksView](self, "multiStocksView"));
  [v8 setStocks:v5];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
  [v10 setStock:v12];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController infoView](self, "infoView"));
  [v11 setStock:v12];
}

- (BOOL)canBePresentedFullScreen
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
  BOOL v3 = [v2 count] == (char *)&dword_0 + 1;

  return v3;
}

- (void)willBeginInteractiveTransition
{
}

- (void)didUpdateInteractiveTransitionWithFullScreenFraction:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController topConstraint](self, "topConstraint"));
  [v5 setConstant:a3 * 62.0 + 33.0];

  -[SASiriTVSnippetViewController _speakableTextToMultiStockViewConstant]( self,  "_speakableTextToMultiStockViewConstant");
  double v7 = v6 + (15.0 - v6) * a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SASiriTVSnippetViewController speakableTextToMultiStockViewConstraint]( self,  "speakableTextToMultiStockViewConstraint"));
  [v8 setConstant:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  [v9 setNeedsLayout];
}

- (void)willEndInteractiveTransitionFromFullScreenFraction:(double)a3 toFullScreenFraction:(double)a4 velocity:(CGPoint)a5
{
  double v7 = dbl_D810[a4 == 1.0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController topConstraint](self, "topConstraint", a3));
  [v8 setConstant:v7];

  BOOL v9 = a4 == 1.0;
  double v10 = 15.0;
  if (!v9)
  {
    -[SASiriTVSnippetViewController _speakableTextToMultiStockViewConstant]( self,  "_speakableTextToMultiStockViewConstant");
    double v10 = v11;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SASiriTVSnippetViewController speakableTextToMultiStockViewConstraint]( self,  "speakableTextToMultiStockViewConstraint"));
  [v12 setConstant:v10];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
  [v13 setNeedsLayout];
}

- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4
{
  id v10 = a4;
  -[SASiriTVSnippetViewController setChartData:](self, "setChartData:");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
    unsigned __int8 v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
      [v9 setChartData:v10];
    }
  }
}

- (void)chartUpdater:(id)a3 didFailWithError:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_AA40((uint64_t)a4);
  }
}

- (void)_preparePresentationForFullscreen:(BOOL)a3
{
  BOOL v4 = !a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
  [v5 setHidden:v4];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController infoView](self, "infoView"));
  [v6 setHidden:v4];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController attributionView](self, "attributionView"));
  [v7 setHidden:v4];

  if (!v4)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartData](self, "chartData"));

    if (v8)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartData](self, "chartData"));
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
      [v9 setChartData:v10];
    }
  }

- (double)_speakableTextToMultiStockViewConstant
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
  else {
    double v3 = -4.0;
  }

  return v3;
}

- (void)_createChartViewIfNeeded
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));

  if (!v3)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___SASiriTVChartView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    objc_super v47 = -[SASiriTVChartView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[SASiriTVChartView setTranslatesAutoresizingMaskIntoConstraints:]( v47,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    [v8 addSubview:v47];

    -[SASiriTVSnippetViewController setChartView:](self, "setChartView:", v47);
    id v10 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v9);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  5LL,  0LL,  v47,  5LL,  1.0,  0.0));
    [v10 addObject:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  6LL,  0LL,  v47,  6LL,  1.0,  0.0));
    [v10 addObject:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController multiStocksView](self, "multiStocksView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v47,  3LL,  0LL,  v15,  4LL,  1.0,  79.0));
    [v10 addObject:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController chartView](self, "chartView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  8LL,  0LL,  0LL,  0LL,  0.0,  570.0));
    [v10 addObject:v18];

    v19 = -[SASiriTVInfoView initWithFrame:]( objc_alloc(&OBJC_CLASS___SASiriTVInfoView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    -[SASiriTVInfoView setTranslatesAutoresizingMaskIntoConstraints:]( v19,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SASiriTVInfoView setHidden:](v19, "setHidden:", 1LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController stocks](self, "stocks"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
    -[SASiriTVInfoView setStock:](v19, "setStock:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    [v22 addSubview:v19];

    -[SASiriTVSnippetViewController setInfoView:](self, "setInfoView:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v19,  3LL,  0LL,  v47,  4LL,  1.0,  50.0));
    [v10 addObject:v23];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v19,  9LL,  0LL,  v24,  9LL,  1.0,  0.0));
    [v10 addObject:v25];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView leadingAnchor](v19, "leadingAnchor"));
    double v27 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 leadingAnchor]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintGreaterThanOrEqualToAnchor:v28]);
    [v10 addObject:v29];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVInfoView trailingAnchor](v19, "trailingAnchor"));
    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 trailingAnchor]);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintLessThanOrEqualToAnchor:v32]);
    [v10 addObject:v33];

    __int128 v34 = -[SASiriTVAttributionView initWithFrame:]( objc_alloc(&OBJC_CLASS___SASiriTVAttributionView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    -[SASiriTVAttributionView setTranslatesAutoresizingMaskIntoConstraints:]( v34,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SASiriTVAttributionView setHidden:](v34, "setHidden:", 1LL);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    [v35 addSubview:v34];

    -[SASiriTVSnippetViewController setAttributionView:](self, "setAttributionView:", v34);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v36 bounds];
    double v38 = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController attributionView](self, "attributionView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 bottomAnchor]);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 topAnchor]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v42 constant:v38 + -30.0]);
    [v10 addObject:v43];

    double v44 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController attributionView](self, "attributionView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVSnippetViewController view](self, "view"));
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v44,  6LL,  0LL,  v45,  6LL,  1.0,  -30.0));
    [v10 addObject:v46];

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v10);
  }

- (NSArray)stocks
{
  return self->_stocks;
}

- (UIVisualEffectView)effectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
}

- (UILabel)speakableTextLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_speakableTextLabel);
}

- (void)setSpeakableTextLabel:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_topConstraint);
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)speakableTextToMultiStockViewConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_speakableTextToMultiStockViewConstraint);
}

- (void)setSpeakableTextToMultiStockViewConstraint:(id)a3
{
}

- (SASiriTVMultiStocksView)multiStocksView
{
  return (SASiriTVMultiStocksView *)objc_loadWeakRetained((id *)&self->_multiStocksView);
}

- (void)setMultiStocksView:(id)a3
{
}

- (ChartUpdater)chartUpdater
{
  return self->_chartUpdater;
}

- (void)setChartUpdater:(id)a3
{
}

- (id)chartData
{
  return self->_chartData;
}

- (void)setChartData:(id)a3
{
}

- (SASiriTVChartView)chartView
{
  return (SASiriTVChartView *)objc_loadWeakRetained((id *)&self->_chartView);
}

- (void)setChartView:(id)a3
{
}

- (SASiriTVInfoView)infoView
{
  return (SASiriTVInfoView *)objc_loadWeakRetained((id *)&self->_infoView);
}

- (void)setInfoView:(id)a3
{
}

- (SASiriTVAttributionView)attributionView
{
  return (SASiriTVAttributionView *)objc_loadWeakRetained((id *)&self->_attributionView);
}

- (void)setAttributionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end