@interface PPSGenerativeFunctionMetrics
+ (id)allDeclMetrics;
+ (id)appleDiffusionMetrics;
+ (id)assetLoadMetrics;
+ (id)fileResidentRatioMetrics;
+ (id)handwritingModelInferenceMetrics;
+ (id)handwritingModelLoadMetrics;
+ (id)mmExecuteRequestMetrics;
+ (id)optInMetrics;
+ (id)smartReplySessionMetrics;
+ (id)subsystem;
+ (id)summarizationMetrics;
+ (id)tgiExecuteRequestMetrics;
@end

@implementation PPSGenerativeFunctionMetrics

+ (id)subsystem
{
  return @"GenerativeFunctionMetrics";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

+ (id)appleDiffusionMetrics
{
  v38[1] = *MEMORY[0x1895F89C0];
  v37 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v2;
  v36[0] = @"100k - 200k pixels";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v3;
  v36[1] = @"200,001 - 500k pixels";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v4;
  v36[2] = @"500,001 - 1.1m pixels";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v5;
  v36[3] = @"> 1.1m pixels";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v6;
  v36[4] = @"< 100k pixels or nil";
  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v10 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v9,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"adapters",  v10,  @"appleDiffusion",  3LL,  v11,  v12,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v14,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"generationID",  3LL,  v15,  v13,  0LL,  1.0);

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"inputPixels",  7LL,  v18,  v13,  v8,  1.0);

  v20 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v21 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v20,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"outputPixels",  7LL,  v21,  v13,  v8,  1.0);

  v23 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v24 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v23,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"requestIdentifier",  3LL,  v24,  v13,  0LL,  1.0);

  v26 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v27 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v28 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v26,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v27,  v13,  0LL,  1.0);

  v29 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v30 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v29,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"unetIterations",  7LL,  v30,  v13,  0LL,  1.0);

  v34[0] = v13;
  v34[1] = v16;
  v34[2] = v19;
  v34[3] = v22;
  v34[4] = v25;
  v34[5] = v28;
  v34[6] = v31;
  [MEMORY[0x189603F18] arrayWithObjects:v34 count:7];
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)assetLoadMetrics
{
  v70[1] = *MEMORY[0x1895F89C0];
  v69 = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v70[0] = v2;
  uint64_t v3 = [MEMORY[0x189603F68] dictionaryWithObjects:v70 forKeys:&v69 count:1];

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v6 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v7 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v54 = (void *)v3;
  v55 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"catalogResourceIdentifier",  v5,  @"assetLoad",  3LL,  v6,  v7,  1.1,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v53 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"inferenceProviderIdentifier",  3LL,  v9,  v55,  v3,  1.0);

  v67 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v10;
  v66[0] = @"Acquire";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v11;
  v66[1] = @"Release";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v12;
  v66[2] = @"Unloaded-To-Dynamic-Mode";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v13;
  v66[3] = @"Loaded-To-Dynamic-Mode";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v14;
  v66[4] = @"Dynamic-Mode-To-Loaded";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[5] = v15;
  v66[5] = @"Dynamic-Mode-To-Unloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:v65 count:6];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v51 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"loadType",  7LL,  v18,  v55,  v52,  1.1);

  v63 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v49;
  v62[0] = @"Unknown";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v48;
  v62[1] = @"User-Initiated";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v47;
  v62[2] = @"Policy-Change";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v46;
  v62[3] = @"Memory-Budget-Pressure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v45;
  v62[4] = @"Aquisition-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v19;
  v62[5] = @"Prewarm";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v20;
  v62[6] = @"Inactivity-Timer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v21;
  v62[7] = @"Asset-Version-Change";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v22;
  v62[8] = @"Background-Session";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v23;
  v62[9] = @"Connection-Termination";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v24;
  v62[10] = @"Critical-Memory";
  [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:v61 count:11];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v25;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v27 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v28 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v26,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"reason",  7LL,  v27,  v55,  v50,  1.3);

  v59 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v29;
  v58[0] = @"Unknown";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v30;
  v58[1] = @"Success";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v31;
  v58[2] = @"Failure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v58 forKeys:v57 count:3];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v32;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v35 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v34,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"result",  7LL,  v35,  v55,  v33,  2.0);

  v37 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v38 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v37,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sessionIdentifier",  3LL,  v38,  v55,  0LL,  1.0);

  v40 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v41 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v42 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v40,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v41,  v55,  0LL,  1.0);

  v56[0] = v55;
  v56[1] = v53;
  v56[2] = v51;
  v56[3] = v28;
  v56[4] = v36;
  v56[5] = v39;
  v56[6] = v42;
  [MEMORY[0x189603F18] arrayWithObjects:v56 count:7];
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)fileResidentRatioMetrics
{
  v15[3] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"catalogResourceIdentifier",  v3,  @"fileResidentInfo",  3LL,  v4,  v5,  1.0,  0x200000002LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"fileResidentRatio",  7LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit kilobytes](&OBJC_CLASS___PPSUnit, "kilobytes");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"memoryCostKB",  7LL,  v11,  v6,  0LL,  1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)handwritingModelInferenceMetrics
{
  v34[1] = *MEMORY[0x1895F89C0];
  v33 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v2;
  v32[0] = @"Stroke-Classifier";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v3;
  v32[1] = @"Stroke-Grouping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v4;
  v32[2] = @"Math-Recognizer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v5;
  v32[3] = @"Synthesizer";
  [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v11 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v8,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"model",  v9,  @"HandwritingInference",  7LL,  v10,  v11,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v7);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"inputStringLength",  7LL,  v14,  v12,  0LL,  1.0);

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"inputStrokeCount",  7LL,  v17,  v12,  0LL,  1.0);

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"outputStringLength",  7LL,  v20,  v12,  0LL,  1.0);

  v22 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v23 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v22,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"outputStrokeCount",  7LL,  v23,  v12,  0LL,  1.0);

  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v26 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v25,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v26,  v12,  0LL,  1.0);

  v30[0] = v12;
  v30[1] = v15;
  v30[2] = v18;
  v30[3] = v21;
  v30[4] = v24;
  v30[5] = v27;
  [MEMORY[0x189603F18] arrayWithObjects:v30 count:6];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)handwritingModelLoadMetrics
{
  v30[1] = *MEMORY[0x1895F89C0];
  v29 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v2;
  v28[0] = @"Stroke-Classifier";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v28[1] = @"Stroke-Grouping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v4;
  v28[2] = @"Math-Recognizer";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v5;
  v28[3] = @"Synthesizer";
  [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v11 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v8,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"model",  v9,  @"HandwritingModelLoad",  7LL,  v10,  v11,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v7);

  v25 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v24[0] = @"Acquire";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v24[1] = @"Release";
  [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"loadType",  7LL,  v18,  v12,  v16,  1.0);

  v22[0] = v12;
  v22[1] = v19;
  [MEMORY[0x189603F18] arrayWithObjects:v22 count:2];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)mmExecuteRequestMetrics
{
  v66[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"catalogResourceIdentifier",  v3,  @"mmExecuteRequest",  3LL,  v4,  v5,  1.1,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v53 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"createdByBundleIdentifier",  3LL,  v8,  v6,  0LL,  1.0);

  v65 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v9;
  v64[0] = @"No-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v10;
  v64[1] = @"Error";
  [MEMORY[0x189603F68] dictionaryWithObjects:v64 forKeys:v63 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v51 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v12,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"error",  5LL,  v13,  v6,  v52,  1.0);

  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v50 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v14,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"inferenceProviderIdentifier",  3LL,  v15,  v6,  0LL,  1.0);

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v49 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"onBehalfOfBundleIdentifier",  3LL,  v17,  v6,  0LL,  1.1);

  v61 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0xFFFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v18;
  v60[0] = @"Default";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v19;
  v60[1] = @"User-Interactive";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v20;
  v60[2] = @"User-Initiated";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v21;
  v60[3] = @"Utility";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v22;
  v60[4] = @"Background";
  [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:5];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v23;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v25 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v47 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v24,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"qos",  7LL,  v25,  v6,  v48,  1.0);

  v26 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v27 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v46 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v26,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"requestIdentifier",  3LL,  v27,  v6,  0LL,  1.0);

  v57 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v28;
  v56[0] = @"One-Shot";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v29;
  v56[1] = @"Streaming";
  [MEMORY[0x189603F68] dictionaryWithObjects:v56 forKeys:v55 count:2];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v32 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v44 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v31,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"requestType",  7LL,  v32,  v6,  v45,  1.0);

  v33 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v34 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v33,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sessionIdentifier",  3LL,  v34,  v6,  0LL,  1.0);

  v36 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v37 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v38 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v36,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"useCaseIdentifier",  3LL,  v37,  v6,  0LL,  1.0);

  v39 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v40 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v41 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v39,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v40,  v6,  0LL,  1.0);

  v54[0] = v6;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v47;
  v54[6] = v46;
  v54[7] = v44;
  v54[8] = v35;
  v54[9] = v38;
  v54[10] = v41;
  [MEMORY[0x189603F18] arrayWithObjects:v54 count:11];
  id v43 = (id)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)optInMetrics
{
  v18[2] = *MEMORY[0x1895F89C0];
  v17[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v16[0] = @"Disabled/Unavailable";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v16[1] = @"Enabled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v18[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v10 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v7,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Enabled",  v8,  @"OptIn",  5LL,  v9,  v10,  2.01,  0x200000003LL,  0x100000001LL,  0x300000015LL,  0x100000001LL,  v6);

  v14 = v11;
  [MEMORY[0x189603F18] arrayWithObjects:&v14 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)summarizationMetrics
{
  v68[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v59 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"bundleID",  v3,  @"Summarization",  3LL,  v4,  v5,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v58 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"characterLength",  v7,  @"Summarization",  7LL,  v8,  v9,  1.0,  0x200000005LL,  0x100000001LL,  0x100000001LL,  0x100000001LL,  0LL);

  v67 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v55;
  v66[0] = @"Missing-ID";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v53;
  v66[1] = @"MissingSender";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v52;
  v66[2] = @"Domain-ID";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v51;
  void v66[3] = @"Already-Handled-By-Mail-Pipeline";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v50;
  v66[4] = @"Already-Handled-By-Messages-Pipeline";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v65[5] = v49;
  v66[5] = @"Already-Processed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  void v65[6] = v48;
  void v66[6] = @"Not-Eligible-For-Summarization";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v65[7] = v47;
  v66[7] = @"Stack-Not-Eligible-For-Summarization";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65[8] = v46;
  v66[8] = @"Notification-Not-Eligible-For-Summarization";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v65[9] = v45;
  v66[9] = @"Task-Cancelled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65[10] = v10;
  v66[10] = @"Task-Cancelled2";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65[11] = v11;
  v66[11] = @"Throttled-By-Power-Budget";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65[12] = v12;
  v66[12] = @"Successful";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65[13] = v13;
  v66[13] = @"Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[14] = v14;
  v66[14] = @"Input-Too-Short";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[15] = v15;
  v66[15] = @"Use-Case-Disabled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:v65 count:16];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:v68 forKeys:&v67 count:1];
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v56 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"exitReason",  7LL,  v18,  v59,  v57,  1.1);

  v63 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v19;
  v62[0] = @"Mail";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v20;
  v62[1] = @"Message";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v21;
  v62[2] = @"Notification";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v22;
  v62[3] = @"Notification-Stack";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v23;
  v62[4] = @"Mail-Thread";
  [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:v61 count:5];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v24;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v26 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v25,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"kind",  7LL,  v26,  v59,  v54,  1.1);

  v28 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v29 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v28,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"isUrgent",  5LL,  v29,  v59,  0LL,  1.0);

  v31 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v32 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v31,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"requestIdentifier",  3LL,  v32,  v59,  0LL,  1.0);

  v34 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v35 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v34,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"stackDepth",  7LL,  v35,  v59,  0LL,  1.0);

  v37 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v38 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v37,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v38,  v59,  0LL,  1.0);

  v40 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v41 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v42 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v40,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"urgencyPipelineUsed",  5LL,  v41,  v59,  0LL,  1.0);

  v60[0] = v59;
  v60[1] = v58;
  v60[2] = v27;
  v60[3] = v30;
  v60[4] = v56;
  void v60[5] = v33;
  v60[6] = v36;
  v60[7] = v39;
  v60[8] = v42;
  [MEMORY[0x189603F18] arrayWithObjects:v60 count:9];
  id v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)tgiExecuteRequestMetrics
{
  v110[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v96 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"inputTokensCount",  v3,  @"tgiExecuteRequest",  7LL,  v4,  v5,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v97 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"outputTokensCount",  7LL,  v7,  v96,  0LL,  1.0);

  v109 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v94;
  v108[0] = @"No-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v92;
  v108[1] = @"General-Request-Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v90;
  v108[2] = @"Create-Inference-ContextFailure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v88;
  v108[3] = @"General-Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v86;
  v108[4] = @"Unknown-Special-Token";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v83;
  v108[5] = @"Tokenization-Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v107[6] = v81;
  v108[6] = @"Max-Output-Tokens-Value";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v107[7] = v79;
  v108[7] = @"Extend-Inference-Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v107[8] = v77;
  v108[8] = @"Encode-Response-Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v107[9] = v75;
  v108[9] = @"Stream-Cancelled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v107[10] = v73;
  v108[10] = @"Stream-Not-Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  id v71 = (id)objc_claimAutoreleasedReturnValue();
  v107[11] = v71;
  v108[11] = @"Output-Token-Resolution-Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v107[12] = v70;
  v108[12] = @"No-Catalog";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v107[13] = v69;
  v108[13] = @"Unknown-Request-Payload-Case";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v107[14] = v68;
  v108[14] = @"Words-To-String-Conversation-Failure";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v107[15] = v67;
  v108[15] = @"Async-Stream-Failed";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v107[16] = v66;
  v108[16] = @"Prompt-Render-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v107[17] = v65;
  v108[17] = @"Response-Type";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v107[18] = v64;
  v108[18] = @"One-Shot-Server-Response-Missing-Completion";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v107[19] = v63;
  v108[19] = @"Stream-Server-Response-Missing-Completion";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v107[20] = v62;
  v108[20] = @"Visual-Generation-Unknown-Generator";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v107[21] = v61;
  v108[21] = @"Visual-Generation-Unspecified-Goals";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v107[22] = v8;
  v108[22] = @"Visual-Generation-Unexpected-Condition";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v107[23] = v9;
  v108[23] = @"Visual-Generation-Missing-Resource";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v107[24] = v10;
  v108[24] = @"Visual-Generation-Analysis-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v107[25] = v11;
  v108[25] = @"Visual-Generation-Initialization-Error";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v107[26] = v12;
  v108[26] = @"Visual-Generation-Image-Rejected";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v107[27] = v13;
  v108[27] = @"Visual-Generation-Image-Type-Not-Supported";
  [MEMORY[0x189603F68] dictionaryWithObjects:v108 forKeys:v107 count:28];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v110 forKeys:&v109 count:1];
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v93 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"errorType",  7LL,  v16,  v96,  v85,  1.0);

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v95 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"extendTokenInferenceLatency",  7LL,  v18,  v96,  0LL,  1.0);

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v91 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"firstTokenInferenceLatency",  7LL,  v20,  v96,  0LL,  1.0);

  v21 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v22 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v89 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v21,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"requestIdentifier",  3LL,  v22,  v96,  0LL,  1.0);

  v105 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v23;
  v104[0] = @"One-Shot";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v24;
  v104[1] = @"Streaming";
  [MEMORY[0x189603F68] dictionaryWithObjects:v104 forKeys:v103 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v25;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v27 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v87 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v26,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"requestType",  7LL,  v27,  v96,  v84,  1.0);

  v101 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0xFFFFFFFFLL);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v28;
  v100[0] = @"Default";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v29;
  v100[1] = @"User-Interactive";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v30;
  v100[2] = @"User-Initiated";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v31;
  v100[3] = @"Utility";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v32;
  v100[4] = @"Background";
  [MEMORY[0x189603F68] dictionaryWithObjects:v100 forKeys:v99 count:5];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v33;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v35 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v80 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v34,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"qos",  7LL,  v35,  v96,  v82,  1.1);

  v36 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v37 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v38 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v36,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_draftModelInferenceCallCount",  7LL,  v37,  v96,  0LL,  1.0);

  v39 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v40 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v41 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v39,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_targetModelInferenceCallCount",  7LL,  v40,  v96,  0LL,  1.0);

  v42 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  id v43 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v42,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_draftTokenAcceptanceRate",  7LL,  v43,  v96,  0LL,  1.0);

  v44 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v45 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v76 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v44,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_speculationSuccessRate",  7LL,  v45,  v96,  0LL,  1.0);

  v46 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v47 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v48 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v46,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_draftOutputTokensCount",  7LL,  v47,  v96,  0LL,  1.0);

  v49 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v50 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v74 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v49,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_totalOutputTokensCount",  7LL,  v50,  v96,  0LL,  1.0);

  v51 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v52 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v53 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v51,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_draftModelTotalLatency",  7LL,  v52,  v96,  0LL,  1.0);

  v54 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v55 = +[PPSUnit milliseconds](&OBJC_CLASS___PPSUnit, "milliseconds");
  v56 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v54,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"sd_targetModelTotalLatency",  7LL,  v55,  v96,  0LL,  1.0);

  v57 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v58 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v59 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v57,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v58,  v96,  0LL,  1.0);

  v98[0] = v96;
  v98[1] = v97;
  v98[2] = v93;
  v98[3] = v95;
  v98[4] = v91;
  v98[5] = v89;
  v98[6] = v87;
  v98[7] = v80;
  v98[8] = v38;
  v98[9] = v41;
  v98[10] = v78;
  v98[11] = v76;
  v98[12] = v48;
  v98[13] = v74;
  v98[14] = v53;
  v98[15] = v56;
  v98[16] = v59;
  [MEMORY[0x189603F18] arrayWithObjects:v98 count:17];
  id v72 = (id)objc_claimAutoreleasedReturnValue();

  return v72;
}

