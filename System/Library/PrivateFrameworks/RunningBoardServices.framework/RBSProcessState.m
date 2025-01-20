@interface RBSProcessState
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)stateWithProcess:(id)a3;
+ (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
+ (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 service:(id)a5 error:(id *)a6;
+ (id)untrackedRunningStateforProcess:(id)a3;
+ (void)setActiveStateDescriptor:(id)a3;
- (BOOL)isDebugging;
- (BOOL)isDifferentFromState:(id)a3 significantly:(BOOL *)a4;
- (BOOL)isEmptyState;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreventedFromLaunching;
- (BOOL)isRunning;
- (NSSet)assertions;
- (NSSet)endowmentInfos;
- (NSSet)endowmentNamespaces;
- (NSSet)legacyAssertions;
- (NSSet)primitiveAssertions;
- (NSSet)tags;
- (NSString)description;
- (OS_xpc_object)codedState;
- (RBSProcessHandle)process;
- (RBSProcessState)init;
- (RBSProcessState)initWithRBSXPCCoder:(id)a3;
- (id)_lock_encodedStateForDescriptor:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)debugState;
- (unsigned)taskState;
- (unsigned)terminationResistance;
- (void)_lock_finalizeCodingForValues:(uint64_t)a1;
- (void)encodeWithPreviousState:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)initWithProcess:(void *)a1;
- (void)setDebugState:(unsigned __int8)a3;
- (void)setEndowmentInfos:(id)a3;
- (void)setEndowmentNamespaces:(id)a3;
- (void)setLegacyAssertions:(id)a3;
- (void)setPrimitiveAssertions:(id)a3;
- (void)setTags:(id)a3;
- (void)setTaskState:(unsigned __int8)a3;
- (void)setTerminationResistance:(unsigned __int8)a3;
@end

@implementation RBSProcessState

+ (id)stateWithProcess:(id)a3
{
  id v3 = a3;
  v4 = -[RBSProcessState initWithProcess:](objc_alloc(&OBJC_CLASS___RBSProcessState), v3);

  return v4;
}

- (void)initWithProcess:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = [a1 init];
    a1 = (void *)v5;
    if (v5) {
      objc_storeStrong((id *)(v5 + 40), a2);
    }
  }

  return a1;
}

+ (id)untrackedRunningStateforProcess:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setTaskState:2];
  return v3;
}

- (RBSProcessState)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSProcessState;
  result = -[RBSProcessState init](&v3, sel_init);
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 service:(id)a5 error:(id *)a6
{
  return (id)[a5 statesForPredicate:a3 withDescriptor:a4 error:a6];
}

+ (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  [v9 statesForPredicate:v8 withDescriptor:v7 error:a5];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isRunning
{
  return RBSTaskStateIsRunning(self->_taskState);
}

- (BOOL)isDebugging
{
  return RBSDebugStateIsDebugging(self->_debugState);
}

- (BOOL)isEmptyState
{
  BOOL result = !-[RBSProcessState isRunning](self, "isRunning")
        && ((int terminationResistance = self->_terminationResistance, terminationResistance != 20)
          ? (BOOL v4 = terminationResistance == 0)
          : (BOOL v4 = 1),
            v4
         && !-[NSSet count](self->_endowmentNamespaces, "count")
         && !-[NSSet count](self->_tags, "count")
         && !-[NSSet count](self->_legacyAssertions, "count")
         && !-[NSSet count](self->_primitiveAssertions, "count"))
        && -[NSSet count](self->_endowmentInfos, "count") == 0;
  return result;
}

- (NSSet)assertions
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 unionSet:self->_legacyAssertions];
  [v3 unionSet:self->_primitiveAssertions];
  return (NSSet *)v3;
}

- (NSSet)endowmentInfos
{
  return self->_endowmentInfos;
}

