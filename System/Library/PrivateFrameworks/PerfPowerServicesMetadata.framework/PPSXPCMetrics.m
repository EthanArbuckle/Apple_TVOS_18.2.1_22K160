@interface PPSXPCMetrics
+ (id)allDeclMetrics;
+ (id)groupActivitiesMetrics;
+ (id)mailIMAPMetrics;
+ (id)subsystem;
+ (id)vkDataScannerMetrics;
@end

@implementation PPSXPCMetrics

+ (id)subsystem
{
  return @"XPCMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() groupActivitiesMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() vkDataScannerMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  [(id)objc_opt_class() mailIMAPMetrics];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v5];

  return v2;
}

+ (id)groupActivitiesMetrics
{
  v15[1] = *MEMORY[0x1895F89C0];
  v14 = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v15[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"bundleID",  @"XPCMetrics",  @"GroupActivities",  3LL,  v5,  v6,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v9,  v7,  0LL,  2.0);

  v13[0] = v7;
  v13[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v13 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)vkDataScannerMetrics
{
  v11[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"SessionMinFrameDuration",  @"XPCMetrics",  @"VKDataScanner",  8LL,  v3,  v4,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"SessionStopTime",  4LL,  v7,  v5,  0LL,  1.0);

  v11[0] = v5;
  v11[1] = v8;
  [MEMORY[0x189603F18] arrayWithObjects:v11 count:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mailIMAPMetrics
{
  v8[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"IMAPv4",  @"XPCMetrics",  @"MailIMAP",  5LL,  v3,  v4,  1.0,  0x200000003LL,  0x100000001LL,  0x100000001LL,  0x100000001LL,  0LL);

  v8[0] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v8 count:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end