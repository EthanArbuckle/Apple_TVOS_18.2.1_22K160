@interface TSDgPTPFDEtEPort
- (TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4;
- (TSDgPTPPortStatistics)statistics;
- (id)_statistics;
- (void)setStatistics:(id)a3;
- (void)updateProperties;
@end

@implementation TSDgPTPFDEtEPort

- (TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSDgPTPFDEtEPort;
  v4 = -[TSDgPTPNetworkPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(void *)&a4);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPFDEtEPort _statistics](v4, "_statistics"));
    statistics = v5->_statistics;
    v5->_statistics = (TSDgPTPPortStatistics *)v6;
  }

  return v5;
}

- (void)updateProperties
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TSDgPTPFDEtEPort;
  -[TSDgPTPNetworkPort updateProperties](&v8, "updateProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPFDEtEPort _statistics](self, "_statistics"));
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F81C;
  v6[3] = &unk_10003C610;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (id)_statistics
{
  return  -[TSDgPTPPortStatistics initWithPort:]( objc_alloc(&OBJC_CLASS___TSDgPTPPortStatistics),  "initWithPort:",  self);
}

- (TSDgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end