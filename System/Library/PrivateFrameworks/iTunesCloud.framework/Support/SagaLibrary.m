@interface SagaLibrary
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)_isEnabledWithURLBag:(id)a3;
- (SagaLibrary)initWithConfiguration:(id)a3;
- (id)_bagKey;
- (id)_userIdentity;
@end

@implementation SagaLibrary

- (SagaLibrary)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___CloudPendingChangesCoordinator);
  v7 = -[CloudPendingChangesCoordinator initWithConfiguration:prefix:loggable:]( v5,  "initWithConfiguration:prefix:loggable:",  v4,  @"Saga",  objc_opt_class(&OBJC_CLASS___SagaLibrary, v6));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SagaLibrary;
  v8 = -[CloudLibrary _initWithConfiguration:pendingChangesCoordinator:]( &v10,  "_initWithConfiguration:pendingChangesCoordinator:",  v4,  v7);

  return v8;
}

- (id)_userIdentity
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SagaLibrary;
  v2 = -[CloudLibrary configuration](&v6, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userIdentity]);

  return v4;
}

- (id)_bagKey
{
  return @"library-daap";
}

- (BOOL)_isEnabledWithURLBag:(id)a3
{
  return ICCloudClientIsSagaEnabledInURLBag(a3, a2);
}

+ (id)logCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "CloudSync");
}

+ (id)oversizeLogCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
}

@end