@interface SecLaunchSequence
- (BOOL)firstLaunch;
- (BOOL)launched;
- (NSBlockOperation)launchOperation;
- (NSMutableDictionary)attributes;
- (NSMutableDictionary)dependantLaunches;
- (NSMutableDictionary)events;
- (NSString)name;
- (SecLaunchSequence)initWithRocketName:(id)a3;
- (id)eventsByTime;
- (id)eventsRelativeTime;
- (id)metricsReport;
- (void)addAttribute:(id)a3 value:(id)a4;
- (void)addDependantLaunch:(id)a3 child:(id)a4;
- (void)addEvent:(id)a3;
- (void)launch;
- (void)setAttributes:(id)a3;
- (void)setDependantLaunches:(id)a3;
- (void)setEvents:(id)a3;
- (void)setFirstLaunch:(BOOL)a3;
- (void)setLaunchOperation:(id)a3;
- (void)setLaunched:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation SecLaunchSequence

- (SecLaunchSequence)initWithRocketName:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SecLaunchSequence;
  v6 = -[SecLaunchSequence init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x189603FC8] dictionary];
    events = v7->_events;
    v7->_events = (NSMutableDictionary *)v8;

    v10 = -[SecLaunchEvent initWithName:](objc_alloc(&OBJC_CLASS___SecLaunchEvent), "initWithName:", @"started");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7->_events,  "setObject:forKeyedSubscript:",  v10,  @"started");

    v11 = (NSBlockOperation *)objc_alloc_init(MEMORY[0x1896077F0]);
    launchOperation = v7->_launchOperation;
    v7->_launchOperation = v11;

    uint64_t v13 = [MEMORY[0x189603FC8] dictionary];
    dependantLaunches = v7->_dependantLaunches;
    v7->_dependantLaunches = (NSMutableDictionary *)v13;
  }

  return v7;
}

- (BOOL)firstLaunch
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL firstLaunch = v2->_firstLaunch;
  objc_sync_exit(v2);

  return firstLaunch;
}

- (void)setFirstLaunch:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (!-[SecLaunchSequence launched](obj, "launched")) {
    obj->_BOOL firstLaunch = a3;
  }
  objc_sync_exit(obj);
}

- (void)addDependantLaunch:(id)a3 child:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (!-[SecLaunchSequence launched](v7, "launched"))
  {
    -[SecLaunchSequence dependantLaunches](v7, "dependantLaunches");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v13];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = -[SecLaunchSequence dependantLaunches](v7, "dependantLaunches");
      [v10 setObject:v6 forKeyedSubscript:v13];
      v11 = -[SecLaunchSequence launchOperation](v7, "launchOperation");
      [v6 launchOperation];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 addDependency:v12];
    }
  }

  objc_sync_exit(v7);
}

- (void)addAttribute:(id)a3 value:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (!-[SecLaunchSequence launched](v7, "launched"))
    {
      -[SecLaunchSequence attributes](v7, "attributes");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        [MEMORY[0x189603FC8] dictionary];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SecLaunchSequence setAttributes:](v7, "setAttributes:", v9);
      }
      v10 = -[SecLaunchSequence attributes](v7, "attributes");
      [v10 setObject:v6 forKeyedSubscript:v11];
    }

    objc_sync_exit(v7);
  }
}

- (void)addEvent:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!-[SecLaunchSequence launched](v4, "launched"))
    {
      -[SecLaunchSequence events](v4, "events");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v6 = [v5 count];

      if (v6 <= 0x64)
      {
        v7 = -[SecLaunchSequence events](v4, "events");
        [v7 objectForKeyedSubscript:v10];
        uint64_t v8 = (SecLaunchEvent *)objc_claimAutoreleasedReturnValue();

        if (v8) {
          -[SecLaunchEvent setCounter:](v8, "setCounter:", -[SecLaunchEvent counter](v8, "counter") + 1);
        }
        else {
          uint64_t v8 = -[SecLaunchEvent initWithName:](objc_alloc(&OBJC_CLASS___SecLaunchEvent), "initWithName:", v10);
        }
        v9 = -[SecLaunchSequence events](v4, "events");
        [v9 setObject:v8 forKeyedSubscript:v10];
      }
    }

    objc_sync_exit(v4);
  }
}

