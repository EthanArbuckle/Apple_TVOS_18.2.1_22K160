@interface PPSProcessMetricCollection
+ (BOOL)supportsSecureCoding;
+ (id)_metricSamplePropertyKeys;
- (NSNumber)coalitionID;
- (NSNumber)sampleTime;
- (NSString)bundleID;
- (NSString)processName;
- (PPSMetricSample)aneEnergy;
- (PPSMetricSample)aneTime;
- (PPSMetricSample)applicationState;
- (PPSMetricSample)bytesRead;
- (PPSMetricSample)bytesWritten;
- (PPSMetricSample)cellIn;
- (PPSMetricSample)cellOut;
- (PPSMetricSample)cpuCost;
- (PPSMetricSample)cpuInstructions;
- (PPSMetricSample)cpuPInstructions;
- (PPSMetricSample)cpuSeconds;
- (PPSMetricSample)energyCost;
- (PPSMetricSample)energyOverhead;
- (PPSMetricSample)gpuCost;
- (PPSMetricSample)gpuEnergy;
- (PPSMetricSample)gpuTime;
- (PPSMetricSample)locationCost;
- (PPSMetricSample)networkCost;
- (PPSMetricSample)ongoingLocation;
- (PPSMetricSample)wifiIn;
- (PPSMetricSample)wifiOut;
- (PPSProcessMetricCollection)initWithCoder:(id)a3;
- (const)_stringForApplicationState:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)pid;
- (void)combineWithProcessMetricCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAneEnergy:(id)a3;
- (void)setAneTime:(id)a3;
- (void)setApplicationState:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBytesRead:(id)a3;
- (void)setBytesWritten:(id)a3;
- (void)setCellIn:(id)a3;
- (void)setCellOut:(id)a3;
- (void)setCoalitionID:(id)a3;
- (void)setCpuCost:(id)a3;
- (void)setCpuInstructions:(id)a3;
- (void)setCpuPInstructions:(id)a3;
- (void)setCpuSeconds:(id)a3;
- (void)setEnergyCost:(id)a3;
- (void)setEnergyOverhead:(id)a3;
- (void)setGpuCost:(id)a3;
- (void)setGpuEnergy:(id)a3;
- (void)setGpuTime:(id)a3;
- (void)setLocationCost:(id)a3;
- (void)setNetworkCost:(id)a3;
- (void)setOngoingLocation:(id)a3;
- (void)setPid:(int)a3;
- (void)setProcessName:(id)a3;
- (void)setSampleTime:(id)a3;
- (void)setWifiIn:(id)a3;
- (void)setWifiOut:(id)a3;
@end

@implementation PPSProcessMetricCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_metricSamplePropertyKeys
{
  if (_metricSamplePropertyKeys_onceToken_0 != -1) {
    dispatch_once(&_metricSamplePropertyKeys_onceToken_0, &__block_literal_global_3);
  }
  return (id)_metricSamplePropertyKeys_keys_0;
}

void __55__PPSProcessMetricCollection__metricSamplePropertyKeys__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithArray:&unk_18A3A78E8];
  v1 = (void *)_metricSamplePropertyKeys_keys_0;
  _metricSamplePropertyKeys_keys_0 = v0;
}

