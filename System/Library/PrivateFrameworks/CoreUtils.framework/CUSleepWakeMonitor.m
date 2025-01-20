@interface CUSleepWakeMonitor
- (CUSleepWakeMonitor)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)sleepWakeHandler;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)_sleepWakeHandlerForService:(unsigned int)a3 type:(unsigned int)a4 arg:(void *)a5;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSleepWakeHandler:(id)a3;
@end

@implementation CUSleepWakeMonitor

- (CUSleepWakeMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUSleepWakeMonitor;
  v2 = -[CUSleepWakeMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUSleepWakeMonitor;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)&OBJC_CLASS___CUSleepWakeMonitor;
  -[CUSleepWakeMonitor dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __45__CUSleepWakeMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__CUSleepWakeMonitor_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUSleepWakeMonitor _invalidate]",  0x1Eu,  (uint64_t)"Invalidating\n",  v2,  v3,  v4,  v5,  v8);
    }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }

    else
    {
      id v4 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    id sleepWakeHandler = self->_sleepWakeHandler;
    self->_id sleepWakeHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUSleepWakeMonitor _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v6,  v7,  v8,  v9,  v11);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }

- (void)_ensureStarted
{
  if (self->_powerCnx) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUSleepWakeMonitor _ensureStarted]",  0x1Eu,  (uint64_t)"Monitoring start\n",  v2,  v3,  v4,  v5,  v18);
      goto LABEL_7;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }

- (void)_ensureStopped
{
  if (self->_powerCnx)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUSleepWakeMonitor _ensureStopped]",  0x1Eu,  (uint64_t)"Monitoring stop\n",  v2,  v3,  v4,  v5,  v10);
        goto LABEL_6;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }

- (void)_sleepWakeHandlerForService:(unsigned int)a3 type:(unsigned int)a4 arg:(void *)a5
{
  if ((int)a4 > -536870369)
  {
    if ((int)a4 > -536870289)
    {
      if ((int)a4 <= -536870257)
      {
        if (a4 == -536870288)
        {
          uint64_t v12 = "CanSystemSleep";
          goto LABEL_51;
        }

        if (a4 == -536870272)
        {
          uint64_t v12 = "SystemWillSleep";
          goto LABEL_51;
        }
      }

      else
      {
        switch(a4)
        {
          case 0xE0000290:
            uint64_t v12 = "SystemWillNotSleep";
            goto LABEL_51;
          case 0xE0000300:
            uint64_t v12 = "SystemHasPoweredOn";
            goto LABEL_51;
          case 0xE0000310:
            uint64_t v12 = "SystemWillRestart";
            goto LABEL_51;
        }
      }
    }

    else if ((int)a4 <= -536870337)
    {
      if (a4 == -536870368)
      {
        uint64_t v12 = "DeviceWillNotPowerOff";
        goto LABEL_51;
      }

      if (a4 == -536870352)
      {
        uint64_t v12 = "DeviceHasPoweredOn";
        goto LABEL_51;
      }
    }

    else
    {
      switch(a4)
      {
        case 0xE0000240:
          uint64_t v12 = "CanSystemPowerOff";
          goto LABEL_51;
        case 0xE0000250:
          uint64_t v12 = "SystemWillPowerOff";
          goto LABEL_51;
        case 0xE0000260:
          uint64_t v12 = "SystemWillNotPowerOff";
          goto LABEL_51;
      }
    }
  }

  else if ((int)a4 > -536870641)
  {
    if ((int)a4 <= -536870609)
    {
      if (a4 == -536870640)
      {
        uint64_t v12 = "WasClosed";
        goto LABEL_51;
      }

      if (a4 == -536870624)
      {
        uint64_t v12 = "BusyStateChange";
        goto LABEL_51;
      }
    }

    else
    {
      switch(a4)
      {
        case 0xE0000130:
          uint64_t v12 = "PropertyChange";
          goto LABEL_51;
        case 0xE0000200:
          uint64_t v12 = "CanDevicePowerOff";
          goto LABEL_51;
        case 0xE0000210:
          uint64_t v12 = "DeviceWillPowerOff";
          goto LABEL_51;
      }
    }
  }

  else if ((int)a4 <= -536870865)
  {
    if (a4 == -536870896)
    {
      uint64_t v12 = "IsTerminated";
      goto LABEL_51;
    }

    if (a4 == -536870880)
    {
      uint64_t v12 = "IsSuspended";
      goto LABEL_51;
    }
  }

  else
  {
    switch(a4)
    {
      case 0xE0000030:
        uint64_t v12 = "IsResumed";
        goto LABEL_51;
      case 0xE0000100:
        uint64_t v12 = "IsRequestingClose";
        goto LABEL_51;
      case 0xE0000101:
        uint64_t v12 = "IsAttemptingOpen";
        goto LABEL_51;
    }
  }

  if (a4 == -536870112) {
    uint64_t v12 = "SystemWillPowerOn";
  }
  else {
    uint64_t v12 = "?";
  }
LABEL_51:
  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_55;
  }
  if (ucat->var0 != -1) {
    goto LABEL_53;
  }
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_53:
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]",  0x1Eu,  (uint64_t)"Event: %s\n",  v8,  v9,  v10,  v11,  (char)v12);
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

