@interface GKFriendCodeDetailInternal
- (id)initWithFriendCodeDetail:(id)a3;
@end

@implementation GKFriendCodeDetailInternal

- (id)initWithFriendCodeDetail:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = &OBJC_CLASS___GKFriendCodeDetailInternal;
  v5 = -[GKFriendCodeDetailInternal init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 creatorPlayerId]);
    -[GKFriendCodeDetailInternal setCreatorPlayerID:](v5, "setCreatorPlayerID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 friendCodeState]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([&off_1002884F8 objectForKeyedSubscript:v7]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([&off_1002884F8 objectForKeyedSubscript:v7]);
      -[GKFriendCodeDetailInternal setFriendCodeState:](v5, "setFriendCodeState:", [v9 integerValue]);
    }

    else
    {
      -[GKFriendCodeDetailInternal setFriendCodeState:](v5, "setFriendCodeState:", 5LL);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 numUses]);
    -[GKFriendCodeDetailInternal setFriendCodeUsageCount:]( v5,  "setFriendCodeUsageCount:",  [v10 integerValue]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 friendCode]);
    -[GKFriendCodeDetailInternal setFriendCode:](v5, "setFriendCode:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 alreadyUsedPlayerIds]);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 alreadyUsedPlayerIds]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByString:@","]);
      -[GKFriendCodeDetailInternal setAlreadyUsedPlayerIDs:](v5, "setAlreadyUsedPlayerIDs:", v14);
    }
  }

  return v5;
}

@end