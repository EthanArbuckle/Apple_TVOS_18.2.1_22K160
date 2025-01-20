@interface PQLResultSet
- (BOOL)BOOLAtIndex:(int)a3;
- (BOOL)_next:(BOOL)a3;
- (BOOL)isNullAtIndex:(int)a3;
- (BOOL)next;
- (NSError)error;
- (NSSet)defaultUnarchivingAllowedClasses;
- (PQLConnection)db;
- (PQLResultSet)initWithStatement:(id)a3 usingDatabase:(id)a4 preparationTime:(unint64_t)a5;
- (char)charAtIndex:(int)a3;
- (const)UTF8StringAtIndex:(int)a3;
- (double)doubleAtIndex:(int)a3;
- (float)floatAtIndex:(int)a3;
- (id)columnNameAtIndex:(int)a3;
- (id)dataAtIndex:(int)a3;
- (id)dataAtIndex:(int)a3 noCopy:(BOOL)a4;
- (id)dateAtIndex:(int)a3;
- (id)description;
- (id)enumerateObjects:(id)a3;
- (id)enumerateObjectsOfClass:(Class)a3;
- (id)enumerateObjectsOfClass:(Class)a3 initializer:(SEL)a4;
- (id)nextObject;
- (id)numberAtIndex:(int)a3;
- (id)object:(id)a3;
- (id)objectAtIndex:(int)a3;
- (id)objectOfClass:(Class)a3;
- (id)objectOfClass:(Class)a3 atIndex:(int)a4;
- (id)objectOfClass:(Class)a3 initializer:(SEL)a4;
- (id)onlyObject:(id)a3;
- (id)onlyObjectOfClass:(Class)a3;
- (id)onlyObjectOfClass:(Class)a3 initializer:(SEL)a4;
- (id)plistAtIndex:(int)a3;
- (id)stringAtIndex:(int)a3;
- (id)unarchivedObjectOfClass:(Class)a3 atIndex:(int)a4;
- (id)unarchivedObjectOfClasses:(id)a3 atIndex:(int)a4;
- (id)uuidAtIndex:(int)a3;
- (int)intAtIndex:(int)a3;
- (int64_t)integerAtIndex:(int)a3;
- (int64_t)longAtIndex:(int)a3;
- (int64_t)longLongAtIndex:(int)a3;
- (signed)shortAtIndex:(int)a3;
- (sqlite3_stmt)stmt;
- (unint64_t)columns;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)rowNumber;
- (unint64_t)unsignedIntegerAtIndex:(int)a3;
- (unint64_t)unsignedLongAtIndex:(int)a3;
- (unint64_t)unsignedLongLongAtIndex:(int)a3;
- (unsigned)unsignedCharAtIndex:(int)a3;
- (unsigned)unsignedIntAtIndex:(int)a3;
- (unsigned)unsignedShortAtIndex:(int)a3;
- (void)close;
- (void)dealloc;
- (void)setDefaultUnarchivingAllowedClasses:(id)a3;
@end

@implementation PQLResultSet

- (sqlite3_stmt)stmt
{
  stmt = self->_stmt;
  if (stmt) {
    return stmt->_stmt;
  }
  else {
    return 0LL;
  }
}

- (PQLResultSet)initWithStatement:(id)a3 usingDatabase:(id)a4 preparationTime:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PQLResultSet;
  v11 = -[PQLResultSet init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v11->_stmt, a3);
      v12->_columns = sqlite3_column_count(v12->_stmt->_stmt);
    }

    else
    {
      uint64_t v13 = [v10 lastError];
      error = v12->_error;
      v12->_error = (NSError *)v13;
    }

    objc_storeStrong((id *)&v12->_db, a4);
    v12->_inTransaction = sqlite3_get_autocommit((sqlite3 *)[v10 dbHandle]) == 0;
    v12->_executionTime = 0LL;
    v12->_preparationTime = a5;
  }

  return v12;
}

- (void)close
{
  -[PQLStatement unbindForDB:returnedRows:executionTime:preparationTime:]( self->_stmt,  "unbindForDB:returnedRows:executionTime:preparationTime:",  self->_db,  self->_rowNumber,  self->_executionTime,  self->_preparationTime);
  stmt = self->_stmt;
  self->_stmt = 0LL;

  db = self->_db;
  self->_db = 0LL;

  id lastEnumeratedObject = self->_lastEnumeratedObject;
  self->_id lastEnumeratedObject = 0LL;
}

