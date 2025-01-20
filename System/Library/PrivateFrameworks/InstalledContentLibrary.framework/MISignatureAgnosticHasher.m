@interface MISignatureAgnosticHasher
+ (id)packedNumberForCPUType:(int)a3 subtype:(int)a4;
+ (void)unpackPackedCpuTypeAndSubType:(id)a3 cputype:(int *)a4 subtype:(int *)a5;
- (BOOL)hasNamedSection;
- (BOOL)performHashWithError:(id *)a3;
- (MISignatureAgnosticHasher)initWithExecutable:(id)a3 searchForSectionNamed:(id)a4;
- (NSDictionary)hashes;
- (NSString)sectionName;
- (NSURL)url;
- (id)_hashSliceAtOffset:(int64_t)a3 withSize:(int64_t)a4 machHeaderAndCommands:(const mach_header *)a5 dictionaryKey:(id *)a6 error:(id *)a7;
- (int)fd;
- (unsigned)countOfSlicesWithNamedSection;
- (void)dealloc;
- (void)setCountOfSlicesWithNamedSection:(unsigned int)a3;
- (void)setFd:(int)a3;
@end

@implementation MISignatureAgnosticHasher

- (MISignatureAgnosticHasher)initWithExecutable:(id)a3 searchForSectionNamed:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MISignatureAgnosticHasher;
  v9 = -[MISignatureAgnosticHasher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_fd = -1;
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_sectionName, a4);
  }

  return v10;
}

