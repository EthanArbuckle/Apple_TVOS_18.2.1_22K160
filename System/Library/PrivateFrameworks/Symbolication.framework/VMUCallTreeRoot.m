@interface VMUCallTreeRoot
- (NSString)binaryImagesDescription;
- (VMUCallTreeRoot)initWithCallGraphFile:(id)a3 fileHeader:(id *)a4 topFunctionsList:(id *)a5 binaryImagesList:(id *)a6;
- (VMUCallTreeRoot)initWithSymbolicator:(_CSTypeRef)a3 sampler:(id)a4 options:(unint64_t)a5;
- (id)addBacktrace:(id)a3;
- (id)addBacktrace:(id)a3 count:(unsigned int)a4 numBytes:(unint64_t)a5;
- (id)addChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7;
- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7;
- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7 isLeafNode:(BOOL)a8;
- (id)chargeSystemLibrariesToCallersAndKeepBoundaries:(BOOL)a3;
- (id)descriptionStringForAddress:(unint64_t)a3 atTime:(unint64_t)a4 leafFrame:(BOOL)a5 startOfRecursion:(BOOL)a6;
- (void)addChildCountsIntoNode;
- (void)allBacktracesHaveBeenAdded;
- (void)dealloc;
- (void)setBinaryImagesDescription:(id)a3;
- (void)setCambriaRuntimeVMObjectID:(unint64_t)a3;
- (void)setStackLogReader:(id)a3;
- (void)setVMRegions:(id)a3;
@end

@implementation VMUCallTreeRoot

- (VMUCallTreeRoot)initWithSymbolicator:(_CSTypeRef)a3 sampler:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___VMUCallTreeRoot;
  v9 = -[VMUCallTreeRoot init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    name = v9->super._name;
    v9->super._name = (NSString *)&stru_189E010C8;

    v10->_symbolicator._opaque_1 = CSRetain();
    v10->_symbolicator._opaque_2 = v12;
    objc_storeStrong((id *)&v10->_sampler, a4);
    v10->_options = a5;
    uint64_t v13 = objc_opt_new();
    uniqueNodeNames = v10->_uniqueNodeNames;
    v10->_uniqueNodeNames = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:0];
    addressToSymbolNameMap = v10->_addressToSymbolNameMap;
    v10->_addressToSymbolNameMap = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x189607920] mapTableWithKeyOptions:258 valueOptions:0];
    addressToLeafSymbolNameMap = v10->_addressToLeafSymbolNameMap;
    v10->_addressToLeafSymbolNameMap = (NSMapTable *)v17;
  }

  return v10;
}

- (void)setStackLogReader:(id)a3
{
}

- (void)setVMRegions:(id)a3
{
}

- (void)setCambriaRuntimeVMObjectID:(unint64_t)a3
{
  self->_cambriaRuntimeObjectID = a3;
}

- (void)allBacktracesHaveBeenAdded
{
  p_symbolicator = &self->_symbolicator;
  CSRelease();
  p_symbolicator->_opaque_1 = 0LL;
  p_symbolicator->_opaque_2 = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUCallTreeRoot;
  -[VMUCallTreeNode dealloc](&v3, sel_dealloc);
}

- (id)descriptionStringForAddress:(unint64_t)a3 atTime:(unint64_t)a4 leafFrame:(BOOL)a5 startOfRecursion:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  -[VMUStackLogReader vmuVMRegionForAddress:](self->_stackLogReader, "vmuVMRegionForAddress:");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  BOOL v45 = a5;
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  Path = (const char *)CSSymbolOwnerGetPath();
  if (Path) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0LL;
  }
  if (!v12) {
    Path = (const char *)[v10[5] UTF8String];
  }
  if ((self->_options & 0x10) != 0)
  {
    uint64_t v13 = Path;
    BOOL v14 = isSystemPath(Path);
    Path = v13;
    if (v14)
    {
      id v15 = 0LL;
      goto LABEL_64;
    }
  }

  v44 = Path;
  BOOL v47 = v6;
  uint64_t Name = CSSymbolOwnerGetName();
  v50 = v10;
  if (Name)
  {
    [NSString stringWithUTF8String:Name];
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    uint64_t v17 = self->_vmRegions;
    uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      v48 = @"Rosetta Runtime Routines";
      while (2)
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          unint64_t v23 = a3 - [(id)v22 range];
          if (v23 < v24)
          {
            if (*(_DWORD *)(v22 + 104) == 234)
            {
              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(v22 + 232),  234LL,  0,  0,  0);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }

            if (*(void *)(v22 + 112) == self->_cambriaRuntimeObjectID) {
              goto LABEL_24;
            }
          }
        }

        uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
        if (v19) {
          continue;
        }
        break;
      }

      v48 = @"<unknown binary>";
    }

    else
    {
      v48 = @"<unknown binary>";
    }

