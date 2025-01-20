@interface WiFiUsageLQMRollingWindow
+ (id)averageIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)getValue:(id)a3 ForField:(id)a4 ScaledByDuration:(BOOL)a5;
+ (id)maximumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)medianIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)minimumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)modeValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)modesValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)sumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (void)initialize;
+ (void)updateConfig;
- (BOOL)checkCriteriaBSSIDWithSample:(id)a3;
- (BOOL)configureDataTriggeredCriteria;
- (BOOL)endOngoingCriteria;
- (BOOL)hasChanged:(id)a3;
- (NSDate)createdTimestamp;
- (NSMutableArray)preceedingTriggers;
- (NSMutableArray)samples;
- (NSMutableArray)triggerCriteriaFilterList;
- (NSMutableSet)features;
- (NSString)fgApp;
- (NSString)interfaceName;
- (NSString)label;
- (NSString)lastSampleBssid;
- (WiFiUsageInterfaceCapabilities)capabilities;
- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andDuration:(double)a4 andInterfaceCapabilities:(id)a5;
- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andInterfaceCapabilities:(id)a4;
- (double)duration;
- (id)evaluateCriteriaWithStopUponFirstMatch:(BOOL)a3;
- (id)getTriggerCriteriaList;
- (void)addSample:(id)a3;
- (void)addSamples:(id)a3;
- (void)addTrigger:(id)a3;
- (void)cleanUpStashedMedians;
- (void)clearOngoingCriteriaDates;
- (void)setCapabilities:(id)a3;
- (void)setCreatedTimestamp:(id)a3;
- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4;
- (void)setDuration:(double)a3;
- (void)setFeatures:(id)a3;
- (void)setFgApp:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLastSampleBssid:(id)a3;
- (void)setSamples:(id)a3;
- (void)setTriggerCriteriaFilterList:(id)a3;
- (void)updateWindow;
@end

@implementation WiFiUsageLQMRollingWindow

+ (void)initialize
{
  _config_duration = 0x404E000000000000LL;
  _config_minSamples = 5LL;
  v2 = (void *)_config_criteriaList;
  _config_criteriaList = 0LL;

  id v3 =  +[WiFiUsageLQMConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageLQMConfiguration,  "getConfigForKey:",  @"LQMRollingWindow");
}

+ (void)updateConfig
{
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v10 objectForKey:@"duration"];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (double v3 = *(double *)&_config_duration, v3 != (double)(unint64_t)[v2 unsignedLongValue]))
      {
        [v2 floatValue];
        double v5 = v4;
      }

      else
      {
        if (arc4random_uniform(0x64u) >= 0x32) {
          int v6 = 30;
        }
        else {
          int v6 = 60;
        }
        double v5 = (double)v6;
      }

      _config_duration = *(void *)&v5;
      [v10 objectForKey:@"minSamplesForFeatures"];
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v8 = _config_minSamples;
          if (v8 != [v7 unsignedLongValue]) {
            _config_minSamples = [v7 unsignedLongValue];
          }
        }
      }

      [v10 objectForKey:@"DataTriggeredCriteriaList"];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([(id)_config_criteriaList isEqualToArray:v9] & 1) == 0)
        {
          objc_storeStrong((id *)&_config_criteriaList, v9);
        }
      }
    }
  }

  NSLog(@"%s: duration set to %f", "+[WiFiUsageLQMRollingWindow updateConfig]", _config_duration);
  NSLog(@"%s: minSamples set to %lu", "+[WiFiUsageLQMRollingWindow updateConfig]", _config_minSamples);
}

- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andInterfaceCapabilities:(id)a4
{
  return -[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:]( self,  "initWithInterfaceName:andDuration:andInterfaceCapabilities:",  a3,  a4,  *(double *)&_config_duration);
}

- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andDuration:(double)a4 andInterfaceCapabilities:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMRollingWindow;
    id v10 = -[WiFiUsageLQMRollingWindow init](&v24, sel_init);
    uint64_t v11 = [v8 copy];
    interfaceName = v10->_interfaceName;
    v10->_interfaceName = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x189603F50] date];
    createdTimestamp = v10->_createdTimestamp;
    v10->_createdTimestamp = (NSDate *)v13;

    v10->_duration = a4;
    samples = v10->_samples;
    v10->_samples = 0LL;

    objc_storeStrong((id *)&v10->_capabilities, a5);
    uint64_t v16 = objc_opt_new();
    triggerCriteriaFilterList = v10->_triggerCriteriaFilterList;
    v10->_triggerCriteriaFilterList = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    features = v10->_features;
    v10->_features = (NSMutableSet *)v18;

    preceedingTriggers = v10->_preceedingTriggers;
    v10->_preceedingTriggers = 0LL;

    fgApp = v10->_fgApp;
    v10->_fgApp = 0LL;

    self = v10;
    v22 = self;
  }

  else
  {
    NSLog( @"%s - Invalid interfaceName:%@",  "-[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:]",  0LL);
    v22 = 0LL;
  }

  return v22;
}

- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4
{
  int v6 = (NSString *)a3;
  objc_storeStrong((id *)&_current_fgApp, a3);
  fgApp = self->_fgApp;
  self->_fgApp = v6;
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if (!self->_samples)
    {
      [MEMORY[0x189603FA8] array];
      double v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      samples = self->_samples;
      self->_samples = v5;

      id v4 = v11;
    }

    [v4 setFgApp:_current_fgApp];
    v7 = -[NSMutableArray lastObject](self->_samples, "lastObject");
    [v7 interfaceName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 interfaceName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v9 isEqualToString:v8];

    if (v10) {
      [v11 setInterfaceName:v8];
    }
    -[NSMutableArray addObject:](self->_samples, "addObject:", v11);
    -[WiFiUsageLQMRollingWindow updateWindow](self, "updateWindow");

    id v4 = v11;
  }
}

- (void)addSamples:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    samples = self->_samples;
    id v8 = v4;
    if (!samples)
    {
      [MEMORY[0x189603FA8] array];
      int v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_samples;
      self->_samples = v6;

      samples = self->_samples;
    }

    -[NSMutableArray addObjectsFromArray:](samples, "addObjectsFromArray:", v8);
    -[WiFiUsageLQMRollingWindow updateWindow](self, "updateWindow");
    id v4 = v8;
  }
}

- (void)addTrigger:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    preceedingTriggers = self->_preceedingTriggers;
    id v8 = v4;
    if (!preceedingTriggers)
    {
      int v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_preceedingTriggers;
      self->_preceedingTriggers = v6;

      preceedingTriggers = self->_preceedingTriggers;
    }

    -[NSMutableArray addObject:](preceedingTriggers, "addObject:", v8);
    id v4 = v8;
  }
}

- (void)updateWindow
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dateByAddingTimeInterval:-self->_duration];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  samples = self->_samples;
  [MEMORY[0x1896079C8] predicateWithFormat:@"timestamp >= %@", v8];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](samples, "filterUsingPredicate:", v5);

  preceedingTriggers = self->_preceedingTriggers;
  [MEMORY[0x1896079C8] predicateWithFormat:@"timestamp >= %@", v8];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](preceedingTriggers, "filterUsingPredicate:", v7);
}

