@interface NRBabelSource
- (BOOL)isDeepEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewDistanceUnfeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4;
- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4;
- (NRBabelInstance)instance;
- (NRBabelPrefix)bPrefix;
- (NRBabelSource)initWithPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6 instance:(id)a7;
- (OS_dispatch_source)gcTimer;
- (id)description;
- (id)descriptionWithoutMetric;
- (unint64_t)routerID;
- (unsigned)metric;
- (unsigned)seqno;
- (void)dealloc;
- (void)resetGCTimer;
- (void)setBPrefix:(id)a3;
- (void)setGcTimer:(id)a3;
- (void)setInstance:(id)a3;
- (void)setMetric:(unsigned __int16)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setSeqno:(unsigned __int16)a3;
- (void)setupGCTimer;
- (void)updateFeasabilityDistanceWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4;
@end

@implementation NRBabelSource

- (NRBabelSource)initWithPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6 instance:(id)a7
{
  uint64_t v9 = a5;
  v12 = (NRBabelPrefix *)a3;
  id v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NRBabelSource;
  v14 = -[NRBabelSource init](&v28, "init");
  if (!v14)
  {
    id v19 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v19, 16LL);

    if (IsLevelEnabled)
    {
      id v21 = sub_1000B07C8();
      _NRLogWithArgs( v21,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]"",  1886);
    }

    uint64_t v22 = _os_log_pack_size(12LL);
    v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v24 = __error();
    uint64_t v25 = _os_log_pack_fill(v23, v22, *v24, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v25 = 136446210;
    *(void *)(v25 + 4) = "-[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]";
    id v26 = sub_1000B07C8();
    _NRLogAbortWithPack(v26, v23);
  }

  v15 = v14;
  bPrefix = v14->_bPrefix;
  v14->_bPrefix = v12;

  v15->_routerID = a4;
  -[NRBabelSource setSeqno:](v15, "setSeqno:", v9);
  v15->_metric = a6;
  -[NRBabelSource setInstance:](v15, "setInstance:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 sources]);
  [v17 addObject:v15];

  -[NRBabelSource setupGCTimer](v15, "setupGCTimer");
  return v15;
}

- (void)dealloc
{
  gcTimer = self->_gcTimer;
  if (gcTimer) {
    dispatch_source_cancel((dispatch_source_t)gcTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRBabelSource;
  -[NRBabelSource dealloc](&v4, "dealloc");
}

- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4
{
  if (self->_routerID == a4) {
    return [a3 isEqual:self->_bPrefix];
  }
  else {
    return 0;
  }
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
    v7 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v9),  (unsigned __int16)v9,  bswap32(HIDWORD(routerID)) >> 16,  __rev16(HIWORD(routerID)));
  }

  else
  {
    v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v6,  v13,  v14,  v15);
  }

  v10 = v7;
  v11 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ %@ seqno %u metric %u",  bPrefix,  v7,  -[NRBabelSource seqno](self, "seqno"),  self->_metric);

  return v11;
}

- (id)descriptionWithoutMetric
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  bPrefix = self->_bPrefix;
  unint64_t routerID = self->_routerID;
  unint64_t v6 = bswap64(routerID);
  if (v6 > 0xFFFE)
  {
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v9 = bswap32(routerID);
    v7 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v9),  (unsigned __int16)v9,  bswap32(HIDWORD(routerID)) >> 16,  __rev16(HIWORD(routerID)));
  }

  else
  {
    v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v6,  v13,  v14,  v15);
  }

  v10 = v7;
  v11 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ %@ seqno %u",  bPrefix,  v7,  -[NRBabelSource seqno](self, "seqno"));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRBabelSource);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id routerID = (id)self->_routerID;
    if (routerID == [v6 routerID])
    {
      bPrefix = self->_bPrefix;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bPrefix]);
      unsigned __int8 v10 = -[NRBabelPrefix isEqual:](bPrefix, "isEqual:", v9);
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)isDeepEqual:(id)a3
{
  id v4 = a3;
  if (-[NRBabelSource isEqual:](self, "isEqual:", v4)
    && (unsigned int v5 = -[NRBabelSource seqno](self, "seqno"), v5 == [v4 seqno]))
  {
    int metric = self->_metric;
    BOOL v7 = metric == [v4 metric];
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isNewDistanceUnfeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  unsigned int v7 = -[NRBabelSource seqno](self, "seqno");
  if (v7 == v5) {
    goto LABEL_2;
  }
  if (v7 >= v5)
  {
    else {
      LOBYTE(v11) = 1;
    }
  }

  else if ((unsigned __int16)(v5 - v7) != 0x8000)
  {
    int v11 = ((__int16)(v5 - v7) >> 15) | 1;
    return (v11 & 0x80u) != 0;
  }

- (void)updateFeasabilityDistanceWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v5 = a3;
  if (-[NRBabelSource seqno](self, "seqno") < a3)
  {
    -[NRBabelSource setSeqno:](self, "setSeqno:", v5);
    p_unsigned int metric = &self->_metric;
LABEL_5:
    *p_unsigned int metric = v4;
    return;
  }

  if (-[NRBabelSource seqno](self, "seqno") == (_DWORD)v5)
  {
    unsigned int metric = self->_metric;
    p_unsigned int metric = &self->_metric;
    if (metric > v4) {
      goto LABEL_5;
    }
  }

- (void)setupGCTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelSource instance](self, "instance"));
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 queue]);
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
  gcTimer = self->_gcTimer;
  self->_gcTimer = v5;

  unsigned int v7 = self->_gcTimer;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  int v10 = sub_1000B6F58;
  int v11 = &unk_1001AFED0;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v7, &v8);
  dispatch_activate((dispatch_object_t)self->_gcTimer);
  -[NRBabelSource resetGCTimer](self, "resetGCTimer", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)resetGCTimer
{
  gcTimer = self->_gcTimer;
  dispatch_time_t v3 = dispatch_time(0x8000000000000000LL, 180000000000LL);
  dispatch_source_set_timer((dispatch_source_t)gcTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
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
  self->_id routerID = a3;
}

- (unsigned)seqno
{
  return self->_seqno;
}

- (void)setSeqno:(unsigned __int16)a3
{
  self->_seqno = a3;
}

- (unsigned)metric
{
  return self->_metric;
}

- (void)setMetric:(unsigned __int16)a3
{
  self->_unsigned int metric = a3;
}

- (OS_dispatch_source)gcTimer
{
  return self->_gcTimer;
}

- (void)setGcTimer:(id)a3
{
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