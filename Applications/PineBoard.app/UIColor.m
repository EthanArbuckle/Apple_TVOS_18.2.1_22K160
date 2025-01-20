@interface UIColor
+ (id)pb_colorWithLightColor:(id)a3 darkColor:(id)a4;
+ (id)pb_colorWithLightColor:(id)a3 darkColor:(id)a4 highContrastLightColor:(id)a5 highContrastDarkColor:(id)a6;
- (UIColor)pb_resolvedForDarkMode;
- (UIColor)pb_resolvedForLightMode;
@end

@implementation UIColor

- (UIColor)pb_resolvedForDarkMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self, "resolvedColorWithTraitCollection:", v3));

  return (UIColor *)v4;
}

- (UIColor)pb_resolvedForLightMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self, "resolvedColorWithTraitCollection:", v3));

  return (UIColor *)v4;
}

+ (id)pb_colorWithLightColor:(id)a3 darkColor:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( +[UIColor pb_colorWithLightColor:darkColor:highContrastLightColor:highContrastDarkColor:]( &OBJC_CLASS___UIColor,  "pb_colorWithLightColor:darkColor:highContrastLightColor:highContrastDarkColor:",  a3,  a4,  a3,  a4));
}

+ (id)pb_colorWithLightColor:(id)a3 darkColor:(id)a4 highContrastLightColor:(id)a5 highContrastDarkColor:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001EA818;
  v15[3] = &unk_1003DC5A0;
  id v16 = a5;
  id v17 = v9;
  id v18 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = v16;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", v15));

  return v13;
}

@end