@interface MILaunchServicesRegisterOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesRegisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 mountPoint:(id)a6 operationUUID:(id)a7 serialNumber:(unint64_t)a8;
- (MILaunchServicesRegisterOperation)initWithCoder:(id)a3;
- (NSSet)personaUniqueStrings;
- (NSString)bundleID;
- (NSURL)mountPoint;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)updatePersonaUniqueStrings:(id)a3;
@end

@implementation MILaunchServicesRegisterOperation

- (MILaunchServicesRegisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 mountPoint:(id)a6 operationUUID:(id)a7 serialNumber:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MILaunchServicesRegisterOperation;
  v17 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:]( &v23,  "initWithOperationUUID:serialNumber:",  a7,  a8);
  if (v17)
  {
    v18 = (NSString *)[v14 copy];
    bundleID = v17->_bundleID;
    v17->_bundleID = v18;

    v17->_domain = a4;
    v20 = (NSSet *)[v15 copy];
    personaUniqueStrings = v17->_personaUniqueStrings;
    v17->_personaUniqueStrings = v20;

    objc_storeStrong((id *)&v17->_mountPoint, a6);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesRegisterOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MILaunchServicesRegisterOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v35, "initWithCoder:", v4);
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v7;

  if (!v5->_bundleID)
  {
    id v21 = sub_1000130F4( (uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]",  44LL,  MIInstallerErrorDomain,  186LL,  0LL,  0LL,  @"Missing bundle ID when deserializing registration",  v9,  v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
LABEL_11:
    [v4 failWithError:v22];

    v20 = 0LL;
    goto LABEL_12;
  }

  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"domain"];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v5->_domain = (unint64_t)[v11 unsignedIntegerValue];

  if ((MIIsValidInstallationDomain(v5->_domain) & 1) == 0)
  {
    objc_super v23 = (void *)MIInstallerErrorDomain;
    uint64_t v24 = (uint64_t)v5->_bundleID;
    uint64_t v25 = MIStringForInstallationDomain(v5->_domain);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v28 = sub_1000130F4( (uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]",  50LL,  v23,  186LL,  0LL,  0LL,  @"Invalid installation domain value when deserializing registration for %@/%@",  v27,  v24);
LABEL_10:
    v22 = (void *)objc_claimAutoreleasedReturnValue(v28);

    goto LABEL_11;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSSet);
  v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"personaUniqueStrings"]);
  personaUniqueStrings = v5->_personaUniqueStrings;
  v5->_personaUniqueStrings = (NSSet *)v15;

  if (!v5->_personaUniqueStrings)
  {
    v29 = (void *)MIInstallerErrorDomain;
    uint64_t v30 = (uint64_t)v5->_bundleID;
    uint64_t v31 = MIStringForInstallationDomain(v5->_domain);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v31);
    id v28 = sub_1000130F4( (uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]",  56LL,  v29,  186LL,  0LL,  0LL,  @"Missing persona unique strings when deserializing registration for %@/%@",  v32,  v30);
    goto LABEL_10;
  }

  id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"mountPoint"];
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  mountPoint = v5->_mountPoint;
  v5->_mountPoint = (NSURL *)v18;

LABEL_6:
  v20 = v5;
LABEL_12:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MILaunchServicesRegisterOperation;
  id v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v9, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID", v9.receiver, v9.super_class));
  [v4 encodeObject:v5 forKey:@"bundleID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MILaunchServicesRegisterOperation domain](self, "domain")));
  [v4 encodeObject:v6 forKey:@"domain"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings"));
  [v4 encodeObject:v7 forKey:@"personaUniqueStrings"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
  [v4 encodeObject:v8 forKey:@"mountPoint"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MILaunchServicesRegisterOperation;
  if (-[MILaunchServicesOperation isEqual:](&v17, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
    BOOL v8 = sub_100013970(v6, v7);

    if (v8
      && (id v9 = [v5 domain], v9 == (id)-[MILaunchServicesRegisterOperation domain](self, "domain"))
      && (id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings")),
          v11 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueStrings]),
          BOOL v12 = sub_100013970(v10, v11),
          v11,
          v10,
          v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 mountPoint]);
      BOOL v15 = sub_100013970(v13, v14);
    }

    else
    {
      BOOL v15 = 0;
    }
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MILaunchServicesRegisterOperation;
  unint64_t v3 = -[MILaunchServicesOperation hash](&v12, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID"));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ -[MILaunchServicesRegisterOperation domain](self, "domain");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash] ^ v3;

  return v10;
}

- (void)updatePersonaUniqueStrings:(id)a3
{
  id v4 = (NSSet *)[a3 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v4;
}

- (id)description
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
  uint64_t v7 = (objc_class *)objc_opt_class(self);
  unint64_t v8 = NSStringFromClass(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  unint64_t v11 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID"));
  uint64_t v13 = MIStringForInstallationDomain(-[MILaunchServicesRegisterOperation domain](self, "domain"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = (void *)v14;
  if (v6)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@:%lu %@/%@ personas:[%@] mount:%@>",  v9,  v10,  v11,  v12,  v15,  v5,  v16));
  }

  else
  {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@:%lu %@/%@ personas:[%@]>",  v9,  v10,  v11,  v12,  v14,  v5));
  }

  return v17;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (NSSet)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void).cxx_destruct
{
}

@end