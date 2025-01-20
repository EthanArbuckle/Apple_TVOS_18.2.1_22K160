@interface NSSQLiteAdapter
+ (NSSQLiteStatement)generateStatementForCheckingMulticolumnConstraint:(void *)a3 onObjects:(void *)a4 usingSQLCore:;
+ (NSSQLiteStatement)generateStatementForCheckingUniqueProperties:(void *)a3 onObjects:(void *)a4 usingSQLCore:;
- (NSSQLiteAdapter)initWithSQLCore:(id)a3;
- (NSSQLiteStatement)_newStatementForFetchRequestContext:(uint64_t)a1 ignoreInheritance:(void *)a2 countOnly:(void *)a3 nestingLevel:(int)a4;
- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(__CFString *)a3 inManyToMany:;
- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(void *)a3 inToMany:;
- (NSSQLiteStatement)newComplexPrimaryKeyUpdateStatementForEntity:(uint64_t)a1;
- (NSSQLiteStatement)newConstrainedValuesUpdateStatementWithRow:(NSSQLiteStatement *)a1;
- (NSSQLiteStatement)newCopyAndInsertStatementForManyToMany:(__CFString *)a3 toManyToMany:(uint64_t)a4 intermediateTableName:(int)a5 invertColumns:;
- (NSSQLiteStatement)newCorrelationDeleteStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationInsertStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationMasterReorderStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationMasterReorderStatementPart2ForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationReorderStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCountStatementWithFetchRequestContext:(uint64_t)a1;
- (NSSQLiteStatement)newCreateIndexStatementForColumnWithName:(uint64_t)a1 inTableWithName:(uint64_t)a2;
- (NSSQLiteStatement)newCreatePrimaryKeyTableStatement;
- (NSSQLiteStatement)newCreateTableStatementForEntity:(const __CFString *)a1;
- (NSSQLiteStatement)newCreateTableStatementForManyToMany:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newCreateTempTableStatementForEntity:(void *)a3 withAttributesToConstrain:;
- (NSSQLiteStatement)newDeleteStatementWithRow:(NSSQLiteStatement *)a1;
- (NSSQLiteStatement)newDropIndexStatementForColumn:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newDropIndexStatementForColumnWithName:(uint64_t)a3 inTableWithName:;
- (NSSQLiteStatement)newDropTableStatementForTableNamed:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newDropTableStatementOrFailForTableNamed:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newInsertStatementWithRow:(NSSQLiteStatement *)a1;
- (NSSQLiteStatement)newPrimaryKeyInitializeStatementForEntity:(uint64_t)a3 withInitialMaxPK:;
- (NSSQLiteStatement)newRenameTableStatementFrom:(uint64_t)a3 to:;
- (NSSQLiteStatement)newSelectStatementWithFetchRequestContext:(void *)a3 ignoreInheritance:;
- (NSSQLiteStatement)newSimplePrimaryKeyUpdateStatementForEntity:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newStatementWithEntity:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newStatementWithSQLString:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:;
- (const)typeStringForColumn:(const __CFString *)result;
- (id)newCreateIndexStatementsForEntity:(char)a3 defaultIndicesOnly:;
- (id)newDropIndexStatementsForEntity:(char)a3 defaultIndicesOnly:;
- (id)sqlCore;
- (uint64_t)_generateFragmentsForEntity:(void *)a1 inArray:(void *)a2;
- (uint64_t)generateBatchDeleteUpdateHistoryStatementEntity:(uint64_t)a3 andRelationship:(int)a4 useInverse:;
- (uint64_t)generateBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:;
- (uint64_t)generateCorrelationTableTriggerStatementsForRelationship:(uint64_t)a1 existing:(void *)a2 correlationTableTriggers:(const __CFDictionary *)a3 error:(uint64_t *)a4;
- (uint64_t)generateDeleteHistoryTriggerForEntity:(uint64_t)a1 error:(void *)a2;
- (uint64_t)generateDeleteStatementsForRequest:(uint64_t *)a3 error:;
- (uint64_t)generateDropBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:;
- (uint64_t)generateTriggerForEntity:(const __CFDictionary *)a3 alreadyCreated:(const __CFDictionary *)a4 correlations:(const __CFDictionary *)a5 batchHistory:(void *)a6 fragments:(uint64_t *)a7 error:;
- (uint64_t)newSelectStatementWithFetchRequest:(void *)a3 ignoreInheritance:;
- (uint64_t)sqlTypeForExpressionConstantValue:(uint64_t)result;
- (void)_useModel:(uint64_t)a1;
- (void)dealloc;
- (void)generateBatchDeleteUpdateHistoryTriggerForEntity:(void *)a1 andRelationship:(void *)a2 batchHistory:(void *)a3 error:(const __CFDictionary *)a4;
- (void)newCreateTriggersForEntity:(void *)a3 existingRtreeTables:;
- (void)newGeneratorWithStatement:(void *)result;
@end

@implementation NSSQLiteAdapter

- (NSSQLiteStatement)newSelectStatementWithFetchRequestContext:(void *)a3 ignoreInheritance:
{
  if (!a1) {
    return 0LL;
  }
  v6 = (void *)[a2 request];
  if (v6)
  {
    if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v6 entity])) {
      return -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:]( a1,  a2,  a3,  0);
    }
    return 0LL;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"missing fetch request" userInfo:0]);
  return (NSSQLiteStatement *)-[NSSQLGenerator initWithPersistentStore:](v8, v9, v10);
}

- (NSSQLiteStatement)newStatementWithEntity:(NSSQLiteStatement *)result
{
  if (result)
  {
    if (a2)
    {
      return -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", a2);
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"entity required" userInfo:0]);
      return -[NSSQLiteStatement initWithEntity:](v2, v3, v4);
    }
  }

  return result;
}

- (uint64_t)sqlTypeForExpressionConstantValue:(uint64_t)result
{
  if (result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      return 4LL;
    }
    if ([a2 isNSNumber])
    {
      SEL v3 = (char *)[a2 objCType];
      if (!v3) {
        return 2LL;
      }
      unsigned int v4 = *v3 - 66;
      if (v4 <= 0x31)
      {
        if (((1LL << v4) & 0x2008200020083LL) != 0) {
          return 1LL;
        }
        if (((1LL << v4) & 0x840000008400LL) != 0) {
          return 2LL;
        }
        if (((1LL << v4) & 0x1400000000LL) != 0) {
          return 7LL;
        }
      }

      return 6LL;
    }

    if ([a2 isNSString]) {
      return 6LL;
    }
    if ([a2 isNSDate])
    {
      return 8LL;
    }

    else if ([a2 isNSData])
    {
      return 10LL;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        return 12LL;
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          return 11LL;
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

- (void)_useModel:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 16) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 16) = a2;
    }
  }

- (NSSQLiteAdapter)initWithSQLCore:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLiteAdapter;
  id v4 = -[NSSQLiteAdapter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sqlCore = (NSSQLCore *)a3;
    v4->_model = (NSSQLModel *)(id)[a3 model];
    memset(&v7, 0, sizeof(v7));
    v7.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x189605240] + 24LL);
    v5->_cachedDeleteTriggersByEntity = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  4LL,  &v7,  MEMORY[0x189605250]);
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)dealloc
{
  cachedDeleteTriggersByEntity = self->_cachedDeleteTriggersByEntity;
  if (cachedDeleteTriggersByEntity)
  {
    CFRelease(cachedDeleteTriggersByEntity);
    self->_cachedDeleteTriggersByEntity = 0LL;
  }

  self->_sqlCore = 0LL;

  self->_model = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLiteAdapter;
  -[NSSQLiteAdapter dealloc](&v4, sel_dealloc);
}

- (id)sqlCore
{
  return self->_sqlCore;
}

- (const)typeStringForColumn:(const __CFString *)result
{
  if (result)
  {
    int v3 = [a2 sqlType];
    if ((v3 & 0xFE) == 2)
    {
      result = @"INTEGER";
      if (a2)
      {
        if (a2[24] == 2) {
          return @"INTEGER PRIMARY KEY";
        }
      }
    }

    else
    {
      return NSSQLiteAdapter_typeStringForSQLType(v3);
    }
  }

  return result;
}

- (NSSQLiteStatement)newStatementWithSQLString:(NSSQLiteStatement *)result
{
  if (result) {
    return -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  a2);
  }
  return result;
}

- (void)newGeneratorWithStatement:(void *)result
{
  if (result)
  {
    if (a2)
    {
      return -[_NSSQLGenerator initWithStatement:forAdapter:]( objc_alloc(&OBJC_CLASS____NSSQLGenerator),  a2,  (uint64_t)result);
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"statement required" userInfo:0]);
      return (void *)-[NSSQLiteAdapter newInsertStatementWithRow:]();
    }
  }

  return result;
}

- (NSSQLiteStatement)newInsertStatementWithRow:(NSSQLiteStatement *)a1
{
  if (!a1) {
    return 0LL;
  }
  if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  v5 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v4);
  v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v5);
  CFDictionaryKeyCallBacks v7 = v6;
  if (v6)
  {
    -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]( (uint64_t)v6,  a2,  0,  0,  (void *)NSArray_EmptyArray);
    objc_super v8 = (NSString *)v7[3];
    if (v5) {
      goto LABEL_8;
    }
  }

  else
  {
    objc_super v8 = 0LL;
    if (v5)
    {
LABEL_8:
      sqlString = v5->_sqlString;
      if (sqlString != v8)
      {

        v5->_sqlString = (NSString *)-[NSString copy](v8, "copy");
      }
    }
  }

  return v5;
}

- (NSSQLiteStatement)newUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!a2)
  {
    v14 = (NSSQLiteStatement *)MEMORY[0x189603F70];
    uint64_t v15 = *MEMORY[0x189603A58];
    v16 = @"empty row";
    uint64_t v17 = 0LL;
LABEL_16:
    objc_exception_throw((id)-[NSSQLiteStatement exceptionWithName:reason:userInfo:]( v14,  "exceptionWithName:reason:userInfo:",  v15,  v16,  v17));
    goto LABEL_17;
  }

  if (!a3)
  {
    uint64_t v4 = (NSSQLiteStatement *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A58];
    v19 = @"objectID";
    v20[0] = [(id)a2 objectID];
    uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v16 = @"missing original";
    v14 = v4;
    uint64_t v15 = v18;
    goto LABEL_16;
  }

  if ((*(_BYTE *)(a2 + 16) & 1) != 0) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v4 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v10);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareUpdateStatementWithRow:originalRow:withMask:]((uint64_t)v5, a2, a3, a4);
  if (v5)
  {
    v11 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }

