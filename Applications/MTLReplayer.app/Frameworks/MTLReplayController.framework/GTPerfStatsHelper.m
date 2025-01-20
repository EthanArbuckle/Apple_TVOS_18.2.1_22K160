@interface GTPerfStatsHelper
- (BOOL)_collectOperatingPoints;
- (GTPerfStatsHelper)initWithConfigurationVariables:(id)a3;
- (GTPerfStatsHelper)initWithOutputPath:(id)a3;
- (id).cxx_construct;
- (id)_frequenciesForStateName:(const char *)a3 forReg:(unsigned int)a4;
- (id)exportStats;
- (void)gatherStats;
- (void)reset;
- (void)setup;
- (void)startCollectingPerfStatsAtInterval:(unint64_t)a3 andPeriodicSamplesAtInterval:(unint64_t)a4;
- (void)stopCollectingStats;
@end

@implementation GTPerfStatsHelper

- (GTPerfStatsHelper)initWithConfigurationVariables:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTPerfStatsHelper;
  v5 = -[GTPerfStatsHelper init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    configVariables = v5->_configVariables;
    v5->_configVariables = v6;
  }

  return v5;
}

- (void)reset
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  while (begin != end)
  {
    [*((id *)begin + 5) removeAllObjects];
    *((void *)begin + 7) = *((void *)begin + 6);
    *((void *)begin + 11) = *((void *)begin + 10);
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }

- (GTPerfStatsHelper)initWithOutputPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GTPerfStatsHelper;
  v6 = -[GTPerfStatsHelper init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputPath, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_frequenciesForStateName:(const char *)a3 forReg:(unsigned int)a4
{
  id v5 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x600u);
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a4, v5, kCFAllocatorDefault, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL));
  if (CFProperty)
  {
    CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    uint64_t v8 = 0LL;
    for (unint64_t i = 0LL; CFDataGetLength(CFProperty) >> 3 > i; ++i)
    {
      objc_super v10 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&CFDataGetBytePtr(CFProperty)[v8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v7 addObject:v11];

      v8 += 8LL;
    }
  }

  return v7;
}

