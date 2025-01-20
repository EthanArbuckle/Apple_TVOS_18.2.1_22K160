@interface TVSSBatteryLevelImageConfiguration
+ (id)_compositingFilterForUserInterfaceStyle:(int64_t)a3;
+ (id)_fillColorForBatteryLevel:(double)a3;
+ (id)_tintColorForUserInterfaceStyle:(int64_t)a3;
+ (id)batteryLevelImageConfigurationForBatteryLevel:(double)a3 isCharging:(BOOL)a4 userInterfaceStyle:(int64_t)a5;
+ (id)batteryLevelImageConfigurationForBatteryLevel:(double)a3 userInterfaceStyle:(int64_t)a4;
+ (id)imageSymbolNameForBatteryLevel:(double)a3;
+ (id)imageSymbolNameForBatteryLevel:(double)a3 isCharging:(BOOL)a4;
- (CAFilter)compositingFilter;
- (NSString)imageSymbolName;
- (TVSSBatteryLevelImageConfiguration)initWithBatteryLevel:(double)a3 isCharging:(BOOL)a4 userInterfaceStyle:(int64_t)a5;
- (TVSSBatteryLevelImageConfiguration)initWithBatteryLevel:(double)a3 userInterfaceStyle:(int64_t)a4;
- (UIColor)tintColor;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (id)description;
- (id)stylingWithIdentifier:(id)a3;
@end

@implementation TVSSBatteryLevelImageConfiguration

+ (id)batteryLevelImageConfigurationForBatteryLevel:(double)a3 userInterfaceStyle:(int64_t)a4
{
  return [objc_alloc((Class)a1) initWithBatteryLevel:0 isCharging:a4 userInterfaceStyle:a3];
}

+ (id)batteryLevelImageConfigurationForBatteryLevel:(double)a3 isCharging:(BOOL)a4 userInterfaceStyle:(int64_t)a5
{
  return [objc_alloc((Class)a1) initWithBatteryLevel:a4 isCharging:a5 userInterfaceStyle:a3];
}

- (TVSSBatteryLevelImageConfiguration)initWithBatteryLevel:(double)a3 userInterfaceStyle:(int64_t)a4
{
  v6 = 0LL;
  v6 = -[TVSSBatteryLevelImageConfiguration initWithBatteryLevel:isCharging:userInterfaceStyle:]( self,  "initWithBatteryLevel:isCharging:userInterfaceStyle:",  0LL,  a4,  a3);
  v5 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSBatteryLevelImageConfiguration)initWithBatteryLevel:(double)a3 isCharging:(BOOL)a4 userInterfaceStyle:(int64_t)a5
{
  SEL v29 = a2;
  double v28 = a3;
  BOOL v27 = a4;
  int64_t v26 = a5;
  v30 = 0LL;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVSSBatteryLevelImageConfiguration;
  v30 = -[TVSSBatteryLevelImageConfiguration init](&v25, "init");
  objc_storeStrong((id *)&v30, v30);
  if (v30)
  {
    v5 = (void *)objc_opt_class(v30);
    v6 = (NSString *)[v5 imageSymbolNameForBatteryLevel:v27 isCharging:v28];
    imageSymbolName = v30->_imageSymbolName;
    v30->_imageSymbolName = v6;

    id v24 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 6LL);
    v8 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v24,  2LL);
    imageSymbolConfiguration = v30->_imageSymbolConfiguration;
    v30->_imageSymbolConfiguration = v8;

    v10 = (void *)objc_opt_class(v30);
    id obj = [v10 _tintColorForUserInterfaceStyle:v26];
    v11 = (void *)objc_opt_class(v30);
    id v22 = [v11 _fillColorForBatteryLevel:v28];
    if (obj && v22)
    {
      v19 = v30->_imageSymbolConfiguration;
      v31[0] = v22;
      v31[1] = obj;
      v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL);
      v20 =  +[UIImageSymbolConfiguration configurationWithPaletteColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPaletteColors:");
      v12 = (UIImageSymbolConfiguration *) -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v19,  "configurationByApplyingConfiguration:");
      v13 = v30->_imageSymbolConfiguration;
      v30->_imageSymbolConfiguration = v12;
    }

    else
    {
      objc_storeStrong((id *)&v30->_tintColor, obj);
    }

    v14 = (void *)objc_opt_class(v30);
    v15 = (CAFilter *)[v14 _compositingFilterForUserInterfaceStyle:v26];
    compositingFilter = v30->_compositingFilter;
    v30->_compositingFilter = v15;

    objc_storeStrong(&v22, 0LL);
    objc_storeStrong(&obj, 0LL);
    objc_storeStrong(&v24, 0LL);
  }

  v18 = v30;
  objc_storeStrong((id *)&v30, 0LL);
  return v18;
}

