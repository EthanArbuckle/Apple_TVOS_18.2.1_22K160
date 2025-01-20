@interface UARPDynamicAssetCmapMapping
+ (BOOL)supportsSecureCoding;
+ (id)tag;
- (BOOL)appendCmapEvents:(id)a3;
- (BOOL)isEqualAppleModel:(id)a3;
- (UARPDynamicAssetCmapMapping)init;
- (UARPDynamicAssetCmapMapping)initWithCoder:(id)a3;
- (UARPDynamicAssetCmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4;
- (id)expandCrshDictionary:(id)a3;
- (id)findCmapEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetCmapMapping

- (UARPDynamicAssetCmapMapping)init
{
  return 0LL;
}

- (UARPDynamicAssetCmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
  log = self->_log;
  self->_log = v8;

  objc_storeStrong((id *)&self->_appleModelNumber, a4);
  id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    id v26 = v7;
    v27 = self;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", @"decoderId", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15) {
          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(v27->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.3();
          }
          goto LABEL_23;
        }

        uint64_t v16 = [v15 unsignedIntValue];
        [v14 objectForKeyedSubscript:@"SectionName"];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17) {
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(v27->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.2();
          }
          goto LABEL_22;
        }

        [v14 objectForKeyedSubscript:@"InputDictionary"];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18) {
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(v27->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.1();
          }
LABEL_21:

LABEL_22:
LABEL_23:

          v20 = obj;
          v24 = 0LL;
          id v7 = v26;
          self = v27;
          v21 = v29;
          goto LABEL_24;
        }

        v19 = -[UARPDynamicAssetCmapEvent initWithSectionName:decoderId:inputDictionary:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetCmapEvent),  "initWithSectionName:decoderId:inputDictionary:",  v17,  v16,  v18);
        [v29 addObject:v19];
      }

      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v7 = v26;
      self = v27;
      if (v11) {
        continue;
      }
      break;
    }
  }

  v20 = obj;

  v21 = v29;
  v22 = (NSArray *)[v29 copy];
  cmapEvents = self->_cmapEvents;
  self->_cmapEvents = v22;

  v24 = self;
LABEL_24:

  return v24;
}

- (UARPDynamicAssetCmapMapping)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCmapMapping;
  v5 = -[UARPDynamicAssetCmapMapping init](&v19, sel_init);
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleModelNumber"];
    appleModelNumber = v5->_appleModelNumber;
    v5->_appleModelNumber = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x189604010];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v22 count:2];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setWithArray:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"CmapEvents"];
    cmapEvents = v5->_cmapEvents;
    v5->_cmapEvents = (NSArray *)v13;

    v15 = v5->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v5->_appleModelNumber;
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_187DC0000, v15, OS_LOG_TYPE_INFO, "amn: %@", buf, 0xCu);
    }

    v17 = v5;
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
  [v5 encodeObject:self->_cmapEvents forKey:@"CmapEvents"];
}

- (BOOL)isEqualAppleModel:(id)a3
{
  return -[NSString isEqualToString:](self->_appleModelNumber, "isEqualToString:", a3);
}

- (id)findCmapEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_cmapEvents;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSection:", v4, (void)v14))
        {
          id v12 = v10;

          goto LABEL_13;
        }
      }

      uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCmapMapping findCmapEvent:].cold.1(log);
  }
  id v12 = 0LL;
LABEL_13:

  return v12;
}

- (BOOL)appendCmapEvents:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (void *)-[NSArray mutableCopy](self->_cmapEvents, "mutableCopy");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v6 = (NSArray *)v4;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v10 = @"SectionName";
    v28 = v5;
    id v26 = @"decoderId";
    while (2)
    {
      uint64_t v11 = 0LL;
      uint64_t v27 = v8;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        objc_msgSend(v12, "objectForKeyedSubscript:", v10, v26);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13) {
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.2();
          }
          goto LABEL_25;
        }

        -[UARPDynamicAssetCmapMapping findCmapEvent:](self, "findCmapEvent:", v13);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          [v12 objectForKeyedSubscript:@"InputDictionary"];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15) {
            goto LABEL_24;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.1();
            }
            goto LABEL_24;
          }

          [v12 objectForKeyedSubscript:v26];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16) {
            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCmapMapping appendCmapEvents:].cold.1();
            }
LABEL_23:

