@interface NSSQLitePrefetchRequestCache
- (NSSQLitePrefetchRequestCache)initWithSQLCore:(id)a3;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLitePrefetchRequestCache

- (NSSQLitePrefetchRequestCache)initWithSQLCore:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLitePrefetchRequestCache;
  v4 = -[NSSQLitePrefetchRequestCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_sqlCore, a3);
    v6 = (void *)[a3 model];
    if (v6) {
      v6 = (void *)v6[4];
    }
    uint64_t v7 = [v6 count];
    v5->_length = v7;
    v5->_prefetchRequestsByEntity = (id *)PF_CALLOC_OBJECT_ARRAY(v7 + 1);
  }

  return v5;
}

- (void)dealloc
{
  unint64_t length = self->_length;
  if (length)
  {
    for (unint64_t i = 1LL; i <= length; ++i)
    {
      id v5 = self->_prefetchRequestsByEntity[i];
      if (v5) {
    }
      }
  }

  PF_FREE_OBJECT_ARRAY(self->_prefetchRequestsByEntity);
  self->_prefetchRequestsByEntity = 0LL;
  objc_storeWeak((id *)&self->_sqlCore, 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLitePrefetchRequestCache;
  -[NSSQLitePrefetchRequestCache dealloc](&v6, sel_dealloc);
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak) {
    return 0LL;
  }
  v8 = Weak;
  id v9 = -[NSEntityDescription _relationshipNamed:](a4, (uint64_t)a3);
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v8, a4);
  uint64_t v11 = [(id)v10 model];
  if (v11 != [v8 model]) {
    return 0LL;
  }
  if (v10) {
    v14 = (void *)[*(id *)(v10 + 40) objectForKey:a3];
  }
  else {
    v14 = 0LL;
  }
  int v15 = [v14 isToMany];
  int v16 = [v9 isOrdered];
  if (!v14)
  {
    v17 = 0LL;
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  v17 = (void *)v14[7];
  if (v10) {
LABEL_9:
  }
    uint64_t v10 = *(unsigned int *)(v10 + 184);
LABEL_10:
  v18 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v10];
  if (!v18)
  {
    v18 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v10] = v18;
  }

  v12 = (NSCachingFetchRequest *)-[NSKnownKeysDictionary objectForKey:](v18, "objectForKey:", a3);
  if (!v12)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___NSCachingFetchRequest);
    -[NSCachingFetchRequest _disableSQLStatementCaching](v12, "_disableSQLStatementCaching");
    -[NSFetchRequest setEntity:]( v12,  "setEntity:",  objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription"));
    uint64_t v19 = [MEMORY[0x189607878] expressionForVariable:@"destinations"];
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1896078E8]), "initWithObject:", objc_msgSend(v17, "name"));
    v21 = (void *)[objc_alloc(MEMORY[0x1896078E0]) initWithKeyPath:v20];

    v22 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v21 rightExpression:v19 modifier:0 type:10 options:0];
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v22);

    if (v15)
    {
      v23 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607A20]),  "initWithKey:ascending:",  objc_msgSend((id)objc_msgSend(v17, "foreignKey"), "name"),  1);
      if (v16)
      {
        id v24 = objc_alloc(MEMORY[0x189607A20]);
        if (v17) {
          v25 = (void *)v17[10];
        }
        else {
          v25 = 0LL;
        }
        v26 = (void *)objc_msgSend(v24, "initWithKey:ascending:", objc_msgSend(v25, "name"), 1);
      }

      else
      {
        v26 = 0LL;
      }

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v23, v26, 0);

      -[NSFetchRequest setSortDescriptors:](v12, "setSortDescriptors:", v27);
    }

    v28 = v12;
  }

  return v12;
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak) {
    return 0LL;
  }
  v8 = Weak;
  uint64_t v9 = _sqlCoreLookupSQLEntityForEntityDescription(Weak, a4);
  uint64_t v10 = [(id)v9 model];
  if (v10 != [v8 model]) {
    return 0LL;
  }
  if (v9)
  {
    v13 = (void *)[*(id *)(v9 + 40) objectForKey:a3];
    uint64_t v9 = *(unsigned int *)(v9 + 184);
  }

  else
  {
    v13 = 0LL;
  }

  v14 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v9];
  if (!v14)
  {
    v14 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v9] = v14;
  }

  uint64_t v11 = (NSCachingFetchRequest *)-[NSKnownKeysDictionary objectForKey:](v14, "objectForKey:", a3);
  if (!v11)
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSCachingFetchRequest);
    -[NSCachingFetchRequest _disableSQLStatementCaching](v11, "_disableSQLStatementCaching");
    -[NSFetchRequest setEntity:]( v11,  "setEntity:",  objc_msgSend((id)objc_msgSend(v13, "destinationEntity"), "entityDescription"));
    uint64_t v15 = _SELF_Expression;
    uint64_t v16 = [MEMORY[0x189607878] expressionForVariable:@"objects"];
    v17 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v15 rightExpression:v16 modifier:0 type:10 options:0];
    -[NSFetchRequest setPredicate:](v11, "setPredicate:", v17);

    v18 = v11;
  }

  return v11;
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak) {
    return 0LL;
  }
  uint64_t v8 = _sqlCoreLookupSQLEntityForEntityDescription(Weak, a4);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[*(id *)(v8 + 40) objectForKey:a3];
    uint64_t v9 = *(unsigned int *)(v9 + 184);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v9];
  if (!v11)
  {
    uint64_t v11 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v9] = v11;
  }

  v12 = (NSCachingFetchRequest *)-[NSKnownKeysDictionary objectForKey:](v11, "objectForKey:", a3);
  if (!v12)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___NSCachingFetchRequest);
    -[NSCachingFetchRequest _disableSQLStatementCaching](v12, "_disableSQLStatementCaching");
    -[NSFetchRequest setEntity:]( v12,  "setEntity:",  objc_msgSend((id)objc_msgSend(v10, "destinationEntity"), "entityDescription"));
    uint64_t v13 = _SELF_Expression;
    uint64_t v14 = [MEMORY[0x189607878] expressionForVariable:@"mtmObjects"];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v13 rightExpression:v14 modifier:0 type:10 options:0];
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v15);

    uint64_t v16 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end