@interface IDSNWBroadcastProxy
- (IDSNWBroadcastProxy)initWithTargets:(id)a3;
- (NSArray)targets;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setTargets:(id)a3;
@end

@implementation IDSNWBroadcastProxy

- (IDSNWBroadcastProxy)initWithTargets:(id)a3
{
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_targets;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v8),  "methodSignatureForSelector:",  a3,  (void)v12));
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = 0LL;
LABEL_11:

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (-[NSArray count](self->_targets, "count"))
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = self->_targets;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9);
          if (objc_opt_respondsToSelector(v10, objc_msgSend(v4, "selector", (void)v11))) {
            [v4 invokeWithTarget:v10];
          }
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v7);
    }
  }
}

- (NSArray)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end