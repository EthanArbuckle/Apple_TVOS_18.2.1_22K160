@interface PPSCadence
+ (BOOL)isValidCadenceJSON:(id)a3;
+ (PPSCadence)cadenceWithJSONObject:(id)a3;
+ (PPSCadence)cadenceWithProto:(id)a3;
+ (id)cadenceEventSBC;
+ (id)cadenceEventSBC_EventScreenStateChange;
+ (id)cadenceEventXPCWithFrequency:(int)a3;
+ (id)cadenceInit;
+ (id)cadenceInit_EventSBC;
- (NSArray)cadenceTuples;
- (PPSCadence)initWithCadenceTuples:(id)a3;
- (id)json;
- (id)proto;
@end

@implementation PPSCadence

- (id)json
{
  v27[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  v4 = -[PPSCadence cadenceTuples](self, "cadenceTuples");
  uint64_t v5 = [v4 count];

  unint64_t v6 = 0x189603000uLL;
  if (v5)
  {
    unint64_t v7 = 0LL;
    v23 = v3;
    do
    {
      v26[0] = @"type";
      v8 = (void *)MEMORY[0x189607968];
      v9 = -[PPSCadence cadenceTuples](self, "cadenceTuples", v23);
      [v9 objectAtIndexedSubscript:v7];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = @"value";
      v27[0] = v11;
      v12 = (void *)MEMORY[0x189607968];
      v13 = -[PPSCadence cadenceTuples](self, "cadenceTuples");
      [v13 objectAtIndexedSubscript:v7];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v14, "value"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v15;
      [*(id *)(v6 + 3944) dictionaryWithObjects:v27 forKeys:v26 count:2];
      v16 = self;
      unint64_t v17 = v6;
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v23;
      [v23 addObject:v18];

      unint64_t v6 = v17;
      self = v16;
      ++v7;
      v19 = -[PPSCadence cadenceTuples](v16, "cadenceTuples");
      unint64_t v20 = [v19 count];
    }

    while (v20 > v7);
  }

  v24 = @"cadences";
  v25 = v3;
  [*(id *)(v6 + 3944) dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (PPSCadence)cadenceWithJSONObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (+[PPSCadence isValidCadenceJSON:](&OBJC_CLASS___PPSCadence, "isValidCadenceJSON:", v3))
  {
    v4 = (void *)objc_opt_new();
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", @"cadences", 0);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[PPSCadenceTuple cadenceTupleWithJSONObject:]( &OBJC_CLASS___PPSCadenceTuple,  "cadenceTupleWithJSONObject:",  *(void *)(*((void *)&v15 + 1) + 8 * v9));
          if (!v10)
          {
            PPSStorageLog();
            v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              +[PPSCadence(JSON) cadenceWithJSONObject:].cold.1(v3);
            }

            v12 = 0LL;
            goto LABEL_15;
          }

          v11 = (void *)v10;
          [v4 addObject:v10];

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v12 = -[PPSCadence initWithCadenceTuples:](objc_alloc(&OBJC_CLASS___PPSCadence), "initWithCadenceTuples:", v4);
LABEL_15:
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

+ (BOOL)isValidCadenceJSON:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSCadence(JSON) isValidCadenceJSON:].cold.2();
    }
    goto LABEL_8;
  }

  [v3 objectForKeyedSubscript:@"cadences"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSCadence(JSON) isValidCadenceJSON:].cold.1(v3);
    }
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }

  BOOL v6 = 1;
LABEL_9:

  return v6;
}

+ (PPSCadence)cadenceWithProto:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 cadences];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (PPSCadence *)[v4 count];

  if (v5)
  {
    BOOL v6 = (void *)objc_opt_new();
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    objc_msgSend(v3, "cadences", 0);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = -[PPSCadenceTuple initWithCadenceType:value:]( [PPSCadenceTuple alloc],  "initWithCadenceType:value:",  [*(id *)(*((void *)&v14 + 1) + 8 * v11) type],  objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "value"));
          [v6 addObject:v12];

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }

    uint64_t v5 = -[PPSCadence initWithCadenceTuples:](objc_alloc(&OBJC_CLASS___PPSCadence), "initWithCadenceTuples:", v6);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v5;
}

- (id)proto
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(&OBJC_CLASS___PPSPBCadence);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = -[PPSCadence cadenceTuples](self, "cadenceTuples", 0LL);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        uint64_t v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setType:", objc_msgSend(v9, "type"));
        objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
        -[PPSPBCadence addCadences:](v3, "addCadences:", v10);

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return v3;
}

- (PPSCadence)initWithCadenceTuples:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PPSCadence;
    uint64_t v6 = -[PPSCadence init](&v12, sel_init);
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x189603F18]) initWithArray:v5];
      cadenceTuples = v6->_cadenceTuples;
      v6->_cadenceTuples = (NSArray *)v7;
    }

    self = v6;
    uint64_t v9 = self;
  }

  else
  {
    PPSMetricLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PPSCadence initWithCadenceTuples:].cold.1(v10);
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)cadenceEventSBC
{
  if (cadenceEventSBC_onceToken != -1) {
    dispatch_once(&cadenceEventSBC_onceToken, &__block_literal_global_7);
  }
  return (id)cadenceEventSBC__cadences;
}

void __29__PPSCadence_cadenceEventSBC__block_invoke()
{
  v5[1] = *MEMORY[0x1895F89C0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  1LL,  0LL);
  if (v0)
  {
    v1 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v5[0] = v0;
    [MEMORY[0x189603F18] arrayWithObjects:v5 count:1];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = -[PPSCadence initWithCadenceTuples:](v1, "initWithCadenceTuples:", v2);
    id v4 = (void *)cadenceEventSBC__cadences;
    cadenceEventSBC__cadences = v3;
  }
}

