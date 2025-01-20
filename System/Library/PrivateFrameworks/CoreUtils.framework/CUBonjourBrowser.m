@interface CUBonjourBrowser
- (CUBonjourBrowser)init;
- (NSArray)devices;
- (NSString)domain;
- (NSString)interfaceName;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)_bonjourStart;
- (unint64_t)browseFlags;
- (unsigned)changeFlags;
- (unsigned)controlFlags;
- (void)_activateSafeInvokeBlock:(id)a3;
- (void)_bonjourHandleAddOrUpdateDevice:(id)a3;
- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4;
- (void)_bonjourHandleRemoveDevice:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_update;
- (void)_updateLocked;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setBrowseFlags:(unint64_t)a3;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServiceType:(id)a3;
- (void)update;
@end

@implementation CUBonjourBrowser

- (CUBonjourBrowser)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUBonjourBrowser;
  v2 = -[CUBonjourBrowser init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBonjourBrowser;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUBonjourBrowser;
  -[CUBonjourBrowser dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[CUBonjourBrowser descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v34 = 0LL;
  v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = __Block_byref_object_copy__2732;
  v38 = __Block_byref_object_dispose__2733;
  id v39 = 0LL;
  CFMutableStringRef v33 = 0LL;
  serviceType = self->_serviceType;
  NSAppendPrintF(&v33);
  objc_storeStrong(&v39, v33);
  unint64_t browseFlags = self->_browseFlags;
  if (browseFlags)
  {
    v6 = v35;
    id v32 = v35[5];
    serviceType = (NSString *)browseFlags;
    NSAppendPrintF((CFMutableStringRef *)&v32);
    objc_storeStrong(v6 + 5, v32);
  }

  changeFlags = (NSString *)self->_changeFlags;
  if ((_DWORD)changeFlags)
  {
    v8 = v35;
    id v31 = v35[5];
    serviceType = changeFlags;
    NSAppendPrintF((CFMutableStringRef *)&v31);
    objc_storeStrong(v8 + 5, v31);
  }

  v9 = self->_domain;
  v10 = v9;
  if (v9)
  {
    v11 = v35;
    id obj = v35[5];
    serviceType = v9;
    NSAppendPrintF((CFMutableStringRef *)&obj);
    objc_storeStrong(v11 + 5, obj);
  }

  v12 = self->_interfaceName;
  v13 = v12;
  if (v12)
  {
    v14 = v35;
    id v29 = v35[5];
    serviceType = v12;
    NSAppendPrintF((CFMutableStringRef *)&v29);
    objc_storeStrong(v14 + 5, v29);
  }

  v15 = v35;
  id v28 = v35[5];
  uint64_t v23 = -[NSMutableDictionary count](self->_deviceMap, "count", serviceType);
  NSAppendPrintF((CFMutableStringRef *)&v28);
  objc_storeStrong(v15 + 5, v28);
  if (a3 <= 20)
  {
    v16 = v35;
    id v27 = v35[5];
    NSAppendPrintF((CFMutableStringRef *)&v27);
    objc_storeStrong(v16 + 5, v27);
    uint64_t v17 = -[NSMutableDictionary count](self->_deviceMap, "count", v23);
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x2020000000LL;
    v26[3] = 0LL;
    if (a3 >= 11) {
      int v18 = 50;
    }
    else {
      int v18 = 30;
    }
    deviceMap = self->_deviceMap;
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __41__CUBonjourBrowser_descriptionWithLevel___block_invoke;
    v24[3] = &unk_189F30DA8;
    int v25 = v18;
    v24[4] = &v34;
    v24[5] = v26;
    v24[6] = v17;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v24);
    _Block_object_dispose(v26, 8);
  }

  id v20 = v35[5];
  _Block_object_dispose(&v34, 8);

  return v20;
}

- (void)setBrowseFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__CUBonjourBrowser_setBrowseFlags___block_invoke;
  v3[3] = &unk_189F317F8;
  v3[4] = self;
  v3[5] = a3;
  -[CUBonjourBrowser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (NSArray)devices
{
  v2 = self;
  objc_sync_enter(v2);
  deviceMap = v2->_deviceMap;
  if (deviceMap)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CUBonjourBrowser_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __45__CUBonjourBrowser__activateSafeInvokeBlock___block_invoke;
    v7[3] = &unk_189F33060;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }

  else
  {
    v4[2](v4);
  }

  objc_sync_exit(v5);
}

- (void)_interrupted
{
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  -[CUBonjourBrowser _lostAllDevices](self, "_lostAllDevices");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUBonjourBrowser_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourBrowser _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v19);
    }
  }

