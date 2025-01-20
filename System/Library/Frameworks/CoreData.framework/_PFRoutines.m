@interface _PFRoutines
+ (BOOL)_isInMemoryStore:(uint64_t)a1;
+ (BOOL)createExternalReferenceLinkFromPath:(uint64_t)a3 toPath:(uint64_t)a4 protectionLevel:(void *)a5 error:;
+ (BOOL)isSanitizedVersionOf:(void *)a3 equalTo:;
+ (__CFDictionary)_createDictionaryPartitioningObjectIDs:(id)a3 intoHierarchies:(BOOL)a4;
+ (__CFDictionary)_createDictionaryPartitioningObjects:(id)a3 intoHierarchies:(BOOL)a4;
+ (__CFDictionary)createDictionaryPartitioningObjectsByEntity:(uint64_t)a1;
+ (__CFDictionary)createDictionaryPartitioningObjectsIDByRootEntity:(uint64_t)a1;
+ (__CFString)_getUUID;
+ (id)_coalescedPrefetchKeypaths:(uint64_t)a1;
+ (id)_frameworkHash;
+ (id)_newCollectionFromCollection:(uint64_t)a3 forParentContext:(objc_class *)a4 andClass:;
+ (id)_replaceBaseline:(void *)a3 inOrderedSet:(void *)a4 withOrderedSet:;
+ (id)newCollection:(void *)a3 fromCollection:(void *)a4 byAddingItems:;
+ (id)newMutableArrayFromCollection:(uint64_t)a3 forParentContext:;
+ (id)newMutableArrayFromCollection:(void *)a3 byRemovingItems:;
+ (id)newMutableOrderedSetFromCollection:(uint64_t)a3 forParentContext:;
+ (id)newMutableSetFromCollection:(uint64_t)a3 forParentContext:;
+ (id)newMutableSetFromCollection:(void *)a3 byIntersectingWithCollection:;
+ (id)newMutableSetFromCollection:(void *)a3 byRemovingItems:;
+ (id)newOrderedSetFromCollection:(void *)a3 byAddingItems:;
+ (id)newOrderedSetFromCollection:(void *)a3 byRemovingItems:;
+ (id)newSetFromCollection:(void *)a3 byAddingItems:;
+ (id)retainedDecodeValue:(void *)a3 forTransformableAttribute:;
+ (id)retainedEncodeObjectValue:(void *)a3 forTransformableAttribute:;
+ (id)valueForProcessArgument:(uint64_t)a1;
+ (uint64_t)BOOLValueForOverride:(uint64_t)a1;
+ (uint64_t)_doNameAndTypeCheck:(uint64_t)a1;
+ (uint64_t)_expressionIsCompoundIndexCompatible:(uint64_t)a1;
+ (uint64_t)_generateObjectIDMaptableForArray:(uint64_t *)a3 withMapping:(uint64_t *)a4 andEntries:;
+ (uint64_t)_getPFBundleVersionNumber;
+ (uint64_t)_groupObjectsByRootEntity:(uint64_t)a1;
+ (uint64_t)_isInMemoryStoreURL:(uint64_t)a1;
+ (uint64_t)_logDirectoryAccessDebugInformation:(uint64_t)a1;
+ (uint64_t)_newObjectIDsArrayWithMapping:(void *)a3 andEntries:(void *)a4 andCoordinator:;
+ (uint64_t)_objectsInOrderedCollection:(void *)a3 formSubstringInOrderedCollection:;
+ (uint64_t)_remoteChangeNotificationNameForStore:(uint64_t)a1;
+ (uint64_t)_rootEntityGroupsForObjects:(uint64_t)a3 passingBlock:;
+ (uint64_t)anyObjectFromCollection:(uint64_t)a1;
+ (uint64_t)attributeClassesForSecureCoding;
+ (uint64_t)convertCString:(unint64_t *)a3 toUnsignedInt64:(int)a4 withBase:;
+ (uint64_t)deleteFileForPFExternalReferenceData:(uint64_t)a1;
+ (uint64_t)fetchHeterogeneousCollectionByObjectIDs:(uint64_t)a3 intoContext:;
+ (uint64_t)historyChangesArrayClassesForSecureCoding;
+ (uint64_t)historyQueryGenDataClassesForSecureCoding;
+ (uint64_t)insecureBoolValueForOverride:(uint64_t)a1;
+ (uint64_t)integerValueForOverride:(uint64_t)a1;
+ (uint64_t)moveInterimFileToPermanentLocation:(uint64_t)a1;
+ (uint64_t)newArrayOfObjectIDsFromCollection:(uint64_t)a1;
+ (uint64_t)newMutableOrderedSetFromCollection:(uint64_t)a1;
+ (uint64_t)newOrderedSetFromCollection:(void *)a3 byInsertingItems:(uint64_t)a4 atIndex:;
+ (uint64_t)newSetOfObjectIDsFromCollection:(uint64_t)a1;
+ (uint64_t)plistClassesForSecureCoding;
+ (uint64_t)readBytesForExternalReferenceData:(void *)a3 intoBuffer:(off_t)a4 range:(size_t)a5;
+ (uint64_t)readExternalReferenceDataFromFile:(uint64_t)a1;
+ (uint64_t)sanitize:(uint64_t)a1;
+ (uint64_t)sensitiveIntegerValueForOverride:(uint64_t)a1;
+ (uint64_t)unarchiveCylicGraphObjectOfClasses:(uint64_t)a3 fromData:(uint64_t)a4 error:;
+ (uint64_t)writePFExternalReferenceDataToInterimFile:(uint64_t)a1;
+ (uint64_t)xpcStoreArchiverObjectIDClassesForSecureCoding;
+ (void)_logFileAccessDebugInformation:(uint64_t)a1;
+ (void)applicationActivateLifecyleNotifications;
+ (void)applicationDeactivateLifecyleNotifications;
+ (void)efficientlyEnumerateManagedObjectsInFetchRequest:(void *)a3 usingManagedObjectContext:(uint64_t)a4 andApplyBlock:;
+ (void)getIndexes:(void *)a3 fromCollection:(void *)a4 forObjectsInCollection:;
+ (void)initialize;
+ (void)stringValueForOverride:(uint64_t)a1;
+ (void)wrapBlockInGuardedAutoreleasePool:(id)a3;
@end

@implementation _PFRoutines

+ (uint64_t)anyObjectFromCollection:(uint64_t)a1
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  memset(v4, 0, sizeof(v4));
  uint64_t result = [a2 countByEnumeratingWithState:v4 objects:v5 count:16];
  if (result) {
    return **((void **)&v4[0] + 1);
  }
  return result;
}

+ (id)valueForProcessArgument:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v3 = objc_opt_self();
  if (!a2) {
    return 0LL;
  }
  v4 = (void *)MEMORY[0x186E3E5D8](v3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "arguments");
  uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"-%@", a2];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v17;
LABEL_4:
    uint64_t v11 = 0LL;
    uint64_t v12 = v8 + v9;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v16 + 1) + 8 * v11) isEqualToString:v6]) {
        break;
      }
      if (v8 == ++v11)
      {
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = v12;
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }

    v13 = (void *)[v5 objectAtIndex:v9 + v11 + 1];
  }

  else
  {
LABEL_10:

LABEL_13:
    v13 = 0LL;
  }

  id v14 = v13;
  objc_autoreleasePoolPop(v4);
  return v13;
}

+ (id)retainedDecodeValue:(void *)a3 forTransformableAttribute:
{
  uint64_t v5 = objc_opt_self();
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8](v5);
  uint64_t v7 = [a3 valueTransformerName];
  objc_opt_self();
  if (!v7 || (uint64_t v8 = [MEMORY[0x189607B20] valueTransformerForName:v7]) == 0)
  {
    uint64_t v9 = (void *)[MEMORY[0x189607B20] valueTransformerForName:*MEMORY[0x1896075D0]];
    goto LABEL_6;
  }

  uint64_t v9 = (void *)v8;
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:
    uint64_t v10 = (void *)[v9 transformedValue:a2];
    goto LABEL_7;
  }

  uint64_t v10 = (void *)[v9 reverseTransformedValue:a2];