- (id)addBacktrace:(id)a3 count:(unsigned int)a4 numBytes:(unint64_t)a5
{
  id v8 = a3;
  int v9 = [v8 backtraceLength];
  if (v9)
  {
    int v10 = v9;
    v11 = self;
    context = (void *)MEMORY[0x186E32E40]();
    unint64_t options = v11->_options;
    v11->super._count += a4;
    v11->super._numBytes += a5;
    uint64_t v13 = (uint64_t)v11;
    char v37 = options;
    if ((options & 4) == 0)
    {
      sampler = v11->_sampler;
      if (sampler)
      {
        -[VMUSampler threadDescriptionStringForBacktrace:returnedAddress:]( sampler,  "threadDescriptionStringForBacktrace:returnedAddress:",  v8,  &key);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = 2LL;
        unint64_t v17 = (unint64_t)key;
      }

      else
      {
        if (!v11->_threadPortToNameMap)
        {
          uint64_t v18 = [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:0];
          threadPortToNameMap = v11->_threadPortToNameMap;
          v11->_threadPortToNameMap = (NSMapTable *)v18;
        }

        unint64_t v17 = [v8 thread];
        NSMapGet(v11->_threadPortToNameMap, (const void *)v17);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          [MEMORY[0x189607940] stringWithFormat:@"Thread_%x" v17 context];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSMapInsert(v11->_threadPortToNameMap, (const void *)v17, v15);
        }

        key = (void *)v17;
        uint64_t v16 = 1LL;
      }

      uint64_t v13 = -[VMUCallTreeNode findOrAddChildWithName:address:nodeSearchType:isLeafNode:]( v11,  "findOrAddChildWithName:address:nodeSearchType:isLeafNode:",  v15,  v17,  v16,  0LL);

      *(_DWORD *)(v13 + 40) += a4;
      *(void *)(v13 + 32) += a5;
    }

    unsigned int v36 = a4;
    uint64_t v20 = [v8 backtrace];
    id v34 = v8;
    [v8 timestamp];
    uint64_t v21 = (v10 - 1);
    if (v10 - 1 >= 0)
    {
      unint64_t v35 = a5;
      uint64_t v22 = 0LL;
      uint64_t v23 = v20 + 8LL * v21 + 8;
      while (1)
      {
        unint64_t v24 = *(void **)(v23 + v22 - 8);
        key = v24;
        if (v22) {
          break;
        }
LABEL_41:
        v22 -= 8LL;
        if (v21-- <= 0) {
          goto LABEL_43;
        }
      }

- (id)addBacktrace:(id)a3
{
  return -[VMUCallTreeRoot addBacktrace:count:numBytes:](self, "addBacktrace:count:numBytes:", a3, 1LL, 0LL);
}

- (id)addChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = -[NSMutableSet member:](self->_uniqueNodeNames, "member:", v12);
  if (v14)
  {
    id v15 = (id)v14;
    uint64_t v16 = 1LL;
  }

  else
  {
    -[NSMutableSet addObject:](self->_uniqueNodeNames, "addObject:", v12);
    id v15 = v12;
    uint64_t v16 = 0LL;
  }

  uint64_t v17 = [v13 findOrAddChildWithName:v15 address:a4 nodeSearchType:v16 isLeafNode:a4 != 0];
  *(_DWORD *)(v17 + 40) += a5;
  *(void *)(v17 + 32) += a6;

  return (id)v17;
}

- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7
{
  return -[VMUCallTreeRoot addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:]( self,  "addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:",  a3,  a4,  *(void *)&a5,  a6,  a7,  a4 != 0);
}

- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7 isLeafNode:(BOOL)a8
{
  id result = (id)[a7 findOrAddChildWithName:a3 address:a4 nodeSearchType:0 isLeafNode:a8];
  *((_DWORD *)result + 10) += a5;
  *((void *)result + 4) += a6;
  return result;
}

- (void)addChildCountsIntoNode
{
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (![v15 count])
  {
    uint64_t v4 = -1LL;
    do
    {
LABEL_11:
      uint64_t v11 = [v15 objectAtIndexedSubscript:v4];
      uint64_t v12 = *(void *)(v11 + 32);
      [(id)v11 parent];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      v13[4] += v12;

      LODWORD(v12) = *(_DWORD *)(v11 + 40);
      [(id)v11 parent];
      uint64_t v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      v14[10] += v12;

      objc_super v3 = v15;
      --v4;
    }

    while (v4);
    goto LABEL_12;
  }

  uint64_t v2 = 0LL;
  objc_super v3 = v15;
  do
  {
    uint64_t v4 = v2;
    [v3 objectAtIndexedSubscript:v2];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 numChildren];
    if (v6)
    {
      int v7 = v6;
      uint64_t v8 = 0LL;
      do
      {
        [v5 childAtIndex:v8];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 addObject:v9];

        uint64_t v8 = (v8 + 1);
      }

      while (v7 != (_DWORD)v8);
    }

    uint64_t v2 = v4 + 1;

    BOOL v10 = v4 + 1 >= (unint64_t)[v15 count];
    objc_super v3 = v15;
  }

  while (!v10);
  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
}

