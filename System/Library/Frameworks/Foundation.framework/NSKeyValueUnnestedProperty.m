@interface NSKeyValueUnnestedProperty
- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3;
- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7;
- (Class)_isaForAutonotifying;
- (Class)isaForAutonotifying;
- (id)_initWithContainerClass:(id)a3 key:(id)a4 propertiesBeingInitialized:(__CFSet *)a5;
- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4;
- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3;
- (id)description;
- (id)keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4;
- (id)keyPathIfAffectedByValueForMemberOfKeys:(id)a3;
- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4;
- (void)dealloc;
- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7;
@end

@implementation NSKeyValueUnnestedProperty

- (id)keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id result = -[NSKeyValueUnnestedProperty _keyPathIfAffectedByValueForKey:exactMatch:]( self,  "_keyPathIfAffectedByValueForKey:exactMatch:");
  if (!result)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    affectingProperties = self->_affectingProperties;
    id result = (id)-[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
    if (result)
    {
      id v9 = result;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(affectingProperties);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) _keyPathIfAffectedByValueForKey:a3 exactMatch:0])
          {
            id result = self->super._keyPath;
            if (a4) {
              *a4 = 0;
            }
            return result;
          }
        }

        id v9 = (id)-[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
        id result = 0LL;
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  keyPath = self->super._keyPath;
  if (keyPath != a3 && !CFEqual(a3, keyPath)) {
    return 0LL;
  }
  if (a4) {
    *a4 = 1;
  }
  return self->super._keyPath;
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a6)
  {
    if (self->_affectingProperties)
    {
      int v11 = _NSIsNSSet();
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      affectingProperties = self->_affectingProperties;
      uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v24,  v23,  16LL);
      if (v13)
      {
        uint64_t v14 = v13;
        __int128 v15 = 0LL;
        uint64_t v16 = *(void *)v25;
        while (1)
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(affectingProperties);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (v11)
            {
              if (![v18 keyPathIfAffectedByValueForMemberOfKeys:a5]) {
                continue;
              }
            }

            else if (![v18 keyPathIfAffectedByValueForKey:a5 exactMatch:0])
            {
              continue;
            }

            if ([v18 object:a3 withObservance:a4 willChangeValueForKeyOrKeys:a5 recurse:0 forwardingValues:&v21])
            {
              if (v21)
              {
                if (v15) {
                  objc_msgSend(v15, "setObject:forKey:");
                }
                else {
                  __int128 v15 = (void *)objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithObject:forKey:");
                }
              }

              if (v22)
              {
                if (v15) {
                  objc_msgSend(v15, "addEntriesFromDictionary:");
                }
                else {
                  __int128 v15 = v22;
                }
              }
            }
          }

          uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v24,  v23,  16LL);
          if (!v14) {
            goto LABEL_25;
          }
        }
      }
    }
  }

  __int128 v15 = 0LL;
LABEL_25:
  a7->var0 = 0LL;
  a7->var1 = v15;
  return 1;
}

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  id var1 = a7.var1;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v11 = objc_msgSend(a7.var1, "countByEnumeratingWithState:objects:count:", &v16, v15, 16, a6, a7.var0);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(var1);
        }
        objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * v14),  "object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:",  a3,  a4,  a5,  0,  objc_msgSend(var1, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v14)),  0);
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = [var1 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }

    while (v12);
  }

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a5)
  {
    affectingProperties = self->_affectingProperties;
    if (affectingProperties)
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(affectingProperties);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) object:a3 didRemoveObservance:a4 recurse:0];
          }

          uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
        }

        while (v9);
      }
    }
  }

