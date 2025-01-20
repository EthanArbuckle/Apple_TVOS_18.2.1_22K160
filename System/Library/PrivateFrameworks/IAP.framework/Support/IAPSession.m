@interface IAPSession
+ (void)resetSessionIDCounter;
- (BOOL)closeDataPipes;
- (BOOL)openPipeFromApp;
- (BOOL)openPipeToApp;
- (IAPEAClient)client;
- (IAPSession)init;
- (IAPSession)initWithClient:(id)a3 connectionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6;
- (id)description;
- (unsigned)connectionID;
- (unsigned)protocolID;
- (unsigned)sessionID;
- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4;
- (void)_registerListenSocket;
- (void)dealloc;
- (void)shuttingDownSession;
@end

@implementation IAPSession

- (IAPSession)init
{
  return 0LL;
}

- (IAPSession)initWithClient:(id)a3 connectionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6
{
  uint64_t v8 = *(void *)&a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IAPSession;
  v10 = -[IAPSession init](&v24, "init");
  if (!v10) {
    return v10;
  }
  v11 = (IAPEAClient *)a3;
  v10->_client = v11;
  v10->_connectionID = v8;
  v10->_protocolID = a5;
  unsigned int v12 = dword_10011BB2C + 1;
  if (dword_10011BB2C == -1) {
    goto LABEL_37;
  }
  if (HIWORD(v12)) {
    unsigned int v12 = 0;
  }
  dword_10011BB2C = v12;
  if (!a6) {
    goto LABEL_36;
  }
  *a6 = v12;
  if ((((_DWORD)v10 + 30) & 1) != 0) {
    goto LABEL_36;
  }
  v10->_sessionID = v12;
  sub_1000CEA98( 3u,  @"%s:%s client=%@ connID=0x%x protocolID=%d sessionID=%d",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]",  a3,  v8,  v10->_protocolID,  (unsigned __int16)v12);
  v13 = (NSMutableDictionary *) objc_msgSend( +[EAManager sharedManager](EAManager, "sharedManager"),  "accessoryForConnectionID:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  v8));
  v10->_accessory = v13;
  if (!v13) {
    NSLog( @"ERROR - %s:%s - %d couldn't find accessory for connectionID=0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]",  126LL,  v10->_connectionID);
  }
  -[IAPEAClient increaseSessionRefCount](v10->_client, "increaseSessionRefCount");
  if ((((_BYTE)v10 + 32) & 3) != 0) {
    goto LABEL_36;
  }
  v10->_listenSock = -1;
  if ((((_BYTE)v10 + 40) & 7) != 0) {
    goto LABEL_36;
  }
  v10->_listenSockRef = 0LL;
  if ((((_BYTE)v10 + 48) & 7) != 0) {
    goto LABEL_36;
  }
  v10->_listenSockRls = 0LL;
  if ((((_BYTE)v10 + 56) & 3) != 0) {
    goto LABEL_36;
  }
  v10->_sock = -1;
  if ((((_BYTE)v10 + 64) & 7) != 0
    || (v10->_sockRef = 0LL, (((_BYTE)v10 + 72) & 7) != 0)
    || (v10->_sockRls = 0LL, *(_WORD *)&v10->_openPipeToAppAfterAccept = 0, (uint64_t v14 = sub_1000BE638()) == 0)
    || (v14 & 7) != 0
    || (uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v14 + 96LL))(v14, v8)) == 0
    || (v15 & 7) != 0
    || (uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 160LL))(v15),
        v17 = -[IAPEAClient bundleId](v10->_client, "bundleId"),
        !v16)
    || (v16 & 7) != 0)
  {
LABEL_36:
    __break(0x5516u);
    goto LABEL_37;
  }

  +[IAPDataLogger PowerlogEASession:forAccessory:forProtocolID:forPortType:isSessionOpen:]( &OBJC_CLASS___IAPDataLogger,  "PowerlogEASession:forAccessory:forProtocolID:forPortType:isSessionOpen:",  v17,  v10->_accessory,  v10->_protocolID,  (*(unsigned __int8 (**)(uint64_t))(*(void *)v16 + 216LL))(v16),  1LL);
  char v18 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 232LL))(v16);
  v10->_isWirelessSession = v18;
  int v19 = dword_10011BB20;
  if ((v18 & 1) != 0) {
    goto LABEL_28;
  }
  int v19 = dword_10011BB20 + 1;
  if (dword_10011BB20 == -1) {
LABEL_37:
  }
    __break(0x5500u);
  ++dword_10011BB20;
