@interface NSBinaryObjectStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (uint64_t)_classesForPropertyValues;
- (NSBinaryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)type;
- (void)saveDocumentToPath:(id)a3;
@end

@implementation NSBinaryObjectStore

+ (uint64_t)_classesForPropertyValues
{
  if (!_classesForPropertyValues_expectedClasses)
  {
    v0 = (void *)[(id)+[_PFRoutines attributeClassesForSecureCoding]() mutableCopy];
    [v0 addObject:objc_opt_class()];
    while (!__ldaxr((unint64_t *)&_classesForPropertyValues_expectedClasses))
    {
    }

    __clrex();
  }

  return _classesForPropertyValues_expectedClasses;
}

- (NSBinaryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  if (!a5)
  {

    v25 = (void *)MEMORY[0x189603F70];
    uint64_t v26 = *MEMORY[0x189603A60];
    v27 = @"Cannot create a binary store with a nil URL.";
LABEL_29:
    objc_exception_throw((id)[v25 exceptionWithName:v26 reason:v27 userInfo:0]);
    goto LABEL_30;
  }

  if (([a5 isFileURL] & 1) == 0)
  {
    v28 = (void *)MEMORY[0x189603F70];
    uint64_t v29 = *MEMORY[0x189603A60];
    v27 = (const __CFString *)[NSString stringWithFormat:@"CoreData binary stores only support file URLs (got %@).", a5];
    v25 = v28;
    uint64_t v26 = v29;
    goto LABEL_29;
  }

  id v44 = 0LL;
  __int16 v43 = 0;
  if (!+[NSPersistentStore doURLStuff:createdStubFile:readOnly:error:options:]( &OBJC_CLASS___NSPersistentStore,  "doURLStuff:createdStubFile:readOnly:error:options:",  a5,  (char *)&v43 + 1,  &v43,  &v44,  a6))
  {
LABEL_30:

    uint64_t v30 = *MEMORY[0x189603A60];
    uint64_t v31 = [v44 code];
    v32 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v44,  @"NSUnderlyingException",  0);
    v33 = @"Error validating url for store";
    uint64_t v34 = v30;
    uint64_t v35 = v31;
    goto LABEL_36;
  }

  if ((_BYTE)v43
    && (objc_msgSend((id)objc_msgSend(a6, "valueForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue") & 1) == 0)
  {
    if ([a6 valueForKey:@"NSReadOnlyPersistentStoreOption"]) {
      BOOL v11 = BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88) == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      uint64_t v38 = *MEMORY[0x189603A60];
      if (v44) {
        v32 = (void *)[MEMORY[0x189603F68] dictionaryWithObject:v44 forKey:*MEMORY[0x189607798]];
      }
      else {
        v32 = 0LL;
      }
      v33 = @"Attempt to add read-only store read-write";
      uint64_t v34 = v38;
      uint64_t v35 = 513LL;
LABEL_36:
      id v39 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v34,  v35,  (uint64_t)v33,  v32);
      objc_exception_throw(v39);
      v41 = v40;
      objc_end_catch();
      _Unwind_Resume(v41);
    }

    if (a6)
    {
      a6 = (id)[a6 mutableCopy];
      objc_msgSend( a6,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption");
    }

    else
    {
      a6 = (id)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption");
    }

    _NSCoreDataLog( 2LL,  (uint64_t)@"Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption.",
      v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      (uint64_t)a5);
  }

  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___NSBinaryObjectStore;
  v18 = -[NSMappedObjectStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( &v42,  sel_initWithPersistentStoreCoordinator_configurationName_URL_options_,  a3,  a4,  a5,  a6);
  v19 = v18;
  if (!v18) {
    return v19;
  }
  if (HIBYTE(v43))
  {
    -[NSPersistentStore _setMetadataDirty:](v18, "_setMetadataDirty:", 1LL);
    -[NSPersistentStore doFilesystemCleanupOnRemove:](v19, "doFilesystemCleanupOnRemove:", 1LL);
  }

  id v20 = objc_alloc_init(MEMORY[0x1896077E8]);
  if ([a5 isFileURL])
  {
    if (stat((const char *)objc_msgSend((id)objc_msgSend(a5, "path"), "fileSystemRepresentation"), &v45)
      || v45.st_size < 1)
    {
      v21 = -[NSDictionaryStoreMap initWithStore:]( objc_alloc(&OBJC_CLASS___NSDictionaryStoreMap),  "initWithStore:",  v19);
    }

    else
    {
      v21 = -[NSDictionaryStoreMap initWithStore:fromPath:]( [NSDictionaryStoreMap alloc],  "initWithStore:fromPath:",  v19,  [a5 path]);
    }

    v22 = v21;
    if (v21) {
      -[NSMappedObjectStore _setMap:](v19, v21);
    }
    [v20 drain];

    id v23 = 0LL;
    return v19;
  }

  v36 = (void *)MEMORY[0x189603F70];
  uint64_t v37 = [NSString stringWithFormat:@"NSBinaryObjectStore only supports file URLs right now."];
  objc_exception_throw((id)[v36 exceptionWithName:*MEMORY[0x189603A60] reason:v37 userInfo:0]);
  __break(1u);
  return result;
}

