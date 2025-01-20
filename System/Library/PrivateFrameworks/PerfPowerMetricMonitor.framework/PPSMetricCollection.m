@interface PPSMetricCollection
+ (BOOL)supportsSecureCoding;
+ (id)_metricSamplePropertyKeys;
+ (id)allPropertyKeys;
- (BOOL)isSystemPowerAvailableWhileCharging;
- (NSMutableDictionary)processMetrics;
- (NSNumber)sampleTime;
- (PPSMetricCollection)init;
- (PPSMetricCollection)initWithCoder:(id)a3;
- (PPSMetricSample)aneDCSBytes;
- (PPSMetricSample)aneEnergy;
- (PPSMetricSample)aneFabricBytes;
- (PPSMetricSample)anePower;
- (PPSMetricSample)batteryPower;
- (PPSMetricSample)batteryTemperature;
- (PPSMetricSample)cellularPower;
- (PPSMetricSample)chargingRate;
- (PPSMetricSample)cpuEnergy;
- (PPSMetricSample)cpuPower;
- (PPSMetricSample)dcInputPower;
- (PPSMetricSample)dcsEnergy;
- (PPSMetricSample)displayAPL;
- (PPSMetricSample)displayCost;
- (PPSMetricSample)displayFPS;
- (PPSMetricSample)displayPower;
- (PPSMetricSample)dramBytes;
- (PPSMetricSample)dramEnergy;
- (PPSMetricSample)dramPower;
- (PPSMetricSample)gpuEnergy;
- (PPSMetricSample)gpuPower;
- (PPSMetricSample)gpuSRAMEnergy;
- (PPSMetricSample)otherSocPower;
- (PPSMetricSample)pcieEnergy;
- (PPSMetricSample)skinTemperature;
- (PPSMetricSample)systemLoadPower;
- (PPSMetricSample)wifiAWDLRange;
- (PPSMetricSample)wifiAWDLStatus;
- (PPSMetricSample)wifiPower;
- (id)_stringFromInducedThermalPressure:(int64_t)a3;
- (id)_stringFromThermalPressure:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inducedThermalPressure;
- (int64_t)thermalPressure;
- (void)combineWithMetricCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAneDCSBytes:(id)a3;
- (void)setAneEnergy:(id)a3;
- (void)setAneFabricBytes:(id)a3;
- (void)setAnePower:(id)a3;
- (void)setBatteryPower:(id)a3;
- (void)setBatteryTemperature:(id)a3;
- (void)setCellularPower:(id)a3;
- (void)setChargingRate:(id)a3;
- (void)setCpuEnergy:(id)a3;
- (void)setCpuPower:(id)a3;
- (void)setDcInputPower:(id)a3;
- (void)setDcsEnergy:(id)a3;
- (void)setDisplayAPL:(id)a3;
- (void)setDisplayCost:(id)a3;
- (void)setDisplayFPS:(id)a3;
- (void)setDisplayPower:(id)a3;
- (void)setDramBytes:(id)a3;
- (void)setDramEnergy:(id)a3;
- (void)setDramPower:(id)a3;
- (void)setGpuEnergy:(id)a3;
- (void)setGpuPower:(id)a3;
- (void)setGpuSRAMEnergy:(id)a3;
- (void)setInducedThermalPressure:(int64_t)a3;
- (void)setIsSystemPowerAvailableWhileCharging:(BOOL)a3;
- (void)setOtherSocPower:(id)a3;
- (void)setPcieEnergy:(id)a3;
- (void)setProcessMetrics:(id)a3;
- (void)setSampleTime:(id)a3;
- (void)setSkinTemperature:(id)a3;
- (void)setSystemLoadPower:(id)a3;
- (void)setThermalPressure:(int64_t)a3;
- (void)setWifiAWDLRange:(id)a3;
- (void)setWifiAWDLStatus:(id)a3;
- (void)setWifiPower:(id)a3;
- (void)updateMetrics:(id)a3 forPid:(id)a4;
@end

@implementation PPSMetricCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken != -1) {
    dispatch_once(&allPropertyKeys_onceToken, &__block_literal_global_2);
  }
  return (id)allPropertyKeys_keys;
}

void __38__PPSMetricCollection_allPropertyKeys__block_invoke()
{
  v6[4] = *MEMORY[0x1895F89C0];
  v0 = +[PPSMetricCollection _metricSamplePropertyKeys](&OBJC_CLASS___PPSMetricCollection, "_metricSamplePropertyKeys");
  v1 = (void *)MEMORY[0x189604010];
  v6[0] = @"isSystemPowerAvailableWhileCharging";
  v6[1] = @"thermalPressure";
  v6[2] = @"inducedThermalPressure";
  v6[3] = @"sampleTime";
  [MEMORY[0x189603F18] arrayWithObjects:v6 count:4];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 setWithArray:v2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v0 setByAddingObjectsFromSet:v3];
  v5 = (void *)allPropertyKeys_keys;
  allPropertyKeys_keys = v4;
}

