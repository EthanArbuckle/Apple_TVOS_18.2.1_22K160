@interface CLWifiServiceAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAssociatedNetwork:(void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHostedNetwork:(void *)a3;
- (BOOL)syncgetIsAssociated;
- (BOOL)syncgetIsAvailable;
- (BOOL)syncgetIsSimulationEnabled;
- (BOOL)syncgetIsWifiPowered;
- (BOOL)syncgetIsWifiPoweredWithStatus:(BOOL *)a3;
- (BOOL)syncgetIsWifiTrackingAvailable;
- (BOOL)syncgetSetAutoJoin:(BOOL)a3;
- (BOOL)syncgetStartScanWithParameters:(id)a3;
- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 lowLatency:(BOOL)a5 passive:(BOOL)a6 requester:(const char *)a7 channels:(const void *)a8;
- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 passive:(BOOL)a5 requester:(const char *)a6;
- (BOOL)syncgetSupportedChannelsAdd2GhzChannels:(BOOL)a3 andAdd5GhzChannels:(BOOL)a4 result:(void *)a5;
- (CLWifiServiceAdapter)init;
- (id)syncgetBackgroundScanCacheResult;
- (id)syncgetScanResult;
- (id)syncgetScanStats;
- (void)adaptee;
- (void)beginService;
- (void)clearExitAndEntryScanNetworks:(BOOL)a3;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchIsAssociatedWithReply:(id)a3;
- (void)fetchIsWifiAvailableWithReply:(id)a3;
- (void)fetchScanResultWithReply:(id)a3;
- (void)programEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4;
- (void)setBackgroundExitScanCount:(int)a3;
- (void)setEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4;
- (void)setQuiesceWifi:(BOOL)a3;
- (void)setScannerEntryScanNetworks:(id)a3;
- (void)setScannerExitScanNetworks:(id)a3;
- (void)setWifiPower:(BOOL)a3;
@end

@implementation CLWifiServiceAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019942D0 != -1) {
    dispatch_once(&qword_1019942D0, &stru_101833200);
  }
  return (id)qword_1019942C8;
}

- (CLWifiServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWifiServiceAdapter;
  return -[CLWifiServiceAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLWifiServiceProtocol,  &OBJC_PROTOCOL___CLWifiServiceClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    objc_super v3 = (CLWifiServiceAdapter *)sub_101235338();
    -[CLWifiServiceAdapter endService](v3, v4);
  }

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchIsAssociatedWithReply:(id)a3
{
  uint64_t v4 = sub_10032E334((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (BOOL)syncgetIsAssociated
{
  return sub_10032E334((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"));
}

- (void)fetchIsWifiAvailableWithReply:(id)a3
{
  char v7 = 0;
  uint64_t v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  unsigned int v5 = (*(uint64_t (**)(void *, char *))(*(void *)v4 + 216LL))(v4, &v7);
  if (v7) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0LL;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (BOOL)syncgetIsWifiTrackingAvailable
{
  return *((_BYTE *)-[CLWifiServiceAdapter adaptee](self, "adaptee") + 376);
}

- (BOOL)syncgetIsWifiPowered
{
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  BOOL result = (*(uint64_t (**)(void *, char *))(*(void *)v2 + 216LL))(v2, &v4);
  if (!v4) {
    return 0;
  }
  return result;
}

- (BOOL)syncgetIsWifiPoweredWithStatus:(BOOL *)a3
{
  char v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  *a3 = (*(uint64_t (**)(void *, BOOL *))(*(void *)v4 + 216LL))(v4, &v6);
  return v6;
}

- (BOOL)syncgetIsAvailable
{
  return sub_10032E744((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetIsSimulationEnabled
{
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 208LL))(v2);
}

- (void)programEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4
{
  BOOL v6 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v8, a3);
  (*((void (**)(void ***__return_ptr, id))a4 + 2))(v7, a4);
  sub_10032E870((uint64_t)v6, v8, (uint64_t *)v7);
  v9 = v7;
  sub_100023498((void ***)&v9);
  v7[0] = (void **)v8;
  sub_100023498(v7);
}

- (void)setEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4
{
  char v7 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a4 + 2))(v9, a4);
  sub_10032EAD0((uint64_t)v7, v9);
  v10 = (void **)v9;
  sub_100023498(&v10);
  v8 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v9, a3);
  sub_10032EB7C((uint64_t)v8, v9);
  v10 = (void **)v9;
  sub_100023498(&v10);
}

- (void)setScannerEntryScanNetworks:(id)a3
{
  char v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10032EB7C((uint64_t)v4, v5);
  BOOL v6 = (void **)v5;
  sub_100023498(&v6);
}

- (void)setScannerExitScanNetworks:(id)a3
{
  char v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10032EAD0((uint64_t)v4, v5);
  BOOL v6 = (void **)v5;
  sub_100023498(&v6);
}

- (id)syncgetScanStats
{
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(char *))(*((void *)v2 + 103) + 16LL))(v2 + 824);
  __int128 v4 = *(_OWORD *)(v2 + 756);
  __int128 v5 = *(_OWORD *)(v2 + 772);
  __int128 v6 = *(_OWORD *)(v2 + 788);
  __int128 v7 = *(_OWORD *)(v2 + 804);
  *(_OWORD *)(v2 + 756) = 0u;
  *(_OWORD *)(v2 + 772) = 0u;
  *(_OWORD *)(v2 + 788) = 0u;
  *(_OWORD *)(v2 + 804) = 0u;
  (*(void (**)(char *))(*((void *)v2 + 103) + 24LL))(v2 + 824);
  __int128 v9 = v4;
  __int128 v10 = v5;
  __int128 v11 = v6;
  __int128 v12 = v7;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003519D8;
  uint64_t v8[3] = &unk_1018335F8;
  return [v8 copy];
}

- (id)syncgetScanResult
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, char *, __int128 *))(*(void *)v2 + 224LL))(v2, (char *)&v7 + 8, &v7);
  uint64_t v5 = v7;
  memset(v6, 0, sizeof(v6));
  sub_1002DE3C8(v6, *((uint64_t *)&v7 + 1), v8, 0x2E8BA2E8BA2E8BA3LL * ((uint64_t)(v8 - *((void *)&v7 + 1)) >> 3));
  id v3 = sub_10032EEBC(&v5);
  __int128 v9 = (void **)v6;
  sub_100023498(&v9);
  __int128 v9 = (void **)&v7 + 1;
  sub_100023498(&v9);
  return v3;
}

