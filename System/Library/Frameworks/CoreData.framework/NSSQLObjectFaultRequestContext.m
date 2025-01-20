@interface NSSQLObjectFaultRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (NSSQLFetchRequestContext)createFetchRequestContext;
- (NSSQLObjectFaultRequestContext)initWithObjectID:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLObjectFaultRequestContext

- (NSSQLObjectFaultRequestContext)initWithObjectID:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLObjectFaultRequestContext;
  v6 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( &v8,  sel_initWithRequest_context_sqlCore_,  0LL,  a4,  a5);
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_forConflictAnalysis = 0;
  }

  return v6;
}

- (BOOL)executeRequestCore:(id *)a3
{
  id v5 = _executeNewRowValuesForObjectFaultRequest(self);
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", v5);

  if (a3 && *a3)
  {
    if (self)
    {
      objc_setProperty_nonatomic(self, v6, *a3, 40LL);
      return !self->super._exception && self->super._error == 0LL;
    }

    return 1;
  }

  if (!self) {
    return 1;
  }
  return !self->super._exception && self->super._error == 0LL;
}

- (NSSQLFetchRequestContext)createFetchRequestContext
{
  v1 = a1;
  if (a1)
  {
    externalDataLinksDirectory = a1->_externalDataLinksDirectory;
    if (!externalDataLinksDirectory)
    {
      v3 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
      v1->_externalDataLinksDirectory = (NSString *)v3;
      -[NSFetchRequest setEntity:](v3, "setEntity:", -[NSString entity](v1->_externalDataReferencesDirectory, "entity"));
      uint64_t v4 = -[NSString _referenceData64](v1->_externalDataReferencesDirectory, "_referenceData64");
      id v5 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithLongLong:v4];
      v6 = (void *)[objc_alloc(MEMORY[0x189607830]) initWithObject:v5];

      v7 = (void *)[objc_alloc(MEMORY[0x1896078E8]) initWithObject:@"_pk"];
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1896078E0]) initWithKeyPath:v7];

      v9 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v8 rightExpression:v6 modifier:0 type:4 options:0];
      -[NSString setPredicate:](v1->_externalDataLinksDirectory, "setPredicate:", v9);
      -[NSString setIncludesSubentities:](v1->_externalDataLinksDirectory, "setIncludesSubentities:", 0LL);

      externalDataLinksDirectory = v1->_externalDataLinksDirectory;
    }

    v1 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext),  "initWithRequest:context:sqlCore:",  externalDataLinksDirectory,  v1->super._context,  v1->super._sqlCore);
    -[NSSQLFetchRequestContext setIsFaultRequest:](v1, "setIsFaultRequest:", 1LL);
  }

  return v1;
}

- (void)dealloc
{
  self->_objectID = 0LL;
  self->_fetchRequest = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLObjectFaultRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

@end