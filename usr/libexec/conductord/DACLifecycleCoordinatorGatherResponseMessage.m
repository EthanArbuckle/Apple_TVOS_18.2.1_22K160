@interface DACLifecycleCoordinatorGatherResponseMessage
+ (BOOL)supportsSecureCoding;
- (DACActivityList)activityList;
- (DACLifecycleCoordinatorGatherResponseMessage)initWithActivityList:(id)a3 assertedActivities:(id)a4;
- (DACLifecycleCoordinatorGatherResponseMessage)initWithCoder:(id)a3;
- (NSSet)assertedActivities;
- (id)description;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleCoordinatorGatherResponseMessage

- (DACLifecycleCoordinatorGatherResponseMessage)initWithActivityList:(id)a3 assertedActivities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorGatherResponseMessage;
  v8 = -[DACLifecycleCoordinatorGatherResponseMessage init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_version = 1LL;
    v10 = (DACActivityList *)[v6 copy];
    activityList = v9->_activityList;
    v9->_activityList = v10;

    v12 = (NSSet *)[v7 copy];
    assertedActivities = v9->_assertedActivities;
    v9->_assertedActivities = v12;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int64_t v6 = -[DACLifecycleCoordinatorGatherResponseMessage version](self, "version");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorGatherResponseMessage activityList](self, "activityList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorGatherResponseMessage assertedActivities](self, "assertedActivities"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p v(%ld) AL(%@) AA(%@)>",  v5,  self,  v6,  v7,  v8));

  return v9;
}

- (DACLifecycleCoordinatorGatherResponseMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 decodeIntegerForKey:@"version"];
  if (v5 < 1)
  {
    id v20 = sub_100014610(3);
    v14 = (DACLifecycleCoordinatorGatherResponseMessage *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "Failed to decode gather response message, invalid version",  buf,  2u);
    }

    v19 = 0LL;
    v10 = self;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DACActivityList, v6),  @"activityList");
    v10 = (DACLifecycleCoordinatorGatherResponseMessage *)objc_claimAutoreleasedReturnValue(v8);
    if (v10)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSSet, v9);
      v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___DACActivityDescriptor, v12),  0LL);
      v14 = (DACLifecycleCoordinatorGatherResponseMessage *)objc_claimAutoreleasedReturnValue(v13);
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"assertedActivities"]);
      if (!v15)
      {
        id v16 = sub_100014610(3);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Decode gather response missing asserted activities",  buf,  2u);
        }

        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      }

      v23.receiver = self;
      v23.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorGatherResponseMessage;
      v18 = -[DACLifecycleCoordinatorGatherResponseMessage initWithCoder:](&v23, "initWithCoder:", v4);
      v19 = v18;
      if (v18)
      {
        v18->_version = v7;
        objc_storeStrong((id *)&v18->_activityList, v10);
        objc_storeStrong((id *)&v19->_assertedActivities, v15);
      }
    }

    else
    {
      id v21 = sub_100014610(3);
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "Failed to decode gather response message, no Activity List",  buf,  2u);
      }

      v19 = 0LL;
      v14 = self;
    }
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorGatherResponseMessage;
  id v4 = a3;
  -[DACLifecycleCoordinatorGatherResponseMessage encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DACLifecycleCoordinatorGatherResponseMessage version](self, "version", v7.receiver, v7.super_class),  @"version");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorGatherResponseMessage activityList](self, "activityList"));
  [v4 encodeObject:v5 forKey:@"activityList"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorGatherResponseMessage assertedActivities](self, "assertedActivities"));
  [v4 encodeObject:v6 forKey:@"assertedActivities"];
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

- (NSSet)assertedActivities
{
  return self->_assertedActivities;
}

- (void).cxx_destruct
{
}

@end