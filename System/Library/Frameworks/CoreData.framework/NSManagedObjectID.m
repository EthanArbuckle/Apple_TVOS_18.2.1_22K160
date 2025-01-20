@interface NSManagedObjectID
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)_generateTemporaryIDForEntity:(id)a3;
+ (id)_newArchiveForScalarObjectIDs:(uint64_t)a1;
+ (int64_t)version;
+ (uint64_t)unarchivedScalarObjectIDsFromData:(void *)a3 withCoordinator:;
+ (void)initialize;
- (BOOL)_isDeallocating;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)_preferReferenceData64;
- (BOOL)_tryRetain;
- (BOOL)isTemporaryID;
- (NSEntityDescription)entity;
- (NSManagedObjectID)initWithObject:(id)a3;
- (NSManagedObjectID)initWithPK64:(int64_t)a3;
- (NSPersistentStore)persistentStore;
- (NSString)description;
- (NSURL)URIRepresentation;
- (id)_referenceData;
- (id)_retainedURIString;
- (id)_storeIdentifier;
- (id)entityName;
- (int)_temporaryIDCounter;
- (int64_t)_referenceData64;
- (int64_t)compare:(id)a3;
- (uint64_t)_compareArbitraryValue:(void *)a3 toValue:;
@end

@implementation NSManagedObjectID

+ (void)initialize
{
}

+ (int64_t)version
{
  return 134481920LL;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSEntityDescription)entity
{
  return 0LL;
}

- (NSPersistentStore)persistentStore
{
  return 0LL;
}

- (BOOL)isTemporaryID
{
  return 0;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x186E3E5D8](self, a2);
  v4 = (void *)[objc_alloc(NSString) initWithFormat:@"%p <%@>", self, -[NSManagedObjectID URIRepresentation](self, "URIRepresentation")];
  objc_autoreleasePoolPop(v3);
  return (NSString *)v4;
}

- (NSURL)URIRepresentation
{
  return 0LL;
}

- (int)_temporaryIDCounter
{
  return 0;
}

- (uint64_t)_compareArbitraryValue:(void *)a3 toValue:
{
  v23[2] = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (([a2 isNSNumber] & 1) != 0
      || ([a2 isNSString] & 1) != 0
      || [a2 isNSDate])
    {
      return [a2 compare:a3];
    }

    if ([a2 isNSData])
    {
      size_t v5 = [a2 length];
      unint64_t v6 = [a3 length];
      if (v5 >= v6) {
        size_t v5 = v6;
      }
      unint64_t v7 = 8 * v5 + 8;
      if (v7 <= 1) {
        uint64_t v8 = 1LL;
      }
      else {
        uint64_t v8 = 8 * v5 + 8;
      }
      if (v7 >= 0x201) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = v8;
      }
      v10 = (char *)&v22[-1] - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      size_t v11 = 8 * v8;
      if (v7 > 0x200)
      {
        v10 = (char *)NSAllocateScannedUncollectable();
        v12 = (char *)NSAllocateScannedUncollectable();
      }

      else
      {
        bzero((char *)&v22[-1] - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v8);
        v12 = (char *)&v22[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v12, v11);
      }

      [a2 getBytes:v10 length:v5];
      [a3 getBytes:v12 length:v5];
      int v16 = memcmp(v10, v12, v5);
      if (v7 >= 0x201)
      {
        NSZoneFree(0LL, v10);
        NSZoneFree(0LL, v12);
      }

      uint64_t v17 = 1LL;
      if (v16 >= 0) {
        uint64_t v17 = -1LL;
      }
      if (v16) {
        return v17;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return [a2 compare:a3];
      }
      [a2 getUUIDBytes:v23];
      [a3 getUUIDBytes:v22];
      unint64_t v13 = bswap64(v23[0]);
      unint64_t v14 = bswap64(v22[0]);
      if (v13 == v14 && (unint64_t v13 = bswap64(v23[1]), v14 = bswap64(v22[1]), v13 == v14))
      {
        int v15 = 0;
      }

      else if (v13 < v14)
      {
        int v15 = -1;
      }

      else
      {
        int v15 = 1;
      }

      BOOL v18 = v15 == 0;
      BOOL v19 = v15 < 0;
      uint64_t v20 = 1LL;
      if (!v19) {
        uint64_t v20 = -1LL;
      }
      if (v18) {
        return 0LL;
      }
      else {
        return v20;
      }
    }
  }

  return result;
}

