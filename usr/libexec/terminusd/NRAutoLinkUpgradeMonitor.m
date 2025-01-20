@interface NRAutoLinkUpgradeMonitor
- (BOOL)cancelled;
- (BOOL)hasActiveNonDefaultAdvice;
- (BOOL)hasReportedHonoredStatusToSymptoms;
- (BOOL)hasReportedUpgradeStatusToSymptoms;
- (BOOL)started;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)aggregateStatsTimerSource;
- (OS_dispatch_source)wifiAdviceMonitorTimerSource;
- (double)totalDurationForBTClassicAdvice;
- (double)totalDurationForWiFiAdvice;
- (double)totalIntervalForNonDefaultAdvice;
- (id)description;
- (id)updateBlock;
- (unint64_t)identifier;
- (unint64_t)lastAdvisoryTime;
- (unint64_t)lastNonDefaultAdvisoryTime;
- (unint64_t)lastReceivedAdvice;
- (unint64_t)lastReceivedReason;
- (unint64_t)timeOfBTClassicAdvice;
- (unint64_t)timeOfWiFiAdvice;
- (unint64_t)totalCountForBTClassicAdvice;
- (unint64_t)totalCountForNonDefaultAdvice;
- (unint64_t)totalCountForWiFiAdvice;
- (unint64_t)totalReceivedUpdates;
- (void)armAggregateStatsTimerSource;
- (void)armWiFiAdviceMonitorTimerSource;
- (void)dealloc;
- (void)invalidateAggregateStatsTimerSource;
- (void)invalidateWiFiAdviceMonitorTimerSource;
- (void)reportEvent:(unsigned int)a3;
- (void)reportEvent:(unsigned int)a3 details:(id)a4;
- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4;
- (void)setAggregateStatsTimerSource:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setHasActiveNonDefaultAdvice:(BOOL)a3;
- (void)setHasReportedHonoredStatusToSymptoms:(BOOL)a3;
- (void)setHasReportedUpgradeStatusToSymptoms:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setLastAdvisoryTime:(unint64_t)a3;
- (void)setLastNonDefaultAdvisoryTime:(unint64_t)a3;
- (void)setLastReceivedAdvice:(unint64_t)a3;
- (void)setLastReceivedAdviceID:(id)a3;
- (void)setLastReceivedReason:(unint64_t)a3;
- (void)setNrUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTimeOfBTClassicAdvice:(unint64_t)a3;
- (void)setTimeOfWiFiAdvice:(unint64_t)a3;
- (void)setTotalCountForBTClassicAdvice:(unint64_t)a3;
- (void)setTotalCountForNonDefaultAdvice:(unint64_t)a3;
- (void)setTotalCountForWiFiAdvice:(unint64_t)a3;
- (void)setTotalDurationForBTClassicAdvice:(double)a3;
- (void)setTotalDurationForWiFiAdvice:(double)a3;
- (void)setTotalIntervalForNonDefaultAdvice:(double)a3;
- (void)setTotalReceivedUpdates:(unint64_t)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setWifiAdviceMonitorTimerSource:(id)a3;
@end

