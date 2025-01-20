@interface NSBinaryObjectStoreFile
- (BOOL)_writeMetadataData:(id)a3 andMapDataData:(id)a4 toFile:(id)a5 error:(id *)a6;
- (BOOL)writeMetadataToFile:(id *)a3 error:;
- (void)clearCurrentValues;
- (void)dealloc;
- (void)readFromFile:(void *)a3 error:;
- (void)readMetadataFromFile:(int)a3 securely:(void *)a4 error:;
- (void)writeToFile:(uint64_t)a3 error:;
@end

@implementation NSBinaryObjectStoreFile

- (void)dealloc
{
  self->_fullMetadata = 0LL;
  self->_mapData = 0LL;

  self->_storeOptions = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBinaryObjectStoreFile;
  -[NSBinaryObjectStoreFile dealloc](&v3, sel_dealloc);
}

- (void)clearCurrentValues
{
  *(_DWORD *)(a1 + 8) = 0;
  if (*(void *)(a1 + 16))
  {
    uint64_t v2 = [0 copy];

    *(void *)(a1 + 16) = v2;
  }

  *(void *)(a1 + 24) = 0LL;
  -[NSXPCStoreServerConnectionContext setActiveStore:](a1, 0LL);
}

- (void)readFromFile:(void *)a3 error:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    -[NSBinaryObjectStoreFile clearCurrentValues](a1);
    v6 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfFile:a2 options:1 error:a3];
    if (v6)
    {
      v7 = v6;
      unint64_t v8 = [v6 length];
      if (!v8)
      {

        return;
      }

      if (v8 <= 0x3F)
      {

        if (!a3) {
          return;
        }
        id v9 = objc_alloc(MEMORY[0x189603F68]);
        v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
        v11 = (void *)MEMORY[0x189607870];
        uint64_t v12 = *MEMORY[0x189607460];
        uint64_t v13 = 259LL;
LABEL_11:
        *a3 = [v11 errorWithDomain:v12 code:v13 userInfo:v10];

        return;
      }

      if (*(void *)[v7 bytes] != 0x6174614465726F43)
      {

        if (!a3) {
          return;
        }
        id v14 = objc_alloc(MEMORY[0x189603F68]);
        v10 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
        v11 = (void *)MEMORY[0x189607870];
        uint64_t v12 = *MEMORY[0x189607460];
        uint64_t v13 = 134000LL;
        goto LABEL_11;
      }

      if ((unint64_t)[v7 length] <= 0x3F)
      {
        if (a3)
        {
          id v15 = objc_alloc(MEMORY[0x189603F68]);
          v16 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
          *a3 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:259 userInfo:v16];
        }

- (BOOL)writeMetadataToFile:(id *)a3 error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v25 = 0LL;
  v7 = (void *)[MEMORY[0x189607898] fileHandleForUpdatingAtPath:a2];
  if (!v7)
  {
    [v6 drain];
    if (a3)
    {
      id v12 = objc_alloc(MEMORY[0x189603F68]);
      uint64_t v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
      *a3 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:260 userInfo:v13];
    }

    return 0LL;
  }

  unint64_t v8 = v7;
  id v9 = (void *)[v7 readDataOfLength:64];
  if (*(void *)[v9 bytes] != 0x6174614465726F43)
  {
    if (a3)
    {
      id v10 = objc_alloc(MEMORY[0x189603F68]);
      v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
      id v25 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134000 userInfo:v11];
    }

