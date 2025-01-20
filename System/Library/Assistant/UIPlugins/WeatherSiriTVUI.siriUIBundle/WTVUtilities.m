@interface WTVUtilities
+ (void)_configureLabel:(id)a3 forTextStyle:(unint64_t)a4 isSecondary:(BOOL)a5;
+ (void)configureConditionImageView:(id)a3 forTextStyle:(unint64_t)a4;
+ (void)configureLabel:(id)a3 forTextStyle:(unint64_t)a4;
+ (void)configureLightLineView:(id)a3 forTextStyle:(unint64_t)a4;
+ (void)configureLineView:(id)a3 forTextStyle:(unint64_t)a4;
+ (void)configureSecondaryLabel:(id)a3 forTextStyle:(unint64_t)a4;
+ (void)configureView:(id)a3 forTextStyle:(unint64_t)a4;
@end

@implementation WTVUtilities

+ (void)configureLabel:(id)a3 forTextStyle:(unint64_t)a4
{
}

+ (void)configureSecondaryLabel:(id)a3 forTextStyle:(unint64_t)a4
{
}

+ (void)_configureLabel:(id)a3 forTextStyle:(unint64_t)a4 isSecondary:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v25 = v7;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_11;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 traitCollection]);
    else {
      double v9 = 0.666666667;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v9,  v9,  v9,  1.0));
    [v25 setTextColor:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v25 traitCollection]);
    v19 = (char *)[v18 userInterfaceStyle];
    v20 = &kCAFilterPlusL;
    if (v19 != (_BYTE *)&dword_0 + 2) {
      v20 = &kCAFilterPlusD;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v25 layer]);
    [v22 setCompositingFilter:v21];

    [v25 setShadowColor:0];
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v16 = 0.0;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
    [v25 setTextColor:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterNormalBlendMode));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v25 layer]);
    [v12 setCompositingFilter:v11];

    double width = 0.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.1));
    [v25 setShadowColor:v14];

    double height = 2.0;
    double v16 = 3.0;
  }

  objc_msgSend(v25, "setShadowOffset:", width, height);
  [v25 setShadowBlur:v16];
  id v7 = v25;
LABEL_11:
  if (v5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v25 textColor]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 colorWithAlphaComponent:0.65]);
    [v25 setTextColor:v24];

    id v7 = v25;
  }
}

+ (void)configureConditionImageView:(id)a3 forTextStyle:(unint64_t)a4
{
  uint64_t v4 = kCAFilterNormalBlendMode;
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);

  [v6 setCompositingFilter:v7];
}

+ (void)configureView:(id)a3 forTextStyle:(unint64_t)a4
{
  id v5 = a3;
  if (!a4)
  {
    id v11 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterNormalBlendMode));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
    [v9 setCompositingFilter:v6];
LABEL_7:

    id v5 = v11;
    goto LABEL_8;
  }

  if (a4 == 1)
  {
    id v11 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 traitCollection]);
    id v7 = (char *)[v6 userInterfaceStyle];
    v8 = &kCAFilterPlusL;
    if (v7 != (_BYTE *)&dword_0 + 2) {
      v8 = &kCAFilterPlusD;
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
    [v10 setCompositingFilter:v9];

    goto LABEL_7;
  }

+ (void)configureLineView:(id)a3 forTextStyle:(unint64_t)a4
{
  id v5 = a3;
  if (!a4)
  {
    id v17 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v17 layer]);
    [v16 setCompositingFilter:v15];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0784313725, 1.0));
    [v17 setBackgroundColor:v11];
LABEL_9:

    id v5 = v17;
    goto LABEL_10;
  }

  if (a4 == 1)
  {
    id v17 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 traitCollection]);
    id v7 = (char *)[v6 userInterfaceStyle];
    v8 = &kCAFilterPlusL;
    if (v7 != (_BYTE *)&dword_0 + 2) {
      v8 = &kCAFilterPlusD;
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v17 layer]);
    [v10 setCompositingFilter:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 traitCollection]);
    v12 = (char *)[v11 userInterfaceStyle];
    double v13 = 0.0;
    if (v12 == (_BYTE *)&dword_0 + 2) {
      double v13 = 1.0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v13, 0.4));
    [v17 setBackgroundColor:v14];

    goto LABEL_9;
  }

+ (void)configureLightLineView:(id)a3 forTextStyle:(unint64_t)a4
{
  if (a4 == 1)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
    v6 = (char *)[v5 userInterfaceStyle];
    id v7 = &kCAFilterPlusL;
    if (v6 != (_BYTE *)&dword_0 + 2) {
      id v7 = &kCAFilterPlusD;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v7));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
    [v9 setCompositingFilter:v8];

    id v13 = (id)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
    v10 = (char *)[v13 userInterfaceStyle];
    double v11 = 0.0;
    if (v10 == (_BYTE *)&dword_0 + 2) {
      double v11 = 1.0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v11, 0.05));
    [v4 setBackgroundColor:v12];
  }

@end