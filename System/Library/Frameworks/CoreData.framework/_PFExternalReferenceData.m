@interface _PFExternalReferenceData
+ (Class)classForKeyedUnarchiver;
- (BOOL)_createdByUbiquityImport;
- (BOOL)_isEqualHelper:(void *)a1;
- (BOOL)hasExternalReferenceContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToData:(id)a3;
- (Class)classForCoder;
- (_PFExternalReferenceData)initWithStoreBytes:(const void *)a3 length:(unint64_t)a4 externalLocation:(id)a5 safeguardLocation:(id)a6 protectionLevel:(int)a7;
- (const)_bytesPtrForStore;
- (const)_externalReferenceLocation;
- (const)_safeguardLocation;
- (id)UUID;
- (id)_originalData;
- (id)_safeguardLocationString;
- (id)databaseValue;
- (id)description;
- (id)externalReferenceLocationString;
- (id)initForExternalLocation:(id)a3 safeguardLocation:(id)a4 data:(id)a5 protectionLevel:(int)a6;
- (id)initForUbiquityDictionary:(id)a3 store:(id)a4;
- (id)mutableCopy;
- (id)subdataWithRange:(_NSRange)a3;
- (int)preferredProtectionLevel;
- (uint64_t)_attemptToMapData:(uint64_t)a1;
- (uint64_t)_exceptionForReadError:(uint64_t)result;
- (unint64_t)_bytesLengthForExternalReference;
- (unint64_t)_bytesLengthForStore;
- (void)_deleteExternalReferenceFromPermanentLocation;
- (void)_moveExternalReferenceToPermanentLocation;
- (void)_retrieveExternalData;
- (void)_setBytesForExternalReference:(const void *)a3;
- (void)_writeExternalReferenceToInterimLocation;
- (void)dealloc;
- (void)doCleanupOnDealloc;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation _PFExternalReferenceData

- (id)initForUbiquityDictionary:(id)a3 store:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS____PFExternalReferenceData;
  id v6 = -[_PFExternalReferenceData init](&v30, sel_init);
  if (v6)
  {
    v7 = (void *)[a3 valueForKey:@"databaseValue"];
    uint64_t v8 = [a3 valueForKey:@"UUID"];
    if (v8)
    {
      v9 = (void *)v8;
      size_t v10 = [v7 length];
      *((void *)v6 + 3) = v10;
      v11 = PF_CALLOC_SCANNED_BYTES(v10);
      *((void *)v6 + 2) = v11;
      memcpy(v11, (const void *)[v7 bytes], *((void *)v6 + 3));
      if (a4) {
        int v12 = (*((unsigned __int8 *)a4 + 200) >> 1) & 0xE;
      }
      else {
        LOBYTE(v12) = 0;
      }
      *((_BYTE *)v6 + 72) = *((_BYTE *)v6 + 72) & 0xF1 | v12;
      uint64_t v13 = [v9 fileSystemRepresentation];
      v14 = (void *)[NSString stringWithUTF8String:v13];
      v15 = v14;
      if (a4)
      {
        v16 = (void *)[v14 length];
        if (v16) {
          v16 = (void *)objc_msgSend( (id)objc_msgSend(a4, "externalDataReferencesDirectory"),  "stringByAppendingPathComponent:",  v15);
        }
      }

      else
      {
        v16 = 0LL;
      }

      *((void *)v6 + 6) = v16;
      v17 = (void *)-[NSSQLCore safeguardLocationForFileWithUUID:]((unint64_t *)a4, v15);
      if (v17) {
        v17 = (void *)[NSString stringWithFormat:@"%@_%p", v17, v6];
      }
      *((void *)v6 + 7) = v17;
      *((void *)v6 + 5) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"length"), "unsignedIntegerValue");
      atomic_store(1u, (unsigned __int8 *)v6 + 76);
      if (!objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  *((void *)v6 + 6)))
      {
        atomic_store(1u, (unsigned __int8 *)v6 + 78);
        char v25 = *((_BYTE *)v6 + 72);
LABEL_20:
        *((_BYTE *)v6 + 72) = v25 | 0x10;
        return v6;
      }

      uint64_t v29 = 0LL;
      if (a4) {
        uint64_t v18 = (*((_DWORD *)a4 + 50) >> 2) & 7;
      }
      else {
        uint64_t v18 = 0LL;
      }
      if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]( (uint64_t)&OBJC_CLASS____PFRoutines,  *((void *)v6 + 6),  *((void *)v6 + 7),  v18,  &v29))
      {
        char v25 = *((_BYTE *)v6 + 72) | 1;
LABEL_19:
        *((_BYTE *)v6 + 72) = v25;
        goto LABEL_20;
      }

      _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to link ubiquity file: %@ error: %@",  v19,  v20,  v21,  v22,  v23,  v24,  *((void *)v6 + 6));
    }

    else
    {
      atomic_store(0LL, (unint64_t *)v6 + 1);
      size_t v26 = [v7 length];
      *((void *)v6 + 3) = v26;
      v27 = PF_CALLOC_SCANNED_BYTES(v26);
      *((void *)v6 + 2) = v27;
      memcpy(v27, (const void *)[v7 bytes], *((void *)v6 + 3));
      *((void *)v6 + 5) = *((void *)v6 + 3) - 1LL;
      *((void *)v6 + 4) = *((void *)v6 + 2) + 1LL;
      atomic_store(0, (unsigned __int8 *)v6 + 76);
    }

    char v25 = *((_BYTE *)v6 + 72) & 0xFE;
    goto LABEL_19;
  }

  return v6;
}