- (PPSProcessMetricCollection)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PPSProcessMetricCollection;
  v5 = -[PPSProcessMetricCollection init](&v27, sel_init);
  if (v5)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v6 = +[PPSProcessMetricCollection _metricSamplePropertyKeys]( &OBJC_CLASS___PPSProcessMetricCollection,  "_metricSamplePropertyKeys",  0LL);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
          [v4 decodeObjectOfClass:objc_opt_class() forKey:v11];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSProcessMetricCollection setValue:forKey:](v5, "setValue:forKey:", v12, v11);

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v8);
    }

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__pid__"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = [v13 intValue];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__coalitionID__"];
    coalitionID = v5->_coalitionID;
    v5->_coalitionID = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__processName__"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__bundleID__"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__sampleTime__"];
    sampleTime = v5->_sampleTime;
    v5->_sampleTime = (NSNumber *)v20;
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
  v5 = +[PPSProcessMetricCollection _metricSamplePropertyKeys]( &OBJC_CLASS___PPSProcessMetricCollection,  "_metricSamplePropertyKeys",  0LL);
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
        -[PPSProcessMetricCollection valueForKey:](self, "valueForKey:", v10);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 encodeObject:v11 forKey:v10];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[PPSProcessMetricCollection pid](self, "pid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"__pid__"];
  v13 = -[PPSProcessMetricCollection coalitionID](self, "coalitionID");
  [v4 encodeObject:v13 forKey:@"__coalitionID__"];

  -[PPSProcessMetricCollection processName](self, "processName");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"__processName__"];
  v15 = -[PPSProcessMetricCollection bundleID](self, "bundleID");
  [v4 encodeObject:v15 forKey:@"__bundleID__"];

  -[PPSProcessMetricCollection sampleTime](self, "sampleTime");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v16 forKey:@"__sampleTime__"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v5 = objc_alloc_init(&OBJC_CLASS___PPSProcessMetricCollection);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  +[PPSProcessMetricCollection _metricSamplePropertyKeys]( &OBJC_CLASS___PPSProcessMetricCollection,  "_metricSamplePropertyKeys",  0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = -[PPSProcessMetricCollection valueForKey:](self, "valueForKey:", v11);
        v13 = (void *)[v12 copyWithZone:a3];
        -[PPSProcessMetricCollection setValue:forKey:](v5, "setValue:forKey:", v13, v11);
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v5->_pid = self->_pid;
  objc_storeStrong((id *)&v5->_processName, self->_processName);
  objc_storeStrong((id *)&v5->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v5->_sampleTime, self->_sampleTime);
  return v5;
}

