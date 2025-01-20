@interface UILabel
+ (id)_pb_debugFont;
+ (id)pb_debugLabel;
@end

@implementation UILabel

+ (id)_pb_debugFont
{
  return (id)objc_claimAutoreleasedReturnValue( +[UIFont monospacedSystemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "monospacedSystemFontOfSize:weight:",  16.0,  UIFontWeightSemibold));
}

+ (id)pb_debugLabel
{
  id v3 = objc_alloc_init((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_pb_debugFont"));
  [v3 setFont:v4];

  [v3 setTextAlignment:0];
  [v3 setNumberOfLines:1];
  return v3;
}

@end