- (void)cleanUpStashedMedians
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[NSMutableSet setValue:forKey:](self->_features, "setValue:forKey:", 0LL, @"median");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  double v3 = self->_triggerCriteriaFilterList;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "features", (void)v9);
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setValue:0 forKey:@"median"];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (void)clearOngoingCriteriaDates
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  obuint64_t j = self->_triggerCriteriaFilterList;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        [v6 criterias];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t j = 0LL; j != v9; ++j)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              __int128 v12 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              char v13 = [v12 matched];
              if ((v13 & 1) == 0)
              {
                [v12 firstTriggered];
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
                v2 = v14;
                if (v14)
                {

LABEL_17:
                  [v12 setCurrentSample:0];
                  [v12 setFirstTriggered:0];
                  [v12 setLastTriggered:0];
                  [v12 setBssid:0];
                  continue;
                }
              }

              [v12 lastTriggered];
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v13 & 1) == 0) {
              if (v15)
              }
                goto LABEL_17;
            }

            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v9);
        }
      }

      uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    }

    while (v4);
  }
}

- (BOOL)endOngoingCriteria
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  obuint64_t j = self->_triggerCriteriaFilterList;
  uint64_t v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
  if (v2)
  {
    uint64_t v3 = v2;
    char v4 = 0;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        [v6 criterias];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t j = 0LL; j != v9; ++j)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              __int128 v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              [v12 setMatched:0];
              [v12 setValid:0];
              uint64_t v13 = [v12 firstTriggered];
              if (v13)
              {
                uint64_t v14 = (void *)v13;
                [v12 lastTriggered];
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v15)
                {
                  [v12 currentSample];
                  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v16) {
                    [v12 currentSample];
                  }
                  else {
                    [v12 firstTriggered];
                  }
                  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                  [v12 setLastTriggered:v17];

                  char v4 = 1;
                }
              }

              [v12 setBssid:0];
            }

            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v9);
        }
      }

      uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    }

    while (v3);
  }

  else
  {
    char v4 = 0;
  }

  lastSampleBssid = self->_lastSampleBssid;
  self->_lastSampleBssid = 0LL;

  return v4 & 1;
}

- (id)getTriggerCriteriaList
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  char v4 = self->_triggerCriteriaFilterList;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = objc_alloc(MEMORY[0x189603F18]);
        objc_msgSend(v9, "criterias", (void)v14);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v12 = (void *)[v10 initWithArray:v11 copyItems:1];

        [v3 addObjectsFromArray:v12];
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (BOOL)checkCriteriaBSSIDWithSample:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  [a3 networkDetails];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 connectedBss];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 bssid];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString isEqualToString:](self->_lastSampleBssid, "isEqualToString:", v6))
  {
    char v7 = 0;
  }

  else
  {
    uint64_t v22 = v6;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v8 = self->_triggerCriteriaFilterList;
    uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      char v7 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          [v13 criterias];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v24;
            do
            {
              for (uint64_t j = 0LL; j != v16; ++j)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                if ([v19 matched])
                {
                  [v19 currentSample];
                  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
                  [v19 setLastTriggered:v20];

                  char v7 = 1;
                }
              }

              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }

            while (v16);
          }
        }

        uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      }

      while (v10);
    }

    else
    {
      char v7 = 0;
    }

    uint64_t v6 = v22;
  }

  return v7 & 1;
}

- (id)evaluateCriteriaWithStopUponFirstMatch:(BOOL)a3
{
  BOOL v77 = a3;
  uint64_t v3 = self;
  uint64_t v102 = *MEMORY[0x1895F89C0];
  -[NSMutableArray lastObject](self->_samples, "lastObject");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 networkDetails];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 connectedBss];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 bssid];

  v78 = 0LL;
  v74 = v3;
  uint64_t v80 = v7;
  if (!-[NSMutableArray count](v3->_samples, "count"))
  {
LABEL_14:
    BOOL v8 = v77;
    goto LABEL_15;
  }

  BOOL v8 = v77;
  if (v7)
  {
    samples = v3->_samples;
    [MEMORY[0x1896079C8] predicateWithFormat:@"networkDetails.connectedBss.bssid == %@", v7];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filteredArrayUsingPredicate:](samples, "filteredArrayUsingPredicate:", v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = v11;
    unint64_t v12 = [v11 count];
    if (v12 >= _config_minSamples)
    {
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      uint64_t v13 = v3->_features;
      uint64_t v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v94,  v101,  16LL);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v95;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v95 != v16) {
              objc_enumerationMutation(v13);
            }
            __int128 v18 = *(void **)(*((void *)&v94 + 1) + 8 * i);
            [v18 median];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              [v18 fieldName];
              __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[WiFiUsageLQMRollingWindow medianIntegerValueForField:ScaledByDuration:OnSamples:]( WiFiUsageLQMRollingWindow,  "medianIntegerValueForField:ScaledByDuration:OnSamples:",  v20,  [v18 isPerSecond],  v78);
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 setMedian:v21];
            }
          }

          uint64_t v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v94,  v101,  16LL);
        }

        while (v15);
      }

      uint64_t v3 = v74;
      goto LABEL_14;
    }
  }

