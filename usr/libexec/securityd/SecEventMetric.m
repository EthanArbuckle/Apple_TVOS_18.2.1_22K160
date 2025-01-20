@interface SecEventMetric
+ (BOOL)supportsSecureCoding;
+ (id)supportedAttributeClasses;
- (NSMutableDictionary)attributes;
- (NSString)eventName;
- (SecEventMetric)initWithCoder:(id)a3;
- (SecEventMetric)initWithEventName:(id)a3;
- (id)generateError:(id)a3;
- (id)genericEvent;
- (unint64_t)convertTimeIntervalToServerTime:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setEventName:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation SecEventMetric

- (SecEventMetric)initWithEventName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SecEventMetric;
  v5 = -[SecEventMetric init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[SecEventMetric setEventName:](v5, "setEventName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[SecEventMetric setAttributes:](v6, "setAttributes:", v7);

    v8 = v6;
  }

  return v6;
}

- (SecEventMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SecEventMetric;
  v5 = -[SecEventMetric init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    id v7 = [(id)objc_opt_class(v5) supportedAttributeClasses];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v8 mutableCopy];

    [v9 addObject:objc_opt_class(NSDictionary)];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"eventName"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    eventName = v6->_eventName;
    v6->_eventName = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"attributes"]);
    attributes = v6->_attributes;
    v6->_attributes = (NSMutableDictionary *)v13;

    if (!v6->_eventName || !v6->_attributes)
    {

      v15 = 0LL;
      goto LABEL_7;
    }
  }

  v15 = v6;
LABEL_7:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric eventName](self, "eventName"));
  [v4 encodeObject:v5 forKey:@"eventName"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SecEventMetric attributes](self, "attributes"));
  [v4 encodeObject:v6 forKey:@"attributes"];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v8 = objc_msgSend((id)objc_opt_class(self), "supportedAttributeClasses", 0);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          v12 = 0LL;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v9);
            }
            if ((objc_opt_isKindOfClass(v6, *(void *)(*((void *)&v18 + 1) + 8LL * (void)v12)) & 1) != 0)
            {

              goto LABEL_14;
            }

            v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (objc_class *)objc_opt_class(v6);
        v14 = NSStringFromClass(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138543618;
        id v23 = v7;
        __int16 v24 = 2114;
        v25 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "genericMetric  %{public}@ with unhandled metric type: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
LABEL_14:
      v16 = self;
      objc_sync_enter(v16);
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric attributes](v16, "attributes"));
      [v17 setObject:v6 forKeyedSubscript:v7];

      objc_sync_exit(v16);
    }
  }
}

- (unint64_t)convertTimeIntervalToServerTime:(double)a3
{
  return (unint64_t)((a3 + 978307200.0) * 1000.0);
}

- (id)genericEvent
{
  v3 = objc_alloc_init(&OBJC_CLASS___SECC2MPGenericEvent);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric eventName](self, "eventName"));
  -[SECC2MPGenericEvent setName:](v3, "setName:", v4);

  -[SECC2MPGenericEvent setType:](v3, "setType:", 201LL);
  -[SECC2MPGenericEvent setTimestampStart:](v3, "setTimestampStart:", 0LL);
  -[SECC2MPGenericEvent setTimestampEnd:](v3, "setTimestampEnd:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric attributes](self, "attributes"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018245C;
  v10[3] = &unk_1002914D0;
  v10[4] = self;
  id v6 = v3;
  uint64_t v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)generateError:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SECC2MPError);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  -[SECC2MPError setErrorDomain:](v5, "setErrorDomain:", v6);

  -[SECC2MPError setErrorCode:](v5, "setErrorCode:", [v4 code]);
  if (+[SecC2DeviceInfo isAppleInternal](&OBJC_CLASS___SecC2DeviceInfo, "isAppleInternal"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    -[SECC2MPError setErrorDescription:](v5, "setErrorDescription:", v8);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecEventMetric generateError:](self, "generateError:", v10));
    -[SECC2MPError setUnderlyingError:](v5, "setUnderlyingError:", v11);
  }

  return v5;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setEventName:(id)a3
{
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedAttributeClasses
{
  if (qword_1002DED48 != -1) {
    dispatch_once(&qword_1002DED48, &stru_1002914A8);
  }
  return (id)qword_1002DED40;
}

@end