- (void)readMetadataFromFile:(int)a3 securely:(void *)a4 error:
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  -[NSBinaryObjectStoreFile clearCurrentValues](a1);
  id v8 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v9 = (void *)[MEMORY[0x189607898] fileHandleForReadingAtPath:a2];
  if (v9)
  {
    id v10 = v9;
    id v41 = 0LL;
    v11 = (void *)[v9 readDataOfLength:64];
    unint64_t v12 = [v11 length];
    if (!v12)
    {
      double v15 = 0LL;
      char v42 = 1;
      goto LABEL_35;
    }

    if (v12 <= 0x3F)
    {
      if (a4)
      {
        id v13 = objc_alloc(MEMORY[0x189603F68]);
        BOOL v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
        double v15 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:259 userInfo:v14];
      }

      else
      {
        double v15 = 0LL;
      }

      char v42 = 0;
      goto LABEL_35;
    }

    if (*(void *)[v11 bytes] != 0x6174614465726F43)
    {
      if (a4)
      {
        id v18 = objc_alloc(MEMORY[0x189603F68]);
        int v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
        double v15 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134000 userInfo:v19];
      }

      else
      {
        double v15 = 0LL;
      }

      goto LABEL_35;
    }

    *(int8x8_t *)&double v20 = SetHostHeaderWithBigHeader((uint64_t)v47, [v11 bytes]);
    if (v48 == 1)
    {
      *(_DWORD *)(a1 + 8) = v49;
      uint64_t v21 = v50;
      *(void *)(a1 + 24) = v52;
      objc_msgSend(v10, "seekToFileOffset:", v21, v20);
      id v22 = (void *)[v10 readDataOfLength:v51];
      uint64_t v23 = [v22 length];
      if (v23 != v51)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x189603F68]);
          uint64_t v30 = (void *)objc_msgSend(v29, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
          double v15 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:259 userInfo:v30];
        }

        else
        {
          double v15 = 0LL;
        }

        char v42 = 0;
        goto LABEL_35;
      }

      uint64_t v24 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v22 error:&v41];
      if (v41)
      {
        uint64_t v35 = [v41 code];
        uint64_t v45 = *MEMORY[0x189607798];
        id v46 = v41;
        id v36 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v37 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189607590],  v35,  (uint64_t)@"Keyed archiver failure",  v36);
        objc_exception_throw(v37);
      }

      else
      {
        id v25 = (id)+[_PFRoutines plistClassesForSecureCoding]();
        if (a3)
        {
          [v24 setRequiresSecureCoding:1];
          [v24 _allowDecodingCyclesInSecureMode];
          uint64_t v26 = [*(id *)(a1 + 40) valueForKey:@"NSBinaryStoreSecureDecodingClasses"];
          if (v26)
          {
            id v25 = (id)[v25 mutableCopy];
            [v25 unionSet:v26];
          }
        }

        else
        {
          [v24 setRequiresSecureCoding:0];
        }

        [v24 setDecodingFailurePolicy:1];
        uint64_t v31 = (void *)[v24 decodeObjectOfClasses:v25 forKey:@"metadata"];
        if (![v24 error])
        {
          [v24 finishDecoding];

          if (*(void **)(a1 + 16) == v31)
          {
            double v15 = 0LL;
          }

          else
          {
            uint64_t v32 = [v31 copy];

            double v15 = 0LL;
            *(void *)(a1 + 16) = v32;
          }

          goto LABEL_35;
        }

        id v41 = (id)[v24 error];
        uint64_t v38 = [v41 code];
        uint64_t v43 = *MEMORY[0x189607798];
        id v44 = v41;
        uint64_t v39 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        id v40 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189607590],  v38,  (uint64_t)@"Keyed archiver failure",  v39);
        objc_exception_throw(v40);
      }

      __break(1u);
      return;
    }

    if (a4)
    {
      id v27 = objc_alloc(MEMORY[0x189603F68]);
      uint64_t v28 = (void *)objc_msgSend(v27, "initWithObjectsAndKeys:", a2, *MEMORY[0x1896074F8], 0);
      double v15 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134000 userInfo:v28];
    }

    else
    {
      double v15 = 0LL;
    }

- (BOOL)_writeMetadataData:(id)a3 andMapDataData:(id)a4 toFile:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v36 = 0LL;
  id v11 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v37 = 0x6174614465726F43LL;
  int v38 = 0x1000000;
  if (self) {
    unsigned int databaseVersion = self->_databaseVersion;
  }
  else {
    unsigned int databaseVersion = 0;
  }
  unsigned int v39 = bswap32(databaseVersion);
  unint64_t v40 = bswap64([a4 length] + 64);
  unint64_t v41 = bswap64([a3 length]);
  uint64_t v42 = 0x4000000000000000LL;
  unint64_t v43 = bswap64([a4 length]);
  if (self) {
    unint64_t primaryKeyGeneration = self->_primaryKeyGeneration;
  }
  else {
    unint64_t primaryKeyGeneration = 0LL;
  }
  unint64_t v44 = bswap64(primaryKeyGeneration);
  uint64_t v45 = 0LL;
  uint64_t v14 = [a4 length];
  uint64_t v15 = [a3 length];
  id v16 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v14 + v15 + 64];
  [v16 appendBytes:&v37 length:64];
  [v16 appendData:a4];
  [v16 appendData:a3];
  id v17 = -[NSDictionary valueForKey:](self->_storeOptions, "valueForKey:", @"NSPersistentStoreFileProtectionKey");
  if (v17)
  {
    if ([(id)*MEMORY[0x189607538] isEqualToString:v17])
    {
      uint64_t v18 = 268435457LL;
    }

    else if ([(id)*MEMORY[0x189607518] isEqualToString:v17])
    {
      uint64_t v18 = 1073741825LL;
    }

    else if ([(id)*MEMORY[0x189607510] isEqualToString:v17])
    {
      uint64_t v18 = 805306369LL;
    }

    else if ([(id)*MEMORY[0x189607508] isEqualToString:v17])
    {
      uint64_t v18 = 536870913LL;
    }

    else
    {
      uint64_t v18 = 1LL;
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v17);
    }
  }

  else if (BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    uint64_t v18 = 1073741825LL;
  }

  else
  {
    uint64_t v18 = 1LL;
  }

  char v25 = [v16 writeToFile:a5 options:v18 error:&v36];
  if ((v25 & 1) == 0)
  {
    id v26 = v36;
    [v36 userInfo];
    _NSCoreDataLog( 1LL,  (uint64_t)@"Binary store: writeToFile error = %@ and userInfo = %@",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)v26);
  }

  id v33 = v36;
  [v11 drain];
  if (v36)
  {
    id v34 = v36;
    if (a6) {
      *a6 = v36;
    }
  }

  return v25;
}

- (void)writeToFile:(uint64_t)a3 error:
{
  if (result)
  {
    v5 = result;
    id v6 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:512];
    v7 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initForWritingWithMutableData:v6];
    [v7 encodeObject:v5[2] forKey:@"metadata"];
    [v7 finishEncoding];

    id v8 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:4096];
    id v9 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initForWritingWithMutableData:v8];
    [v9 encodeObject:v5[4] forKey:@"mapData"];
    [v9 finishEncoding];

    uint64_t v10 = [v5 _writeMetadataData:v6 andMapDataData:v8 toFile:a2 error:a3];
    return (void *)v10;
  }

  return result;
}

@end