@interface NSSQLCompoundWhereIntermediate
- (BOOL)disambiguationKeypathHasToMany;
- (BOOL)isOrScoped;
- (NSSQLCompoundWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5;
- (id)disambiguatingEntity;
- (id)disambiguationKeypath;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5;
@end

@implementation NSSQLCompoundWhereIntermediate

- (NSSQLCompoundWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSSQLCompoundWhereIntermediate;
  v6 = -[NSSQLWhereIntermediate initWithPredicate:inScope:](&v20, sel_initWithPredicate_inScope_, a3, a4);
  if (v6)
  {
    v6->_subclauses = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v7 = (void *)-[NSPredicate subpredicates](v6->super._predicate, "subpredicates");
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLSimpleWhereIntermediate),  "initWithPredicate:inScope:",  v12,  v6);
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_15;
            }
            v13 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]( objc_alloc(&OBJC_CLASS___NSSQLCompoundWhereIntermediate),  "initWithPredicate:inScope:inContext:",  v12,  v6,  a5);
          }

          v14 = v13;
          if (!v13)
          {
LABEL_15:
            if (![a5 objectForKey:@"NSUnderlyingException"]) {
              [a5 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend(NSString, "stringWithFormat:", @"Problem with subpredicate %@", v12), 0), @"NSUnderlyingException" forKey];
            }

            return 0LL;
          }

          -[NSMutableArray addObject:](v6->_subclauses, "addObject:", v13);
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  return v6;
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  uint64_t v7 = -[NSPredicate compoundPredicateType](self->super._predicate, "compoundPredicateType");
  if ((unint64_t)(v7 - 1) < 2)
  {
    id v8 = objc_alloc_init(MEMORY[0x189607940]);
    if (-[NSPredicate compoundPredicateType](self->super._predicate, "compoundPredicateType") == 1) {
      uint64_t v9 = @" AND ";
    }
    else {
      uint64_t v9 = @" OR ";
    }
    objc_msgSend(v8, "appendString:", @"(");
    uint64_t v10 = objc_msgSend( (id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", 0),  "generateSQLStringInContext:",  a3);
    if (v10)
    {
      v11 = (void *)v10;
      [v8 appendString:v10];

      unint64_t v12 = -[NSMutableArray count](self->_subclauses, "count");
      if (v12 < 2)
      {
LABEL_13:
        [v8 appendString:@""]);
LABEL_20:

        return v8;
      }

      unint64_t v13 = v12;
      uint64_t v14 = 1LL;
      while (1)
      {
        [v8 appendString:v9];
        uint64_t v15 = objc_msgSend( (id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", v14),  "generateSQLStringInContext:",  a3);
        if (!v15) {
          break;
        }
        __int128 v16 = (void *)v15;
        [v8 appendString:v15];

        if (v13 == ++v14) {
          goto LABEL_13;
        }
      }
    }

    id v8 = 0LL;
    goto LABEL_20;
  }

  if (v7)
  {
    [a3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unknown compound predicate type %@", self->super._predicate), 0), @"NSUnderlyingException" forKey];
    goto LABEL_22;
  }

  objc_msgSend(v5, "appendString:", @" NOT (");
  uint64_t v17 = objc_msgSend( (id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", 0),  "generateSQLStringInContext:",  a3);
  if (!v17)
  {
LABEL_22:

    return 0LL;
  }

  __int128 v18 = (void *)v17;
  [v5 appendString:v17];
  [v5 appendString:@""]);

  if (v5) {
    return v5;
  }
  if (![a3 objectForKey:@"NSUnderlyingException"])
  {
    __int128 v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    uint64_t v21 = [NSString stringWithFormat:@"Unable to generate compound where clause for predicate (%@) (unknown problem)", self->super._predicate];
    objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend( v19,  "exceptionWithName:reason:userInfo:",  v20,  v21,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", self->super._predicate, @"predicate")),  @"NSUnderlyingException");
  }

  return 0LL;
}

- (id)disambiguatingEntity
{
  if (self->_disambiguatingEntity) {
    return self->_disambiguatingEntity;
  }
  else {
    return -[NSSQLIntermediate disambiguatingEntity](self->super.super._scope, "disambiguatingEntity");
  }
}

- (BOOL)isOrScoped
{
  return -[NSPredicate compoundPredicateType](self->super._predicate, "compoundPredicateType") == 2
      || -[NSSQLIntermediate isOrScoped](self->super.super._scope, "isOrScoped");
}

- (id)disambiguationKeypath
{
  if (self->_disambiguationKeypath) {
    return self->_disambiguationKeypath;
  }
  else {
    return -[NSSQLIntermediate disambiguationKeypath](self->super.super._scope, "disambiguationKeypath");
  }
}

- (void)dealloc
{
  self->_subclauses = 0LL;
  self->_disambiguationKeypath = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLCompoundWhereIntermediate;
  -[NSSQLCompoundWhereIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)disambiguationKeypathHasToMany
{
  if (self->_disambiguationKeypath) {
    return self->_disambiguationKeypathHasToMany;
  }
  else {
    return -[NSSQLIntermediate disambiguationKeypathHasToMany]( self->super.super._scope,  "disambiguationKeypathHasToMany");
  }
}

- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5
{
  self->_disambiguatingEntity = (NSSQLEntity *)a3;
  self->_disambiguationKeypath = (NSArray *)a4;
  self->_disambiguationKeypathHasToMany = a5;
}

@end