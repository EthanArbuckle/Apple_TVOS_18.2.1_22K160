@interface BKTouchDestinationStatistic
- (NSMutableDictionary)statsPerDestination;
- (void)addDestination:(id)a3 touchIdentifier:(unsigned int)a4;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)reset;
- (void)setStatsPerDestination:(id)a3;
@end

@implementation BKTouchDestinationStatistic

- (void)addDestination:(id)a3 touchIdentifier:(unsigned int)a4
{
  v6 = (unsigned int *)a3;
  statsPerDestination = self->_statsPerDestination;
  v22 = v6;
  if (!statsPerDestination)
  {
    NSMutableDictionary *v8 = [[NSMutableDictionary alloc] init];
    v9 = self->_statsPerDestination;
    self->_statsPerDestination = v8;

    v6 = v22;
    statsPerDestination = self->_statsPerDestination;
  }

  v10 = [statsPerDestination objectForKey:v6];
  if (!v10)
  {
    BKTouchDestinationStats *v10 = [[BKTouchDestinationStats alloc] init];
    [self->_statsPerDestination setObject:v10 forKey:v22];
    if (v22) {
      uint64_t v12 = v22[3];
    }
    else {
      uint64_t v12 = 0LL;
    }
    uint64_t ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(v22, v11);
    v14 = [ClientConnectionManager autorelease];
    v15 = [v14 clientForTaskPort:v12];
    v16 = v15;
    if (v15)
    {
      unsigned int v17 = [v15 pid];
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0xFFFFFFFFLL;
      }
    }

    else
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }

    uint64_t v19 = BSProcessDescriptionForPID(v18);
    v20 = [v19 autorelease];
    [v10 setProcessDescription:v20];
  }

  v21 = [v10 touchIdentifiers];
  [v21 addIndex:a4];

  [self setNeedsLogging:YES];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [BSDescriptionStream class];
  id v7 = v4;
  id v11 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v8 = v11;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100067948;
  v12[3] = &unk_1000B8030;
  v12[4] = self;
  id v13 = v9;
  id v10 = v9;
  [v10 appendBodySectionWithName:@"destinations" openDelimiter:@"{" closeDelimiter:@"}" block:v12];
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = [BKTouchDestinationStatistic class];
  [v4 reset];
  statsPerDestination = self->_statsPerDestination;
  self->_statsPerDestination = 0LL;
}

- (NSMutableDictionary)statsPerDestination
{
  return self->_statsPerDestination;
}

- (void)setStatsPerDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end