- (BOOL)_collectOperatingPoints
{
  v66 = self;
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (!v3) {
    return 0;
  }
  v86[0] = @"GPU";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "voltage-states9"));
  v86[1] = @"AFR";
  v87[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "voltage-states31"));
  v87[1] = v5;
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v87,  v86,  2LL));

  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = __44__GTPerfStatsHelper__collectOperatingPoints__block_invoke;
  v81[3] = &unk_58E738;
  v81[4] = v66;
  io_registry_entry_t v83 = v3;
  id v65 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL));
  id v82 = v65;
  [v62 enumerateKeysAndObjectsUsingBlock:v81];
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v66->_configVariables,  "objectForKeyedSubscript:",  @"num_cores"));
  unsigned int v7 = [v6 unsignedIntValue];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v66->_configVariables,  "objectForKeyedSubscript:",  @"num_mgpus"));
  unsigned int v9 = [v8 unsignedIntValue];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v66->_configVariables,  "objectForKeyedSubscript:",  @"gpu_gen"));
  unsigned int v11 = [v10 unsignedIntValue];

  if (v9 <= 1) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = v9;
  }
  unsigned int v13 = v7 / v12 + 1;
  if ((v13 & 0xFFFFFFFC) != 0) {
    unsigned int v14 = v13 & 0xFFFFFFFC;
  }
  else {
    unsigned int v14 = 1;
  }
  v15 = (char *)operator new(0x18uLL);
  *(_OWORD *)v15 = xmmword_316E28;
  v64 = v15;
  *((void *)v15 + 2) = 4266LL;
  v16 = (char *)operator new(0x18uLL);
  *(_OWORD *)v16 = xmmword_316E40;
  v61 = v16;
  *((void *)v16 + 2) = 2933LL;
  v17 = (char *)operator new(0x28uLL);
  *(_OWORD *)v17 = xmmword_316E58;
  *((_OWORD *)v17 + 1) = unk_316E68;
  v63 = v17;
  *((void *)v17 + 4) = 6400LL;
  v18 = operator new(0x18uLL);
  v80[1] = v18 + 3;
  v80[2] = v18 + 3;
  v18[2] = 400LL;
  *(_OWORD *)v18 = xmmword_316E80;
  v58 = v18;
  v80[0] = v18;
  v19 = operator new(0x18uLL);
  v79[1] = v19 + 3;
  v79[2] = v19 + 3;
  v19[2] = 900LL;
  *(_OWORD *)v19 = xmmword_316E98;
  v57 = v19;
  v79[0] = v19;
  v20 = operator new(0x20uLL);
  v78[1] = v20 + 2;
  v78[2] = v20 + 2;
  _OWORD *v20 = xmmword_316EB0;
  v20[1] = unk_316EC0;
  v56 = v20;
  v78[0] = v20;
  v21 = operator new(0x18uLL);
  v77[1] = v21 + 3;
  v77[2] = v21 + 3;
  v21[2] = 900LL;
  *(_OWORD *)v21 = xmmword_316ED0;
  v55 = v21;
  v77[0] = v21;
  v22 = operator new(0x18uLL);
  v76[1] = v22 + 3;
  v76[2] = v22 + 3;
  v22[2] = 1068LL;
  *(_OWORD *)v22 = xmmword_316EE8;
  __p = v22;
  v76[0] = v22;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 5LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 5LL));
  unsigned int v24 = v13 >> 2;
  if (v13 < 4) {
    int v25 = 1;
  }
  else {
    int v25 = v13 >> 2;
  }
  uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  socBlockBandwidths = v66->_socBlockBandwidths;
  v66->_socBlockBandwidths = (NSMutableDictionary *)v26;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v66->_socBlockBandwidths,  "setObject:forKeyedSubscript:",  &off_59F998,  @"WriteReadRatio");
  v28 = v63 + 40;
  unint64_t v29 = (v9 * v25) << 6;
  uint64_t v30 = 2 * v29;
  if (v24 == 2)
  {
    if (v11 <= 0xD)
    {
      if (v11 != 13 || v9 < 2)
      {
        if (v11 == 13) {
          v33 = v77;
        }
        else {
          v33 = v79;
        }
LABEL_27:
        v28 = v64 + 24;
        v31 = v64;
        goto LABEL_28;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v66->_socBlockBandwidths,  "setObject:forKeyedSubscript:",  &off_59F9B0,  @"WriteReadRatio");
    }

    else if (v9 < 2)
    {
      v33 = v76;
      v31 = v63;
LABEL_28:
      uint64_t v32 = (v9 * v25) << 6;
LABEL_38:
      uint64_t v35 = 2000000LL * v9 * v14;
      do
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v35 * *(void *)v31));
        [v67 addObject:v36];

        v31 += 8;
      }

      while (v31 != v28);
      unint64_t v29 = v32;
      goto LABEL_41;
    }

    uint64_t v32 = 2 * v29;
    if (v11 > 0xD) {
      uint64_t v30 = 4 * v29;
    }
    v33 = v76;
    v31 = v63;
    goto LABEL_38;
  }

  if (v24 != 1)
  {
    if (!v24)
    {
      v31 = v61;
      v28 = v61 + 24;
      uint64_t v32 = v29 >> 1;
      v33 = v80;
      uint64_t v30 = (v9 * v25) << 6;
      goto LABEL_38;
    }

    v33 = v79;
    goto LABEL_27;
  }

  if (v11 <= 0xD)
  {
    if (v11 == 10) {
      uint64_t v30 = (v9 * v25) << 6;
    }
    uint64_t v32 = v29 >> (v11 == 10);
    v33 = v79;
    v28 = v64 + 24;
    v31 = v64;
    goto LABEL_38;
  }

  if (v11 == 14)
  {
    v28 = v64 + 24;
    v31 = v64;
  }

  else
  {
    v31 = v63;
  }

  v33 = v78;
  if (v31 != v28) {
    goto LABEL_28;
  }
