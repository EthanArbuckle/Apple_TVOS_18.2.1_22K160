@interface NSCloudKitMirroringFetchRecordsResult
- (NSArray)updatedObjectIDs;
- (NSCloudKitMirroringFetchRecordsResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 updatedObjectIDs:(id)a7 failedObjectIDToError:(id)a8 error:(id)a9;
- (NSDictionary)failedObjectIDsToError;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringFetchRecordsResult

- (NSCloudKitMirroringFetchRecordsResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 updatedObjectIDs:(id)a7 failedObjectIDToError:(id)a8 error:(id)a9
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringFetchRecordsResult;
  v11 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( &v13,  sel_initWithRequest_storeIdentifier_success_madeChanges_error_,  a3,  a4,  a5,  a6,  a9);
  if (v11)
  {
    v11->_updatedObjectIDs = (NSArray *)a7;
    v11->_failedObjectIDsToError = (NSDictionary *)a8;
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringFetchRecordsResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (NSArray)updatedObjectIDs
{
  return self->_updatedObjectIDs;
}

- (NSDictionary)failedObjectIDsToError
{
  return self->_failedObjectIDsToError;
}

@end