LABEL_24:
LABEL_25:

            BOOL v24 = 0;
            cmapEvents = v6;
            id v5 = v28;
            goto LABEL_26;
          }

          __int128 v17 = self;
          v18 = v10;
          uint64_t v19 = v9;
          v20 = v6;
          v21 = -[UARPDynamicAssetCmapEvent initWithSectionName:decoderId:inputDictionary:]( [UARPDynamicAssetCmapEvent alloc],  "initWithSectionName:decoderId:inputDictionary:",  v13,  [v16 unsignedIntValue],  v15);
          [v28 addObject:v21];

          uint64_t v6 = v20;
          uint64_t v9 = v19;
          uint64_t v10 = v18;
          self = v17;
          uint64_t v8 = v27;
        }

        ++v11;
      }

      while (v8 != v11);
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
      id v5 = v28;
      if (v8) {
        continue;
      }
      break;
    }
  }

  v22 = (NSArray *)[v5 copy];
  cmapEvents = self->_cmapEvents;
  self->_cmapEvents = v22;
  BOOL v24 = 1;
LABEL_26:

  return v24;
}

- (id)expandCrshDictionary:(id)a3
{
  v42[9] = *MEMORY[0x1895F89C0];
  id v28 = a3;
  id v4 = (void *)objc_opt_new();
  v41[0] = @"mailboxes";
  __int128 v30 = (void *)objc_opt_new();
  v42[0] = v30;
  v41[1] = @"panic";
  [MEMORY[0x189603FE8] null];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v29;
  v41[2] = @"crashlog-version";
  [MEMORY[0x189603FE8] null];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v26;
  v41[3] = @"exception";
  [MEMORY[0x189603FE8] null];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v5;
  v41[4] = @"uuid";
  [MEMORY[0x189603FE8] null];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v6;
  v41[5] = @"call-stack";
  [MEMORY[0x189603FE8] null];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v7;
  v41[6] = @"tasks";
  [MEMORY[0x189603FE8] null];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v8;
  v41[7] = @"registers";
  [MEMORY[0x189603FE8] null];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v9;
  v41[8] = @"scenario";
  [MEMORY[0x189603FE8] null];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = v4;
  [v4 setDictionary:v11];

  [v28 objectForKeyedSubscript:@"panic"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v4 setObject:v12 forKey:@"panic"];
  }
  [v28 objectForKeyedSubscript:@"crashlog-version"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v4 setObject:v13 forKey:@"crashlog-version"];
  }
  uint64_t v14 = [v28 objectForKeyedSubscript:@"exception"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v4 setObject:v14 forKey:@"exception"];
  }
  uint64_t v27 = (void *)v14;
  [v28 objectForKeyedSubscript:@"sections"];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    uint64_t v19 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v21 objectForKeyedSubscript:@"section-name"];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[UARPDynamicAssetCmapMapping findCmapEvent:](self, "findCmapEvent:", v22);
        BOOL v24 = v23;
        if (v23)
        {
          if (([v23 decodeCrash:v21 inDictionary:v31] & 1) == 0
            && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            -[UARPDynamicAssetCmapMapping expandCrshDictionary:].cold.2(v36, (uint64_t)v22, &v37);
          }
        }

        else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[UARPDynamicAssetCmapMapping expandCrshDictionary:].cold.1(v38, (uint64_t)v22, &v39);
        }
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v17);
  }

  return v31;
}

+ (id)tag
{
  return -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"CMAP");
}

- (void).cxx_destruct
{
}

- (void)initWithEvents:appleModelNumber:.cold.1()
{
}

- (void)initWithEvents:appleModelNumber:.cold.2()
{
}

- (void)initWithEvents:appleModelNumber:.cold.3()
{
}

- (void)findCmapEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_187DC0000, log, OS_LOG_TYPE_ERROR, "Unable to find matching CMAP Event.", v1, 2u);
}

- (void)appendCmapEvents:.cold.1()
{
}

- (void)expandCrshDictionary:(void *)a3 .cold.1(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, MEMORY[0x1895F8DA0], (uint64_t)a3, "No Cmap Event for SectionName:%@", a1);
}

- (void)expandCrshDictionary:(void *)a3 .cold.2(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, MEMORY[0x1895F8DA0], (uint64_t)a3, "Unable to add section:%@", a1);
}

@end