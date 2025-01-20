@interface PBUIDebugLayoutLevelsStackView
- (CGSize)intrinsicContentSize;
- (PBUIDebugLayoutLevelsStackView)initWithFrame:(CGRect)a3;
- (void)setLayoutLevelStates:(id)a3 activeLayoutLevel:(int64_t)a4;
@end

@implementation PBUIDebugLayoutLevelsStackView

- (PBUIDebugLayoutLevelsStackView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBUIDebugLayoutLevelsStackView;
  v3 = -[PBUIDebugLayoutLevelsStackView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBUIDebugLayoutLevelsStackView setAxis:](v3, "setAxis:", 1LL);
    -[PBUIDebugLayoutLevelsStackView setAlignment:](v4, "setAlignment:", 1LL);
    -[PBUIDebugLayoutLevelsStackView setDistribution:](v4, "setDistribution:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    uint64_t v6 = 24LL;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
      [v7 setTextColor:v5];
      -[PBUIDebugLayoutLevelsStackView addArrangedSubview:](v4, "addArrangedSubview:", v7);

      --v6;
    }

    while (v6);
    -[PBUIDebugLayoutLevelsStackView setLayoutLevelStates:activeLayoutLevel:]( v4,  "setLayoutLevelStates:activeLayoutLevel:",  0LL,  -1LL);
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 220.0;
  double v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLayoutLevelStates:(id)a3 activeLayoutLevel:(int64_t)a4
{
  id v6 = a3;
  for (unint64_t i = 0LL; i != 24; ++i)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugLayoutLevelsStackView arrangedSubviews](self, "arrangedSubviews"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:i]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:i]);
    v11 = v10;
    if (v10)
    {
      v12 = (char *)[v10 unsignedIntegerValue];
      uint64_t v13 = sub_1001A3184(i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = @" ";
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%.2ld) - %@ \n",  v15,  i,  v14));

      if (a4 == i) {
        uint64_t v17 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](&OBJC_CLASS___UIColor, "systemGreenColor"));
      }
      else {
        uint64_t v17 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
      }
      v18 = (void *)v17;
      [v9 setText:v16];
      [v9 setTextColor:v18];
    }

    else
    {
      [v9 setText:&stru_1003E2910];
    }

    [v9 setHidden:v6 == 0];
  }
}

@end