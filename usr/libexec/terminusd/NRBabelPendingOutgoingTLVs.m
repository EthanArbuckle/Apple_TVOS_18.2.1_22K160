@interface NRBabelPendingOutgoingTLVs
- (BOOL)representsIHU;
- (BOOL)representsUpdate;
- (NRBabelPendingOutgoingTLVs)initWithInterval:(unsigned __int16)a3;
- (NSMutableArray)tlvs;
- (double)maxTime;
- (double)minTime;
- (void)setMaxTime:(double)a3;
- (void)setMinTime:(double)a3;
- (void)setRepresentsIHU:(BOOL)a3;
- (void)setRepresentsUpdate:(BOOL)a3;
- (void)setTlvs:(id)a3;
@end

@implementation NRBabelPendingOutgoingTLVs

- (NRBabelPendingOutgoingTLVs)initWithInterval:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NRBabelPendingOutgoingTLVs;
  v4 = -[NRBabelPendingOutgoingTLVs init](&v19, "init");
  if (!v4)
  {
    id v10 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 16LL);

    if (IsLevelEnabled)
    {
      id v12 = sub_1000B07C8();
      _NRLogWithArgs( v12,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelPendingOutgoingTLVs initWithInterval:]"",  1298);
    }

    uint64_t v13 = _os_log_pack_size(12LL);
    v14 = (char *)&v18 - ((__chkstk_darwin(v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v15 = __error();
    uint64_t v16 = _os_log_pack_fill(v14, v13, *v15, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "-[NRBabelPendingOutgoingTLVs initWithInterval:]";
    id v17 = sub_1000B07C8();
    _NRLogAbortWithPack(v17, v14);
  }

  v5 = v4;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  v5->_minTime = v6 + (double)(unsigned __int16)((429496730 * (unint64_t)(9 * v3)) >> 32) * 0.01;
  v5->_maxTime = v6 + (double)v3 * 0.01;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  tlvs = v5->_tlvs;
  v5->_tlvs = v7;

  return v5;
}

- (NSMutableArray)tlvs
{
  return self->_tlvs;
}

- (void)setTlvs:(id)a3
{
}

- (double)minTime
{
  return self->_minTime;
}

- (void)setMinTime:(double)a3
{
  self->_minTime = a3;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (void)setMaxTime:(double)a3
{
  self->_maxTime = a3;
}

- (BOOL)representsIHU
{
  return self->_representsIHU;
}

- (void)setRepresentsIHU:(BOOL)a3
{
  self->_representsIHU = a3;
}

- (BOOL)representsUpdate
{
  return self->_representsUpdate;
}

- (void)setRepresentsUpdate:(BOOL)a3
{
  self->_representsUpdate = a3;
}

- (void).cxx_destruct
{
}

@end