- (id)initForExternalLocation:(id)a3 safeguardLocation:(id)a4 data:(id)a5 protectionLevel:(int)a6
{
  char v6 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____PFExternalReferenceData;
  id v10 = -[_PFExternalReferenceData init](&v19, sel_init);
  id v11 = v10;
  if (v10)
  {
    if (a3)
    {
      int v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "fileSystemRepresentation");
      size_t v13 = strlen(v12);
      atomic_store((unint64_t)a5, (unint64_t *)v11 + 1);
      *((void *)v11 + 5) = [a5 length];
      *((void *)v11 + 3) = v13 + 2;
      v14 = PF_CALLOC_SCANNED_BYTES(v13 + 2);
      *((void *)v11 + 2) = v14;
      _BYTE *v14 = 2;
      memcpy((void *)(*((void *)v11 + 2) + 1LL), v12, v13);
      *(_BYTE *)(*((void *)v11 + 3) + *((void *)v11 + 2) - 1LL) = 0;
      *((void *)v11 + 4) = 0LL;
      atomic_store(1u, (unsigned __int8 *)v11 + 76);
      if (a4) {
        a4 = (id)[NSString stringWithFormat:@"%@_%p", a4, v11];
      }
    }

    else
    {
      atomic_store(0LL, (unint64_t *)v10 + 1);
      size_t v15 = [a5 length];
      *((void *)v11 + 5) = v15++;
      *((void *)v11 + 3) = v15;
      v16 = PF_CALLOC_SCANNED_BYTES(v15);
      *((void *)v11 + 2) = v16;
      _BYTE *v16 = 1;
      v17 = (void *)(*((void *)v11 + 2) + 1LL);
      *((void *)v11 + 4) = v17;
      memcpy(v17, (const void *)[a5 bytes], *((void *)v11 + 5));
      atomic_store(0, (unsigned __int8 *)v11 + 76);
    }

    *((_BYTE *)v11 + 72) = *((_BYTE *)v11 + 72) & 0xE0 | (2 * (v6 & 7));
    *((void *)v11 + 6) = a3;
    *((void *)v11 + 7) = a4;
  }

  return v11;
}

