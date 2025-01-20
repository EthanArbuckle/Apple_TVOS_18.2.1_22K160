@interface _NSQueryGenerationToken
+ (BOOL)supportsSecureCoding;
+ (uint64_t)identifierIsForNonGenerationalStore:(uint64_t)a1;
- (BOOL)_moor:(uint64_t)a3 error:;
- (BOOL)isEqual:(id)a3;
- (_NSQueryGenerationToken)autorelease;
- (_NSQueryGenerationToken)initWithCoder:(id)a3;
- (_NSQueryGenerationToken)retain;
- (_WORD)_generationalComponentForStore:(uint64_t)a1;
- (_WORD)_storesForRequestRoutingFrom:(uint64_t *)a3 error:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)persistentStoreCoordinator;
- (uint64_t)_expectedStores;
- (void)_initWithValue:(int)a3 singleton:;
- (void)_makeConcrete:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initForNonGenerationalStore:(void *)result;
- (void)initWithValue:(void *)a3 store:(int)a4 freeValueOnDealloc:;
- (void)release;
@end

@implementation _NSQueryGenerationToken

- (_NSQueryGenerationToken)retain
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS____NSQueryGenerationToken;
    return -[_NSQueryGenerationToken retain](&v2, sel_retain);
  }

  return self;
}

- (_NSQueryGenerationToken)autorelease
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS____NSQueryGenerationToken;
    return -[_NSQueryGenerationToken autorelease](&v2, sel_autorelease);
  }

  return self;
}

- (void)release
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS____NSQueryGenerationToken;
    -[_NSQueryGenerationToken release](&v2, sel_release);
  }

- (void)_initWithValue:(int)a3 singleton:
{
  if (!a1) {
    return 0LL;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS____NSQueryGenerationToken;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    else {
      v6 = a2;
    }
    v5[3] = v6;
    if (a3) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *((_WORD *)v5 + 16) = v5[4] & 0xFFFD | v7;
    *((_WORD *)v5 + 16) &= ~4u;
    *((_WORD *)v5 + 16) &= ~8u;
  }

  return v5;
}

- (void)initWithValue:(void *)a3 store:(int)a4 freeValueOnDealloc:
{
  if (!a1) {
    return 0LL;
  }
  v6 = -[_NSQueryGenerationToken _initWithValue:singleton:](a1, a2, 0);
  if (v6)
  {
    if (a3)
    {
      v6[1] = (id)[a3 identifier];
      v6[2] = -[_PFWeakReference initWithObject:](objc_alloc(&OBJC_CLASS____PFWeakReference), "initWithObject:", a3);
    }

    *((_WORD *)v6 + 16) &= ~1u;
    if (a4) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *((_WORD *)v6 + 16) = v6[4] & 0xFFFB | v7;
  }

  return v6;
}

+ (uint64_t)identifierIsForNonGenerationalStore:(uint64_t)a1
{
  return [@"unsupported" isEqual:a2];
}

