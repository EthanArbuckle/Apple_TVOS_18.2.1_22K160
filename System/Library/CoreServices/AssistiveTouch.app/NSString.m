@interface NSString
+ (id)at_deviceIconNameForIdentifier:(id)a3;
+ (id)getIconSuffix;
+ (id)sc_deviceIconNameForIdentifier:(id)a3;
@end

@implementation NSString

+ (id)at_deviceIconNameForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString getIconSuffix](&OBJC_CLASS___NSString, "getIconSuffix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v3, v4));

  return v5;
}

+ (id)sc_deviceIconNameForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString getIconSuffix](&OBJC_CLASS___NSString, "getIconSuffix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATIcon_%@%@",  v3,  v4));

  return v5;
}

+ (id)getIconSuffix
{
  if ((AXDeviceHasHomeButton(a1, a2) & 1) != 0)
  {
    v2 = &stru_100127100;
  }

  else
  {
    int IsPad = AXDeviceIsPad();
    v2 = @"_NHB";
    if (IsPad) {
      v2 = @"_NHB_IPAD";
    }
  }

  return v2;
}

@end