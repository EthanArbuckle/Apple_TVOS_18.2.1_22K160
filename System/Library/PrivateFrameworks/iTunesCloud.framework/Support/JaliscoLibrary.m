@interface JaliscoLibrary
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (JaliscoLibrary)initWithConfiguration:(id)a3;
- (id)_bagKey;
@end

@implementation JaliscoLibrary

- (JaliscoLibrary)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___CloudPendingChangesCoordinator);
  v7 = -[CloudPendingChangesCoordinator initWithConfiguration:prefix:loggable:]( v5,  "initWithConfiguration:prefix:loggable:",  v4,  @"Jalisco-Media",  objc_opt_class(&OBJC_CLASS___JaliscoLibrary, v6));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___JaliscoLibrary;
  v8 = -[CloudLibrary _initWithConfiguration:pendingChangesCoordinator:]( &v10,  "_initWithConfiguration:pendingChangesCoordinator:",  v4,  v7);

  return v8;
}

- (id)_bagKey
{
  return @"purchase-daap";
}

+ (id)logCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
}

+ (id)oversizeLogCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");
}

@end