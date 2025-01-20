@interface VMUClassInfo
+ (VMUClassInfo)classInfoWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5;
+ (id)_genericBlockByrefInfo;
+ (id)descriptionForTypeEncoding:(const char *)a3 ivarName:(const char *)a4;
+ (unint64_t)sizeofClassStructure;
+ (void)initialize;
- (BOOL)hasCppConstructorOrDestructor;
- (BOOL)hasSpecificLayout;
- (BOOL)hasVariantLayout;
- (BOOL)isARR;
- (BOOL)isCoreMediaFigObject;
- (BOOL)isDerivedFromStackBacktrace;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMetaClass;
- (BOOL)isRealized;
- (BOOL)isRootClass;
- (BOOL)usesSwiftRefcounting;
- (NSString)binaryName;
- (NSString)binaryPath;
- (NSString)className;
- (NSString)displayName;
- (NSString)fullIvarDescription;
- (NSString)shortIvarDescription;
- (NSString)typeName;
- (VMUClassInfo)genericInfo;
- (VMUClassInfo)initWithClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7;
- (VMUClassInfo)initWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5;
- (VMUClassInfo)initWithClosureContext:(unint64_t)a3 typeInfo:(swift_typeinfo *)a4 infoMap:(id)a5 swiftFieldMetadataContext:(libSwiftRemoteMirrorWrapper *)a6;
- (VMUClassInfo)initWithCoder:(id)a3;
- (VMUClassInfo)initWithRealizedClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7;
- (VMUClassInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6;
- (VMUClassInfo)superclassInfo;
- (id)_copyWithInstanceSize:(unsigned int)a3 superclassOffset:(unsigned int)a4 asVariant:(BOOL)a5 mutable:(BOOL)a6;
- (id)_initWithClass:(unint64_t)a3 type:(unsigned int)a4 realizedOnly:(BOOL)a5 infoMap:(id)a6 objectIdentifier:(id)a7 reader:(id)a8;
- (id)debugDescription;
- (id)description;
- (id)fieldAtOrBeforeOffset:(unsigned int)a3;
- (id)firstFieldWithName:(id)a3;
- (id)initSwiftClassWithName:(id)a3 classInfoType:(unsigned int)a4 size:(unint64_t)a5;
- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 memoryReader:(id)a5;
- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 withScanner:(id)a5 memoryReader:(id)a6;
- (id)mutableCopy;
- (id)scanDescriptionWithSize:(unsigned int)a3;
- (unint64_t)hash;
- (unint64_t)remoteIsa;
- (unsigned)_ivarGapForClass;
- (unsigned)_objcABIFromObjectIdentifier:(id)a3;
- (unsigned)_totalIvarCount;
- (unsigned)defaultScanType;
- (unsigned)infoType;
- (unsigned)instanceSize;
- (unsigned)ivarCount;
- (unsigned)ivarGapForClassHierarchy;
- (unsigned)pointerSize;
- (unsigned)superclassOffset;
- (void)_addComplexAction:(id)a3 withEvaluator:(id)a4;
- (void)_addFields:(id)a3;
- (void)_addVariantAction:(id)a3 withEvaluator:(id)a4;
- (void)_adjustInstanceSize;
- (void)_applyExtendedLayout:(const char *)a3 withSize:(unsigned int)a4;
- (void)_demangleClassName;
- (void)_determineBinaryPathUsingObjectIdentifier:(id)a3 remoteClassNameLoc:(unint64_t)a4;
- (void)_freeLocalIvarList;
- (void)_identifyObjCClassStructureBlocksForIsa:(unint64_t)a3 isMetaclass:(BOOL)a4 withScanner:(id)a5 addressIdentifierBlock:(id)a6;
- (void)_logDescriptionWithSuperclasses:(BOOL)a3 indentation:(int)a4 toLogger:(id)a5;
- (void)_parseIvarsAndLayouts;
- (void)_processARRLayout:(const char *)a3 scanType:(unsigned int)a4;
- (void)_replaceField:(id)a3 withFields:(id)a4;
- (void)_replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5;
- (void)_setBinaryPath:(id)a3 sanitize:(BOOL)a4;
- (void)_setClassNameWithAddress:(unint64_t)a3 targetTask:(id)a4;
- (void)_setDefaultScanType:(unsigned int)a3;
- (void)_setDisplayName:(id)a3;
- (void)_setFields:(id)a3;
- (void)_setInfoType:(unsigned int)a3;
- (void)_setInstanceSize:(unsigned int)a3;
- (void)_setIsCoreMediaFigObject:(BOOL)a3;
- (void)_setIsRootClass:(BOOL)a3;
- (void)_setIsa:(unint64_t)a3;
- (void)_setSuperclassInfo:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllFieldsWithBlock:(id)a3;
- (void)enumerateAllPointerFieldsWithBlock:(void *)result;
- (void)enumerateClassHierarchyWithBlock:(id)a3;
- (void)enumerateExternalValuesFromObject:(unint64_t)a3 withSize:(unsigned int)a4 block:(id)a5;
- (void)enumerateScanningLocationsForSize:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateStoredEntriesForObject:(unint64_t)a3 ofSize:(unsigned int)a4 externalValues:(id)a5 block:(id)a6;
- (void)enumerateSublayoutsForSize:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateTypeFieldsWithBlock:(id)a3;
- (void)identifyObjCClassStructureBlocksWithScanner:(id)a3 addressIdentifierBlock:(id)a4;
- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5;
- (void)setIsDerivedFromStackBacktrace:(BOOL)a3;
@end

@implementation VMUClassInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:4];
  }
}

+ (id)_genericBlockByrefInfo
{
  if (+[VMUClassInfo _genericBlockByrefInfo]::onceToken != -1) {
    dispatch_once(&+[VMUClassInfo _genericBlockByrefInfo]::onceToken, &__block_literal_global_10);
  }
  return (id)+[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo;
}

void __38__VMUClassInfo__genericBlockByrefInfo__block_invoke()
{
  v0 = -[VMUClassInfo initWithClassName:binaryPath:type:]( objc_alloc(&OBJC_CLASS___VMUClassInfo),  "initWithClassName:binaryPath:type:",  @"__NSExactBlockVariable__",  @"/usr/lib/system/libsystem_blocks.dylib",  0x80000000LL);
  v1 = (void *)+[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo;
  +[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo = (uint64_t)v0;
}

- (void)_processARRLayout:(const char *)a3 scanType:(unsigned int)a4
{
  if (a3)
  {
    v4 = a3;
    unsigned int v5 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      uint64_t v6 = *(void *)&a4;
      int v8 = 0;
      unint64_t v9 = 0LL;
      unsigned int remotePointerSize = self->_remotePointerSize;
      do
      {
        int v11 = v5 & 0xF;
        int v12 = v8 + (v5 >> 4);
        if (v9 < self->_ivarCount)
        {
          unsigned int v13 = self->_superclassOffset + v12 * remotePointerSize;
          do
          {
            ++v9;
          }

          while (v9 < self->_ivarCount);
          unint64_t v9 = v9;
        }

        int v8 = v12 + v11;
        unsigned int v14 = *(unsigned __int8 *)++v4;
        unsigned int v5 = v14;
      }

      while (v14);
    }
  }

- (void)_parseIvarsAndLayouts
{
  if (-[VMUClassInfo isARR](self, "isARR"))
  {
    -[VMUClassInfo _processARRLayout:scanType:](self, "_processARRLayout:scanType:", self->_strongLayout, 2LL);
    -[VMUClassInfo _processARRLayout:scanType:](self, "_processARRLayout:scanType:", self->_weakLayout, 4LL);
  }

- (void)_demangleClassName
{
  if (self->_remoteType == 8)
  {
    p_remoteClassName = &self->_remoteClassName;
    demangleSwiftClassName(-[NSString UTF8String](self->_remoteClassName, "UTF8String"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      objc_storeStrong((id *)p_remoteClassName, v3);
      v3 = v4;
    }
  }

- (void)_setClassNameWithAddress:(unint64_t)a3 targetTask:(id)a4
{
  id v10 = a4;
  [v10 memoryCache];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 peekStringAtAddress:a3];

  if (v7)
  {
    int v8 = (NSString *)[objc_alloc(NSString) initWithUTF8String:v7];
    remoteClassName = self->_remoteClassName;
    self->_remoteClassName = v8;

    -[VMUClassInfo _demangleClassName](self, "_demangleClassName");
  }
}

- (NSString)displayName
{
  uint64_t v2 = 8LL;
  if (!self->_displayName) {
    uint64_t v2 = 7LL;
  }
  return (NSString *)(&self->super.isa)[v2];
}

- (void)_setDisplayName:(id)a3
{
  v4 = (NSString *)a3;
  if (self->_displayName != v4)
  {
    uint64_t v7 = v4;
    unsigned int v5 = (NSString *)-[NSString copy](v4, "copy");
    displayName = self->_displayName;
    self->_displayName = v5;

    v4 = v7;
  }
}

- (void)_setBinaryPath:(id)a3 sanitize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (NSString *)a3;
  if (self->_remoteBinaryPath != v6)
  {
    unint64_t v9 = v6;
    if (v4)
    {
      VMUSanitizePath(v6);
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v7 = v6;
    }

    remoteBinaryPath = self->_remoteBinaryPath;
    self->_remoteBinaryPath = v7;

    uint64_t v6 = v9;
  }
}

- (void)_setSuperclassInfo:(id)a3
{
  unsigned int v5 = (VMUClassInfo *)a3;
  if (self->_superclassLayout != v5)
  {
    id v10 = v5;
    objc_storeStrong((id *)&self->_superclassLayout, a3);
    unsigned int superclassOffset = self->_superclassOffset;
    unsigned int v7 = -[VMUClassInfo instanceSize](v10, "instanceSize");
    if (superclassOffset <= v7) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = superclassOffset;
    }
    unsigned int instanceSize = self->_instanceSize;
    if (instanceSize <= v8) {
      unsigned int instanceSize = v8;
    }
    self->_unsigned int superclassOffset = v8;
    self->_unsigned int instanceSize = instanceSize;
    unsigned int v5 = v10;
  }
}

- (void)_setIsCoreMediaFigObject:(BOOL)a3
{
  self->_isCoreMediaFigObject = a3;
}

- (void)_setDefaultScanType:(unsigned int)a3
{
  self->_defaultScanType = a3;
}

- (unsigned)defaultScanType
{
  return self->_defaultScanType;
}

- (void)_setInstanceSize:(unsigned int)a3
{
  self->_unsigned int instanceSize = a3;
}

- (void)_setIsRootClass:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_ro_flags = self->_ro_flags & 0xFFFFFFFD | v3;
}

- (void)_setInfoType:(unsigned int)a3
{
  self->_remoteType = a3;
}

- (BOOL)hasVariantLayout
{
  char hasVariantLayout = self->_hasVariantLayout;
  if (!hasVariantLayout)
  {
    char hasVariantLayout = 1;
    if (!self->_variantEvaluators)
    {
      if (-[VMUClassInfo hasVariantLayout](self->_superclassLayout, "hasVariantLayout")) {
        char hasVariantLayout = 1;
      }
      else {
        char hasVariantLayout = -1;
      }
    }

    self->_char hasVariantLayout = hasVariantLayout;
  }

  return hasVariantLayout == 1;
}

- (BOOL)hasSpecificLayout
{
  char hasSpecificLayout = self->_hasSpecificLayout;
  if (!hasSpecificLayout)
  {
    if (-[VMUClassInfo hasVariantLayout](self, "hasVariantLayout")
      || -[VMUClassInfo hasSpecificLayout](self->_superclassLayout, "hasSpecificLayout"))
    {
      char hasSpecificLayout = 1;
    }

    else
    {
      char hasSpecificLayout = 1;
      if (self->_remoteType != 0x80000000)
      {
        unsigned int v5 = -[NSString UTF8String](self->_remoteClassName, "UTF8String");
        if (!v5) {
          unsigned int v5 = "";
        }
        if (!strcmp(v5, "NSBlock")) {
          char hasSpecificLayout = 1;
        }
        else {
          char hasSpecificLayout = -1;
        }
      }
    }

    self->_char hasSpecificLayout = hasSpecificLayout;
  }

  return hasSpecificLayout == 1;
}

+ (VMUClassInfo)classInfoWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithClassName:v8 binaryPath:v9 type:v5];

  return (VMUClassInfo *)v10;
}

