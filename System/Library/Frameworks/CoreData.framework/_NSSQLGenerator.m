@interface _NSSQLGenerator
+ (void)initialize;
- (uint64_t)prepareConstrainedValuesUpdateStatementWithRow:(uint64_t)result;
- (uint64_t)prepareDeleteStatementForRelationship:(uint64_t)result;
- (uint64_t)prepareInsertStatementForRelationship:(uint64_t)result;
- (uint64_t)prepareMasterReorderStatementForRelationship:(uint64_t)result;
- (uint64_t)prepareMasterReorderStatementPart2ForRelationship:(uint64_t)result;
- (uint64_t)prepareReorderStatementForRelationship:(uint64_t)result;
- (uint64_t)prepareUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:;
- (void)dealloc;
- (void)initWithStatement:(uint64_t)a3 forAdapter:;
- (void)prepareDeleteStatementWithRow:(uint64_t)a1;
- (void)prepareInsertStatementWithRow:(int)a3 includeConstraints:(int)a4 includeOnConflict:(void *)a5 onConflictKeys:;
@end

@implementation _NSSQLGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_self();
  }

- (void)dealloc
{
  self->_selectList = 0LL;
  *(_OWORD *)&self->_sqlString = 0u;
  *(_OWORD *)&self->_statement = 0u;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSSQLGenerator;
  -[_NSSQLGenerator dealloc](&v3, sel_dealloc);
}

- (void)initWithStatement:(uint64_t)a3 forAdapter:
{
  if (!a1) {
    return 0LL;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_CLASS____NSSQLGenerator;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
    v5[3] = objc_alloc_init(MEMORY[0x189607940]);
    v6[4] = objc_alloc_init(MEMORY[0x189607940]);
    v6[5] = objc_alloc_init(MEMORY[0x189607940]);
  }

  return v6;
}

