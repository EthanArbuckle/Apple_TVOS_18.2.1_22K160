@interface PPSDownloadMetrics
+ (id)allDeclMetrics;
+ (id)autoAssetDownloadMetrics;
+ (id)subsystem;
+ (id)v2AssetDownloadMetrics;
@end

@implementation PPSDownloadMetrics

+ (id)subsystem
{
  return @"DownloadMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() autoAssetDownloadMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() v2AssetDownloadMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)autoAssetDownloadMetrics
{
  v31[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"assetType",  @"DownloadMetrics",  @"AutoAssetDownloads",  3LL,  v3,  v4,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit megabytes](&OBJC_CLASS___PPSUnit, "megabytes");
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"bytesDownloaded",  7LL,  v7,  v5,  0LL,  1.0);

  v9 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v11 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v9,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"clientName",  3LL,  v10,  v5,  0LL,  1.0);

  v30 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  v29[0] = @"Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v13;
  v29[1] = @"Successful";
  [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Result",  5LL,  v17,  v5,  v15,  1.0);

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v20,  v5,  0LL,  1.0);

  v22 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v23 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v22,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"assetVersion",  3LL,  v23,  v5,  0LL,  1.0);

  v27[0] = v5;
  v27[1] = v8;
  v27[2] = v11;
  v27[3] = v18;
  v27[4] = v21;
  v27[5] = v24;
  [MEMORY[0x189603F18] arrayWithObjects:v27 count:6];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)v2AssetDownloadMetrics
{
  v28[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"assetType",  @"DownloadMetrics",  @"v2AssetDownloads",  3LL,  v3,  v4,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit megabytes](&OBJC_CLASS___PPSUnit, "megabytes");
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"bytesDownloaded",  7LL,  v7,  v5,  0LL,  1.0);

  v9 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v11 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v9,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"clientName",  3LL,  v10,  v5,  0LL,  1.0);

  v27 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v26[0] = @"Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  v26[1] = @"Successful";
  [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Result",  5LL,  v17,  v5,  v15,  1.0);

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v20,  v5,  0LL,  1.0);

  v24[0] = v5;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v18;
  v24[4] = v21;
  [MEMORY[0x189603F18] arrayWithObjects:v24 count:5];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end