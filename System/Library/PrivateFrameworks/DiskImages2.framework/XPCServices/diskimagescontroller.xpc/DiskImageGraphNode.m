@interface DiskImageGraphNode
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (BOOL)deleteImage;
- (BOOL)isCache;
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
- (id)getChildren;
- (id)getDescendants;
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

- (id)toDIShadowNode
{
  v3 = objc_alloc(&OBJC_CLASS___DIShadowNode);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode URL](self, "URL"));
  v5 = -[DIShadowNode initWithURL:isCache:]( v3,  "initWithURL:isCache:",  v4,  -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v8 = 0;
  if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"Tag",  objc_opt_class(NSString, v6),  0,  a4))
  {
    unsigned __int8 v8 = 0;
    if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"UUID",  objc_opt_class(NSString, v7),  0,  a4))
    {
      if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"ParentUUID",  objc_opt_class(NSString, v9),  1,  a4)
        && objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"Metadata",  objc_opt_class(NSDictionary, v10),  1,  a4))
      {
        unsigned __int8 v8 = objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"IsCache",  objc_opt_class(NSNumber, v11),  0,  a4);
      }

      else
      {
        unsigned __int8 v8 = 0;
      }
    }
  }

  return v8;
}

- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___DiskImageGraphNode;
  uint64_t v9 = -[DiskImageGraphNode init](&v29, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Tag"]);
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    v12 = objc_alloc(&OBJC_CLASS___NSUUID);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"UUID"]);
    v14 = -[NSUUID initWithUUIDString:](v12, "initWithUUIDString:", v13);
    UUID = v9->_UUID;
    v9->_UUID = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"IsCache"]);
    v9->_isCache = [v16 BOOLValue];

    if (v6) {
      v17 = v8;
    }
    else {
      v17 = 0LL;
    }
    objc_storeStrong((id *)&v9->_pstackDict, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ParentUUID"]);

    if (v18)
    {
      v19 = objc_alloc(&OBJC_CLASS___NSUUID);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ParentUUID"]);
      v21 = -[NSUUID initWithUUIDString:](v19, "initWithUUIDString:", v20);
      parentUUID = v9->_parentUUID;
      v9->_parentUUID = v21;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Metadata"]);

    if (v23)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Metadata"]);
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v24;
    }

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PluginName"]);

  v12 = off_100170568;
  if (v11) {
    v12 = off_1001706A8;
  }
  id v13 = [objc_alloc(*v12) initWithDictionary:v10 updateChangesToDict:v7 workDir:v9 error:a6];

  return v13;
}

- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7
{
  v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DiskImageGraphNode;
  v16 = -[DiskImageGraphNode init](&v24, "init");
  v17 = v16;
  if (v16)
  {
    if (v12) {
      v18 = v12;
    }
    else {
      v18 = &stru_10019A4D8;
    }
    objc_storeStrong((id *)&v16->_tag, v18);
    objc_storeStrong((id *)&v17->_UUID, a4);
    objc_storeStrong((id *)&v17->_parent, a5);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 UUID]);
    parentUUID = v17->_parentUUID;
    v17->_parentUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_isCache = a7;
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    children = v17->_children;
    v17->_children = v21;
  }

  return v17;
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_tag, a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    [v6 setObject:v7 forKey:@"Tag"];
  }
}

- (void)setUUID:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_UUID, a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    [v6 setObject:v7 forKey:@"UUID"];
  }
}

- (void)setParent:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_parent, a3);
  id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue([v11 UUID]);
  parentUUID = self->_parentUUID;
  self->_parentUUID = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    [v8 setObject:v10 forKey:@"ParentUUID"];
  }
}

- (void)setMetadata:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    [v6 setObject:v7 forKey:@"Metadata"];
  }
}

- (void)setIsCache:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isCache = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v7 setObject:v6 forKey:@"IsCache"];
  }

- (id)getDescendants
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  -[DiskImageGraphNode addDecendantsToArray:](self, "addDecendantsToArray:", v4);
  return v4;
}

- (void)addDecendantsToArray:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode children](self, "children", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        [v4 addObject:v10];
        [v10 addDecendantsToArray:v4];
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (id)toDictionary
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode tag](self, "tag"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode UUID](self, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DiskImageGraphNode isCache](self, "isCache")));
  uint64_t v8 = -[NSMutableDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  v4,  @"Tag",  v6,  @"UUID",  v7,  @"IsCache",  0LL);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode parentUUID](self, "parentUUID"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode parentUUID](self, "parentUUID"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v11, @"ParentUUID");
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode metadata](self, "metadata"));

  if (v12)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode metadata](self, "metadata"));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v13, @"Metadata");
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode children](self, "children"));
  id v3 = [v2 copy];

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

@end