- (void)prepareInsertStatementWithRow:(int)a3 includeConstraints:(int)a4 includeOnConflict:(void *)a5 onConflictKeys:
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      v9 = 0LL;
    }
    else {
      v9 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    v83 = v9;
    v78 = (void *)[v9 foreignKeyColumns];
    v10 = (void *)[v83 foreignEntityKeyColumns];
    v11 = (void *)[v83 foreignOrderKeyColumns];
    v79 = (void *)[v83 attributeColumns];
    if (v83)
    {
      v12 = (void *)v83[17];
      v72 = (void *)v83[18];
      v73 = (void *)v83[16];
    }

    else
    {
      v12 = 0LL;
      v72 = 0LL;
      v73 = 0LL;
    }

    uint64_t v81 = [v79 count];
    uint64_t v13 = [v10 count];
    uint64_t v14 = [v78 count];
    v75 = v11;
    uint64_t v76 = [v11 count];
    int v71 = a4;
    if (a3 ^ 1 | a4) {
      v15 = @"INSERT INTO ";
    }
    else {
      v15 = @"INSERT OR IGNORE INTO ";
    }
    [*(id *)(a1 + 24) appendString:v15];
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v83, "tableName"));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", @"(");
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v73, "columnName"));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
    v70 = v12;
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v12, "columnName"));
    objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
    objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v72, "columnName"));
    if (v14)
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        v17 = (void *)[v78 objectAtIndex:i];
        if (!objc_msgSend((id)objc_msgSend(v17, "toOneRelationship"), "isConstrained") || a3)
        {
          objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
          objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v17, "columnName"));
        }
      }
    }

    if (v13)
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        v19 = (void *)[v10 objectAtIndex:j];
        objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
        objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v19, "columnName"));
      }
    }

    uint64_t v74 = v13;
    if (v76)
    {
      for (uint64_t k = 0LL; k != v76; ++k)
      {
        v21 = (void *)[v75 objectAtIndex:k];
        objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
        objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v21, "columnName"));
      }
    }

    if (v81)
    {
      for (uint64_t m = 0LL; m != v81; ++m)
      {
        v23 = (void *)[v79 objectAtIndex:m];
        if (![v23 isConstrained] || a3)
        {
          objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
          objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v23, "columnName"));
        }
      }
    }

    objc_msgSend(*(id *)(a1 + 24), "appendString:", @" VALUES(?, ?, ?"));
    v24 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
    if (a2) {
      uint64_t v25 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
    }
    else {
      uint64_t v25 = 0LL;
    }
    v26 = -[NSSQLBindVariable initWithInt64:sqlType:](v24, "initWithInt64:sqlType:", v25, [v73 sqlType]);
    -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v26);

    v27 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
    if (a2 && (uint64_t v28 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1]) != 0) {
      uint64_t v29 = *(unsigned int *)(v28 + 184);
    }
    else {
      uint64_t v29 = 0LL;
    }
    v30 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]( v27,  "initWithUnsignedInt:sqlType:",  v29,  [v70 sqlType]);
    -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v30);

    v31 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
    if (a2) {
      uint64_t v32 = *(unsigned int *)(*(void *)(a2 + 40) + 12LL);
    }
    else {
      uint64_t v32 = 0LL;
    }
    v33 = -[NSSQLBindVariable initWithInt64:sqlType:](v31, "initWithInt64:sqlType:", v32, [v72 sqlType]);
    -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v33);

    if (v14)
    {
      for (uint64_t n = 0LL; n != v14; ++n)
      {
        v35 = (void *)[v78 objectAtIndex:n];
        if (!objc_msgSend((id)objc_msgSend(v35, "toOneRelationship"), "isConstrained") || a3)
        {
          v36 = -[NSSQLBindVariable initWithInt64:sqlType:]( [NSSQLBindVariable alloc],  "initWithInt64:sqlType:",  -[NSSQLRow foreignKeyForSlot:](a2, [v35 slot]),  objc_msgSend(v35, "sqlType"));
          -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v36);

          objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
          [*(id *)(a1 + 24) appendString:@"?"];
        }
      }
    }

    if (v13)
    {
      uint64_t v37 = 0LL;
      do
      {
        v38 = (void *)[v10 objectAtIndex:v37];
        unsigned int v39 = [v38 slot];
        if (a2) {
          uint64_t v40 = *(unsigned __int16 *)(a2
        }
                                    + _NSSQLRowInstanceSize
                                    + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
        else {
          uint64_t v40 = 0LL;
        }
        v41 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]( [NSSQLBindVariable alloc],  "initWithUnsignedInt:sqlType:",  v40,  [v38 sqlType]);
        -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v41);

        objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
        [*(id *)(a1 + 24) appendString:@"?"];
        ++v37;
      }

      while (v74 != v37);
    }

    if (v76)
    {
      for (iuint64_t i = 0LL; ii != v76; ++ii)
      {
        v43 = (void *)[v75 objectAtIndex:ii];
        unsigned int v44 = [v43 slot];
        if (a2) {
          uint64_t v45 = *(unsigned int *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4LL * v44);
        }
        else {
          uint64_t v45 = 0LL;
        }
        v46 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]( [NSSQLBindVariable alloc],  "initWithUnsignedInt:sqlType:",  v45,  [v43 sqlType]);
        -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v46);

        objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
        [*(id *)(a1 + 24) appendString:@"?"];
      }
    }

    int v47 = a3;
    if (v81)
    {
      for (juint64_t j = 0LL; jj != v81; ++jj)
      {
        v49 = (void *)[v79 objectAtIndex:jj];
        if (![v49 isConstrained] || v47)
        {
          v50 = (void *)[v49 attributeDescription];
          if (v50) {
            BOOL v51 = [v50 superCompositeAttribute] != 0;
          }
          else {
            BOOL v51 = 0;
          }
          CFDateRef v52 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v49 slot]);
          if (v51) {
            CFDateRef v52 = (CFDateRef)-[__CFDate valueForKeyPath:]( v52,  "valueForKeyPath:",  -[NSPropertyDescription _elementPath]((__CFString *)[v49 propertyDescription]));
          }
          v53 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  v52,  [v49 sqlType],  objc_msgSend(v49, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v53);

          objc_msgSend(*(id *)(a1 + 24), "appendString:", @", ");
          [*(id *)(a1 + 24) appendString:@"?"];
          int v47 = a3;
        }
      }
    }

    [*(id *)(a1 + 24) appendString:@""]);
    if (v71)
    {
      id v54 = objc_alloc_init(MEMORY[0x189603FA8]);
      if (v83)
      {
        v55 = v83;
        do
        {
          [v54 addObjectsFromArray:v55[27]];
          __int128 v90 = 0u;
          __int128 v91 = 0u;
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          v56 = (void *)v55[26];
          uint64_t v57 = [v56 countByEnumeratingWithState:&v88 objects:v94 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v89;
            do
            {
              for (kuint64_t k = 0LL; kk != v58; ++kk)
              {
                if (*(void *)v89 != v59) {
                  objc_enumerationMutation(v56);
                }
                uint64_t v93 = *(void *)(*((void *)&v88 + 1) + 8 * kk);
                objc_msgSend(v54, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v93, 1));
              }

              uint64_t v58 = [v56 countByEnumeratingWithState:&v88 objects:v94 count:16];
            }

            while (v58);
          }

          v55 = (void *)v55[20];
        }

        while (v55);
      }

      if ([v54 count])
      {
        if (![a5 count]) {
          a5 = (void *)objc_msgSend((id)objc_msgSend(v83, "attributes"), "valueForKey:", @"name");
        }
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        uint64_t v82 = [v54 countByEnumeratingWithState:&v84 objects:v92 count:16];
        if (v82)
        {
          uint64_t v80 = *(void *)v85;
          do
          {
            for (muint64_t m = 0LL; mm != v82; ++mm)
            {
              if (*(void *)v85 != v80) {
                objc_enumerationMutation(v54);
              }
              v62 = *(void **)(*((void *)&v84 + 1) + 8 * mm);
              [*(id *)(a1 + 24) appendString:@" ON CONFLICT"];
              objc_msgSend(*(id *)(a1 + 24), "appendString:", @"(");
              if ([v62 count])
              {
                unint64_t v63 = 0LL;
                do
                {
                  v64 = (void *)[v62 objectAtIndex:v63];
                  if (v63) {
                    objc_msgSend(*(id *)(a1 + 24), "appendString:", @" , ");
                  }
                  objc_msgSend(*(id *)(a1 + 24), "appendString:", objc_msgSend(v64, "columnName"));
                  ++v63;
                }

                while ([v62 count] > v63);
              }

              [*(id *)(a1 + 24) appendString:@""]);
              [*(id *)(a1 + 24) appendString:@" DO UPDATE SET Z_OPT = Z_OPT+1"];
              if ([a5 count])
              {
                unint64_t v65 = 0LL;
                do
                {
                  uint64_t v66 = [a5 objectAtIndexedSubscript:v65];
                  if (v83) {
                    v67 = (void *)v83[5];
                  }
                  else {
                    v67 = 0LL;
                  }
                  v68 = (void *)[v67 objectForKey:v66];
                  if ([v68 propertyType] == 1)
                  {
                    uint64_t v69 = [v68 columnName];
                    if (([v62 containsObject:v68] & 1) == 0)
                    {
                      objc_msgSend(*(id *)(a1 + 24), "appendString:", @" , ");
                      [*(id *)(a1 + 24) appendString:v69];
                      [*(id *)(a1 + 24) appendString:@" = "];
                      [*(id *)(a1 + 24) appendString:@"excluded."];
                      [*(id *)(a1 + 24) appendString:v69];
                    }
                  }

                  ++v65;
                }

                while ([a5 count] > v65);
              }
            }

            uint64_t v82 = [v54 countByEnumeratingWithState:&v84 objects:v92 count:16];
          }

          while (v82);
        }
      }
    }
  }

