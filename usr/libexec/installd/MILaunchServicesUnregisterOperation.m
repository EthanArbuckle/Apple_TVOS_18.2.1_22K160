@interface MILaunchServicesUnregisterOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesUnregisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 registrationUUID:(id)a5 serialNumber:(unint64_t)a6;
- (MILaunchServicesUnregisterOperation)initWithCoder:(id)a3;
- (NSString)bundleID;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesUnregisterOperation

- (MILaunchServicesUnregisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 registrationUUID:(id)a5 serialNumber:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterOperation;
  v12 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:]( &v15,  "initWithOperationUUID:serialNumber:",  a5,  a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v13->_domain = a4;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesUnregisterOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v20, "initWithCoder:", v4);
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v7;

  if (!v5->_bundleID)
  {
    v13 = (void *)MIInstallerErrorDomain;
    v14 = @"Missing bundle ID when deserializing unregistration";
    uint64_t v15 = 42LL;
LABEL_7:
    id v16 = sub_1000130F4( (uint64_t)"-[MILaunchServicesUnregisterOperation initWithCoder:]",  v15,  v13,  186LL,  0LL,  0LL,  v14,  v9,  v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v4 failWithError:v17];

    v12 = 0LL;
    goto LABEL_8;
  }

  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"domain"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v5->_domain = (unint64_t)[v11 unsignedIntegerValue];

  if ((MIIsValidInstallationDomain(v5->_domain) & 1) == 0)
  {
    v13 = (void *)MIInstallerErrorDomain;
    uint64_t v19 = (uint64_t)v5->_bundleID;
    v14 = @"Invalid installation domain value when deserializing unregistration for %@: %lu";
    uint64_t v15 = 48LL;
    goto LABEL_7;
  }

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterOperation;
  id v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"bundleID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MILaunchServicesUnregisterOperation domain](self, "domain")));
  [v4 encodeObject:v6 forKey:@"domain"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterOperation;
  if (-[MILaunchServicesOperation isEqual:](&v12, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
    BOOL v8 = sub_100013970(v6, v7);

    if (v8)
    {
      id v9 = [v5 domain];
      BOOL v10 = v9 == (id)-[MILaunchServicesUnregisterOperation domain](self, "domain");
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterOperation;
  unint64_t v3 = -[MILaunchServicesOperation hash](&v8, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID"));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ -[MILaunchServicesUnregisterOperation domain](self, "domain") ^ v3;

  return v6;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  unint64_t v7 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID"));
  uint64_t v9 = MIStringForInstallationDomain(-[MILaunchServicesUnregisterOperation domain](self, "domain"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@:%lu %@/%@>",  v5,  v6,  v7,  v8,  v10));

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end