- (void)initForNonGenerationalStore:(void *)result
{
  if (result) {
    return -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](result, @"unsupported", a2, 0);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSQueryGenerationToken)initWithCoder:(id)a3
{
  if ([a3 decodeBoolForKey:@"NSQueryTokenIsSingleton"])
  {
    int v5 = [a3 decodeIntForKey:@"NSQueryTokenWhichSingleton"];
    if (v5 == 2)
    {
      v6 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
    }

    else if (v5 == 1)
    {
      v6 = +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken");
    }

    else
    {
      v6 = +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken");
    }

    v8 = (_NSQueryGenerationToken *)v6;
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS____NSQueryGenerationToken;
    __int16 v7 = -[_NSQueryGenerationToken init](&v20, sel_init);
    v8 = v7;
    if (v7)
    {
      *(_WORD *)&v7->_flags &= ~2u;
      __int16 v9 = [a3 decodeBoolForKey:@"NSQueryTokenIsCompound"];
      *(_WORD *)&v8->_flags = *(_WORD *)&v8->_flags & 0xFFFE | v9;
      if ((v9 & 1) != 0)
      {
        v10 = (void *)MEMORY[0x189604010];
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0, v19);
      }

      else
      {
        v8->_storeIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSQueryTokenStoreIdentifier"];
        v13 = (void *)MEMORY[0x189604010];
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        uint64_t v12 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      }

      v16 = (void *)[a3 decodeObjectOfClasses:v12 forKey:@"NSQueryTokenGenerationIdentifier"];
      else {
        v17 = v16;
      }
      v8->_generationIdentifier = v17;
      *(_WORD *)&v8->_flags |= 8u;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    if (+[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken") == self) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = 2
    }
         * (+[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken") == (NSQueryGenerationToken *)self);
    [a3 encodeInt:v7 forKey:@"NSQueryTokenWhichSingleton"];
  }

  else
  {
    [a3 encodeBool:flags & 1 forKey:@"NSQueryTokenIsCompound"];
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      [a3 encodeObject:self->_storeIdentifier forKey:@"NSQueryTokenStoreIdentifier"];
    }
    uint64_t generationIdentifier = (uint64_t)self->_generationIdentifier;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t generationIdentifier = -[_PFSQLiteSnapshotWrapper data](generationIdentifier);
    }
    [a3 encodeObject:generationIdentifier forKey:@"NSQueryTokenGenerationIdentifier"];
  }

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((*(_WORD *)&self->_flags & 0xF) == 4)
  {
    store = self->_store;
    if (store) {
      id WeakRetained = objc_loadWeakRetained(&store->_object);
    }
    else {
      id WeakRetained = 0LL;
    }
    [WeakRetained freeQueryGenerationWithIdentifier:self->_generationIdentifier];
  }

  self->_storeIdentifier = 0LL;
  self->_uint64_t generationIdentifier = 0LL;

  self->_store = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSQueryGenerationToken;
  -[_NSQueryGenerationToken dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    return self;
  }
  id v3 = objc_alloc_init((Class)objc_opt_class());
  __int16 v4 = *((_WORD *)v3 + 16);
  *((_WORD *)v3 + 16) = v4 & 0xFFFD;
  *((_WORD *)v3 + 16) = v4 & 0xFFFC | *(_WORD *)&self->_flags & 1;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    id generationIdentifier = self->_generationIdentifier;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v9 = [generationIdentifier countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(generationIdentifier);
          }
          v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * v12) copy];
          [v7 addObject:v13];

          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [generationIdentifier countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }

    *((void *)v3 + 3) = v7;
    __int16 v5 = *((_WORD *)v3 + 16);
  }

  else
  {

    *((void *)v3 + 1) = self->_storeIdentifier;
    *((void *)v3 + 3) = self->_generationIdentifier;
    __int16 v5 = *((_WORD *)v3 + 16) & 0xFFFB;
  }

  *((_WORD *)v3 + 16) = v5 | 8;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      if ((*(_WORD *)&self->_flags & 1) == (*((_WORD *)a3 + 16) & 1))
      {
        if ((*(_WORD *)&self->_flags & 1) != 0
          || (int v5 = -[NSString isEqual:](self->_storeIdentifier, "isEqual:", *((void *)a3 + 1))) != 0)
        {
          LOBYTE(v5) = [self->_generationIdentifier isEqual:*((void *)a3 + 3)];
        }
      }

      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }

  return v5;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ((*(_WORD *)&self->_flags & 1) == 0) {
    return (id)[NSString stringWithFormat:@"<NSQueryGenerationToken : %@/%@>", self->_storeIdentifier, self->_generationIdentifier];
  }
  __int16 v4 = (void *)[MEMORY[0x189607940] stringWithString:@"<NSQueryGenerationToken : {"];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id generationIdentifier = self->_generationIdentifier;
  uint64_t v6 = [generationIdentifier countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(generationIdentifier);
        }
        if ((v9 & 1) != 0) {
          uint64_t v11 = @"%p";
        }
        else {
          uint64_t v11 = @", %p";
        }
        objc_msgSend(v4, "appendFormat:", v11, *(void *)(*((void *)&v12 + 1) + 8 * i));
        char v9 = 0;
      }

      uint64_t v7 = [generationIdentifier countByEnumeratingWithState:&v12 objects:v16 count:16];
      char v9 = 0;
    }

    while (v7);
  }

  [v4 appendString:@"}>"];
  return v4;
}

- (_WORD)_generationalComponentForStore:(uint64_t)a1
{
  objc_super v2 = (_WORD *)a1;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int16 v4 = *(_WORD *)(a1 + 32);
    if ((v4 & 1) != 0)
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      uint64_t v7 = *(void **)(a1 + 24);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            __int128 v12 = (_WORD *)-[_NSQueryGenerationToken _generationalComponentForStore:]( *(void *)(*((void *)&v14 + 1) + 8 * i),  a2);
            if (v12)
            {
              objc_super v2 = v12;
              if ((v12[16] & 2) == 0) {
                return v12;
              }
              return v2;
            }
          }

          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          objc_super v2 = 0LL;
          if (v9) {
            continue;
          }
          break;
        }
      }

      else
      {
        return 0LL;
      }
    }

    else if ((v4 & 2) == 0)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      if (v5) {
        id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
      }
      else {
        id WeakRetained = 0LL;
      }
      if (WeakRetained != a2) {
        objc_super v2 = 0LL;
      }
    }
  }

  return v2;
}

- (uint64_t)_expectedStores
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int16 v2 = *(_WORD *)(a1 + 32);
  if ((v2 & 2) != 0) {
    return [MEMORY[0x189603FA8] array];
  }
  if ((v2 & 1) == 0) {
    return [MEMORY[0x189603FA8] arrayWithObject:*(void *)(a1 + 8)];
  }
  __int16 v4 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = *(void **)(a1 + 24);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObjectsFromArray:-[_NSQueryGenerationToken _expectedStores](*(void *)(*((void *)&v10 + 1) + 8 * i))];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  return (uint64_t)v4;
}

