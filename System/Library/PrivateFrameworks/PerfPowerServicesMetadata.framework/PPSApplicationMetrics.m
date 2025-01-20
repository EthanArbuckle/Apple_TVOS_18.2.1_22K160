@interface PPSApplicationMetrics
+ (id)allDeclMetrics;
+ (id)remoteControlSessionMetrics;
+ (id)subsystem;
@end

@implementation PPSApplicationMetrics

+ (id)subsystem
{
  return @"ApplicationMetrics";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

+ (id)remoteControlSessionMetrics
{
  v37[2] = *MEMORY[0x1895F89C0];
  v36[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v2;
  v35[0] = @"Start";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v3;
  v35[1] = @"End";
  [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = @"MetricType";
  v37[0] = v4;
  v5 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v37[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:v36 count:2];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSApplicationMetrics subsystem](&OBJC_CLASS___PPSApplicationMetrics, "subsystem");
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v27 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"event",  v7,  @"RemoteControlSession",  7LL,  v8,  v9,  1.1,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v28);

  v32 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v31[0] = @"Unknown";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v25;
  v31[1] = @"User-Initiated";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v24;
  v31[2] = @"Remote-Initiated";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v10;
  v31[3] = @"Closed-By-Viewer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v11;
  v31[4] = @"Closed-By-Server";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v12;
  v31[5] = @"Connection-Interrupted";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v13;
  v31[6] = @"New-Session-Created";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v14;
  v31[7] = @"Session-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v15;
  v31[8] = @"Transport-Interrupted";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v16;
  v31[9] = @"Timeout";
  [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:10];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"reason",  7LL,  v20,  v27,  v18,  1.0);

  v29[0] = v27;
  v29[1] = v21;
  [MEMORY[0x189603F18] arrayWithObjects:v29 count:2];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end