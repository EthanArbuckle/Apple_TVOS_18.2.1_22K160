id sub_44EC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 8) copyIOHIDServicePropertyForKey:a2];
}

id sub_44F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 8) setIOHIDServicePropertyForKey:a2 withValue:a3];
}

id sub_4518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 8) setIOHIDServiceEventCallback:a2 target:a3 context:a4];
}

id sub_452C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 8) scheduleWithDispatchQueue:a2];
}

id sub_4538(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 8) unscheduleFromDispatchQueue:a2];
}

void *IUnknown_Init(void *result, void *a2, uint64_t a3)
{
  *result = *a2;
  result[1] = a3;
  return result;
}

uint64_t IUnknown_QueryInterface(uint64_t a1, CFUUIDBytes a2, void *a3)
{
  uint64_t v3 = 2147483652LL;
  if (!a3) {
    return 2147483653LL;
  }
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, a2);
  *a3 = [*(id *)(a1 + 8) interfaceWithID:v6];
  CFRelease(v6);
  if (*a3)
  {
    id v7 = *(id *)(a1 + 8);
    [*(id *)(a1 + 8) retainCount];
    return 0LL;
  }

  return v3;
}

id IUnknown_AddRef(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return [*(id *)(a1 + 8) retainCount];
}

uint64_t IUnknown_Release(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 8) retainCount];

  return v2 - 1;
}

id sub_4638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 8) probeIOService:a3 propertyTable:a2 order:a4];
}

id sub_4648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 8) startWithIOService:a3 propertyTable:a2];
}

id sub_4654(uint64_t a1)
{
  return [*(id *)(a1 + 8) stop];
}
}

IUnknown *CoreRCHIDServiceFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  5u,  0x16u,  0xB5u,  0x63u,  0xB1u,  0x5Bu,  0x11u,  0xDAu,  0x96u,  0xEBu,  0,  0x14u,  0x51u,  0x97u,  0x58u,  0xEFu);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  v4 = objc_alloc_init(&OBJC_CLASS___CoreRCHIDService);
  v5 = -[CoreRCHIDService interfaceWithID:]( v4,  "interfaceWithID:",  CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u));
  CFUUIDRef v6 = v5;
  if (v5) {
    ((void (*)(IUnknown *))v5->Release)(v5);
  }

  return v6;
}

LABEL_8:
  id v7 = [(id)v15[5] copy];
  _Block_object_dispose(&v14, 8);
  return v7;
}

void sub_53B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_53D0(uint64_t a1, uint64_t a2)
{
}

void sub_53E0(uint64_t a1)
{
}

id sub_53EC(void *a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unsigned int v2 = *(void **)(a1[4] + 72LL);
  id result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
      uint64_t v9 = 0LL;
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___CoreIRBus);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        id result = [v7 propertyForKey:a1[5] error:&v9];
        *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = result;
        if (*(void *)(*(void *)(a1[6] + 8LL) + 40LL)) {
          break;
        }
      }

      if (v4 == (id)++v6)
      {
        id result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v4 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }

  return result;
}

uint64_t sub_55E0(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) containsString:@"com.apple.AppleTVHID"];
  if ((_DWORD)result)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 72LL);
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v9 = v6;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v5);
          }
          __int128 v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          uint64_t v18 = 0LL;
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___CoreIRBus);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            uint64_t result = (uint64_t)[v12 setProperty:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32) error:&v18];
            if ((result & 1) != 0) {
              return result;
            }
            if (gLogCategory_CoreRCHID <= 90
              && (gLogCategory_CoreRCHID != -1
               || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 90LL, v14, v15)))
            {
              LogPrintF( &gLogCategory_CoreRCHID,  "-[CoreRCHIDService setIOHIDServicePropertyForKey:withValue:]_block_invoke",  90LL,  "setting property on bus failed %@",  v18);
            }
          }
        }

        id v9 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v9);
    }

    if (gLogCategory_CoreRCHID <= 90
      && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 90LL, v7, v8)))
    {
      LogPrintF( &gLogCategory_CoreRCHID,  "-[CoreRCHIDService setIOHIDServicePropertyForKey:withValue:]_block_invoke",  90LL,  "setIOHIDServicePropertyForKey no IR busses found\n");
    }

    uint64_t result = (uint64_t)[*(id *)(a1 + 32) containsString:@"com.apple.AppleTVHID.SILControl"];
    if ((_DWORD)result)
    {
      if (gLogCategory_CoreRCHID <= 40
        && (gLogCategory_CoreRCHID != -1
         || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 40LL, v16, v17)))
      {
        LogPrintF( &gLogCategory_CoreRCHID,  "-[CoreRCHIDService setIOHIDServicePropertyForKey:withValue:]_block_invoke",  40LL,  "Deferring SIL control until bus is added\n");
      }

      uint64_t result = (uint64_t)[*(id *)(a1 + 48) copy];
      *(void *)(*(void *)(a1 + 40) + 96LL) = result;
    }
  }

  else if (gLogCategory_CoreRCHID <= 10)
  {
    if (gLogCategory_CoreRCHID != -1) {
      return LogPrintF( &gLogCategory_CoreRCHID,  "-[CoreRCHIDService setIOHIDServicePropertyForKey:withValue:]_block_invoke",  10LL,  "Unsupported HID key: %@ (value: %@)\n",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
    }
    uint64_t result = _LogCategory_Initialize(&gLogCategory_CoreRCHID, 10LL, v3, v4);
    if ((_DWORD)result) {
      return LogPrintF( &gLogCategory_CoreRCHID,  "-[CoreRCHIDService setIOHIDServicePropertyForKey:withValue:]_block_invoke",  10LL,  "Unsupported HID key: %@ (value: %@)\n",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
    }
  }

  return result;
}

void *sub_5B40(void *result)
{
  if (!*(void *)(result[4] + 104LL))
  {
    v1 = result;
    *(void *)(result[4] + 104LL) = -[CoreRCManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CoreRCManager),  "initWithSerialQueue:",  *(void *)(result[4] + 88LL));
    return objc_msgSend(*(id *)(v1[4] + 104), "setDelegate:");
  }

  return result;
}