- (void)dealloc
{
  error = self->_error;
  self->_error = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PQLResultSet;
  -[PQLResultSet dealloc](&v4, sel_dealloc);
}

- (BOOL)_next:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = -[PQLConnection serialQueue](self->_db, "serialQueue");
  if (!self->_stmt) {
    goto LABEL_18;
  }
  db = self->_db;
  if (!db) {
    goto LABEL_18;
  }
  if (v5) {
    -[PQLConnection assertOnQueue](db, "assertOnQueue");
  }
  uint64_t v7 = mach_absolute_time();
  int v8 = sqlite3_step(self->_stmt->_stmt);
  self->_executionTime += mach_absolute_time() - v7;
  if (v8 == 101)
  {
    if (v3)
    {
      [MEMORY[0x189607870] errorWithSqliteCode:12 andMessage:@"no result found"];
      id v10 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v10;
LABEL_16:

      goto LABEL_17;
    }

    goto LABEL_17;
  }

  if (v8 != 100)
  {
    objc_msgSend( MEMORY[0x189607870],  "errorForDB:stmt:",  -[PQLConnection dbHandle](self->_db, "dbHandle"),  self->_stmt->_stmt);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = self->_error;
    self->_error = v12;

    if (self->_inTransaction && sqlite3_get_autocommit(-[PQLConnection dbHandle](self->_db, "dbHandle")))
    {
      uint64_t v14 = -[PQLConnection autoRollbackHandler](self->_db, "autoRollbackHandler");
LABEL_15:
      error = (NSError *)v14;
      (*(void (**)(uint64_t, PQLConnection *, PQLStatement *, NSError *))(v14 + 16))( v14,  self->_db,  self->_stmt,  self->_error);
      goto LABEL_16;
    }
    v15 = -[PQLConnection sqliteErrorHandler](self->_db, "sqliteErrorHandler");
    if (v15)
    {
      uint64_t v14 = -[PQLConnection sqliteErrorHandler](self->_db, "sqliteErrorHandler");
      goto LABEL_15;
    }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id lastEnumeratedObject = self->_lastEnumeratedObject;
  self->_id lastEnumeratedObject = 0LL;

  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  }
  a3->var1 = a4;
  BOOL v9 = (void *)MEMORY[0x1895CF1AC]();
  -[PQLResultSet nextObject](self, "nextObject");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = self->_lastEnumeratedObject;
  self->_id lastEnumeratedObject = v10;

  objc_autoreleasePoolPop(v9);
  id v12 = self->_lastEnumeratedObject;
  if (v12)
  {
    *a4 = v12;
    ++a3->var0;
    return 1LL;
  }

  else
  {
    -[PQLResultSet close](self, "close");
    return 0LL;
  }