- (id)syncgetBackgroundScanCacheResult
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, char *, __int128 *))(*(void *)v2 + 240LL))(v2, (char *)&v7 + 8, &v7);
  uint64_t v5 = v7;
  memset(v6, 0, sizeof(v6));
  sub_1002DE3C8(v6, *((uint64_t *)&v7 + 1), v8, 0x2E8BA2E8BA2E8BA3LL * ((uint64_t)(v8 - *((void *)&v7 + 1)) >> 3));
  id v3 = sub_10032EEBC(&v5);
  __int128 v9 = (void **)v6;
  sub_100023498(&v9);
  __int128 v9 = (void **)&v7 + 1;
  sub_100023498(&v9);
  return v3;
}

- (void)fetchScanResultWithReply:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, char *, __int128 *))(*(void *)v4 + 224LL))(v4, (char *)&v8 + 8, &v8);
  uint64_t v6 = v8;
  memset(v7, 0, sizeof(v7));
  sub_1002DE3C8(v7, *((uint64_t *)&v8 + 1), v9, 0x2E8BA2E8BA2E8BA3LL * ((uint64_t)(v9 - *((void *)&v8 + 1)) >> 3));
  id v5 = sub_10032EEBC(&v6);
  (*((void (**)(id, id))a3 + 2))(a3, v5);
  __int128 v10 = (void **)v7;
  sub_100023498(&v10);
  __int128 v10 = (void **)&v8 + 1;
  sub_100023498(&v10);
}

- (BOOL)syncgetAssociatedNetwork:(void *)a3
{
  int v4 = v13;
  if (v13)
  {
    *(void *)a3 = v7;
    std::string::operator=((std::string *)((char *)a3 + 8), &__p);
    __int128 v5 = v10;
    *((_OWORD *)a3 + 2) = v9;
    *((_OWORD *)a3 + 3) = v5;
    *((_OWORD *)a3 + 4) = v11;
    *((void *)a3 + 10) = v12;
    if (v13)
    {
    }
  }

  return v4 != 0;
}

- (BOOL)syncgetHostedNetwork:(void *)a3
{
  int v4 = v8;
  if (v8)
  {
    std::string::operator=((std::string *)a3, &__p);
    *(_OWORD *)((char *)a3 + 24) = v7;
    if (v8)
    {
    }
  }

  return v4 != 0;
}

- (void)clearExitAndEntryScanNetworks:(BOOL)a3
{
}

- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 passive:(BOOL)a5 requester:(const char *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v9 = a3;
  __int128 v10 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(v15, (char *)a6);
  LOBYTE(__p[0]) = 0;
  char v14 = 0;
  char v11 = (*(uint64_t (**)(void *, uint64_t, BOOL, void, BOOL, void **, void **))(*(void *)v10 + 256LL))( v10,  v9,  v8,  0LL,  v7,  v15,  __p);
  if (v14 && __p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v16 < 0) {
    operator delete(v15[0]);
  }
  return v11;
}

- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 lowLatency:(BOOL)a5 passive:(BOOL)a6 requester:(const char *)a7 channels:(const void *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v13 = a3;
  char v14 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)a7);
  char v15 = (*(uint64_t (**)(void *, uint64_t, BOOL, BOOL, BOOL, void **, const void *))(*(void *)v14
                                                                                                  + 256LL))( v14,  v13,  v12,  v11,  v10,  __p,  a8);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  return v15;
}

- (BOOL)syncgetStartScanWithParameters:(id)a3
{
  int v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v7, a3);
  char v5 = sub_10032F87C((uint64_t)v4, v7);
  if (v11 < 0) {
    operator delete(__p);
  }
  if (v8)
  {
    uint64_t v9 = v8;
    operator delete(v8);
  }

  return v5;
}

- (void)setQuiesceWifi:(BOOL)a3
{
}

- (BOOL)syncgetSupportedChannelsAdd2GhzChannels:(BOOL)a3 andAdd5GhzChannels:(BOOL)a4 result:(void *)a5
{
  return 1;
}

- (void)setWifiPower:(BOOL)a3
{
}

- (void)setBackgroundExitScanCount:(int)a3
{
}

- (BOOL)syncgetSetAutoJoin:(BOOL)a3
{
  return sub_10033183C((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), a3);
}

@end