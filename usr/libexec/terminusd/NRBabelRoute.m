@interface NRBabelRoute
- (BOOL)isEqual:(id)a3;
- (BOOL)isNextHopEqualTo:(const in6_addr *)a3;
- (BOOL)matchesPrefix:(id)a3 neighbor:(id)a4;
- (BOOL)selected;
- (NRBabelInstance)instance;
- (NRBabelNeighbor)neighbor;
- (NRBabelPrefix)bPrefix;
- (NRBabelRoute)initWithPrefix:(id)a3 neighbor:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 interval:(unsigned __int16)a7 receivedMetric:(unsigned __int16)a8 nextHop:(const in6_addr *)a9 instance:(id)a10;
- (OS_dispatch_source)expiryTimer;
- (id)description;
- (in6_addr)nextHopInner;
- (unint64_t)routerID;
- (unsigned)interval;
- (unsigned)metric;
- (unsigned)numExpiryTimerFires;
- (unsigned)receivedMetric;
- (unsigned)seqno;
- (void)applyUsingSystem;
- (void)resetExpiryTimer;
- (void)setBPrefix:(id)a3;
- (void)setExpiryTimer:(id)a3;
- (void)setInstance:(id)a3;
- (void)setInterval:(unsigned __int16)a3;
- (void)setNeighbor:(id)a3;
- (void)setNextHop:(const in6_addr *)a3;
- (void)setNextHopInner:(in6_addr)a3;
- (void)setNumExpiryTimerFires:(unsigned __int16)a3;
- (void)setReceivedMetric:(unsigned __int16)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeqno:(unsigned __int16)a3;
@end

@implementation NRBabelRoute

- (NRBabelRoute)initWithPrefix:(id)a3 neighbor:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 interval:(unsigned __int16)a7 receivedMetric:(unsigned __int16)a8 nextHop:(const in6_addr *)a9 instance:(id)a10
{
  uint64_t v12 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NRBabelRoute;
  v20 = -[NRBabelRoute init](&v40, "init");
  v21 = v20;
  if (!v20)
  {
    id v28 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v28, 16LL);

    if (IsLevelEnabled)
    {
      id v30 = sub_1000B07C8();
      _NRLogWithArgs( v30,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]"",  2050);
    }

    uint64_t v31 = _os_log_pack_size(12LL);
    v32 = (char *)&handler[-1] - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v33 = __error();
    uint64_t v34 = _os_log_pack_fill(v32, v31, *v33, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v34 = 136446210;
    *(void *)(v34 + 4) = "-[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]";
    id v35 = sub_1000B07C8();
    _NRLogAbortWithPack(v35, v32);
    __break(1u);
  }

  objc_storeStrong((id *)&v20->_bPrefix, a3);
  objc_storeStrong((id *)&v21->_neighbor, a4);
  v21->_routerID = a5;
  -[NRBabelRoute setSeqno:](v21, "setSeqno:", v12);
  v21->_interval = a7;
  v21->_receivedMetric = a8;
  v21->_nextHopInner = *a9;
  -[NRBabelRoute setInstance:](v21, "setInstance:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 routes]);
  [v22 addObject:v21];

  objc_initWeak(&location, v21);
  v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v19 queue]);
  dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v23);
  expiryTimer = v21->_expiryTimer;
  v21->_expiryTimer = (OS_dispatch_source *)v24;

  v26 = (dispatch_source_s *)v21->_expiryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000B7E20;
  handler[3] = &unk_1001AFED0;
  objc_copyWeak(&v38, &location);
  dispatch_source_set_event_handler(v26, handler);
  dispatch_activate((dispatch_object_t)v21->_expiryTimer);
  -[NRBabelRoute resetExpiryTimer](v21, "resetExpiryTimer");
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

  return v21;
}

