@interface DACLifecycleCoordinatorPublishResponseMessage
+ (BOOL)supportsSecureCoding;
- (DACLifecycleCoordinatorPublishResponseMessage)initWithCoder:(id)a3;
- (DACLifecycleCoordinatorPublishResponseMessage)initWithResult:(unint64_t)a3;
- (id)description;
- (int64_t)version;
- (unint64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleCoordinatorPublishResponseMessage

- (DACLifecycleCoordinatorPublishResponseMessage)initWithResult:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorPublishResponseMessage;
  result = -[DACLifecycleCoordinatorPublishResponseMessage init](&v5, "init");
  if (result)
  {
    result->_version = 1LL;
    result->_result = a3;
  }

  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, v(%ld) R(%lu)>",  v5,  self,  -[DACLifecycleCoordinatorPublishResponseMessage version](self, "version"),  -[DACLifecycleCoordinatorPublishResponseMessage result](self, "result")));

  return v6;
}

- (DACLifecycleCoordinatorPublishResponseMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 decodeIntegerForKey:@"version"];
  if (v5 < 1)
  {
    id v15 = sub_100014610(3);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to decode publish response message, invalid version",  v19,  2u);
    }

    v14 = 0LL;
    v10 = self;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v6), @"result");
    v9 = (DACLifecycleCoordinatorPublishResponseMessage *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      id v11 = -[DACLifecycleCoordinatorPublishResponseMessage unsignedIntegerValue](v9, "unsignedIntegerValue");
      if ((unint64_t)v11 > 1)
      {
        id v12 = sub_100014610(3);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to decode publish response message, invalid result",  v19,  2u);
        }

        v14 = 0LL;
        goto LABEL_13;
      }
    }

    else
    {
      id v11 = 0LL;
    }

    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorPublishResponseMessage;
    v17 = -[DACLifecycleCoordinatorPublishResponseMessage initWithCoder:](&v20, "initWithCoder:", v4);
    v14 = v17;
    if (v17)
    {
      v17->_version = v7;
      v17->_result = (unint64_t)v11;
    }
  }

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorPublishResponseMessage;
  id v4 = a3;
  -[DACLifecycleCoordinatorPublishResponseMessage encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DACLifecycleCoordinatorPublishResponseMessage version](self, "version", v6.receiver, v6.super_class),  @"version");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DACLifecycleCoordinatorPublishResponseMessage result](self, "result")));
  [v4 encodeObject:v5 forKey:@"result"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)version
{
  return self->_version;
}

- (unint64_t)result
{
  return self->_result;
}

@end