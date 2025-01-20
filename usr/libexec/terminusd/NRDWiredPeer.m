@interface NRDWiredPeer
- (NRDWiredPeer)init;
- (NSMutableDictionary)interfaceToPeerAddressDictionary;
- (id)description;
- (void)setInterfaceToPeerAddressDictionary:(id)a3;
@end

@implementation NRDWiredPeer

- (NRDWiredPeer)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NRDWiredPeer;
  v2 = -[NRDWiredPeer init](&v16, "init");
  if (!v2)
  {
    id v7 = sub_1000C58FC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16LL);

    if (IsLevelEnabled)
    {
      id v9 = sub_1000C58FC();
      _NRLogWithArgs(v9, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRDWiredPeer init]"", 29);
    }

    uint64_t v10 = _os_log_pack_size(12LL);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v12 = __error();
    uint64_t v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRDWiredPeer init]";
    id v14 = sub_1000C58FC();
    _NRLogAbortWithPack(v14, v11);
  }

  v3 = v2;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  interfaceToPeerAddressDictionary = v3->_interfaceToPeerAddressDictionary;
  v3->_interfaceToPeerAddressDictionary = v4;

  return v3;
}

- (id)description
{
  return -[NSMutableDictionary description](self->_interfaceToPeerAddressDictionary, "description");
}

- (NSMutableDictionary)interfaceToPeerAddressDictionary
{
  return self->_interfaceToPeerAddressDictionary;
}

- (void)setInterfaceToPeerAddressDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end