@interface CUPowerSourceMonitor
- (CUPowerSourceMonitor)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)powerSourceChangedHandler;
- (id)powerSourceFoundHandler;
- (id)powerSourceLostHandler;
- (unsigned)changeFlags;
- (void)_aggregatePowerSourceFound:(id)a3;
- (void)_aggregatePowerSourceLost:(id)a3;
- (void)_aggregatePowerSourceUpdate:(id)a3 changes:(unsigned int)a4;
- (void)_cleanup;
- (void)_handlePowerSourceFound:(id)a3 desc:(id)a4 adapterDesc:(id)a5;
- (void)_handlePowerSourceLost:(id)a3 sourceID:(id)a4;
- (void)_handlePowerSourceUpdate:(id)a3 desc:(id)a4 adapterDesc:(id)a5;
- (void)_update;
- (void)_updatePowerSources;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPowerSourceChangedHandler:(id)a3;
- (void)setPowerSourceFoundHandler:(id)a3;
- (void)setPowerSourceLostHandler:(id)a3;
@end

@implementation CUPowerSourceMonitor

- (CUPowerSourceMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUPowerSourceMonitor;
  v2 = -[CUPowerSourceMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changeFlags = 5;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    *(void *)&v3->_psNotifyTokenAccessoryAttach = -1LL;
    *(void *)&v3->_psNotifyTokenAccessoryTimeRemaining = -1LL;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CUPowerSourceMonitor;
  -[CUPowerSourceMonitor dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  id powerSourceFoundHandler = self->_powerSourceFoundHandler;
  self->_id powerSourceFoundHandler = 0LL;

  id powerSourceLostHandler = self->_powerSourceLostHandler;
  self->_id powerSourceLostHandler = 0LL;

  id powerSourceChangedHandler = self->_powerSourceChangedHandler;
  self->_id powerSourceChangedHandler = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_powerSources, "removeAllObjects");
  powerSources = self->_powerSources;
  self->_powerSources = 0LL;

  int psNotifyTokenAccessoryAttach = self->_psNotifyTokenAccessoryAttach;
  if (psNotifyTokenAccessoryAttach != -1)
  {
    notify_cancel(psNotifyTokenAccessoryAttach);
    self->_int psNotifyTokenAccessoryAttach = -1;
  }

  int psNotifyTokenAccessoryPowerSource = self->_psNotifyTokenAccessoryPowerSource;
  if (psNotifyTokenAccessoryPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAccessoryPowerSource);
    self->_int psNotifyTokenAccessoryPowerSource = -1;
  }

  int psNotifyTokenAccessoryTimeRemaining = self->_psNotifyTokenAccessoryTimeRemaining;
  if (psNotifyTokenAccessoryTimeRemaining != -1)
  {
    notify_cancel(psNotifyTokenAccessoryTimeRemaining);
    self->_int psNotifyTokenAccessoryTimeRemaining = -1;
  }

  int psNotifyTokenAnyPowerSource = self->_psNotifyTokenAnyPowerSource;
  if (psNotifyTokenAnyPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAnyPowerSource);
    self->_int psNotifyTokenAnyPowerSource = -1;
  }