LABEL_41:
  v37 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:@"AFR"]);
  v60 = v37;
  if (v37)
  {
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v38 = v37;
    id v39 = [v38 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v73;
      do
      {
        for (unint64_t i = 0LL; i != v39; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v73 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (void)[*(id *)(*((void *)&v72 + 1) + 8 * (void)i) unsignedLongLongValue]
                          * v29));
          [v23 addObject:v42];
        }

        id v39 = [v38 countByEnumeratingWithState:&v72 objects:v85 count:16];
      }

      while (v39);
    }
  }

  else
  {
    v43 = (void *)*v33;
    v44 = (void *)v33[1];
    if (v43 != v44)
    {
      uint64_t v45 = 1000000 * v29;
      do
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v45 * *v43));
        [v23 addObject:v46];

        ++v43;
      }

      while (v43 != v44);
    }
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:@"GPU"]);
  v48 = v47;
  if (v47)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v47 count]));
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v50 = v48;
    id v51 = [v50 countByEnumeratingWithState:&v68 objects:v84 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v69;
      do
      {
        for (j = 0LL; j != v51; j = (char *)j + 1)
        {
          if (*(void *)v69 != v52) {
            objc_enumerationMutation(v50);
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (void)[*(id *)(*((void *)&v68 + 1) + 8 * (void)j) unsignedLongLongValue]
                          * v30));
          [v49 addObject:v54];
        }

        id v51 = [v50 countByEnumeratingWithState:&v68 objects:v84 count:16];
      }

      while (v51);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v66->_socBlockBandwidths,  "setObject:forKeyedSubscript:",  v49,  @"GPU");
    if (!v23) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }

  v49 = 0LL;
  if (v23) {
LABEL_64:
  }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v66->_socBlockBandwidths,  "setObject:forKeyedSubscript:",  v23,  @"AFR");
LABEL_65:
  if (v67) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v66->_socBlockBandwidths,  "setObject:forKeyedSubscript:",  v67,  @"DCS");
  }

  operator delete(__p);
  operator delete(v55);
  operator delete(v56);
  operator delete(v57);
  operator delete(v58);
  operator delete(v63);
  operator delete(v61);
  operator delete(v64);

  return 1;
}

