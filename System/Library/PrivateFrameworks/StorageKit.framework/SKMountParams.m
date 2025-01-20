@interface SKMountParams
- (BOOL)force;
- (BOOL)noBrowse;
- (BOOL)raidTraverse;
- (BOOL)readOnly;
- (BOOL)recursive;
- (NSSet)allParams;
- (NSURL)mountPoint;
- (SKMountParams)init;
- (SKMountParams)initWithParams:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)redactedDescription;
- (void)setAllParams:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setMountPoint:(id)a3;
- (void)setNoBrowse:(BOOL)a3;
- (void)setRaidTraverse:(BOOL)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRecursive:(BOOL)a3;
@end

@implementation SKMountParams

- (SKMountParams)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKMountParams initWithParams:](self, "initWithParams:", v3);

  return v4;
}

- (SKMountParams)initWithParams:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKMountParams;
  v6 = -[SKMountParams init](&v11, sel_init);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x189604010] set];
    allParams = v6->_allParams;
    v6->_allParams = (NSSet *)v7;

    v6->_readOnly = [v5 containsObject:@"rdonly"];
    v6->_noBrowse = [v5 containsObject:@"nobrowse"];
    mountPoint = v6->_mountPoint;
    v6->_mountPoint = 0LL;

    objc_storeStrong((id *)&v6->_allParams, a3);
    *(_WORD *)&v6->_recursive = 257;
    v6->_raidTraverse = 1;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1895F89C0];
  v3 = -[SKMountParams allParams](self, "allParams");
  v4 = (void *)[v3 mutableCopy];

  if (-[SKMountParams readOnly](self, "readOnly")) {
    [v4 addObject:@"rdonly"];
  }
  if (-[SKMountParams noBrowse](self, "noBrowse")) {
    [v4 addObject:@"nobrowse"];
  }
  id v5 = (void *)MEMORY[0x189603FC8];
  v16[0] = @"kSKDiskMountOptionToolOptions";
  [v4 allObjects];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v16[1] = @"kSKDiskMountOptionRecursive";
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKMountParams recursive](self, "recursive"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = @"kSKDiskMountOptionRecursiveRAID";
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKMountParams raidTraverse](self, "raidTraverse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  v16[3] = @"kSKDiskMountOptionForce";
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKMountParams force](self, "force"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = kSKDiskMountOptionWithoutEFI;
  v17[3] = v9;
  v17[4] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dictionaryWithDictionary:v10];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SKMountParams mountPoint](self, "mountPoint");
  if (v12)
  {
    v13 = -[SKMountParams mountPoint](self, "mountPoint");
    [v13 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v14 forKeyedSubscript:@"kSKDiskMountOptionMountPoint"];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___SKMountParams);
  -[SKMountParams allParams](self, "allParams");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKMountParams initWithParams:](v4, "initWithParams:", v5);

  -[SKMountParams mountPoint](self, "mountPoint");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKMountParams setMountPoint:](v6, "setMountPoint:", v7);

  -[SKMountParams setRecursive:](v6, "setRecursive:", -[SKMountParams recursive](self, "recursive"));
  -[SKMountParams setForce:](v6, "setForce:", -[SKMountParams force](self, "force"));
  -[SKMountParams setRaidTraverse:](v6, "setRaidTraverse:", -[SKMountParams raidTraverse](self, "raidTraverse"));
  return v6;
}

- (id)redactedDescription
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSUInteger v6 = -[NSSet count](self->_allParams, "count");
  else {
    uint64_t v7 = MEMORY[0x189604A80];
  }
  [v3 stringWithFormat:@"<%@: { allParams: %lu, mount point: %@, recursive: %d, force: %d }>", v5, v6, v7, self->_recursive, self->_force];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { allParams: %@, mount point: %@, recursive: %d, force: %d }>", v5, self->_allParams, self->_mountPoint, self->_recursive, self->_force];
  NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)noBrowse
{
  return self->_noBrowse;
}

- (void)setNoBrowse:(BOOL)a3
{
  self->_noBrowse = a3;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
}

- (NSSet)allParams
{
  return self->_allParams;
}

- (void)setAllParams:(id)a3
{
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (BOOL)raidTraverse
{
  return self->_raidTraverse;
}

- (void)setRaidTraverse:(BOOL)a3
{
  self->_raidTraverse = a3;
}

- (void).cxx_destruct
{
}

@end