- (id)metricsReport
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SecLaunchSequence launched](self, "launched"))
  {
    v4 = self;
    objc_sync_enter(v4);
    -[SecLaunchSequence dependantLaunches](v4, "dependantLaunches");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __34__SecLaunchSequence_metricsReport__block_invoke;
    v17[3] = &unk_1896652A8;
    v17[4] = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v17];

    unint64_t v6 = objc_alloc(&OBJC_CLASS___SecLaunchEvent);
    if (-[SecLaunchSequence firstLaunch](v4, "firstLaunch")) {
      v7 = @"first-launch";
    }
    else {
      v7 = @"re-launch";
    }
    uint64_t v8 = -[SecLaunchEvent initWithName:](v6, "initWithName:", v7);
    v9 = -[SecLaunchSequence events](v4, "events");
    -[SecLaunchEvent name](v8, "name");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v8 forKeyedSubscript:v10];

    -[SecLaunchSequence eventsRelativeTime](v4, "eventsRelativeTime");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v11 forKeyedSubscript:@"events"];
    v12 = -[SecLaunchSequence attributes](v4, "attributes");
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = -[SecLaunchSequence attributes](v4, "attributes");
      [v3 setObject:v14 forKeyedSubscript:@"attributes"];
    }

    objc_sync_exit(v4);
    id v15 = v3;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (void)launch
{
  obj = self;
  objc_sync_enter(obj);
  if (!-[SecLaunchSequence launched](obj, "launched")) {
    -[SecLaunchSequence setLaunched:](obj, "setLaunched:", 1LL);
  }
  objc_sync_exit(obj);
}

- (id)eventsRelativeTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SecLaunchSequence events](self, "events");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __39__SecLaunchSequence_eventsRelativeTime__block_invoke;
  v17[3] = &unk_1896652D0;
  id v18 = v3;
  id v6 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v17];

  [v6 sortUsingComparator:&__block_literal_global_1283];
  [v6 objectAtIndexedSubscript:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 date];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FA8] array];
  v14[0] = v5;
  v14[1] = 3221225472LL;
  v14[2] = __39__SecLaunchSequence_eventsRelativeTime__block_invoke_3;
  v14[3] = &unk_189665338;
  id v15 = v8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  id v10 = v8;
  [v6 enumerateObjectsUsingBlock:v14];
  id v11 = v16;
  id v12 = v9;

  return v12;
}

- (id)eventsByTime
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  obj = self;
  objc_sync_enter(obj);
  id v2 = objc_alloc_init(MEMORY[0x189607848]);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
  [MEMORY[0x189603FA8] array];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SecLaunchSequence events](obj, "events");
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __33__SecLaunchSequence_eventsByTime__block_invoke;
  v25[3] = &unk_189665280;
  id v19 = v2;
  id v26 = v19;
  id v5 = v3;
  id v27 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];

  [v5 sortUsingSelector:sel_compare_];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  -[SecLaunchSequence attributes](obj, "attributes");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        id v11 = (void *)NSString;
        -[SecLaunchSequence attributes](obj, "attributes");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 objectForKeyedSubscript:v10];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 description];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stringWithFormat:@"attr: %@: %@", v10, v14, v19];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v15];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }

    while (v7);
  }

  id v16 = v27;
  id v17 = v5;

  objc_sync_exit(obj);
  return v17;
}

- (BOOL)launched
{
  return self->_launched;
}

- (void)setLaunched:(BOOL)a3
{
  self->_launched = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSMutableDictionary)events
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEvents:(id)a3
{
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAttributes:(id)a3
{
}

- (NSBlockOperation)launchOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLaunchOperation:(id)a3
{
}

- (NSMutableDictionary)dependantLaunches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDependantLaunches:(id)a3
{
}

- (void).cxx_destruct
{
}

void __33__SecLaunchSequence_eventsByTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)NSString;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v6 date];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringFromDate:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 name];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v6 counter];

  [v4 stringWithFormat:@"%@ - %@:%u", v8, v9, v10];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v11];
}

uint64_t __39__SecLaunchSequence_eventsRelativeTime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __39__SecLaunchSequence_eventsRelativeTime__block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 name];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = (void *)MEMORY[0x189607968];
  [v9 date];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSinceDate:*(void *)(a1 + 32)];
  objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKeyedSubscript:@"time"];

  if ([v9 counter])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v9, "counter"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:@"counter"];
  }

  [*(id *)(a1 + 40) addObject:v3];
}

uint64_t __39__SecLaunchSequence_eventsRelativeTime__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 date];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 date];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __34__SecLaunchSequence_metricsReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v12 = a3;
  if ([v12 launched])
  {
    [v12 events];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __34__SecLaunchSequence_metricsReport__block_invoke_2;
    v13[3] = &unk_189665280;
    uint64_t v7 = *(void *)(a1 + 32);
    id v14 = v5;
    uint64_t v15 = v7;
    id v8 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];

    [v12 attributes];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) attributes];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"c:%@", v8];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v9 forKeyedSubscript:v11];
  }

  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

void __34__SecLaunchSequence_metricsReport__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v12 = (id)[a3 copy];
  id v6 = (void *)NSString;
  uint64_t v7 = *(void *)(a1 + 32);
  [v12 name];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"c:%@-%@", v7, v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setName:v9];

  [*(id *)(a1 + 40) events];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"c:%@-%@", *(void *)(a1 + 32), v5];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 setObject:v12 forKeyedSubscript:v11];
}

@end