- (VMUCallTreeRoot)initWithCallGraphFile:(id)a3 fileHeader:(id *)a4 topFunctionsList:(id *)a5 binaryImagesList:(id *)a6
{
  id v10 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  uint64_t v11 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( self,  "initWithSymbolicator:sampler:options:",  0LL,  0LL,  0LL,  0LL);
  if (!v11)
  {
    id v15 = 0LL;
    goto LABEL_29;
  }

  uint64_t v12 = v11;
  id v13 = (const char *)[v10 fileSystemRepresentation];
  v78 = fopen(v13, "re");
  if (!v78)
  {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "couldn't open %s for reading call tree\n", v13);
    id v15 = 0LL;
    goto LABEL_28;
  }

  if (!a4)
  {
    uint64_t v14 = 0LL;
    if (a5) {
      goto LABEL_11;
    }
LABEL_15:
    v77 = 0LL;
    goto LABEL_16;
  }

  uint64_t v14 = [MEMORY[0x189607940] string];
  if (!a5) {
    goto LABEL_15;
  }
LABEL_11:
  [MEMORY[0x189607940] string];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v68 = a4;
  v69 = (void *)v14;
  if (a6)
  {
    [MEMORY[0x189607940] string];
    id v76 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v76 = 0LL;
  }

  v71 = [objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v12, 0];
  uint64_t v16 = v12;
  name = v16->super._name;
  v16->super._name = (NSString *)&stru_189E010C8;

  id v72 = objc_alloc_init(MEMORY[0x189603FA8]);
  [MEMORY[0x189607810] decimalDigitCharacterSet];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607810] whitespaceCharacterSet];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607810] characterSetWithCharactersInString:@"("];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607810] characterSetWithCharactersInString:@""]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607810] newlineCharacterSet];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v78;
  int v20 = feof(v78);
  uint64_t v21 = v16;
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  unint64_t v24 = v21;
  if (v20) {
    goto LABEL_20;
  }
  v66 = a5;
  p_isa = (id *)&v21->super.super.isa;
  v63 = a6;
  id v64 = v10;
  char v65 = 0;
  uint64_t v29 = 0LL;
  int v30 = 0;
  v31 = 0LL;
  uint64_t v59 = 1LL;
  char v61 = 1;
  v32 = v21;
  while (1)
  {
    uint64_t v33 = fgetln(v19, v84);
    if (!v33) {
      break;
    }
    id v34 = (void *)MEMORY[0x186E32E40]();
    id v35 = objc_alloc(NSString);
    unsigned int v36 = (void *)[v35 initWithBytesNoCopy:v33 length:v84[0] encoding:4 freeWhenDone:0];
    if (!strncmp(v33, "Call graph:", 0xBuLL))
    {
      int v30 = 1;
      goto LABEL_45;
    }

    if (!strncmp(v33, "Total number in stack", 0x15uLL) || v30 == 1 && v84[0] <= 1)
    {
LABEL_36:
      [v77 appendString:v36];
      int v30 = 2;
LABEL_45:

      objc_autoreleasePoolPop(v34);
      uint64_t v23 = v29;
      unint64_t v24 = v32;
      uint64_t v22 = v31;
      uint64_t v19 = v78;
      goto LABEL_46;
    }

    if (!strncmp(v33, "Binary Images:", 0xEuLL))
    {
LABEL_44:
      [v76 appendString:v36];
      int v30 = 3;
      goto LABEL_45;
    }

    switch(v30)
    {
      case 0:
        [v69 appendString:v36];
        int v30 = 0;
        goto LABEL_45;
      case 1:
LABEL_41:
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x189607A08]) initWithString:v36];

        [v23 setCharactersToBeSkipped:0];
        id v83 = 0LL;
        [v23 scanUpToCharactersFromSet:v18 intoString:&v83];
        id v62 = v83;
        unint64_t v37 = [v62 length];
        context = v34;
        if (v37 < 4)
        {
          uint64_t v22 = v31;
          unint64_t v24 = v32;
          a6 = v63;
          id v10 = v64;
          a5 = v66;
          goto LABEL_103;
        }

        unint64_t v38 = v37;
        if (v37 <= [v31 length])
        {
          do
          {
            [v71 removeLastObject];
            [v71 lastObject];
            unint64_t v24 = (VMUCallTreeRoot *)objc_claimAutoreleasedReturnValue();

            [v72 removeLastObject];
            [v72 lastObject];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = v24;
            v31 = v22;
          }

          while (v38 <= [v22 length]);
        }

        else
        {
          uint64_t v22 = v31;
          unint64_t v24 = v32;
        }

        uint64_t v82 = 0LL;
        a5 = v66;
        if (![v23 scanInteger:&v82]
          || v82 < 1
          || ![v23 scanCharactersFromSet:v75 intoString:0])
        {
          goto LABEL_88;
        }

        unint64_t v39 = 0LL;
        if (([v23 scanFloat:&v79] & 1) == 0)
        {
          [v23 setScanLocation:[v23 scanLocation] - 1];
          unint64_t v39 = 0LL;
          goto LABEL_65;
        }

        id v81 = 0LL;
        int v40 = [v23 scanUpToCharactersFromSet:v70 intoString:&v81];
        id v41 = v81;
        v42 = v41;
        if (!v40) {
          goto LABEL_62;
        }
        if ([v41 isEqualToString:@"K"])
        {
          float v43 = *(float *)&v79;
          float v44 = 1024.0;
LABEL_61:
          *(float *)&uint64_t v79 = v43 * v44;
          goto LABEL_62;
        }

        if ([v42 isEqualToString:@"M"])
        {
          float v43 = *(float *)&v79;
          float v44 = 1048600.0;
          goto LABEL_61;
        }

        if (([v42 hasSuffix:@"bytes"] & 1) == 0 && objc_msgSend(v42, "length"))
        {
LABEL_87:

LABEL_88:
          a6 = v63;
          id v10 = v64;
LABEL_103:

          objc_autoreleasePoolPop(context);
LABEL_104:
          if (v33[v84[0] - 1] == 10) {
            v33[v84[0] - 1] = 0;
          }
          fprintf((FILE *)*MEMORY[0x1895F89D0], "parse error with line: '%s'\n", v33);
          uint64_t v21 = (VMUCallTreeRoot *)p_isa;
LABEL_20:
          if (v68) {
            id *v68 = 0LL;
          }
          BOOL v25 = v69;
          if (a5) {
            *a5 = 0LL;
          }
          if (a6) {
            *a6 = 0LL;
          }

          v26 = 0LL;
          v27 = v72;
          goto LABEL_27;
        }