- (void)setChangeFlags:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v4->_dispatchQueue;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __39__CUPowerSourceMonitor_setChangeFlags___block_invoke;
    v6[3] = &unk_189F32F60;
    unsigned int v7 = a3;
    v6[4] = v4;
    dispatch_async(dispatchQueue, v6);
  }

  else
  {
    v4->_changeFlags = a3;
  }

  objc_sync_exit(v4);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __47__CUPowerSourceMonitor_activateWithCompletion___block_invoke;
  v8[3] = &unk_189F33060;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__CUPowerSourceMonitor_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_aggregatePowerSourceFound:(id)a3
{
  id v4 = a3;
  id v29 = v4;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor != -1
      || (v9 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu), id v4 = v29, v9))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceFound:]",  0x1Eu,  (uint64_t)"Aggregate power source found: %@",  v5,  v6,  v7,  v8,  (char)v4);
      id v4 = v29;
    }
  }

  [v4 accessoryID];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAggregates, "objectForKeyedSubscript:", v14);
    v15 = (CUPowerSource *)objc_claimAutoreleasedReturnValue();
    if (!v15) {
      v15 = objc_alloc_init(&OBJC_CLASS___CUPowerSource);
    }
    [v29 partID];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v16 isEqualToString:@"Left"])
    {
      -[CUPowerSource setSubLeft:](v15, "setSubLeft:", v29);
    }

    else if ([v16 isEqualToString:@"Right"])
    {
      -[CUPowerSource setSubRight:](v15, "setSubRight:", v29);
    }

    else if ([v16 isEqualToString:@"Case"])
    {
      -[CUPowerSource setSubCase:](v15, "setSubCase:", v29);
    }

    -[CUPowerSource handleSubComponentsUpdatedWithBaseSource:](v15, "handleSubComponentsUpdatedWithBaseSource:", 0LL);
    BOOL v17 = -[CUPowerSource hasAllComponents](v15, "hasAllComponents");
    pendingAggregates = self->_pendingAggregates;
    if (v17)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingAggregates, "setObject:forKeyedSubscript:", 0LL, v14);
      aggregateSources = self->_aggregateSources;
      if (!aggregateSources)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        v21 = self->_aggregateSources;
        self->_aggregateSources = v20;

        aggregateSources = self->_aggregateSources;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](aggregateSources, "setObject:forKeyedSubscript:", v15, v14);
      if (gLogCategory_CUPowerSourceMonitor <= 30
        && (gLogCategory_CUPowerSourceMonitor != -1
         || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceFound:]",  0x1Eu,  (uint64_t)"Aggregate complete: %@",  v22,  v23,  v24,  v25,  (char)v15);
      }

      id powerSourceFoundHandler = (void (**)(id, CUPowerSource *))self->_powerSourceFoundHandler;
      if (powerSourceFoundHandler) {
        powerSourceFoundHandler[2](powerSourceFoundHandler, v15);
      }
    }

    else
    {
      if (!pendingAggregates)
      {
        v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        v27 = self->_pendingAggregates;
        self->_pendingAggregates = v26;

        pendingAggregates = self->_pendingAggregates;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingAggregates, "setObject:forKeyedSubscript:", v15, v14);
    }
  }

  else if (gLogCategory_CUPowerSourceMonitor <= 60 {
         && (gLogCategory_CUPowerSourceMonitor != -1
  }
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceFound:]",  0x3Cu,  (uint64_t)"### No accessoryID for aggregate found: %@",  v10,  v11,  v12,  v13,  (char)v29);
  }
}

- (void)_aggregatePowerSourceLost:(id)a3
{
  id v24 = a3;
  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceLost:]",  0x1Eu,  (uint64_t)"Aggregate power source lost: %@",  v4,  v5,  v6,  v7,  (char)v24);
  }

  [v24 accessoryID];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAggregates, "objectForKeyedSubscript:", v12);
    v14 = (void *)v13;
    if (v13
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateSources, "objectForKeyedSubscript:", v12),
          (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {
      [v24 partID];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v19 isEqualToString:@"Left"])
      {
        [v14 setSubLeft:0];
      }

      else if ([v19 isEqualToString:@"Right"])
      {
        [v14 setSubRight:0];
      }

      else if ([v19 isEqualToString:@"Case"])
      {
        [v14 setSubCase:0];
      }

      [v14 handleSubComponentsUpdatedWithBaseSource:0];
      [v14 subLeft];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 || ([v14 subRight], (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
      }

      else
      {
        [v14 subCase];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_aggregateSources,  "setObject:forKeyedSubscript:",  0LL,  v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingAggregates,  "setObject:forKeyedSubscript:",  0LL,  v12);
          if (!v13)
          {
            id powerSourceLostHandler = (void (**)(id, void *))self->_powerSourceLostHandler;
            if (powerSourceLostHandler) {
              powerSourceLostHandler[2](powerSourceLostHandler, v14);
            }
          }

          goto LABEL_25;
        }
      }

      if (v13)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingAggregates,  "setObject:forKeyedSubscript:",  v14,  v12);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_aggregateSources,  "setObject:forKeyedSubscript:",  v14,  v12);
        id powerSourceChangedHandler = (void (**)(id, void *, uint64_t))self->_powerSourceChangedHandler;
        if (powerSourceChangedHandler) {
          powerSourceChangedHandler[2](powerSourceChangedHandler, v14, 512LL);
        }
      }

