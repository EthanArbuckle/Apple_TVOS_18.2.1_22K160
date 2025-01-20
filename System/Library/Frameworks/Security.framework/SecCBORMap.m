@interface SecCBORMap
- (SecCBORMap)init;
- (id)dictionaryRepresentation;
- (id)getSortedKeys;
- (int)fieldType;
- (void)setKey:(id)a3 value:(id)a4;
- (void)write:(id)a3;
@end

@implementation SecCBORMap

- (int)fieldType
{
  return 5;
}

- (SecCBORMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SecCBORMap;
  v2 = -[SecCBORMap init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189607920]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    m_data = v2->m_data;
    v2->m_data = (NSMapTable *)v3;
  }

  return v2;
}

- (void)setKey:(id)a3 value:(id)a4
{
}

- (id)getSortedKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 sortedArrayUsingComparator:&__block_literal_global_11803];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentation
{
  return -[NSMapTable dictionaryRepresentation](self->m_data, "dictionaryRepresentation");
}

- (void)write:(id)a3
{
  id v11 = a3;
  v4 = -[SecCBORMap getSortedKeys](self, "getSortedKeys");
  [v4 objectEnumerator];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecCBORValue encodeStartItems:output:]( self,  "encodeStartItems:output:",  -[NSMapTable count](self->m_data, "count"),  v11);
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 0LL;
    do
    {
      v9 = v8;
      v8 = -[NSMapTable objectForKey:](self->m_data, "objectForKey:", v7);
      [v7 write:v11];
      [v8 write:v11];
      uint64_t v10 = [v5 nextObject];

      v7 = (void *)v10;
    }

    while (v10);
  }
}

- (void).cxx_destruct
{
}

uint64_t __27__SecCBORMap_getSortedKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 fieldType];
  int v7 = [v5 fieldType];
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v8 = [v4 compare:v5];
      }

      else
      {
        uint64_t v8 = 0LL;
      }
    }

    else
    {
      uint64_t v8 = 1LL;
    }
  }

  else
  {
    uint64_t v8 = -1LL;
  }

  return v8;
}

@end