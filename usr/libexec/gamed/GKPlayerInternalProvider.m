@interface GKPlayerInternalProvider
- (id)localPlayer;
- (id)localPlayerCacheGroup;
@end

@implementation GKPlayerInternalProvider

- (id)localPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v4 = [v2 environment];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 currentGame]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryCredentialForEnvironment:v4 gameID:v6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerInternal]);

  v9 = objc_alloc(&OBJC_CLASS___GKPlayerInternalOnboarding);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 playerID]);
  v11 = -[GKPlayerInternalOnboarding initWithPlayerID:](v9, "initWithPlayerID:", v10);
  [v8 setOnboarding:v11];

  return v8;
}

- (id)localPlayerCacheGroup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKPlayerInternalProvider.m",  36LL,  "-[GKPlayerInternalProvider localPlayerCacheGroup]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerInternalProvider localPlayer](self, "localPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionGroupWithName:v4 forPlayerID:v6]);

  return v7;
}

@end