- (void)_aggregatePowerSourceUpdate:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v25 = v6;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor != -1
      || (v11 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu), id v6 = v25, v11))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]",  0x1Eu,  (uint64_t)"Aggregate power source update: %@",  v7,  v8,  v9,  v10,  (char)v6);
      id v6 = v25;
    }
  }

  [v6 accessoryID];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    uint64_t v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAggregates, "objectForKeyedSubscript:", v16);
    uint64_t v18 = (void *)v17;
    if (v17
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateSources, "objectForKeyedSubscript:", v16),
          (uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {
      [v25 partID];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v23 isEqualToString:@"Left"])
      {
        [v18 setSubLeft:v25];
      }

      else if ([v23 isEqualToString:@"Right"])
      {
        [v18 setSubRight:v25];
      }

      else if ([v23 isEqualToString:@"Case"])
      {
        [v18 setSubCase:v25];
      }

      [v18 handleSubComponentsUpdatedWithBaseSource:0];
      if (v17)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingAggregates,  "setObject:forKeyedSubscript:",  v18,  v16);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_aggregateSources,  "setObject:forKeyedSubscript:",  v18,  v16);
        id powerSourceChangedHandler = (void (**)(id, void *, void))self->_powerSourceChangedHandler;
        if (powerSourceChangedHandler) {
          powerSourceChangedHandler[2](powerSourceChangedHandler, v18, v4);
        }
      }
    }

    else if (gLogCategory_CUPowerSourceMonitor <= 60 {
           && (gLogCategory_CUPowerSourceMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]",  0x3Cu,  (uint64_t)"### No aggregate found for lost power source: %@",  v19,  v20,  v21,  v22,  (char)v25);
    }
  }

  else if (gLogCategory_CUPowerSourceMonitor <= 60 {
         && (gLogCategory_CUPowerSourceMonitor != -1
  }
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]",  0x3Cu,  (uint64_t)"### No accessoryID for aggregate changed: %@",  v12,  v13,  v14,  v15,  (char)v25);
  }
}

