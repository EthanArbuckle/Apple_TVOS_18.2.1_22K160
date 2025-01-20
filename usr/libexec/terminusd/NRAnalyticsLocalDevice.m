@interface NRAnalyticsLocalDevice
- (void)submit;
@end

@implementation NRAnalyticsLocalDevice

- (void)submit
{
  double v5 = 0.0;
  if (self)
  {
    unint64_t deviceRegistrationStart = self->_deviceRegistrationStart;
    unint64_t deviceRegistrationEnd = self->_deviceRegistrationEnd;
    if (deviceRegistrationStart && deviceRegistrationEnd > deviceRegistrationStart)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v2) = dword_1001DC9F8;
      LODWORD(v3) = *(_DWORD *)algn_1001DC9FC;
      double v5 = (double)v2 * 0.000001 * (double)(deviceRegistrationEnd - deviceRegistrationStart) / (double)v3;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (!self)
  {
    v12 = @"deviceRegistrationTimeInSec";
    eventDictionary = 0LL;
    goto LABEL_15;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v9,  @"deviceRegistrationTimeInSec");

  if (self->_deviceRegistrationSuccess)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v10,  @"deviceRegistrationSuccess");
  }

  if (self->_devicePairedWithOOBKey)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    eventDictionary = self->super._eventDictionary;
    v12 = @"devicePairedWithOOBKey";
LABEL_15:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v9, v12);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.localDevice");
}

@end