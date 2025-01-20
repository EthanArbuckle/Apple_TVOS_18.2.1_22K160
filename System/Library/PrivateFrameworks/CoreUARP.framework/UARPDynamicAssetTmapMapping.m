@interface UARPDynamicAssetTmapMapping
+ (BOOL)supportsSecureCoding;
+ (id)tag;
- (BOOL)appendTmapEvents:(id)a3 endian:(id)a4;
- (BOOL)isEqualAppleModel:(id)a3;
- (UARPDynamicAssetTmapMapping)init;
- (UARPDynamicAssetTmapMapping)initWithCoder:(id)a3;
- (UARPDynamicAssetTmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4 endian:(id)a5;
- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4;
- (id)findTmapEvent:(unint64_t)a3;
- (void)addSysdiagnoseMetrics:(id)a3 coreAnalyticsEvent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetTmapMapping

- (UARPDynamicAssetTmapMapping)init
{
  return 0LL;
}

- (UARPDynamicAssetTmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4 endian:(id)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = self->_log;
  self->_log = v11;

  v13 = (NSString *)[v9 copy];
  appleModelNumber = self->_appleModelNumber;
  self->_appleModelNumber = v13;

  id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    id v35 = v9;
    v36 = self;
    while (2)
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKeyedSubscript:", @"EventID", v35);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22) {
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = v36->_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetTmapMapping initWithEvents:appleModelNumber:endian:].cold.1( (uint64_t)v22,  v27,  v28,  v29,  v30,  v31,  v32,  v33);
          }
LABEL_13:

          v26 = 0LL;
          id v9 = v35;
          self = v36;
          goto LABEL_14;
        }

        v23 = -[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:]( [UARPDynamicAssetTmapEvent alloc],  "initWithEventFields:eventID:endian:",  v21,  [v22 unsignedIntValue],  v10);
        [v15 addObject:v23];
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
      id v9 = v35;
      self = v36;
      if (v18) {
        continue;
      }
      break;
    }
  }

  v24 = (NSArray *)[v15 copy];
  tmapEvents = self->_tmapEvents;
  self->_tmapEvents = v24;

  v26 = self;
LABEL_14:

  return v26;
}

- (UARPDynamicAssetTmapMapping)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetTmapMapping;
  v5 = -[UARPDynamicAssetTmapMapping init](&v17, sel_init);
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleModelNumber"];
    appleModelNumber = v5->_appleModelNumber;
    v5->_appleModelNumber = (NSString *)v8;

    id v10 = (void *)MEMORY[0x189604010];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v18 count:2];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setWithArray:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Events"];
    tmapEvents = v5->_tmapEvents;
    v5->_tmapEvents = (NSArray *)v13;

    id v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  appleModelNumber = self->_appleModelNumber;
  id v5 = a3;
  [v5 encodeObject:appleModelNumber forKey:@"AppleModelNumber"];
  [v5 encodeObject:self->_tmapEvents forKey:@"Events"];
}

- (BOOL)isEqualAppleModel:(id)a3
{
  return -[NSString isEqualToString:](self->_appleModelNumber, "isEqualToString:", a3);
}

- (id)findTmapEvent:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_tmapEvents;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "eventID", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4
{
  id v6 = a3;
  -[UARPDynamicAssetTmapMapping findTmapEvent:](self, "findTmapEvent:", a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 expandMticData:v6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPDynamicAssetTmapMapping addSysdiagnoseMetrics:coreAnalyticsEvent:]( self,  "addSysdiagnoseMetrics:coreAnalyticsEvent:",  v8,  v9);
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetTmapMapping expandMticData:withEventID:].cold.1(a4, log);
    }
    id v9 = 0LL;
  }

  return v9;
}

- (void)addSysdiagnoseMetrics:(id)a3 coreAnalyticsEvent:(id)a4
{
  v25[3] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  [a3 eventName];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)NSString;
  UARPStringSysdiagnoseDirectoryFilePath();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@/%@", v9, v7];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  UARPUtilsCreateTemporaryFolder(v10);
  v25[0] = self->_appleModelNumber;
  UARPTimestamp();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  v25[2] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v25 count:3];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

  UARPUniqueFilePathWithIdentifierComponents(v10, v12, @".log");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] fileURLWithPath:v13 isDirectory:0];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:v6 options:0 error:&v24];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

  id v16 = v24;
  if (v15)
  {
    UARPWriteFile(v15, v14);
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetTmapMapping addSysdiagnoseMetrics:coreAnalyticsEvent:].cold.1( (uint64_t)v16,  log,  v18,  v19,  v20,  v21,  v22,  v23);
    }
  }
}

- (BOOL)appendTmapEvents:(id)a3 endian:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v30 = a4;
  uint64_t v7 = (void *)-[NSArray mutableCopy](self->_tmapEvents, "mutableCopy");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v8 = (NSArray *)v6;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    uint64_t v29 = v7;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", @"EventID", v29);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14) {
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetTmapMapping initWithEvents:appleModelNumber:endian:].cold.1( (uint64_t)v14,  log,  v22,  v23,  v24,  v25,  v26,  v27);
          }
LABEL_15:

          BOOL v20 = 0;
          tmapEvents = v8;
          uint64_t v7 = v29;
          goto LABEL_16;
        }

        uint64_t v15 = [v14 unsignedIntValue];
        -[UARPDynamicAssetTmapMapping findTmapEvent:](self, "findTmapEvent:", v15);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          uint64_t v17 = -[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetTmapEvent),  "initWithEventFields:eventID:endian:",  v13,  v15,  v30);
          [v29 addObject:v17];
        }
      }

      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
      uint64_t v7 = v29;
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = (NSArray *)[v7 copy];
  tmapEvents = self->_tmapEvents;
  self->_tmapEvents = v18;
  BOOL v20 = 1;
LABEL_16:

  return v20;
}

+ (id)tag
{
  return -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"TMAP");
}

- (void).cxx_destruct
{
}

- (void)initWithEvents:(uint64_t)a3 appleModelNumber:(uint64_t)a4 endian:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)expandMticData:(int)a1 withEventID:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_187DC0000, a2, OS_LOG_TYPE_ERROR, "No Tmap Event for Event Index: %u", (uint8_t *)v2, 8u);
}

- (void)addSysdiagnoseMetrics:(uint64_t)a3 coreAnalyticsEvent:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end