- (void)_lostAllDevices
{
  if (self->_deviceLostHandler)
  {
    deviceMap = self->_deviceMap;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __35__CUBonjourBrowser__lostAllDevices__block_invoke;
    v5[3] = &unk_189F30DD0;
    v5[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  }

  id obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_deviceMap, "removeAllObjects");
  objc_sync_exit(obj);
}

- (void)update
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CUBonjourBrowser_update__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  id obj = self;
  objc_sync_enter(obj);
  if (!obj->_invalidateCalled && obj->_bonjourBrowser) {
    -[CUBonjourBrowser _updateLocked](obj, "_updateLocked");
  }
  objc_sync_exit(obj);
}

- (void)_updateLocked
{
  if (self->_browseFlagsChanged)
  {
    self->_browseFlagsChanged = 0;
    int v3 = BonjourBrowser_Start( (dispatch_queue_t *)self->_bonjourBrowser,  -[NSString UTF8String](self->_serviceType, "UTF8String"),  -[NSString UTF8String](self->_domain, "UTF8String"),  -[NSString UTF8String](self->_interfaceName, "UTF8String"),  self->_browseFlags);
    if (v3)
    {
      char v8 = v3;
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 != -1)
        {
LABEL_5:
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourBrowser _updateLocked]",  0x5Au,  (uint64_t)"### Bonjour start update failed: %#m\n",  v4,  v5,  v6,  v7,  v8);
          return;
        }

        if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        {
          ucat = self->_ucat;
          goto LABEL_5;
        }
      }
    }
  }

- (int)_bonjourStart
{
  p_bonjourBrowser = &self->_bonjourBrowser;
  bonjourBrowser = self->_bonjourBrowser;
  if (bonjourBrowser)
  {
    CFRetain(self->_bonjourBrowser);
    dispatch_async_f( *((dispatch_queue_t *)bonjourBrowser + 2),  bonjourBrowser,  (dispatch_function_t)_BonjourBrowser_Stop);
    CFRelease(*p_bonjourBrowser);
    *p_bonjourBrowser = 0LL;
  }

  int v14 = BonjourBrowser_CreateEx(p_bonjourBrowser, self->_ucat->var4, self->_controlFlags, v2, v3, v4, v5, v6);
  if (v14) {
    goto LABEL_5;
  }
  BonjourBrowser_SetDispatchQueue((uint64_t)self->_bonjourBrowser, (dispatch_object_s *)self->_dispatchQueue);
  uint64_t v15 = self->_bonjourBrowser;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __33__CUBonjourBrowser__bonjourStart__block_invoke;
  aBlock[3] = &unk_189F30DF8;
  aBlock[4] = self;
  BonjourBrowser_SetEventHandlerBlock((uint64_t)v15, aBlock);
  int v14 = BonjourBrowser_Start( (dispatch_queue_t *)self->_bonjourBrowser,  -[NSString UTF8String](self->_serviceType, "UTF8String"),  -[NSString UTF8String](self->_domain, "UTF8String"),  -[NSString UTF8String](self->_interfaceName, "UTF8String"),  self->_browseFlags);
  if (v14)
  {
LABEL_5:
    ucat = self->_ucat;
    if (ucat->var0 > 60) {
      goto LABEL_9;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
LABEL_9:
        uint64_t v17 = (dispatch_queue_t *)*p_bonjourBrowser;
        if (*p_bonjourBrowser)
        {
          CFRetain(*p_bonjourBrowser);
          dispatch_async_f(v17[2], v17, (dispatch_function_t)_BonjourBrowser_Stop);
          CFRelease(*p_bonjourBrowser);
          *p_bonjourBrowser = 0LL;
        }

        return v14;
      }

      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourBrowser _bonjourStart]",  0x3Cu,  (uint64_t)"### Bonjour start failed: %#m\n",  v10,  v11,  v12,  v13,  v14);
    goto LABEL_9;
  }

  return v14;
}

- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  id v15 = v6;
  switch(a3)
  {
    case 1u:
      -[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:](self, "_bonjourHandleAddOrUpdateDevice:", v6);
      break;
    case 2u:
      -[CUBonjourBrowser _bonjourHandleRemoveDevice:](self, "_bonjourHandleRemoveDevice:", v6);
      break;
    case 3u:
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_11;
      }
      if (ucat->var0 != -1) {
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
LABEL_6:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourBrowser _bonjourHandleEventType:info:]",  0x1Eu,  (uint64_t)"Bonjour stopped\n",  v7,  v8,  v9,  v10,  v14);
      }

