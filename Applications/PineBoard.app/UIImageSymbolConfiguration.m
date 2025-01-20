@interface UIImageSymbolConfiguration
+ (id)pb_configurationWithFont:(id)a3 scale:(int64_t)a4 paletteColors:(id)a5;
+ (id)pb_configurationWithTextStyle:(id)a3 scale:(int64_t)a4 paletteColors:(id)a5;
@end

@implementation UIImageSymbolConfiguration

+ (id)pb_configurationWithTextStyle:(id)a3 scale:(int64_t)a4 paletteColors:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pb_configurationWithFont:scale:paletteColors:", v9, a4, v8));

  return v10;
}

+ (id)pb_configurationWithFont:(id)a3 scale:(int64_t)a4 paletteColors:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  a3,  a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPaletteColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPaletteColors:",  v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 configurationByApplyingConfiguration:v9]);
  return v10;
}

@end