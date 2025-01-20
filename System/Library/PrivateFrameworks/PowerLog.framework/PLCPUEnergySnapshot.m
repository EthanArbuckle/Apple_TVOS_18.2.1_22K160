@interface PLCPUEnergySnapshot
+ (NSMutableDictionary)coalitionIDToCoalitionNameMapping;
+ (NSMutableDictionary)identifierToAccountingName;
+ (NSMutableDictionary)identifierToCoalitionID;
+ (void)setCoalitionIDToCoalitionNameMapping:(id)a3;
+ (void)setIdentifierToAccountingName:(id)a3;
+ (void)setIdentifierToCoalitionID:(id)a3;
- (BOOL)isValid;
- (BOOL)snapshotCPUEnergy:(id)a3;
- (NSMutableDictionary)mockData;
- (PLCPUEnergySnapshot)initWithIdentifier:(id)a3 andMockData:(id)a4;
- (double)computeEnergyDiff:(id)a3;
- (double)computeEnergyDiffUntilNow:(id)a3 andAdjustSnapshotToNow:(BOOL)a4;
- (id)description;
- (id)getCoalitionIDForIdentifier:(id)a3;
- (id)searchCoalitionsCacheForID:(id)a3;
- (unint64_t)cpuEnergy;
- (unint64_t)cpuEnergyBilledToMe;
- (unint64_t)cpuEnergyBilledToOthers;
- (void)refreshCoalitionIDMapping;
- (void)setCpuEnergy:(unint64_t)a3;
- (void)setCpuEnergyBilledToMe:(unint64_t)a3;
- (void)setCpuEnergyBilledToOthers:(unint64_t)a3;
- (void)setMockData:(id)a3;
@end

@implementation PLCPUEnergySnapshot

- (PLCPUEnergySnapshot)initWithIdentifier:(id)a3 andMockData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PLCPUEnergySnapshot;
  v8 = -[PLCPUEnergySnapshot init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PLCPUEnergySnapshot setMockData:](v8, "setMockData:", v7);
    -[PLCPUEnergySnapshot snapshotCPUEnergy:](v9, "snapshotCPUEnergy:", v6);
  }

  return v9;
}

- (double)computeEnergyDiffUntilNow:(id)a3 andAdjustSnapshotToNow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___PLCPUEnergySnapshot);
  v8 = -[PLCPUEnergySnapshot mockData](self, "mockData");
  v9 = -[PLCPUEnergySnapshot initWithIdentifier:andMockData:](v7, "initWithIdentifier:andMockData:", v6, v8);

  -[PLCPUEnergySnapshot computeEnergyDiff:](v9, "computeEnergyDiff:", self);
  double v11 = v10;
  if (v4)
  {
    PLLogDiscretionaryEnergyMonitor();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLCPUEnergySnapshot computeEnergyDiffUntilNow:andAdjustSnapshotToNow:].cold.2();
    }

    -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", -[PLCPUEnergySnapshot cpuEnergy](v9, "cpuEnergy"));
    -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:]( self,  "setCpuEnergyBilledToMe:",  -[PLCPUEnergySnapshot cpuEnergyBilledToMe](v9, "cpuEnergyBilledToMe"));
    -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:]( self,  "setCpuEnergyBilledToOthers:",  -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](v9, "cpuEnergyBilledToOthers"));
    PLLogDiscretionaryEnergyMonitor();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLCPUEnergySnapshot computeEnergyDiffUntilNow:andAdjustSnapshotToNow:].cold.1();
    }
  }

  return v11;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLCPUEnergySnapshot computeEnergyDiff:].cold.1();
  }

  double v6 = 0.0;
  if (-[PLCPUEnergySnapshot isValid](self, "isValid"))
  {
    if ([v4 isValid])
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy") - objc_msgSend(v4, "cpuEnergy"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 doubleValue];
      double v9 = v8;

      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe")
      - [v4 cpuEnergyBilledToMe]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 doubleValue];
      double v12 = v11;

      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers")
      - [v4 cpuEnergyBilledToOthers]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 doubleValue];
      double v15 = v14;

      if (v9 >= 0.0 && v12 >= 0.0 && v15 >= 0.0)
      {
        if ((v9 + v12 - v15) / 3600000000.0 >= 0.0) {
          double v6 = (v9 + v12 - v15) / 3600000000.0;
        }
        else {
          double v6 = 0.0;
        }
      }
    }
  }

  return v6;
}

- (BOOL)isValid
{
  return -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy")
      || -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe")
      || -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers") != 0;
}

