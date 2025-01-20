@interface DYWorkloadGPUTimelineInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)consistentStateAchieved;
- (BOOL)isMio;
- (DYGPUDerivedEncoderCounterInfo)derivedEncoderCounterInfo;
- (DYGPUTimelineInfo)aggregatedGPUTimelineInfo;
- (DYWorkloadGPUTimelineInfo)init;
- (DYWorkloadGPUTimelineInfo)initWithCoder:(id)a3;
- (NSArray)coreCounts;
- (NSArray)perRingSampledDerivedCounters;
- (NSArray)restoreTimestamps;
- (NSDictionary)coalescedEncoderInfo;
- (NSMutableArray)counterGroups;
- (NSMutableArray)mGPUTimelineInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createCounterGroup;
- (id)mGPUTimelineInfoAtIndex:(unint64_t)a3;
- (unint64_t)metalFXCallDuration:(unint64_t)a3;
- (unsigned)profiledState;
- (unsigned)timeBaseDenominator;
- (unsigned)timeBaseNumerator;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateEncoderDerivedData:(id)a3;
- (void)enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)setAggregatedGPUTimelineInfo:(id)a3;
- (void)setCoalescedEncoderInfo:(id)a3;
- (void)setConsistentStateAchieved:(BOOL)a3;
- (void)setCoreCounts:(id)a3;
- (void)setCounterGroups:(id)a3;
- (void)setDerivedEncoderCounterInfo:(id)a3;
- (void)setMGPUTimelineInfos:(id)a3;
- (void)setPerRingSampledDerivedCounters:(id)a3;
- (void)setProfiledState:(unsigned int)a3;
- (void)setRestoreTimestamps:(id)a3;
- (void)setTimeBaseDenominator:(unsigned int)a3;
- (void)setTimeBaseNumerator:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation DYWorkloadGPUTimelineInfo

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo mGPUTimelineInfos](self, "mGPUTimelineInfos"));
  id v6 = [v5 copy];
  [v4 setMGPUTimelineInfos:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo aggregatedGPUTimelineInfo](self, "aggregatedGPUTimelineInfo"));
  id v8 = [v7 copy];
  [v4 setAggregatedGPUTimelineInfo:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo perRingSampledDerivedCounters](self, "perRingSampledDerivedCounters"));
  id v10 = [v9 copy];
  [v4 setPerRingSampledDerivedCounters:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYWorkloadGPUTimelineInfo coreCounts](self, "coreCounts"));
  id v12 = [v11 copy];
  [v4 setCoreCounts:v12];

  return v4;
}

- (DYWorkloadGPUTimelineInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___DYWorkloadGPUTimelineInfo;
  v5 = -[DYWorkloadGPUTimelineInfo init](&v80, "init");
  if (v5)
  {
    v5->_version = [v4 decodeIntForKey:@"version"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  objc_opt_class(&OBJC_CLASS___DYGPUTimelineInfo, v10),  0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"mGPUTimelineInfos"]);
    mGPUTimelineInfos = v5->_mGPUTimelineInfos;
    v5->_mGPUTimelineInfos = (NSMutableArray *)v13;

    v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___DYGPUTimelineInfo, v15),  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"aggregatedGPUTimelineInfo"]);
    aggregatedGPUTimelineInfo = v5->_aggregatedGPUTimelineInfo;
    v5->_aggregatedGPUTimelineInfo = (DYGPUTimelineInfo *)v18;

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSData, v20);
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSMutableData, v22);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray, v24);
    v27 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  v23,  v25,  objc_opt_class(&OBJC_CLASS___NSMutableArray, v26),  0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v28 forKey:@"perRingSampledDerivedCounters"]);
    perRingSampledDerivedCounters = v5->_perRingSampledDerivedCounters;
    v5->_perRingSampledDerivedCounters = (NSArray *)v29;

    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray, v31);
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v33);
    v36 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v32,  v34,  objc_opt_class(&OBJC_CLASS___NSNumber, v35),  0LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v37 forKey:@"coreCounts"]);
    coreCounts = v5->_coreCounts;
    v5->_coreCounts = (NSArray *)v38;

    if (v5->_version < 2)
    {
      *(void *)&v5->_timeBaseNumerator = 0x30000007DLL;
    }

    else
    {
      v5->_timeBaseNumerator = [v4 decodeIntForKey:@"timeBaseNumerator"];
      v5->_timeBaseDenominator = [v4 decodeIntForKey:@"timeBaseDenominator"];
      v41 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___DYGPUDerivedEncoderCounterInfo, v40),  0LL);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      uint64_t v43 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v42 forKey:@"derivedEncoderCounterInfo"]);
      derivedEncoderCounterInfo = v5->_derivedEncoderCounterInfo;
      v5->_derivedEncoderCounterInfo = (DYGPUDerivedEncoderCounterInfo *)v43;

      if (v5->_version >= 3)
      {
        v5->_profiledState = [v4 decodeIntForKey:@"profiledState"];
        v5->_consistentStateAchieved = [v4 decodeBoolForKey:@"consistentStateAchieved"];
        if (v5->_version >= 4)
        {
          uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSArray, v45);
          uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v47);
          v50 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v46,  v48,  objc_opt_class(&OBJC_CLASS___NSNumber, v49),  0LL);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          uint64_t v52 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v51 forKey:@"restoreTimestamps"]);
          restoreTimestamps = v5->_restoreTimestamps;
          v5->_restoreTimestamps = (NSArray *)v52;

          if (v5->_version >= 6)
          {
            uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSArray, v54);
            uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v56);
            uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSNumber, v58);
            uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v60);
            v63 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v55,  v57,  v59,  v61,  objc_opt_class(&OBJC_CLASS___NSDictionary, v62),  0LL);
            v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            uint64_t v65 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v64 forKey:@"coalescedEncoderInfo"]);
            coalescedEncoderInfo = v5->_coalescedEncoderInfo;
            v5->_coalescedEncoderInfo = (NSDictionary *)v65;

            if (v5->_version >= 7)
            {
              uint64_t v68 = objc_opt_class(&OBJC_CLASS___DYTimelineCounterGroup, v67);
              uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSArray, v69);
              uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v71);
              v74 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v68,  v70,  v72,  objc_opt_class(&OBJC_CLASS___NSNull, v73),  0LL);
              v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
              uint64_t v76 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v75 forKey:@"counterGroups"]);
              counterGroups = v5->_counterGroups;
              v5->_counterGroups = (NSMutableArray *)v76;
            }
          }
        }
      }
    }

    v78 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  self->_version = 8;
  id v5 = v4;
  [v4 encodeInt:8 forKey:@"version"];
  [v5 encodeInt:self->_timeBaseNumerator forKey:@"timeBaseNumerator"];
  [v5 encodeInt:self->_timeBaseDenominator forKey:@"timeBaseDenominator"];
  [v5 encodeObject:self->_mGPUTimelineInfos forKey:@"mGPUTimelineInfos"];
  [v5 encodeObject:self->_aggregatedGPUTimelineInfo forKey:@"aggregatedGPUTimelineInfo"];
  [v5 encodeObject:self->_perRingSampledDerivedCounters forKey:@"perRingSampledDerivedCounters"];
  [v5 encodeObject:self->_coreCounts forKey:@"coreCounts"];
  [v5 encodeObject:self->_derivedEncoderCounterInfo forKey:@"derivedEncoderCounterInfo"];
  [v5 encodeInt:self->_profiledState forKey:@"profiledState"];
  [v5 encodeBool:self->_consistentStateAchieved forKey:@"consistentStateAchieved"];
  [v5 encodeObject:self->_restoreTimestamps forKey:@"restoreTimestamps"];
  [v5 encodeObject:self->_coalescedEncoderInfo forKey:@"coalescedEncoderInfo"];
  [v5 encodeObject:self->_counterGroups forKey:@"counterGroups"];
}

- (DYWorkloadGPUTimelineInfo)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DYWorkloadGPUTimelineInfo;
  v2 = -[DYWorkloadGPUTimelineInfo init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_version = 8;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 16LL));
    mGPUTimelineInfos = v3->_mGPUTimelineInfos;
    v3->_mGPUTimelineInfos = (NSMutableArray *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    counterGroups = v3->_counterGroups;
    v3->_counterGroups = (NSMutableArray *)v6;

    uint64_t v9 = objc_opt_new(&OBJC_CLASS___DYGPUTimelineInfo, v8);
    aggregatedGPUTimelineInfo = v3->_aggregatedGPUTimelineInfo;
    v3->_aggregatedGPUTimelineInfo = (DYGPUTimelineInfo *)v9;

    v11 = v3;
  }

  return v3;
}

