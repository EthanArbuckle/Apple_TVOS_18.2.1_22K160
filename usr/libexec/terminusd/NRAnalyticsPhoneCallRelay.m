@interface NRAnalyticsPhoneCallRelay
- (void)submit;
@end

@implementation NRAnalyticsPhoneCallRelay

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t phoneCallRelayStart = self->_phoneCallRelayStart;
    unint64_t phoneCallRelayEnd = self->_phoneCallRelayEnd;
    if (phoneCallRelayStart && phoneCallRelayEnd > phoneCallRelayStart)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v2) = dword_1001DC9F8;
      LODWORD(v3) = *(_DWORD *)algn_1001DC9FC;
      double v5 = (double)v2 * 0.000001 * (double)(phoneCallRelayEnd - phoneCallRelayStart) / (double)v3;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( eventDictionary,  "setObject:forKeyedSubscript:",  v9,  @"phoneCallRelayDurationInSec");

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.phoneCallRelay");
}

@end