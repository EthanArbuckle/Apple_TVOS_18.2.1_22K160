@interface BKNamespaceNode
- (BKNamespaceNode)init;
- (BOOL)isEqual:(id)a3;
- (NSMutableOrderedSet)subnodes;
- (NSObject)object;
- (NSString)name;
- (id)_enumerateKeyPathNodesByComponent:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)enumerateKeyPathNodes:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6;
- (id)nodeAtKeyPath:(id)a3;
- (id)objectAtKeyPath:(id)a3;
- (id)setObject:(id)a3 atKeyPath:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_dumpNodeTree:(id)a3 level:(int64_t)a4;
- (void)_enumerateNodesWithOptions:(int64_t)a3 usingBlock:(id)a4;
- (void)dumpNodeTree;
- (void)removeNodeAtKeyPath:(id)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3;
- (void)setSubnodes:(id)a3;
@end

@implementation BKNamespaceNode

- (BKNamespaceNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BKNamespaceNode;
  v2 = -[BKNamespaceNode init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    subnodes = v2->_subnodes;
    v2->_subnodes = v3;
  }

  return v2;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKNamespaceNode descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  id v5 = [v4 appendObject:self->_name withName:@"name"];
  object = self->_object;
  if (object)
  {
    char v7 = objc_opt_respondsToSelector(object, "succinctDescription");
    v8 = self->_object;
    if ((v7 & 1) != 0) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSObject succinctDescription](v8, "succinctDescription"));
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSObject description](v8, "description"));
    }
    v10 = (void *)v9;
    id v11 = [v4 appendObject:v9 withName:@"object"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_subnodes, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 activeMultilinePrefix]);
  [v4 appendArraySection:v12 withName:@"subnodes" multilinePrefix:v13 skipIfEmpty:1 objectTransformer:&stru_1000B8258];

  return v4;
}

- (id)description
{
  return -[BKNamespaceNode descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0LL);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && (-[NSString isEqual:](self->_name, "isEqual:", v4) & 1) != 0)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    uint64_t v9 = objc_opt_class(self, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0
      && (name = self->_name,
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]),
          LODWORD(name) = -[NSString isEqual:](name, "isEqual:", v11),
          v11,
          (_DWORD)name))
    {
      object = self->_object;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
      unsigned __int8 v8 = -[NSObject isEqual:](object, "isEqual:", v13);
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (void)removeNodeAtKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_1000719A8;
  v13 = sub_1000719B8;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000719C0;
  v8[3] = &unk_1000B8280;
  v8[4] = &v9;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:]( self,  "enumerateKeyPathNodes:options:ifFound:ifMissing:",  v4,  0LL,  v8,  0LL));
  if (v5)
  {
    uint64_t v6 = (void *)v10[5];
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 subnodes]);
      [v7 removeObject:v5];
    }
  }

  _Block_object_dispose(&v9, 8);
}

- (id)nodeAtKeyPath:(id)a3
{
  return -[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:]( self,  "enumerateKeyPathNodes:options:ifFound:ifMissing:",  a3,  0LL,  0LL,  0LL);
}

- (id)objectAtKeyPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode nodeAtKeyPath:](self, "nodeAtKeyPath:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);

  return v4;
}

- (id)setObject:(id)a3 atKeyPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:]( self,  "enumerateKeyPathNodes:options:ifFound:ifMissing:",  a4,  0LL,  0LL,  &stru_1000B82C0));
  [v7 setObject:v6];

  return v7;
}

- (id)enumerateKeyPathNodes:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"."]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[BKNamespaceNode _enumerateKeyPathNodesByComponent:options:ifFound:ifMissing:]( self,  "_enumerateKeyPathNodesByComponent:options:ifFound:ifMissing:",  v12,  a4,  v11,  v10));

  return v13;
}

- (void)dumpNodeTree
{
}

- (void)_enumerateNodesWithOptions:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if ((a3 & 2) != 0)
  {
  }

  else
  {
    a3 |= 2uLL;
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned __int8 v8 = self->_subnodes;
  id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
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
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "_enumerateNodesWithOptions:usingBlock:",  a3,  v7,  (void)v13);
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

LABEL_14:
}

- (id)_enumerateKeyPathNodesByComponent:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6
{
  char v31 = a4;
  id v9 = a3;
  id v33 = a5;
  v32 = (uint64_t (**)(id, void, void *, BOOL))a6;
  id v10 = self->_subnodes;
  uint64_t v11 = self;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    id v13 = v12;
    __int128 v14 = 0LL;
    uint64_t v15 = *(void *)v36;
    __int128 v16 = (void (**)(void, void, void))v33;
    while (2)
    {
      v17 = 0LL;
      v18 = v11;
      uint64_t v11 = v14;
      v19 = v10;
      do
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v17);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet set](v19, "set"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 member:v20]);
        v23 = v22;
        if (v22)
        {
          if (v16)
          {
            if ((v31 & 1) == 0
              || (v24 = (void *)objc_claimAutoreleasedReturnValue([v22 object]), v24, v24))
            {
              ((void (**)(void, void *, BKNamespaceNode *))v16)[2](v16, v23, v18);
            }
          }

          id v25 = v23;
        }

        else
        {
          if (!v32
            || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](v19, "lastObject")),
                uint64_t v27 = ((uint64_t (**)(id, void *, void *, BOOL))v32)[2](v32, v20, v18, v20 == v26),
                id v25 = (id)objc_claimAutoreleasedReturnValue(v27),
                v26,
                !v25))
          {

            v29 = 0LL;
            uint64_t v11 = v18;
            id v10 = v19;
            goto LABEL_20;
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode subnodes](v18, "subnodes"));
          [v28 addObject:v25];

          __int128 v16 = (void (**)(void, void, void))v33;
        }

        uint64_t v11 = (BKNamespaceNode *)v25;

        id v10 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode subnodes](v11, "subnodes"));
        v17 = (char *)v17 + 1;
        v18 = v11;
        v19 = v10;
      }

      while (v13 != v17);
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      __int128 v14 = v11;
      v29 = v11;
      if (v13) {
        continue;
      }
      break;
    }
  }

  else
  {
    v29 = 0LL;
LABEL_20:
    __int128 v16 = (void (**)(void, void, void))v33;
  }

  return v29;
}

- (void)_dumpNodeTree:(id)a3 level:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_10003F198();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    else {
      int v9 = 32;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode name](self, "name"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode object](self, "object"));
    *(_DWORD *)buf = 68158722;
    int v26 = v9;
    __int16 v27 = 2080;
    v28 = "                                ";
    __int16 v29 = 2048;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v10;
    __int16 v33 = 2114;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s%p %{public}@ %{public}@", buf, 0x30u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    int64_t v15 = a4 + 1;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subnodes", (void)v20));
        [v18 _dumpNodeTree:v19 level:v15];
      }

      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v14);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (NSMutableOrderedSet)subnodes
{
  return self->_subnodes;
}

- (void)setSubnodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end