- (BOOL)matchesPrefix:(id)a3 neighbor:(id)a4
{
  id v6 = a3;
  if (-[NRBabelNeighbor isEqual:](self->_neighbor, "isEqual:", a4)) {
    BOOL v7 = -[NRBabelPrefix isEqual:](self->_bPrefix, "isEqual:", v6);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  bPrefix = self->_bPrefix;
  unint64_t routerID = self->_routerID;
  unint64_t v6 = bswap64(routerID);
  if (v6 > 0xFFFE)
  {
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v9 = bswap32(routerID);
    BOOL v7 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v9),  (unsigned __int16)v9,  bswap32(HIDWORD(routerID)) >> 16,  __rev16(HIWORD(routerID)));
  }

  else
  {
    BOOL v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v6,  v19,  v20,  v21);
  }

  v10 = v7;
  unsigned int v11 = -[NRBabelRoute seqno](self, "seqno");
  uint64_t receivedMetric = self->_receivedMetric;
  unsigned int v13 = -[NRBabelRoute metric](self, "metric");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor descriptionWithNextHop:](self->_neighbor, "descriptionWithNextHop:", &self->_nextHopInner));
  v15 = (void *)v14;
  if (self->_selected) {
    v16 = "";
  }
  else {
    v16 = "not ";
  }
  id v17 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ %@ seqno %u recvMetric %u metric %u via %@ %sselected",  bPrefix,  v10,  v11,  receivedMetric,  v13,  v14,  v16);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRBabelRoute);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bPrefix]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 neighbor]);

    BOOL v9 = -[NRBabelRoute matchesPrefix:neighbor:](self, "matchesPrefix:neighbor:", v7, v8);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setNextHop:(const in6_addr *)a3
{
  self->_nextHopInner = *a3;
}

- (BOOL)isNextHopEqualTo:(const in6_addr *)a3
{
  return *(void *)self->_nextHopInner.__u6_addr8 == *(void *)a3->__u6_addr8
      && *(void *)&self->_nextHopInner.__u6_addr32[2] == *(void *)&a3->__u6_addr32[2];
}

- (unsigned)metric
{
  if (self->_numExpiryTimerFires)
  {
    LOWORD(v2) = -1;
  }

  else
  {
    int receivedMetric = self->_receivedMetric;
    unsigned int v2 = -[NRBabelNeighbor metric](self->_neighbor, "metric") + receivedMetric;
    if (v2 > 0xFFFE) {
      LOWORD(v2) = -1;
    }
  }

  return v2;
}

- (void)resetExpiryTimer
{
  expiryTimer = self->_expiryTimer;
  dispatch_time_t v3 = dispatch_time(0x8000000000000000LL, 35000000LL * self->_interval);
  dispatch_source_set_timer((dispatch_source_t)expiryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)applyUsingSystem
{
  unsigned int v2 = self;
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self->_neighbor, "babelInterface"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NRBabelInterfaceSocket);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelPrefix descriptionWithoutPlen](v2->_bPrefix, "descriptionWithoutPlen"));
    if (!v6)
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d skipping apply of v4 %@",  ",  "-[NRBabelRoute applyUsingSystem]"",  2154LL,  v2);
      }

      goto LABEL_19;
    }

    BOOL selected = v2->_selected;
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    BOOL v9 = v8;
    if (selected)
    {
      unsigned int v10 = -[NRBabelPrefix plen](v2->_bPrefix, "plen");
      IPv6AddrString = (void *)createIPv6AddrString(&v2->_nextHopInner, v11);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](v2->_neighbor, "babelInterface"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ifName]);
      v15 = -[NSString initWithFormat:]( v9,  "initWithFormat:",  @"route -nv delete -inet6 %@ ; route -nv add -inet6 -proto2 -prefixlen %u %@ %@%%%@",
              v6,
              v10,
              v6,
              IPv6AddrString,
              v14);
    }

    else
    {
      v16 = -[NSString initWithFormat:](v8, "initWithFormat:", @"route -nv delete -inet6 %@", v6);
      v15 = v16;
    }

    uint64_t v20 = (dispatch_queue_attr_s *)_NRCopySerialQueueAttr(v16);
    unsigned int v2 = (NRBabelRoute *)"terminusd.babel.commands";
    dispatch_queue_t v21 = dispatch_queue_create("terminusd.babel.commands", v20);

    if (v21)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000B7CCC;
      block[3] = &unk_1001B0720;
      dispatch_queue_t v33 = v21;
      uint64_t v34 = v15;
      v22 = v15;
      v23 = v21;
      dispatch_async(v23, block);

