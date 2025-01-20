@interface PPSMessageMetrics
+ (id)allDeclMetrics;
+ (id)rcsRegisterKeepAliveMetrics;
+ (id)rcsSessionManagementMetrics;
+ (id)subsystem;
@end

@implementation PPSMessageMetrics

+ (id)subsystem
{
  return @"Message";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() rcsSessionManagementMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() rcsRegisterKeepAliveMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)rcsSessionManagementMetrics
{
  v46[2] = *MEMORY[0x1895F89C0];
  v45[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v2;
  v44[0] = @"Received";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v3;
  v44[1] = @"Sent";
  [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = @"MetricType";
  v46[0] = v4;
  v5 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v46[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v8 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Action",  @"Message",  @"RCSSessionManagement",  7LL,  v7,  v8,  1.0,  0x200000002LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v33);

  v41[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v10;
  v40[0] = @"Cellular";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v11;
  v40[1] = @"Wifi";
  [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = @"MetricType";
  v42[0] = v12;
  v13 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v42[1] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Interface",  7LL,  v16,  v9,  v14,  1.0);

  v37[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v18;
  v36[0] = @"SIP Invite";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  v36[1] = @"BYE";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v20;
  v36[2] = @"SIP Refer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v21;
  v36[3] = @"SIP Registration";
  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:4];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = @"MetricType";
  v38[0] = v22;
  v23 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v38[1] = v23;
  [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v26 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v25,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"TransactionType",  7LL,  v26,  v9,  v24,  1.1);

  v28 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v29 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v28,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  7LL,  v29,  v9,  0LL,  1.0);

  v34[0] = v9;
  v34[1] = v17;
  v34[2] = v27;
  v34[3] = v30;
  [MEMORY[0x189603F18] arrayWithObjects:v34 count:4];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)rcsRegisterKeepAliveMetrics
{
  v20[2] = *MEMORY[0x1895F89C0];
  v19[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v18[0] = @"Cellular";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v18[1] = @"Wifi";
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v20[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v7,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Interface",  @"Message",  @"SIPRegisterKeepAlive",  7LL,  v8,  v9,  1.0,  0x200000002LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v6);

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v12 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v11,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  7LL,  v12,  v10,  &unk_18A29AE98,  1.0);

  v16[0] = v10;
  v16[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end