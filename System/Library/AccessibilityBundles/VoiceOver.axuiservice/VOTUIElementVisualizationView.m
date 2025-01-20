@interface VOTUIElementVisualizationView
- (VOTUIElementVisualizationView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
@end

@implementation VOTUIElementVisualizationView

- (VOTUIElementVisualizationView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTUIElementVisualizationView;
  v3 = -[VOTUIElementVisualizationView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[VOTUIElementVisualizationView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[VOTUIElementVisualizationView setOpaque:](v3, "setOpaque:", 0LL);
  v5 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  numberLabel = v3->_numberLabel;
  v3->_numberLabel = v5;

  v7 = v3->_numberLabel;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  255.0,  0.0,  0.8));
  -[UILabel setTextColor:](v3->_numberLabel, "setTextColor:", v8);
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  v9 = v3->_numberLabel;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UILabel setShadowColor:](v9, "setShadowColor:", v10);

  v11 = v3->_numberLabel;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 18.0));
  -[UILabel setFont:](v11, "setFont:", v12);

  return v3;
}

- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  v8 = (NSArray *)a3;
  v9 = (NSArray *)a4;
  v10 = (NSArray *)a5;
  frames = self->_frames;
  self->_frames = v8;
  v12 = v8;

  labels = self->_labels;
  self->_labels = v9;
  objc_super v14 = v9;

  uiClasses = self->_uiClasses;
  self->_uiClasses = v10;

  -[VOTUIElementVisualizationView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.0));
  [v8 set];

  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  UIRectFill(v12);
  if (-[NSArray count](self->_frames, "count"))
  {
    unint64_t v9 = 0LL;
    do
    {
      if (v9 >= -[NSArray count](self->_labels, "count")) {
        break;
      }
      if (v9 >= -[NSArray count](self->_uiClasses, "count")) {
        break;
      }
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v9));
      CGRectFromString(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](&OBJC_CLASS___UIBezierPath, "bezierPathWithRect:"));
      [v11 setLineWidth:2.0];
      [v11 stroke];
      -[UILabel sizeToFit](self->_numberLabel, "sizeToFit");
      UIRectCenteredIntegralRect(-[UILabel frame](self->_numberLabel, "frame"));
      -[UILabel drawTextInRect:](self->_numberLabel, "drawTextInRect:");

      ++v9;
    }

    while (v9 < -[NSArray count](self->_frames, "count"));
  }

- (void).cxx_destruct
{
}

@end