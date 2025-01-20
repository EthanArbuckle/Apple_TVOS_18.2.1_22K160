@interface GKLocalPlayerInternal
+ (id)_profileArchiveURLEnsuringDirectory:(BOOL)a3;
+ (id)archivedProfile;
+ (void)archiveProfile:(id)a3;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKLocalPlayerInternal

+ (id)_profileArchiveURLEnsuringDirectory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[GKClientProxy cacheDirectoryForBundleID:](&OBJC_CLASS___GKClientProxy, "cacheDirectoryForBundleID:", 0LL));
  v5 = (void *)v4;
  if (v3) {
    id v6 = (id)gkEnsureDirectory(v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"GKLocalPlayer.offline"]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  return v8;
}

+ (void)archiveProfile:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _profileArchiveURLEnsuringDirectory:1]);
  id v10 = 0LL;
  unsigned __int8 v6 = [v4 writeToURL:v5 options:1 error:&v10];
  id v7 = v10;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(v7);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000208D4();
    }
  }
}

+ (id)archivedProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _profileArchiveURLEnsuringDirectory:0]);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v2));

  if (v3)
  {
    id v11 = 0LL;
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___GKPlayerInternal, v4),  v3,  &v11);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v11;
    v8 = v7;
    if (v7)
    {
      if (!os_log_GKGeneral) {
        id v9 = (id)GKOSLoggers(v7);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_10002093C();
      }
    }
  }

  else
  {
    unsigned __int8 v6 = 0LL;
  }

  return v6;
}

- (void)updateWithCacheObject:(id)a3
{
  v9.receiver = self;
  v9.super_class = &OBJC_CLASS___GKLocalPlayerInternal;
  id v4 = a3;
  -[GKLocalPlayerInternal updateWithCacheObject:](&v9, "updateWithCacheObject:", v4);
  -[GKLocalPlayerInternal setUnderage:]( self,  "setUnderage:",  objc_msgSend(v4, "isUnderage", v9.receiver, v9.super_class));
  -[GKLocalPlayerInternal setPurpleBuddyAccount:]( self,  "setPurpleBuddyAccount:",  [v4 purpleBuddyAccount]);
  -[GKLocalPlayerInternal setDefaultNickname:](self, "setDefaultNickname:", [v4 defaultNickname]);
  -[GKLocalPlayerInternal setDefaultPrivacyVisibility:]( self,  "setDefaultPrivacyVisibility:",  [v4 defaultPrivacyVisibility]);
  -[GKLocalPlayerInternal setDefaultContactsIntegrationConsent:]( self,  "setDefaultContactsIntegrationConsent:",  [v4 defaultContactsIntegrationConsent]);
  -[GKLocalPlayerInternal setFindable:](self, "setFindable:", [v4 isFindable]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 friendRequestList]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entries]);
  -[GKLocalPlayerInternal setNumberOfRequests:]( self,  "setNumberOfRequests:",  (unsigned __int16)[v6 count]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 challengeList]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 entries]);
  -[GKLocalPlayerInternal setNumberOfChallenges:]( self,  "setNumberOfChallenges:",  (unsigned __int16)[v8 count]);

  LOWORD(v7) = (unsigned __int16)[v4 numberOfTurns];
  -[GKLocalPlayerInternal setNumberOfTurns:](self, "setNumberOfTurns:", (unsigned __int16)v7);
}

@end