LABEL_7:
  id v11 = v10;
  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (void)initialize
{
  *(_WORD *)&byte_18C4ABDC5 = 257;
  z9dsptsiQ80etb9782fsrs98bfdle88 = 0x101010101010101LL;
  *(uint64_t *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 7) = 0x101010101010101LL;
  dword_18C4ABDC0 = 16843009;
  __pflogFaultLog = _PFLogGetErrorLog();
  _PF_USE_IOS_PLATFORM = 1;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    byte_18C4ABDC6 = 0;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      byte_18C4ABDC5 = 0;
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        HIBYTE(dword_18C4ABDC0) = 0;
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          BYTE1(dword_18C4ABDC0) = 0;
          if ((dyld_program_sdk_at_least() & 1) == 0)
          {
            LOBYTE(dword_18C4ABDC0) = 0;
            if ((dyld_program_sdk_at_least() & 1) == 0)
            {
              byte_18C4ABDBE = 0;
              if ((dyld_program_sdk_at_least() & 1) == 0)
              {
                byte_18C4ABDBD = 0;
                if ((dyld_program_sdk_at_least() & 1) == 0) {
                  byte_18C4ABDBC = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  BYTE2(dword_18C4ABDC0) = BYTE1(dword_18C4ABDC0);
  _PF_Private_Malloc_Zone = 0LL;
  _PF_INTERNAL_DATA_SIZE_THRESHOLD = 1;
  pthread_key_init_np();
  pthread_key_init_np();
  NSArray_EmptyArray = (uint64_t)objc_alloc_init(MEMORY[0x189603F18]);
  NSSet_EmptySet = (uint64_t)objc_alloc_init(MEMORY[0x189604010]);
  NSOrderedSet_EmptyOrderedSet = (uint64_t)objc_alloc_init(MEMORY[0x189603FF0]);
  NSDictionary_EmptyDictionary = (uint64_t)objc_alloc_init(MEMORY[0x189603F68]);
  qword_18C4AB8C8 = (uint64_t)objc_alloc_init(MEMORY[0x1896078D0]);
  NSKeyValueCoding_NullValue = [MEMORY[0x189603FE8] null];
  _SELF_Expression = (uint64_t)(id)[MEMORY[0x189607878] expressionForEvaluatedObject];
  if (qword_18C4AB930 != -1) {
    dispatch_once(&qword_18C4AB930, &__block_literal_global_320);
  }
  if ((_MergedGlobals_65 & 1) == 0) {
    byte_18C4ABDC4 = 1;
  }
  v2 = imp_implementationWithBlock(&__block_literal_global_4);
  imp_removeBlock(v2);
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
}

+ (uint64_t)_generateObjectIDMaptableForArray:(uint64_t *)a3 withMapping:(uint64_t *)a4 andEntries:
{
  uint64_t v124 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (![a2 count]) {
    return 0LL;
  }
  v85 = a4;
  v86 = a3;
  CFIndex v94 = objc_opt_class();
  uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  uint64_t v9 = CFDictionaryCreateMutable(v7, 0LL, 0LL, 0LL);
  uint64_t v10 = CFDictionaryCreateMutable(v7, 0LL, 0LL, 0LL);
  v97 = CFArrayCreateMutable(v7, 0LL, 0LL);
  CFAllocatorRef v87 = v7;
  v96 = CFArrayCreateMutable(v7, 0LL, 0LL);
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  CFMutableDictionaryRef v98 = Mutable;
  v93 = (uint64_t **)[a2 countByEnumeratingWithState:&v115 objects:v123 count:16];
  if (v93)
  {
    uint64_t v90 = 0LL;
    id v91 = a2;
    v95 = 0LL;
    id v11 = 0LL;
    uint64_t v12 = 0LL;
    v13 = 0LL;
    uint64_t v88 = 0LL;
    uint64_t v89 = 0LL;
    uint64_t v92 = *(void *)v116;
    while (2)
    {
      for (i = 0LL; i != v93; i = (uint64_t **)((char *)i + 1))
      {
        if (*(void *)v116 != v92) {
          objc_enumerationMutation(v91);
        }
        v15 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v28 = 0LL;
          goto LABEL_106;
        }

        __int128 v16 = (const void *)[v15 persistentStore];
        uint64_t v17 = [v15 entity];
        if (v16 != v13 || v17 != v12)
        {
          __int128 v19 = (const void *)v17;
          Value = CFDictionaryGetValue(v98, v16);
          if (Value)
          {
            int v21 = (int)Value;
          }

          else
          {
            int v21 = v89 + 1;
            CFDictionarySetValue(v98, v16, (const void *)++v89);
          }

          v22 = CFDictionaryGetValue(v9, v19);
          if (v22)
          {
            unsigned __int16 v23 = (unsigned __int16)v22;
          }

          else
          {
            unsigned __int16 v23 = v90 + 1;
            CFDictionarySetValue(v9, v19, (const void *)++v90);
          }

          v24 = (const void *)((v21 << 16) | (unint64_t)v23);
          v25 = (char *)CFDictionaryGetValue(v10, v24);
          if (v25)
          {
            id v11 = v25;
            uint64_t v12 = (uint64_t)v19;
            v13 = v16;
          }

          else
          {
            id v11 = (char *)(v88 + 1);
            CFDictionarySetValue(v10, v24, (const void *)(v88 + 1));
            uint64_t v12 = (uint64_t)v19;
            v13 = v16;
            ++v88;
          }
        }

        CFArrayAppendValue(v97, v11 - 1);
        v26 = (uint64_t **)[v15 _referenceData64];
        v27 = v95;
        v95 = v27;
        CFArrayAppendValue(v96, v26);
        Mutable = v98;
      }

      v93 = (uint64_t **)[v91 countByEnumeratingWithState:&v115 objects:v123 count:16];
      if (v93) {
        continue;
      }
      break;
    }
  }

  else
  {
    v95 = 0LL;
  }

  unint64_t Count = CFDictionaryGetCount(Mutable);
  unint64_t v30 = Count;
  if (Count <= 1) {
    uint64_t v31 = 1LL;
  }
  else {
    uint64_t v31 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v32 = 1LL;
  }
  else {
    uint64_t v32 = v31;
  }
  v33 = (char *)&v85 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v93 = &v85;
  if (Count > 0x200) {
    v33 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v31);
  }
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  uint64_t v34 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v111,  v122,  16LL,  v85);
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v112;
    do
    {
      for (uint64_t j = 0LL; j != v35; ++j)
      {
        if (*(void *)v112 != v36) {
          objc_enumerationMutation(Mutable);
        }
        v38 = *(void **)(*((void *)&v111 + 1) + 8 * j);
        v39 = CFDictionaryGetValue(Mutable, v38);
        uint64_t v40 = [v38 identifier];
        v41 = &v33[8 * (void)v39];
        Mutable = v98;
        *((void *)v41 - 1) = v40;
      }

      uint64_t v35 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v111,  v122,  16LL);
    }

    while (v35);
  }

  uint64_t v42 = [MEMORY[0x189603F18] arrayWithObjects:v33 count:v30];
  if (v30 >= 0x201) {
    NSZoneFree(0LL, v33);
  }
  unint64_t v43 = CFDictionaryGetCount(v9);
  unint64_t v44 = v43;
  if (v43 <= 1) {
    uint64_t v45 = 1LL;
  }
  else {
    uint64_t v45 = v43;
  }
  if (v43 >= 0x201) {
    uint64_t v46 = 1LL;
  }
  else {
    uint64_t v46 = v45;
  }
  v47 = (char *)&v85 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  CFIndex v94 = v42;
  if (v43 > 0x200) {
    v47 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v45);
  }
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  uint64_t v48 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v107,  v121,  16LL);
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v108;
    do
    {
      for (uint64_t k = 0LL; k != v49; ++k)
      {
        if (*(void *)v108 != v50) {
          objc_enumerationMutation(v9);
        }
        v52 = *(void **)(*((void *)&v107 + 1) + 8 * k);
        v53 = CFDictionaryGetValue(v9, v52);
        *(void *)&v47[8 * (void)v53 - 8] = [v52 name];
      }

      uint64_t v49 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v107,  v121,  16LL);
    }

    while (v49);
  }

  uint64_t v54 = [MEMORY[0x189603F18] arrayWithObjects:v47 count:v44];
  if (v44 >= 0x201) {
    NSZoneFree(0LL, v47);
  }
  unint64_t v55 = CFDictionaryGetCount(v10);
  unint64_t v56 = v55;
  if (v55 <= 1) {
    uint64_t v57 = 1LL;
  }
  else {
    uint64_t v57 = v55;
  }
  if (v55 >= 0x201) {
    uint64_t v58 = 1LL;
  }
  else {
    uint64_t v58 = v57;
  }
  v59 = (const void **)((char *)&v85 - ((8 * v58 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (v55 > 0x200) {
    v59 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - ((8 * v58 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v57);
  }
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  uint64_t v60 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v103,  v120,  16LL);
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v104;
    do
    {
      for (uint64_t m = 0LL; m != v61; ++m)
      {
        if (*(void *)v104 != v62) {
          objc_enumerationMutation(v10);
        }
        v64 = *(const void **)(*((void *)&v103 + 1) + 8 * m);
        v59[(void)CFDictionaryGetValue(v10, v64) - 1] = v64;
      }

      uint64_t v61 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v103,  v120,  16LL);
    }

    while (v61);
  }

  CFArrayRef v65 = CFArrayCreate(v87, v59, v56, 0LL);
  if (v56 >= 0x201) {
    NSZoneFree(0LL, v59);
  }
  v66 = (void *)MEMORY[0x189603F18];
  uint64_t v67 = (uint64_t)v95;
  uint64_t v68 = [MEMORY[0x189607968] numberWithUnsignedLongLong:v95];
  uint64_t v69 = objc_msgSend(v66, "arrayWithObjects:", v94, v54, v65, v68, 0);
  uint64_t *v86 = v69;
  CFRelease(v65);
  if ((unint64_t)-[__CFArray count](v65, "count") > 0xFE || v67 > 0xFFFFFF)
  {
    uint64_t v74 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v97, v96, 0);
    uint64_t *v85 = v74;
  }

  else
  {
    unint64_t v70 = CFArrayGetCount(v96);
    CFIndex v94 = v70;
    v95 = &v85;
    if (v70 <= 1) {
      uint64_t v71 = 1LL;
    }
    else {
      uint64_t v71 = v70;
    }
    if (v70 >= 0x201) {
      uint64_t v72 = 1LL;
    }
    else {
      uint64_t v72 = v71;
    }
    v73 = (const void **)((char *)&v85 - ((8 * v72 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if (v70 > 0x200) {
      v73 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v85 - ((8 * v72 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v71);
    }
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    uint64_t v75 = -[__CFArray countByEnumeratingWithState:objects:count:]( v96,  "countByEnumeratingWithState:objects:count:",  &v99,  v119,  16LL);
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = 0LL;
      uint64_t v78 = *(void *)v100;
      do
      {
        for (uint64_t n = 0LL; n != v76; ++n)
        {
          if (*(void *)v100 != v78) {
            objc_enumerationMutation(v96);
          }
          uint64_t v80 = *(void *)(*((void *)&v99 + 1) + 8 * n);
          *(&v73[v77] + n) = (const void *)((CFArrayGetValueAtIndex(v97, v77 + n) << 24) | v80 & 0xFFFFFF);
        }

        uint64_t v76 = -[__CFArray countByEnumeratingWithState:objects:count:]( v96,  "countByEnumeratingWithState:objects:count:",  &v99,  v119,  16LL);
        v77 += n;
      }

      while (v76);
    }

    unint64_t v81 = v94;
    CFArrayRef v82 = CFArrayCreate(v87, v73, v94, 0LL);
    if (v81 >= 0x201) {
      NSZoneFree(0LL, v73);
    }
    uint64_t v83 = [MEMORY[0x189603F18] arrayWithObject:v82];
    uint64_t *v85 = v83;
    CFRelease(v82);
  }

  Mutable = v98;
  uint64_t v28 = 1LL;
LABEL_106:
  CFRelease(Mutable);
  CFRelease(v9);
  CFRelease(v10);
  CFRelease(v97);
  CFRelease(v96);
  return v28;
}

+ (uint64_t)_newObjectIDsArrayWithMapping:(void *)a3 andEntries:(void *)a4 andCoordinator:
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v7 = (void *)[a2 objectAtIndex:0];
  uint64_t v8 = (void *)[a2 objectAtIndex:1];
  uint64_t v9 = (void *)[a2 objectAtIndex:2];
  uint64_t v67 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 3), "unsignedLongLongValue");
  v73 = (const __CFArray *)[a3 objectAtIndex:0];
  CFArrayRef v69 = v73;
  unint64_t v10 = [v7 count];
  unint64_t v75 = [v8 count];
  unint64_t v76 = [v9 count];
  if (v10 <= 1) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v10 >= 0x201) {
    uint64_t v12 = 1LL;
  }
  else {
    uint64_t v12 = v11;
  }
  unint64_t v71 = v10;
  if (v10 > 0x200)
  {
    uint64_t v74 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    uint64_t v74 = (char *)&v65 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v74, 8 * v11);
  }

  if (v75 <= 1) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = v75;
  }
  if (v75 >= 0x201) {
    uint64_t v14 = 1LL;
  }
  else {
    uint64_t v14 = v13;
  }
  v15 = (char *)&v65 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v75 > 0x200) {
    v15 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v65 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v13);
  }
  if (v76 <= 1) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = v76;
  }
  if (v76 >= 0x201) {
    uint64_t v17 = 1LL;
  }
  else {
    uint64_t v17 = v16;
  }
  __int128 v18 = (char *)&v65 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v76 > 0x200) {
    __int128 v18 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v65 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v16);
  }
  unint64_t v70 = v18;
  uint64_t v72 = v15;
  unint64_t v19 = -[__CFArray count](v73, "count");
  if (v19 <= 1) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v19 >= 0x201) {
    uint64_t v21 = 1LL;
  }
  else {
    uint64_t v21 = v20;
  }
  v22 = (char *)&v65 - ((8 * v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v68 = v19;
  if (v19 > 0x200)
  {
    v66 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    v66 = v22;
    bzero(v22, 8 * v20);
  }

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v89 objects:v96 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0LL;
    uint64_t v26 = *(void *)v90;
    while (2)
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = &v74[8 * v25];
      do
      {
        if (*(void *)v90 != v26) {
          objc_enumerationMutation(v7);
        }
        uint64_t v29 = [a4 persistentStoreForIdentifier:*(void *)(*((void *)&v89 + 1) + 8 * v27)];
        if (!v29)
        {
LABEL_90:
          uint64_t v63 = 0LL;
          goto LABEL_91;
        }

        *(void *)&v28[8 * v27++] = v29;
      }

      while (v24 != v27);
      uint64_t v24 = [v7 countByEnumeratingWithState:&v89 objects:v96 count:16];
      v25 += v27;
      if (v24) {
        continue;
      }
      break;
    }
  }

  unint64_t v30 = (void *)objc_msgSend((id)objc_msgSend(a4, "managedObjectModel"), "entitiesByName");
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  uint64_t v31 = [v8 countByEnumeratingWithState:&v85 objects:v95 count:16];
  uint64_t v32 = v72;
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = 0LL;
    uint64_t v35 = *(void *)v86;
    while (2)
    {
      for (uint64_t i = 0LL; i != v33; ++i)
      {
        if (*(void *)v86 != v35) {
          objc_enumerationMutation(v8);
        }
        uint64_t v37 = [v30 objectForKey:*(void *)(*((void *)&v85 + 1) + 8 * i)];
        if (!v37)
        {
          uint64_t v63 = 0LL;
          goto LABEL_92;
        }

        v32[v34 + i] = v37;
      }

      uint64_t v33 = [v8 countByEnumeratingWithState:&v85 objects:v95 count:16];
      v34 += i;
      if (v33) {
        continue;
      }
      break;
    }
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  uint64_t v38 = [v9 countByEnumeratingWithState:&v81 objects:v94 count:16];
  v39 = v70;
  if (v38)
  {
    uint64_t v40 = v38;
    uint64_t v41 = 0LL;
    uint64_t v42 = *(void *)v82;
    do
    {
      for (uint64_t j = 0LL; j != v40; ++j)
      {
        if (*(void *)v82 != v42) {
          objc_enumerationMutation(v9);
        }
        v39[v41 + j] = *(void *)(*((void *)&v81 + 1) + 8 * j);
      }

      uint64_t v40 = [v9 countByEnumeratingWithState:&v81 objects:v94 count:16];
      v41 += j;
    }

    while (v40);
  }

  unint64_t v44 = [v9 count];
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  BOOL v46 = v44 < 0xFF && v67 < 0x1000000;
  __int128 v79 = 0uLL;
  __int128 v80 = 0uLL;
  uint64_t v47 = -[__CFArray countByEnumeratingWithState:objects:count:]( v73,  "countByEnumeratingWithState:objects:count:",  &v77,  v93,  16LL);
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v51 = *(void *)v78;
    uint64_t v52 = 0x7FFFFFFFLL;
    do
    {
      uint64_t v53 = 0LL;
      uint64_t v67 = v50;
      uint64_t v54 = &v66[8 * v50];
      do
      {
        if (*(void *)v78 != v51) {
          objc_enumerationMutation(v73);
        }
        uint64_t v55 = *(void *)(*((void *)&v77 + 1) + 8 * v53);
        if (v46) {
          uint64_t v56 = v55 >> 24;
        }
        else {
          uint64_t v56 = *(void *)(*((void *)&v77 + 1) + 8 * v53);
        }
        if (v56 != v52)
        {
          unsigned int v57 = WORD1(v70[v56]) - 1;
          unsigned int v58 = (unsigned __int16)v70[v56] - 1;
          uint64_t v49 = (objc_class *)[*(id *)&v74[8 * v57] objectIDFactoryForEntity:*(void *)&v72[8 * v58]];
          uint64_t v52 = v56;
        }

        if (v46) {
          uint64_t ValueAtIndex = v55 & 0xFFFFFF;
        }
        else {
          uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v69, v67 + v53);
        }
        *(void *)&v54[8 * v53++] = [[v49 alloc] initWithPK64:ValueAtIndex];
      }

      while (v48 != v53);
      uint64_t v48 = -[__CFArray countByEnumeratingWithState:objects:count:]( v73,  "countByEnumeratingWithState:objects:count:",  &v77,  v93,  16LL);
      uint64_t v50 = v67 + v53;
    }

    while (v48);
  }

  uint64_t v61 = objc_alloc(&OBJC_CLASS____PFArray);
  uint64_t v62 = -[__CFArray count](v73, "count");
  uint64_t v63 = -[_PFArray initWithObjects:count:andFlags:](v61, "initWithObjects:count:andFlags:", v66, v62, 18LL);
