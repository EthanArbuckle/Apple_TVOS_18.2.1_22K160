@interface DACLifecycleCoordinatorPublishRequestMessage
+ (BOOL)supportsSecureCoding;
- (DACActivityList)activityList;
- (DACLifecycleCoordinatorPublishRequestMessage)initWithActivityList:(id)a3;
- (DACLifecycleCoordinatorPublishRequestMessage)initWithCoder:(id)a3;
- (id)description;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleCoordinatorPublishRequestMessage

- (DACLifecycleCoordinatorPublishRequestMessage)initWithActivityList:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorPublishRequestMessage;
  v5 = -[DACLifecycleCoordinatorPublishRequestMessage init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_version = 1LL;
    v7 = (DACActivityList *)[v4 copy];
    activityList = v6->_activityList;
    v6->_activityList = v7;
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int64_t v6 = -[DACLifecycleCoordinatorPublishRequestMessage version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorPublishRequestMessage activityList](self, "activityList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p v(%ld) AL(%@)>",  v5,  self,  v6,  v7));

  return v8;
}

- (DACLifecycleCoordinatorPublishRequestMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 decodeIntegerForKey:@"version"];
  if (v5 < 1)
  {
    id v14 = sub_100014610(3);
    activityList = (DACLifecycleCoordinatorPublishRequestMessage *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)activityList, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)activityList,  OS_LOG_TYPE_ERROR,  "Failed to decode publish request message, invalid version",  v18,  2u);
    }

    v12 = 0LL;
    goto LABEL_11;
  }

  int64_t v7 = v5;
  id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DACActivityList, v6),  @"activityList");
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    id v15 = sub_100014610(3);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to decode publish request message, no Activity List",  v18,  2u);
    }

    v12 = 0LL;
    activityList = self;
    self = 0LL;
    goto LABEL_11;
  }

  objc_super v10 = (DACLifecycleCoordinatorPublishRequestMessage *)v9;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorPublishRequestMessage;
  v11 = -[DACLifecycleCoordinatorPublishRequestMessage initWithCoder:](&v19, "initWithCoder:", v4);
  v12 = v11;
  if (v11)
  {
    v11->_version = v7;
    self = v10;
    activityList = (DACLifecycleCoordinatorPublishRequestMessage *)v12->_activityList;
    v12->_activityList = (DACActivityList *)self;
LABEL_11:

    objc_super v10 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorPublishRequestMessage;
  id v4 = a3;
  -[DACLifecycleCoordinatorPublishRequestMessage encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DACLifecycleCoordinatorPublishRequestMessage version](self, "version", v6.receiver, v6.super_class),  @"version");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorPublishRequestMessage activityList](self, "activityList"));
  [v4 encodeObject:v5 forKey:@"activityList"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)version
{
  return self->_version;
}

- (DACActivityList)activityList
{
  return self->_activityList;
}

- (void).cxx_destruct
{
}

@end