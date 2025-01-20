@interface ResourceHintWithProperties
- (NSNumber)pid;
- (NSString)processName;
- (ResourceHintWithProperties)initWithProperties:(id)a3;
- (ResourceHintWithProperties)initWithResourceHint:(id)a3 andPid:(id)a4;
- (void)setPid:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation ResourceHintWithProperties

- (ResourceHintWithProperties)initWithResourceHint:(id)a3 andPid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___ResourceHintWithProperties);
  -[ResourceHintWithProperties setState:](v8, "setState:", [v7 state]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  -[ResourceHintWithProperties setUuid:](v8, "setUuid:", v9);

  id v10 = [v7 resourceType];
  -[ResourceHintWithProperties setResourceType:](v8, "setResourceType:", v10);
  -[ResourceHintWithProperties setPid:](v8, "setPid:", v6);

  return v8;
}

- (ResourceHintWithProperties)initWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___ResourceHintWithProperties);
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uuid"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"type"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"state"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pid"]);
    id v10 = v9;
    if (!v6 || !v7 || !v8 || !v9)
    {

      v12 = 0LL;
      goto LABEL_9;
    }

    v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
    -[ResourceHintWithProperties setUuid:](v5, "setUuid:", v11);

    -[ResourceHintWithProperties setResourceType:]( v5,  "setResourceType:",  [v7 unsignedIntValue]);
    -[ResourceHintWithProperties setPid:](v5, "setPid:", v10);
    -[ResourceHintWithProperties setState:](v5, "setState:", [v8 unsignedIntValue]);
  }

  v12 = v5;
LABEL_9:

  return v12;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (void)setPid:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end