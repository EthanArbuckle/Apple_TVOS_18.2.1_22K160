@interface WTVConditionIconManager
+ (id)sharedManager;
- (id)conditionIconForWeatherCondition:(int64_t)a3 type:(unint64_t)a4;
@end

@implementation WTVConditionIconManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_E8D0;
  block[3] = &unk_1C658;
  block[4] = a1;
  if (qword_23EF8 != -1) {
    dispatch_once(&qword_23EF8, block);
  }
  return (id)qword_23EF0;
}

- (id)conditionIconForWeatherCondition:(int64_t)a3 type:(unint64_t)a4
{
  if ((unint64_t)a3 <= 0x2F)
  {
    v6 = &tvLargeWeatherIcons;
    if (!a4) {
      v6 = &tvSmallWeatherIcons;
    }
    v7 = v6[a3];
    v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v7,  v9,  0LL));
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end