LABEL_28:
  if (v19)
  {
    if (v19 == 1 && (byte_10011BB24 & 1) == 0)
    {
      v25[0] = @"AssertType";
      v25[1] = @"AssertLevel";
      v26[0] = @"NoIdleSleepAssertion";
      v26[1] = &off_100111DA0;
      v25[2] = @"AssertName";
      v25[3] = @"AllowsDeviceRestart";
      v26[2] = @"com.apple.iapd.ea-session-open";
      v26[3] = kCFBooleanTrue;
      if (IOPMAssertionCreateWithProperties( (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL),  (IOPMAssertionID *)&dword_10011BB28))
      {
        NSLog( @"ERROR - %s:%s - %d couldn't take sleep assertion",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]",  167LL);
      }

      else
      {
        byte_10011BB24 = 1;
        sub_1000CEA98( 3u,  @"ea session power assertion (%u) taken",  dword_10011BB28,  v21,  v22,  v23);
      }
    }
  }

  else
  {
    sub_1000CEA98( 3u,  @"%s:%s not taking power assertion for protocolID=%d sessionID=%d on wireless transport",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]",  v10->_protocolID,  v10->_sessionID);
  }

  return v10;
}

- (void)shuttingDownSession
{
  if ((((_DWORD)self + 30) & 1) != 0) {
    goto LABEL_28;
  }
  sub_1000CEA98( 3u,  @"%s:%s clientID=%@ connectionID=0x%x protocolID=%d sessionID=%d",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSession shuttingDownSession]",  self->_client,  self->_connectionID,  self->_protocolID,  self->_sessionID);
  uint64_t v3 = sub_1000BE638();
  if (!v3 || (v3 & 7) != 0) {
    goto LABEL_28;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void))(*(void *)v3 + 96LL))(v3, self->_connectionID);
  BOOL v5 = v4 && (v4 & 7) == 0;
  if (!v5
    || (uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 160LL))(v4),
        v7 = -[IAPEAClient bundleId](self->_client, "bundleId"),
        (((_BYTE)self + 8) & 7) != 0)
    || (v6 ? (BOOL v8 = (v6 & 7) == 0) : (BOOL v8 = 0), !v8))
  {
LABEL_28:
    __break(0x5516u);
    goto LABEL_29;
  }

  +[IAPDataLogger PowerlogEASession:forAccessory:forProtocolID:forPortType:isSessionOpen:]( &OBJC_CLASS___IAPDataLogger,  "PowerlogEASession:forAccessory:forProtocolID:forPortType:isSessionOpen:",  v7,  self->_accessory,  self->_protocolID,  (*(unsigned __int8 (**)(uint64_t))(*(void *)v6 + 216LL))(v6),  0LL);
  if (self->_isWirelessSession >= 2u)
  {
LABEL_29:
    __break(0x550Au);
    goto LABEL_30;
  }

  if (self->_isWirelessSession)
  {
    if (dword_10011BB20) {
      return;
    }
    goto LABEL_23;
  }

  int v9 = dword_10011BB20 - 1;
  if (!dword_10011BB20)
  {
LABEL_30:
    __break(0x5515u);
    return;
  }

  --dword_10011BB20;
  if (!v9)
  {
LABEL_23:
    if (byte_10011BB24 == 1)
    {
      if (IOPMAssertionRelease(dword_10011BB28))
      {
        NSLog( @"ERROR - %s:%s - %d couldn't release sleep assertion",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm",  "-[IAPSession shuttingDownSession]",  208LL);
      }

      else
      {
        byte_10011BB24 = 0;
        sub_1000CEA98(3u, @"ea session power assertion released");
      }
    }
  }

- (void)dealloc
{
  if ((((_BYTE)self + 16) & 7) != 0 || (self->_client, self->_client = 0LL, (((_BYTE)self + 8) & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {

    self->_accessory = 0LL;
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___IAPSession;
    -[IAPSession dealloc](&v3, "dealloc");
  }

- (BOOL)openPipeToApp
{
  if (((unint64_t)&self->_sockRef & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (self->_sockRef) {
      -[IAPSession _openPipeToApp](self, "_openPipeToApp", v2, v3);
    }
    else {
      self->_openPipeToAppAfterAccept = 1;
    }
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)openPipeFromApp
{
  if (((unint64_t)&self->_sockRef & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (self->_sockRef) {
      -[IAPSession _openPipeFromApp](self, "_openPipeFromApp", v2, v3);
    }
    else {
      self->_openPipeFromAppAfterAccept = 1;
    }
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)closeDataPipes
{
  p_listenSockRls = (IAPSession **)&self->_listenSockRls;
  uint64_t v3 = self;
  self = *p_listenSockRls;
  if (*p_listenSockRls)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)self);
    CFRelease(*p_listenSockRls);
    *p_listenSockRls = 0LL;
  }

  p_listenSockRef = (IAPSession **)&v3->_listenSockRef;
  self = *p_listenSockRef;
  if (*p_listenSockRef)
  {
    CFSocketInvalidate((CFSocketRef)self);
    CFRelease(*p_listenSockRef);
    *p_listenSockRef = 0LL;
  }

  p_listenSock = &v3->_listenSock;
  LODWORD(self) = *p_listenSock;
  if ((*p_listenSock & 0x80000000) == 0)
  {
    LOBYTE(self) = close((int)self);
    int *p_listenSock = -1;
  }

  p_sockRls = (IAPSession **)&v3->_sockRls;
  self = *p_sockRls;
  if (*p_sockRls)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)self);
    CFRelease(*p_sockRls);
    *p_sockRls = 0LL;
  }

  p_sockRef = (IAPSession **)&v3->_sockRef;
  self = *p_sockRef;
  if (*p_sockRef)
  {
    CFSocketInvalidate((CFSocketRef)self);
    CFRelease(*p_sockRef);
    *p_sockRef = 0LL;
  }

  p_sock = &v3->_sock;
  if ((p_sock & 3) != 0)
  {
LABEL_20:
    __break(0x5516u);
  }

  else
  {
    if ((*p_sock & 0x80000000) == 0)
    {
      close(*p_sock);
      int *p_sock = -1;
    }

    LOBYTE(self) = 1;
  }

  return (char)self;
}

+ (void)resetSessionIDCounter
{
  dword_10011BB2C = 0;
}

- (void)_registerListenSocket
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __source[14] = v3;
  __source[15] = v3;
  __source[12] = v3;
  __source[13] = v3;
  __source[10] = v3;
  __source[11] = v3;
  __source[8] = v3;
  __source[9] = v3;
  __source[6] = v3;
  __source[7] = v3;
  __source[4] = v3;
  __source[5] = v3;
  __source[2] = v3;
  __source[3] = v3;
  __source[0] = v3;
  __source[1] = v3;
  if ((((_BYTE)self + 24) & 3) != 0) {
    goto LABEL_11;
  }
  if ((((_DWORD)self + 30) & 1) != 0) {
    goto LABEL_11;
  }
  IAPAppToAppSocketPath(self->_connectionID, self->_sessionID, __source);
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)&v12[5] + 10) = v4;
  v12[4] = v4;
  v12[5] = v4;
  v12[2] = v4;
  v12[3] = v4;
  v12[0] = v4;
  v12[1] = v4;
  unlink((const char *)__source);
  int v5 = socket(1, 1, 0);
  p_listenSock = &self->_listenSock;
  int *p_listenSock = v5;
  memset((char *)v12 + 2, 0, 104);
  LOWORD(v12[0]) = 362;
  strlcpy((char *)v12 + 2, (const char *)__source, 0x68uLL);
  if (bind(*p_listenSock, (const sockaddr *)v12, 0x6Au)) {
    NSLog(@"can't bind to ea address");
  }
  if (listen(*p_listenSock, 5)) {
    NSLog(@"can't listen to socket");
  }
  context.version = 0LL;
  context.info = self;
  memset(&context.retain, 0, 24);
  v7 = CFSocketCreateWithNative(kCFAllocatorDefault, self->_listenSock, 2uLL, (CFSocketCallBack)sub_1000115F8, &context);
  if ((((_BYTE)self + 40) & 7) != 0
    || (self->_listenSockRef = v7,
        CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, v7, 0LL),
        p_listenSockRls = &self->_listenSockRls,
        (p_listenSockRls & 7) != 0))
  {
LABEL_11:
    __break(0x5516u);
  }

  *p_listenSockRls = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, *p_listenSockRls, kCFRunLoopDefaultMode);
}

- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4
{
  int v10 = 1;
  context.version = 0LL;
  context.info = self;
  memset(&context.retain, 0, 24);
  if ((((_BYTE)self + 56) & 3) != 0) {
    goto LABEL_14;
  }
  self->_sock = a4;
  uint64_t v6 = CFSocketCreateWithNative(0LL, a4, 9uLL, (CFSocketCallBack)sub_1000115F8, &context);
  if ((((_BYTE)self + 64) & 7) != 0) {
    goto LABEL_14;
  }
  self->_sockRef = v6;
  CFSocketDisableCallBacks(v6, 9uLL);
  CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, self->_sockRef, 0LL);
  if ((((_BYTE)self + 72) & 7) != 0) {
    goto LABEL_14;
  }
  self->_sockRls = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, self->_sockRls, kCFRunLoopDefaultMode);
  int v9 = 0x20000;
  setsockopt(self->_sock, 0xFFFF, 4097, &v9, 4u);
  setsockopt(self->_sock, 0xFFFF, 4098, &v9, 4u);
  ioctl(a4, 0x8004667EuLL, &v10);
  if ((((_BYTE)self + 48) & 7) != 0
    || (CFRunLoopSourceInvalidate(self->_listenSockRls),
        CFRelease(self->_listenSockRls),
        self->_listenSockRls = 0LL,
        (((_BYTE)self + 40) & 7) != 0)
    || (CFSocketInvalidate(self->_listenSockRef),
        CFRelease(self->_listenSockRef),
        self->_listenSockRef = 0LL,
        (((_BYTE)self + 32) & 3) != 0))
  {
LABEL_14:
    __break(0x5516u);
LABEL_15:
    __break(0x550Au);
    return;
  }

  close(self->_listenSock);
  self->_listenSock = -1;
  if (self->_openPipeToAppAfterAccept)
  {
    -[IAPSession _openPipeToApp](self, "_openPipeToApp");
    self->_openPipeToAppAfterAccept = 0;
  }

  if (self->_openPipeFromAppAfterAccept)
  {
    -[IAPSession _openPipeFromApp](self, "_openPipeFromApp");
    self->_openPipeFromAppAfterAccept = 0;
  }

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IAPSession;
  id result = -[IAPSession description](&v4, "description");
  if ((((_BYTE)self + 16) & 7) == 0 && (((_BYTE)self + 24) & 3) == 0 && (((_DWORD)self + 30) & 1) == 0) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ client=%@ connectionID=%u protocolID=%d sessionID=%d",  result,  self->_client,  self->_connectionID,  self->_protocolID,  self->_sessionID);
  }
  __break(0x5516u);
  return result;
}

- (IAPEAClient)client
{
  return self->_client;
}

- (unsigned)connectionID
{
  return self->_connectionID;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (unsigned)protocolID
{
  return self->_protocolID;
}

@end