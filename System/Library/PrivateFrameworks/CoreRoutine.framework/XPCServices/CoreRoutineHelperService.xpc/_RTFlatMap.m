@interface _RTFlatMap
- (_RTFlatMap)initWithInput:(id)a3;
- (id)withBlock:(id)a3;
@end

@implementation _RTFlatMap

- (_RTFlatMap)initWithInput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____RTFlatMap;
  v6 = -[_RTFlatMap init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_input, a3);
  }

  return v7;
}

- (id)withBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self->_input, "count")));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v6 = self->_input;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v12) {
          objc_msgSend(v5, "addObjectsFromArray:", v12, (void)v14);
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end