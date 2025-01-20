@interface _CDSnapshot
+ (Class)classForEntity:(id)a3;
+ (_CDSnapshot)alloc;
+ (_CDSnapshot)allocWithZone:(_NSZone *)a3;
+ (unsigned)newBatchAllocation:(id *)a3 count:(unsigned int)a4 withOwnedObjectIDs:(id *)a5;
+ (void)_entityDeallocated;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)mutableCopy;
- (id)valueForKey:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithObjectID:(void *)a1;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation _CDSnapshot

+ (_CDSnapshot)alloc
{
  return (_CDSnapshot *)_PFAllocateObject((Class)a1, 0LL);
}

- (void)initWithObjectID:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_CLASS____CDSnapshot;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[2] = a2;
  }
  return v3;
}

- (void)dealloc
{
  Class Class = object_getClass(self);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
  uint64_t v5 = IndexedIvars[16];
  if ((_DWORD)v5)
  {
    v6 = (unsigned __int8 *)*((void *)IndexedIvars + 7);
    v7 = IndexedIvars + 19;
    do
    {
      int v8 = *v6++;
      if (v8 == 64) {

      }
      ++v7;
      --v5;
    }

    while (v5);
  }

  _PFDeallocateObject(self);
}

+ (unsigned)newBatchAllocation:(id *)a3 count:(unsigned int)a4 withOwnedObjectIDs:(id *)a5
{
  v6 = a3;
  unsigned int result = _PFAllocateObjects((objc_class *)a1, a3, a4, 0LL);
  if (result)
  {
    uint64_t v8 = result;
    do
    {
      uint64_t v10 = (uint64_t)*v6++;
      uint64_t v9 = v10;
      uint64_t v11 = (uint64_t)*a5++;
      *(void *)(v9 + 16) = v11;
      --v8;
    }

    while (v8);
  }

  return result;
}

+ (void)_invalidateStaticCaches
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_81);
  if (qword_18C4ABAE8)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    for (CFIndex i = 0LL; i < CFArrayGetCount((CFArrayRef)qword_18C4ABAE8); ++i)
      -[__CFArray addObject:](Mutable, "addObject:", CFArrayGetValueAtIndex((CFArrayRef)qword_18C4ABAE8, i));
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_18C4ABAE8);
  }

  else
  {
    CFMutableArrayRef Mutable = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_81);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v4 = -[__CFArray countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t j = 0LL; j != v4; ++j)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(Mutable);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) _entityDeallocated];
      }

      uint64_t v4 = -[__CFArray countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    }

    while (v4);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_81);
  if (Mutable)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v7 = -[__CFArray countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v12,  v20,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t k = 0LL; k != v7; ++k)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(Mutable);
          }
          uint64_t v10 = *(objc_class **)(*((void *)&v12 + 1) + 8 * k);
          IndexedIvars = (void **)object_getIndexedIvars(v10);
          if (IndexedIvars) {
            free(IndexedIvars[7]);
          }
          objc_disposeClassPair(v10);
        }

        uint64_t v7 = -[__CFArray countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v12,  v20,  16LL);
      }

      while (v7);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_81);
}

+ (void)initialize
{
  if (objc_getClass("_CDSnapshot") == a1)
  {
    objc_opt_self();
    object_getIndexedIvars(a1);
    qword_18C4ABAE8 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  }

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____CDSnapshot;
  objc_msgSendSuper2(&v3, sel_initialize);
}