- (BOOL)configureDataTriggeredCriteria
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (!_config_criteriaList) {
    return 0;
  }
  -[NSMutableArray removeAllObjects](self->_triggerCriteriaFilterList, "removeAllObjects");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = (id)_config_criteriaList;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v9 = v8;
          uint64_t v10 = objc_alloc(&OBJC_CLASS___WiFiUsageLQMTriggerCriteriaFilter);
          +[WiFiUsageLQMUserSample allLQMProperties](&OBJC_CLASS___WiFiUsageLQMUserSample, "allLQMProperties");
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v12 = -[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]( v10,  "initWith:forFields:andFeatures:",  v9,  v11,  self->_features);

          BOOL v13 = v12 == 0LL;
          if (v12) {
            -[NSMutableArray addObject:](self->_triggerCriteriaFilterList, "addObject:", v12);
          }
        }

        else
        {
          NSLog( @"%s: DataTriggered criteria has wrong format",  "-[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria]");
          BOOL v13 = 1;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v5);

    if (v13) {
      uint64_t v14 = @"(with errors)";
    }
    else {
      uint64_t v14 = &stru_18A170410;
    }
  }

  else
  {

    LOBYTE(v13) = 0;
    uint64_t v14 = &stru_18A170410;
  }

  uint64_t v16 = (void *)NSString;
  -[WiFiUsageLQMRollingWindow getTriggerCriteriaList](self, "getTriggerCriteriaList");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 stringWithFormat:@"%s: DataTriggered criteria configured %@: %@", "-[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria]", v14, v17];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    id v19 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v18, "UTF8String"));
    uint64_t v20 = [v19 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v26 = v20;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  return !v13;
}

+ (id)getValue:(id)a3 ForField:(id)a4 ScaledByDuration:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [v7 numberForKeyPath:v8];
  }
  else {
    [v7 valueForKeyPath:v8];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && ([v7 duration] || !v5))
  {
    if (v5 && [v7 duration])
    {
      uint64_t v11 = (void *)MEMORY[0x189607968];
      [v9 doubleValue];
      uint64_t v13 = objc_msgSend(v11, "numberWithLong:", (uint64_t)(v12 / (double)(unint64_t)objc_msgSend(v7, "duration")));

      id v9 = (void *)v13;
    }

    id v10 = v9;
    id v9 = v10;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)maximumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v20;
  uint64_t v13 = 0x8000000000000000LL;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      [a1 getValue:*(void *)(*((void *)&v19 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = v15;
    }

    uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }

  while (v11);
  if (v13 != 0x8000000000000000LL)
  {
    [MEMORY[0x189607968] numberWithInteger:v13];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_12:
    uint64_t v17 = 0LL;
  }

  return v17;
}

+ (id)minimumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v20;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      [a1 getValue:*(void *)(*((void *)&v19 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = v15;
    }

    uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }

  while (v11);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x189607968] numberWithInteger:v13];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_12:
    uint64_t v17 = 0LL;
  }

  return v17;
}