+ (id)cadenceInit
{
  if (cadenceInit_onceToken != -1) {
    dispatch_once(&cadenceInit_onceToken, &__block_literal_global_16);
  }
  return (id)cadenceInit__cadences;
}

void __25__PPSCadence_cadenceInit__block_invoke()
{
  v5[1] = *MEMORY[0x1895F89C0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  4LL,  0LL);
  if (v0)
  {
    v1 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v5[0] = v0;
    [MEMORY[0x189603F18] arrayWithObjects:v5 count:1];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = -[PPSCadence initWithCadenceTuples:](v1, "initWithCadenceTuples:", v2);
    id v4 = (void *)cadenceInit__cadences;
    cadenceInit__cadences = v3;
  }
}

+ (id)cadenceInit_EventSBC
{
  if (cadenceInit_EventSBC_onceToken != -1) {
    dispatch_once(&cadenceInit_EventSBC_onceToken, &__block_literal_global_17_0);
  }
  return (id)cadenceInit_EventSBC__cadences;
}

void __34__PPSCadence_cadenceInit_EventSBC__block_invoke()
{
  v8[2] = *MEMORY[0x1895F89C0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  4LL,  0LL);
  v1 = (void *)cadenceInit_EventSBC__eventInit;
  cadenceInit_EventSBC__eventInit = (uint64_t)v0;

  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  1LL,  0LL);
  uint64_t v3 = (void *)cadenceInit_EventSBC__eventSBC;
  cadenceInit_EventSBC__eventSBC = (uint64_t)v2;

  if (cadenceInit_EventSBC__eventInit)
  {
    if (cadenceInit_EventSBC__eventSBC)
    {
      id v4 = objc_alloc(&OBJC_CLASS___PPSCadence);
      v8[0] = cadenceInit_EventSBC__eventInit;
      v8[1] = cadenceInit_EventSBC__eventSBC;
      [MEMORY[0x189603F18] arrayWithObjects:v8 count:2];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = -[PPSCadence initWithCadenceTuples:](v4, "initWithCadenceTuples:", v5);
      uint64_t v7 = (void *)cadenceInit_EventSBC__cadences;
      cadenceInit_EventSBC__cadences = v6;
    }
  }

+ (id)cadenceEventXPCWithFrequency:(int)a3
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__PPSCadence_cadenceEventXPCWithFrequency___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v5 = a3;
  if (cadenceEventXPCWithFrequency__onceToken != -1) {
    dispatch_once(&cadenceEventXPCWithFrequency__onceToken, block);
  }
  return (id)cadenceEventXPCWithFrequency___cadences;
}

void __43__PPSCadence_cadenceEventXPCWithFrequency___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  v1 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  5LL,  *(int *)(a1 + 32));
  if (v1)
  {
    v2 = objc_alloc(&OBJC_CLASS___PPSCadence);
    v6[0] = v1;
    [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = -[PPSCadence initWithCadenceTuples:](v2, "initWithCadenceTuples:", v3);
    int v5 = (void *)cadenceEventXPCWithFrequency___cadences;
    cadenceEventXPCWithFrequency___cadences = v4;
  }
}

+ (id)cadenceEventSBC_EventScreenStateChange
{
  if (cadenceEventSBC_EventScreenStateChange_onceToken != -1) {
    dispatch_once(&cadenceEventSBC_EventScreenStateChange_onceToken, &__block_literal_global_19);
  }
  return (id)cadenceEventSBC_EventScreenStateChange__cadences;
}

void __52__PPSCadence_cadenceEventSBC_EventScreenStateChange__block_invoke()
{
  v8[2] = *MEMORY[0x1895F89C0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  1LL,  0LL);
  v1 = (void *)cadenceEventSBC_EventScreenStateChange__eventSBC;
  cadenceEventSBC_EventScreenStateChange__eventSBC = (uint64_t)v0;

  v2 = -[PPSCadenceTuple initWithCadenceType:value:]( objc_alloc(&OBJC_CLASS___PPSCadenceTuple),  "initWithCadenceType:value:",  3LL,  2LL);
  uint64_t v3 = (void *)cadenceEventSBC_EventScreenStateChange__eventScreenStateChange;
  cadenceEventSBC_EventScreenStateChange__eventScreenStateChange = (uint64_t)v2;

  if (cadenceEventSBC_EventScreenStateChange__eventSBC)
  {
    if (cadenceEventSBC_EventScreenStateChange__eventScreenStateChange)
    {
      uint64_t v4 = objc_alloc(&OBJC_CLASS___PPSCadence);
      v8[0] = cadenceEventSBC_EventScreenStateChange__eventSBC;
      v8[1] = cadenceEventSBC_EventScreenStateChange__eventScreenStateChange;
      [MEMORY[0x189603F18] arrayWithObjects:v8 count:2];
      int v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = -[PPSCadence initWithCadenceTuples:](v4, "initWithCadenceTuples:", v5);
      uint64_t v7 = (void *)cadenceEventSBC_EventScreenStateChange__cadences;
      cadenceEventSBC_EventScreenStateChange__cadences = v6;
    }
  }

- (NSArray)cadenceTuples
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithCadenceTuples:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_188807000, log, OS_LOG_TYPE_ERROR, "Cadence Tuples empty or nil", v1, 2u);
}

@end