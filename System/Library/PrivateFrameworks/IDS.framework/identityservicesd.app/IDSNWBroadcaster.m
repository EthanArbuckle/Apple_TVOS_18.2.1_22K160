@interface IDSNWBroadcaster
- (id)broadcastProxyForTargets:(id)a3;
@end

@implementation IDSNWBroadcaster

- (id)broadcastProxyForTargets:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    v4 = -[IDSNWBroadcastProxy initWithTargets:](objc_alloc(&OBJC_CLASS___IDSNWBroadcastProxy), "initWithTargets:", v3);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

@end