+ (id)_metricSamplePropertyKeys
{
  if (_metricSamplePropertyKeys_onceToken != -1) {
    dispatch_once(&_metricSamplePropertyKeys_onceToken, &__block_literal_global_12);
  }
  return (id)_metricSamplePropertyKeys_keys;
}

void __48__PPSMetricCollection__metricSamplePropertyKeys__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithArray:&unk_18A3A78D0];
  v1 = (void *)_metricSamplePropertyKeys_keys;
  _metricSamplePropertyKeys_keys = v0;
}

- (PPSMetricCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PPSMetricCollection;
  v2 = -[PPSMetricCollection init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FC8] dictionary];
    processMetrics = v2->_processMetrics;
    v2->_processMetrics = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (PPSMetricCollection)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PPSMetricCollection;
  v5 = -[PPSMetricCollection init](&v28, sel_init);
  if (v5)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    +[PPSMetricCollection _metricSamplePropertyKeys]( &OBJC_CLASS___PPSMetricCollection,  "_metricSamplePropertyKeys",  0LL);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
          [v4 decodeObjectOfClass:objc_opt_class() forKey:v11];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSMetricCollection setValue:forKey:](v5, "setValue:forKey:", v12, v11);

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v8);
    }

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isSystemPowerAvailableWhileCharging"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSystemPowerAvailableWhileCharging = [v13 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thermalPressure"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_thermalPressure = (int)[v14 intValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inducedThermalPressure"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inducedThermalPressure = (int)[v15 intValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sampleTime"];
    sampleTime = v5->_sampleTime;
    v5->_sampleTime = (NSNumber *)v16;

    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeDictionaryWithKeysOfClasses:v18 objectsOfClasses:v19 forKey:@"processMetrics"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 mutableCopy];
    processMetrics = v5->_processMetrics;
    v5->_processMetrics = (NSMutableDictionary *)v21;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = +[PPSMetricCollection _metricSamplePropertyKeys](&OBJC_CLASS___PPSMetricCollection, "_metricSamplePropertyKeys", 0LL);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        -[PPSMetricCollection valueForKey:](self, "valueForKey:", v10);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 encodeObject:v11 forKey:v10];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PPSMetricCollection isSystemPowerAvailableWhileCharging](self, "isSystemPowerAvailableWhileCharging"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"isSystemPowerAvailableWhileCharging"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[PPSMetricCollection thermalPressure](self, "thermalPressure"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"thermalPressure"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[PPSMetricCollection inducedThermalPressure](self, "inducedThermalPressure"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"inducedThermalPressure"];
  v15 = -[PPSMetricCollection sampleTime](self, "sampleTime");
  [v4 encodeObject:v15 forKey:@"sampleTime"];

  -[PPSMetricCollection processMetrics](self, "processMetrics");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v16 forKey:@"processMetrics"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v5 = -[PPSMetricCollection init]( +[PPSMetricCollection allocWithZone:](&OBJC_CLASS___PPSMetricCollection, "allocWithZone:"),  "init");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  +[PPSMetricCollection _metricSamplePropertyKeys](&OBJC_CLASS___PPSMetricCollection, "_metricSamplePropertyKeys", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = -[PPSMetricCollection valueForKey:](self, "valueForKey:", v11);
        v13 = (void *)[v12 copyWithZone:a3];
        -[PPSMetricCollection setValue:forKey:](v5, "setValue:forKey:", v13, v11);
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  v5->_isSystemPowerAvailableWhileCharging = self->_isSystemPowerAvailableWhileCharging;
  v5->_thermalPressure = self->_thermalPressure;
  v5->_inducedThermalPressure = self->_inducedThermalPressure;
  objc_storeStrong((id *)&v5->_sampleTime, self->_sampleTime);
  uint64_t v14 = -[NSMutableDictionary copyWithZone:](self->_processMetrics, "copyWithZone:", a3);
  processMetrics = v5->_processMetrics;
  v5->_processMetrics = (NSMutableDictionary *)v14;

  return v5;
}

- (id)description
{
  uint64_t v128 = 0LL;
  v129 = &v128;
  uint64_t v130 = 0x3032000000LL;
  v131 = __Block_byref_object_copy__0;
  v132 = __Block_byref_object_dispose__0;
  id v133 = 0LL;
  v55 = (void *)NSString;
  v126 = -[PPSMetricCollection systemLoadPower](self, "systemLoadPower");
  [v126 value];
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  [v125 doubleValue];
  uint64_t v54 = v3;
  v124 = -[PPSMetricCollection systemLoadPower](self, "systemLoadPower");
  [v124 timestamp];
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v123);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = -[PPSMetricCollection batteryPower](self, "batteryPower");
  [v122 value];
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  [v121 doubleValue];
  uint64_t v53 = v4;
  v120 = -[PPSMetricCollection batteryPower](self, "batteryPower");
  [v120 timestamp];
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v119);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = -[PPSMetricCollection dcInputPower](self, "dcInputPower");
  [v118 value];
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  [v117 doubleValue];
  uint64_t v52 = v5;
  v116 = -[PPSMetricCollection dcInputPower](self, "dcInputPower");
  [v116 timestamp];
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v115);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = -[PPSMetricCollection cpuPower](self, "cpuPower");
  [v114 value];
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  [v113 doubleValue];
  uint64_t v51 = v6;
  v112 = -[PPSMetricCollection cpuPower](self, "cpuPower");
  [v112 timestamp];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v111);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = -[PPSMetricCollection gpuPower](self, "gpuPower");
  [v110 value];
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  [v109 doubleValue];
  uint64_t v50 = v7;
  v108 = -[PPSMetricCollection gpuPower](self, "gpuPower");
  [v108 timestamp];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v107);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = -[PPSMetricCollection dramPower](self, "dramPower");
  [v106 value];
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  [v105 doubleValue];
  uint64_t v49 = v8;
  v104 = -[PPSMetricCollection dramPower](self, "dramPower");
  [v104 timestamp];
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v103);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = -[PPSMetricCollection otherSocPower](self, "otherSocPower");
  [v102 value];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  [v101 doubleValue];
  uint64_t v48 = v9;
  v100 = -[PPSMetricCollection otherSocPower](self, "otherSocPower");
  [v100 timestamp];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v99);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[PPSMetricCollection wifiPower](self, "wifiPower");
  [v98 value];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  [v97 doubleValue];
  uint64_t v11 = v10;
  v96 = -[PPSMetricCollection wifiPower](self, "wifiPower");
  [v96 timestamp];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v95);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[PPSMetricCollection cellularPower](self, "cellularPower");
  [v94 value];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  [v92 doubleValue];
  uint64_t v13 = v12;
  v88 = -[PPSMetricCollection cellularPower](self, "cellularPower");
  [v88 timestamp];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v87);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[PPSMetricCollection displayPower](self, "displayPower");
  [v86 value];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  [v85 doubleValue];
  uint64_t v15 = v14;
  v84 = -[PPSMetricCollection displayPower](self, "displayPower");
  [v84 timestamp];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v83);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[PPSMetricCollection chargingRate](self, "chargingRate");
  [v82 value];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [v81 intValue];
  v78 = -[PPSMetricCollection chargingRate](self, "chargingRate");
  [v78 timestamp];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v75);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = -[PPSMetricCollection isSystemPowerAvailableWhileCharging](self, "isSystemPowerAvailableWhileCharging");
  __int128 v17 = "NO";
  if (v16) {
    __int128 v17 = "YES";
  }
  v46 = v17;
  v74 = -[PPSMetricCollection batteryTemperature](self, "batteryTemperature");
  [v74 value];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v73 doubleValue];
  uint64_t v19 = v18;
  v72 = -[PPSMetricCollection batteryTemperature](self, "batteryTemperature");
  [v72 timestamp];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v71);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[PPSMetricCollection skinTemperature](self, "skinTemperature");
  [v70 value];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 doubleValue];
  uint64_t v21 = v20;
  v66 = -[PPSMetricCollection skinTemperature](self, "skinTemperature");
  [v66 timestamp];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v63);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  id v43 = -[PPSMetricCollection _stringFromThermalPressure:]( self,  "_stringFromThermalPressure:",  -[PPSMetricCollection thermalPressure](self, "thermalPressure"));
  uint64_t v45 = [v43 UTF8String];
  id v42 = -[PPSMetricCollection _stringFromInducedThermalPressure:]( self,  "_stringFromInducedThermalPressure:",  -[PPSMetricCollection inducedThermalPressure](self, "inducedThermalPressure"));
  uint64_t v44 = [v42 UTF8String];
  v62 = -[PPSMetricCollection displayAPL](self, "displayAPL");
  [v62 value];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v61 doubleValue];
  uint64_t v23 = v22;
  v60 = -[PPSMetricCollection displayAPL](self, "displayAPL");
  [v60 timestamp];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[PPSMetricCollection displayCost](self, "displayCost");
  [v56 value];
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 doubleValue];
  uint64_t v26 = v25;
  -[PPSMetricCollection displayCost](self, "displayCost");
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 timestamp];
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection displayFPS](self, "displayFPS");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 value];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 doubleValue];
  uint64_t v33 = v32;
  v34 = -[PPSMetricCollection displayFPS](self, "displayFPS");
  [v34 timestamp];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v55 stringWithFormat:@"------------------ Power -------------------\nSystem Load        %8.3f W   %@\nBattery            %8.3f W   %@\nDC Input           %8.3f W   %@\n\nCPU                %8.3f W   %@\nGPU                %8.3f W   %@\nDRAM               %8.3f W   %@\nOther SoC          %8.3f W   %@\nWiFi               %8.3f W   %@\nCellular           %8.3f W   %@\nDisplay            %8.3f W   %@\n\nCharging Rate      %8d mA  %@\n\nSystem Power Available While Charging: %s\n\n----------------- Thermal ------------------\nBattery            %8.3f °C  %@\nSkin               %8.3f °C  %@\n\nThermal Pressure   %8s\nInduced Pressure   %8s\n\n----------------- Display ------------------\nDisplay APL        %8.3f     %@\nDisplay Cost       %8.3f     %@\nDisplay Avg FPS    %8.3f     %@", v54, v93, v53, v91, v52, v90, v51, v89, v50, v80, v49, v79, v48, v77, v11, v76, v13, v68, v15, v67, v47, v65, v46, v19, v64, v21, v59, v45, v44, v23, v57, v26, v29, v33, v36];
  v38 = (void *)v129[5];
  v129[5] = v37;
  v39 = -[PPSMetricCollection processMetrics](self, "processMetrics");
  v127[0] = MEMORY[0x1895F87A8];
  v127[1] = 3221225472LL;
  v127[2] = __34__PPSMetricCollection_description__block_invoke;
  v127[3] = &unk_18A3A4858;
  v127[4] = &v128;
  [v39 enumerateKeysAndObjectsUsingBlock:v127];

  id v40 = (id)v129[5];
  _Block_object_dispose(&v128, 8);

  return v40;
}

