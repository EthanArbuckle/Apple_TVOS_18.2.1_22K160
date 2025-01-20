@interface GKLeaderboardListCacheObject
+ (id)entityName;
- (BOOL)isValid;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKLeaderboardListCacheObject

+ (id)entityName
{
  return @"LeaderboardList";
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKLeaderboardListCacheObject;
  id v6 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v8,  "updateWithServerRepresentation:expirationDate:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", @"results", v8.receiver, v8.super_class));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v7,  &stru_1002713B0,  1LL);
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKLeaderboardListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardListCacheObject game](self, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

@end