LABEL_91:
  uint64_t v32 = v72;
LABEL_92:
  if (v68 >= 0x201) {
    NSZoneFree(0LL, v66);
  }
  if (v71 >= 0x201) {
    NSZoneFree(0LL, v74);
  }
  if (v75 >= 0x201) {
    NSZoneFree(0LL, v32);
  }
  if (v76 >= 0x201) {
    NSZoneFree(0LL, v70);
  }
  return v63;
}

+ (id)_frameworkHash
{
  if (qword_18C4AB8D0 != -1) {
    dispatch_once(&qword_18C4AB8D0, &__block_literal_global_51);
  }
  return (id)qword_18C4AB8D8;
}

+ (uint64_t)_getPFBundleVersionNumber
{
  if (!_PF_BundleVersion)
  {
    v0 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithInteger:1419];
    while (!__ldaxr((unint64_t *)&_PF_BundleVersion))
    {
    }

    __clrex();
  }

  return _PF_BundleVersion;
}

+ (uint64_t)_remoteChangeNotificationNameForStore:(uint64_t)a1
{
  return [NSString stringWithFormat:@"%@.%@", @"com.apple.coredata.NSPersistentStoreRemoteChangeNotification.remotenotification", objc_msgSend(a2, "identifier")];
}

+ (uint64_t)_rootEntityGroupsForObjects:(uint64_t)a3 passingBlock:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a2);
        }
        unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        if ((*(unsigned int (**)(uint64_t, void *))(a3 + 16))(a3, v10))
        {
          uint64_t v11 = [v10 entity];
          if (v11)
          {
            if ((*(_BYTE *)(v11 + 120) & 4) != 0)
            {
              uint64_t v12 = *(void **)(v11 + 72);
            }

            else
            {
              do
              {
                uint64_t v12 = (void *)v11;
                uint64_t v11 = [(id)v11 superentity];
              }

              while (v11);
            }
          }

          else
          {
            uint64_t v12 = 0LL;
          }

          uint64_t v13 = [v12 name];
          id v14 = (id)[v5 objectForKey:v13];
          if (!v14)
          {
            id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
            [v5 setObject:v14 forKey:v13];
          }

          [v14 addObject:v10];
        }

        ++v9;
      }

      while (v9 != v7);
      uint64_t v15 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v7 = v15;
    }

    while (v15);
  }

  uint64_t v16 = [v5 allValues];

  return v16;
}

+ (uint64_t)_groupObjectsByRootEntity:(uint64_t)a1
{
  return +[_PFRoutines _rootEntityGroupsForObjects:passingBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  a2,  (uint64_t)&__block_literal_global_63);
}

+ (id)_coalescedPrefetchKeypaths:(uint64_t)a1
{
  uint64_t v3 = [a2 count];
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  if ([a2 isNSArray])
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v6 = v5;
    if (v3)
    {
      id v16 = v4;
      id v17 = v5;
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        uint64_t v8 = (void *)objc_msgSend( (id)objc_msgSend(a2, "objectAtIndex:", i, v16),  "componentsSeparatedByString:",  @".");
        uint64_t v9 = [v8 count];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0LL;
          uint64_t v12 = v17;
          do
          {
            uint64_t v13 = (void *)[v8 objectAtIndex:v11];
            if ([v13 length])
            {
              uint64_t v14 = [v12 objectForKey:v13];
              if (!v14) {
                uint64_t v14 = [MEMORY[0x189603FC8] dictionary];
              }
              [v12 setObject:v14 forKey:v13];
              uint64_t v12 = (void *)v14;
            }

            ++v11;
          }

          while (v10 != v11);
        }
      }

      id v4 = v16;
      id v6 = v17;
    }
  }

  else if ([a2 isNSDictionary])
  {
    id v6 = a2;
  }

  else
  {
    id v6 = 0LL;
  }

  [v4 drain];
  return v6;
}

+ (uint64_t)_logDirectoryAccessDebugInformation:(uint64_t)a1
{
  uint64_t v135 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  _NSCoreDataLog( 1LL,  (uint64_t)@"Logging status information for directory path: %@",  v3,  v4,  v5,  v6,  v7,  v8,  (uint64_t)a2);
  uint64_t v9 = (void *)[a2 pathComponents];
  uint64_t v10 = geteuid();
  _NSCoreDataLog(1LL, (uint64_t)@"Executing as effective user %u", v11, v12, v13, v14, v15, v16, v10);
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  uint64_t result = [v9 countByEnumeratingWithState:&v129 objects:v134 count:16];
  if (result)
  {
    uint64_t v18 = result;
    __int128 v19 = &stru_189EAC2E8;
    uint64_t v20 = *(void *)v130;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v130 != v20) {
          objc_enumerationMutation(v9);
        }
        uint64_t v22 = *(void *)(*((void *)&v129 + 1) + 8 * v21);
        LOBYTE(v133.st_dev) = 0;
        __int128 v19 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v19, "stringByAppendingPathComponent:", v22);
        uint64_t v23 = (const char *)-[__CFString fileSystemRepresentation](v19, "fileSystemRepresentation");
        if (stat(v23, &v133))
        {
          unint64_t v30 = __error();
          strerror(*v30);
          _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to stat path '%s', errno %d / %s.",  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v23);
        }

        else
        {
          _NSCoreDataLog(1LL, (uint64_t)@"Information for %s", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
          _NSCoreDataLog( 1LL,  (uint64_t)@"  File Device ID: \t%d",  v37,  v38,  v39,  v40,  v41,  v42,  v133.st_rdev);
          _NSCoreDataLog( 1LL,  (uint64_t)@"  Device ID: \t\t%d",  v43,  v44,  v45,  v46,  v47,  v48,  v133.st_dev);
          _NSCoreDataLog(1LL, (uint64_t)@"  File Size: \t\t%lld bytes", v49, v50, v51, v52, v53, v54, v133.st_size);
          _NSCoreDataLog(1LL, (uint64_t)@"  File inode: \t\t%llu", v55, v56, v57, v58, v59, v60, v133.st_ino);
          _NSCoreDataLog(1LL, (uint64_t)@"  File user ID: \t\t%u", v61, v62, v63, v64, v65, v66, v133.st_uid);
          _NSCoreDataLog(1LL, (uint64_t)@"  File group ID: \t\t%u", v67, v68, v69, v70, v71, v72, v133.st_gid);
          _NSCoreDataLog(1LL, (uint64_t)@"  File Permissions: \t", v73, v74, v75, v76, v77, v78, v123);
          if ((v133.st_mode & 0xF000) == 0x4000) {
            __int128 v85 = @"d";
          }
          else {
            __int128 v85 = @"-";
          }
          _NSCoreDataLog(1LL, (uint64_t)v85, v79, v80, v81, v82, v83, v84, v124);
          _NSCoreDataLog(1LL, (uint64_t)@"  %3o", v86, v87, v88, v89, v90, v91, v133.st_mode & 0x1FF);
          CFMutableDictionaryRef v98 = "is not";
          if ((v133.st_mode & 0xF000) == 0xA000) {
            CFMutableDictionaryRef v98 = "is";
          }
          _NSCoreDataLog( 1LL,  (uint64_t)@"  component %s a symbolic link",  v92,  v93,  v94,  v95,  v96,  v97,  (uint64_t)v98);
          if (access(v23, 4))
          {
            uint64_t v126 = *__error();
            _NSCoreDataLog( 1LL,  (uint64_t)@"  component is not readable with errno %d",  v105,  v106,  v107,  v108,  v109,  v110,  v126);
          }

          else
          {
            _NSCoreDataLog(1LL, (uint64_t)@"  component is readable", v99, v100, v101, v102, v103, v104, v125);
          }

          if (access(v23, 2))
          {
            uint64_t v128 = *__error();
            _NSCoreDataLog( 1LL,  (uint64_t)@"  component is not writeable with errno %d",  v117,  v118,  v119,  v120,  v121,  v122,  v128);
          }

          else
          {
            _NSCoreDataLog(1LL, (uint64_t)@"  component is writeable", v111, v112, v113, v114, v115, v116, v127);
          }
        }

        ++v21;
      }

      while (v18 != v21);
      uint64_t result = [v9 countByEnumeratingWithState:&v129 objects:v134 count:16];
      uint64_t v18 = result;
    }

    while (result);
  }

  return result;
}

