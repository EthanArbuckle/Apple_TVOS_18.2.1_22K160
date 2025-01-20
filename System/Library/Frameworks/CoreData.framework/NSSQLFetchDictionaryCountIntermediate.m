@interface NSSQLFetchDictionaryCountIntermediate
- (NSSQLFetchDictionaryCountIntermediate)initWithFetchIntermediate:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLFetchDictionaryCountIntermediate

- (NSSQLFetchDictionaryCountIntermediate)initWithFetchIntermediate:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLFetchDictionaryCountIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5) {
    v5->_realFetch = (NSSQLFetchIntermediate *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_realFetch = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLFetchDictionaryCountIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  id v6 = -[NSSQLFetchIntermediate generateSQLStringInContext:](self->_realFetch, "generateSQLStringInContext:", a3);
  if (!v6)
  {
    if (![a3 objectForKey:@"NSUnderlyingException"]) {
      objc_msgSend( a3,  "setValue:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Unable to generate SQL for fetch",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(a3, "objectForKey:", @"outerFetch"),  @"Bad request")),  @"NSUnderlyingException");
    }
    return 0LL;
  }

  objc_super v7 = v6;
  v8 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"SELECT COUNT(*) from (%@)", v6];

  return v8;
}

@end