- (VMUClassInfo)initWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  id v10 = -[VMUClassInfo init](&v16, sel_init);
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    remoteClassName = v10->_remoteClassName;
    v10->_remoteClassName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    remoteBinaryPath = v10->_remoteBinaryPath;
    v10->_remoteBinaryPath = (NSString *)v13;

    v10->_unsigned int remotePointerSize = 8;
    v10->_defaultScanType = 1;
    v10->_remoteType = a5;
  }

  return v10;
}

- (VMUClassInfo)initWithClosureContext:(unint64_t)a3 typeInfo:(swift_typeinfo *)a4 infoMap:(id)a5 swiftFieldMetadataContext:(libSwiftRemoteMirrorWrapper *)a6
{
  id v24 = a5;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  id v10 = -[VMUClassInfo init](&v29, sel_init);
  uint64_t v11 = v10;
  if (v10)
  {
    remoteClassName = v10->_remoteClassName;
    v10->_remoteClassName = (NSString *)@"Closure context";

    v11->_unsigned int remotePointerSize = 8;
    *(void *)&v11->_defaultScanType = 0x4000000001LL;
    v11->_unsigned int instanceSize = a4->var1;
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(0, "Getting fields for closure context at %p\n", (const void *)a3);
    }
    uint64_t v13 = (void *)objc_opt_new();
    if (a4->var4)
    {
      uint64_t v14 = 0LL;
      while (1)
      {
        vmu_swift_reflection_childOfInstance((uint64_t)a6->var0, a3, v14, (uint64_t)&v27);
        if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
          dispatch_once( &_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken,  &__block_literal_global_412);
        }
        if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
        {
          v26[0] = v27;
          v26[1] = v28;
          _debugSwiftSubfieldDumpSwiftChildInfo(1, "childOfInstance()", (uint64_t)v26, (uint64_t)a6->var0);
        }

        char v25 = 0;
        _createFieldInfoFromChild( (uint64_t *)a6,  (const char *)v27,  DWORD2(v27),  HIDWORD(v27),  v28,  *((uint64_t *)&v28 + 1),  v24,  v11->_remoteClassName,  &v25,  1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          [v13 addObject:v15];
        }

        else if (v25)
        {
          goto LABEL_26;
        }

        uint64_t v14 = (v14 + 1);
      }

      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
      }
      if (debugSwiftSubfieldIsEnabled::isEnabled)
      {
        objc_super v16 = " (VERY BAD)";
        if (!DWORD2(v27)) {
          objc_super v16 = "";
        }
        v17 = (const char *)v27;
        if (!(void)v27) {
          v17 = "?";
        }
        _debugSwiftAsyncPrintf( 1,  "nonsensically small offset for field %s of +%u%s; ignoring all fields in this closure context\n",
          v17,
          DWORD2(v27),
          v16);
      }

- (id)initSwiftClassWithName:(id)a3 classInfoType:(unsigned int)a4 size:(unint64_t)a5
{
  unsigned int v5 = a5;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  id v10 = -[VMUClassInfo init](&v15, sel_init);
  uint64_t v11 = v10;
  if (v10)
  {
    p_remoteClassName = (void **)&v10->_remoteClassName;
    objc_storeStrong((id *)&v10->_remoteClassName, a3);
    if (!v9 && a4 == 64)
    {
      uint64_t v13 = *p_remoteClassName;
      *p_remoteClassName = @"malloc-block (possibly Swift)";
    }

    v11->_unsigned int remotePointerSize = 8;
    v11->_defaultScanType = 1;
    v11->_remoteType = a4;
    v11->_unsigned int instanceSize = v5;
  }

  return v11;
}

- (unsigned)_objcABIFromObjectIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 objcABI];
  }

  else
  {
    if (-[VMUClassInfo _objcABIFromObjectIdentifier:]::onceToken != -1) {
      dispatch_once(&-[VMUClassInfo _objcABIFromObjectIdentifier:]::onceToken, &__block_literal_global_39);
    }
    unsigned int v5 = -[VMUClassInfo _objcABIFromObjectIdentifier:]::analysisProcessObjcABI;
  }

  return v5;
}

uint64_t __45__VMUClassInfo__objcABIFromObjectIdentifier___block_invoke()
{
  v0 = dlopen("/usr/lib/libobjc.A.dylib", 17);
  v1 = (int *)dlsym(v0, "objc_class_abi_version");
  if (v1) {
    -[VMUClassInfo _objcABIFromObjectIdentifier:]::analysisProcessObjcABI = *v1;
  }
  return dlclose(v0);
}

- (id)_initWithClass:(unint64_t)a3 type:(unsigned int)a4 realizedOnly:(BOOL)a5 infoMap:(id)a6 objectIdentifier:(id)a7 reader:(id)a8
{
  BOOL v107 = a5;
  uint64_t v13 = (VMUClassInfoMap *)a6;
  id v14 = a7;
  objc_super v15 = (uint64_t (**)(id, unint64_t, uint64_t))a8;
  v110.receiver = self;
  v110.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  objc_super v16 = -[VMUClassInfo init](&v110, sel_init);
  if (!v16) {
    goto LABEL_47;
  }
  if (!v14) {
    goto LABEL_45;
  }
  v17 = (libSwiftRemoteMirrorWrapper *)[v14 swiftMirror];
  int v18 = [v16 _objcABIFromObjectIdentifier:v14];
  v16[4] = 8;
  if (!a3) {
    goto LABEL_45;
  }
  unint64_t v19 = (unint64_t *)MEMORY[0x1895FD590];
  if (*MEMORY[0x1895FD590] >= a3 || !v15) {
    goto LABEL_45;
  }
  *((void *)v16 + 1) = a3;
  v16[10] = 1;
  v16[11] = a4;
  if (a4 == 4)
  {
    unint64_t v20 = v15[2](v15, a3, 96LL);
    unint64_t v21 = v20;
    if (*v19 >= v20)
    {
      uint64_t v106 = 0LL;
LABEL_19:
      v16[7] = 16;
LABEL_94:
      unsigned int v92 = v16[6];
      unsigned int v93 = [*((id *)v16 + 10) instanceSize];
      if (v92 <= v93) {
        unsigned int v94 = v93;
      }
      else {
        unsigned int v94 = v92;
      }
      unsigned int v95 = v16[7];
      if (v95 <= v94) {
        unsigned int v95 = v94;
      }
      v16[6] = v94;
      v16[7] = v95;
      [v16 _determineBinaryPathUsingObjectIdentifier:v14 remoteClassNameLoc:v106];
      -[VMUClassInfoMap addClassInfo:forAddress:](v13, "addClassInfo:forAddress:", v16, a3);
      goto LABEL_47;
    }

    uint64_t v22 = *(void *)(v20 + 8);
    [v14 vmuTask];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v106 = v22;
    [v16 _setClassNameWithAddress:v22 targetTask:v23];

    if (*((void *)v16 + 7))
    {
      uint64_t v24 = [v14 figBaseObjectFinalizeAddress];
      if (v24)
      {
        [v14 vmuTask];
        char v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v25, *(void *)(v21 + 32));

        if (v26 == v24) {
          *((_BYTE *)v16 + 147) = 1;
        }
      }

      goto LABEL_19;
    }

- (void)_determineBinaryPathUsingObjectIdentifier:(id)a3 remoteClassNameLoc:(unint64_t)a4
{
  id v6 = a3;
  [v6 symbolicator];
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t v24 = 0LL;
    char v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    int v27 = __Block_byref_object_copy__6;
    __int128 v28 = __Block_byref_object_dispose__6;
    id v29 = 0LL;
    if (-[VMUClassInfo infoType](self, "infoType") == 8)
    {
      -[VMUClassInfo className](self, "className");
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 rangeOfString:@"."];

      if (v8)
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[VMUClassInfo className](self, "className");
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 substringToIndex:v8];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();

          [v6 moduleNameToBinaryPathDict];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v12 = [v11 objectForKeyedSubscript:v10];
          uint64_t v13 = (void *)v25[5];
          v25[5] = v12;

          id v14 = (void *)v25[5];
          if (!v14)
          {
            id v15 = v10;
            [v15 UTF8String];
            CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
            uint64_t v16 = v25[5];
            if (!v16)
            {
              v25[5] = (uint64_t)&stru_189E010C8;

              uint64_t v16 = v25[5];
            }

            [v6 moduleNameToBinaryPathDict];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 setObject:v16 forKeyedSubscript:v15];

            id v14 = (void *)v25[5];
          }

          if ([v14 length])
          {
            -[VMUClassInfo _setBinaryPath:sanitize:](self, "_setBinaryPath:sanitize:", v25[5], 1LL);
LABEL_26:

            goto LABEL_27;
          }
        }
      }
    }

    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    if (CSIsNull())
    {
      if (-[NSString isEqualToString:](self->_remoteClassName, "isEqualToString:", @"CGSEventAppendix"))
      {
        CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      }

      else if (a4)
      {
        CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
      }
    }

    if ((CSIsNull() & 1) != 0
      || ([NSString stringWithUTF8String:CSSymbolOwnerGetPath()],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = (void *)v25[5],
          v25[5] = v18,
          v19,
          ![(id)v25[5] length]))
    {
      unint64_t v20 = self->_superclassLayout;
      if (v20)
      {
        id v10 = v20;
        while (1)
        {
          [v10 binaryPath];
          unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21) {
            break;
          }
          uint64_t v22 = [v10 superclassInfo];

          id v10 = (void *)v22;
          if (!v22) {
            goto LABEL_27;
          }
        }

        [v10 binaryPath];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUClassInfo _setBinaryPath:sanitize:](self, "_setBinaryPath:sanitize:", v23, 0LL);

        goto LABEL_26;
      }
    }

    else
    {
      -[VMUClassInfo _setBinaryPath:sanitize:](self, "_setBinaryPath:sanitize:", v25[5], 1LL);
    }

void __77__VMUClassInfo__determineBinaryPathUsingObjectIdentifier_remoteClassNameLoc___block_invoke( uint64_t a1)
{
  uint64_t v2 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (VMUClassInfo)initWithClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7
{
  return (VMUClassInfo *)-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]( self,  "_initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:",  a3,  *(void *)&a4,  0LL,  a5,  a6,  a7);
}

- (VMUClassInfo)initWithRealizedClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7
{
  return (VMUClassInfo *)-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]( self,  "_initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:",  a3,  *(void *)&a4,  1LL,  a5,  a6,  a7);
}

- (void)_freeLocalIvarList
{
  if (self->_ivarCount)
  {
    unint64_t v3 = 0LL;
    do
    {
      localIvarList = self->_localIvarList;
      id v5 = localIvarList[v3];
      localIvarList[v3] = 0LL;

      ++v3;
    }

    while (v3 < self->_ivarCount);
  }

  id v6 = self->_localIvarList;
  if (v6)
  {
    free(v6);
    self->_localIvarList = 0LL;
  }

- (void)dealloc
{
  weakLayout = (char *)self->_weakLayout;
  if (weakLayout)
  {
    free(weakLayout);
    self->_weakLayout = 0LL;
  }

  strongLayout = (char *)self->_strongLayout;
  if (strongLayout)
  {
    free(strongLayout);
    self->_strongLayout = 0LL;
  }

  -[VMUClassInfo _freeLocalIvarList](self, "_freeLocalIvarList");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  -[VMUClassInfo dealloc](&v5, sel_dealloc);
}

- (id)mutableCopy
{
  return -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:]( self,  "_copyWithInstanceSize:superclassOffset:asVariant:mutable:",  self->_instanceSize,  self->_superclassOffset,  0LL,  1LL);
}

