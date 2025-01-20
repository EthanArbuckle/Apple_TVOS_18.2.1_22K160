@interface CPLCloudKitAcquireReschedulerTask
- (CPLCloudKitAcquireReschedulerTask)initWithController:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitAcquireReschedulerTask

- (CPLCloudKitAcquireReschedulerTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitAcquireReschedulerTask;
  v7 = -[CPLCloudKitTransportTask initWithController:](&v11, "initWithController:", a3);
  if (v7)
  {
    id v8 = [v6 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v8;
  }

  return v7;
}

- (void)runOperations
{
  id v6 = 0LL;
  unsigned int v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v6);
  id v4 = v6;
  if (v3) {
    id v5 = 0LL;
  }
  else {
    id v5 = v4;
  }
  (*((void (**)(id, id))self->_completionHandler + 2))(self->_completionHandler, v5);
}

- (void).cxx_destruct
{
}

@end