- (_PFExternalReferenceData)initWithStoreBytes:(const void *)a3 length:(unint64_t)a4 externalLocation:(id)a5 safeguardLocation:(id)a6 protectionLevel:(int)a7
{
  char v7 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____PFExternalReferenceData;
  id v11 = -[_PFExternalReferenceData init](&v18, sel_init, a3, a4, a5, a6);
  int v12 = v11;
  if (v11)
  {
    v11->_bytesLengthForStore = a4;
    size_t v13 = PF_CALLOC_SCANNED_BYTES(a4);
    v12->_bytesPtrForStore = v13;
    memcpy(v13, a3, v12->_bytesLengthForStore);
    *(_BYTE *)&v12->_externalDataFlags = *(_BYTE *)&v12->_externalDataFlags & 0xF1 | (2 * (v7 & 7));
    if (*(_BYTE *)v12->_bytesPtrForStore == 1)
    {
      atomic_store(0, (unsigned __int8 *)&v12->_isStoredExternally);
      *(_BYTE *)&v12->_externalDataFlags &= ~1u;
      v12->_bytesPtrForExternalReference = (char *)v12->_bytesPtrForStore + 1;
      v12->_bytesLengthForExternalReference = a4 - 1;
      v12->_externalReferenceLocation = 0LL;
      v12->_safeguardLocation = 0LL;
    }

    else
    {
      v14 = (const char *)[a5 fileSystemRepresentation];
      objc_opt_self();
      int v15 = stat(v14, &v19);
      off_t st_size = v19.st_size;
      if (v15) {
        off_t st_size = -1LL;
      }
      if (st_size < 0)
      {

        return 0LL;
      }

      else
      {
        v12->_bytesLengthForExternalReference = st_size;
        atomic_store(1u, (unsigned __int8 *)&v12->_isStoredExternally);
        v12->_externalReferenceLocation = (NSString *)a5;
      }
    }
  }

  return v12;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  if (!self) {
    goto LABEL_8;
  }
  unint64_t v3 = atomic_load((unint64_t *)&self->_originalData);
  p_bytesPtrForExternalReference = &self->_bytesPtrForExternalReference;
  if (!v3)
  {
    if (!*p_bytesPtrForExternalReference) {
      goto LABEL_4;
    }
    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
    if ((v9 & 1) == 0) {
      goto LABEL_4;
    }
    PF_FREE_OBJECT_ARRAY(self->_bytesPtrForExternalReference);
    p_bytesPtrForExternalReference = &self->_bytesPtrForExternalReference;
  }

  *p_bytesPtrForExternalReference = 0LL;
LABEL_4:
  bytesPtrForStore = self->_bytesPtrForStore;
  if (bytesPtrForStore)
  {
    PF_FREE_OBJECT_ARRAY(bytesPtrForStore);
    self->_bytesPtrForStore = 0LL;
  }

  safeguardLocation = self->_safeguardLocation;
  if (safeguardLocation)
  {
    char v7 = -[NSString fileSystemRepresentation](safeguardLocation, "fileSystemRepresentation");
    objc_opt_self();
    unlink(v7);
  }

- (id)mutableCopy
{
  unint64_t v3 = -[_PFExternalReferenceData _bytesPtrForExternalReference](self, "_bytesPtrForExternalReference");
  return (id)[objc_alloc(MEMORY[0x189603FB8]) initWithBytes:v3 length:self->_bytesLengthForExternalReference];
}

- (id)_originalData
{
  return (id)atomic_load((unint64_t *)&self->_originalData);
}

- (void)_setBytesForExternalReference:(const void *)a3
{
  self->_bytesPtrForExternalReference = (void *)a3;
}

- (uint64_t)_attemptToMapData:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  if (!atomic_load((unint64_t *)(a1 + 8)))
  {
    if (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  *(void *)(a1 + 48)) & 1) != 0 || (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  *(void *)(a1 + 56)))
    {
      atomic_store(0, (unsigned __int8 *)(a1 + 78));
      uint64_t v4 = 1LL;
      atomic_store( objc_msgSend( objc_alloc(MEMORY[0x189603F48]),  "initWithBytesNoCopy:length:freeWhenDone:",  +[_PFRoutines readExternalReferenceDataFromFile:]((uint64_t)_PFRoutines, (void *)a1),  objc_msgSend((id)a1, "_bytesLengthForExternalReference"),  1),  (unint64_t *)(a1 + 8));
      return v4;
    }

    if (a2)
    {
      uint64_t v4 = 0LL;
      *a2 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:120 userInfo:0];
      return v4;
    }

    return 0LL;
  }

  return 1LL;
}