- (id)mGPUTimelineInfoAtIndex:(unint64_t)a3
{
  while ((unint64_t)-[NSMutableArray count](self->_mGPUTimelineInfos, "count") <= a3)
  {
    mGPUTimelineInfos = self->_mGPUTimelineInfos;
    uint64_t v7 = (void *)objc_opt_new(&OBJC_CLASS___DYGPUTimelineInfo, v5);
    -[NSMutableArray addObject:](mGPUTimelineInfos, "addObject:", v7);
  }

  return -[NSMutableArray objectAtIndexedSubscript:](self->_mGPUTimelineInfos, "objectAtIndexedSubscript:", a3);
}

- (id)createCounterGroup
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___DYTimelineCounterGroup, a2);
  -[NSMutableArray addObject:](self->_counterGroups, "addObject:", v3);
  return v3;
}

- (void)enumerateEncoderDerivedData:(id)a3
{
}

- (void)enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4
{
}

- (unint64_t)metalFXCallDuration:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self->_aggregatedGPUTimelineInfo, "metalFXTimelineInfo"));

  if (!v5) {
    return 0LL;
  }
  id v6 = objc_claimAutoreleasedReturnValue( -[DYGPUTimelineInfo metalFXTimelineInfo]( self->_aggregatedGPUTimelineInfo, "metalFXTimelineInfo"));
  uint64_t v7 = (uint64_t *)[v6 bytes];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self->_aggregatedGPUTimelineInfo, "metalFXTimelineInfo"));
  unint64_t v9 = (unint64_t)[v8 length];

  if (v9 < 0x10) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  v11 = v7;
  while (1)
  {
    uint64_t v12 = *v11;
    v11 += 2;
    if (v12 == a3) {
      break;
    }
    if (v9 >> 4 == ++v10) {
      return 0LL;
    }
  }

  return (unint64_t)*(double *)&v7[2 * v10 + 1];
}

- (BOOL)isMio
{
  return 0;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)timeBaseNumerator
{
  return self->_timeBaseNumerator;
}

- (void)setTimeBaseNumerator:(unsigned int)a3
{
  self->_timeBaseNumerator = a3;
}

- (unsigned)timeBaseDenominator
{
  return self->_timeBaseDenominator;
}

- (void)setTimeBaseDenominator:(unsigned int)a3
{
  self->_timeBaseDenominator = a3;
}

- (NSMutableArray)mGPUTimelineInfos
{
  return self->_mGPUTimelineInfos;
}

- (void)setMGPUTimelineInfos:(id)a3
{
}

- (DYGPUTimelineInfo)aggregatedGPUTimelineInfo
{
  return self->_aggregatedGPUTimelineInfo;
}

- (void)setAggregatedGPUTimelineInfo:(id)a3
{
}

- (NSArray)perRingSampledDerivedCounters
{
  return self->_perRingSampledDerivedCounters;
}

- (void)setPerRingSampledDerivedCounters:(id)a3
{
}

- (NSArray)coreCounts
{
  return self->_coreCounts;
}

- (void)setCoreCounts:(id)a3
{
}

- (DYGPUDerivedEncoderCounterInfo)derivedEncoderCounterInfo
{
  return self->_derivedEncoderCounterInfo;
}

- (void)setDerivedEncoderCounterInfo:(id)a3
{
}

- (unsigned)profiledState
{
  return self->_profiledState;
}

- (void)setProfiledState:(unsigned int)a3
{
  self->_profiledState = a3;
}

- (BOOL)consistentStateAchieved
{
  return self->_consistentStateAchieved;
}

- (void)setConsistentStateAchieved:(BOOL)a3
{
  self->_consistentStateAchieved = a3;
}

- (NSArray)restoreTimestamps
{
  return self->_restoreTimestamps;
}

- (void)setRestoreTimestamps:(id)a3
{
}

- (NSDictionary)coalescedEncoderInfo
{
  return self->_coalescedEncoderInfo;
}

- (void)setCoalescedEncoderInfo:(id)a3
{
}

- (NSMutableArray)counterGroups
{
  return self->_counterGroups;
}

- (void)setCounterGroups:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end