- (NSSQLiteStatement)newConstrainedValuesUpdateStatementWithRow:(NSSQLiteStatement *)a1
{
  if (!a1) {
    return 0LL;
  }
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) != 0) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    v2 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v6);
    int v3 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v2);
    -[_NSSQLGenerator prepareConstrainedValuesUpdateStatementWithRow:]((uint64_t)v3, a2);
    if (v3)
    {
      CFDictionaryKeyCallBacks v7 = (NSString *)v3[3];
      if (v2) {
        goto LABEL_8;
      }
      goto LABEL_10;
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"empty row" userInfo:0]);
  }

  CFDictionaryKeyCallBacks v7 = 0LL;
  if (v2)
  {
LABEL_8:
    sqlString = v2->_sqlString;
    if (sqlString != v7)
    {

      v2->_sqlString = (NSString *)-[NSString copy](v7, "copy");
    }
  }

- (NSSQLiteStatement)newDeleteStatementWithRow:(NSSQLiteStatement *)a1
{
  if (!a1) {
    return 0LL;
  }
  if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  v5 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v4);
  uint64_t v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v5);
  -[_NSSQLGenerator prepareDeleteStatementWithRow:]((uint64_t)v6, a2);
  if (v6)
  {
    CFDictionaryKeyCallBacks v7 = (NSString *)v6[3];
    if (v5) {
      goto LABEL_8;
    }
  }

  else
  {
    CFDictionaryKeyCallBacks v7 = 0LL;
    if (v5)
    {
LABEL_8:
      sqlString = v5->_sqlString;
      if (sqlString != v7)
      {

        v5->_sqlString = (NSString *)-[NSString copy](v7, "copy");
      }
    }
  }

  return v5;
}

- (NSSQLiteStatement)_newStatementForFetchRequestContext:(uint64_t)a1 ignoreInheritance:(void *)a2 countOnly:(void *)a3 nestingLevel:(int)a4
{
  objc_super v8 = (void *)MEMORY[0x186E3E5D8]();
  SEL v9 = (void *)[a2 request];
  uint64_t v10 =  -[NSSQLGenerator initWithPersistentStore:]( objc_alloc(&OBJC_CLASS___NSSQLGenerator),  "initWithPersistentStore:",  *(void *)(a1 + 8));
  if (v10) {
    v11 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]( (uint64_t)v10,  v9,  a3,  a4,  0LL,  0,  (uint64_t)a2);
  }
  else {
    v11 = 0LL;
  }
  objc_autoreleasePoolPop(v8);
  return v11;
}

- (uint64_t)newSelectStatementWithFetchRequest:(void *)a3 ignoreInheritance:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = MEMORY[0x186E3E5D8]();
  if (a2)
  {
    CFDictionaryKeyCallBacks v7 = (void *)v6;
    if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[a2 entity]))
    {
      objc_super v8 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext),  "initWithRequest:context:sqlCore:",  a2,  0LL,  0LL);
      SEL v9 = -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:]( a1,  v8,  a3,  0);
    }

    else
    {
      SEL v9 = 0LL;
    }

    objc_autoreleasePoolPop(v7);
    return (uint64_t)v9;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"missing fetch request" userInfo:0]);
  return -[NSSQLiteAdapter newCountStatementWithFetchRequestContext:]();
}

- (NSSQLiteStatement)newCountStatementWithFetchRequestContext:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = (void *)[a2 request];
  if (v4)
  {
    if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v4 entity])) {
      return -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:]( a1,  a2,  0LL,  1);
    }
    return 0LL;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"missing fetch request" userInfo:0]);
  return (NSSQLiteStatement *)-[NSSQLiteAdapter newCorrelationInsertStatementForRelationship:]();
}

- (NSSQLiteStatement)newCorrelationInsertStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", 0LL);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareInsertStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    uint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationDeleteStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", 0LL);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareDeleteStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    uint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationMasterReorderStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", 0LL);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareMasterReorderStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    uint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationMasterReorderStatementPart2ForRelationship:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", 0LL);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareMasterReorderStatementPart2ForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    uint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationReorderStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", 0LL);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareReorderStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    uint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (uint64_t)generateCorrelationTableTriggerStatementsForRelationship:(uint64_t)a1 existing:(void *)a2 correlationTableTriggers:(const __CFDictionary *)a3 error:(uint64_t *)a4
{
  uint64_t v6 = a2;
  v47[2] = *MEMORY[0x1895F89C0];
  objc_super v8 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[a2 entity]);
  uint64_t v9 = [v6 name];
  if (!v8 || (uint64_t v10 = [v8[5] objectForKey:v9]) == 0 || (v11 = (__CFString *)v10, !*(void *)(v10 + 64)))
  {
    uint64_t v6 = (void *)[v6 inverseRelationship];
    objc_super v8 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v6 entity]);
    uint64_t v12 = [v6 name];
    if (v8) {
      v11 = (__CFString *)[v8[5] objectForKey:v12];
    }
    else {
      v11 = 0LL;
    }
  }

  if (CFDictionaryGetValue(a3, v6)) {
    return 1LL;
  }
  v42 = a4;
  v13 = (void *)_sqlCoreLookupSQLEntityForEntityDescription( *(void **)(a1 + 8),  (void *)[v6 destinationEntity]);
  v14 = (void *)[v6 inverseRelationship];
  uint64_t v15 = [v6 deleteRule];
  uint64_t v16 = [v14 deleteRule];
  uint64_t v41 = -[__CFString correlationTableName](v11, "correlationTableName");
  if (v15 == 1)
  {
    uint64_t v17 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@ ; ",
            [v13 tableName],
            -[NSSQLManyToMany inverseColumnName](v11),
            0LL);
    uint64_t v18 = *(_BYTE **)(a1 + 8);
    if (v18 && (v18[201] & 4) != 0)
    {
      v19 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:]( v18,  v13,  (uint64_t)v11,  1);
      uint64_t v20 = [objc_alloc(NSString) initWithFormat:@"%@; %@", v19, v17];

      uint64_t v17 = v20;
    }
  }

  else
  {
    if (v15 != 2)
    {
      if (v42)
      {
        uint64_t v23 = *MEMORY[0x189607460];
        v46[0] = @"Reason";
        v46[1] = @"Relationship";
        v47[0] = @"Delete rule is not supported for batch deletes";
        v47[1] = v6;
        uint64_t v24 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v23,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
        uint64_t result = 0LL;
        uint64_t *v42 = v24;
        return result;
      }

      return 0LL;
    }

    uint64_t v17 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"DELETE FROM %@ WHERE Z_PK = OLD.%@ ; ",
            [v13 tableName],
            -[NSSQLManyToMany inverseColumnName](v11),
            0LL);
  }

  if (v16 != 1)
  {
    if (v16 == 2)
    {
      uint64_t v21 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"DELETE FROM %@ WHERE Z_PK = OLD.%@ ; ",
              [v8 tableName],
              -[__CFString columnName](v11, "columnName"),
              0LL);
      goto LABEL_16;
    }

    if (v42)
    {
      uint64_t v33 = *MEMORY[0x189607460];
      v44[0] = @"Reason";
      v44[1] = @"Relationship";
      v45[0] = @"Delete rule is not supported for batch deletes";
      v45[1] = v14;
      uint64_t *v42 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v33,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
    }

    return 0LL;
  }

  uint64_t v21 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@ ; ",
          [v8 tableName],
          -[__CFString columnName](v11, "columnName"),
          0LL);
  v26 = *(_BYTE **)(a1 + 8);
  if (v26)
  {
    uint64_t v22 = v41;
    if ((v26[201] & 4) != 0)
    {
      v27 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:]( v26,  v8,  (uint64_t)v11,  0);
      uint64_t v28 = [objc_alloc(NSString) initWithFormat:@"%@; %@", v27, v21];

      uint64_t v21 = v28;
    }

    goto LABEL_22;
  }

