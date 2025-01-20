@interface NRAnalyticsLinkManagerBluetooth
- (void)submit;
@end

@implementation NRAnalyticsLinkManagerBluetooth

- (void)submit
{
  if (self)
  {
    if (self->_peerRemovedPairingInformation)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v3,  @"peerRemovedPairingInformation");
    }

    if (self->_noBTPipeCallbacks)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v4,  @"noBTPipeCallbacks");
    }

    if (self->_pipeConnectedDuration)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v5,  @"pipeConnectedDuration");
    }

    if (self->_pipeDisconnectedDuration)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v6,  @"pipeDisconnectedDuration");
    }
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.lnkMgrbluetooth");
}

@end