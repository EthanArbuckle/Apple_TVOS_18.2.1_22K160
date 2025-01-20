@interface PPSAudioMetrics
+ (id)allDeclMetrics;
+ (id)singMetrics;
+ (id)subsystem;
@end

@implementation PPSAudioMetrics

+ (id)subsystem
{
  return @"Audio";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() singMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)singMetrics
{
  v12[1] = *MEMORY[0x1895F89C0];
  v11 = @"MetricType";
  v2 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v12[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Enabled",  @"Audio",  @"Sing",  5LL,  v5,  v6,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v10 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v10 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end