- (void)_identifyObjCClassStructureBlocksForIsa:(unint64_t)a3 isMetaclass:(BOOL)a4 withScanner:(id)a5 addressIdentifierBlock:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, unint64_t, BOOL, BOOL))a6;
  if (a3)
  {
    unsigned int remoteType = self->_remoteType;
    if (remoteType == 8 || remoteType == 1)
    {
      [v10 objectIdentifier];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 memoryReader];
      id v15 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      int v54 = [v14 objcABI];
      uint64_t v16 = (void *)v15[2](v15, a3, 40LL);
      v17 = v16;
      if (!v16)
      {
LABEL_36:

        goto LABEL_37;
      }

      v53 = v15;
      if (!v7) {
        -[VMUClassInfo _identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:]( self,  "_identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:",  [v14 translateIsaPointer:*v16],  1,  v10,  v11);
      }
      uint64_t v18 = v17[4];
      [v14 vmuTask];
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v19, v18);

      uint64_t v21 = [v14 swiftMirror];
      if (v21) {
        uint64_t v22 = *(void *)(v21 + 8) | 1LL;
      }
      else {
        uint64_t v22 = 1LL;
      }
      v11[2](v11, a3, (v22 & v20) != 0, v7);
      uint64_t v23 = v20 & 0x7FFFFFFFFFF8LL;
      v11[2](v11, v23, 2, v7);
      [v10 setClassStructureFieldScanValueAtSourceAddress:a3 + 32 toCorrectedAddress:v23];
      uint64_t v24 = v17[2] & 0xFFFFFFFFFFFFLL;
      v11[2](v11, v24, 4, v7);
      [v10 setClassStructureFieldScanValueAtSourceAddress:a3 + 16 toCorrectedAddress:v24];
      [v14 vmuTask];
      char v25 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v26 = VMUGetClassDataExtOfClass(v25, v15, v54, a3);

      v11[2](v11, v26, 3, v7);
      [v14 vmuTask];
      int v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = VMUGetClassDataROofClass(v27, v15, v54, a3);

      [v10 vmuTask];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28 && ([v29 addressIsInSharedCache:v28] & 1) == 0) {
        v11[2](v11, v28, 5, v7);
      }
      v55[0] = MEMORY[0x1895F87A8];
      v55[1] = 3221225472LL;
      v55[2] = __103__VMUClassInfo__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock___block_invoke;
      v55[3] = &unk_189DFE7A0;
      id v52 = v30;
      id v56 = v52;
      unint64_t v60 = v11;
      BOOL v62 = v7;
      int v31 = v15;
      id v61 = v31;
      v57 = self;
      id v32 = v14;
      id v58 = v32;
      id v33 = v10;
      id v59 = v33;
      uint64_t v34 = (void (**)(void, void, void, void))MEMORY[0x186E33044](v55);
      [v32 vmuTask];
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = v31;
      uint64_t v37 = (VMUTaskMemoryScanner *)v33;
      if (v54)
      {
        uint64_t v38 = _classDataExtV1ofClass(v35, v36, a3);
        if (v38) {
          unint64_t v39 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v35, *(void *)(v38 + 8));
        }
        else {
          unint64_t v39 = 0LL;
        }
        unint64_t v41 = maskPointerToMethodList(a3 + 8, v39, v37);
      }

      else
      {
        uint64_t v40 = _classDataRWV0ofClass(v35, v36, a3);
        if (v40) {
          unint64_t v41 = *(void *)(v40 + 16);
        }
        else {
          unint64_t v41 = 0LL;
        }
      }

      v34[2](v34, v41, 6LL, 7LL);
      [v32 vmuTask];
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = v36;
      if (v54)
      {
        uint64_t v44 = _classDataExtV1ofClass(v42, v43, a3);
        if (v44)
        {
          uint64_t v45 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v42, *(void *)(v44 + 16));
          goto LABEL_29;
        }
      }

      else
      {
        uint64_t v46 = _classDataRWV0ofClass(v42, v43, a3);
        if (v46)
        {
          uint64_t v45 = *(void *)(v46 + 24);
          goto LABEL_29;
        }
      }

      uint64_t v45 = 0LL;
LABEL_29:

      v34[2](v34, v45, 8LL, 9LL);
      [v32 vmuTask];
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = v43;
      if (v54)
      {
        id v15 = v53;
        uint64_t v49 = _classDataExtV1ofClass(v47, v48, a3);
        if (v49)
        {
          uint64_t v50 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v47, *(void *)(v49 + 24));
LABEL_35:

          v34[2](v34, v50, 10LL, 11LL);
          goto LABEL_36;
        }
      }

      else
      {
        uint64_t v51 = _classDataRWV0ofClass(v47, v48, a3);
        id v15 = v53;
        if (v51)
        {
          uint64_t v50 = *(void *)(v51 + 32);
          goto LABEL_35;
        }
      }

      uint64_t v50 = 0LL;
      goto LABEL_35;
    }
  }

uint64_t __103__VMUClassInfo__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock___block_invoke( uint64_t result,  uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 32) addressIsInSharedCache:a2];
    if ((result & 1) == 0)
    {
      if ((a2 & 1) != 0)
      {
        unint64_t v4 = a2 & 0xFFFFFFFFFFFFFFFELL;
        result = (*(uint64_t (**)(void))(*(void *)(v3 + 64) + 16LL))();
        if ((_DWORD)result != -1)
        {
          result = (*(uint64_t (**)(void))(*(void *)(v3 + 72) + 16LL))();
          if (result)
          {
            int v5 = *(_DWORD *)result;
            if (*(_DWORD *)result)
            {
              unint64_t v6 = v4 + *(unsigned int *)(*(void *)(v3 + 40) + 16LL);
              result = (*(uint64_t (**)(void))(*(void *)(v3 + 72) + 16LL))();
              if (result)
              {
                uint64_t v7 = result;
                uint64_t v8 = 0LL;
                do
                {
                  if (*(void *)(v7 + 8 * v8))
                  {
                    result = [*(id *)(v3 + 32) addressIsInSharedCache:];
                    if ((result & 1) == 0)
                    {
                      [*(id *)(v3 + 48) vmuTask];
                      id v9 = (void *)objc_claimAutoreleasedReturnValue();
                      unint64_t v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v9, *(void *)(v7 + 8 * v8));

                      maskPointerToMethodList( v6 + (*(_DWORD *)(*(void *)(v3 + 40) + 16LL) * v8),  v10,  *(VMUTaskMemoryScanner **)(v3 + 56));
                      result = (*(uint64_t (**)(void))(*(void *)(v3 + 64) + 16LL))();
                    }
                  }

                  ++v8;
                }

                while (v5 != (_DWORD)v8);
              }
            }
          }
        }
      }

      else
      {
        return (*(uint64_t (**)(void))(*(void *)(v3 + 64) + 16LL))();
      }
    }
  }

  return result;
}

- (void)identifyObjCClassStructureBlocksWithScanner:(id)a3 addressIdentifierBlock:(id)a4
{
}

- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  [v8 serialize64:self->_remoteIsa];
  __int128 v10 = *(_OWORD *)&self->_remotePointerSize;
  uint64_t v11 = *(void *)&self->_ro_flags;
  unsigned int remoteType = self->_remoteType;
  [v8 _serializeValues:&v10 count:7];
  if (self->_ivarCount)
  {
    unint64_t v9 = 0LL;
    do
      [v8 serialize32:[v7 indexForFieldInfo:self->_localIvarList[v9++]]];
    while (v9 < self->_ivarCount);
  }

  [v8 serializeString:self->_remoteClassName];
  [v8 serializeString:self->_displayName];
  [v8 serializeString:self->_remoteBinaryPath];
  [v8 serialize32:[v7 indexForClassInfo:self->_superclassLayout]];
}

- (VMUClassInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6
{
  v55[7] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  uint64_t v12 = -[VMUClassInfo init](&v54, sel_init);
  if (!v12) {
    goto LABEL_29;
  }
  uint64_t v53 = 0LL;
  if (!a6) {
    a6 = (id *)&v53;
  }
  v12->_remoteIsa = [v10 deserialize64WithError:a6];
  if (*a6) {
    goto LABEL_8;
  }
  p_ivarCount = &v12->_ivarCount;
  v55[0] = &v12->_remotePointerSize;
  v55[1] = &v12->_ivarCount;
  p_unsigned int instanceSize = &v12->_instanceSize;
  v55[2] = &v12->_superclassOffset;
  v55[3] = &v12->_instanceSize;
  void v55[4] = &v12->_ro_flags;
  v55[5] = &v12->_rw_flags;
  v55[6] = &v12->_remoteType;
  uint64_t v15 = [v10 _deserializeValues:7 error:a6];
  id v16 = *a6;
  if (*a6) {
    goto LABEL_8;
  }
  do
  {
    *(_DWORD *)v55[(void)v16] = *(_DWORD *)(v15 + 4LL * (void)v16);
    id v16 = (char *)v16 + 1;
  }

  while (v16 != (id)7);
  if (*a6) {
    goto LABEL_8;
  }
  v12->_localIvarList = (id *)calloc(*p_ivarCount + 1, 8uLL);
  if (a5 < 4)
  {
    if (a5 == 3)
    {
      if (*p_ivarCount)
      {
        uint64_t v24 = 0LL;
        do
        {
          char v25 = -[VMUFieldInfo initWithSerializer:classMap:version:error:]( objc_alloc(&OBJC_CLASS___VMUFieldInfo),  "initWithSerializer:classMap:version:error:",  v10,  v11,  3LL,  a6);
          localIvarList = v12->_localIvarList;
          id v27 = localIvarList[v24];
          localIvarList[v24] = v25;

          if (*a6) {
            goto LABEL_8;
          }
        }

        while (++v24 < (unint64_t)*p_ivarCount);
      }
    }

    else
    {
      unsigned int superclassOffset = *p_instanceSize;
      if (*p_instanceSize <= v12->_superclassOffset) {
        unsigned int superclassOffset = v12->_superclassOffset;
      }
      *p_unsigned int instanceSize = superclassOffset;
      v12->_weakLayout = (const char *)[v10 copyDeserializedNullTerminatedBytesWithError:a6];
      if (*a6) {
        goto LABEL_8;
      }
      v12->_strongLayout = (const char *)[v10 copyDeserializedNullTerminatedBytesWithError:a6];
      if (*a6) {
        goto LABEL_8;
      }
      if (*p_ivarCount)
      {
        uint64_t v52 = 0LL;
        do
        {
          unint64_t v39 = (int *)[v10 _deserializeValues:2 error:a6];
          if (*a6) {
            goto LABEL_8;
          }
          int v40 = *v39;
          int v41 = v39[1];
          uint64_t v42 = [v10 copyDeserializedNullTerminatedBytesWithError:a6];
          if (*a6) {
            goto LABEL_8;
          }
          uint64_t v43 = (const char *)v42;
          uint64_t v44 = (const char *)[v10 copyDeserializedNullTerminatedBytesWithError:a6];
          if (*a6) {
            goto LABEL_8;
          }
          LocalIvar = (unsigned int *)_createLocalIvar(v43, v44, v40, v41, 1);
          uint64_t v51 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
          uint64_t v46 = LocalIvar[7];
          ptrdiff_t Offset = ivar_getOffset((Ivar)LocalIvar);
          uint64_t v48 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:]( v51,  "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:",  LocalIvar,  v46,  Offset,  ivar_getName((Ivar)LocalIvar),  -[VMUClassInfo isARR](v12, "isARR"),  v12->_remotePointerSize == 8);
          uint64_t v49 = v12->_localIvarList;
          id v50 = v49[v52];
          v49[v52] = (id)v48;

          _destroyLocalIvar((objc_ivar *)LocalIvar);
        }

        while (++v52 < (unint64_t)v12->_ivarCount);
      }

      -[VMUClassInfo _parseIvarsAndLayouts](v12, "_parseIvarsAndLayouts");
    }
  }

  else if (*p_ivarCount)
  {
    int v18 = 0;
    int v19 = 0;
    do
    {
      uint64_t v20 = [v10 deserialize32WithError:a6];
      if (*a6) {
        goto LABEL_8;
      }
      uint64_t v21 = v20;
      uint64_t v22 = (void *)MEMORY[0x186E32E40]();
      [v11 fieldInfoForIndex:v21];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23) {
        objc_storeStrong(&v12->_localIvarList[v18++], v23);
      }
      else {
        NSLog(@"Bad field index in document");
      }

      objc_autoreleasePoolPop(v22);
    }

    while (++v19 < *p_ivarCount);
  }

  uint64_t v28 = [v10 copyDeserializedStringWithError:a6];
  remoteClassName = v12->_remoteClassName;
  v12->_remoteClassName = (NSString *)v28;

  if (!*a6)
  {
    if (a5 < 3
      || (uint64_t v30 = [v10 copyDeserializedStringWithError:a6],
          displayName = v12->_displayName,
          v12->_displayName = (NSString *)v30,
          displayName,
          !*a6))
    {
      uint64_t v32 = [v10 copyDeserializedStringWithError:a6];
      remoteBinaryPath = v12->_remoteBinaryPath;
      v12->_remoteBinaryPath = (NSString *)v32;

      if (!*a6)
      {
        uint64_t v34 = [v10 deserialize32WithError:a6];
        if (!*a6)
        {
          uint64_t v35 = [v11 classInfoForIndex:v34];
          superclassLayout = v12->_superclassLayout;
          v12->_superclassLayout = (VMUClassInfo *)v35;

          v12->_defaultScanType = 1;
          -[VMUClassInfo _demangleClassName](v12, "_demangleClassName");
LABEL_29:
          v17 = v12;
          goto LABEL_30;
        }
      }
    }
  }

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[VMUClassInfo encodeWithCoder:]", "VMUClassInfo.mm", 2014, "0");
}

