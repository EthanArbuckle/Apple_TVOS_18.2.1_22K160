@interface ODRBackgroundMaintenance
- (ODRBackgroundMaintenance)init;
@end

@implementation ODRBackgroundMaintenance

- (ODRBackgroundMaintenance)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ODRBackgroundMaintenance;
  v2 = -[ODRBackgroundMaintenance init](&v7, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___TaskQueue);
    maintenanceQueue = v2->_maintenanceQueue;
    v2->_maintenanceQueue = v3;

    v5 = v2->_maintenanceQueue;
    if (v5) {
      -[NSOperationQueue setName:](v5->_operationQueue, "setName:", @"OnDemandResourcesDaemon Maintenance Queue");
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end