- (void)_update
{
  if (self->_psNotifyTokenAccessoryAttach == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __31__CUPowerSourceMonitor__update__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch( "com.apple.system.accpowersources.attach",  &self->_psNotifyTokenAccessoryAttach,  dispatchQueue,  handler);
  }

  if (self->_psNotifyTokenAccessoryPowerSource == -1)
  {
    uint64_t v4 = (dispatch_queue_s *)self->_dispatchQueue;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __31__CUPowerSourceMonitor__update__block_invoke_2;
    v9[3] = &unk_189F32EC8;
    v9[4] = self;
    notify_register_dispatch( "com.apple.system.accpowersources.source",  &self->_psNotifyTokenAccessoryPowerSource,  v4,  v9);
  }

  if (self->_psNotifyTokenAccessoryTimeRemaining == -1)
  {
    uint64_t v5 = (dispatch_queue_s *)self->_dispatchQueue;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __31__CUPowerSourceMonitor__update__block_invoke_3;
    v8[3] = &unk_189F32EC8;
    v8[4] = self;
    notify_register_dispatch( "com.apple.system.accpowersources.timeremaining",  &self->_psNotifyTokenAccessoryTimeRemaining,  v5,  v8);
  }

  if (self->_psNotifyTokenAnyPowerSource == -1)
  {
    id v6 = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __31__CUPowerSourceMonitor__update__block_invoke_4;
    v7[3] = &unk_189F32EC8;
    v7[4] = self;
    notify_register_dispatch("com.apple.system.powersources", &self->_psNotifyTokenAnyPowerSource, v6, v7);
  }

- (void)_updatePowerSources
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (gLogCategory_CUPowerSourceMonitor <= 10
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]",  0xAu,  (uint64_t)"Update power sources\n",  v2,  v3,  v4,  v5,  v38);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_powerSources,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_6863);
  CFDictionaryRef v39 = IOPSCopyExternalPowerAdapterDetails();
  uint64_t v7 = (const void *)IOPSCopyPowerSourcesByType();
  uint64_t v12 = v7;
  if (!v7)
  {
    if (gLogCategory_CUPowerSourceMonitor > 60) {
      goto LABEL_39;
    }
    if (gLogCategory_CUPowerSourceMonitor != -1
      || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]",  0x3Cu,  (uint64_t)"### IOPSCopyPowerSourcesInfo failed\n",  v8,  v9,  v10,  v11,  v38);
    }

    goto LABEL_33;
  }

  uint64_t v13 = IOPSCopyPowerSourcesList(v7);
  if (!v13)
  {
LABEL_33:
    if (gLogCategory_CUPowerSourceMonitor <= 60
      && (gLogCategory_CUPowerSourceMonitor != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]",  0x3Cu,  (uint64_t)"### IOPSCopyPowerSourcesList failed\n",  v8,  v9,  v10,  v11,  v38);
    }

    goto LABEL_37;
  }

  uint64_t v14 = v13;
  CFIndex Count = CFArrayGetCount(v13);
  if (Count >= 1)
  {
    CFIndex v16 = Count;
    for (CFIndex i = 0LL; i != v16; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
      IOPSGetPowerSourceDescription(v12, ValueAtIndex);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v24 = v19;
      if (v19)
      {
        [v19 objectForKeyedSubscript:@"Power Source ID"];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = -[NSMutableDictionary objectForKeyedSubscript:](self->_powerSources, "objectForKeyedSubscript:", v29);
          if (v30) {
            -[CUPowerSourceMonitor _handlePowerSourceUpdate:desc:adapterDesc:]( self,  "_handlePowerSourceUpdate:desc:adapterDesc:",  v30,  v24,  v39);
          }
          else {
            -[CUPowerSourceMonitor _handlePowerSourceFound:desc:adapterDesc:]( self,  "_handlePowerSourceFound:desc:adapterDesc:",  v29,  v24,  v39);
          }
        }

        else if (gLogCategory_CUPowerSourceMonitor <= 60 {
               && (gLogCategory_CUPowerSourceMonitor != -1
        }
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]",  0x3Cu,  (uint64_t)"### No ID for power source %##@\n",  v25,  v26,  v27,  v28,  (char)v24);
        }
      }

      else if (gLogCategory_CUPowerSourceMonitor <= 60 {
             && (gLogCategory_CUPowerSourceMonitor != -1
      }
              || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]",  0x3Cu,  (uint64_t)"### IOPSGetPowerSourceDescription %ld failed\n",  v20,  v21,  v22,  v23,  i);
      }
    }
  }

  CFRelease(v14);
LABEL_37:
  if (v12) {
    CFRelease(v12);
  }
LABEL_39:
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v31 = -[NSMutableDictionary allKeys](self->_powerSources, "allKeys");
  uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t j = 0LL; j != v33; ++j)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        v37 = -[NSMutableDictionary objectForKeyedSubscript:](self->_powerSources, "objectForKeyedSubscript:", v36);
        if (([v37 present] & 1) == 0) {
          -[CUPowerSourceMonitor _handlePowerSourceLost:sourceID:](self, "_handlePowerSourceLost:sourceID:", v37, v36);
        }
      }

      uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v33);
  }
}

- (void)_handlePowerSourceFound:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___CUPowerSource);
  -[CUPowerSource setSourceID:](v10, "setSourceID:", [v22 integerValue]);
  -[CUPowerSource updateWithPowerSourceDescription:](v10, "updateWithPowerSourceDescription:", v9);

  -[CUPowerSource type](v10, "type");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = [v11 isEqual:@"InternalBattery"];

  if ((_DWORD)v9) {
    -[CUPowerSource updateWithPowerAdapterDetails:](v10, "updateWithPowerAdapterDetails:", v8);
  }
  powerSources = self->_powerSources;
  if (!powerSources)
  {
    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v14 = self->_powerSources;
    self->_powerSources = v13;

    powerSources = self->_powerSources;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](powerSources, "setObject:forKeyedSubscript:", v10, v22);
  int v15 = gLogCategory_CUPowerSourceMonitor;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor == -1)
    {
      int v15 = gLogCategory_CUPowerSourceMonitor;
    }

    if (v15 == -1) {
      _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 9u);
    }
    -[CUPowerSource ioKitDescription](v10, "ioKitDescription");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _handlePowerSourceFound:desc:adapterDesc:]",  0x1Eu,  (uint64_t)"Found   %@ %?@\n",  v16,  v17,  v18,  v19,  (char)v10);
  }

