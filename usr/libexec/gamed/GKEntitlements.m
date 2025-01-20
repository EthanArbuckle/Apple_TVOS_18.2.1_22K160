@interface GKEntitlements
- (BOOL)_shouldBypasAuthenticationForConnection:(id)a3;
- (BOOL)hasAnyEntitlement;
- (BOOL)hasAnyPrivateEntitlement;
- (BOOL)hasEntitlements:(unint64_t)a3;
- (GKEntitlements)initWithConnection:(id)a3;
- (id)description;
- (id)grandfatheredEntitlementsForSpoofedApps;
- (unint64_t)_entitlementForName:(id)a3;
- (unint64_t)_valuesForEntitlement:(id)a3 forConnection:(id)a4;
@end

@implementation GKEntitlements

- (unint64_t)_entitlementForName:(id)a3
{
  uint64_t v3 = qword_1002BB4E8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1002BB4E8, &stru_10026FFF0);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_1002BB4E0, v4);

  return (unint64_t)Value;
}

- (id)description
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___GKEntitlements;
  id v3 = -[GKEntitlements description](&v27, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t entitlements = self->_entitlements;
  v6 = "Account";
  if ((entitlements & 1) == 0) {
    v6 = "";
  }
  v7 = "Profile";
  if ((entitlements & 2) == 0) {
    v7 = "";
  }
  v8 = "Friends";
  if ((entitlements & 4) == 0) {
    v8 = "";
  }
  v9 = "Games";
  if ((entitlements & 0x10) == 0) {
    v9 = "";
  }
  v10 = "GameStats";
  if ((entitlements & 0x20) == 0) {
    v10 = "";
  }
  v11 = "Challenges";
  if ((entitlements & 0x40) == 0) {
    v11 = "";
  }
  v12 = "Multiplayer";
  if ((entitlements & 0x80) == 0) {
    v12 = "";
  }
  v13 = "TurnBasedMultiplayer";
  if ((entitlements & 0x100) == 0) {
    v13 = "";
  }
  v14 = "Media";
  if ((entitlements & 0x400) == 0) {
    v14 = "";
  }
  v15 = "BypassAuthentication";
  v16 = "AccountPrivate";
  if ((entitlements & 0x10000) == 0) {
    v16 = "";
  }
  v17 = "ProfilePrivate";
  if ((entitlements & 0x20000) == 0) {
    v17 = "";
  }
  v18 = "FriendsPrivate";
  if ((entitlements & 0x40000) == 0) {
    v18 = "";
  }
  v19 = "GamesPrivate";
  if ((entitlements & 0x100000) == 0) {
    v19 = "";
  }
  v20 = "GameStatsPrivate";
  if ((entitlements & 0x200000) == 0) {
    v20 = "";
  }
  v21 = "ChallengesPrivate";
  if ((entitlements & 0x400000) == 0) {
    v21 = "";
  }
  v22 = "MultiplayerPrivate";
  if ((entitlements & 0x800000) == 0) {
    v22 = "";
  }
  v23 = "TurnBasedMultiplayerPrivate";
  if ((entitlements & 0x1000000) == 0) {
    v23 = "";
  }
  if ((entitlements & 0x4000000) != 0) {
    v24 = "MediaPrivate";
  }
  else {
    v24 = "";
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "stringByAppendingFormat:",  @" -- (%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s)",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24));

  return v25;
}

- (unint64_t)_valuesForEntitlement:(id)a3 forConnection:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 valueForEntitlement:a3]);
  if ((objc_opt_respondsToSelector(v5, "countByEnumeratingWithState:objects:count:") & 1) != 0)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      unint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          v9 |= -[GKEntitlements _entitlementForName:]( self,  "_entitlementForName:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i),  (void)v13);
        }

        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    else
    {
      unint64_t v9 = 0LL;
    }
  }

  else if ((objc_opt_respondsToSelector(v5, "isEqualToString:") & 1) != 0)
  {
    unint64_t v9 = -[GKEntitlements _entitlementForName:](self, "_entitlementForName:", v5);
  }

  else if ([v5 BOOLValue])
  {
    unint64_t v9 = 1527LL;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (GKEntitlements)initWithConnection:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___GKEntitlements;
  v5 = -[GKEntitlements init](&v22, "init");
  id v6 = v5;
  if (!v5) {
    goto LABEL_25;
  }
  unint64_t v7 = -[GKEntitlements _valuesForEntitlement:forConnection:]( v5,  "_valuesForEntitlement:forConnection:",  @"com.apple.private.game-center",  v4);
  v6->_unint64_t entitlements = -[GKEntitlements _valuesForEntitlement:forConnection:]( v6,  "_valuesForEntitlement:forConnection:",  @"com.apple.developer.game-center",  v4) | (v7 << 16) | v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.game-center.bypass-authentication"]);
  if (([v8 BOOLValue] & 1) != 0
    || -[GKEntitlements _shouldBypasAuthenticationForConnection:](v6, "_shouldBypasAuthenticationForConnection:", v4))
  {
    v6->_entitlements |= (unint64_t)&_mh_execute_header;
  }

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.accounts.appleaccount.fullaccess"]);
  if ([v9 BOOLValue])
  {

LABEL_8:
    v6->_entitlements |= 0x200000000uLL;
    goto LABEL_9;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.game-center.credential"]);
  unsigned int v11 = [v10 BOOLValue];

  if (v11) {
    goto LABEL_8;
  }
LABEL_9:
  if (!-[GKEntitlements hasEntitlements:](v6, "hasEntitlements:", 1527LL))
  {
    BOOL v12 = -[GKEntitlements hasAnyPrivateEntitlement](v6, "hasAnyPrivateEntitlement");
    if (!v12)
    {
      if (!os_log_GKGeneral) {
        id v13 = (id)GKOSLoggers(v12);
      }
      __int128 v14 = (os_log_s *)os_log_GKDeveloper;
      BOOL v15 = os_log_type_enabled(os_log_GKDeveloper, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_100096FA4(v14);
      }
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v15);
      }
      v17 = (void *)os_log_GKError;
      BOOL v18 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
      if (v18) {
        sub_100096EF8(v17, (uint64_t)v4);
      }
      v19 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v20 = (id)GKOSLoggers(v18);
        v19 = (void *)os_log_GKGeneral;
      }

      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG)) {
        sub_100096E4C(v19, (uint64_t)v4);
      }
    }

    v6->_entitlements |= 0x5F7uLL;
  }

LABEL_25:
  return v6;
}

- (id)grandfatheredEntitlementsForSpoofedApps
{
  *((void *)self + 1) |= 0x105F705F7uLL;
  return self;
}

- (BOOL)hasEntitlements:(unint64_t)a3
{
  return (a3 & ~self->_entitlements) == 0;
}

- (BOOL)hasAnyPrivateEntitlement
{
  return (self->_entitlements & 0xFFFFFFFFFFFF0000LL) != 0;
}

- (BOOL)hasAnyEntitlement
{
  return self->_entitlements != 0;
}

- (BOOL)_shouldBypasAuthenticationForConnection:(id)a3
{
  return 0;
}

@end