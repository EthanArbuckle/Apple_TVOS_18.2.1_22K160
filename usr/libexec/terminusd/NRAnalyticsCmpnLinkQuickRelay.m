@interface NRAnalyticsCmpnLinkQuickRelay
- (void)reset;
- (void)submit;
@end

@implementation NRAnalyticsCmpnLinkQuickRelay

- (void)submit
{
  if (self)
  {
    unint64_t idsSessionSendInvitationStart = self->_idsSessionSendInvitationStart;
    unint64_t idsSessionSendInvitationEnd = self->_idsSessionSendInvitationEnd;
    double v10 = 0.0;
    if (idsSessionSendInvitationStart) {
      BOOL v11 = idsSessionSendInvitationEnd > idsSessionSendInvitationStart;
    }
    else {
      BOOL v11 = 0;
    }
    double v12 = 0.0;
    if (v11)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v6) = dword_1001DC9F8;
      LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v12 = (double)(idsSessionSendInvitationEnd - idsSessionSendInvitationStart) * v6 / v7;
    }

    unint64_t idsSessionReceiveInvitationStart = self->_idsSessionReceiveInvitationStart;
    unint64_t idsSessionReceiveInvitationEnd = self->_idsSessionReceiveInvitationEnd;
    if (idsSessionReceiveInvitationStart) {
      BOOL v15 = idsSessionReceiveInvitationEnd > idsSessionReceiveInvitationStart;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v6) = dword_1001DC9F8;
      LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v10 = (double)(idsSessionReceiveInvitationEnd - idsSessionReceiveInvitationStart) * v6 / v7;
    }

    unint64_t idsSessionStart = self->_idsSessionStart;
    unint64_t idsSessionEnd = self->_idsSessionEnd;
    double v18 = 0.0;
    if (idsSessionStart) {
      BOOL v19 = idsSessionEnd > idsSessionStart;
    }
    else {
      BOOL v19 = 0;
    }
    double v20 = 0.0;
    if (v19)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v6) = dword_1001DC9F8;
      LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v20 = (double)(idsSessionEnd - idsSessionStart) * v6 / v7;
    }

    unint64_t ikeClassDKeepAliveStart = self->_ikeClassDKeepAliveStart;
    unint64_t ikeClassDKeepAliveEnd = self->_ikeClassDKeepAliveEnd;
    if (ikeClassDKeepAliveStart) {
      BOOL v23 = ikeClassDKeepAliveEnd > ikeClassDKeepAliveStart;
    }
    else {
      BOOL v23 = 0;
    }
    if (v23)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v6) = dword_1001DC9F8;
      LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v18 = (double)(ikeClassDKeepAliveEnd - ikeClassDKeepAliveStart) * v6 / v7;
    }

    unint64_t ikeClassCKeepAliveStart = self->_ikeClassCKeepAliveStart;
    double v25 = 0.0;
    if (ikeClassCKeepAliveStart)
    {
      unint64_t ikeClassCKeepAliveEnd = self->_ikeClassCKeepAliveEnd;
      unint64_t v27 = ikeClassCKeepAliveEnd - ikeClassCKeepAliveStart;
      if (ikeClassCKeepAliveEnd > ikeClassCKeepAliveStart)
      {
        if (qword_1001DC9F0 != -1) {
          dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
        }
        LODWORD(v6) = dword_1001DC9F8;
        LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
        double v25 = (double)v27 * (0.000000001 * (double)*(unint64_t *)&v6) / (double)*(unint64_t *)&v7;
      }
    }

    if (self->_idsSessionInvitationFailed)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v12 * 1000.0) * 0.001));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v28,  @"idsSessionInvitationTimeToFailureInSec");

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  &off_1001BCAB8,  @"idsSessionSendInvitationDurationInSec");
      goto LABEL_45;
    }

    eventDictionary = self->super.super._eventDictionary;
  }

  else
  {
    eventDictionary = 0LL;
    double v25 = 0.0;
    double v18 = 0.0;
    double v20 = 0.0;
    double v10 = 0.0;
    double v12 = 0.0;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( eventDictionary,  "setObject:forKeyedSubscript:",  &off_1001BCAB8,  @"idsSessionInvitationTimeToFailureInSec");
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v12 * 1000.0) * 0.001));
  if (self) {
    v31 = self->super.super._eventDictionary;
  }
  else {
    v31 = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v30,  @"idsSessionSendInvitationDurationInSec");

LABEL_45:
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v10 * 1000.0) * 0.001));
  if (self) {
    v33 = self->super.super._eventDictionary;
  }
  else {
    v33 = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v32,  @"idsSessionReceiveInvitationDurationInSec");

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v20 * 1000.0) * 0.001));
  if (self) {
    v35 = self->super.super._eventDictionary;
  }
  else {
    v35 = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v35,  "setObject:forKeyedSubscript:",  v34,  @"idsSessionDurationInSec");

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v18 * 1000.0) * 0.001));
  if (self) {
    v37 = self->super.super._eventDictionary;
  }
  else {
    v37 = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v37,  "setObject:forKeyedSubscript:",  v36,  @"ikeClassDKeepAliveDurationInSec");

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v25 * 1000.0) * 0.001));
  if (!self)
  {
    v40 = @"ikeClassCKeepAliveDurationInSec";
    v39 = 0LL;
    goto LABEL_54;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v38,  @"ikeClassCKeepAliveDurationInSec");

  if (self->_idsSessionEndedReason)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    v39 = self->super.super._eventDictionary;
    v40 = @"idsSessionEndedReason";
LABEL_54:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v38, v40);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.cmpnLinkQuickRelay");
}

- (void)reset
{
  if (self)
  {
    self->_idsSessionInvitationCollisionCount = 0LL;
    self->_unint64_t idsSessionSendInvitationStart = 0LL;
    self->_unint64_t idsSessionSendInvitationEnd = 0LL;
    self->_unint64_t idsSessionReceiveInvitationStart = 0LL;
    self->_unint64_t idsSessionReceiveInvitationEnd = 0LL;
    self->_unint64_t idsSessionStart = 0LL;
    self->_unint64_t idsSessionEnd = 0LL;
    self->super._ikeClassCAttempts = 0LL;
    self->super._ikeClassDAttempts = 0LL;
    self->super._ikeClassDSetupStart = 0LL;
    self->super._ikeClassDSetupEnd = 0LL;
    self->super._ikeClassCSetupStart = 0LL;
    self->super._ikeClassCSetupEnd = 0LL;
    self->_unint64_t ikeClassDKeepAliveStart = 0LL;
    self->_unint64_t ikeClassCKeepAliveStart = 0LL;
    self->_unint64_t ikeClassDKeepAliveEnd = 0LL;
    self->_unint64_t ikeClassCKeepAliveEnd = 0LL;
  }

@end