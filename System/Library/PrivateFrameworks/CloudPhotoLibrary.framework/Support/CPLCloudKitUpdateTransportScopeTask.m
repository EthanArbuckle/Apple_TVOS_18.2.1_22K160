@interface CPLCloudKitUpdateTransportScopeTask
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitUpdateTransportScopeTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 scopeChange:(id)a6 completionHandler:(id)a7;
- (CPLEngineScope)scope;
- (CPLScopeChange)scopeChange;
- (void)runOperations;
@end

@implementation CPLCloudKitUpdateTransportScopeTask

- (CPLCloudKitUpdateTransportScopeTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 scopeChange:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CPLCloudKitUpdateTransportScopeTask;
  v17 = -[CPLCloudKitTransportTask initWithController:](&v21, "initWithController:", a3);
  if (v17)
  {
    id v18 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    objc_storeStrong((id *)&v17->_cloudKitScope, a4);
    objc_storeStrong((id *)&v17->_scope, a5);
    objc_storeStrong((id *)&v17->_scopeChange, a6);
  }

  return v17;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100071734;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLScopeChange)scopeChange
{
  return self->_scopeChange;
}

- (void).cxx_destruct
{
}

@end