+ (void)_logFileAccessDebugInformation:(uint64_t)a1
{
  uint64_t v199 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a2)
  {
    LOBYTE(v197.st_dev) = 0;
    if (stat(a2, &v197))
    {
      uint64_t v3 = __error();
      strerror(*v3);
      _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to stat path '%s', errno %d / %s.",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)a2);
      uint64_t v190 = geteuid();
      _NSCoreDataLog(1LL, (uint64_t)@"Executing as effective user %u", v10, v11, v12, v13, v14, v15, v190);
    }

    else
    {
      uint64_t v16 = geteuid();
      _NSCoreDataLog(1LL, (uint64_t)@"Executing as effective user %u", v17, v18, v19, v20, v21, v22, v16);
      _NSCoreDataLog(1LL, (uint64_t)@"Information for %s", v23, v24, v25, v26, v27, v28, (uint64_t)a2);
      _NSCoreDataLog(1LL, (uint64_t)@"---------------------------", v29, v30, v31, v32, v33, v34, v192);
      _NSCoreDataLog( 1LL,  (uint64_t)@"  File Device ID: \t%d",  v35,  v36,  v37,  v38,  v39,  v40,  v197.st_rdev);
      _NSCoreDataLog( 1LL,  (uint64_t)@"  Device ID: \t\t%d",  v41,  v42,  v43,  v44,  v45,  v46,  v197.st_dev);
      _NSCoreDataLog(1LL, (uint64_t)@"  File Size: \t\t%lld bytes", v47, v48, v49, v50, v51, v52, v197.st_size);
      _NSCoreDataLog(1LL, (uint64_t)@"  File inode: \t\t%llu", v53, v54, v55, v56, v57, v58, v197.st_ino);
      _NSCoreDataLog(1LL, (uint64_t)@"  File user ID: \t\t%u", v59, v60, v61, v62, v63, v64, v197.st_uid);
      _NSCoreDataLog(1LL, (uint64_t)@"  File group ID: \t\t%u", v65, v66, v67, v68, v69, v70, v197.st_gid);
      _NSCoreDataLog(1LL, (uint64_t)@"  File Permissions: \t", v71, v72, v73, v74, v75, v76, v193);
      if ((v197.st_mode & 0xF000) == 0x4000) {
        uint64_t v83 = @"d";
      }
      else {
        uint64_t v83 = @"-";
      }
      _NSCoreDataLog(1LL, (uint64_t)v83, v77, v78, v79, v80, v81, v82, v194);
      _NSCoreDataLog(1LL, (uint64_t)@"  %3o", v84, v85, v86, v87, v88, v89, v197.st_mode & 0x1FF);
      if ((v197.st_mode & 0xF000) == 0xA000) {
        uint64_t v96 = "is";
      }
      else {
        uint64_t v96 = "is not";
      }
      _NSCoreDataLog(1LL, (uint64_t)@"  file %s a symbolic link", v90, v91, v92, v93, v94, v95, (uint64_t)v96);
    }

    LOBYTE(v198.f_bsize) = 0;
    if (statfs(a2, &v198))
    {
      uint64_t v103 = __error();
      uint64_t v104 = *v103;
      strerror(*v103);
      _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to statfs file; errno %d / %s.",
        v105,
        v106,
        v107,
        v108,
        v109,
        v110,
        v104);
      return;
    }

    _NSCoreDataLog(1LL, (uint64_t)@"Information for file system", v97, v98, v99, v100, v101, v102, v191);
    _NSCoreDataLog(1LL, (uint64_t)@"---------------------------", v111, v112, v113, v114, v115, v116, v195);
    _NSCoreDataLog(1LL, (uint64_t)@"  File system type: \t\t%#lx", v117, v118, v119, v120, v121, v122, v198.f_type);
    _NSCoreDataLog( 1LL,  (uint64_t)@"  File system flags: \t\t%#lx",  v123,  v124,  v125,  v126,  v127,  v128,  v198.f_flags);
    uint32_t f_flags = v198.f_flags;
    if ((v198.f_flags & 1) != 0)
    {
      _NSCoreDataLog(1LL, (uint64_t)@"MNT_RDONLY", v129, v130, v131, v132, v133, v134, v196);
      uint32_t f_flags = v198.f_flags;
      if ((v198.f_flags & 0x2000) == 0)
      {
LABEL_15:
        if ((f_flags & 0x4000) == 0) {
          goto LABEL_16;
        }
        goto LABEL_24;
      }
    }

    else if ((v198.f_flags & 0x2000) == 0)
    {
      goto LABEL_15;
    }

    _NSCoreDataLog(1LL, (uint64_t)@"  MNT_QUOTA", v129, v130, v131, v132, v133, v134, v196);
    uint32_t f_flags = v198.f_flags;
    if ((v198.f_flags & 0x4000) == 0)
    {
LABEL_16:
      if ((f_flags & 0x200000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }

+ (__CFString)_getUUID
{
  v0 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x189604DB0]);
  v1 = (__CFString *)CFUUIDCreateString(0LL, v0);
  CFRelease(v0);
  return v1;
}

+ (uint64_t)_doNameAndTypeCheck:(uint64_t)a1
{
  if (!a2) {
    return 1LL;
  }
  uint64_t v3 = [a2 count];
  if (!v3) {
    return 1LL;
  }
  unint64_t v4 = v3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = 0LL;
  unsigned int v7 = 1;
  while (1)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v6), "name");
    if (!result) {
      break;
    }
    if (v5 == objc_opt_class()) {
      return 0LL;
    }
    uint64_t v6 = v7;
    if (v4 <= v7++) {
      return 1LL;
    }
  }

  return result;
}

+ (uint64_t)convertCString:(unint64_t *)a3 toUnsignedInt64:(int)a4 withBase:
{
  __endptr = 0LL;
  unint64_t v7 = strtouq(a2, &__endptr, a4);
  if (__endptr) {
    BOOL v8 = __endptr == a2;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || *__endptr)
  {
    unint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = 1LL;
  }

  *a3 = v7;
  return v9;
}

+ (uint64_t)attributeClassesForSecureCoding
{
  if (qword_18C4AB8E8 != -1) {
    dispatch_once(&qword_18C4AB8E8, &__block_literal_global_152);
  }
  return qword_18C4AB8E0;
}

+ (uint64_t)xpcStoreArchiverObjectIDClassesForSecureCoding
{
  if (qword_18C4AB8F8 != -1) {
    dispatch_once(&qword_18C4AB8F8, &__block_literal_global_158);
  }
  return qword_18C4AB8F0;
}

+ (uint64_t)historyChangesArrayClassesForSecureCoding
{
  if (qword_18C4AB908 != -1) {
    dispatch_once(&qword_18C4AB908, &__block_literal_global_160);
  }
  return qword_18C4AB900;
}

+ (uint64_t)historyQueryGenDataClassesForSecureCoding
{
  if (qword_18C4AB918 != -1) {
    dispatch_once(&qword_18C4AB918, &__block_literal_global_162);
  }
  return qword_18C4AB910;
}

+ (uint64_t)plistClassesForSecureCoding
{
  if (qword_18C4AB928 != -1) {
    dispatch_once(&qword_18C4AB928, &__block_literal_global_163);
  }
  return qword_18C4AB920;
}

+ (void)stringValueForOverride:(uint64_t)a1
{
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)&OBJC_CLASS____PFRoutines, a2);
  unint64_t v4 = v3;
  if (byte_18C4ABDBF) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = byte_18C4ABDC4 == 0;
  }
  if (v5 && (!v3 || ![v3 length]))
  {
    uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "environment"),  "objectForKey:",  a2);
    if (!v6 || (unint64_t v4 = v6, ![v6 length])) {
      unint64_t v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"), "stringForKey:", a2);
    }
  }

  if ([v4 length]) {
    return v4;
  }
  else {
    return 0LL;
  }
}

+ (uint64_t)integerValueForOverride:(uint64_t)a1
{
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)&OBJC_CLASS____PFRoutines, a2);
  if ([v3 length]) {
    return [v3 integerValue];
  }
  if (byte_18C4ABDBF) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = byte_18C4ABDC4 == 0;
  }
  if (!v5) {
    return 0LL;
  }
  id v3 = (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "environment"),  "objectForKey:",  a2);
  if ([v3 length]) {
    return [v3 integerValue];
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"), "integerForKey:", a2);
}

+ (uint64_t)sensitiveIntegerValueForOverride:(uint64_t)a1
{
  if (byte_18C4ABDBF) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = byte_18C4ABDC4 == 0;
  }
  if (!v3) {
    return 0LL;
  }
  id v4 = +[_PFRoutines valueForProcessArgument:]((uint64_t)&OBJC_CLASS____PFRoutines, a2);
  if ([v4 length]) {
    return [v4 integerValue];
  }
  id v4 = (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "environment"),  "objectForKey:",  a2);
  if ([v4 length]) {
    return [v4 integerValue];
  }
  else {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"), "integerForKey:", a2);
  }
}

+ (uint64_t)BOOLValueForOverride:(uint64_t)a1
{
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)&OBJC_CLASS____PFRoutines, a2);
  if ([v3 length]) {
    return [v3 BOOLValue];
  }
  if (byte_18C4ABDBF) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = byte_18C4ABDC4 == 0;
  }
  if (!v5) {
    return 0LL;
  }
  id v3 = (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "environment"),  "objectForKey:",  a2);
  if ([v3 length]) {
    return [v3 BOOLValue];
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"), "BOOLForKey:", a2);
}

+ (uint64_t)insecureBoolValueForOverride:(uint64_t)a1
{
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)&OBJC_CLASS____PFRoutines, a2);
  if ([v3 length]) {
    return [v3 BOOLValue];
  }
  id v3 = (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "environment"),  "objectForKey:",  a2);
  if ([v3 length]) {
    return [v3 BOOLValue];
  }
  else {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"), "BOOLForKey:", a2);
  }
}

+ (uint64_t)writePFExternalReferenceDataToInterimFile:(uint64_t)a1
{
  v50[2] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v3 = (const char *)[a2 _externalReferenceLocation];
  size_t v4 = strlen(v3);
  BOOL v5 = (char *)calloc(1uLL, v4 + 9);
  strcat(&strncat(v5, v3, v4)[v4 - 1], ".interim");
  uint64_t v6 = (void *)[a2 _originalData];
  uint64_t v7 = [NSString stringWithUTF8String:v5];
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    uint64_t v11 = [v6 _safeguardLocation];
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v10 = (void *)[NSString stringWithUTF8String:v11];
  }

  else
  {
    uint64_t v9 = objc_opt_class();
    if (v9 != objc_opt_class()) {
      goto LABEL_12;
    }
    uint64_t v10 = (void *)[-[_PFEvanescentData url]((id *)v6) path];
    if (![v10 UTF8String]) {
      goto LABEL_12;
    }
  }

  uint64_t v46 = 0LL;
  if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]( (uint64_t)_PFRoutines,  (uint64_t)v10,  v7,  [a2 preferredProtectionLevel],  &v46))
  {
    uint64_t v18 = v5;
    goto LABEL_26;
  }

  uint64_t v43 = v7;
  uint64_t v44 = v46;
  _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to clone external data reference from %@ to %@ error: %@",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v10);
LABEL_12:
  uint64_t v45 = v3;
  int v19 = open(v5, 2561, 420LL, v43, v44);
  if (v19 < 0)
  {
    free(v5);
    uint64_t v35 = (void *)MEMORY[0x189603F70];
    uint64_t v36 = *MEMORY[0x189603A58];
    uint64_t v37 = objc_msgSend( NSString,  "stringWithFormat:",  @"Can't open externalDataReference interim file : %d",  *__error());
    v49[0] = @"Problem Path";
    uint64_t v42 = [NSString stringWithUTF8String:v3];
    v49[1] = @"com.apple.coredata.ubiquity.eat";
    v50[0] = v42;
    v50[1] = MEMORY[0x189604A88];
    uint64_t v39 = (void *)MEMORY[0x189603F68];
    uint64_t v40 = v50;
    uint64_t v41 = v49;
LABEL_29:
    objc_exception_throw((id)objc_msgSend( v35,  "exceptionWithName:reason:userInfo:",  v36,  v37,  objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 2)));
  }

  int v20 = v19;
  uint64_t v21 = [a2 _bytesLengthForExternalReference];
  uint64_t v22 = malloc(0x40000uLL);
  off_t v23 = 0LL;
  if (v21 >= 0x40000) {
    size_t v24 = 0x40000LL;
  }
  else {
    size_t v24 = v21;
  }
  do
  {
    objc_msgSend(v6, "getBytes:range:", v22, v23, v24);
    if (pwrite(v20, v22, v24, v23) != v24)
    {
      uint64_t v34 = *__error();
      close(v20);
      free(v5);
      free(v22);
      uint64_t v35 = (void *)MEMORY[0x189603F70];
      uint64_t v36 = *MEMORY[0x189603A58];
      uint64_t v37 = objc_msgSend( NSString,  "stringWithFormat:",  @"Can't create externalDataReference interim file : %d",  v34);
      v47[0] = @"Problem Path";
      uint64_t v38 = [NSString stringWithUTF8String:v45];
      v47[1] = @"com.apple.coredata.ubiquity.eat";
      v48[0] = v38;
      v48[1] = MEMORY[0x189604A88];
      uint64_t v39 = (void *)MEMORY[0x189603F68];
      uint64_t v40 = v48;
      uint64_t v41 = v47;
      goto LABEL_29;
    }

    v21 -= v24;
    v23 += v24;
    if (v21 >= 0x40000) {
      size_t v24 = 0x40000LL;
    }
    else {
      size_t v24 = v21;
    }
  }

  while (v21 > 0);
  uint64_t v25 = [a2 preferredProtectionLevel];
  fcntl(v20, 64, v25);
  close(v20);
  uint64_t v26 = [a2 _safeguardLocation];
  if (v26)
  {
    uint64_t v46 = 0LL;
    if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]( (uint64_t)_PFRoutines,  v7,  [NSString stringWithUTF8String:v26],  v25,  &v46))
    {
      [a2 doCleanupOnDealloc];
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to clone external data reference from %@ to %@ error: %@",  v27,  v28,  v29,  v30,  v31,  v32,  v7);
    }
  }

  free(v5);
  uint64_t v18 = (char *)v22;