- (id)description
{
  id v57 = (id)NSString;
  v79 = -[PPSProcessMetricCollection energyCost](self, "energyCost");
  [v79 value];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v78 doubleValue];
  uint64_t v4 = v3;
  v77 = -[PPSProcessMetricCollection energyCost](self, "energyCost");
  [v77 timestamp];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v76);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[PPSProcessMetricCollection energyOverhead](self, "energyOverhead");
  [v75 value];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [v74 doubleValue];
  uint64_t v6 = v5;
  v73 = -[PPSProcessMetricCollection energyOverhead](self, "energyOverhead");
  [v73 timestamp];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v72);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[PPSProcessMetricCollection cpuCost](self, "cpuCost");
  [v71 value];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  [v70 doubleValue];
  uint64_t v8 = v7;
  v69 = -[PPSProcessMetricCollection cpuCost](self, "cpuCost");
  [v69 timestamp];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v68);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[PPSProcessMetricCollection cpuSeconds](self, "cpuSeconds");
  [v67 value];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v66 doubleValue];
  uint64_t v10 = v9;
  v65 = -[PPSProcessMetricCollection cpuSeconds](self, "cpuSeconds");
  [v65 timestamp];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v64);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[PPSProcessMetricCollection gpuCost](self, "gpuCost");
  [v63 value];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  [v62 doubleValue];
  uint64_t v12 = v11;
  v61 = -[PPSProcessMetricCollection gpuCost](self, "gpuCost");
  [v61 timestamp];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v60);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[PPSProcessMetricCollection networkCost](self, "networkCost");
  [v59 value];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v56 intValue];
  v55 = -[PPSProcessMetricCollection networkCost](self, "networkCost");
  [v55 timestamp];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v54);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
  [v53 value];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [v52 intValue];
  v51 = -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
  [v51 timestamp];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v50);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
  [v49 value];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v48 intValue];
  v47 = -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
  [v47 timestamp];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v46);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[PPSProcessMetricCollection cellIn](self, "cellIn");
  [v45 value];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v44 intValue];
  v43 = -[PPSProcessMetricCollection cellIn](self, "cellIn");
  [v43 timestamp];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v41);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PPSProcessMetricCollection cellOut](self, "cellOut");
  [v40 value];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v39 intValue];
  v37 = -[PPSProcessMetricCollection cellOut](self, "cellOut");
  [v37 timestamp];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v36);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSProcessMetricCollection locationCost](self, "locationCost");
  [v34 value];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 doubleValue];
  uint64_t v14 = v13;
  v32 = -[PPSProcessMetricCollection locationCost](self, "locationCost");
  [v32 timestamp];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v30);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PPSProcessMetricCollection ongoingLocation](self, "ongoingLocation");
  [v28 value];
  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    __int128 v16 = "NO";
  }
  -[PPSProcessMetricCollection ongoingLocation](self, "ongoingLocation");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 timestamp];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v18);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection applicationState](self, "applicationState");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 timestamp];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection applicationState](self, "applicationState");
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v57 stringWithFormat:@"Energy Cost        %8.3f     %@\nEnergy Overhead    %8.3f     %@\nCPU Cost           %8.3f     %@\nCPU Seconds        %8.3f s   %@\nGPU Cost           %8.3f     %@\nNetwork Cost       %8d     %@\nWiFi In            %8d B   %@\nWiFi Out           %8d B   %@\nCell In            %8d B   %@\nCell Out           %8d B   %@\nLocation Cost      %8.3f     %@\nOngoing Location   %8s     %@\nApplication State               %@\n%29s", v4, v87, v6, v86, v8, v85, v10, v84, v12, v83, v42, v82, v38, v81, v35, v80, v31, v29, v26, v25, v14, v15, v16, v19, v22, -[PPSProcessMetricCollection _stringForApplicationState:]( self, "_stringForApplicationState:", objc_msgSend(v23, "intValue"))];
  id v58 = (id)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (void)combineWithProcessMetricCollection:(id)a3
{
  id v157 = a3;
  uint64_t v4 = [v157 sampleTime];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    -[PPSProcessMetricCollection sampleTime](self, "sampleTime");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x189607968];
      [v157 sampleTime];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 doubleValue];
      double v10 = v9;
      -[PPSProcessMetricCollection sampleTime](self, "sampleTime");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 doubleValue];
      [v7 numberWithDouble:v10 + v12];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setSampleTime:](self, "setSampleTime:", v13);
    }
  }

  uint64_t v14 = [v157 cpuInstructions];
  if (v14)
  {
    __int128 v15 = (void *)v14;
    -[PPSProcessMetricCollection cpuInstructions](self, "cpuInstructions");
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      __int128 v17 = (void *)MEMORY[0x189607968];
      -[PPSProcessMetricCollection cpuInstructions](self, "cpuInstructions");
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 doubleValue];
      double v20 = v19;
      [v157 cpuInstructions];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 doubleValue];
      [v17 numberWithDouble:v20 + v22];
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection cpuInstructions](self, "cpuInstructions");
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 timestamp];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v23,  v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setCpuInstructions:](self, "setCpuInstructions:", v26);
    }
  }

  uint64_t v27 = [v157 cpuPInstructions];
  if (v27)
  {
    v28 = (void *)v27;
    -[PPSProcessMetricCollection cpuPInstructions](self, "cpuPInstructions");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x189607968];
      -[PPSProcessMetricCollection cpuPInstructions](self, "cpuPInstructions");
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 doubleValue];
      double v33 = v32;
      [v157 cpuPInstructions];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 doubleValue];
      [v30 numberWithDouble:v33 + v35];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[PPSProcessMetricCollection cpuPInstructions](self, "cpuPInstructions");
      [v37 timestamp];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v36,  v38);
      -[PPSProcessMetricCollection setCpuPInstructions:](self, "setCpuPInstructions:", v39);
    }
  }

  uint64_t v40 = [v157 wifiIn];
  if (v40)
  {
    v41 = (void *)v40;
    -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = (void *)MEMORY[0x189607968];
      v44 = -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
      [v44 doubleValue];
      double v46 = v45;
      [v157 wifiIn];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 doubleValue];
      [v43 numberWithDouble:v46 + v48];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
      [v50 timestamp];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v49,  v51);
      -[PPSProcessMetricCollection setWifiIn:](self, "setWifiIn:", v52);
    }
  }

  uint64_t v53 = [v157 wifiOut];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
    if (v55)
    {
      v56 = (void *)MEMORY[0x189607968];
      -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
      id v57 = (void *)objc_claimAutoreleasedReturnValue();
      [v57 doubleValue];
      double v59 = v58;
      [v157 wifiOut];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      [v60 doubleValue];
      [v56 numberWithDouble:v59 + v61];
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
      [v63 timestamp];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v62,  v64);
      -[PPSProcessMetricCollection setWifiOut:](self, "setWifiOut:", v65);
    }
  }

  uint64_t v66 = [v157 cellIn];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = -[PPSProcessMetricCollection cellIn](self, "cellIn");
    if (v68)
    {
      v69 = (void *)MEMORY[0x189607968];
      v70 = -[PPSProcessMetricCollection cellIn](self, "cellIn");
      [v70 doubleValue];
      double v72 = v71;
      [v157 cellIn];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      [v73 doubleValue];
      [v69 numberWithDouble:v72 + v74];
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[PPSProcessMetricCollection cellIn](self, "cellIn");
      [v76 timestamp];
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v75,  v77);
      -[PPSProcessMetricCollection setCellIn:](self, "setCellIn:", v78);
    }
  }

  uint64_t v79 = [v157 cellOut];
  if (v79)
  {
    v80 = (void *)v79;
    v81 = -[PPSProcessMetricCollection cellOut](self, "cellOut");
    if (v81)
    {
      v82 = (void *)MEMORY[0x189607968];
      v83 = -[PPSProcessMetricCollection cellOut](self, "cellOut");
      [v83 doubleValue];
      double v85 = v84;
      [v157 cellOut];
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      [v86 doubleValue];
      [v82 numberWithDouble:v85 + v87];
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[PPSProcessMetricCollection cellOut](self, "cellOut");
      [v89 timestamp];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v88,  v90);
      -[PPSProcessMetricCollection setCellOut:](self, "setCellOut:", v91);
    }
  }

  uint64_t v92 = [v157 bytesRead];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = -[PPSProcessMetricCollection bytesRead](self, "bytesRead");
    if (v94)
    {
      v95 = (void *)MEMORY[0x189607968];
      v96 = -[PPSProcessMetricCollection bytesRead](self, "bytesRead");
      [v96 doubleValue];
      double v98 = v97;
      [v157 bytesRead];
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      [v99 doubleValue];
      [v95 numberWithDouble:v98 + v100];
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = -[PPSProcessMetricCollection bytesRead](self, "bytesRead");
      [v102 timestamp];
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v101,  v103);
      -[PPSProcessMetricCollection setBytesRead:](self, "setBytesRead:", v104);
    }
  }

  uint64_t v105 = [v157 bytesWritten];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = -[PPSProcessMetricCollection bytesWritten](self, "bytesWritten");
    if (v107)
    {
      v108 = (void *)MEMORY[0x189607968];
      v109 = -[PPSProcessMetricCollection bytesWritten](self, "bytesWritten");
      [v109 doubleValue];
      double v111 = v110;
      [v157 bytesWritten];
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      [v112 doubleValue];
      [v108 numberWithDouble:v111 + v113];
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = -[PPSProcessMetricCollection bytesWritten](self, "bytesWritten");
      [v115 timestamp];
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v114,  v116);
      -[PPSProcessMetricCollection setBytesWritten:](self, "setBytesWritten:", v117);
    }
  }

  uint64_t v118 = [v157 aneEnergy];
  if (v118)
  {
    v119 = (void *)v118;
    v120 = -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
    if (v120)
    {
      v121 = (void *)MEMORY[0x189607968];
      v122 = -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
      [v122 doubleValue];
      double v124 = v123;
      [v157 aneEnergy];
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      [v125 doubleValue];
      [v121 numberWithDouble:v124 + v126];
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
      [v128 timestamp];
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v127,  v129);
      -[PPSProcessMetricCollection setAneEnergy:](self, "setAneEnergy:", v130);
    }
  }

  uint64_t v131 = [v157 aneTime];
  if (v131)
  {
    v132 = (void *)v131;
    v133 = -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
    if (v133)
    {
      v134 = (void *)MEMORY[0x189607968];
      v135 = -[PPSProcessMetricCollection aneTime](self, "aneTime");
      [v135 doubleValue];
      double v137 = v136;
      [v157 aneTime];
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      [v138 doubleValue];
      [v134 numberWithDouble:v137 + v139];
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = -[PPSProcessMetricCollection aneTime](self, "aneTime");
      [v141 timestamp];
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v140,  v142);
      -[PPSProcessMetricCollection setAneTime:](self, "setAneTime:", v143);
    }
  }

  uint64_t v144 = [v157 gpuEnergy];
  if (v144)
  {
    v145 = (void *)v144;
    v146 = -[PPSProcessMetricCollection gpuEnergy](self, "gpuEnergy");
    if (v146)
    {
      v147 = (void *)MEMORY[0x189607968];
      v148 = -[PPSProcessMetricCollection gpuEnergy](self, "gpuEnergy");
      [v148 doubleValue];
      double v150 = v149;
      [v157 gpuEnergy];
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      [v151 doubleValue];
      [v147 numberWithDouble:v150 + v152];
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = -[PPSProcessMetricCollection gpuEnergy](self, "gpuEnergy");
      [v154 timestamp];
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = +[PPSMetricSample sampleWithValue:timestamp:]( &OBJC_CLASS___PPSMetricSample,  "sampleWithValue:timestamp:",  v153,  v155);
      -[PPSProcessMetricCollection setGpuEnergy:](self, "setGpuEnergy:", v156);
    }
  }
}

