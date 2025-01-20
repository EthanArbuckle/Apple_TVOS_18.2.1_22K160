@interface GKGameSettingsInternal
- (id)initWithGameSettings:(id)a3;
@end

@implementation GKGameSettingsInternal

- (id)initWithGameSettings:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = &OBJC_CLASS___GKGameSettingsInternal;
  v5 = -[GKGameSettingsInternal init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    -[GKGameSettingsInternal setBundleID:](v5, "setBundleID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allowFriendListAccess]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([&off_1002885E8 objectForKeyedSubscript:v7]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 allowFriendListAccess]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([&off_1002885E8 objectForKeyedSubscript:v9]);

      -[GKGameSettingsInternal setAllowFriendListAccess:]( v5,  "setAllowFriendListAccess:",  [v10 integerValue]);
    }

    else
    {
      -[GKGameSettingsInternal setAllowFriendListAccess:](v5, "setAllowFriendListAccess:", -1LL);
    }
  }

  return v5;
}

@end