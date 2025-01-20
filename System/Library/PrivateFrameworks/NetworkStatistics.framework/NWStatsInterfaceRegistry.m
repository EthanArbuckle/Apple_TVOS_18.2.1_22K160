@interface NWStatsInterfaceRegistry
+ (id)sharedInstance;
- (BOOL)isTrackingInterfaceIndex:(unsigned int)a3;
- (BOOL)machOUUIDBelongsToVPNProvider:(id)a3;
- (NWStatsInterfaceRegistry)init;
- (id)getState;
- (void)addInterfaceIndexToRegistry:(unsigned int)a3;
- (void)addVPNBytesForInterfaceIndex:(unsigned int)a3 fromSnapshot:(id)a4;
- (void)subtractVPNBytesForVPNProviderAppUUID:(id)a3 fromSnapshot:(id)a4;
@end

@implementation NWStatsInterfaceRegistry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__NWStatsInterfaceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, block);
  }
  return (id)sharedInstance_sharedInstance;
}

void __42__NWStatsInterfaceRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (id)getState
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v3 addObject:@"NWStatsInterfaceRegistry:"];
  v4 = (void *)[objc_alloc(NSString) initWithFormat:@"Queried interface indexes - %@", self->_neQueriedInterfaceIndexes];
  [v3 addObject:v4];

  v5 = (void *)[objc_alloc(NSString) initWithFormat:@"Looked up machO UUIDs - %@", self->_machOUUIDLookups];
  [v3 addObject:v5];

  v6 = (void *)[objc_alloc(NSString) initWithFormat:@"Accumulated interface bytes - %@", self->_interfaceByteAccumulators];
  [v3 addObject:v6];

  return v3;
}

- (NWStatsInterfaceRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NWStatsInterfaceRegistry;
  v2 = -[NWStatsInterfaceRegistry init](&v10, sel_init);
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    neQueriedInterfaceIndexes = v2->_neQueriedInterfaceIndexes;
    v2->_neQueriedInterfaceIndexes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    machOUUIDLookups = v2->_machOUUIDLookups;
    v2->_machOUUIDLookups = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    interfaceByteAccumulators = v2->_interfaceByteAccumulators;
    v2->_interfaceByteAccumulators = v7;
  }

  return v2;
}

- (BOOL)isTrackingInterfaceIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  neQueriedInterfaceIndexes = self->_neQueriedInterfaceIndexes;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](neQueriedInterfaceIndexes, "containsObject:", v6))
  {
    interfaceByteAccumulators = self->_interfaceByteAccumulators;
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSMutableDictionary objectForKeyedSubscript:](interfaceByteAccumulators, "objectForKeyedSubscript:", v8);
    BOOL v10 = v9 != 0LL;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)addInterfaceIndexToRegistry:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  *(void *)uu = 0LL;
  uint64_t v18 = 0LL;
  neQueriedInterfaceIndexes = self->_neQueriedInterfaceIndexes;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(neQueriedInterfaceIndexes) = -[NSMutableSet containsObject:](neQueriedInterfaceIndexes, "containsObject:", v6);

  if ((neQueriedInterfaceIndexes & 1) == 0)
  {
    *(void *)v15 = 0LL;
    uint64_t v16 = 0LL;
    if (if_indextoname(v3, v15)) {
      ne_session_map_interface_to_provider_uuid();
    }
    memset(v14, 0, sizeof(v14));
    uuid_unparse(uu, v14);
    if (!uuid_is_null(uu))
    {
      v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
      [MEMORY[0x189607968] numberWithUnsignedInt:v3];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_machOUUIDLookups,  "setObject:forKeyedSubscript:",  v8,  v7);

      v9 = objc_alloc_init(&OBJC_CLASS___VPNInterfaceByteCountAccumulator);
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      [MEMORY[0x189607968] numberWithUnsignedInt:v3];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:]( interfaceByteAccumulators,  "setObject:forKeyedSubscript:",  v9,  v11);
    }

    v12 = self->_neQueriedInterfaceIndexes;
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v12, "addObject:", v13);
  }

- (BOOL)machOUUIDBelongsToVPNProvider:(id)a3
{
  machOUUIDLookups = self->_machOUUIDLookups;
  if (!machOUUIDLookups) {
    return 0;
  }
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](machOUUIDLookups, "objectForKeyedSubscript:", a3);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (void)addVPNBytesForInterfaceIndex:(unsigned int)a3 fromSnapshot:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6)
  {
    id v11 = v6;
    BOOL v7 = -[NWStatsInterfaceRegistry isTrackingInterfaceIndex:](self, "isTrackingInterfaceIndex:", v4);
    id v6 = v11;
    if (v7)
    {
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      [MEMORY[0x189607968] numberWithUnsignedInt:v4];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](interfaceByteAccumulators, "objectForKeyedSubscript:", v9);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 addBytesToAttributeToVPNProviderFromSnapshot:v11];

      id v6 = v11;
    }
  }
}

- (void)subtractVPNBytesForVPNProviderAppUUID:(id)a3 fromSnapshot:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      machOUUIDLookups = self->_machOUUIDLookups;
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      id v7 = a4;
      -[NSMutableDictionary objectForKeyedSubscript:](machOUUIDLookups, "objectForKeyedSubscript:", a3);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[NSMutableDictionary objectForKeyedSubscript:](interfaceByteAccumulators, "objectForKeyedSubscript:", v9);
      [v8 subtractBytesAttributedToVPNProviderFromSnapshot:v7];
    }
  }

- (void).cxx_destruct
{
}

@end