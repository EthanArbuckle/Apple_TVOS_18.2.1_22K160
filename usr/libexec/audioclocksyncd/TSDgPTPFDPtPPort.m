@interface TSDgPTPFDPtPPort
- (BOOL)_measuringPDelay;
- (BOOL)_multipleRemotes;
- (BOOL)measuringPDelay;
- (BOOL)multipleRemotes;
- (TSDgPTPFDPtPPort)initWithService:(id)a3 pid:(int)a4;
- (TSDgPTPPortStatistics)statistics;
- (char)_localPDelayLogMeanInterval;
- (char)_remotePDelayLogMeanInterval;
- (char)localPDelayLogMeanInterval;
- (char)remotePDelayLogMeanInterval;
- (id)_statistics;
- (void)setLocalPDelayLogMeanInterval:(char)a3;
- (void)setMeasuringPDelay:(BOOL)a3;
- (void)setMultipleRemotes:(BOOL)a3;
- (void)setRemotePDelayLogMeanInterval:(char)a3;
- (void)setStatistics:(id)a3;
- (void)updateProperties;
@end

@implementation TSDgPTPFDPtPPort

- (TSDgPTPFDPtPPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSDgPTPFDPtPPort;
  v4 = -[TSDgPTPNetworkPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(void *)&a4);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPFDPtPPort _statistics](v4, "_statistics"));
    statistics = v5->_statistics;
    v5->_statistics = (TSDgPTPPortStatistics *)v6;

    v5->_localPDelayLogMeanInterval = -[TSDgPTPFDPtPPort _localPDelayLogMeanInterval](v5, "_localPDelayLogMeanInterval");
    v5->_remotePDelayLogMeanInterval = -[TSDgPTPFDPtPPort _remotePDelayLogMeanInterval]( v5,  "_remotePDelayLogMeanInterval");
    v5->_multipleRemotes = -[TSDgPTPFDPtPPort _multipleRemotes](v5, "_multipleRemotes");
    v5->_measuringPDelay = -[TSDgPTPFDPtPPort _measuringPDelay](v5, "_measuringPDelay");
  }

  return v5;
}

- (void)updateProperties
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TSDgPTPFDPtPPort;
  -[TSDgPTPNetworkPort updateProperties](&v16, "updateProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPFDPtPPort _statistics](self, "_statistics"));
  unsigned __int8 v4 = -[TSDgPTPFDPtPPort _localPDelayLogMeanInterval](self, "_localPDelayLogMeanInterval");
  unsigned __int8 v5 = -[TSDgPTPFDPtPPort _remotePDelayLogMeanInterval](self, "_remotePDelayLogMeanInterval");
  unsigned __int8 v6 = -[TSDgPTPFDPtPPort _multipleRemotes](self, "_multipleRemotes");
  unsigned __int8 v7 = -[TSDgPTPFDPtPPort _measuringPDelay](self, "_measuringPDelay");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DF9C;
  block[3] = &unk_10003C790;
  unsigned __int8 v12 = v4;
  unsigned __int8 v13 = v5;
  unsigned __int8 v14 = v6;
  unsigned __int8 v15 = v7;
  block[4] = self;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, block);
}

- (id)_statistics
{
  return  -[TSDgPTPPortStatistics initWithPort:]( objc_alloc(&OBJC_CLASS___TSDgPTPPortStatistics),  "initWithPort:",  self);
}

- (char)_localPDelayLogMeanInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalPDelayLogMeanInterval"]);

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (char)_remotePDelayLogMeanInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"RemotePDelayLogMeanInterval"]);

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_multipleRemotes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"MultipleRemotes"]);

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_measuringPDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"MeasuringPDelay"]);

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (TSDgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (char)localPDelayLogMeanInterval
{
  return self->_localPDelayLogMeanInterval;
}

- (void)setLocalPDelayLogMeanInterval:(char)a3
{
  self->_localPDelayLogMeanInterval = a3;
}

- (char)remotePDelayLogMeanInterval
{
  return self->_remotePDelayLogMeanInterval;
}

- (void)setRemotePDelayLogMeanInterval:(char)a3
{
  self->_remotePDelayLogMeanInterval = a3;
}

- (BOOL)multipleRemotes
{
  return self->_multipleRemotes;
}

- (void)setMultipleRemotes:(BOOL)a3
{
  self->_multipleRemotes = a3;
}

- (BOOL)measuringPDelay
{
  return self->_measuringPDelay;
}

- (void)setMeasuringPDelay:(BOOL)a3
{
  self->_measuringPDelay = a3;
}

- (void).cxx_destruct
{
}

@end