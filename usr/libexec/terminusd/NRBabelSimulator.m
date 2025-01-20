@interface NRBabelSimulator
- (NRBabelSimulator)init;
- (NSMutableArray)fakeInstances;
- (NSMutableArray)fakeLinks;
- (void)setFakeInstances:(id)a3;
- (void)setFakeLinks:(id)a3;
@end

@implementation NRBabelSimulator

- (NRBabelSimulator)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NRBabelSimulator;
  v2 = -[NRBabelSimulator init](&v23, "init");
  if (!v2)
  {
    id v14 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 16LL);

    if (IsLevelEnabled)
    {
      id v16 = sub_1000B07C8();
      _NRLogWithArgs(v16, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelSimulator init]"", 4010);
    }

    uint64_t v17 = _os_log_pack_size(12LL);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v19 = __error();
    uint64_t v20 = _os_log_pack_fill(v18, v17, *v19, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "-[NRBabelSimulator init]";
    id v21 = sub_1000B07C8();
    _NRLogAbortWithPack(v21, v18);
  }

  v3 = v2;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  fakeInstances = v3->_fakeInstances;
  v3->_fakeInstances = v4;

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  fakeLinks = v3->_fakeLinks;
  v3->_fakeLinks = v6;

  v8 = -[NRBabelLinkFake initWithName:](objc_alloc(&OBJC_CLASS___NRBabelLinkFake), "initWithName:", @"fake1");
  v9 = -[NRBabelLinkFake initWithName:](objc_alloc(&OBJC_CLASS___NRBabelLinkFake), "initWithName:", @"fake2");
  -[NSMutableArray addObject:](v3->_fakeLinks, "addObject:", v8);
  -[NSMutableArray addObject:](v3->_fakeLinks, "addObject:", v9);
  v10 = -[NRBabelInstanceFake initWithName:](objc_alloc(&OBJC_CLASS___NRBabelInstanceFake), "initWithName:", @"A");
  v11 = -[NRBabelInstanceFake initWithName:](objc_alloc(&OBJC_CLASS___NRBabelInstanceFake), "initWithName:", @"B");
  v12 = -[NRBabelInstanceFake initWithName:](objc_alloc(&OBJC_CLASS___NRBabelInstanceFake), "initWithName:", @"C");
  -[NSMutableArray addObject:](v3->_fakeInstances, "addObject:", v10);
  -[NSMutableArray addObject:](v3->_fakeInstances, "addObject:", v11);
  -[NSMutableArray addObject:](v3->_fakeInstances, "addObject:", v12);

  return v3;
}

- (NSMutableArray)fakeInstances
{
  return self->_fakeInstances;
}

- (void)setFakeInstances:(id)a3
{
}

- (NSMutableArray)fakeLinks
{
  return self->_fakeLinks;
}

- (void)setFakeLinks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end