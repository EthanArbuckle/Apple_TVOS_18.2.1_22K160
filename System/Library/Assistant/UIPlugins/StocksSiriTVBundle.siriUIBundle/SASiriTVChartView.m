@interface SASiriTVChartView
- (CGGradient)_lineBackgroundGradient;
- (SASiriTVChartView)initWithFrame:(CGRect)a3;
- (Stock)stock;
- (StockChartData)chartData;
- (UIVisualEffectView)effectView;
- (id)_graphLineColor;
- (id)_tintColorFadedByPercent:(double)a3;
- (id)_verticalLineColor;
- (void)_prepareVerticalLinesForLabelInfoArray:(id)a3;
- (void)_prepareXAxisLabelsAndPositions;
- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3;
- (void)_prepareYAxisLabelsAndPositions;
- (void)clearData;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setChartData:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setStock:(id)a3;
- (void)stockGraphViewReadyForDisplay:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SASiriTVChartView

- (SASiriTVChartView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SASiriTVChartView;
  v3 = -[SASiriTVChartView initWithFrame:]( &v27,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v6));

    v8 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v7);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SASiriTVChartView addSubview:](v4, "addSubview:", v8);
    -[SASiriTVChartView setEffectView:](v4, "setEffectView:", v8);
    v9 = -[StockGraphView initWithFrame:]( objc_alloc(&OBJC_CLASS___StockGraphView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    graph = v4->_graph;
    v4->_graph = v9;

    -[StockGraphView setChartViewDelegate:](v4->_graph, "setChartViewDelegate:", v4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[StockChartDisplayMode defaultDisplayMode](&OBJC_CLASS___StockChartDisplayMode, "defaultDisplayMode"));
    displayMode = v4->_displayMode;
    v4->_displayMode = (StockChartDisplayMode *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView _graphLineColor](v4, "_graphLineColor"));
    -[StockChartDisplayMode setLineColor:](v4->_displayMode, "setLineColor:", v13);

    -[StockChartDisplayMode setLineWidth:](v4->_displayMode, "setLineWidth:", 4.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[StockChartDisplayMode setBackgroundLinesColor:](v4->_displayMode, "setBackgroundLinesColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[StockChartDisplayMode setXAxisKeylineColor:](v4->_displayMode, "setXAxisKeylineColor:", v15);

    -[StockChartDisplayMode setShowsVolume:](v4->_displayMode, "setShowsVolume:", 0LL);
    -[StockChartDisplayMode setVolumeHeight:](v4->_displayMode, "setVolumeHeight:", 0.0);
    -[StockChartDisplayMode setShowsPriceLabelForPreviousClose:]( v4->_displayMode,  "setShowsPriceLabelForPreviousClose:",  1LL);
    -[StockChartDisplayMode setBackgroundGradient:]( v4->_displayMode,  "setBackgroundGradient:",  -[SASiriTVChartView _lineBackgroundGradient](v4, "_lineBackgroundGradient"));
    -[StockGraphView setDisplayMode:](v4->_graph, "setDisplayMode:", v4->_displayMode);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v8, "contentView"));
    [v16 addSubview:v4->_graph];

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    xAxisLabels = v4->_xAxisLabels;
    v4->_xAxisLabels = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    yAxisLabels = v4->_yAxisLabels;
    v4->_yAxisLabels = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    verticalLines = v4->_verticalLines;
    v4->_verticalLines = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___ChartLabelInfoManager);
    labelInfoManager = v4->_labelInfoManager;
    v4->_labelInfoManager = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[SASiriTVChartView setBackgroundColor:](v4, "setBackgroundColor:", v25);

    -[SASiriTVChartView setClipsToBounds:](v4, "setClipsToBounds:", 0LL);
    -[StockGraphView setClipsToBounds:](v4->_graph, "setClipsToBounds:", 0LL);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SASiriTVChartView;
  -[SASiriTVChartView dealloc](&v3, "dealloc");
}

