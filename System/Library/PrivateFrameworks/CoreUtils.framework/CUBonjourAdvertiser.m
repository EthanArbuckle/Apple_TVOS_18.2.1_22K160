@interface CUBonjourAdvertiser
- (CUBonjourAdvertiser)init;
- (NSDictionary)txtDictionary;
- (NSString)domain;
- (NSString)interfaceName;
- (NSString)label;
- (NSString)name;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)port;
- (unint64_t)advertiseFlags;
- (unsigned)interfaceIndex;
- (void)_activateLocked;
- (void)_activateSafeInvokeBlock:(id)a3;
- (void)_updateLocked;
- (void)_updateTXTDictionary;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setAdvertiseFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInterfaceIndex:(unsigned int)a3;
- (void)setInterfaceName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setPort:(int)a3;
- (void)setServiceType:(id)a3;
- (void)setTxtDictionary:(id)a3;
@end

@implementation CUBonjourAdvertiser

- (CUBonjourAdvertiser)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUBonjourAdvertiser;
  v2 = -[CUBonjourAdvertiser init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBonjourAdvertiser;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBonjourAdvertiser;
  -[CUBonjourAdvertiser dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[CUBonjourAdvertiser descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v33 = 0LL;
  NSAppendPrintF(&v33);
  v5 = v33;
  v6 = v5;
  if (self->_name)
  {
    CFMutableStringRef v32 = v5;
    NSAppendPrintF(&v32);
    v7 = v32;

    v6 = v7;
  }

  CFMutableStringRef v31 = v6;
  unint64_t port = self->_port;
  NSAppendPrintF(&v31);
  v8 = v31;

  unint64_t advertiseFlags = self->_advertiseFlags;
  if (advertiseFlags)
  {
    CFMutableStringRef v30 = v8;
    unint64_t port = advertiseFlags;
    NSAppendPrintF(&v30);
    v10 = v30;

    v8 = v10;
  }

  domain = self->_domain;
  if (domain)
  {
    CFMutableStringRef v29 = v8;
    unint64_t port = (unint64_t)domain;
    NSAppendPrintF(&v29);
    v12 = v29;

    v8 = v12;
  }

  unint64_t interfaceIndex = self->_interfaceIndex;
  if ((_DWORD)interfaceIndex)
  {
    CFMutableStringRef v28 = v8;
    unint64_t port = interfaceIndex;
    NSAppendPrintF(&v28);
    v14 = v28;

    v8 = v14;
  }

  interfaceName = self->_interfaceName;
  if (interfaceName)
  {
    CFMutableStringRef v27 = v8;
    unint64_t port = (unint64_t)interfaceName;
    NSAppendPrintF(&v27);
    v16 = v27;

    v8 = v16;
  }

  if (a3 >= 50)
  {
    CFMutableStringRef v26 = v8;
    -[NSDictionary count](self->_txtDictionary, "count", port);
    v17 = &v26;
    NSAppendPrintF(&v26);
LABEL_18:
    v20 = *v17;

    return v20;
  }

  if (self->_txtDictionary)
  {
    v25 = v8;
    v18 = (id *)&v25;
    v19 = &v25;
  }

  else
  {
    v24 = v8;
    v18 = (id *)&v24;
    v19 = &v24;
  }

  NSAppendPrintF(v19);
  v20 = (__CFString *)*v18;

  if (a3 <= 20)
  {
    CFMutableStringRef v23 = v20;
    v17 = &v23;
    NSAppendPrintF(&v23);
    v8 = v20;
    goto LABEL_18;
  }

  return v20;
}

- (void)setAdvertiseFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__CUBonjourAdvertiser_setAdvertiseFlags___block_invoke;
  v3[3] = &unk_189F30D30;
  v3[4] = self;
  v3[5] = a3;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __33__CUBonjourAdvertiser_setDomain___block_invoke;
  v6[3] = &unk_189F30D58;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);
}

- (void)setInterfaceIndex:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__CUBonjourAdvertiser_setInterfaceIndex___block_invoke;
  v3[3] = &unk_189F30D80;
  unsigned int v4 = a3;
  v3[4] = self;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setInterfaceName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __40__CUBonjourAdvertiser_setInterfaceName___block_invoke;
  v6[3] = &unk_189F30D58;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)setName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __31__CUBonjourAdvertiser_setName___block_invoke;
  v6[3] = &unk_189F30D58;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);
}