+ (void)setActiveStateDescriptor:(id)a3
{
  id v6 = a3;
  [MEMORY[0x189607A40] currentThread];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 threadDictionary];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v6) {
    [v4 setObject:v6 forKey:@"RBSProcessStateDescriptor"];
  }
  else {
    [v4 removeObjectForKey:@"RBSProcessStateDescriptor"];
  }
}

- (BOOL)isDifferentFromState:(id)a3 significantly:(BOOL *)a4
{
  id v6 = (RBSProcessState *)a3;
  id v7 = v6;
  if (v6)
  {
    if (self == v6) {
      goto LABEL_38;
    }
    if (self->_taskState == v6->_taskState
      && (int v8 = -[RBSProcessHandle pid](self->_process, "pid"), v8 == -[RBSProcessHandle pid](v7->_process, "pid")))
    {
      endowmentNamespaces = self->_endowmentNamespaces;
      v10 = (const __CFSet *)v7->_endowmentNamespaces;
      if (endowmentNamespaces == (NSSet *)v10
        || endowmentNamespaces
        && v10
        && (CFIndex v11 = CFSetGetCount((CFSetRef)self->_endowmentNamespaces), v11 == CFSetGetCount(v10))
        && -[NSSet isEqualToSet:](endowmentNamespaces, "isEqualToSet:", v10))
      {
        if (self->_debugState != v7->_debugState || self->_terminationResistance != v7->_terminationResistance) {
          goto LABEL_41;
        }
        tags = self->_tags;
        v13 = (const __CFSet *)v7->_tags;
        if (tags != (NSSet *)v13)
        {
          char v14 = 0;
          if (!tags || !v13) {
            goto LABEL_35;
          }
          CFIndex Count = CFSetGetCount((CFSetRef)self->_tags);
          if (Count != CFSetGetCount(v13) || !-[NSSet isEqualToSet:](tags, "isEqualToSet:", v13)) {
            goto LABEL_41;
          }
        }

        legacyAssertions = self->_legacyAssertions;
        v17 = (const __CFSet *)v7->_legacyAssertions;
        if (legacyAssertions != (NSSet *)v17)
        {
          char v14 = 0;
          if (!legacyAssertions || !v17) {
            goto LABEL_35;
          }
          CFIndex v18 = CFSetGetCount((CFSetRef)self->_legacyAssertions);
          if (v18 != CFSetGetCount(v17) || !-[NSSet isEqualToSet:](legacyAssertions, "isEqualToSet:", v17)) {
            goto LABEL_41;
          }
        }

        primitiveAssertions = self->_primitiveAssertions;
        v20 = (const __CFSet *)v7->_primitiveAssertions;
        if (primitiveAssertions != (NSSet *)v20)
        {
          char v14 = 0;
          if (!primitiveAssertions || !v20) {
            goto LABEL_35;
          }
          CFIndex v21 = CFSetGetCount((CFSetRef)self->_primitiveAssertions);
          if (v21 != CFSetGetCount(v20) || !-[NSSet isEqualToSet:](primitiveAssertions, "isEqualToSet:", v20))
          {
LABEL_41:
            char v14 = 0;
            goto LABEL_35;
          }
        }

        endowmentInfos = self->_endowmentInfos;
        v23 = (const __CFSet *)v7->_endowmentInfos;
        if (endowmentInfos != (NSSet *)v23)
        {
          char v14 = 0;
          if (!endowmentInfos || !v23) {
            goto LABEL_35;
          }
          CFIndex v24 = CFSetGetCount((CFSetRef)endowmentInfos);
          if (v24 == CFSetGetCount(v23))
          {
            BOOL v25 = -[NSSet isEqualToSet:](endowmentInfos, "isEqualToSet:", v23);
            char v14 = 0;
            BOOL v26 = 0;
            if (v25) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }

          goto LABEL_41;
        }

- (void)encodeWithPreviousState:(id)a3
{
  v77 = (unsigned __int8 *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_codedState)
  {
    BOOL v4 = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
    codedState = self->_codedState;
    self->_codedState = v4;

    if (v77)
    {
      uint64_t v6 = *((void *)v77 + 2);
      id v7 = *((id *)v77 + 1);
      int v8 = v77;
      v9 = v7;
      if (self->_process == (RBSProcessHandle *)*((void *)v77 + 5))
      {
        v10 = self->_codedState;
        id v11 = v7;
        v12 = v10;
        if (v11)
        {
          xpc_dictionary_get_value(v11, "_process");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          char v14 = v13;
          if (v12 && v13) {
            xpc_dictionary_set_value(v12, "_process", v13);
          }
        }

        else
        {
          char v14 = 0LL;
        }

        int v8 = v77;
      }

      if ((v6 & 1) != 0 && self->_taskState == v8[36] && self->_debugState == v8[37])
      {
        v15 = self->_codedState;
        self->_codedValues |= 1uLL;
        id v16 = v9;
        v17 = v15;
        if (v16)
        {
          xpc_dictionary_get_value(v16, "_taskState");
          CFIndex v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17 && v18) {
            xpc_dictionary_set_value(v17, "_taskState", v18);
          }
        }

        else
        {
          v19 = 0LL;
        }

        v20 = self->_codedState;
        id v21 = v16;
        v22 = v20;
        if (v16)
        {
          xpc_dictionary_get_value(v21, "_debugState");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v23;
          if (v22)
          {
            if (v23) {
              xpc_dictionary_set_value(v22, "_debugState", v23);
            }
          }
        }

        int v8 = v77;
      }

      if ((v6 & 4) != 0 && self->_terminationResistance == v8[38])
      {
        CFIndex v24 = self->_codedState;
        self->_codedValues |= 4uLL;
        id v25 = v9;
        BOOL v26 = v24;
        if (v25)
        {
          xpc_dictionary_get_value(v25, "_terminationResistance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v28 = v27;
          if (v26 && v27) {
            xpc_dictionary_set_value(v26, "_terminationResistance", v27);
          }
        }

        else
        {
          BOOL v28 = 0LL;
        }

        int v8 = v77;
      }

      if ((v6 & 0x8000) != 0)
      {
        endowmentNamespaces = self->_endowmentNamespaces;
        v30 = (const __CFSet *)*((void *)v8 + 6);
        if (endowmentNamespaces == (NSSet *)v30
          || endowmentNamespaces
          && v30
          && (CFIndex Count = CFSetGetCount((CFSetRef)self->_endowmentNamespaces),
              CFIndex v32 = CFSetGetCount(v30),
              int v8 = v77,
              Count == v32)
          && (v33 = -[NSSet isEqualToSet:](endowmentNamespaces, "isEqualToSet:", v30), int v8 = v77, v33))
        {
          v34 = self->_codedState;
          self->_codedValues |= 0x8000uLL;
          id v35 = v9;
          v36 = v34;
          if (v35)
          {
            xpc_dictionary_get_value(v35, "_endowmentNamespaces");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (v36 && v37) {
              xpc_dictionary_set_value(v36, "_endowmentNamespaces", v37);
            }
          }

          else
          {
            v38 = 0LL;
          }

          int v8 = v77;
        }
      }

      if ((v6 & 2) != 0)
      {
        tags = self->_tags;
        v40 = (const __CFSet *)*((void *)v8 + 7);
        if (tags == (NSSet *)v40
          || tags
          && v40
          && (v41 = CFSetGetCount((CFSetRef)self->_tags), v42 = CFSetGetCount(v40), int v8 = v77, v41 == v42)
          && (v43 = -[NSSet isEqualToSet:](tags, "isEqualToSet:", v40), int v8 = v77, v43))
        {
          v44 = self->_codedState;
          self->_codedValues |= 2uLL;
          id v45 = v9;
          v46 = v44;
          if (v45)
          {
            xpc_dictionary_get_value(v45, "_tags");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v46 && v47) {
              xpc_dictionary_set_value(v46, "_tags", v47);
            }
          }

          else
          {
            v48 = 0LL;
          }

          int v8 = v77;
        }
      }

      if ((v6 & 8) != 0)
      {
        legacyAssertions = self->_legacyAssertions;
        v50 = (const __CFSet *)*((void *)v8 + 8);
        if (legacyAssertions == (NSSet *)v50
          || legacyAssertions
          && v50
          && (v51 = CFSetGetCount((CFSetRef)self->_legacyAssertions), v52 = CFSetGetCount(v50), int v8 = v77, v51 == v52)
          && (v53 = -[NSSet isEqualToSet:](legacyAssertions, "isEqualToSet:", v50), int v8 = v77, v53))
        {
          v54 = self->_codedState;
          self->_codedValues |= 8uLL;
          id v55 = v9;
          v56 = v54;
          if (v55)
          {
            xpc_dictionary_get_value(v55, "_legacyAssertions");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v56 && v57) {
              xpc_dictionary_set_value(v56, "_legacyAssertions", v57);
            }
          }

          else
          {
            v58 = 0LL;
          }

          int v8 = v77;
        }
      }

      if ((v6 & 0x10) != 0)
      {
        primitiveAssertions = self->_primitiveAssertions;
        v60 = (const __CFSet *)*((void *)v8 + 9);
        if (primitiveAssertions == (NSSet *)v60
          || primitiveAssertions
          && v60
          && (v61 = CFSetGetCount((CFSetRef)self->_primitiveAssertions), v62 = CFSetGetCount(v60), int v8 = v77, v61 == v62)
          && (v63 = -[NSSet isEqualToSet:](primitiveAssertions, "isEqualToSet:", v60), int v8 = v77, v63))
        {
          v64 = self->_codedState;
          self->_codedValues |= 0x10uLL;
          id v65 = v9;
          v66 = v64;
          if (v65)
          {
            xpc_dictionary_get_value(v65, "_primitiveAssertions");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67;
            if (v66 && v67) {
              xpc_dictionary_set_value(v66, "_primitiveAssertions", v67);
            }
          }

          else
          {
            v68 = 0LL;
          }

          int v8 = v77;
        }
      }

      if ((v6 & 0x20) != 0)
      {
        endowmentInfos = self->_endowmentInfos;
        v70 = (const __CFSet *)*((void *)v8 + 10);
        if (endowmentInfos == (NSSet *)v70
          || endowmentInfos
          && v70
          && (CFIndex v71 = CFSetGetCount((CFSetRef)self->_endowmentInfos), v71 == CFSetGetCount(v70))
          && -[NSSet isEqualToSet:](endowmentInfos, "isEqualToSet:", v70))
        {
          v72 = self->_codedState;
          self->_codedValues |= 0x20uLL;
          id v73 = v9;
          v74 = v72;
          if (v73)
          {
            xpc_dictionary_get_value(v73, "_endowmentInfos");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v75;
            if (v74 && v75) {
              xpc_dictionary_set_value(v74, "_endowmentInfos", v75);
            }
          }

          else
          {
            v76 = 0LL;
          }
        }
      }
    }

    if (-[RBSProcessHandle isReported](self->_process, "isReported")) {
      -[RBSProcessState _lock_finalizeCodingForValues:]((uint64_t)self, 32831LL);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_finalizeCodingForValues:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = a2 & ~*(void *)(a1 + 16);
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 8), "_process");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7) {
        return;
      }
      uint64_t v4 = *(void *)(a1 + 8);
    }

    +[RBSXPCCoder coderWithMessage:](&OBJC_CLASS___RBSXPCCoder, "coderWithMessage:", v4);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      id v13 = v8;
      if (([v8 containsValueForKey:@"_process"] & 1) == 0) {
        [v13 encodeObject:*(void *)(a1 + 40) forKey:@"_process"];
      }
      if ((v5 & 1) != 0)
      {
        uint64_t v9 = *(void *)(a1 + 16);
        if ((v9 & 1) == 0)
        {
          if (*(_BYTE *)(a1 + 36))
          {
            *(void *)(a1 + 16) = v9 | 1;
            objc_msgSend(v13, "encodeInt64:forKey:");
          }

          if (*(_BYTE *)(a1 + 37))
          {
            *(void *)(a1 + 16) |= 1uLL;
            objc_msgSend(v13, "encodeInt64:forKey:");
          }
        }
      }

      if ((v5 & 4) != 0)
      {
        uint64_t v10 = *(void *)(a1 + 16);
        if ((v10 & 4) == 0)
        {
          if (*(_BYTE *)(a1 + 38))
          {
            *(void *)(a1 + 16) = v10 | 4;
            objc_msgSend(v13, "encodeInt64:forKey:");
          }
        }
      }

      if ((v5 & 0x8000) != 0 && (*(_BYTE *)(a1 + 17) & 0x80) == 0 && [*(id *)(a1 + 48) count])
      {
        *(void *)(a1 + 16) |= 0x8000uLL;
        [v13 encodeObject:*(void *)(a1 + 48) forKey:@"_endowmentNamespaces"];
      }

      if ((v5 & 2) != 0 && (*(_BYTE *)(a1 + 16) & 2) == 0 && [*(id *)(a1 + 56) count])
      {
        *(void *)(a1 + 16) |= 2uLL;
        [v13 encodeObject:*(void *)(a1 + 56) forKey:@"_tags"];
      }

      if ((v5 & 8) != 0 && (*(_BYTE *)(a1 + 16) & 8) == 0 && [*(id *)(a1 + 64) count])
      {
        *(void *)(a1 + 16) |= 8uLL;
        [v13 encodeObject:*(void *)(a1 + 64) forKey:@"_legacyAssertions"];
      }

      if ((v5 & 0x10) != 0 && (*(_BYTE *)(a1 + 16) & 0x10) == 0 && [*(id *)(a1 + 72) count])
      {
        *(void *)(a1 + 16) |= 0x10uLL;
        [v13 encodeObject:*(void *)(a1 + 72) forKey:@"_primitiveAssertions"];
      }

      if ((v5 & 0x20) != 0 && (*(_BYTE *)(a1 + 16) & 0x20) == 0)
      {
        if ([*(id *)(a1 + 80) count])
        {
          *(void *)(a1 + 16) |= 0x20uLL;
          [v13 encodeObject:*(void *)(a1 + 80) forKey:@"_endowmentInfos"];
        }
      }

      uint64_t v11 = [v13 createMessage];
      v12 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v11;
    }
  }

