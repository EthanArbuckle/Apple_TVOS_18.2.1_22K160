@interface MCMManagedPath
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToManagedPath:(id)a3;
- (MCMFSNode)fsNode;
- (MCMManagedPath)initWithURL:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8 parent:(id)a9;
- (MCMManagedPath)parent;
- (MCMPOSIXUser)owner;
- (NSString)description;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedPathByAppendingPathComponent:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8;
- (int)dpClass;
- (unint64_t)ACLConfig;
- (unint64_t)flags;
- (unint64_t)hash;
- (unsigned)mode;
- (void)setFsNode:(id)a3;
@end

@implementation MCMManagedPath

- (MCMManagedPath)initWithURL:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8 parent:(id)a9
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMManagedPath;
  v18 = -[MCMManagedPath init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    v19->_flags = a4;
    v19->_ACLConfig = a5;
    v19->_mode = a6;
    v19->_dpClass = a7;
    objc_storeStrong((id *)&v19->_owner, a8);
    objc_storeStrong((id *)&v19->_parent, a9);
    fsNode = v19->_fsNode;
    v19->_fsNode = 0LL;
  }

  return v19;
}

- (id)managedPathByAppendingPathComponent:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v9 = a6;
  id v14 = a8;
  id v15 = a3;
  -[MCMManagedPath url](self, "url");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 URLByAppendingPathComponent:v15 isDirectory:1];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v17 flags:a4 ACLConfig:a5 mode:v9 dpClass:v8 owner:v14 parent:self];
  return v18;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqualToManagedPath:(id)a3
{
  return -[NSURL isEqual:](self->_url, "isEqual:", *((void *)a3 + 2));
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMManagedPath *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMManagedPath isEqualToManagedPath:](self, "isEqualToManagedPath:", v4);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(void *)(v5 + 24) = self->_flags;
    *(void *)(v5 + 32) = self->_ACLConfig;
    *(_WORD *)(v5 + 8) = self->_mode;
    *(_DWORD *)(v5 + 12) = self->_dpClass;
    id v8 = -[MCMPOSIXUser copyWithZone:](self->_owner, "copyWithZone:", a3);
    uint64_t v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    objc_storeStrong((id *)(v5 + 48), self->_parent);
    id v10 = -[MCMFSNode copyWithZone:](self->_fsNode, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;
  }

  return (id)v5;
}

- (NSString)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __29__MCMManagedPath_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unint64_t)ACLConfig
{
  return self->_ACLConfig;
}

- (unsigned)mode
{
  return self->_mode;
}

- (int)dpClass
{
  return self->_dpClass;
}

- (MCMPOSIXUser)owner
{
  return self->_owner;
}

- (MCMManagedPath)parent
{
  return self->_parent;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (void)setFsNode:(id)a3
{
}

- (void).cxx_destruct
{
}

id __29__MCMManagedPath_description__block_invoke(uint64_t a1, int a2)
{
  v4 = (void *)NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  uint64_t v29 = [v7 flags];
  uint64_t v28 = [*(id *)(a1 + 32) ACLConfig];
  uint64_t v27 = [*(id *)(a1 + 32) mode];
  uint64_t v26 = [*(id *)(a1 + 32) dpClass];
  [*(id *)(a1 + 32) owner];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  uint64_t v10 = (uint64_t)v8;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
  }

  [*(id *)(a1 + 32) parent];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) fsNode];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((a2 & 1) != 0)
  {
    [v12 redactedDescription];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) url];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 path];
    id v16 = v7;
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 redactedDescription];
    v19 = v4;
    v20 = v9;
    v21 = v6;
    v22 = (void *)v18;
    objc_msgSend( v19,  "stringWithFormat:",  @"<%@: %p; flags = 0x%lx, ACLConfig = 0x%lx, mode = 0%o, dpClass = %d, owner = %@, parent = %p, fsNode = %@, url = [%@]>",
      v21,
      v16,
      v29,
      v28,
      v27,
      v26,
      v10,
      v11,
      v14,
      v18);
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = v21;
    uint64_t v9 = v20;

    uint64_t v24 = v13;
    v13 = v11;
    v11 = (void *)v10;
  }

  else
  {
    [*(id *)(a1 + 32) url];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 path];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "stringWithFormat:",  @"<%@: %p; flags = 0x%lx, ACLConfig = 0x%lx, mode = 0%o, dpClass = %d, owner = %@, parent = %p, fsNode = %@, url = [%@]>",
      v6,
      v7,
      v29,
      v28,
      v27,
      v26,
      v10,
      v11,
      v13,
      v14);
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

@end