- (void)setPort:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31__CUBonjourAdvertiser_setPort___block_invoke;
  v3[3] = &unk_189F30D80;
  int v4 = a3;
  v3[4] = self;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setServiceType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __38__CUBonjourAdvertiser_setServiceType___block_invoke;
  v6[3] = &unk_189F30D58;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);
}

- (void)setTxtDictionary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __40__CUBonjourAdvertiser_setTxtDictionary___block_invoke;
  v6[3] = &unk_189F30D58;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__CUBonjourAdvertiser_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

- (void)_activateLocked
{
  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  if (self->_bonjourAdvertiser) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUBonjourAdvertiser _activateLocked]",  0x1Eu,  (uint64_t)"Activate name=%@, service=%@, domain=%@, port=%d, ifname=%@, ifindex=%u, flags=0x%llX",  v2,  v3,  v4,  v5,  *(_OWORD *)&self->_name);
  }

- (void)_activateSafeInvokeBlock:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4[2](v4) && v5->_activated && !v5->_invalidateCalled && !v5->_updatePending)
  {
    v5->_updatePending = 1;
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __48__CUBonjourAdvertiser__activateSafeInvokeBlock___block_invoke;
    block[3] = &unk_189F34238;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__CUBonjourAdvertiser_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateLocked
{
  bonjourAdvertiser = self->_bonjourAdvertiser;
  if (bonjourAdvertiser)
  {
    BOOL advertiseFlagsChanged = self->_advertiseFlagsChanged;
    if (self->_advertiseFlagsChanged)
    {
      *((void *)bonjourAdvertiser + 13) = self->_advertiseFlags;
      self->_BOOL advertiseFlagsChanged = 0;
    }

    if (!self->_domainChanged)
    {
LABEL_11:
      if (self->_interfaceIndexChanged)
      {
        *((_DWORD *)self->_bonjourAdvertiser + 28) = self->_interfaceIndex;
        self->_interfaceIndexChanged = 0;
        BOOL advertiseFlagsChanged = 1;
      }

      if (self->_interfaceNameChanged)
      {
        -[NSString UTF8String](self->_interfaceName, "UTF8String");
        __strlcpy_chk();
        self->_interfaceNameChanged = 0;
        BOOL advertiseFlagsChanged = 1;
      }

      if (self->_nameChanged)
      {
        ReplaceDifferentString( (void **)self->_bonjourAdvertiser + 17,  (char *)-[NSString UTF8String](self->_name, "UTF8String"));
        self->_nameChanged = 0;
        BOOL advertiseFlagsChanged = 1;
      }

      if (self->_portChanged)
      {
        *((_DWORD *)self->_bonjourAdvertiser + 37) = self->_port;
        self->_portChanged = 0;
        BOOL advertiseFlagsChanged = 1;
      }

      if (self->_serviceTypeChanged)
      {
        ReplaceDifferentString( (void **)self->_bonjourAdvertiser + 19,  (char *)-[NSString UTF8String](self->_serviceType, "UTF8String"));
        self->_serviceTypeChanged = 0;
        BOOL advertiseFlagsChanged = 1;
      }

      if (self->_txtDictionaryChanged)
      {
        -[CUBonjourAdvertiser _updateTXTDictionary](self, "_updateTXTDictionary");
        self->_txtDictionaryChanged = 0;
        if (!self->_started) {
          goto LABEL_27;
        }
      }

      else
      {
        if (!self->_started)
        {
LABEL_27:
          uint64_t v11 = self->_bonjourAdvertiser;
          CFRetain(v11);
          dispatch_async_f(*((dispatch_queue_t *)v11 + 3), v11, (dispatch_function_t)_BonjourAdvertiserStart);
          self->_started = 1;
          return;
        }

        if (!advertiseFlagsChanged) {
          return;
        }
      }

      uint64_t v10 = self->_bonjourAdvertiser;
      CFRetain(v10);
      dispatch_async_f(*((dispatch_queue_t *)v10 + 3), v10, (dispatch_function_t)_BonjourAdvertiserUpdate);
      return;
    }

    if (ReplaceDifferentString( (void **)bonjourAdvertiser + 12,  (char *)-[NSString UTF8String](self->_domain, "UTF8String")))
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourAdvertiser _updateLocked]",  0x3Cu,  (uint64_t)"### Set domain '%@' failed: %#m\n",  v5,  v6,  v7,  v8,  (char)self->_domain);
      }
    }

