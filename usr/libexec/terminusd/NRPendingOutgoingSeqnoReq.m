@interface NRPendingOutgoingSeqnoReq
- (BOOL)cancelIfMatchesPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5;
- (BOOL)cancelIfRouteUnselected;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4;
- (BOOL)removedFromInstance;
- (NRBabelInstance)instance;
- (NRBabelNeighbor)originator;
- (NRBabelNeighbor)target;
- (NRBabelPrefix)bPrefix;
- (NRBabelRoute)route;
- (NRPendingOutgoingSeqnoReq)initWithInstance:(id)a3 prefix:(id)a4 routerID:(unint64_t)a5;
- (OS_dispatch_source)retryTimer;
- (id)createTLV;
- (id)description;
- (signed)retriesLeft;
- (unint64_t)routerID;
- (unsigned)hopCount;
- (unsigned)seqno;
- (void)cancelTimer;
- (void)cancelWithDelay:(BOOL)a3;
- (void)dealloc;
- (void)sendSeqnoReq;
- (void)setBPrefix:(id)a3;
- (void)setHopCount:(unsigned __int8)a3;
- (void)setInstance:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setRemovedFromInstance:(BOOL)a3;
- (void)setRetriesLeft:(signed __int16)a3;
- (void)setRetryTimer:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setSeqno:(unsigned __int16)a3;
- (void)setTarget:(id)a3;
- (void)start;
@end

@implementation NRPendingOutgoingSeqnoReq

- (id)createTLV
{
  WORD2(v5) = __rev16(-[NRPendingOutgoingSeqnoReq seqno](self, "seqno", 10LL, 0LL, 0LL, 0LL));
  HIWORD(v5) = self->_hopCount;
  bPrefix = self->_bPrefix;
  unint64_t routerID = self->_routerID;
  return objc_autoreleaseReturnValue( -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  &v5,  (-[NRBabelPrefix writeToAE:plen:prefix:]( bPrefix,  "writeToAE:plen:prefix:",  (char *)&v5 + 2,  (char *)&v5 + 3,  &v7)
                             + 14)
           + 2LL));
}

- (void)sendSeqnoReq
{
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d sending seqno req for %@",  ",  "-[NRPendingOutgoingSeqnoReq sendSeqnoReq]"",  2418LL,  self);
  }

  target = self->_target;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRPendingOutgoingSeqnoReq createTLV](self, "createTLV"));
  v6 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[NRBabelNeighbor sendTLVs:](target, "sendTLVs:", v5);
}

- (NRPendingOutgoingSeqnoReq)initWithInstance:(id)a3 prefix:(id)a4 routerID:(unint64_t)a5
{
  id v8 = a3;
  v9 = (NRBabelPrefix *)a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NRPendingOutgoingSeqnoReq;
  v10 = -[NRPendingOutgoingSeqnoReq init](&v32, "init");
  if (!v10)
  {
    id v20 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v20, 16LL);

    if (IsLevelEnabled)
    {
      id v22 = sub_1000B07C8();
      _NRLogWithArgs( v22,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRPendingOutgoingSeqnoReq initWithInstance:prefix:routerID:]"",  2424);
    }

    uint64_t v23 = _os_log_pack_size(12LL);
    v24 = (char *)handler - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v25 = __error();
    uint64_t v26 = _os_log_pack_fill(v24, v23, *v25, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v26 = 136446210;
    *(void *)(v26 + 4) = "-[NRPendingOutgoingSeqnoReq initWithInstance:prefix:routerID:]";
    id v27 = sub_1000B07C8();
    _NRLogAbortWithPack(v27, v24);
  }

  v11 = v10;
  -[NRPendingOutgoingSeqnoReq setInstance:](v10, "setInstance:", v8);
  bPrefix = v11->_bPrefix;
  v11->_bPrefix = v9;
  v13 = v9;

  v11->_unint64_t routerID = a5;
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 queue]);
  dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v14);
  retryTimer = v11->_retryTimer;
  v11->_retryTimer = (OS_dispatch_source *)v15;

  objc_initWeak(&location, v11);
  v17 = (dispatch_source_s *)v11->_retryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000B8D94;
  handler[3] = &unk_1001B0798;
  objc_copyWeak(&v30, &location);
  v18 = v11;
  v29 = v18;
  dispatch_source_set_event_handler(v17, handler);
  dispatch_activate((dispatch_object_t)v11->_retryTimer);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v18;
}

- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4
{
  if (self->_routerID == a4) {
    return -[NRBabelPrefix isEqual:](self->_bPrefix, "isEqual:", a3);
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRPendingOutgoingSeqnoReq);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bPrefix]);
    id v8 = [v6 routerID];

    BOOL v9 = -[NRPendingOutgoingSeqnoReq matchesPrefix:routerID:](self, "matchesPrefix:routerID:", v7, v8);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  bPrefix = self->_bPrefix;
  unint64_t routerID = self->_routerID;
  unint64_t v6 = bswap64(routerID);
  if (v6 > 0xFFFE)
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v9 = bswap32(routerID);
    __int128 v7 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v9),  (unsigned __int16)v9,  bswap32(HIDWORD(routerID)) >> 16,  __rev16(HIWORD(routerID)));
  }

  else
  {
    __int128 v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v6,  v13,  v14,  v15);
  }

  v10 = v7;
  v11 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ %@ seqno %u orig %@ retries %d target %@",  bPrefix,  v7,  -[NRPendingOutgoingSeqnoReq seqno](self, "seqno"),  self->_originator,  self->_retriesLeft,  self->_target);

  return v11;
}

