@interface MILaunchServicesUnregisterMountPointOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesUnregisterMountPointOperation)initWithCoder:(id)a3;
- (MILaunchServicesUnregisterMountPointOperation)initWithMountPoint:(id)a3 operationUUID:(id)a4 serialNumber:(unint64_t)a5;
- (NSURL)mountPoint;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesUnregisterMountPointOperation

- (MILaunchServicesUnregisterMountPointOperation)initWithMountPoint:(id)a3 operationUUID:(id)a4 serialNumber:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation;
  v10 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:]( &v13,  "initWithOperationUUID:serialNumber:",  a4,  a5);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_mountPoint, a3);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesUnregisterMountPointOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v14, "initWithCoder:", v4);
  if (v5
    && (id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"mountPoint"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6),
        mountPoint = v5->_mountPoint,
        v5->_mountPoint = (NSURL *)v7,
        mountPoint,
        !v5->_mountPoint))
  {
    id v11 = sub_1000130F4( (uint64_t)"-[MILaunchServicesUnregisterMountPointOperation initWithCoder:]",  39LL,  MIInstallerErrorDomain,  186LL,  0LL,  0LL,  @"Missing mount point when deserializing LS operation",  v9,  (uint64_t)v14.receiver);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v4 failWithError:v12];

    v10 = 0LL;
  }

  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation;
  id v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesUnregisterMountPointOperation mountPoint]( self,  "mountPoint",  v6.receiver,  v6.super_class));
  [v4 encodeObject:v5 forKey:@"mountPoint"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation;
  if (-[MILaunchServicesOperation isEqual:](&v10, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    id v5 = v4;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mountPoint]);

    BOOL v8 = sub_100013970(v6, v7);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation;
  unint64_t v3 = -[MILaunchServicesOperation hash](&v7, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  unint64_t v7 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@:%lu mount:%@>",  v5,  v6,  v7,  v9));

  return v10;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void).cxx_destruct
{
}

@end