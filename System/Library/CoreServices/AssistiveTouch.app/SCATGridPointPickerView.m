@interface SCATGridPointPickerView
- (BOOL)isCenterPointVisible;
- (CGPath)pathForCenterPointAtSelectionPath:(id)a3;
- (CGRect)_availableFrameForCenterPointAtSelectionPath:(id)a3;
- (CGRect)frameForCenterPointAtSelectionPath:(id)a3;
- (CGRect)frameForSelectionPath:(id)a3;
- (NSIndexPath)currentSelectionPath;
- (SCATGridPointPickerView)initWithFrame:(CGRect)a3;
- (id)centerPointImageForGrid:(id)a3;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_updateGridProperties;
- (void)layoutSubviews;
- (void)setCenterPointVisible:(BOOL)a3;
- (void)setCurrentSelectionPath:(id)a3;
@end

@implementation SCATGridPointPickerView

- (SCATGridPointPickerView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATGridPointPickerView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v6 = -[SCATGridPointPickerView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
    v8 = -[SCATGridView initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATGridView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    grid = v6->_grid;
    v6->_grid = v8;

    -[SCATGridView setDelegate:](v6->_grid, "setDelegate:", v6);
    -[SCATGridView setAutoresizingMask:](v6->_grid, "setAutoresizingMask:", 18LL);
    -[SCATGridView setNumberOfColumns:](v6->_grid, "setNumberOfColumns:", 3LL);
    [v7 gridLineThickness];
    -[SCATGridView setLineThickness:](v6->_grid, "setLineThickness:");
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 gridColor]);
    -[SCATGridView setLineColor:](v6->_grid, "setLineColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 gridShadowColor]);
    -[SCATGridView setShadowColor:](v6->_grid, "setShadowColor:", v11);

    [v7 gridShadowOffset];
    -[SCATGridView setShadowOffset:](v6->_grid, "setShadowOffset:");
    -[SCATGridPointPickerView _updateGridProperties](v6, "_updateGridProperties");
    -[SCATGridPointPickerView addSubview:](v6, "addSubview:", v6->_grid);
  }

  return v6;
}

- (unint64_t)numberOfRows
{
  return 3LL;
}

- (unint64_t)numberOfColumns
{
  return 3LL;
}

- (BOOL)isCenterPointVisible
{
  return -[SCATGridView isCenterPointVisible](self->_grid, "isCenterPointVisible");
}

- (void)setCenterPointVisible:(BOOL)a3
{
}

- (CGRect)frameForSelectionPath:(id)a3
{
  id v4 = a3;
  -[SCATGridPointPickerView bounds](self, "bounds");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = (char *)[v4 length];
  if (v13)
  {
    v14 = v13;
    for (i = 0LL; i != v14; ++i)
    {
      double v16 = (double)(unint64_t)[v4 indexAtPosition:i];
      if ((i & 1) != 0)
      {
        double v10 = v10 / (double)-[SCATGridPointPickerView numberOfColumns](self, "numberOfColumns");
        double v6 = v6 + v16 * v10;
      }

      else
      {
        double v12 = v12 / (double)-[SCATGridPointPickerView numberOfRows](self, "numberOfRows");
        double v8 = v8 + v16 * v12;
      }
    }
  }

  v25.origin.CGFloat x = v6;
  v25.origin.CGFloat y = v8;
  v25.size.CGFloat width = v10;
  v25.size.CGFloat height = v12;
  CGRect v26 = CGRectIntegral(v25);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)frameForCenterPointAtSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  -[SCATGridPointPickerView _availableFrameForCenterPointAtSelectionPath:]( self,  "_availableFrameForCenterPointAtSelectionPath:",  v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v5, "gridCenterPointFrameWithAvailableFrame:", v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGPath)pathForCenterPointAtSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  -[SCATGridPointPickerView _availableFrameForCenterPointAtSelectionPath:]( self,  "_availableFrameForCenterPointAtSelectionPath:",  v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = (CGPath *)objc_msgSend(v5, "gridCenterPointPathWithAvailableFrame:", v7, v9, v11, v13);
  return v14;
}

- (CGRect)_availableFrameForCenterPointAtSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    __int128 v26 = xmmword_100117FF0;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathWithIndexes:length:]( &OBJC_CLASS___NSIndexPath,  "indexPathWithIndexes:length:",  &v26,  2LL));
    goto LABEL_5;
  }

  unsigned __int8 v6 = [v4 length];
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathByAddingIndex:1]);
  double v8 = v7;
  if ((v6 & 1) != 0)
  {
LABEL_5:
    -[SCATGridPointPickerView frameForSelectionPath:](self, "frameForSelectionPath:", v8);
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
    double v17 = v21;
    goto LABEL_6;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPathByAddingIndex:1]);
  -[SCATGridPointPickerView frameForSelectionPath:](self, "frameForSelectionPath:", v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

LABEL_6:
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  double v25 = v17;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)_updateGridProperties
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerView currentSelectionPath](self, "currentSelectionPath"));
  -[SCATGridPointPickerView frameForSelectionPath:](self, "frameForSelectionPath:", v3);
  -[SCATGridView setFrame:](self->_grid, "setFrame:");

  -[SCATGridView frame](self->_grid, "frame");
  double v5 = v4;
  -[SCATGridPointPickerView bounds](self, "bounds");
  -[SCATGridView setShowsLeftBorder:](self->_grid, "setShowsLeftBorder:", v5 > v6);
  -[SCATGridView frame](self->_grid, "frame");
  double MaxX = CGRectGetMaxX(v15);
  -[SCATGridPointPickerView bounds](self, "bounds");
  -[SCATGridView setShowsRightBorder:](self->_grid, "setShowsRightBorder:", MaxX < CGRectGetMaxX(v16));
  -[SCATGridView frame](self->_grid, "frame");
  double v9 = v8;
  -[SCATGridPointPickerView bounds](self, "bounds");
  -[SCATGridView setShowsTopBorder:](self->_grid, "setShowsTopBorder:", v9 > v10);
  -[SCATGridView frame](self->_grid, "frame");
  double MaxY = CGRectGetMaxY(v17);
  -[SCATGridPointPickerView bounds](self, "bounds");
  -[SCATGridView setShowsBottomBorder:](self->_grid, "setShowsBottomBorder:", MaxY < CGRectGetMaxY(v18));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerView currentSelectionPath](self, "currentSelectionPath"));
  unsigned __int8 v13 = [v12 length];

  if ((v13 & 1) != 0) {
    uint64_t v14 = 1LL;
  }
  else {
    uint64_t v14 = 3LL;
  }
  -[SCATGridView setNumberOfRows:](self->_grid, "setNumberOfRows:", v14);
}

- (void)setCurrentSelectionPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  if (self->_currentSelectionPath != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_currentSelectionPath, a3);
    -[SCATGridPointPickerView _updateGridProperties](self, "_updateGridProperties");
    double v5 = v6;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATGridPointPickerView;
  -[SCATPromptView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerView currentSelectionPath](self, "currentSelectionPath"));
  -[SCATGridPointPickerView frameForSelectionPath:](self, "frameForSelectionPath:", v3);
  -[SCATGridView setFrame:](self->_grid, "setFrame:");
}

- (id)centerPointImageForGrid:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerView currentSelectionPath](self, "currentSelectionPath", a3));
  -[SCATGridPointPickerView _availableFrameForCenterPointAtSelectionPath:]( self,  "_availableFrameForCenterPointAtSelectionPath:",  v4);
  double v6 = v5;
  double v8 = v7;

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gridCenterPointImageWithAvailableSize:", v6, v8));

  return v10;
}

- (NSIndexPath)currentSelectionPath
{
  return self->_currentSelectionPath;
}

- (void).cxx_destruct
{
}

@end