void __34__PPSMetricCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v6 = a3;
  uint64_t v7 = [v5 stringByAppendingFormat:@"\n\n-------------- Process %-5d ---------------\n%@", objc_msgSend(a2, "intValue"), v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)combineWithMetricCollection:(id)a3
{
  id v220 = a3;
  uint64_t v4 = [v220 sampleTime];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    -[PPSMetricCollection sampleTime](self, "sampleTime");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x189607968];
      [v220 sampleTime];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 doubleValue];
      double v10 = v9;
      -[PPSMetricCollection sampleTime](self, "sampleTime");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 doubleValue];
      [v7 numberWithDouble:v10 + v12];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setSampleTime:](self, "setSampleTime:", v13);
    }
  }

  uint64_t v14 = [v220 cpuEnergy];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    -[PPSMetricCollection cpuEnergy](self, "cpuEnergy");
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      __int128 v17 = (void *)MEMORY[0x189607968];
      -[PPSMetricCollection cpuEnergy](self, "cpuEnergy");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 doubleValue];
      double v20 = v19;
      [v220 cpuEnergy];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 doubleValue];
      [v17 numberWithDouble:v20 + v22];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection cpuEnergy](self, "cpuEnergy");
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 timestamp];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v23,  v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setCpuEnergy:](self, "setCpuEnergy:", v26);
    }
  }

  uint64_t v27 = [v220 gpuEnergy];
  if (v27)
  {
    objc_super v28 = (void *)v27;
    v29 = -[PPSMetricCollection gpuEnergy](self, "gpuEnergy");
    if (v29)
    {
      uint64_t v30 = (void *)MEMORY[0x189607968];
      v31 = -[PPSMetricCollection gpuEnergy](self, "gpuEnergy");
      [v31 doubleValue];
      double v33 = v32;
      [v220 gpuEnergy];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 doubleValue];
      [v30 numberWithDouble:v33 + v35];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection gpuEnergy](self, "gpuEnergy");
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 timestamp];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v36,  v38);
      -[PPSMetricCollection setGpuEnergy:](self, "setGpuEnergy:", v39);
    }
  }

  uint64_t v40 = [v220 gpuSRAMEnergy];
  if (v40)
  {
    v41 = (void *)v40;
    -[PPSMetricCollection gpuSRAMEnergy](self, "gpuSRAMEnergy");
    id v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      id v43 = (void *)MEMORY[0x189607968];
      -[PPSMetricCollection gpuSRAMEnergy](self, "gpuSRAMEnergy");
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v44 doubleValue];
      double v46 = v45;
      [v220 gpuSRAMEnergy];
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 doubleValue];
      [v43 numberWithDouble:v46 + v48];
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection gpuSRAMEnergy](self, "gpuSRAMEnergy");
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 timestamp];
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v49,  v51);
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setGpuSRAMEnergy:](self, "setGpuSRAMEnergy:", v52);
    }
  }

  uint64_t v53 = [v220 aneEnergy];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    v55 = -[PPSMetricCollection aneEnergy](self, "aneEnergy");
    if (v55)
    {
      v56 = (void *)MEMORY[0x189607968];
      v57 = -[PPSMetricCollection aneEnergy](self, "aneEnergy");
      [v57 doubleValue];
      double v59 = v58;
      [v220 aneEnergy];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      [v60 doubleValue];
      [v56 numberWithDouble:v59 + v61];
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[PPSMetricCollection aneEnergy](self, "aneEnergy");
      [v63 timestamp];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v62,  v64);
      -[PPSMetricCollection setAneEnergy:](self, "setAneEnergy:", v65);
    }
  }

  uint64_t v66 = [v220 dcsEnergy];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = -[PPSMetricCollection dcsEnergy](self, "dcsEnergy");
    if (v68)
    {
      v69 = (void *)MEMORY[0x189607968];
      v70 = -[PPSMetricCollection dcsEnergy](self, "dcsEnergy");
      [v70 doubleValue];
      double v72 = v71;
      [v220 dcsEnergy];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      [v73 doubleValue];
      [v69 numberWithDouble:v72 + v74];
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[PPSMetricCollection dcsEnergy](self, "dcsEnergy");
      [v76 timestamp];
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v75,  v77);
      -[PPSMetricCollection setDcsEnergy:](self, "setDcsEnergy:", v78);
    }
  }

  uint64_t v79 = [v220 dramEnergy];
  if (v79)
  {
    v80 = (void *)v79;
    v81 = -[PPSMetricCollection dramEnergy](self, "dramEnergy");
    if (v81)
    {
      v82 = (void *)MEMORY[0x189607968];
      v83 = -[PPSMetricCollection dramEnergy](self, "dramEnergy");
      [v83 doubleValue];
      double v85 = v84;
      [v220 dramEnergy];
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      [v86 doubleValue];
      [v82 numberWithDouble:v85 + v87];
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[PPSMetricCollection dramEnergy](self, "dramEnergy");
      [v89 timestamp];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v88,  v90);
      -[PPSMetricCollection setDramEnergy:](self, "setDramEnergy:", v91);
    }
  }

  uint64_t v92 = [v220 pcieEnergy];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = -[PPSMetricCollection pcieEnergy](self, "pcieEnergy");
    if (v94)
    {
      v95 = (void *)MEMORY[0x189607968];
      v96 = -[PPSMetricCollection pcieEnergy](self, "pcieEnergy");
      [v96 doubleValue];
      double v98 = v97;
      [v220 pcieEnergy];
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      [v99 doubleValue];
      [v95 numberWithDouble:v98 + v100];
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = -[PPSMetricCollection pcieEnergy](self, "pcieEnergy");
      [v102 timestamp];
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v101,  v103);
      -[PPSMetricCollection setPcieEnergy:](self, "setPcieEnergy:", v104);
    }
  }

  uint64_t v105 = [v220 dramBytes];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = -[PPSMetricCollection dramBytes](self, "dramBytes");
    if (v107)
    {
      v108 = (void *)MEMORY[0x189607968];
      v109 = -[PPSMetricCollection dramBytes](self, "dramBytes");
      [v109 doubleValue];
      double v111 = v110;
      [v220 dramBytes];
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      [v112 doubleValue];
      [v108 numberWithDouble:v111 + v113];
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = -[PPSMetricCollection dramBytes](self, "dramBytes");
      [v115 timestamp];
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v114,  v116);
      -[PPSMetricCollection setDramBytes:](self, "setDramBytes:", v117);
    }
  }

  uint64_t v118 = [v220 aneDCSBytes];
  if (v118)
  {
    v119 = (void *)v118;
    v120 = -[PPSMetricCollection aneDCSBytes](self, "aneDCSBytes");
    if (v120)
    {
      v121 = (void *)MEMORY[0x189607968];
      v122 = -[PPSMetricCollection aneDCSBytes](self, "aneDCSBytes");
      [v122 doubleValue];
      double v124 = v123;
      [v220 aneDCSBytes];
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      [v125 doubleValue];
      [v121 numberWithDouble:v124 + v126];
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection aneDCSBytes](self, "aneDCSBytes");
      uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
      [v128 timestamp];
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v127,  v129);
      uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setAneDCSBytes:](self, "setAneDCSBytes:", v130);
    }
  }

  uint64_t v131 = [v220 aneFabricBytes];
  if (v131)
  {
    v132 = (void *)v131;
    -[PPSMetricCollection aneFabricBytes](self, "aneFabricBytes");
    id v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (v133)
    {
      v134 = (void *)MEMORY[0x189607968];
      v135 = -[PPSMetricCollection aneFabricBytes](self, "aneFabricBytes");
      [v135 doubleValue];
      double v137 = v136;
      [v220 aneFabricBytes];
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      [v138 doubleValue];
      [v134 numberWithDouble:v137 + v139];
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = -[PPSMetricCollection aneFabricBytes](self, "aneFabricBytes");
      [v141 timestamp];
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v140,  v142);
      -[PPSMetricCollection setAneFabricBytes:](self, "setAneFabricBytes:", v143);
    }
  }

  uint64_t v144 = [v220 systemLoadPower];
  if (v144)
  {
    v145 = (void *)v144;
    v146 = -[PPSMetricCollection systemLoadPower](self, "systemLoadPower");
    if (v146)
    {
      [v220 systemLoadPower];
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setSystemLoadPower:](self, "setSystemLoadPower:", v147);
    }
  }

  uint64_t v148 = [v220 batteryPower];
  if (v148)
  {
    v149 = (void *)v148;
    v150 = -[PPSMetricCollection batteryPower](self, "batteryPower");
    if (v150)
    {
      [v220 batteryPower];
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setBatteryPower:](self, "setBatteryPower:", v151);
    }
  }

  uint64_t v152 = [v220 dcInputPower];
  if (v152)
  {
    v153 = (void *)v152;
    v154 = -[PPSMetricCollection dcInputPower](self, "dcInputPower");
    if (v154)
    {
      [v220 dcInputPower];
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDcInputPower:](self, "setDcInputPower:", v155);
    }
  }

  uint64_t v156 = [v220 cpuPower];
  if (v156)
  {
    v157 = (void *)v156;
    v158 = -[PPSMetricCollection cpuPower](self, "cpuPower");
    if (v158)
    {
      [v220 cpuPower];
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setCpuPower:](self, "setCpuPower:", v159);
    }
  }

  uint64_t v160 = [v220 gpuPower];
  if (v160)
  {
    v161 = (void *)v160;
    v162 = -[PPSMetricCollection gpuPower](self, "gpuPower");
    if (v162)
    {
      [v220 gpuPower];
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setGpuPower:](self, "setGpuPower:", v163);
    }
  }

  uint64_t v164 = [v220 dramPower];
  if (v164)
  {
    v165 = (void *)v164;
    v166 = -[PPSMetricCollection dramPower](self, "dramPower");
    if (v166)
    {
      [v220 dramPower];
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDramPower:](self, "setDramPower:", v167);
    }
  }

  uint64_t v168 = [v220 anePower];
  if (v168)
  {
    v169 = (void *)v168;
    v170 = -[PPSMetricCollection anePower](self, "anePower");
    if (v170)
    {
      [v220 anePower];
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setAnePower:](self, "setAnePower:", v171);
    }
  }

  uint64_t v172 = [v220 otherSocPower];
  if (v172)
  {
    v173 = (void *)v172;
    v174 = -[PPSMetricCollection otherSocPower](self, "otherSocPower");
    if (v174)
    {
      [v220 otherSocPower];
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setOtherSocPower:](self, "setOtherSocPower:", v175);
    }
  }

  uint64_t v176 = [v220 wifiPower];
  if (v176)
  {
    v177 = (void *)v176;
    v178 = -[PPSMetricCollection wifiPower](self, "wifiPower");
    if (v178)
    {
      [v220 wifiPower];
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setWifiPower:](self, "setWifiPower:", v179);
    }
  }

  uint64_t v180 = [v220 cellularPower];
  if (v180)
  {
    v181 = (void *)v180;
    v182 = -[PPSMetricCollection cellularPower](self, "cellularPower");
    if (v182)
    {
      [v220 cellularPower];
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setCellularPower:](self, "setCellularPower:", v183);
    }
  }

  uint64_t v184 = [v220 displayPower];
  if (v184)
  {
    v185 = (void *)v184;
    v186 = -[PPSMetricCollection displayPower](self, "displayPower");
    if (v186)
    {
      [v220 displayPower];
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayPower:](self, "setDisplayPower:", v187);
    }
  }

  uint64_t v188 = [v220 displayFPS];
  if (v188)
  {
    v189 = (void *)v188;
    v190 = -[PPSMetricCollection displayFPS](self, "displayFPS");
    if (v190)
    {
      [v220 displayFPS];
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayFPS:](self, "setDisplayFPS:", v191);
    }
  }

  uint64_t v192 = [v220 wifiAWDLStatus];
  if (v192)
  {
    v193 = (void *)v192;
    v194 = -[PPSMetricCollection wifiAWDLStatus](self, "wifiAWDLStatus");
    if (v194)
    {
      [v220 wifiAWDLStatus];
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setWifiAWDLStatus:](self, "setWifiAWDLStatus:", v195);
    }
  }

  uint64_t v196 = [v220 wifiAWDLRange];
  if (v196)
  {
    v197 = (void *)v196;
    v198 = -[PPSMetricCollection wifiAWDLRange](self, "wifiAWDLRange");
    if (v198)
    {
      [v220 wifiAWDLRange];
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setWifiAWDLRange:](self, "setWifiAWDLRange:", v199);
    }
  }

  uint64_t v200 = [v220 chargingRate];
  if (v200)
  {
    v201 = (void *)v200;
    v202 = -[PPSMetricCollection chargingRate](self, "chargingRate");
    if (v202)
    {
      [v220 chargingRate];
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setChargingRate:](self, "setChargingRate:", v203);
    }
  }

  uint64_t v204 = [v220 batteryTemperature];
  if (v204)
  {
    v205 = (void *)v204;
    v206 = -[PPSMetricCollection batteryTemperature](self, "batteryTemperature");
    if (v206)
    {
      [v220 batteryTemperature];
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setBatteryTemperature:](self, "setBatteryTemperature:", v207);
    }
  }

  uint64_t v208 = [v220 skinTemperature];
  if (v208)
  {
    v209 = (void *)v208;
    v210 = -[PPSMetricCollection skinTemperature](self, "skinTemperature");
    if (v210)
    {
      [v220 skinTemperature];
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setSkinTemperature:](self, "setSkinTemperature:", v211);
    }
  }

  uint64_t v212 = [v220 displayAPL];
  if (v212)
  {
    v213 = (void *)v212;
    v214 = -[PPSMetricCollection displayAPL](self, "displayAPL");
    if (v214)
    {
      [v220 displayAPL];
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayAPL:](self, "setDisplayAPL:", v215);
    }
  }

  uint64_t v216 = [v220 displayCost];
  if (v216)
  {
    v217 = (void *)v216;
    v218 = -[PPSMetricCollection displayCost](self, "displayCost");
    if (v218)
    {
      [v220 displayCost];
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayCost:](self, "setDisplayCost:", v219);
    }
  }

  -[PPSMetricCollection setIsSystemPowerAvailableWhileCharging:]( self,  "setIsSystemPowerAvailableWhileCharging:",  [v220 isSystemPowerAvailableWhileCharging]);
  -[PPSMetricCollection setThermalPressure:](self, "setThermalPressure:", [v220 thermalPressure]);
  -[PPSMetricCollection setInducedThermalPressure:]( self,  "setInducedThermalPressure:",  [v220 inducedThermalPressure]);
}

