@interface PPSNetworkRelayMetrics
+ (id)allDeclMetrics;
+ (id)linkAdvisoryMetrics;
+ (id)subsystem;
@end

@implementation PPSNetworkRelayMetrics

+ (id)subsystem
{
  return @"NetworkRelay";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() linkAdvisoryMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)linkAdvisoryMetrics
{
  v69[1] = *MEMORY[0x1895F89C0];
  v68 = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v69[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v69 forKeys:&v68 count:1];
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v3,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"bundleID",  @"NetworkRelay",  @"LinkAdvisory",  3LL,  v4,  v5,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v50);

  v66 = @"MetricType";
  v7 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v67 = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v48 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"reason",  7LL,  v9,  v6,  v49,  1.0);

  v64[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v10;
  v63[0] = @"Invalid";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v11;
  v63[1] = @"Start-Advice";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v12;
  v63[2] = @"Advice-Activated";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v13;
  v63[3] = @"End-Advice";
  [MEMORY[0x189603F68] dictionaryWithObjects:v63 forKeys:v62 count:4];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v14;
  v65[1] = &unk_18A29AC78;
  v64[1] = @"GroupingDimensions";
  v64[2] = @"MetricType";
  v15 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v65[2] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v65 forKeys:v64 count:3];
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v46 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"activity",  7LL,  v17,  v6,  v47,  2.0);

  v60[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v18;
  v59[0] = @"None";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v19;
  v59[1] = @"BT Default";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v20;
  v59[2] = @"BT Classic";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v21;
  v59[3] = @"WiFi";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v22;
  v59[4] = @"No Upgrade";
  [MEMORY[0x189603F68] dictionaryWithObjects:v59 forKeys:v58 count:5];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v23;
  v60[1] = @"MetricType";
  v24 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v61[1] = v24;
  [MEMORY[0x189603F68] dictionaryWithObjects:v61 forKeys:v60 count:2];
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v26 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v44 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v25,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"advice",  7LL,  v26,  v6,  v45,  1.0);

  v56[0] = @"GroupingDimensions";
  v56[1] = @"MetricType";
  v57[0] = &unk_18A29AC90;
  v27 = +[PPSMetricType absoluteMeasure](&OBJC_CLASS___PPSMetricType, "absoluteMeasure");
  v57[1] = v27;
  [MEMORY[0x189603F68] dictionaryWithObjects:v57 forKeys:v56 count:2];
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v29 = +[PPSUnit megabytes](&OBJC_CLASS___PPSUnit, "megabytes");
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v28,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"estimatedMB",  7LL,  v29,  v6,  v43,  1.0);

  v54[1] = @"MetricType";
  v55[0] = &unk_18A29ACA8;
  v54[0] = @"GroupingDimensions";
  v31 = +[PPSMetricType absoluteMeasure](&OBJC_CLASS___PPSMetricType, "absoluteMeasure");
  v55[1] = v31;
  [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:2];
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v34 = +[PPSUnit megabytes](&OBJC_CLASS___PPSUnit, "megabytes");
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v33,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"actualMBOverWiFi",  7LL,  v34,  v6,  v32,  1.0);

  v52[0] = @"GroupingDimensions";
  v52[1] = @"MetricType";
  v53[0] = &unk_18A29ACC0;
  v36 = +[PPSMetricType absoluteMeasure](&OBJC_CLASS___PPSMetricType, "absoluteMeasure");
  v53[1] = v36;
  [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v39 = +[PPSUnit megabytes](&OBJC_CLASS___PPSUnit, "megabytes");
  v40 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v38,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"actualMBOverCompanionLink",  7LL,  v39,  v6,  v37,  1.0);

  v51[0] = v6;
  v51[1] = v48;
  v51[2] = v46;
  v51[3] = v44;
  v51[4] = v30;
  v51[5] = v35;
  v51[6] = v40;
  [MEMORY[0x189603F18] arrayWithObjects:v51 count:7];
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

@end