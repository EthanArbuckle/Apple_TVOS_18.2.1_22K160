@interface SCATGridView
- (BOOL)isCenterPointVisible;
- (BOOL)shouldIncludeCenterPoint;
- (BOOL)shouldShowGridBorder;
- (BOOL)showsBottomBorder;
- (BOOL)showsLeftBorder;
- (BOOL)showsRightBorder;
- (BOOL)showsTopBorder;
- (CGSize)shadowOffset;
- (SCATGridDelegate)delegate;
- (SCATGridView)initWithFrame:(CGRect)a3;
- (UIColor)lineColor;
- (UIColor)shadowColor;
- (double)_adjustOriginValue:(double)a3 forDistance:(double)a4 maximumEndPosition:(double)a5;
- (double)lineThickness;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_drawLinesInContext:(CGContext *)a3 forRows:(BOOL)a4;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCenterPointVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setLineThickness:(double)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)setNumberOfRows:(unint64_t)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShouldIncludeCenterPoint:(BOOL)a3;
- (void)setShouldShowGridBorder:(BOOL)a3;
- (void)setShowsBottomBorder:(BOOL)a3;
- (void)setShowsLeftBorder:(BOOL)a3;
- (void)setShowsRightBorder:(BOOL)a3;
- (void)setShowsTopBorder:(BOOL)a3;
@end

@implementation SCATGridView

- (SCATGridView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATGridView;
  v3 = -[SCATGridView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SCATGridView setShouldIncludeCenterPoint:](v3, "setShouldIncludeCenterPoint:", 1LL);
    -[SCATGridView setOpaque:](v4, "setOpaque:", 0LL);
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    centerPoint = v4->_centerPoint;
    v4->_centerPoint = v5;

    -[SCATGridView addSubview:](v4, "addSubview:", v4->_centerPoint);
    -[UIImageView setHidden:](v4->_centerPoint, "setHidden:", 1LL);
    v4->_showsRightBorder = 1;
    v4->_showsLeftBorder = 1;
    v4->_showsBottomBorder = 1;
    v4->_showsTopBorder = 1;
  }

  return v4;
}

- (void)setShouldIncludeCenterPoint:(BOOL)a3
{
  if (self->_shouldIncludeCenterPoint != a3)
  {
    self->_shouldIncludeCenterPoint = a3;
    else {
      -[UIImageView removeFromSuperview](self->_centerPoint, "removeFromSuperview");
    }
  }

- (double)_adjustOriginValue:(double)a3 forDistance:(double)a4 maximumEndPosition:(double)a5
{
  double result = 0.0;
  if (a3 >= 0.0)
  {
    double result = a3;
    if (a3 + a4 > a5) {
      return a5 - a4;
    }
  }

  return result;
}

- (void)layoutSubviews
{
  if (-[SCATGridView shouldIncludeCenterPoint](self, "shouldIncludeCenterPoint"))
  {
    -[SCATGridView bounds](self, "bounds");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridView delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerPointImageForGrid:self]);
    -[UIImageView setImage:](self->_centerPoint, "setImage:", v12);

    -[UIImageView sizeToFit](self->_centerPoint, "sizeToFit");
    -[UIImageView frame](self->_centerPoint, "frame");
    -[UIImageView setFrame:]( self->_centerPoint,  "setFrame:",  floor(v4 + (v8 - v13) * 0.5),  floor(v6 + (v10 - v14) * 0.5));
  }

