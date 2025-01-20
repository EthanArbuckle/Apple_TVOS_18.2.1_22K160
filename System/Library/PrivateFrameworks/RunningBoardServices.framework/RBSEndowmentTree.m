@interface RBSEndowmentTree
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)endowmentTreeForLinks:(id)a3;
+ (id)endowmentTreeForNamespace:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)endowmentNamespace;
- (RBSEndowmentTree)initWithRBSXPCCoder:(id)a3;
- (id)childrenLinks:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rootLinks;
- (unint64_t)hash;
- (void)_addLink:(uint64_t)a1;
- (void)_initWithLinks:(void *)a1;
- (void)_initWithNamespace:(void *)a1;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSEndowmentTree

+ (id)endowmentTreeForNamespace:(id)a3
{
  id v3 = a3;
  v4 = -[RBSEndowmentTree _initWithNamespace:](objc_alloc(&OBJC_CLASS___RBSEndowmentTree), v3);

  return v4;
}

- (void)_initWithNamespace:(void *)a1
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v52 = a2;
  if (a1)
  {
    v65.receiver = a1;
    v65.super_class = (Class)&OBJC_CLASS___RBSEndowmentTree;
    v4 = (id *)objc_msgSendSuper2(&v65, sel_init);
    v5 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 2, a2);
      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      v7 = (void *)v5[1];
      v5[1] = v6;
      v8 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
      [v8 assertionDescriptorsByPidWithFlattenedAttributes:0 error:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        id v10 = v9;
        uint64_t v41 = [v10 countByEnumeratingWithState:&v61 objects:v68 count:16];
        if (!v41) {
          goto LABEL_35;
        }
        uint64_t v39 = *(void *)v62;
        v40 = v10;
        uint64_t v47 = (uint64_t)v5;
        while (1)
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v62 != v39) {
              objc_enumerationMutation(v10);
            }
            uint64_t v42 = v11;
            objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v61 + 1) + 8 * v11), v39);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            id obj = v12;
            uint64_t v45 = [v12 countByEnumeratingWithState:&v57 objects:v67 count:16];
            if (v45)
            {
              uint64_t v44 = *(void *)v58;
              do
              {
                uint64_t v13 = 0LL;
                do
                {
                  if (*(void *)v58 != v44) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v46 = v13;
                  v14 = *(void **)(*((void *)&v57 + 1) + 8 * v13);
                  __int128 v53 = 0u;
                  __int128 v54 = 0u;
                  __int128 v55 = 0u;
                  __int128 v56 = 0u;
                  v49 = v14;
                  [v14 attributes];
                  id v50 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v51 = [v50 countByEnumeratingWithState:&v53 objects:v66 count:16];
                  if (v51)
                  {
                    uint64_t v15 = *(void *)v54;
                    uint64_t v48 = *(void *)v54;
                    do
                    {
                      uint64_t v16 = 0LL;
                      do
                      {
                        if (*(void *)v54 != v15) {
                          objc_enumerationMutation(v50);
                        }
                        v17 = *(void **)(*((void *)&v53 + 1) + 8 * v16);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          id v18 = v17;
                          [v18 endowmentNamespace];
                          v19 = (void *)objc_claimAutoreleasedReturnValue();
                          int v20 = [v19 isEqual:v52];

                          if (v20)
                          {
                            [v18 sourceEnvironment];
                            v21 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v21) {
                              v21 = (void *)[(id)RBSEndowmentRootEnvironment copy];
                            }
                            [v49 identifier];
                            v22 = (void *)objc_claimAutoreleasedReturnValue();
                            uint64_t v23 = [v22 clientPid];
                            [v49 target];
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            [v24 environment];
                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                            [v49 target];
                            v26 = (void *)objc_claimAutoreleasedReturnValue();
                            [v26 processIdentifier];
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            v28 = +[RBSEndowmentLink endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:]( RBSEndowmentLink,  "endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:",  v52,  v21,  v23,  v25,  [v27 pid]);
                            v5 = (void *)v47;
                            -[RBSEndowmentTree _addLink:](v47, v28);

                            goto LABEL_27;
                          }
                        }

                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_29;
                          }
                          [v17 endowmentNamespace];
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          int v30 = [v29 isEqual:v52];

                          if (v30)
                          {
                            v31 = (void *)[(id)RBSEndowmentRootEnvironment copy];
                            [v49 identifier];
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            uint64_t v33 = [v32 clientPid];
                            [v49 target];
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            [v34 environment];
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            [v49 target];
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            [v36 processIdentifier];
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            v21 = +[RBSEndowmentLink endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:]( RBSEndowmentLink,  "endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:",  v52,  v31,  v33,  v35,  [v37 pid]);
                            v5 = (void *)v47;
                            -[RBSEndowmentTree _addLink:](v47, v21);
LABEL_27:

                            uint64_t v15 = v48;
                          }
                        }

LABEL_29:
                        ++v16;
                      }

                      while (v51 != v16);
                      uint64_t v51 = [v50 countByEnumeratingWithState:&v53 objects:v66 count:16];
                    }

                    while (v51);
                  }

                  uint64_t v13 = v46 + 1;
                }

                while (v46 + 1 != v45);
                uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
              }

              while (v45);
            }

            uint64_t v11 = v42 + 1;
            id v10 = v40;
          }

          while (v42 + 1 != v41);
          uint64_t v41 = [v40 countByEnumeratingWithState:&v61 objects:v68 count:16];
          if (!v41)
          {
LABEL_35:

            goto LABEL_37;
          }
        }
      }

      id v10 = v5;
      v5 = 0LL;
