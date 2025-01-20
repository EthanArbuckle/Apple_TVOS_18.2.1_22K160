@interface DACLifecycleCoordinatorChangeResponseMessage
+ (BOOL)supportsSecureCoding;
- (DACLifecycleCoordinatorChangeResponseMessage)initWithCoder:(id)a3;
- (DACLifecycleCoordinatorChangeResponseMessage)initWithResult:(unint64_t)a3;
- (id)description;
- (int64_t)version;
- (unint64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleCoordinatorChangeResponseMessage

- (DACLifecycleCoordinatorChangeResponseMessage)initWithResult:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorChangeResponseMessage;
  result = -[DACLifecycleCoordinatorChangeResponseMessage init](&v5, "init");
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
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p v(%ld) R(%lu)>",  v5,  self,  -[DACLifecycleCoordinatorChangeResponseMessage version](self, "version"),  -[DACLifecycleCoordinatorChangeResponseMessage result](self, "result")));

  return v6;
}

- (DACLifecycleCoordinatorChangeResponseMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 decodeIntegerForKey:@"version"];
  if (v5 < 1)
  {
    id v14 = sub_100014610(3);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to decode change response message, invalid version",  v19,  2u);
    }

    v13 = 0LL;
    v9 = self;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v6), @"result");
    v9 = (DACLifecycleCoordinatorChangeResponseMessage *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = -[DACLifecycleCoordinatorChangeResponseMessage unsignedIntegerValue](v9, "unsignedIntegerValue");
    if ((unint64_t)v10 > 3)
    {
      id v16 = sub_100014610(3);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to decode change response message, invalid result",  v19,  2u);
      }

      v13 = 0LL;
    }

    else
    {
      unint64_t v11 = (unint64_t)v10;
      v20.receiver = self;
      v20.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorChangeResponseMessage;
      v12 = -[DACLifecycleCoordinatorChangeResponseMessage initWithCoder:](&v20, "initWithCoder:", v4);
      v13 = v12;
      if (v12)
      {
        v12->_version = v7;
        v12->_result = v11;
      }
    }
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorChangeResponseMessage;
  id v4 = a3;
  -[DACLifecycleCoordinatorChangeResponseMessage encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DACLifecycleCoordinatorChangeResponseMessage version](self, "version", v6.receiver, v6.super_class),  @"version");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DACLifecycleCoordinatorChangeResponseMessage result](self, "result")));
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