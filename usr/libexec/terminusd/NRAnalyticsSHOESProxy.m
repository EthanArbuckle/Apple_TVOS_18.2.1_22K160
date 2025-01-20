@interface NRAnalyticsSHOESProxy
- (void)submit;
@end

@implementation NRAnalyticsSHOESProxy

- (void)submit
{
  if (self)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalConnectionCounter));
    eventDictionary = self->super._eventDictionary;
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
    eventDictionary = 0LL;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( eventDictionary,  "setObject:forKeyedSubscript:",  v3,  @"shoesProxyTotalConnections");

  if (self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_maxSimultanousConnectionCounter));
    v6 = self->super._eventDictionary;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
    v6 = 0LL;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v5,  @"socksProxyMaxSimutaneousConnections");

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.shoesProxy");
}

@end