- (uint64_t)generateBatchDeleteUpdateHistoryStatementEntity:(uint64_t)a3 andRelationship:(int)a4 useInverse:
{
  uint64_t v7 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1, "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)[*(id *)(v7 + 40) objectForKey:@"COLUMNS"];
    uint64_t v10 = (void *)[*(id *)(v8 + 40) objectForKey:@"ENTITYPK"];
    v11 = (void *)[*(id *)(v8 + 40) objectForKey:@"ENTITY"];
    v46 = (void *)[*(id *)(v8 + 40) objectForKey:@"CHANGETYPE"];
  }

  else
  {
    v11 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    v46 = 0LL;
  }

  v45 = v10;
  uint64_t v47 = [objc_alloc(NSString) initWithFormat:@"ON CONFLICT(%@, %@) DO UPDATE SET %@ = NSPersistentHistoryBatchDeleteUpdateTriggerDataBlobOperator(%@, excluded.%@)", objc_msgSend(v10, "columnName"), objc_msgSend(v11, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v9, "columnName")];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v12 = (void *)a3, a4))
  {
    if (a3) {
      uint64_t v12 = *(void **)(a3 + 56);
    }
    else {
      uint64_t v12 = 0LL;
    }
  }

  uint64_t v13 = [v12 name];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      if ([*(id *)(a3 + 56) isToMany]
        && *(void *)(a3 + 72)
        && objc_msgSend((id)objc_msgSend((id)a3, "propertyDescription"), "deleteRule") == 1)
      {
        v14 = *(void **)(a3 + 56);
        if (v14) {
          v14 = (void *)[v14 propertyDescription];
        }
        if ([v14 deleteRule] == 1)
        {
          uint64_t v15 = (void *)[objc_alloc(NSString) initWithFormat:@"(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(OLD.%@, '%@'))", objc_msgSend(*(id *)(a3 + 72), "columnName"), v13];
          uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"WHERE OLD.%@ > 0 AND OLD.%@ > 0", objc_msgSend((id)a3, "columnName"), objc_msgSend(*(id *)(a3 + 72), "columnName")];
          id v43 = objc_alloc(NSString);
          uint64_t v42 = -[NSSQLEntity tempTableName](v8);
          if (v8) {
            uint64_t v17 = *(void **)(v8 + 136);
          }
          else {
            uint64_t v17 = 0LL;
          }
          uint64_t v44 = [v17 columnName];
          uint64_t v18 = [v10 columnName];
          uint64_t v19 = [v11 columnName];
          uint64_t v20 = [v46 columnName];
          uint64_t v21 = [v9 columnName];
          if (v8) {
            uint64_t v22 = *(unsigned int *)(v8 + 184);
          }
          else {
            uint64_t v22 = 0LL;
          }
          uint64_t v39 = v21;
          uint64_t v23 = (void *)v47;
          uint64_t v24 = [v43 initWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, OLD.%@, OLD.%@, %ld, %@ %@ %@", v42, v44, v18, v19, v20, v39, v22, objc_msgSend((id)a3, "columnName"), objc_msgSend(*(id *)(a3 + 72), "columnName"), 1, v15, v16, v47];
          goto LABEL_31;
        }
      }
    }

    else
    {
      [0 isToMany];
    }
  }

  uint64_t v15 = (void *)[objc_alloc(NSString) initWithFormat:@"(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(%@.Z_ENT, '%@'))", objc_msgSend(a2, "tableName"), v13];
  id v25 = objc_alloc(NSString);
  uint64_t v26 = [a2 tableName];
  if (a4) {
    v27 = -[NSSQLManyToMany inverseColumnName]((const __CFString *)a3);
  }
  else {
    v27 = (const __CFString *)[(id)a3 columnName];
  }
  uint64_t v16 = (void *)[v25 initWithFormat:@"FROM %@ WHERE Z_PK = OLD.%@", v26, v27];
  id v28 = objc_alloc(NSString);
  uint64_t v29 = -[NSSQLEntity tempTableName](v8);
  if (v8) {
    v30 = *(void **)(v8 + 136);
  }
  else {
    v30 = 0LL;
  }
  uint64_t v31 = [v30 columnName];
  uint64_t v32 = [v45 columnName];
  uint64_t v33 = [v11 columnName];
  uint64_t v34 = [v46 columnName];
  uint64_t v35 = [v9 columnName];
  if (v8) {
    uint64_t v36 = *(unsigned int *)(v8 + 184);
  }
  else {
    uint64_t v36 = 0LL;
  }
  uint64_t v23 = (void *)v47;
  uint64_t v24 = [v28 initWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, Z_PK, Z_ENT, %ld, %@ %@ %@", v29, v31, v32, v33, v34, v35, v36, 1, v15, v16, v47, v40, v41];
LABEL_31:
  uint64_t v37 = v24;

  return v37;
}

- (NSSQLiteStatement)newCreateTableStatementForEntity:(const __CFString *)a1
{
  if (!a1) {
    return 0LL;
  }
  v2 = a2;
  if (!a2 || a2[20]) {
    return 0LL;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CREATE TABLE "];
  objc_msgSend(v5, "appendString:", objc_msgSend(v2, "tableName"));
  objc_msgSend(v5, "appendString:", @"(");
  while (v2)
  {
    uint64_t v6 = v2;
    v2 = (void *)v2[21];
    if (v2 == v6)
    {
      uint64_t v7 = (void *)v6[9];
      goto LABEL_9;
    }
  }

  uint64_t v7 = 0LL;
LABEL_9:
  uint64_t v8 = (void *)[v7 sortedArrayUsingFunction:sortColumnsByType context:0 hint:0];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      uint64_t v12 = (_BYTE *)[v8 objectAtIndex:i];
      if (i) {
        objc_msgSend(v5, "appendString:", @", ");
      }
      [v5 appendFormat:@"%@ %@", objc_msgSend(v12, "columnName"), -[NSSQLiteAdapter typeStringForColumn:](a1, v12)];
    }
  }

  [v5 appendString:@" "]);
  uint64_t v13 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v5);

  return v13;
}

- (NSSQLiteStatement)newCreateTempTableStatementForEntity:(void *)a3 withAttributesToConstrain:
{
  int v3 = 0LL;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    if (*(void *)(a2 + 160))
    {
      return 0LL;
    }

    else
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CREATE TEMP TABLE "];
      [v7 appendString:-[NSSQLEntity tempTableName](a2)];
      uint64_t v34 = v7;
      objc_msgSend(v7, "appendString:", @"(");
      uint64_t v8 = a2;
      uint64_t v32 = a2;
      while (v8)
      {
        uint64_t v9 = v8;
        uint64_t v8 = *(void *)(v8 + 168);
        if (v8 == v9)
        {
          uint64_t v10 = a3;
          v11 = *(void **)(v9 + 72);
          goto LABEL_9;
        }
      }

      uint64_t v10 = a3;
      v11 = 0LL;
LABEL_9:
      uint64_t v12 = (void *)[v11 sortedArrayUsingFunction:sortColumnsByType context:0 hint:0];
      uint64_t v13 = [v12 count];
      if (v13)
      {
        uint64_t v14 = v13;
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          uint64_t v16 = (_WORD *)[v12 objectAtIndex:i];
          if (i) {
            objc_msgSend(v34, "appendString:", @", ");
          }
          if ([v16 propertyType] != 1
            || !v16
            || (uint64_t v17 = @"%@ %@ UNIQUE", (v16[16] & 2) == 0))
          {
            uint64_t v17 = @"%@ %@";
          }

          objc_msgSend( v34,  "appendFormat:",  v17,  objc_msgSend(v16, "columnName"),  -[NSSQLiteAdapter typeStringForColumn:](a1, v16));
        }
      }

      if (!v10) {
        uint64_t v10 = *(void **)(v32 + 216);
      }
      if ([v10 count])
      {
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        uint64_t v18 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          obuint64_t j = v10;
          uint64_t v33 = *(void *)v40;
          do
          {
            for (uint64_t j = 0LL; j != v19; ++j)
            {
              if (*(void *)v40 != v33) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * j);
              uint64_t v22 = objc_msgSend( (id)objc_msgSend(v21, "valueForKey:", @"columnName"),  "componentsJoinedByString:",  @"_");
              uint64_t v23 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithFormat:",  @", CONSTRAINT %@ UNIQUE ("),  v22;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              uint64_t v24 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v36;
                char v27 = 1;
                do
                {
                  for (uint64_t k = 0LL; k != v25; ++k)
                  {
                    if (*(void *)v36 != v26) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v29 = *(void **)(*((void *)&v35 + 1) + 8 * k);
                    if ((v27 & 1) == 0) {
                      objc_msgSend(v23, "appendString:", @", ");
                    }
                    objc_msgSend(v23, "appendString:", objc_msgSend(v29, "columnName"));
                    char v27 = 0;
                  }

                  uint64_t v25 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
                  char v27 = 0;
                }

                while (v25);
              }

              [v23 appendString:@""]);
              [v34 appendString:v23];
            }

            uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
          }

          while (v19);
        }
      }

      else
      {
        [v34 appendString:@" "];
      }

      [v34 appendString:@" "]);
      int v3 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v34);
    }
  }

  return v3;
}

- (NSSQLiteStatement)newCreatePrimaryKeyTableStatement
{
  if (result)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CREATE TABLE "];
    [v1 appendString:@"Z_PRIMARYKEY"];
    objc_msgSend(v1, "appendString:", @" (");
    [v1 appendString:@"Z_ENT"];
    objc_msgSend(v1, "appendString:", @" INTEGER PRIMARY KEY, ");
    [v1 appendString:@"Z_NAME"];
    objc_msgSend(v1, "appendString:", @" VARCHAR, ");
    [v1 appendString:@"Z_SUPER"];
    objc_msgSend(v1, "appendString:", @" INTEGER, ");
    [v1 appendString:@"Z_MAX"];
    [v1 appendString:@" INTEGER"]);
    v2 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v1);

    return v2;
  }

  return result;
}

- (NSSQLiteStatement)newPrimaryKeyInitializeStatementForEntity:(uint64_t)a3 withInitialMaxPK:
{
  if (result)
  {
    id v5 = objc_alloc(NSString);
    if (a2)
    {
      uint64_t v6 = *(unsigned int *)(a2 + 184);
      uint64_t v7 = [(id)a2 name];
      uint64_t v8 = *(void *)(a2 + 160);
      if (v8) {
        uint64_t v8 = *(unsigned int *)(v8 + 184);
      }
    }

    else
    {
      uint64_t v7 = [0 name];
      uint64_t v6 = 0LL;
      uint64_t v8 = 0LL;
    }

    uint64_t v9 = (void *)[v5 initWithFormat:@"INSERT INTO %@(%@, %@, %@, %@) VALUES(%u, '%@', %u, %qd)", @"Z_PRIMARYKEY", @"Z_ENT", @"Z_NAME", @"Z_SUPER", @"Z_MAX", v6, v7, v8, a3];
    uint64_t v10 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v9);

    return v10;
  }

  return result;
}

- (NSSQLiteStatement)newSimplePrimaryKeyUpdateStatementForEntity:(NSSQLiteStatement *)result
{
  if (result)
  {
    v2 = (void *)[objc_alloc(NSString) initWithFormat:@"UPDATE OR FAIL %@ SET %@ = MAX((SELECT %@ FROM %@ WHERE %@ = '%@'), (SELECT CASE WHEN (SELECT COUNT(*) FROM %@)== 0 THEN 0 ELSE (SELECT MAX(%@) FROM %@) END)) WHERE %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_NAME", objc_msgSend(a2, "name"), objc_msgSend(a2, "tableName"), @"Z_PK", objc_msgSend(a2, "tableName"), @"Z_NAME", objc_msgSend(a2, "name")];
    int v3 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v2);

    return v3;
  }

  return result;
}

