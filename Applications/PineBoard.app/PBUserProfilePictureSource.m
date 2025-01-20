@interface PBUserProfilePictureSource
+ (id)sourceForAltDSID:(id)a3;
+ (id)sourceForProfileIdentity:(id)a3 userIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)altDSID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)userIdentifier;
- (PBUserProfilePictureSource)initWithProfileIdentity:(id)a3 userIdentifier:(id)a4 altDSID:(id)a5;
- (UPProfileIdentity)profileIdentity;
- (UPProfilePictureRequest)profilePictureRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation PBUserProfilePictureSource

- (PBUserProfilePictureSource)initWithProfileIdentity:(id)a3 userIdentifier:(id)a4 altDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  if (v11)
  {
    Class v12 = NSClassFromString(@"UPProfileIdentity");
    if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfileIdentityClass]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100285C58();
      }
      _bs_set_crash_log_message([v26 UTF8String]);
      __break(0);
      JUMPOUT(0x100141558LL);
    }
  }

  id v13 = v9;
  if (v13)
  {
    Class v14 = NSClassFromString(@"NSString");
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100285BB0();
      }
      _bs_set_crash_log_message([v27 UTF8String]);
      __break(0);
      JUMPOUT(0x1001415BCLL);
    }
  }

  id v15 = v10;
  if (v15)
  {
    Class v16 = NSClassFromString(@"NSString");
    if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100285B08();
      }
LABEL_27:
      _bs_set_crash_log_message([v25 UTF8String]);
      __break(0);
      JUMPOUT(0x1001414F4LL);
    }
  }

  if ((v15 || !v11 || !v13) && (!v15 || v11 || v13))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"PBIsValidProfilePictureSource(profileIdentity, userIdentifier, altDSID)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285A60();
    }
    goto LABEL_27;
  }

  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBUserProfilePictureSource;
  v17 = -[PBUserProfilePictureSource init](&v28, "init");
  if (v17)
  {
    v18 = (UPProfileIdentity *)[v11 copy];
    profileIdentity = v17->_profileIdentity;
    v17->_profileIdentity = v18;

    v20 = (NSString *)[v13 copy];
    userIdentifier = v17->_userIdentifier;
    v17->_userIdentifier = v20;

    v22 = (NSString *)[v15 copy];
    altDSID = v17->_altDSID;
    v17->_altDSID = v22;
  }

  return v17;
}

+ (id)sourceForProfileIdentity:(id)a3 userIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"UPProfileIdentity");
  if (!v8)
  {
    Class v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285D00();
    }
LABEL_17:
    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x100141754LL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfileIdentityClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285D00();
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x1001417B8LL);
  }

  id v10 = v7;
  Class v11 = NSClassFromString(@"NSString");
  if (!v10)
  {
    Class v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285DB0();
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x10014181CLL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    Class v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285DB0();
    }
    goto LABEL_17;
  }

  id v12 = [objc_alloc((Class)a1) initWithProfileIdentity:v8 userIdentifier:v10 altDSID:0];
  return v12;
}

+ (id)sourceForAltDSID:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"NSString");
  if (!v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285E60();
    }
LABEL_9:
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
    JUMPOUT(0x10014196CLL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285E60();
    }
    goto LABEL_9;
  }

  id v6 = [objc_alloc((Class)a1) initWithProfileIdentity:0 userIdentifier:0 altDSID:v4];
  return v6;
}

- (UPProfilePictureRequest)profilePictureRequest
{
  if (self->_profileIdentity)
  {
    v2 = -[UPProfilePictureRequest initWithProfileIdentity:]( objc_alloc(&OBJC_CLASS___UPProfilePictureRequest),  "initWithProfileIdentity:",  self->_profileIdentity);
    return v2;
  }

  if (self->_altDSID)
  {
    v2 = -[UPProfilePictureRequest initWithAltDSID:]( objc_alloc(&OBJC_CLASS___UPProfilePictureRequest),  "initWithAltDSID:",  self->_altDSID);
    return v2;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_altDSID"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100285F10();
  }
  result = (UPProfilePictureRequest *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendObject:self->_profileIdentity];
  id v5 = [v3 appendObject:self->_userIdentifier];
  id v6 = [v3 appendString:self->_altDSID];
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBUserProfilePictureSource *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }

  else
  {
    id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBUserProfilePictureSource));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    profileIdentity = self->_profileIdentity;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100141CC0;
    v21[3] = &unk_1003D8F40;
    id v8 = v4;
    v22 = v8;
    id v9 = [v6 appendObject:profileIdentity counterpart:v21];
    userIdentifier = self->_userIdentifier;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100141CDC;
    v19[3] = &unk_1003D2B30;
    Class v11 = v8;
    v20 = v11;
    id v12 = [v6 appendObject:userIdentifier counterpart:v19];
    altDSID = self->_altDSID;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100141CF8;
    v17[3] = &unk_1003D2B30;
    v18 = v11;
    id v14 = [v6 appendString:altDSID counterpart:v17];
    unsigned __int8 v15 = [v6 isEqual];
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfilePictureSource succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfilePictureSource descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfilePictureSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_userIdentifier withName:@"userIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_altDSID withName:@"altDSID" skipIfEmpty:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBUserProfilePictureSource descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v5 = [v4 appendObject:self->_profileIdentity withName:@"profileIdentity"];
  [v4 appendString:self->_userIdentifier withName:@"userIdentifier"];
  [v4 appendString:self->_altDSID withName:@"altDSID"];
  return v4;
}

- (UPProfileIdentity)profileIdentity
{
  return self->_profileIdentity;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
}

@end