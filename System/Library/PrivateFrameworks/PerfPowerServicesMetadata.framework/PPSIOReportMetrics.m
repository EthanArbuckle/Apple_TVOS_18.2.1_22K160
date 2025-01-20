@interface PPSIOReportMetrics
+ (id)allDeclMetrics;
+ (id)amcStatsPerfCountersMetrics;
+ (id)aop2PowerMetrics;
+ (id)pmpDcsFloorMetrics;
+ (id)pmpPmcAveFloorMetrics;
+ (id)pmpPmcDispFloorMetrics;
+ (id)pmpSocFloorMetrics;
+ (id)socStatsDeviceStatesMetrics;
+ (id)socStatsEventsMetrics;
+ (id)socStatsIdsFuseMetrics;
+ (id)socStatsOprtpMetrics;
+ (id)socStatsPmgrCountersMetrics;
+ (id)subsystem;
@end

@implementation PPSIOReportMetrics

+ (id)subsystem
{
  return @"IOReportMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() amcStatsPerfCountersMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() socStatsEventsMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  [(id)objc_opt_class() socStatsPmgrCountersMetrics];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v5];

  [(id)objc_opt_class() socStatsOprtpMetrics];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v6];

  [(id)objc_opt_class() socStatsIdsFuseMetrics];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v7];

  [(id)objc_opt_class() socStatsDeviceStatesMetrics];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v8];

  [(id)objc_opt_class() pmpDcsFloorMetrics];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v9];

  [(id)objc_opt_class() pmpSocFloorMetrics];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v10];

  [(id)objc_opt_class() pmpPmcAveFloorMetrics];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v11];

  [(id)objc_opt_class() pmpPmcDispFloorMetrics];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v12];

  [(id)objc_opt_class() aop2PowerMetrics];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v13];

  return v2;
}

+ (id)amcStatsPerfCountersMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"AMCStatsPerfCounters",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29AD08,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit bytes](&OBJC_CLASS___PPSUnit, "bytes");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  7LL,  v14,  v12,  &unk_18A29AD08,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)socStatsEventsMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"SoCStatsEvents",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29AD30,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DutyCycle",  8LL,  v14,  v12,  &unk_18A29AD30,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)socStatsPmgrCountersMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"SoCStatsPMGRCounters",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29AD58,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  7LL,  v14,  v12,  &unk_18A29AD58,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)socStatsOprtpMetrics
{
  v12[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Channel",  v3,  @"SoCStatsoprtp",  7LL,  v4,  v5,  1.0,  0x200000001LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  &unk_18A29AD80);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit milliVolts](&OBJC_CLASS___PPSUnit, "milliVolts");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  7LL,  v8,  v6,  &unk_18A29AD80,  1.0);

  v12[0] = v6;
  v12[1] = v9;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)socStatsIdsFuseMetrics
{
  v12[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Channel",  v3,  @"SoCStatsAONFuse",  3LL,  v4,  v5,  1.0,  0x200000001LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  &unk_18A29ADA8);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit milliAmperes](&OBJC_CLASS___PPSUnit, "milliAmperes");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Value",  7LL,  v8,  v6,  &unk_18A29ADA8,  1.0);

  v12[0] = v6;
  v12[1] = v9;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)socStatsDeviceStatesMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"SoCStatsDeviceStates",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29ADD0,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DutyCycle",  8LL,  v14,  v12,  &unk_18A29ADD0,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpDcsFloorMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"PMPDCSFloor",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29ADF8,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DutyCycle",  8LL,  v14,  v12,  &unk_18A29ADF8,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpSocFloorMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"PMPSOCFloor",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29AE20,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DutyCycle",  8LL,  v14,  v12,  &unk_18A29AE20,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpPmcAveFloorMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"PMPPMCAVEFloor",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29AE48,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DutyCycle",  8LL,  v14,  v12,  &unk_18A29AE48,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpPmcDispFloorMetrics
{
  v18[4] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"timestampEnd",  v3,  @"PMPPMCDISPFloor",  4LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Channel",  3LL,  v11,  v9,  &unk_18A29AE70,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DutyCycle",  8LL,  v14,  v12,  &unk_18A29AE70,  1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:4];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)aop2PowerMetrics
{
  v36[10] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSIOReportMetrics subsystem](&OBJC_CLASS___PPSIOReportMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange]( &OBJC_CLASS___PPSCadence,  "cadenceEventSBC_EventScreenStateChange");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"Duty cycle",  v3,  @"AOP2Power",  7LL,  v4,  v5,  1.0,  0x200000005LL,  0x700000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Sleep count",  7LL,  v8,  v6,  0LL,  1.0);

  v9 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v10 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v9,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Wake count",  7LL,  v10,  v6,  0LL,  1.0);

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v12 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v11,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Power state_ON",  8LL,  v12,  v6,  0LL,  1.0);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit bytes](&OBJC_CLASS___PPSUnit, "bytes");
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Free heap",  7LL,  v14,  v6,  0LL,  1.0);

  v15 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v16 = +[PPSUnit bytes](&OBJC_CLASS___PPSUnit, "bytes");
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v15,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Total heap",  7LL,  v16,  v6,  0LL,  1.0);

  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit bytes](&OBJC_CLASS___PPSUnit, "bytes");
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Peak heap alloc",  7LL,  v18,  v6,  0LL,  1.0);

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"CPU count",  7LL,  v20,  v6,  0LL,  1.0);

  v21 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v22 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v23 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v21,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"timestampEnd",  4LL,  v22,  v6,  0LL,  1.0);

  v24 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v25 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v24,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"APWakeTime",  8LL,  v25,  v6,  0LL,  1.0);

  v36[0] = v6;
  v36[1] = v35;
  v36[2] = v34;
  v36[3] = v33;
  v36[4] = v32;
  v36[5] = v31;
  v36[6] = v30;
  v36[7] = v29;
  v36[8] = v23;
  v36[9] = v26;
  [MEMORY[0x189603F18] arrayWithObjects:v36 count:10];
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end