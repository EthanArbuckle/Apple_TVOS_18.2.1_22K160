@interface PBUserProfilesArchive
+ (BOOL)supportsSecureCoding;
+ (id)archiveWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSDictionary)groupRecommendationsSessions;
- (NSDictionary)homeUsersIdentifiers;
- (NSDictionary)userProfiles;
- (NSString)debugDescription;
- (NSString)description;
- (PBUserProfilesArchive)initWithCoder:(id)a3;
- (PBUserProfilesArchive)initWithUserProfiles:(id)a3 homeUsersIdentifiers:(id)a4 groupRecommendationSessions:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBUserProfilesArchive

- (PBUserProfilesArchive)initWithUserProfiles:(id)a3 homeUsersIdentifiers:(id)a4 groupRecommendationSessions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = v11;
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___PBUserProfilesArchive;
    v13 = -[PBUserProfilesArchive init](&v24, "init");
    v14 = v13;
    if (v13)
    {
      v13->_version = 1LL;
      v15 = (NSDictionary *)[v9 copy];
      userProfiles = v14->_userProfiles;
      v14->_userProfiles = v15;

      v17 = (NSDictionary *)[v10 copy];
      homeUsersIdentifiers = v14->_homeUsersIdentifiers;
      v14->_homeUsersIdentifiers = v17;

      id v19 = [v12 copy];
      v20 = v19;
      if (v19) {
        v21 = v19;
      }
      else {
        v21 = &__NSDictionary0__struct;
      }
      objc_storeStrong((id *)&v14->_groupRecommendationsSessions, v21);
    }

    return v14;
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"userProfiles != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288EC8(a2);
    }
    result = (PBUserProfilesArchive *)_bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
  }

  return result;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfilesArchive succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfilesArchive descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v22 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v22));
  id v9 = v22;
  id v10 = sub_100084590();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100288F74();
    }

    if (!a5)
    {
      BOOL v18 = 0;
      id v14 = v9;
      goto LABEL_19;
    }

    id v19 = v9;
    goto LABEL_16;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100289060();
  }

  id v21 = v9;
  unsigned __int8 v13 = [v8 writeToURL:v7 options:1 error:&v21];
  id v14 = v21;

  id v15 = sub_100084590();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100289000();
    }

    if (!a5)
    {
      BOOL v18 = 0;
      goto LABEL_19;
    }

    id v19 = v14;
LABEL_16:
    id v14 = v19;
    BOOL v18 = 0;
    *a5 = v14;
    goto LABEL_19;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100288FD4();
  }

  BOOL v18 = 1;
LABEL_19:

  return v18;
}

+ (id)archiveWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v24 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v7,  a4,  &v24));
  id v9 = v24;
  id v10 = sub_100084590();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100289178();
    }

    uint64_t v14 = objc_opt_self(&OBJC_CLASS___PBUserProfilesArchive, v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v23 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v15,  v8,  &v23));
    id v17 = v23;

    id v18 = sub_100084590();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10028914C();
      }

      id v21 = v16;
    }

    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1002890EC();
      }

      if (a5) {
        *a5 = v17;
      }
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10028908C();
    }

    if (a5)
    {
      id v17 = v9;
      v16 = 0LL;
      *a5 = v17;
    }

    else
    {
      v16 = 0LL;
      id v17 = v9;
    }
  }

  return v16;
}

- (PBUserProfilesArchive)initWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 requiresSecureCoding])
  {
    v49.receiver = self;
    v49.super_class = (Class)&OBJC_CLASS___PBUserProfilesArchive;
    v6 = -[PBUserProfilesArchive init](&v49, "init");
    if (v6)
    {
      v6->_version = (unint64_t)[v5 decodeIntegerForKey:@"version"];
      uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSDictionary, v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSString, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v14 = objc_opt_self(&OBJC_CLASS___PBSUserProfile, v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v9, v12, v15, 0LL));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v16 forKey:@"userProfiles"]);
      userProfiles = v6->_userProfiles;
      v6->_userProfiles = (NSDictionary *)v17;

      uint64_t v20 = objc_opt_self(&OBJC_CLASS___NSDictionary, v19);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v23 = objc_opt_self(&OBJC_CLASS___NSString, v22);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v26 = objc_opt_self(&OBJC_CLASS___NSSet, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      uint64_t v29 = objc_opt_self(&OBJC_CLASS___PBSScopedHomeUserIdentifier, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v21, v24, v27, v30, 0LL));
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v31 forKey:@"homeUsersIdentifiers"]);
      homeUsersIdentifiers = v6->_homeUsersIdentifiers;
      v6->_homeUsersIdentifiers = (NSDictionary *)v32;

      uint64_t v35 = objc_opt_self(&OBJC_CLASS___NSDictionary, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      uint64_t v38 = objc_opt_self(&OBJC_CLASS___NSString, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      uint64_t v41 = objc_opt_self(&OBJC_CLASS___PBSGroupRecommendationsSession, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v36, v39, v42, 0LL));
      uint64_t v44 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v43 forKey:@"groupRecommendationsSessions"]);
      v45 = (void *)v44;
      if (v44) {
        v46 = (void *)v44;
      }
      else {
        v46 = &__NSDictionary0__struct;
      }
      objc_storeStrong((id *)&v6->_groupRecommendationsSessions, v46);
    }

    return v6;
  }

  else
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[coder requiresSecureCoding]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002891A4(a2);
    }
    result = (PBUserProfilesArchive *)_bs_set_crash_log_message([v48 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 requiresSecureCoding])
  {
    [v5 encodeInteger:self->_version forKey:@"version"];
    [v5 encodeObject:self->_userProfiles forKey:@"userProfiles"];
    [v5 encodeObject:self->_homeUsersIdentifiers forKey:@"homeUsersIdentifiers"];
    [v5 encodeObject:self->_groupRecommendationsSessions forKey:@"groupRecommendationsSessions"];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[coder requiresSecureCoding]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289250(a2);
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017F2EC;
  v8[3] = &unk_1003CFEB8;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v9 = v5;
  uint64_t v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBUserProfilesArchive descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfilesArchive succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBUserProfilesArchive descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  0LL));
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDictionary)userProfiles
{
  return self->_userProfiles;
}

- (NSDictionary)homeUsersIdentifiers
{
  return self->_homeUsersIdentifiers;
}

- (NSDictionary)groupRecommendationsSessions
{
  return self->_groupRecommendationsSessions;
}

- (void).cxx_destruct
{
}

@end