@interface CPLUnionCKRecordBuilder
- (CPLUnionCKRecordBuilder)initWithRecordBuilders:(id)a3;
- (NSArray)builders;
- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6;
- (void)setCKAsset:(id)a3 forKey:(id)a4;
- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5;
- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CPLUnionCKRecordBuilder

- (CPLUnionCKRecordBuilder)initWithRecordBuilders:(id)a3
{
  id v5 = a3;
  if (![v5 count]) {
    sub_1001910FC((uint64_t)a2, (uint64_t)self);
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLUnionCKRecordBuilder;
  v6 = -[CPLUnionCKRecordBuilder init](&v10, "init");
  if (v6)
  {
    v7 = (NSArray *)[v5 copy];
    builders = v6->_builders;
    v6->_builders = v7;
  }

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v8 = self->_builders;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "setObject:forKey:", v6, v7, (void)v13);
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = self->_builders;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v14),  "setEncryptedObject:forKey:validateClass:",  v8,  v9,  a5,  (void)v15);
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v12);
  }
}

- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_builders;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "setLegacyEncryptedObject:forKey:",  v6,  v7,  (void)v13);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (void)setCKAsset:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NSArray count](self->_builders, "count") > 1)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = self->_builders;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          __int128 v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v12);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cplCopyCleanAsset", (void)v15));
          [v13 setCKAsset:v14 forKey:v7];

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v10);
    }
  }

  else
  {
    id v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_builders, "firstObject"));
    -[NSArray setCKAsset:forKey:](v8, "setCKAsset:forKey:", v6, v7);
  }
}

- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = self->_builders;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v14),  "setCKReferenceWithScopedIdentifier:forKey:referenceAction:",  v8,  v9,  a5,  (void)v15);
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v12);
  }
}

- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/C PLCKRecordBuilder.m"));
  __int128 v17 = NSStringFromSelector(a2);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v15 handleFailureInMethod:a2, self, v16, 146, @"%@ is not supported by %@", v18, objc_opt_class(self) object file lineNumber description];

  abort();
}

- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  builders = self->_builders;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](builders, "firstObject"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordIDForResourcesOfRecordWithScopedIdentifier:v8 cloudKitScope:a4 error:a5]);

  return v10;
}

- (NSArray)builders
{
  return self->_builders;
}

- (void).cxx_destruct
{
}

@end