- (void)_updateTXTDictionary
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (self->_txtDictionary)
  {
    uint64_t v29 = 0LL;
    CFMutableStringRef v30 = (TXTRecordRef *)&v29;
    uint64_t v31 = 0x3010000000LL;
    CFMutableStringRef v32 = "";
    TXTRecordCreate(&v33, 0x100u, buffer);
    txtDictionary = self->_txtDictionary;
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __43__CUBonjourAdvertiser__updateTXTDictionary__block_invoke;
    v27[3] = &unk_189F33460;
    v27[4] = self;
    v27[5] = &v29;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](txtDictionary, "enumerateKeysAndObjectsUsingBlock:", v27);
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]",  0x1Eu,  (uint64_t)"Update TXT: %##@\n",  v8,  v9,  v10,  v11,  (char)self->_txtDictionary);
    }

- (unint64_t)advertiseFlags
{
  return self->_advertiseFlags;
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

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

- (int)port
{
  return self->_port;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (void).cxx_destruct
{
}

void __43__CUBonjourAdvertiser__updateTXTDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v40 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = (const char *)[v5 UTF8String];
    size_t v7 = strlen(v6);
    if (v7 >= 0x100)
    {
      v38 = *(int **)(*(void *)(a1 + 32) + 32LL);
      if (*v38 <= 60)
      {
        if (*v38 == -1)
        {
          v38 = *(int **)(*(void *)(a1 + 32) + 32LL);
        }

        LogPrintF( (uint64_t)v38,  (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke",  0x3Cu,  (uint64_t)"### TXT item '%@', '%@' value too long\n",  v8,  v9,  v10,  v11,  (char)v40);
      }
    }

    else
    {
      uint8_t v12 = v7;
      uint64_t v13 = (TXTRecordRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL);
      id v14 = v40;
      if (TXTRecordSetValue(v13, (const char *)[v14 UTF8String], v12, v6))
      {
        uint64_t v19 = *(int **)(*(void *)(a1 + 32) + 32LL);
        if (*v19 <= 60)
        {
          if (*v19 == -1)
          {
            uint64_t v19 = *(int **)(*(void *)(a1 + 32) + 32LL);
          }

          LogPrintF( (uint64_t)v19,  (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke",  0x3Cu,  (uint64_t)"### Set TXT item '%@', '%@' failed: %#m\n",  v15,  v16,  v17,  v18,  (char)v14);
        }
      }
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 BOOLValue])
    {
      uint64_t v20 = (TXTRecordRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL);
      id v21 = v40;
      if (TXTRecordSetValue(v20, (const char *)[v21 UTF8String], 0, 0))
      {
        char v26 = *(int **)(*(void *)(a1 + 32) + 32LL);
        if (*v26 <= 60)
        {
          if (*v26 == -1)
          {
            char v26 = *(int **)(*(void *)(a1 + 32) + 32LL);
          }

          LogPrintF( (uint64_t)v26,  (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke",  0x3Cu,  (uint64_t)"### Set TXT item '%@', true failed: %#m\n",  v22,  v23,  v24,  v25,  (char)v21);
        }
      }
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v31 = (TXTRecordRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL);
        id v32 = v40;
        if (TXTRecordSetValue(v31, (const char *)[v32 UTF8String], 0, 0))
        {
          v37 = *(int **)(*(void *)(a1 + 32) + 32LL);
          if (*v37 <= 60)
          {
            if (*v37 == -1)
            {
              v37 = *(int **)(*(void *)(a1 + 32) + 32LL);
            }

            LogPrintF( (uint64_t)v37,  (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke",  0x3Cu,  (uint64_t)"### Set TXT item '%@', null failed: %#m\n",  v33,  v34,  v35,  v36,  (char)v32);
          }
        }
      }

      else
      {
        v39 = *(int **)(*(void *)(a1 + 32) + 32LL);
        if (*v39 <= 60)
        {
          if (*v39 == -1)
          {
            v39 = *(int **)(*(void *)(a1 + 32) + 32LL);
          }

          LogPrintF( (uint64_t)v39,  (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke",  0x3Cu,  (uint64_t)"### TXT item '%@', unsupported value '%@'\n",  v27,  v28,  v29,  v30,  (char)v40);
        }
      }
    }
  }

void __33__CUBonjourAdvertiser_invalidate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 1;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(int **)(v10 + 32);
    if (*v11 > 30) {
      goto LABEL_6;
    }
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v12)
      {
LABEL_6:
        uint64_t v13 = *(dispatch_queue_t **)(v10 + 16);
        if (v13)
        {
          CFRetain(*(CFTypeRef *)(v10 + 16));
          dispatch_async_f(v13[3], v13, (dispatch_function_t)_BonjourAdvertiserStop);
          CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 16LL));
          *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
        }

        return;
      }

      uint64_t v11 = *(int **)(v10 + 32);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUBonjourAdvertiser invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v14);
    uint64_t v10 = *(void *)(a1 + 32);
    goto LABEL_6;
  }

void __48__CUBonjourAdvertiser__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_BYTE *)(*(void *)(a1 + 32) + 40LL) = 0;
  [*(id *)(a1 + 32) _updateLocked];
  objc_sync_exit(obj);
}

void __31__CUBonjourAdvertiser_activate__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  [*(id *)(a1 + 32) _activateLocked];
  objc_sync_exit(obj);
}

uint64_t __40__CUBonjourAdvertiser_setTxtDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 120LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0LL;
  }

  id v5 = v4;
  if ((v3 == 0LL) != (v4 != 0LL))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0LL;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 120);
  *(void *)(v9 + 120) = v8;

  uint64_t result = 1LL;
  *(_BYTE *)(*(void *)(a1 + 40) + 48LL) = 1;
  return result;
}