- (uint64_t)_exceptionForReadError:(uint64_t)result
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [a2 code];
    if (v4 == 119)
    {
      int v15 = (void *)MEMORY[0x189603F70];
      uint64_t v16 = *(void *)(v3 + 48);
      uint64_t v17 = *MEMORY[0x189603A58];
      v21[0] = @"File URL";
      v21[1] = @"com.apple.coredata.ubiquity.eat";
      v22[0] = v16;
      v22[1] = MEMORY[0x189604A88];
      uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
      int v12 = @"External data reference; unknown problem.";
    }

    else
    {
      if (v4 == 120)
      {
        uint64_t v5 = *MEMORY[0x189607460];
        uint64_t v25 = *MEMORY[0x189607798];
        uint64_t v6 = v25;
        v26[0] = a2;
        uint64_t v7 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v5,  134185,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
        uint64_t v8 = *(void *)(v3 + 48);
        unsigned __int8 v9 = (void *)MEMORY[0x189603F70];
        v23[0] = @"File URL";
        v23[1] = @"com.apple.coredata.ubiquity.eat";
        uint64_t v10 = *MEMORY[0x189603A58];
        v24[0] = v8;
        v24[1] = MEMORY[0x189604A88];
        v23[2] = v6;
        v24[2] = v7;
        uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:3];
        int v12 = @"External data reference can't find underlying file.";
        size_t v13 = v9;
        uint64_t v14 = v10;
        return [v13 exceptionWithName:v14 reason:v12 userInfo:v11];
      }

      int v15 = (void *)MEMORY[0x189603F70];
      uint64_t v18 = *(void *)(v3 + 48);
      uint64_t v17 = *MEMORY[0x189603A58];
      v19[0] = @"File URL";
      v19[1] = @"com.apple.coredata.ubiquity.eat";
      v20[0] = v18;
      v20[1] = MEMORY[0x189604A88];
      uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
      int v12 = @"External data reference can't load ubiquitous file.";
    }

    size_t v13 = v15;
    uint64_t v14 = v17;
    return [v13 exceptionWithName:v14 reason:v12 userInfo:v11];
  }

  return result;
}

- (void)_retrieveExternalData
{
  if (a1)
  {
    objc_sync_enter(a1);
    if (a1[4])
    {
      objc_sync_exit(a1);
    }

    else
    {
      uint64_t v6 = 0LL;
      if ((-[_PFExternalReferenceData _attemptToMapData:]((uint64_t)a1, &v6) & 1) != 0)
      {
        if (atomic_load(a1 + 1))
        {
          uint64_t v3 = (void *)atomic_load(a1 + 1);
          uint64_t v4 = [v3 bytes];
        }

        else
        {
          uint64_t v4 = +[_PFRoutines readExternalReferenceDataFromFile:]((uint64_t)&OBJC_CLASS____PFRoutines, a1);
        }

        a1[4] = v4;
        objc_sync_exit(a1);
      }

      else
      {
        uint64_t v5 = (void *)-[_PFExternalReferenceData _exceptionForReadError:]((uint64_t)a1, v6);
        objc_exception_throw(v5);
        __break(1u);
      }
    }
  }

- (void)_writeExternalReferenceToInterimLocation
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
  if ((v2 & 1) != 0)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isStoredUbiquitously);
    if ((v3 & 1) == 0) {
      +[_PFRoutines writePFExternalReferenceDataToInterimFile:]((uint64_t)&OBJC_CLASS____PFRoutines, self);
    }
  }