- (int64_t)compare:(id)a3
{
  int v5 = -[NSManagedObjectID isTemporaryID](self, "isTemporaryID");
  int v6 = [a3 isTemporaryID];
  if (v5 != v6)
  {
    if (v5) {
      return -1LL;
    }
    else {
      return 1LL;
    }
  }

  if ((v5 & v6) == 1)
  {
    id v8 = -[NSManagedObjectID _referenceData](self, "_referenceData");
    uint64_t v9 = [a3 _referenceData];
    if (v8 != (id)v9)
    {
      int64_t result = [v8 compare:v9];
      if (result) {
        return result;
      }
    }

    int v10 = -[NSManagedObjectID _temporaryIDCounter](self, "_temporaryIDCounter");
    BOOL v11 = v10 <= (int)[a3 _temporaryIDCounter];
    goto LABEL_34;
  }

  id v12 = -[NSManagedObjectID _storeIdentifier](self, "_storeIdentifier");
  uint64_t v13 = [a3 _storeIdentifier];
  if (v12 != (id)v13)
  {
    int64_t result = [v12 compare:v13];
    if (result) {
      return result;
    }
  }

  unint64_t v14 = -[NSManagedObjectID entity](self, "entity");
  if (v14)
  {
    if ((*(_BYTE *)&v14->_entityDescriptionFlags & 4) != 0)
    {
      rootentity = v14->_rootentity;
    }

    else
    {
      do
      {
        rootentity = v14;
        unint64_t v14 = -[NSEntityDescription superentity](v14, "superentity");
      }

      while (v14);
    }
  }

  else
  {
    rootentity = 0LL;
  }

  uint64_t v16 = [a3 entity];
  if (v16)
  {
    if ((*(_BYTE *)(v16 + 120) & 4) != 0)
    {
      BOOL v18 = *(NSEntityDescription **)(v16 + 72);
    }

    else
    {
      do
      {
        BOOL v18 = (NSEntityDescription *)v16;
        uint64_t v16 = [(id)v16 superentity];
      }

      while (v16);
    }

    if (!rootentity) {
      goto LABEL_23;
    }
  }

  else
  {
    BOOL v18 = 0LL;
    if (!rootentity) {
      goto LABEL_23;
    }
  }

  if (rootentity == v18)
  {
LABEL_31:
    BOOL v22 = -[NSManagedObjectID _preferReferenceData64](self, "_preferReferenceData64", v17);
    int v23 = [a3 _preferReferenceData64];
    if (!v22 || !v23) {
      return -[NSManagedObjectID _compareArbitraryValue:toValue:]( (uint64_t)self,  -[NSManagedObjectID _referenceData](self, "_referenceData"),  (void *)[a3 _referenceData]);
    }
    uint64_t v24 = -[NSManagedObjectID _referenceData64](self, "_referenceData64");
    BOOL v11 = v24 <= [a3 _referenceData64];
LABEL_34:
    uint64_t v25 = !v11;
    uint64_t v26 = v11;
    return v25 - v26;
  }

- (BOOL)_preferReferenceData64
{
  return 0;
}

- (NSManagedObjectID)initWithObject:(id)a3
{
  return 0LL;
}

- (NSManagedObjectID)initWithPK64:(int64_t)a3
{
  return 0LL;
}

- (id)_referenceData
{
  return 0LL;
}

- (int64_t)_referenceData64
{
  return 0LL;
}

- (id)_storeIdentifier
{
  return -[NSPersistentStore identifier](-[NSManagedObjectID persistentStore](self, "persistentStore"), "identifier");
}

- (id)entityName
{
  return -[NSEntityDescription name](-[NSManagedObjectID entity](self, "entity"), "name");
}

- (BOOL)_isPersistentStoreAlive
{
  return -[NSPersistentStore _isPersistentStoreAlive]( -[NSManagedObjectID persistentStore](self, "persistentStore"),  "_isPersistentStoreAlive");
}

- (id)_retainedURIString
{
  return 0LL;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

+ (id)_newArchiveForScalarObjectIDs:(uint64_t)a1
{
  v115[256] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (![a2 count]) {
    return objc_alloc_init(MEMORY[0x189603F48]);
  }
  id v81 = objc_alloc_init(MEMORY[0x189603FB8]);
  v3 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v88 = objc_opt_class();
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v107;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v107 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v106 + 1) + 8 * i), "entity"), "managedObjectModel");
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          goto LABEL_12;
        }
      }

      uint64_t v5 = [a2 countByEnumeratingWithState:&v106 objects:v114 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0LL;
LABEL_12:
  unint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "entitiesByName"), "count");
  unint64_t v11 = v10;
  if (v10 <= 1) {
    uint64_t v12 = 1LL;
  }
  else {
    uint64_t v12 = v10;
  }
  if (v10 >= 0x201) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = v12;
  }
  size_t v14 = 8 * v12;
  if (v10 > 0x200)
  {
    v86 = (char *)NSAllocateScannedUncollectable();
    v89 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    v86 = (char *)v77 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v86, 8 * v12);
    v89 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v89, v14);
  }

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  uint64_t v16 = [v9 countByEnumeratingWithState:&v102 objects:v113 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v103;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v103 != v18) {
          objc_enumerationMutation(v9);
        }
        uint64_t v20 = *(void **)(*((void *)&v102 + 1) + 8 * v19);
        uint64_t v21 = [v20 name];
        if (v20) {
          uint64_t v22 = v20[20];
        }
        else {
          uint64_t v22 = 0LL;
        }
        *(void *)&v89[8 * v22] = v21;
        ++v19;
      }

      while (v17 != v19);
      uint64_t v23 = [v9 countByEnumeratingWithState:&v102 objects:v113 count:16];
      uint64_t v17 = v23;
    }

    while (v23);
  }

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  uint64_t v24 = [a2 countByEnumeratingWithState:&v98 objects:v112 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v99;
    while (2)
    {
      for (uint64_t j = 0LL; j != v25; ++j)
      {
        if (*(void *)v99 != v26) {
          objc_enumerationMutation(a2);
        }
        v28 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v98 + 1) + 8 * j), "persistentStore"),  "_persistentStoreCoordinator");
        if (v28)
        {
          id v83 = v28;
          id v85 = (id)[v28 persistentStores];
          unint64_t v30 = [v85 count];
          if (v30 <= 1) {
            uint64_t v31 = 1LL;
          }
          else {
            uint64_t v31 = v30;
          }
          if (v30 >= 0x201) {
            uint64_t v32 = 1LL;
          }
          else {
            uint64_t v32 = v31;
          }
          v33 = (char *)v77 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v79 = v30;
          unint64_t v80 = v11;
          v78 = v3;
          id v84 = v9;
          if (v30 > 0x200)
          {
            v82 = (void *)NSAllocateScannedUncollectable();
          }

          else
          {
            v82 = v33;
            bzero(v33, 8 * v31);
          }

          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          uint64_t v34 = [a2 countByEnumeratingWithState:&v94 objects:v111 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            v77[1] = v77;
            uint64_t v87 = 0LL;
            int v36 = 0;
            uint64_t v37 = *(void *)v95;
            v38 = a2;
            do
            {
              uint64_t v39 = 0LL;
              do
              {
                if (*(void *)v95 != v37) {
                  objc_enumerationMutation(a2);
                }
                v40 = *(void **)(*((void *)&v94 + 1) + 8 * v39);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  uint64_t v41 = [v40 entity];
                  if (v41
                    || (uint64_t v41 = objc_msgSend( (id)objc_msgSend(v84, "entitiesByName"),  "objectForKey:",  objc_msgSend(v40, "entityName"))) != 0)
                  {
                    uint64_t v42 = *(void *)(v41 + 160);
                  }

                  else
                  {
                    uint64_t v42 = 0LL;
                  }

                  uint64_t v43 = [v40 persistentStore];
                  if (!v43)
                  {
                    uint64_t v44 = [v40 _storeIdentifier];
                    uint64_t v43 = [v83 persistentStoreForIdentifier:v44];
                  }

                  if (v41)
                  {
                    if (v43)
                    {
                      ++v36;
                      *(void *)&v86[8 * v42] = 1LL;
                      if (v43 != v87)
                      {
                        uint64_t v45 = [v85 indexOfObjectIdenticalTo:v43];
                        v82[v45] = 1LL;
                        uint64_t v87 = v43;
                      }
                    }
                  }

                  a2 = v38;
                }

                ++v39;
              }

              while (v35 != v39);
              uint64_t v46 = [a2 countByEnumeratingWithState:&v94 objects:v111 count:16];
              uint64_t v35 = v46;
            }

            while (v46);
            if (v36 >= 1)
            {
              unsigned int v47 = v36;
              uint64_t v48 = v79;
              if (v79 < 1)
              {
                unsigned __int16 v49 = 0;
                uint64_t v52 = v80;
              }

              else
              {
                unsigned __int16 v49 = 0;
                v50 = v82;
                uint64_t v51 = v79;
                uint64_t v52 = v80;
                do
                {
                  if (*v50) {
                    void *v50 = (__int16)v49++ + 1LL;
                  }
                  ++v50;
                  --v51;
                }

                while (v51);
              }

              if (v52 < 1)
              {
                unsigned __int16 v53 = 0;
              }

              else
              {
                unsigned __int16 v53 = 0;
                v54 = v86;
                uint64_t v55 = v52;
                do
                {
                  if (*v54) {
                    void *v54 = (__int16)v53++ + 1LL;
                  }
                  ++v54;
                  --v55;
                }

                while (v55);
              }

              v56 = v81;
              _writeInt32IntoData(v81, v47);
              _writeInt16IntoData(v56, v49);
              _writeInt16IntoData(v56, v53);
              v57 = v82;
              if (v48 >= 1)
              {
                for (uint64_t k = 0LL; k != v48; ++k)
                {
                  if (v57[k])
                  {
                    v59 = (void *)objc_msgSend((id)objc_msgSend(v85, "objectAtIndex:", k), "identifier");
                    _writeStringIntoData(v59, v81, v115);
                  }
                }
              }

              if (v52 >= 1)
              {
                v60 = v86;
                v61 = (void **)v89;
                uint64_t v62 = v52;
                do
                {
                  if (*v60) {
                    _writeStringIntoData(*v61, v81, v115);
                  }
                  ++v61;
                  ++v60;
                  --v62;
                }

                while (v62);
              }

              __int128 v92 = 0u;
              __int128 v93 = 0u;
              __int128 v90 = 0u;
              __int128 v91 = 0u;
              uint64_t v63 = [a2 countByEnumeratingWithState:&v90 objects:v110 count:16];
              if (v63)
              {
                uint64_t v64 = v63;
                uint64_t v65 = *(void *)v91;
                do
                {
                  for (uint64_t m = 0LL; m != v64; ++m)
                  {
                    if (*(void *)v91 != v65) {
                      objc_enumerationMutation(a2);
                    }
                    v67 = *(void **)(*((void *)&v90 + 1) + 8 * m);
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      uint64_t v68 = [v67 entity];
                      if (!v68) {
                        uint64_t v68 = objc_msgSend( (id)objc_msgSend(v84, "entitiesByName"),  "objectForKey:",  objc_msgSend(v67, "entityName"));
                      }
                      uint64_t v69 = [v67 persistentStore];
                      if (!v69)
                      {
                        uint64_t v70 = [v67 _storeIdentifier];
                        uint64_t v69 = [v83 persistentStoreForIdentifier:v70];
                      }

                      if (v68) {
                        BOOL v71 = v69 == 0;
                      }
                      else {
                        BOOL v71 = 1;
                      }
                      if (!v71)
                      {
                        uint64_t v72 = *(void *)&v86[8 * *(void *)(v68 + 160)];
                        unint64_t v73 = [v67 _referenceData64];
                        uint64_t v74 = [v85 indexOfObjectIdenticalTo:v69];
                        v75 = v81;
                        _writeInt16IntoData(v81, (unsigned __int16)v82[v74]);
                        _writeInt16IntoData(v75, (unsigned __int16)v72);
                        _writeInt64IntoData(v75, v73);
                      }
                    }
                  }

                  uint64_t v64 = [a2 countByEnumeratingWithState:&v90 objects:v110 count:16];
                }

                while (v64);
              }
            }
          }

          BOOL v29 = v80 >= 0x201;
          v3 = v78;
          goto LABEL_116;
        }
      }

      uint64_t v25 = [a2 countByEnumeratingWithState:&v98 objects:v112 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  BOOL v29 = v11 >= 0x201;
LABEL_116:
  v76 = v86;
  if (v29)
  {
    NSZoneFree(0LL, v89);
    NSZoneFree(0LL, v76);
  }

  objc_autoreleasePoolPop(v3);
  return v81;
}

