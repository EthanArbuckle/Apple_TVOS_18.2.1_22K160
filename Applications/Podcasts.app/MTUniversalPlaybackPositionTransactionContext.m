@interface MTUniversalPlaybackPositionTransactionContext
+ (id)UPPDomainVersion;
+ (void)setUPPDomainVersion:(id)a3;
- (NSMutableDictionary)mediaItems;
- (double)syncStartTime;
- (id)lastSyncedDomainVersion;
- (void)setMediaItems:(id)a3;
- (void)setSyncStartTime:(double)a3;
@end

@implementation MTUniversalPlaybackPositionTransactionContext

+ (void)setUPPDomainVersion:(id)a3
{
  id v6 = a3;
  id v3 = [v6 length];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v5 = v4;
  if (v3) {
    [v4 setObject:v6 forKey:@"kMTUPPTransitionContextUPPDomainVersionKey"];
  }
  else {
    [v4 removeObjectForKey:@"kMTUPPTransitionContextUPPDomainVersionKey"];
  }
}

+ (id)UPPDomainVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"kMTUPPTransitionContextUPPDomainVersionKey"]);

  return v3;
}

- (id)lastSyncedDomainVersion
{
  return [(id)objc_opt_class(self) UPPDomainVersion];
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (double)syncStartTime
{
  return self->_syncStartTime;
}

- (void)setSyncStartTime:(double)a3
{
  self->_syncStartTime = a3;
}

- (void).cxx_destruct
{
}

@end