- (id)_stringFromThermalPressure:(int64_t)a3
{
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30LL:
        return @"Heavy";
      case 40LL:
        return @"Trapping";
      case 50LL:
        return @"Sleeping";
    }
  }

  else
  {
    switch(a3)
    {
      case 0LL:
        return @"Nominal";
      case 10LL:
        return @"Light";
      case 20LL:
        return @"Moderate";
    }
  }

  return @"Unknown";
}

- (id)_stringFromInducedThermalPressure:(int64_t)a3
{
  if (a3 <= 9)
  {
    if (a3 == -1) {
      return @"Not Set";
    }
    if (!a3) {
      return @"Nominal";
    }
  }

  else
  {
    switch(a3)
    {
      case 10LL:
        return @"Light";
      case 20LL:
        return @"Moderate";
      case 30LL:
        return @"Heavy";
    }
  }

  return @"Unknown";
}

- (void)updateMetrics:(id)a3 forPid:(id)a4
{
}

- (PPSMetricSample)systemLoadPower
{
  return self->_systemLoadPower;
}

- (void)setSystemLoadPower:(id)a3
{
}

- (PPSMetricSample)batteryPower
{
  return self->_batteryPower;
}

- (void)setBatteryPower:(id)a3
{
}

- (PPSMetricSample)dcInputPower
{
  return self->_dcInputPower;
}

