@interface PFCloudKitImportDatabaseContext
- (BOOL)hasWorkToDo;
- (PFCloudKitImportDatabaseContext)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFCloudKitImportDatabaseContext

- (PFCloudKitImportDatabaseContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitImportDatabaseContext;
  v2 = -[PFCloudKitImportDatabaseContext init](&v4, sel_init);
  if (v2)
  {
    v2->_changedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v2->_deletedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v2->_purgedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v2->_userResetEncryptedDataZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v2->_updatedChangeToken = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  self->_changedRecordZoneIDs = 0LL;
  self->_deletedRecordZoneIDs = 0LL;

  self->_purgedRecordZoneIDs = 0LL;
  self->_userResetEncryptedDataZoneIDs = 0LL;

  self->_updatedChangeToken = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImportDatabaseContext;
  -[PFCloudKitImportDatabaseContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFCloudKitImportDatabaseContext;
  objc_super v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithString:",  -[PFCloudKitImportDatabaseContext description](&v6, sel_description));
  updatedChangeToken = self->_updatedChangeToken;
  if (!updatedChangeToken) {
    updatedChangeToken = (CKServerChangeToken *)[MEMORY[0x189603FE8] null];
  }
  [v3 appendFormat:@" {\nToken: %@", updatedChangeToken];
  if (-[NSMutableSet count](self->_changedRecordZoneIDs, "count")) {
    [v3 appendFormat:@"\nChanged:\n%@", self->_changedRecordZoneIDs];
  }
  if (-[NSMutableSet count](self->_deletedRecordZoneIDs, "count")) {
    [v3 appendFormat:@"\nDeleted:\n%@", self->_deletedRecordZoneIDs];
  }
  if (-[NSMutableSet count](self->_purgedRecordZoneIDs, "count")) {
    [v3 appendFormat:@"\nPurged:\n%@", self->_purgedRecordZoneIDs];
  }
  if (-[NSMutableSet count](self->_userResetEncryptedDataZoneIDs, "count")) {
    [v3 appendFormat:@"\nReset:\n%@", self->_userResetEncryptedDataZoneIDs];
  }
  [v3 appendString:@"\n}"];
  return v3;
}

- (BOOL)hasWorkToDo
{
  if (result)
  {
    uint64_t v1 = result;
    return [*(id *)(result + 8) count]
        || [*(id *)(v1 + 24) count]
        || [*(id *)(v1 + 16) count] != 0;
  }

  return result;
}

@end