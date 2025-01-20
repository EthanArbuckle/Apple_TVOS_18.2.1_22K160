@interface NRBabelInterface
- (BOOL)dtlsEnabled;
- (BOOL)isLocalAddressEqualTo:(const in6_addr *)a3;
- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3;
- (BOOL)viable;
- (NRBabelInstance)instance;
- (NRBabelInterface)initWithInstance:(id)a3;
- (OS_dispatch_source)outgoingPublicHelloTimer;
- (in6_addr)localAddress;
- (in6_addr)localAddressInner;
- (unsigned)mtu;
- (unsigned)outgoingPublicHelloSeqno;
- (void)dealloc;
- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5;
- (void)setDtlsEnabled:(BOOL)a3;
- (void)setInstance:(id)a3;
- (void)setLocalAddress:(in6_addr *)a3;
- (void)setLocalAddressInner:(in6_addr)a3;
- (void)setMtu:(unsigned __int16)a3;
- (void)setOutgoingPublicHelloSeqno:(unsigned __int16)a3;
- (void)setOutgoingPublicHelloTimer:(id)a3;
- (void)setViable:(BOOL)a3;
@end

@implementation NRBabelInterface

- (in6_addr)localAddress
{
  return &self->_localAddressInner;
}

- (void)setLocalAddress:(in6_addr *)a3
{
  self->_localAddressInner = *a3;
}

- (NRBabelInterface)initWithInstance:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NRBabelInterface;
  v5 = -[NRBabelInterface init](&v24, "init");
  if (!v5)
  {
    id v12 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v12, 16LL);

    if (IsLevelEnabled)
    {
      id v14 = sub_1000B07C8();
      _NRLogWithArgs( v14,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelInterface initWithInstance:]"",  693);
    }

    uint64_t v15 = _os_log_pack_size(12LL);
    v16 = (char *)&handler[-1] - ((__chkstk_darwin(v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v17 = __error();
    uint64_t v18 = _os_log_pack_fill(v16, v15, *v17, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v18 = 136446210;
    *(void *)(v18 + 4) = "-[NRBabelInterface initWithInstance:]";
    id v19 = sub_1000B07C8();
    _NRLogAbortWithPack(v19, v16);
  }

  v6 = v5;
  -[NRBabelInterface setInstance:](v5, "setInstance:", v4);
  v6->_outgoingPublicHelloSeqno = arc4random_uniform(0x10000u);
  v6->_mtu = 1452;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 queue]);
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v7);
  outgoingPublicHelloTimer = v6->_outgoingPublicHelloTimer;
  v6->_outgoingPublicHelloTimer = (OS_dispatch_source *)v8;

  dispatch_source_set_timer( (dispatch_source_t)v6->_outgoingPublicHelloTimer,  0x8000000000000000LL,  0xEE6B2800uLL,  0x989680uLL);
  objc_initWeak(&location, v6);
  v10 = (dispatch_source_s *)v6->_outgoingPublicHelloTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000B0CB8;
  handler[3] = &unk_1001AFED0;
  objc_copyWeak(&v22, &location);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate((dispatch_object_t)v6->_outgoingPublicHelloTimer);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v6;
}

- (void)dealloc
{
  outgoingPublicHelloTimer = self->_outgoingPublicHelloTimer;
  if (outgoingPublicHelloTimer)
  {
    dispatch_source_cancel((dispatch_source_t)outgoingPublicHelloTimer);
    id v4 = self->_outgoingPublicHelloTimer;
    self->_outgoingPublicHelloTimer = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRBabelInterface;
  -[NRBabelInterface dealloc](&v5, "dealloc");
}

- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3
{
  return 1;
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (qword_1001DC8B0 != -1) {
    goto LABEL_7;
  }
  while (1)
  {
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
    {
      if (p_class_meths[278] != (__objc2_meth_list *)-1LL) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d ABORTING: NOT IMPLEMENTED - USE SUBCLASS!",  ",  "-[NRBabelInterface sendPacket:iovLen:toAddr:]"",  764);
    }

    p_class_meths = (__objc2_meth_list **)_os_log_pack_size(12LL);
    v6 = (char *)&v10 - ((__chkstk_darwin(p_class_meths) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v7 = __error();
    uint64_t v8 = _os_log_pack_fill( v6,  p_class_meths,  *v7,  &_mh_execute_header,  "%{public}s NOT IMPLEMENTED - USE SUBCLASS!");
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "-[NRBabelInterface sendPacket:iovLen:toAddr:]";
    id v9 = sub_1000B07C8();
    _NRLogAbortWithPack(v9, v6);
LABEL_7:
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }

- (BOOL)isLocalAddressEqualTo:(const in6_addr *)a3
{
  return *(void *)self->_localAddressInner.__u6_addr8 == *(void *)a3->__u6_addr8
      && *(void *)&self->_localAddressInner.__u6_addr32[2] == *(void *)&a3->__u6_addr32[2];
}

- (unsigned)outgoingPublicHelloSeqno
{
  return self->_outgoingPublicHelloSeqno;
}

- (void)setOutgoingPublicHelloSeqno:(unsigned __int16)a3
{
  self->_outgoingPublicHelloSeqno = a3;
}

- (OS_dispatch_source)outgoingPublicHelloTimer
{
  return self->_outgoingPublicHelloTimer;
}

- (void)setOutgoingPublicHelloTimer:(id)a3
{
}

- (NRBabelInstance)instance
{
  return (NRBabelInstance *)objc_loadWeakRetained((id *)&self->_instance);
}

- (void)setInstance:(id)a3
{
}

- (in6_addr)localAddressInner
{
  uint64_t v2 = *(void *)&self->_localAddressInner.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_localAddressInner.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)setLocalAddressInner:(in6_addr)a3
{
  self->_localAddressInner = a3;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (void)setMtu:(unsigned __int16)a3
{
  self->_mtu = a3;
}

- (BOOL)viable
{
  return self->_viable;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)dtlsEnabled
{
  return self->_dtlsEnabled;
}

- (void)setDtlsEnabled:(BOOL)a3
{
  self->_dtlsEnabled = a3;
}

- (void).cxx_destruct
{
}

@end