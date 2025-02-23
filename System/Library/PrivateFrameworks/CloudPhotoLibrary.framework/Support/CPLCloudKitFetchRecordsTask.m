@interface CPLCloudKitFetchRecordsTask
- (CPLCloudKitFetchRecordsTask)initWithController:(id)a3 scopedIdentifiers:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (CPLRecordTargetMapping)targetMapping;
- (NSArray)scopedIdentifiers;
- (void)runOperations;
- (void)setScopedIdentifiers:(id)a3;
@end

@implementation CPLCloudKitFetchRecordsTask

- (CPLCloudKitFetchRecordsTask)initWithController:(id)a3 scopedIdentifiers:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchRecordsTask;
  v17 = -[CPLCloudKitTransportTask initWithController:](&v22, "initWithController:", a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scopedIdentifiers, a4);
    objc_storeStrong((id *)&v18->_targetMapping, a5);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v18, "setTransportScopeMapping:", v15);
    id v19 = [v16 copy];
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v19;
  }

  return v18;
}

- (void)runOperations
{
  id v3 = objc_retainBlock(self->_completionHandler);
  -[CPLCloudKitTransportTask fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:]( self,  "fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:",  self->_scopedIdentifiers,  self->_targetMapping,  v3);
}

- (NSArray)scopedIdentifiers
{
  return self->_scopedIdentifiers;
}

- (void)setScopedIdentifiers:(id)a3
{
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (void).cxx_destruct
{
}

@end