- (void)dealloc
{
  if ((-[MISignatureAgnosticHasher fd](self, "fd") & 0x80000000) == 0) {
    close(-[MISignatureAgnosticHasher fd](self, "fd"));
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MISignatureAgnosticHasher;
  -[MISignatureAgnosticHasher dealloc](&v3, sel_dealloc);
}

- (id)_hashSliceAtOffset:(int64_t)a3 withSize:(int64_t)a4 machHeaderAndCommands:(const mach_header *)a5 dictionaryKey:(id *)a6 error:(id *)a7
{
  objc_super v12 = self;
  uint64_t v121 = *MEMORY[0x1895F89C0];
  memset(&c, 0, sizeof(c));
  *(void *)md = 0LL;
  uint64_t v119 = 0LL;
  int v120 = 0;
  id v13 = -[MISignatureAgnosticHasher sectionName](self, "sectionName");
  v14 = (const char *)[v13 UTF8String];

  uint32_t magic = a5->magic;
  if ((int)a5->magic <= -17958195)
  {
    if (magic == -822415874 || magic == -805638658)
    {
      _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  75LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Header magic indicates non-native-endian slice; that's not allowed.",
        v15,
        v100);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }

    goto LABEL_11;
  }

  if (magic == -17958194)
  {
    uint64_t v18 = 28LL;
  }

  else
  {
    if (magic != -17958193)
    {
LABEL_11:
      v20 = -[MISignatureAgnosticHasher url](v12, "url");
      [v20 path];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  87LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Invalid mach_header.magic in %@ : 0x%08x",  v23,  (uint64_t)v21);
      goto LABEL_12;
    }

    uint64_t v18 = 32LL;
  }

  [(id)objc_opt_class() packedNumberForCPUType:a5->cputype subtype:a5->cpusubtype];
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t sizeofcmds = a5->sizeofcmds;
  if (sizeofcmds > 0x1000)
  {
    v20 = -[MISignatureAgnosticHasher url](v12, "url");
    [v20 path];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  95LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Invalid mach_header.sizeofcmds in %@",  v22,  (uint64_t)v21);
LABEL_12:
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:
    v24 = 0LL;
LABEL_15:
    v25 = 0LL;
    goto LABEL_16;
  }

  uint64_t v107 = v18;
  off_t v108 = a3;
  v111 = a7;
  v27 = (char *)a5 + v18;
  uint32_t ncmds = a5->ncmds;
  int64_t v105 = a4;
  v106 = v27;
  unsigned int v109 = sizeofcmds;
  if (ncmds)
  {
    v29 = 0LL;
    char v110 = 0;
    uint64_t v113 = 0LL;
    v114 = 0LL;
    v115 = 0LL;
    uint64_t v112 = 0LL;
    uint64_t v30 = 0LL;
    unint64_t v31 = (unint64_t)&v27[8 * sizeofcmds];
    while (1)
    {
      if ((unint64_t)(v27 + 8) > v31
        || (unint64_t v32 = *((unsigned int *)v27 + 1), v33 = &v27[v32], (unint64_t)&v27[v32] > v31))
      {
        v46 = -[MISignatureAgnosticHasher url](v12, "url");
        [v46 path];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  105LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Load command %d exceeds bounds in %@",  v40,  v30);
        goto LABEL_71;
      }

      int v34 = *(_DWORD *)v27;
      if (*(_DWORD *)v27 != 29) {
        break;
      }
      if ((_DWORD)v32 != 16)
      {
        v46 = -[MISignatureAgnosticHasher url](v12, "url");
        [v46 path];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  169LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Invalid LC_CODE_SIGNATURE command in %@",  v48,  (uint64_t)v47);
        goto LABEL_71;
      }

- (BOOL)performHashWithError:(id *)a3
{
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = __Block_byref_object_copy__0;
  uint64_t v40 = __Block_byref_object_dispose__0;
  id v41 = 0LL;
  v5 = (void *)objc_opt_new();
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  int v35 = 0;
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __50__MISignatureAgnosticHasher_performHashWithError___block_invoke;
  v28[3] = &unk_189D48808;
  uint64_t v30 = &v36;
  v28[4] = self;
  id v6 = v5;
  id v29 = v6;
  unint64_t v31 = &v32;
  id v7 = (void *)MEMORY[0x186E27154](v28);
  id v8 = -[MISignatureAgnosticHasher url](self, "url");
  -[MISignatureAgnosticHasher setFd:]( self,  "setFd:",  open((const char *)[v8 fileSystemRepresentation], 256));

  if (-[MISignatureAgnosticHasher fd](self, "fd") < 0)
  {
    uint64_t v13 = *__error();
    id v14 = -[MISignatureAgnosticHasher url](self, "url");
    uint64_t v15 = [v14 fileSystemRepresentation];
    strerror(v13);
    _CreateError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]",  371LL,  (void *)*MEMORY[0x189607688],  v13,  0LL,  0LL,  @"Failed to open %s: %s",  v16,  v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MISignatureAgnosticHasher url](self, "url");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 path];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v13);
    uint64_t v21 = _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]",  371LL,  @"MIInstallerErrorDomain",  73LL,  v17,  0LL,  @"Failed to open executable for reading at %@ : %s",  v20,  (uint64_t)v19);
    uint64_t v22 = (void *)v37[5];
    v37[5] = v21;

LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }

  int v9 = -[MISignatureAgnosticHasher fd](self, "fd");
  id v10 = -[MISignatureAgnosticHasher url](self, "url");
  LOBYTE(v9) = parse_macho_iterate_slices_fd(v9, [v10 fileSystemRepresentation], (uint64_t)v7);

  if ((v9 & 1) == 0)
  {
    -[MISignatureAgnosticHasher url](self, "url");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v14 path];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]",  376LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Could not iterate slices in macho %@",  v24,  (uint64_t)v23);
    v26 = (void *)v37[5];
    v37[5] = v25;

    goto LABEL_7;
  }

  BOOL v11 = v37[5] == 0;
  objc_storeStrong((id *)&self->_hashes, v5);
  unsigned int v12 = -[MISignatureAgnosticHasher countOfSlicesWithNamedSection](self, "countOfSlicesWithNamedSection");
  if (v12 == *((_DWORD *)v33 + 6)) {
    self->_hasNamedSection = 1;
  }