- (uint64_t)prepareInsertStatementForRelationship:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2) {
      BOOL v4 = a2[1].length == (void)a2;
    }
    else {
      BOOL v4 = 0;
    }
    [*(id *)(result + 24) appendString:@"INSERT OR REPLACE INTO "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", @"(");
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(*(id *)(v3 + 24), "appendString:", @", ");
    [*(id *)(v3 + 24) appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    v5 = -[NSSQLManyToMany inverseOrderColumnName](a2);
    v6 = *(void **)(v3 + 24);
    if (v5)
    {
      objc_msgSend(v6, "appendString:", @", ");
      [*(id *)(v3 + 24) appendString:v5];
      v7 = *(void **)(v3 + 24);
      if (v4)
      {
        objc_msgSend(v7, "appendString:", @", ");
        if (a2) {
          data = a2[2].data;
        }
        else {
          data = 0LL;
        }
        [*(id *)(v3 + 24) appendString:data];
        objc_msgSend(*(id *)(v3 + 24), "appendString:", @" VALUES (?, ?"));
        objc_msgSend(*(id *)(v3 + 24), "appendString:", @", ?");
        v6 = *(void **)(v3 + 24);
        v9 = @", ?";
      }

      else
      {
        objc_msgSend(v7, "appendString:", @" VALUES (?, ?"));
        v6 = *(void **)(v3 + 24);
        v9 = @", ?";
      }
    }

    else
    {
      v9 = @" VALUES (?, ?");
    }

    [v6 appendString:v9];
    return [*(id *)(v3 + 24) appendString:@""]);
  }

  return result;
}

