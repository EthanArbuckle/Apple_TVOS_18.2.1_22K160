@interface AXSimpleAssetTaskTrigger
+ (id)withAnonymousInvokation:(id)a3;
+ (id)withFirstBootType;
+ (id)withFirstUnlockType;
+ (id)withLaunchActivityId:(id)a3;
+ (id)withNotificationName:(id)a3;
- (AXAssetsXPCActivity)launchActivity;
- (NSDictionary)arguments;
- (NSString)launchActivityId;
- (NSString)notificationName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)setArguments:(id)a3;
- (void)setLaunchActivity:(id)a3;
- (void)setLaunchActivityId:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation AXSimpleAssetTaskTrigger

+ (id)withLaunchActivityId:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskTrigger);
  -[AXSimpleAssetTaskTrigger setType:](v4, "setType:", 0LL);
  -[AXSimpleAssetTaskTrigger setLaunchActivityId:](v4, "setLaunchActivityId:", v3);

  return v4;
}

+ (id)withNotificationName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskTrigger);
  -[AXSimpleAssetTaskTrigger setType:](v4, "setType:", 1LL);
  -[AXSimpleAssetTaskTrigger setNotificationName:](v4, "setNotificationName:", v3);

  return v4;
}

+ (id)withFirstBootType
{
  v2 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskTrigger);
  -[AXSimpleAssetTaskTrigger setType:](v2, "setType:", 2LL);
  return v2;
}

+ (id)withFirstUnlockType
{
  v2 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskTrigger);
  -[AXSimpleAssetTaskTrigger setType:](v2, "setType:", 3LL);
  return v2;
}

+ (id)withAnonymousInvokation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskTrigger);
  -[AXSimpleAssetTaskTrigger setType:](v4, "setType:", 4LL);
  -[AXSimpleAssetTaskTrigger setArguments:](v4, "setArguments:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___AXSimpleAssetTaskTrigger);
  -[AXSimpleAssetTaskTrigger setType:](v4, "setType:", -[AXSimpleAssetTaskTrigger type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskTrigger launchActivityId](self, "launchActivityId"));
  -[AXSimpleAssetTaskTrigger setLaunchActivityId:](v4, "setLaunchActivityId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskTrigger notificationName](self, "notificationName"));
  -[AXSimpleAssetTaskTrigger setNotificationName:](v4, "setNotificationName:", v6);

  return v4;
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)launchActivityId
{
  return self->_launchActivityId;
}

- (void)setLaunchActivityId:(id)a3
{
}

- (AXAssetsXPCActivity)launchActivity
{
  return self->_launchActivity;
}

- (void)setLaunchActivity:(id)a3
{
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end