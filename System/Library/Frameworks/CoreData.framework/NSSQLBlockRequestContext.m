@interface NSSQLBlockRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSSQLBlockRequestContext)initWithBlock:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLBlockRequestContext

- (NSSQLBlockRequestContext)initWithBlock:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLBlockRequestContext;
  v6 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( &v8,  sel_initWithRequest_context_sqlCore_,  0LL,  a4,  a5);
  if (v6) {
    v6->_workBlock = (id)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  self->_workBlock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBlockRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  if (a3 && *a3) {
    objc_setProperty_nonatomic(self, v5, *a3, 40LL);
  }
  return !self->super._exception && self->super._error == 0LL;
}

@end