- (uint64_t)prepareMasterReorderStatementForRelationship:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 24) appendString:@"UPDATE OR FAIL "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    [*(id *)(v3 + 24) appendString:@" SET "];
    [*(id *)(v3 + 24) appendString:-[NSSQLManyToMany inverseOrderColumnName](a2)];
    [*(id *)(v3 + 24) appendString:@" = ? WHERE "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    [*(id *)(v3 + 24) appendString:@" = ? AND "];
    [*(id *)(v3 + 24) appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    return [*(id *)(v3 + 24) appendString:@" = ?"];
  }

  return result;
}

- (uint64_t)prepareMasterReorderStatementPart2ForRelationship:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 24) appendString:@"UPDATE OR FAIL "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    [*(id *)(v3 + 24) appendString:@" SET "];
    if (a2) {
      data = a2[2].data;
    }
    else {
      data = 0LL;
    }
    [*(id *)(v3 + 24) appendString:data];
    [*(id *)(v3 + 24) appendString:@" = ? WHERE "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    [*(id *)(v3 + 24) appendString:@" = ? AND "];
    [*(id *)(v3 + 24) appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    return [*(id *)(v3 + 24) appendString:@" = ?"];
  }

  return result;
}

- (uint64_t)prepareReorderStatementForRelationship:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 24) appendString:@"UPDATE OR FAIL "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    [*(id *)(v3 + 24) appendString:@" SET "];
    if (a2) {
      data = a2[2].data;
    }
    else {
      data = 0LL;
    }
    [*(id *)(v3 + 24) appendString:data];
    [*(id *)(v3 + 24) appendString:@" = ?"];
    [*(id *)(v3 + 24) appendString:@" WHERE "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    [*(id *)(v3 + 24) appendString:@" = ? AND "];
    [*(id *)(v3 + 24) appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    return [*(id *)(v3 + 24) appendString:@" = ?"];
  }

  return result;
}

