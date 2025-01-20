@interface NRAnalyticsCmpnLinkBluetooth
- (void)submit;
@end

@implementation NRAnalyticsCmpnLinkBluetooth

- (void)submit
{
  double v8 = 0.0;
  if (self)
  {
    unint64_t ikePairingSessionSetupStart = self->_ikePairingSessionSetupStart;
    unint64_t ikePairingSessionSetupEnd = self->_ikePairingSessionSetupEnd;
    if (ikePairingSessionSetupStart && ikePairingSessionSetupEnd > ikePairingSessionSetupStart)
    {
      if (qword_1001DC9F0 != -1) {
        dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
      }
      LODWORD(v6) = dword_1001DC9F8;
      LODWORD(v7) = *(_DWORD *)algn_1001DC9FC;
      double v8 = (double)v6 * 0.000001 * (double)(ikePairingSessionSetupEnd - ikePairingSessionSetupStart) / (double)v7;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v8) * 0.001));
  if (!self)
  {
    v22 = @"ikePairingSessionSetupTimeInSec";
    eventDictionary = 0LL;
    goto LABEL_29;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v12,  @"ikePairingSessionSetupTimeInSec");

  if (self->_ikePairingSessionSetupAttempts)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v13,  @"ikePairingSessionSetupAttempts");
  }

  if (self->_urgentLoopChecksumError)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v14,  @"urgentLoopChecksumError");
  }

  if (self->_loopChecksumError)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v15,  @"loopChecksumError");
  }

  if (self->_bufferChecksumError)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v16,  @"bufferChecksumError");
  }

  if (self->_preludeChecksumError)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v17,  @"preludeChecksumError");
  }

  if (self->_urgentPreludeChecksumError)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v18,  @"urgentPreludeChecksumError");
  }

  if (self->_preludeTimeoutError)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v19,  @"preludeTimeoutError");
  }

  if (self->_urgentPreludeTimeoutError)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super.super._eventDictionary,  "setObject:forKeyedSubscript:",  v20,  @"urgentPreludeTimeoutError");
  }

  if (self->_urgentPipeDisconnections)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    eventDictionary = self->super.super._eventDictionary;
    v22 = @"urgentPipeDisconnections";
LABEL_29:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v12, v22);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.cmpnLinkBluetooth");
}

@end