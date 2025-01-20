@interface DiskImageGraphNode
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (BOOL)deleteImage;
- (BOOL)isCache;
- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4;
- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7;
- (DiskImageGraphNode)parent;
- (NSDictionary)metadata;
- (NSMutableArray)children;
- (NSMutableDictionary)pstackDict;
- (NSString)tag;
- (NSUUID)UUID;
- (NSUUID)parentUUID;
- (id)URL;
- (id)childrenInfoWithExtra:(BOOL)a3 error:(id *)a4;
- (id)getChildren;
- (id)getDescendants;
- (id)infoWithExtra:(BOOL)a3 error:(id *)a4;
- (id)recursiveInfoWithExtra:(BOOL)a3 error:(id *)a4;
- (id)toDIShadowNode;
- (id)toDictionary;
- (void)addDecendantsToArray:(id)a3;
- (void)setChildren:(id)a3;
- (void)setIsCache:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setParent:(id)a3;
- (void)setPstackDict:(id)a3;
- (void)setTag:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation DiskImageGraphNode

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = 0;
  if ([v5 validateAndPopObjectForKey:@"Tag" className:objc_opt_class() isOptional:0 error:a4])
  {
    char v6 = 0;
    if ([v5 validateAndPopObjectForKey:@"UUID" className:objc_opt_class() isOptional:0 error:a4])
    {
      if ([v5 validateAndPopObjectForKey:@"ParentUUID" className:objc_opt_class() isOptional:1 error:a4]
        && [v5 validateAndPopObjectForKey:@"Metadata" className:objc_opt_class() isOptional:1 error:a4])
      {
        char v6 = [v5 validateAndPopObjectForKey:@"IsCache" className:objc_opt_class() isOptional:0 error:a4];
      }

      else
      {
        char v6 = 0;
      }
    }
  }

  return v6;
}

- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___DiskImageGraphNode;
  v9 = -[DiskImageGraphNode init](&v29, sel_init);
  if (v9)
  {
    uint64_t v10 = [v8 objectForKey:@"Tag"];
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    id v12 = objc_alloc(MEMORY[0x189607AB8]);
    [v8 objectForKey:@"UUID"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v12 initWithUUIDString:v13];
    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v14;

    [v8 objectForKey:@"IsCache"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isCache = [v16 BOOLValue];

    if (v6) {
      v17 = v8;
    }
    else {
      v17 = 0LL;
    }
    objc_storeStrong((id *)&v9->_pstackDict, v17);
    [v8 objectForKey:@"ParentUUID"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x189607AB8]);
      [v8 objectForKey:@"ParentUUID"];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v19 initWithUUIDString:v20];
      parentUUID = v9->_parentUUID;
      v9->_parentUUID = (NSUUID *)v21;
    }

    [v8 objectForKey:@"Metadata"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      uint64_t v24 = [v8 objectForKey:@"Metadata"];
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v24;
    }

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    children = v9->_children;
    v9->_children = v26;
  }

  return v9;
}

+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  [v10 objectForKeyedSubscript:@"PluginName"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  id v12 = off_18A1C77C8;
  if (v11) {
    id v12 = off_18A1C7918;
  }
  v13 = (void *)[objc_alloc(*v12) initWithDictionary:v10 updateChangesToDict:v7 workDir:v9 error:a6];

  return v13;
}

- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DiskImageGraphNode;
  v16 = -[DiskImageGraphNode init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    if (v12) {
      v18 = v12;
    }
    else {
      v18 = &stru_18A1F2380;
    }
    objc_storeStrong((id *)&v16->_tag, v18);
    objc_storeStrong((id *)&v17->_UUID, a4);
    objc_storeStrong((id *)&v17->_parent, a5);
    uint64_t v19 = [v14 UUID];
    parentUUID = v17->_parentUUID;
    v17->_parentUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_isCache = a7;
    uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    children = v17->_children;
    v17->_children = v21;
  }

  return v17;
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_tag, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKey:@"Tag"];
  }
}

- (void)setUUID:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_UUID, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 UUIDString];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKey:@"UUID"];
  }
}

- (void)setParent:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_parent, a3);
  [v11 UUID];
  id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  parentUUID = self->_parentUUID;
  self->_parentUUID = v5;

  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 UUIDString];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v10 forKey:@"ParentUUID"];
  }
}

- (void)setMetadata:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKey:@"Metadata"];
  }
}

- (void)setIsCache:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isCache = a3;
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithBool:v3];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v6 forKey:@"IsCache"];
  }

