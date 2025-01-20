@interface CPLCloudKitBaseSetupTask
- (CPLCloudKitBaseSetupTask)initWithController:(id)a3;
@end

@implementation CPLCloudKitBaseSetupTask

- (CPLCloudKitBaseSetupTask)initWithController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLCloudKitBaseSetupTask;
  return -[CPLCloudKitTransportTask initWithController:](&v4, "initWithController:", a3);
}

@end