@implementation NRAutoLinkUpgradeMonitor

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t identifier = self->_identifier;
  unsigned int v5 = -[NRAutoLinkUpgradeMonitor started](self, "started");
  unint64_t totalReceivedUpdates = self->_totalReceivedUpdates;
  unint64_t v7 = -[NRAutoLinkUpgradeMonitor lastReceivedAdvice](self, "lastReceivedAdvice");
  v8 = @"None";
  switch(v7)
  {
    case 0uLL:
      break;
    case 1uLL:
      v8 = @"BluetoothDefault";
      break;
    case 2uLL:
      v8 = @"BluetoothClassic";
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      v8 = @"WiFi";
      break;
    default:
      if (v7 == 128) {
        v8 = @"NoUpgrade";
      }
      else {
LABEL_5:
      }
        v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%llu)",  v7);
      break;
  }

  v9 = "Not-";
  if (v5) {
    v9 = "";
  }
  v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"[%llu %sMonitoring %llu %@]",  identifier,  v9,  totalReceivedUpdates,  v8);

  return v10;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRAutoLinkUpgradeMonitor *)self->_nrUUID;
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
    _NRLogWithArgs(v8, 0LL, "%s%.30s:%-4d %@: dealloc", ", "-[NRAutoLinkUpgradeMonitor dealloc]"", 397LL, v2);
  }

  if (v2 && !-[NRAutoLinkUpgradeMonitor cancelled](v2, "cancelled"))
  {
    -[NRAutoLinkUpgradeMonitor setCancelled:](v2, "setCancelled:", 1LL);
    -[NRAutoLinkUpgradeMonitor setUpdateBlock:](v2, "setUpdateBlock:", 0LL);
    -[NRAutoLinkUpgradeMonitor invalidateAggregateStatsTimerSource](v2, "invalidateAggregateStatsTimerSource");
    -[NRAutoLinkUpgradeMonitor reportEvent:](v2, "reportEvent:", 30003LL);
  }

  v9.receiver = v2;
  v9.super_class = (Class)&OBJC_CLASS___NRAutoLinkUpgradeMonitor;
  -[NRAutoLinkUpgradeMonitor dealloc](&v9, "dealloc");
}

- (void)armWiFiAdviceMonitorTimerSource
{
  if (!self->_wifiAdviceMonitorTimerSource)
  {
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRAutoLinkUpgradeMonitor queue](self, "queue"));
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);

    dispatch_time_t v5 = dispatch_time(0LL, 1800000000000LL);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100066904;
    handler[3] = &unk_1001B0798;
    objc_copyWeak(&v11, &location);
    v6 = v4;
    v10 = v6;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    wifiAdviceMonitorTimerSource = self->_wifiAdviceMonitorTimerSource;
    self->_wifiAdviceMonitorTimerSource = (OS_dispatch_source *)v6;
    v8 = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (void)invalidateWiFiAdviceMonitorTimerSource
{
  wifiAdviceMonitorTimerSource = self->_wifiAdviceMonitorTimerSource;
  if (wifiAdviceMonitorTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)wifiAdviceMonitorTimerSource);
    v4 = self->_wifiAdviceMonitorTimerSource;
    self->_wifiAdviceMonitorTimerSource = 0LL;
  }

- (void)armAggregateStatsTimerSource
{
  if (!self->_aggregateStatsTimerSource)
  {
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRAutoLinkUpgradeMonitor queue](self, "queue"));
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);

    dispatch_source_set_timer(v4, 0x8000000000000000LL, 0x13A52453C000uLL, 0x12A05F200uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000666E0;
    handler[3] = &unk_1001B0798;
    objc_copyWeak(&v10, &location);
    dispatch_time_t v5 = v4;
    objc_super v9 = v5;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume(v5);
    aggregateStatsTimerSource = self->_aggregateStatsTimerSource;
    self->_aggregateStatsTimerSource = (OS_dispatch_source *)v5;
    uint64_t v7 = v5;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (void)invalidateAggregateStatsTimerSource
{
  aggregateStatsTimerSource = self->_aggregateStatsTimerSource;
  if (aggregateStatsTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)aggregateStatsTimerSource);
    v4 = self->_aggregateStatsTimerSource;
    self->_aggregateStatsTimerSource = 0LL;
  }

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0LL;
  }
  v8 = nrUUID;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NRAutoLinkUpgradeMonitor description](self, "description"));
  sub_10011BB18(v8, a3, v10, v9);
}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, &v8);

  -[NRAutoLinkUpgradeMonitor reportEvent:details:](self, "reportEvent:details:", v4, v7);
}

- (void)reportEvent:(unsigned int)a3
{
}

- (void)setNrUUID:(id)a3
{
}

- (void)setLastReceivedAdviceID:(id)a3
{
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)lastReceivedAdvice
{
  return self->_lastReceivedAdvice;
}

- (void)setLastReceivedAdvice:(unint64_t)a3
{
  self->_lastReceivedAdvice = a3;
}

- (unint64_t)lastReceivedReason
{
  return self->_lastReceivedReason;
}

- (void)setLastReceivedReason:(unint64_t)a3
{
  self->_lastReceivedReason = a3;
}