- (VMUClassInfo)initWithCoder:(id)a3
{
  unint64_t v4 = (NSCoder *)a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  int v5 = -[VMUClassInfo init](&v30, sel_init);
  unint64_t v6 = v5;
  id v7 = v5;
  if (v5)
  {
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "Q", &v5->_remoteIsa, 8LL);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I");
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_ivarCount, 4LL);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_superclassOffset, 4LL);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_instanceSize, 4LL);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_ro_flags, 4LL);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_rw_flags, 4LL);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "i", &v6->_remoteType, 4LL);
    unsigned int instanceSize = v6->_instanceSize;
    if (instanceSize <= v6->_superclassOffset) {
      unsigned int instanceSize = v6->_superclassOffset;
    }
    v6->_unsigned int instanceSize = instanceSize;
    v7->_weakLayout = (const char *)_decodeNullTerminatedBytes(v4);
    v7->_strongLayout = (const char *)_decodeNullTerminatedBytes(v4);
    v7->_localIvarList = (id *)calloc(v7->_ivarCount + 1, 8uLL);
    if (v7->_ivarCount)
    {
      unint64_t v9 = 0LL;
      do
      {
        id v10 = v4;
        -[NSCoder decodeValueOfObjCType:at:size:](v10, "decodeValueOfObjCType:at:size:", "I", &v32, 4LL);
        id v11 = _decodeNullTerminatedBytes(v10);
        uint64_t v12 = _decodeNullTerminatedBytes(v10);
        -[NSCoder decodeValueOfObjCType:at:size:](v10, "decodeValueOfObjCType:at:size:", "I", &v31, 4LL);
        int v13 = v31;
        int v14 = v32;
        uint64_t v15 = malloc(0x28uLL);
        v15[1] = v11;
        v15[2] = v12;
        id v16 = malloc(4uLL);
        void *v15 = v16;
        *id v16 = v14;
        *((_DWORD *)v15 + 7) = v13;
        *((_BYTE *)v15 + 32) = 1;

        v17 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
        uint64_t v18 = *((unsigned int *)v15 + 7);
        ptrdiff_t Offset = ivar_getOffset((Ivar)v15);
        uint64_t v20 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:]( v17,  "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:",  v15,  v18,  Offset,  ivar_getName((Ivar)v15),  -[VMUClassInfo isARR](v7, "isARR"),  v6->_remotePointerSize == 8);
        localIvarList = v7->_localIvarList;
        id v22 = localIvarList[v9];
        localIvarList[v9] = (id)v20;

        _destroyLocalIvar((objc_ivar *)v15);
        ++v9;
      }

      while (v9 < v7->_ivarCount);
    }

    -[VMUClassInfo _parseIvarsAndLayouts](v7, "_parseIvarsAndLayouts");
    uint64_t v23 = -[NSCoder decodeObject](v4, "decodeObject");
    remoteClassName = v7->_remoteClassName;
    v7->_remoteClassName = (NSString *)v23;

    uint64_t v25 = -[NSCoder decodeObject](v4, "decodeObject");
    remoteBinaryPath = v7->_remoteBinaryPath;
    v7->_remoteBinaryPath = (NSString *)v25;

    uint64_t v27 = -[NSCoder decodeObject](v4, "decodeObject");
    superclassLayout = v7->_superclassLayout;
    v7->_superclassLayout = (VMUClassInfo *)v27;

    v7->_defaultScanType = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_remoteClassName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  int v5 = (VMUClassInfo *)a3;
  unint64_t v6 = v5;
  if (v5 == self)
  {
    char v10 = 1;
  }

  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v7 = v6;
        uint64_t v8 = -[VMUClassInfo remoteIsa](v7, "remoteIsa");
        unint64_t remoteIsa = self->_remoteIsa;
        if (remoteIsa | v8)
        {
          char v10 = remoteIsa == v8;
LABEL_19:

          goto LABEL_20;
        }

        unsigned int remoteType = self->_remoteType;
        if (remoteType != -[VMUClassInfo infoType](v7, "infoType"))
        {
          char v10 = 0;
          goto LABEL_19;
        }

        remoteClassName = self->_remoteClassName;
        -[VMUClassInfo className](v7, "className");
        int v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (remoteClassName == v13
          || (int v14 = self->_remoteClassName,
              -[VMUClassInfo className](v7, "className"),
              id v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSString isEqualToString:](v14, "isEqualToString:", v3)))
        {
          -[VMUClassInfo binaryPath](self, "binaryPath");
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUClassInfo binaryPath](v7, "binaryPath");
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 == v16)
          {

            char v10 = 1;
          }

          else
          {
            v17 = -[VMUClassInfo binaryPath](self, "binaryPath");
            -[VMUClassInfo binaryPath](v7, "binaryPath");
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            char v10 = [v17 isEqualToString:v18];
          }

          if (remoteClassName == v13) {
            goto LABEL_18;
          }
        }

        else
        {
          char v10 = 0;
        }

LABEL_18:
        goto LABEL_19;
      }
    }

    char v10 = 0;
  }

- (void)_logDescriptionWithSuperclasses:(BOOL)a3 indentation:(int)a4 toLogger:(id)a5
{
  BOOL v6 = a3;
  int v40 = (void (**)(id, void *))a5;
  int v36 = a4;
  if (a4)
  {
    uint64_t v8 = [MEMORY[0x1896NSStringrmat:@"%d" instanceSize:[self instanceSize]];
    unint64_t v9 = "";
  }

  else
  {
    uint64_t v8 = [MEMORY[0x1896NSStringrmat:@"instance size %d, allocation size %d" -[VMUClassInfo instanceSize](self, "instanceSize"), malloc_good_size(-[VMUClassInfo instanceSize](self, "instanceSize"))];
    unint64_t v9 = "Class: ";
  }

  char v10 = (void *)v8;
  id v11 = (void *)NSString;
  -[VMUClassInfo className](self, "className");
  unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v35 = v6;
  uint64_t v38 = v10;
  displayName = self->_displayName;
  if (displayName) {
    int v13 = " as '";
  }
  else {
    int v13 = "";
  }
  uint64_t v14 = -[NSString UTF8String](displayName, "UTF8String");
  if (v14) {
    uint64_t v15 = (const char *)v14;
  }
  else {
    uint64_t v15 = "";
  }
  if (self->_displayName) {
    id v16 = "'";
  }
  else {
    id v16 = "";
  }
  id v17 = -[VMUClassInfo typeName](self, "typeName");
  uint64_t v18 = [v17 UTF8String];
  BOOL v19 = -[VMUClassInfo isARR](self, "isARR");
  BOOL v20 = -[VMUClassInfo hasSpecificLayout](self, "hasSpecificLayout");
  uint64_t v21 = "MRC";
  if (v19) {
    uint64_t v21 = "ARC";
  }
  id v22 = ", Specific";
  if (!v20) {
    id v22 = "";
  }
  uint64_t v37 = (2 * v36);
  [v11 stringWithFormat:@"%*s'%@'%s%s%s [%@] - %s, %s%s {", v37, v9, v39, v13, v15, v16, v38, v18, v21, v22];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2](v40, v23);

  if (v35)
  {
    superclassLayout = self->_superclassLayout;
    if (superclassLayout) {
      -[VMUClassInfo _logDescriptionWithSuperclasses:indentation:toLogger:]( superclassLayout,  "_logDescriptionWithSuperclasses:indentation:toLogger:",  1LL,  (v36 + 1),  v40);
    }
  }

  unsigned int v25 = -[VMUClassInfo instanceSize](self->_superclassLayout, "instanceSize");
  if (self->_ivarCount)
  {
    unsigned int v26 = v25;
    unint64_t v27 = 0LL;
    do
    {
      int v28 = [self->_localIvarList[v27] offset];
      unsigned int v29 = [self->_localIvarList[v27] offset];
      if (v29 >= v26) {
        unsigned int v30 = v26;
      }
      else {
        unsigned int v30 = v29;
      }
      uint64_t v31 = v28 - v30;
      if ((_DWORD)v31)
      {
        [MEMORY[0x1896NSStringrmat:@"%*s<< %u alignment bytes >>",  (v37 + 3),  "",  v31];
        int v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40[2](v40, v32);
      }

      _formatIvar((VMUFieldInfo *)self->_localIvarList[v27], (v37 + 5));
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2](v40, v33);

      LODWORD(v33) = [self->_localIvarList[v27] offset];
      unsigned int v26 = [self->_localIvarList[v27++] size] + (_DWORD)v33;
    }

    while (v27 < self->_ivarCount);
  }

  [MEMORY[0x189NSStringormat:@"%*s}" v37, ""];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2](v40, v34);
}

- (void)enumerateSublayoutsForSize:(unsigned int)a3 withBlock:(id)a4
{
  if (self->_ivarCount)
  {
    unint64_t v7 = 0LL;
    do
      -[VMUFieldInfo enumerateSublayoutsForSize:parentOffset:remotePointerSize:withBlock:]( (uint64_t)self->_localIvarList[v7++],  a3,  0,  self->_remotePointerSize,  (uint64_t)a4);
    while (v7 < self->_ivarCount);
  }

- (id)_copyWithInstanceSize:(unsigned int)a3 superclassOffset:(unsigned int)a4 asVariant:(BOOL)a5 mutable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v12 = (char *)objc_alloc_init((Class)objc_opt_class());
  int v13 = v12;
  if (v8) {
    unint64_t remoteIsa = 0LL;
  }
  else {
    unint64_t remoteIsa = self->_remoteIsa;
  }
  *((void *)v12 + 1) = remoteIsa;
  *((_DWORD *)v12 + 4) = self->_remotePointerSize;
  *((_DWORD *)v12 + 5) = self->_ivarCount;
  if (self->_ivarCount)
  {
    uint64_t v15 = (void *)MEMORY[0x186E32E40]();
    *((void *)v13 + 6) = calloc(self->_ivarCount + 1, 8uLL);
    if (self->_ivarCount)
    {
      uint64_t v16 = 0LL;
      unint64_t v17 = 0LL;
      do
      {
        localIvarList = self->_localIvarList;
        id v19 = localIvarList[v16];
        if (v7)
        {
          BOOL v6 = (void *)[localIvarList[v16] mutableCopy];
          id v19 = v6;
        }

        objc_storeStrong((id *)(*((void *)v13 + 6) + v16 * 8), v19);
        if (v7) {

        }
        ++v17;
        ++v16;
      }

      while (v17 < self->_ivarCount);
    }

    objc_autoreleasePoolPop(v15);
  }

  *((_DWORD *)v13 + 6) = a4;
  *((_DWORD *)v13 + 7) = a3;
  *((_DWORD *)v13 + 8) = self->_ro_flags;
  *(void *)(v13 + 36) = *(void *)&self->_rw_flags;
  *((_DWORD *)v13 + 11) = self->_remoteType;
  uint64_t v20 = -[NSString copy](self->_remoteClassName, "copy");
  uint64_t v21 = (void *)*((void *)v13 + 7);
  *((void *)v13 + 7) = v20;

  uint64_t v22 = -[NSString copy](self->_displayName, "copy");
  uint64_t v23 = (void *)*((void *)v13 + 8);
  *((void *)v13 + 8) = v22;

  uint64_t v24 = -[NSString copy](self->_remoteBinaryPath, "copy");
  unsigned int v25 = (void *)*((void *)v13 + 9);
  *((void *)v13 + 9) = v24;

  objc_storeStrong((id *)v13 + 10, self->_superclassLayout);
  if (v8) {
    unsigned int v26 = self;
  }
  else {
    unsigned int v26 = 0LL;
  }
  if (self->_genericLayout) {
    genericLayout = self->_genericLayout;
  }
  else {
    genericLayout = v26;
  }
  objc_storeStrong((id *)v13 + 11, genericLayout);
  v13[146] = self->_usesSwiftRefcounting;
  return v13;
}

- (void)_applyExtendedLayout:(const char *)a3 withSize:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    uint64_t v7 = MEMORY[0x1895F87A8];
    int v33 = 0;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke;
    v29[3] = &unk_189DFE7C8;
    v29[4] = &v30;
    _processExtendedLayout((unint64_t)a3, v29);
    unsigned int superclassOffset = self->_superclassOffset;
    BOOL v9 = a4 >= superclassOffset;
    unsigned int v10 = a4 - superclassOffset;
    if (v9)
    {
      unsigned int v11 = v10 / self->_remotePointerSize;
      if (*((_DWORD *)v31 + 6) > v11) {
        unsigned int v11 = *((_DWORD *)v31 + 6);
      }
      *((_DWORD *)v31 + 6) = v11;
      uint64_t ivarCount = self->_ivarCount;
      unsigned int v13 = v11 + 1;
      uint64_t v14 = (id *)realloc(self->_localIvarList, 8LL * (ivarCount + v11 + 1));
      if (v14)
      {
        uint64_t v15 = v14;
        bzero(&v14[ivarCount], 8LL * v13);
        self->_localIvarList = v15;
        uint64_t v25 = 0LL;
        unsigned int v26 = &v25;
        uint64_t v27 = 0x2020000000LL;
        unsigned int v28 = self->_superclassOffset;
        v24[0] = v7;
        v24[1] = 3221225472LL;
        v24[2] = __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke_2;
        v24[3] = &unk_189DFE7F0;
        v24[4] = self;
        v24[5] = &v25;
        _processExtendedLayout((unint64_t)a3, v24);
        for (unsigned int i = self->_ivarCount; i < *((_DWORD *)v31 + 6); ++i)
        {
          unint64_t v17 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
          uint64_t v18 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v17,  "initWithName:type:scan:offset:size:",  @"[capture]",  0LL,  1LL,  *((unsigned int *)v26 + 6),  self->_remotePointerSize);
          -[VMUMutableFieldInfo setIsCapture:](v18, "setIsCapture:", 1LL);
          localIvarList = self->_localIvarList;
          uint64_t v20 = self->_ivarCount;
          id v21 = localIvarList[v20];
          localIvarList[v20] = v18;
          uint64_t v22 = v18;

          unsigned int remotePointerSize = self->_remotePointerSize;
          ++self->_ivarCount;
          *((_DWORD *)v26 + 6) += remotePointerSize;
        }

        _Block_object_dispose(&v25, 8);
      }

      else
      {
        self->_localIvarList = 0LL;
      }
    }

    _Block_object_dispose(&v30, 8);
  }

