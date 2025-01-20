@interface PPSDisplayMetrics
+ (id)allDeclMetrics;
+ (id)displayLoggingCadence;
+ (id)displayMetricsWithStorage:(int)a3 timeToLive:(unsigned int)a4 category:(id)a5;
+ (id)subsystem;
@end

@implementation PPSDisplayMetrics

+ (id)subsystem
{
  return @"DisplayMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() displayMetricsWithStorage:2 timeToLive:1 category:@"DisplayState"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
  [(id)objc_opt_class() displayMetricsWithStorage:3 timeToLive:7 category:@"DisplayStateExtended"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)displayMetricsWithStorage:(int)a3 timeToLive:(unsigned int)a4 category:(id)a5
{
  v39[1] = *MEMORY[0x1895F89C0];
  v38 = @"MetricType";
  id v7 = a5;
  v8 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v39[0] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v10 = +[PPSDisplayMetrics subsystem](&OBJC_CLASS___PPSDisplayMetrics, "subsystem");
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = +[PPSDisplayMetrics displayLoggingCadence](&OBJC_CLASS___PPSDisplayMetrics, "displayLoggingCadence");
  *(_DWORD *)&v29[20] = 1;
  *(void *)&v29[12] = 0x100000003LL;
  *(void *)&v29[4] = 0x800000001LL;
  HIDWORD(v27) = a3;
  *(_DWORD *)v29 = a4;
  LODWORD(v27) = 3;
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v9,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Block",  v10,  v7,  3LL,  v11,  v12,  2.0,  v27,  *(void *)v29,  *(void *)&v29[8],  *(void *)&v29[16],  v32);

  v36[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  v35[0] = @"Inactive";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v15;
  v35[1] = @"Active";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v16;
  v35[2] = @"AOD";
  [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:3];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  v37[1] = &unk_18A29ACD8;
  v36[1] = @"GroupingDimensions";
  v36[2] = @"MetricType";
  v18 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v37[2] = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:v36 count:3];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v21 = +[PPSDisplayMetrics subsystem](&OBJC_CLASS___PPSDisplayMetrics, "subsystem");
  v22 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v23 = +[PPSDisplayMetrics displayLoggingCadence](&OBJC_CLASS___PPSDisplayMetrics, "displayLoggingCadence");
  *(_DWORD *)&v30[20] = 1;
  *(void *)&v30[12] = 0x100000003LL;
  *(void *)&v30[4] = 0x800000001LL;
  HIDWORD(v28) = a3;
  *(_DWORD *)v30 = a4;
  LODWORD(v28) = 3;
  v24 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v20,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Active",  v21,  v7,  7LL,  v22,  v23,  3.0,  v28,  *(void *)v30,  *(void *)&v30[8],  *(void *)&v30[16],  v19);

  v33[0] = v13;
  v33[1] = v24;
  [MEMORY[0x189603F18] arrayWithObjects:v33 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)displayLoggingCadence
{
  v10[2] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  1LL);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  4LL,  0LL);
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
    id v7 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v10[0] = v2;
    v10[1] = v4;
    [MEMORY[0x189603F18] arrayWithObjects:v10 count:2];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v7, "initWithCadenceTuples:", v8);
  }

  return v5;
}

@end