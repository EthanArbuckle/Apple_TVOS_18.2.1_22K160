@interface PPSAccessibilityMetrics
+ (id)allDeclMetrics;
+ (id)subsystem;
+ (id)zoomEnabledMetrics;
@end

@implementation PPSAccessibilityMetrics

+ (id)subsystem
{
  return @"AccessibilityMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() zoomEnabledMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)zoomEnabledMetrics
{
  v18[2] = *MEMORY[0x1895F89C0];
  v17[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v16[0] = @"Disabled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v16[1] = @"Enabled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v18[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSAccessibilityMetrics subsystem](&OBJC_CLASS___PPSAccessibilityMetrics, "subsystem");
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v10 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v7,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Enabled",  v8,  @"ZoomEnabled",  5LL,  v9,  v10,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v6);

  v14 = v11;
  [MEMORY[0x189603F18] arrayWithObjects:&v14 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end