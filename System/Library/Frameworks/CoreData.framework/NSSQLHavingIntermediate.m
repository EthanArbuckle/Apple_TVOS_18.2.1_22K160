@interface NSSQLHavingIntermediate
- (BOOL)isHavingScoped;
- (NSSQLHavingIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLHavingIntermediate

- (NSSQLHavingIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSQLHavingIntermediate;
  v7 = -[NSSQLIntermediate initWithScope:](&v11, sel_initWithScope_, a4);
  v8 = v7;
  if (a3 && v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]( objc_alloc(&OBJC_CLASS___NSSQLCompoundWhereIntermediate),  "initWithPredicate:inScope:inContext:",  a3,  v8,  a5);
        v8->_whereClause = &v9->super;
        if (v9) {
          return v8;
        }
      }

      else
      {
        [a5 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unknown predicate type for having predicate: %@", a3), 0), @"NSUnderlyingException" forKey];
      }

      return 0LL;
    }

    v8->_whereClause = (NSSQLWhereIntermediate *)-[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLSimpleWhereIntermediate),  "initWithPredicate:inScope:",  a3,  v8);
  }

  return v8;
}

- (void)dealloc
{
  self->_whereClause = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLHavingIntermediate;
  -[NSSQLHavingIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isHavingScoped
{
  return 1;
}

- (id)generateSQLStringInContext:(id)a3
{
  if (!-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped")) {
    return -[NSSQLIntermediate generateSQLStringInContext:](self->_whereClause, "generateSQLStringInContext:", a3);
  }
  [a3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported clause (having not allowed in updates)"), 0), @"NSUnderlyingException" forKey];
  return 0LL;
}

@end