@interface CPLCloudKitSendSharedLibraryExitStatusFeedbackTask
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitSendSharedLibraryExitStatusFeedbackTask)initWithController:(id)a3 scopeIdentifier:(id)a4 cloudKitScope:(id)a5 status:(int64_t)a6 completionHandler:(id)a7;
- (NSString)scopeIdentifier;
- (int64_t)status;
- (void)runOperations;
@end

@implementation CPLCloudKitSendSharedLibraryExitStatusFeedbackTask

- (CPLCloudKitSendSharedLibraryExitStatusFeedbackTask)initWithController:(id)a3 scopeIdentifier:(id)a4 cloudKitScope:(id)a5 status:(int64_t)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CPLCloudKitSendSharedLibraryExitStatusFeedbackTask;
  v16 = -[CPLCloudKitTransportTask initWithController:](&v20, "initWithController:", a3);
  if (v16)
  {
    id v17 = [v15 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    objc_storeStrong((id *)&v16->_scopeIdentifier, a4);
    objc_storeStrong((id *)&v16->_cloudKitScope, a5);
    v16->_status = a6;
  }

  return v16;
}

- (void)runOperations
{
  id v11 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v11);
  id v4 = v11;
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_cloudKitScope, "zoneID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    int64_t status = self->_status;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100032168;
    v10[3] = &unk_10023F558;
    v10[4] = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCKPhotosSharedLibraryOperation sendExitStatusFeedbackWithOperationID:shareID:status:completionHandler:]( &OBJC_CLASS___CPLCKPhotosSharedLibraryOperation,  "sendExitStatusFeedbackWithOperationID:shareID:status:completionHandler:",  v7,  v5,  status,  v10));
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v9,  CPLCloudKitOperationTypeForScope(self->_cloudKitScope),  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end