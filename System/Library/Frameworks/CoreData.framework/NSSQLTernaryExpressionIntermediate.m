@interface NSSQLTernaryExpressionIntermediate
- (BOOL)disambiguationKeypathHasToMany;
- (id)disambiguatingEntity;
- (id)disambiguationKeypath;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5;
@end

@implementation NSSQLTernaryExpressionIntermediate

- (void)dealloc
{
  self->_disambiguationKeypath = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLTernaryExpressionIntermediate;
  -[NSSQLTernaryExpressionIntermediate dealloc](&v3, sel_dealloc);
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

- (id)disambiguationKeypath
{
  if (self->_disambiguationKeypath) {
    return self->_disambiguationKeypath;
  }
  else {
    return -[NSSQLIntermediate disambiguationKeypath](self->super.super._scope, "disambiguationKeypath");
  }
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

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  if (-[NSSQLIntermediate isIndexExpressionScoped](self, "isIndexExpressionScoped")) {
    objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Ternary expression not supported as index component",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", self->super._expression, @"Bad value")),  @"NSUnderlyingException");
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", CFSTR("(CASE ("));
  v6 = -[NSExpression predicate](self->super._expression, "predicate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLSimpleWhereIntermediate),  "initWithPredicate:inScope:",  v6,  self);
    if (!v7)
    {
      if (![a3 objectForKey:@"NSUnderlyingException"])
      {
        v8 = @"Can't generate intermediate for ternary expression predicate.";
LABEL_15:
        objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], v8, 0),  @"NSUnderlyingException");
        goto LABEL_16;
      }

      goto LABEL_16;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = @"Can't generate intermediate for ternary expression predicate (unknown type)";
      goto LABEL_15;
    }

    v7 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]( objc_alloc(&OBJC_CLASS___NSSQLCompoundWhereIntermediate),  "initWithPredicate:inScope:inContext:",  v6,  self,  a3);
    if (!v7)
    {
LABEL_16:
      if ([a3 objectForKey:@"NSUnderlyingException"])
      {
LABEL_19:

        return 0LL;
      }

      v14 = (void *)MEMORY[0x189603F70];
      uint64_t v15 = *MEMORY[0x189603A60];
      v16 = @"Can't generate SQL for ternary expression predicate.";
LABEL_18:
      objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0),  @"NSUnderlyingException");
      goto LABEL_19;
    }
  }

  id v9 = -[NSSQLSimpleWhereIntermediate generateSQLStringInContext:](v7, "generateSQLStringInContext:", a3);

  if (!v9) {
    goto LABEL_16;
  }
  [v5 appendString:v9];

  [v5 appendString:@" when 1 then (")];
  id v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]( self,  -[NSExpression trueExpression](self->super._expression, "trueExpression"),  self->super._allowToMany,  a3);
  if (!v10)
  {
    if ([a3 objectForKey:@"NSUnderlyingException"]) {
      goto LABEL_19;
    }
    v14 = (void *)MEMORY[0x189603F70];
    uint64_t v15 = *MEMORY[0x189603A60];
    v16 = @"Can't generate SQL for ternary expression trueExpression.";
    goto LABEL_18;
  }

  v11 = v10;
  [v5 appendString:v10];

  [v5 appendString:@" else (")];
  id v12 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]( self,  -[NSExpression falseExpression](self->super._expression, "falseExpression"),  self->super._allowToMany,  a3);
  if (!v12)
  {
    if ([a3 objectForKey:@"NSUnderlyingException"]) {
      goto LABEL_19;
    }
    v14 = (void *)MEMORY[0x189603F70];
    uint64_t v15 = *MEMORY[0x189603A60];
    v16 = @"Can't generate SQL for ternary expression falseExpression.";
    goto LABEL_18;
  }

  v13 = v12;
  [v5 appendString:v12];

  [v5 appendString:@" end]"));
  return v5;
}

@end