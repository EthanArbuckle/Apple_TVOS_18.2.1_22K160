@interface PPSAPSDMetrics
+ (id)allDeclMetrics;
+ (id)pubSubMetrics;
+ (id)subsystem;
@end

@implementation PPSAPSDMetrics

+ (id)subsystem
{
  return @"APSD";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() pubSubMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)pubSubMetrics
{
  v48[1] = *MEMORY[0x1895F89C0];
  v47 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v2;
  v46[0] = @"WWAN";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v3;
  v46[1] = @"NonCellular";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v4;
  v46[2] = @"Proxy";
  [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v8 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"ConnectionType",  @"APSD",  @"PubSub",  7LL,  v7,  v8,  1.0,  0x200000002LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v33);

  v43 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v10;
  v42[0] = @"Production";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v11;
  v42[1] = @"Development";
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v14,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Environment",  7LL,  v15,  v9,  v13,  1.0);

  v39 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  v38[0] = @"Unsubscribe";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  v38[1] = @"Subscribe";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v19;
  v38[2] = @"FullSubscription";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v20;
  v38[3] = @"ServerRequestResubscribe";
  [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:4];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v21;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v24 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v23,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"MessageType",  7LL,  v24,  v9,  v22,  1.0);

  v35 = @"MetricType";
  v26 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v36 = v26;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v29 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v28,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Topic",  3LL,  v29,  v9,  v27,  1.0);

  v34[0] = v9;
  v34[1] = v16;
  v34[2] = v25;
  v34[3] = v30;
  [MEMORY[0x189603F18] arrayWithObjects:v34 count:4];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end