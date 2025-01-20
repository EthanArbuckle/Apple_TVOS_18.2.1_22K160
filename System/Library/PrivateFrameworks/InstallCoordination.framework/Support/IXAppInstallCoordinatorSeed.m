@interface IXAppInstallCoordinatorSeed
+ (BOOL)supportsSecureCoding;
- (IXAppInstallCoordinatorSeed)initWithCoder:(id)a3;
- (IXApplicationIdentity)identity;
- (NSUUID)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)creator;
- (unint64_t)installationDomain;
- (unint64_t)intent;
- (unsigned)creatorEUID;
- (void)encodeWithCoder:(id)a3;
- (void)setCreator:(unint64_t)a3;
- (void)setCreatorEUID:(unsigned int)a3;
- (void)setIdentity:(id)a3;
- (void)setInstallationDomain:(unint64_t)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation IXAppInstallCoordinatorSeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppInstallCoordinatorSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___IXAppInstallCoordinatorSeed;
  id v5 = -[IXAppInstallCoordinatorSeed init](&v29, "init");
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"uniqueIdentifier"];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v7;

  id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"creator"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  *((void *)v5 + 3) = [v10 unsignedLongLongValue];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"creatorEUID"];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  *((_DWORD *)v5 + 2) = [v12 unsignedIntegerValue];

  id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"intent"];
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  *((void *)v5 + 4) = [v14 unsignedLongLongValue];

  id v15 = [v4 decodeObjectOfClass:objc_opt_class(IXApplicationIdentity) forKey:@"identity"];
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v16;

  if (!*((void *)v5 + 5))
  {
    id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v23)
    {
      v24 = -[IXApplicationIdentity initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:",  v23);
      v25 = (void *)*((void *)v5 + 5);
      *((void *)v5 + 5) = v24;

      if (*((void *)v5 + 5))
      {

        goto LABEL_3;
      }

      v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_1000824F4((uint64_t)v23, (uint64_t *)v5 + 2, v27);
      }
    }

    else
    {
      v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_10008246C((uint64_t)v5, v27);
      }
    }

    v20 = 0LL;
    goto LABEL_7;
  }

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXAppInstallCoordinatorSeed uniqueIdentifier](self, "uniqueIdentifier"));
  [v4 encodeObject:v5 forKey:@"uniqueIdentifier"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppInstallCoordinatorSeed creator](self, "creator")));
  [v4 encodeObject:v6 forKey:@"creator"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[IXAppInstallCoordinatorSeed creatorEUID](self, "creatorEUID")));
  [v4 encodeObject:v7 forKey:@"creatorEUID"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppInstallCoordinatorSeed intent](self, "intent")));
  [v4 encodeObject:v8 forKey:@"intent"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXAppInstallCoordinatorSeed identity](self, "identity"));
  [v4 encodeObject:v9 forKey:@"identity"];

  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppInstallCoordinatorSeed installationDomain](self, "installationDomain")));
  [v4 encodeObject:v10 forKey:@"installationDomain"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXAppInstallCoordinatorSeed uniqueIdentifier](self, "uniqueIdentifier"));
  [v4 setUniqueIdentifier:v5];

  objc_msgSend(v4, "setCreator:", -[IXAppInstallCoordinatorSeed creator](self, "creator"));
  objc_msgSend(v4, "setCreatorEUID:", -[IXAppInstallCoordinatorSeed creatorEUID](self, "creatorEUID"));
  objc_msgSend(v4, "setIntent:", -[IXAppInstallCoordinatorSeed intent](self, "intent"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXAppInstallCoordinatorSeed identity](self, "identity"));
  [v4 setIdentity:v6];

  objc_msgSend( v4,  "setInstallationDomain:",  -[IXAppInstallCoordinatorSeed installationDomain](self, "installationDomain"));
  return v4;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)creator
{
  return self->_creator;
}

- (void)setCreator:(unint64_t)a3
{
  self->_creator = a3;
}

- (unsigned)creatorEUID
{
  return self->_creatorEUID;
}

- (void)setCreatorEUID:(unsigned int)a3
{
  self->_creatorEUID = a3;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (void)setInstallationDomain:(unint64_t)a3
{
  self->_installationDomain = a3;
}

- (void).cxx_destruct
{
}

@end