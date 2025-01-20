@interface PPSLocaleMetrics
+ (id)allDeclMetrics;
+ (id)subsystem;
+ (id)timezoneLoggingCadence;
+ (id)timezoneMetrics;
@end

@implementation PPSLocaleMetrics

+ (id)subsystem
{
  return @"LocaleMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() timezoneMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)timezoneMetrics
{
  v15[3] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSLocaleMetrics subsystem](&OBJC_CLASS___PPSLocaleMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSLocaleMetrics timezoneLoggingCadence](&OBJC_CLASS___PPSLocaleMetrics, "timezoneLoggingCadence");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"TimeZoneName",  v3,  @"TimeZone",  3LL,  v4,  v5,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"SecondsFromGMT",  7LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"TimeZoneIsInDST",  5LL,  v11,  v6,  0LL,  1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
    v7 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v10[0] = v2;
    v10[1] = v4;
    [MEMORY[0x189603F18] arrayWithObjects:v10 count:2];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v7, "initWithCadenceTuples:", v8);
  }

  return v5;
}

@end