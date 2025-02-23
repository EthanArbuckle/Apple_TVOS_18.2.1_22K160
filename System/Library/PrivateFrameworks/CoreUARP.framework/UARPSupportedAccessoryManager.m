@interface UARPSupportedAccessoryManager
+ (id)defaultManager;
- (NSSet)setOfAccessories;
- (UARPSupportedAccessoryManager)init;
- (void)addSupportedAccessories:(id)a3;
- (void)addSupportedAccessoriesByURL:(id)a3;
- (void)addSupportedAccessory:(id)a3;
- (void)addSupportedAccessoryByDictionary:(id)a3;
@end

@implementation UARPSupportedAccessoryManager

- (UARPSupportedAccessoryManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryManager;
  v2 = -[UARPSupportedAccessoryManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    setOfAccessories = v2->_setOfAccessories;
    v2->_setOfAccessories = v3;

    os_log_t v5 = os_log_create("com.apple.accessoryupdater.uarp", "supportedAccessories");
    log = v2->_log;
    v2->_log = v5;
  }

  return v2;
}

+ (id)defaultManager
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__UARPSupportedAccessoryManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, block);
  }
  return (id)defaultManager_sharedManager;
}

void __47__UARPSupportedAccessoryManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_sharedManager;
  defaultManager_sharedManager = (uint64_t)v1;

  v3 = (void *)defaultManager_sharedManager;
  v4 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2384);
  [v3 addSupportedAccessory:v4];

  os_log_t v5 = (void *)defaultManager_sharedManager;
  v6 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2049);
  [v5 addSupportedAccessory:v6];

  v7 = (void *)defaultManager_sharedManager;
  objc_super v8 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2049DFU);
  [v7 addSupportedAccessory:v8];

  v9 = (void *)defaultManager_sharedManager;
  v10 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2049Simulated);
  [v9 addSupportedAccessory:v10];

  v11 = (void *)defaultManager_sharedManager;
  v12 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2049DFUSimulated);
  [v11 addSupportedAccessory:v12];

  v13 = (void *)defaultManager_sharedManager;
  v14 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2869);
  [v13 addSupportedAccessory:v14];

  v15 = (void *)defaultManager_sharedManager;
  v16 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2868);
  [v15 addSupportedAccessory:v16];

  v17 = (void *)defaultManager_sharedManager;
  v18 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2518);
  [v17 addSupportedAccessory:v18];

  v19 = (void *)defaultManager_sharedManager;
  v20 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2140);
  [v19 addSupportedAccessory:v20];

  v21 = (void *)defaultManager_sharedManager;
  v22 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2580);
  [v21 addSupportedAccessory:v22];

  v23 = (void *)defaultManager_sharedManager;
  v24 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2924);
  [v23 addSupportedAccessory:v24];

  v25 = (void *)defaultManager_sharedManager;
  v26 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3150);
  [v25 addSupportedAccessory:v26];

  v27 = (void *)defaultManager_sharedManager;
  v28 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3140);
  [v27 addSupportedAccessory:v28];

  v29 = (void *)defaultManager_sharedManager;
  v30 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3085);
  [v29 addSupportedAccessory:v30];

  v31 = (void *)defaultManager_sharedManager;
  v32 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3211);
  [v31 addSupportedAccessory:v32];

  v33 = (void *)defaultManager_sharedManager;
  v34 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3157);
  [v33 addSupportedAccessory:v34];

  v35 = (void *)defaultManager_sharedManager;
  v36 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2513);
  [v35 addSupportedAccessory:v36];

  v37 = (void *)defaultManager_sharedManager;
  v38 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2538);
  [v37 addSupportedAccessory:v38];

  v39 = (void *)defaultManager_sharedManager;
  v40 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2776);
  [v39 addSupportedAccessory:v40];

  v41 = (void *)defaultManager_sharedManager;
  v42 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2871);
  [v41 addSupportedAccessory:v42];

  v43 = (void *)defaultManager_sharedManager;
  v44 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2617);
  [v43 addSupportedAccessory:v44];

  v45 = (void *)defaultManager_sharedManager;
  v46 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2968);
  [v45 addSupportedAccessory:v46];

  v47 = (void *)defaultManager_sharedManager;
  v48 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2699);
  [v47 addSupportedAccessory:v48];

  v49 = (void *)defaultManager_sharedManager;
  v50 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3048);
  [v49 addSupportedAccessory:v50];

  v51 = (void *)defaultManager_sharedManager;
  v52 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3058USB);
  [v51 addSupportedAccessory:v52];

  v53 = (void *)defaultManager_sharedManager;
  v54 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3059);
  [v53 addSupportedAccessory:v54];

  v55 = (void *)defaultManager_sharedManager;
  v56 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3053);
  [v55 addSupportedAccessory:v56];

  v57 = (void *)defaultManager_sharedManager;
  v58 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3054);
  [v57 addSupportedAccessory:v58];

  v59 = (void *)defaultManager_sharedManager;
  v60 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3056);
  [v59 addSupportedAccessory:v60];

  v61 = (void *)defaultManager_sharedManager;
  v62 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3057);
  [v61 addSupportedAccessory:v62];

  v63 = (void *)defaultManager_sharedManager;
  v64 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2781);
  [v63 addSupportedAccessory:v64];

  v65 = (void *)defaultManager_sharedManager;
  v66 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3046);
  [v65 addSupportedAccessory:v66];

  v67 = (void *)defaultManager_sharedManager;
  v68 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3046DFU);
  [v67 addSupportedAccessory:v68];

  v69 = (void *)defaultManager_sharedManager;
  v70 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3046Simulated);
  [v69 addSupportedAccessory:v70];

  v71 = (void *)defaultManager_sharedManager;
  v72 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3046DFUSimulated);
  [v71 addSupportedAccessory:v72];

  v73 = (void *)defaultManager_sharedManager;
  v74 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2458);
  [v73 addSupportedAccessory:v74];

  v75 = (void *)defaultManager_sharedManager;
  v76 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2571);
  [v75 addSupportedAccessory:v76];

  v77 = (void *)defaultManager_sharedManager;
  v78 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3328);
  [v77 addSupportedAccessory:v78];

  v79 = (void *)defaultManager_sharedManager;
  v80 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2676);
  [v79 addSupportedAccessory:v80];

  v81 = (void *)defaultManager_sharedManager;
  v82 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2743);
  [v81 addSupportedAccessory:v82];

  v83 = (void *)defaultManager_sharedManager;
  v84 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2166);
  [v83 addSupportedAccessory:v84];

  v85 = (void *)defaultManager_sharedManager;
  v86 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2452);
  [v85 addSupportedAccessory:v86];

  v87 = (void *)defaultManager_sharedManager;
  v88 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2515);
  [v87 addSupportedAccessory:v88];

  v89 = (void *)defaultManager_sharedManager;
  v90 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2879);
  [v89 addSupportedAccessory:v90];

  v91 = (void *)defaultManager_sharedManager;
  v92 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2463);
  [v91 addSupportedAccessory:v92];

  v93 = (void *)defaultManager_sharedManager;
  v94 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2728);
  [v93 addSupportedAccessory:v94];

  v95 = (void *)defaultManager_sharedManager;
  v96 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA3088);
  [v95 addSupportedAccessory:v96];

  v97 = (void *)defaultManager_sharedManager;
  v98 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2755);
  [v97 addSupportedAccessory:v98];

  v99 = (void *)defaultManager_sharedManager;
  v100 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2363);
  [v99 addSupportedAccessory:v100];

  v101 = (void *)defaultManager_sharedManager;
  v102 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2675);
  [v101 addSupportedAccessory:v102];

  v103 = (void *)defaultManager_sharedManager;
  v104 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518);
  [v103 addSupportedAccessory:v104];

  v105 = (void *)defaultManager_sharedManager;
  v106 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2975);
  [v105 addSupportedAccessory:v106];

  v107 = (void *)defaultManager_sharedManager;
  v108 = objc_alloc_init(&OBJC_CLASS___UARPSupportedAccessoryA2974);
  [v107 addSupportedAccessory:v108];
}