- (BOOL)snapshotCPUEnergy:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[PLCPUEnergySnapshot mockData](self, "mockData");
  [v5 objectForKeyedSubscript:@"CPUCoalitionsMock"];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:](self, "getCoalitionIDForIdentifier:", v4);
    double v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v11 unsignedLongLongValue])
    {
      [v11 longLongValue];
      PLLogDiscretionaryEnergyMonitor();
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLCPUEnergySnapshot snapshotCPUEnergy:].cold.2();
      }

      double v15 = malloc(0x160uLL);
      int v16 = coalition_info_resource_usage();
      BOOL v12 = v16 == 0;
      if (v16)
      {
        if (!v15)
        {
LABEL_14:
          BOOL v12 = 0;
          goto LABEL_17;
        }
      }

      else
      {
        -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", v15[11]);
        -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:](self, "setCpuEnergyBilledToMe:", v15[20]);
        -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:](self, "setCpuEnergyBilledToOthers:", v15[21]);
      }

      free(v15);
      goto LABEL_17;
    }

    PLLogDiscretionaryEnergyMonitor();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PLCPUEnergySnapshot snapshotCPUEnergy:].cold.1();
    }

    goto LABEL_14;
  }

  PLLogDiscretionaryEnergyMonitor();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl( &dword_186654000,  v8,  OS_LOG_TYPE_INFO,  "Reading mock coalitions data for identifier=%@, mockDataForIdentifier=%@",  (uint8_t *)&v19,  0x16u);
  }

  [v7 objectForKeyedSubscript:@"cpuEnergy"];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", [v9 longLongValue]);

  [v7 objectForKeyedSubscript:@"cpuEnergyBilledToMe"];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:](self, "setCpuEnergyBilledToMe:", [v10 longLongValue]);

  [v7 objectForKeyedSubscript:@"cpuEnergyBilledToOthers"];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:]( self,  "setCpuEnergyBilledToOthers:",  [v11 longLongValue]);
  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"cpuEnergy=%llu, cpuEnergyBilledToMe=%llu, cpuEnergyBilledToOthers=%llu",  -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy"),  -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe"),  -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers"));
}

- (void)refreshCoalitionIDMapping
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = +[PLCPUEnergySnapshot coalitionIDToCoalitionNameMapping]( &OBJC_CLASS___PLCPUEnergySnapshot,  "coalitionIDToCoalitionNameMapping");
  [v2 count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, a1, v3, "After refresh coalitionIDToCoalitionNameMapping count=%lu", v4);

  OUTLINED_FUNCTION_8();
}

- (id)getCoalitionIDForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCPUEnergySnapshot identifierToCoalitionID](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToCoalitionID");
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLLogDiscretionaryEnergyMonitor();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:].cold.2((uint64_t)v4, v8);
    }

    +[PLCPUEnergySnapshot identifierToCoalitionID](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToCoalitionID");
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:v4];
    double v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[PLCPUEnergySnapshot searchCoalitionsCacheForID:](self, "searchCoalitionsCacheForID:", v4);
    double v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (![v11 unsignedLongLongValue])
    {
      PLLogDiscretionaryEnergyMonitor();
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl( &dword_186654000,  v12,  OS_LOG_TYPE_INFO,  "coalitionID not found, refreshing coalition mapping and searching again for identifier=%@",  (uint8_t *)&v17,  0xCu);
      }

      -[PLCPUEnergySnapshot refreshCoalitionIDMapping](self, "refreshCoalitionIDMapping");
      uint64_t v13 = -[PLCPUEnergySnapshot searchCoalitionsCacheForID:](self, "searchCoalitionsCacheForID:", v4);

      double v11 = (void *)v13;
    }

    if (![v11 unsignedLongLongValue])
    {
      PLLogDiscretionaryEnergyMonitor();
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:].cold.1();
      }
    }

    if ([v11 unsignedLongLongValue])
    {
      +[PLCPUEnergySnapshot identifierToCoalitionID](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToCoalitionID");
      double v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setObject:v11 forKeyedSubscript:v4];
    }

    id v5 = v11;
    double v10 = v5;
  }

  return v10;
}

- (id)searchCoalitionsCacheForID:(id)a3
{
  id v3 = a3;
  PLLogDiscretionaryEnergyMonitor();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLCPUEnergySnapshot searchCoalitionsCacheForID:].cold.1();
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  double v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCPUEnergySnapshot coalitionIDToCoalitionNameMapping]( &OBJC_CLASS___PLCPUEnergySnapshot,  "coalitionIDToCoalitionNameMapping");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke;
  v9[3] = &unk_189E9E620;
  id v6 = v3;
  id v10 = v6;
  double v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  [v9 objectAtIndexedSubscript:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectAtIndexedSubscript:1];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v10 isEqualToString:&stru_189E9F260])
  {
    if ((unint64_t)[v11 length] > 9)
    {
      [v11 substringFromIndex:10];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v12 = v11;
    }
  }

  else
  {
    id v12 = v10;
  }

  uint64_t v13 = v12;
  uint64_t v14 = (void *)(a1 + 32);
  if (([v12 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
    || ([v10 isEqualToString:*v14] & 1) != 0
    || [v11 isEqualToString:*v14])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    if (([v13 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
    {
      PLLogDiscretionaryEnergyMonitor();
      double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke_cold_1();
      }

      +[PLCPUEnergySnapshot identifierToAccountingName](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToAccountingName");
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 objectForKeyedSubscript:*v14];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        +[PLCPUEnergySnapshot identifierToAccountingName]( &OBJC_CLASS___PLCPUEnergySnapshot,  "identifierToAccountingName");
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 setObject:v13 forKeyedSubscript:*v14];

        PLLogDiscretionaryEnergyMonitor();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          +[PLCPUEnergySnapshot identifierToAccountingName]( &OBJC_CLASS___PLCPUEnergySnapshot,  "identifierToAccountingName");
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v21 = 138412290;
          v22 = v20;
          _os_log_impl(&dword_186654000, v19, OS_LOG_TYPE_INFO, "identifierToAccountingName=%@", (uint8_t *)&v21, 0xCu);
        }
      }
    }

    *a4 = 1;
  }
}

