@interface NSSQLRelationshipFaultRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (NSSQLRelationshipFaultRequestContext)initWithObjectID:(id)a3 relationship:(id)a4 context:(id)a5 sqlCore:(id)a6;
- (void)dealloc;
@end

@implementation NSSQLRelationshipFaultRequestContext

- (NSSQLRelationshipFaultRequestContext)initWithObjectID:(id)a3 relationship:(id)a4 context:(id)a5 sqlCore:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLRelationshipFaultRequestContext;
  v8 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( &v10,  sel_initWithRequest_context_sqlCore_,  0LL,  a5,  a6);
  if (v8)
  {
    v8->_relationship = (NSRelationshipDescription *)a4;
    v8->_objectID = (NSManagedObjectID *)a3;
  }

  return v8;
}

- (BOOL)executeRequestCore:(id *)a3
{
  v6 = v5;
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", v5);

  if (a3 && *a3)
  {
    if (self)
    {
      objc_setProperty_nonatomic(self, v7, *a3, 40LL);
      return !self->super._exception && self->super._error == 0LL;
    }

    return 1;
  }

  if (!self) {
    return 1;
  }
  return !self->super._exception && self->super._error == 0LL;
}

- (void)dealloc
{
  self->_relationship = 0LL;
  self->_objectID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLRelationshipFaultRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

@end