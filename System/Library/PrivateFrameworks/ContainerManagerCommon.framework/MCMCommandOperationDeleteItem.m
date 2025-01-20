@interface MCMCommandOperationDeleteItem
- (BOOL)isEqual:(id)a3;
- (MCMCommandOperationDeleteItem)initWithCacheEntry:(id)a3 codeSignIdentifiersToRemove:(id)a4 manifest:(id)a5;
- (MCMContainerCacheEntry)cacheEntry;
- (MCMDeleteManifest)manifest;
- (NSSet)codeSignIdentifiersToRemove;
- (id)description;
- (unint64_t)hash;
- (void)setManifest:(id)a3;
@end

@implementation MCMCommandOperationDeleteItem

- (MCMCommandOperationDeleteItem)initWithCacheEntry:(id)a3 codeSignIdentifiersToRemove:(id)a4 manifest:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMCommandOperationDeleteItem;
  v12 = -[MCMCommandOperationDeleteItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cacheEntry, a3);
    objc_storeStrong((id *)&v13->_codeSignIdentifiersToRemove, a4);
    objc_storeStrong((id *)&v13->_manifest, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = -[MCMCommandOperationDeleteItem cacheEntry](self, "cacheEntry");
  LOBYTE(self) = [v5 isEqual:v4];

  return (char)self;
}

- (id)description
{
  unint64_t v3 = (void *)NSString;
  -[MCMCommandOperationDeleteItem cacheEntry](self, "cacheEntry");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMCommandOperationDeleteItem codeSignIdentifiersToRemove](self, "codeSignIdentifiersToRemove");
  [v3 stringWithFormat:@"<%@, removeCS = %@>", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MCMContainerCacheEntry)cacheEntry
{
  return self->_cacheEntry;
}

- (NSSet)codeSignIdentifiersToRemove
{
  return self->_codeSignIdentifiersToRemove;
}

- (MCMDeleteManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end