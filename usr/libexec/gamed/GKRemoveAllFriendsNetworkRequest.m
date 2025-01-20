@interface GKRemoveAllFriendsNetworkRequest
+ (id)bagKey;
- (id)initRequest;
@end

@implementation GKRemoveAllFriendsNetworkRequest

+ (id)bagKey
{
  return @"gk-remove-all-friends";
}

- (id)initRequest
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKRemoveAllFriendsNetworkRequest;
  return -[GKRemoveFriendNetworkRequest initWithFriendPlayerID:](&v3, "initWithFriendPlayerID:", &stru_10027B720);
}

@end