+ (uint64_t)unarchivedScalarObjectIDsFromData:(void *)a3 withCoordinator:
{
  v58[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = [a2 length];
  if (!v5) {
    return [MEMORY[0x189603F18] array];
  }
  unint64_t v6 = v5;
  v58[0] = 0LL;
  uint64_t v54 = [MEMORY[0x189603FA8] array];
  uint64_t v56 = MEMORY[0x186E3E5D8]();
  unint64_t v7 = (unsigned int *)[a2 bytes];
  uint64_t v8 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "managedObjectModel"), "entitiesByName");
  unint64_t v10 = [v9 count];
  MEMORY[0x1895F8858](v10);
  if (v10 > 0x200)
  {
    uint64_t v55 = (_BYTE *)NSAllocateScannedUncollectable();
  }

  else
  {
    uint64_t v55 = &v49[-v12];
    bzero(&v49[-v12], 8 * v11);
  }

  if (v6 >= 4)
  {
    int v57 = bswap32(*v7);
    uint64_t v14 = 4LL;
    v58[0] = 4LL;
  }

  else
  {
    uint64_t v14 = 0LL;
    int v57 = 0;
  }

  if ((v14 | 2uLL) <= v6)
  {
    unsigned int v15 = bswap32(*(unsigned __int16 *)((char *)v7 + v14)) >> 16;
    v58[0] = v14 | 2;
    unint64_t v16 = v14 + 4;
    v14 |= 2uLL;
  }

  else
  {
    LOWORD(v15) = 0;
    unint64_t v16 = v14 | 2;
  }

  unsigned __int16 v53 = v49;
  if (v16 <= v6)
  {
    LODWORD(v17) = bswap32(*(unsigned __int16 *)((char *)v7 + v14)) >> 16;
    v58[0] = v16;
  }

  else
  {
    LODWORD(v17) = 0;
  }

  LODWORD(v52) = (__int16)v15;
  if ((__int16)v15 >= 1)
  {
    LOWORD(v18) = 0;
    do
    {
      id StringFromBytes = _newReadStringFromBytes((uint64_t)v7, v58, v6);
      if ([StringFromBytes length]) {
        [v8 addObject:StringFromBytes];
      }

      int v18 = (__int16)(v18 + 1);
    }

    while (v18 < (__int16)v15);
  }

  unint64_t v51 = v10;
  int v50 = v17;
  unsigned __int16 v20 = 0;
  if ((__int16)v17 >= 1)
  {
    uint64_t v17 = v17;
    uint64_t v21 = v55;
    do
    {
      id v22 = _newReadStringFromBytes((uint64_t)v7, v58, v6);
      if ([v22 length])
      {
        uint64_t v23 = (void *)[v9 objectForKey:v22];
        if (v23
          || (!a3 ? (uint64_t v24 = 0LL) : (uint64_t v24 = (void *)a3[12]),
              (uint64_t v23 = -[_PFModelMap ancillaryEntityWithName:](v24, (uint64_t)v22)) != 0LL))
        {
          *uint64_t v21 = v23;
          ++v20;
        }
      }

      ++v21;
      --v17;
    }

    while (v17);
  }

  __int16 v25 = [v8 count];
  uint64_t v26 = 0LL;
  if ((_DWORD)v52 == v25)
  {
    __int16 v27 = v50;
    v28 = (void *)v56;
    if (v50 == v20)
    {
      unint64_t v29 = v51;
      if (v54)
      {
        unint64_t v30 = [v8 count];
        unint64_t v31 = MEMORY[0x1895F8858](v30);
        uint64_t v34 = &v49[-v33];
        uint64_t v52 = v35;
        if (v31 > 0x200) {
          uint64_t v34 = (_BYTE *)NSAllocateScannedUncollectable();
        }
        else {
          bzero(&v49[-v33], 8 * v32);
        }
        if ([v8 count])
        {
          unint64_t v36 = 0LL;
          do
          {
            *(void *)&v34[8 * v36] = objc_msgSend( a3,  "persistentStoreForIdentifier:",  objc_msgSend(v8, "objectAtIndex:", v36));
            ++v36;
          }

          while (v36 < [v8 count]);
        }

        if (v57 < 1)
        {
          uint64_t v26 = (void *)v54;
        }

        else
        {
          v38 = (void *)v54;
          uint64_t v37 = v55;
          while (v58[0] < v6)
          {
            unint64_t v39 = (v58[0] + 1LL) & 0xFFFFFFFFFFFFFFFELL;
            unint64_t v40 = v39 + 2;
            if (v39 + 2 <= v6)
            {
              unsigned int v41 = bswap32(*(unsigned __int16 *)((char *)v7 + v39)) >> 16;
              v58[0] = v39 + 2;
              unint64_t v39 = (v39 + 3) & 0xFFFFFFFFFFFFFFFELL;
              unint64_t v42 = v39 + 2;
            }

            else
            {
              unsigned int v41 = 0;
              unint64_t v42 = v39 + 2;
              unint64_t v40 = v58[0];
            }

            if (v42 <= v6)
            {
              unsigned int v43 = bswap32(*(unsigned __int16 *)((char *)v7 + v39)) >> 16;
              v58[0] = v42;
              unint64_t v40 = v42;
            }

            else
            {
              unsigned int v43 = 0;
            }

            unint64_t v44 = (v40 + 7) & 0xFFFFFFFFFFFFFFF8LL;
            unint64_t v45 = v44 + 8;
            if (v44 + 8 > v6) {
              break;
            }
            uint64_t v26 = 0LL;
            unint64_t v46 = *(void *)((char *)v7 + v44);
            v58[0] = v45;
            if (!v41 || !v43 || !v46) {
              goto LABEL_64;
            }
            int v47 = (__int16)(v41 - 1);
            uint64_t v48 = v47 >= (__int16)v15 ? 0LL : *(void **)&v34[8 * v47];
            uint64_t v26 = 0LL;
            if (!v48) {
              goto LABEL_64;
            }
            uint64_t v26 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v48, "objectIDFactoryForEntity:"), "alloc"),  "initWithPK64:",  bswap64(v46));
            if (!v26) {
              goto LABEL_64;
            }
            [v38 addObject:v26];

            if (!--v57)
            {
              uint64_t v26 = v38;
              goto LABEL_64;
            }
          }

          uint64_t v26 = 0LL;
        }

+ (id)_generateTemporaryIDForEntity:(id)a3
{
  return _PFFastTemporaryIDCreation(a3);
}

@end