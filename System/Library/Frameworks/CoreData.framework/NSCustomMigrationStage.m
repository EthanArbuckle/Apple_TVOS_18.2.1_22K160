@interface NSCustomMigrationStage
- (NSCustomMigrationStage)initWithCurrentModelReference:(NSManagedObjectModelReference *)currentModel nextModelReference:(NSManagedObjectModelReference *)nextModel;
- (NSManagedObjectModelReference)currentModel;
- (NSManagedObjectModelReference)nextModel;
- (void)dealloc;
- (void)didMigrateHandler;
- (void)setDidMigrateHandler:(void *)didMigrateHandler;
- (void)setWillMigrateHandler:(void *)willMigrateHandler;
- (void)willMigrateHandler;
@end

@implementation NSCustomMigrationStage

- (NSCustomMigrationStage)initWithCurrentModelReference:(NSManagedObjectModelReference *)currentModel nextModelReference:(NSManagedObjectModelReference *)nextModel
{
  v13[2] = *MEMORY[0x1895F89C0];
  if (-[NSString isEqualToString:]( -[NSManagedObjectModelReference versionChecksum](currentModel, "versionChecksum"),  "isEqualToString:",  -[NSManagedObjectModelReference versionChecksum](nextModel, "versionChecksum")))
  {

    v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189603A60];
    v12[0] = @"currentModel versionChecksum";
    v12[1] = @"nextModel versionChecksum";
    v13[0] = -[NSManagedObjectModelReference versionChecksum](currentModel, "versionChecksum");
    v13[1] = -[NSManagedObjectModelReference versionChecksum](nextModel, "versionChecksum");
    objc_exception_throw((id)objc_msgSend( v9,  "exceptionWithName:reason:userInfo:",  v10,  @"The current model reference and the next model reference cannot be equal.",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v13, v12, 2)));
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSCustomMigrationStage;
  v7 = -[NSMigrationStage init](&v11, sel_init);
  if (v7)
  {
    v7->_currentModel = currentModel;
    v7->_nextModel = nextModel;
  }

  return v7;
}

- (void)dealloc
{
  self->_currentModel = 0LL;
  self->_nextModel = 0LL;

  self->_willMigrateHandler = 0LL;
  self->_didMigrateHandler = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCustomMigrationStage;
  -[NSMigrationStage dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectModelReference)currentModel
{
  return (NSManagedObjectModelReference *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSManagedObjectModelReference)nextModel
{
  return (NSManagedObjectModelReference *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)willMigrateHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setWillMigrateHandler:(void *)willMigrateHandler
{
}

- (void)didMigrateHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDidMigrateHandler:(void *)didMigrateHandler
{
}

@end