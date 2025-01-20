@interface PPSRenderMetrics
+ (id)albumAnimationMetrics;
+ (id)albumMotionMetrics;
+ (id)allDeclMetrics;
+ (id)layerCountMetrics;
+ (id)offscreenReasonMetrics;
+ (id)renderPassCountMetrics;
+ (id)subsystem;
@end

@implementation PPSRenderMetrics

+ (id)subsystem
{
  return @"RenderData";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

+ (id)albumAnimationMetrics
{
  v12[1] = *MEMORY[0x1895F89C0];
  v11 = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v12[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"AlbumAnimationDuration",  @"RenderData",  @"AlbumAnimationDuration",  7LL,  v5,  v6,  1.0,  0x200000004LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v10 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v10 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)albumMotionMetrics
{
  v12[1] = *MEMORY[0x1895F89C0];
  v11 = @"MetricType";
  v2 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v12[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v5 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"AlbumMotionDownload",  @"RenderData",  @"AlbumMotionDownload",  8LL,  v5,  v6,  1.0,  0x200000004LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v3);

  v10 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v10 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)renderPassCountMetrics
{
  v2 = (void *)objc_opt_new();
  v3 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v3,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"bucket_count",  @"RenderData",  @"RenderPassCount",  7LL,  v4,  v5,  2.0,  0x200000004LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  [v2 addObject:v6];
  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"bucket_size",  7LL,  v8,  v6,  0LL,  2.0);

  [v2 addObject:v9];
  uint64_t v10 = 0LL;
  do
  {
    v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
    objc_msgSend(NSString, "stringWithFormat:", @"bucket%d", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
    v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v11,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  v12,  7LL,  v13,  v6,  0LL,  2.0);

    [v2 addObject:v14];
    uint64_t v10 = (v10 + 1);
  }

  while ((_DWORD)v10 != 10);

  return v2;
}

+ (id)layerCountMetrics
{
  v2 = (void *)objc_opt_new();
  v3 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v3,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"bucket_count",  @"RenderData",  @"LayerCount",  7LL,  v4,  v5,  2.0,  0x200000004LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  [v2 addObject:v6];
  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"bucket_size",  7LL,  v8,  v6,  0LL,  2.0);

  [v2 addObject:v9];
  uint64_t v10 = 0LL;
  do
  {
    v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
    objc_msgSend(NSString, "stringWithFormat:", @"bucket%d", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
    v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v11,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  v12,  7LL,  v13,  v6,  0LL,  2.0);

    [v2 addObject:v14];
    uint64_t v10 = (v10 + 1);
  }

  while ((_DWORD)v10 != 10);

  return v2;
}

+ (id)offscreenReasonMetrics
{
  v35[10] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Shadow",  @"RenderData",  @"OffscreenReasons",  7LL,  v3,  v4,  3.0,  0x200000004LL,  0x100000001LL,  0x100000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Patten_and_TiledImage",  7LL,  v7,  v5,  0LL,  2.0);

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"BackdropCopy",  7LL,  v9,  v5,  0LL,  2.0);

  uint64_t v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Blending_and_Transition",  7LL,  v11,  v5,  0LL,  2.0);

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v12,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Filter",  7LL,  v13,  v5,  0LL,  2.0);

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Transform_and_Scaling",  7LL,  v16,  v5,  0LL,  2.0);

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Mask",  7LL,  v18,  v5,  0LL,  2.0);

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Group",  7LL,  v20,  v5,  0LL,  2.0);

  v21 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v22 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v23 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v21,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Plugin_and_Cache",  7LL,  v22,  v5,  0LL,  2.0);

  v24 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v25 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v24,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DestinationCopy",  7LL,  v25,  v5,  0LL,  2.0);

  v35[0] = v5;
  v35[1] = v34;
  v35[2] = v33;
  v35[3] = v14;
  v35[4] = v32;
  v35[5] = v31;
  v35[6] = v30;
  v35[7] = v29;
  v35[8] = v23;
  v35[9] = v26;
  [MEMORY[0x189603F18] arrayWithObjects:v35 count:10];
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end