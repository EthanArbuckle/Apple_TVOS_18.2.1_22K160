@interface PBSuggestedUserProfilesArchive
+ (BOOL)deleteArchiveAtURL:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)archiveWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSDictionary)suggestedUserProfilesByIdentifier;
- (PBSuggestedUserProfilesArchive)initWithCoder:(id)a3;
- (PBSuggestedUserProfilesArchive)initWithSuggestedUserProfilesByIdentifier:(id)a3;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBSuggestedUserProfilesArchive

- (PBSuggestedUserProfilesArchive)initWithSuggestedUserProfilesByIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBSuggestedUserProfilesArchive;
    v7 = -[PBSuggestedUserProfilesArchive init](&v13, "init");
    v8 = v7;
    if (v7)
    {
      v7->_version = 1LL;
      v9 = (NSDictionary *)[v6 copy];
      suggestedUserProfilesByIdentifier = v8->_suggestedUserProfilesByIdentifier;
      v8->_suggestedUserProfilesByIdentifier = v9;
    }

    return v8;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"suggestedUserProfilesByIdentifier != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271168(a2);
    }
    result = (PBSuggestedUserProfilesArchive *)_bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

  return result;
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v21 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v21));
  id v10 = v21;
  id v11 = v10;
  if (v9)
  {
    id v20 = v10;
    unsigned __int8 v12 = [v9 writeToURL:v8 options:a4 error:&v20];
    id v13 = v20;

    if ((v12 & 1) != 0)
    {
      BOOL v14 = 1;
LABEL_14:
      id v11 = v13;
      goto LABEL_15;
    }

    id v17 = sub_100083FF0();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100271274();
    }

    if (!a5)
    {
      BOOL v14 = 0;
      goto LABEL_14;
    }
  }

  else
  {
    id v15 = sub_100083FF0();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100271214();
    }

    if (!a5)
    {
      BOOL v14 = 0;
      goto LABEL_15;
    }

    id v13 = v11;
  }

  id v11 = v13;
  BOOL v14 = 0;
  *a5 = v11;
LABEL_15:

  return v14;
}

+ (id)archiveWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) != 0)
  {
    id v28 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v7,  a4,  &v28));
    id v12 = v28;
    id v13 = sub_100083FF0();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1002713C0();
      }

      uint64_t v17 = objc_opt_self(&OBJC_CLASS___PBSuggestedUserProfilesArchive, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v27 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v18,  v11,  &v27));
      id v20 = v27;

      id v21 = sub_100083FF0();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      v23 = v22;
      if (v19)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_100271394();
        }

        id v24 = v19;
      }

      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100271334();
        }

        if (a5) {
          *a5 = v20;
        }
      }
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002712D4();
      }

      if (a5)
      {
        id v20 = v12;
        v19 = 0LL;
        *a5 = v20;
      }

      else
      {
        v19 = 0LL;
        id v20 = v12;
      }
    }
  }

  else
  {
    id v25 = sub_100083FF0();
    id v20 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG)) {
      sub_1002713EC();
    }
    v19 = 0LL;
  }

  return v19;
}

+ (BOOL)deleteArchiveAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v10 = [v9 removeItemAtURL:v5 error:a4];
  }

  else
  {
    id v11 = sub_100083FF0();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
      sub_100271418();
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (PBSuggestedUserProfilesArchive)initWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 requiresSecureCoding])
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___PBSuggestedUserProfilesArchive;
    v6 = -[PBSuggestedUserProfilesArchive init](&v21, "init");
    if (v6)
    {
      v6->_version = (unint64_t)[v5 decodeIntegerForKey:@"version"];
      uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSDictionary, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSString, v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v14 = objc_opt_self(&OBJC_CLASS___PBSSuggestedUserProfile, v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v9, v12, v15, 0LL));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v16 forKey:@"suggestedUserProfilesByIdentifier"]);
      suggestedUserProfilesByIdentifier = v6->_suggestedUserProfilesByIdentifier;
      v6->_suggestedUserProfilesByIdentifier = (NSDictionary *)v17;
    }

    return v6;
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[coder requiresSecureCoding]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271444(a2);
    }
    result = (PBSuggestedUserProfilesArchive *)_bs_set_crash_log_message([v20 UTF8String]);
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
    [v5 encodeObject:self->_suggestedUserProfilesByIdentifier forKey:@"suggestedUserProfilesByIdentifier"];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[coder requiresSecureCoding]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002714F0(a2);
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDictionary)suggestedUserProfilesByIdentifier
{
  return self->_suggestedUserProfilesByIdentifier;
}

- (void).cxx_destruct
{
}

@end