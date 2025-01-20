@interface UIColor
+ (id)tvsb_dynamicColorWithLightStyleColor:(id)a3 darkStyleColor:(id)a4;
+ (id)tvsb_randomColor;
@end

@implementation UIColor

+ (id)tvsb_randomColor
{
  double v4 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v4,  v3,  (double)arc4random_uniform(0xFFu) / 255.0,  0.4);
}

+ (id)tvsb_dynamicColorWithLightStyleColor:(id)a3 darkStyleColor:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100008200;
  v11 = &unk_10002C8A8;
  id v12 = location[0];
  id v13 = v15;
  v14 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:");
  v6 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

@end