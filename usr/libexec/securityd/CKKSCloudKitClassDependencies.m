@interface CKKSCloudKitClassDependencies
+ (id)forLiveCloudKit;
- (CKKSCloudKitClassDependencies)initWithFetchRecordZoneChangesOperationClass:(Class)a3 fetchRecordsOperationClass:(Class)a4 queryOperationClass:(Class)a5 modifySubscriptionsOperationClass:(Class)a6 modifyRecordZonesOperationClass:(Class)a7 apsConnectionClass:(Class)a8 nsnotificationCenterClass:(Class)a9 nsdistributednotificationCenterClass:(Class)a10 notifierClass:(Class)a11;
- (Class)apsConnectionClass;
- (Class)fetchRecordZoneChangesOperationClass;
- (Class)fetchRecordsOperationClass;
- (Class)modifyRecordZonesOperationClass;
- (Class)modifySubscriptionsOperationClass;
- (Class)notifierClass;
- (Class)nsdistributednotificationCenterClass;
- (Class)nsnotificationCenterClass;
- (Class)queryOperationClass;
@end

@implementation CKKSCloudKitClassDependencies

- (CKKSCloudKitClassDependencies)initWithFetchRecordZoneChangesOperationClass:(Class)a3 fetchRecordsOperationClass:(Class)a4 queryOperationClass:(Class)a5 modifySubscriptionsOperationClass:(Class)a6 modifyRecordZonesOperationClass:(Class)a7 apsConnectionClass:(Class)a8 nsnotificationCenterClass:(Class)a9 nsdistributednotificationCenterClass:(Class)a10 notifierClass:(Class)a11
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CKKSCloudKitClassDependencies;
  v17 = -[CKKSCloudKitClassDependencies init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fetchRecordZoneChangesOperationClass, a3);
    objc_storeStrong((id *)&v18->_fetchRecordsOperationClass, a4);
    objc_storeStrong((id *)&v18->_queryOperationClass, a5);
    objc_storeStrong((id *)&v18->_modifySubscriptionsOperationClass, a6);
    objc_storeStrong((id *)&v18->_modifyRecordZonesOperationClass, a7);
    objc_storeStrong((id *)&v18->_apsConnectionClass, a8);
    objc_storeStrong((id *)&v18->_nsnotificationCenterClass, a9);
    objc_storeStrong((id *)&v18->_nsdistributednotificationCenterClass, a10);
    objc_storeStrong((id *)&v18->_notifierClass, a11);
  }

  return v18;
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 8LL, 1);
}

- (Class)fetchRecordsOperationClass
{
  return (Class)objc_getProperty(self, a2, 16LL, 1);
}

- (Class)queryOperationClass
{
  return (Class)objc_getProperty(self, a2, 24LL, 1);
}

- (Class)modifySubscriptionsOperationClass
{
  return (Class)objc_getProperty(self, a2, 32LL, 1);
}

- (Class)modifyRecordZonesOperationClass
{
  return (Class)objc_getProperty(self, a2, 40LL, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 48LL, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 56LL, 1);
}

- (Class)nsdistributednotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 64LL, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)forLiveCloudKit
{
  v2 = objc_alloc(&OBJC_CLASS___CKKSCloudKitClassDependencies);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___CKFetchRecordZoneChangesOperation);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CKFetchRecordsOperation);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKQueryOperation);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKModifySubscriptionsOperation);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CKModifyRecordZonesOperation);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___APSConnection);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNotificationCenter);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDistributedNotificationCenter);
  return  -[CKKSCloudKitClassDependencies initWithFetchRecordZoneChangesOperationClass:fetchRecordsOperationClass:queryOperationClass:modifySubscriptionsOperationClass:modifyRecordZonesOperationClass:apsConnectionClass:nsnotificationCenterClass:nsdistributednotificationCenterClass:notifierClass:]( v2,  "initWithFetchRecordZoneChangesOperationClass:fetchRecordsOperationClass:queryOperationClass:modifySubscript ionsOperationClass:modifyRecordZonesOperationClass:apsConnectionClass:nsnotificationCenterClass:nsdistribut ednotificationCenterClass:notifierClass:",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  objc_opt_class(&OBJC_CLASS___CKKSNotifyPostNotifier));
}

@end