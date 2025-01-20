@interface NSSQLIndexIntermediate
- (BOOL)isIndexExpressionScoped;
- (BOOL)isIndexScoped;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingEntity;
- (id)initForIndex:(id)a3 withScope:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLIndexIntermediate

- (id)initForIndex:(id)a3 withScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLIndexIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5) {
    v5->_index = (NSSQLBinaryIndex *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_index = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLIndexIntermediate;
  -[NSSQLIndexIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isIndexScoped
{
  return 1;
}

- (BOOL)isIndexExpressionScoped
{
  return self->_isHandlingExpressions;
}

- (id)governingEntity
{
  return -[NSSQLIndex sqlEntity](self->_index, "sqlEntity");
}

- (id)generateSQLStringInContext:(id)a3
{
  v87[1] = *MEMORY[0x1895F89C0];
  v5 = -[NSSQLIndex sqlEntity](self->_index, "sqlEntity");
  id v6 = objc_alloc(MEMORY[0x189607940]);
  if (-[NSSQLIndex isUnique](self->_index, "isUnique")) {
    objc_super v7 = @"UNIQUE ";
  }
  else {
    objc_super v7 = &stru_189EAC2E8;
  }
  v8 = (void *)objc_msgSend( v6,  "initWithFormat:",  @"CREATE %@INDEX IF NOT EXISTS Z_%@_%@ ON %@ ("),  v7,  -[NSSQLEntity name](v5, "name"),  -[NSFetchIndexDescription name]( -[NSSQLIndex indexDescription](self->_index, "indexDescription"),  "name"),  -[NSSQLEntity tableName](v5, "tableName");
  obj = -[NSFetchIndexDescription elements]( -[NSSQLIndex indexDescription](self->_index, "indexDescription"),  "elements");
  v60 = self;
  self->_isHandlingExpressions = 1;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v61,  v77,  16LL);
  if (!v9) {
    goto LABEL_58;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v62;
  uint64_t v58 = *MEMORY[0x189603A60];
  while (2)
  {
    uint64_t v13 = 0LL;
LABEL_7:
    if (*(void *)v62 != v12) {
      objc_enumerationMutation(obj);
    }
    v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
    v15 = (void *)[v14 property];
    switch([v15 _propertyType])
    {
      case 2LL:
      case 6LL:
      case 7LL:
        goto LABEL_10;
      case 4LL:
        if (![v15 isToMany])
        {
          uint64_t v16 = [v15 name];
          if (!v16) {
LABEL_10:
          }
            uint64_t v16 = [v15 _qualifiedName];
          v17 = objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate);
          uint64_t v18 = [MEMORY[0x189607878] expressionForKeyPath:v16];
          v19 = v17;
LABEL_12:
          v20 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( v19,  "initWithExpression:allowToMany:inScope:",  v18,  0LL,  v60);
          id v21 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:]( v20,  "generateSQLStringInContext:",  a3);

LABEL_13:
          if (!v21) {
            goto LABEL_54;
          }
          else {
            v22 = @"DESC";
          }
          if ((v11 & 1) != 0) {
            objc_msgSend(v8, "appendString:", @", ");
          }
          [v8 appendFormat:@"%@ COLLATE BINARY %@", v21, v22];

          ++v13;
          char v11 = 1;
          if (v10 == v13)
          {
            uint64_t v41 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v61,  v77,  16LL);
            uint64_t v10 = v41;
            if (!v41) {
              goto LABEL_57;
            }
            continue;
          }

          goto LABEL_7;
        }

        v42 = (void *)MEMORY[0x189603F70];
        v75 = @"relationship";
        v76 = v15;
        uint64_t v43 = [MEMORY[0x189603F68] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        v44 = @"Indexes cannot contain to many relationships";
LABEL_53:
        objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v58, v44, v43),  @"NSUnderlyingException");

        v8 = 0LL;
LABEL_54:
        if (![a3 objectForKey:@"NSUnderlyingException"])
        {
          v71 = @"property";
          v72 = v15;
          objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v58,  @"SQL generation failure for property",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1)),  @"NSUnderlyingException");
        }

        v8 = 0LL;
        if ((v11 & 1) != 0)
        {
LABEL_57:
          [v8 appendString:@""]);
          goto LABEL_61;
        }

@end