uint64_t __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) += a4;
  return result;
}

void __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke_2( uint64_t a1,  uint64_t a2,  int a3,  int a4)
{
  if (a4)
  {
    int v4 = a4;
    if (a3) {
      BOOL v8 = @"[__block capture]";
    }
    else {
      BOOL v8 = @"[capture]";
    }
    do
    {
      BOOL v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  v8,  0LL,  a2,  *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  *(unsigned int *)(*(void *)(a1 + 32) + 16LL));
      -[VMUMutableFieldInfo setIsCapture:](v9, "setIsCapture:", 1LL);
      if (a3) {
        -[VMUMutableFieldInfo setIsByref:](v9, "setIsByref:", 1LL);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(v10 + 48);
      uint64_t v12 = *(unsigned int *)(v10 + 20);
      unsigned int v13 = *(void **)(v11 + 8 * v12);
      *(void *)(v11 + 8 * v12) = v9;
      uint64_t v14 = v9;

      ++*(_DWORD *)(*(void *)(a1 + 32) + 20LL);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += *(_DWORD *)(*(void *)(a1 + 32) + 16LL);

      --v4;
    }

    while (v4);
  }

- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 memoryReader:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 withScanner:(id)a5 memoryReader:(id)a6
{
  if (a6)
  {
    if (!self->_genericLayout)
    {
      uint64_t v9 = *(void *)&a4;
      if (-[VMUClassInfo hasSpecificLayout](self, "hasSpecificLayout"))
      {
        uint64_t v11 = self->_superclassLayout;
        uint64_t v12 = -[VMUClassInfo hasVariantLayout](self->_superclassLayout, "hasVariantLayout");
        if ((_DWORD)v12)
        {
          uint64_t v13 = -[VMUClassInfo instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:]( self->_superclassLayout,  "instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:",  a3,  v9,  a5,  a6);

          uint64_t v11 = (VMUClassInfo *)v13;
          goto LABEL_10;
        }

        if (self->_variantEvaluators || self->_complexVariantEvaluators)
        {
LABEL_10:
          v113 = 0LL;
          variantEvaluators = self->_variantEvaluators;
          uint64_t v17 = MEMORY[0x1895F87A8];
          v112[0] = MEMORY[0x1895F87A8];
          v112[1] = 3221225472LL;
          v112[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_2;
          v112[3] = &__block_descriptor_56_e48_B16__0___B__Q__VMUTaskMemoryScanner_____v__QQ__8lu40l8u48l8;
          v112[4] = a3;
          v112[5] = a5;
          v112[6] = a6;
          int v18 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke( v12,  variantEvaluators,  &v113,  v112);
          uint64_t v108 = 0LL;
          unsigned int v109 = &v108;
          uint64_t v110 = 0x2020000000LL;
          uint64_t v111 = [@"seed" hash];
          uint64_t v107 = 0LL;
          complexVariantEvaluators = self->_complexVariantEvaluators;
          v106[0] = v17;
          v106[1] = 3221225472LL;
          v106[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_3;
          v106[3] = &unk_189DFE838;
          v106[5] = a3;
          v106[6] = a6;
          v106[4] = &v108;
          int v20 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke( v111,  complexVariantEvaluators,  &v107,  v106);
          v105[0] = v17;
          v105[1] = 3221225472LL;
          v105[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_4;
          v105[3] = &__block_descriptor_48_e5_v8__0l;
          v105[4] = v113;
          v105[5] = v107;
          uint64_t v21 = MEMORY[0x186E33044](v105);
          uint64_t v22 = (void (**)(void))v21;
          if (((v18 | v20) & 1) == 0 && v11 == self->_superclassLayout)
          {
            (*(void (**)(uint64_t))(v21 + 16))(v21);
            uint64_t v14 = self;
LABEL_31:

            _Block_object_dispose(&v108, 8);
LABEL_32:

            return v14;
          }

          uint64_t v99 = 0LL;
          uint64_t v100 = &v99;
          uint64_t v101 = 0x3032000000LL;
          uint64_t v102 = __Block_byref_object_copy__6;
          unint64_t v103 = __Block_byref_object_dispose__6;
          id v104 = 0LL;
          uint64_t v23 = (void *)MEMORY[0x186E32E40]();
          v92[0] = v17;
          v92[1] = 3221225472LL;
          v92[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_5;
          v92[3] = &unk_189DFE8D0;
          v92[4] = self;
          unsigned int v94 = &v99;
          unsigned int v95 = v113;
          uint64_t v96 = v107;
          unint64_t v97 = a3;
          id v98 = a6;
          uint64_t v24 = v11;
          unsigned int v93 = v24;
          uint64_t v25 = (void (**)(void))MEMORY[0x186E33044](v92);
          if (!v113)
          {
            unint64_t v26 = 0LL;
            goto LABEL_22;
          }

          unint64_t v26 = 0LL;
          uint64_t v27 = (unsigned __int8 *)v113 + 3;
          unint64_t v28 = (*v113 + 7);
          uint64_t v29 = (v28 >> 3) + 4;
          unint64_t v30 = (v28 >> 3) + 8;
          do
          {
            uint64_t v31 = *(v27 - 3) + 16 * v26;
            unint64_t v32 = *(v27 - 2)
                + 16
                * ((v31 ^ ((unint64_t)(v31 & 0xF0000000) >> 24)) & ~(unint64_t)(v31 & 0xF0000000));
            unint64_t v33 = *(v27 - 1)
                + 16
                * ((v32 ^ ((unint64_t)(v32 & 0xF0000000) >> 24)) & ~(unint64_t)(v32 & 0xF0000000));
            unsigned int v34 = *v27;
            v27 += 4;
            unint64_t v35 = v34
                + 16
                * ((v33 ^ ((unint64_t)(v33 & 0xF0000000) >> 24)) & ~(unint64_t)(v33 & 0xF0000000));
            unint64_t v26 = (v35 ^ ((unint64_t)(v35 & 0xF0000000) >> 24)) & ~(unint64_t)(v35 & 0xF0000000);
            v30 -= 4LL;
          }

          while (v30 > 7);
          if (v30 != 5)
          {
            if (v30 != 6)
            {
              if (v30 != 7)
              {
LABEL_22:
                unint64_t v39 = v109;
                unint64_t v40 = v26 + 37 * v109[3];
                v109[3] = v40;
                if (v24 == self->_superclassLayout)
                {
                  uint64_t v42 = 0LL;
                }

                else
                {
                  unsigned int v41 = [a5 _indexForClassInfo:v24];
                  unint64_t v39 = v109;
                  unint64_t v40 = v109[3];
                  uint64_t v42 = v41;
                }

                v39[3] = v42 + 37 * v40;
                [a5 _cachedVariantForGenericInfo:self];
                uint64_t v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
                if (v14)
                {
                  v22[2](v22);
                  uint64_t v43 = v14;
                }

                else
                {
                  v25[2](v25);
                  [a5 _registerVariant:v100[5] forGenericInfo:self variantKey:v109[3]];
                }

                objc_autoreleasePoolPop(v23);
                if (!v14)
                {
                  v22[2](v22);
                  uint64_t v14 = (VMUClassInfo *)(id)v100[5];
                }

                _Block_object_dispose(&v99, 8);

                goto LABEL_31;
              }

              uint64_t v36 = *((unsigned __int8 *)v113 + v29 - 3) + 16 * v26;
              unint64_t v26 = (v36 ^ ((unint64_t)(v36 & 0xF0000000) >> 24)) & ~(unint64_t)(v36 & 0xF0000000);
            }

            uint64_t v37 = *((unsigned __int8 *)v113 + v29 - 2) + 16 * v26;
            unint64_t v26 = (v37 ^ ((unint64_t)(v37 & 0xF0000000) >> 24)) & ~(unint64_t)(v37 & 0xF0000000);
          }

          uint64_t v38 = *((unsigned __int8 *)v113 + v29 - 1) + 16 * v26;
          unint64_t v26 = (v38 ^ ((unint64_t)(v38 & 0xF0000000) >> 24)) & ~(unint64_t)(v38 & 0xF0000000);
          goto LABEL_22;
        }

        uint64_t v44 = self;
        unsigned int remoteType = v44->_remoteType;
        if (remoteType != 0x80000000)
        {
          if (remoteType == 8 || remoteType == 1)
          {
            uint64_t v46 = (int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 8, 4LL);
            if (v46)
            {
              int v47 = *v46;
              if (*v46 >> 30 == 3)
              {
                unint64_t v48 = a3 + 24;
                unsigned int remotePointerSize = v44->_remotePointerSize;
                id v50 = a6;
                uint64_t v51 = v50;
                uint64_t v52 = (uint64_t (*)(id, unint64_t, uint64_t))*((void *)a6 + 2);
                if (remotePointerSize == 8)
                {
                  uint64_t v53 = (void *)v52(v50, v48, 8LL);
                  uint64_t v54 = v53 ? *v53 : 0LL;
                }

                else
                {
                  v69 = (_DWORD *)v52(v50, v48, 4LL);
                  unsigned int v70 = v69 ? *v69 : 0;
                  uint64_t v54 = v70;
                }

                if (v54)
                {
                  [a5 _cachedVariantForGenericInfo:v44 variantKey:v54];
                  uint64_t v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();

                  if (v14) {
                    goto LABEL_32;
                  }
                  if ((v47 & 0x2000000) != 0) {
                    uint64_t v75 = 40LL;
                  }
                  else {
                    uint64_t v75 = 24LL;
                  }
                  v76 = (unsigned int *)(*((uint64_t (**)(void *, uint64_t, uint64_t))a6 + 2))( v51,  v54 + 8,  4LL);
                  if (v76)
                  {
                    unsigned int v77 = *v76;
                    if (*v76 > v9)
                    {
                      uint64_t v14 = v44;
                      goto LABEL_32;
                    }
                  }

                  else
                  {
                    unsigned int v77 = 0;
                  }

                  unsigned int v91 = v77;
                  uint64_t v14 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:]( v44,  "_copyWithInstanceSize:superclassOffset:asVariant:mutable:");
                  uint64_t v80 = v75 + v54;
                  unsigned int v81 = v44->_remotePointerSize;
                  id v82 = v51;
                  uint64_t v83 = v82;
                  uint64_t v84 = (uint64_t (*)(id, uint64_t, uint64_t))*((void *)a6 + 2);
                  if (v81 == 8)
                  {
                    uint64_t v85 = (unint64_t *)v84(v82, v80, 8LL);
                    if (v85)
                    {
                      unint64_t v86 = *v85;
LABEL_90:

                      if (v86 > 0xFFF)
                      {
                        uint64_t v88 = (void *)copy_remote_layout_at(v86, v83);
                        -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v88, v91);
                        if (v88) {
                          free(v88);
                        }
                      }

                      else
                      {
                        -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v86, v91);
                      }

                      [a5 _registerVariant:v14 forGenericInfo:v44 variantKey:v54];
                      goto LABEL_32;
                    }
                  }

                  else
                  {
                    uint64_t v87 = (unsigned int *)v84(v82, v80, 4LL);
                    if (v87)
                    {
                      unint64_t v86 = *v87;
                      goto LABEL_90;
                    }
                  }

                  unint64_t v86 = 0LL;
                  goto LABEL_90;
                }
              }
            }
          }

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v6 = a2;
  uint64_t v7 = a4;
  if (v6 && (unsigned int v8 = [v6 count], v9 = calloc(1uLL, ((v8 + 7) >> 3) + 4), *v9 = v8, *a3 = v9, v8))
  {
    unint64_t v10 = 0LL;
    char v11 = 0;
    uint64_t v12 = v8;
    do
    {
      [v6 objectAtIndexedSubscript:v10];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7[2](v7, v13))
      {
        char v11 = 1;
      }

      ++v10;
    }

    while (v12 != v10);
  }

  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_2( void *a1,  uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, a1[4], a1[5], a1[6]);
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_3( void *a1,  uint64_t a2)
{
  uint64_t v4 = 0LL;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, void, uint64_t *))(a2 + 16))(a2, a1[5], a1[6], &v4);
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v4 + 37LL * *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  return result;
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_4( uint64_t a1)
{
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_5( uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyWithInstanceSize:*(unsigned int *)(*(void *)(a1 + 32) + 28) superclassOffset:*(unsigned int *)(*(void *)(a1 + 32) + 24) asVariant:1 mutable:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v5 = *(unsigned int **)(a1 + 56);
  uint64_t v6 = MEMORY[0x1895F87A8];
  if (v5)
  {
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    unint64_t v35 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_6;
    uint64_t v36 = &unk_189DFE880;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v37 = *(void *)(a1 + 32);
    uint64_t v38 = v7;
    unsigned int v8 = v34;
    unsigned int v9 = *v5;
    if (*v5)
    {
      unsigned int v10 = 0;
      int v11 = 1;
      do
      {
        uint64_t v12 = (char *)v5 + (v10 >> 3);
        unsigned int v13 = v12[4];
        unsigned int v14 = v11;
        if (v12[4])
        {
          do
          {
            if ((v13 & 1) != 0) {
              v35((uint64_t)v8, v14 - 1);
            }
            if (v13 < 2) {
              break;
            }
            v13 >>= 1;
            BOOL v15 = v14++ >= v9;
          }

          while (!v15);
        }

        v10 += 8;
        v11 += 8;
      }

      while (v10 < v9);
    }
  }

  uint64_t v16 = *(unsigned int **)(a1 + 64);
  if (v16)
  {
    v27[0] = v6;
    v27[1] = 3221225472LL;
    unint64_t v28 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_7;
    uint64_t v29 = &unk_189DFE8A8;
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = v17;
    uint64_t v18 = *(void *)(a1 + 80);
    uint64_t v32 = *(void *)(a1 + 72);
    uint64_t v33 = v18;
    id v19 = v27;
    unsigned int v20 = *v16;
    if (*v16)
    {
      unsigned int v21 = 0;
      int v22 = 1;
      do
      {
        uint64_t v23 = (char *)v16 + (v21 >> 3);
        unsigned int v24 = v23[4];
        unsigned int v25 = v22;
        if (v23[4])
        {
          do
          {
            if ((v24 & 1) != 0) {
              v28(v19, v25 - 1);
            }
            if (v24 < 2) {
              break;
            }
            v24 >>= 1;
            BOOL v15 = v25++ >= v20;
          }

          while (!v15);
        }

        v21 += 8;
        v22 += 8;
      }

      while (v21 < v20);
    }
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSuperclassInfo:*(void *)(a1 + 40)];
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_6( uint64_t a1,  unsigned int a2)
{
  uint64_t v3 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_7( void *a1,  unsigned int a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, void))v3 + 2))( v3,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  a1[6],  a1[7]);
}

- (void)enumerateStoredEntriesForObject:(unint64_t)a3 ofSize:(unsigned int)a4 externalValues:(id)a5 block:(id)a6
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v40 = a5;
  unsigned int v10 = (void (**)(id, void, uint64_t, uint64_t))a6;
  if (self->_remoteType == 32)
  {
    uint64_t v42 = v10;
    uint64_t v62 = 0LL;
    uint64_t v63 = &v62;
    uint64_t v64 = 0x2020000000LL;
    uint64_t v65 = 0LL;
    uint64_t v58 = 0LL;
    unsigned int v59 = &v58;
    uint64_t v60 = 0x2020000000LL;
    int v61 = 0;
    uint64_t v52 = 0LL;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x3032000000LL;
    v55 = __Block_byref_object_copy__6;
    int v56 = __Block_byref_object_dispose__6;
    id v57 = 0LL;
    v50[0] = MEMORY[0x1895F87A8];
    v50[1] = 3221225472LL;
    v50[2] = __76__VMUClassInfo_enumerateStoredEntriesForObject_ofSize_externalValues_block___block_invoke;
    v50[3] = &unk_189DFE8F8;
    unsigned int v51 = a4;
    v50[4] = &v62;
    v50[5] = &v52;
    v50[6] = &v58;
    v50[7] = a3;
    -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", v50);
    unint64_t v39 = a3;
    unsigned int v41 = a4;
    if (v40)
    {
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v11 = v40;
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = [v11 countByEnumeratingWithState:&v46 objects:v66 count:16];
      if (v14)
      {
        uint64_t v43 = 0LL;
        uint64_t v44 = 0LL;
        BOOL v15 = 0LL;
        uint64_t v45 = 0LL;
        uint64_t v16 = *(void *)v47;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v47 != v16) {
              objc_enumerationMutation(v11);
            }
            id v18 = *(id *)(*((void *)&v46 + 1) + 8 * i);
            [v18 field];
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            int v20 = [v19 isStorageImplPointer];

            if (v20)
            {
              uint64_t v12 = [v18 value];
            }

            else
            {
              [v18 field];
              unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue();
              int v22 = [v21 isStorageBitmapPointer];

              if (v22)
              {
                uint64_t v13 = [v18 value];
              }

              else
              {
                [v18 field];
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                int v24 = [v23 isKeysPointer];

                if (v24)
                {
                  uint64_t v44 = [v18 value];
                }

                else
                {
                  [v18 field];
                  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue();
                  int v26 = [v25 isValuesPointer];

                  if (v26)
                  {
                    uint64_t v43 = [v18 value];
                  }

                  else if (v15 {
                         || ([v18 field],
                  }
                             uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(),
                             int v28 = [v27 isKeyField],
                             v27,
                             !v28))
                  {
                    if (!v45)
                    {
                      [v18 field];
                      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                      int v30 = [v29 isValueField];

                      if (v30)
                      {
                        [v18 field];
                        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
                      }

                      else
                      {
                        uint64_t v45 = 0LL;
                      }
                    }
                  }

                  else
                  {
                    [v18 field];
                    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                }
              }
            }
          }

          uint64_t v14 = [v11 countByEnumeratingWithState:&v46 objects:v66 count:16];
        }

        while (v14);
      }

      else
      {
        uint64_t v43 = 0LL;
        uint64_t v44 = 0LL;
        BOOL v15 = 0LL;
        uint64_t v45 = 0LL;
      }
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v43 = 0LL;
      uint64_t v44 = 0LL;
      BOOL v15 = 0LL;
      uint64_t v45 = 0LL;
    }

    if (v53[5])
    {
      uint64_t v31 = *((unsigned int *)v59 + 6);
      if ((_DWORD)v31)
      {
        if (v63[3])
        {
          unsigned int v32 = 1;
          do
          {
            v42[2](v42, v53[5], v31, [(id)v53[5] size]);
            uint64_t v31 = [(id)v53[5] stride] + v31;
          }

          while (v63[3] > (unint64_t)v32++);
        }
      }
    }

    if (v12 && v63[3])
    {
      uint64_t v34 = 0LL;
      unsigned int v35 = 0;
      uint64_t v36 = v43 - v12;
      uint64_t v37 = v44 - v12;
      unint64_t v38 = v13 - v12;
      while ((v34 & 7) != 0)
      {
        if ((v35 & 1) != 0) {
          goto LABEL_43;
        }
LABEL_47:
        v35 >>= 1;
        v37 += [v15 stride];
        v36 += [v45 stride];
      }

      if (v38 >= v41) {
        goto LABEL_48;
      }
      unsigned int v35 = *(unsigned __int8 *)(v39 + v38++);
      if ((v35 & 1) == 0) {
        goto LABEL_47;
      }
LABEL_43:
      goto LABEL_47;
    }

void __76__VMUClassInfo_enumerateStoredEntriesForObject_ofSize_externalValues_block___block_invoke( uint64_t a1,  void *a2)
{
  id v5 = a2;
  if ([v5 isArraySize]
    && (unint64_t)[v5 offset] + 8 <= *(unsigned int *)(a1 + 64))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *(void *)(v4
                                                                            + [v5 offset]);
  }

  else if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) {
         && [v5 isArrayEntries])
  }
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 offset];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
}