- (id)_lock_encodedStateForDescriptor:(uint64_t)a1
{
  if (!a1)
  {
    id v12 = 0LL;
    return v12;
  }

  objc_super v3 = (os_unfair_lock_s *)(a1 + 32);
  id v4 = a2;
  os_unfair_lock_assert_owner(v3);
  uint64_t v5 = [v4 values];
  -[RBSProcessStateDescriptor _endowmentNamespaces]((id *)v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 count];
  if (v7) {
    v5 |= 0x8000uLL;
  }
  -[RBSProcessState _lock_finalizeCodingForValues:](a1, v5);
  uint64_t v8 = *(void *)(a1 + 16) & v5;
  [MEMORY[0x189607968] numberWithUnsignedInteger:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 24) objectForKey:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (!v10)
  {
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    id v14 = *(id *)(a1 + 8);
    id v15 = v13;
    id v12 = v15;
    if (v14)
    {
      xpc_dictionary_get_value(v14, "_process");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      BOOL v18 = v12 != 0LL;
      if (v12 && v16)
      {
        xpc_dictionary_set_value(v12, "_process", v16);
        BOOL v18 = 1;
      }
    }

    else
    {
      v17 = 0LL;
      BOOL v18 = v15 != 0LL;
    }

    if ((v8 & 1) != 0)
    {
      id v19 = *(id *)(a1 + 8);
      id v20 = v12;
      if (v19)
      {
        xpc_dictionary_get_value(v19, "_taskState");
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
        char v22 = !v18;
        if (!v21) {
          char v22 = 1;
        }
        if ((v22 & 1) == 0) {
          xpc_dictionary_set_value(v20, "_taskState", v21);
        }
      }

      else
      {
        id v21 = 0LL;
      }

      id v23 = *(id *)(a1 + 8);
      id v24 = v20;
      if (v23)
      {
        xpc_dictionary_get_value(v23, "_debugState");
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        char v26 = !v18;
        if (!v25) {
          char v26 = 1;
        }
        if ((v26 & 1) == 0) {
          xpc_dictionary_set_value(v24, "_debugState", v25);
        }
      }

      else
      {
        id v25 = 0LL;
      }

      if ((v8 & 4) == 0)
      {
LABEL_13:
        if ((v8 & 0x8000) == 0) {
          goto LABEL_14;
        }
        goto LABEL_39;
      }
    }

    else if ((v8 & 4) == 0)
    {
      goto LABEL_13;
    }

    id v27 = *(id *)(a1 + 8);
    id v28 = v12;
    if (v27)
    {
      xpc_dictionary_get_value(v27, "_terminationResistance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      char v30 = !v18;
      if (!v29) {
        char v30 = 1;
      }
      if ((v30 & 1) == 0) {
        xpc_dictionary_set_value(v28, "_terminationResistance", v29);
      }
    }

    else
    {
      v29 = 0LL;
    }

    if ((v8 & 0x8000) == 0)
    {
LABEL_14:
      if ((v8 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_46;
    }

- (unint64_t)hash
{
  return -[RBSProcessHandle hash](self->_process, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessState *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }

  else if (v4 && (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    BOOL v7 = !-[RBSProcessState isDifferentFromState:significantly:](self, "isDifferentFromState:significantly:", v5, 0LL);
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (NSString)description
{
  int terminationResistance = self->_terminationResistance;
  -[NSSet allObjects](self->_endowmentNamespaces, "allObjects");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];
  -[NSSet allObjects](self->_tags, "allObjects");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];
  -[NSSet allObjects](self->_legacyAssertions, "allObjects");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];
  v49 = -[NSSet allObjects](self->_primitiveAssertions, "allObjects");
  uint64_t v35 = [v49 count];
  -[NSSet allObjects](self->_endowmentInfos, "allObjects");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v10 count];
  id v37 = objc_alloc(NSString);
  uint64_t v40 = [(id)objc_opt_class() description];
  uint64_t v39 = NSStringFromRBSTaskState(self->_taskState);
  NSStringFromRBSDebugState(self->_debugState);
  char v50 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = @" terminationResistance:";
  if (!terminationResistance) {
    uint64_t v11 = &stru_189DE1D08;
  }
  id v36 = v11;
  int v44 = terminationResistance;
  if (terminationResistance)
  {
    NSStringFromRBSTerminationResistance(self->_terminationResistance);
    id v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v48 = &stru_189DE1D08;
  }

  BOOL v12 = -[RBSProcessState isPreventedFromLaunching](self, "isPreventedFromLaunching");
  xpc_object_t v13 = @" launchPrevented";
  if (!v12) {
    xpc_object_t v13 = &stru_189DE1D08;
  }
  char v34 = v13;
  id v14 = @" endowmentNamespace:[\n\t";
  if (!v5) {
    id v14 = &stru_189DE1D08;
  }
  BOOL v33 = v14;
  if (v5)
  {
    [v4 componentsJoinedByString:@",\n\t"];
    id v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v32 = @"\n\t]";
  }

  else
  {
    id v32 = &stru_189DE1D08;
    id v47 = &stru_189DE1D08;
  }

  id v15 = @" endowmentInfo:[\n\t";
  if (!v51) {
    id v15 = &stru_189DE1D08;
  }
  id v31 = v15;
  uint64_t v43 = v5;
  if (v51)
  {
    [v10 componentsJoinedByString:@",\n\t"];
    char v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    char v46 = &stru_189DE1D08;
  }

  if (v7) {
    id v16 = @" tags:[\n\t";
  }
  else {
    id v16 = &stru_189DE1D08;
  }
  uint64_t v41 = v7;
  char v42 = v10;
  if (v7)
  {
    [v6 componentsJoinedByString:@",\n\t"];
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = @"\n\t]";
  }

  else
  {
    BOOL v18 = &stru_189DE1D08;
    v17 = &stru_189DE1D08;
  }

  if (v9) {
    id v19 = @" legacyAssertions:[\n\t";
  }
  else {
    id v19 = &stru_189DE1D08;
  }
  id v45 = v8;
  uint64_t v38 = v9;
  if (v9)
  {
    [v8 componentsJoinedByString:@",\n\t"];
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v21 = @"\n\t]";
  }

  else
  {
    id v21 = &stru_189DE1D08;
    id v20 = &stru_189DE1D08;
  }

  char v22 = v6;
  if (v35)
  {
    [v49 componentsJoinedByString:@",\n\t"];
    id v23 = v4;
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v21;
    id v25 = (void *)v39;
    char v26 = (void *)v40;
    id v27 = (void *)[v37 initWithFormat:@"<%@| task:%@ debug:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@>", v40, v39, v50, v36, v48, v34, v33, v47, v32, v31, v46, v16, v17, v18, v19, v20, v29, @" rbAssertions:[\n\t", v24, @"\n\t]", &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08];

    id v4 = v23;
  }

  else
  {
    char v30 = v21;
    id v25 = (void *)v39;
    char v26 = (void *)v40;
    id v27 = (void *)[v37 initWithFormat:@"<%@| task:%@ debug:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@>", v40, v39, v50, v36, v48, v34, v33, v47, v32, v31, v46, v16, v17, v18, v19, v20, v30, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08];
  }

  if (v38) {

  }
  if (v41) {
  if (v51)
  }

  if (v43) {
  if (v44)
  }

  return (NSString *)v27;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [MEMORY[0x189607A40] currentThread];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 threadDictionary];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:@"RBSProcessStateDescriptor"];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    uint64_t v8 = -[RBSProcessState _lock_encodedStateForDescriptor:]((uint64_t)self, v9);
    [v5 encodeObject:v8 forKey:@"_codedState"];

    id v5 = (id)v8;
  }

  else
  {
    -[RBSProcessState _lock_finalizeCodingForValues:]((uint64_t)self, -1LL);
    [v5 encodeObject:self->_codedState forKey:@"_codedState"];
  }

  os_unfair_lock_unlock(p_lock);
}

- (RBSProcessState)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeXPCObjectOfType:MEMORY[0x1895F9250] forKey:@"_codedState"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = +[RBSXPCCoder coderWithMessage:](&OBJC_CLASS___RBSXPCCoder, "coderWithMessage:", v5);

    id v4 = (id)v6;
  }

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_process"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v8 = -[RBSProcessState init](self, "init");
    id v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_process, v7);
      v9->_taskState = [v4 decodeInt64ForKey:@"_taskState"];
      v9->_debugState = [v4 decodeInt64ForKey:@"_debugState"];
      v9->_int terminationResistance = [v4 decodeInt64ForKey:@"_terminationResistance"];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [v4 decodeCollectionOfClass:v10 containingClass:objc_opt_class() forKey:@"_endowmentNamespaces"];
      endowmentNamespaces = v9->_endowmentNamespaces;
      v9->_endowmentNamespaces = (NSSet *)v11;

      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [v4 decodeCollectionOfClass:v13 containingClass:objc_opt_class() forKey:@"_tags"];
      tags = v9->_tags;
      v9->_tags = (NSSet *)v14;

      uint64_t v16 = objc_opt_class();
      uint64_t v17 = [v4 decodeCollectionOfClass:v16 containingClass:objc_opt_class() forKey:@"_legacyAssertions"];
      legacyAssertions = v9->_legacyAssertions;
      v9->_legacyAssertions = (NSSet *)v17;

      uint64_t v19 = objc_opt_class();
      uint64_t v20 = [v4 decodeCollectionOfClass:v19 containingClass:objc_opt_class() forKey:@"_primitiveAssertions"];
      primitiveAssertions = v9->_primitiveAssertions;
      v9->_primitiveAssertions = (NSSet *)v20;

      uint64_t v22 = objc_opt_class();
      uint64_t v23 = [v4 decodeCollectionOfClass:v22 containingClass:objc_opt_class() forKey:@"_endowmentInfos"];
      endowmentInfos = v9->_endowmentInfos;
      v9->_endowmentInfos = (NSSet *)v23;
    }

    self = v9;
    id v25 = self;
  }

  else
  {
    rbs_general_log();
    char v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessState initWithRBSXPCCoder:].cold.1(v26);
    }

    id v25 = 0LL;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[RBSProcessState initWithProcess:]( +[RBSProcessState allocWithZone:](&OBJC_CLASS___RBSProcessState, "allocWithZone:", a3),  self->_process);
  [v4 setTaskState:self->_taskState];
  [v4 setDebugState:self->_debugState];
  [v4 setTerminationResistance:self->_terminationResistance];
  id v5 = (void *)-[NSSet copy](self->_endowmentNamespaces, "copy");
  [v4 setEndowmentNamespaces:v5];

  uint64_t v6 = (void *)-[NSSet copy](self->_tags, "copy");
  [v4 setTags:v6];

  uint64_t v7 = (void *)-[NSSet copy](self->_legacyAssertions, "copy");
  [v4 setLegacyAssertions:v7];

  uint64_t v8 = (void *)-[NSSet copy](self->_primitiveAssertions, "copy");
  [v4 setPrimitiveAssertions:v8];

  id v9 = (void *)-[NSSet copy](self->_endowmentInfos, "copy");
  [v4 setEndowmentInfos:v9];

  return v4;
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (unsigned)taskState
{
  return self->_taskState;
}