uint64_t __38__CUBonjourAdvertiser_setServiceType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 112LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0LL;
  }

  id v5 = v4;
  if ((v3 == 0LL) != (v4 != 0LL))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0LL;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v8;

  uint64_t result = 1LL;
  *(_BYTE *)(*(void *)(a1 + 40) + 47LL) = 1;
  return result;
}

BOOL __31__CUBonjourAdvertiser_setPort___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 56);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 56) = v1;
    *(_BYTE *)(*(void *)(a1 + 32) + 46LL) = 1;
  }

  return v1 != v3;
}

uint64_t __31__CUBonjourAdvertiser_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 104LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0LL;
  }

  id v5 = v4;
  if ((v3 == 0LL) != (v4 != 0LL))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0LL;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 104);
  *(void *)(v9 + 104) = v8;

  uint64_t result = 1LL;
  *(_BYTE *)(*(void *)(a1 + 40) + 45LL) = 1;
  return result;
}

uint64_t __40__CUBonjourAdvertiser_setInterfaceName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 88LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0LL;
  }

  id v5 = v4;
  if ((v3 == 0LL) != (v4 != 0LL))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0LL;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = v8;

  uint64_t result = 1LL;
  *(_BYTE *)(*(void *)(a1 + 40) + 44LL) = 1;
  return result;
}

BOOL __41__CUBonjourAdvertiser_setInterfaceIndex___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 52);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 52) = v1;
    *(_BYTE *)(*(void *)(a1 + 32) + 43LL) = 1;
  }

  return v1 != v3;
}

uint64_t __33__CUBonjourAdvertiser_setDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 80LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0LL;
  }

  id v5 = v4;
  if ((v3 == 0LL) != (v4 != 0LL))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0LL;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v8;

  uint64_t result = 1LL;
  *(_BYTE *)(*(void *)(a1 + 40) + 42LL) = 1;
  return result;
}

BOOL __41__CUBonjourAdvertiser_setAdvertiseFlags___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 64);
  if (v1 != v3)
  {
    *(void *)(v2 + 64) = v1;
    *(_BYTE *)(*(void *)(a1 + 32) + 41LL) = 1;
  }

  return v1 != v3;
}

@end