LABEL_19:
      return;
    }

    id v24 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v24, 16LL);

    if (IsLevelEnabled)
    {
      id v26 = sub_1000B07C8();
      _NRLogWithArgs( v26,  16LL,  "%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed",  ",  "nr_dispatch_queue_create",  118,  "terminusd.babel.commands"");
    }

    uint64_t v27 = _os_log_pack_size(22LL);
    p_class_meths = (__objc2_meth_list **)((char *)&block[-1] - ((__chkstk_darwin(v27) + 15) & 0xFFFFFFFFFFFFFFF0LL));
    id v28 = __error();
    uint64_t v29 = _os_log_pack_fill( p_class_meths,  v27,  *v28,  &_mh_execute_header,  "%{public}s dispatch_queue_create(%s) failed");
    *(_DWORD *)uint64_t v29 = 136446466;
    *(void *)(v29 + 4) = "nr_dispatch_queue_create";
    *(_WORD *)(v29 + 12) = 2080;
    *(void *)(v29 + 14) = "terminusd.babel.commands";
    id v30 = sub_1000B07C8();
    _NRLogAbortWithPack(v30, p_class_meths);
    goto LABEL_24;
  }

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 == -1)
    {
LABEL_9:
      neighbor = v2->_neighbor;
      uint64_t v19 = p_class_meths[277];
      id v31 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](neighbor, "babelInterface"));
      _NRLogWithArgs( v19,  1LL,  "%s%.30s:%-4d skipping apply of non-socket %@, neighbor %@, if %@",  ",  "-[NRBabelRoute applyUsingSystem]"",  2148LL,  v2,  neighbor,  v31);

      return;
    }

- (NRBabelPrefix)bPrefix
{
  return self->_bPrefix;
}

- (void)setBPrefix:(id)a3
{
}

- (NRBabelNeighbor)neighbor
{
  return self->_neighbor;
}

- (void)setNeighbor:(id)a3
{
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (void)setRouterID:(unint64_t)a3
{
  self->_unint64_t routerID = a3;
}

- (unsigned)seqno
{
  return self->_seqno;
}

- (void)setSeqno:(unsigned __int16)a3
{
  self->_seqno = a3;
}

- (unsigned)receivedMetric
{
  return self->_receivedMetric;
}

- (void)setReceivedMetric:(unsigned __int16)a3
{
  self->_int receivedMetric = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_BOOL selected = a3;
}

- (in6_addr)nextHopInner
{
  uint64_t v2 = *(void *)&self->_nextHopInner.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_nextHopInner.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)setNextHopInner:(in6_addr)a3
{
  self->_nextHopInner = a3;
}

- (OS_dispatch_source)expiryTimer
{
  return self->_expiryTimer;
}

- (void)setExpiryTimer:(id)a3
{
}

- (unsigned)numExpiryTimerFires
{
  return self->_numExpiryTimerFires;
}

- (void)setNumExpiryTimerFires:(unsigned __int16)a3
{
  self->_numExpiryTimerFires = a3;
}

- (unsigned)interval
{
  return self->_interval;
}

- (void)setInterval:(unsigned __int16)a3
{
  self->_interval = a3;
}

- (NRBabelInstance)instance
{
  return (NRBabelInstance *)objc_loadWeakRetained((id *)&self->_instance);
}

- (void)setInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end