@interface GKLeaderboardSetListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (BOOL)isValid;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKLeaderboardSetListCacheObject

+ (id)entityName
{
  return @"LeaderboardSetList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKLeaderboardSetCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKLeaderboardSetListCacheObject;
  id v6 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v8,  "updateWithServerRepresentation:expirationDate:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", @"results", v8.receiver, v8.super_class));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v7,  &stru_100271348,  1LL);
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKLeaderboardSetListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardSetListCacheObject game](self, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

@end