- (uint64_t)_generateFragmentsForEntity:(void *)a1 inArray:(void *)a2
{
  int v3 = a1;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  obuint64_t j = (id)[a1 manyToManyRelationships];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        if (v3) {
          uint64_t v9 = (void *)v3[20];
        }
        else {
          uint64_t v9 = 0LL;
        }
        if ((objc_msgSend((id)objc_msgSend(v9, "manyToManyRelationships"), "containsObject:", v8) & 1) == 0)
        {
          uint64_t v10 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT CASE WHEN (SELECT COUNT(*) FROM %@) == 0 THEN 0 ELSE (SELECT MAX (%@) FROM %@) END", objc_msgSend(v8, "correlationTableName"), objc_msgSend(v8, "columnName"), objc_msgSend(v8, "correlationTableName")];
          [a2 addObject:v10];
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v5 = v11;
    }

    while (v11);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (v3) {
    int v3 = (void *)v3[19];
  }
  uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLiteAdapter _generateFragmentsForEntity:inArray:](*(void *)(*((void *)&v17 + 1) + 8 * v15++), a2);
      }

      while (v13 != v15);
      uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v13 = result;
    }

    while (result);
  }

  return result;
}

- (NSSQLiteStatement)newComplexPrimaryKeyUpdateStatementForEntity:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int v3 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v4 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT CASE WHEN (SELECT COUNT(*) FROM %@) == 0 THEN 0 ELSE (SELECT MAX (%@) FROM %@) END", objc_msgSend(a2, "tableName"), @"Z_PK", objc_msgSend(a2, "tableName")];
  [v3 addObject:v4];

  -[NSSQLiteAdapter _generateFragmentsForEntity:inArray:](a2, v3);
  if ([v3 count] == 1)
  {
    uint64_t v5 = (void *)[objc_alloc(NSString) initWithFormat:@"MAX((SELECT %@ FROM %@ WHERE %@ = '%@'), (%@))", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_NAME", objc_msgSend(a2, "name"), objc_msgSend(v3, "lastObject")];
  }

  else
  {
    uint64_t v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithFormat:",  @"MAX((SELECT %@ FROM %@ WHERE %@ = '%@'),"),  @"Z_MAX",  @"Z_PRIMARYKEY",  @"Z_NAME",  objc_msgSend(a2, "name");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ((v9 & 1) == 0) {
            objc_msgSend(v5, "appendString:", @", ");
          }
          [v5 appendFormat:@"(%@)", v11];
          char v9 = 0;
        }

        uint64_t v7 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v9 = 0;
      }

      while (v7);
    }

    [v5 appendString:@""]);
  }

  uint64_t v12 = (void *)[objc_alloc(NSString) initWithFormat:@"UPDATE OR FAIL %@ SET %@ = (%@) WHERE %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", v5, @"Z_NAME", objc_msgSend(a2, "name")];

  uint64_t v13 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v12);
  return v13;
}

- (NSSQLiteStatement)newCopyAndInsertStatementForManyToMany:(__CFString *)a3 toManyToMany:(uint64_t)a4 intermediateTableName:(int)a5 invertColumns:
{
  if (result)
  {
    char v9 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"INSERT INTO "];
    objc_msgSend(v9, "appendString:", -[__CFString correlationTableName](a3, "correlationTableName"));
    objc_msgSend(v9, "appendString:", @" (");
    objc_msgSend(v9, "appendString:", -[__CFString columnName](a3, "columnName"));
    objc_msgSend(v9, "appendString:", @", ");
    [v9 appendString:-[NSSQLManyToMany inverseColumnName](a3)];
    if (a3 && (data = a3[2].data) != 0LL)
    {
      objc_msgSend(v9, "appendString:", @", ");
      [v9 appendString:data];
      char v11 = 0;
    }

    else
    {
      char v11 = 1;
    }

    uint64_t v12 = -[NSSQLManyToMany inverseOrderColumnName](a3);
    if (v12)
    {
      objc_msgSend(v9, "appendString:", @", ");
      [v9 appendString:v12];
    }

    [v9 appendString:@" SELECT "]);
    if (a5)
    {
      [v9 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
      objc_msgSend(v9, "appendString:", @", ");
      objc_msgSend(v9, "appendString:", -[__CFString columnName](a2, "columnName"));
      if (v12)
      {
        uint64_t v13 = -[NSSQLManyToMany inverseOrderColumnName](a2);
        objc_msgSend(v9, "appendString:", @", ");
        if (v13)
        {
          uint64_t v14 = v9;
          __int128 v15 = v13;
        }

        else
        {
          __int128 v15 = -[NSSQLManyToMany inverseColumnName](a2);
          uint64_t v14 = v9;
        }

        [v14 appendString:v15];
      }

      if ((v11 & 1) != 0) {
        goto LABEL_31;
      }
      if (!a2)
      {
        objc_msgSend(v9, "appendString:", @", ");
        goto LABEL_21;
      }

      __int128 v19 = (__CFString *)a2[2].data;
      objc_msgSend(v9, "appendString:", @", ");
      if (!v19)
      {
LABEL_21:
        uint64_t v20 = (const __CFString *)-[__CFString columnName](a2, "columnName");
LABEL_29:
        __int128 v22 = v20;
        __int128 v21 = v9;
        goto LABEL_30;
      }

- (NSSQLiteStatement)newDropTableStatementForTableNamed:(NSSQLiteStatement *)result
{
  if (result)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"DROP TABLE IF EXISTS "];
    [v3 appendString:a2];
    uint64_t v4 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v3);

    return v4;
  }

  return result;
}

- (NSSQLiteStatement)newDropTableStatementOrFailForTableNamed:(NSSQLiteStatement *)result
{
  if (result)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"DROP TABLE "];
    [v3 appendString:a2];
    uint64_t v4 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v3);

    return v4;
  }

  return result;
}

- (NSSQLiteStatement)newRenameTableStatementFrom:(uint64_t)a3 to:
{
  if (result)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"ALTER TABLE "];
    [v5 appendString:a2];
    [v5 appendString:@" RENAME TO "];
    [v5 appendString:a3];
    uint64_t v6 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v5);

    return v6;
  }

  return result;
}

- (NSSQLiteStatement)newCreateTableStatementForManyToMany:(NSSQLiteStatement *)result
{
  if (result)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CREATE TABLE "];
    objc_msgSend(v3, "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(v3, "appendString:", @"(");
    uint64_t v4 = -[__CFString columnName](a2, "columnName");
    if (a2) {
      int v5 = 3;
    }
    else {
      int v5 = 0;
    }
    uint64_t v6 = NSSQLiteAdapter_typeStringForSQLType(v5);
    [v3 appendFormat:@"%@ %@", v4, v6];
    objc_msgSend(v3, "appendString:", @", ");
    [v3 appendFormat:@"%@ %@", -[NSSQLManyToMany inverseColumnName](a2), v6];
    if (a2)
    {
      data = a2[2].data;
      if (data)
      {
        objc_msgSend(v3, "appendString:", @", ");
        [v3 appendFormat:@"%@ %@", data, NSSQLiteAdapter_typeStringForSQLType(1)];
      }
    }

    uint64_t v8 = -[NSSQLManyToMany inverseOrderColumnName](a2);
    if (v8)
    {
      char v9 = v8;
      objc_msgSend(v3, "appendString:", @", ");
      [v3 appendFormat:@"%@ %@", v9, NSSQLiteAdapter_typeStringForSQLType(a2 != 0)];
    }

    objc_msgSend(v3, "appendString:", @", PRIMARY KEY (");
    objc_msgSend(v3, "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(v3, "appendString:", @", ");
    [v3 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    [v3 appendString:@"]"));
    uint64_t v10 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v3);

    return v10;
  }

  return result;
}

- (NSSQLiteStatement)newCreateIndexStatementForColumnWithName:(uint64_t)a1 inTableWithName:(uint64_t)a2
{
  uint64_t v4 = (void *)[objc_alloc(NSString) initWithFormat:@"%@_%@_INDEX", a2, a1];
  int v5 = (void *)[objc_alloc(NSString) initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)", v4, a2, a1];

  uint64_t v6 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v5);
  return v6;
}

- (NSSQLiteStatement)newDropIndexStatementForColumn:(NSSQLiteStatement *)result
{
  if (result) {
    return -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:]( result,  [a2 columnName],  objc_msgSend((id)objc_msgSend(a2, "entity"), "tableName"));
  }
  return result;
}

- (NSSQLiteStatement)newDropIndexStatementForColumnWithName:(uint64_t)a3 inTableWithName:
{
  if (result)
  {
    int v3 = (void *)[objc_alloc(NSString) initWithFormat:@"%@_%@_INDEX", a3, a2];
    uint64_t v4 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP INDEX IF EXISTS %@", v3];

    int v5 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v4);
    return v5;
  }

  return result;
}

- (uint64_t)generateBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:
{
  id v4 = -[NSSQLIndex initForIndexDescription:sqlEntity:]( objc_alloc(&OBJC_CLASS___NSSQLBinaryIndex),  "initForIndexDescription:sqlEntity:",  a2,  a3);
  uint64_t v5 = [v4 generateStatementsForStore:*(void *)(a1 + 8)];

  return v5;
}

- (uint64_t)generateDropBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:
{
  id v4 = -[NSSQLIndex initForIndexDescription:sqlEntity:]( objc_alloc(&OBJC_CLASS___NSSQLBinaryIndex),  "initForIndexDescription:sqlEntity:",  a2,  a3);
  uint64_t v5 = [v4 dropStatementsForStore:*(void *)(a1 + 8)];

  return v5;
}

- (id)newCreateIndexStatementsForEntity:(char)a3 defaultIndicesOnly:
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int v3 = (void *)a2;
  if (!a2)
  {
    id v74 = objc_alloc_init(MEMORY[0x189603FA8]);
    goto LABEL_4;
  }

  uint64_t v4 = *(void *)(a2 + 160);
  id v74 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v4)
  {
LABEL_4:
    char v70 = 0;
    goto LABEL_18;
  }

  while (v3)
  {
    uint64_t v5 = v3;
    int v3 = (void *)v3[21];
    if (v3 == v5)
    {
      uint64_t v6 = (void *)v5[9];
      goto LABEL_8;
    }
  }

  uint64_t v6 = 0LL;