LABEL_26:
  free(v18);
  return v7;
}

+ (BOOL)createExternalReferenceLinkFromPath:(uint64_t)a3 toPath:(uint64_t)a4 protectionLevel:(void *)a5 error:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v30 = 0LL;
  if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "copyItemAtPath:toPath:error:",  a2,  a3,  &v30) & 1) == 0)
  {
    if ([v30 code] != 516
      || (uint64_t v9 = (void *)[v30 domain],
          ![v9 isEqualToString:*MEMORY[0x189607460]]))
    {
      if (v30)
      {
        if (a5)
        {
          BOOL result = 0LL;
          *a5 = v30;
          return result;
        }
      }

      else
      {
        uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/_PFRoutines.m");
        uint64_t v25 = (os_log_s *)__pflogFaultLog;
        BOOL result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/_PFRoutines.m";
        __int16 v33 = 1024;
        int v34 = 2111;
        _os_log_fault_impl( &dword_186681000,  v25,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }

      return 0LL;
    }

    id v30 = 0LL;
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v35[0] = a2;
  v35[1] = a3;
  uint64_t v10 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v35 count:2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = open((const char *)[*(id *)(*((void *)&v26 + 1) + 8 * i) UTF8String], 1, 420);
        if (v15 >= 1)
        {
          int v16 = v15;
          fcntl(v15, 64, a4);
          close(v16);
        }
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }

    while (v12);
  }

  return 1LL;
}

+ (uint64_t)moveInterimFileToPermanentLocation:(uint64_t)a1
{
  v12[2] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v3 = (const char *)[a2 _externalReferenceLocation];
  size_t v4 = strlen(v3);
  BOOL v5 = (char *)calloc(1uLL, v4 + 9);
  strcat(&strncat(v5, v3, v4)[v4 - 1], ".interim");
  if (rename(v5, v3))
  {
    uint64_t v7 = *__error();
    free(v5);
    uint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A58];
    uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"Can't copy interim file to permanent location : %d",  v7);
    v11[0] = @"Problem object";
    v11[1] = @"com.apple.coredata.ubiquity.eat";
    v12[0] = a2;
    v12[1] = MEMORY[0x189604A88];
    objc_exception_throw((id)objc_msgSend( v8,  "exceptionWithName:reason:userInfo:",  v9,  v10,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v12, v11, 2)));
  }

  free(v5);
  return 1LL;
}

+ (uint64_t)readExternalReferenceDataFromFile:(uint64_t)a1
{
  v29[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v3 = (const char *)[a2 _safeguardLocation];
  if (v3)
  {
    size_t v4 = v3;
    int v5 = open(v3, 0);
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    size_t v4 = (const char *)[a2 _externalReferenceLocation];
    int v6 = open(v4, 0);
    if (v6 < 0)
    {
      uint64_t v7 = __error();
      uint64_t v8 = (void *)MEMORY[0x189603F70];
      uint64_t v9 = *MEMORY[0x189603A60];
      uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"Unable to open file with path: %s (%d)",  v4,  *v7);
      __int128 v26 = @"com.apple.coredata.ubiquity.eat";
      uint64_t v27 = MEMORY[0x189604A88];
      uint64_t v11 = (void *)MEMORY[0x189603F68];
      uint64_t v12 = &v27;
      uint64_t v13 = &v26;
LABEL_13:
      uint64_t v20 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      uint64_t v21 = v8;
      uint64_t v22 = v9;
      goto LABEL_14;
    }
  }

  else
  {
    size_t v4 = (const char *)[a2 _externalReferenceLocation];
    int v6 = open(v4, 0);
    if (v6 < 0)
    {
      uint64_t v23 = __error();
      uint64_t v8 = (void *)MEMORY[0x189603F70];
      uint64_t v9 = *MEMORY[0x189603A60];
      uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"Unable to open file with path %s (%d)",  v4,  *v23);
      __int128 v28 = @"com.apple.coredata.ubiquity.eat";
      v29[0] = MEMORY[0x189604A88];
      uint64_t v11 = (void *)MEMORY[0x189603F68];
      uint64_t v12 = v29;
      uint64_t v13 = &v28;
      goto LABEL_13;
    }
  }

  int v5 = v6;
LABEL_9:
  fcntl(v5, 48, 1LL);
  size_t v15 = [a2 _bytesLengthForExternalReference];
  uint64_t v14 = PF_CALLOC_SCANNED_BYTES(v15);
  ssize_t v16 = read(v5, v14, v15);
  close(v5);
  if (v16 == v15) {
    return (uint64_t)v14;
  }
  uint64_t v18 = (void *)MEMORY[0x189603F70];
  uint64_t v19 = *MEMORY[0x189603A58];
  uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"Missing bytes from file at path %s, expected %lu, got %lu",  v4,  v15,  v16);
  uint64_t v24 = @"com.apple.coredata.ubiquity.eat";
  uint64_t v25 = MEMORY[0x189604A88];
  uint64_t v20 = [MEMORY[0x189603F68] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  uint64_t v21 = v18;
  uint64_t v22 = v19;
LABEL_14:
  objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v10 userInfo:v20]);
  return +[_PFRoutines readBytesForExternalReferenceData:intoBuffer:range:]();
}

+ (uint64_t)readBytesForExternalReferenceData:(void *)a3 intoBuffer:(off_t)a4 range:(size_t)a5
{
  v38[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t result = [a2 hasExternalReferenceContent];
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v10 = (const char *)[a2 _safeguardLocation];
  if (!v10)
  {
    uint64_t v11 = (const char *)[a2 _externalReferenceLocation];
    int v13 = open(v11, 0);
    if (v13 < 0)
    {
      __int128 v28 = __error();
      size_t v15 = (void *)MEMORY[0x189603F70];
      uint64_t v16 = *MEMORY[0x189603A60];
      uint64_t v17 = objc_msgSend( NSString,  "stringWithFormat:",  @"Unable to open file with path: %s (%d)",  v11,  *v28);
      uint64_t v37 = @"com.apple.coredata.ubiquity.eat";
      v38[0] = MEMORY[0x189604A88];
      uint64_t v18 = (void *)MEMORY[0x189603F68];
      uint64_t v19 = v38;
      uint64_t v20 = &v37;
      goto LABEL_14;
    }

+ (uint64_t)deleteFileForPFExternalReferenceData:(uint64_t)a1
{
  uint64_t result = [a2 hasExternalReferenceContent];
  if ((_DWORD)result)
  {
    uint64_t v4 = [a2 externalReferenceLocationString];
    int v5 = (void *)[MEMORY[0x1896078A8] defaultManager];
    uint64_t result = [v5 fileExistsAtPath:v4];
    if ((_DWORD)result) {
      return [v5 removeItemAtPath:v4 error:0];
    }
  }

  return result;
}

+ (uint64_t)_isInMemoryStoreURL:(uint64_t)a1
{
  uint64_t result = [a2 isFileURL];
  if ((_DWORD)result) {
    return objc_msgSend((id)objc_msgSend(a2, "path"), "hasPrefix:", @"/dev/null");
  }
  return result;
}

+ (BOOL)_isInMemoryStore:(uint64_t)a1
{
  if ((__CFString *)[a2 type] != @"SQLite") {
    return [a2 type] == (void)@"InMemory";
  }
  if (a2) {
    return (a2[201] >> 6) & 1;
  }
  return 0LL;
}

+ (uint64_t)unarchiveCylicGraphObjectOfClasses:(uint64_t)a3 fromData:(uint64_t)a4 error:
{
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a3 error:a4];
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  [v8 _allowDecodingCyclesInSecureMode];
  uint64_t v9 = [v8 decodeTopLevelObjectOfClasses:a2 forKey:*MEMORY[0x1896075C8] error:a4];

  return v9;
}

+ (id)retainedEncodeObjectValue:(void *)a3 forTransformableAttribute:
{
  uint64_t v5 = objc_opt_self();
  int v6 = (void *)MEMORY[0x186E3E5D8](v5);
  uint64_t v7 = [a3 valueTransformerName];
  objc_opt_self();
  if (!v7 || (uint64_t v8 = [MEMORY[0x189607B20] valueTransformerForName:v7]) == 0)
  {
    uint64_t v9 = (void *)[MEMORY[0x189607B20] valueTransformerForName:*MEMORY[0x1896075D0]];
    goto LABEL_6;
  }

  uint64_t v9 = (void *)v8;
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:
    uint64_t v10 = (void *)[v9 reverseTransformedValue:a2];
    goto LABEL_7;
  }

  uint64_t v10 = (void *)[v9 transformedValue:a2];
LABEL_7:
  id v11 = v10;
  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (void)getIndexes:(void *)a3 fromCollection:(void *)a4 forObjectsInCollection:
{
  v50[128] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if ([a4 count])
  {
    uint64_t v7 = [a3 count];
    uint64_t v32 = &v31;
    unint64_t v8 = MEMORY[0x1895F8858](v7);
    id v11 = (const void **)((char *)&v31 - v10);
    size_t v12 = 8 * v9;
    unint64_t v31 = v8;
    if (v8 > 0x200)
    {
      id v11 = (const void **)NSAllocateScannedUncollectable();
      uint64_t v34 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v31 - v10, 8 * v9);
      MEMORY[0x1895F8858](v13);
      uint64_t v34 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v34, v12);
    }

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16, v31, v32);
    __int16 v33 = v11;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0LL;
      uint64_t v17 = *(void *)v44;
      do
      {
        uint64_t v18 = 0LL;
        uint64_t v19 = (char *)&v11[v16];
        uint64_t v20 = &v34[8 * v16];
        do
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * v18);
          *(void *)&v20[8 * v18] = v16 + v18 + 1;
          *(void *)&v19[8 * v18++] = v21;
        }

        while (v15 != v18);
        uint64_t v15 = [a3 countByEnumeratingWithState:&v43 objects:v49 count:16];
        v16 += v18;
        id v11 = v33;
      }

      while (v15);
    }

    memset(v42, 0, sizeof(v42));
    [a4 countByEnumeratingWithState:v42 objects:&v48 count:16];
    unint64_t v22 = v31;
    uint64_t v23 = _PFStackAllocatorCreate(v50, 1024LL);
    memset(v39, 0, sizeof(v39));
    __int128 v40 = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
    uint64_t v41 = *(void *)(MEMORY[0x189605240] + 40LL);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v24 = 0LL;
    }
    else {
      uint64_t v24 = (const CFDictionaryKeyCallBacks *)v39;
    }
    uint64_t v25 = CFDictionaryCreate(v23, v11, (const void **)v34, v22, v24, 0LL);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v26 = [a4 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      int v28 = 0;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v27; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(a4);
          }
          *(_DWORD *)(a2 + 4LL * (v28 + i)) = CFDictionaryGetValue( v25,  *(const void **)(*((void *)&v35 + 1)
                                                                                           + 8 * i))
                                                          - 1;
        }

        uint64_t v27 = [a4 countByEnumeratingWithState:&v35 objects:v47 count:16];
        v28 += i;
      }

      while (v27);
    }

    if (v22 >= 0x201)
    {
      NSZoneFree(0LL, v34);
      NSZoneFree(0LL, v33);
    }

    if (v50[3])
    {
      if (v25) {
        CFRelease(v25);
      }
    }
  }