- (void)setDcInputPower:(id)a3
{
}

- (PPSMetricSample)cpuPower
{
  return self->_cpuPower;
}

- (void)setCpuPower:(id)a3
{
}

- (PPSMetricSample)gpuPower
{
  return self->_gpuPower;
}

- (void)setGpuPower:(id)a3
{
}

- (PPSMetricSample)dramPower
{
  return self->_dramPower;
}

- (void)setDramPower:(id)a3
{
}

- (PPSMetricSample)anePower
{
  return self->_anePower;
}

- (void)setAnePower:(id)a3
{
}

- (PPSMetricSample)otherSocPower
{
  return self->_otherSocPower;
}

- (void)setOtherSocPower:(id)a3
{
}

- (PPSMetricSample)wifiPower
{
  return self->_wifiPower;
}

- (void)setWifiPower:(id)a3
{
}

- (PPSMetricSample)cellularPower
{
  return self->_cellularPower;
}

- (void)setCellularPower:(id)a3
{
}

- (PPSMetricSample)displayPower
{
  return self->_displayPower;
}

- (void)setDisplayPower:(id)a3
{
}

- (PPSMetricSample)displayFPS
{
  return self->_displayFPS;
}

- (void)setDisplayFPS:(id)a3
{
}

- (PPSMetricSample)wifiAWDLStatus
{
  return self->_wifiAWDLStatus;
}

