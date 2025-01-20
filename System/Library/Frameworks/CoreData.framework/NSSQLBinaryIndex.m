@interface NSSQLBinaryIndex
- (id)bulkUpdateStatementsForStore:(id)a3;
- (id)dropStatementsForStore:(id)a3;
- (id)generateStatementsForStore:(id)a3;
@end

@implementation NSSQLBinaryIndex

- (id)generateStatementsForStore:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  v5 = (void *)[MEMORY[0x189603FA8] array];
  v6 = (void *)MEMORY[0x186E3E5D8]();
  if (-[NSFetchIndexDescription _isMappedSinglePropertyIndex]((uint64_t)-[NSSQLIndex indexDescription]( self,  "indexDescription"))
    && objc_msgSend( (id)objc_msgSend( -[NSArray firstObject]( -[NSFetchIndexDescription elements]( -[NSSQLIndex indexDescription](self, "indexDescription"),  "elements"),  "firstObject"),  "property"),  "_propertyType") == 4 && !-[NSFetchIndexDescription _isUnique]((uint64_t)-[NSSQLIndex indexDescription]( self,  "indexDescription")))
  {
    goto LABEL_54;
  }

  if (!-[NSFetchIndexDescription partialIndexPredicate]( -[NSSQLIndex indexDescription](self, "indexDescription"),  "partialIndexPredicate")
    && (-[NSFetchIndexDescription _isPurelyModeledIndex]((uint64_t)-[NSSQLIndex indexDescription]( self,  "indexDescription")) & 1) != 0)
  {
    v7 = (void *)MEMORY[0x189607940];
    if (-[NSSQLIndex isUnique](self, "isUnique")) {
      v8 = @"UNIQUE ";
    }
    else {
      v8 = &stru_189EAC2E8;
    }
    v42 = (void *)objc_msgSend( v7,  "stringWithFormat:",  @"CREATE %@INDEX IF NOT EXISTS Z_%@_%@ ON %@ ("),  v8,  -[NSSQLEntity name](-[NSSQLIndex sqlEntity](self, "sqlEntity"), "name"),  -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self, "indexDescription"), "name"),  -[NSSQLEntity tableName](-[NSSQLIndex sqlEntity](self, "sqlEntity"), "tableName");
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    v9 = -[NSFetchIndexDescription elements](-[NSSQLIndex indexDescription](self, "indexDescription"), "elements");
    uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
    if (!v10) {
      goto LABEL_54;
    }
    uint64_t v11 = v10;
    v12 = self;
    v40 = v6;
    v41 = v5;
    char v13 = 0;
    uint64_t v14 = *(void *)v44;
    while (1)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x186E3E5D8]();
        v18 = (void *)[v16 property];
        uint64_t v19 = [v18 _propertyType];
        else {
          BOOL v20 = 1;
        }
        if (v20)
        {
          if ([v18 _isAttribute])
          {
            if (v18 && [v18 superCompositeAttribute])
            {
              uint64_t v21 = [v18 _qualifiedName];
              uint64_t v22 = -[NSSQLIndex sqlEntity](v12, "sqlEntity");
              if (!v22) {
                goto LABEL_47;
              }
              v23 = *(void **)(v22 + 40);
              uint64_t v24 = v21;
LABEL_29:
              v27 = (void *)[v23 objectForKey:v24];
              if (!v27) {
                goto LABEL_47;
              }
LABEL_30:
              uint64_t v28 = [v27 columnName];
              if ((v13 & 1) != 0) {
                objc_msgSend(v42, "appendString:", @", ");
              }
              int v29 = [v16 isAscending];
              v30 = @"DESC";
              if (v29) {
                v30 = @"ASC";
              }
              [v42 appendFormat:@"%@ COLLATE BINARY %@", v28, v30];
              char v13 = 1;
              goto LABEL_47;
            }

- (id)dropStatementsForStore:(id)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] =  -[NSSQLiteStatement initWithEntity:sqlString:]( [NSSQLiteStatement alloc],  "initWithEntity:sqlString:",  -[NSSQLIndex sqlEntity](self, "sqlEntity"),  [MEMORY[0x189607940] stringWithFormat:@"DROP INDEX IF EXISTS Z_%@_%@", -[NSSQLEntity name](-[NSSQLIndex sqlEntity](self, "sqlEntity", a3), "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self, "indexDescription"), "name")]);
  return (id)[MEMORY[0x189603F18] arrayWithObjects:v4 count:1];
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  return (id)NSArray_EmptyArray;
}

@end