- (void)setup
{
  v2 = self;
  p_perfStateGroups = &self->_perfStateGroups;
  begin = self->_perfStateGroups.__begin_;
  if (0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_cap_.__value_ - begin) >> 3) <= 2)
  {
    id v5 = (char *)(self->_perfStateGroups.__end_ - begin);
    p_end_cap = &self->_perfStateGroups.__end_cap_;
    v48 = operator new(0x1C8uLL);
    uint64_t v49 = (uint64_t)&v5[(void)v48];
    id v50 = (uint64_t (*)(uint64_t, uint64_t))&v5[(void)v48];
    id v51 = (char *)v48 + 456;
    std::vector<GTPerfStateGroup>::__swap_out_circular_buffer(p_perfStateGroups, &v48);
    std::__split_buffer<GTPerfStateGroup>::~__split_buffer((uint64_t)&v48);
    v2 = self;
  }

  v58 = @"Perf Counters";
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"GFX", 0LL));
  v59 = v6;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
  uint64_t v8 = v7;
  end = v2->_perfStateGroups.__end_;
  int v10 = 678152731 * ((unint64_t)(end - v2->_perfStateGroups.__begin_) >> 3);
  if (end >= v2->_perfStateGroups.__end_cap_.__value_)
  {
    uint64_t v12 = std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>( p_perfStateGroups,  @"AMC Stats",  v7,  678152731 * ((unint64_t)(end - v2->_perfStateGroups.__begin_) >> 3),  0);
  }

  else
  {
    id v11 = v7;
    *(void *)end = 0LL;
    *((void *)end + 1) = 0LL;
    *((void *)end + 3) = @"AMC Stats";
    *((void *)end + 4) = v11;
    *(_OWORD *)((char *)end + 40) = 0u;
    *(_OWORD *)((char *)end + 56) = 0u;
    *((_DWORD *)end + 18) = v10;
    *((_OWORD *)end + 7) = 0u;
    *((_OWORD *)end + 8) = 0u;
    *(void *)((char *)end + 141) = 0LL;
    uint64_t v12 = (uint64_t)end + 152;
    *(void *)((char *)end + 76) = 0LL;
    *(void *)((char *)end + 92) = 0LL;
    *(void *)((char *)end + 84) = 0LL;
    *((_DWORD *)end + 25) = 0;
    v2->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)end + 152);
  }

  v2->_perfStateGroups.__end_ = (GTPerfStateGroup *)v12;

  v56 = @"GPU";
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"GPUPH",  @"PWRCTRL",  0LL));
  v57 = v13;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
  v15 = v14;
  v16 = self->_perfStateGroups.__end_;
  int v17 = 678152731 * ((unint64_t)(v16 - self->_perfStateGroups.__begin_) >> 3);
  if (v16 >= self->_perfStateGroups.__end_cap_.__value_)
  {
    v19 = (GTPerfStateGroup *)std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>( p_perfStateGroups,  @"GPU Stats",  v14,  678152731 * ((unint64_t)(v16 - self->_perfStateGroups.__begin_) >> 3),  1);
  }

  else
  {
    id v18 = v14;
    *(void *)v16 = 0LL;
    *((void *)v16 + 1) = 0LL;
    *((void *)v16 + 3) = @"GPU Stats";
    *((void *)v16 + 4) = v18;
    *(_OWORD *)((char *)v16 + 40) = 0u;
    *(_OWORD *)((char *)v16 + 56) = 0u;
    *((_DWORD *)v16 + 18) = v17;
    *((_DWORD *)v16 + 19) = 1;
    *((void *)v16 + 11) = 0LL;
    *((void *)v16 + 12) = 0LL;
    *((void *)v16 + 10) = 0LL;
    *((_OWORD *)v16 + 7) = 0u;
    *((_OWORD *)v16 + 8) = 0u;
    *(void *)((char *)v16 + 141) = 0LL;
    v19 = (GTPerfStateGroup *)((char *)v16 + 152);
    self->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)v16 + 152);
  }

  self->_perfStateGroups.__end_ = v19;

  v54 = @"Events";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"SOC",  @"DCS",  @"AFR",  0LL));
  v55 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
  v22 = v21;
  v23 = self->_perfStateGroups.__end_;
  int v24 = 678152731 * ((unint64_t)(v23 - self->_perfStateGroups.__begin_) >> 3);
  if (v23 >= self->_perfStateGroups.__end_cap_.__value_)
  {
    uint64_t v26 = (GTPerfStateGroup *)std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>( p_perfStateGroups,  @"SoC Stats",  v21,  678152731 * ((unint64_t)(v23 - self->_perfStateGroups.__begin_) >> 3),  2);
  }

  else
  {
    id v25 = v21;
    *(void *)v23 = 0LL;
    *((void *)v23 + 1) = 0LL;
    *((void *)v23 + 3) = @"SoC Stats";
    *((void *)v23 + 4) = v25;
    *(_OWORD *)((char *)v23 + 40) = 0u;
    *(_OWORD *)((char *)v23 + 56) = 0u;
    *((_DWORD *)v23 + 18) = v24;
    *((_DWORD *)v23 + 19) = 2;
    *((void *)v23 + 11) = 0LL;
    *((void *)v23 + 12) = 0LL;
    *((void *)v23 + 10) = 0LL;
    *((_OWORD *)v23 + 7) = 0u;
    *((_OWORD *)v23 + 8) = 0u;
    *(void *)((char *)v23 + 141) = 0LL;
    uint64_t v26 = (GTPerfStateGroup *)((char *)v23 + 152);
    self->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)v23 + 152);
  }

  self->_perfStateGroups.__end_ = v26;

  v27 = self->_perfStateGroups.__begin_;
  for (unint64_t i = self->_perfStateGroups.__end_; v27 != i; v27 = (GTPerfStateGroup *)((char *)v27 + 152))
  {
    unint64_t v29 = (const void *)IOReportCopyChannelsInCategories(2LL, 0LL, 0LL);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = ___ZN16GTPerfStateGroup5SetupEP14__CFDictionary_block_invoke;
    v47[3] = &__block_descriptor_40_e25_i16__0____CFDictionary__8l;
    v47[4] = v27;
    if ((IOReportPrune(v29, v47) & 1) == 0)
    {
      uint64_t v46 = 0LL;
      *((void *)v27 + 2) = IOReportCreateSubscription(0LL, v29, &v46, 0LL, v45);
      int ChannelCount = IOReportGetChannelCount(v46);
      v31 = (void *)*((void *)v27 + 1);
      *((_DWORD *)v27 + 36) = ChannelCount;
      *((void *)v27 + 1) = v46;

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v27 + 1) objectForKeyedSubscript:@"IOReportChannels"]);
      v33 = (void *)objc_claimAutoreleasedReturnValue([&off_5A0060 allKeys]);
      if (v32)
      {
        uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  (*((_DWORD *)v27 + 36) + 1)));
        uint64_t v35 = (void *)*((void *)v27 + 17);
        *((void *)v27 + 17) = v34;

        if (!*((_DWORD *)v27 + 19)) {
          [*((id *)v27 + 17) addObject:@"Sample Time"];
        }
        uint64_t v36 = *((void *)v27 + 1);
        v48 = _NSConcreteStackBlock;
        uint64_t v49 = 3221225472LL;
        id v50 = ___ZN16GTPerfStateGroup27_FindSubscribedCounterNamesEv_block_invoke;
        id v51 = &unk_58E780;
        p_end_cap = (__compressed_pair<GTPerfStateGroup *, std::allocator<GTPerfStateGroup>> *)&off_5A0060;
        v53 = v27;
        IOReportPrune(v36, &v48);
      }

      if ((*((_DWORD *)v27 + 19) - 1) <= 1)
      {
        uint64_t v37 = *((void *)v27 + 10);
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v27 + 12) - v37) >> 3) <= 0x3FF)
        {
          uint64_t v38 = *((void *)v27 + 11);
          id v39 = (char *)operator new(0x6000uLL);
          uint64_t v40 = (char *)*((void *)v27 + 11);
          v41 = (char *)*((void *)v27 + 10);
          v42 = &v39[24 * ((v38 - v37) / 24)];
          if (v40 != v41)
          {
            do
            {
              __int128 v43 = *(_OWORD *)(v40 - 24);
              *((void *)v42 - 1) = *((void *)v40 - 1);
              *(_OWORD *)(v42 - 24) = v43;
              v42 -= 24;
              v40 -= 24;
            }

            while (v40 != v41);
            uint64_t v40 = v41;
          }

          *((void *)v27 + 10) = v42;
          *((void *)v27 + 11) = &v39[24 * ((v38 - v37) / 24)];
          *((void *)v27 + 12) = v39 + 24576;
          if (v40) {
            operator delete(v40);
          }
        }
      }
    }

    CFRelease(v29);
  }

  -[GTPerfStatsHelper _collectOperatingPoints](self, "_collectOperatingPoints");
  mach_timebase_info(&self->_timebaseInfo);
}

