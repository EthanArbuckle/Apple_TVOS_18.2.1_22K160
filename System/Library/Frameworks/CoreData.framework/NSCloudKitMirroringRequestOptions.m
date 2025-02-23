@interface NSCloudKitMirroringRequestOptions
- (BOOL)allowsCellularAccess;
- (CKOperationConfiguration)operationConfiguration;
- (NSArray)vouchers;
- (NSCloudKitMirroringRequestOptions)init;
- (id)copy;
- (id)createDefaultOperationConfiguration;
- (int64_t)qualityOfService;
- (uint64_t)applyToOperation:(uint64_t)result;
- (void)dealloc;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setOperationConfiguration:(id)a3;
- (void)setVouchers:(id)a3;
@end

@implementation NSCloudKitMirroringRequestOptions

- (NSCloudKitMirroringRequestOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringRequestOptions;
  v2 = -[NSCloudKitMirroringRequestOptions init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    v2->_operationConfiguration = (CKOperationConfiguration *)-[NSCloudKitMirroringRequestOptions createDefaultOperationConfiguration]( v2,  "createDefaultOperationConfiguration");
  }
  return v3;
}

- (void)dealloc
{
  self->_operationConfiguration = 0LL;
  self->_vouchers = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringRequestOptions;
  -[NSCloudKitMirroringRequestOptions dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  objc_super v3 = objc_alloc_init((Class)objc_opt_class());
  [v3 setOperationConfiguration:self->_operationConfiguration];
  v3[2] = self->_vouchers;
  return v3;
}

- (id)createDefaultOperationConfiguration
{
  id v2 = objc_alloc_init(getCloudKitCKOperationConfigurationClass());
  [v2 setQualityOfService:17];
  return v2;
}

- (void)setOperationConfiguration:(id)a3
{
  operationConfiguration = self->_operationConfiguration;
  if (operationConfiguration != a3)
  {

    self->_operationConfiguration = 0LL;
  }

  if (a3) {
    v6 = (CKOperationConfiguration *)a3;
  }
  else {
    v6 = -[NSCloudKitMirroringRequestOptions createDefaultOperationConfiguration]( self,  "createDefaultOperationConfiguration");
  }
  self->_operationConfiguration = v6;
}

- (uint64_t)applyToOperation:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([*(id *)(result + 16) lastObject]) {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "lastObject"), "operationConfiguration");
    }
    else {
      uint64_t v4 = *(void *)(v3 + 8);
    }
    return [a2 setConfiguration:v4];
  }

  return result;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
}

- (BOOL)allowsCellularAccess
{
  return -[CKOperationConfiguration allowsCellularAccess](self->_operationConfiguration, "allowsCellularAccess");
}

- (int64_t)qualityOfService
{
  return -[CKOperationConfiguration qualityOfService](self->_operationConfiguration, "qualityOfService");
}

- (CKOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

- (NSArray)vouchers
{
  return self->_vouchers;
}

- (void)setVouchers:(id)a3
{
}

@end