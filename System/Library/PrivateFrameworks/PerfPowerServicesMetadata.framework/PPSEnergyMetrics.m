@interface PPSEnergyMetrics
+ (id)allDeclMetrics;
+ (id)cleanEnergyChargingMetrics;
+ (id)energyAccountingMetrics;
+ (id)subsystem;
@end

@implementation PPSEnergyMetrics

+ (id)subsystem
{
  return @"EnergyMetrics";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() energyAccountingMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() cleanEnergyChargingMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)energyAccountingMetrics
{
  v27[8] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 3LL);
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"slot_id",  @"EnergyMetrics",  @"EnergyAccounting",  7LL,  v3,  v4,  2.0,  0x300000004LL,  0x100000007LL,  0x300000001LL,  0x100000001LL,  0LL);

  v6 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v7 = +[PPSUnit microWattHours](&OBJC_CLASS___PPSUnit, "microWattHours");
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v6,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"wall_energy_consumed",  8LL,  v7,  v5,  0LL,  2.0);

  v8 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v9 = +[PPSUnit microWattHours](&OBJC_CLASS___PPSUnit, "microWattHours");
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v8,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"system_energy_consumed",  8LL,  v9,  v5,  0LL,  2.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"adapter_family",  7LL,  v11,  v5,  0LL,  2.0);

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v12,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"balancing_authority_id",  3LL,  v13,  v5,  0LL,  2.0);

  v23 = (void *)[objc_alloc(MEMORY[0x189607AD0]) initWithSymbol:@"g/kWh"];
  v14 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v23);
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( objc_alloc(&OBJC_CLASS___PPSMetric),  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"avg_intensity",  8LL,  v14,  v5,  0LL,  2.0);
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( objc_alloc(&OBJC_CLASS___PPSMetric),  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"marginal_intensity",  8LL,  v14,  v5,  0LL,  2.0);
  v17 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v18 = +[PPSUnit grams](&OBJC_CLASS___PPSUnit, "grams");
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v17,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"carbon_footprint",  8LL,  v18,  v5,  0LL,  2.0);

  v27[0] = v5;
  v27[1] = v26;
  v27[2] = v25;
  v27[3] = v24;
  v27[4] = v22;
  v27[5] = v15;
  v27[6] = v16;
  v27[7] = v19;
  [MEMORY[0x189603F18] arrayWithObjects:v27 count:8];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)cleanEnergyChargingMetrics
{
  return (id)MEMORY[0x189604A58];
}

@end