void sub_5C58(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 104LL);
  if (v2)
  {
    [v2 setDelegate:0];
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v3 = +[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", *(void *)(*(void *)(a1 + 32) + 72LL));
    id v4 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1 + 32) removeBus:*(void *)(*((void *)&v17 + 1) + 8 * (void)v7)];
          uint64_t v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
      }

      while (v5);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v8 = +[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", *(void *)(*(void *)(a1 + 32) + 80LL), 0LL);
    id v9 = -[NSSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        __int128 v12 = 0LL;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) removeDevice:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12)];
          __int128 v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
      }

      while (v10);
    }

    *(void *)(*(void *)(a1 + 32) + 104LL) = 0LL;
  }

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithSet:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    -[NSMutableSet addObject:](self->_monitoredBuses, "addObject:", a3);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v6 = [a3 devices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CoreRCHIDService addDevice:](self, "addDevice:", *(void *)(*((void *)&v17 + 1) + 8LL * (void)i));
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  [a3 setDelegate:self];
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CoreIRBus);
  if ((objc_opt_isKindOfClass(a3, v11) & 1) != 0 && self->_deferredSIL)
  {
    __int128 v16 = 0LL;
    if (gLogCategory_CoreRCHID <= 40
      && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 40LL, v12, v13)))
    {
      LogPrintF( &gLogCategory_CoreRCHID,  "-[CoreRCHIDService addBus:]",  40LL,  "setting deferred SIL control property on bus");
    }

    if ([a3 setProperty:self->_deferredSIL forKey:@"com.apple.AppleTVHID.SILControl" error:&v16])
    {
      self->_deferredSIL = 0LL;
    }

    else if (gLogCategory_CoreRCHID <= 90 {
           && (gLogCategory_CoreRCHID != -1
    }
            || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 90LL, v14, v15)))
    {
      LogPrintF(&gLogCategory_CoreRCHID, "-[CoreRCHIDService addBus:]", 90LL, "setting property on bus failed %@", v16);
    }
  }

- (void)removeBus:(id)a3
{
  if (gLogCategory_CoreRCHID <= 40
    && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 40LL, a3, v3)))
  {
    LogPrintF(&gLogCategory_CoreRCHID, "-[CoreRCHIDService removeBus:]", 40LL, "removeBus: %@\n", a3);
  }

  if ([a3 delegate] == self) {
    [a3 setDelegate:0];
  }
  -[NSMutableSet removeObject:](self->_monitoredBuses, "removeObject:", a3);
}

- (void)addDevice:(id)a3
{
  if (gLogCategory_CoreRCHID <= 40
    && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 40LL, a3, v3)))
  {
    LogPrintF(&gLogCategory_CoreRCHID, "-[CoreRCHIDService addDevice:]", 40LL, "addDevice: %@\n", a3);
  }

  -[NSMutableSet addObject:](self->_monitoredDevices, "addObject:", a3);
  [a3 setDelegate:self];
}

- (void)removeDevice:(id)a3
{
  if (gLogCategory_CoreRCHID <= 40
    && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCHID, 40LL, a3, v3)))
  {
    LogPrintF(&gLogCategory_CoreRCHID, "-[CoreRCHIDService removeDevice:]", 40LL, "removeDevice: %@\n", a3);
  }

  if ([a3 delegate] == self) {
    [a3 setDelegate:0];
  }
  -[NSMutableSet removeObject:](self->_monitoredDevices, "removeObject:", a3);
}

- (CoreRCManager)manager
{
  return self->_manager;
}

@end