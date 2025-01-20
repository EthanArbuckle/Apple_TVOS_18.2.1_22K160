@interface NRAnalyticsKeyManager
- (void)submit;
@end

@implementation NRAnalyticsKeyManager

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t queryKeysStart = self->_queryKeysStart;
    unint64_t queryKeysEnd = self->_queryKeysEnd;
    if (queryKeysStart && queryKeysEnd > queryKeysStart)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v2) = dword_1001DC9F8;
      LODWORD(v3) = *(_DWORD *)algn_1001DC9FC;
      double v5 = (double)v2 * 0.000001 * (double)(queryKeysEnd - queryKeysStart) / (double)v3;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (!self)
  {
    v11 = @"queryKeysDurationInSec";
    eventDictionary = 0LL;
    goto LABEL_13;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v9,  @"queryKeysDurationInSec");

  if (self->_queryKeysSuccess)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    eventDictionary = self->super._eventDictionary;
    v11 = @"queryKeysSuccess";
LABEL_13:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v9, v11);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.keyManager");
}

@end