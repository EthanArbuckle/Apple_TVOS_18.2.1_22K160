@interface TKSmartCardSlotProxy
- (NSHashTable)cards;
- (TKSmartCardSlotProxy)initWithSlot:(id)a3;
- (void)cardSessionRequested;
- (void)notifyWithParameters:(id)a3 reply:(id)a4;
- (void)processNotificationParameters:(id)a3;
- (void)slotInitialized;
@end

@implementation TKSmartCardSlotProxy

- (void)processNotificationParameters:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKey:@"state"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 integerValue];

  [v4 objectForKey:@"atr"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TK_LOG_smartcard();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slot);
    int v42 = 138543874;
    id v43 = WeakRetained;
    __int16 v44 = 2048;
    uint64_t v45 = v6;
    __int16 v46 = 2114;
    v47 = v7;
    _os_log_debug_impl( &dword_186E58000,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}@: stateChangedTo:%ld atr:%{public}@",  (uint8_t *)&v42,  0x20u);
  }

  if (v7) {
    BOOL v9 = v6 == 4;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_slot);
    [v15 ATR];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    char v17 = [v16 isEqual:v7];

    if ((v17 & 1) != 0) {
      goto LABEL_16;
    }
    v14 = -[TKSmartCardATR initWithBytes:](objc_alloc(&OBJC_CLASS___TKSmartCardATR), "initWithBytes:", v7);
    id v18 = objc_loadWeakRetained((id *)&self->_slot);
    [v18 setATR:v14];

    goto LABEL_15;
  }

  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 4;
  }
  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_slot);
    [v11 ATR];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12 == 0LL;

    if (!v13)
    {
      v14 = (TKSmartCardATR *)objc_loadWeakRetained((id *)&self->_slot);
      -[TKSmartCardATR setATR:](v14, "setATR:", 0LL);
LABEL_15:
    }
  }

- (void)notifyWithParameters:(id)a3 reply:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(void))a4;
  v7 = self;
  objc_sync_enter(v7);
  queuedParameters = v7->_queuedParameters;
  if (queuedParameters)
  {
    -[NSMutableArray addObject:](queuedParameters, "addObject:", v9);
    objc_sync_exit(v7);
  }

  else
  {
    objc_sync_exit(v7);

    -[TKSmartCardSlotProxy processNotificationParameters:](v7, "processNotificationParameters:", v9);
  }

  v6[2](v6);
}

- (void)cardSessionRequested
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = -[TKSmartCardSlotProxy cards](self, "cards", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) sessionRequested];
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (TKSmartCardSlotProxy)initWithSlot:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKSmartCardSlotProxy;
  uint64_t v5 = -[TKSmartCardSlotProxy init](&v12, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_slot, v4);
    uint64_t v7 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    cards = v6->_cards;
    v6->_cards = (NSHashTable *)v7;

    __int128 v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    queuedParameters = v6->_queuedParameters;
    v6->_queuedParameters = v9;
  }

  return v6;
}

- (void)slotInitialized
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  p_slot = &self->_slot;
  while (1)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!-[NSMutableArray count](self->_queuedParameters, "count")) {
      break;
    }
    TK_LOG_smartcard();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_slot);
      int v8 = -[NSMutableArray count](self->_queuedParameters, "count");
      *(_DWORD *)buf = 138412546;
      id v11 = WeakRetained;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_debug_impl( &dword_186E58000,  v5,  OS_LOG_TYPE_DEBUG,  "%@: processing accumulated state changes, %d remain",  buf,  0x12u);
    }

    -[NSMutableArray firstObject](self->_queuedParameters, "firstObject");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_queuedParameters, "removeObjectAtIndex:", 0LL);
    objc_sync_exit(v4);

    -[TKSmartCardSlotProxy processNotificationParameters:](v4, "processNotificationParameters:", v6);
  }

  queuedParameters = self->_queuedParameters;
  self->_queuedParameters = 0LL;

  objc_sync_exit(v4);
}

- (NSHashTable)cards
{
  return (NSHashTable *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end