- (void)_moveExternalReferenceToPermanentLocation
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
  if ((v2 & 1) != 0)
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isStoredUbiquitously);
    if ((v4 & 1) == 0)
    {
      +[_PFRoutines moveInterimFileToPermanentLocation:]((uint64_t)&OBJC_CLASS____PFRoutines, self);
      objc_sync_enter(self);
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_hasMappedData);
      if ((v5 & 1) == 0 && !self->_bytesPtrForExternalReference)
      {
        uint64_t v6 = (void *)atomic_load((unint64_t *)&self->_originalData);

        atomic_store(0LL, (unint64_t *)&self->_originalData);
      }

      objc_sync_exit(self);
    }
  }

- (void)_deleteExternalReferenceFromPermanentLocation
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
  if ((v2 & 1) != 0) {
    +[_PFRoutines deleteFileForPFExternalReferenceData:]((uint64_t)&OBJC_CLASS____PFRoutines, self);
  }
}

- (BOOL)hasExternalReferenceContent
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
  return v2 & 1;
}

- (id)description
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
  if ((v2 & 1) != 0) {
    return (id)objc_msgSend( MEMORY[0x189607940],  "stringWithFormat:",  @"External Data Reference: <self = %p ; path = %s ; length = %qu>",
  }
                 self,
                 self->_bytesPtrForStore,
                 self->_bytesLengthForExternalReference);
  else {
    return (id)objc_msgSend( MEMORY[0x189607940],  "stringWithFormat:",  @"External Data Reference: <self = %p ; path = nil ; length = %qu>",
  }
                 self,
                 self->_bytesLengthForExternalReference,
                 v4);
}

- (const)_bytesPtrForStore
{
  return self->_bytesPtrForStore;
}

- (unint64_t)_bytesLengthForStore
{
  return self->_bytesLengthForStore;
}

- (unint64_t)_bytesLengthForExternalReference
{
  return self->_bytesLengthForExternalReference;
}

- (const)_externalReferenceLocation
{
  return -[NSString fileSystemRepresentation](self->_externalReferenceLocation, "fileSystemRepresentation");
}

- (const)_safeguardLocation
{
  return -[NSString fileSystemRepresentation](self->_safeguardLocation, "fileSystemRepresentation");
}

- (id)_safeguardLocationString
{
  return self->_safeguardLocation;
}

- (int)preferredProtectionLevel
{
  return (*(_BYTE *)&self->_externalDataFlags >> 1) & 7;
}

- (id)externalReferenceLocationString
{
  return self->_externalReferenceLocation;
}

- (id)databaseValue
{
  return (id)[MEMORY[0x189603F48] dataWithBytes:self->_bytesPtrForStore length:self->_bytesLengthForStore];
}

- (id)UUID
{
  return -[NSString lastPathComponent](self->_externalReferenceLocation, "lastPathComponent");
}

- (void)doCleanupOnDealloc
{
  *(_BYTE *)&self->_externalDataFlags |= 1u;
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  size_t length = a4.length;
  off_t location = a4.location;
  unint64_t bytesLengthForExternalReference = self->_bytesLengthForExternalReference;
  if (a4.location + a4.length > bytesLengthForExternalReference)
  {
    uint64_t v8 = (unint64_t *)MEMORY[0x189603F70];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], objc_msgSend( NSString, "stringWithFormat:", @"range {%lu, %lu} exceeds data length %lu", a4.length, a4.location, bytesLengthForExternalReference), 0 reason userInfo]);
