@interface FANotificationBuilder
+ (id)_buildActivationURLWithResponse:(id)a3;
+ (id)_getParamsForInviteFromResponse:(id)a3;
+ (id)buildNotificationWithResponse:(id)a3 payload:(id)a4;
@end

@implementation FANotificationBuilder

+ (id)buildNotificationWithResponse:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = [v5 showMessage];
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = _FALogSystem(v6, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B258(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_6;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  if (!v8)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);

    if (v19) {
      goto LABEL_8;
    }
    uint64_t v30 = _FALogSystem(v20, v21);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B224(v10, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_6:

    id v18 = 0LL;
    goto LABEL_12;
  }

LABEL_8:
  id v18 = objc_alloc_init(&OBJC_CLASS___FAFamilyNotification);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
  [v18 setIdentifier:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  [v18 setTitle:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
  [v18 setInformativeText:v25];

  [v18 setShouldPersistWhenActivated:1];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v5 launchURLFromServer]);

  if (v26) {
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v5 launchURLFromServer]);
  }
  else {
    uint64_t v27 = objc_claimAutoreleasedReturnValue([a1 _buildActivationURLWithResponse:v5]);
  }
  v28 = (void *)v27;
  [v18 setActivateActionURL:v27];

LABEL_12:
  return v18;
}

+ (id)_getParamsForInviteFromResponse:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", @"showFamilyInvite", @"aaaction");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 inviteCode]);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"inviteCode");

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", @"1", @"fresh");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 organizerFirstName]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 organizerFirstName]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"organizerFirstName");
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 organizerLastName]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 organizerLastName]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"organizerLastName");
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 organizerEmail]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 organizerEmail]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"organizerEmail");
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 childFirstName]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 childFirstName]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, @"childFirstName");
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 childLastName]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 childLastName]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, @"childLastName");
  }

  return v4;
}

+ (id)_buildActivationURLWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
  if ([v5 isEqualToString:@"f_member_invite"])
  {
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
    unsigned int v7 = [v6 isEqualToString:@"f_child_transfer_req"];

    if (!v7)
    {
      id v12 = 0LL;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[FamilySettingsDestinations urlDestinationTo:error:]( &OBJC_CLASS___FamilySettingsDestinations,  "urlDestinationTo:error:",  3LL,  &v12));
      id v10 = v12;
      goto LABEL_6;
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _getParamsForInviteFromResponse:v4]);
  id v13 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[FamilySettingsDestinations urlDestinationTo:params:error:]( &OBJC_CLASS___FamilySettingsDestinations,  "urlDestinationTo:params:error:",  4LL,  v8,  &v13));
  id v10 = v13;

LABEL_6:
  return v9;
}

@end