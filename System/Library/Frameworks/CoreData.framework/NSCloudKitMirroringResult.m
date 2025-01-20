@interface NSCloudKitMirroringResult
- (BOOL)madeChanges;
- (BOOL)success;
- (NSCloudKitMirroringRequest)request;
- (NSCloudKitMirroringResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7;
- (NSError)error;
- (NSString)storeIdentifier;
- (id)description;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringResult

- (NSCloudKitMirroringResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  v12 = -[NSCloudKitMirroringResult init](self, "init");
  if (v12)
  {
    v12->_request = (NSCloudKitMirroringRequest *)a3;
    v12->_storeIdentifier = (NSString *)a4;
    v12->_success = a5;
    v12->_madeChanges = a6;
    v13 = (NSError *)a7;
    v12->_error = v13;
    if (v12->_success && v13 != 0LL)
    {
      uint64_t v27 = [NSString stringWithUTF8String:"initWithRequest passed an error (%@) on a succes condition"];
      _NSCoreDataLog(17LL, v27, v28, v29, v30, v31, v32, v33, (uint64_t)a7);
      uint64_t v34 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return v12;
      }
      *(_DWORD *)buf = 138412290;
      id v39 = a7;
      v24 = "CoreData: initWithRequest passed an error (%@) on a succes condition";
      v25 = (os_log_s *)v34;
      uint32_t v26 = 12;
LABEL_17:
      _os_log_fault_impl(&dword_186681000, v25, OS_LOG_TYPE_FAULT, v24, buf, v26);
      return v12;
    }

    if (!v12->_success && v13 == 0LL)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"initWithRequest illegally passed nil instead of an error on a failure condition"];
      _NSCoreDataLog(17LL, v16, v17, v18, v19, v20, v21, v22, v37);
      uint64_t v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "CoreData: initWithRequest illegally passed nil instead of an error on a failure condition";
        v25 = (os_log_s *)v23;
        uint32_t v26 = 2;
        goto LABEL_17;
      }
    }
  }

  return v12;
}

- (void)dealloc
{
  self->_error = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringResult;
  objc_super v3 = (void *)objc_msgSend(-[NSCloudKitMirroringResult description](&v5, sel_description), "mutableCopy");
  [v3 appendFormat:@" storeIdentifier: %@ success: %d madeChanges: %d error: %@", self->_storeIdentifier, self->_success, self->_madeChanges, self->_error];
  return v3;
}

- (NSCloudKitMirroringRequest)request
{
  return self->_request;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)madeChanges
{
  return self->_madeChanges;
}

@end