- (void)setTaskState:(unsigned __int8)a3
{
  self->_taskState = a3;
}

- (unsigned)debugState
{
  return self->_debugState;
}

- (void)setDebugState:(unsigned __int8)a3
{
  self->_debugState = a3;
}

- (NSSet)endowmentNamespaces
{
  return self->_endowmentNamespaces;
}

- (void)setEndowmentNamespaces:(id)a3
{
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (NSSet)legacyAssertions
{
  return self->_legacyAssertions;
}

- (void)setLegacyAssertions:(id)a3
{
}

- (NSSet)primitiveAssertions
{
  return self->_primitiveAssertions;
}

- (void)setPrimitiveAssertions:(id)a3
{
}

- (unsigned)terminationResistance
{
  return self->_terminationResistance;
}

- (void)setTerminationResistance:(unsigned __int8)a3
{
  self->_int terminationResistance = a3;
}

- (OS_xpc_object)codedState
{
  return self->_codedState;
}

- (void)setEndowmentInfos:(id)a3
{
}

- (BOOL)isPreventedFromLaunching
{
  return self->_preventedFromLaunching;
}

- (void).cxx_destruct
{
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_185F67000,  log,  OS_LOG_TYPE_ERROR,  "No process handle could be decoded for RBSProcessState payload: did RBd crash?",  v1,  2u);
}

@end