- (void)_bonjourHandleAddOrUpdateDevice:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (const __CFDictionary *)a3;
  __int16 v41 = 0;
  uint64_t v40 = 0LL;
  BonjourDevice_GetDeviceID(v4, (char *)&v42, &v39);
  if (!v39)
  {
    NSStringWithMACAddress((uint64_t)&v42);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v10);
    uint64_t v11 = (CUBonjourDevice *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = -[CUBonjourDevice updateWithBonjourDeviceInfo:](v11, "updateWithBonjourDeviceInfo:", v4);
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
LABEL_8:
          id v15 = v12;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v16 = -[CUBonjourDevice shortDescription](v15, "shortDescription");
          }

          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0) {
              -[CUBonjourDevice descriptionWithLevel:](v15, "descriptionWithLevel:", 50LL);
            }
            else {
            uint64_t v16 = -[CUBonjourDevice description](v15, "description");
            }
          }

          id v27 = (void *)v16;

          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]",  0x1Eu,  (uint64_t)"Changed %@ %#{flags}\n",  v28,  v29,  v30,  v31,  (char)v27);
          goto LABEL_30;
        }

        if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        {
          ucat = self->_ucat;
          goto LABEL_8;
        }
      }

- (void)_bonjourHandleRemoveDevice:(id)a3
{
  uint64_t v4 = (const __CFDictionary *)a3;
  BonjourDevice_GetDeviceID(v4, v28, &v29);
  if (!v29)
  {
    NSStringWithMACAddress((uint64_t)v28);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v10);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      uint64_t v16 = self;
      objc_sync_enter(v16);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v10);
      objc_sync_exit(v16);

      ucat = v16->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
LABEL_8:
          id v18 = v15;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v19 = [v18 shortDescription];
          }

          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0) {
              [v18 descriptionWithLevel:50];
            }
            else {
            uint64_t v19 = [v18 description];
            }
          }

          v21 = (void *)v19;

          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]",  0x1Eu,  (uint64_t)"Lost %@\n",  v22,  v23,  v24,  v25,  (char)v21);
          goto LABEL_24;
        }

        if (_LogCategory_Initialize((uint64_t)v16->_ucat, 0x1Eu))
        {
          ucat = v16->_ucat;
          goto LABEL_8;
        }
      }

- (unint64_t)browseFlags
{
  return self->_browseFlags;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
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

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __33__CUBonjourBrowser__bonjourStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bonjourHandleEventType:a2 info:a3];
}

uint64_t __26__CUBonjourBrowser_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void __35__CUBonjourBrowser__lostAllDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v9 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v12) {
        goto LABEL_5;
      }
      uint64_t v11 = *(int **)(v10 + 40);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUBonjourBrowser _lostAllDevices]_block_invoke",  0x1Eu,  (uint64_t)"Bonjour lost    %@\n",  v5,  v6,  v7,  v8,  (char)v9);
    uint64_t v10 = *(void *)(a1 + 32);
  }

uint64_t __30__CUBonjourBrowser_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(_BYTE *)(v8 + 24)) {
    return result;
  }
  uint64_t v9 = result;
  *(_BYTE *)(v8 + 24) = 1;
  uint64_t v10 = *(void *)(result + 32);
  uint64_t v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize(*(void *)(v10 + 40), 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = *(int **)(v10 + 40);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUBonjourBrowser invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v14);
    uint64_t v10 = *(void *)(v9 + 32);
  }

uint64_t __45__CUBonjourBrowser__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __28__CUBonjourBrowser_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 40);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 40);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUBonjourBrowser activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate %@\n",  a5,  a6,  a7,  a8,  *(void *)(v9 + 104));
    uint64_t v9 = *(void *)(a1 + 32);
  }

uint64_t __35__CUBonjourBrowser_setBrowseFlags___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 64))
  {
    *(void *)(v2 + 64) = v1;
    *(_BYTE *)(*(void *)(result + 32) + 48LL) = 1;
  }

  return result;
}

void __41__CUBonjourBrowser_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v6 + 40);
  CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF((CFMutableStringRef *)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) >= 0x11uLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v9 = *(id *)(v7 + 40);
    NSAppendPrintF((CFMutableStringRef *)&v9);
    objc_storeStrong((id *)(v7 + 40), v9);
    *a4 = 1;
  }

@end