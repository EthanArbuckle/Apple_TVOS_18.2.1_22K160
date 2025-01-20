@interface PPSButtonMetrics
+ (id)allDeclMetrics;
+ (id)captureButtonAction;
+ (id)captureButtonConfig;
+ (id)subsystem;
@end

@implementation PPSButtonMetrics

+ (id)subsystem
{
  return @"Button";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() captureButtonConfig];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() captureButtonAction];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)captureButtonConfig
{
  v13[2] = *MEMORY[0x1895F89C0];
  v12[0] = @"DMACompliant";
  v12[1] = @"MetricType";
  v13[0] = MEMORY[0x189604A80];
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v13[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSButtonMetrics subsystem](&OBJC_CLASS___PPSButtonMetrics, "subsystem");
  v6 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v7 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v8 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Config",  v5,  @"CaptureButtonConfig",  3LL,  v6,  v7,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v11 = v8;
  [MEMORY[0x189603F18] arrayWithObjects:&v11 count:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)captureButtonAction
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSButtonMetrics subsystem](&OBJC_CLASS___PPSButtonMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"FullPress",  v3,  @"CaptureButtonAction",  7LL,  v4,  v5,  1.0,  0x200000004LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"HalfPress",  7LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Touch",  7LL,  v11,  v6,  0LL,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"TouchTimeInterval",  7LL,  v14,  v6,  0LL,  1.0);

  v18[0] = v12;
  v18[1] = v9;
  v18[2] = v6;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end