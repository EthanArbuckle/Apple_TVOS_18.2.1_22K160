@interface CPLCloudKitSharedLibraryServerRampTask
- (CPLCloudKitSharedLibraryServerRampTask)initWithController:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitSharedLibraryServerRampTask

- (CPLCloudKitSharedLibraryServerRampTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitSharedLibraryServerRampTask;
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
  id v7 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v7);
  id v4 = v7;
  if ((v3 & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000B7170;
    v6[3] = &unk_100242B40;
    v6[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCKPhotosSharedLibraryOperation silentMoverServerRampOperationWithOperationID:completionHandler:]( &OBJC_CLASS___CPLCKPhotosSharedLibraryOperation,  "silentMoverServerRampOperationWithOperationID:completionHandler:",  0LL,  v6));
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v5,  1LL,  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void).cxx_destruct
{
}

@end