- (void)tintColorDidChange
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SASiriTVChartView;
  -[SASiriTVChartView tintColorDidChange](&v17, "tintColorDidChange");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView _graphLineColor](self, "_graphLineColor"));
  -[StockChartDisplayMode setLineColor:](self->_displayMode, "setLineColor:", v3);

  -[StockChartDisplayMode setBackgroundGradient:]( self->_displayMode,  "setBackgroundGradient:",  -[SASiriTVChartView _lineBackgroundGradient](self, "_lineBackgroundGradient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView _verticalLineColor](self, "_verticalLineColor"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = self->_verticalLines;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "setBackgroundColor:", v4, (void)v13);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v7);
  }

  -[StockGraphView setDisplayMode:](self->_graph, "setDisplayMode:", self->_displayMode);
  if (self->_chartData && -[StockGraphView isRendered](self->_graph, "isRendered"))
  {
    graph = self->_graph;
    -[StockGraphView bounds](graph, "bounds");
    -[StockGraphView recomputePathsAndRenderIfNeededForSize:]( graph,  "recomputePathsAndRenderIfNeededForSize:",  v11,  v12);
  }
}

- (void)stockGraphViewReadyForDisplay:(id)a3
{
  xAxisLabels = self->_xAxisLabels;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_40CC;
  v9[3] = &unk_10388;
  v9[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](xAxisLabels, "enumerateObjectsUsingBlock:", v9);
  yAxisLabels = self->_yAxisLabels;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_4128;
  v8[3] = &unk_10388;
  v8[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](yAxisLabels, "enumerateObjectsUsingBlock:", v8);
  verticalLines = self->_verticalLines;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_4184;
  v7[3] = &unk_10388;
  v7[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](verticalLines, "enumerateObjectsUsingBlock:", v7);
  -[StockGraphView setNeedsDisplay](self->_graph, "setNeedsDisplay");
  -[SASiriTVChartView setNeedsDisplay](self, "setNeedsDisplay");
  -[SASiriTVChartView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStock:(id)a3
{
  v5 = (Stock *)a3;
  if (self->_stock != v5)
  {
    id v6 = v5;
    -[StockGraphView cancelRenderOperation](self->_graph, "cancelRenderOperation");
    objc_storeStrong((id *)&self->_stock, a3);
    -[SASiriTVChartView clearData](self, "clearData");
    -[SASiriTVChartView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }
}

- (void)clearData
{
  chartData = self->_chartData;
  self->_chartData = 0LL;
}

- (void)setChartData:(id)a3
{
  p_chartData = &self->_chartData;
  v9 = (StockChartData *)a3;
  if (*p_chartData != v9)
  {
    objc_storeStrong((id *)&self->_chartData, a3);
    if (*p_chartData)
    {
      -[StockGraphView loadStockChartData:](self->_graph, "loadStockChartData:", v9);
      -[StockGraphView bounds](self->_graph, "bounds");
      if (v6 != CGSizeZero.width || v7 != CGSizeZero.height)
      {
        -[StockGraphView recomputePathsAndRenderIfNeededForSize:]( self->_graph,  "recomputePathsAndRenderIfNeededForSize:",  v6,  v7);
        -[SASiriTVChartView _prepareXAxisLabelsAndPositions](self, "_prepareXAxisLabelsAndPositions");
        -[SASiriTVChartView _prepareYAxisLabelsAndPositions](self, "_prepareYAxisLabelsAndPositions");
      }
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[SASiriTVChartView bounds](self, "bounds");
  v18.origin.double x = v8;
  v18.origin.double y = v9;
  v18.size.double width = v10;
  v18.size.double height = v11;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (!CGRectEqualToRect(v17, v18))
  {
    -[StockGraphView setFrame:](self->_graph, "setFrame:", 0.0, 0.0, width, height + -70.0);
    chartData = self->_chartData;
    if (chartData)
    {
      -[StockChartData clearAllImageSets](chartData, "clearAllImageSets");
      graph = self->_graph;
      -[StockGraphView bounds](graph, "bounds");
      -[StockGraphView recomputePathsAndRenderIfNeededForSize:]( graph,  "recomputePathsAndRenderIfNeededForSize:",  v14,  v15);
      -[SASiriTVChartView _prepareXAxisLabelsAndPositions](self, "_prepareXAxisLabelsAndPositions");
      -[SASiriTVChartView _prepareYAxisLabelsAndPositions](self, "_prepareYAxisLabelsAndPositions");
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SASiriTVChartView;
  -[SASiriTVChartView setBounds:](&v16, "setBounds:", x, y, width, height);
}

- (void)layoutSubviews
{
  if (self->_chartData && -[StockGraphView isRendered](self->_graph, "isRendered"))
  {
    -[SASiriTVChartView bounds](self, "bounds");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView effectView](self, "effectView"));
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    id v44 = (id)objc_claimAutoreleasedReturnValue( -[StockChartData xAxisLabelInfoArrayForMode:]( self->_chartData,  "xAxisLabelInfoArrayForMode:",  self->_displayMode));
    double v12 = (void *)objc_claimAutoreleasedReturnValue( -[StockChartData yAxisLabelInfoArrayForMode:]( self->_chartData,  "yAxisLabelInfoArrayForMode:",  self->_displayMode));
    __int128 v13 = (char *)[v44 count];
    if (v13)
    {
      double v14 = v13;
      for (i = 0LL; i != v14; ++i)
      {
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_xAxisLabels, "objectAtIndex:", i));
        CGRect v17 = (void *)objc_claimAutoreleasedReturnValue([v44 objectAtIndex:i]);
        [v16 frame];
        double v19 = v18;
        double v21 = v20;
        [v17 position];
        double v23 = v22;
        -[StockGraphView frame](self->_graph, "frame");
        double v25 = floor(v19 * -0.5 + v23 * v24);
        -[StockGraphView bounds](self->_graph, "bounds");
        double width = v45.size.width;
        objc_msgSend(v16, "setFrame:", v25, CGRectGetMaxY(v45) + 18.0, v19, v21);
        objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_verticalLines, "objectAtIndex:", i));
        [v17 position];
        *(float *)&double v19 = v28;
        -[StockGraphView frame](self->_graph, "frame");
        *(float *)&double v29 = round(v29 + width * *(float *)&v19);
        objc_msgSend(v27, "setFrame:", *(float *)&v29, 0.0, 2.0, 500.0);
      }
    }

    v30 = (char *)[v12 count];
    if (v30)
    {
      v31 = v30;
      for (j = 0LL; j != v31; ++j)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_yAxisLabels, "objectAtIndex:", j));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:j]);
        [v33 frame];
        double v36 = v35;
        double v38 = v37;
        -[SASiriTVChartView bounds](self, "bounds");
        CGFloat v39 = CGRectGetMaxX(v46) + -92.0 - v36;
        [v34 position];
        double v41 = 1.0 - v40;
        -[StockGraphView frame](self->_graph, "frame");
        float v43 = v41 * (v42 - v38 + -5.0) + 2.0;
        objc_msgSend(v33, "setFrame:", v39, floorf(v43), v36, v38);
      }
    }
  }

