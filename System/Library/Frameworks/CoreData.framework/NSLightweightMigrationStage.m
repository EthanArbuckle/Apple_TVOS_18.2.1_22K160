@interface NSLightweightMigrationStage
- (NSArray)versionChecksums;
- (NSLightweightMigrationStage)initWithVersionChecksums:(NSArray *)versionChecksums;
- (NSMigrationStage)subsequentStage;
- (void)dealloc;
- (void)setSubsequentStage:(id)a3;
@end

@implementation NSLightweightMigrationStage

- (NSLightweightMigrationStage)initWithVersionChecksums:(NSArray *)versionChecksums
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x189604010], "setWithArray:"), "count");
  if (v5 == -[NSArray count](versionChecksums, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSLightweightMigrationStage;
    v6 = -[NSMigrationStage init](&v10, sel_init);
    if (v6) {
      v6->_versionChecksums = versionChecksums;
    }
    return v6;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Duplicate version checksums detected." userInfo:0]);
    -[NSLightweightMigrationStage dealloc](v8, v9);
  }

  return result;
}

- (void)dealloc
{
  self->_versionChecksums = 0LL;
  self->_subsequentStage = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSLightweightMigrationStage;
  -[NSMigrationStage dealloc](&v3, sel_dealloc);
}

- (NSArray)versionChecksums
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMigrationStage)subsequentStage
{
  return (NSMigrationStage *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSubsequentStage:(id)a3
{
}

@end