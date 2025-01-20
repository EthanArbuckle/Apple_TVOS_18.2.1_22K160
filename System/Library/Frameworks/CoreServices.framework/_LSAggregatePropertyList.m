@interface _LSAggregatePropertyList
+ (BOOL)supportsSecureCoding;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSAggregatePropertyList)initWithCoder:(id)a3;
- (_LSAggregatePropertyList)initWithLazyPropertyLists:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)prewarm;
@end

@implementation _LSAggregatePropertyList

- (_LSAggregatePropertyList)initWithLazyPropertyLists:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSAggregatePropertyList;
  v5 = -[_LSLazyPropertyList init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    plists = v5->_plists;
    v5->_plists = (NSArray *)v6;
  }

  return v5;
}

- (BOOL)_getPropertyList:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = self->_plists;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = -[_LSLazyPropertyList propertyList](*(id *)(*((void *)&v13 + 1) + 8 * v9));
        if (v10) {
          objc_msgSend(v5, "addEntriesFromDictionary:", v10, (void)v13);
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v7);
  }

  id v11 = [v5 copy];
  *a3 = v11;

  return v11 != 0LL;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = self->_plists;
  uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objectForKey:ofClass:", v6, 0, (void)v14);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:

  id v12 = v11;
  *a3 = v12;

  return v8;
}

- (void)prewarm
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  v2 = self->_plists;
  uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v6,  v10,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "prewarm", (void)v6);
      }

      while (v3 != v5);
      uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v6,  v10,  16LL);
    }

    while (v3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSAggregatePropertyList;
  -[_LSLazyPropertyList encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  [v4 encodeObject:self->_plists forKey:@"plists"];
}

- (_LSAggregatePropertyList)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSAggregatePropertyList;
  objc_super v5 = -[_LSLazyPropertyList initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"plists");
    plists = v5->_plists;
    v5->_plists = (NSArray *)v6;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end