+ (id)averageIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  unint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = *(void *)v21;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v9);
      }
      [a1 getValue:*(void *)(*((void *)&v20 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v16;
      if (v16)
      {
        ++v12;
        v13 += [v16 integerValue];
      }
    }

    uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }

  while (v11);
  if (v12)
  {
    [MEMORY[0x189607968] numberWithDouble:(double)v13 / (double)v12];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_12:
    __int128 v18 = 0LL;
  }

  return v18;
}

+ (id)medianIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x189603FA8] array];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend( a1,  "getValue:ForField:ScaledByDuration:",  *(void *)(*((void *)&v27 + 1) + 8 * i),  v8,  v6,  (void)v27);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16) {
          [v10 addObject:v16];
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v13);
  }

  unint64_t v17 = [v10 count];
  if (v17 >= _config_minSamples)
  {
    unint64_t v19 = v17;
    [v10 sortUsingSelector:sel_compare_];
    if ((v19 & 1) != 0)
    {
      uint64_t v25 = [v10 objectAtIndex:v19 >> 1];
    }

    else
    {
      [v10 objectAtIndex:(v19 - 1) >> 1];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 integerValue];

      [v10 objectAtIndex:v19 >> 1];
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v22 integerValue];

      uint64_t v24 = v23 + v21;
      if (v23 + v21 < 0 != __OFADD__(v23, v21)) {
        ++v24;
      }
      uint64_t v25 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", v24 >> 1, (void)v27);
    }

    __int128 v18 = (void *)v25;
  }

  else
  {
    __int128 v18 = 0LL;
  }

  return v18;
}

+ (id)sumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        [a1 getValue:*(void *)(*((void *)&v19 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = v15;
        if (v15) {
          v12 += [v15 integerValue];
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v11);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  [MEMORY[0x189607968] numberWithInteger:v12];
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)modeValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
    [v5 lastObject];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 value];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)modesValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(obj);
        }
        [a1 getValue:*(void *)(*((void *)&v39 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          [v10 objectForKey:v15];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v17 = v16;
          if (v16) {
            uint64_t v18 = [v16 unsignedIntegerValue] + 1;
          }
          else {
            uint64_t v18 = 1LL;
          }
          [MEMORY[0x189607968] numberWithUnsignedInteger:v18];
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 setObject:v19 forKey:v15];
        }
      }

      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v12);
  }

  uint64_t v33 = v8;

  [v10 keysSortedByValueUsingSelector:sel_compare_];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v21 = (void *)objc_opt_new();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      for (uint64_t j = 0LL; j != v24; ++j)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        __int128 v28 = objc_alloc(&OBJC_CLASS___WiFiUsageLQMModes);
        objc_msgSend(v10, "objectForKeyedSubscript:", v27, v33);
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v30 = -[WiFiUsageLQMModes initWithValue:andOccurrences:](v28, "initWithValue:andOccurrences:", v27, v29);
        [v21 addObject:v30];
      }

      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }

    while (v24);
  }

  [MEMORY[0x189603F18] arrayWithArray:v21];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)hasChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v5 = self->_samples;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    id v7 = 0LL;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "numberForKeyPath:", v4, (void)v13);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        id v7 = v11;
        if (v10 && ([v11 isEqual:v10] & 1) == 0)
        {

          LOBYTE(v6) = 1;
          goto LABEL_12;
        }

        ++v9;
        uint64_t v10 = v7;
      }

      while (v6 != v9);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }

    uint64_t v10 = v7;
LABEL_12:
  }

  return v6;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSDate)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void)setCreatedTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSMutableArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (NSMutableArray)triggerCriteriaFilterList
{
  return self->_triggerCriteriaFilterList;
}

- (void)setTriggerCriteriaFilterList:(id)a3
{
}

- (NSMutableSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (NSMutableArray)preceedingTriggers
{
  return self->_preceedingTriggers;
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
}

- (NSString)lastSampleBssid
{
  return self->_lastSampleBssid;
}

- (void)setLastSampleBssid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end