- (void)enumerateExternalValuesFromObject:(unint64_t)a3 withSize:(unsigned int)a4 block:(id)a5
{
  unsigned int v8 = (void (**)(id, void, void *))a5;
  if (self->_remoteType == 32)
  {
    uint64_t v17 = v8;
    unsigned int v9 = (void *)objc_opt_new();
    if (self->_ivarCount)
    {
      unint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      unint64_t v12 = a4;
      do
      {
        id v13 = self->_localIvarList[v10];
        if ((([v13 isStorageImplPointer] & 1) != 0
           || ([v13 isStorageBitmapPointer] & 1) != 0
           || ([v13 isKeysPointer] & 1) != 0
           || [v13 isValuesPointer])
          && (unint64_t)[v13 offset] + 8 <= v12)
        {
          uint64_t v14 = *(void *)(a3 + [v13 offset]);
          BOOL v15 = -[VMUFieldValue initWithField:value:]( objc_alloc(&OBJC_CLASS___VMUFieldValue),  "initWithField:value:",  v13,  v14);
          [v9 addObject:v15];
        }

        if (([v13 isKeyField] & 1) != 0 || objc_msgSend(v13, "isValueField"))
        {
          uint64_t v16 = -[VMUFieldValue initWithField:value:]( objc_alloc(&OBJC_CLASS___VMUFieldValue),  "initWithField:value:",  v13,  0LL);
          [v9 addObject:v16];
        }

        ++v10;
      }

      while (v10 < self->_ivarCount);
      if (v11 && [v9 count]) {
        v17[2](v17, v11, v9);
      }
    }

    unsigned int v8 = v17;
  }
}