LABEL_10:
    int v12 = (void *)-[_PFExternalReferenceData _exceptionForReadError:]((uint64_t)v8, v13);
    objc_exception_throw(v12);
    __break(1u);
    return;
  }

  uint64_t v8 = (unint64_t *)self;
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_isStoredExternally);
  if ((v9 & 1) == 0)
  {
    memcpy(a3, (char *)self->_bytesPtrForExternalReference + a4.location, a4.length);
    return;
  }

  objc_sync_enter(self);
  size_t v13 = 0LL;
  if (atomic_load(v8 + 1))
  {
    uint64_t v11 = (void *)atomic_load(v8 + 1);
    objc_msgSend(v11, "getBytes:range:", a3, location, length);
    objc_sync_exit(v8);
  }

  else
  {
    objc_sync_exit(v8);
    +[_PFRoutines readBytesForExternalReferenceData:intoBuffer:range:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v8,  a3,  location,  length);
  }

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t bytesLengthForExternalReference = self->_bytesLengthForExternalReference;
  if (a3.location + a3.length > bytesLengthForExternalReference)
  {
    unsigned __int8 v9 = (void *)MEMORY[0x189603F70];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], objc_msgSend( NSString, "stringWithFormat:", @"range {%lu, %lu} exceeds data length %lu", a3.length, a3.location, bytesLengthForExternalReference), 0 reason userInfo]);
    if (v11 == 1)
    {
      objc_begin_catch(v10);
      free(v9);
      objc_exception_rethrow();
      __break(1u);
      JUMPOUT(0x18685465CLL);
    }

    _Unwind_Resume(v10);
  }

  uint64_t v7 = malloc(a3.length);
  -[_PFExternalReferenceData getBytes:range:](self, "getBytes:range:", v7, location, length);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v7 length:length];
}

- (BOOL)_isEqualHelper:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  int64_t v4 = a1[5];
  unsigned __int8 v5 = malloc(0x40000uLL);
  uint64_t v6 = malloc(0x40000uLL);
  if (v4)
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = v4 - 0x40000;
    if (v4 >= 0x40000) {
      int64_t v4 = 0x40000LL;
    }
    do
    {
      objc_msgSend(a1, "getBytes:range:", v5, v7, v4);
      objc_msgSend(a2, "getBytes:range:", v6, v7, v4);
      int v9 = memcmp(v5, v6, v4);
      BOOL v10 = v9 == 0;
      if (v9) {
        break;
      }
      v7 += 0x40000LL;
      int64_t v4 = v8 >= 0x40000 ? 0x40000LL : v8;
      v8 -= 0x40000LL;
    }

    while (v7 < a1[5]);
  }

  else
  {
    BOOL v10 = 1LL;
  }

  free(v5);
  free(v6);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isNSData];
    if (v5) {
      LOBYTE(v5) = -[_PFExternalReferenceData isEqualToData:](self, "isEqualToData:", a3);
    }
  }

  return v5;
}

- (BOOL)isEqualToData:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    size_t bytesLengthForStore = self->_bytesLengthForStore;
    if (bytesLengthForStore == *((void *)a3 + 3)
      && !memcmp(self->_bytesPtrForStore, *((const void **)a3 + 2), bytesLengthForStore))
    {
      return 1;
    }

    unint64_t v6 = -[_PFExternalReferenceData _bytesLengthForExternalReference](self, "_bytesLengthForExternalReference");
    uint64_t v7 = [a3 _bytesLengthForExternalReference];
  }

  else
  {
    unint64_t v6 = -[_PFExternalReferenceData _bytesLengthForExternalReference](self, "_bytesLengthForExternalReference");
    uint64_t v7 = [a3 length];
  }

  return v6 == v7 && -[_PFExternalReferenceData _isEqualHelper:](self, a3);
}

- (BOOL)_createdByUbiquityImport
{
  return (*(_BYTE *)&self->_externalDataFlags >> 4) & 1;
}

@end