- (id)getDescendants
{
  BOOL v3 = (void *)MEMORY[0x189603FA8];
  v4 = -[DiskImageGraphNode children](self, "children");
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DiskImageGraphNode addDecendantsToArray:](self, "addDecendantsToArray:", v5);
  return v5;
}

- (void)addDecendantsToArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[DiskImageGraphNode children](self, "children", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v4 addObject:v10];
        [v10 addDecendantsToArray:v4];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (id)toDictionary
{
  id v3 = objc_alloc(MEMORY[0x189603FC8]);
  -[DiskImageGraphNode tag](self, "tag");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageGraphNode UUID](self, "UUID");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 UUIDString];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[DiskImageGraphNode isCache](self, "isCache"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)objc_msgSend( v3,  "initWithObjectsAndKeys:",  v4,  @"Tag",  v6,  @"UUID",  v7,  @"IsCache",  0);

  -[DiskImageGraphNode parentUUID](self, "parentUUID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DiskImageGraphNode parentUUID](self, "parentUUID");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 UUIDString];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v11 forKey:@"ParentUUID"];
  }

  -[DiskImageGraphNode metadata](self, "metadata");
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DiskImageGraphNode metadata](self, "metadata");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v13 forKey:@"Metadata"];
  }

  return v8;
}

- (BOOL)deleteImage
{
  return 0;
}

- (id)URL
{
  return 0LL;
}

- (id)getChildren
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[v2 copy];

  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (NSMutableDictionary)pstackDict
{
  return self->_pstackDict;
}

- (void)setPstackDict:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (DiskImageGraphNode)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
}

- (id)toDIShadowNode
{
  id v3 = objc_alloc(&OBJC_CLASS___DIShadowNode);
  -[DiskImageGraphNode URL](self, "URL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[DIShadowNode initWithURL:isCache:]( v3,  "initWithURL:isCache:",  v4,  -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

- (id)childrenInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  uint64_t v7 = (void *)objc_opt_new();
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  id v27 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  -[DiskImageGraphNode children](self, "children");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __56__DiskImageGraphNode_Info__childrenInfoWithExtra_error___block_invoke;
  v13[3] = &unk_18A1CC5E8;
  BOOL v17 = a3;
  id v15 = &v22;
  uint64_t v16 = &v18;
  id v9 = v7;
  id v14 = v9;
  [v8 enumerateObjectsUsingBlock:v13];

  if (a4)
  {
    id v10 = (void *)v23[5];
    if (v10) {
      *a4 = v10;
    }
  }

  if (*((_BYTE *)v19 + 24)) {
    id v11 = 0LL;
  }
  else {
    id v11 = v9;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __56__DiskImageGraphNode_Info__childrenInfoWithExtra_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v7 + 40);
  [a2 infoWithExtra:v6 error:&obj];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1 + 32) addObject:v8];
  }

  else
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

- (id)recursiveInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  -[DiskImageGraphNode infoWithExtra:error:](self, "infoWithExtra:error:");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 mutableCopy];

  -[DiskImageGraphNode childrenInfoWithExtra:error:](self, "childrenInfoWithExtra:error:", v5, a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9)
  {
    if ([v9 count]) {
      [v8 setObject:v10 forKeyedSubscript:@"Children"];
    }
    id v11 = v8;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)infoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = (void *)objc_opt_new();
  -[DiskImageGraphNode UUID](self, "UUID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 UUIDString];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKeyedSubscript:@"UUID"];

  -[DiskImageGraphNode URL](self, "URL");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 absoluteString];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v11 forKeyedSubscript:@"URL"];

  if (-[DiskImageGraphNode isCache](self, "isCache")) {
    uint64_t v12 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v12 = MEMORY[0x189604A80];
  }
  [v7 setObject:v12 forKeyedSubscript:@"IsCache"];
  uint64_t v13 = -[DiskImageGraphNode tag](self, "tag");
  if (v13)
  {
    id v14 = (void *)v13;
    -[DiskImageGraphNode tag](self, "tag");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 length];

    if (v16)
    {
      -[DiskImageGraphNode tag](self, "tag");
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v17 forKeyedSubscript:@"Tag"];
    }
  }

  if (!v5) {
    goto LABEL_10;
  }
  -[DiskImageGraphNode URL](self, "URL");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiskImageGraph getImageInfoDictWithURL:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageInfoDictWithURL:error:",  v18,  a4);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    [v7 setObject:v19 forKeyedSubscript:@"Image Info"];

LABEL_10:
    id v19 = v7;
  }

  return v19;
}

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  return 0;
}

@end