- (void)startCollectingPerfStatsAtInterval:(unint64_t)a3 andPeriodicSamplesAtInterval:(unint64_t)a4
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin != end)
  {
    BOOL v8 = a4 != 0;
    do
    {
      *((_BYTE *)begin + 148) = v8;
      int v9 = *((_DWORD *)begin + 19);
      if (v9 != 1)
      {
        if (!a4) {
          goto LABEL_18;
        }
        if (!v9)
        {
          unint64_t v10 = a4;
LABEL_9:
          uint64_t v11 = *((unsigned int *)begin + 36);
          if ((int)v11 >= 1)
          {
            if (v9 == 2) {
              uint64_t v12 = v10 >> 2;
            }
            else {
              uint64_t v12 = v10;
            }
            uint64_t v13 = *((void *)begin + 1);
            uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0x2540BE400LL / v12 * v11));
            v15 = (void *)*((void *)begin + 5);
            *((void *)begin + 5) = v14;

            std::vector<unsigned long long>::reserve( (void **)begin + 6,  0x2540BE400LL / v12 * (*((_DWORD *)begin + 36) + 1));
            uint64_t Samples = IOReportCreateSamples(*((void *)begin + 2), v13, 0LL);
            *((void *)begin + 13) = Samples;
            if (!*((_DWORD *)begin + 19))
            {
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472LL;
              v26[2] = ___ZN16GTPerfStateGroup20StartCollectingStatsEy_block_invoke;
              v26[3] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
              v26[4] = begin;
              IOReportIterate(Samples, v26);
            }

            dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
            id v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
            v19 = dispatch_queue_create("reporting_queue", v18);

            v24[0] = 0LL;
            v24[1] = v24;
            v24[2] = 0x2020000000LL;
            int v25 = 0;
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472LL;
            v23[2] = ___ZN16GTPerfStateGroup20StartCollectingStatsEy_block_invoke_2;
            v23[3] = &unk_58E7C8;
            v23[4] = v24;
            v23[5] = begin;
            v23[6] = 0x2540BE400LL / v12;
            v23[7] = v13;
            v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v19);
            if (v20)
            {
              dispatch_time_t v21 = dispatch_time(0LL, v12);
              dispatch_source_set_timer(v20, v21, v12, 0LL);
              dispatch_source_set_event_handler(v20, v23);
              dispatch_resume(v20);
            }

            v22 = *(void **)begin;
            *(void *)begin = v20;

            _Block_object_dispose(v24, 8);
          }

          goto LABEL_18;
        }
      }

      unint64_t v10 = a3;
      if (a3) {
        goto LABEL_9;
      }
