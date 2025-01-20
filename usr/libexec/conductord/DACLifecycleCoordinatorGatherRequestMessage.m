@interface DACLifecycleCoordinatorGatherRequestMessage
+ (BOOL)supportsSecureCoding;
- (DACLifecycleCoordinatorGatherRequestMessage)init;
- (DACLifecycleCoordinatorGatherRequestMessage)initWithCoder:(id)a3;
- (id)description;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleCoordinatorGatherRequestMessage

- (DACLifecycleCoordinatorGatherRequestMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorGatherRequestMessage;
  result = -[DACLifecycleCoordinatorGatherRequestMessage init](&v3, "init");
  if (result) {
    result->_version = 1LL;
  }
  return result;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, v(%ld)>",  v5,  self,  -[DACLifecycleCoordinatorGatherRequestMessage version](self, "version")));

  return v6;
}

- (DACLifecycleCoordinatorGatherRequestMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 decodeIntegerForKey:@"version"];
  if (v5 < 1)
  {
    id v9 = sub_100014610(3);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to decode gather request message, invalid version",  v12,  2u);
    }

    v8 = 0LL;
  }

  else
  {
    int64_t v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorGatherRequestMessage;
    v7 = -[DACLifecycleCoordinatorGatherRequestMessage initWithCoder:](&v13, "initWithCoder:", v4);
    v8 = v7;
    if (v7) {
      v7->_version = v6;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorGatherRequestMessage;
  id v4 = a3;
  -[DACLifecycleCoordinatorGatherRequestMessage encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DACLifecycleCoordinatorGatherRequestMessage version](self, "version", v5.receiver, v5.super_class),  @"version");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)version
{
  return self->_version;
}

@end