+ (Class)classForEntity:(id)a3
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (v5)
  {
    v6 = v5;
    if (*v5)
    {
      v66 = (objc_class *)a1;
      Name = class_getName((Class)a1);
      v65 = v6;
      snprintf(__str, 0x200uLL, "%s_%s_", Name, v6);
      v67 = a3;
      unint64_t v8 = *(void *)(*((void *)a3 + 14) + 8LL);
      uint64_t v72 = *((void *)a3 + 12) + 24LL;
      id v9 = objc_alloc_init(MEMORY[0x1896077E8]);
      uint64_t v10 = [MEMORY[0x189603FA8] array];
      uint64_t v11 = [MEMORY[0x189603FA8] array];
      uint64_t v12 = [MEMORY[0x189603FA8] array];
      uint64_t v13 = [MEMORY[0x189603FA8] array];
      uint64_t v14 = [MEMORY[0x189603FA8] array];
      __int128 v15 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithObjects:", v10, v11, v12, 0);
      [v15 addObject:v13];
      obuint64_t j = v15;
      [v15 addObject:v14];
      if (v8)
      {
        for (Class i = 0LL; (Class)v8 != i; Class i = (Class)((char *)i + 1))
        {
          __int128 v17 = *(void **)(v72 + 8LL * (void)i);
          Class result = (Class)[v17 _entitysReferenceID];
          if (i != result) {
            goto LABEL_112;
          }
          if ([v17 _propertyType] == 2 || objc_msgSend(v17, "_propertyType") == 6)
          {
            uint64_t v19 = [v17 attributeType];
            if (v19 <= 499)
            {
              v20 = (void *)v11;
              if (v19 == 100) {
                goto LABEL_21;
              }
              v20 = (void *)v12;
              if (v19 == 200) {
                goto LABEL_21;
              }
              v20 = (void *)v13;
              if (v19 == 300) {
                goto LABEL_21;
              }
            }

            else if (v19 > 799)
            {
              v20 = (void *)v10;
              if (v19 == 800) {
                goto LABEL_21;
              }
              v20 = (void *)v13;
              if (v19 == 900) {
                goto LABEL_21;
              }
            }

            else
            {
              v20 = (void *)v13;
              if (v19 == 500) {
                goto LABEL_21;
              }
              v20 = (void *)v12;
              if (v19 == 600) {
                goto LABEL_21;
              }
            }
          }

          else
          {
            [v17 _propertyType];
          }

          v20 = (void *)v14;
LABEL_21:
          [v20 addObject:v17];
        }
      }

      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_81);
      uint64_t extraBytes = 4 * v8 + 80;
      unint64_t v69 = v8;
      if (v8 <= 1) {
        uint64_t v21 = 1LL;
      }
      else {
        uint64_t v21 = v8;
      }
      __uint64_t size = v21;
      if (v8) {
        int v22 = ((v8 - 1) >> 3) + 1;
      }
      else {
        int v22 = 1;
      }
      unsigned int v63 = v22;
      int v62 = v22 - 1;
      uint64_t size = 4LL * (v22 - 1);
      int v70 = 2;
      v24 = v66;
      v23 = v67;
      v25 = v65;
LABEL_29:
      Class Class = objc_getClass(__str);
      v26 = Class;
      if (Class) {
        goto LABEL_30;
      }
      Class ClassPair = objc_allocateClassPair(v24, __str, extraBytes);
      v26 = ClassPair;
      if (!ClassPair)
      {
LABEL_106:
        v60 = class_getName(v24);
        __snprintf_chk(__str, 0x200uLL, 0, 0x200uLL, "%s_%s_%x", v60, v25, v70);
        v26 = 0LL;
        ++v70;
        goto LABEL_107;
      }

      IndexedIvars = (char *)object_getIndexedIvars(ClassPair);
      *((void *)IndexedIvars + 7) = malloc(__size);
      *((_DWORD *)IndexedIvars + 16) = v69;
      if (v63 >= 2)
      {
        __snprintf_chk(__str, 0x200uLL, 0, 0x200uLL, "_cd_nullFlags2_");
        __snprintf_chk(types, 0xAuLL, 0, 0xAuLL, "[%dC]", v62);
        if (!class_addIvar(v26, __str, size, 0, types)) {
          goto LABEL_111;
        }
      }

      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      uint64_t v34 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      if (!v34) {
        goto LABEL_94;
      }
      uint64_t v74 = *(void *)v82;
LABEL_41:
      uint64_t v35 = 0LL;
      uint64_t v75 = v34;
      while (1)
      {
        if (*(void *)v82 != v74) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v81 + 1) + 8 * v35);
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v77 objects:v88 count:16];
        uint64_t v76 = v35;
        if (v37) {
          break;
        }