- (id)onlyObjectOfClass:(Class)a3 initializer:(SEL)a4
{
  if (-[PQLResultSet _next:](self, "_next:", 1LL))
  {
    uint64_t v7 = self;
    uint64_t v13 = MEMORY[0x1895F87A8];
    uint64_t v14 = 3221225472LL;
    v15 = __createObjectFromResultSetWithSel_block_invoke;
    objc_super v16 = &unk_18A2BFA48;
    SEL v18 = a4;
    int v8 = v7;
    v17 = v8;
    Class v19 = a3;
    id v20 = 0LL;
    __createObjectFromResultSetWithSel_block_invoke((uint64_t)&v13, v8, (uint64_t)&v20);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v20;
    id v11 = v20;
    if (!v9) {
      objc_storeStrong(v8 + 11, v10);
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  -[PQLResultSet close](self, "close", v13, v14);
  return v9;
}

- (id)onlyObjectOfClass:(Class)a3
{
  if (-[PQLResultSet _next:](self, "_next:", 1LL))
  {
    v5 = self;
    uint64_t v11 = MEMORY[0x1895F87A8];
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = __createObjectFromResultSetWithSel_block_invoke;
    uint64_t v14 = &unk_18A2BFA48;
    uint64_t v16 = 0LL;
    v6 = v5;
    v15 = v6;
    Class v17 = a3;
    id v18 = 0LL;
    __createObjectFromResultSetWithSel_block_invoke((uint64_t)&v11, v6, (uint64_t)&v18);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v18;
    id v9 = v18;
    if (!v7) {
      objc_storeStrong(v6 + 11, v8);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  -[PQLResultSet close](self, "close", v11, v12);
  return v7;
}

- (id)onlyObject:(id)a3
{
  objc_super v4 = (void (**)(id, PQLResultSet *, id *))a3;
  if (-[PQLResultSet _next:](self, "_next:", 1LL))
  {
    v5 = self;
    id v10 = 0LL;
    v4[2](v4, v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v10;
    id v8 = v10;
    if (!v6) {
      objc_storeStrong((id *)&v5->_error, v7);
    }
  }

  else
  {
    v6 = 0LL;
  }

  -[PQLResultSet close](self, "close");

  return v6;
}

- (id)objectOfClass:(Class)a3
{
  objc_super v4 = self;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __createObjectFromResultSetWithSel_block_invoke;
  v10[3] = &unk_18A2BFA48;
  uint64_t v12 = 0LL;
  v5 = v4;
  uint64_t v11 = v5;
  Class v13 = a3;
  id v14 = 0LL;
  __createObjectFromResultSetWithSel_block_invoke((uint64_t)v10, v5, (uint64_t)&v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v14;
  id v8 = v14;
  if (!v6) {
    objc_storeStrong(v5 + 11, v7);
  }

  return v6;
}

- (id)objectOfClass:(Class)a3 initializer:(SEL)a4
{
  v6 = self;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __createObjectFromResultSetWithSel_block_invoke;
  v12[3] = &unk_18A2BFA48;
  SEL v14 = a4;
  id v7 = v6;
  Class v13 = v7;
  Class v15 = a3;
  id v16 = 0LL;
  __createObjectFromResultSetWithSel_block_invoke((uint64_t)v12, v7, (uint64_t)&v16);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v16;
  id v10 = v16;
  if (!v8) {
    objc_storeStrong(v7 + 11, v9);
  }

  return v8;
}

- (id)object:(id)a3
{
  objc_super v4 = self;
  id v9 = 0LL;
  (*((void (**)(id, PQLResultSet *, id *))a3 + 2))(a3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v9;
  id v7 = v9;
  if (!v5) {
    objc_storeStrong((id *)&v4->_error, v6);
  }

  return v5;
}

- (BOOL)next
{
  return -[PQLResultSet _next:](self, "_next:", 0LL);
}

- (id)nextObject
{
  if (!-[PQLResultSet _next:](self, "_next:", 0LL)) {
    return 0LL;
  }
  id objectsConstructor = self->_objectsConstructor;
  if (objectsConstructor)
  {
    objc_super v4 = self;
    v5 = (void (**)(id, PQLResultSet *, id *))objectsConstructor;
    v14[0] = 0LL;
    v5[2](v5, v4, v14);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v14[0];
    id v8 = v14[0];
    if (!v6) {
      objc_storeStrong((id *)&v4->_error, v7);
    }
  }

  else
  {
    int8x16_t v13 = *(int8x16_t *)&self->_objectsClass;
    id v10 = self;
    v14[0] = (id)MEMORY[0x1895F87A8];
    v14[1] = (id)3221225472LL;
    v14[2] = __createObjectFromResultSetWithSel_block_invoke;
    v14[3] = &unk_18A2BFA48;
    objc_super v4 = v10;
    Class v15 = v4;
    int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
    id v17 = 0LL;
    __createObjectFromResultSetWithSel_block_invoke((uint64_t)v14, v4, (uint64_t)&v17);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v17;
    id v12 = v17;
    if (!v6) {
      objc_storeStrong((id *)&v4->_error, v11);
    }
  }

  return v6;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_db) {
    v5 = "no";
  }
  else {
    v5 = "yes";
  }
  return (id)objc_msgSend( v3,  "stringWithFormat:",  @"<%@:%p {stmt: %@; row: %ld; closed:%s}>",
               v4,
               self,
               self->_stmt,
               self->_rowNumber,
               v5);
}

- (id)columnNameAtIndex:(int)a3
{
  return (id)objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(self->_stmt->_stmt, a3));
}

- (id)objectOfClass:(Class)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v7 = objc_opt_respondsToSelector();
  stmt = self->_stmt;
  if ((v7 & 1) != 0)
  {
    id v9 = (void *)-[objc_class newFromSqliteStatement:atIndex:](a3, "newFromSqliteStatement:atIndex:", stmt->_stmt, v4);
  }

  else
  {
    id v10 = sqlite3_column_value(stmt->_stmt, v4);
    id v11 = sqlite3_value_dup(v10);
    id v9 = (void *)-[objc_class newFromSqliteValue:](a3, "newFromSqliteValue:", v11);
    sqlite3_value_free(v11);
  }

  return v9;
}

- (BOOL)BOOLAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3) != 0;
}

- (char)charAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedCharAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (signed)shortAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedShortAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (int)intAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedIntAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (int64_t)longAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (int64_t)longLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedLongLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (int64_t)integerAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedIntegerAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (float)floatAtIndex:(int)a3
{
  return sqlite3_column_double(self->_stmt->_stmt, a3);
}

- (double)doubleAtIndex:(int)a3
{
  return sqlite3_column_double(self->_stmt->_stmt, a3);
}

- (const)UTF8StringAtIndex:(int)a3
{
  return (const char *)sqlite3_column_text(self->_stmt->_stmt, a3);
}

- (BOOL)isNullAtIndex:(int)a3
{
  return sqlite3_column_type(self->_stmt->_stmt, a3) == 5;
}

- (id)numberAtIndex:(int)a3
{
  return (id)[MEMORY[0x189607968] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];
}

- (id)dateAtIndex:(int)a3
{
  return (id)[MEMORY[0x189603F50] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];
}

- (id)stringAtIndex:(int)a3
{
  return (id)[NSString newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];
}

- (id)dataAtIndex:(int)a3
{
  return (id)[MEMORY[0x189603F48] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];
}

- (id)dataAtIndex:(int)a3 noCopy:(BOOL)a4
{
  if (a4)
  {
    if (-[PQLResultSet isNullAtIndex:](self, "isNullAtIndex:", *(void *)&a3))
    {
      id v6 = 0LL;
    }

    else
    {
      char v7 = sqlite3_column_blob(self->_stmt->_stmt, a3);
      objc_msgSend( MEMORY[0x189603F48],  "dataWithBytesNoCopy:length:freeWhenDone:",  v7,  sqlite3_column_bytes(self->_stmt->_stmt, a3),  0);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    -[PQLResultSet dataAtIndex:](self, "dataAtIndex:", *(void *)&a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)uuidAtIndex:(int)a3
{
  return (id)[MEMORY[0x189607AB8] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];
}

- (id)plistAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type(self->_stmt->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    id v10 = (void *)MEMORY[0x189607968];
LABEL_7:
    id v9 = (void *)[v10 newFromSqliteStatement:self->_stmt->_stmt atIndex:v3];
    return v9;
  }

  if (v5 == 3)
  {
    id v10 = (void *)NSString;
    goto LABEL_7;
  }

  if (v5 == 4)
  {
    id v6 = objc_alloc(MEMORY[0x189603F48]);
    char v7 = sqlite3_column_blob(self->_stmt->_stmt, v3);
    id v8 = (void *)objc_msgSend( v6,  "initWithBytesNoCopy:length:freeWhenDone:",  v7,  sqlite3_column_bytes(self->_stmt->_stmt, v3),  0);
    [MEMORY[0x1896079E8] propertyListWithData:v8 options:0 format:0 error:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (NSSet)defaultUnarchivingAllowedClasses
{
  defaultUnarchivingAllowedClasses = self->_defaultUnarchivingAllowedClasses;
  if (!defaultUnarchivingAllowedClasses)
  {
    if (_defaultAllowedClasses_once != -1) {
      dispatch_once(&_defaultAllowedClasses_once, &__block_literal_global_0);
    }
    defaultUnarchivingAllowedClasses = (NSSet *)_defaultAllowedClasses_allowedClasses;
  }

  return defaultUnarchivingAllowedClasses;
}

- (id)unarchivedObjectOfClass:(Class)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v7 = sqlite3_column_type(self->_stmt->_stmt, a4);
  if ((v7 - 1) < 2)
  {
    int8x16_t v13 = (void *)MEMORY[0x189607968];
LABEL_7:
    id v12 = (void *)[v13 newFromSqliteStatement:self->_stmt->_stmt atIndex:v4];
    return v12;
  }

  if (v7 == 3)
  {
    int8x16_t v13 = (void *)NSString;
    goto LABEL_7;
  }

  if (v7 == 4)
  {
    id v8 = objc_alloc(MEMORY[0x189603F48]);
    id v9 = sqlite3_column_blob(self->_stmt->_stmt, v4);
    id v10 = (void *)objc_msgSend( v8,  "initWithBytesNoCopy:length:freeWhenDone:",  v9,  sqlite3_column_bytes(self->_stmt->_stmt, v4),  0);
    id v11 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v10 error:0];
    [v11 decodeObjectOfClass:a3 forKey:*MEMORY[0x1896075C8]];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)unarchivedObjectOfClasses:(id)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = sqlite3_column_type(self->_stmt->_stmt, v4);
  if ((v7 - 1) < 2)
  {
    int8x16_t v13 = (void *)MEMORY[0x189607968];
LABEL_7:
    id v12 = (void *)[v13 newFromSqliteStatement:self->_stmt->_stmt atIndex:v4];
    goto LABEL_9;
  }

  if (v7 == 3)
  {
    int8x16_t v13 = (void *)NSString;
    goto LABEL_7;
  }

  if (v7 == 4)
  {
    id v8 = objc_alloc(MEMORY[0x189603F48]);
    id v9 = sqlite3_column_blob(self->_stmt->_stmt, v4);
    id v10 = (void *)objc_msgSend( v8,  "initWithBytesNoCopy:length:freeWhenDone:",  v9,  sqlite3_column_bytes(self->_stmt->_stmt, v4),  0);
    id v11 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v10 error:0];
    [v11 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1896075C8]];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

- (id)objectAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type(self->_stmt->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    id v12 = (void *)MEMORY[0x189607968];
LABEL_7:
    id v11 = (void *)[v12 newFromSqliteStatement:self->_stmt->_stmt atIndex:v3];
    return v11;
  }

  if (v5 == 3)
  {
    id v12 = (void *)NSString;
    goto LABEL_7;
  }

  if (v5 == 4)
  {
    id v6 = objc_alloc(MEMORY[0x189603F48]);
    int v7 = sqlite3_column_blob(self->_stmt->_stmt, v3);
    id v8 = (void *)objc_msgSend( v6,  "initWithBytesNoCopy:length:freeWhenDone:",  v7,  sqlite3_column_bytes(self->_stmt->_stmt, v3),  0);
    id v9 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v8 error:0];
    -[PQLResultSet defaultUnarchivingAllowedClasses](self, "defaultUnarchivingAllowedClasses");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1896075C8]];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)enumerateObjectsOfClass:(Class)a3 initializer:(SEL)a4
{
  if (self->_objectsClass || self->_objectsConstructor) {
    objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"-%s was called twice",  sel_getName(sel_enumerateObjectsOfClass_));
  }
  if ((-[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", a4) & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, self, @"PQLResultSet.m", 448, @"Invalid parameter not satisfying: %@", @"[aClass instancesRespondToSelector:initializer]" object file lineNumber description];
  }

  self->_objectsClass = a3;
  self->_objectsClassInitializer = a4;
  return self;
}

- (id)enumerateObjectsOfClass:(Class)a3
{
  if (self->_objectsClass || self->_objectsConstructor) {
    objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"-%s was called twice",  sel_getName(sel_enumerateObjectsOfClass_));
  }
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_18C72EBB0))
  {
    self->_hasValuable = 1;
  }

  else if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_18C72E558) & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2, self, @"PQLResultSet.m", 462, @"%@ conforms neither to PQLValuable or PQLResultSetInitializer", a3 object file lineNumber description];
  }

  self->_objectsClass = a3;
  return self;
}

- (id)enumerateObjects:(id)a3
{
  id v4 = a3;
  if (self->_objectsClass || self->_objectsConstructor) {
    objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"-%s was called twice",  sel_getName(sel_enumerateObjectsOfClass_));
  }
  int v5 = (void *)MEMORY[0x1895CF32C](v4);
  id objectsConstructor = self->_objectsConstructor;
  self->_id objectsConstructor = v5;

  return self;
}

- (void)setDefaultUnarchivingAllowedClasses:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)rowNumber
{
  return self->_rowNumber;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (PQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
}

@end