- (void)setWifiAWDLStatus:(id)a3
{
}

- (PPSMetricSample)wifiAWDLRange
{
  return self->_wifiAWDLRange;
}

- (void)setWifiAWDLRange:(id)a3
{
}

- (PPSMetricSample)chargingRate
{
  return self->_chargingRate;
}

- (void)setChargingRate:(id)a3
{
}

- (BOOL)isSystemPowerAvailableWhileCharging
{
  return self->_isSystemPowerAvailableWhileCharging;
}

- (void)setIsSystemPowerAvailableWhileCharging:(BOOL)a3
{
  self->_isSystemPowerAvailableWhileCharging = a3;
}

- (PPSMetricSample)batteryTemperature
{
  return self->_batteryTemperature;
}

- (void)setBatteryTemperature:(id)a3
{
}

- (PPSMetricSample)skinTemperature
{
  return self->_skinTemperature;
}

- (void)setSkinTemperature:(id)a3
{
}

- (int64_t)thermalPressure
{
  return self->_thermalPressure;
}

- (void)setThermalPressure:(int64_t)a3
{
  self->_thermalPressure = a3;
}

- (int64_t)inducedThermalPressure
{
  return self->_inducedThermalPressure;
}

- (void)setInducedThermalPressure:(int64_t)a3
{
  self->_inducedThermalPressure = a3;
}