LABEL_92:
        uint64_t v35 = v76 + 1;
        if (v76 + 1 == v75)
        {
          uint64_t v34 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
          if (!v34)
          {
LABEL_94:
            objc_registerClassPair(v26);
            v24 = v66;
            v23 = v67;
            v25 = v65;
            CFArrayAppendValue((CFMutableArrayRef)qword_18C4ABAE8, v26);
            if (v69)
            {
              v52 = IndexedIvars + 76;
              v53 = (id *)v72;
              unint64_t v54 = v69;
              do
              {
                InstanceVariable = class_getInstanceVariable( v26,  (const char *)objc_msgSend((id)objc_msgSend(*v53, "name"), "UTF8String"));
                *v52++ = ivar_getOffset(InstanceVariable);
                ++v53;
                --v54;
              }

              while (v54);
            }

            v56 = class_getInstanceVariable(v26, "_cd_nullFlags_");
            int Offset = ivar_getOffset(v56);
            *((_DWORD *)IndexedIvars + 17) = class_getInstanceSize(v26) - Offset;
            objc_msgSend((id)objc_msgSend(v67, "versionHash"), "getBytes:length:", IndexedIvars + 24, 32);
LABEL_30:
            v27 = (const UInt8 *)object_getIndexedIvars(v26);
            if (Class)
            {
              v28 = _PFStackAllocatorCreate((unint64_t *)types, 1024LL);
              CFDataRef v29 = CFDataCreate(v28, v27 + 24, 32LL);
              int v30 = objc_msgSend((id)objc_msgSend(v23, "versionHash"), "isEqual:", v29);
              int v31 = v30;
              if (v87)
              {
                if (v29) {
                  CFRelease(v29);
                }
                if (!v31) {
                  goto LABEL_106;
                }
              }

              else
              {
                uint64_t v86 = *(void *)types;
                if (!v30) {
                  goto LABEL_106;
                }
              }

              if (v69 != *((_DWORD *)v27 + 16)
                || *((void *)v27 + 1)
                && !objc_msgSend((id)objc_msgSend(v23, "name"), "isEqual:", *((void *)v27 + 1))
                || *((void *)v27 + 2)
                && (objc_msgSend((id)objc_msgSend(v23, "managedObjectClassName"), "isEqual:", *((void *)v27 + 2)) & 1) == 0)
              {
                goto LABEL_106;
              }
            }

            if (!*((void *)v27 + 1))
            {
              *(_DWORD *)v27 = 0;
              *((_DWORD *)v27 + 1) = v23[20];
              v58 = (void *)objc_msgSend((id)objc_msgSend(v23, "name"), "mutableCopy");
              *((void *)v27 + 1) = [v58 copy];

              v59 = (void *)objc_msgSend((id)objc_msgSend(v23, "managedObjectClassName"), "mutableCopy");
              *((void *)v27 + 2) = [v59 copy];
            }

+ (_CDSnapshot)allocWithZone:(_NSZone *)a3
{
  return (_CDSnapshot *)_PFAllocateObject((Class)a1, 0LL);
}

+ (void)_entityDeallocated
{
  IndexedIvars = (id *)object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    objc_super v3 = IndexedIvars;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_81);

    v3[1] = 0LL;
    v3[2] = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_81);
  }

