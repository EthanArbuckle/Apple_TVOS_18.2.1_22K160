@interface SCATModernMenuView
- (BOOL)accessibilityIgnoresInvertColors;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 includeTip:(BOOL)a4;
- (SCATModernMenuBackgroundView)backgroundView;
- (SCATModernMenuView)initWithFrame:(CGRect)a3;
- (void)setBackgroundView:(id)a3;
@end

@implementation SCATModernMenuView

- (SCATModernMenuView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SCATModernMenuView;
  v7 = -[SCATModernMenuView initWithFrame:](&v16, "initWithFrame:");
  if (v7)
  {
    v8 = -[SCATModernMenuBackgroundView initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATModernMenuBackgroundView),  "initWithFrame:",  x,  y,  width,  height);
    -[SCATModernMenuBackgroundView setAutoresizingMask:](v8, "setAutoresizingMask:", 18LL);
    -[SCATModernMenuView setBackgroundView:](v7, "setBackgroundView:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundView backdropView](v8, "backdropView"));
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundView backdropView](v8, "backdropView"));
    -[SCATModernMenuView addSubview:](v7, "addSubview:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundView backdropView](v8, "backdropView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentView]);
    [v12 addSubview:v8];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundView backdropView](v8, "backdropView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint ax_constraintsToMakeView:sameDimensionsAsView:]( &OBJC_CLASS___NSLayoutConstraint,  "ax_constraintsToMakeView:sameDimensionsAsView:",  v7,  v13));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3 includeTip:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuView backgroundView](self, "backgroundView"));
  objc_msgSend(v7, "sizeThatFits:includeTip:", v4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuView backgroundView](self, "backgroundView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SCATModernMenuBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end