- (uint64_t)prepareDeleteStatementForRelationship:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 24) appendString:@"DELETE FROM "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    [*(id *)(v3 + 24) appendString:@" WHERE "];
    objc_msgSend(*(id *)(v3 + 24), "appendString:", -[__CFString columnName](a2, "columnName"));
    [*(id *)(v3 + 24) appendString:@" = ? AND "];
    [*(id *)(v3 + 24) appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    return [*(id *)(v3 + 24) appendString:@" = ?"];
  }

  return result;
}

- (uint64_t)prepareConstrainedValuesUpdateStatementWithRow:(uint64_t)result
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
    BOOL v4 = 0LL;
  }
  else {
    BOOL v4 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  v5 = (void *)[v4 foreignKeyColumns];
  v6 = (void *)[v4 foreignEntityKeyColumns];
  v7 = (void *)[v4 foreignOrderKeyColumns];
  [*(id *)(v3 + 24) appendString:@"UPDATE OR FAIL "];
  objc_msgSend(*(id *)(v3 + 24), "appendString:", objc_msgSend(v4, "tableName"));
  [*(id *)(v3 + 24) appendString:@" SET "];
  v49 = (void *)a2;
  if (a2) {
    CFBitVectorRef bv = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, 0LL, 8LL);
  }
  else {
    CFBitVectorRef bv = 0LL;
  }
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  v46 = v4;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v45 = v7;
    obuint64_t j = v6;
    uint64_t v10 = 0LL;
    uint64_t v11 = *(void *)v56;
    char v12 = 1;
    uint64_t v13 = bv;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v5);
        }
        v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (CFBitVectorGetBitAtIndex(v13, v10 + i)
          && objc_msgSend((id)objc_msgSend(v15, "toOneRelationship"), "isConstrained"))
        {
          v16 = -[NSSQLBindVariable initWithInt64:sqlType:]( [NSSQLBindVariable alloc],  "initWithInt64:sqlType:",  objc_msgSend((id)objc_msgSend(v49, "valueForKey:", objc_msgSend(v15, "name")), "_referenceData64"),  2);
          -[NSSQLiteStatement addBindVariable:](*(void *)(v3 + 8), v16);

          if ((v12 & 1) == 0) {
            objc_msgSend(*(id *)(v3 + 24), "appendString:", @", ");
          }
          objc_msgSend(*(id *)(v3 + 24), "appendString:", objc_msgSend(v15, "columnName"));
          [*(id *)(v3 + 24) appendString:@" = ?"];
          char v12 = 0;
          uint64_t v13 = bv;
        }
      }

      uint64_t v9 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
      v10 += i;
    }

    while (v9);
    BOOL v4 = v46;
    v6 = obj;
    v7 = v45;
  }

  else
  {
    uint64_t v10 = 0LL;
    char v12 = 1;
  }

  uint64_t v17 = [v6 count];
  uint64_t v18 = [v7 count];
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obja = (id)[v4 attributeColumns];
  uint64_t v19 = [obja countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = v17 + v10 + v18;
    uint64_t v22 = *(void *)v52;
    v24 = (const __CFDate *)v49;
    v23 = bv;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(obja);
        }
        v26 = *(void **)(*((void *)&v51 + 1) + 8 * v25);
        if (CFBitVectorGetBitAtIndex(v23, v21 + v25))
        {
          v27 = (void *)[v26 attributeDescription];
          if (v27) {
            BOOL v28 = [v27 superCompositeAttribute] != 0;
          }
          else {
            BOOL v28 = 0;
          }
          CFDateRef v29 = -[NSSQLRow attributeValueForSlot:](v24, [v26 slot]);
          if (v28) {
            CFDateRef v29 = (CFDateRef)-[__CFDate valueForKeyPath:]( v29,  "valueForKeyPath:",  -[NSPropertyDescription _elementPath]((__CFString *)[v26 propertyDescription]));
          }
          v30 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  v29,  [v26 sqlType],  objc_msgSend(v26, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:](*(void *)(v3 + 8), v30);

          if ((v12 & 1) == 0) {
            objc_msgSend(*(id *)(v3 + 24), "appendString:", @", ");
          }
          objc_msgSend(*(id *)(v3 + 24), "appendString:", objc_msgSend(v26, "columnName"));
          [*(id *)(v3 + 24) appendString:@" = ?"];
          char v12 = 0;
          v24 = (const __CFDate *)v49;
          v23 = bv;
        }

        ++v25;
      }

      while (v20 != v25);
      uint64_t v31 = [obja countByEnumeratingWithState:&v51 objects:v61 count:16];
      uint64_t v20 = v31;
      v21 += v25;
    }

    while (v31);
  }

  else
  {
    v24 = (const __CFDate *)v49;
    v23 = bv;
  }

  if ((v12 & 1) != 0)
  {
    uint64_t v32 = [NSString stringWithUTF8String:"Updating a constrained entity generated an UPDATE statement with no columns on entity %@"];
    uint64_t v33 = [v46 name];
    uint64_t v34 = v32;
    v23 = bv;
    _NSCoreDataLog(17LL, v34, v35, v36, v37, v38, v39, v40, v33);
    v41 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v44 = [v46 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v60 = v44;
      _os_log_fault_impl( &dword_186681000,  v41,  OS_LOG_TYPE_FAULT,  "CoreData: Updating a constrained entity generated an UPDATE statement with no columns on entity %@",  buf,  0xCu);
      if (!bv) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }

  if (v23) {
LABEL_44:
  }
    CFRelease(v23);
LABEL_45:
  if (v24) {
    uint64_t v42 = [*(id *)(*((void *)v24 + 5) + 16) _referenceData64];
  }
  else {
    uint64_t v42 = 0LL;
  }
  v43 = -[NSSQLBindVariable initWithInt64:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithInt64:sqlType:",  v42,  3LL);
  -[NSSQLiteStatement addBindVariable:](*(void *)(v3 + 8), v43);

  return [*(id *)(v3 + 24) appendString:@" WHERE Z_PK = ?"];
}

- (uint64_t)prepareUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v5 = a2;
  uint64_t v6 = result;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
    v7 = 0LL;
  }
  else {
    v7 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v54 = a3;
  uint64_t v8 = (void *)[v7 foreignKeyColumns];
  id v56 = (id)[v7 foreignEntityKeyColumns];
  id v58 = (id)[v7 foreignOrderKeyColumns];
  id v57 = (id)[v7 attributeColumns];
  [*(id *)(v6 + 24) appendString:@"UPDATE OR FAIL "];
  __int128 v53 = v7;
  objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v7, "tableName"));
  [*(id *)(v6 + 24) appendString:@" SET "];
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v74;
    char v13 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if (CFBitVectorGetBitAtIndex(a4, v11 + i))
        {
          v16 = -[NSSQLBindVariable initWithInt64:sqlType:]( [NSSQLBindVariable alloc],  "initWithInt64:sqlType:",  -[NSSQLRow foreignKeyForSlot:](v5, [v15 slot]),  objc_msgSend(v15, "sqlType"));
          -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v16);

          if ((v13 & 1) == 0) {
            objc_msgSend(*(id *)(v6 + 24), "appendString:", @", ");
          }
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v15, "columnName"));
          [*(id *)(v6 + 24) appendString:@" = ?"];
          char v13 = 0;
        }
      }

      uint64_t v10 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      v11 += i;
    }

    while (v10);
  }

  else
  {
    uint64_t v11 = 0LL;
    char v13 = 1;
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  uint64_t v17 = [v56 countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v70;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v70 != v19) {
          objc_enumerationMutation(v56);
        }
        uint64_t v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
        if (CFBitVectorGetBitAtIndex(a4, v11 + v20))
        {
          unsigned int v22 = [v21 slot];
          if (v5) {
            uint64_t v23 = *(unsigned __int16 *)(v5
          }
                                      + _NSSQLRowInstanceSize
                                      + ((2 * *(_DWORD *)(v5 + 16)) & 0x1FFF8)
          else {
            uint64_t v23 = 0LL;
          }
          v24 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]( [NSSQLBindVariable alloc],  "initWithUnsignedInt:sqlType:",  v23,  [v21 sqlType]);
          -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v24);

          if ((v13 & 1) == 0) {
            objc_msgSend(*(id *)(v6 + 24), "appendString:", @", ");
          }
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v21, "columnName"));
          [*(id *)(v6 + 24) appendString:@" = ?"];
          char v13 = 0;
        }

        ++v20;
      }

      while (v18 != v20);
      uint64_t v25 = [v56 countByEnumeratingWithState:&v69 objects:v79 count:16];
      uint64_t v18 = v25;
      v11 += v20;
    }

    while (v25);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  uint64_t v26 = [v58 countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v66;
    do
    {
      uint64_t v29 = 0LL;
      do
      {
        if (*(void *)v66 != v28) {
          objc_enumerationMutation(v58);
        }
        v30 = *(void **)(*((void *)&v65 + 1) + 8 * v29);
        if (CFBitVectorGetBitAtIndex(a4, v11 + v29))
        {
          unsigned int v31 = [v30 slot];
          if (v5) {
            uint64_t v32 = *(unsigned int *)(v5 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(v5 + 16)) & 0x1FFF8) + 4LL * v31);
          }
          else {
            uint64_t v32 = 0LL;
          }
          uint64_t v33 = -[NSSQLBindVariable initWithUnsignedInt:sqlType:]( [NSSQLBindVariable alloc],  "initWithUnsignedInt:sqlType:",  v32,  [v30 sqlType]);
          -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v33);

          if ((v13 & 1) == 0) {
            objc_msgSend(*(id *)(v6 + 24), "appendString:", @", ");
          }
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v30, "columnName"));
          [*(id *)(v6 + 24) appendString:@" = ?"];
          char v13 = 0;
        }

        ++v29;
      }

      while (v27 != v29);
      uint64_t v34 = [v58 countByEnumeratingWithState:&v65 objects:v78 count:16];
      uint64_t v27 = v34;
      v11 += v29;
    }

    while (v34);
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v35 = [v57 countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    id v59 = *(id *)v62;
    do
    {
      uint64_t v37 = 0LL;
      do
      {
        if (*(id *)v62 != v59) {
          objc_enumerationMutation(v57);
        }
        uint64_t v38 = *(void **)(*((void *)&v61 + 1) + 8 * v37);
        if (CFBitVectorGetBitAtIndex(a4, v11 + v37))
        {
          if ([v38 isConstrained])
          {
            CFDateRef v39 = 0LL;
          }

          else
          {
            uint64_t v40 = (void *)[v38 attributeDescription];
            if (v40) {
              BOOL v41 = [v40 superCompositeAttribute] != 0;
            }
            else {
              BOOL v41 = 0;
            }
            CFDateRef v39 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)v5, [v38 slot]);
            if (v41) {
              CFDateRef v39 = (CFDateRef)-[__CFDate valueForKeyPath:]( v39,  "valueForKeyPath:",  -[NSPropertyDescription _elementPath]((__CFString *)[v38 propertyDescription]));
            }
          }

          uint64_t v42 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  v39,  [v38 sqlType],  objc_msgSend(v38, "attributeDescription"));
          -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v42);

          if ((v13 & 1) == 0) {
            objc_msgSend(*(id *)(v6 + 24), "appendString:", @", ");
          }
          objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v38, "columnName"));
          [*(id *)(v6 + 24) appendString:@" = ?"];
          char v13 = 0;
        }

        ++v37;
      }

      while (v36 != v37);
      uint64_t v43 = [v57 countByEnumeratingWithState:&v61 objects:v77 count:16];
      uint64_t v36 = v43;
      v11 += v37;
    }

    while (v43);
  }

  if (v53) {
    uint64_t v44 = (void *)v53[18];
  }
  else {
    uint64_t v44 = 0LL;
  }
  if (v54) {
    uint64_t v45 = *(unsigned int *)(*(void *)(v54 + 40) + 12LL) + 1LL;
  }
  else {
    uint64_t v45 = 1LL;
  }
  [(id)v5 setOptLock:v45];
  v46 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
  if (v5) {
    uint64_t v47 = *(unsigned int *)(*(void *)(v5 + 40) + 12LL);
  }
  else {
    uint64_t v47 = 0LL;
  }
  v48 = -[NSSQLBindVariable initWithInt64:sqlType:](v46, "initWithInt64:sqlType:", v47, [v44 sqlType]);
  -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v48);

  if ((v13 & 1) == 0) {
    objc_msgSend(*(id *)(v6 + 24), "appendString:", @", ");
  }
  objc_msgSend(*(id *)(v6 + 24), "appendString:", objc_msgSend(v44, "columnName"));
  [*(id *)(v6 + 24) appendString:@" = ?"];
  [*(id *)(v6 + 24) appendString:@" "];
  if (!v54)
  {
    uint64_t v49 = 0LL;
    if (!v5) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }

  uint64_t v49 = *(unsigned int *)(*(void *)(v54 + 40) + 12LL);
  if (v5) {
LABEL_79:
  }
    uint64_t v5 = [*(id *)(*(void *)(v5 + 40) + 16) _referenceData64];
