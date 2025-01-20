@interface _LSQueryResultWithPropertyList
+ (BOOL)supportsSecureCoding;
- (_LSQueryResultWithPropertyList)initWithCoder:(id)a3;
- (_LSQueryResultWithPropertyList)initWithPropertyList:(id)a3;
- (_LSQueryResultWithPropertyList)propertyListWithClass:(Class)a3;
- (_LSQueryResultWithPropertyList)propertyListWithClass:(Class)a3 valuesOfClass:(Class)a4;
- (id)propertyList;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSQueryResultWithPropertyList

- (_LSQueryResultWithPropertyList)initWithPropertyList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSQueryResultWithPropertyList;
  v6 = -[_LSQueryResult _init](&v9, sel__init);
  v7 = (_LSQueryResultWithPropertyList *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

- (_LSQueryResultWithPropertyList)propertyListWithClass:(Class)a3
{
  return -[_LSQueryResultWithPropertyList propertyListWithClass:valuesOfClass:]( self,  "propertyListWithClass:valuesOfClass:",  a3,  0LL);
}

- (_LSQueryResultWithPropertyList)propertyListWithClass:(Class)a3 valuesOfClass:(Class)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = __Block_byref_object_copy__36;
  v27 = __Block_byref_object_dispose__36;
  -[_LSQueryResultWithPropertyList propertyList](self, "propertyList");
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  if (a3)
  {
    if (v24[5])
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      v6 = v24;
      if ((isKindOfClass & 1) == 0)
      {
        v8 = (void *)v24[5];
        v24[5] = 0LL;

        v6 = v24;
      }
    }
  }

  if (a4 && v6[5])
  {
    int v9 = _NSIsNSDictionary();
    v10 = (void *)v24[5];
    if (v9)
    {
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __70___LSQueryResultWithPropertyList_propertyListWithClass_valuesOfClass___block_invoke;
      v22[3] = &unk_189D78230;
      v22[4] = &v23;
      v22[5] = a4;
      [v10 enumerateKeysAndObjectsUsingBlock:v22];
    }

    else if (_NSIsNSArray())
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v11 = (id)v24[5];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v15 = (void *)v24[5];
              v24[5] = 0LL;

              goto LABEL_20;
            }
          }

          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = -[_LSQueryResultWithPropertyList propertyList](self, "propertyList");
  [v5 encodeObject:v4 forKey:@"propertyList"];
}

- (_LSQueryResultWithPropertyList)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[_LSQueryResult _init](self, "_init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    XNSGetPropertyListClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v6, v7, @"propertyList");
    id propertyList = v5->_propertyList;
    v5->_id propertyList = (id)v8;
  }

  return v5;
}

- (id)propertyList
{
  return self->_propertyList;
}

- (void).cxx_destruct
{
}

@end