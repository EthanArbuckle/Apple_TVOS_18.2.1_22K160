@interface RBJetsamProperties
+ (id)jetsamPropertiesForProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6;
- (BOOL)isFreezerEligible;
- (BOOL)isValid;
- (id)_altKeyForCategory:(id)a3 strength:(unsigned __int8)a4;
- (id)_defaultKeyForCategory:(id)a3 strength:(unsigned __int8)a4;
- (id)_directPropertyDescription:(id)a3;
- (id)_initWithProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6;
- (id)_keyForCategory:(id)a3 strength:(unsigned __int8)a4;
- (id)_propertiesDescription;
- (id)description;
- (id)getValueFrom:(id)a3 forKey:(id)a4;
- (int)_integerLimitValue:(id)a3;
- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4;
- (unsigned)_altStrength:(unsigned __int8)a3;
- (void)_setLimitFor:(id)a3 strength:(unsigned __int8)a4 toValue:(id)a5;
@end

@implementation RBJetsamProperties

- (BOOL)isValid
{
  return 1;
}

- (id)getValueFrom:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v7 = [v5 valueForKey:v6];
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_16;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  unint64_t v9 = [v5 unsignedLongLongValue];
  if ([v6 isEqualToString:@"InactiveHardMemoryLimit"])
  {
    if ((~(_DWORD)v9 & 0xC0000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"InactiveSoftMemoryLimit"])
  {
    if ((v9 & 0xC0000000) == 0x80000000)
    {
LABEL_10:
      if ((v9 & 0x3FFFFFFF) == 0x3FFFFFFF) {
        uint64_t v10 = -1LL;
      }
      else {
        uint64_t v10 = v9 & 0x3FFFFFFF;
      }
LABEL_23:
      uint64_t v7 = [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
      goto LABEL_3;
    }

- (BOOL)isFreezerEligible
{
  if (!self->_freezerEligibleSet)
  {
    v3 = -[RBJetsamProperties getValueFrom:forKey:]( self,  "getValueFrom:forKey:",  self->_memoryLimitCategories,  @"FreezerEligible");
    if (!v3)
    {
      uint64_t v4 = -[RBJetsamProperties getValueFrom:forKey:]( self,  "getValueFrom:forKey:",  self->_globalProperties,  @"FreezerEligible");
      if (v4) {
        v3 = (void *)v4;
      }
      else {
        v3 = (void *)MEMORY[0x189604A80];
      }
    }

    self->_freezerEligible = [v3 BOOLValue];
    self->_freezerEligibleSet = 1;
  }

  return self->_freezerEligible;
}

- (id)_keyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  id v4 = a3;
  NSStringFromRBSMemoryLimitStrength();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@MemoryLimit", v4, v5];

  return v6;
}

- (unsigned)_altStrength:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_altKeyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  -[RBJetsamProperties _altStrength:](self, "_altStrength:", v4);
  NSStringFromRBSMemoryLimitStrength();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@MemoryLimit", v6, v7];

  return v8;
}

- (id)_defaultKeyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  return @"InactiveSoftMemoryLimit";
}

- (void)_setLimitFor:(id)a3 strength:(unsigned __int8)a4 toValue:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", a3, v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [self->_memoryLimitCategories setValue:v8 forKey:v9];
}

- (id)_initWithProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___RBJetsamProperties;
  v12 = -[RBJetsamProperties init](&v16, sel_init);
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    id memoryLimitCategories = v12->_memoryLimitCategories;
    v12->_id memoryLimitCategories = (id)v13;

    objc_storeStrong(&v12->_globalProperties, a4);
    v12->_taskLimit = a5;
    v12->_unLimit = a6;
  }

  return v12;
}

+ (id)jetsamPropertiesForProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[RBJetsamProperties _initWithProperties:globalProperties:taskLimit:unLimit:]( objc_alloc(&OBJC_CLASS___RBJetsamProperties),  "_initWithProperties:globalProperties:taskLimit:unLimit:",  v10,  v9,  v7,  v6);

  return v11;
}

- (int)_integerLimitValue:(id)a3
{
  int result = [a3 intValue];
  if (result == -1)
  {
    uint64_t v5 = 24LL;
  }

  else
  {
    if (result) {
      return result;
    }
    uint64_t v5 = 28LL;
  }

  return *(_DWORD *)((char *)&self->super.isa + v5);
}

- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  unsigned int v7 = *a4;
  uint64_t v8 = -[RBJetsamProperties _altStrength:](self, "_altStrength:", *a4);
  if ([v6 isEqual:@"Active"]) {
    char v9 = 1;
  }
  else {
    char v9 = [v6 isEqual:@"Inactive"];
  }
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 2LL;
  }
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v11);
  uint64_t v13 = v12;
  if (v12 && [v12 longValue] != -1)
  {
    *a4 = v10;
    int taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v13);

    goto LABEL_15;
  }
  v15 = -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v8);
  -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v15);
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    *a4 = v8;
    int taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v16);

LABEL_14:
    id v11 = v15;
    goto LABEL_15;
  }

  if (v13)
  {
LABEL_13:
    int taskLimit = self->_taskLimit;
    goto LABEL_14;
  }
  v18 = -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v10);
  uint64_t v19 = -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_globalProperties, v18);
  if (v19)
  {
    v20 = (void *)v19;
    *a4 = v10;
    int taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v19);

    id v11 = v18;
    goto LABEL_15;
  }

  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_globalProperties, v11);
  if (v21)
  {
    v22 = (void *)v21;
    *a4 = v8;
    int taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v21);

    goto LABEL_15;
  }

  if (v9 & 1) != 0 || ([v6 isEqual:@"Inactive"])
  {
    v15 = v11;
    goto LABEL_13;
  }

  rbs_jetsam_log();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v6;
    _os_log_impl( &dword_188634000,  v23,  OS_LOG_TYPE_DEFAULT,  "No JetsamProperties for this process for category '%@'",  (uint8_t *)&v24,  0xCu);
  }

  int taskLimit = -[RBJetsamProperties memoryLimitForCategory:strength:]( self,  "memoryLimitForCategory:strength:",  @"Inactive",  a4);
LABEL_15:

  return taskLimit;
}

- (id)_directPropertyDescription:(id)a3
{
  id v4 = a3;
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v4, 2LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v5);
  if (v6)
  {
    unsigned int v7 = (void *)v6;
    uint64_t v8 = @"\t%@SoftMemoryLimit=%lld\n";
    char v9 = v5;
  }

  else
  {
    -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v4, 1LL);
    char v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v9);
    if (!v10)
    {
      id v11 = &stru_18A257E48;
      goto LABEL_6;
    }

    unsigned int v7 = (void *)v10;
    uint64_t v8 = @"\t%@HardMemoryLimit=%lld\n";
  }

  id v11 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  v8,  v4,  objc_msgSend(v7, "longLongValue"));

LABEL_6:
  return v11;
}

- (id)_propertiesDescription
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [self->_memoryLimitCategories entriesToStringWithIndent:1 debug:1];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v4 = objc_alloc(NSString);
      -[RBJetsamProperties _directPropertyDescription:](self, "_directPropertyDescription:", @"Active");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBJetsamProperties _directPropertyDescription:](self, "_directPropertyDescription:", @"Inactive");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)[v4 initWithFormat:@"%@%@", v5, v6];
    }

    else
    {
      v3 = 0LL;
    }
  }

  return v3;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t taskLimit = self->_taskLimit;
  -[RBJetsamProperties _propertiesDescription](self, "_propertiesDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = (void *)[v3 initWithFormat:@"<%@| tasklimit=%d\n%@>", v4, taskLimit, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end