- (PPSMetricSample)displayAPL
{
  return self->_displayAPL;
}

- (void)setDisplayAPL:(id)a3
{
}

- (PPSMetricSample)displayCost
{
  return self->_displayCost;
}

- (void)setDisplayCost:(id)a3
{
}

- (NSMutableDictionary)processMetrics
{
  return self->_processMetrics;
}

- (void)setProcessMetrics:(id)a3
{
}

- (NSNumber)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(id)a3
{
}

- (PPSMetricSample)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(id)a3
{
}

- (PPSMetricSample)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(id)a3
{
}

- (PPSMetricSample)gpuSRAMEnergy
{
  return self->_gpuSRAMEnergy;
}

- (void)setGpuSRAMEnergy:(id)a3
{
}

- (PPSMetricSample)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(id)a3
{
}

- (PPSMetricSample)dcsEnergy
{
  return self->_dcsEnergy;
}

- (void)setDcsEnergy:(id)a3
{
}

- (PPSMetricSample)dramEnergy
{
  return self->_dramEnergy;
}

- (void)setDramEnergy:(id)a3
{
}

- (PPSMetricSample)pcieEnergy
{
  return self->_pcieEnergy;
}

- (void)setPcieEnergy:(id)a3
{
}

- (PPSMetricSample)dramBytes
{
  return self->_dramBytes;
}

- (void)setDramBytes:(id)a3
{
}

- (PPSMetricSample)aneDCSBytes
{
  return self->_aneDCSBytes;
}

- (void)setAneDCSBytes:(id)a3
{
}

- (PPSMetricSample)aneFabricBytes
{
  return self->_aneFabricBytes;
}

- (void)setAneFabricBytes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end