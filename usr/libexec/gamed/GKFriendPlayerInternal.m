@interface GKFriendPlayerInternal
+ (int)familiarity;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKFriendPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = &OBJC_CLASS___GKFriendPlayerInternal;
  id v4 = a3;
  -[GKFriendPlayerInternal updateWithCacheObject:](&v8, "updateWithCacheObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status", v8.receiver, v8.super_class));
  -[GKFriendPlayerInternal setStatus:](self, "setStatus:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPlayedDate]);
  -[GKFriendPlayerInternal setLastPlayedDate:](self, "setLastPlayedDate:", v6);

  -[GKFriendPlayerInternal setChallengedTogether:]( self,  "setChallengedTogether:",  [v4 challengedTogether]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 lastChallengedDate]);

  -[GKFriendPlayerInternal setLastChallengedDate:](self, "setLastChallengedDate:", v7);
}

+ (int)familiarity
{
  return 1;
}

@end