LABEL_8:
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v91;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v91 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        char v11 = (void *)MEMORY[0x186E3E5D8]();
        if ([v10 propertyType] == 3)
        {
          uint64_t v12 = -[NSSQLiteAdapter newCreateIndexStatementForColumnWithName:inTableWithName:]( [v10 columnName],  objc_msgSend((id)objc_msgSend(v10, "entity"), "tableName"));
          [v74 addObject:v12];
        }

        objc_autoreleasePoolPop(v11);
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v90 objects:v97 count:16];
    }

    while (v7);
  }

  char v70 = 1;
  int v3 = (void *)a2;
LABEL_18:
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  uint64_t v13 = (void *)[v3 manyToManyRelationships];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v14)
  {
    uint64_t v75 = *(void *)v87;
    obuint64_t j = v13;
    do
    {
      uint64_t v76 = v14;
      for (uint64_t j = 0LL; j != v76; ++j)
      {
        if (*(void *)v87 != v75) {
          objc_enumerationMutation(obj);
        }
        __int128 v16 = *(__CFString **)(*((void *)&v86 + 1) + 8 * j);
        __int128 v17 = (void *)MEMORY[0x186E3E5D8]();
        if (v16)
        {
          if (v16[2].isa)
          {
            if (-[__CFString entity](v16, "entity") == a2)
            {
              if (v16[2].isa)
              {
                __int128 v41 = (void *)[objc_alloc(NSString) initWithFormat:@"%@_%@_INDEX", -[__CFString correlationTableName](v16, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v16)];
                __int128 v42 = (void *)[objc_alloc(NSString) initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@)", v41, -[__CFString correlationTableName](v16, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v16), -[__CFString columnName](v16, "columnName")];

                id v43 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v42);
                if (v43)
                {
                  [v74 addObject:v43];
                }
              }
            }
          }

          if (objc_msgSend( (id)-[__CFString propertyDescription](v16, "propertyDescription"),  "isOrdered"))
          {
            if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)-[__CFString propertyDescription](v16, "propertyDescription"),  "userInfo"),  "objectForKey:",  @"NSRelationshipDescriptionOrderKeyIndexOption"),  "BOOLValue"))
            {
              id v18 = objc_alloc(NSString);
              uint64_t v19 = -[__CFString correlationTableName](v16, "correlationTableName");
              uint64_t v20 = -[__CFString columnName](v16, "columnName");
              __int128 v21 = -[NSSQLManyToMany inverseColumnName](v16);
              __int128 v22 = (void *)[v18 initWithFormat:@"%@_%@_%@_%@_INDEX", v19, v20, v21, -[NSSQLManyToMany inverseOrderColumnName](v16)];
              id v23 = objc_alloc(NSString);
              uint64_t v24 = -[__CFString correlationTableName](v16, "correlationTableName");
              uint64_t v25 = -[__CFString columnName](v16, "columnName");
              uint64_t v26 = -[NSSQLManyToMany inverseColumnName](v16);
              uint64_t v27 = (void *)[v23 initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@, %@)", v22, v24, v25, v26, -[NSSQLManyToMany inverseOrderColumnName](v16)];
              id v28 = objc_alloc(NSString);
              uint64_t v29 = -[__CFString correlationTableName](v16, "correlationTableName");
              uint64_t v30 = -[__CFString columnName](v16, "columnName");
              uint64_t v31 = -[NSSQLManyToMany inverseOrderColumnName](v16);
              uint64_t v32 = (void *)[v28 initWithFormat:@"%@_%@_%@_%@_INDEX", v29, v30, v31, -[NSSQLManyToMany inverseColumnName](v16)];
              id v33 = objc_alloc(NSString);
              uint64_t v34 = -[__CFString correlationTableName](v16, "correlationTableName");
              uint64_t v35 = -[__CFString columnName](v16, "columnName");
              __int128 v36 = -[NSSQLManyToMany inverseOrderColumnName](v16);
              __int128 v37 = (void *)[v33 initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@, %@)", v32, v34, v35, v36, -[NSSQLManyToMany inverseColumnName](v16)];
              __int128 v38 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v27);
              __int128 v39 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v37);
              __int128 v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v38, v39, 0);

              if (v40)
              {
                [v74 addObjectsFromArray:v40];
              }
            }
          }
        }

        objc_autoreleasePoolPop(v17);
      }

      uint64_t v14 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
    }

    while (v14);
  }

  char v44 = v70 ^ 1;
  if (!a2) {
    char v44 = 1;
  }
  if ((v44 & 1) == 0)
  {
    uint64_t v45 = *(void **)(a2 + 152);
    if (v45)
    {
      if ([v45 count])
      {
        v46 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)a2, "entityDescription"), "userInfo"),  "objectForKey:",  @"_NSEntityOmitSubentityColumnIndex");
        uint64_t v47 = v46;
        if (!v46
          || ![v46 isNSString]
          || (v48 = (void *)[v47 lowercaseString], (v49 = v48) == 0)
          || ([v48 isEqualToString:@"yes"] & 1) == 0
          && ([v49 isEqualToString:@"1"] & 1) == 0)
        {
          v50 = -[NSSQLiteAdapter newCreateIndexStatementForColumnWithName:inTableWithName:]( [*(id *)(a2 + 136) columnName],  objc_msgSend((id)objc_msgSend(*(id *)(a2 + 136), "entity"), "tableName"));
          [v74 addObject:v50];
        }
      }
    }
  }

  if ((a3 & 1) == 0)
  {
    v51 = (void *)[(id)a2 entityDescription];
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    v52 = (void *)[v51 indexes];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:v95 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v83;
      do
      {
        uint64_t v55 = 0LL;
        do
        {
          if (*(void *)v83 != v54) {
            objc_enumerationMutation(v52);
          }
          v56 = *(void **)(*((void *)&v82 + 1) + 8 * v55);
          v57 = (void *)MEMORY[0x186E3E5D8]();
          if (objc_msgSend((id)objc_msgSend(v56, "elements"), "count"))
          {
            uint64_t v58 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v56, "elements"), "firstObject"), "collationType");
            if (v58 == 1)
            {
              if (a2) {
                v60 = (void *)objc_msgSend(*(id *)(a2 + 232), "objectForKey:", objc_msgSend(v56, "name"));
              }
              else {
                v60 = 0LL;
              }
              uint64_t v59 = [v60 generateStatementsForStore:*(void *)(a1 + 8)];
            }

            else
            {
              if (v58) {
                goto LABEL_62;
              }
              uint64_t v59 = -[NSSQLiteAdapter generateBinaryIndexStatementsForIndex:onEntity:](a1, (uint64_t)v56, a2);
            }

            if (v59) {
              [v74 addObjectsFromArray:v59];
            }
          }

- (id)newDropIndexStatementsForEntity:(char)a3 defaultIndicesOnly:
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!a2)
  {
    id v48 = objc_alloc_init(MEMORY[0x189603FA8]);
    goto LABEL_4;
  }

  uint64_t v5 = *(void *)(a2 + 160);
  id v48 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v5)
  {
LABEL_4:
    char v46 = 0;
    goto LABEL_19;
  }

  uint64_t v6 = a2;
  while (v6)
  {
    uint64_t v7 = v6;
    uint64_t v6 = *(void *)(v6 + 168);
    if (v6 == v7)
    {
      uint64_t v8 = *(void **)(v7 + 72);
      goto LABEL_9;
    }
  }

  uint64_t v8 = 0LL;
LABEL_9:
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v62;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([v12 propertyType] == 3)
        {
          uint64_t v13 = -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:]( a1,  [v12 columnName],  objc_msgSend((id)objc_msgSend(v12, "entity"), "tableName"));
          [v48 addObject:v13];
        }
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }

    while (v9);
  }

  char v46 = 1;
LABEL_19:
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  uint64_t v14 = (void *)[(id)a2 manyToManyRelationships];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v58;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v58 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(__CFString **)(*((void *)&v57 + 1) + 8 * v17);
        if (v18)
        {
          if (v18[2].isa)
          {
            if ([*(id *)(*((void *)&v57 + 1) + 8 * v17) entity] == a2)
            {
              if (v18[2].isa)
              {
                uint64_t v19 = (void *)[objc_alloc(NSString) initWithFormat:@"%@_%@_INDEX", -[__CFString correlationTableName](v18, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v18)];
                uint64_t v20 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP INDEX IF EXISTS %@", v19];

                __int128 v21 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v20);
                if (v21)
                {
                  [v48 addObject:v21];
                }
              }
            }
          }
        }

        ++v17;
      }

      while (v15 != v17);
      uint64_t v22 = [v14 countByEnumeratingWithState:&v57 objects:v67 count:16];
      uint64_t v15 = v22;
    }

    while (v22);
  }

  char v23 = v46 ^ 1;
  if (!a2) {
    char v23 = 1;
  }
  if ((v23 & 1) == 0)
  {
    uint64_t v24 = *(void **)(a2 + 152);
    if (v24)
    {
      if ([v24 count])
      {
        uint64_t v25 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)a2, "entityDescription"), "userInfo"),  "objectForKey:",  @"_NSEntityOmitSubentityColumnIndex");
        uint64_t v26 = v25;
        if (!v25
          || ![v25 isNSString]
          || (v27 = (void *)[v26 lowercaseString], (id v28 = v27) == 0)
          || ([v27 isEqualToString:@"yes"] & 1) == 0
          && ([v28 isEqualToString:@"1"] & 1) == 0)
        {
          uint64_t v29 = -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:]( a1,  [*(id *)(a2 + 136) columnName],  objc_msgSend((id)objc_msgSend(*(id *)(a2 + 136), "entity"), "tableName"));
          [v48 addObject:v29];
        }
      }
    }
  }

  if ((a3 & 1) == 0)
  {
    uint64_t v30 = (void *)[(id)a2 entityDescription];
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v31 = (void *)[v30 indexes];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v54;
      do
      {
        uint64_t v34 = 0LL;
        do
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v31);
          }
          uint64_t v35 = *(void **)(*((void *)&v53 + 1) + 8 * v34);
          if (objc_msgSend((id)objc_msgSend(v35, "elements"), "count"))
          {
            uint64_t v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "elements"), "firstObject"), "collationType");
            if (v36 == 1)
            {
              if (a2) {
                __int128 v38 = (void *)objc_msgSend(*(id *)(a2 + 232), "objectForKey:", objc_msgSend(v35, "name"));
              }
              else {
                __int128 v38 = 0LL;
              }
              uint64_t v37 = [v38 dropStatementsForStore:a1->_entity];
            }

            else
            {
              if (v36) {
                goto LABEL_59;
              }
              uint64_t v37 = -[NSSQLiteAdapter generateDropBinaryIndexStatementsForIndex:onEntity:]( (uint64_t)a1,  (uint64_t)v35,  a2);
            }

            if (v37) {
              [v48 addObjectsFromArray:v37];
            }
          }