+ (id)smartReplySessionMetrics
{
  v49[1] = *MEMORY[0x1895F89C0];
  v48 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v2;
  v47[0] = @"Messages";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v3;
  v47[1] = @"Mail";
  [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v49 forKeys:&v48 count:1];
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v6 = +[PPSGenerativeFunctionMetrics subsystem](&OBJC_CLASS___PPSGenerativeFunctionMetrics, "subsystem");
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v8 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v5,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"App",  v6,  @"SmartReplySession",  7LL,  v7,  v8,  1.0,  0x200000005LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v36);

  v44 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v10;
  v43[0] = @"Start";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v11;
  v43[1] = @"Complete";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v12;
  v43[2] = @"Exception";
  [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v14,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"EventType",  7LL,  v15,  v9,  v35,  1.0);

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"InputTokenCount",  7LL,  v18,  v16,  0LL,  1.0);

  v20 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v21 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v20,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"OutputTokenCount",  7LL,  v21,  v16,  0LL,  1.0);

  v40 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v23;
  v39[0] = @"Online";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v24;
  v39[1] = @"Offline";
  [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v25;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v28 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v27,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"QueryType",  7LL,  v28,  v16,  v26,  1.0);

  v30 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v31 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v30,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v31,  v19,  0LL,  1.0);

  v37[0] = v9;
  v37[1] = v16;
  v37[2] = v19;
  v37[3] = v22;
  v37[4] = v29;
  v37[5] = v32;
  [MEMORY[0x189603F18] arrayWithObjects:v37 count:6];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end