@interface _PFPersistentHistoryFetchModel
+ (id)ancillaryModelNamespace;
+ (id)newFetchHistoryModelForCoordinator:andOptions:;
+ (unint64_t)ancillaryEntityCount;
+ (unint64_t)ancillaryEntityOffset;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
@end

@implementation _PFPersistentHistoryFetchModel

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    objc_opt_self();
  }
}

+ (void)_invalidateStaticCaches
{
  uint64_t v2 = (void *)historyFetchModel;
  if (historyFetchModel)
  {
    while (1)
    {
      unint64_t v3 = __ldaxr((unint64_t *)&historyFetchModel);
      if (!__stlxr(0LL, (unint64_t *)&historyFetchModel))
      {

        return;
      }
    }

    __clrex();
  }

+ (id)newFetchHistoryModelForCoordinator:andOptions:
{
  v19[2] = *MEMORY[0x1895F89C0];
  uint64_t v0 = objc_opt_self();
  if (!historyFetchModel)
  {
    v1 = (void *)MEMORY[0x186E3E5D8](v0);
    id v2 = -[NSEntityDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSEntityDescription),  "_initWithName:",  @"Transaction");
    id v3 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"author",  700LL);
    [v2 _addProperty:v3];

    id v4 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"contextName",  700LL);
    [v2 _addProperty:v4];

    id v5 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"bundleID",  700LL);
    [v2 _addProperty:v5];

    id v6 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"processID",  700LL);
    [v2 _addProperty:v6];

    id v7 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"timestamp",  900LL);
    [v2 _addProperty:v7];

    id v8 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"transactionNumber",  300LL);
    [v2 _addProperty:v8];

    id v9 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"token",  300LL);
    [v2 _addProperty:v9];

    id v10 = -[NSEntityDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSEntityDescription),  "_initWithName:",  @"Change");
    id v11 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"changeID",  300LL);
    [v10 _addProperty:v11];

    id v12 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"changeType",  300LL);
    [v10 _addProperty:v12];

    id v13 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"changedEntity",  300LL);
    [v10 _addProperty:v13];

    v14 = objc_alloc_init(&OBJC_CLASS___NSAttributeDescription);
    -[NSPropertyDescription setName:](v14, "setName:", @"changedObjectID");
    if (v14)
    {
      -[NSPropertyDescription _throwIfNotEditable](v14, "_throwIfNotEditable");
      v14->_type = 2000;
    }

    [v10 _addProperty:v14];

    [v2 _flattenProperties];
    [v10 _flattenProperties];
    v15 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
    v19[0] = v2;
    v19[1] = v10;
    id v16 = -[NSManagedObjectModel _initWithEntities:]( v15,  "_initWithEntities:",  [MEMORY[0x189603F18] arrayWithObjects:v19 count:2]);
    objc_msgSend( v16,  "_setModelsReferenceIDOffset:",  +[_PFPersistentHistoryFetchModel ancillaryEntityOffset]( _PFPersistentHistoryFetchModel,  "ancillaryEntityOffset"));
    [v16 _setIsEditable:0];

    objc_autoreleasePoolPop(v1);
    while (!__ldaxr((unint64_t *)&historyFetchModel))
    {
    }

    __clrex();
  }

  return (id)historyFetchModel;
}

+ (id)ancillaryModelNamespace
{
  return @"PersistentFetchHistory";
}

+ (unint64_t)ancillaryEntityCount
{
  return 2LL;
}

+ (unint64_t)ancillaryEntityOffset
{
  return 16050LL;
}

@end