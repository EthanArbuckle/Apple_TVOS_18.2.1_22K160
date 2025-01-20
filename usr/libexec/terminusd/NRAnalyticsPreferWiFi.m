@interface NRAnalyticsPreferWiFi
- (void)submit;
@end

@implementation NRAnalyticsPreferWiFi

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t preferWiFiRequestStart = self->_preferWiFiRequestStart;
    unint64_t preferWiFiRequestEnd = self->_preferWiFiRequestEnd;
    if (preferWiFiRequestStart && preferWiFiRequestEnd > preferWiFiRequestStart)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v2) = dword_1001DC9F8;
      LODWORD(v3) = *(_DWORD *)algn_1001DC9FC;
      double v5 = (double)v2 * 0.000001 * (double)(preferWiFiRequestEnd - preferWiFiRequestStart) / (double)v3;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( eventDictionary,  "setObject:forKeyedSubscript:",  v9,  @"requestDurationInSec");

  if (self)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_preferWiFiRequestTimedOut));
    v12 = self->super._eventDictionary;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
    v12 = 0LL;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v11,  @"requestTimedOut");

  if (self)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_preferWiFiRequestSuccessful));
    v14 = self->super._eventDictionary;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
    v14 = 0LL;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v13,  @"requestSuccessful");

  if (self)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_linkTransitionsWhileRequestActive));
    v16 = self->super._eventDictionary;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
    v16 = 0LL;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v15,  @"linkTransitionsWhileRequestActive");

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.preferWiFi");
}

@end