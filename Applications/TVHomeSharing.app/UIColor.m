@interface UIColor
+ (id)tvh_10PercentBlackColor;
+ (id)tvh_10PercentWhiteColor;
+ (id)tvh_25PercentWhiteColor;
+ (id)tvh_30PercentWhiteColor;
+ (id)tvh_40PercentBlackColor;
+ (id)tvh_50PercentWhiteColor;
+ (id)tvh_60PercentBlackColor;
+ (id)tvh_60PercentWhiteColor;
+ (id)tvh_70PercentBlackColor;
+ (id)tvh_70PercentWhiteColor;
+ (id)tvh_7PercentWhiteColor;
+ (id)tvh_80PercentBlackColor;
+ (id)tvh_80PercentWhiteColor;
+ (id)tvh_90PercentWhiteColor;
+ (id)tvh_dynamicColorWithLightStyleColor:(id)a3 darkStyleColor:(id)a4;
+ (id)tvh_dynamicColorWithWhiteColorPercentage:(double)a3 lightStyleAlpha:(double)a4 darkStyleAlpha:(double)a5;
+ (id)tvh_placeholderBackgroundDarkStyleColor;
+ (id)tvh_placeholderBackgroundLightStyleColor;
+ (id)tvh_placeholderDarkStyleColor;
+ (id)tvh_placeholderDynamicColor;
+ (id)tvh_placeholderLightStyleColor;
+ (id)tvh_randomColor;
- (id)tvh_blendWithColor:(id)a3 percentage:(double)a4;
@end

@implementation UIColor

+ (id)tvh_randomColor
{
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v2,  v3,  (double)arc4random_uniform(0xFFu) / 255.0,  0.4);
}

+ (id)tvh_7PercentWhiteColor
{
  if (qword_1001573F8 != -1) {
    dispatch_once(&qword_1001573F8, &stru_1000FEF38);
  }
  return (id)qword_1001573F0;
}

+ (id)tvh_10PercentWhiteColor
{
  if (qword_100157408 != -1) {
    dispatch_once(&qword_100157408, &stru_1000FEF58);
  }
  return (id)qword_100157400;
}

+ (id)tvh_25PercentWhiteColor
{
  if (qword_100157418 != -1) {
    dispatch_once(&qword_100157418, &stru_1000FEF78);
  }
  return (id)qword_100157410;
}

+ (id)tvh_30PercentWhiteColor
{
  if (qword_100157428 != -1) {
    dispatch_once(&qword_100157428, &stru_1000FEF98);
  }
  return (id)qword_100157420;
}

+ (id)tvh_50PercentWhiteColor
{
  if (qword_100157438 != -1) {
    dispatch_once(&qword_100157438, &stru_1000FEFB8);
  }
  return (id)qword_100157430;
}

+ (id)tvh_60PercentWhiteColor
{
  if (qword_100157448 != -1) {
    dispatch_once(&qword_100157448, &stru_1000FEFD8);
  }
  return (id)qword_100157440;
}

+ (id)tvh_70PercentWhiteColor
{
  if (qword_100157458 != -1) {
    dispatch_once(&qword_100157458, &stru_1000FEFF8);
  }
  return (id)qword_100157450;
}

+ (id)tvh_80PercentWhiteColor
{
  if (qword_100157468 != -1) {
    dispatch_once(&qword_100157468, &stru_1000FF018);
  }
  return (id)qword_100157460;
}

+ (id)tvh_90PercentWhiteColor
{
  if (qword_100157478 != -1) {
    dispatch_once(&qword_100157478, &stru_1000FF038);
  }
  return (id)qword_100157470;
}

+ (id)tvh_10PercentBlackColor
{
  if (qword_100157488 != -1) {
    dispatch_once(&qword_100157488, &stru_1000FF058);
  }
  return (id)qword_100157480;
}

+ (id)tvh_40PercentBlackColor
{
  if (qword_100157498 != -1) {
    dispatch_once(&qword_100157498, &stru_1000FF078);
  }
  return (id)qword_100157490;
}

+ (id)tvh_60PercentBlackColor
{
  if (qword_1001574A8 != -1) {
    dispatch_once(&qword_1001574A8, &stru_1000FF098);
  }
  return (id)qword_1001574A0;
}

+ (id)tvh_70PercentBlackColor
{
  if (qword_1001574B8 != -1) {
    dispatch_once(&qword_1001574B8, &stru_1000FF0B8);
  }
  return (id)qword_1001574B0;
}

+ (id)tvh_80PercentBlackColor
{
  if (qword_1001574C8 != -1) {
    dispatch_once(&qword_1001574C8, &stru_1000FF0D8);
  }
  return (id)qword_1001574C0;
}

+ (id)tvh_placeholderBackgroundLightStyleColor
{
  if (qword_1001574D8 != -1) {
    dispatch_once(&qword_1001574D8, &stru_1000FF0F8);
  }
  return (id)qword_1001574D0;
}

+ (id)tvh_placeholderBackgroundDarkStyleColor
{
  if (qword_1001574E8 != -1) {
    dispatch_once(&qword_1001574E8, &stru_1000FF118);
  }
  return (id)qword_1001574E0;
}

+ (id)tvh_placeholderLightStyleColor
{
  if (qword_1001574F8 != -1) {
    dispatch_once(&qword_1001574F8, &stru_1000FF138);
  }
  return (id)qword_1001574F0;
}

+ (id)tvh_placeholderDarkStyleColor
{
  if (qword_100157508 != -1) {
    dispatch_once(&qword_100157508, &stru_1000FF158);
  }
  return (id)qword_100157500;
}

+ (id)tvh_placeholderDynamicColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072D8C;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_100157518 != -1) {
    dispatch_once(&qword_100157518, block);
  }
  return (id)qword_100157510;
}

+ (id)tvh_dynamicColorWithLightStyleColor:(id)a3 darkStyleColor:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100072EB0;
  v9[3] = &unk_1000FF180;
  id v10 = a3;
  id v11 = a4;
  id v5 = v11;
  id v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", v9));

  return v7;
}

+ (id)tvh_dynamicColorWithWhiteColorPercentage:(double)a3 lightStyleAlpha:(double)a4 darkStyleAlpha:(double)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100072F5C;
  v6[3] = &unk_1000FF1A0;
  *(double *)&v6[4] = a4;
  *(double *)&v6[5] = a5;
  *(double *)&v6[6] = a3;
  return (id)objc_claimAutoreleasedReturnValue( +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  v6));
}

- (id)tvh_blendWithColor:(id)a3 percentage:(double)a4
{
  double v5 = fmax(a4, 0.0);
  if (v5 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  id v7 = a3;
  -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
  [v7 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];

  return (id)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v6 * v12 + v16 * (1.0 - v6),  v6 * v11 + v15 * (1.0 - v6),  v6 * v10 + v14 * (1.0 - v6),  v6 * v9 + v13 * (1.0 - v6)));
}

@end