- (void)_makeConcrete:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int16 v3 = *(_WORD *)(a1 + 32);
    if ((v3 & 2) == 0)
    {
      if ((v3 & 1) == 0)
      {
        if (!(_DWORD)a2)
        {

          *(void *)(a1 + 16) = 0LL;
          return;
        }

        goto LABEL_15;
      }

      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      uint64_t v5 = *(void **)(a1 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[_NSQueryGenerationToken _makeConcrete:](*(void *)(*((void *)&v10 + 1) + 8 * i), a2);
          }

          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v7);
      }

      if ((_DWORD)a2)
      {
        __int16 v3 = *(_WORD *)(a1 + 32);
LABEL_15:
        *(_WORD *)(a1 + 32) = v3 & 0xFFF7;
      }
    }
  }

- (BOOL)_moor:(uint64_t)a3 error:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int16 v4 = *(_WORD *)(a1 + 32);
  if ((v4 & 2) == 0)
  {
    if ((v4 & 1) != 0)
    {
      __int128 v28 = 0uLL;
      __int128 v29 = 0uLL;
      __int128 v26 = 0uLL;
      __int128 v27 = 0uLL;
      __int128 v13 = *(void **)(a1 + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = 0LL;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v13);
            }
            v16 += -[_NSQueryGenerationToken _moor:error:]( *(void *)(*((void *)&v26 + 1) + 8 * i),  a2,  a3);
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }

        while (v15);
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      BOOL v12 = [*(id *)(a1 + 24) count] == v16;
      goto LABEL_30;
    }

    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (!v7)
    {
LABEL_27:
      BOOL v12 = 0LL;
      goto LABEL_30;
    }

    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_6:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(a2);
      }
      __int128 v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      if (v8 == ++v10)
      {
        uint64_t v8 = [a2 countByEnumeratingWithState:&v22 objects:v30 count:16];
        BOOL v12 = 0LL;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_30;
      }
    }

    uint64_t v19 = [v11 reopenQueryGenerationWithIdentifier:*(void *)(a1 + 24) error:a3];
    if (!v19) {
      goto LABEL_27;
    }
    uint64_t v20 = v19;
    *(void *)(a1 + 16) = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  v11);
    if (([*(id *)(v20 + 24) isEqual:*(void *)(a1 + 24)] & 1) == 0)
    {

      *(void *)(a1 + 24) = *(id *)(v20 + 24);
    }

    if ((*(_WORD *)(v20 + 32) & 4) != 0)
    {
      *(_WORD *)(a1 + 32) |= 4u;
      *(_WORD *)(v20 + 32) &= ~4u;
    }
  }

  BOOL v12 = 1LL;
LABEL_30:
  -[_NSQueryGenerationToken _makeConcrete:](a1, v12);
  return v12;
}

- (_WORD)_storesForRequestRoutingFrom:(uint64_t *)a3 error:
{
  v24[2] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    if ((result[16] & 8) == 0) {
      goto LABEL_9;
    }
    uint64_t v21 = 0LL;
    BOOL v6 = -[_NSQueryGenerationToken _moor:error:]((uint64_t)result, a2, (uint64_t)&v21);
    BOOL v7 = v6;
    if (a3 && !v6)
    {
      uint64_t v8 = v21;
      if (!v21)
      {
        uint64_t v9 = (void *)MEMORY[0x189607870];
        uint64_t v10 = *MEMORY[0x189607460];
        v23[0] = @"reason";
        v23[1] = @"expected stores";
        v24[0] = @"Can't reattach all stores specified by token";
        v24[1] = -[_NSQueryGenerationToken _expectedStores](v4);
        uint64_t v8 = objc_msgSend( v9,  "errorWithDomain:code:userInfo:",  v10,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
      }

      *a3 = v8;
    }

    if (!v7)
    {
      return 0LL;
    }

    else
    {
LABEL_9:
      __int128 v11 = (void *)[a2 mutableCopy];
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      uint64_t v12 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(a2);
            }
            uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (!-[_NSQueryGenerationToken _generationalComponentForStore:](v4, v16)) {
              [v11 removeObject:v16];
            }
          }

          uint64_t v13 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }

        while (v13);
      }

      return v11;
    }
  }

  return result;
}

- (id)persistentStoreCoordinator
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0xA) != 0) {
    return 0LL;
  }
  if ((flags & 1) != 0)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id generationIdentifier = self->_generationIdentifier;
    id result = (id)[generationIdentifier countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      id v8 = result;
      uint64_t v9 = *(void *)v12;
LABEL_10:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(generationIdentifier);
        }
        id result = (id)[*(id *)(*((void *)&v11 + 1) + 8 * v10) persistentStoreCoordinator];
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = (id)[generationIdentifier countByEnumeratingWithState:&v11 objects:v15 count:16];
          id result = 0LL;
          if (v8) {
            goto LABEL_10;
          }
          return result;
        }
      }
    }
  }

  else
  {
    store = self->_store;
    if (store) {
      id WeakRetained = objc_loadWeakRetained(&store->_object);
    }
    else {
      id WeakRetained = 0LL;
    }
    BOOL v6 = (void *)[WeakRetained _persistentStoreCoordinator];

    return v6;
  }

  return result;
}

@end