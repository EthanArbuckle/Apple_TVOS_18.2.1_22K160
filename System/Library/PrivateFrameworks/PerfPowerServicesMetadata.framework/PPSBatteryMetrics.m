@interface PPSBatteryMetrics
+ (id)allDeclMetrics;
+ (id)batteryConfigMetrics;
+ (id)batteryLoggingCadence;
+ (id)batteryMetrics;
+ (id)batteryShutdownMetrics;
+ (id)smartChargingMetrics;
+ (id)subsystem;
@end

@implementation PPSBatteryMetrics

+ (id)subsystem
{
  return @"BatteryMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() batteryMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() batteryConfigMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  [(id)objc_opt_class() smartChargingMetrics];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v5];

  [(id)objc_opt_class() batteryShutdownMetrics];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (id)batteryMetrics
{
  v48[12] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSBatteryMetrics batteryLoggingCadence](&OBJC_CLASS___PPSBatteryMetrics, "batteryLoggingCadence");
  v47 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"ExternalConnected",  v3,  @"Battery",  5LL,  v4,  v5,  1.0,  0x200000003LL,  0x100000001LL,  0x300000006LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v46 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"IsCharging",  5LL,  v7,  v47,  0LL,  1.0);

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  v10 = +[PPSUnit milliAmpereHours](&OBJC_CLASS___PPSUnit, "milliAmpereHours");
  v11 = +[PPSBatteryMetrics batteryLoggingCadence](&OBJC_CLASS___PPSBatteryMetrics, "batteryLoggingCadence");
  uint64_t v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v8,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"AbsoluteCapacity",  v9,  @"Battery",  7LL,  v10,  v11,  1.0,  0x200000002LL,  0x100000001LL,  0x300000006LL,  0x100000001LL,  0LL);

  v13 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v14 = +[PPSUnit milliVolts](&OBJC_CLASS___PPSUnit, "milliVolts");
  v15 = (void *)v12;
  v45 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v13,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Voltage",  7LL,  v14,  v12,  0LL,  1.0);

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit milliAmpereHours](&OBJC_CLASS___PPSUnit, "milliAmpereHours");
  v44 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"ChargeAccum",  7LL,  v17,  v12,  0LL,  1.0);

  v18 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v19 = +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v21 = +[PPSBatteryMetrics batteryLoggingCadence](&OBJC_CLASS___PPSBatteryMetrics, "batteryLoggingCadence");
  uint64_t v22 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v18,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"Level",  v19,  @"Battery",  7LL,  v20,  v21,  1.0,  0x200000004LL,  0x100000001LL,  0x300000006LL,  0x100000001LL,  0LL);

  v23 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v24 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v25 = (void *)v22;
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v23,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"AbsoluteLevel",  8LL,  v24,  v22,  0LL,  1.0);

  v27 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v28 = +[PPSUnit milliAmperes](&OBJC_CLASS___PPSUnit, "milliAmperes");
  v43 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v27,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"Amperage",  7LL,  v28,  v15,  0LL,  1.0);

  v29 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v30 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v42 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v29,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"NotChargingReason",  7LL,  v30,  v47,  0LL,  1.0);

  v31 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v32 = +[PPSUnit milliAmpereHours](&OBJC_CLASS___PPSUnit, "milliAmpereHours");
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v31,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"PassedCharge",  7LL,  v32,  v42,  0LL,  1.0);

  v34 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v35 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v34,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DOD0",  7LL,  v35,  v33,  0LL,  1.0);

  v37 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v38 = +[PPSUnit milliAmpereHours](&OBJC_CLASS___PPSUnit, "milliAmpereHours");
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v37,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"AppleRawMaxCapacity",  7LL,  v38,  v36,  0LL,  1.0);

  v48[0] = v47;
  v48[1] = v46;
  v48[2] = v15;
  v48[3] = v45;
  v48[4] = v44;
  v48[5] = v25;
  v48[6] = v26;
  v48[7] = v43;
  v48[8] = v42;
  v48[9] = v33;
  v48[10] = v36;
  v48[11] = v39;
  [MEMORY[0x189603F18] arrayWithObjects:v48 count:12];
  id v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)batteryConfigMetrics
{
  v14[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"DOFU",  v3,  @"BatteryConfig",  7LL,  v4,  v5,  2.0,  0x100000001LL,  0x100000001LL,  0x300000006LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  v9 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v10 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v7,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"GasGaugeFirmwareVersion",  v8,  @"BatteryConfig",  7LL,  v9,  v10,  1.0,  0x200000001LL,  0x100000001LL,  0x300000006LL,  0x100000001LL,  0LL);

  v14[0] = v6;
  v14[1] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v14 count:2];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)smartChargingMetrics
{
  v53[1] = *MEMORY[0x1895F89C0];
  v52 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v38;
  v51[0] = @"None";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v37;
  v51[1] = @"Detected";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v2;
  v51[2] = @"IdlePeriodStart";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v3;
  v51[3] = @"IdlePeriodSocFloor";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v4;
  v51[4] = @"IdlePeriodSocCeiling";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v5;
  v51[5] = @"TopOff";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v6;
  v51[6] = @"TopOffWithoutIdle";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v7;
  v51[7] = @"FullyCharged";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v8;
  v51[8] = @"Interrupted";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v9;
  v51[9] = @"UserOverride";
  [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:10];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:&v52 count:1];
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(&OBJC_CLASS___PPSMetric);
  +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v14 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 1LL);
  v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v11,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"checkpoint",  v12,  @"SmartCharging",  7LL,  v13,  v14,  1.0,  0x300000003LL,  0x100000007LL,  0x300000006LL,  0x100000001LL,  v40);

  v16 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v17 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v16,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"isEngaged",  5LL,  v17,  v15,  0LL,  1.0);

  v48 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v18;
  v47[0] = @"Disabled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v19;
  v47[1] = @"Enabled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v20;
  v47[2] = @"Override";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v21;
  v47[3] = @"TemporarilyDisabled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:v46 count:4];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v22;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v25 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v24,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"state",  7LL,  v25,  v15,  v23,  1.0);

  v44 = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v27;
  v43[0] = @"Enabled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v28;
  v43[1] = @"Disabled";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v29;
  v43[2] = @"TemporarilyDisabled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:3];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v33 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v32,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"status",  7LL,  v33,  v15,  v31,  1.0);

  v41[0] = v15;
  v41[1] = v39;
  v41[2] = v26;
  v41[3] = v34;
  [MEMORY[0x189603F18] arrayWithObjects:v41 count:4];
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)batteryShutdownMetrics
{
  v9[1] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSBatteryMetrics subsystem](&OBJC_CLASS___PPSBatteryMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceInit](&OBJC_CLASS___PPSCadence, "cadenceInit");
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"BatteryShutdownTimestamp",  v3,  @"BatteryShutdown",  4LL,  v4,  v5,  1.0,  0x200000002LL,  0x10000000ELL,  0x300000006LL,  0x100000001LL,  0LL);

  v9[0] = v6;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)batteryLoggingCadence
{
  v10[2] = *MEMORY[0x1895F89C0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  2LL,  20LL);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  8LL);
  v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v8 = 0LL;
  }

  else
  {
    v6 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v10[0] = v2;
    v10[1] = v4;
    [MEMORY[0x189603F18] arrayWithObjects:v10 count:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSCadence initWithCadenceTuples:](v6, "initWithCadenceTuples:", v7);
  }

  return v8;
}

@end