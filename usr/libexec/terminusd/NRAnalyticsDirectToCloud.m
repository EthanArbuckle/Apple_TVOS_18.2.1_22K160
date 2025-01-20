@interface NRAnalyticsDirectToCloud
- (void)submit;
@end

@implementation NRAnalyticsDirectToCloud

- (void)submit
{
  if (self)
  {
    unint64_t directToCloudRequestStart = self->_directToCloudRequestStart;
    unint64_t directToCloudRequestEnd = self->_directToCloudRequestEnd;
    double v7 = 0.0;
    if (directToCloudRequestStart) {
      BOOL v8 = directToCloudRequestEnd > directToCloudRequestStart;
    }
    else {
      BOOL v8 = 0;
    }
    double v9 = 0.0;
    if (v8)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v2) = dword_1001DC9F8;
      LODWORD(v3) = *(_DWORD *)algn_1001DC9FC;
      double v3 = (double)*(unint64_t *)&v3;
      double v2 = 0.000000001 * (double)*(unint64_t *)&v2;
      double v9 = (double)(directToCloudRequestEnd - directToCloudRequestStart) * v2 / v3;
    }

    unint64_t iRATManagerQueryStart = self->_iRATManagerQueryStart;
    unint64_t iRATManagerQueryEnd = self->_iRATManagerQueryEnd;
    if (iRATManagerQueryStart) {
      BOOL v12 = iRATManagerQueryEnd > iRATManagerQueryStart;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v2) = dword_1001DC9F8;
      LODWORD(v3) = *(_DWORD *)algn_1001DC9FC;
      double v7 = (double)*(unint64_t *)&v2
         * 0.000001
    }
  }

  else
  {
    double v9 = 0.0;
    double v7 = 0.0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v9 * 1000.0) * 0.001));
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( eventDictionary,  "setObject:forKeyedSubscript:",  v13,  @"requestDurationInSec");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v7) * 0.001));
  if (self) {
    v16 = self->super._eventDictionary;
  }
  else {
    v16 = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v15,  @"iRATQueryDurationInSec");

  if (self) {
    double v17 = self->_timeSinceLastDirectToCloudRequest * 1000.0;
  }
  else {
    double v17 = 0.0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v17) * 0.001));
  if (!self)
  {
    v21 = @"timeSinceLastRequestInSec";
    v20 = 0LL;
    goto LABEL_29;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v18,  @"timeSinceLastRequestInSec");

  if (self->_iRATManagerQueryIncomplete)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v19,  @"iRATManagerQueryIncomplete");
  }

  if (self->_fallbackAdvisoryIssued)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    v20 = self->super._eventDictionary;
    v21 = @"fallbackAdvisoryIssued";
LABEL_29:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v18, v21);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.directToCloud");
}

@end