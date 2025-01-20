@interface AKDeviceListStoreMigrator
- (AKDeviceListStoreMigrator)init;
- (AKDeviceListStoreMigrator)initWithExecutor:(id)a3;
- (id)storeName;
- (unint64_t)currentSchemaVersion;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
@end

@implementation AKDeviceListStoreMigrator

- (id)storeName
{
  return String._bridgeToObjectiveC()();
}

- (unint64_t)currentSchemaVersion
{
  return 2LL;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  v4 = self;
  sub_1001027D0(a3);
}

- (AKDeviceListStoreMigrator)initWithExecutor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DeviceListStoreMigrator();
  return -[AKStoreMigrator initWithExecutor:](&v5, "initWithExecutor:", a3);
}

- (AKDeviceListStoreMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeviceListStoreMigrator();
  return -[AKDeviceListStoreMigrator init](&v3, "init");
}

@end