- (void)setShowsTopBorder:(BOOL)a3
{
  if (self->_showsTopBorder != a3)
  {
    self->_showsTopBorder = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setShowsBottomBorder:(BOOL)a3
{
  if (self->_showsBottomBorder != a3)
  {
    self->_showsBottomBorder = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setShowsLeftBorder:(BOOL)a3
{
  if (self->_showsLeftBorder != a3)
  {
    self->_showsLeftBorder = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setShowsRightBorder:(BOOL)a3
{
  if (self->_showsRightBorder != a3)
  {
    self->_showsRightBorder = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setNumberOfColumns:(unint64_t)a3
{
  if (self->_numberOfColumns != a3)
  {
    self->_numberOfColumns = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setNumberOfRows:(unint64_t)a3
{
  if (self->_numberOfRows != a3)
  {
    self->_numberOfRows = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setLineThickness:(double)a3
{
  if (self->_lineThickness != a3)
  {
    self->_lineThickness = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setLineColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
    double v5 = v6;
  }
}

- (void)setShadowColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_shadowColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_shadowColor, a3);
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
    double v5 = v6;
  }
}

- (void)setShadowOffset:(CGSize)a3
{
  if (self->_shadowOffset.width != a3.width || self->_shadowOffset.height != a3.height)
  {
    self->_shadowOffset = a3;
    -[SCATGridView setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)setCenterPointVisible:(BOOL)a3
{
  if (self->_centerPointVisible != a3)
  {
    self->_centerPointVisible = a3;
    -[UIImageView setHidden:](self->_centerPoint, "setHidden:", !a3);
  }

- (void)_drawLinesInContext:(CGContext *)a3 forRows:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    unint64_t v6 = -[SCATGridView numberOfRows](self, "numberOfRows", a3);
    -[SCATGridView bounds](self, "bounds");
    double v8 = v7;
  }

  else
  {
    unint64_t v6 = -[SCATGridView numberOfColumns](self, "numberOfColumns", a3);
    -[SCATGridView bounds](self, "bounds");
    double v8 = v9;
  }

  -[SCATGridView lineThickness](self, "lineThickness");
  double v11 = v10;
  -[SCATGridView bounds](self, "bounds");
  double v31 = v12;
  -[SCATGridView bounds](self, "bounds");
  double v30 = v13;
  -[SCATGridView bounds](self, "bounds");
  double v15 = v14;
  -[SCATGridView bounds](self, "bounds");
  if (v6 != -1LL)
  {
    unint64_t v17 = 0LL;
    double v32 = v8 / (double)v6;
    double v18 = v11 * -0.5;
    double v19 = v31 + v15;
    double v20 = v30 + v16;
    do
    {
      if (v4)
      {
        unsigned int v21 = -[SCATGridView showsTopBorder](self, "showsTopBorder");
        if (!v17 && !v21 || !-[SCATGridView showsBottomBorder](self, "showsBottomBorder") && v6 == v17) {
          goto LABEL_18;
        }
        double v22 = v31;
        double v23 = floor(v18 + (double)v17 * v32);
        double v24 = 0.0;
        double v25 = v11;
      }

      else
      {
        unsigned int v26 = -[SCATGridView showsLeftBorder](self, "showsLeftBorder");
        if (!v17 && !v26 || !-[SCATGridView showsRightBorder](self, "showsRightBorder") && v6 == v17) {
          goto LABEL_18;
        }
        double v24 = floor(v18 + (double)v17 * v32);
        double v23 = 0.0;
        double v22 = v11;
        double v25 = v30;
      }

      -[SCATGridView _adjustOriginValue:forDistance:maximumEndPosition:]( self,  "_adjustOriginValue:forDistance:maximumEndPosition:",  v24,  v22,  v19);
      CGFloat v28 = v27;
      -[SCATGridView _adjustOriginValue:forDistance:maximumEndPosition:]( self,  "_adjustOriginValue:forDistance:maximumEndPosition:",  v23,  v25,  v20);
      v33.origin.y = v29;
      v33.origin.x = v28;
      v33.size.width = v22;
      v33.size.height = v25;
      UIRectFill(v33);
LABEL_18:
      ++v17;
    }

    while (v6 + 1 != v17);
  }

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridView lineColor](self, "lineColor"));
  [v5 set];

  -[SCATGridView shadowOffset](self, "shadowOffset");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v10 = objc_claimAutoreleasedReturnValue(-[SCATGridView shadowColor](self, "shadowColor"));
  double v11 = (CGColor *)[v10 CGColor];
  v12.width = v7;
  v12.height = v9;
  CGContextSetShadowWithColor(CurrentContext, v12, 0.0, v11);

  CGContextBeginTransparencyLayer(CurrentContext, 0LL);
  -[SCATGridView _drawLinesInContext:forRows:](self, "_drawLinesInContext:forRows:", CurrentContext, 1LL);
  -[SCATGridView _drawLinesInContext:forRows:](self, "_drawLinesInContext:forRows:", CurrentContext, 0LL);
  CGContextEndTransparencyLayer(CurrentContext);
}

- (SCATGridDelegate)delegate
{
  return (SCATGridDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)lineThickness
{
  return self->_lineThickness;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)showsTopBorder
{
  return self->_showsTopBorder;
}

- (BOOL)showsLeftBorder
{
  return self->_showsLeftBorder;
}

- (BOOL)showsBottomBorder
{
  return self->_showsBottomBorder;
}

- (BOOL)showsRightBorder
{
  return self->_showsRightBorder;
}

- (BOOL)isCenterPointVisible
{
  return self->_centerPointVisible;
}

- (BOOL)shouldIncludeCenterPoint
{
  return self->_shouldIncludeCenterPoint;
}

- (BOOL)shouldShowGridBorder
{
  return self->_shouldShowGridBorder;
}

- (void)setShouldShowGridBorder:(BOOL)a3
{
  self->_shouldShowGridBorder = a3;
}

- (void).cxx_destruct
{
}

@end