- (const)_stringForApplicationState:(unsigned int)a3
{
  if (a3 < 9 && ((0x117u >> a3) & 1) != 0) {
    return off_18A3A48D0[a3];
  }
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
  uint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (PPSMetricSample)energyCost
{
  return self->_energyCost;
}

- (void)setEnergyCost:(id)a3
{
}

- (PPSMetricSample)energyOverhead
{
  return self->_energyOverhead;
}

- (void)setEnergyOverhead:(id)a3
{
}

- (PPSMetricSample)cpuCost
{
  return self->_cpuCost;
}

- (void)setCpuCost:(id)a3
{
}

- (PPSMetricSample)cpuSeconds
{
  return self->_cpuSeconds;
}

- (void)setCpuSeconds:(id)a3
{
}

- (PPSMetricSample)gpuCost
{
  return self->_gpuCost;
}

- (void)setGpuCost:(id)a3
{
}

- (PPSMetricSample)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(id)a3
{
}

- (PPSMetricSample)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(id)a3
{
}

- (PPSMetricSample)networkCost
{
  return self->_networkCost;
}

- (void)setNetworkCost:(id)a3
{
}

- (PPSMetricSample)wifiIn
{
  return self->_wifiIn;
}

- (void)setWifiIn:(id)a3
{
}

- (PPSMetricSample)wifiOut
{
  return self->_wifiOut;
}

- (void)setWifiOut:(id)a3
{
}

- (PPSMetricSample)cellIn
{
  return self->_cellIn;
}

- (void)setCellIn:(id)a3
{
}

- (PPSMetricSample)cellOut
{
  return self->_cellOut;
}

- (void)setCellOut:(id)a3
{
}

- (PPSMetricSample)locationCost
{
  return self->_locationCost;
}

- (void)setLocationCost:(id)a3
{
}

- (PPSMetricSample)ongoingLocation
{
  return self->_ongoingLocation;
}

- (void)setOngoingLocation:(id)a3
{
}

- (PPSMetricSample)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(id)a3
{
}

- (PPSMetricSample)cpuInstructions
{
  return self->_cpuInstructions;
}

- (void)setCpuInstructions:(id)a3
{
}

- (PPSMetricSample)cpuPInstructions
{
  return self->_cpuPInstructions;
}

- (void)setCpuPInstructions:(id)a3
{
}

- (PPSMetricSample)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(id)a3
{
}

- (PPSMetricSample)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(id)a3
{
}

- (PPSMetricSample)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(id)a3
{
}

- (PPSMetricSample)aneTime
{
  return self->_aneTime;
}

- (void)setAneTime:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSNumber)coalitionID
{
  return self->_coalitionID;
}

- (void)setCoalitionID:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end