- (id)mutableCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = -[_CDSnapshot initWithObjectID:](v3, self->_cd_objectID);
  v4[3] = self->_cd_version;
  Class Class = object_getClass(self);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
  memcpy(v4 + 7, &self->_cd_nullFlags_, IndexedIvars[17]);
  uint64_t v7 = IndexedIvars[16];
  if ((_DWORD)v7)
  {
    unint64_t v8 = (unsigned __int8 *)*((void *)IndexedIvars + 7);
    id v9 = IndexedIvars + 19;
    do
    {
      int v10 = *v8++;
      if (v10 == 64)
      {
        uint64_t v11 = *v9;
        uint64_t v12 = *(Class *)((char *)&self->super.isa + v11);
        id v13 = v12;
        *(void *)((char *)v4 + v11) = v12;
      }

      ++v9;
      --v7;
    }

    while (v7);
  }

  return v4;
}

- (unint64_t)hash
{
  unsigned int v2 = (2 * ((unint64_t)self >> 4)) & 0xAAAAAAAA | (((unint64_t)self >> 4) >> 1) & 0x55555555;
  unsigned int v3 = (4 * v2) & 0xCCCCCCCC | (v2 >> 2) & 0x33333333;
  unsigned int v4 = (16 * v3) & 0xF0F0F0F0 | (v3 >> 4) & 0xF0F0F0F;
  return (v4 << 8) & 0xFF0000 | (v4 << 24) | (v4 >> 8) & 0xFF00 | HIBYTE(v4);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (id)description
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  unsigned int v3 = (void *)NSString;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS____CDSnapshot;
  id v4 = -[_CDSnapshot description](&v37, sel_description);
  if (!self)
  {
    uint64_t v5 = (NSString *)[0 name];
    cd_objectID = 0LL;
    int v10 = 0LL;
    return (id)objc_msgSend( v3,  "stringWithFormat:",  @"%@ (entity: %@; id: %@ ; data: %@)",
                 v4,
                 v5,
                 cd_objectID,
                 v10);
  }

  uint64_t v5 = -[NSEntityDescription name](-[NSManagedObjectID entity](self->_cd_objectID, "entity"), "name");
  cd_objectID = self->_cd_objectID;
  uint64_t v7 = -[NSEntityDescription properties](-[NSManagedObjectID entity](cd_objectID, "entity"), "properties");
  uint64_t v8 = -[NSArray count](v7, "count");
  uint64_t v9 = [MEMORY[0x189603FC8] dictionaryWithCapacity:v8];
  int v10 = (void *)v9;
  if (v8)
  {
    int v30 = cd_objectID;
    int v31 = v5;
    id v32 = v4;
    v33 = v3;
    uint64_t v11 = 0LL;
    uint64_t v35 = v7;
    v36 = (void *)v9;
    uint64_t v34 = v8;
    while (1)
    {
      id v12 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", v11);
      uint64_t v13 = [v12 name];
      uint64_t v14 = -[_CDSnapshot valueForKey:](self, "valueForKey:", v13);
      if (v14)
      {
        __int128 v15 = v14;
        switch([v12 _propertyType])
        {
          case 2LL:
          case 6LL:
          case 7LL:
            uint64_t v16 = [v12 attributeType];
            if (v16 <= 799)
            {
              if (v16 <= 399)
              {
                if (v16 == 100) {
                  goto LABEL_66;
                }
                if (v16 == 200) {
                  goto LABEL_66;
                }
                __int128 v17 = @"(...not nil..)";
                if (v16 == 300) {
                  goto LABEL_66;
                }
              }

              else if (v16 > 599)
              {
                if (v16 == 600) {
                  goto LABEL_66;
                }
                __int128 v17 = @"(...not nil..)";
                if (v16 != 700) {
                  goto LABEL_69;
                }
                if ((unint64_t)-[__CFString length](v15, "length") >= 0xC9)
                {
                  uint64_t v19 = -[__CFString substringToIndex:](v15, "substringToIndex:", 200LL);
                  goto LABEL_68;
                }

                __int128 v17 = v15;
              }

              else
              {
                if (v16 == 400) {
                  goto LABEL_66;
                }
                __int128 v17 = @"(...not nil..)";
                if (v16 == 500) {
                  goto LABEL_66;
                }
              }
            }

            else if (v16 > 1199)
            {
              if (v16 > 1999)
              {
                if (v16 == 2100) {
                  goto LABEL_66;
                }
                __int128 v17 = @"(...not nil..)";
                if (v16 == 2000) {
                  goto LABEL_66;
                }
              }

              else
              {
                if (v16 == 1200) {
                  goto LABEL_66;
                }
                __int128 v17 = @"(...not nil..)";
                if (v16 == 1800) {
                  goto LABEL_66;
                }
              }
            }

            else
            {
              if (v16 > 999)
              {
                if (v16 == 1000)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    || !-[__CFString isNSData](v15, "isNSData")
                    || (unint64_t)-[__CFString length](v15, "length") < 0x33)
                  {
                    goto LABEL_66;
                  }

                  v27 = (__CFString *)-[__CFString subdataWithRange:](v15, "subdataWithRange:", 0LL, 50LL);
                }

                else
                {
                  __int128 v17 = @"(...not nil..)";
                  if (v16 != 1100) {
                    goto LABEL_69;
                  }
LABEL_66:
                  v27 = v15;
                }

                uint64_t v19 = -[__CFString description](v27, "description");
                goto LABEL_68;
              }

              if (v16 == 800) {
                goto LABEL_66;
              }
              __int128 v17 = @"(...not nil..)";
              if (v16 == 900) {
                goto LABEL_66;
              }
            }

- (id)valueForKey:(id)a3
{
  uint64_t v5 = -[NSManagedObjectID entity](self->_cd_objectID, "entity");
  v6 = v5;
  if (v5) {
    uint64_t v5 = (NSEntityDescription *)v5->_propertyMapping;
  }
  uint64_t v7 = -[NSEntityDescription indexForKey:](v5, "indexForKey:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  unsigned int v9 = v7;
  Class isa = v6->_properties[v7 + 3].super.super.isa;
  if ((-[objc_class _isRelationship](isa, "_isRelationship") & 1) != 0
    || -[objc_class attributeType](isa, "attributeType") != 900)
  {
LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS____CDSnapshot;
    return -[_CDSnapshot valueForKey:](&v13, sel_valueForKey_, a3);
  }

  uint64_t v11 = (void *)MEMORY[0x189603F50];
  Class Class = object_getClass(self);
  return (id)[v11 dateWithTimeIntervalSinceReferenceDate:*(double *)((char *)&self->super.isa + *((unsigned int *)object_getIndexedIvars(Class) + v9 + 19))];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if ((*(_BYTE *)&self->_cd_flags & 1) != 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"snapshot is marked read only" userInfo:0]);
    snapshot_set_objectID(v13, v14);
  }

  else
  {
    uint64_t v7 = -[NSManagedObjectID entity](self->_cd_objectID, "entity");
    uint64_t v8 = v7;
    if (v7) {
      uint64_t v7 = (NSEntityDescription *)v7->_propertyMapping;
    }
    uint64_t v9 = -[NSEntityDescription indexForKey:](v7, "indexForKey:", a4);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    unsigned int v10 = v9;
    if (!a3)
    {
      snapshot_set_null((char *)self, v9);
      return;
    }

    Class isa = v8->_properties[v9 + 3].super.super.isa;
    if ((-[objc_class _isRelationship](isa, "_isRelationship") & 1) != 0
      || -[objc_class attributeType](isa, "attributeType") != 900)
    {
LABEL_10:
      v15.receiver = self;
      v15.super_class = (Class)&OBJC_CLASS____CDSnapshot;
      -[_CDSnapshot setValue:forKey:](&v15, sel_setValue_forKey_, a3, a4);
      return;
    }

    else {
      [a3 timeIntervalSinceReferenceDate];
    }
    snapshot_set_double((char *)self, v10, v12);
  }

@end