- (NSSet)setOfAccessories
{
  return (NSSet *)[MEMORY[0x189604010] setWithSet:self->_setOfAccessories];
}

- (void)addSupportedAccessoriesByURL:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v4];
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPSupportedAccessoryManager addSupportedAccessoriesByURL:].cold.2((uint64_t)v4, log, v7, v8, v9, v10, v11, v12);
  }
  -[UARPSupportedAccessoryManager addSupportedAccessoryByDictionary:](self, "addSupportedAccessoryByDictionary:", v5);
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[UARPSupportedAccessoryManager addSupportedAccessoriesByURL:].cold.1( (uint64_t)self,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
  }
}

- (void)addSupportedAccessoryByDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v4 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v10 = -[UARPSupportedAccessory initWithDictionary:]( objc_alloc(&OBJC_CLASS___UARPSupportedAccessory),  "initWithDictionary:",  v9);
          if (v10) {
            -[UARPSupportedAccessoryManager addSupportedAccessory:](self, "addSupportedAccessory:", v10);
          }
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)addSupportedAccessory:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((-[NSMutableSet containsObject:](v4->_setOfAccessories, "containsObject:", v5) & 1) == 0) {
    -[NSMutableSet addObject:](v4->_setOfAccessories, "addObject:", v5);
  }
  objc_sync_exit(v4);
}

- (void)addSupportedAccessories:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[UARPSupportedAccessoryManager addSupportedAccessory:]( self,  "addSupportedAccessory:",  *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void).cxx_destruct
{
}

- (void)addSupportedAccessoriesByURL:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)addSupportedAccessoriesByURL:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end