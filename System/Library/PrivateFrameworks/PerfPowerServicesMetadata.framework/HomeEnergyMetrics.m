@interface HomeEnergyMetrics
+ (id)allDeclMetrics;
+ (id)cleanEnergyForecastMetrics;
+ (id)homeAppUIInteractionsMetrics;
+ (id)subsystem;
@end

@implementation HomeEnergyMetrics

+ (id)subsystem
{
  return @"HomeEnergy";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() homeAppUIInteractionsMetrics];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  [(id)objc_opt_class() cleanEnergyForecastMetrics];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)homeAppUIInteractionsMetrics
{
  v44[2] = *MEMORY[0x1895F89C0];
  v43[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v35;
  v42[0] = @"Unknown";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  v42[1] = @"EnergyDashboardVisit";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v33;
  v42[2] = @"GridForecastOnboardingVisit";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v32;
  v42[3] = @"EnergyCategoryStatusItemTapped";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v31;
  v42[4] = @"EnergyCategoryViewDuration";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v30;
  v42[5] = @"EnergyEducationTipVisit";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v29;
  v42[6] = @"EnergyModelInformationSheetVisit";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v28;
  v42[7] = @"EnergyModelInformationSheetViewDuration";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v27;
  v42[8] = @"EnergyIndicatorAccessoryViewVisit";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41[9] = v2;
  v42[9] = @"DashboardSinglePaneView";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41[10] = v3;
  v42[10] = @"DashboardDualPaneView";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[11] = v4;
  v42[11] = @"EnergyWidgetAndComplicationSettings";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[12] = v5;
  v42[12] = @"EnergyCategoryStatusItemVisit";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[13] = v6;
  v42[13] = @"EnergyCategoryViewAccessedFromURL";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[14] = v7;
  v42[14] = @"EnergyIndicatorAccessoryViewTapped";
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:15];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = @"MetricType";
  v44[0] = v8;
  v9 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v44[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v12 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 3LL);
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v10,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"eventType",  @"HomeEnergy",  @"HomeAppUIInteractions",  7LL,  v11,  v12,  4.0,  0x300000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v26);

  v39[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v14;
  v38[0] = @"Unknown";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  v38[1] = @"Appear";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v16;
  v38[2] = @"Disappear";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v17;
  v38[3] = @"ViewAccessedFromURL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:4];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = @"MetricType";
  v40[0] = v18;
  v19 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v40[1] = v19;
  [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v22 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v23 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v21,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"state",  7LL,  v22,  v13,  v20,  4.0);

  v36[0] = v13;
  v36[1] = v23;
  [MEMORY[0x189603F18] arrayWithObjects:v36 count:2];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)cleanEnergyForecastMetrics
{
  v41[3] = *MEMORY[0x1895F89C0];
  v40[0] = @"EnumMapping";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v34;
  v39[0] = @"Idle";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v33;
  v39[1] = @"GettingLocation";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v32;
  void v39[2] = @"GettingGridID";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v31;
  v39[3] = @"GettingEnergyWindows";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  void v38[4] = v30;
  v39[4] = @"NoLocation";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v2;
  v39[5] = @"NoGridID";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v3;
  v39[6] = @"FailedGridID";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v4;
  v39[7] = @"NoEnergyWindows";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v5;
  v39[8] = @"FailedEnergyWindows";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v6;
  v39[9] = @"HomeNotFound";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v7;
  v39[10] = @"NoHomePermission";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v8;
  v39[11] = @"OtherError";
  [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:v38 count:12];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v9;
  v41[1] = &unk_18A29AC60;
  v40[1] = @"GroupingDimensions";
  void v40[2] = @"MetricType";
  v10 = +[PPSMetricType stateDimension](&OBJC_CLASS___PPSMetricType, "stateDimension");
  v41[2] = v10;
  uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v41 forKeys:v40 count:3];

  v12 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v13 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v14 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v15 = (void *)v11;
  v16 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v12,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  @"state",  @"HomeEnergy",  @"CleanEnergyForecast",  7LL,  v13,  v14,  1.0,  0x300000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  v11);

  v36 = @"MetricType";
  v17 = +[PPSMetricType genericDimension](&OBJC_CLASS___PPSMetricType, "genericDimension");
  v37 = v17;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v20 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v19,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"gridID",  3LL,  v20,  v16,  v18,  1.0);

  v22 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v23 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v22,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"windowStart",  7LL,  v23,  v16,  0LL,  1.0);

  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v26 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v25,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"windowEnd",  7LL,  v26,  v16,  0LL,  1.0);

  v35[0] = v16;
  v35[1] = v21;
  v35[2] = v24;
  v35[3] = v27;
  [MEMORY[0x189603F18] arrayWithObjects:v35 count:4];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end