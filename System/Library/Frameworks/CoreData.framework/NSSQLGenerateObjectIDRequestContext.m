@interface NSSQLGenerateObjectIDRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (id)initForEntitiesAndCounts:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLGenerateObjectIDRequestContext

- (id)initForEntitiesAndCounts:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLGenerateObjectIDRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v9, sel_initWithRequest_context_sqlCore_, 0LL, a4);
  if (v7)
  {
    v7->_entitiesAndCounts = (NSDictionary *)a3;
    v7->_model = (NSSQLModel *)(id)[a5 model];
  }

  return v7;
}

- (void)dealloc
{
  self->_entitiesAndCounts = 0LL;
  self->_model = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLGenerateObjectIDRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  if (a3 && *a3)
  {
    if (!self) {
      return -[NSSQLStoreRequestContext result](self, "result") != 0;
    }
    objc_setProperty_nonatomic(self, v6, *a3, 40LL);
  }

  else if (!self)
  {
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  }

  if (self->super._exception || self->super._error) {
    return 0;
  }
  return -[NSSQLStoreRequestContext result](self, "result") != 0;
}

@end