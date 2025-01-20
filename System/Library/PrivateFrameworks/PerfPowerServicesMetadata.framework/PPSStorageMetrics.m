@interface PPSStorageMetrics
+ (id)allDeclMetrics;
+ (id)configMetrics;
+ (id)configurationMetrics;
+ (id)subsystem;
+ (id)timeOffsetMetrics;
+ (id)timezoneLoggingCadence;
+ (id)timezoneMetrics;
@end

@implementation PPSStorageMetrics

+ (id)subsystem
{
  return @"PPTStorageOperator";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() timeOffsetMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() configMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  [(id)objc_opt_class() configurationMetrics];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v5];

  [(id)objc_opt_class() timezoneMetrics];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (id)timeOffsetMetrics
{
  v24[3] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  4LL,  0LL);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  5LL);
  v4 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  6LL);
  v5 = v4;
  v6 = 0LL;
  if (v2) {
    BOOL v7 = v3 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && v4 != 0LL)
  {
    v9 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v24[0] = v2;
    v24[1] = v3;
    v24[2] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v24 count:3];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PPSCadence initWithCadenceTuples:](v9, "initWithCadenceTuples:", v10);
  }

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  [(id)objc_opt_class() subsystem];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v11,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"system",  v12,  @"TimeOffset",  8LL,  v13,  v6,  2.0,  0x100000003LL,  0x100000447LL,  0x300000001LL,  0x100000001LL,  0LL);

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"kernel",  8LL,  v16,  v14,  0LL,  2.0);

  v18 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v19 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v18,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"baseband",  8LL,  v19,  v14,  0LL,  2.0);

  v23[0] = v14;
  v23[1] = v17;
  v23[2] = v20;
  [MEMORY[0x189603F18] arrayWithObjects:v23 count:3];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)configMetrics
{
  v13[1] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  7LL);
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v13[0] = v2;
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v3, "initWithCadenceTuples:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  [(id)objc_opt_class() subsystem];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"build",  v7,  @"Config",  3LL,  v8,  v5,  1.0,  0x100000001LL,  0x100000447LL,  0x300000001LL,  0x100000001LL,  0LL);

  v12 = v9;
  [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)configurationMetrics
{
  v13[1] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  4LL,  0LL);
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v13[0] = v2;
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v3, "initWithCadenceTuples:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  [(id)objc_opt_class() subsystem];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"preUnlock",  v7,  @"Configuration",  5LL,  v8,  v5,  1.0,  0x100000002LL,  0x100000447LL,  0x300000001LL,  0x100000001LL,  0LL);

  v12 = v9;
  [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)timezoneMetrics
{
  v20[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  [(id)objc_opt_class() subsystem];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSStorageMetrics timezoneLoggingCadence](&OBJC_CLASS___PPSStorageMetrics, "timezoneLoggingCadence");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"CountryCode",  v3,  @"Locale",  3LL,  v4,  v5,  2.0,  0x100000003LL,  0x10000001ELL,  0x300000001LL,  0x100000001LL,  0LL);

  BOOL v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  [(id)objc_opt_class() subsystem];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v10 = +[PPSStorageMetrics timezoneLoggingCadence](&OBJC_CLASS___PPSStorageMetrics, "timezoneLoggingCadence");
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v7,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"SecondsFromGMT",  v8,  @"Locale",  7LL,  v9,  v10,  2.0,  0x100000003LL,  0x100000447LL,  0x300000001LL,  0x100000001LL,  0LL);

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v12,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"TimeZoneIsInDST",  5LL,  v13,  v11,  0LL,  2.0);

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Trigger",  3LL,  v16,  v6,  0LL,  2.0);

  v20[0] = v6;
  v20[1] = v11;
  v20[2] = v14;
  v20[3] = v17;
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:4];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)timezoneLoggingCadence
{
  v10[2] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  4LL,  0LL);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  10LL);
  v4 = v3;
  v5 = 0LL;
  if (v2) {
    BOOL v6 = v3 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    BOOL v7 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v10[0] = v2;
    v10[1] = v4;
    [MEMORY[0x189603F18] arrayWithObjects:v10 count:2];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v7, "initWithCadenceTuples:", v8);
  }

  return v5;
}

@end