- (id)_tintColorFadedByPercent:(double)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView effectView](self, "effectView"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentView]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tintColor]);

  id v7 = SASiriTVUIColorFadedByPercent(v6, a3);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)_graphLineColor
{
  return -[SASiriTVChartView _tintColorFadedByPercent:](self, "_tintColorFadedByPercent:", 0.4);
}

- (id)_verticalLineColor
{
  return -[SASiriTVChartView _tintColorFadedByPercent:](self, "_tintColorFadedByPercent:", 0.1);
}

- (CGGradient)_lineBackgroundGradient
{
  result = (CGGradient *)qword_15BB0;
  if (!qword_15BB0)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    id v6 = [v5 CGColor];
    id v7 = objc_claimAutoreleasedReturnValue( -[SASiriTVChartView _tintColorFadedByPercent:]( self, "_tintColorFadedByPercent:", 0.2));
    double v8 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, [v7 CGColor], 0);

    qword_15BB0 = (uint64_t)CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v8, 0LL);
    CGColorSpaceRelease(DeviceRGB);
    return (CGGradient *)qword_15BB0;
  }

  return result;
}

- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3
{
  id v15 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_xAxisLabels, "enumerateObjectsUsingBlock:", &stru_103C8);
  -[NSMutableArray removeAllObjects](self->_xAxisLabels, "removeAllObjects");
  double v4 = (char *)[v15 count];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v6]);
      CGFloat v11 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 string]);
      -[UILabel setText:](v11, "setText:", v12);

      -[UILabel setTextAlignment:](v11, "setTextAlignment:", 2LL);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
      -[UILabel setFont:](v11, "setFont:", v13);

      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v14);

      -[UILabel sizeToFit](v11, "sizeToFit");
      -[NSMutableArray addObject:](self->_xAxisLabels, "addObject:", v11);

      ++v6;
    }

    while (v5 != v6);
  }
}

