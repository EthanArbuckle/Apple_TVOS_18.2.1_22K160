@interface GKPlayerToInviteCacheObject
+ (id)entityName;
- (id)internalRepresentation;
@end

@implementation GKPlayerToInviteCacheObject

+ (id)entityName
{
  return @"PlayerToInvite";
}

- (id)internalRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerToInviteCacheObject managedObjectContext](self, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerToInviteCacheObject playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "playerProfileWithPlayerID:inManagedObjectContext:",  v4,  v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerInternal internalRepresentationForCacheObject:]( &OBJC_CLASS___GKPlayerInternal,  "internalRepresentationForCacheObject:",  v5));
  return v6;
}

@end