- (id)_initWithContainerClass:(id)a3 key:(id)a4 propertiesBeingInitialized:(__CFSet *)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSKeyValueUnnestedProperty;
  v6 = -[NSKeyValueProperty _initWithContainerClass:keyPath:propertiesBeingInitialized:]( &v14,  sel__initWithContainerClass_keyPath_propertiesBeingInitialized_,  a3,  a4);
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
    [v6 _givenPropertiesBeingInitialized:a5 getAffectingProperties:v7];
    [v7 removeObject:v6];
    uint64_t v8 = [v7 count];
    if (v8) {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "allObjects"), "copy");
    }
    v6[3] = v8;

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v9 = (void *)v6[3];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v12++) _addDependentValueKey:v6[2]];
        }

        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v15 count:16];
      }

      while (v10);
    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueUnnestedProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3 = (__CFString *)objc_msgSend( (id)objc_msgSend( -[NSArray valueForKey:](self->_affectingProperties, "valueForKey:", @"keyPath"),  "sortedArrayUsingSelector:",  sel_caseInsensitiveCompare_),  "componentsJoinedByString:",  @", ");
  uint64_t v4 = objc_opt_class();
  keyPath = self->super._keyPath;
  Class originalClass = self->super._containerClass->_originalClass;
  if (self->_cachedIsaForAutonotifyingIsValid) {
    Class cachedIsaForAutonotifying = self->_cachedIsaForAutonotifying;
  }
  else {
    Class cachedIsaForAutonotifying = (Class)@"not cached yet";
  }
  uint64_t v8 = -[__CFString length](v3, "length");
  uint64_t v9 = @"none";
  if (v8) {
    uint64_t v9 = v3;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Container class: %@, Key: %@, isa for autonotifying: %@, Key paths of directly and indirectly affecting properties: %@>",  v4,  originalClass,  keyPath,  cachedIsaForAutonotifying,  v9);
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self->_affectingProperties)
  {
    objc_msgSend(a4, "addObjectsFromArray:");
    return;
  }

  id v7 = (void *)-[objc_class keyPathsForValuesAffectingValueForKey:]( self->super._containerClass->_originalClass,  "keyPathsForValuesAffectingValueForKey:",  self->super._keyPath);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isEqualToString:self->super._keyPath])
        {
          objc_super v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: A +keyPathsForValuesAffectingValueForKey: message returned a set that includes the same key that was passed in, which is not valid.\nPassed-in key: %@\nReturned key path set: %@",  self->super._containerClass->_originalClass,  self->super._keyPath,  v7);
          goto LABEL_17;
        }

        if (objc_msgSend( v12,  "hasPrefix:",  -[NSString stringByAppendingString:]( self->super._keyPath,  "stringByAppendingString:",  @".")))
        {
          objc_super v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: A +keyPathsForValuesAffectingValueForKey: message returned a set that includes a key path that starts with the same key that was passed in, which is not valid. The property identified by the key path already depends on the property identified by the key, never vice versa.\nPassed-in key: %@\nReturned key path set: %@",  self->super._containerClass->_originalClass,  self->super._keyPath,  v7);
LABEL_17:
          objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v14 userInfo:0]);
        }

        __int128 v13 = NSKeyValuePropertyForIsaAndKeyPathInner(self->super._containerClass->_originalClass, v12, a3);
        if (([a4 containsObject:v13] & 1) == 0)
        {
          [a4 addObject:v13];
          [v13 _givenPropertiesBeingInitialized:a3 getAffectingProperties:a4];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }

    while (v9);
  }

- (Class)_isaForAutonotifying
{
  if (!-[objc_class automaticallyNotifiesObserversForKey:]( self->super._containerClass->_originalClass,  "automaticallyNotifiesObserversForKey:",  self->super._keyPath)) {
    return 0LL;
  }
  Class result = (Class)_NSKeyValueContainerClassGetNotifyingInfo((uint64_t)self->super._containerClass);
  if (result)
  {
    Class v4 = result;
    _NSKVONotifyingEnableForInfoAndKey((uint64_t)result, self->super._keyPath);
    return v4[1].isa;
  }

  return result;
}

- (Class)isaForAutonotifying
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!self->_cachedIsaForAutonotifyingIsValid)
  {
    self->_Class cachedIsaForAutonotifying = -[NSKeyValueUnnestedProperty _isaForAutonotifying](self, "_isaForAutonotifying");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    affectingProperties = self->_affectingProperties;
    uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(affectingProperties);
          }
          uint64_t v8 = (objc_class *)[*(id *)(*((void *)&v11 + 1) + 8 * i) _isaForAutonotifying];
          if (v8) {
            self->_Class cachedIsaForAutonotifying = v8;
          }
        }

        uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      }

      while (v5);
    }

    self->_cachedIsaForAutonotifyingIsValid = 1;
  }

  return self->_cachedIsaForAutonotifying;
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  else {
    return 0LL;
  }
}

- (id)keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id result = -[NSKeyValueUnnestedProperty _keyPathIfAffectedByValueForMemberOfKeys:]( self,  "_keyPathIfAffectedByValueForMemberOfKeys:");
  if (!result)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    affectingProperties = self->_affectingProperties;
    id result = (id)-[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(affectingProperties);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) _keyPathIfAffectedByValueForMemberOfKeys:a3])
          {
            return self->super._keyPath;
          }
        }

        id v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
        id result = 0LL;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a5)
  {
    affectingProperties = self->_affectingProperties;
    if (affectingProperties)
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(affectingProperties);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) object:a3 didAddObservance:a4 recurse:0];
          }

          uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( affectingProperties,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
        }

        while (v9);
      }
    }
  }

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  keyPath = self->super._keyPath;
  return keyPath == a3 || CFEqual(a3, keyPath) != 0;
}

@end