- (void)_handlePowerSourceLost:(id)a3 sourceID:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  int v7 = gLogCategory_CUPowerSourceMonitor;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor == -1)
    {
      int v7 = gLogCategory_CUPowerSourceMonitor;
    }

    if (v7 <= 9)
    {
      id v8 = v15;
      if (v7 != -1) {
        goto LABEL_11;
      }
      _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 9u);
    }

    id v8 = v15;
LABEL_11:
    [v8 ioKitDescription];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _handlePowerSourceLost:sourceID:]",  0x1Eu,  (uint64_t)"Lost    %@ %?@\n",  v9,  v10,  v11,  v12,  (char)v15);
  }

- (void)_handlePowerSourceUpdate:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  uint64_t v9 = [v20 updateWithPowerSourceDescription:a4];
  [v20 type];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v10 isEqual:@"InternalBattery"];

  if (v11) {
    uint64_t v9 = [v20 updateWithPowerAdapterDetails:v8] | v9;
  }
  if ((self->_changeFlags & v9) != 0)
  {
    int v12 = gLogCategory_CUPowerSourceMonitor;
    if (gLogCategory_CUPowerSourceMonitor > 10) {
      goto LABEL_15;
    }
    if (gLogCategory_CUPowerSourceMonitor == -1)
    {
      int v12 = gLogCategory_CUPowerSourceMonitor;
    }

    if (v12 <= 9)
    {
      uint64_t v13 = v20;
      if (v12 != -1) {
        goto LABEL_14;
      }
      _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 9u);
    }

    uint64_t v13 = v20;
LABEL_14:
    [v13 ioKitDescription];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _handlePowerSourceUpdate:desc:adapterDesc:]",  0xAu,  (uint64_t)"Changed %@ %#{flags} %?@\n",  v14,  v15,  v16,  v17,  (char)v20);

LABEL_15:
    if ([v20 isAggregateComponent])
    {
      -[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]( self,  "_aggregatePowerSourceUpdate:changes:",  v20,  v9);
    }

    else
    {
      id powerSourceChangedHandler = (void (**)(id, id, uint64_t))self->_powerSourceChangedHandler;
      if (powerSourceChangedHandler) {
        powerSourceChangedHandler[2](powerSourceChangedHandler, v20, v9);
      }
    }
  }
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)powerSourceFoundHandler
{
  return self->_powerSourceFoundHandler;
}

- (void)setPowerSourceFoundHandler:(id)a3
{
}

- (id)powerSourceLostHandler
{
  return self->_powerSourceLostHandler;
}

- (void)setPowerSourceLostHandler:(id)a3
{
}

- (id)powerSourceChangedHandler
{
  return self->_powerSourceChangedHandler;
}

- (void)setPowerSourceChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __43__CUPowerSourceMonitor__updatePowerSources__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPresent:0];
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke",  0x1Eu,  (uint64_t)"Power notification: AccessoryAttach\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _updatePowerSources];
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke_2",  0x1Eu,  (uint64_t)"Power notification: AccessoryPowerSource\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _updatePowerSources];
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUPowerSourceMonitor <= 10
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke_3",  0xAu,  (uint64_t)"Power notification: AccessoryTimeRemaining\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _updatePowerSources];
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUPowerSourceMonitor <= 10
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke_4",  0xAu,  (uint64_t)"Power notification: AnyPowerSource\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _updatePowerSources];
}

uint64_t __34__CUPowerSourceMonitor_invalidate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v12);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[9];
  if (v10)
  {
    (*(void (**)(void))(v10 + 16))(v9[9]);
    uint64_t v9 = *(void **)(a1 + 32);
  }

  return [v9 _cleanup];
}

uint64_t __47__CUPowerSourceMonitor_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPowerSourceMonitor,  (uint64_t)"-[CUPowerSourceMonitor activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v11);
  }

  [*(id *)(a1 + 32) _update];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0LL);
  }
  return [*(id *)(a1 + 32) _updatePowerSources];
}

uint64_t __39__CUPowerSourceMonitor_setChangeFlags___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(v2 + 56) = v1;
    return [*(id *)(result + 32) _update];
  }

  return result;
}

@end