LABEL_18:
      begin = (GTPerfStateGroup *)((char *)begin + 152);
    }

    while (begin != end);
  }

- (void)stopCollectingStats
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  while (begin != end)
  {
    if (*(void *)begin)
    {
      dispatch_source_cancel(*(dispatch_source_t *)begin);
      dispatch_source_t v4 = *(dispatch_source_t *)begin;
      *(void *)begin = 0LL;
    }

    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }

- (void)gatherStats
{
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin != end)
  {
    while (1)
    {
      int v4 = *((_DWORD *)begin + 19);
      if (!v4) {
        break;
      }
      if (v4 == 2)
      {
        uint64_t v18 = 0LL;
        v19 = &v18;
        uint64_t v20 = 0x2020000000LL;
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*((id *)begin + 5) firstObject]);

        dispatch_time_t v21 = v10;
        v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
        -[NSNumberFormatter setNumberStyle:](v6, "setNumberStyle:", 1LL);
        uint64_t v11 = (void *)*((void *)begin + 5);
        uint64_t v12 = _NSConcreteStackBlock;
        uint64_t v13 = 3221225472LL;
        uint64_t v14 = ___ZN16GTPerfStateGroup29_GatherSampleDataSOCPerfStateERK18mach_timebase_info_block_invoke;
        v15 = &unk_58E838;
        v16 = &v18;
        dispatch_queue_attr_t v17 = begin;
        [v11 enumerateObjectsUsingBlock:&v12];
        goto LABEL_8;
      }

      if (v4 == 1)
      {
        uint64_t v18 = 0LL;
        v19 = &v18;
        uint64_t v20 = 0x2020000000LL;
        id v5 = (void *)objc_claimAutoreleasedReturnValue([*((id *)begin + 5) firstObject]);

        dispatch_time_t v21 = v5;
        v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
        -[NSNumberFormatter setNumberStyle:](v6, "setNumberStyle:", 1LL);
        unsigned int v7 = (void *)*((void *)begin + 5);
        uint64_t v12 = _NSConcreteStackBlock;
        uint64_t v13 = 3221225472LL;
        uint64_t v14 = ___ZN16GTPerfStateGroup26_GatherSampleDataPerfStateERK18mach_timebase_info_block_invoke;
        v15 = &unk_58E838;
        v16 = &v18;
        dispatch_queue_attr_t v17 = begin;
        [v7 enumerateObjectsUsingBlock:&v12];
LABEL_8:

        _Block_object_dispose(&v18, 8);
      }

      begin = (GTPerfStateGroup *)((char *)begin + 152);
      if (begin == end) {
        return;
      }
    }

    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([*((id *)begin + 5) firstObject]);

    dispatch_time_t v21 = v8;
    v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setNumberStyle:](v6, "setNumberStyle:", 1LL);
    int v9 = (void *)*((void *)begin + 5);
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = ___ZN16GTPerfStateGroup32_GatherSampleDataPeriodicSamplesERK18mach_timebase_info_block_invoke;
    v15 = &unk_58E8C8;
    v16 = &v18;
    [v9 enumerateObjectsUsingBlock:&v12];
    goto LABEL_8;
  }

