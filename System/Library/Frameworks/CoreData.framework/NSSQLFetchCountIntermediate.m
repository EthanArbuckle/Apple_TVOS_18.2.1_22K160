@interface NSSQLFetchCountIntermediate
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLFetchCountIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  if ((unint64_t)(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"storeRequest"), "fetchLimit")
                        - 10001) > 0xFFFFFFFFFFFFD8EFLL)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___NSSQLColumn);
    -[NSSQLColumn _setColumnName:]((uint64_t)v15, @"Z_PK");
    if (v15) {
      *(_WORD *)&v15->super._flags |= 1u;
    }
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___NSSQLFetchCountIntermediate;
    v16 = -[NSSQLFetchIntermediate selectIntermediate](&v21, sel_selectIntermediate);
    if (v16) {
      v16[48] = 1;
    }
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___NSSQLFetchCountIntermediate;
    id v17 = -[NSSQLFetchIntermediate selectIntermediate](&v20, sel_selectIntermediate);
    -[NSSQLSelectIntermediate setFetchColumns:]( (uint64_t)v17,  (void *)[MEMORY[0x189603F18] arrayWithObject:v15]);

    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NSSQLFetchCountIntermediate;
    id v18 = -[NSSQLFetchIntermediate generateSQLStringInContext:](&v19, sel_generateSQLStringInContext_, a3);
    if (![a3 objectForKey:@"NSUnderlyingException"])
    {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @"SELECT COUNT(*) FROM (");
      [v5 appendString:v18];
      [v5 appendString:@""]);

      return v5;
    }

    return 0LL;
  }

  -[NSSQLStatementIntermediate setLimitIntermediate:]((uint64_t)self, 0LL);
  v7 = objc_alloc_init(&OBJC_CLASS___NSSQLColumn);
  -[NSSQLColumn _setColumnName:]((uint64_t)v7, @"Z_PK");
  if (v7) {
    *(_WORD *)&v7->super._flags |= 1u;
  }
  id v8 = -[NSSQLFetchIntermediate selectIntermediate](self, "selectIntermediate");
  -[NSSQLSelectIntermediate setFetchColumns:]( (uint64_t)v8,  (void *)[MEMORY[0x189603F18] arrayWithObject:v7]);

  v9 = -[NSSQLFetchIntermediate selectIntermediate](self, "selectIntermediate");
  if (v9) {
    v9[48] = 1;
  }
  v10 = -[NSSQLFetchIntermediate selectIntermediate](self, "selectIntermediate");
  if (v10) {
    v10[64] = 1;
  }
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NSSQLFetchCountIntermediate;
  id v5 = -[NSSQLFetchIntermediate generateSQLStringInContext:](&v22, sel_generateSQLStringInContext_, a3);
  v11 = (void *)[v5 componentsSeparatedByString:@" "];
  if ((unint64_t)[v11 count] >= 6
    && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "isEqualToString:", @"SELECT")
    && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "isEqualToString:", @"COUNT("))
  {
    uint64_t v12 = objc_msgSend( (id)objc_msgSend(v11, "objectAtIndex:", 2),  "isEqualToString:",  @"DISTINCT")
        ? 3LL
        : 2LL;
    if (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v12), "isEqualToString:", @"t0.Z_PK")))
    {
      if (objc_msgSend( (id)objc_msgSend(v11, "objectAtIndex:", v12 + 1),  "isEqualToString:",  @"FROM"))
      {
        uint64_t v13 = [v11 objectAtIndex:v12 + 2];
        if (objc_msgSend( (id)objc_msgSend(v11, "objectAtIndex:", v12 + 3),  "isEqualToString:",  @"t0"))
        {
          unint64_t v14 = v12 | 4;
          if (v14 >= [v11 count])
          {
LABEL_23:

            return (id)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"SELECT COUNT(*) FROM %@", v13];
          }

          else
          {
            while ((objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v14), "isEqualToString:", &stru_189EAC2E8) & 1) != 0)
            {
              if (++v14 >= [v11 count]) {
                goto LABEL_23;
              }
            }
          }
        }
      }
    }
  }

  return v5;
}

@end