- (VMUClassInfo)genericInfo
{
  if (self->_genericLayout) {
    self = self->_genericLayout;
  }
  return self;
}

- (unsigned)_totalIvarCount
{
  unsigned int ivarCount = self->_ivarCount;
  return -[VMUClassInfo _totalIvarCount](self->_superclassLayout, "_totalIvarCount") + ivarCount;
}

- (unsigned)_ivarGapForClass
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = 0;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  -[VMUClassInfo superclassInfo](self, "superclassInfo");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 instanceSize];

  int v15 = v4;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __32__VMUClassInfo__ivarGapForClass__block_invoke;
  v11[3] = &unk_189DFE920;
  v11[4] = &v16;
  v11[5] = &v12;
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v11);
  unsigned int v5 = -[VMUClassInfo instanceSize](self, "instanceSize");
  unsigned int v6 = *((_DWORD *)v13 + 6);
  BOOL v7 = v5 >= v6;
  unsigned int v8 = v5 - v6;
  if (!v7) {
    unsigned int v8 = 0;
  }
  unsigned int v9 = *((_DWORD *)v17 + 6) + v8;
  *((_DWORD *)v17 + 6) = v9;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __32__VMUClassInfo__ivarGapForClass__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [v7 offset];
  unsigned int v4 = [v7 offset];
  unsigned int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v4 < v5) {
    unsigned int v5 = v4;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += v3 - v5;
  int v6 = [v7 offset];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 size] + v6;
}

- (unsigned)ivarGapForClassHierarchy
{
  unsigned int v3 = -[VMUClassInfo pointerSize](self, "pointerSize");
  unsigned int v4 = self;
  unsigned int v5 = v4;
  int v6 = 0;
  if (v4)
  {
    int v7 = 0;
    int v8 = 0;
    int v9 = -v3;
    unsigned int v10 = (v3 - 1) & 0xFFFFFFFC;
    uint64_t v11 = v4;
    do
    {
      unsigned int v12 = -[VMUClassInfo _ivarGapForClass](v11, "_ivarGapForClass");
      uint64_t v13 = -[VMUClassInfo superclassInfo](v11, "superclassInfo");
      unsigned int v14 = v12 + v7;
      if ((v10 & (v12 + v7)) != 0) {
        int v15 = 0;
      }
      else {
        int v15 = v8;
      }
      if (v8) {
        int v7 = 0;
      }
      else {
        int v7 = v10 & (v12 + v7);
      }
      if (v8) {
        int v16 = v15;
      }
      else {
        int v16 = 0;
      }
      if (v11 == v5) {
        int v17 = -1;
      }
      else {
        int v17 = v9;
      }
      int v18 = v14 & v17;
      if (v11 == v5) {
        int v8 = v7;
      }
      else {
        int v8 = 0;
      }
      int v6 = v18 + v6 - v16;

      uint64_t v11 = (VMUClassInfo *)v13;
    }

    while (v13);
  }

  int v19 = malloc_good_size(-[VMUClassInfo instanceSize](v5, "instanceSize"));
  return v19 - malloc_good_size(-[VMUClassInfo instanceSize](v5, "instanceSize") - v6);
}

- (void)enumerateClassHierarchyWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, VMUClassInfo *))a3;
  -[VMUClassInfo enumerateClassHierarchyWithBlock:](self->_superclassLayout, "enumerateClassHierarchyWithBlock:");
  v4[2](v4, self);
}

- (void)enumerateAllFieldsWithBlock:(id)a3
{
  id v4 = a3;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self->_superclassLayout, "enumerateAllFieldsWithBlock:");
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v4);
}

- (void)enumerateTypeFieldsWithBlock:(id)a3
{
  id v4 = (void (**)(id, id, uint64_t, char *))a3;
  char v10 = 0;
  unsigned int v5 = -[VMUClassInfo _totalIvarCount](self, "_totalIvarCount");
  unsigned int ivarCount = self->_ivarCount;
  if (ivarCount)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = v5 - ivarCount;
    do
      v4[2](v4, self->_localIvarList[v7], v8 + v7, &v10);
    while (++v7 < (unint64_t)self->_ivarCount && v10 == 0);
  }
}

- (void)enumerateAllPointerFieldsWithBlock:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t result = (void *)-[VMUClassInfo enumerateAllPointerFieldsWithBlock:](result[10], a2);
    if (*((_DWORD *)v2 + 5))
    {
      uint64_t v3 = 0LL;
      do
      {
        id v4 = *(void **)(v2[6] + 8 * v3);
        unsigned int v5 = [v4 offset] % *((_DWORD *)v2 + 4);
        int v6 = [v4 offset];
        uint64_t v22 = v3;
        if (v5)
        {
          int v7 = *((_DWORD *)v2 + 4);
          unsigned int v8 = [v4 offset];
          v6 += v7 + v8 / *((_DWORD *)v2 + 4) * *((_DWORD *)v2 + 4) - v8;
        }

        int v9 = [v4 offset];
        uint64_t result = (void *)[v4 size];
        unsigned int v10 = (_DWORD)result + v9;
        while (*((_DWORD *)v2 + 4) + v6 <= v10)
        {
          uint64_t v11 = v6 - [v4 offset];
          int v23 = 0;
          uint64_t result = (id)[v4 getLeafFieldAtOffset:v11 leafOffset:&v23];
          if (result)
          {
            unsigned int v12 = result;
            int v13 = v23 + v6;
            int v14 = [result size];
            int v15 = v23;
            if ((v13 + v14) % *((_DWORD *)v2 + 4))
            {
              int v16 = [v12 size];
              int v17 = *((_DWORD *)v2 + 4);
              int v18 = v23 + v6;
              int v19 = [v12 size];
              v6 += v15
                  + v16
                  + v17
                  + (v18 + v19) / *((_DWORD *)v2 + 4) * *((_DWORD *)v2 + 4)
                  - (v18
                   + v19);
            }

            else
            {
              v6 += v15 + [v12 size];
            }

            uint64_t result = (void *)[v12 scanType];
            if ((_DWORD)result == 1)
            {
              uint64_t result = (void *)[v12 scannableSize];
              if (result >= *((_DWORD *)v2 + 4))
              {
                if (*((_DWORD *)v2 + 11) == 8
                  || (uint64_t result = (void *)[v12 typeNameMayDescribeReferencedAllocation], (_DWORD)result))
                {
                  int v20 = [v12 offset];
                  uint64_t result = (void *)[v12 size];
                  uint64_t result = (void *)(*(uint64_t (**)(uint64_t, void *, void *, uint64_t))(a2 + 16))( a2,  v4,  v12,  v11);
                }
              }
            }
          }

          else
          {
            v6 += *((_DWORD *)v2 + 4);
          }
        }

        uint64_t v3 = v22 + 1;
      }

      while (v22 + 1 < (unint64_t)*((unsigned int *)v2 + 5));
    }
  }

  return result;
}

- (void)enumerateScanningLocationsForSize:(unsigned int)a3 withBlock:(id)a4
{
  id v6 = a4;
  if (self->_remoteType != 32)
  {
    unsigned int superclassOffset = self->_superclassOffset;
    if (superclassOffset >= a3) {
      uint64_t v8 = a3;
    }
    else {
      uint64_t v8 = superclassOffset;
    }
    -[VMUClassInfo enumerateScanningLocationsForSize:withBlock:]( self->_superclassLayout,  "enumerateScanningLocationsForSize:withBlock:",  v8,  v6);
    if (self->_ivarCount) {
      int v9 = [*self->_localIvarList offset];
    }
    else {
      int v9 = 0x7FFFFFFF;
    }
    unsigned int instanceSize = self->_instanceSize;
    signed int v29 = instanceSize;
    if (instanceSize <= a3) {
      unsigned int instanceSize = a3;
    }
    unsigned int remotePointerSize = self->_remotePointerSize;
    uint64_t v12 = (remotePointerSize + self->_superclassOffset - 1) & -remotePointerSize;
    int v28 = instanceSize - remotePointerSize;
    if ((int)v12 <= (int)(instanceSize - remotePointerSize))
    {
      int v13 = 0;
      id v14 = 0LL;
      id v27 = v6;
      while (1)
      {
        int v15 = (void *)MEMORY[0x186E32E40]();
        if ((int)v12 >= v9)
        {
          do
          {
            int v16 = v14;
            id v14 = self->_localIvarList[v13];

            int v17 = [v14 offset];
            int v18 = [v14 scannableSize];
            if (++v13 >= self->_ivarCount) {
              int v9 = 0x7FFFFFFF;
            }
            else {
              int v9 = [self->_localIvarList[v13] offset];
            }
          }

          while ((int)v12 >= v9);
          signed int v29 = v18 + v17;
        }

        [v14 getLeafFieldAtOffset:v12 - [v14 offset] leafOffset:&v30];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 < (signed int)(self->_remotePointerSize + v12)
          || v14
          && (int v20 = [v14 offset],
              int v21 = v30,
              unsigned int v22 = v21 + v20 + [v19 size],
              id v6 = v27,
              v22 < self->_remotePointerSize + (int)v12))
        {
          if ((int)v12 >= (signed int)self->_instanceSize)
          {
            unsigned int defaultScanType = self->_defaultScanType;
            if (defaultScanType)
            {
              if (defaultScanType == 1) {
                unsigned int remotePointerSize = 1;
              }
              (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0LL, v12);
              char v24 = 0;
              id v6 = v27;
            }

            else
            {
              char v24 = 1;
            }

            goto LABEL_31;
          }
        }

        else
        {
          if (v19) {
            unsigned __int8 v25 = [v19 scanType];
          }
          else {
            unsigned __int8 v25 = self->_defaultScanType;
          }
          (*((void (**)(id, void *, uint64_t, void))v6 + 2))(v6, v19, v12, v25);
        }

        char v24 = 0;
LABEL_31:

        objc_autoreleasePoolPop(v15);
        uint64_t v12 = remotePointerSize + v12;
        else {
          char v26 = v24;
        }
        if ((v26 & 1) != 0)
        {

          break;
        }
      }
    }
  }
}

- (id)fieldAtOrBeforeOffset:(unsigned int)a3
{
  if (self->_instanceSize < a3) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __38__VMUClassInfo_fieldAtOrBeforeOffset___block_invoke;
  v5[3] = &unk_189DFE948;
  unsigned int v6 = a3;
  v5[4] = &v7;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", v5);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__VMUClassInfo_fieldAtOrBeforeOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  unsigned int v7 = [v9 offset];
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  if (v7)
  {
    if (v7 <= v8)
    {
LABEL_3:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
      goto LABEL_7;
    }
  }

  else if (!v8)
  {
    goto LABEL_3;
  }

  if (v7 > v8) {
    *a4 = 1;
  }
LABEL_7:
}

- (id)firstFieldWithName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = __Block_byref_object_copy__6;
  int v15 = __Block_byref_object_dispose__6;
  id v16 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __35__VMUClassInfo_firstFieldWithName___block_invoke;
  v8[3] = &unk_189DFE970;
  id v9 = v4;
  unsigned int v10 = &v11;
  id v5 = v4;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __35__VMUClassInfo_firstFieldWithName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  [v9 ivarName];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