+ (uint64_t)newMutableOrderedSetFromCollection:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v3 = [a2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v3 > 0x200) {
    uint64_t v7 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v5);
  }
  [a2 getObjects:v7];
  uint64_t v8 = [objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v8;
}

+ (uint64_t)newArrayOfObjectIDsFromCollection:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v3 = [a2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v3 >= 0x201)
  {
    uint64_t v7 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v7];
  }

  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v5);
    [a2 getObjects:v7];
    if (!v4) {
      goto LABEL_13;
    }
  }

  uint64_t v8 = 0LL;
  do
  {
    *(void *)&v7[8 * v8] = [*(id *)&v7[8 * v8] objectID];
    ++v8;
  }

  while (v4 != v8);
LABEL_13:
  uint64_t v9 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v9;
}

+ (uint64_t)newSetOfObjectIDsFromCollection:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v3 = [a2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v3 >= 0x201)
  {
    uint64_t v7 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v7];
  }

  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v5);
    [a2 getObjects:v7];
    if (!v4) {
      goto LABEL_13;
    }
  }

  uint64_t v8 = 0LL;
  do
  {
    *(void *)&v7[8 * v8] = [*(id *)&v7[8 * v8] objectID];
    ++v8;
  }

  while (v4 != v8);
LABEL_13:
  uint64_t v9 = [objc_alloc(MEMORY[0x189604010]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v9;
}

+ (uint64_t)_objectsInOrderedCollection:(void *)a3 formSubstringInOrderedCollection:
{
  uint64_t v5 = [a2 count];
  uint64_t v6 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(a2, "firstObject"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  uint64_t v7 = v6;
  unint64_t v8 = [a2 count] + v6;
  if (v8 > [a3 count]) {
    return 0LL;
  }
  uint64_t v10 = [a2 count];
  if (!v10) {
    return 1LL;
  }
  unint64_t v11 = v10;
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 0), "isEqual:", objc_msgSend(a3, "objectAtIndex:", v7));
  if ((_DWORD)result)
  {
    uint64_t v12 = 1LL;
    do
    {
      unint64_t v13 = v12;
      if (v11 == v12) {
        break;
      }
      int v14 = objc_msgSend( (id)objc_msgSend(a2, "objectAtIndex:", v12),  "isEqual:",  objc_msgSend(a3, "objectAtIndex:", v7 + v12));
      uint64_t v12 = v13 + 1;
    }

    while (v14);
    return v13 >= v11;
  }

  return result;
}

+ (uint64_t)newOrderedSetFromCollection:(void *)a3 byInsertingItems:(uint64_t)a4 atIndex:
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if ([a3 count])
  {
    uint64_t v7 = [a2 count];
    unint64_t v8 = [a3 count];
    unint64_t v9 = [a2 count];
    unint64_t v10 = v9;
    if (v9 <= 1) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v9;
    }
    if (v9 >= 0x201) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = v11;
    }
    unint64_t v13 = (char *)v30 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v9 > 0x200) {
      unint64_t v13 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v30 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v11);
    }
    unint64_t v17 = v7 + v8 + 1;
    if (v17 > 1) {
      uint64_t v18 = v7 + v8 + 1;
    }
    else {
      uint64_t v18 = 1LL;
    }
    if (v17 >= 0x201) {
      uint64_t v19 = 1LL;
    }
    else {
      uint64_t v19 = v18;
    }
    uint64_t v20 = (char *)v30 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v30[1] = v30;
    unint64_t v31 = v7 + v8 + 1;
    unint64_t v32 = v10;
    if (v17 > 0x200) {
      uint64_t v20 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v30 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v18);
    }
    if (v8 <= 1) {
      uint64_t v21 = 1LL;
    }
    else {
      uint64_t v21 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v22 = 1LL;
    }
    else {
      uint64_t v22 = v21;
    }
    uint64_t v23 = (char *)v30 - ((8 * v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v8 > 0x200) {
      uint64_t v23 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v30 - ((8 * v22 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v21);
    }
    uint64_t v33 = v7;
    [a2 getObjects:v13];
    [a3 getObjects:v23];
    memmove(v20, v13, 8 * a4);
    if (v8)
    {
      int v24 = 0;
      uint64_t v25 = v23;
      unint64_t v26 = v8;
      uint64_t v27 = a4;
      do
      {
        if (([a2 containsObject:*(void *)v25] & 1) == 0)
        {
          *(void *)&v20[8 * a4++] = *(void *)v25;
          ++v24;
        }

        v25 += 8;
        --v26;
      }

      while (v26);
    }

    else
    {
      uint64_t v27 = a4;
      int v24 = 0;
    }

    uint64_t v28 = v33;
    if (v33 != v27) {
      memmove(&v20[8 * v24 + 8 * v27], &v13[8 * v27], 8 * (v33 - v27));
    }
    uint64_t v29 = [objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v20 count:v28 + v24];
    if (v32 >= 0x201) {
      NSZoneFree(0LL, v13);
    }
    if (v31 >= 0x201) {
      NSZoneFree(0LL, v20);
    }
    if (v8 >= 0x201) {
      NSZoneFree(0LL, v23);
    }
    return v29;
  }

  else
  {
    int v14 = [a2 isNSArray];
    id v15 = objc_alloc(MEMORY[0x189603FD0]);
    if (v14) {
      return [v15 initWithArray:a2];
    }
    else {
      return [v15 initWithOrderedSet:a2];
    }
  }

+ (id)newCollection:(void *)a3 fromCollection:(void *)a4 byAddingItems:
{
  v56[128] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v7 = [a3 count];
  unint64_t v8 = [a4 count] + v7;
  if (!v8) {
    return objc_alloc_init(a2);
  }
  if (a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = (void *)NSSet_EmptySet;
  }
  MEMORY[0x1895F8858]();
  uint64_t v11 = (char *)&v33 - v10;
  if (v8 > 0x200) {
    uint64_t v11 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v33 - v10, 8 * v8);
  }
  if ([a4 count])
  {
    __int128 v36 = &v33;
    MEMORY[0x1895F8858]();
    id v15 = (const void **)((char *)&v33 - v14);
    if (v7 > 0x200) {
      id v15 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v33 - v14, 8 * v13);
    }
    memset(v52, 0, sizeof(v52));
    if ([a4 countByEnumeratingWithState:v52 objects:&v55 count:16]) {
      uint64_t v35 = *(void *)v52[1];
    }
    else {
      uint64_t v35 = 0LL;
    }
    __int128 v40 = v15;
    unint64_t v37 = v8;
    __int128 v38 = &v33;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    uint64_t v17 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
    unint64_t v39 = v7;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v34 = a2;
      unint64_t v16 = 0LL;
      uint64_t v19 = *(void *)v49;
      do
      {
        uint64_t v20 = 0LL;
        uint64_t v21 = &v40[v16];
        do
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v9);
          }
          uint64_t v22 = *(const void **)(*((void *)&v48 + 1) + 8 * v20);
          *(void *)&v11[8 * v16 + 8 * v20] = v22;
          v21[v20++] = v22;
        }

        while (v18 != v20);
        uint64_t v18 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
        v16 += v20;
      }

      while (v18);
      a2 = v34;
      unint64_t v7 = v39;
    }

    else
    {
      unint64_t v16 = 0LL;
    }

    uint64_t v23 = _PFStackAllocatorCreate(v56, 1024LL);
    uint64_t v24 = *MEMORY[0x189605258];
    v45[1] = 0LL;
    v45[2] = 0LL;
    v45[0] = v24;
    __int128 v46 = *(_OWORD *)(MEMORY[0x189605258] + 24LL);
    uint64_t v47 = *(void *)(MEMORY[0x189605258] + 40LL);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v25 = 0LL;
    }
    else {
      uint64_t v25 = (const CFSetCallBacks *)v45;
    }
    unint64_t v26 = CFSetCreate(v23, v40, v7, v25);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v27 = [a4 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (uint64_t i = 0LL; i != v28; ++i)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(a4);
          }
          unint64_t v31 = *(const void **)(*((void *)&v41 + 1) + 8 * i);
          if (!CFSetGetValue(v26, v31)) {
            *(void *)&v11[8 * v16++] = v31;
          }
        }

        uint64_t v28 = [a4 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }

      while (v28);
    }

    if (v39 >= 0x201) {
      NSZoneFree(0LL, v40);
    }
    unint64_t v8 = v37;
    if (v56[3])
    {
      if (v26) {
        CFRelease(v26);
      }
    }

    else
    {
      v56[1] = v56[0];
    }
  }

  else
  {
    [v9 getObjects:v11];
    unint64_t v16 = v8;
  }

  uint64_t v32 = [[a2 alloc] initWithObjects:v11 count:v16];
  if (v8 >= 0x201) {
    NSZoneFree(0LL, v11);
  }
  return (id)v32;
}

+ (id)newOrderedSetFromCollection:(void *)a3 byAddingItems:
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines newCollection:fromCollection:byAddingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v5, a2, a3);
}

+ (id)newSetFromCollection:(void *)a3 byAddingItems:
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines newCollection:fromCollection:byAddingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v5, a2, a3);
}

+ (id)newOrderedSetFromCollection:(void *)a3 byRemovingItems:
{
  _BYTE v49[128] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v5 = [a3 count];
  uint64_t v6 = [a2 count];
  if (!v6) {
    return objc_alloc_init(MEMORY[0x189603FD0]);
  }
  unint64_t v7 = v6;
  unint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v32 - v9;
  if (v8 > 0x200)
  {
    uint64_t v11 = NSAllocateScannedUncollectable();
    uint64_t v10 = (char *)v11;
    if (v5) {
      goto LABEL_4;
    }
  }

  else
  {
    bzero((char *)v32 - v9, 8 * v8);
    if (v5)
    {
LABEL_4:
      MEMORY[0x1895F8858](v11);
      unint64_t v33 = v7;
      unint64_t v34 = v5;
      v32[2] = v13;
      if (v5 > 0x200)
      {
        uint64_t v35 = (const void **)NSAllocateScannedUncollectable();
      }

      else
      {
        uint64_t v35 = (const void **)((char *)v32 - v12);
        bzero((char *)v32 - v12, 8 * v5);
      }

      v32[1] = v32;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      uint64_t v16 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 0LL;
        uint64_t v19 = *(void *)v44;
        do
        {
          uint64_t v20 = 0LL;
          uint64_t v21 = &v35[v18];
          do
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(a3);
            }
            v21[v20] = *(const void **)(*((void *)&v43 + 1) + 8 * v20);
            ++v20;
          }

          while (v17 != v20);
          uint64_t v17 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
          v18 += v20;
        }

        while (v17);
      }

      uint64_t v22 = _PFStackAllocatorCreate(v49, 1024LL);
      uint64_t v23 = *MEMORY[0x189605258];
      v40[1] = 0LL;
      v40[2] = 0LL;
      v40[0] = v23;
      __int128 v41 = *(_OWORD *)(MEMORY[0x189605258] + 24LL);
      uint64_t v42 = *(void *)(MEMORY[0x189605258] + 40LL);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v24 = 0LL;
      }
      else {
        uint64_t v24 = (const CFSetCallBacks *)v40;
      }
      uint64_t v25 = CFSetCreate(v22, v35, v34, v24);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v26 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        unint64_t v15 = 0LL;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t i = 0LL; i != v27; ++i)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(a2);
            }
            id v30 = *(const void **)(*((void *)&v36 + 1) + 8 * i);
            if (!CFSetGetValue(v25, v30)) {
              *(void *)&v10[8 * v15++] = v30;
            }
          }

          uint64_t v27 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
        }

        while (v27);
      }

      else
      {
        unint64_t v15 = 0LL;
      }

      if (v34 >= 0x201) {
        NSZoneFree(0LL, v35);
      }
      unint64_t v7 = v33;
      if (v49[3])
      {
        if (v25) {
          CFRelease(v25);
        }
      }

      else
      {
        v49[1] = v49[0];
      }

      goto LABEL_37;
    }
  }

  [a2 getObjects:v10];
  unint64_t v15 = v7;
LABEL_37:
  uint64_t v31 = [objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v10 count:v15];
  if (v7 >= 0x201) {
    NSZoneFree(0LL, v10);
  }
  return (id)v31;
}