LABEL_80:
  if (v49) {
    v50 = @" WHERE Z_PK = ? AND Z_OPT = ?";
  }
  else {
    v50 = @" WHERE Z_PK = ? AND (Z_OPT = ? OR Z_OPT IS NULL)";
  }
  __int128 v51 = -[NSSQLBindVariable initWithInt64:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithInt64:sqlType:",  v5,  3LL);
  -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v51);

  __int128 v52 = -[NSSQLBindVariable initWithInt64:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithInt64:sqlType:",  v49,  3LL);
  -[NSSQLiteStatement addBindVariable:](*(void *)(v6 + 8), v52);

  [*(id *)(v6 + 32) appendString:v50];
  result = [@" WHERE  (1 = 1) " isEqual:*(void *)(v6 + 32)];
  if ((result & 1) == 0) {
    return [*(id *)(v6 + 24) appendString:*(void *)(v6 + 32)];
  }
  return result;
}

- (void)prepareDeleteStatementWithRow:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
      BOOL v4 = 0LL;
    }
    else {
      BOOL v4 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    [*(id *)(a1 + 24) appendString:@"DELETE FROM "];
    objc_msgSend( *(id *)(a1 + 24),  "appendString:",  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "entity"), "tableName"));
    if (v4)
    {
      uint64_t v5 = (void *)v4[16];
      BOOL v4 = (void *)v4[18];
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    [*(id *)(a1 + 24) appendString:objc_msgSend( NSString, "stringWithFormat:", @" WHERE %@ = ? AND %@ = ?", objc_msgSend(v5, "columnName"), objc_msgSend(v4, "columnName"))];
    uint64_t v6 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
    if (v2) {
      uint64_t v7 = [*(id *)(*(void *)(v2 + 40) + 16) _referenceData64];
    }
    else {
      uint64_t v7 = 0LL;
    }
    uint64_t v8 = -[NSSQLBindVariable initWithInt64:sqlType:](v6, "initWithInt64:sqlType:", v7, [v5 sqlType]);
    -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v8);

    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
    if (v2) {
      uint64_t v2 = *(unsigned int *)(*(void *)(v2 + 40) + 12LL);
    }
    uint64_t v10 = -[NSSQLBindVariable initWithInt64:sqlType:](v9, "initWithInt64:sqlType:", v2, [v4 sqlType]);
    -[NSSQLiteStatement addBindVariable:](*(void *)(a1 + 8), v10);
  }

@end