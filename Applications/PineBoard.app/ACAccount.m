@interface ACAccount
- (NSUUID)pbd_selectedHomeUserIdentifier;
- (id)pbd_localOverrideNameForHomeUserIdentifier:(id)a3;
- (id)pbd_localOverrideNameForItunesAltDSID:(id)a3;
- (void)pbd_setSelectedHomeUserIdentifier:(id)a3;
@end

@implementation ACAccount

- (NSUUID)pbd_selectedHomeUserIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountPropertyForKey:](self, "accountPropertyForKey:", @"tvOS_activeHomeUser"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = v2;
  v5 = v4;
  if (v3)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;

  if (v7) {
    v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (void)pbd_setSelectedHomeUserIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[ACAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, @"tvOS_activeHomeUser");
}

- (id)pbd_localOverrideNameForItunesAltDSID:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"tvOS_localUserAlias:",  a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountPropertyForKey:](self, "accountPropertyForKey:", v4));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    id v7 = v5;
    v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        v9 = v8;
      }
      else {
        v9 = 0LL;
      }
    }

    else
    {
      v9 = 0LL;
    }

    id v11 = v9;

    if ([v11 length]) {
      v12 = v11;
    }
    else {
      v12 = 0LL;
    }
    id v10 = v12;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)pbd_localOverrideNameForHomeUserIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"tvOS_localUserAlias:",  v4));

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountPropertyForKey:](self, "accountPropertyForKey:", v5));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    id v8 = v6;
    v9 = v8;
    if (v7)
    {
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
        id v10 = v9;
      }
      else {
        id v10 = 0LL;
      }
    }

    else
    {
      id v10 = 0LL;
    }

    id v12 = v10;

    if ([v12 length]) {
      v13 = v12;
    }
    else {
      v13 = 0LL;
    }
    id v11 = v13;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

@end