- (id)exportStats
{
  io_registry_entry_t v3 = objc_autoreleasePoolPush();
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_ - self->_perfStateGroups.__begin_) >> 3) + 1));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_ - self->_perfStateGroups.__begin_) >> 3)));
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin == end) {
    goto LABEL_13;
  }
  char v8 = 0;
  do
  {
    int v9 = *((_DWORD *)begin + 19);
    if ((v9 - 1) < 2)
    {
      uint64_t v10 = *((void *)begin + 10);
      uint64_t v11 = *((void *)begin + 11);
      if (v10 == v11) {
        goto LABEL_10;
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v10,  v11 - v10));
      [v4 setObject:v12 forKeyedSubscript:*((void *)begin + 3)];
      goto LABEL_9;
    }

    if (!v9)
    {
      uint64_t v13 = *((void *)begin + 6);
      uint64_t v14 = *((void *)begin + 7);
      if (v13 != v14)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v13,  v14 - v13));
        [v4 setObject:v12 forKeyedSubscript:*((void *)begin + 3)];
        char v8 = 1;
LABEL_9:
      }
    }

- (void).cxx_destruct
{
  begin = self->_perfStateGroups.__begin_;
  if (begin)
  {
    end = self->_perfStateGroups.__end_;
    id v5 = self->_perfStateGroups.__begin_;
    if (end != begin)
    {
      do
        GTPerfStateGroup::~GTPerfStateGroup((GTPerfStateGroup *)((char *)end - 152));
      while (end != begin);
      id v5 = self->_perfStateGroups.__begin_;
    }

    self->_perfStateGroups.__end_ = begin;
    operator delete(v5);
  }

  objc_storeStrong((id *)&self->_outputPath, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

void __44__GTPerfStatsHelper__collectOperatingPoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = v5;
  char v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "_frequenciesForStateName:forReg:",  objc_msgSend(v7, "UTF8String"),  *(unsigned int *)(a1 + 48)));
  if ([v8 count]) {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

@end