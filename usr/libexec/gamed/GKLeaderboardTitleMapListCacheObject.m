@interface GKLeaderboardTitleMapListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKLeaderboardTitleMapListCacheObject

+ (id)entityName
{
  return @"LeaderboardTitleMapList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKLeaderboardSetCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKLeaderboardTitleMapListCacheObject;
  id v6 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]( &v8,  "updateWithServerRepresentation:expirationDate:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", @"results", v8.receiver, v8.super_class));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]( self,  "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:",  v7,  &stru_100271390,  1LL);
}

@end