- (unint64_t)lastAdvisoryTime
{
  return self->_lastAdvisoryTime;
}

- (void)setLastAdvisoryTime:(unint64_t)a3
{
  self->_lastAdvisoryTime = a3;
}

- (unint64_t)totalReceivedUpdates
{
  return self->_totalReceivedUpdates;
}

- (void)setTotalReceivedUpdates:(unint64_t)a3
{
  self->_unint64_t totalReceivedUpdates = a3;
}

- (OS_dispatch_source)aggregateStatsTimerSource
{
  return self->_aggregateStatsTimerSource;
}

- (void)setAggregateStatsTimerSource:(id)a3
{
}

- (OS_dispatch_source)wifiAdviceMonitorTimerSource
{
  return self->_wifiAdviceMonitorTimerSource;
}

- (void)setWifiAdviceMonitorTimerSource:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (BOOL)hasActiveNonDefaultAdvice
{
  return self->_hasActiveNonDefaultAdvice;
}

- (void)setHasActiveNonDefaultAdvice:(BOOL)a3
{
  self->_hasActiveNonDefaultAdvice = a3;
}

- (BOOL)hasReportedUpgradeStatusToSymptoms
{
  return self->_hasReportedUpgradeStatusToSymptoms;
}

- (void)setHasReportedUpgradeStatusToSymptoms:(BOOL)a3
{
  self->_hasReportedUpgradeStatusToSymptoms = a3;
}

- (BOOL)hasReportedHonoredStatusToSymptoms
{
  return self->_hasReportedHonoredStatusToSymptoms;
}

- (void)setHasReportedHonoredStatusToSymptoms:(BOOL)a3
{
  self->_hasReportedHonoredStatusToSymptoms = a3;
}

- (double)totalIntervalForNonDefaultAdvice
{
  return self->_totalIntervalForNonDefaultAdvice;
}

- (void)setTotalIntervalForNonDefaultAdvice:(double)a3
{
  self->_totalIntervalForNonDefaultAdvice = a3;
}

- (unint64_t)totalCountForNonDefaultAdvice
{
  return self->_totalCountForNonDefaultAdvice;
}

- (void)setTotalCountForNonDefaultAdvice:(unint64_t)a3
{
  self->_totalCountForNonDefaultAdvice = a3;
}

- (unint64_t)lastNonDefaultAdvisoryTime
{
  return self->_lastNonDefaultAdvisoryTime;
}

- (void)setLastNonDefaultAdvisoryTime:(unint64_t)a3
{
  self->_lastNonDefaultAdvisoryTime = a3;
}

- (double)totalDurationForWiFiAdvice
{
  return self->_totalDurationForWiFiAdvice;
}

- (void)setTotalDurationForWiFiAdvice:(double)a3
{
  self->_totalDurationForWiFiAdvice = a3;
}

- (unint64_t)totalCountForWiFiAdvice
{
  return self->_totalCountForWiFiAdvice;
}

- (void)setTotalCountForWiFiAdvice:(unint64_t)a3
{
  self->_totalCountForWiFiAdvice = a3;
}

- (unint64_t)timeOfWiFiAdvice
{
  return self->_timeOfWiFiAdvice;
}

- (void)setTimeOfWiFiAdvice:(unint64_t)a3
{
  self->_timeOfWiFiAdvice = a3;
}

- (double)totalDurationForBTClassicAdvice
{
  return self->_totalDurationForBTClassicAdvice;
}

- (void)setTotalDurationForBTClassicAdvice:(double)a3
{
  self->_totalDurationForBTClassicAdvice = a3;
}

- (unint64_t)totalCountForBTClassicAdvice
{
  return self->_totalCountForBTClassicAdvice;
}

- (void)setTotalCountForBTClassicAdvice:(unint64_t)a3
{
  self->_totalCountForBTClassicAdvice = a3;
}

- (unint64_t)timeOfBTClassicAdvice
{
  return self->_timeOfBTClassicAdvice;
}

- (void)setTimeOfBTClassicAdvice:(unint64_t)a3
{
  self->_timeOfBTClassicAdvice = a3;
}

- (void).cxx_destruct
{
}

@end