+ (NSMutableDictionary)identifierToCoalitionID
{
  v2 = (void *)_identifierToCoalitionID;
  if (!_identifierToCoalitionID)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v4 = (void *)_identifierToCoalitionID;
    _identifierToCoalitionID = (uint64_t)v3;

    v2 = (void *)_identifierToCoalitionID;
  }

  return (NSMutableDictionary *)v2;
}

+ (void)setIdentifierToCoalitionID:(id)a3
{
  if ((id)_identifierToCoalitionID != a3)
  {
    uint64_t v3 = [a3 mutableCopy];
    id v4 = (void *)_identifierToCoalitionID;
    _identifierToCoalitionID = v3;
  }

+ (NSMutableDictionary)coalitionIDToCoalitionNameMapping
{
  v2 = (void *)_coalitionIDToCoalitionNameMapping;
  if (!_coalitionIDToCoalitionNameMapping)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v4 = (void *)_coalitionIDToCoalitionNameMapping;
    _coalitionIDToCoalitionNameMapping = (uint64_t)v3;

    v2 = (void *)_coalitionIDToCoalitionNameMapping;
  }

  return (NSMutableDictionary *)v2;
}

+ (void)setCoalitionIDToCoalitionNameMapping:(id)a3
{
  if ((id)_coalitionIDToCoalitionNameMapping != a3)
  {
    uint64_t v3 = [a3 mutableCopy];
    id v4 = (void *)_coalitionIDToCoalitionNameMapping;
    _coalitionIDToCoalitionNameMapping = v3;
  }

+ (NSMutableDictionary)identifierToAccountingName
{
  v2 = (void *)_identifierToAccountingName;
  if (!_identifierToAccountingName)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v4 = (void *)_identifierToAccountingName;
    _identifierToAccountingName = (uint64_t)v3;

    v2 = (void *)_identifierToAccountingName;
  }

  return (NSMutableDictionary *)v2;
}

+ (void)setIdentifierToAccountingName:(id)a3
{
  if ((id)_identifierToAccountingName != a3)
  {
    uint64_t v3 = [a3 mutableCopy];
    id v4 = (void *)_identifierToAccountingName;
    _identifierToAccountingName = v3;
  }

- (unint64_t)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(unint64_t)a3
{
  self->_cpuEnergy = a3;
}

- (unint64_t)cpuEnergyBilledToMe
{
  return self->_cpuEnergyBilledToMe;
}

- (void)setCpuEnergyBilledToMe:(unint64_t)a3
{
  self->_cpuEnergyBilledToMe = a3;
}

- (unint64_t)cpuEnergyBilledToOthers
{
  return self->_cpuEnergyBilledToOthers;
}

- (void)setCpuEnergyBilledToOthers:(unint64_t)a3
{
  self->_cpuEnergyBilledToOthers = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMockData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)computeEnergyDiffUntilNow:andAdjustSnapshotToNow:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "after adjusting snapshot self=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiffUntilNow:andAdjustSnapshotToNow:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "adjusting snapshot self=%@ to now", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiff:.cold.1()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "computing energy diff between self=%@ and otherSnapshot=%@");
  OUTLINED_FUNCTION_1();
}

- (void)snapshotCPUEnergy:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_186654000, v0, v1, "coalitionID not found, unable to snapshot identifer=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)snapshotCPUEnergy:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "Getting cpu energy from coalitions snapshot for  coalitionID=%llu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getCoalitionIDForIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_186654000, v0, v1, "coalitionID not found after refresh, for identifer=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getCoalitionIDForIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  +[PLCPUEnergySnapshot identifierToCoalitionID](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToCoalitionID");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6( &dword_186654000,  a2,  v4,  "coalitionID found in identifierToCoalitionID for identifier=%@, identifierToCoalitionID=%@",  v5);

  OUTLINED_FUNCTION_11();
}

- (void)searchCoalitionsCacheForID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "searching cache for coalitionID for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13( &dword_186654000,  v0,  (uint64_t)v0,  "identifier received is not equal to accountingIdentifier: identifier=%@, accountingIdentifier=%@",  v1);
  OUTLINED_FUNCTION_1();
}

@end