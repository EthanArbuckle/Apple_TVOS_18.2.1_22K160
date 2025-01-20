@interface PPSSMCMetrics
+ (id)allDeclMetrics;
+ (id)smcMetrics;
+ (id)subsystem;
@end

@implementation PPSSMCMetrics

+ (id)subsystem
{
  return @"SMC";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() smcMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)smcMetrics
{
  v19[2] = *MEMORY[0x1895F89C0];
  v18[0] = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v18[1] = @"AuxiliaryType";
  v19[0] = v2;
  v19[1] = &unk_18A29AB60;
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 3LL);
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Key",  @"SMC",  @"InstantKeys",  3LL,  v5,  v6,  1.0,  0x200000002LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v16[0] = @"MetricType";
  v8 = +[PPSMetricType absoluteMeasure](&OBJC_CLASS___PPSMetricType, "absoluteMeasure");
  v16[1] = @"AuxiliaryType";
  v17[0] = v8;
  v17[1] = &unk_18A29AB60;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  8LL,  v11,  v7,  v9,  1.0);

  v15[0] = v7;
  v15[1] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end