- (void)saveDocumentToPath:(id)a3
{
  v4 = self;
  if (-[NSPersistentStore isReadOnly](self, "isReadOnly"))
  {
    v4 = (NSBinaryObjectStore *)MEMORY[0x189603F70];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Can't save store to %@ (read-only store)", a3), 0 reason userInfo]);
    goto LABEL_6;
  }

  if (!v4)
  {
LABEL_6:
    uint64_t theMap = 0LL;
    goto LABEL_4;
  }

  uint64_t theMap = (uint64_t)v4->super._theMap;
LABEL_4:
  -[NSDictionaryStoreMap saveToPath:](theMap, a3);
  -[NSPersistentStore doFilesystemCleanupOnRemove:](v4, "doFilesystemCleanupOnRemove:", 0LL);
}

- (id)type
{
  return @"Binary";
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)[a1 metadataForPersistentStoreWithURL:a3 options:0 error:a4];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return [a1 setMetadata:a3 forPersistentStoreWithURL:a4 options:0 error:a5];
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (([a3 isFileURL] & 1) == 0)
  {
    if (!a5) {
      return 0LL;
    }
    id v11 = objc_alloc(MEMORY[0x189603F68]);
    v8 = (NSBinaryObjectStoreFile *)objc_msgSend(v11, "initWithObjectsAndKeys:", a3, *MEMORY[0x189607760], 0);
    *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:262 userInfo:v8];
LABEL_20:

    return 0LL;
  }

  uint64_t v17 = 0LL;
  v8 = objc_alloc_init(&OBJC_CLASS___NSBinaryObjectStoreFile);
  if (byte_18C4ABDBC)
  {
    v9 = (void *)[a4 objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
    if (v9) {
      int v10 = [v9 BOOLValue] ^ 1;
    }
    else {
      int v10 = 1;
    }
  }

  else
  {
    int v10 = 0;
  }

  -[NSBinaryObjectStoreFile readMetadataFromFile:securely:error:]((uint64_t)v8, [a3 path], v10, &v17);
  if ((v12 & 1) == 0)
  {
    if (a5) {
      *a5 = v17;
    }
    goto LABEL_20;
  }

  if (v8) {
    fullMetadata = v8->_fullMetadata;
  }
  else {
    fullMetadata = 0LL;
  }
  id v14 = (id)-[NSDictionary copy](fullMetadata, "copy");

  uint64_t v15 = (void *)[v14 objectForKey:@"NSStoreType"];
  if (v14) {
    return v14;
  }
  else {
    return (id)NSDictionary_EmptyDictionary;
  }
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___NSBinaryObjectStore;
  if (byte_18C4ABDBC)
  {
    int v10 = (void *)[a5 objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
    if (v10) {
      int v11 = [v10 BOOLValue] ^ 1;
    }
    else {
      int v11 = 1;
    }
  }

  else
  {
    int v11 = 0;
  }

  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSBinaryObjectStoreFile);
  -[NSBinaryObjectStoreFile readMetadataFromFile:securely:error:]((uint64_t)v13, [a4 path], v11, a6);
  if (!v14)
  {
    BOOL v12 = 0;
    if (!v13) {
      return v12;
    }
LABEL_40:

    return v12;
  }

  uint64_t v15 = (NSDictionary *)[a3 mutableCopy];
  uint64_t v16 = v15;
  if (v13) {
    fullMetadata = v13->_fullMetadata;
  }
  else {
    fullMetadata = 0LL;
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", 0x189EBA2A8LL))
  {
    uint64_t v18 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", 0x189EBA2A8LL);
    if (v18) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v18, 0x189EBA2A8LL);
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", @"NSStoreModelVersionHashes"))
  {
    uint64_t v19 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", @"NSStoreModelVersionHashes");
    if (v19) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v19, @"NSStoreModelVersionHashes");
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", @"NSStoreModelVersionIdentifiers"))
  {
    uint64_t v20 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", @"NSStoreModelVersionIdentifiers");
    if (v20) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v20, @"NSStoreModelVersionIdentifiers");
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", 0x189EB9D88LL))
  {
    uint64_t v21 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", 0x189EB9D88LL);
    if (v21) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v21, 0x189EB9D88LL);
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", @"NSStoreModelVersionChecksumKey"))
  {
    uint64_t v22 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", @"NSStoreModelVersionChecksumKey");
    if (v22) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v22, @"NSStoreModelVersionChecksumKey");
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", @"NSStoreType"))
  {
    uint64_t v23 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", @"NSStoreType");
    if (v23) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v23, @"NSStoreType");
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", @"NSStoreUUID"))
  {
    uint64_t v24 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", @"NSStoreUUID");
    if (v24) {
      -[NSDictionary setObject:forKey:](v16, "setObject:forKey:", v24, @"NSStoreUUID");
    }
  }

  if (!-[NSDictionary objectForKey:](v16, "objectForKey:", 0x189EBA2C8LL)) {
    -[NSDictionary setObject:forKey:]( v16,  "setObject:forKey:",  +[_PFRoutines _getPFBundleVersionNumber](),  0x189EBA2C8LL);
  }
  if (v13 && v13->_fullMetadata != v16)
  {
    uint64_t v25 = -[NSDictionary copy](v16, "copy");

    v13->_fullMetadata = (NSDictionary *)v25;
  }

  BOOL v12 = -[NSBinaryObjectStoreFile writeMetadataToFile:error:](v13, [a4 path], a6);
  if (v13) {
    goto LABEL_40;
  }
  return v12;
}

@end