- (void)newCreateTriggersForEntity:(void *)a3 existingRtreeTables:
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v4 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "attributesByName"),  "allValues");
    uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v36;
      uint64_t v30 = v4;
      uint64_t v31 = a2;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v36 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
          if ([v8 _propertyType] != 6)
          {
            if (objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", @"NSTriggerKey"))
            {
              uint64_t v9 = [v8 name];
              if (a2) {
                uint64_t v10 = (void *)[a2[5] objectForKey:v9];
              }
              else {
                uint64_t v10 = 0LL;
              }
              uint64_t v43 = 0LL;
              uint64_t v45 = 0LL;
              char v46 = &v45;
              uint64_t v47 = 0x3052000000LL;
              id v48 = __Block_byref_object_copy__324;
              __int128 v49 = __Block_byref_object_dispose__325;
              uint64_t v50 = 0LL;
              char v11 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v10,  &v43);
              uint64_t v12 = v11;
              if (v11)
              {
                if ([v11 count])
                {
                  *(void *)&__int128 v39 = MEMORY[0x1895F87A8];
                  *((void *)&v39 + 1) = 3221225472LL;
                  *(void *)&__int128 v40 = __72__NSSQLiteAdapter_createSQLStatementsForTriggerAttribute_withSQLEntity___block_invoke;
                  *((void *)&v40 + 1) = &unk_189EAA140;
                  *(void *)&__int128 v41 = &v45;
                  [v12 enumerateObjectsUsingBlock:&v39];
                }

                else
                {
                  id v20 = objc_alloc_init(MEMORY[0x189603F18]);
                  v46[5] = (uint64_t)v20;
                }
              }

              if (!v46[5])
              {
                id v22 = objc_alloc_init(MEMORY[0x189603FC8]);
                char v23 = v22;
                if (v43) {
                  [v22 setObject:v43 forKey:*MEMORY[0x189607798]];
                }
                id v24 = (id)[v23 copy];

                id v25 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134060LL,  (uint64_t)@"Invalid trigger configuration.",  v24);
                objc_exception_throw(v25);
                goto LABEL_49;
              }

              id v14 = (id)v46[5];
              _Block_object_dispose(&v45, 8);
              if (v14) {
                goto LABEL_34;
              }
              goto LABEL_35;
            }

            if (![v8 attributeType]
              && objc_msgSend( (id)objc_msgSend(v8, "userInfo"),  "objectForKey:",  @"_NSLocationAttributeDerivedComponents"))
            {
              uint64_t v43 = 0LL;
              uint64_t v13 = objc_msgSend( (id)objc_msgSend(v8, "userInfo"),  "objectForKey:",  @"_NSLocationAttributeDerivedComponents");
              if (!v13) {
                goto LABEL_45;
              }
              uint64_t v33 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]( [NSSQLLocationAttributeRTreeExtension alloc],  "initWithObjectFromUserInfo:onAttributeNamed:onEntity:",  v13,  [v8 name],  a2);
              if (!v33 || ([a3 containsObject:v33->_rtreeTableName] & 1) != 0)
              {

LABEL_45:
                id v26 = objc_alloc_init(MEMORY[0x189603FC8]);
                uint64_t v27 = v26;
                if (v43) {
                  [v26 setObject:v43 forKey:*MEMORY[0x189607798]];
                }
                id v28 = (id)[v27 copy];

                id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134060LL,  (uint64_t)@"Invalid location index configuration.",  v28);
                objc_exception_throw(v29);
LABEL_49:
                __break(1u);
                return;
              }

              id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
              if (-[NSSQLLocationAttributeRTreeExtension validate:](v33, "validate:", &v43))
              {
                __int128 v41 = 0u;
                __int128 v42 = 0u;
                __int128 v39 = 0u;
                __int128 v40 = 0u;
                uint64_t v15 = -[NSSQLLocationAttributeRTreeExtension insertSQLStrings](v33, "insertSQLStrings");
                uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v39,  &v45,  16LL);
                if (v16)
                {
                  uint64_t v17 = *(void *)v40;
                  do
                  {
                    for (uint64_t i = 0LL; i != v16; ++i)
                    {
                      if (*(void *)v40 != v17) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v19 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  *(void *)(*((void *)&v39 + 1) + 8 * i));
                      if (v19) {
                        [v14 addObject:v19];
                      }
                    }

                    uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v39,  &v45,  16LL);
                  }

                  while (v16);
                }
              }

              uint64_t v4 = v30;
              a2 = v31;
              if (!v14) {
                goto LABEL_45;
              }
LABEL_34:
              [v34 addObjectsFromArray:v14];
LABEL_35:
            }
          }

          ++v7;
        }

        while (v7 != v5);
        uint64_t v21 = [v4 countByEnumeratingWithState:&v35 objects:v44 count:16];
        uint64_t v5 = v21;
      }

      while (v21);
    }
  }

- (uint64_t)generateTriggerForEntity:(const __CFDictionary *)a3 alreadyCreated:(const __CFDictionary *)a4 correlations:(const __CFDictionary *)a5 batchHistory:(void *)a6 fragments:(uint64_t *)a7 error:
{
  uint64_t v155 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 120) & 4) != 0)
    {
      id v14 = *(void **)(a2 + 72);
    }

    else
    {
      uint64_t v13 = (void *)a2;
      do
      {
        id v14 = v13;
        uint64_t v13 = (void *)[v13 superentity];
      }

      while (v13);
    }
  }

  else
  {
    id v14 = 0LL;
  }

  CFDictionarySetValue(a3, (const void *)a2, (const void *)[MEMORY[0x189603FE8] null]);
  v122 = a6;
  if (a6) {
    id v16 = a6;
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
  }
  v124 = v16;
  v133 = (void *)objc_msgSend((id)objc_msgSend((id)a2, "superentity"), "relationshipsByName");
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  v123 = (void *)a2;
  uint64_t v17 = (void *)objc_msgSend((id)objc_msgSend((id)a2, "relationshipsByName"), "allValues");
  uint64_t v18 = [v17 countByEnumeratingWithState:&v139 objects:v144 count:16];
  v126 = a5;
  theDict = a3;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v134 = *(void *)v140;
    uint64_t v131 = a1;
    v127 = a7;
    v129 = v17;
    do
    {
      uint64_t v20 = 0LL;
      uint64_t v125 = v19;
      do
      {
        if (*(void *)v140 != v134) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void **)(*((void *)&v139 + 1) + 8 * v20);
        if (([v21 isTransient] & 1) == 0
          && !objc_msgSend(v133, "objectForKey:", objc_msgSend(v21, "name")))
        {
          id v22 = (void *)[v21 entity];
          char v23 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), v22);
          if (!v23
            || ((id v24 = v23,
                 uint64_t v25 = [v23 model],
                 uint64_t v26 = [*(id *)(a1 + 8) model],
                 uint64_t v27 = [v22 managedObjectModel],
                 uint64_t v28 = [*(id *)(a1 + 8) configurationName],
                 !v27)
             || (objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(v27 + 24) + 24), "objectForKey:", v28),  "containsObject:",  objc_msgSend(v22, "name")) & 1) == 0)
            && v25 == v26)
          {
            __int128 v93 = v127;
            if (v127)
            {
              v94 = (void *)MEMORY[0x189607870];
              uint64_t v95 = *MEMORY[0x189607460];
              *(void *)&__int128 v151 = @"Reason";
              v150[0] = [NSString stringWithFormat:@"Entity named:%@ not found for relationship named:%@", objc_msgSend(v22, "name"), objc_msgSend(v21, "name")];
              *((void *)&v151 + 1) = @"MissingEntity";
              v150[1] = [NSString stringWithFormat:@"%@.%@", objc_msgSend(v22, "name"), v22];
              *(void *)&__int128 v152 = @"Relationship";
              v150[2] = [NSString stringWithFormat:@"Name: %@ Destination Entity:%@", objc_msgSend(v21, "name"), objc_msgSend((id)objc_msgSend(v21, "destinationEntity"), "name")];
              v96 = (void *)MEMORY[0x189603F68];
              v97 = v150;
              uint64_t v98 = &v151;
              goto LABEL_134;
            }

- (void)generateBatchDeleteUpdateHistoryTriggerForEntity:(void *)a1 andRelationship:(void *)a2 batchHistory:(void *)a3 error:(const __CFDictionary *)a4
{
  uint64_t v5 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1, "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)[*(id *)(v5 + 40) objectForKey:@"COLUMNS"];
    uint64_t v8 = (void *)[*(id *)(v6 + 40) objectForKey:@"ENTITYPK"];
    uint64_t v9 = (void *)[*(id *)(v6 + 40) objectForKey:@"ENTITY"];
    uint64_t v33 = (void *)[*(id *)(v6 + 40) objectForKey:@"CHANGETYPE"];
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v33 = 0LL;
  }

  __int128 v35 = a3;
  uint64_t v38 = (void *)[objc_alloc(NSString) initWithFormat:@"(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(Z_ENT, '%@'))", objc_msgSend(a3, "name")];
  uint64_t v34 = v9;
  uint64_t v10 = (void *)[objc_alloc(NSString) initWithFormat:@"ON CONFLICT(%@, %@) DO UPDATE SET %@ = NSPersistentHistoryBatchDeleteUpdateTriggerDataBlobOperator(%@, excluded.%@)", objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v7, "columnName"), objc_msgSend(v7, "columnName"), objc_msgSend(v7, "columnName")];
  char v11 = (void *)[objc_alloc(NSString) initWithFormat:@"FROM %@ WHERE Z_PK = OLD.Z_PK", objc_msgSend(a2, "tableName")];
  id v12 = objc_alloc(NSString);
  uint64_t v13 = -[NSSQLEntity tempTableName](v6);
  if (v6) {
    id v14 = *(void **)(v6 + 136);
  }
  else {
    id v14 = 0LL;
  }
  uint64_t v15 = [v14 columnName];
  uint64_t v16 = [v8 columnName];
  uint64_t v17 = [v34 columnName];
  uint64_t v18 = [v33 columnName];
  uint64_t v19 = [v7 columnName];
  if (v6) {
    uint64_t v20 = *(unsigned int *)(v6 + 184);
  }
  else {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = (void *)objc_msgSend( v12,  "initWithFormat:",  @"INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, Z_PK, Z_ENT, %ld, %@ %@ %@;",
                  v13,
                  v15,
                  v16,
                  v17,
                  v18,
                  v19,
                  v20,
                  1LL,
                  v38,
                  v11,
                  v10);

  id v22 = (NSString *)[NSString stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_%@_HISTORYBATCHDELETEUPDATE_TRIGGER AFTER UPDATE OF %@ ON %@ FOR EACH ROW BEGIN %@ END", objc_msgSend(a2, "tableName"), objc_msgSend(v35, "columnName"), objc_msgSend(v35, "columnName"), objc_msgSend(a2, "tableName"), v21];
  char v23 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", a2);
  id v24 = v23;
  if (v23)
  {
    sqlString = v23->_sqlString;
    if (sqlString != v22)
    {

      v24->_sqlString = (NSString *)-[NSString copy](v22, "copy");
    }
  }

  uint64_t v26 = (NSString *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS ZQ_%@_%@_HISTORYBATCHDELETEUPDATE_TRIGGER", objc_msgSend(a2, "tableName"), objc_msgSend(v35, "columnName")];
  uint64_t v27 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", a2);
  uint64_t v39 = v27;
  if (v27)
  {
    uint64_t v28 = v27->_sqlString;
    if (v28 != v26)
    {

      v39->_sqlString = (NSString *)-[NSString copy](v26, "copy");
    }
  }

  uint64_t v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v24, v39, 0);
  uint64_t v30 = (const void *)[NSString stringWithFormat:@"%@-%@", objc_msgSend(a2, "name"), objc_msgSend(v35, "name")];
  Value = (void *)CFDictionaryGetValue(a4, v30);
  uint64_t v32 = [MEMORY[0x189603FE8] null];
  else {
    [Value addObjectsFromArray:v29];
  }
}

uint64_t __88__NSSQLiteAdapter_generateTriggerStatementsForEntity_usingRelationshipCleanupSQL_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "firstObject"), "compare:", objc_msgSend(a3, "firstObject"));
}

