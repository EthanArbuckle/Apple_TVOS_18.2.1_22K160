@interface NRDevicePairingDirector
- (NRDevicePairingDirector)init;
@end

@implementation NRDevicePairingDirector

- (NRDevicePairingDirector)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NRDevicePairingDirector;
  v2 = -[NRDevicePairingDirector init](&v18, "init");
  if (!v2)
  {
    id v9 = sub_1000FBEC0();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 16LL);

    if (IsLevelEnabled)
    {
      id v11 = sub_1000FBEC0();
      _NRLogWithArgs( v11,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRDevicePairingDirector init]"",  2014);
    }

    uint64_t v12 = _os_log_pack_size(12LL);
    v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v14 = __error();
    uint64_t v15 = _os_log_pack_fill(v13, v12, *v14, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v15 = 136446210;
    *(void *)(v15 + 4) = "-[NRDevicePairingDirector init]";
    id v16 = sub_1000FBEC0();
    _NRLogAbortWithPack(v16, v13);
  }

  v3 = v2;
  v4 = sub_100146AFC();
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v4;

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  devicePairingConnections = v3->_devicePairingConnections;
  v3->_devicePairingConnections = v6;

  return v3;
}

- (void).cxx_destruct
{
}

@end