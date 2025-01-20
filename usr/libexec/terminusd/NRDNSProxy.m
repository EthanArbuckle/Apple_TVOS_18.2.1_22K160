@interface NRDNSProxy
- (NRDNSProxy)initWithQueue:(id)a3 nrUUID:(id)a4 delegate:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)start;
@end

@implementation NRDNSProxy

- (NRDNSProxy)initWithQueue:(id)a3 nrUUID:(id)a4 delegate:(id)a5
{
  v8 = (OS_dispatch_queue *)a3;
  v9 = (NSUUID *)a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NRDNSProxy;
  v11 = -[NRDNSProxy init](&v27, "init");
  if (!v11)
  {
    id v18 = sub_10001AE98();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v18, 16LL);

    if (IsLevelEnabled)
    {
      id v20 = sub_10001AE98();
      _NRLogWithArgs( v20,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRDNSProxy initWithQueue:nrUUID:delegate:]"",  69);
    }

    uint64_t v21 = _os_log_pack_size(12LL);
    v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v23 = __error();
    uint64_t v24 = _os_log_pack_fill(v22, v21, *v23, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v24 = 136446210;
    *(void *)(v24 + 4) = "-[NRDNSProxy initWithQueue:nrUUID:delegate:]";
    id v25 = sub_10001AE98();
    _NRLogAbortWithPack(v25, v22);
  }

  v12 = v11;
  do
    unint64_t v13 = __ldxr(&qword_1001DBAC0);
  while (__stxr(v13 + 1, &qword_1001DBAC0));
  v11->_identifier = v13;
  queue = v11->_queue;
  v11->_queue = v8;
  v15 = v8;

  nrUUID = v12->_nrUUID;
  v12->_nrUUID = v9;

  objc_storeWeak((id *)&v12->_delegate, v10);
  v12->_state = 0;

  return v12;
}

- (void)start
{
  v2 = self;
  if (self)
  {
    if (self->_started) {
      return;
    }
    self = (NRDNSProxy *)self->_nrUUID;
  }

  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v5);
    _NRLogWithArgs(v7, 0LL, "%s%.30s:%-4d %@: start", ", "-[NRDNSProxy start]"", 84LL, v2);
  }

  if (v2) {
    v2->_started = 1;
  }
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRDNSProxy *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v6 = nrUUID;
    v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
    _NRLogWithArgs(v8, 0LL, "%s%.30s:%-4d %@: dealloc", ", "-[NRDNSProxy dealloc]"", 90LL, v2);
  }

  if (!v2 || !v2->_cancelled) {
    -[NRDNSProxy cancel](v2, "cancel");
  }
  v9.receiver = v2;
  v9.super_class = (Class)&OBJC_CLASS___NRDNSProxy;
  -[NRDNSProxy dealloc](&v9, "dealloc");
}

- (void)cancel
{
  v2 = self;
  if (self) {
    self = (NRDNSProxy *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v5);
    _NRLogWithArgs(v7, 0LL, "%s%.30s:%-4d %@: cancel", ", "-[NRDNSProxy cancel]"", 98LL, v2);
  }

  if (v2) {
    v2->_cancelled = 1;
  }
}

- (void).cxx_destruct
{
}

@end