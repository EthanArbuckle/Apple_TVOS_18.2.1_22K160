@interface CPLCloudKitCopyTask
- (BOOL)followRemapping;
- (CPLCloudKitCopyHelper)helper;
- (CPLCloudKitCopyTask)initWithController:(id)a3 sourceRecordsWithIDs:(id)a4 followRemapping:(BOOL)a5 sourceType:(int64_t)a6 destinationRecordIDs:(id)a7 destinationType:(int64_t)a8 helper:(id)a9 completionHandler:(id)a10;
- (CPLCloudKitCopyTask)initWithController:(id)a3 sourceRecordsWithIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 completionHandler:(id)a8;
- (NSArray)destinationRecordIDs;
- (NSArray)sourceRecordIDs;
- (id)completionHandler;
- (int64_t)destinationType;
- (int64_t)sourceType;
- (void)runOperations;
@end

@implementation CPLCloudKitCopyTask

- (CPLCloudKitCopyTask)initWithController:(id)a3 sourceRecordsWithIDs:(id)a4 followRemapping:(BOOL)a5 sourceType:(int64_t)a6 destinationRecordIDs:(id)a7 destinationType:(int64_t)a8 helper:(id)a9 completionHandler:(id)a10
{
  id v16 = a4;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CPLCloudKitCopyTask;
  v20 = -[CPLCloudKitTransportTask initWithController:](&v28, "initWithController:", a3);
  if (v20)
  {
    v21 = (NSArray *)[v16 copy];
    sourceRecordIDs = v20->_sourceRecordIDs;
    v20->_sourceRecordIDs = v21;

    v20->_followRemapping = a5;
    v20->_sourceType = a6;
    v23 = (NSArray *)[v17 copy];
    destinationRecordIDs = v20->_destinationRecordIDs;
    v20->_destinationRecordIDs = v23;

    v20->_destinationType = a8;
    objc_storeStrong((id *)&v20->_helper, a9);
    id v25 = [v19 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v25;
  }

  return v20;
}

- (CPLCloudKitCopyTask)initWithController:(id)a3 sourceRecordsWithIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 completionHandler:(id)a8
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006A650;
  v17[3] = &unk_10023EBB0;
  id v18 = a8;
  id v14 = v18;
  v15 = -[CPLCloudKitCopyTask initWithController:sourceRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "initWithController:sourceRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper :completionHandler:",  a3,  a4,  0LL,  a5,  a6,  a7,  0LL,  v17);

  return v15;
}

- (CPLCloudKitCopyHelper)helper
{
  if (self->_helper) {
    self = (CPLCloudKitCopyTask *)self->_helper;
  }
  return (CPLCloudKitCopyHelper *)self;
}

- (void)runOperations
{
  sourceRecordIDs = self->_sourceRecordIDs;
  BOOL followRemapping = self->_followRemapping;
  int64_t sourceType = self->_sourceType;
  destinationRecordIDs = self->_destinationRecordIDs;
  int64_t destinationType = self->_destinationType;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCopyTask helper](self, "helper"));
  -[CPLCloudKitTransportTask copyRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "copyRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:",  sourceRecordIDs,  followRemapping,  sourceType,  destinationRecordIDs,  destinationType,  v8,  self->_completionHandler);
}

- (NSArray)sourceRecordIDs
{
  return self->_sourceRecordIDs;
}

- (BOOL)followRemapping
{
  return self->_followRemapping;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (NSArray)destinationRecordIDs
{
  return self->_destinationRecordIDs;
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end