- (void)start
{
  if (self->_retryTimer)
  {
    self->_retriesLeft = 10;
    -[NRPendingOutgoingSeqnoReq sendSeqnoReq](self, "sendSeqnoReq");
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0x8000000000000000LL, 0x3B9ACA00uLL, 0x989680uLL);
  }

  else
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "attempted to start cancelled POSR %@", self);
    }
  }

- (void)cancelTimer
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)retryTimer);
    id v4 = self->_retryTimer;
    self->_retryTimer = 0LL;
  }

- (void)cancelWithDelay:(BOOL)a3
{
  if (a3)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d cancelling POSR soon %@",  ",  "-[NRPendingOutgoingSeqnoReq cancelWithDelay:]"",  2501LL,  self);
    }

    self->_retriesLeft = 0x8000;
    retryTimer = self->_retryTimer;
    dispatch_time_t v5 = dispatch_time(0x8000000000000000LL, 20000000000LL);
    dispatch_source_set_timer((dispatch_source_t)retryTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }

  else
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d removing POSR %@",  ",  "-[NRPendingOutgoingSeqnoReq cancelWithDelay:]"",  2508LL,  self);
    }

    -[NRPendingOutgoingSeqnoReq cancelTimer](self, "cancelTimer");
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NRPendingOutgoingSeqnoReq instance](self, "instance"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 posrs]);
    [v6 removeObject:self];
  }

- (void)dealloc
{
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d dealloc POSR %@",  ",  "-[NRPendingOutgoingSeqnoReq dealloc]"",  2516LL,  self);
  }

  -[NRPendingOutgoingSeqnoReq cancelTimer](self, "cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRPendingOutgoingSeqnoReq;
  -[NRPendingOutgoingSeqnoReq dealloc](&v3, "dealloc");
}

- (BOOL)cancelIfRouteUnselected
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRPendingOutgoingSeqnoReq route](self, "route"));
  id v4 = v3;
  if (!v3)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d cancelling POSR %@ because route vanished",  ",  "-[NRPendingOutgoingSeqnoReq cancelIfRouteUnselected]"",  2524LL,  self);
    }

    goto LABEL_16;
  }

  if (([v3 selected] & 1) == 0)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d cancelling POSR %@ because route %@ was unselected",  ",  "-[NRPendingOutgoingSeqnoReq cancelIfRouteUnselected]"",  2529LL,  self,  v4);
    }

- (BOOL)cancelIfMatchesPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  BOOL v7 = -[NRPendingOutgoingSeqnoReq matchesPrefix:routerID:](self, "matchesPrefix:routerID:", a3, a4);
  if (!v7) {
    return v7;
  }
  unsigned int v8 = -[NRPendingOutgoingSeqnoReq seqno](self, "seqno");
  if (v8 == v5) {
    goto LABEL_11;
  }
  if (v8 >= v5)
  {
    else {
      LOBYTE(v9) = 1;
    }
    goto LABEL_10;
  }

  if ((unsigned __int16)(v5 - v8) == 0x8000)
  {
LABEL_11:
    -[NRPendingOutgoingSeqnoReq cancelWithDelay:](self, "cancelWithDelay:", 0LL);
    LOBYTE(v7) = 1;
    return v7;
  }

  int v9 = ((__int16)(v5 - v8) >> 15) | 1;
LABEL_10:
  if ((v9 & 0x80) == 0) {
    goto LABEL_11;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (NRBabelPrefix)bPrefix
{
  return self->_bPrefix;
}

- (void)setBPrefix:(id)a3
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

- (NRBabelNeighbor)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (NRBabelNeighbor)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (NRBabelRoute)route
{
  return (NRBabelRoute *)objc_loadWeakRetained((id *)&self->_route);
}

- (void)setRoute:(id)a3
{
}

- (signed)retriesLeft
{
  return self->_retriesLeft;
}

- (void)setRetriesLeft:(signed __int16)a3
{
  self->_retriesLeft = a3;
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (unsigned)hopCount
{
  return self->_hopCount;
}

- (void)setHopCount:(unsigned __int8)a3
{
  self->_hopCount = a3;
}

- (NRBabelInstance)instance
{
  return (NRBabelInstance *)objc_loadWeakRetained((id *)&self->_instance);
}

- (void)setInstance:(id)a3
{
}

- (BOOL)removedFromInstance
{
  return self->_removedFromInstance;
}

- (void)setRemovedFromInstance:(BOOL)a3
{
  self->_removedFromInstance = a3;
}

- (void).cxx_destruct
{
}

@end