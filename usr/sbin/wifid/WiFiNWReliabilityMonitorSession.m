@interface WiFiNWReliabilityMonitorSession
- (BOOL)isSessionReliable:(int)a3;
- (NSString)connectedBSSID;
- (NSString)connectedSSID;
- (WiFiNWReliabilityMonitorSession)initWithNetworkRecord:(void *)a3 withMetrics:(unint64_t)a4 withMaxSamples:(unint64_t)a5 withMinSampleThresh:(int)a6;
- (id)description;
- (int)minSampleThresh;
- (unint64_t)getSampleCount:(unint64_t)a3;
- (unint64_t)maxSamples;
- (unint64_t)metrics;
- (void)dealloc;
- (void)ingestLQMUpdate:(id)a3;
- (void)setConnectedBSSID:(id)a3;
- (void)setConnectedSSID:(id)a3;
@end

@implementation WiFiNWReliabilityMonitorSession

- (WiFiNWReliabilityMonitorSession)initWithNetworkRecord:(void *)a3 withMetrics:(unint64_t)a4 withMaxSamples:(unint64_t)a5 withMinSampleThresh:(int)a6
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___WiFiNWReliabilityMonitorSession;
  v10 = -[WiFiNWReliabilityMonitorSession init](&v22, "init");
  if (!v10) {
    goto LABEL_14;
  }
  if (!a3)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s without networkRecord",  "-[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]");
    }
    objc_autoreleasePoolPop(v21);
    goto LABEL_14;
  }

  v11 = sub_1000951FC((uint64_t)a3, @"BSSID");
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  connectedBSSID = v10->_connectedBSSID;
  v10->_connectedBSSID = (NSString *)v12;

  v14 = sub_100095BC8(a3);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  connectedSSID = v10->_connectedSSID;
  v10->_connectedSSID = (NSString *)v15;

  v17 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s session created for BSSID:%@ SSID:%@", "-[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]", v10->_connectedBSSID, v10->_connectedSSID message];
  }
  objc_autoreleasePoolPop(v17);
  v10->_maxSamples = a5;
  if (!a5
    || (v10->_minSampleThresh = a6) == 0
    || (v10->_metrics = a4) == 0
    || (a4 & 1) != 0
    && (v18 = -[WiFiNWReliabilityMonitorDataStore initWithMetric:withMaxSamples:]( objc_alloc(&OBJC_CLASS___WiFiNWReliabilityMonitorDataStore),  "initWithMetric:withMaxSamples:",  1LL,  v10->_maxSamples),  rssiStore = v10->_rssiStore,  v10->_rssiStore = v18,  rssiStore,  !v10->_rssiStore))
  {
LABEL_14:

    return 0LL;
  }

  return v10;
}

- (void)dealloc
{
  rssiStore = self->_rssiStore;
  if (rssiStore)
  {
    self->_rssiStore = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiNWReliabilityMonitorSession;
  -[WiFiNWReliabilityMonitorSession dealloc](&v4, "dealloc");
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RSSI"]);
    id v6 = [v5 intValue];

    id v7 = -[WiFiNWReliabilitDataStoreSampleType init:withTimestamp:]( [WiFiNWReliabilitDataStoreSampleType alloc],  "init:withTimestamp:",  v6,  [v12 objectForKey:@"LQMTIMESTAMP"]);
    -[WiFiNWReliabilityMonitorDataStore addSample:](self->_rssiStore, "addSample:", v7);
    v8 = objc_autoreleasePoolPush();
    v9 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiNWReliabilityMonitorSession description](self, "description"));
      [v9 WFLog:3, "%s: Session:%@ received LQM update, RSSI:%d", "-[WiFiNWReliabilityMonitorSession ingestLQMUpdate:]", v10, v6 message];
    }

    objc_autoreleasePoolPop(v8);
  }

  else
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s without argument!",  "-[WiFiNWReliabilityMonitorSession ingestLQMUpdate:]");
    }
    objc_autoreleasePoolPop(v11);
  }
}

- (BOOL)isSessionReliable:(int)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  BOOL v3 = 1;
  char v13 = 1;
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  int v9 = 0;
  rssiStore = self->_rssiStore;
  if (rssiStore)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100006EC0;
    v6[3] = &unk_1001E2570;
    v6[4] = &v10;
    v6[5] = v8;
    int v7 = a3;
    -[WiFiNWReliabilityMonitorDataStore getSamples:](rssiStore, "getSamples:", v6);
    BOOL v3 = *((_BYTE *)v11 + 24) != 0;
  }

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (unint64_t)getSampleCount:(unint64_t)a3
{
  if (a3 == 1) {
    return -[WiFiNWReliabilityMonitorDataStore getCount](self->_rssiStore, "getCount");
  }
  id v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s Unsupported metric: %lu",  "-[WiFiNWReliabilityMonitorSession getSampleCount:]",  a3);
  }
  objc_autoreleasePoolPop(v4);
  return 0LL;
}

- (id)description
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiNWReliabilityMonitorSession connectedBSSID](self, "connectedBSSID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiNWReliabilityMonitorSession connectedSSID](self, "connectedSSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[BSSID:%@ SSID:%@]",  v3,  v4));

  return v5;
}

- (unint64_t)metrics
{
  return self->_metrics;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (int)minSampleThresh
{
  return self->_minSampleThresh;
}

- (NSString)connectedBSSID
{
  return self->_connectedBSSID;
}

- (void)setConnectedBSSID:(id)a3
{
}

- (NSString)connectedSSID
{
  return self->_connectedSSID;
}

- (void)setConnectedSSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end