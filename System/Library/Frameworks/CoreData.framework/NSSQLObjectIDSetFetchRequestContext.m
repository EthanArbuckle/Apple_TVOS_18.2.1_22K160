@interface NSSQLObjectIDSetFetchRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (NSSQLObjectIDSetFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5 idSets:(id)a6 columnName:(id)a7;
- (void)dealloc;
@end

@implementation NSSQLObjectIDSetFetchRequestContext

- (NSSQLObjectIDSetFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5 idSets:(id)a6 columnName:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSQLObjectIDSetFetchRequestContext;
  v9 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( &v11,  sel_initWithRequest_context_sqlCore_,  a3,  a4,  a5);
  if (v9)
  {
    v9->_idSets = (NSArray *)a6;
    v9->_columnName = (NSString *)a7;
  }

  return v9;
}

- (void)dealloc
{
  self->_idSets = 0LL;
  self->_columnName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLObjectIDSetFetchRequestContext;
  -[NSSQLFetchRequestContext dealloc](&v3, sel_dealloc);
}

- (BOOL)executeRequestCore:(id *)a3
{
  id v5 = _newObjectIDSetsForRequest(self, self->_idSets, (uint64_t)self->_columnName);
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", v5);

  if (a3 && *a3) {
    objc_setProperty_nonatomic(self, v6, *a3, 40LL);
  }
  return !self->super.super._exception
      && !self->super.super._error
      && -[NSSQLStoreRequestContext result](self, "result") != 0;
}

@end