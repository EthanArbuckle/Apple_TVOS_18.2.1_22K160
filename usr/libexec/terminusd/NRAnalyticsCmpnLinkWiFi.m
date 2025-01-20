@interface NRAnalyticsCmpnLinkWiFi
- (void)submit;
@end

@implementation NRAnalyticsCmpnLinkWiFi

- (void)submit
{
  double v8 = 0.0;
  if (self)
  {
    unint64_t symptomsNOIRegistrationStart = self->_symptomsNOIRegistrationStart;
    unint64_t symptomsNOIRegistrationEnd = self->_symptomsNOIRegistrationEnd;
    if (symptomsNOIRegistrationStart && symptomsNOIRegistrationEnd > symptomsNOIRegistrationStart)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v6) = dword_1001DC9F8;
      LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
      double v8 = (double)v6 * 0.000001 * (double)(symptomsNOIRegistrationEnd - symptomsNOIRegistrationStart) / (double)v7;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v8) * 0.001));
  if (!self)
  {
    v16 = @"symptomsNOIRegistrationTimeInSec";
    eventDictionary = 0LL;
    goto LABEL_17;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v12,  @"symptomsNOIRegistrationTimeInSec");

  if (self->_symptomsAdvisoryFalsePositivesCounter)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v13,  @"symptomsAdvisoryFalsePositivesCounter");
  }

  if (self->_virtualInterfaceRetryCounter)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v14,  @"virtualInterfaceRetryCounter");
  }

  if (self->_symptomsNOIRegistrationCounter)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    eventDictionary = self->super.super._eventDictionary;
    v16 = @"symptomsNOIRegistrationCounter";
LABEL_17:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v12, v16);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.cmpnLinkWiFi");
}

@end