LABEL_37:
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)endowmentTreeForLinks:(id)a3
{
  id v3 = a3;
  v4 = -[RBSEndowmentTree _initWithLinks:](objc_alloc(&OBJC_CLASS___RBSEndowmentTree), v3);

  return v4;
}

- (void)_initWithLinks:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___RBSEndowmentTree;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      [v3 anyObject];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [v4 endowmentNamespace];
      id v6 = (void *)a1[2];
      a1[2] = v5;

      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      v8 = (void *)a1[1];
      a1[1] = v7;

      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __35__RBSEndowmentTree__initWithLinks___block_invoke;
      v10[3] = &unk_189DE0B88;
      a1 = a1;
      id v11 = a1;
      [v3 enumerateObjectsUsingBlock:v10];
    }
  }

  return a1;
}

- (void)_addLink:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    id v3 = *(void **)(a1 + 8);
    [v8 sourceEnvironment];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKey:v4];
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
      id v6 = *(void **)(a1 + 8);
      [v8 sourceEnvironment];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v5 forKey:v7];
    }

    [v5 addObject:v8];
  }
}

void __35__RBSEndowmentTree__initWithLinks___block_invoke(uint64_t a1, void *a2)
{
}

- (id)rootLinks
{
  return (id)-[NSMutableDictionary objectForKey:](self->_tree, "objectForKey:", RBSEndowmentRootEnvironment);
}

- (id)childrenLinks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  tree = self->_tree;
  [v4 targetEnvironment];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](tree, "objectForKey:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __34__RBSEndowmentTree_childrenLinks___block_invoke;
  v14[3] = &unk_189DE0BB0;
  id v15 = v4;
  id v9 = v5;
  id v16 = v9;
  id v10 = v4;
  [v8 enumerateObjectsUsingBlock:v14];
  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __34__RBSEndowmentTree_childrenLinks___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    int v3 = [*(id *)(a1 + 32) targetPid];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSEndowmentTree *)a3;
  if (self == v4) {
    goto LABEL_12;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    char v6 = 0;
    goto LABEL_13;
  }

  endowmentNamespace = self->_endowmentNamespace;
  id v8 = v4->_endowmentNamespace;
  if (endowmentNamespace != v8)
  {
    char v6 = 0;
    if (!endowmentNamespace || !v8) {
      goto LABEL_13;
    }
  }

  tree = self->_tree;
  id v10 = v4->_tree;
  if (tree == v10)
  {
LABEL_12:
    char v6 = 1;
    goto LABEL_13;
  }

  char v6 = 0;
  if (tree && v10) {
    char v6 = -[NSMutableDictionary isEqual:](tree, "isEqual:");
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_endowmentNamespace, "hash");
  return -[NSMutableDictionary hash](self->_tree, "hash") ^ v3;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| namespace:%@>", v4, self->_endowmentNamespace];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___RBSEndowmentTree);
  objc_storeStrong((id *)&v4->_tree, self->_tree);
  objc_storeStrong((id *)&v4->_endowmentNamespace, self->_endowmentNamespace);
  return v4;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  tree = self->_tree;
  id v5 = a3;
  [v5 encodeObject:tree forKey:@"_tree"];
  [v5 encodeObject:self->_endowmentNamespace forKey:@"_endowmentNamespace"];
}

- (RBSEndowmentTree)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSEndowmentTree;
  id v5 = -[RBSEndowmentTree init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tree"];
    tree = v5->_tree;
    v5->_tree = (NSMutableDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endowmentNamespace"];
    endowmentNamespace = v5->_endowmentNamespace;
    v5->_endowmentNamespace = (NSString *)v8;
  }

  return v5;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (void).cxx_destruct
{
}

@end