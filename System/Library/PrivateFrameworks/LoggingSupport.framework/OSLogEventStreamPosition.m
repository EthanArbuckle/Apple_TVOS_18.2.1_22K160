@interface OSLogEventStreamPosition
+ (BOOL)supportsSecureCoding;
- (OSLogEventStreamPosition)initWithCoder:(id)a3;
- (OSLogEventStreamPosition)initWithSource:(const char *)a3 bootUUID:(const char *)a4 time:(unint64_t)a5;
- (const)UUID;
- (const)sourceUUID;
- (unint64_t)continuousTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEventStreamPosition

- (OSLogEventStreamPosition)initWithSource:(const char *)a3 bootUUID:(const char *)a4 time:(unint64_t)a5
{
  result = -[OSLogEventStreamPosition init](self, "init");
  if (result)
  {
    *(_OWORD *)result->_source = *(_OWORD *)a3;
    *(_OWORD *)result->_uuid = *(_OWORD *)a4;
    result->_ct = a5;
  }

  return result;
}

- (OSLogEventStreamPosition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[OSLogEventStreamPosition init](self, "init");
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Source"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 getUUIDBytes:v5->_source];
    [v7 getUUIDBytes:v5->_uuid];
    v5->_ct = [v4 decodeInt64ForKey:@"Time"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x189607AB8];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithUUIDBytes:self->_source];
  v6 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:self->_uuid];
  [v5 encodeObject:v7 forKey:@"Source"];
  [v5 encodeObject:v6 forKey:@"UUID"];
  [v5 encodeInt64:self->_ct forKey:@"Time"];
}

- (const)sourceUUID
{
  return (const char *)self->_source;
}

- (const)UUID
{
  return (const char *)self->_uuid;
}

- (unint64_t)continuousTime
{
  return self->_ct;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end