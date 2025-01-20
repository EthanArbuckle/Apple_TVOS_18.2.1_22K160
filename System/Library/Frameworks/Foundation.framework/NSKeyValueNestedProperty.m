@interface NSKeyValueNestedProperty
- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3;
- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7;
- (Class)_isaForAutonotifying;
- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 firstDotIndex:(unint64_t)a5 propertiesBeingInitialized:(__CFSet *)a6;
- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4;
- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3;
- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3;
- (id)description;
- (void)_addDependentValueKey:(id)a3;
- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4;
- (void)dealloc;
- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7;
@end

@implementation NSKeyValueNestedProperty

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id result = -[NSKeyValueUnnestedProperty keyPathIfAffectedByValueForKey:exactMatch:]( self->_relationshipProperty,  "keyPathIfAffectedByValueForKey:exactMatch:",  a3,  0LL);
  if (result) {
    return self->super._keyPath;
  }
  return result;
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (*(_OWORD *)NSKeyValueGetImplicitObservanceAdditionInfo() == __PAIR128__( (unint64_t)a4,  (unint64_t)a3)) {
    return 0;
  }
  a7->var0 = 0LL;
  a7->var1 = 0LL;
  if (self->_isAllowedToResultInForwarding)
  {
    v13 = (void *)[a3 valueForKey:self->_relationshipKey];
    a7->var0 = v13;
    if (!v13) {
      a7->var0 = (id)[MEMORY[0x189603FE8] null];
    }
  }

  if (-[NSKeyValueUnnestedProperty object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:]( self->_relationshipProperty,  "object:withObservance:willChangeValueForKeyOrKeys:recurse:forwardingValues:",  a3,  a4,  a5,  v8,  v15))
  {
    a7->var1 = v16;
  }

  return 1;
}

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  id var1 = a7.var1;
  id var0 = a7.var0;
  BOOL v22 = a6;
  if (self->_isAllowedToResultInForwarding)
  {
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
    {
      BOOL v8 = 0LL;
      uint64_t v17 = *((_BYTE *)a4 + 40) & 0xF | 0x100LL;
    }

    else
    {
      uint64_t v17 = 264LL;
      BOOL v8 = self;
    }

    if ((id)[MEMORY[0x189603FE8] null] == a7.var0) {
      v9 = 0LL;
    }
    else {
      v9 = var0;
    }
    uint64_t ImplicitObservanceRemovalInfo = NSKeyValueGetImplicitObservanceRemovalInfo();
    uint64_t v11 = *(void *)(ImplicitObservanceRemovalInfo + 8);
    uint64_t v12 = *(void *)(ImplicitObservanceRemovalInfo + 24);
    uint64_t v18 = *(void *)ImplicitObservanceRemovalInfo;
    uint64_t v19 = *(void *)(ImplicitObservanceRemovalInfo + 16);
    uint64_t v13 = *(void *)(ImplicitObservanceRemovalInfo + 32);
    char v20 = *(_BYTE *)(ImplicitObservanceRemovalInfo + 40);
    *(void *)uint64_t ImplicitObservanceRemovalInfo = v9;
    *(void *)(ImplicitObservanceRemovalInfo + 8) = a4;
    *(void *)(ImplicitObservanceRemovalInfo + 16) = self->_keyPathFromRelatedObject;
    *(void *)(ImplicitObservanceRemovalInfo + 24) = a3;
    *(void *)(ImplicitObservanceRemovalInfo + 32) = v8;
    *(_BYTE *)(ImplicitObservanceRemovalInfo + 40) = 1;
    [v9 removeObserver:a4 forKeyPath:self->_keyPathFromRelatedObject];
    *(void *)uint64_t ImplicitObservanceRemovalInfo = v18;
    *(void *)(ImplicitObservanceRemovalInfo + 8) = v11;
    *(void *)(ImplicitObservanceRemovalInfo + 16) = v19;
    *(void *)(ImplicitObservanceRemovalInfo + 24) = v12;
    *(void *)(ImplicitObservanceRemovalInfo + 32) = v13;
    *(_BYTE *)(ImplicitObservanceRemovalInfo + 40) = v20;
    ImplicitObservanceAdditionInfo = (uint64_t *)NSKeyValueGetImplicitObservanceAdditionInfo();
    uint64_t v15 = *ImplicitObservanceAdditionInfo;
    uint64_t v16 = ImplicitObservanceAdditionInfo[1];
    uint64_t *ImplicitObservanceAdditionInfo = (uint64_t)a3;
    ImplicitObservanceAdditionInfo[1] = (uint64_t)a4;
    objc_msgSend( (id)objc_msgSend(a3, "valueForKey:", self->_relationshipKey),  "addObserver:forKeyPath:options:context:",  a4,  self->_keyPathFromRelatedObject,  v17,  v8);
    uint64_t *ImplicitObservanceAdditionInfo = v15;
    ImplicitObservanceAdditionInfo[1] = v16;
  }

  if (var1) {
    -[NSKeyValueUnnestedProperty object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:]( self->_relationshipProperty,  "object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:",  a3,  a4,  a5,  v22,  var0);
  }
}

- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 firstDotIndex:(unint64_t)a5 propertiesBeingInitialized:(__CFSet *)a6
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSKeyValueNestedProperty;
  id v9 = -[NSKeyValueProperty _initWithContainerClass:keyPath:propertiesBeingInitialized:]( &v19,  sel__initWithContainerClass_keyPath_propertiesBeingInitialized_,  a3,  a4,  a6);
  if (v9)
  {
    *((void *)v9 + 3) = objc_msgSend((id)objc_msgSend(a4, "substringToIndex:", a5), "copy");
    *((void *)v9 + 4) = objc_msgSend((id)objc_msgSend(a4, "substringFromIndex:", a5 + 1), "copy");
    *((void *)v9 + 5) =  NSKeyValuePropertyForIsaAndKeyPathInner( *(objc_class **)(*((void *)v9 + 1) + 8LL),  *((void **)v9 + 3),  a6);
    uint64_t v10 = [a4 rangeOfString:@".@"];
    if (v11)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      v14 = (void *)[a4 substringToIndex:v10];
      uint64_t v15 = objc_msgSend( a4,  "rangeOfString:options:range:",  @".",  0,  v12 + v13,  objc_msgSend(a4, "length") - (v12 + v13));
      if (v16) {
        v14 = (void *)objc_msgSend(v14, "stringByAppendingString:", objc_msgSend(a4, "substringFromIndex:", v15));
      }
      *((void *)v9 + 6) = v14;
    }

    int v17 = [*(id *)(*((void *)v9 + 1) + 8) _shouldAddObservationForwardersForKey:*((void *)v9 + 3)];
    *((_BYTE *)v9 + 56) = v17;
    if (v17
      && [*((id *)v9 + 4) hasPrefix:@"@"]
      && [*((id *)v9 + 4) rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
    {
      *((_BYTE *)v9 + 56) = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueNestedProperty;
  -[NSKeyValueProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Container class: %@, Relationship property: %@, Key path from related object: %@>",  objc_opt_class(),  self->super._containerClass->_originalClass,  self->_relationshipProperty,  self->_keyPathFromRelatedObject);
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
}

- (void)_addDependentValueKey:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id dependentValueKeyOrKeys = self->_dependentValueKeyOrKeys;
  id v10 = v4;
  if (dependentValueKeyOrKeys)
  {
    if (!self->_dependentValueKeyOrKeysIsASet)
    {
      id v9 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  self->_dependentValueKeyOrKeys,  v4,  0);

      BOOL v8 = v10;
      self->_id dependentValueKeyOrKeys = v9;
      self->_dependentValueKeyOrKeysIsASet = 1;
      goto LABEL_7;
    }

    v6 = (void *)[dependentValueKeyOrKeys setByAddingObject:v4];

    id v7 = v6;
  }

  else
  {
    id v7 = v4;
  }

  BOOL v8 = v10;
  self->_id dependentValueKeyOrKeys = v7;
LABEL_7:
}

- (Class)_isaForAutonotifying
{
  return -[NSKeyValueUnnestedProperty isaForAutonotifying](self->_relationshipProperty, "isaForAutonotifying");
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  id result = -[NSKeyValueUnnestedProperty keyPathIfAffectedByValueForMemberOfKeys:]( self->_relationshipProperty,  "keyPathIfAffectedByValueForMemberOfKeys:",  a3);
  if (result) {
    return self->super._keyPath;
  }
  return result;
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  BOOL v5 = a5;
  if (_NSKeyValueObserverRegistrationEnableLockingAssertions) {
    os_unfair_lock_assert_owner((os_unfair_lock_t)&_NSKeyValueObserverRegistrationLock);
  }
  if (self->_isAllowedToResultInForwarding)
  {
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
    {
      id v10 = 0LL;
      uint64_t v9 = *((_BYTE *)a4 + 40) & 0xF | 0x100LL;
    }

    else
    {
      uint64_t v9 = 264LL;
      id v10 = self;
    }

    uint64_t ImplicitObservanceAdditionInfo = NSKeyValueGetImplicitObservanceAdditionInfo();
    __int128 v13 = *(_OWORD *)ImplicitObservanceAdditionInfo;
    *(void *)uint64_t ImplicitObservanceAdditionInfo = a3;
    *(void *)(ImplicitObservanceAdditionInfo + 8) = a4;
    os_unfair_recursive_lock_unlock();
    id v12 = (id)[a3 valueForKey:self->_relationshipKey];
    [v12 addObserver:a4 forKeyPath:self->_keyPathFromRelatedObject options:v9 context:v10];

    os_unfair_recursive_lock_lock_with_options();
    *(_OWORD *)uint64_t ImplicitObservanceAdditionInfo = v13;
  }

  -[NSKeyValueUnnestedProperty object:didAddObservance:recurse:]( self->_relationshipProperty,  "object:didAddObservance:recurse:",  a3,  a4,  v5,  v13);
  if (_NSKeyValueObserverRegistrationEnableLockingAssertions) {
    os_unfair_lock_assert_owner((os_unfair_lock_t)&_NSKeyValueObserverRegistrationLock);
  }
}

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  BOOL v16 = a5;
  if (self->_isAllowedToResultInForwarding)
  {
    os_unfair_recursive_lock_unlock();
    v6 = (void *)[a3 valueForKey:self->_relationshipKey];
    uint64_t ImplicitObservanceRemovalInfo = NSKeyValueGetImplicitObservanceRemovalInfo();
    uint64_t v8 = ImplicitObservanceRemovalInfo;
    uint64_t v9 = *(void *)ImplicitObservanceRemovalInfo;
    uint64_t v10 = *(void *)(ImplicitObservanceRemovalInfo + 8);
    uint64_t v11 = *(void *)(ImplicitObservanceRemovalInfo + 16);
    uint64_t v12 = *(void *)(ImplicitObservanceRemovalInfo + 24);
    uint64_t v13 = *(void *)(ImplicitObservanceRemovalInfo + 32);
    char v14 = *(_BYTE *)(ImplicitObservanceRemovalInfo + 40);
    *(void *)uint64_t ImplicitObservanceRemovalInfo = v6;
    *(void *)(ImplicitObservanceRemovalInfo + 8) = a4;
    *(void *)(ImplicitObservanceRemovalInfo + 16) = self->_keyPathFromRelatedObject;
    *(void *)(ImplicitObservanceRemovalInfo + 24) = a3;
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self) {
      uint64_t v15 = 0LL;
    }
    else {
      uint64_t v15 = self;
    }
    *(void *)(ImplicitObservanceRemovalInfo + 32) = v15;
    *(_BYTE *)(ImplicitObservanceRemovalInfo + 40) = 1;
    objc_msgSend(v6, "removeObserver:forKeyPath:");
    *(void *)uint64_t v8 = v9;
    *(void *)(v8 + 8) = v10;
    *(void *)(v8 + 16) = v11;
    *(void *)(v8 + 24) = v12;
    *(void *)(v8 + 32) = v13;
    *(_BYTE *)(v8 + 40) = v14;
    os_unfair_recursive_lock_lock_with_options();
  }

  -[NSKeyValueUnnestedProperty object:didRemoveObservance:recurse:]( self->_relationshipProperty,  "object:didRemoveObservance:recurse:",  a3,  a4,  v16);
}

- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3
{
  *a3 = self->_dependentValueKeyOrKeysIsASet;
  return self->_dependentValueKeyOrKeys;
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  keyPathWithoutOperatorComponents = self->_keyPathWithoutOperatorComponents;
  if (!keyPathWithoutOperatorComponents) {
    keyPathWithoutOperatorComponents = self->super._keyPath;
  }
  return keyPathWithoutOperatorComponents == a3 || CFEqual(a3, keyPathWithoutOperatorComponents) != 0;
}

@end