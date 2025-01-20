@interface PFCloudKitMetadataMigrationContext
- (PFCloudKitMetadataMigrationContext)init;
- (void)addConstrainedEntityToPreflight:(id)a3;
- (void)dealloc;
@end

@implementation PFCloudKitMetadataMigrationContext

- (PFCloudKitMetadataMigrationContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitMetadataMigrationContext;
  v2 = -[PFCloudKitMetadataMigrationContext init](&v4, sel_init);
  if (v2)
  {
    v2->_migrationStatements = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v2->_sqlEntitiesToCreate = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    *(_WORD *)&v2->_hasWorkToDo = 0;
    v2->_constrainedEntitiesToPreflight = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  }

  return v2;
}

- (void)dealloc
{
  self->_migrationStatements = 0LL;
  self->_sqlEntitiesToCreate = 0LL;

  self->_currentModel = 0LL;
  self->_sqlModel = 0LL;

  self->_storeMetadataModel = 0LL;
  self->_storeSQLModel = 0LL;

  self->_storeMetadataVersionHashes = 0LL;
  self->_storeMetadataVersion = 0LL;

  self->_storeMetadataVersionHashes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitMetadataMigrationContext;
  -[PFCloudKitMetadataMigrationContext dealloc](&v3, sel_dealloc);
}

- (void)addConstrainedEntityToPreflight:(id)a3
{
}

@end