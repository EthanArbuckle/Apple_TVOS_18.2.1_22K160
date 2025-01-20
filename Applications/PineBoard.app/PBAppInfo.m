@interface PBAppInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isPBAppInfo;
- (Class)classForCoder;
- (FBSSceneIdentity)defaultSceneIdentity;
- (NSString)description;
- (PBAppInfo)initWithAppInfo:(id)a3;
- (PBAppInfo)initWithApplicationInfo:(id)a3;
- (PBAppInfo)initWithApplicationPlaceholder:(id)a3;
- (PBApplicationInfo)applicationInfo;
- (PBApplicationPlaceholder)applicationPlaceholder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PBAppInfo

- (FBSSceneIdentity)defaultSceneIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo bundleIdentifier](self, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v2,  @"default"));

  return (FBSSceneIdentity *)v3;
}

- (PBAppInfo)initWithApplicationInfo:(id)a3
{
  id v4 = a3;
  v5 = -[PBMutableAppInfo initWithApplicationInfo:]( objc_alloc(&OBJC_CLASS___PBMutableAppInfo),  "initWithApplicationInfo:",  v4);

  v6 = -[PBAppInfo initWithAppInfo:](self, "initWithAppInfo:", v5);
  return v6;
}

- (PBAppInfo)initWithApplicationPlaceholder:(id)a3
{
  id v4 = a3;
  v5 = -[PBMutableAppInfo initWithApplicationPlaceholder:]( objc_alloc(&OBJC_CLASS___PBMutableAppInfo),  "initWithApplicationPlaceholder:",  v4);

  v6 = -[PBAppInfo initWithAppInfo:](self, "initWithAppInfo:", v5);
  return v6;
}

- (PBAppInfo)initWithAppInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBAppInfo;
  v5 = -[PBAppInfo initWithAppInfo:](&v11, "initWithAppInfo:", v4);
  if (v5 && [v4 isPBAppInfo])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
    applicationInfo = v5->_applicationInfo;
    v5->_applicationInfo = (PBApplicationInfo *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 applicationPlaceholder]);
    applicationPlaceholder = v5->_applicationPlaceholder;
    v5->_applicationPlaceholder = (PBApplicationPlaceholder *)v8;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBAppInfo);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    goto LABEL_5;
  }
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBAppInfo;
  if (!-[PBAppInfo isEqual:](&v17, "isEqual:", v4)) {
    goto LABEL_5;
  }
  applicationInfo = self->_applicationInfo;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
  if (applicationInfo == (PBApplicationInfo *)v7)
  {
  }

  else
  {
    uint64_t v8 = (void *)v7;
    v9 = self->_applicationInfo;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
    LODWORD(v9) = -[PBApplicationInfo isEqual:](v9, "isEqual:", v10);

    if (!(_DWORD)v9)
    {
LABEL_5:
      unsigned __int8 v11 = 0;
      goto LABEL_6;
    }
  }

  applicationPlaceholder = self->_applicationPlaceholder;
  v14 = (PBApplicationPlaceholder *)objc_claimAutoreleasedReturnValue([v4 applicationPlaceholder]);
  if (applicationPlaceholder == v14)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    v15 = self->_applicationPlaceholder;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationPlaceholder]);
    unsigned __int8 v11 = -[PBApplicationPlaceholder isEqual:](v15, "isEqual:", v16);
  }

LABEL_6:
  return v11;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendSuper];
  id v5 = [v3 appendObject:self->_applicationInfo withName:@"applicationInfo" skipIfNil:1];
  id v6 =  [v3 appendObject:self->_applicationPlaceholder withName:@"applicationPlaceholder" skipIfNil:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBAppInfo;
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[PBAppInfo hash](&v11, "hash"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo applicationInfo](self, "applicationInfo"));
  id v6 = [v3 appendObject:v5];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo applicationPlaceholder](self, "applicationPlaceholder"));
  id v8 = [v3 appendObject:v7];

  id v9 = [v3 hash];
  return (unint64_t)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBMutableAppInfo initWithAppInfo:]( +[PBMutableAppInfo allocWithZone:](&OBJC_CLASS___PBMutableAppInfo, "allocWithZone:", a3),  "initWithAppInfo:",  self);
}

- (Class)classForCoder
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PBSAppInfo);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isPBAppInfo
{
  return 1;
}

- (PBApplicationInfo)applicationInfo
{
  return self->_applicationInfo;
}

- (PBApplicationPlaceholder)applicationPlaceholder
{
  return self->_applicationPlaceholder;
}

- (void).cxx_destruct
{
}

@end