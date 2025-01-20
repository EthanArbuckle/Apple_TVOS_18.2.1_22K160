@interface MILaunchServicesSetPersonasOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesSetPersonasOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 registrationUUID:(id)a6 serialNumber:(unint64_t)a7;
- (MILaunchServicesSetPersonasOperation)initWithCoder:(id)a3;
- (NSSet)personaUniqueStrings;
- (NSString)bundleID;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesSetPersonasOperation

- (MILaunchServicesSetPersonasOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 registrationUUID:(id)a6 serialNumber:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MILaunchServicesSetPersonasOperation;
  v14 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:]( &v20,  "initWithOperationUUID:serialNumber:",  a6,  a7);
  if (v14)
  {
    v15 = (NSString *)[v12 copy];
    bundleID = v14->_bundleID;
    v14->_bundleID = v15;

    v14->_domain = a4;
    v17 = (NSSet *)[v13 copy];
    personaUniqueStrings = v14->_personaUniqueStrings;
    v14->_personaUniqueStrings = v17;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesSetPersonasOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MILaunchServicesSetPersonasOperation;
  id v5 = -[MILaunchServicesOperation initWithCoder:](&v25, "initWithCoder:", v4);
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v7;

  if (!*((void *)v5 + 3))
  {
    v18 = (void *)MIInstallerErrorDomain;
    v19 = @"Missing bundle ID when deserializing registration";
    uint64_t v20 = 43LL;
LABEL_9:
    id v21 = sub_1000130F4( (uint64_t)"-[MILaunchServicesSetPersonasOperation initWithCoder:]",  v20,  v18,  186LL,  0LL,  0LL,  v19,  v9,  v24);
    goto LABEL_10;
  }

  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"domain"];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  *((void *)v5 + 4) = [v11 unsignedIntegerValue];

  if ((MIIsValidInstallationDomain(*((void *)v5 + 4)) & 1) == 0)
  {
    id v21 = sub_1000130F4( (uint64_t)"-[MILaunchServicesSetPersonasOperation initWithCoder:]",  49LL,  MIInstallerErrorDomain,  186LL,  0LL,  0LL,  @"Invalid installation domain value when deserializing registration for %@: %lu",  v12,  *((void *)v5 + 3));
LABEL_10:
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v4 failWithError:v22];

    v17 = 0LL;
    goto LABEL_11;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v13));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"personaUniqueStrings"]);
  v16 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v15;

  if (!*((void *)v5 + 5))
  {
    v18 = (void *)MIInstallerErrorDomain;
    v19 = @"Missing persona unique strings when deserializing registration";
    uint64_t v20 = 55LL;
    goto LABEL_9;
  }

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MILaunchServicesSetPersonasOperation;
  id v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v8, "encodeWithCoder:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID", v8.receiver, v8.super_class));
  [v4 encodeObject:v5 forKey:@"bundleID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MILaunchServicesSetPersonasOperation domain](self, "domain")));
  [v4 encodeObject:v6 forKey:@"domain"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
  [v4 encodeObject:v7 forKey:@"personaUniqueStrings"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MILaunchServicesSetPersonasOperation;
  if (-[MILaunchServicesOperation isEqual:](&v14, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
    BOOL v8 = sub_100013970(v6, v7);

    if (v8
      && (id v9 = [v5 domain], v9 == (id)-[MILaunchServicesSetPersonasOperation domain](self, "domain")))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueStrings]);
      BOOL v12 = sub_100013970(v10, v11);
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MILaunchServicesSetPersonasOperation;
  unint64_t v3 = -[MILaunchServicesOperation hash](&v10, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID"));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ -[MILaunchServicesSetPersonasOperation domain](self, "domain");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash] ^ v3;

  return v8;
}

- (id)description
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));

  unint64_t v6 = (objc_class *)objc_opt_class(self);
  uint64_t v7 = NSStringFromClass(v6);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  unint64_t v10 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID"));
  uint64_t v12 = MIStringForInstallationDomain(-[MILaunchServicesSetPersonasOperation domain](self, "domain"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@:%lu %@/%@ personas:[%@]>",  v8,  v9,  v10,  v11,  v13,  v5));

  return v14;
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

- (void).cxx_destruct
{
}

@end