- (uint64_t)generateDeleteHistoryTriggerForEntity:(uint64_t)a1 error:(void *)a2
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  uint64_t v3 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), a2);
  uint64_t v48 = [(id)v3 tableName];
  if (v3)
  {
    uint64_t v50 = [*(id *)(v3 + 136) columnName];
    uint64_t v4 = *(void **)(v3 + 128);
  }

  else
  {
    uint64_t v50 = [0 columnName];
    uint64_t v4 = 0LL;
  }

  uint64_t v47 = [v4 columnName];
  uint64_t v49 = v3;
  uint64_t v5 = (void *)+[_PFPersistentHistoryModel _tombstonesColumnsForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v3);
  uint64_t v6 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 8), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[*(id *)(v6 + 40) objectForKey:@"ENTITYPK"];
    uint64_t v9 = (void *)[*(id *)(v7 + 40) objectForKey:@"ENTITY"];
    uint64_t v10 = (void *)[*(id *)(v7 + 40) objectForKey:@"CHANGETYPE"];
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = [objc_alloc(MEMORY[0x189607940]) initWithFormat:@"INSERT OR REPLACE INTO %@ ", -[NSSQLEntity tempTableName](v7)];
  id v12 = objc_alloc(MEMORY[0x189607940]);
  uint64_t v46 = (void *)v11;
  if (v7) {
    uint64_t v13 = *(void **)(v7 + 136);
  }
  else {
    uint64_t v13 = 0LL;
  }
  id v14 = (void *)[v12 initWithFormat:@"%@, %@, %@, %@", objc_msgSend(v13, "columnName"), objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v10, "columnName")];
  uint64_t v62 = 0LL;
  __int128 v63 = &v62;
  uint64_t v64 = 0x2020000000LL;
  uint64_t v65 = 0LL;
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ([v5 count])
  {
    uint64_t v16 = [v5 count];
    v63[3] = v16;
    if (v49) {
      uint64_t v17 = *(unsigned int *)(v49 + 184);
    }
    else {
      uint64_t v17 = 0LL;
    }
    [v15 setObject:v5, objc_msgSend(NSString, "stringWithFormat:", @"%d", v17) forKey];
  }

  v61[0] = 0LL;
  v61[1] = v61;
  v61[2] = 0x3052000000LL;
  v61[3] = __Block_byref_object_copy__27;
  v61[4] = __Block_byref_object_dispose__27;
  v60[0] = MEMORY[0x1895F87A8];
  v60[1] = 3221225472LL;
  v60[2] = __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke;
  v60[3] = &unk_189EAA0F0;
  v60[4] = v15;
  v60[5] = &v62;
  v60[6] = v61;
  v61[5] = v60;
  __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke((uint64_t)v60, v49);
  if (v63[3])
  {
    unsigned int v18 = 1;
    do
      [v14 appendFormat:@", Z%@%u", @"TOMBSTONE", v18 - 1];
    while (v63[3] > (unint64_t)v18++);
  }

  id v20 = objc_alloc(MEMORY[0x189607940]);
  if (v7) {
    uint64_t v21 = *(unsigned int *)(v7 + 184);
  }
  else {
    uint64_t v21 = 0LL;
  }
  id v22 = (void *)[v20 initWithFormat:@"SELECT %d, %@, %@, %ld", v21, v47, v50, 2];
  if (v63[3])
  {
    uint64_t v23 = [v5 count];
    uint64_t v24 = v63[3];
    if (v23 == v24)
    {
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      uint64_t v25 = [v5 countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v57;
        do
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            if (*(void *)v57 != v26) {
              objc_enumerationMutation(v5);
            }
            [v22 appendFormat:@", OLD.%@", *(void *)(*((void *)&v56 + 1) + 8 * i)];
          }

          uint64_t v25 = [v5 countByEnumeratingWithState:&v56 objects:v67 count:16];
        }

        while (v25);
      }
    }

    else if (v24)
    {
      unint64_t v28 = 0LL;
      int v29 = 0;
      do
      {
        int v51 = v29;
        [v22 appendFormat:@", CASE %@ ", v50];
        uint64_t v30 = v14;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        uint64_t v31 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v53;
          do
          {
            for (uint64_t j = 0LL; j != v31; ++j)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(v15);
              }
              uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 8 * j);
              __int128 v35 = (void *)[v15 objectForKey:v34];
              if ([v35 count] > v28) {
                [v22 appendFormat:@"WHEN %@ THEN (SELECT %@) ", v34, objc_msgSend(v35, "objectAtIndexedSubscript:", v28)];
              }
            }

            uint64_t v31 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
          }

          while (v31);
        }

        [v22 appendFormat:@"ELSE NULL "];
        id v14 = v30;
        [v22 appendFormat:@"END "];
        unint64_t v28 = (v51 + 1);
        int v29 = v51 + 1;
      }

      while (v63[3] > v28);
    }
  }

  [v46 appendFormat:@"(%@) %@ FROM %@ WHERE %@ = OLD.%@;", v14, v22, v48, v47, v47];

  uint64_t v36 = (NSString *)[NSString stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_HISTORYBATCHDELETE_TRIGGER BEFORE DELETE ON %@ FOR EACH ROW BEGIN %@ END", v48, v48, v46];
  int v37 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", v49);
  uint64_t v38 = v37;
  if (v37)
  {
    sqlString = v37->_sqlString;
    if (sqlString != v36)
    {

      v38->_sqlString = (NSString *)-[NSString copy](v36, "copy");
    }
  }

  uint64_t v40 = (NSString *)[NSString stringWithFormat:@"DROP TRIGGER IF EXISTS ZQ_%@_HISTORYBATCHDELETE_TRIGGER", v48];
  uint64_t v41 = -[NSSQLiteStatement initWithEntity:](objc_alloc(&OBJC_CLASS___NSSQLiteStatement), "initWithEntity:", v49);
  id v42 = v41;
  if (v41)
  {
    uint64_t v43 = v41->_sqlString;
    if (v43 != v40)
    {

      v42->_sqlString = (NSString *)-[NSString copy](v40, "copy");
    }
  }

  uint64_t v44 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithObjects:", v38, v42, 0);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(&v62, 8);
  return v44;
}

