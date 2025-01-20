@interface FSMimicPopulator
- (BOOL)populateHFSTypeAndCreatorWithError:(id *)a3;
- (BOOL)populateSimpleSelector:(SEL)a3 error:(id *)a4;
- (BOOL)populateValueForKey:(id)a3 error:(id *)a4;
- (FSMimic)mimic;
- (FSMimicPopulator)initWithNode:(id)a3;
- (void)populateHasChildNodeWithRelativePath:(id)a3;
@end

@implementation FSMimicPopulator

- (FSMimicPopulator)initWithNode:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FSMimicPopulator;
  v6 = -[FSMimicPopulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_node, a3);
    v8 = objc_alloc(&OBJC_CLASS___FSMimic);
    [v5 URL];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = -[FSMimic initWithURL:](v8, "initWithURL:", v9);
    mimic = v7->_mimic;
    v7->_mimic = (FSMimic *)v10;
  }

  return v7;
}

- (BOOL)populateSimpleSelector:(SEL)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1895F89C0];
  if (-[FSMimic hasObjectValueForSelector:](self->_mimic, "hasObjectValueForSelector:"))
  {
LABEL_2:
    LOBYTE(a4) = 1;
  }

  else
  {
    switch(categorizeSelector((objc_selector *)a3))
    {
      case 0LL:
        node = self->_node;
        mimic = self->_mimic;
        v20 = node;
        v21 = mimic;
        id v22 = [v20 a3];
        [MEMORY[0x189607968] numberWithBool:v22];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[FSMimic setObjectValue:forSelector:](v21, "setObjectValue:forSelector:", v23, a3);

        goto LABEL_2;
      case 1LL:
        v24 = self->_node;
        v25 = self->_mimic;
        objc_msgSend(v24, a3, a4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(a4) = v26 != 0LL;
        if (v26) {
          -[FSMimic setObjectValue:forSelector:](v25, "setObjectValue:forSelector:", v26, a3);
        }

        return (char)a4;
      case 2LL:
        uint64_t v10 = self->_mimic;
        v11 = self->_node;
        v12 = v10;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if ((_DWORD)a4)
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(v27)];
          objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSMimic setObjectValue:forSelector:](v12, "setObjectValue:forSelector:", v13, a3);
        }

        goto LABEL_16;
      case 3LL:
        v14 = self->_mimic;
        v11 = self->_node;
        v12 = v14;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if ((_DWORD)a4)
        {
          [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&v27];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSMimic setObjectValue:forSelector:](v12, "setObjectValue:forSelector:", v15, a3);
        }

        goto LABEL_16;
      case 4LL:
        v16 = self->_mimic;
        v11 = self->_node;
        v12 = v16;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if ((_DWORD)a4)
        {
          [MEMORY[0x189607968] numberWithDouble:v27];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSMimic setObjectValue:forSelector:](v12, "setObjectValue:forSelector:", v17, a3);
        }

- (BOOL)populateValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v13 = 0LL;
  if (-[FSMimic hasResourceValueForKey:](self->_mimic, "hasResourceValueForKey:", v6))
  {
    v7 = 0LL;
    BOOL v8 = 1;
  }

  else
  {
    BOOL v9 = -[FSNode getResourceValue:forKey:options:error:]( self->_node,  "getResourceValue:forKey:options:error:",  &v13,  v6,  3LL,  a4);
    v7 = v13;
    if (v9)
    {
      if (!v13)
      {
        uint64_t v10 = [MEMORY[0x189603FE8] null];
        v11 = v13;
        objc_super v13 = (void *)v10;

        v7 = v13;
      }

      -[FSMimic setResourceValue:forKey:](self->_mimic, "setResourceValue:forKey:", v7, v6);
      BOOL v8 = 1;
      v7 = v13;
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)populateHasChildNodeWithRelativePath:(id)a3
{
  id v4 = a3;
  if (-[FSNode childNodeWithRelativePathExists:](self->_node, "childNodeWithRelativePathExists:")) {
    -[FSMimic noteExtantChildNodeWithRelativePath:](self->_mimic, "noteExtantChildNodeWithRelativePath:", v4);
  }
}

- (BOOL)populateHFSTypeAndCreatorWithError:(id *)a3
{
  node = self->_node;
  id v13 = 0LL;
  BOOL v6 = -[FSNode getHFSType:creator:error:](node, "getHFSType:creator:error:", &v15, &v14, &v13);
  id v7 = v13;
  BOOL v8 = v7;
  if (v6)
  {
    -[FSMimic setHFSType:creator:](self->_mimic, "setHFSType:creator:", v15, v14);
LABEL_3:
    BOOL v9 = 1;
    goto LABEL_10;
  }

  [v7 domain];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 isEqual:*MEMORY[0x189607670]])
  {
    uint64_t v11 = [v8 code];

    if (v11 == -10813)
    {
      -[FSMimic setHFSTypesUnavailable](self->_mimic, "setHFSTypesUnavailable");
      goto LABEL_3;
    }
  }

  else
  {
  }

  BOOL v9 = 0;
  if (a3) {
    *a3 = v8;
  }
LABEL_10:

  return v9;
}

- (FSMimic)mimic
{
  return self->_mimic;
}

- (void).cxx_destruct
{
}

@end