@interface PBLegacyGameAlertInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)userProfileIdentifiers;
- (PBLegacyGameAlertInfo)initWithCoder:(id)a3;
- (PBLegacyGameAlertInfo)initWithUserProfileIdentifiers:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBLegacyGameAlertInfo

- (PBLegacyGameAlertInfo)initWithUserProfileIdentifiers:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBLegacyGameAlertInfo;
    v7 = -[PBLegacyGameAlertInfo init](&v12, "init");
    if (v7)
    {
      v8 = (NSSet *)[v6 copy];
      userProfileIdentifiers = v7->_userProfileIdentifiers;
      v7->_userProfileIdentifiers = v8;
    }

    return v7;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"userProfileIdentifiers != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002839CC(a2);
    }
    result = (PBLegacyGameAlertInfo *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___PBLegacyGameAlertInfo, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  v7));

  userProfileIdentifiers = self->_userProfileIdentifiers;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012637C;
  v13[3] = &unk_1003D8698;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v8 appendObject:userProfileIdentifiers counterpart:v13];
  LOBYTE(userProfileIdentifiers) = [v8 isEqual];

  return (char)userProfileIdentifiers;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendObject:self->_userProfileIdentifiers];
  id v5 = [v3 hash];

  return (unint64_t)v5;
}

- (PBLegacyGameAlertInfo)initWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 requiresSecureCoding])
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___PBLegacyGameAlertInfo;
    v7 = -[PBLegacyGameAlertInfo init](&v18, "init");
    if (v7)
    {
      uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSSet, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSString, v10);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v9, v12, 0LL));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v13 forKey:@"userProfileIdentifiers"]);
      userProfileIdentifiers = v7->_userProfileIdentifiers;
      v7->_userProfileIdentifiers = (NSSet *)v14;
    }

    return v7;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[coder requiresSecureCoding]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283A78(a2);
    }
    result = (PBLegacyGameAlertInfo *)_bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 requiresSecureCoding])
  {
    [v5 encodeObject:self->_userProfileIdentifiers forKey:@"userProfileIdentifiers"];
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[coder requiresSecureCoding]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283B24(a2);
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)userProfileIdentifiers
{
  return self->_userProfileIdentifiers;
}

- (void).cxx_destruct
{
}

@end