uint64_t __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)+[_PFPersistentHistoryModel _tombstonesColumnsForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  a2);
  if ([v4 count])
  {
    uint64_t v5 = v2 ? *(unsigned int *)(v2 + 184) : 0LL;
    [*(id *)(a1 + 32) setObject:v4, objc_msgSend(NSString, "stringWithFormat:", @"%d", v5) forKey];
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  if (v2) {
    uint64_t v2 = *(void *)(v2 + 152);
  }
  uint64_t result = [(id)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation((id)v2);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [(id)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

uint64_t __82__NSSQLiteAdapter__generateExternalDataRefStatementsForEntities_inRequestContext___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t result = -[NSEntityDescription _hasAttributesWithExternalDataReferences](a2);
  if ((_DWORD)result)
  {
    uint64_t v4 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(*(void *)(a1 + 32) + 8LL), v2);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t result = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (result)
    {
      uint64_t v5 = result;
      unint64_t v6 = 0x189607000uLL;
      uint64_t v7 = *(void *)v22;
      uint64_t v18 = *(void *)v22;
      uint64_t v19 = v2;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          if ([v9 _propertyType] == 2 && objc_msgSend(v9, "storesBinaryDataExternally"))
          {
            uint64_t v10 = [v9 name];
            if (v4) {
              __int128 v11 = (void *)[*(id *)(v4 + 40) objectForKey:v10];
            }
            else {
              __int128 v11 = 0LL;
            }
            uint64_t v12 = objc_msgSend((id)objc_msgSend((id)v4, "rootEntity"), "tableName");
            if (v4 && !*(void *)(v4 + 160)) {
              __int128 v13 = &stru_189EAC2E8;
            }
            else {
              __int128 v13 = (const __CFString *)[*(id *)(v6 + 2600) stringWithFormat:@"_%@", objc_msgSend((id)v4, "name")];
            }
            unint64_t v14 = v6;
            uint64_t v15 = [v11 columnName];
            uint64_t v16 = -[NSSQLiteStatement initWithEntity:sqlString:]( [NSSQLiteStatement alloc],  "initWithEntity:sqlString:",  v4,  objc_msgSend( *(id *)(v6 + 2600),  "stringWithFormat:",  @"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_EDR_%@_%@%@ BEFORE DELETE ON %@ FOR EACH ROW WHEN OLD.%@ IS NOT NULL BEGIN INSERT INTO %@ VALUES (OLD.%@); END",
                      v12,
                      v15,
                      v13,
                      v12,
                      v15,
                      *(void *)(a1 + 40),
                      v15));
            [*(id *)(a1 + 48) addObject:v16];

            uint64_t v17 = -[NSSQLiteStatement initWithEntity:sqlString:]( [NSSQLiteStatement alloc],  "initWithEntity:sqlString:",  v4,  [*(id *)(v14 + 2600) stringWithFormat:@"DROP TRIGGER IF EXISTS ZQ_EDR_%@_%@%@", v12, v15, v13]);
            [*(id *)(a1 + 56) addObject:v17];

            unint64_t v6 = v14;
            uint64_t v7 = v18;
            uint64_t v2 = v19;
          }

          ++v8;
        }

        while (v5 != v8);
        uint64_t result = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v5 = result;
      }

      while (result);
    }
  }

  return result;
}

- (uint64_t)generateDeleteStatementsForRequest:(uint64_t *)a3 error:
{
  v128[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  unint64_t v6 = (void *)[(id)a2 request];
  uint64_t v7 = (void *)-[NSSQLBatchDeleteRequestContext fetchRequestForObjectsToDelete](a2);
  uint64_t v8 = [v6 resultType];
  uint64_t v9 = v8;
  if (a2)
  {
    if (v8 == 1)
    {
      uint64_t v10 = *(void **)(a2 + 112);
      if (v10)
      {
        if (![v10 count]) {
          return NSArray_EmptyArray;
        }
        [v7 setPredicate:objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"SELF IN %@", *(void *)(a2 + 112))];
        [v7 setSortDescriptors:0];
        [v7 setFetchOffset:0];
        goto LABEL_7;
      }

      goto LABEL_124;
    }
  }

  else if (v8 == 1)
  {
LABEL_124:
    if (a3)
    {
      id v20 = 0LL;
      *a3 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03E00];
      return (uint64_t)v20;
    }

    return 0LL;
  }

- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(void *)a3 inToMany:
{
  if (result)
  {
    uint64_t v5 = [a3 sourceEntity];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(unsigned int *)(v5 + 184);
      uint64_t v8 = (void *)[a3 destinationEntity];
      uint64_t v9 = *(void **)(v6 + 152);
    }

    else
    {
      uint64_t v8 = (void *)[a3 destinationEntity];
      uint64_t v7 = 0LL;
      uint64_t v9 = 0LL;
    }

    uint64_t v10 = [v9 count];
    if (a3) {
      uint64_t v11 = (void *)a3[7];
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "foreignKey"), "columnName");
    if (v10)
    {
      if (v11) {
        __int128 v13 = (void *)v11[9];
      }
      else {
        __int128 v13 = 0LL;
      }
      uint64_t v14 = [v13 columnName];
    }

    else
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v7);
    }

    uint64_t v15 = v14;
    if (v11) {
      uint64_t v16 = (void *)v11[10];
    }
    else {
      uint64_t v16 = 0LL;
    }
    uint64_t v17 = [v16 columnName];
    uint64_t v18 = [v8 tableName];
    uint64_t v19 = (void *)[objc_alloc(NSString) initWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE Z_PK = %u", v12, v15, v17, v18, objc_msgSend(a2, "_referenceData64")];
    id v20 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v19);

    return v20;
  }

  return result;
}

- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(__CFString *)a3 inManyToMany:
{
  if (result)
  {
    uint64_t v5 = -[__CFString sourceEntity](a3, "sourceEntity");
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v7 = *(unsigned int *)(v5 + 184);
      uint64_t v5 = *(void *)(v5 + 152);
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    uint64_t v8 = [(id)v5 count];
    uint64_t v9 = -[__CFString correlationTableName](a3, "correlationTableName");
    uint64_t v10 = [v6 tableName];
    uint64_t v11 = -[__CFString columnName](a3, "columnName");
    uint64_t v12 = -[NSSQLManyToMany inverseOrderColumnName](a3);
    if (v8)
    {
      if (v6) {
        __int128 v13 = (void *)v6[17];
      }
      else {
        __int128 v13 = 0LL;
      }
      uint64_t v14 = [NSString stringWithFormat:@"T1.%@", objc_msgSend(v13, "columnName")];
      uint64_t v15 = [objc_alloc(NSString) initWithFormat:@"SELECT T0.%@, %@, T0.%@ from %@ T0 JOIN %@ T1 on t0.%@ = t1.Z_PK where T0.%@ = %u", v11, v14, v12, v9, v10, v11, -[NSSQLManyToMany inverseColumnName](a3), objc_msgSend(a2, "_referenceData64")];
    }

    else
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v7);
      uint64_t v15 = [objc_alloc(NSString) initWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = %u", v11, v16, v12, v9, -[NSSQLManyToMany inverseColumnName](a3), objc_msgSend(a2, "_referenceData64"), v19, v20];
    }

    uint64_t v17 = (void *)v15;
    uint64_t v18 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v6,  v15);

    return v18;
  }

  return result;
}

+ (NSSQLiteStatement)generateStatementForCheckingUniqueProperties:(void *)a3 onObjects:(void *)a4 usingSQLCore:
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "entity");
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 120) & 4) != 0)
    {
      uint64_t v7 = *(void **)(v6 + 72);
    }

    else
    {
      do
      {
        uint64_t v7 = (void *)v6;
        uint64_t v6 = [(id)v6 superentity];
      }

      while (v6);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v60 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a4, v7);
  id v8 = objc_alloc(MEMORY[0x189607940]);
  if (objc_msgSend((id)objc_msgSend(v7, "subentities"), "count")) {
    uint64_t v9 = @"Z_PK, Z_ENT";
  }
  else {
    uint64_t v9 = @"Z_PK";
  }
  uint64_t v10 = (void *)[v8 initWithString:v9];
  id v66 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v68 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  uint64_t v65 = [a2 countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v82;
    __int128 v63 = v10;
    do
    {
      for (uint64_t i = 0LL; i != v65; ++i)
      {
        if (*(void *)v82 != v64) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void *)(*((void *)&v81 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_29;
        }
        int v13 = *(unsigned __int8 *)(v12 + 24);
        if (v13 != 7)
        {
          if (v13 == 1)
          {
            uint64_t v62 = i;
            uint64_t v14 = (void *)[(id)v12 propertyDescription];
            uint64_t v67 = [v14 name];
            uint64_t v15 = (void *)v12;
            uint64_t v16 = [(id)v12 columnName];
            uint64_t v17 = v14;
            uint64_t v18 = [v14 entity];
            [v10 appendFormat:@", %@", v16];
            uint64_t v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithFormat:", @"%@ IN ("), v16;
            __int128 v77 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            uint64_t v20 = [a3 countByEnumeratingWithState:&v77 objects:v91 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v78;
              char v23 = 1;
              do
              {
                uint64_t v24 = a3;
                for (uint64_t j = 0LL; j != v21; ++j)
                {
                  if (*(void *)v78 != v22) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                  if (objc_msgSend((id)objc_msgSend(v26, "entity"), "isKindOfEntity:", v18))
                  {
                    if ((v23 & 1) == 0) {
                      objc_msgSend(v19, "appendString:", @", ");
                    }
                    [v19 appendString:@"? "];
                    uint64_t v27 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  [v26 valueForKey:v67],  objc_msgSend(v15, "sqlType"),  v17);
                    [v68 addObject:v27];

                    char v23 = 0;
                  }
                }

                a3 = v24;
                uint64_t v21 = [v24 countByEnumeratingWithState:&v77 objects:v91 count:16];
              }

              while (v21);
            }

            [v19 appendString:@""]);
            [v66 addObject:v19];

            uint64_t i = v62;
            uint64_t v10 = v63;
            continue;
          }

+ (NSSQLiteStatement)generateStatementForCheckingMulticolumnConstraint:(void *)a3 onObjects:(void *)a4 usingSQLCore:
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v59 = a3;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "entity");
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 120) & 4) != 0)
    {
      uint64_t v7 = *(void **)(v6 + 72);
    }

    else
    {
      do
      {
        uint64_t v7 = (void *)v6;
        uint64_t v6 = [(id)v6 superentity];
      }

      while (v6);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v48 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a4, v7);
  id v8 = objc_alloc_init(MEMORY[0x189607940]);
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v65;
  char v12 = 1;
  do
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v65 != v11) {
        objc_enumerationMutation(a2);
      }
      uint64_t v14 = *(unsigned __int8 **)(*((void *)&v64 + 1) + 8 * i);
      if ((v12 & 1) == 0) {
        objc_msgSend(v8, "appendString:", @", ");
      }
      if (v14)
      {
        int v15 = v14[24];
        if (v15 != 1)
        {
          if (v15 != 7) {
            goto LABEL_18;
          }
          uint64_t v14 = (unsigned __int8 *)[v14 foreignKey];
        }

        objc_msgSend(v8, "appendString:", objc_msgSend(v14, "columnName"));
      }

void __72__NSSQLiteAdapter_createSQLStatementsForTriggerAttribute_withSQLEntity___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = (void *)objc_msgSend(a2, "insertSQLStrings", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  *(void *)(*((void *)&v11 + 1) + 8 * v9));
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v4 copy];
}

@end