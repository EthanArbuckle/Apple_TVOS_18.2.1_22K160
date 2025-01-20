@interface PPSWifiMetrics
+ (id)allDeclMetrics;
+ (id)awdlStateLoggingCadence;
+ (id)awdlStateMetrics;
+ (id)subsystem;
@end

@implementation PPSWifiMetrics

+ (id)subsystem
{
  return @"WifiMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() awdlStateMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)awdlStateMetrics
{
  v21[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSWifiMetrics subsystem](&OBJC_CLASS___PPSWifiMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSWifiMetrics awdlStateLoggingCadence](&OBJC_CLASS___PPSWifiMetrics, "awdlStateLoggingCadence");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"AWDLDown",  v3,  @"AWDLState",  5LL,  v4,  v5,  1.0,  0x200000003LL,  0x100000001LL,  0x300000010LL,  0x100000001LL,  0LL);

  v20 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v19[0] = @"None";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v19[1] = @"AssistedDiscoveryMode";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v19[2] = @"FollowMode";
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v12,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"AWDLRanging",  7LL,  v13,  v6,  v11,  2.0);

  v17[0] = v6;
  v17[1] = v14;
  [MEMORY[0x189603F18] arrayWithObjects:v17 count:2];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)awdlStateLoggingCadence
{
  v7[1] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  9LL);
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v7[0] = v2;
    [MEMORY[0x189603F18] arrayWithObjects:v7 count:1];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v3, "initWithCadenceTuples:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

@end