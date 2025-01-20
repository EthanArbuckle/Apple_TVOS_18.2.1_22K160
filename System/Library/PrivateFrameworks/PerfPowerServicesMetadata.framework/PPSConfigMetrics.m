@interface PPSConfigMetrics
+ (id)allDeclMetrics;
+ (id)buddyDataMetrics;
+ (id)configMetrics;
+ (id)consoleModeEnabledMetrics;
+ (id)constructDeviceTypeMetric;
+ (id)cpuCoreConfigMetrics;
+ (id)deviceCapabilityMetrics;
+ (id)subsystem;
+ (id)sysdiagnoseEventMetrics;
@end

@implementation PPSConfigMetrics

+ (id)subsystem
{
  return @"ConfigMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() configMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() deviceCapabilityMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  [(id)objc_opt_class() consoleModeEnabledMetrics];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v5];

  [(id)objc_opt_class() sysdiagnoseEventMetrics];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v6];

  [(id)objc_opt_class() cpuCoreConfigMetrics];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v7];

  [(id)objc_opt_class() buddyDataMetrics];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v8];

  return v2;
}

+ (id)configMetrics
{
  v36[7] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v35 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"BootArgs",  v3,  @"DeviceConfig",  3LL,  v4,  v5,  1.02,  0x200000001LL,  0x10000000ELL,  0x100000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v34 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v6,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Build",  v7,  @"DeviceConfig",  3LL,  v8,  v9,  1.02,  0x200000001LL,  0x10000000ELL,  0x300000001LL,  0x100000001LL,  0LL);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v12 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v13 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v33 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v10,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Device",  v11,  @"DeviceConfig",  3LL,  v12,  v13,  1.02,  0x200000001LL,  0x10000000ELL,  0x300000001LL,  0x100000001LL,  0LL);

  [a1 constructDeviceTypeMetric];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v15 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v16 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v17 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v30 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v14,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"DeviceBootTime",  v15,  @"DeviceConfig",  4LL,  v16,  v17,  1.01,  0x200000001LL,  0x10000000ELL,  0x300000001LL,  0x100000001LL,  0LL);

  v18 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v19 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v21 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v22 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v18,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"ShutdownReason",  v19,  @"DeviceConfig",  3LL,  v20,  v21,  1.01,  0x200000001LL,  0x10000000ELL,  0x300000001LL,  0x100000001LL,  0LL);

  v23 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v24 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v25 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v26 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v27 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v23,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"BootReason",  v24,  @"DeviceConfig",  3LL,  v25,  v26,  1.01,  0x200000001LL,  0x10000000ELL,  0x300000001LL,  0x100000001LL,  0LL);

  v36[0] = v35;
  v36[1] = v34;
  v36[2] = v33;
  v36[3] = v32;
  v36[4] = v30;
  v36[5] = v22;
  v36[6] = v27;
  [MEMORY[0x189603F18] arrayWithObjects:v36 count:7];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)constructDeviceTypeMetric
{
  v22[1] = *MEMORY[0x1895F89C0];
  v21 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  v20[0] = @"iPhone";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v2;
  v20[1] = @"iPad";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v20[2] = @"iPod";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v4;
  v20[3] = @"Watch";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v5;
  v20[4] = @"Mac";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v6;
  v20[5] = @"HomePod";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v7;
  v20[6] = @"AppleTV";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 86);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v8;
  v20[7] = @"VisionPro";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v9;
  v20[8] = @"Other";
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v16 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v12,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"DeviceType",  v13,  @"DeviceConfig",  7LL,  v14,  v15,  3.01,  0x200000001LL,  0x10000000ELL,  0x300000001LL,  0x100000001LL,  v11);

  return v16;
}

+ (id)deviceCapabilityMetrics
{
  v2 = (void *)objc_opt_new();
  uint64_t v3 = 0LL;
  do
  {
    v4 = objc_alloc(&OBJC_CLASS___PPSMetric);
    objc_msgSend(NSString, "stringWithFormat:", @"Capability%d", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
    v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
    v8 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
    v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v4,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCa pability:population:obfuscation:privacyClassification:optionalPayload:",  v5,  v6,  @"DeviceCapability",  5LL,  v7,  v8,  2.0,  0x200000001LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

    [v2 addObject:v9];
    uint64_t v3 = (v3 + 1);
  }

  while ((_DWORD)v3 != 22);
  return v2;
}

+ (id)consoleModeEnabledMetrics
{
  return (id)MEMORY[0x189604A58];
}

+ (id)sysdiagnoseEventMetrics
{
  v9[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Start",  v3,  @"SysdiagnoseEvent",  5LL,  v4,  v5,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v9[0] = v6;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)cpuCoreConfigMetrics
{
  v15[3] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"numCoreTypes",  v3,  @"CPUCoreConfig",  7LL,  v4,  v5,  1.0,  0x200000001LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"numEcpuCores",  7LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"numPcpuCores",  7LL,  v11,  v9,  0LL,  1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)buddyDataMetrics
{
  v22[1] = *MEMORY[0x1895F89C0];
  v21 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v20[0] = @"None";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v20[1] = @"Cloud Restore";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v20[2] = @"Migrate";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v20[3] = @"From Android";
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSConfigMetrics subsystem](&OBJC_CLASS___PPSConfigMetrics, "subsystem");
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v11 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v8,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"TransferMethod",  v9,  @"BuddyData",  7LL,  v10,  v11,  1.0,  0x200000001LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v7);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"SetupDate",  8LL,  v14,  v12,  0LL,  1.0);

  v18[0] = v12;
  v18[1] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end