- (NSString)label
{
  return self->_label;
}

- (id)sleepWakeHandler
{
  return self->_sleepWakeHandler;
}

- (void)setSleepWakeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke_2;
  block[3] = &unk_189F31B08;
  int v1 = *(_DWORD *)(a1 + 48);
  __int128 v4 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v4 + 48);
  int v5 = v1;
  dispatch_async(v2, block);
}

uint64_t __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  io_connect_t v9 = *(_DWORD *)(v8 + 12);
  if (!v9) {
    return result;
  }
  uint64_t v10 = result;
  int v11 = *(_DWORD *)(result + 48);
  if (v11 > -536870369)
  {
    if (v11 > -536870289)
    {
      if (v11 <= -536870257)
      {
        if (v11 == -536870288)
        {
          uint64_t v12 = "CanSystemSleep";
          goto LABEL_52;
        }

        if (v11 == -536870272)
        {
          uint64_t v12 = "SystemWillSleep";
          goto LABEL_52;
        }
      }

      else
      {
        switch(v11)
        {
          case -536870256:
            uint64_t v12 = "SystemWillNotSleep";
            goto LABEL_52;
          case -536870144:
            uint64_t v12 = "SystemHasPoweredOn";
            goto LABEL_52;
          case -536870128:
            uint64_t v12 = "SystemWillRestart";
            goto LABEL_52;
        }
      }
    }

    else if (v11 <= -536870337)
    {
      if (v11 == -536870368)
      {
        uint64_t v12 = "DeviceWillNotPowerOff";
        goto LABEL_52;
      }

      if (v11 == -536870352)
      {
        uint64_t v12 = "DeviceHasPoweredOn";
        goto LABEL_52;
      }
    }

    else
    {
      switch(v11)
      {
        case -536870336:
          uint64_t v12 = "CanSystemPowerOff";
          goto LABEL_52;
        case -536870320:
          uint64_t v12 = "SystemWillPowerOff";
          goto LABEL_52;
        case -536870304:
          uint64_t v12 = "SystemWillNotPowerOff";
          goto LABEL_52;
      }
    }
  }

  else if (v11 > -536870641)
  {
    if (v11 <= -536870609)
    {
      if (v11 == -536870640)
      {
        uint64_t v12 = "WasClosed";
        goto LABEL_52;
      }

      if (v11 == -536870624)
      {
        uint64_t v12 = "BusyStateChange";
        goto LABEL_52;
      }
    }

    else
    {
      switch(v11)
      {
        case -536870608:
          uint64_t v12 = "PropertyChange";
          goto LABEL_52;
        case -536870400:
          uint64_t v12 = "CanDevicePowerOff";
          goto LABEL_52;
        case -536870384:
          uint64_t v12 = "DeviceWillPowerOff";
          goto LABEL_52;
      }
    }
  }

  else if (v11 <= -536870865)
  {
    if (v11 == -536870896)
    {
      uint64_t v12 = "IsTerminated";
      goto LABEL_52;
    }

    if (v11 == -536870880)
    {
      uint64_t v12 = "IsSuspended";
      goto LABEL_52;
    }
  }

  else
  {
    switch(v11)
    {
      case -536870864:
        uint64_t v12 = "IsResumed";
        goto LABEL_52;
      case -536870656:
        uint64_t v12 = "IsRequestingClose";
        goto LABEL_52;
      case -536870655:
        uint64_t v12 = "IsAttemptingOpen";
        goto LABEL_52;
    }
  }

  if (v11 == -536870112) {
    uint64_t v12 = "SystemWillPowerOn";
  }
  else {
    uint64_t v12 = "?";
  }
LABEL_52:
  uint64_t v13 = *(int **)(v8 + 40);
  if (*v13 <= 30)
  {
    if (*v13 == -1)
    {
      uint64_t v13 = *(int **)(*(void *)(v10 + 32) + 40LL);
    }

    LogPrintF( (uint64_t)v13,  (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]_block_invoke_2",  0x1Eu,  (uint64_t)"Event: %s async ack\n",  a5,  a6,  a7,  a8,  (char)v12);
  }

uint64_t __32__CUSleepWakeMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __45__CUSleepWakeMonitor_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  io_connect_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[5];
  if (*v10 > 30) {
    goto LABEL_5;
  }
  if (*v10 != -1) {
    goto LABEL_3;
  }
  BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
  io_connect_t v9 = *(void **)(a1 + 32);
  if (v11)
  {
    uint64_t v10 = (int *)v9[5];
LABEL_3:
    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUSleepWakeMonitor activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    io_connect_t v9 = *(void **)(a1 + 32);
  }

@end