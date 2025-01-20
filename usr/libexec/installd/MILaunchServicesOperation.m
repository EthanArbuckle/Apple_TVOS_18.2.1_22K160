@interface MILaunchServicesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesOperation)initWithCoder:(id)a3;
- (MILaunchServicesOperation)initWithOperationUUID:(id)a3 serialNumber:(unint64_t)a4;
- (NSUUID)operationUUID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)serialNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesOperation

- (MILaunchServicesOperation)initWithOperationUUID:(id)a3 serialNumber:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MILaunchServicesOperation;
  v8 = -[MILaunchServicesOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_operationUUID, a3);
    v9->_serialNumber = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MILaunchServicesOperation;
  v5 = -[MILaunchServicesOperation init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"operationUUID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    operationUUID = v5->_operationUUID;
    v5->_operationUUID = (NSUUID *)v7;

    if (!v5->_operationUUID)
    {
      id v13 = sub_1000130F4( (uint64_t)"-[MILaunchServicesOperation initWithCoder:]",  40LL,  MIInstallerErrorDomain,  186LL,  0LL,  0LL,  @"Missing operation UUID when deserializing LS operation",  v9,  (uint64_t)v16.receiver);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v4 failWithError:v14];

      v12 = 0LL;
      goto LABEL_6;
    }

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"serialNumber"];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v5->_serialNumber = (unint64_t)[v11 unsignedIntegerValue];
  }

  v12 = v5;
LABEL_6:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  [v4 encodeObject:v5 forKey:@"operationUUID"];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MILaunchServicesOperation serialNumber](self, "serialNumber")));
  [v4 encodeObject:v6 forKey:@"serialNumber"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MILaunchServicesOperation *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }

  else
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v5 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](v5, "operationUUID"));
      BOOL v8 = sub_100013970(v6, v7);

      if (v8)
      {
        id v9 = -[MILaunchServicesOperation serialNumber](v5, "serialNumber");
        BOOL v10 = v9 == (id)-[MILaunchServicesOperation serialNumber](self, "serialNumber");
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
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = -[MILaunchServicesOperation serialNumber](self, "serialNumber") ^ v4;

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  unint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@:%lu>",  v5,  v6,  -[MILaunchServicesOperation serialNumber](self, "serialNumber")));

  return v7;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
}

@end