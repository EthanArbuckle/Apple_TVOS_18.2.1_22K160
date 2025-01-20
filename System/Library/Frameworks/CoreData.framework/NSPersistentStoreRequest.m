@interface NSPersistentStoreRequest
+ (void)initialize;
- (BOOL)_secureOperation;
- (NSArray)affectedStores;
- (NSPersistentStoreRequestType)requestType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAffectedStores:(NSArray *)affectedStores;
@end

@implementation NSPersistentStoreRequest

- (NSArray)affectedStores
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  result = self->_affectedStores;
  if (byte_18C4ABDBC)
  {
    result = -[NSArray count](result, "count");
    if (result)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      affectedStores = self->_affectedStores;
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( affectedStores,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(affectedStores);
            }
            uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            if (v10)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
              if (WeakRetained)
              {
                v12 = WeakRetained;
                [v4 addObject:WeakRetained];
              }
            }
          }

          uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( affectedStores,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        }

        while (v7);
      }

      v13 = (NSArray *)(id)[v4 copy];

      if (-[NSArray count](v13, "count")) {
        return v13;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

- (void)dealloc
{
  self->_affectedStores = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentStoreRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4) {
    v4[1] = -[NSArray copy](self->_affectedStores, "copy");
  }
  return v4;
}

- (void)setAffectedStores:(NSArray *)affectedStores
{
  v22[1] = *MEMORY[0x1895F89C0];
  v5 = self->_affectedStores;
  if (byte_18C4ABDBC)
  {
    if (v5 == affectedStores) {
      return;
    }

    if (-[NSArray count](affectedStores, "count"))
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:affectedStores];
      unint64_t v7 = [v6 count];
      unint64_t v8 = v7;
      if (v7 <= 1) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = v7;
      }
      if (v7 >= 0x201) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = v9;
      }
      v11 = (char *)v22 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      if (v7 >= 0x201)
      {
        v11 = (char *)NSAllocateScannedUncollectable();
        [v6 getObjects:v11];
      }

      else
      {
        bzero((char *)v22 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v9);
        [v6 getObjects:v11];
        if (!v8)
        {
          self->_affectedStores = 0LL;

          return;
        }
      }

      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      do
      {
        id v20 = +[_PFWeakReference weakReferenceWithObject:]( (uint64_t)&OBJC_CLASS____PFWeakReference,  *(void *)&v11[8 * v19]);
        if (v20) {
          *(void *)&v11[8 * v18++] = v20;
        }
        ++v19;
      }

      while (v8 != v19);
      if (v18) {
        v21 = (NSArray *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v11 count:v18];
      }
      else {
        v21 = 0LL;
      }
      self->_affectedStores = v21;

      if (v8 >= 0x201) {
        NSZoneFree(0LL, v11);
      }
    }

    else
    {
      self->_affectedStores = 0LL;
    }
  }

  else if (v5 != affectedStores)
  {

    if (-[NSArray count](affectedStores, "count") < 2)
    {
      self->_affectedStores = (NSArray *)-[NSArray copy](affectedStores, "copy");
    }

    else
    {
      v12 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:affectedStores];
      unint64_t v13 = [v12 count];
      unint64_t v14 = v13;
      if (v13 <= 1) {
        uint64_t v15 = 1LL;
      }
      else {
        uint64_t v15 = v13;
      }
      if (v13 >= 0x201) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v15;
      }
      __int128 v17 = (char *)v22 - ((8 * v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      if (v13 > 0x200) {
        __int128 v17 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v22 - ((8 * v16 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v15);
      }
      [v12 getObjects:v17];
      self->_affectedStores = (NSArray *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v17 count:v14];

      if (v14 >= 0x201) {
        NSZoneFree(0LL, v17);
      }
    }
  }

+ (void)initialize
{
}

- (NSPersistentStoreRequestType)requestType
{
  return 0LL;
}

- (BOOL)_secureOperation
{
  return 0;
}

@end