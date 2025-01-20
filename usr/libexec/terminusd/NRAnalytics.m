@interface NRAnalytics
- (NRAnalytics)init;
@end

@implementation NRAnalytics

- (NRAnalytics)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NRAnalytics;
  v2 = -[NRAnalytics init](&v16, "init");
  if (!v2)
  {
    id v7 = sub_100119684();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16LL);

    if (IsLevelEnabled)
    {
      id v9 = sub_100119684();
      _NRLogWithArgs(v9, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRAnalytics init]"", 53);
    }

    uint64_t v10 = _os_log_pack_size(12LL);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v12 = __error();
    uint64_t v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRAnalytics init]";
    id v14 = sub_100119684();
    _NRLogAbortWithPack(v14, v11);
  }

  v3 = v2;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  eventDictionary = v3->_eventDictionary;
  v3->_eventDictionary = v4;

  return v3;
}

- (void).cxx_destruct
{
}

@end