+ (id)newMutableSetFromCollection:(void *)a3 byRemovingItems:
{
  _BYTE v49[128] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v5 = [a3 count];
  uint64_t v6 = [a2 count];
  if (!v6) {
    return objc_alloc_init(MEMORY[0x189603FE0]);
  }
  unint64_t v7 = v6;
  unint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v32 - v9;
  if (v8 > 0x200)
  {
    uint64_t v11 = NSAllocateScannedUncollectable();
    uint64_t v10 = (char *)v11;
    if (v5) {
      goto LABEL_4;
    }
  }

  else
  {
    bzero((char *)v32 - v9, 8 * v8);
    if (v5)
    {
LABEL_4:
      MEMORY[0x1895F8858](v11);
      unint64_t v33 = v7;
      unint64_t v34 = v5;
      v32[2] = v13;
      if (v5 > 0x200)
      {
        uint64_t v35 = (const void **)NSAllocateScannedUncollectable();
      }

      else
      {
        uint64_t v35 = (const void **)((char *)v32 - v12);
        bzero((char *)v32 - v12, 8 * v5);
      }

      v32[1] = v32;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      uint64_t v16 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 0LL;
        uint64_t v19 = *(void *)v44;
        do
        {
          uint64_t v20 = 0LL;
          uint64_t v21 = &v35[v18];
          do
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(a3);
            }
            v21[v20] = *(const void **)(*((void *)&v43 + 1) + 8 * v20);
            ++v20;
          }

          while (v17 != v20);
          uint64_t v17 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
          v18 += v20;
        }

        while (v17);
      }

      uint64_t v22 = _PFStackAllocatorCreate(v49, 1024LL);
      uint64_t v23 = *MEMORY[0x189605258];
      v40[1] = 0LL;
      v40[2] = 0LL;
      v40[0] = v23;
      __int128 v41 = *(_OWORD *)(MEMORY[0x189605258] + 24LL);
      uint64_t v42 = *(void *)(MEMORY[0x189605258] + 40LL);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v24 = 0LL;
      }
      else {
        uint64_t v24 = (const CFSetCallBacks *)v40;
      }
      uint64_t v25 = CFSetCreate(v22, v35, v34, v24);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v26 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        unint64_t v15 = 0LL;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t i = 0LL; i != v27; ++i)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(a2);
            }
            id v30 = *(const void **)(*((void *)&v36 + 1) + 8 * i);
            if (!CFSetGetValue(v25, v30)) {
              *(void *)&v10[8 * v15++] = v30;
            }
          }

          uint64_t v27 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
        }

        while (v27);
      }

      else
      {
        unint64_t v15 = 0LL;
      }

      if (v34 >= 0x201) {
        NSZoneFree(0LL, v35);
      }
      unint64_t v7 = v33;
      if (v49[3])
      {
        if (v25) {
          CFRelease(v25);
        }
      }

      else
      {
        v49[1] = v49[0];
      }

      goto LABEL_37;
    }
  }

  [a2 getObjects:v10];
  unint64_t v15 = v7;
LABEL_37:
  uint64_t v31 = [objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v10 count:v15];
  if (v7 >= 0x201) {
    NSZoneFree(0LL, v10);
  }
  return (id)v31;
}

+ (id)newMutableSetFromCollection:(void *)a3 byIntersectingWithCollection:
{
  v51[128] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v5 = [a2 count];
  uint64_t v6 = [a3 count];
  if (!v5) {
    return objc_alloc_init(MEMORY[0x189603FE0]);
  }
  unint64_t v7 = v6;
  if (!v6) {
    return objc_alloc_init(MEMORY[0x189603FE0]);
  }
  uint64_t v34 = (uint64_t)&v34;
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v34 - v8;
  if (v5 > 0x200)
  {
    uint64_t v10 = NSAllocateScannedUncollectable();
    uint64_t v9 = (char *)v10;
  }

  else
  {
    bzero((char *)&v34 - v8, 8 * v5);
  }

  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (const void **)((char *)&v34 - v12);
  if (v7 > 0x200) {
    uint64_t v13 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v34 - v12, 8 * v7);
  }
  unint64_t v35 = v7;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  uint64_t v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v50, 16, v34);
  unint64_t v36 = v5;
  __int128 v37 = v13;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0LL;
    uint64_t v17 = *(void *)v46;
    do
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = (char *)&v13[v16];
      do
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(a3);
        }
        *(void *)&v19[8 * v18] = *(void *)(*((void *)&v45 + 1) + 8 * v18);
        ++v18;
      }

      while (v15 != v18);
      uint64_t v15 = [a3 countByEnumeratingWithState:&v45 objects:v50 count:16];
      v16 += v18;
      uint64_t v13 = v37;
    }

    while (v15);
  }

  uint64_t v20 = _PFStackAllocatorCreate(v51, 1024LL);
  uint64_t v21 = *MEMORY[0x189605258];
  v42[1] = 0LL;
  v42[2] = 0LL;
  v42[0] = v21;
  __int128 v43 = *(_OWORD *)(MEMORY[0x189605258] + 24LL);
  uint64_t v44 = *(void *)(MEMORY[0x189605258] + 40LL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = (const CFSetCallBacks *)v42;
  }
  uint64_t v23 = v13;
  unint64_t v24 = v35;
  uint64_t v25 = CFSetCreate(v20, v23, v35, v22);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v26 = [a2 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = 0LL;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(a2);
        }
        uint64_t v31 = *(const void **)(*((void *)&v38 + 1) + 8 * i);
        if (CFSetGetValue(v25, v31)) {
          *(void *)&v9[8 * v28++] = v31;
        }
      }

      uint64_t v27 = [a2 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }

    while (v27);
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  if (v24 >= 0x201) {
    NSZoneFree(0LL, v37);
  }
  unint64_t v32 = v36;
  if (v51[3])
  {
    if (v25) {
      CFRelease(v25);
    }
  }

  else
  {
    v51[1] = v51[0];
  }

  uint64_t v33 = [objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v9 count:v28];
  if (v32 >= 0x201) {
    NSZoneFree(0LL, v9);
  }
  return (id)v33;
}

+ (id)newMutableArrayFromCollection:(void *)a3 byRemovingItems:
{
  _BYTE v49[128] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v5 = [a3 count];
  uint64_t v6 = [a2 count];
  if (!v6) {
    return objc_alloc_init(MEMORY[0x189603FA8]);
  }
  unint64_t v7 = v6;
  unint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v32 - v9;
  if (v8 > 0x200)
  {
    uint64_t v11 = NSAllocateScannedUncollectable();
    uint64_t v10 = (char *)v11;
    if (v5) {
      goto LABEL_4;
    }
  }

  else
  {
    bzero((char *)v32 - v9, 8 * v8);
    if (v5)
    {
LABEL_4:
      MEMORY[0x1895F8858](v11);
      unint64_t v33 = v7;
      unint64_t v34 = v5;
      v32[2] = v13;
      if (v5 > 0x200)
      {
        unint64_t v35 = (const void **)NSAllocateScannedUncollectable();
      }

      else
      {
        unint64_t v35 = (const void **)((char *)v32 - v12);
        bzero((char *)v32 - v12, 8 * v5);
      }

      v32[1] = v32;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      uint64_t v16 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 0LL;
        uint64_t v19 = *(void *)v44;
        do
        {
          uint64_t v20 = 0LL;
          uint64_t v21 = &v35[v18];
          do
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(a3);
            }
            v21[v20] = *(const void **)(*((void *)&v43 + 1) + 8 * v20);
            ++v20;
          }

          while (v17 != v20);
          uint64_t v17 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
          v18 += v20;
        }

        while (v17);
      }

      uint64_t v22 = _PFStackAllocatorCreate(v49, 1024LL);
      uint64_t v23 = *MEMORY[0x189605258];
      v40[1] = 0LL;
      v40[2] = 0LL;
      v40[0] = v23;
      __int128 v41 = *(_OWORD *)(MEMORY[0x189605258] + 24LL);
      uint64_t v42 = *(void *)(MEMORY[0x189605258] + 40LL);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        unint64_t v24 = 0LL;
      }
      else {
        unint64_t v24 = (const CFSetCallBacks *)v40;
      }
      uint64_t v25 = CFSetCreate(v22, v35, v34, v24);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v26 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        unint64_t v15 = 0LL;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t i = 0LL; i != v27; ++i)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(a2);
            }
            id v30 = *(const void **)(*((void *)&v36 + 1) + 8 * i);
            if (!CFSetGetValue(v25, v30)) {
              *(void *)&v10[8 * v15++] = v30;
            }
          }

          uint64_t v27 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
        }

        while (v27);
      }

      else
      {
        unint64_t v15 = 0LL;
      }

      if (v34 >= 0x201) {
        NSZoneFree(0LL, v35);
      }
      unint64_t v7 = v33;
      if (v49[3])
      {
        if (v25) {
          CFRelease(v25);
        }
      }

      else
      {
        v49[1] = v49[0];
      }

      goto LABEL_37;
    }
  }

  [a2 getObjects:v10];
  unint64_t v15 = v7;
LABEL_37:
  uint64_t v31 = [objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v10 count:v15];
  if (v7 >= 0x201) {
    NSZoneFree(0LL, v10);
  }
  return (id)v31;
}

+ (id)_newCollectionFromCollection:(uint64_t)a3 forParentContext:(objc_class *)a4 andClass:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v7 = [a2 count];
  if (!v7) {
    return objc_alloc_init(a4);
  }
  unint64_t v8 = v7;
  if (v7 >= 0x201) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = v7;
  }
  unint64_t v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v11 = (char *)v21 - v10;
  if (v7 > 0x200) {
    uint64_t v11 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v21 - v10, 8 * v7);
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  uint64_t v13 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v21[1] = v21;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(a2);
        }
        *(void *)&v11[8 * v15 + 8 * i] = _PFRetainedObjectForMappedChildObjectIDInParentContext( (void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) objectID],  a3);
      }

      uint64_t v14 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
      v15 += i;
    }

    while (v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  uint64_t v18 = [[a4 alloc] initWithObjects:v11 count:v15];
  uint64_t v19 = 0LL;
  if (v8 <= 1) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = v8;
  }
  do

  while (v20 != v19);
  if (v8 >= 0x201) {
    NSZoneFree(0LL, v11);
  }
  return (id)v18;
}

+ (id)newMutableArrayFromCollection:(uint64_t)a3 forParentContext:
{
  unint64_t v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]( (uint64_t)&OBJC_CLASS____PFRoutines,  a2,  a3,  v5);
}

+ (id)newMutableSetFromCollection:(uint64_t)a3 forParentContext:
{
  unint64_t v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]( (uint64_t)&OBJC_CLASS____PFRoutines,  a2,  a3,  v5);
}

+ (id)newMutableOrderedSetFromCollection:(uint64_t)a3 forParentContext:
{
  unint64_t v5 = (objc_class *)objc_opt_class();
  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]( (uint64_t)&OBJC_CLASS____PFRoutines,  a2,  a3,  v5);
}