- (void)_adjustInstanceSize
{
  unsigned int ivarCount = self->_ivarCount;
  if (ivarCount)
  {
    id v6 = self->_localIvarList[ivarCount - 1];
    int v4 = [v6 offset];
    unsigned int v5 = [v6 size] + v4;
    if (self->_instanceSize < v5) {
      self->_unsigned int instanceSize = v5;
    }
  }

- (void)_addFields:(id)a3
{
  id v8 = a3;
  unsigned int v4 = [v8 count];
  uint64_t ivarCount = self->_ivarCount;
  id v6 = (id *)realloc(self->_localIvarList, 8LL * (ivarCount + v4));
  if (v6)
  {
    unsigned int v7 = v6;
    bzero(&v6[ivarCount], 8LL * v4);
    self->_localIvarList = v7;
    self->_ivarCount += v4;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __27__VMUClassInfo__addFields___block_invoke;
    v9[3] = &unk_189DFE998;
    v9[4] = self;
    int v10 = ivarCount;
    [v8 enumerateObjectsUsingBlock:v9];
    -[VMUClassInfo _adjustInstanceSize](self, "_adjustInstanceSize");
  }

  else
  {
    self->_localIvarList = 0LL;
  }
}

void __27__VMUClassInfo__addFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)_replaceField:(id)a3 withFields:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (self->_ivarCount)
  {
    uint64_t v7 = 0LL;
    while (![self->_localIvarList[v7] isEqual:v14])
    {
    }

    unsigned int v8 = [v6 count];
    localIvarList = self->_localIvarList;
    unsigned int v10 = v8 - 1;
    if (v8 > 1)
    {
      uint64_t ivarCount = self->_ivarCount;
      id v12 = (id *)realloc(self->_localIvarList, 8LL * (ivarCount + v10));
      if (!v12)
      {
        self->_localIvarList = 0LL;
        goto LABEL_13;
      }

      localIvarList = v12;
      bzero(&v12[ivarCount], 8LL * (v8 - 1));
      self->_localIvarList = localIvarList;
    }

    self->_ivarCount += v10;
    id v13 = localIvarList[v7];
    localIvarList[v7] = 0LL;

    if (v8 != 1)
    {
      memmove( &self->_localIvarList[v8] + v7,  &self->_localIvarList[v7 + 1],  8LL * (self->_ivarCount - v8 - v7));
      if (v8) {
        bzero(&self->_localIvarList[v7], 8LL * v8);
      }
    }

    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __41__VMUClassInfo__replaceField_withFields___block_invoke;
    v15[3] = &unk_189DFE998;
    v15[4] = self;
    int v16 = v7;
    [v6 enumerateObjectsUsingBlock:v15];
  }

void __41__VMUClassInfo__replaceField_withFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)_replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (self->_ivarCount)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    while (1)
    {
      id v11 = self->_localIvarList[v9];
      unsigned int v12 = [v11 offset];

      ++v10;
      ++v9;
      if (v10 >= self->_ivarCount) {
        goto LABEL_12;
      }
    }

    if ([v11 offset] == a4 && objc_msgSend(v11, "isEqual:", v14))
    {
      objc_storeStrong(&self->_localIvarList[v9], a5);
    }

    else
    {
      [v11 subFieldArray];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13) {
        [v11 replaceFieldRecursively:v14 atOffset:a4 - [v11 offset] withField:v8];
      }
    }
  }

- (void)_setFields:(id)a3
{
  id v9 = a3;
  -[VMUClassInfo _freeLocalIvarList](self, "_freeLocalIvarList");
  unsigned int v4 = [v9 count];
  self->_uint64_t ivarCount = v4;
  if (v4)
  {
    self->_localIvarList = (id *)calloc(v4 + 1, 8uLL);
    if (self->_ivarCount)
    {
      unint64_t v5 = 0LL;
      do
      {
        uint64_t v6 = [v9 objectAtIndexedSubscript:v5];
        localIvarList = self->_localIvarList;
        id v8 = localIvarList[v5];
        localIvarList[v5] = (id)v6;

        ++v5;
      }

      while (v5 < self->_ivarCount);
    }
  }

  -[VMUClassInfo _adjustInstanceSize](self, "_adjustInstanceSize");
}

- (void)_addVariantAction:(id)a3 withEvaluator:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  variantEvaluators = self->_variantEvaluators;
  if (!variantEvaluators)
  {
    id v8 = (NSMutableArray *)objc_opt_new();
    id v9 = self->_variantEvaluators;
    self->_variantEvaluators = v8;

    unint64_t v10 = (NSMutableArray *)objc_opt_new();
    variantActions = self->_variantActions;
    self->_variantActions = v10;

    variantEvaluators = self->_variantEvaluators;
  }

  *(_WORD *)&self->_char hasSpecificLayout = 257;
  unsigned int v12 = (void *)MEMORY[0x186E33044](v6);
  -[NSMutableArray addObject:](variantEvaluators, "addObject:", v12);

  id v13 = self->_variantActions;
  id v14 = (void *)MEMORY[0x186E33044](v15);
  -[NSMutableArray addObject:](v13, "addObject:", v14);
}

- (void)_addComplexAction:(id)a3 withEvaluator:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  complexVariantEvaluators = self->_complexVariantEvaluators;
  if (!complexVariantEvaluators)
  {
    id v8 = (NSMutableArray *)objc_opt_new();
    id v9 = self->_complexVariantEvaluators;
    self->_complexVariantEvaluators = v8;

    unint64_t v10 = (NSMutableArray *)objc_opt_new();
    complexVariantActions = self->_complexVariantActions;
    self->_complexVariantActions = v10;

    complexVariantEvaluators = self->_complexVariantEvaluators;
  }

  *(_WORD *)&self->_char hasSpecificLayout = 257;
  unsigned int v12 = (void *)MEMORY[0x186E33044](v6);
  -[NSMutableArray addObject:](complexVariantEvaluators, "addObject:", v12);

  id v13 = self->_complexVariantActions;
  id v14 = (void *)MEMORY[0x186E33044](v15);
  -[NSMutableArray addObject:](v13, "addObject:", v14);
}

+ (id)descriptionForTypeEncoding:(const char *)a3 ivarName:(const char *)a4
{
  unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = v4;
  if (!v4) {
    unsigned int v4 = &stru_189E010C8;
  }
  id v6 = v4;

  return v6;
}

- (void)_setIsa:(unint64_t)a3
{
  self->_unint64_t remoteIsa = a3;
}

- (NSString)binaryName
{
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"<unknown>";
  }
  unsigned int v4 = v2;

  return v4;
}

- (NSString)typeName
{
  signed int remoteType = self->_remoteType;
  if (remoteType > 15)
  {
    if (remoteType > 63)
    {
      if (remoteType != 64)
      {
        if (remoteType == 128) {
          return (NSString *)@"OSObj";
        }
        return (NSString *)@"<unknown>";
      }
    }

    else
    {
      if (remoteType == 16) {
        return (NSString *)@"C";
      }
      if (remoteType != 32) {
        return (NSString *)@"<unknown>";
      }
    }

    return (NSString *)@"Swift";
  }

  uint64_t result = (NSString *)@"ObjC";
  switch(remoteType)
  {
    case 0:
      uint64_t result = (NSString *)&stru_189E010C8;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = (NSString *)@"C++";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return (NSString *)@"<unknown>";
    case 4:
      uint64_t result = (NSString *)@"CFType";
      break;
    case 8:
      return (NSString *)@"Swift";
    default:
      if (remoteType != 0x80000000) {
        return (NSString *)@"<unknown>";
      }
      break;
  }

  return result;
}

- (unsigned)infoType
{
  return self->_remoteType;
}

- (NSString)fullIvarDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __35__VMUClassInfo_fullIvarDescription__block_invoke;
  v6[3] = &unk_189DFE9C0;
  id v4 = v3;
  id v7 = v4;
  -[VMUClassInfo _logDescriptionWithSuperclasses:indentation:toLogger:]( self,  "_logDescriptionWithSuperclasses:indentation:toLogger:",  1LL,  0LL,  v6);

  return (NSString *)v4;
}

uint64_t __35__VMUClassInfo_fullIvarDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@\n", a2];
}

- (NSString)shortIvarDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__VMUClassInfo_shortIvarDescription__block_invoke;
  v6[3] = &unk_189DFE9C0;
  id v4 = v3;
  id v7 = v4;
  -[VMUClassInfo _logDescriptionWithSuperclasses:indentation:toLogger:]( self,  "_logDescriptionWithSuperclasses:indentation:toLogger:",  0LL,  0LL,  v6);

  return (NSString *)v4;
}

uint64_t __36__VMUClassInfo_shortIvarDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@\n", a2];
}

- (id)scanDescriptionWithSize:(unsigned int)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = 0LL;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  int v25 = 0;
  uint64_t v16 = MEMORY[0x1895F87A8];
  uint64_t v17 = 3221225472LL;
  int v18 = __40__VMUClassInfo_scanDescriptionWithSize___block_invoke;
  int v19 = &unk_189DFE970;
  id v6 = v5;
  id v20 = v6;
  int v21 = &v22;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", &v16);
  id v7 = v23;
  unsigned int superclassOffset = *((_DWORD *)v23 + 6);
  if (superclassOffset <= self->_superclassOffset) {
    unsigned int superclassOffset = self->_superclassOffset;
  }
  *((_DWORD *)v23 + 6) = superclassOffset;
  unsigned int remotePointerSize = self->_remotePointerSize;
  unsigned int v10 = remotePointerSize - 1;
  int v11 = -remotePointerSize;
  *((_DWORD *)v7 + 6) = (v10 + superclassOffset) & v11;
  unsigned int v12 = (self->_instanceSize + v10) & v11;
  *((_DWORD *)v7 + 6) = v12;
  if (v12 + 8 <= a3)
  {
    if ([v6 length]) {
      [v6 appendString:@"\n"];
    }
    uint64_t v13 = *((unsigned int *)v23 + 6);
    id v14 = VMUScanTypeScanDescription(self->_defaultScanType);
    [v6 appendFormat:@"%+*d: <extra space>[%u] (%s)", 3, v13, a3 - v13, v14, v16, v17, v18, v19];
  }

  _Block_object_dispose(&v22, 8);
  return v6;
}

void __40__VMUClassInfo_scanDescriptionWithSize___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v5 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  _formatIvar(v5, 3LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v4];

  LODWORD(v4) = -[VMUFieldInfo offset](v5, "offset");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -[VMUFieldInfo size](v5, "size") + (_DWORD)v4;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  -[VMUClassInfo description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUClassInfo fullIvarDescription](self, "fullIvarDescription");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@  %@", v4, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  if (self->_displayName)
  {
    -[VMUClassInfo displayName](self, "displayName");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo className](self, "className");
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo type](self, "type");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo binaryName](self, "binaryName");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"%@ (%@)  %@  %@", v4, v5, v6, v7];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[VMUClassInfo className](self, "className");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo type](self, "type");
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo binaryName](self, "binaryName");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"%@  %@  %@", v4, v5, v6];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v9 = (void *)NSString;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  -[VMUClassInfo description](&v13, sel_description);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringWithFormat:@"%@  %@", v10, v8];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isARR
{
  return LOBYTE(self->_ro_flags) >> 7;
}

- (BOOL)isRealized
{
  return self->_rw_flags >> 31;
}

- (BOOL)isMetaClass
{
  return self->_ro_flags & 1;
}

- (BOOL)isRootClass
{
  return (LOBYTE(self->_ro_flags) >> 1) & 1;
}

- (BOOL)hasCppConstructorOrDestructor
{
  return (LOBYTE(self->_ro_flags) >> 2) & 1;
}

+ (unint64_t)sizeofClassStructure
{
  return 40LL;
}

- (unsigned)instanceSize
{
  return self->_instanceSize;
}

- (unint64_t)remoteIsa
{
  return self->_remoteIsa;
}

- (NSString)binaryPath
{
  return self->_remoteBinaryPath;
}

- (NSString)className
{
  return self->_remoteClassName;
}

- (VMUClassInfo)superclassInfo
{
  return self->_superclassLayout;
}

- (unsigned)pointerSize
{
  return self->_remotePointerSize;
}

- (BOOL)usesSwiftRefcounting
{
  return self->_usesSwiftRefcounting;
}

- (unsigned)ivarCount
{
  return self->_ivarCount;
}

- (unsigned)superclassOffset
{
  return self->_superclassOffset;
}

- (BOOL)isCoreMediaFigObject
{
  return self->_isCoreMediaFigObject;
}

- (BOOL)isDerivedFromStackBacktrace
{
  return self->_isDerivedFromStackBacktrace;
}

- (void)setIsDerivedFromStackBacktrace:(BOOL)a3
{
  self->_isDerivedFromStackBacktrace = a3;
}

- (void).cxx_destruct
{
}

@end