LABEL_8:
  if (a3 && !v11) {
    *a3 = (id) v37[5];
  }
  if ((-[MISignatureAgnosticHasher fd](self, "fd") & 0x80000000) == 0)
  {
    close(-[MISignatureAgnosticHasher fd](self, "fd"));
    -[MISignatureAgnosticHasher setFd:](self, "setFd:", 0xFFFFFFFFLL);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v11;
}

uint64_t __50__MISignatureAgnosticHasher_performHashWithError___block_invoke( uint64_t a1,  unsigned int *a2,  _DWORD *a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = a3[3];
  if ((_DWORD)v9 != 2)
  {
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke",  317LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Mach header specified unknown filetype %u",  a8,  v9);
    uint64_t v25 = LABEL_11:;
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    goto LABEL_12;
  }

  if (a2)
  {
    if (*a2 == a3[1])
    {
      if (a2[1] == a3[2])
      {
        uint64_t v11 = a2[2];
        off_t st_size = a2[3];
        goto LABEL_16;
      }

      _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke",  342LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Mismatched cpusubtype between fat_arch and mach_header: fa: %d, mh: %d",  a8,  a2[1]);
    }

    else
    {
      _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke",  337LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Mismatched cputype between fat_arch and mach_header: fa: %d, mh: %d",  a8,  *a2);
    }

    goto LABEL_11;
  }

  memset(&v41, 0, sizeof(v41));
  if (fstat([*(id *)(a1 + 32) fd], &v41))
  {
    int v13 = *__error();
    id v14 = (void *)*MEMORY[0x189607688];
    [*(id *)(a1 + 32) url];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 path];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v13);
    _CreateError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke",  327LL,  v14,  v13,  0LL,  0LL,  @"fstat of %@ failed: %s",  v17,  (uint64_t)v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) url];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 path];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v13);
    uint64_t v22 = _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke",  327LL,  @"MIInstallerErrorDomain",  73LL,  v18,  0LL,  @"Could not determine size of %@ : %s",  v21,  (uint64_t)v20);
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

LABEL_12:
    id v28 = 0LL;
    goto LABEL_13;
  }

  uint64_t v11 = 0LL;
  off_t st_size = v41.st_size;
LABEL_16:
  unint64_t v31 = *(void **)(a1 + 32);
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v32 + 40);
  id v40 = 0LL;
  [v31 _hashSliceAtOffset:v11 withSize:st_size machHeaderAndCommands:a3 dictionaryKey:&v40 error:&obj];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  id v28 = v40;
  objc_storeStrong((id *)(v32 + 40), obj);
  if (v33)
  {
    [*(id *)(a1 + 40) objectForKeyedSubscript:v28];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      [*(id *)(a1 + 40) setObject:v33 forKeyedSubscript:v28];
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);

      uint64_t v29 = 1LL;
      goto LABEL_14;
    }

    uint64_t v36 = _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke",  356LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Already have an entry in hashes dictionary for key %@",  v35,  (uint64_t)v28);
    uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;
  }

+ (id)packedNumberForCPUType:(int)a3 subtype:(int)a4
{
  return (id)[MEMORY[0x189607968] numberWithUnsignedLongLong:a4 | (*(void *)&a3 << 32)];
}

+ (void)unpackPackedCpuTypeAndSubType:(id)a3 cputype:(int *)a4 subtype:(int *)a5
{
  uint64_t v7 = [a3 unsignedLongLongValue];
  *a4 = HIDWORD(v7);
  *a5 = v7;
}

- (BOOL)hasNamedSection
{
  return self->_hasNamedSection;
}

- (NSDictionary)hashes
{
  return self->_hashes;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unsigned)countOfSlicesWithNamedSection
{
  return self->_countOfSlicesWithNamedSection;
}

- (void)setCountOfSlicesWithNamedSection:(unsigned int)a3
{
  self->_countOfSlicesWithNamedSection = a3;
}

- (void).cxx_destruct
{
}

@end