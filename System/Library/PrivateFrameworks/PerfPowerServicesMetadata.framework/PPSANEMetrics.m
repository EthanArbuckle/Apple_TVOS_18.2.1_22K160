@interface PPSANEMetrics
+ (id)ANEStatusMetrics;
+ (id)allDeclMetrics;
+ (id)compileMetrics;
+ (id)inferenceMetrics;
+ (id)modelLoadMetrics;
+ (id)modelUnLoadMetrics;
+ (id)newInstanceModelLoadMetrics;
+ (id)newInstanceModelUnLoadMetrics;
+ (id)subsystem;
@end

@implementation PPSANEMetrics

+ (id)subsystem
{
  return @"ANE";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() compileMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() inferenceMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  [(id)objc_opt_class() modelLoadMetrics];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v5];

  [(id)objc_opt_class() modelUnLoadMetrics];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v6];

  v7 = (void *)[(id)objc_opt_class() newInstanceModelUnLoadMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = (void *)[(id)objc_opt_class() newInstanceModelLoadMetrics];
  [v2 addObjectsFromArray:v8];

  [(id)objc_opt_class() ANEStatusMetrics];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v9];

  return v2;
}

+ (id)compileMetrics
{
  v44[2] = *MEMORY[0x1895F89C0];
  v43[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v2;
  v42[0] = @"ANECIR";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v3;
  v42[1] = @"CoreML";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v4;
  v42[2] = @"MIL";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v5;
  v42[3] = @"JIT+ANECIR";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v6;
  v42[4] = @"JIT+CoreML";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v7;
  v42[5] = @"JIT+MIL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:6];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = @"MetricType";
  v44[0] = v8;
  v9 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v44[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v10,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelType",  @"ANE",  @"modelCompilation",  7LL,  v11,  v12,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  v37);

  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v14,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelCompileTime",  7LL,  v15,  v13,  0LL,  1.0);

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelIRTranslationTime",  7LL,  v17,  v13,  0LL,  1.0);

  v18 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v19 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v18,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelCompiled",  5LL,  v19,  v13,  0LL,  1.0);

  v39[0] = @"DMACompliant";
  v39[1] = @"MetricType";
  v40[0] = MEMORY[0x189604A88];
  v21 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v40[1] = v21;
  [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v24 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v23,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"csIdentity",  3LL,  v24,  v13,  v22,  1.0);

  v26 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v27 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v28 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v29 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v26,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelURL",  @"ANE",  @"modelCompilation",  3LL,  v27,  v28,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x300000001LL,  0LL);

  v30 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v31 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v30,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"compilationArgs",  3LL,  v31,  v13,  0LL,  1.0);

  v38[0] = v13;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v20;
  v38[4] = v25;
  v38[5] = v29;
  v38[6] = v32;
  [MEMORY[0x189603F18] arrayWithObjects:v38 count:7];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)inferenceMetrics
{
  v59[2] = *MEMORY[0x1895F89C0];
  v58[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v52;
  v57[0] = @"Success";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v51;
  v57[1] = @"No Memory";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v50;
  v57[2] = @"Bad Argument";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v49;
  v57[3] = @"Not Supported";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v48;
  v57[4] = @"Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v47;
  v57[5] = @"No Resources";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v46;
  v57[6] = @"Device Controller Creation Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v45;
  v57[7] = @"Device Controller Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v44;
  v57[8] = @"Device Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v43;
  v57[9] = @"Device Open Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v42;
  v57[10] = @"Device PowerOn Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v41;
  v57[11] = @"Program Not Prepared";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v40;
  v57[12] = @"Dylib Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[13] = v39;
  v57[13] = @"Function Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[14] = v38;
  v57[14] = @"Program Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56[15] = v37;
  v57[15] = @"Timeout";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[16] = v36;
  v57[16] = @"Hardware Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56[17] = v35;
  v57[17] = @"Firmware Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[18] = v34;
  v57[18] = @"Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v56[19] = v33;
  v57[19] = @"Bad Program";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[20] = v32;
  v57[20] = @"Not Privileged";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[21] = v30;
  v57[21] = @"Request Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[22] = v29;
  v57[22] = @"Not Ready";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v56[23] = v2;
  v57[23] = @"Not Permitted";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v56[24] = v3;
  v57[24] = @"Unsupported";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[25] = v4;
  v57[25] = @"Higher Priority Request Present";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56[26] = v5;
  v57[26] = @"Failed To Allocate Shared Intermediate Buffer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56[27] = v6;
  v57[27] = @"Failed To Lock Shared Intermediate Buffer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56[28] = v7;
  v57[28] = @"Iso Too Old";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[29] = v8;
  v57[29] = @"Smaller IOBuffers Than Expected";
  [MEMORY[0x189603F68] dictionaryWithObjects:v57 forKeys:v56 count:30];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = @"MetricType";
  v59[0] = v9;
  v10 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v59[1] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v59 forKeys:v58 count:2];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v12 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v13 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v11,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"failureReason",  @"ANE",  @"modelInference",  7LL,  v12,  v13,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  v31);

  v54[0] = @"DMACompliant";
  v54[1] = @"MetricType";
  v55[0] = MEMORY[0x189604A88];
  v15 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v55[1] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"csIdentity",  3LL,  v18,  v14,  v16,  1.0);

  v20 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v21 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v22 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v23 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v20,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelURL",  @"ANE",  @"modelInference",  3LL,  v21,  v22,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x300000001LL,  0LL);

  v24 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v25 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v24,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"programHandle",  7LL,  v25,  v14,  0LL,  1.0);

  v53[0] = v14;
  v53[1] = v19;
  v53[2] = v23;
  v53[3] = v26;
  [MEMORY[0x189603F18] arrayWithObjects:v53 count:4];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)modelLoadMetrics
{
  v38[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"isPrecompiled",  @"ANE",  @"modelLoad",  5LL,  v3,  v4,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"cacheHit",  5LL,  v7,  v5,  0LL,  1.0);

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelLoaded",  5LL,  v9,  v5,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelLoadingTime",  8LL,  v11,  v5,  0LL,  1.0);

  v37[0] = @"DMACompliant";
  v37[1] = @"MetricType";
  v38[0] = MEMORY[0x189604A88];
  v12 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v38[1] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"csIdentity",  3LL,  v14,  v5,  v30,  1.0);

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v18 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v19 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v16,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelURL",  @"ANE",  @"modelLoad",  3LL,  v17,  v18,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x300000001LL,  0LL);

  v20 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v21 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v20,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"programHandle",  7LL,  v21,  v5,  0LL,  1.0);

  v36[0] = &unk_18A29ACF0;
  v35[0] = @"GroupingDimensions";
  v35[1] = @"MetricType";
  v23 = +[PPSMetricType absoluteMeasure](&OBJC_CLASS___PPSMetricType, "absoluteMeasure");
  v36[1] = v23;
  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v26 = +[PPSUnit bytes](&OBJC_CLASS___PPSUnit, "bytes");
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v25,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelSize",  7LL,  v26,  v5,  v24,  1.0);

  v34[0] = v5;
  v34[1] = v33;
  v34[2] = v32;
  v34[3] = v31;
  v34[4] = v15;
  v34[5] = v19;
  v34[6] = v22;
  v34[7] = v27;
  [MEMORY[0x189603F18] arrayWithObjects:v34 count:8];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)modelUnLoadMetrics
{
  v22[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"modelUnloaded",  @"ANE",  @"modelUnload",  5LL,  v3,  v4,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  0LL);

  v21[0] = @"DMACompliant";
  v21[1] = @"MetricType";
  v22[0] = MEMORY[0x189604A88];
  v6 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v22[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"csIdentity",  3LL,  v9,  v5,  v7,  1.0);

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v12 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v13 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v11,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelURL",  @"ANE",  @"modelUnload",  3LL,  v12,  v13,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x300000001LL,  0LL);

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"programHandle",  7LL,  v16,  v5,  0LL,  1.0);

  v20[0] = v5;
  v20[1] = v10;
  v20[2] = v14;
  v20[3] = v17;
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:4];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)newInstanceModelUnLoadMetrics
{
  v22[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"newInstanceUnloaded",  @"ANE",  @"newInstanceModelUnload",  5LL,  v3,  v4,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  0LL);

  v21[0] = @"DMACompliant";
  v21[1] = @"MetricType";
  v22[0] = MEMORY[0x189604A88];
  v6 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v22[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"csIdentity",  3LL,  v9,  v5,  v7,  1.0);

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v12 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v13 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v11,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelURL",  @"ANE",  @"newInstanceModelUnload",  3LL,  v12,  v13,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x300000001LL,  0LL);

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"programHandle",  7LL,  v16,  v5,  0LL,  1.0);

  v20[0] = v5;
  v20[1] = v10;
  v20[2] = v14;
  v20[3] = v17;
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:4];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)newInstanceModelLoadMetrics
{
  v28[2] = *MEMORY[0x1895F89C0];
  v28[0] = MEMORY[0x189604A88];
  v27[0] = @"DMACompliant";
  v27[1] = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v28[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v3,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"csIdentity",  @"ANE",  @"newInstanceModelLoad",  3LL,  v4,  v5,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  v25);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v7,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"modelURL",  @"ANE",  @"newInstanceModelLoad",  3LL,  v8,  v9,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x300000001LL,  0LL);

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v12 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v11,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"programHandle",  7LL,  v12,  v6,  0LL,  1.0);

  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v14,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"newInstanceLoaded",  5LL,  v15,  v6,  0LL,  1.0);

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"modelLoadingTime",  8LL,  v18,  v6,  0LL,  1.0);

  v20 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v21 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v20,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"numWeightFiles",  7LL,  v21,  v6,  0LL,  1.0);

  v26[0] = v6;
  v26[1] = v10;
  v26[2] = v13;
  v26[3] = v16;
  v26[4] = v19;
  v26[5] = v22;
  [MEMORY[0x189603F18] arrayWithObjects:v26 count:6];
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ANEStatusMetrics
{
  v73[2] = *MEMORY[0x1895F89C0];
  v72[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v62;
  v71[0] = @"Unknown";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v60;
  v71[1] = @"Device Creation";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v58;
  v71[2] = @"Program Creation";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v56;
  v71[3] = @"Device Destruction";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v54;
  v71[4] = @"Program Destruction";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v52;
  v71[5] = @"Program Prepare";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v70[6] = v50;
  v71[6] = @"Program Stop";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v70[7] = v48;
  v71[7] = @"Request Begin";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70[8] = v46;
  v71[8] = @"Request Completed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v70[9] = v44;
  v71[9] = @"Request Cancelled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[10] = v42;
  v71[10] = @"Request Event";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70[11] = v40;
  v71[11] = @"Request Timeout";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v70[12] = v38;
  v71[12] = @"Timeout";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v70[13] = v2;
  v71[13] = @"Event";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v70[14] = v3;
  v71[14] = @"Resource Availability";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70[15] = v4;
  v71[15] = @"Crashed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v70[16] = v5;
  v71[16] = @"Device Sleep";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70[17] = v6;
  v71[17] = @"Device Wakeup";
  [MEMORY[0x189603F68] dictionaryWithObjects:v71 forKeys:v70 count:18];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = @"MetricType";
  v73[0] = v7;
  v8 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v73[1] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v73 forKeys:v72 count:2];
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v11 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v63 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v9,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"statusType",  @"ANE",  @"ANEStatus",  7LL,  v10,  v11,  1.0,  0x200000002LL,  0x100000001LL,  0x300000002LL,  0x100000001LL,  v64);

  v68[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v61;
  v67[0] = @"Success";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v59;
  v67[1] = @"No Memory";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v57;
  v67[2] = @"Bad Argument";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v55;
  v67[3] = @"Not Supported";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v53;
  v67[4] = @"Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v51;
  v67[5] = @"No Resources";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v49;
  v67[6] = @"Device Controller Creation Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v47;
  v67[7] = @"Device Controller Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v45;
  v67[8] = @"Device Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v43;
  v67[9] = @"Device Open Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[10] = v41;
  v67[10] = @"Device PowerOn Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[11] = v39;
  v67[11] = @"Program Not Prepared";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[12] = v37;
  v67[12] = @"Dylib Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[13] = v36;
  v67[13] = @"Function Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v66[14] = v35;
  v67[14] = @"Program Not Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[15] = v34;
  v67[15] = @"Timeout";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[16] = v33;
  v67[16] = @"Hardware Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[17] = v32;
  v67[17] = @"Firmware Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v66[18] = v31;
  v67[18] = @"Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[19] = v30;
  v67[19] = @"Bad Program";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66[20] = v29;
  v67[20] = @"Not Privileged";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66[21] = v28;
  v67[21] = @"Request Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[22] = v27;
  v67[22] = @"Not Ready";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66[23] = v12;
  v67[23] = @"Not Permitted";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v66[24] = v13;
  v67[24] = @"Unsupported";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v66[25] = v14;
  v67[25] = @"Higher Priority Request Present";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[26] = v15;
  v67[26] = @"Failed To Allocate Shared Intermediate Buffer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v66[27] = v16;
  v67[27] = @"Failed To Lock Shared Intermediate Buffer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66[28] = v17;
  v67[28] = @"Iso Too Old";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v66[29] = v18;
  v67[29] = @"Smaller IOBuffers Than Expected";
  [MEMORY[0x189603F68] dictionaryWithObjects:v67 forKeys:v66 count:30];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v19;
  v68[1] = @"MetricType";
  v20 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v69[1] = v20;
  [MEMORY[0x189603F68] dictionaryWithObjects:v69 forKeys:v68 count:2];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v23 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v22,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"returnType",  7LL,  v23,  v63,  v21,  1.0);

  v65[0] = v63;
  v65[1] = v24;
  [MEMORY[0x189603F18] arrayWithObjects:v65 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end