- (id)chargeSystemLibrariesToCallersAndKeepBoundaries:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v4 = self;
  if (v4->_binaryImagesDescription)
  {
    BOOL v20 = v3;
    id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
    binaryImages = v4->_binaryImages;
    if (!binaryImages)
    {
      uint64_t v7 = +[VMUProcessDescription parseBinaryImagesDescription:]( &OBJC_CLASS___VMUProcessDescription,  "parseBinaryImagesDescription:",  v4->_binaryImagesDescription);
      uint64_t v8 = v4->_binaryImages;
      v4->_binaryImages = (NSArray *)v7;

      binaryImages = v4->_binaryImages;
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    int v9 = binaryImages;
    uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = [v14 objectForKey:@"ExecutablePath"];
          if (isSystemPath((const char *)[v15 UTF8String]))
          {
            [v14 objectForKey:@"DisplayName"];
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v16 length]) {
              [v5 addObject:v16];
            }
          }
        }

        uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      }

      while (v11);
    }

    if (v20) {
      uint64_t v17 = @"KEEP-BOUNDARIES PLACEHOLDER";
    }
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = -[VMUCallTreeNode chargeLibrariesInSet:toCaller:parentLibrary:]( v4,  "chargeLibrariesInSet:toCaller:parentLibrary:",  v5,  0LL,  v17);

    uint64_t v4 = (VMUCallTreeRoot *)v18;
  }

  return v4;
}

- (NSString)binaryImagesDescription
{
  return self->_binaryImagesDescription;
}

- (void)setBinaryImagesDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end