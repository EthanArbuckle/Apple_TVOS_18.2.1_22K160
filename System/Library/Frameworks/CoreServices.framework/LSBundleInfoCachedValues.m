@interface LSBundleInfoCachedValues
- (BOOL)BOOLForKey:(id)a3;
- (LSBundleInfoCachedValues)init;
- (NSDictionary)rawValues;
- (NSSet)allKeys;
- (id)URLForKey:(id)a3;
- (id)_expensiveDictionaryRepresentation;
- (id)_initWithKeys:(id)a3 forDictionary:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)arrayForKey:(id)a3 withValuesOfClass:(Class)a4;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryForKey:(id)a3 valuesOfClass:(Class)a4;
- (id)numberForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofType:(Class)a4;
- (id)objectsForKeys:(id)a3;
- (id)stringForKey:(id)a3;
@end

@implementation LSBundleInfoCachedValues

- (id)_initWithKeys:(id)a3 forDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 28, @"Invalid parameter not satisfying: %@", @"keys" object file lineNumber description];
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LSBundleInfoCachedValues;
  v9 = -[LSPropertyList _init](&v16, sel__init);
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    v11 = (void *)v9[1];
    v9[1] = v10;

    uint64_t v12 = [v8 copy];
    v13 = (void *)v9[2];
    v9[2] = v12;
  }

  return v9;
}

- (id)numberForKey:(id)a3
{
  id v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 57, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }

  values = self->_values;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = -[NSDictionary objectForKey:](values, "objectForKey:", v5);
  v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0LL;
  }

  return v9;
}

- (id)objectForKey:(id)a3
{
  return -[LSBundleInfoCachedValues objectForKey:ofType:](self, "objectForKey:ofType:", a3, 0LL);
}

- (id)objectForKey:(id)a3 ofType:(Class)a4
{
  id v7 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v7))
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 47, @"value for key='%@' not requested to be cached", v7 object file lineNumber description];
  }

  uint64_t v8 = -[NSDictionary objectForKey:](self->_values, "objectForKey:", v7);
  v9 = (void *)v8;
  if (a4 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0LL;
  }

  return v9;
}

- (id)stringForKey:(id)a3
{
  id v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 67, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }

  values = self->_values;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = -[NSDictionary objectForKey:](values, "objectForKey:", v5);
  v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0LL;
  }

  return v9;
}

- (id)arrayForKey:(id)a3
{
  return -[LSBundleInfoCachedValues arrayForKey:withValuesOfClass:](self, "arrayForKey:withValuesOfClass:", a3, 0LL);
}

- (id)arrayForKey:(id)a3 withValuesOfClass:(Class)a4
{
  id v7 = a3;
  Class v18 = a4;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v7))
  {
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 79, @"value for key='%@' not requested to be cached", v7 object file lineNumber description];
  }

  values = self->_values;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = -[NSDictionary objectForKey:](values, "objectForKey:", v7);
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0LL;
  }

  if (v11) {
    BOOL v13 = a4 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v18 count:1];
    char v15 = _LSIsArrayWithValuesOfClasses(v11, v14);

    if ((v15 & 1) == 0)
    {

      v11 = 0LL;
    }
  }

  return v11;
}

- (id)dictionaryForKey:(id)a3
{
  return -[LSBundleInfoCachedValues dictionaryForKey:valuesOfClass:](self, "dictionaryForKey:valuesOfClass:", a3, 0LL);
}

- (id)dictionaryForKey:(id)a3 valuesOfClass:(Class)a4
{
  id v7 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v7))
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 97, @"value for key='%@' not requested to be cached", v7 object file lineNumber description];
  }

  values = self->_values;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = -[NSDictionary objectForKey:](values, "objectForKey:", v7);
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0LL;
  }

  if (a4 && v11 && (_LSIsDictionaryWithKeysAndValuesOfClass(v11, 0LL, a4) & 1) == 0)
  {

    v11 = 0LL;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (LSBundleInfoCachedValues)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]( self,  "_initWithKeys:forDictionary:",  v3,  MEMORY[0x189604A60]);

  return v4;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 52, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }

  BOOL v6 = -[NSDictionary _LS_BoolForKey:](self->_values, "_LS_BoolForKey:", v5);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v5 = a3;
  if (!-[NSSet containsObject:](self->_keys, "containsObject:", v5))
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSBundleInfoCachedValues.m", 62, @"value for key='%@' not requested to be cached", v5 object file lineNumber description];
  }

  values = self->_values;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = -[NSDictionary objectForKey:](values, "objectForKey:", v5);
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)objectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]( objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues),  "_initWithKeys:forDictionary:",  v4,  self->_values);

  return v5;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return -[LSBundleInfoCachedValues objectForKey:ofClass:valuesOfClass:]( self,  "objectForKey:ofClass:valuesOfClass:",  a3,  a4,  0LL);
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  id v8 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    uint64_t v9 = -[LSBundleInfoCachedValues arrayForKey:withValuesOfClass:](self, "arrayForKey:withValuesOfClass:", v8, a5);
  }

  else
  {
    if ((Class)objc_opt_class() == a4) {
      -[LSBundleInfoCachedValues dictionaryForKey:valuesOfClass:](self, "dictionaryForKey:valuesOfClass:", v8, a5);
    }
    else {
    uint64_t v9 = -[LSBundleInfoCachedValues objectForKey:ofType:](self, "objectForKey:ofType:", v8, a4);
    }
  }

  BOOL v10 = (void *)v9;

  return v10;
}

- (id)_expensiveDictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_keys;
  uint64_t v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = -[NSDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v9, (void)v12);
        if (v10) {
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }

      uint64_t v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (NSDictionary)rawValues
{
  return self->_values;
}

- (NSSet)allKeys
{
  return self->_keys;
}

@end