+ (id)_replaceBaseline:(void *)a3 inOrderedSet:(void *)a4 withOrderedSet:
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v7 = [a3 count];
  uint64_t v8 = [a2 count];
  if (!v7)
  {
    else {
      return (id)[objc_alloc(MEMORY[0x189603FD0]) initWithArray:a4];
    }
  }

  uint64_t v9 = v8;
  if (![a4 count])
  {
    if (v9) {
      return +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, a3, a2);
    }
    else {
      return (id)+[_PFRoutines newMutableOrderedSetFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, a3);
    }
  }

  if (!v9)
  {
    uint64_t v19 = a4;
    uint64_t v20 = a3;
    return +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v19, v20);
  }

  uint64_t v10 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(a2, "firstObject"));
  if (!v10)
  {
    uint64_t v20 = (void *)objc_msgSend( a3,  "objectsAtIndexes:",  objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", v9, v7 - v9));
    uint64_t v19 = a4;
    return +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v19, v20);
  }

  uint64_t v11 = v10;
  if (v10 + v9 == v7)
  {
    unint64_t v12 = v7 - v9;
    uint64_t v13 = [a4 count];
    unint64_t v14 = v13 + v12;
    MEMORY[0x1895F8858](v13);
    uint64_t v17 = (char *)&v36 - v16;
    if (v14 > 0x200) {
      uint64_t v17 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v36 - v16, 8 * v15);
    }
    objc_msgSend(a3, "getObjects:range:", v17, 0, v12);
    __int128 v23 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v17 count:v12];
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    uint64_t v24 = [a4 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v25; ++i)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(a4);
          }
          uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (([v23 containsObject:v28] & 1) == 0) {
            *(void *)&v17[8 * v12++] = v28;
          }
        }

        uint64_t v25 = [a4 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }

      while (v25);
    }

    uint64_t v29 = [objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v17 count:v12];
    if (v14 >= 0x201) {
      NSZoneFree(0LL, v17);
    }
  }

  else
  {
    MEMORY[0x1895F8858](v10);
    __int128 v22 = (char *)&v36 - v21;
    if (v7 > 0x200) {
      __int128 v22 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v36 - v21, 8 * v7);
    }
    [a3 getObjects:v22];
    id v30 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v22 count:v7];
    if (v7 >= 0x201) {
      NSZoneFree(0LL, v22);
    }
    uint64_t v31 = objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", v11, v9);
    if (v9 == [a4 count])
    {
      if (([a4 isNSArray] & 1) == 0) {
        a4 = (void *)[a4 array];
      }
      [v30 replaceObjectsAtIndexes:v31 withObjects:a4];
    }

    else
    {
      [v30 removeObjectsAtIndexes:v31];
      uint64_t v32 = [a4 count];
      uint64_t v33 = objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", v11, v32);
      if ([a4 isNSArray])
      {
        unint64_t v34 = v30;
        uint64_t v35 = (uint64_t)a4;
      }

      else
      {
        uint64_t v35 = [a4 array];
        unint64_t v34 = v30;
      }

      [v34 insertObjects:v35 atIndexes:v33];
    }

    uint64_t v29 = [objc_alloc(MEMORY[0x189603FD0]) initWithArray:v30];
  }

  return (id)v29;
}

+ (uint64_t)_expressionIsCompoundIndexCompatible:(uint64_t)a1
{
  uint64_t result = [a2 expressionType];
  if (result != 1)
  {
    if (result == 3)
    {
      uint64_t v4 = [a2 keyPath];
      return [@"self" caseInsensitiveCompare:v4]
          || [@"self" caseInsensitiveCompare:v4] != 0;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

+ (__CFDictionary)_createDictionaryPartitioningObjects:(id)a3 intoHierarchies:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  memset(&callBacks, 0, sizeof(callBacks));
  callBacks.copyDescriptiouint64_t n = *(CFSetCopyDescriptionCallBack *)(MEMORY[0x189605258] + 24LL);
  memset(&keyCallBacks, 0, 24);
  *(_OWORD *)&keyCallBacks.copyDescriptiouint64_t n = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
  keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x189605240] + 40LL);
  valueCallBacks.versiouint64_t n = 0LL;
  *(_OWORD *)&valueCallBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605250] + 8LL);
  valueCallBacks.copyDescriptiouint64_t n = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x189605250] + 24LL);
  valueCallBacks.equal = 0LL;
  uint64_t v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &keyCallBacks, &valueCallBacks);
  CFIndex v7 = [a3 count];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = [v12 entity];
        if (v4)
        {
          if (v13)
          {
            if ((*(_BYTE *)(v13 + 120) & 4) != 0)
            {
              unint64_t v14 = *(const void **)(v13 + 72);
            }

            else
            {
              do
              {
                unint64_t v14 = (const void *)v13;
                uint64_t v13 = [(id)v13 superentity];
              }

              while (v13);
            }
          }

          else
          {
            unint64_t v14 = 0LL;
          }
        }

        else
        {
          unint64_t v14 = (const void *)v13;
        }

        Value = (void *)CFDictionaryGetValue(v6, v14);
        if (!Value)
        {
          Value = CFSetCreateMutable(0LL, v7, &callBacks);
          CFDictionarySetValue(v6, v14, Value);
          CFRelease(Value);
        }

        CFSetAddValue((CFMutableSetRef)Value, v12);
        ++v11;
      }

      while (v11 != v9);
      uint64_t v16 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
      uint64_t v9 = v16;
    }

    while (v16);
  }

  return v6;
}

+ (__CFDictionary)_createDictionaryPartitioningObjectIDs:(id)a3 intoHierarchies:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  memset(&callBacks, 0, sizeof(callBacks));
  callBacks.copyDescriptiouint64_t n = *(CFSetCopyDescriptionCallBack *)(MEMORY[0x189605258] + 24LL);
  memset(&keyCallBacks, 0, 24);
  *(_OWORD *)&keyCallBacks.copyDescriptiouint64_t n = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
  keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x189605240] + 40LL);
  valueCallBacks.versiouint64_t n = 0LL;
  *(_OWORD *)&valueCallBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605250] + 8LL);
  valueCallBacks.copyDescriptiouint64_t n = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x189605250] + 24LL);
  valueCallBacks.equal = 0LL;
  uint64_t v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &keyCallBacks, &valueCallBacks);
  CFIndex v7 = [a3 count];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = [v12 entity];
        if (v4)
        {
          if (v13)
          {
            if ((*(_BYTE *)(v13 + 120) & 4) != 0)
            {
              unint64_t v14 = *(const void **)(v13 + 72);
            }

            else
            {
              do
              {
                unint64_t v14 = (const void *)v13;
                uint64_t v13 = [(id)v13 superentity];
              }

              while (v13);
            }
          }

          else
          {
            unint64_t v14 = 0LL;
          }
        }

        else
        {
          unint64_t v14 = (const void *)v13;
        }

        Value = (void *)CFDictionaryGetValue(v6, v14);
        if (!Value)
        {
          Value = CFSetCreateMutable(0LL, v7, &callBacks);
          CFDictionarySetValue(v6, v14, Value);
          CFRelease(Value);
        }

        CFSetAddValue((CFMutableSetRef)Value, v12);
        ++v11;
      }

      while (v11 != v9);
      uint64_t v16 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
      uint64_t v9 = v16;
    }

    while (v16);
  }

  return v6;
}

+ (uint64_t)fetchHeterogeneousCollectionByObjectIDs:(uint64_t)a3 intoContext:
{
  unint64_t v5 = +[_PFRoutines _createDictionaryPartitioningObjects:intoHierarchies:]( &OBJC_CLASS____PFRoutines,  "_createDictionaryPartitioningObjects:intoHierarchies:",  a2,  1LL);
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  unint64_t v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  uint64_t v14 = [MEMORY[0x189603FA8] array];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke;
  v8[3] = &unk_189EA7D08;
  v8[4] = a3;
  v8[5] = &v9;
  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (__CFDictionary)createDictionaryPartitioningObjectsByEntity:(uint64_t)a1
{
  return +[_PFRoutines _createDictionaryPartitioningObjects:intoHierarchies:]( &OBJC_CLASS____PFRoutines,  "_createDictionaryPartitioningObjects:intoHierarchies:",  a2,  0LL);
}

+ (__CFDictionary)createDictionaryPartitioningObjectsIDByRootEntity:(uint64_t)a1
{
  return +[_PFRoutines _createDictionaryPartitioningObjectIDs:intoHierarchies:]( &OBJC_CLASS____PFRoutines,  "_createDictionaryPartitioningObjectIDs:intoHierarchies:",  a2,  1LL);
}

+ (BOOL)isSanitizedVersionOf:(void *)a3 equalTo:
{
  unint64_t v5 = (const char *)[a2 UTF8String];
  uint64_t v6 = (const char *)[a3 UTF8String];
  size_t v7 = strlen(v6);
  return strncmp(v5, v6, v7) == 0;
}

+ (uint64_t)sanitize:(uint64_t)a1
{
  return objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(a2, "UTF8String"));
}

+ (void)applicationDeactivateLifecyleNotifications
{
  return &unk_189F0B178;
}

+ (void)applicationActivateLifecyleNotifications
{
  return &unk_189F0B190;
}

+ (void)wrapBlockInGuardedAutoreleasePool:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  (*((void (**)(id))a3 + 2))(a3);
}

+ (void)efficientlyEnumerateManagedObjectsInFetchRequest:(void *)a3 usingManagedObjectContext:(uint64_t)a4 andApplyBlock:
{
  v53[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (![(id)a2 fetchBatchSize]) {
    goto LABEL_25;
  }
  if ([a3 hasChanges])
  {
    uint64_t v6 = objc_msgSend( NSString,  "stringWithUTF8String:",  "Illegal attempt to begin batch processing with pending changes. At best these changes may be saved unpredicta bly (depending on the batching algorithm used and downstream code) leading to inconsistent behavior across pl atforms / datasets. At worst they will be forgotten, and references to them invalidated when the context is r eset between batches. Only call this method on clean contexts.");
    _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v41);
    uint64_t v13 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to begin batch processing with pending changes. At best these changes may be saved unp redictably (depending on the batching algorithm used and downstream code) leading to inconsistent behavior acros s platforms / datasets. At worst they will be forgotten, and references to them invalidated when the context is reset between batches. Only call this method on clean contexts.",  buf,  2u);
    }
  }

  context = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v47 = 0LL;
  char v46 = 0;
  uint64_t v14 = (void *)[a3 queryGenerationToken];
  if (v14 == +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken"))
  {
    uint64_t v15 = [NSString stringWithUTF8String:"Efficient batching requires the use of query generations: %@"];
    _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, a2);
    __int128 v22 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = a2;
      _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Efficient batching requires the use of query generations: %@",  buf,  0xCu);
    }
  }

  buf[0] = 0;
  uint64_t v23 = [a3 executeFetchRequest:a2 error:&v47];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v42 = a2;
    unint64_t v25 = [(id)a2 fetchBatchSize];
    __int128 v44 = v24;
    unint64_t v26 = [v24 count];
    if (v26 / v25 * v25 == v26) {
      a2 = v26 / v25;
    }
    else {
      a2 = v26 / v25 + 1;
    }
    if (a2)
    {
      unint64_t v27 = v26;
      uint64_t v28 = 0LL;
      uint64_t v29 = 0LL;
      unint64_t v30 = v25;
      do
      {
        if (v27 >= v30) {
          unint64_t v31 = v30;
        }
        else {
          unint64_t v31 = v27;
        }
        uint64_t v32 = a3;
        uint64_t v33 = v31 + v28;
        unint64_t v34 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v35 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v36 = v33;
        a3 = v32;
        (*(void (**)(uint64_t, uint64_t, void, char *, uint8_t *))(a4 + 16))( a4,  objc_msgSend(v44, "subarrayWithRange:", v29, v36),  0,  &v46,  buf);
        objc_autoreleasePoolPop(v35);
        if (!v46 && [v32 hasChanges])
        {
          __int128 v37 = (void *)MEMORY[0x189603F70];
          uint64_t v38 = *MEMORY[0x189603A60];
          __int128 v48 = @"offendingFetch";
          uint64_t v49 = v42;
          uint64_t v39 = [MEMORY[0x189603F68] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          for (uint64_t i = @"Batch finished processing with pending changes in the moc. This prevents the context from being reset and purging rows / snapshots from memory. Please save at the end of each batch.";
                ;
                uint64_t i = @"This method can't be very efficient if you don't bother to set a batch size!")
          {
            objc_exception_throw((id)[v37 exceptionWithName:v38 reason:i userInfo:v39]);
LABEL_25:
            __int128 v37 = (void *)MEMORY[0x189603F70];
            uint64_t v38 = *MEMORY[0x189603A60];
            uint64_t v52 = @"offendingFetch";
            v53[0] = a2;
            uint64_t v39 = [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:&v52 count:1];
          }
        }

        [v32 reset];
        objc_autoreleasePoolPop(v34);
        v29 += v25;
        v30 += v25;
        v28 -= v25;
        --a2;
      }

      while (a2);
    }
  }

  else
  {
    (*(void (**)(uint64_t, void, uint64_t, char *, uint8_t *))(a4 + 16))(a4, 0LL, v47, &v46, buf);
    char v46 = 1;
  }

  [a3 reset];
  objc_autoreleasePoolPop(context);
}

@end