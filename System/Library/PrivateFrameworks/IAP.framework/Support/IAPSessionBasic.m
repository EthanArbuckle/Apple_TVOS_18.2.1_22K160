@interface IAPSessionBasic
- (BOOL)bufferToAppHasSpaceAvailable;
- (BOOL)closeDataPipes;
- (BOOL)isPacketAvailable;
- (EAPacket)consumeNextOutPacket;
- (IAPSessionBasic)init;
- (IAPSessionBasic)initWithClient:(id)a3 connectionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6;
- (unint64_t)_sessionPacketsFromAppBytesFree;
- (unsigned)sendBytesToApp:(const char *)a3 length:(int)a4;
- (void)_openPipeFromApp;
- (void)_openPipeToApp;
- (void)_readSessionDataFromAppThread;
- (void)_sessionBufferToAppHasSpaceAvailable;
- (void)_writeSessionDataFromAccThread;
- (void)dealloc;
- (void)recycleOutPacket:(EAPacket *)a3;
- (void)shuttingDownSession;
@end

@implementation IAPSessionBasic

- (IAPSessionBasic)init
{
  return 0LL;
}

- (IAPSessionBasic)initWithClient:(id)a3 connectionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IAPSessionBasic;
  v7 = -[IAPSession initWithClient:connectionID:protocolID:sessionID:]( &v19,  "initWithClient:connectionID:protocolID:sessionID:",  a3,  *(void *)&a4,  a5,  a6);
  if (!v7) {
    return v7;
  }
  result = (IAPSessionBasic *)sub_1000BF55C(a4);
  if (!result) {
    goto LABEL_38;
  }
  result = (IAPSessionBasic *)sub_10001864C((uint64_t)result);
  result = (IAPSessionBasic *)((uint64_t (*)(IAPSessionBasic *, void))result->super.super.isa[17].isa)( result,  0LL);
  if ((_DWORD)result)
  {
    if (result <= 0x10000)
    {
      if (result >= 0x3C3D)
      {
        unsigned int v11 = 15;
        do
        {
          unsigned int v10 = (0x40000 / result) & ~v11;
          if (v11 < 3) {
            break;
          }
          v11 >>= 1;
        }

        while (!v10);
        p_uint64_t numberOfSessionPacketsFromApp = &v7->_numberOfSessionPacketsFromApp;
      }

      else
      {
        p_uint64_t numberOfSessionPacketsFromApp = &v7->_numberOfSessionPacketsFromApp;
        unsigned int v10 = 16;
      }
    }

    else
    {
      p_uint64_t numberOfSessionPacketsFromApp = &v7->_numberOfSessionPacketsFromApp;
      unsigned int v10 = 4;
    }

    unsigned int *p_numberOfSessionPacketsFromApp = v10;
    if ((p_numberOfSessionPacketsFromApp & 3) == 0)
    {
      if (v10 <= 3)
      {
        __break(0x5518u);
      }

      else if (((unint64_t)&v7->_numberOfSessionPacketsFromAppMask & 3) == 0)
      {
        v7->_numberOfSessionPacketsFromAppMask = v10 - 1;
        v7->_openPipeFromAppCompleted = 0;
        v7->_openPipeToAppCompleted = 0;
        result = objc_alloc_init(&OBJC_CLASS___NSCondition);
        if (((unint64_t)&v7->_sessionPacketsFromAppCondition & 7) == 0)
        {
          v7->_sessionPacketsFromAppCondition = (NSCondition *)result;
          uint64_t numberOfSessionPacketsFromApp = v7->_numberOfSessionPacketsFromApp;
          result = (IAPSessionBasic *)malloc(8 * numberOfSessionPacketsFromApp);
          p_sessionPacketsFromApp = &v7->_sessionPacketsFromApp;
          if (((unint64_t)&v7->_sessionPacketsFromApp & 7) == 0)
          {
            void *p_sessionPacketsFromApp = result;
            if ((_DWORD)numberOfSessionPacketsFromApp)
            {
              uint64_t v14 = 0LL;
              unint64_t v15 = 0LL;
              p_sessionID = (__int16 *)&v7->super._sessionID;
              do
              {
                result = (IAPSessionBasic *)operator new(0xA0uLL);
                v17 = result;
                result = (IAPSessionBasic *)sub_1000AD6F0((uint64_t)result, a4, *p_sessionID);
                uint64_t v18 = *p_sessionPacketsFromApp;
                if (__CFADD__(*p_sessionPacketsFromApp, v14)) {
                  goto LABEL_39;
                }
                if (!v18 || (((_BYTE)v14 + (_BYTE)v18) & 7) != 0) {
                  goto LABEL_38;
                }
                *(void *)(v18 + v14) = v17;
                ++v15;
                v14 += 8LL;
              }

              while (v15 < v7->_numberOfSessionPacketsFromApp);
            }

            if (((unint64_t)&v7->_sessionPacketsFromAppHead & 3) == 0)
            {
              v7->_sessionPacketsFromAppHead = 0;
              if (((unint64_t)&v7->_sessionPacketsFromAppReady & 3) == 0)
              {
                v7->_sessionPacketsFromAppReady = 0;
                if (((unint64_t)&v7->_sessionPacketsFromAppTail & 3) == 0)
                {
                  v7->_sessionPacketsFromAppTail = 0;
                  if (((unint64_t)&v7->_sessionPacketsBytesRemainingCached & 7) == 0)
                  {
                    v7->_sessionPacketsBytesRemainingCached = 0xFFFFFFFFLL;
                    result = objc_alloc_init(&OBJC_CLASS___NSCondition);
                    if (((unint64_t)&v7->_sessionDataFromAccCondition & 7) == 0)
                    {
                      v7->_sessionDataFromAccCondition = (NSCondition *)result;
                      result = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  0x40000LL);
                      if (((unint64_t)&v7->_sessionDataFromAcc & 7) == 0)
                      {
                        v7->_sessionDataFromAcc = (NSMutableData *)result;
                        -[IAPSession _registerListenSocket](v7, "_registerListenSocket");
                        return v7;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

- (void)shuttingDownSession
{
  if ((((_BYTE)self + 16) & 7) == 0 && (((_BYTE)self + 24) & 3) == 0 && (((_DWORD)self + 30) & 1) == 0)
  {
    sub_1000CEA98( 3u,  @"%s:%s clientID=%@ connectionID=0x%x protocolID=%d sessionID=%d",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic shuttingDownSession]",  self->super._client,  self->super._connectionID,  self->super._protocolID,  self->super._sessionID);
    uint64_t v3 = sub_1000472A8();
    if (v3)
    {
      if ((v3 & 7) == 0)
      {
        sub_1000477AC(v3, self->super._connectionID, self->super._sessionID);
        p_sessionPacketsFromAppCondition = &self->_sessionPacketsFromAppCondition;
        if (((unint64_t)&self->_sessionPacketsFromAppCondition & 7) == 0)
        {
          -[NSCondition lock](*p_sessionPacketsFromAppCondition, "lock");
          p_uint64_t numberOfSessionPacketsFromApp = &self->_numberOfSessionPacketsFromApp;
          if (((unint64_t)&self->_numberOfSessionPacketsFromApp & 3) == 0)
          {
            p_sessionPacketsFromApp = (void **)&self->_sessionPacketsFromApp;
            BOOL v7 = ((unint64_t)&self->_sessionPacketsFromApp & 7) == 0;
            if (*p_numberOfSessionPacketsFromApp)
            {
              unint64_t v8 = 0LL;
              while (v7)
              {
                v9 = (char *)*p_sessionPacketsFromApp;
                unint64_t v10 = ~(unint64_t)*p_sessionPacketsFromApp;
                if (8 * v8 > v10) {
                  goto LABEL_29;
                }
                unsigned int v11 = &v9[8 * v8];
                uint64_t v13 = *(void *)v11;
                if (*(void *)v11)
                {
                  if ((v13 & 7) != 0) {
                    break;
                  }
                  (*(void (**)(uint64_t))(*(void *)v13 + 8LL))(v13);
                  v9 = (char *)*p_sessionPacketsFromApp;
                  unint64_t v10 = ~(unint64_t)*p_sessionPacketsFromApp;
                }

                if (8 * v8 > v10) {
                  goto LABEL_29;
                }
                if (!v9) {
                  break;
                }
                uint64_t v14 = &v9[8 * v8];
                *(void *)uint64_t v14 = 0LL;
                ++v8;
                p_sessionPacketsFromApp = (void **)&self->_sessionPacketsFromApp;
                BOOL v7 = ((unint64_t)&self->_sessionPacketsFromApp & 7) == 0;
                if (v8 >= *p_numberOfSessionPacketsFromApp) {
                  goto LABEL_24;
                }
              }
            }

            else
            {
LABEL_24:
              if (v7)
              {
                free(*p_sessionPacketsFromApp);
                void *p_sessionPacketsFromApp = 0LL;
                -[NSCondition unlock](*p_sessionPacketsFromAppCondition, "unlock");

                *p_sessionPacketsFromAppCondition = 0LL;
                p_sessionDataFromAccCondition = &self->_sessionDataFromAccCondition;
                if (((unint64_t)&self->_sessionDataFromAccCondition & 7) == 0)
                {
                  -[NSCondition lock](*p_sessionDataFromAccCondition, "lock");
                  p_sessionDataFromAcc = &self->_sessionDataFromAcc;
                  if (((unint64_t)&self->_sessionDataFromAcc & 7) == 0)
                  {

                    *p_sessionDataFromAcc = 0LL;
                    -[NSCondition unlock](*p_sessionDataFromAccCondition, "unlock");

                    *p_sessionDataFromAccCondition = 0LL;
                    v17.receiver = self;
                    v17.super_class = (Class)&OBJC_CLASS___IAPSessionBasic;
                    -[IAPSession shuttingDownSession](&v17, "shuttingDownSession");
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  __break(0x5516u);
LABEL_29:
  __break(0x5513u);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___IAPSessionBasic;
  -[IAPSession dealloc](&v2, "dealloc");
}

- (void)_openPipeToApp
{
  if ((((_DWORD)self + 30) & 1) != 0
    || (((_BYTE)self + 24) & 3) != 0
    || (sub_1000CEA98( 3u,  @"SUCCESS - %s:%s - %d session=%d for connectionID=0x%x opened pipe to app",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic _openPipeToApp]",  526LL,  self->super._sessionID,  self->super._connectionID),  !self)
    || (p_sessionDataFromAccThread = &self->_sessionDataFromAccThread,
        ((unint64_t)&self->_sessionDataFromAccThread & 7) != 0))
  {
LABEL_14:
    __break(0x5516u);
LABEL_15:
    __break(0x550Au);
    return;
  }

  if (*p_sessionDataFromAccThread) {
    NSLog( @"ERROR - %s:%s - %d session thread should be nil",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic _openPipeToApp]",  529LL);
  }
  self->_openPipeToAppCompleted = 1;
  if (self->_openPipeFromAppCompleted)
  {
    v4 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_writeSessionDataFromAccThread",  0LL);
    *p_sessionDataFromAccThread = v4;
    -[NSThread start](v4, "start");
    uint64_t v5 = sub_1000472A8();
    if (v5)
    {
      if ((v5 & 7) == 0)
      {
        sub_100047758(v5, self->super._connectionID, self->super._sessionID, self->super._protocolID);
        v6 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_readSessionDataFromAppThread",  0LL);
        if (((unint64_t)&self->_sessionPacketsFromAppThread & 7) == 0)
        {
          self->_sessionPacketsFromAppThread = v6;
          -[NSThread start](v6, "start");
          return;
        }
      }
    }

    goto LABEL_14;
  }

- (void)_openPipeFromApp
{
  if ((((_DWORD)self + 30) & 1) != 0
    || (((_BYTE)self + 24) & 3) != 0
    || (sub_1000CEA98( 3u,  @"SUCCESS - %s:%s - %d session=%d for connectionID=0x%x opened pipe from app",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic _openPipeFromApp]",  550LL,  self->super._sessionID,  self->super._connectionID),  !self)
    || (p_sessionPacketsFromAppThread = &self->_sessionPacketsFromAppThread,
        ((unint64_t)&self->_sessionPacketsFromAppThread & 7) != 0))
  {
LABEL_14:
    __break(0x5516u);
LABEL_15:
    __break(0x550Au);
    return;
  }

  if (*p_sessionPacketsFromAppThread) {
    NSLog( @"ERROR - %s:%s - %d session thread should be nil",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic _openPipeFromApp]",  553LL);
  }
  self->_openPipeFromAppCompleted = 1;
  if (self->_openPipeToAppCompleted)
  {
    v4 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_writeSessionDataFromAccThread",  0LL);
    if (((unint64_t)&self->_sessionDataFromAccThread & 7) == 0)
    {
      self->_sessionDataFromAccThread = v4;
      -[NSThread start](v4, "start");
      uint64_t v5 = sub_1000472A8();
      if (v5)
      {
        if ((v5 & 7) == 0)
        {
          sub_100047758(v5, self->super._connectionID, self->super._sessionID, self->super._protocolID);
          v6 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_readSessionDataFromAppThread",  0LL);
          *p_sessionPacketsFromAppThread = v6;
          -[NSThread start](v6, "start");
          return;
        }
      }
    }

    goto LABEL_14;
  }

- (BOOL)closeDataPipes
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IAPSessionBasic;
  BOOL result = -[IAPSession closeDataPipes](&v13, "closeDataPipes");
  if (!self) {
    goto LABEL_15;
  }
  p_sessionPacketsFromAppCondition = &self->_sessionPacketsFromAppCondition;
  BOOL result = -[NSCondition lock](*p_sessionPacketsFromAppCondition, "lock");
  p_sessionPacketsFromAppThread = &self->_sessionPacketsFromAppThread;
  -[NSThread cancel](*p_sessionPacketsFromAppThread, "cancel");
  -[NSCondition signal](*p_sessionPacketsFromAppCondition, "signal");
  -[NSCondition unlock](*p_sessionPacketsFromAppCondition, "unlock");
  for (int i = 0; i != 5000; ++i)
  {
    BOOL result = -[NSThread isFinished](*p_sessionPacketsFromAppThread, "isFinished");
    if (result) {
      break;
    }
    BOOL result = usleep(0x3E8u);
  }

  uint64_t v7 = (i + 1);
  p_sessionID = &self->super._sessionID;
  if ((((_DWORD)self + 30) & 1) != 0
    || (p_connectionID = &self->super._connectionID, ((unint64_t)&self->super._connectionID & 3) != 0)
    || (sub_1000CEA98( 3u,  @"%s:%d session=%d connectionID=0x%x _sessionPacketsFromAppThread finished (iterationLimit %d)",  "-[IAPSessionBasic closeDataPipes]",  588LL,  self->super._sessionID,  self->super._connectionID,  v7),  *p_sessionPacketsFromAppThread,  *p_sessionPacketsFromAppThread = 0LL,  p_sessionDataFromAccCondition = &self->_sessionDataFromAccCondition,  ((unint64_t)&self->_sessionDataFromAccCondition & 7) != 0)
    || (BOOL result = -[NSCondition lock](*p_sessionDataFromAccCondition, "lock"),
        p_sessionDataFromAccThread = &self->_sessionDataFromAccThread,
        (p_sessionDataFromAccThread & 7) != 0))
  {
LABEL_15:
    __break(0x5516u);
  }

  else
  {
    -[NSThread cancel](*p_sessionDataFromAccThread, "cancel");
    -[NSCondition signal](*p_sessionDataFromAccCondition, "signal");
    -[NSCondition unlock](*p_sessionDataFromAccCondition, "unlock");
    for (int j = 0; j != 5000; ++j)
    {
      if (-[NSThread isFinished](*p_sessionDataFromAccThread, "isFinished")) {
        break;
      }
      usleep(0x3E8u);
    }

    sub_1000CEA98( 3u,  @"%s:%d session=%d connectionID=0x%x _sessionDataFromAccThread finished (iterationLimit %d)",  "-[IAPSessionBasic closeDataPipes]",  601LL,  *p_sessionID,  *p_connectionID,  (j + 1));

    *p_sessionDataFromAccThread = 0LL;
    return 1;
  }

  return result;
}

- (BOOL)isPacketAvailable
{
  if (!self) {
    goto LABEL_17;
  }
  objc_super v2 = self;
  p_sessionPacketsFromAppCondition = &self->_sessionPacketsFromAppCondition;
  LOBYTE(self) = -[NSCondition lock](*p_sessionPacketsFromAppCondition, "lock");
  if (((unint64_t)&v2->_sessionPacketsFromApp & 7) != 0
    || ((unint64_t)&v2->_sessionPacketsFromAppReady & 3) != 0)
  {
    goto LABEL_17;
  }

  sessionPacketsFromApp = v2->_sessionPacketsFromApp;
  uint64_t sessionPacketsFromAppReady = v2->_sessionPacketsFromAppReady;
  if (__CFADD__(sessionPacketsFromApp, 8 * sessionPacketsFromAppReady))
  {
LABEL_18:
    __break(0x5513u);
    return (char)self;
  }

  v6 = (IAPSessionBasic **)&sessionPacketsFromApp[sessionPacketsFromAppReady];
  if (!sessionPacketsFromApp || (v6 & 7) != 0LL)
  {
LABEL_17:
    __break(0x5516u);
    goto LABEL_18;
  }

  self = *v6;
  if (!*v6) {
    goto LABEL_15;
  }
  if (sub_1000AD73C((uint64_t)self))
  {
    char v8 = 1;
  }

  else
  {
LABEL_15:
    char v8 = 0;
    v2->_hasSessionPacketFromAppNotificationBeenPosted = 0;
  }

  -[NSCondition unlock](*p_sessionPacketsFromAppCondition, "unlock");
  LOBYTE(self) = v8;
  return (char)self;
}

- (EAPacket)consumeNextOutPacket
{
  if (!self) {
    goto LABEL_37;
  }
  objc_super v2 = self;
  p_var14 = &self->var14;
  self = (EAPacket *)[*(id *)p_var14 lock];
  *(void *)&v2->var18 = 0xFFFFFFFFLL;
  p_var15 = &v2->var15;
  uint64_t v5 = (int *)&v2->var16 + 1;
  v6 = *p_var15;
  uint64_t v7 = *v5;
  if (__CFADD__(*p_var15, 8 * v7)) {
    goto LABEL_38;
  }
  char v8 = (EAPacket **)&v6[8 * v7];
  if (v6) {
    BOOL v9 = (v8 & 7) == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9) {
    goto LABEL_37;
  }
  self = *v8;
  if (!*v8) {
    goto LABEL_31;
  }
  self = (EAPacket *)sub_1000AD73C((uint64_t)self);
  if (!self)
  {
LABEL_31:
    uint64_t v13 = 0LL;
    LOBYTE(v2->var28) = 0;
LABEL_36:
    [*(id *)p_var14 unlock];
    return (EAPacket *)v13;
  }

  unint64_t v10 = *p_var15;
  uint64_t v11 = *v5;
  if (__CFADD__(*p_var15, 8 * v11)) {
    goto LABEL_38;
  }
  if (!v10) {
    goto LABEL_37;
  }
  v12 = (uint64_t *)&v10[8 * v11];
  uint64_t v13 = *v12;
  __int16 v21 = -21846;
  if ((((_DWORD)v2 + 30) & 1) != 0) {
    goto LABEL_37;
  }
  __int16 v21 = bswap32(HIWORD(v2->var3)) >> 16;
  if ((v13 & 7) != 0 || v13 == 0) {
    goto LABEL_37;
  }
  self = (EAPacket *)sub_1000AD3A8(v13, &v21, 2uLL);
  unint64_t v15 = *p_var15;
  uint64_t v16 = *v5;
  if (__CFADD__(*p_var15, 8 * v16))
  {
LABEL_38:
    __break(0x5513u);
    goto LABEL_39;
  }

  if (!v15) {
    goto LABEL_37;
  }
  objc_super v17 = &v15[8 * v16];
  *(void *)objc_super v17 = 0LL;
  p_var16 = &v2->var16;
  int v19 = v16 + 1;
  if ((_DWORD)v16 == *p_var16)
  {
    if ((_DWORD)v16 != -1)
    {
      if ((((unint64_t)&v2[1].var1 + 4) & 3) == 0)
      {
        int v20 = HIDWORD(v2[1].var1) & v19;
        _DWORD *p_var16 = v20;
LABEL_35:
        *uint64_t v5 = v20;
        goto LABEL_36;
      }

      goto LABEL_37;
    }
  }

  else if ((_DWORD)v16 != -1)
  {
    if ((((unint64_t)&v2[1].var1 + 4) & 3) == 0)
    {
      int v20 = HIDWORD(v2[1].var1) & v19;
      goto LABEL_35;
    }

- (void)recycleOutPacket:(EAPacket *)a3
{
  if (!self) {
    goto LABEL_22;
  }
  p_sessionPacketsFromAppCondition = &self->_sessionPacketsFromAppCondition;
  -[NSCondition lock](*p_sessionPacketsFromAppCondition, "lock");
  if ((a3->var25 & 4) == 0) {
    sub_1000D2500();
  }
  self->_sessionPacketsBytesRemainingCached = 0xFFFFFFFFLL;
  p_sessionPacketsFromApp = &self->_sessionPacketsFromApp;
  p_sessionPacketsFromAppTail = &self->_sessionPacketsFromAppTail;
  char v8 = *p_sessionPacketsFromApp;
  uint64_t v9 = *p_sessionPacketsFromAppTail;
  if (__CFADD__(*p_sessionPacketsFromApp, 8 * v9))
  {
LABEL_23:
    __break(0x5513u);
    goto LABEL_24;
  }

  if (!v8) {
    goto LABEL_22;
  }
  unint64_t v10 = &v8[v9];
  if (*v10)
  {
    NSLog( @"ERROR - %s::%s - %d replacing unused buffer",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic recycleOutPacket:]",  667LL);
LABEL_20:
    -[NSCondition signal](*p_sessionPacketsFromAppCondition, "signal");
    -[NSCondition unlock](*p_sessionPacketsFromAppCondition, "unlock");
    return;
  }

  sub_1000AD80C((uint64_t)a3);
  uint64_t v11 = *p_sessionPacketsFromApp;
  uint64_t v12 = *p_sessionPacketsFromAppTail;
  if (__CFADD__(*p_sessionPacketsFromApp, 8 * v12)) {
    goto LABEL_23;
  }
  if (!v11 || (uint64_t v13 = &v11[v12], (v13 & 7) != 0))
  {
LABEL_22:
    __break(0x5516u);
    goto LABEL_23;
  }

  *uint64_t v13 = a3;
  BOOL v14 = __CFADD__((_DWORD)v12, 1);
  int v15 = v12 + 1;
  if (!v14)
  {
    if (((unint64_t)&self->_numberOfSessionPacketsFromAppMask & 3) == 0)
    {
      unsigned int *p_sessionPacketsFromAppTail = self->_numberOfSessionPacketsFromAppMask & v15;
      goto LABEL_20;
    }

    goto LABEL_22;
  }

- (BOOL)bufferToAppHasSpaceAvailable
{
  p_sock = &self->super._sock;
  if (*p_sock != -1)
  {
    uint64_t v3 = self;
    p_sessionDataFromAccCondition = &self->_sessionDataFromAccCondition;
    if (((unint64_t)&self->_sessionDataFromAccCondition & 7) == 0)
    {
      LOBYTE(self) = -[NSCondition lock](*p_sessionDataFromAccCondition, "lock");
      if (*p_sock == -1)
      {
        BOOL v5 = 0;
        goto LABEL_9;
      }

      if (((unint64_t)&v3->_sessionDataFromAcc & 7) == 0)
      {
        BOOL v5 = -[NSMutableData length](v3->_sessionDataFromAcc, "length") < 0x40000;
LABEL_9:
        -[NSCondition unlock](*p_sessionDataFromAccCondition, "unlock");
        goto LABEL_10;
      }
    }

- (unsigned)sendBytesToApp:(const char *)a3 length:(int)a4
{
  if (self->super._sock != -1)
  {
    v6 = self;
    LODWORD(self) = -[IAPSessionBasic bufferToAppHasSpaceAvailable](self, "bufferToAppHasSpaceAvailable");
    if (!(_DWORD)self)
    {
      a4 = 0;
LABEL_12:
      if (((unint64_t)&v6->super._client & 7) == 0)
      {
        -[IAPEAClient takeProcessAssertion:]( v6->super._client,  "takeProcessAssertion:",  @"external-accessory.incoming-packet");
        goto LABEL_14;
      }

      goto LABEL_15;
    }

    p_sessionDataFromAccCondition = (id *)&v6->_sessionDataFromAccCondition;
    if (((unint64_t)&v6->_sessionDataFromAccCondition & 7) == 0)
    {
      LODWORD(self) = [*p_sessionDataFromAccCondition lock];
      p_sessionDataFromAcc = (id *)&v6->_sessionDataFromAcc;
      if (((unint64_t)&v6->_sessionDataFromAcc & 7) == 0)
      {
        self = (IAPSessionBasic *)[*p_sessionDataFromAcc length];
        if (__CFADD__(self, a4))
        {
LABEL_16:
          __break(0x5500u);
LABEL_17:
          __break(0x5515u);
          return self;
        }

        if ((unint64_t)self + a4 > 0x40000)
        {
          LODWORD(self) = [*p_sessionDataFromAcc length];
          a4 = 0x40000 - (_DWORD)self;
        }

        [*p_sessionDataFromAcc appendBytes:a3 length:a4];
        [*p_sessionDataFromAccCondition signal];
        LODWORD(self) = [*p_sessionDataFromAccCondition unlock];
        goto LABEL_12;
      }
    }

- (unint64_t)_sessionPacketsFromAppBytesFree
{
  if (!self) {
    goto LABEL_32;
  }
  unint64_t v2 = self;
  uint64_t v3 = (unint64_t *)(self + 120);
  if (((self + 120) & 7) != 0) {
    goto LABEL_32;
  }
  unint64_t v4 = *v3;
  if (*v3 != 0xFFFFFFFF) {
    return v4;
  }
  BOOL v5 = (void *)(self + 96);
  if (((self + 96) & 7) != 0) {
    goto LABEL_32;
  }
  v6 = (_DWORD *)(self + 104);
  if (((self + 104) & 3) != 0) {
    goto LABEL_32;
  }
  uint64_t v7 = *v5;
  uint64_t v8 = *v6;
  if (__CFADD__(*v5, 8 * v8))
  {
LABEL_28:
    __break(0x5513u);
LABEL_29:
    unint64_t v4 = 0LL;
    goto LABEL_30;
  }

  uint64_t v9 = (unint64_t *)(v7 + 8 * v8);
  if (v7) {
    BOOL v10 = (v9 & 7) == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    goto LABEL_32;
  }
  self = *v9;
  if (!*v9) {
    goto LABEL_29;
  }
  if ((self & 7) != 0)
  {
LABEL_32:
    __break(0x5516u);
    goto LABEL_33;
  }

  self = sub_1000AD754(self);
  unint64_t v4 = self;
  if (!self)
  {
LABEL_30:
    *uint64_t v3 = v4;
    return v4;
  }

  if (*v6 != -1)
  {
    uint64_t v11 = (_DWORD *)(v2 + 172);
    if ((v11 & 3) == 0)
    {
      uint64_t v12 = *v11 & (*v6 + 1);
      uint64_t v13 = *v5;
      if (!__CFADD__(*v5, 8LL * v12))
      {
        BOOL v14 = (unint64_t *)(v13 + 8 * v12);
        while (v13 && (v14 & 7) == 0)
        {
          self = *v14;
          if (!*v14 || (_DWORD)v12 == *v6) {
            goto LABEL_30;
          }
          if ((self & 7) != 0) {
            goto LABEL_32;
          }
          self = sub_1000AD754(self);
          BOOL v15 = __CFADD__(v4, self);
          v4 += self;
          if (v15 || (_DWORD)v12 == -1) {
            goto LABEL_33;
          }
          LODWORD(v12) = *v11 & (v12 + 1);
          uint64_t v13 = *v5;
          BOOL v14 = (unint64_t *)(*v5 + 8LL * v12);
        }

        goto LABEL_32;
      }

      goto LABEL_28;
    }

    goto LABEL_32;
  }

- (void)_readSessionDataFromAppThread
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v56.fds_bits[24] = v2;
  *(_OWORD *)&v56.fds_bits[28] = v2;
  *(_OWORD *)&v56.fds_bits[16] = v2;
  *(_OWORD *)&v56.fds_bits[20] = v2;
  *(_OWORD *)&v56.fds_bits[8] = v2;
  *(_OWORD *)&v56.fds_bits[12] = v2;
  *(_OWORD *)v56.fds_bits = v2;
  *(_OWORD *)&v56.fds_bits[4] = v2;
  if (self)
  {
    p_sessionPacketsFromAppThread = &self->_sessionPacketsFromAppThread;
    if (((unint64_t)&self->_sessionPacketsFromAppThread & 7) == 0)
    {
      if (-[NSThread isCancelled](*p_sessionPacketsFromAppThread, "isCancelled")) {
        return;
      }
      p_sock = &self->super._sock;
      p_connectionID = &self->super._connectionID;
      unint64_t v51 = (unint64_t)&self->super._connectionID & 3;
      p_sessionID = &self->super._sessionID;
      while (((unint64_t)&self->super._sock & 3) == 0)
      {
        if (*p_sock == -1) {
          return;
        }
        v6 = objc_autoreleasePoolPush();
        memset(&v56, 0, sizeof(v56));
        int v7 = *p_sock;
        if (__darwin_check_fd_set_overflow(*p_sock, &v56, 0))
        {
          unint64_t v8 = (unint64_t)v7 >> 5;
          v56.fds_bits[v8] |= 1 << v7;
        }

        if (__OFADD__(*p_sock, 1)) {
          goto LABEL_107;
        }
        int v9 = select(*p_sock + 1, &v56, 0LL, 0LL, 0LL);
        if (!-[NSThread isCancelled](*p_sessionPacketsFromAppThread, "isCancelled"))
        {
          if (v9 == 1)
          {
            p_sessionPacketsFromAppCondition = &self->_sessionPacketsFromAppCondition;
            -[NSCondition lock](*p_sessionPacketsFromAppCondition, "lock");
            if (*p_sock != -1)
            {
              unint64_t v11 = -[IAPSessionBasic _sessionPacketsFromAppBytesFree](self, "_sessionPacketsFromAppBytesFree");
              p_sessionPacketsFromApp = &self->_sessionPacketsFromApp;
              p_sessionPacketsFromAppHead = &self->_sessionPacketsFromAppHead;
              uint64_t v12 = *p_sessionPacketsFromApp;
              uint64_t v13 = *p_sessionPacketsFromAppHead;
              if (__CFADD__(*p_sessionPacketsFromApp, 8 * v13)) {
                goto LABEL_108;
              }
              if (!v12) {
                break;
              }
              BOOL v14 = (uint64_t *)&v12[v13];
              uint64_t v15 = *v14;
              if (*v14)
              {
                unint64_t v16 = v11;
                if (v11 >= 0x41)
                {
                  char v17 = 1;
                  while ((v15 & 7) == 0)
                  {
                    unint64_t v18 = sub_1000AD754(v15);
                    if (v18 >= 0x10000) {
                      goto LABEL_109;
                    }
                    uint64_t v19 = *(void *)(v15 + 24);
                    uint64_t v20 = *(unsigned __int16 *)(v15 + 128);
                    if (__CFADD__(v19, v20)) {
                      goto LABEL_108;
                    }
                    else {
                      unint64_t v21 = v18;
                    }
                    if (v16 >= v21) {
                      size_t v22 = v21;
                    }
                    else {
                      size_t v22 = v16;
                    }
                    ssize_t v23 = recv(*p_sock, (void *)(v19 + v20), v22, 0);
                    unint64_t v24 = v23;
                    if (v23 == -1)
                    {
                      v25 = __error();
                      int v26 = *v25;
                      v27 = __error();
                      BOOL v29 = (v27 & 3) == 0 && v27 != 0LL;
                      if (v26 != 35)
                      {
                        if (!v29) {
                          goto LABEL_106;
                        }
                        sub_1000CEAEC( 3u,  3,  "ERROR - %s:%s - %d error reading data from pipe (errno=%d)\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic _readSessionDataFromAppThread]",  793,  *v27);
LABEL_79:
                        if ((v17 & 1) != 0) {
                          goto LABEL_103;
                        }
LABEL_80:
                        if (!self->_hasSessionPacketFromAppNotificationBeenPosted)
                        {
                          self->_hasSessionPacketFromAppNotificationBeenPosted = 1;
                          uint64_t v41 = sub_1000472A8();
                          sub_1000477DC(v41, *p_connectionID, *p_sessionID);
                        }

                        uint64_t v42 = *p_sessionPacketsFromAppHead;
                        if ((_DWORD)v42 == self->_sessionPacketsFromAppTail)
                        {
                          v43 = *p_sessionPacketsFromApp;
                          unint64_t v44 = ~(unint64_t)*p_sessionPacketsFromApp;
                          if (8 * v42 > v44) {
                            goto LABEL_108;
                          }
                          if (!v43) {
                            goto LABEL_106;
                          }
                          v45 = &v43[v42];
                          if (*v45) {
                            goto LABEL_103;
                          }
                          if ((p_sessionID & 1) != 0
                            || v51
                            || ((unint64_t)&self->_sessionPacketsFromAppReady & 3) != 0)
                          {
                            goto LABEL_106;
                          }

                          uint64_t sessionPacketsFromAppReady = self->_sessionPacketsFromAppReady;
                          if (8 * sessionPacketsFromAppReady > v44) {
                            goto LABEL_108;
                          }
                          v47 = &v43[sessionPacketsFromAppReady];
                          v48 = *v47;
                          if (v48)
                          {
                            uint64_t var22 = v48->var22;
                          }

                          else
                          {
                            uint64_t var22 = 0LL;
                          }

                          sub_1000CEA98( 3u,  @"session data from app buffer is full for session=%d and connectionID=0x%x head=%d(%hhx) tai l=%d ready=%d(%hhx, payloadLen=%d)",  *p_sessionID,  self->super._connectionID,  v42,  0LL,  v42,  sessionPacketsFromAppReady,  v48,  var22);
                          -[NSCondition wait](*p_sessionPacketsFromAppCondition, "wait");
                        }

                        goto LABEL_103;
                      }

                      if (!v29) {
                        goto LABEL_106;
                      }
                      if (*v27 == 35) {
                        goto LABEL_79;
                      }
                    }

                    else if (!v23)
                    {
                      goto LABEL_79;
                    }

                    uint64_t v30 = *(unsigned __int16 *)(v15 + 128);
                    BOOL v31 = __OFADD__(v30, v24);
                    unint64_t v32 = v30 + v24;
                    if (v31) {
                      goto LABEL_107;
                    }
                    if (v32 >= 0x10000) {
                      goto LABEL_109;
                    }
                    *(_WORD *)(v15 + 128) = v32;
                    p_sessionPacketsBytesRemainingCached = &self->_sessionPacketsBytesRemainingCached;
                    unint64_t v34 = *p_sessionPacketsBytesRemainingCached;
                    if (*p_sessionPacketsBytesRemainingCached != 0xFFFFFFFF)
                    {
                      BOOL v35 = v34 >= v24;
                      unint64_t v36 = v34 - v24;
                      if (!v35) {
                        goto LABEL_110;
                      }
                      unint64_t *p_sessionPacketsBytesRemainingCached = v36;
                    }

                    BOOL v35 = v16 >= v24;
                    v16 -= v24;
                    if (!v35) {
                      goto LABEL_110;
                    }
                    if (!sub_1000AD754(v15))
                    {
                      if (*p_sessionPacketsFromAppHead == -1) {
                        goto LABEL_107;
                      }
                      unsigned int v37 = self->_numberOfSessionPacketsFromAppMask & (*p_sessionPacketsFromAppHead + 1);
                      unsigned int *p_sessionPacketsFromAppHead = v37;
                      v38 = *p_sessionPacketsFromApp;
                      if (__CFADD__(*p_sessionPacketsFromApp, 8LL * v37)) {
                        goto LABEL_108;
                      }
                      if (!v38) {
                        goto LABEL_106;
                      }
                      v39 = (uint64_t *)&v38[v37];
                      uint64_t v15 = *v39;
                      if (!self->_hasSessionPacketFromAppNotificationBeenPosted)
                      {
                        self->_hasSessionPacketFromAppNotificationBeenPosted = 1;
                        uint64_t v40 = sub_1000472A8();
                        sub_1000477DC(v40, *p_connectionID, *p_sessionID);
                      }
                    }

                    if (v15)
                    {
                      char v17 = 0;
                      if (v16 > 0x40) {
                        continue;
                      }
                    }

                    goto LABEL_80;
                  }

                  break;
                }
              }
            }

- (void)_writeSessionDataFromAccThread
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13.fds_bits[24] = v3;
  *(_OWORD *)&v13.fds_bits[28] = v3;
  *(_OWORD *)&v13.fds_bits[16] = v3;
  *(_OWORD *)&v13.fds_bits[20] = v3;
  *(_OWORD *)&v13.fds_bits[8] = v3;
  *(_OWORD *)&v13.fds_bits[12] = v3;
  *(_OWORD *)v13.fds_bits = v3;
  *(_OWORD *)&v13.fds_bits[4] = v3;
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.iapd.sessionQueue", 0LL);
  if (self)
  {
    p_sessionDataFromAccCondition = &self->_sessionDataFromAccCondition;
    if (((unint64_t)&self->_sessionDataFromAccCondition & 7) == 0)
    {
      v6 = v4;
      int v7 = *p_sessionDataFromAccCondition;
      p_sessionDataFromAccThread = &self->_sessionDataFromAccThread;
      if (((unint64_t)&self->_sessionDataFromAccThread & 7) == 0)
      {
        if (-[NSThread isCancelled](*p_sessionDataFromAccThread, "isCancelled"))
        {
LABEL_22:
          if (v6)
          {
LABEL_23:
            dispatch_release(v6);

            return;
          }

- (void)_sessionBufferToAppHasSpaceAvailable
{
  if (!self) {
    goto LABEL_30;
  }
  p_sessionDataFromAccCondition = &self->_sessionDataFromAccCondition;
  -[NSCondition lock](*p_sessionDataFromAccCondition, "lock");
  p_sessionDataFromAcc = &self->_sessionDataFromAcc;
  NSUInteger v5 = -[NSMutableData length](*p_sessionDataFromAcc, "length");
  if (!-[NSMutableData length](*p_sessionDataFromAcc, "length"))
  {
    -[NSCondition unlock](*p_sessionDataFromAccCondition, "unlock");
    return;
  }

  ssize_t v6 = send( self->super._sock,  -[NSMutableData bytes](*p_sessionDataFromAcc, "bytes"),  -[NSMutableData length](*p_sessionDataFromAcc, "length"),  0);
  if (v6 == -1)
  {
    unint64_t v8 = __error();
    if (v8 && (v8 & 3) == 0)
    {
      if (*v8 == 35) {
        goto LABEL_18;
      }
      if ((((_DWORD)self + 30) & 1) == 0 && ((unint64_t)&self->super._connectionID & 3) == 0)
      {
        int sessionID = self->super._sessionID;
        unsigned int connectionID = self->super._connectionID;
        int v11 = __error();
        if (v11)
        {
          if ((v11 & 3) == 0)
          {
            syslog( 4,  "ERROR - %s:%s - %d session=0x%x for connectionID=0x%x failed to write bytes, errno = %d\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSessionBasic _sessionBufferToAppHasSpaceAvailable]",  909,  sessionID,  connectionID,  *v11);
            goto LABEL_18;
          }
        }
      }
    }

@end