- (void)_prepareVerticalLinesForLabelInfoArray:(id)a3
{
  id v8 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_verticalLines, "enumerateObjectsUsingBlock:", &stru_103E8);
  -[NSMutableArray removeAllObjects](self->_verticalLines, "removeAllObjects");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVChartView _verticalLineColor](self, "_verticalLineColor"));
  id v5 = (char *)[v8 count];
  if (v5)
  {
    id v6 = v5;
    do
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___UIView);
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v4);
      -[NSMutableArray addObject:](self->_verticalLines, "addObject:", v7);

      --v6;
    }

    while (v6);
  }
}

- (void)_prepareXAxisLabelsAndPositions
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v4 = [v3 copy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[StockChartData marketTimeZone](self->_chartData, "marketTimeZone"));
  [v4 setTimeZone:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StockChartData marketOpenDate](self->_chartData, "marketOpenDate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StockChartData marketCloseDate](self->_chartData, "marketCloseDate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 components:96 fromDate:v6 toDate:v7 options:0]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[StockChartData marketOpenDate](self->_chartData, "marketOpenDate"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 components:96 fromDate:v9]);

  CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[StockChartData marketCloseDate](self->_chartData, "marketCloseDate"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 components:96 fromDate:v11]);

  id v13 = [v10 minute];
  if (v13) {
    float v14 = 1.0 - (float)((float)(uint64_t)v13 / 60.0);
  }
  else {
    float v14 = 0.0;
  }
  float v15 = (float)(uint64_t)[v12 minute] / 60.0;
  float v16 = ceilf(v14);
  uint64_t v17 = (uint64_t)(float)(v16 + (float)(uint64_t)[v8 hour]) - ((float)(v15 + v14) >= 1.0);
  if (v17 <= 1) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = v17;
  }
  *(float *)&double v18 = v15 + v14;
  uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v19, v18));
  double v21 = (void *)v20;
  if ((unint64_t)(v17 - 25) > 0xFFFFFFFFFFFFFFE7LL)
  {
    double v23 = (void *)v20;
    v49 = v10;
    v50 = v8;
    id v51 = v4;
    uint64_t v24 = (uint64_t)[v12 hour];
    uint64_t v25 = -v24;
    uint64_t v26 = v17;
    do
    {
      uint64_t v27 = (v24 & ~(v24 >> 63)) + v25;
      BOOL v28 = v27 != 0;
      unint64_t v29 = ((unint64_t)(v27 - v28) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64;
      unint64_t v30 = (v27 - v28) / 0x18uLL;
      if ((v24 & ~(v24 >> 63)) + v25) {
        unint64_t v31 = v30 + 1;
      }
      else {
        unint64_t v31 = v29 >> 4;
      }
      if ((-[ChartLabelInfoManager use24hrTime](self->_labelInfoManager, "use24hrTime") & 1) != 0)
      {
        uint64_t v32 = v24 + 24 * v31;
      }

      else
      {
        uint64_t v32 = v24 + 24 * (v28 + (v29 >> 4)) - 12 * ((v24 + 24 * (v28 + (v29 >> 4))) / 0xC);
        if (!v32) {
          uint64_t v32 = 12LL;
        }
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue( -[ChartLabelInfoManager labelInfoWithString:]( self->_labelInfoManager,  "labelInfoWithString:",  v33));
      id v35 = [v34 copy];
      [v23 addObject:v35];

      --v24;
      ++v25;
      --v26;
    }

    while (v26);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    double v21 = v23;
    id v36 = v23;
    id v37 = [v36 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v37)
    {
      id v38 = v37;
      float v39 = 1.0 / (float)(v15 + (float)(v14 + (float)((float)v17 - v16)));
      float v40 = 1.0 - (float)(v39 * v15);
      uint64_t v41 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) setPosition:v40];
          float v40 = v40 - v39;
        }

        id v38 = [v36 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }

      while (v38);
    }

    if (v17 < 13)
    {
      LODWORD(v46) = 0;
    }

    else
    {
      float v43 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v36 objectAtIndex:0]);
      CGRect v45 = (void *)objc_claimAutoreleasedReturnValue([v44 string]);
      unint64_t v46 = (unint64_t)[v45 integerValue] & 1;

      [v36 removeObjectsAtIndexes:v43];
    }

    [v36 removeObjectAtIndex:0];
    id v8 = v50;
    if (v15 > 0.0 || (_DWORD)v46)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ChartLabelInfoManager labelInfoForYAxis](self->_labelInfoManager, "labelInfoForYAxis"));
      [v36 insertObject:v48 atIndex:0];
    }

    -[SASiriTVChartView _prepareXAxisLabelsForLabelInfoArray:](self, "_prepareXAxisLabelsForLabelInfoArray:", v36);
    -[SASiriTVChartView _prepareVerticalLinesForLabelInfoArray:](self, "_prepareVerticalLinesForLabelInfoArray:", v36);
    -[StockChartData setXAxisLabelInfoArray:forDisplayMode:]( self->_chartData,  "setXAxisLabelInfoArray:forDisplayMode:",  v36,  self->_displayMode);
    id v4 = v51;
    double v10 = v49;
  }

  else
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChartLabelInfoManager labelInfoForYAxis](self->_labelInfoManager, "labelInfoForYAxis"));
    [v21 addObject:v22];

    -[SASiriTVChartView _prepareXAxisLabelsForLabelInfoArray:](self, "_prepareXAxisLabelsForLabelInfoArray:", v21);
    -[SASiriTVChartView _prepareVerticalLinesForLabelInfoArray:](self, "_prepareVerticalLinesForLabelInfoArray:", v21);
    -[StockChartData setXAxisLabelInfoArray:forDisplayMode:]( self->_chartData,  "setXAxisLabelInfoArray:forDisplayMode:",  v21,  self->_displayMode);
  }
}

