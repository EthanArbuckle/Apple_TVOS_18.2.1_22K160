@interface NSPersistentCloudKitContainerOptions
- (BOOL)automaticallyDownloadFileBackedFutures;
- (BOOL)useDeviceToDeviceEncryption;
- (CKContainer)testContainerOverride;
- (CKContainerOptions)containerOptions;
- (CKDatabaseScope)databaseScope;
- (NSArray)activityVouchers;
- (NSCloudKitMirroringDelegateProgressProvider)progressProvider;
- (NSNumber)ckAssetThresholdBytes;
- (NSNumber)operationMemoryThresholdBytes;
- (NSPersistentCloudKitContainerOptions)initWithContainer:(id)a3;
- (NSPersistentCloudKitContainerOptions)initWithContainerIdentifier:(NSString *)containerIdentifier;
- (NSString)apsConnectionMachServiceName;
- (NSString)containerIdentifier;
- (void)dealloc;
- (void)setActivityVouchers:(id)a3;
- (void)setApsConnectionMachServiceName:(id)a3;
- (void)setAutomaticallyDownloadFileBackedFutures:(BOOL)a3;
- (void)setCkAssetThresholdBytes:(id)a3;
- (void)setContainerOptions:(id)a3;
- (void)setDatabaseScope:(CKDatabaseScope)databaseScope;
- (void)setOperationMemoryThresholdBytes:(id)a3;
- (void)setProgressProvider:(id)a3;
- (void)setTestContainerOverride:(id)a3;
- (void)setUseDeviceToDeviceEncryption:(BOOL)a3;
@end

@implementation NSPersistentCloudKitContainerOptions

- (NSPersistentCloudKitContainerOptions)initWithContainerIdentifier:(NSString *)containerIdentifier
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerOptions;
  v4 = -[NSPersistentCloudKitContainerOptions init](&v7, sel_init);
  if (v4)
  {
    uint64_t v5 = -[NSString copy](containerIdentifier, "copy");
    v4->_useDeviceToDeviceEncryption = 0;
    v4->_containerIdentifier = (NSString *)v5;
    v4->_apsConnectionMachServiceName = 0LL;
    v4->_databaseScope = 2LL;
    v4->_activityVouchers = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
  }

  return v4;
}

- (NSPersistentCloudKitContainerOptions)initWithContainer:(id)a3
{
  v4 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:]( self,  "initWithContainerIdentifier:",  [a3 containerIdentifier]);
  if (v4) {
    v4->_testContainerOverride = (CKContainer *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_apsConnectionMachServiceName = 0LL;
  self->_testContainerOverride = 0LL;

  self->_ckAssetThresholdBytes = 0LL;
  self->_containerOptions = 0LL;

  self->_operationMemoryThresholdBytes = 0LL;
  self->_activityVouchers = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerOptions;
  -[NSPersistentCloudKitContainerOptions dealloc](&v3, sel_dealloc);
}

- (void)setActivityVouchers:(id)a3
{
  activityVouchers = self->_activityVouchers;
  if (activityVouchers != a3)
  {

    if (a3) {
      v6 = (NSArray *)a3;
    }
    else {
      v6 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    }
    self->_activityVouchers = v6;
  }

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)useDeviceToDeviceEncryption
{
  return self->_useDeviceToDeviceEncryption;
}

- (void)setUseDeviceToDeviceEncryption:(BOOL)a3
{
  self->_useDeviceToDeviceEncryption = a3;
}

- (NSString)apsConnectionMachServiceName
{
  return self->_apsConnectionMachServiceName;
}

- (void)setApsConnectionMachServiceName:(id)a3
{
}

- (CKDatabaseScope)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(CKDatabaseScope)databaseScope
{
  self->_databaseScope = databaseScope;
}

- (NSCloudKitMirroringDelegateProgressProvider)progressProvider
{
  return (NSCloudKitMirroringDelegateProgressProvider *)objc_loadWeak((id *)&self->_progressProvider);
}

- (void)setProgressProvider:(id)a3
{
}

- (CKContainer)testContainerOverride
{
  return self->_testContainerOverride;
}

- (void)setTestContainerOverride:(id)a3
{
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (void)setContainerOptions:(id)a3
{
}

- (NSNumber)operationMemoryThresholdBytes
{
  return self->_operationMemoryThresholdBytes;
}

- (void)setOperationMemoryThresholdBytes:(id)a3
{
}

- (BOOL)automaticallyDownloadFileBackedFutures
{
  return self->_automaticallyDownloadFileBackedFutures;
}

- (void)setAutomaticallyDownloadFileBackedFutures:(BOOL)a3
{
  self->_automaticallyDownloadFileBackedFutures = a3;
}

- (NSNumber)ckAssetThresholdBytes
{
  return self->_ckAssetThresholdBytes;
}

- (void)setCkAssetThresholdBytes:(id)a3
{
}

- (NSArray)activityVouchers
{
  return self->_activityVouchers;
}

- (void).cxx_destruct
{
}

@end