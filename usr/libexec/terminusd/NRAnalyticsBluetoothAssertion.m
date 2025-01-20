@interface NRAnalyticsBluetoothAssertion
- (void)submit;
@end

@implementation NRAnalyticsBluetoothAssertion

- (void)submit
{
  if (self) {
    double v3 = self->_durationInSec * 1000.0;
  }
  else {
    double v3 = 0.0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v3) * 0.001));
  if (!self)
  {
    v6 = @"durationInSec";
    eventDictionary = 0LL;
    goto LABEL_6;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v4,  @"durationInSec");

  if (self->_multipleAssertions)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    eventDictionary = self->super._eventDictionary;
    v6 = @"multipleAssertions";
LABEL_6:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v4, v6);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.bluetoothAssertion");
}

@end