- (void)_prepareYAxisLabelsAndPositions
{
  float v3 = *((double *)-[StockChartData minValue](self->_chartData, "minValue") + 1);
  float v4 = *((double *)-[StockChartData maxValue](self->_chartData, "maxValue") + 1);
  float v5 = v4 - v3;
  double v6 = (float)(v4 - v3) * 0.5;
  BOOL v7 = v6 >= 2.0 && v4 >= 100.0;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  double v10 = 0LL;
  CGFloat v11 = 0LL;
  unsigned int v12 = 0;
  if (v6 >= 0.0199999996) {
    unsigned int v13 = 2;
  }
  else {
    unsigned int v13 = 3;
  }
  do
  {
    float v14 = v3 + (float)(v5 * (float)((float)v12 * 0.5));
    if (v7)
    {
      LODWORD(v8) = vcvtms_s32_f32(v14);
      float v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
      signed int v16 = 0;
    }

    else
    {
      unsigned int v17 = -[Stock pricePrecision](self->_stock, "pricePrecision");
      if (v13 <= v17) {
        signed int v16 = v17;
      }
      else {
        signed int v16 = v13;
      }
      *(float *)&double v18 = v3 + (float)(v5 * (float)((float)v12 * 0.5));
      float v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18));
    }

    id v32 = objc_alloc_init(&OBJC_CLASS___ChartLabelInfo);
    [v32 setPosition:(float)((float)(v14 - v3) / v5)];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[StockDataFormatter sharedDataFormatter](&OBJC_CLASS___StockDataFormatter, "sharedDataFormatter"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 formattedNumber:v15 withPrecision:v16 useGroupSeparator:0]);
    [v32 setString:v20];

    [v9 addObject:v32];
    double v10 = v32;
    ++v12;
    CGFloat v11 = v15;
  }

  while (v12 != 3);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_yAxisLabels, "enumerateObjectsUsingBlock:", &stru_10408);
  -[NSMutableArray removeAllObjects](self->_yAxisLabels, "removeAllObjects");
  double v21 = (char *)[v9 count];
  if (v21)
  {
    double v22 = v21;
    double v23 = 0LL;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v23]);
      BOOL v28 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
      unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 string]);
      -[UILabel setText:](v28, "setText:", v29);

      -[UILabel setTextAlignment:](v28, "setTextAlignment:", 1LL);
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
      -[UILabel setFont:](v28, "setFont:", v30);

      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v28, "setBackgroundColor:", v31);

      -[UILabel setBaselineAdjustment:](v28, "setBaselineAdjustment:", 1LL);
      -[UILabel sizeToFit](v28, "sizeToFit");
      -[NSMutableArray addObject:](self->_yAxisLabels, "addObject:", v28);

      ++v23;
    }

    while (v22 != v23);
  }

  -[StockChartData setYAxisLabelInfoArray:forDisplayMode:]( self->_chartData,  "setYAxisLabelInfoArray:forDisplayMode:",  v9,  self->_displayMode);
}

- (StockChartData)chartData
{
  return self->_chartData;
}

- (Stock)stock
{
  return self->_stock;
}

- (UIVisualEffectView)effectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end