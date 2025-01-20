@interface MRDServerMessageProxy
+ (id)proxyForObject:(id)a3 protocol:(id)a4;
+ (id)proxyForObjects:(id)a3 protocol:(id)a4;
- (NSHashTable)objects;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setObjects:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation MRDServerMessageProxy

+ (id)proxyForObject:(id)a3 protocol:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "proxyForObjects:protocol:", v8, v6, v11));
  return v9;
}

+ (id)proxyForObjects:(id)a3 protocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  [v8 setObjects:v9];

  [v8 setProtocol:v7];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects", (void)v18));
        [v16 addObject:v15];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDServerMessageProxy objects](self, "objects", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10);
        if (objc_opt_respondsToSelector(v11, [v4 selector])) {
          [v4 invokeWithTarget:v11];
        }
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (a3 == a2) {
    return 0LL;
  }
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue(-[MRDServerMessageProxy protocol](self, "protocol"));
  types = protocol_getMethodDescription(v5, a3, 0, 1).types;

  if (types
    || (id v7 = (Protocol *)objc_claimAutoreleasedReturnValue(-[MRDServerMessageProxy protocol](self, "protocol")),
        types = protocol_getMethodDescription(v7, a3, 1, 1).types,
        v7,
        types))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  types));
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (NSHashTable)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
}

@end