- (id)stylingWithIdentifier:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v12->_tintColor)
  {
    id v9 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:", v12->_tintColor);
    -[NSMutableArray addObject:](v10, "addObject:");
  }

  v4 = v10;
  id v5 =  +[TVSPLayerAttribute compositingFilter:]( &OBJC_CLASS___TVSPLayerAttribute,  "compositingFilter:",  v12->_compositingFilter);
  -[NSMutableArray addObject:](v4, "addObject:");

  v6 = v10;
  id v7 =  +[TVSPImageAttribute symbolConfiguration:]( &OBJC_CLASS___TVSPImageAttribute,  "symbolConfiguration:",  v12->_imageSymbolConfiguration);
  -[NSMutableArray addObject:](v6, "addObject:");

  v8 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  location[0],  v10);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

+ (id)imageSymbolNameForBatteryLevel:(double)a3
{
  return [a1 imageSymbolNameForBatteryLevel:0 isCharging:a3];
}

+ (id)imageSymbolNameForBatteryLevel:(double)a3 isCharging:(BOOL)a4
{
  id v10 = a1;
  SEL v9 = a2;
  double v8 = a3;
  BOOL v7 = a4;
  id location = 0LL;
  if (a4)
  {
    objc_storeStrong(&location, @"battery.100percent.bolt");
  }

  else if ((BSFloatLessThanOrEqualToFloat(v8, 1.0) & 1) != 0 && (BSFloatGreaterThanOrEqualToFloat(v8, 0.875) & 1) != 0)
  {
    objc_storeStrong(&location, @"battery.100percent");
  }

  else if ((BSFloatLessThanOrEqualToFloat(v8, 0.874) & 1) != 0 {
         && (BSFloatGreaterThanOrEqualToFloat(v8, 0.625) & 1) != 0)
  }
  {
    objc_storeStrong(&location, @"battery.75percent");
  }

  else if ((BSFloatLessThanOrEqualToFloat(v8, 0.624) & 1) != 0 {
         && (BSFloatGreaterThanOrEqualToFloat(v8, 0.375) & 1) != 0)
  }
  {
    objc_storeStrong(&location, @"battery.50percent");
  }

  else if ((BSFloatLessThanOrEqualToFloat(v8, 0.374) & 1) != 0 {
         && (BSFloatGreaterThanOrEqualToFloat(v8, 0.001) & 1) != 0)
  }
  {
    objc_storeStrong(&location, @"battery.25percent");
  }

  else
  {
    objc_storeStrong(&location, @"battery.0percent");
  }

  id v5 = location;
  objc_storeStrong(&location, 0LL);
  return v5;
}

- (id)description
{
  double v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v7[0] appendString:v8->_imageSymbolName withName:@"imageSymbolName"];
  id v2 = [v7[0] appendObject:v8->_imageSymbolConfiguration withName:@"imageSymbolConfiguration"];
  id v3 = [v7[0] appendObject:v8->_tintColor withName:@"tintColor"];
  id v4 = [v7[0] appendObject:v8->_compositingFilter withName:@"compositingFilter"];
  id v6 = [v7[0] build];
  objc_storeStrong(v7, 0LL);
  return v6;
}

+ (id)_fillColorForBatteryLevel:(double)a3
{
  id v10 = a1;
  SEL v9 = a2;
  double v8 = a3;
  id v7 = 0LL;
  if ((BSFloatLessThanOrEqualToFloat(a3, 0.124) & 1) != 0 && (BSFloatGreaterThanOrEqualToFloat(v8, 0.001) & 1) != 0)
  {
    id v3 = +[UIColor redColor](&OBJC_CLASS___UIColor, "redColor");
    id v4 = v7;
    id v7 = v3;
  }

  id v6 = v7;
  objc_storeStrong(&v7, 0LL);
  return v6;
}

+ (id)_tintColorForUserInterfaceStyle:(int64_t)a3
{
  v7[3] = a1;
  id v7[2] = (id)a2;
  v7[1] = (id)a3;
  v7[0] = 0LL;
  if (a3 == 2) {
    id v3 =  +[TVSPConstants defaultDarkModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultDarkModeDetailTextColor");
  }
  else {
    id v3 =  +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
  }
  id v4 = v7[0];
  v7[0] = v3;

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

+ (id)_compositingFilterForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 2) {
    uint64_t v4 = kCAFilterPlusL;
  }
  else {
    uint64_t v4 = kCAFilterPlusD;
  }
  return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v4);
}

- (NSString)imageSymbolName
{
  return self->_imageSymbolName;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (CAFilter)compositingFilter
{
  return self->_compositingFilter;
}

- (void).cxx_destruct
{
}

@end