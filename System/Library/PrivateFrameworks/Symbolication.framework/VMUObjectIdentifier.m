@interface VMUObjectIdentifier
- (BOOL)_dlopenLibSwiftRemoteMirror;
- (BOOL)_dlopenLibSwiftRemoteMirrorFromDir:(id)a3;
- (BOOL)_dlopenLibSwiftRemoteMirrorNearExecutable;
- (BOOL)_dlopenLibSwiftRemoteMirrorNearLibSwiftCore;
- (BOOL)_isValidInstanceLength:(unint64_t)a3 expectedLength:(unint64_t)a4;
- (BOOL)_remoteAddressIsOKtoRead:(unint64_t)a3;
- (BOOL)hasSwiftContent;
- (BOOL)hasSwiftReflection;
- (BOOL)isTaggedPointer:(void *)a3;
- (BOOL)taskIsDriverKit;
- (NSMutableDictionary)moduleNameToBinaryPathDict;
- (VMUAutoreleasePoolPageLayout)autoreleasePoolPageLayout;
- (VMUAutoreleasePoolPageLayout)createAutoreleasePoolPageLayout;
- (VMUClassInfoMap)realizedClasses;
- (VMUObjectIdentifier)initWithTask:(unsigned int)a3;
- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4;
- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5;
- (VMUObjectIdentifier)initWithVMUTask:(id)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5;
- (VMURangeArray)readonlyRegionRanges;
- (VMUSwiftRuntimeInfo)swiftRuntimeInfoPreABI;
- (VMUSwiftRuntimeInfo)swiftRuntimeInfoStableABI;
- (VMUTaskMemoryScanner)scanner;
- (_CSTypeRef)_symbolicator;
- (_CSTypeRef)libobjcSymbolOwner;
- (_CSTypeRef)symbolForAddress:(unint64_t)a3;
- (_CSTypeRef)symbolicator;
- (_VMURange)vmRegionRangeForAddress:(unint64_t)a3;
- (id)_classInfoForMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 remoteAddress:(unint64_t)a6;
- (id)_classInfoWithPthreadType:(id)a3;
- (id)_returnFaultedClass:(unint64_t)a3 ofType:(unsigned int)a4;
- (id)_scanner;
- (id)classInfoForCFTypeInstance:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4;
- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)classInfoForNonobjectMemory:(void *)a3 length:(unint64_t)a4;
- (id)classInfoForObjCClassStructurePointerType:(unsigned int)a3;
- (id)classInfoForObjectWithRange:(_VMURange)a3;
- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4;
- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4 returnedClassInfoIndex:(unsigned int *)a5;
- (id)classNameForTaggedPointer:(void *)a3;
- (id)formattedDateLabel:(id)a3;
- (id)labelForCFBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassDataExtRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassDataRO:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassDataRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassStructure:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForCoreMediaFigObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForItemCount:(int64_t)a3;
- (id)labelForMallocBlock:(_VMURange)a3;
- (id)labelForMallocBlock:(_VMURange)a3 usingHandlerBlock:(id)a4;
- (id)labelForMemory:(size_t)a3 length:(uint64_t)a4 remoteAddress:(void *)a5 classInfo:(void *)a6 usingHandlerBlock:;
- (id)labelForMemory:(void *)a3 length:(unint64_t)a4;
- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 classInfo:(id)a6;
- (id)labelForNSArray:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSCFDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSCFSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSCFStringAtRemoteAddress:(unint64_t)a3 printDetail:(BOOL)a4;
- (id)labelForNSConcreteAttributedString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSConcreteData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSConcreteHashTable:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSConcreteMutableData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSDate:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSInlineData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSNumber:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSPathStore2:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSString:(void *)a3 mappedSize:(unint64_t)a4 remoteAddress:(unint64_t)a5 printDetail:(BOOL)a6;
- (id)labelForNSTaggedPointerStringCStringContainer:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSURL:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSXPCInterface:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSDispatchMach:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSDispatchQueue:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSLog:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSTransaction:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCActivity:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForObjectOfClass:(id)a3 atOffset:(unsigned int)a4 ofObject:(void *)a5 withLength:(unint64_t)a6;
- (id)labelForProtocol:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForSwiftStringStorage:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForTaggedPointer:(void *)a3;
- (id)labelFor_NSActivityAssertion:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelFor_RBSAssertionDescriptor:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelFor__NSMallocBlock__:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)memoryReader;
- (id)noLabelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)osMajorMinorVersionString;
- (id)symbolForRemoteAddress:(unint64_t)a3;
- (id)uniquifyStringLabel:(id)a3 stringType:(int)a4 printDetail:(BOOL)a5;
- (id)vmuTask;
- (int)_populateSwiftReflectionInfo:(SwiftReflectionInteropContext *)a3;
- (libSwiftRemoteMirrorWrapper)swiftMirror;
- (unint64_t)CFTypeCount;
- (unint64_t)ObjCclassCount;
- (unint64_t)SwiftClassCount;
- (unint64_t)addressOfSymbol:(const char *)a3 inLibrary:(const char *)a4;
- (unint64_t)countFromPointerInAutoreleasePool:(void *)a3;
- (unint64_t)figBaseObjectFinalizeAddress;
- (unint64_t)swiftConcurrencyDebugAsyncTaskMetadataIsa;
- (unint64_t)swiftConcurrencyDebugAsyncTaskSlabMetadataIsa;
- (unint64_t)taggedPointerMask;
- (unint64_t)translateIsaPointer:(unint64_t)a3;
- (unsigned)classInfoIndexForObjCClassStructurePointerType:(unsigned int)a3;
- (unsigned)objcABI;
- (unsigned)objectContentLevel;
- (unsigned)task;
- (void)_faultClass:(unint64_t)a3 ofType:(unsigned int)a4;
- (void)_findObjCAndSwiftClassesFromClass:(unint64_t)a3 recursionDepth:(unsigned int)a4;
- (void)_findOffsetsInOSXPCConnection:(void *)a3 length:(unint64_t)a4;
- (void)_generateClassInfosForObjCClassStructurePointerTypes;
- (void)_loadSwiftAsyncTaskAndSlabRecognitionInfo;
- (void)_populateSwiftABIVariables;
- (void)buildIsaToObjectLabelHandlerMap;
- (void)dealloc;
- (void)destroy_libSwiftRemoteMirror;
- (void)enumerateAllClassInfosWithBlock:(id)a3;
- (void)enumerateRealizedClassInfosWithBlock:(id)a3;
- (void)findCFTypes;
- (void)findCFTypes_version1;
- (void)findCFTypes_version2;
- (void)findFutureClasses;
- (void)findObjCAndSwiftClasses;
- (void)flushRemoteMirrorMemoryCache;
- (void)flushRemoteMirrorMemoryCacheEntryForAddress:(unint64_t)a3;
- (void)loadSwiftReflectionLibraries;
- (void)objectLabelHandlerForRemoteIsa:(void *)a1;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setReadonlyRegionRanges:(id)a3;
- (void)setupIsaTranslator;
@end

@implementation VMUObjectIdentifier

- (unsigned)task
{
  return -[VMUTask taskPort](self->_task, "taskPort");
}

- (id)vmuTask
{
  return self->_task;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4
{
  return -[VMUObjectIdentifier initWithTask:symbolicator:scanner:]( self,  "initWithTask:symbolicator:scanner:",  *(void *)&a3,  a4._opaque_1,  a4._opaque_2,  0LL);
}

- (VMUObjectIdentifier)initWithVMUTask:(id)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v82.receiver = self;
  v82.super_class = (Class)&OBJC_CLASS___VMUObjectIdentifier;
  v10 = -[VMUObjectIdentifier init](&v82, sel_init);
  if (v10)
  {
    v11 = +[VMUDebugTimer sharedTimerIfCreated](&OBJC_CLASS___VMUDebugTimer, "sharedTimerIfCreated");
    p_task = (id *)&v10->_task;
    objc_storeStrong((id *)&v10->_task, a3);
    v13 = -[VMUTask memoryCache](v10->_task, "memoryCache");
    v10->_taskIsDriverKit = [v13 isDriverKit];

    objc_storeWeak((id *)&v10->_scanner, v9);
    if (CSIsNull())
    {
      unsigned int FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
      else {
        uint64_t v15 = FlagsForNListOnlyData;
      }
      uint64_t v16 = [*p_task createSymbolicatorWithFlags:v15 andNotification:0];
    }

    else
    {
      uint64_t v16 = CSRetain();
    }

    v10->_symbolicator._opaque_1 = v16;
    v10->_symbolicator._opaque_2 = v17;
    else {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    }
    v10->_libobjcSymbolOwner._opaque_1 = SymbolOwner;
    v10->_libobjcSymbolOwner._opaque_2 = v19;
    v20 = objc_alloc_init(&OBJC_CLASS___VMUClassInfoMap);
    realizedIsaToClassInfo = v10->_realizedIsaToClassInfo;
    v10->_realizedIsaToClassInfo = v20;

    uint64_t v22 = objc_opt_new();
    cfTypeIDToClassInfo = v10->_cfTypeIDToClassInfo;
    v10->_cfTypeIDToClassInfo = (VMUClassInfoMap *)v22;

    uint64_t v24 = objc_opt_new();
    coreMediaFigBaseClassToClassInfo = v10->_coreMediaFigBaseClassToClassInfo;
    v10->_coreMediaFigBaseClassToClassInfo = (VMUClassInfoMap *)v24;

    uint64_t v26 = [MEMORY[0x1896078B8] hashTableWithOptions:1282];
    nonObjectIsaHash = v10->_nonObjectIsaHash;
    v10->_nonObjectIsaHash = (NSHashTable *)v26;

    uint64_t v28 = objc_opt_new();
    pidToProcessNameDict = v10->_pidToProcessNameDict;
    v10->_pidToProcessNameDict = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    moduleNameToBinaryPathDict = v10->_moduleNameToBinaryPathDict;
    v10->_moduleNameToBinaryPathDict = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:0];
    itemCountToLabelStringUniquingMap = v10->_itemCountToLabelStringUniquingMap;
    v10->_itemCountToLabelStringUniquingMap = (NSMapTable *)v32;

    v10->_labelStringUniquingMaps = (id *)calloc(0x200uLL, 8uLL);
    uint64_t v34 = objc_opt_new();
    labelStringUniquingMaps = v10->_labelStringUniquingMaps;
    id v36 = labelStringUniquingMaps[1];
    labelStringUniquingMaps[1] = (id)v34;

    v10->_stringTypeDescriptions = (id *)calloc(0x200uLL, 8uLL);
    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    stringUniquingSet = v10->_stringUniquingSet;
    v10->_stringUniquingSet = v37;

    [v9 memoryCache];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 || ([*p_task memoryCache], (v39 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v80[0] = MEMORY[0x1895F87A8];
      v80[1] = 3221225472LL;
      v80[2] = __60__VMUObjectIdentifier_initWithVMUTask_symbolicator_scanner___block_invoke;
      v80[3] = &unk_189DFED50;
      v40 = v39;
      v81 = v40;
      uint64_t v41 = MEMORY[0x186E33044](v80);
      id memoryReader = v10->_memoryReader;
      v10->_id memoryReader = (id)v41;

      v10->_targetProcessContainsMallocStackLoggingLiteZone = 0;
      if ([v9 zoneCount])
      {
        uint64_t v43 = 0LL;
        do
        {
          [v9 zoneNameForIndex:v43];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v44 hasPrefix:@"MallocStackLoggingLiteZone"])
          {
            char v45 = [v44 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"];

            if ((v45 & 1) == 0)
            {
              v10->_targetProcessContainsMallocStackLoggingLiteZone = 1;
              break;
            }
          }

          else
          {
          }

          uint64_t v43 = (v43 + 1);
        }

        while (v43 < [v9 zoneCount]);
      }

      v10->_autoreleasePoolPageLayout = -[VMUObjectIdentifier createAutoreleasePoolPageLayout]( v10,  "createAutoreleasePoolPageLayout");
      v10->_debugSwiftRemoteMirror = 0;
      v46 = getenv("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR");
      if (v46)
      {
        v47 = v46;
        if (!strcmp(v46, "YES") || !strcmp(v47, "1")) {
          v10->_debugSwiftRemoteMirror = 1;
        }
      }

      v10->_swiftMirror = (libSwiftRemoteMirrorWrapper *)calloc(1uLL, 0x18uLL);
      uint64_t v48 = -[VMUObjectIdentifier addressOfSymbol:inLibrary:]( v10,  "addressOfSymbol:inLibrary:",  "_objc_class_abi_version",  "libobjc.A.dylib");
      if (v48)
      {
        uint64_t v49 = v48;
        v50 = (uint64_t (**)(id, void, uint64_t))v10->_memoryReader;
        v51 = (unsigned int *)v50[2](v50, v49, 4LL);
        if (v51) {
          unsigned int v52 = *v51;
        }
        else {
          unsigned int v52 = 0;
        }

        v10->_objcABI = v52;
      }

      if (v11)
      {
        if ([v11 signpostID])
        {
          [v11 logHandle];
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v54 = [v11 signpostID];
          if ((unint64_t)(v54 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v55 = v54;
            if (os_signpost_enabled(v53))
            {
              __int16 v79 = 0;
              _os_signpost_emit_with_name_impl( &dword_1860C5000,  v53,  OS_SIGNPOST_INTERVAL_END,  v55,  "initObjectIdentifier",  "",  (uint8_t *)&v79,  2u);
            }
          }
        }

        [v11 endEvent:"initObjectIdentifier"];
        [v11 startWithCategory:"initObjectIdentifier" message:"loadSwiftReflectionLibraries"];
        [v11 logHandle];
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v57 = [v11 signpostID];
        if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v58 = v57;
          if (os_signpost_enabled(v56))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v56,  OS_SIGNPOST_INTERVAL_BEGIN,  v58,  "initObjectIdentifier",  "loadSwiftReflectionLibraries",  (uint8_t *)&v79,  2u);
          }
        }
      }

      else
      {
        [0 endEvent:"initObjectIdentifier"];
        uint64_t v59 = [0 startWithCategory:"initObjectIdentifier" message:"loadSwiftReflectionLibraries"];
      }

      v60 = (void *)MEMORY[0x186E32E40](v59);
      -[VMUObjectIdentifier loadSwiftReflectionLibraries](v10, "loadSwiftReflectionLibraries");
      objc_autoreleasePoolPop(v60);
      -[VMUObjectIdentifier _populateSwiftABIVariables](v10, "_populateSwiftABIVariables");
      if (v11)
      {
        if ([v11 signpostID])
        {
          [v11 logHandle];
          v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v62 = [v11 signpostID];
          if ((unint64_t)(v62 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v63 = v62;
            if (os_signpost_enabled(v61))
            {
              __int16 v79 = 0;
              _os_signpost_emit_with_name_impl( &dword_1860C5000,  v61,  OS_SIGNPOST_INTERVAL_END,  v63,  "initObjectIdentifier",  "",  (uint8_t *)&v79,  2u);
            }
          }
        }

        [v11 endEvent:"initObjectIdentifier"];
        [v11 startWithCategory:"initObjectIdentifier" message:"findCFTypes"];
        [v11 logHandle];
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v65 = [v11 signpostID];
        if ((unint64_t)(v65 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v66 = v65;
          if (os_signpost_enabled(v64))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v64,  OS_SIGNPOST_INTERVAL_BEGIN,  v66,  "initObjectIdentifier",  "findCFTypes",  (uint8_t *)&v79,  2u);
          }
        }
      }

      else
      {
        [0 endEvent:"initObjectIdentifier"];
        [0 startWithCategory:"initObjectIdentifier" message:"findCFTypes"];
      }

      v10->_figBaseObjectFinalizeAddress = -[VMUObjectIdentifier addressOfSymbol:inLibrary:]( v10,  "addressOfSymbol:inLibrary:",  "_FigBaseObjectFinalize",  "CoreMedia");
      -[VMUObjectIdentifier findCFTypes](v10, "findCFTypes");
      if (v11)
      {
        if ([v11 signpostID])
        {
          [v11 logHandle];
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v68 = [v11 signpostID];
          if ((unint64_t)(v68 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v69 = v68;
            if (os_signpost_enabled(v67))
            {
              __int16 v79 = 0;
              _os_signpost_emit_with_name_impl( &dword_1860C5000,  v67,  OS_SIGNPOST_INTERVAL_END,  v69,  "initObjectIdentifier",  "",  (uint8_t *)&v79,  2u);
            }
          }
        }

        [v11 endEvent:"initObjectIdentifier"];
        [v11 startWithCategory:"initObjectIdentifier" message:"findObjCAndSwiftClasses"];
        [v11 logHandle];
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v71 = [v11 signpostID];
        if ((unint64_t)(v71 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v72 = v71;
          if (os_signpost_enabled(v70))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v70,  OS_SIGNPOST_INTERVAL_BEGIN,  v72,  "initObjectIdentifier",  "findObjCAndSwiftClasses",  (uint8_t *)&v79,  2u);
          }
        }
      }

      else
      {
        [0 endEvent:"initObjectIdentifier"];
        [0 startWithCategory:"initObjectIdentifier" message:"findObjCAndSwiftClasses"];
      }

      -[VMUObjectIdentifier setupIsaTranslator](v10, "setupIsaTranslator");
      -[VMUObjectIdentifier findObjCAndSwiftClasses](v10, "findObjCAndSwiftClasses");
      -[VMUObjectIdentifier findFutureClasses](v10, "findFutureClasses");
      v10->_cfBooleanTrueAddress = -[VMUObjectIdentifier addressOfSymbol:inLibrary:]( v10,  "addressOfSymbol:inLibrary:",  "___kCFBooleanTrue",  "CoreFoundation");
      v10->_cfBooleanFalseAddress = -[VMUObjectIdentifier addressOfSymbol:inLibrary:]( v10,  "addressOfSymbol:inLibrary:",  "___kCFBooleanFalse",  "CoreFoundation");
      if (v10->_taskIsDriverKit)
      {
        v73 = -[VMUObjectIdentifierDriverKitSupport initWithObjectIdentifier:]( objc_alloc(&OBJC_CLASS___VMUObjectIdentifierDriverKitSupport),  "initWithObjectIdentifier:",  v10);
        driverKitSupport = v10->_driverKitSupport;
        v10->_driverKitSupport = v73;
      }

      v10->_objectContentLevel = 1;
      if (v11 && [v11 signpostID])
      {
        [v11 logHandle];
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v76 = [v11 signpostID];
        if ((unint64_t)(v76 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v77 = v76;
          if (os_signpost_enabled(v75))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v75,  OS_SIGNPOST_INTERVAL_END,  v77,  "initObjectIdentifier",  "",  (uint8_t *)&v79,  2u);
          }
        }
      }

      [v11 endEvent:"initObjectIdentifier"];
    }

    else
    {
      v40 = v10;
      v10 = 0LL;
    }
  }

  return v10;
}

uint64_t __60__VMUObjectIdentifier_initWithVMUTask_symbolicator_scanner___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v4 = 0LL;
  else {
    return v4;
  }
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  v10 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", v7);
  v11 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]( self,  "initWithVMUTask:symbolicator:scanner:",  v10,  opaque_1,  opaque_2,  v9);

  return v11;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  -[VMUObjectIdentifier destroy_libSwiftRemoteMirror](self, "destroy_libSwiftRemoteMirror");
  libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
  if (libSwiftRemoteMirrors)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    -[NSMutableDictionary allValues](libSwiftRemoteMirrors, "allValues");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          dlclose((void *)[*(id *)(*((void *)&v23 + 1) + 8 * v8++) pointerValue]);
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v6);
    }

    id v9 = self->_libSwiftRemoteMirrors;
  }

  else
  {
    id v9 = 0LL;
  }

  self->_libSwiftRemoteMirrors = 0LL;

  CSRelease();
  self->_symbolicator._unint64_t opaque_1 = 0LL;
  self->_symbolicator._unint64_t opaque_2 = 0LL;
  if (self->_objCClassStructureClassInfos)
  {
    for (uint64_t i = 0LL; i != 13; ++i)
    {
      objCClassStructureClassInfos = self->_objCClassStructureClassInfos;
      id v12 = objCClassStructureClassInfos[i];
      objCClassStructureClassInfos[i] = 0LL;
    }

    free(self->_objCClassStructureClassInfos);
    self->_objCClassStructureClassInfos = 0LL;
  }

  objCClassStructureClassInfoIndexes = self->_objCClassStructureClassInfoIndexes;
  if (objCClassStructureClassInfoIndexes)
  {
    free(objCClassStructureClassInfoIndexes);
    self->_objCClassStructureClassInfoIndexes = 0LL;
  }

  for (uint64_t j = 0LL; j != 512; ++j)
  {
    labelStringUniquingMaps = self->_labelStringUniquingMaps;
    if (labelStringUniquingMaps)
    {
      id v16 = labelStringUniquingMaps[j];
      labelStringUniquingMaps[j] = 0LL;
    }

    stringTypeDescriptions = self->_stringTypeDescriptions;
    if (stringTypeDescriptions)
    {
      id v18 = stringTypeDescriptions[j];
      stringTypeDescriptions[j] = 0LL;
    }
  }

  unint64_t v19 = self->_labelStringUniquingMaps;
  if (v19)
  {
    free(v19);
    self->_labelStringUniquingMaps = 0LL;
  }

  v20 = self->_stringTypeDescriptions;
  if (v20)
  {
    free(v20);
    self->_stringTypeDescriptions = 0LL;
  }

  autoreleasePoolPageLayout = self->_autoreleasePoolPageLayout;
  if (autoreleasePoolPageLayout) {
    free(autoreleasePoolPageLayout);
  }
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___VMUObjectIdentifier;
  -[VMUObjectIdentifier dealloc](&v22, sel_dealloc);
}

- (void)flushRemoteMirrorMemoryCache
{
  remoteAddressToLocalAddressAndSizeMap = self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap;
  if (remoteAddressToLocalAddressAndSizeMap)
  {
    NSResetMapTable(remoteAddressToLocalAddressAndSizeMap);
    NSResetMapTable(self->_swiftMirrorReaderContext.remoteStringToLengthMap);
  }

- (void)flushRemoteMirrorMemoryCacheEntryForAddress:(unint64_t)a3
{
}

- (unint64_t)CFTypeCount
{
  return self->_cfClassCount;
}

- (unint64_t)ObjCclassCount
{
  return self->_objCClassCount;
}

- (unint64_t)SwiftClassCount
{
  return self->_swiftClassCount;
}

- (void)enumerateRealizedClassInfosWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
    v7[1] = 3221225472LL;
    v7[2] = __60__VMUObjectIdentifier_enumerateRealizedClassInfosWithBlock___block_invoke;
    v7[3] = &unk_189DFF2A0;
    id v6 = v4;
    v7[0] = MEMORY[0x1895F87A8];
    id v8 = v4;
    -[VMUClassInfoMap enumerateInfosWithBlock:](realizedIsaToClassInfo, "enumerateInfosWithBlock:", v7);

    id v4 = v6;
  }
}

uint64_t __60__VMUObjectIdentifier_enumerateRealizedClassInfosWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enumerateAllClassInfosWithBlock:(id)a3
{
  id v8 = a3;
  if (!self->_unrealizedClassInfos)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___VMUClassInfoMap);
    unrealizedClassInfos = self->_unrealizedClassInfos;
    self->_unrealizedClassInfos = v4;

    -[VMUObjectIdentifier findObjCAndSwiftClasses](self, "findObjCAndSwiftClasses");
  }

  -[VMUObjectIdentifier enumerateRealizedClassInfosWithBlock:](self, "enumerateRealizedClassInfosWithBlock:", v8, v8);
  id v6 = v9;
  if (v9)
  {
    uint64_t v7 = self->_unrealizedClassInfos;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __55__VMUObjectIdentifier_enumerateAllClassInfosWithBlock___block_invoke;
    v10[3] = &unk_189DFF2A0;
    id v11 = v9;
    -[VMUClassInfoMap enumerateInfosWithBlock:](v7, "enumerateInfosWithBlock:", v10);

    id v6 = v9;
  }
}

uint64_t __55__VMUObjectIdentifier_enumerateAllClassInfosWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)classInfoForObjectWithRange:(_VMURange)a3
{
  id v4 = 0LL;
  if (HIDWORD(a3.location))
  {
    unint64_t location = a3.location;
    if ((a3.location & 7) == 0)
    {
      if (a3.length >= 0x10) {
        a3.unint64_t location = 16LL;
      }
      else {
        a3.unint64_t location = a3.length;
      }
      -[VMUObjectIdentifier classInfoForMemory:length:remoteAddress:]( self,  "classInfoForMemory:length:remoteAddress:",  (*((uint64_t (**)(id, unint64_t, unint64_t))self->_memoryReader + 2))( self->_memoryReader,  location,  a3.location),  a3.length,  location);
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (BOOL)_isValidInstanceLength:(unint64_t)a3 expectedLength:(unint64_t)a4
{
  if (((a4 + 15) & 0xFFFFFFFFFFFFFFF0LL) == a3) {
    return 1;
  }
  return self->_targetProcessContainsMallocStackLoggingLiteZone && ((a4 + 23) & 0xFFFFFFFFFFFFFFF0LL) == a3;
}

- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4
{
  return -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:]( self,  "classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:",  a3,  a4,  0LL);
}

- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4 returnedClassInfoIndex:(unsigned int *)a5
{
  id v8 = a3;
  id v9 = a4;
  nonobjectClassInfosDict = self->_nonobjectClassInfosDict;
  if (!nonobjectClassInfosDict)
  {
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v12 = self->_nonobjectClassInfosDict;
    self->_nonobjectClassInfosDict = v11;

    nonobjectClassInfosDict = self->_nonobjectClassInfosDict;
  }
  v13 = -[NSMutableDictionary objectForKeyedSubscript:](nonobjectClassInfosDict, "objectForKeyedSubscript:", v8);
  if (!v13)
  {
    v13 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v8,  v9,  16LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_nonobjectClassInfosDict,  "setObject:forKeyedSubscript:",  v13,  v8);
    unsigned int v14 = -[VMUClassInfoMap addClassInfo:forAddress:]( self->_realizedIsaToClassInfo,  "addClassInfo:forAddress:",  v13,  0LL);
    if (a5) {
      *a5 = v14;
    }
  }

  return v13;
}

- (id)_classInfoWithPthreadType:(id)a3
{
  return -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:]( self,  "classInfoWithNonobjectType:binaryPath:",  a3,  @"/usr/lib/libpthread.dylib");
}

- (void)_generateClassInfosForObjCClassStructurePointerTypes
{
  self->_objCClassStructureClassInfos = (id *)calloc(0xDuLL, 8uLL);
  uint64_t v3 = 0LL;
  self->_objCClassStructureClassInfoIndexes = (unsigned int *)calloc(0xDuLL, 4uLL);
  id v4 = &off_18C68A580;
  do
  {
    if (*v4)
    {
      if (*((_DWORD *)v4 - 2) == 12) {
        uint64_t v5 = @"/usr/lib/swift/libswiftCore.dylib";
      }
      else {
        uint64_t v5 = @"/usr/lib/libobjc.A.dylib";
      }
      unsigned int v11 = 0;
      [MEMORY[0x189NSStringTF8String:];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:]( self,  "classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:",  v6,  v5,  &v11);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      objCClassStructureClassInfos = self->_objCClassStructureClassInfos;
      id v9 = objCClassStructureClassInfos[v3];
      objCClassStructureClassInfos[v3] = v7;
      id v10 = v7;

      self->_objCClassStructureClassInfoIndexes[v3] = v11;
    }

    ++v3;
    v4 += 3;
  }

  while (v3 != 13);
}

- (unsigned)classInfoIndexForObjCClassStructurePointerType:(unsigned int)a3
{
  return self->_objCClassStructureClassInfoIndexes[a3];
}

- (id)classInfoForObjCClassStructurePointerType:(unsigned int)a3
{
  return self->_objCClassStructureClassInfos[a3];
}

- (id)classInfoForNonobjectMemory:(void *)a3 length:(unint64_t)a4
{
  int v6 = *(_DWORD *)a3;
  if (a4 >= 0x100
    && (v6 == -1583242847 && !strncmp((const char *)a3 + 4, "AUTORELEASE!", 0xCuLL)
     || a4 == 10240 && *((_DWORD *)a3 + 512) == -1583242847 && !strncmp((const char *)a3 + 2052, "AUTORELEASE!", 0xCuLL)))
  {
    -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:]( self,  "classInfoWithNonobjectType:binaryPath:",  @"@autoreleasepool content",  @"/usr/lib/libobjc.A.dylib");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
    if (v6 <= 1330529092)
    {
      if (v6 <= 1297373248)
      {
        if (v6 == 1129202753)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  16LL))
          {
            id v9 = @"pthread_condattr_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        }

        if (v6 == 1129270852)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  48LL))
          {
            id v9 = @"pthread_cond_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        }
      }

      else
      {
        if (v6 == 1297373249)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  16LL))
          {
            id v9 = @"pthread_mutexattr_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        }

        if (v6 == 1297437784 || v6 == 1297437786)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  64LL))
          {
            id v9 = @"pthread_mutex_t";
            goto LABEL_42;
          }

- (id)classInfoForCFTypeInstance:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (a4 < 0x10) {
    return 0LL;
  }
  -[VMUClassInfoMap classInfoForAddress:](self->_cfTypeIDToClassInfo, "classInfoForAddress:", __CFGenericTypeID());
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    if ([v8 isCoreMediaFigObject])
    {
      uint64_t v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((void *)a3 + 3));
      if (v10)
      {
        uint64_t v11 = v10;
        -[VMUClassInfoMap classInfoForAddress:](self->_coreMediaFigBaseClassToClassInfo, "classInfoForAddress:", v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }

        else
        {
          uint64_t v40 = 0LL;
          -[VMUTask memoryCache](self->_task, "memoryCache");
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          int v16 = [v15 peekAtAddress:v11 size:16 returnsBuf:&v40];

          if (!v16)
          {
            if (v40)
            {
              if (-[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *(void *)(v40 + 8)))
              {
                CSSymbolicatorGetSymbolWithAddressAtTime();
                if ((CSIsNull() & 1) == 0)
                {
                  uint64_t Name = CSSymbolGetName();
                  if (Name)
                  {
                    id v18 = (const char *)Name;
                    [NSString stringWithUTF8String:Name];
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    if (*v18 == 107) {
                      unint64_t v19 = v18 + 1;
                    }
                    else {
                      unint64_t v19 = v18;
                    }
                    v20 = strstr(v19, "_BaseClass");
                    if (!v20) {
                      v20 = strstr(v19, "BaseClass");
                    }
                    [NSString stringWithUTF8String:v19];
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_super v22 = v21;
                    if (v20)
                    {
                      uint64_t v23 = [v21 substringToIndex:v20 - v19];

                      objc_super v22 = (void *)v23;
                    }

                    [v9 className];
                    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
                    int v25 = [v24 isEqualToString:v22];

                    [v9 className];
                    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = v26;
                    if (v25)
                    {
                      printFigSubclassInfo(v26, &stru_189E010C8, v39);

                      -[VMUClassInfoMap addClassInfo:forAddress:]( self->_coreMediaFigBaseClassToClassInfo,  "addClassInfo:forAddress:",  v9,  v11);
                    }

                    else
                    {
                      int v28 = [v22 hasPrefix:v26];

                      if (v28)
                      {
                        [v9 className];
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        uint64_t v30 = [v22 substringFromIndex:[v29 length]];

                        objc_super v22 = (void *)v30;
                      }

                      [v9 className];
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      [v31 stringByAppendingFormat:@" (%@)", v22];
                      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

                      CSSymbolGetSymbolOwner();
                      uint64_t Path = CSSymbolOwnerGetPath();
                      if (Path) {
                        uint64_t v34 = (const char *)Path;
                      }
                      else {
                        uint64_t v34 = "<unknown>";
                      }
                      [NSString stringWithUTF8String:v34];
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v32,  v35,  4LL);
                      id v36 = (void *)objc_claimAutoreleasedReturnValue();

                      [v36 setIsCoreMediaFigObject:1];
                      [v9 className];
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      printFigSubclassInfo(v37, v32, v39);

                      -[VMUClassInfoMap addClassInfo:forAddress:]( self->_coreMediaFigBaseClassToClassInfo,  "addClassInfo:forAddress:",  v36,  v11);
                      objc_super v22 = v32;
                      id v9 = v36;
                    }
                  }
                }
              }
            }
          }

          id v14 = v9;
          id v9 = v14;
        }

        id v38 = v14;

        id v9 = v38;
      }
    }
  }

  return v9;
}

- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4
{
  return -[VMUObjectIdentifier classInfoForMemory:length:remoteAddress:]( self,  "classInfoForMemory:length:remoteAddress:",  a3,  a4,  0LL);
}

- (id)_classInfoForMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 remoteAddress:(unint64_t)a6
{
  task = self->_task;
  uint64_t v12 = *(void *)((char *)a3 + a5);
  isaTranslator = (uint64_t (**)(id, id, uint64_t))self->_isaTranslator;
  if (isaTranslator) {
    uint64_t v12 = isaTranslator[2](isaTranslator, self->_memoryReader, v12);
  }
  unint64_t v14 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)task, v12);
  uint64_t v15 = (const void *)v14;
  if (a5 || v14 != self->_coreFoundationCFTypeIsa)
  {
    if (HIDWORD(v14)) {
      BOOL v17 = (v14 & 7) == 0;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17) {
      goto LABEL_10;
    }
    -[VMUClassInfoMap classInfoForAddress:](self->_realizedIsaToClassInfo, "classInfoForAddress:", v14);
    int v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_17:
      if (-[VMUClassInfo ivarCount](v16, "ivarCount")) {
        goto LABEL_18;
      }
      v21 = -[VMUClassInfo className](v16, "className");
      if ([v21 isEqualToString:@"__SwiftValue"])
      {
      }

      else
      {
        -[VMUClassInfo className](v16, "className");
        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = [v22 isEqualToString:@"_SwiftValue"];

        if (!v23)
        {
LABEL_18:
          if (-[VMUClassInfo instanceSize](v16, "instanceSize") > a4)
          {

            int v16 = 0LL;
          }

          return v16;
        }
      }

      __int128 v24 = objc_alloc(&OBJC_CLASS___VMUClassInfo);
      -[VMUClassInfo className](v16, "className");
      int v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = -[VMUClassInfo initSwiftClassWithName:classInfoType:size:]( v24,  "initSwiftClassWithName:classInfoType:size:",  v25,  64LL,  a4);

      int v16 = (VMUClassInfo *)v26;
      goto LABEL_11;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
    int v20 = [WeakRetained addressIsInDataSegment:v15];

    if (!v20)
    {
LABEL_10:
      int v16 = 0LL;
      goto LABEL_11;
    }

    if (v15 == (const void *)self->_lastCPlusPlusIsa)
    {
      int v16 = self->_lastCPlusPlusClassInfo;
      if (!v16) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }

    if (NSHashGet(self->_nonObjectIsaHash, v15)) {
      goto LABEL_60;
    }
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    if (!CSSymbolOwnerUsesCPlusPlus()
      || (uint64_t SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress(), v29 = v28, (CSIsNull() & 1) != 0))
    {
LABEL_32:
      int v16 = 0LL;
      goto LABEL_33;
    }

    if (self->_taskIsDriverKit)
    {
      -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitMemory:length:atOffset:translatedIsa:symbol:]( self->_driverKitSupport,  "classInfoForDriverKitMemory:length:atOffset:translatedIsa:symbol:",  a3,  a4,  a5,  v15,  SymbolWithAddress,  v29);
      int v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
      if (-[VMUClassInfo infoType](v16, "infoType") == 128) {
        -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v16, v15);
      }
    }

    else
    {
      uint64_t Name = (const char *)CSSymbolGetName();
      int v16 = (VMUClassInfo *)Name;
      if (!Name) {
        goto LABEL_33;
      }
      if (strncmp(Name, "vtable for ", 0xBuLL)) {
        goto LABEL_32;
      }
      [NSString stringWithUTF8String:(char *)&v16->_remoteIsa + 3];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      VMUSimplifyCPlusPlusSymbolName(v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t Path = CSSymbolOwnerGetPath();
      if (Path)
      {
        uint64_t v45 = NSString;
        [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v44 = &stru_189E010C8;
      }

      +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v46,  v44,  2LL,  v45);
      int v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
      if (Path) {

      }
      -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v16, v15);
    }

void __73__VMUObjectIdentifier__classInfoForMemory_length_atOffset_remoteAddress___block_invoke()
{
  v0 = -[VMUClassInfo initWithClassName:binaryPath:type:]( objc_alloc(&OBJC_CLASS___VMUClassInfo),  "initWithClassName:binaryPath:type:",  @"Closure context (unknown layout)",  0LL,  64LL);
  v1 = (void *)_classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo;
  _classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo = (uint64_t)v0;
}

- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if ((unint64_t)a3 >> 32)
  {
    uint64_t v7 = 0LL;
    if (a4 >= 8 && (a3 & 7) == 0)
    {
      -[VMUObjectIdentifier _classInfoForMemory:length:atOffset:remoteAddress:]( self,  "_classInfoForMemory:length:atOffset:remoteAddress:",  a3,  a4,  0LL,  a5);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        if (self->_taskIsDriverKit)
        {
          -[VMUObjectIdentifierDriverKitSupport driverKitClassInfoForMemory:length:remoteAddress:]( self->_driverKitSupport,  "driverKitClassInfoForMemory:length:remoteAddress:",  a3,  a4,  a5);
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v7 = 0LL;
        }
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)_returnFaultedClass:(unint64_t)a3 ofType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a4 == 4) {
    realizedIsaToClassInfo = 0LL;
  }
  else {
    realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
  }
  id v8 = realizedIsaToClassInfo;
  -[VMUClassInfoMap classInfoForAddress:](v8, "classInfoForAddress:", a3);
  id v9 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if ((_DWORD)v4 != 1
      || (unrealizedClassInfos = self->_unrealizedClassInfos) == 0LL
      || (-[VMUClassInfoMap classInfoForAddress:](unrealizedClassInfos, "classInfoForAddress:", a3),
          (id v9 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
      id v9 = -[VMUClassInfo initWithRealizedClass:type:infoMap:objectIdentifier:reader:]( objc_alloc(&OBJC_CLASS___VMUClassInfo),  "initWithRealizedClass:type:infoMap:objectIdentifier:reader:",  a3,  v4,  v8,  self,  self->_memoryReader);
      if (!v9 && (_DWORD)v4 == 1 && self->_unrealizedClassInfos) {
        id v9 = -[VMUClassInfo initWithClass:type:infoMap:objectIdentifier:reader:]( objc_alloc(&OBJC_CLASS___VMUClassInfo),  "initWithClass:type:infoMap:objectIdentifier:reader:",  a3,  1LL,  self->_unrealizedClassInfos,  self,  self->_memoryReader);
      }
      if (-[VMUClassInfo infoType](v9, "infoType") == 1)
      {
        if (self->_coreFoundationCFTypeIsa
          || (-[VMUClassInfo className](v9, "className"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 isEqualToString:@"__NSCFType"],
              v13,
              !v14))
        {
          ++self->_objCClassCount;
        }

        else
        {
          self->_coreFoundationCFTypeIsa = a3;
        }
      }

      else if (-[VMUClassInfo infoType](v9, "infoType") == 8)
      {
        ++self->_swiftClassCount;
      }

      else if (-[VMUClassInfo infoType](v9, "infoType") == 4)
      {
        ++self->_cfClassCount;
      }
    }
  }

  uint64_t v10 = v9;

  return v10;
}

- (void)_faultClass:(unint64_t)a3 ofType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = (void *)MEMORY[0x186E32E40](self, a2);
  id v8 = -[VMUObjectIdentifier _returnFaultedClass:ofType:](self, "_returnFaultedClass:ofType:", a3, v4);
  objc_autoreleasePoolPop(v7);
}

- (void)findCFTypes_version1
{
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore")) {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
  }
  else {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t v5 = SymbolOwner;
  uint64_t v6 = v4;
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"___CFRuntimeClassTableCount",  SymbolOwner,  v4,  4uLL,  &v13);
  if (v13)
  {
    uint64_t v7 = _map_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTables", v5, v6, 8LL * v13);
    if (!v7) {
      uint64_t v7 = _map_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTable", v5, v6, 8LL * v13);
    }
    if (v7)
    {
      int v8 = v13;
      if (v13 >= 1)
      {
        uint64_t v9 = 0LL;
        do
        {
          uint64_t v10 = *(void *)(v7 + 8 * v9);
          if (v10)
          {
            uint64_t v11 = (void *)MEMORY[0x186E32E40]();
            -[VMUObjectIdentifier _returnFaultedClass:ofType:](self, "_returnFaultedClass:ofType:", v10, 4LL);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[VMUClassInfoMap addClassInfo:forAddress:](self->_cfTypeIDToClassInfo, "addClassInfo:forAddress:", v12, v9);
            -[VMUClassInfoMap addClassInfo:forAddress:]( self->_realizedIsaToClassInfo,  "addClassInfo:forAddress:",  v12,  v10);

            objc_autoreleasePoolPop(v11);
            int v8 = v13;
          }

          ++v9;
        }

        while (v9 < v8);
      }
    }
  }

- (void)findCFTypes_version2
{
  uint64_t v3 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke;
  v12[3] = &unk_189DFF2E8;
  v12[4] = self;
  uint64_t v4 = (void *)MEMORY[0x186E33044](v12, a2);
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2020000000LL;
  int v11 = 0;
  task = self->_task;
  v7[0] = v3;
  v7[1] = 3221225472LL;
  v7[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_2;
  v7[3] = &unk_189DFF338;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = v10;
  withPeekFunctionForVMUTask(task, v7);

  _Block_object_dispose(v10, 8);
}

uint64_t __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke(uint64_t a1)
{
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  CSSymbolOwnerGetSymbolWithName();
  return CSSymbolGetRange();
}

uint64_t __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))_vmu__CFRuntimeEnumerateClassTable;
  uint64_t v5 = [*(id *)(a1[4] + 8) taskPort];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_3;
  v9[3] = &unk_189DFF310;
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  v9[4] = a1[4];
  v9[5] = v7;
  return v4(v5, v6, a2, v9);
}

void __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)MEMORY[0x186E32E40]();
    [*(id *)(a1 + 32) _returnFaultedClass:a2 ofType:4];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 208) addClassInfo:v5 forAddress:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      [*(id *)(*(void *)(a1 + 32) + 192) addClassInfo:v5 forAddress:a2];
    }

    objc_autoreleasePoolPop(v4);
  }

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

- (void)findCFTypes
{
  if (findCFTypes_onceToken != -1) {
    dispatch_once(&findCFTypes_onceToken, &__block_literal_global_92);
  }
  if (_vmu__CFRuntimeEnumerateClassTable) {
    -[VMUObjectIdentifier findCFTypes_version2](self, "findCFTypes_version2");
  }
  else {
    -[VMUObjectIdentifier findCFTypes_version1](self, "findCFTypes_version1");
  }
}

void *__34__VMUObjectIdentifier_findCFTypes__block_invoke()
{
  result = dlopen("/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation", 1);
  if (result)
  {
    v1 = result;
    _vmu__CFRuntimeEnumerateClassTable = dlsym(result, "__CFRuntimeEnumerateClassTable");
    return (void *)dlclose(v1);
  }

  return result;
}

- (void)_findObjCAndSwiftClassesFromClass:(unint64_t)a3 recursionDepth:(unsigned int)a4
{
  if (a3)
  {
    uint64_t SiblingOfClass = a3;
    uint64_t v6 = a4 + 1;
    do
    {
      if ((VMUIsMetaclass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass) & 1) == 0)
      {
        -[VMUClassInfoMap classInfoForAddress:](self->_realizedIsaToClassInfo, "classInfoForAddress:", SiblingOfClass);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7) {
          return;
        }
        -[VMUObjectIdentifier _faultClass:ofType:](self, "_faultClass:ofType:", SiblingOfClass, 1LL);
        uint64_t SubclassOfClass = VMUGetFirstSubclassOfClass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass);
        if (SubclassOfClass) {
          -[VMUObjectIdentifier _findObjCAndSwiftClassesFromClass:recursionDepth:]( self,  "_findObjCAndSwiftClassesFromClass:recursionDepth:",  SubclassOfClass,  v6);
        }
      }

      uint64_t SiblingOfClass = VMUGetNextSiblingOfClass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass);
    }

    while (SiblingOfClass);
  }

- (void)findObjCAndSwiftClasses
{
  uint64_t v3 = (uint64_t *)(*((uint64_t (**)(void))self->_memoryReader + 2))();
  if (v3)
  {
    for (uint64_t i = *v3; i; uint64_t i = VMUGetNextSiblingOfClass(self->_task, self->_memoryReader, self->_objcABI, i))
      -[VMUObjectIdentifier _findObjCAndSwiftClassesFromClass:recursionDepth:]( self,  "_findObjCAndSwiftClassesFromClass:recursionDepth:",  i,  0LL);
  }

  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
  {
    CSSymbolicatorGetSymbolOwner();
    uint64_t Path = CSSymbolOwnerGetPath();
    if (Path) {
      uint64_t v6 = (const char *)Path;
    }
    else {
      uint64_t v6 = "<unknown>";
    }
    uint64_t v7 = objc_alloc(&OBJC_CLASS___VMUClassInfo);
    [NSString stringWithUTF8String:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[VMUClassInfo initWithClassName:binaryPath:type:]( v7,  "initWithClassName:binaryPath:type:",  @"NSBlock",  v8,  1LL);

    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __46__VMUObjectIdentifier_findObjCAndSwiftClasses__block_invoke;
    v12[3] = &unk_189DFF380;
    int v13 = v9;
    int v14 = v6;
    v12[4] = self;
    uint64_t v10 = v9;
    int v11 = (void (**)(void, void, void))MEMORY[0x186E33044](v12);
    ((void (**)(void, const char *, const __CFString *))v11)[2]( v11,  "__NSConcreteStackBlock",  @"__NSStackBlock__");
    ((void (**)(void, const char *, const __CFString *))v11)[2]( v11,  "__NSConcreteMallocBlock",  @"__NSMallocBlock__");
    ((void (**)(void, const char *, const __CFString *))v11)[2]( v11,  "__NSConcreteGlobalBlock",  @"__NSGlobalBlock__");
    ((void (**)(void, const char *, const __CFString *))v11)[2]( v11,  "__NSConcreteWeakBlockVariable",  @"__NSWeakBlockVariable__");
  }

void __46__VMUObjectIdentifier_findObjCAndSwiftClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) addressOfSymbol:a2 inLibrary:"libclosure.dylib"];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_alloc(&OBJC_CLASS___VMUMutableClassInfo);
    [NSString stringWithUTF8String:*(void *)(a1 + 48)];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[VMUClassInfo initWithClassName:binaryPath:type:](v7, "initWithClassName:binaryPath:type:", v10, v8, 1LL);

    -[VMUMutableClassInfo setSuperclassInfo:](v9, "setSuperclassInfo:", *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 192) addClassInfo:v9 forAddress:v6];
    ++*(void *)(*(void *)(a1 + 32) + 256LL);
  }
}

- (void)findFutureClasses
{
  if (v8)
  {
    uint64_t v3 = (*((uint64_t (**)(void))self->_memoryReader + 2))();
    if (v3)
    {
      if (*(_DWORD *)(v3 + 8))
      {
        uint64_t v4 = (*(_DWORD *)(v3 + 12) + 1);
        uint64_t v5 = (*((uint64_t (**)(id, void, uint64_t))self->_memoryReader + 2))( self->_memoryReader,  *(void *)(v3 + 16),  16 * v4);
        if (v5 && (_DWORD)v4 != 0)
        {
          uint64_t v7 = (void *)(v5 + 8);
          do
          {
            if (*(v7 - 1) != -1LL) {
              -[VMUObjectIdentifier _faultClass:ofType:](self, "_faultClass:ofType:", *v7, 8LL);
            }
            v7 += 2;
            --v4;
          }

          while (v4);
        }
      }
    }
  }

- (VMUAutoreleasePoolPageLayout)createAutoreleasePoolPageLayout
{
  uint64_t v3 = (VMUAutoreleasePoolPageLayout *)calloc(1uLL, 0x20uLL);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_autoreleasepoolpage_next_offset",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  4uLL,  v3);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_autoreleasepoolpage_parent_offset",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  4uLL,  &v3->var1);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_autoreleasepoolpage_begin_offset",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  4uLL,  &v3->var2);
  if (!v3->var2) {
    v3->var2 = 56;
  }
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_autoreleasepoolpage_ptr_mask",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &v3->var3);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_autoreleasepoolpage_child_offset",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  4uLL,  &v3->var4);
  return v3;
}

- (void)setupIsaTranslator
{
  uint64_t Range = CSSymbolGetRange();
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_indexed_classes_count",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &v28);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_isa_class_mask",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &v27);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_isa_magic_mask",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &v26);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_isa_magic_value",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &v25);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_taggedpointer_mask",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &self->_taggedPointerMask);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_taggedpointer_obfuscator",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  &self->_taggedPointerObfuscator);
  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_tag60_permutations",  self->_libobjcSymbolOwner._opaque_1,  self->_libobjcSymbolOwner._opaque_2,  8uLL,  self->_taggedPointerPermutations);
  uint64_t v4 = self->_task;
  uint64_t v5 = v4;
  uint64_t v6 = v32;
  if (v32 && (v7 = v31) != 0 && (uint64_t v8 = v30) != 0 && (v9 = v29) != 0 && Range && (v10 = v28) != 0)
  {
    self->_fragileNonPointerIsas = 1;
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke;
    v24[3] = &__block_descriptor_88_e20_Q24__0____v__QQ_8Q16l;
    v24[4] = v27;
    v24[5] = v8;
    v24[6] = v6;
    v24[7] = v7;
    v24[8] = v9;
    v24[9] = v10;
    v24[10] = Range;
    int v11 = (void *)MEMORY[0x186E33044](v24);
    id isaTranslator = self->_isaTranslator;
    self->_id isaTranslator = v11;
  }

  else if (v27 && v26)
  {
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_2;
    v19[3] = &unk_189DFF3C8;
    uint64_t v21 = v27;
    uint64_t v22 = v26;
    uint64_t v23 = v25;
    int v20 = v4;
    int v13 = (void *)MEMORY[0x186E33044](v19);
    id v14 = self->_isaTranslator;
    self->_id isaTranslator = v13;

    id isaTranslator = v20;
  }

  else
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_3;
    v17[3] = &unk_189DFF3F0;
    id v18 = v4;
    uint64_t v15 = (void *)MEMORY[0x186E33044](v17);
    id v16 = self->_isaTranslator;
    self->_id isaTranslator = v15;

    id isaTranslator = v18;
  }
}

unint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke( void *a1,  void *a2,  unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if ((a3 & ~a1[4]) != 0)
  {
    uint64_t v7 = a1[5];
    if ((a3 & ~v7) != 0)
    {
      if ((a1[6] & a3) == a1[7]
        && (unint64_t v8 = (v7 & a3) >> a1[8], v8 <= a1[9])
        && (uint64_t v9 = (unint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v5 + 2))( v5,  a1[10] + 8 * v8,  8LL)) != 0LL)
      {
        a3 = *v9;
      }

      else
      {
        a3 = 0LL;
      }
    }
  }

  return a3;
}

uint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[5];
  if ((a3 & ~v3) == 0) {
    return a3;
  }
  if ((a1[6] & a3) == a1[7]) {
    return v3 & a3;
  }
  return -[VMUTask ptrauthStripDataPointer:](a1[4], a3);
}

uint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 32), a3);
}

- (unint64_t)translateIsaPointer:(unint64_t)a3
{
  id isaTranslator = (uint64_t (**)(id, id, unint64_t))self->_isaTranslator;
  if (isaTranslator) {
    return isaTranslator[2](isaTranslator, self->_memoryReader, a3);
  }
  else {
    return a3;
  }
}

- (_VMURange)vmRegionRangeForAddress:(unint64_t)a3
{
  targetProcessVMranges = self->_targetProcessVMranges;
  if (!targetProcessVMranges)
  {
    task_find_all_malloc_regions(self->_task);
    uint64_t v6 = (VMUNonOverlappingRangeArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_targetProcessVMranges;
    self->_targetProcessVMranges = v6;

    targetProcessVMranges = self->_targetProcessVMranges;
  }

  uint64_t v8 = -[VMURangeArray rangeForLocation:](targetProcessVMranges, "rangeForLocation:", a3);
  unint64_t v10 = v9;
  if (!v9)
  {
    unint64_t v18 = a3;
    unint64_t v17 = 0LL;
    int v16 = 9999;
    -[VMUTask memoryCache](self->_task, "memoryCache", 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 machVMRegionRecurseSubmapShortInfo64onAddress:&v18 size:&v17 nestingDepth:&v16 info:&v15];

    if (!v12)
    {
      uint64_t v8 = v18;
      unint64_t v10 = v17;
      -[VMUNonOverlappingRangeArray mergeRange:](self->_targetProcessVMranges, "mergeRange:", v18, v17);
    }
  }

  unint64_t v13 = v8;
  unint64_t v14 = v10;
  result.length = v14;
  result.unint64_t location = v13;
  return result;
}

- (unint64_t)addressOfSymbol:(const char *)a3 inLibrary:(const char *)a4
{
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore")) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  return CSSymbolGetRange();
}

- (_CSTypeRef)symbolForAddress:(unint64_t)a3
{
  unint64_t SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime();
  result._unint64_t opaque_2 = v4;
  result._unint64_t opaque_1 = SymbolWithAddressAtTime;
  return result;
}

- (id)osMajorMinorVersionString
{
  return &stru_189E010C8;
}

- (void)buildIsaToObjectLabelHandlerMap
{
  uint64_t v3 = (void *)MEMORY[0x186E32E40](self, a2);
  [MEMORY[0x189607920] mapTableWithKeyOptions:514 valueOptions:0];
  unint64_t v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  isaToObjectLabelHandlerMap = self->_isaToObjectLabelHandlerMap;
  self->_isaToObjectLabelHandlerMap = v4;

  [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.Symbolication"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectIdentifier osMajorMinorVersionString](self, "osMajorMinorVersionString");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@-%@", @"VMUObjectLabelHandlers", v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 pathForResource:v8 ofType:@"plist"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || ([v6 pathForResource:@"VMUObjectLabelHandlers" ofType:@"plist"],
        (unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v9];
    if (v10)
    {
      [MEMORY[0x189607920] mapTableWithKeyOptions:0 valueOptions:514];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = MEMORY[0x1895F87A8];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke;
      v19[3] = &unk_189DFF418;
      id v13 = v11;
      id v20 = v13;
      [v10 enumerateKeysAndObjectsUsingBlock:v19];
      realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
      v16[0] = v12;
      v16[1] = 3221225472LL;
      v16[2] = __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke_2;
      v16[3] = &unk_189DFF440;
      id v17 = v13;
      unint64_t v18 = self;
      id v15 = v13;
      -[VMUClassInfoMap enumerateInfosWithBlock:](realizedIsaToClassInfo, "enumerateInfosWithBlock:", v16);
    }

    else
    {
      NSLog(@"Symbolication: could not read object label handler plist from %@", v9);
    }
  }

  else
  {
    NSLog( @"Symbolication: could not find object label handler plist %@.plist",  @"VMUObjectLabelHandlers");
  }

  objc_autoreleasePoolPop(v3);
}

void __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [a2 stringByAppendingString:@"length:remoteAddress:"];
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v7 = NSSelectorFromString(v6);
  if (v7)
  {
    SEL v8 = v7;
    [v5 objectForKey:@"Classes"];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          [*(id *)(a1 + 32) objectForKey:v14];
          [*(id *)(a1 + 32) setObject:v8 forKey:v14];
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v11);
    }
  }
}

void __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    [v5 className];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v6];
    if (v7)
    {
      SEL v8 = (const char *)v7;
      if ([v11 infoType] == 1)
      {
        Class Class = objc_getClass((const char *)[v6 UTF8String]);
        if (Class) {
          goto LABEL_7;
        }
      }

      if ([v11 infoType] != 1)
      {
        Class Class = 0LL;
LABEL_7:
        uint64_t v10 = objc_alloc_init(&OBJC_CLASS___VMUObjectLabelHandlerInfo);
        objc_storeStrong((id *)&v10->_className, v6);
        v10->_localClass Class = Class;
        v10->_handlerSelector = v8;
        [*(id *)(*(void *)(a1 + 40) + 320) setObject:v10 forKey:a2];
      }
    }

    id v5 = v11;
  }
}

- (void)objectLabelHandlerForRemoteIsa:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = a1;
    unint64_t v4 = (void *)a1[40];
    if (!v4)
    {
      [v3 buildIsaToObjectLabelHandlerMap];
      unint64_t v4 = (void *)v3[40];
    }

    [v4 objectForKey:a2];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (BOOL)_remoteAddressIsOKtoRead:(unint64_t)a3
{
  unsigned int objectContentLevel = self->_objectContentLevel;
  if (objectContentLevel == 3) {
    return 1;
  }
  if (objectContentLevel == 2) {
    return -[VMURangeArray containsLocation:](self->_readonlyRegionRanges, "containsLocation:", a3);
  }
  return 0;
}

- (id)labelForTaggedPointer:(void *)a3
{
  uint64_t v5 = 0LL;
  unint64_t taggedPointerObfuscator = self->_taggedPointerObfuscator;
  unint64_t v7 = taggedPointerObfuscator ^ (unint64_t)a3;
  do
  {
    ++v5;
  }

  while (v5 != 7);
  unint64_t v8 = v5 | v7 & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v9 = *MEMORY[0x189616658] ^ v8;
  if ((~v9 & 0xC000000000000007LL) != 0) {
    unint64_t v8 = v9 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v9 & 7));
  }
  switch(v5)
  {
    case 6LL:
      -[VMUObjectIdentifier labelForNSDate:length:remoteAddress:]( self,  "labelForNSDate:length:remoteAddress:",  v8,  0LL,  0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    case 3LL:
      -[VMUObjectIdentifier labelForNSNumber:length:remoteAddress:]( self,  "labelForNSNumber:length:remoteAddress:",  v8,  0LL,  0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    case 2LL:
      -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:]( self,  "uniquifyStringLabel:stringType:printDetail:",  v8,  0LL,  0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_14:
      uint64_t v10 = 0LL;
      break;
  }

  return v10;
}

- (id)classNameForTaggedPointer:(void *)a3
{
  uint64_t v3 = 0LL;
  uint64_t v4 = *MEMORY[0x189616658];
  unint64_t v5 = v4 ^ (unint64_t)a3;
  do
  {
    if ((v5 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v3)) {
      break;
    }
    ++v3;
  }

  while (v3 != 7);
  unint64_t v6 = v3 | v5;
  uint64_t v7 = v3 & 7;
  uint64_t v8 = (v6 >> 55) + 8LL;
  if (v7 == 7) {
    uint64_t v7 = v8;
  }
  else {
    return *(&off_189DFF658 + v7);
  }
}

- (BOOL)isTaggedPointer:(void *)a3
{
  return (self->_taggedPointerMask & (unint64_t)a3) != 0;
}

- (unint64_t)countFromPointerInAutoreleasePool:(void *)a3
{
  unint64_t var3 = self->_autoreleasePoolPageLayout->var3;
  if (!var3) {
    return 0LL;
  }
  if ((var3 & 0xF00000000000000LL) != 0) {
    return ((unint64_t)a3 >> 44) & 0xFF0 | ((unint64_t)a3 >> 60);
  }
  return (unint64_t)a3 >> 48;
}

- (id)uniquifyStringLabel:(id)a3 stringType:(int)a4 printDetail:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int v9 = a4 & 0x40;
  if (v5) {
    int v10 = a4;
  }
  else {
    int v10 = 0;
  }
  if (v5) {
    __int16 v11 = a4;
  }
  else {
    __int16 v11 = a4 & 0x40;
  }
  id v12 = self->_labelStringUniquingMaps[v10];
  id v13 = self->_stringTypeDescriptions[v10];
  if (!v12)
  {
    uint64_t v14 = v10;
    if (!v10)
    {
      uint64_t v20 = (void *)objc_opt_new();
      labelStringUniquingMaps = self->_labelStringUniquingMaps;
      id v12 = v20;
      id v16 = *labelStringUniquingMaps;
      labelStringUniquingMaps[v14] = v12;
LABEL_34:

      goto LABEL_35;
    }

    id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v16 = v15;
    int v17 = v11 & 7;
    if (v17 == 2)
    {
      uint64_t v22 = @"has-length-byte";
LABEL_29:
      [v16 addObject:v22];
      goto LABEL_30;
    }

    if (v17 == 4)
    {
      if ((v11 & 0x80) != 0) {
        [v15 addObject:@"immortal"];
      }
      if ((v11 & 0x100) == 0) {
        goto LABEL_30;
      }
      uint64_t v22 = @"short";
      goto LABEL_29;
    }

    if (v17 != 3)
    {
LABEL_30:
      [v16 componentsJoinedByString:@" "];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v23 length])
      {
        objc_storeStrong(&self->_stringTypeDescriptions[v14], v23);
        __int128 v24 = (void *)objc_opt_new();
        uint64_t v25 = self->_labelStringUniquingMaps;
        id v26 = v24;
        id v12 = v26;
      }

      else
      {

        id v27 = self->_labelStringUniquingMaps[1];
        uint64_t v25 = self->_labelStringUniquingMaps;
        id v26 = v27;
        id v12 = v26;
        uint64_t v23 = 0LL;
      }

      id v28 = v25[v14];
      v25[v14] = v26;

      id v13 = v23;
      goto LABEL_34;
    }

    if (v9)
    {
      unint64_t v19 = @"constant";
    }

    else
    {
      if ((v11 & 0x28) == 0
        || ((v11 & 8) != 0 ? (__int128 v18 = @"mutable") : (__int128 v18 = @"immutable"),
            [v15 addObject:v18],
            (v11 & 0x20) == 0))
      {
LABEL_27:
        if ((v11 & 0x10) != 0)
        {
          uint64_t v22 = @"Unicode";
          goto LABEL_29;
        }

        goto LABEL_30;
      }

      unint64_t v19 = @"non-inline";
    }

    [v16 addObject:v19];
    goto LABEL_27;
  }

- (id)labelForNSString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSString:mappedSize:remoteAddress:printDetail:]( self,  "labelForNSString:mappedSize:remoteAddress:printDetail:",  a3,  a4,  a5,  1LL);
}

- (id)labelForNSString:(void *)a3 mappedSize:(unint64_t)a4 remoteAddress:(unint64_t)a5 printDetail:(BOOL)a6
{
  BOOL v6 = a6;
  stringFromMappedNSCFString(self->_task, (uint64_t)a3, a4, a5, self->_readonlyRegionRanges, (int *)&v11);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:]( self,  "uniquifyStringLabel:stringType:printDetail:",  v8,  v11,  v6);
    int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else if (self->_objectContentLevel == 2)
  {
    int v9 = 0LL;
  }

  else
  {
    int v9 = @"<couldn't read content>";
  }

  return v9;
}

- (id)labelForNSCFStringAtRemoteAddress:(unint64_t)a3 printDetail:(BOOL)a4
{
  BOOL v4 = a4;
  -[VMUTask memoryCache](self->_task, "memoryCache");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 tryPeekAtAddress:a3 outPtr:&v17];

  if (v8 < 0x10)
  {
    id v13 = 0LL;
  }

  else
  {
    uint64_t v9 = *v17;
    id isaTranslator = (uint64_t (**)(id, id, uint64_t))self->_isaTranslator;
    if (isaTranslator) {
      uint64_t v9 = isaTranslator[2](isaTranslator, self->_memoryReader, v9);
    }
    uint64_t v11 = -[VMUObjectIdentifier objectLabelHandlerForRemoteIsa:](self, v9);
    id v12 = (void *)v11;
    if (v11 && *(char **)(v11 + 24) == sel_labelForNSString_length_remoteAddress_)
    {
      -[VMUObjectIdentifier labelForNSString:mappedSize:remoteAddress:printDetail:]( self,  "labelForNSString:mappedSize:remoteAddress:printDetail:",  v17,  v8,  a3,  v4);
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v13 = 0LL;
    }
  }

  if (-[VMUObjectIdentifier isTaggedPointer:](self, "isTaggedPointer:", a3))
  {
    -[VMUObjectIdentifier labelForTaggedPointer:](self, "labelForTaggedPointer:", a3);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = v13;
  }

  id v15 = v14;

  return v15;
}

- (id)labelForNSTaggedPointerStringCStringContainer:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    [MEMORY[0x189NSStringTF8String:(char *)a3 + 8, a4, a5];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:]( self,  "uniquifyStringLabel:stringType:printDetail:",  v6,  1LL,  0LL);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)labelForNSConcreteAttributedString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:]( self,  "labelForNSCFStringAtRemoteAddress:printDetail:",  *((void *)a3 + 1),  0LL,  a5);
}

- (id)labelForSwiftStringStorage:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  BOOL v8 = -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", a5);
  uint64_t v9 = 0LL;
  if (a4 >= 0x20 && v8)
  {
    int v10 = memchr((char *)a3 + 32, 0, a4 - 32);
    if (v10)
    {
      uint64_t v11 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:(char *)a3 + 32 length:v10 - ((_BYTE *)a3 + 32) encoding:4 freeWhenDone:0];
      -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:]( self,  "uniquifyStringLabel:stringType:printDetail:",  v11,  4LL,  1LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  return v9;
}

- (id)labelForNSURL:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7 = -[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:]( self,  "labelForObjectOfClass:atOffset:ofObject:withLength:",  @"NSURL",  32LL,  a3,  a4);
  if (v7)
  {
    BOOL v8 = (void *)v7;
    [NSString stringWithFormat:@"Base URL: %@;  ", v7];
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = &stru_189E010C8;
  }

  -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:]( self,  "labelForNSCFStringAtRemoteAddress:printDetail:",  *((void *)a3 + 3),  0LL);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    [NSString stringWithFormat:@"%@%@", v9, v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)labelForNSPathStore2:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", a5, a4))
  {
    [NSString stringWithString:a3];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:]( self,  "uniquifyStringLabel:stringType:printDetail:",  v7,  1LL,  1LL);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v8 = 0LL;
  }

  return v8;
}

- (id)labelForCFBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 hasPrefix:@"file://"])
  {
    BOOL v6 = (void *)NSString;
    [v5 substringFromIndex:8];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v6 stringWithFormat:@"%@", v7];

    BOOL v5 = (void *)v8;
  }

  return v5;
}

- (id)labelForNSBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:]( self,  "labelForObjectOfClass:atOffset:ofObject:withLength:",  @"NSPathStore2",  48LL,  a3,  a4);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      int v10 = v9;
      [v9 substringFromIndex:[v9 rangeOfString:@"\""]];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  return v8;
}

- (id)labelForNSNumber:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3 && (CFNumberType Type = CFNumberGetType((CFNumberRef)a3), (unint64_t)(Type - 1) <= 5))
  {
    uint64_t v8 = (void *)NSString;
    uint64_t v9 = labelForNSNumber_length_remoteAddress__kNSNumberTypeStrings[Type];
    [a3 description];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"type %s  value: %@", v9, v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet member:](self->_stringUniquingSet, "member:", v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[NSMutableSet addObject:](self->_stringUniquingSet, "addObject:", v11);
      id v12 = v11;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)formattedDateLabel:(id)a3
{
  BOOL v4 = (void *)formattedDateLabel__dateFormatter;
  if (!formattedDateLabel__dateFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x189607848]);
    BOOL v6 = (void *)formattedDateLabel__dateFormatter;
    formattedDateLabel__dateFormatter = (uint64_t)v5;

    [(id)formattedDateLabel__dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    BOOL v4 = (void *)formattedDateLabel__dateFormatter;
  }

  return (id)[v4 stringFromDate:a3];
}

- (id)labelForNSDate:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    -[VMUObjectIdentifier formattedDateLabel:](self, "formattedDateLabel:", a3, a4, a5);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)labelForItemCount:(int64_t)a3
{
  if (self->_objectContentLevel == 3)
  {
    -[NSMapTable objectForKey:](self->_itemCountToLabelStringUniquingMap, "objectForKey:");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      [MEMORY[0x189NSStringormat:@"item count: %ld" a3];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_itemCountToLabelStringUniquingMap, "setObject:forKey:", v5, a3);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)labelForNSArray:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", CFArrayGetCount((CFArrayRef)a3));
}

- (id)labelForNSDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", [a3 count]);
}

- (id)labelForNSCFDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (objectIsDeallocatingOrDeallocated((BOOL)a3))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    -[VMUObjectIdentifier labelForNSDictionary:length:remoteAddress:]( self,  "labelForNSDictionary:length:remoteAddress:",  a3,  a4,  a5);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)labelForNSConcreteHashTable:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", [a3 count]);
}

- (id)labelForNSSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", [a3 count]);
}

- (id)labelForNSCFSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (objectIsDeallocatingOrDeallocated((BOOL)a3))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    -[VMUObjectIdentifier labelForNSSet:length:remoteAddress:](self, "labelForNSSet:length:remoteAddress:", a3, a4, a5);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)labelForNSData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 0, 1, WeakRetained);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelForNSConcreteData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  int v7 = *((_DWORD *)a3 + 2) & 1;
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, v7, 0, WeakRetained);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)labelForNSConcreteMutableData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 0, 0, WeakRetained);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelForNSInlineData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 1, 0, WeakRetained);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelForCoreMediaFigObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t v8 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((void *)a3 + 3));
  if (HIDWORD(v8)) {
    BOOL v9 = (v8 & 7) == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9) {
    goto LABEL_20;
  }
  unint64_t v10 = v8;
  uint64_t v28 = 0LL;
  -[VMUTask memoryCache](self->_task, "memoryCache");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = [v11 peekAtAddress:v10 size:16 returnsBuf:&v28];

  id v12 = 0LL;
  if ((_DWORD)v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v28 == 0;
  }
  if (!v13)
  {
    unint64_t v14 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *(void *)(v28 + 8));
    if (HIDWORD(v14)) {
      BOOL v15 = (v14 & 7) == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v15) {
      goto LABEL_20;
    }
    unint64_t v16 = v14;
    id v27 = 0LL;
    -[VMUTask memoryCache](self->_task, "memoryCache");
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 peekAtAddress:v16 size:8 returnsBuf:&v27];

    id v12 = 0LL;
    if (!v18 && v27 != 0LL)
    {
      if ((unint64_t)(*v27 - 1025LL) < 0xFFFFFFFFFFFFFC03LL)
      {
LABEL_20:
        id v12 = 0LL;
        return v12;
      }

      -[VMUTask memoryCache](self->_task, "memoryCache");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = [v21 peekAtAddress:v16 size:88 returnsBuf:&v27];

      id v12 = 0LL;
      if (!v22 && v27)
      {
        uint64_t v23 = v27[10];
        if (!v23) {
          goto LABEL_20;
        }
        id v12 = 0LL;
        BOOL v24 = __CFADD__(v23, 32LL);
        unint64_t v25 = v23 + 32;
        if (!v24 && a4 > v25)
        {
          id v26 = (char *)a3 + v25;
          if (!v26) {
            goto LABEL_20;
          }
          id v12 = (void *)strnlen(v26, a4 - v25);
          if (v12)
          {
            [MEMORY[0x189NSStringormat:@"label: %.*s" v12, v26];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }

  return v12;
}

- (id)labelForOSDispatchMach:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  if (label)
  {
    if (!-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", label))
    {
      BOOL v9 = 0LL;
      return v9;
    }

    -[VMUTask memoryCache](self->_task, "memoryCache");
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = (const char *)[v7 peekStringAtAddress:label];
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  if (!v8) {
    unint64_t v8 = "";
  }
  if (!strncmp(v8, "com.apple.xpc.anonymous", 0x17uLL))
  {
    BOOL v9 = @"anonymous";
    return v9;
  }

  if (!strstr(v8, ".peer.0x"))
  {
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    uint64_t Name = (const char *)CSSymbolOwnerGetName();
    if (!Name || (uint64_t v11 = Name, !strcmp(Name, "CoreFoundation")))
    {
      if (!strncmp(v8, "com.apple.CFNetwork", 0x13uLL))
      {
        uint64_t v11 = "CFNetwork";
      }

      else if (!strncmp(v8, "com.apple.CF", 0xCuLL))
      {
        uint64_t v11 = "CoreFoundation";
      }

      else
      {
        if (strncmp(v8, "com.apple.lsd", 0xDuLL))
        {
          [MEMORY[0x189NSStringormat:@"\"%s\"", v8, v13];
LABEL_22:
          BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          return v9;
        }

        uint64_t v11 = "LaunchServices";
      }
    }

    [MEMORY[0x189NSStringormat:@"%s (from %s)", v8, v11];
    goto LABEL_22;
  }

  [NSString stringWithUTF8String:v8];
  BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)labelForOSDispatchQueue:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    HIDWORD(v8) = dispatch_queue_get_qos_class((dispatch_queue_t)a3, &relative_priority_ptr) - 9;
    LODWORD(v8) = HIDWORD(v8);
    unsigned int v7 = v8 >> 2;
    if (v7 <= 6 && ((0x5Du >> v7) & 1) != 0)
    {
      [NSString stringWithFormat:@"%@  QOS %s", v6, off_189DFF690[v7]];
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v9 = v6;
    }

    unint64_t v10 = v9;
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  return v10;
}

- (id)labelForOSLog:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel != 3) {
    goto LABEL_10;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__VMUObjectIdentifier_labelForOSLog_length_remoteAddress___block_invoke;
  block[3] = &unk_189DFDD08;
  block[4] = self;
  if (labelForOSLog_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForOSLog_length_remoteAddress__onceToken, block);
  }
  if (labelForOSLog_length_remoteAddress__libtraceVersion > 0x41A
    || (unint64_t v7 = *((void *)a3 + 5), !(v7 >> 28)))
  {
    unint64_t v7 = *((void *)a3 + 3);
    if (!(v7 >> 28)) {
      goto LABEL_10;
    }
  }

  -[VMUTask memoryCache](self->_task, "memoryCache");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (const char *)[v8 peekStringAtAddress:v7 + 4];

  if (!v9) {
    goto LABEL_10;
  }
  size_t v10 = strlen(v9);
  -[VMUTask memoryCache](self->_task, "memoryCache");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 peekStringAtAddress:v7 + v10 + 5];

  if (v12)
  {
    [MEMORY[0x189NSStringormat:@"[%s:%s]" v9, v12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_10:
    uint64_t v13 = 0LL;
  }

  return v13;
}

uint64_t __58__VMUObjectIdentifier_labelForOSLog_length_remoteAddress___block_invoke(uint64_t a1)
{
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t result = CSSymbolOwnerGetVersion();
  if (result)
  {
    uint64_t result = atoi((const char *)result);
    labelForOSLog_length_remoteAddress__libtraceVersion = result;
  }

  return result;
}

- (id)noLabelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (noLabelForOSXPCObject_length_remoteAddress__onceToken != -1) {
    dispatch_once(&noLabelForOSXPCObject_length_remoteAddress__onceToken, &__block_literal_global_258_0);
  }
  if (noLabelForOSXPCObject_length_remoteAddress__shouldGetLabelForAllOSXPCObjects == 1)
  {
    -[VMUObjectIdentifier labelForOSXPCObject:length:remoteAddress:]( self,  "labelForOSXPCObject:length:remoteAddress:",  a3,  a4,  a5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

const char *__66__VMUObjectIdentifier_noLabelForOSXPCObject_length_remoteAddress___block_invoke()
{
  uint64_t result = getenv("SYMBOLICATION_LABELS_FOR_ALL_OSXPCOBJECTS");
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, "YES");
    if (!(_DWORD)result) {
      noLabelForOSXPCObject_length_remoteAddress__shouldGetLabelForAllOSXPCObjects = 1;
    }
  }

  return result;
}

- (id)labelForOSXPCDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (labelForOSXPCDictionary_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForOSXPCDictionary_length_remoteAddress__onceToken, &__block_literal_global_260);
  }
  if (labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction
    && labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction(a3))
  {
    [MEMORY[0x189607940] stringWithString:@"Request/Reply message for active transaction with "];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
    if (!remote_connection
      || (xpc_connection_t v9 = remote_connection,
          p_scanner = &self->_scanner,
          id v11 = objc_loadWeakRetained((id *)p_scanner),
          uint64_t v12 = [v11 nodeForAddress:v9],
          v11,
          (_DWORD)v12 == -1))
    {
      [v7 appendString:@"<unknown connection>"];
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_scanner);
      [WeakRetained labelForNode:v12];
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v7 appendString:v14];
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

void *__68__VMUObjectIdentifier_labelForOSXPCDictionary_length_remoteAddress___block_invoke()
{
  uint64_t result = dlopen("/usr/lib/system/libxpc.dylib", 16);
  if (result)
  {
    v1 = result;
    labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction = (uint64_t (*)(void))dlsym(result, "_xpc_dictionary_get_transaction");
    return (void *)dlclose(v1);
  }

  return result;
}

- (id)labelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel != 3) {
    return 0LL;
  }
  uint64_t v5 = xpc_inspect_copy_description();
  if (!v5) {
    return 0LL;
  }
  BOOL v6 = (void *)v5;
  [NSString stringWithUTF8String:v5];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);
  return v7;
}

uint64_t __64__VMUObjectIdentifier_labelForOSXPCObject_length_remoteAddress___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  size_t a4)
{
  BOOL v6 = (const void *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48LL) + 16LL))();
  if (!v6) {
    return 1LL;
  }
  memcpy(a2, v6, a4);
  return 0LL;
}

- (id)labelForOSTransaction:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t return_address;
  BOOL v10;
  int v11;
  double v12;
  id WeakRetained;
  uint64_t v14;
  unint64_t v15;
  unint64_t description;
  char *v17;
  void *v18;
  unint64_t v19;
  int v20;
  char *v21;
  void *v22;
  int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  if (self->_objectContentLevel == 1)
  {
    uint64_t v5 = 0LL;
    return v5;
  }

  if (labelForOSTransaction_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForOSTransaction_length_remoteAddress__onceToken, &__block_literal_global_269);
  }
  if (labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address) {
    return_address = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address(a3);
  }
  else {
    return_address = 0LL;
  }
  if (labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp) {
    size_t v10 = dword_18C68AAB4 == 0;
  }
  else {
    size_t v10 = 1;
  }
  id v11 = !v10;
  uint64_t v12 = 0.0;
  if (!v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
    unint64_t v14 = [WeakRetained suspendTimeContinuous];
    if (!v14) {
      unint64_t v14 = mach_continuous_approximate_time();
    }

    BOOL v15 = v14 * labelForOSTransaction_length_remoteAddress__info / dword_18C68AAB4;
  }

  if (!labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description)
  {
    if (self->_objectContentLevel == 3)
    {
      uint64_t v21 = (char *)os_transaction_copy_description();
      uint64_t v20 = 1;
      goto LABEL_34;
    }

    goto LABEL_32;
  }

  description = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description(a3);
  int v17 = (char *)description;
  if (description < (unint64_t)a3
    || (unint64_t)a3 + a4 <= description
    || (int v18 = malloc(a4),
        memcpy(v18, a3, a4),
        unint64_t v19 = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description(v18),
        free(v18),
        v17 == (char *)v19))
  {
    if (v17 && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", v17))
    {
      -[VMUTask memoryCache](self->_task, "memoryCache");
      int v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = (char *)[v22 peekStringAtAddress:v17];

LABEL_33:
      uint64_t v20 = 0;
      goto LABEL_34;
    }

void *__66__VMUObjectIdentifier_labelForOSTransaction_length_remoteAddress___block_invoke()
{
  uint64_t result = dlopen("/usr/lib/system/libxpc.dylib", 16);
  if (result)
  {
    v1 = result;
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp = (uint64_t (*)(void))dlsym(result, "os_transaction_get_timestamp");
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description = (uint64_t (*)(void))dlsym(v1, "os_transaction_get_description");
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address = (uint64_t (*)(void))dlsym(v1, "os_transaction_get_ra");
    return (void *)dlclose(v1);
  }

  return result;
}

- (id)labelFor_NSActivityAssertion:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:]( self,  "labelForNSCFStringAtRemoteAddress:printDetail:",  *((void *)a3 + 2),  0LL,  a5);
}

- (id)labelFor_RBSAssertionDescriptor:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (a4 < 0x20) {
    return 0LL;
  }
  -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:]( self,  "labelForNSCFStringAtRemoteAddress:printDetail:",  *((void *)a3 + 3),  0LL,  a5,  v5,  v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_findOffsetsInOSXPCConnection:(void *)a3 length:(unint64_t)a4
{
  if (self->_osDispatchMachOffsetInOSXPCConnection) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = a4 >= 0x10;
  }
  if (v4)
  {
    p_scanner = &self->_scanner;
    for (unsigned int i = 24; ; i += 8)
    {
      unint64_t v10 = *(void *)((char *)a3 + i - 16);
      if (HIDWORD(v10) && (*(void *)((_BYTE *)a3 + i - 16) & 7LL) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_scanner);
        uint64_t v13 = [WeakRetained nodeForAddress:v10];

        if ((_DWORD)v13 != -1)
        {
          id v14 = objc_loadWeakRetained((id *)p_scanner);
          BOOL v15 = v14;
          if (v14) {
            [v14 nodeDetails:v13];
          }
          else {
            unint64_t v19 = 0LL;
          }

          [v19 className];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          char v17 = [v16 isEqualToString:@"OS_dispatch_mach"];

          if ((v17 & 1) != 0) {
            break;
          }
        }
      }

      unint64_t v18 = i;
      if (v18 > a4) {
        return;
      }
    }

    self->_osDispatchMachOffsetInOSXPCConnection = i - 16;
  }

- (id)labelForOSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t osDispatchMachOffsetInOSXPCConnection = self->_osDispatchMachOffsetInOSXPCConnection;
  if (!(_DWORD)osDispatchMachOffsetInOSXPCConnection
    && (-[VMUObjectIdentifier _findOffsetsInOSXPCConnection:length:]( self,  "_findOffsetsInOSXPCConnection:length:",  a3,  a4,  a5),  uint64_t osDispatchMachOffsetInOSXPCConnection = self->_osDispatchMachOffsetInOSXPCConnection,  !(_DWORD)osDispatchMachOffsetInOSXPCConnection)
    || (-[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:]( self,  "labelForObjectOfClass:atOffset:ofObject:withLength:",  @"OS_dispatch_mach",  osDispatchMachOffsetInOSXPCConnection,  a3,  a4),  (xpc_connection_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    xpc_connection_t v9 = @"<couldn't read name>";
  }

  uint64_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
  if ((_DWORD)pid)
  {
    uint64_t v11 = pid;
    pidToProcessNameDict = self->_pidToProcessNameDict;
    [MEMORY[0x189607968] numberWithInt:pid];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pidToProcessNameDict, "objectForKeyedSubscript:", v13);
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      BOOL v15 = -[VMUProcInfo initWithPid:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithPid:", v11);
      uint64_t v16 = -[VMUProcInfo name](v15, "name");
      char v17 = (void *)v16;
      unint64_t v18 = @"<unknown>";
      if (v16) {
        unint64_t v18 = (__CFString *)v16;
      }
      id v14 = v18;

      unint64_t v19 = self->_pidToProcessNameDict;
      [MEMORY[0x189607968] numberWithInt:v11];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v14, v20);
    }

    uint64_t v21 = (void *)NSString;
    int v22 = v14;
    [v21 stringWithFormat:@"%@ pid %u [%s]", v9, v11, -[__CFString UTF8String](v22, "UTF8String")];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", @" [no process]");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)labelForOSXPCActivity:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v5 = *((void *)a3 + 3);
  if (v5
    && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", *((void *)a3 + 3), a4, a5)
    && (-[VMUTask memoryCache](self->_task, "memoryCache"),
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 peekStringAtAddress:v5],
        v7,
        v8))
  {
    [NSString stringWithUTF8String:v8];
    xpc_connection_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    xpc_connection_t v9 = 0LL;
  }

  return v9;
}

- (id)labelForProtocol:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7 = *((void *)a3 + 10);
  if (v7)
  {
    if (-[VMUObjectIdentifier _remoteAddressIsOKtoRead:]( self,  "_remoteAddressIsOKtoRead:",  *((void *)a3 + 10),  a4,  a5))
    {
      -[VMUTask memoryCache](self->_task, "memoryCache");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 peekStringAtAddress:v7];

      if (v9) {
        goto LABEL_7;
      }
    }
  }

  uint64_t v10 = *((void *)a3 + 1);
  if (v10
    && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", v10, a4, a5)
    && (-[VMUTask memoryCache](self->_task, "memoryCache"),
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v11 peekStringAtAddress:v10],
        v11,
        v9))
  {
LABEL_7:
    [NSString stringWithUTF8String:v9];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (id)labelForNSXPCInterface:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  id v6 = (id)[a3 protocol];
  if (v6)
  {
    -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v6, 88LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      [NSString stringWithFormat:@"Protocol: %@", v7];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)labelForNSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t block = MEMORY[0x1895F87A8];
  uint64_t v25 = 3221225472LL;
  id v26 = __68__VMUObjectIdentifier_labelForNSXPCConnection_length_remoteAddress___block_invoke;
  id v27 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v28 = a3;
  if (labelForNSXPCConnection_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForNSXPCConnection_length_remoteAddress__onceToken, &block);
  }
  uint64_t v7 = *(void *)((char *)a3 + labelForNSXPCConnection_length_remoteAddress__offsetOfRemoteObjectInterface);
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v7, class_getInstanceSize(v8));
  uint64_t v10 = *(void *)((char *)a3 + labelForNSXPCConnection_length_remoteAddress__offsetOfConnection);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  if (!WeakRetained
    || (id v12 = objc_loadWeakRetained((id *)&self->_scanner),
        uint64_t v13 = [v12 nodeForAddress:v10],
        v12,
        (_DWORD)v13 == -1))
  {
    uint64_t v17 = 0LL;
  }

  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_scanner);
    BOOL v15 = v14;
    if (v14)
    {
      [v14 nodeDetails:v13];
      uint64_t v16 = v22 & 0xFFFFFFFFFFFFFFFLL;
    }

    else
    {
      uint64_t v16 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
    }

    uint64_t v17 = -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v10, v16);
  }

  if (v9 | v17)
  {
    if (!v9) {
      uint64_t v9 = (uint64_t)@"Protocol: <couldn't read name>";
    }
    if (v17) {
      unint64_t v18 = (__CFString *)v17;
    }
    else {
      unint64_t v18 = &stru_189E010C8;
    }
    [NSString stringWithFormat:@"%@  Connection: %@", v9, v18, v21, v22, v23, block, v25, v26, v27, v28];
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v19 = 0LL;
  }

  return v19;
}

ptrdiff_t __68__VMUObjectIdentifier_labelForNSXPCConnection_length_remoteAddress___block_invoke(uint64_t a1)
{
  Class Class = object_getClass(*(id *)(a1 + 32));
  InstanceVariable = class_getInstanceVariable(Class, "_connection");
  labelForNSXPCConnection_length_remoteAddress__offsetOfConnection = ivar_getOffset(InstanceVariable);
  if (!labelForNSXPCConnection_length_remoteAddress__offsetOfConnection)
  {
    uint64_t v3 = class_getInstanceVariable(Class, "_xconnection");
    labelForNSXPCConnection_length_remoteAddress__offsetOfConnection = ivar_getOffset(v3);
  }

  BOOL v4 = class_getInstanceVariable(Class, "_remoteObjectInterface");
  ptrdiff_t result = ivar_getOffset(v4);
  labelForNSXPCConnection_length_remoteAddress__offsetOfRemoteObjectInterface = result;
  return result;
}

- (id)labelFor__NSMallocBlock__:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier symbolForRemoteAddress:]( self,  "symbolForRemoteAddress:",  -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((void *)a3 + 2)));
}

- (id)symbolForRemoteAddress:(unint64_t)a3
{
  if ((CSIsNull() & 1) != 0)
  {
    BOOL v4 = 0LL;
  }

  else
  {
    uint64_t Name = CSSymbolOwnerGetName();
    if (Name)
    {
      [NSString stringWithUTF8String:Name];
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v6 = @"<unknown-binary>";
    }

    CSSymbolOwnerGetSymbolWithAddress();
    if ((CSIsNull() & 1) != 0
      || (uint64_t v7 = CSSymbolGetName()) == 0
      || ([NSString stringWithUTF8String:v7],
          (uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
      uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
      if (BaseAddress)
      {
        [MEMORY[0x1896NSStringrmat:@"<unknown-symbol> %#qx + %qu" BaseAddress, a3 - BaseAddress];
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v8 = @"???";
      }
    }

    CSSymbolOwnerGetSourceInfoWithAddress();
    if ((CSIsNull() & 1) != 0)
    {
      uint64_t v10 = &stru_189E010C8;
    }

    else
    {
      uint64_t Path = CSSourceInfoGetPath();
      [MEMORY[0x189NSStringormat:@"  %s:%u", Path, CSSourceInfoGetLineNumber()];
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    [NSString stringWithFormat:@"%@  %@  %#qx%@", v6, v8, a3, v10];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)labelForClassDataRO:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassDataRO(self->_task, self->_memoryReader, a5);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)labelForClassDataRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassDataRW(self->_task, self->_memoryReader, self->_objcABI, a5);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)labelForClassDataExtRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassDataExtRW(self->_task, self->_memoryReader, self->_objcABI, a5);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)labelForClassStructure:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassStructure(self->_task, self->_memoryReader, self->_objcABI, a5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      VMUGetClassNameFromClassStructure(self->_task, self->_memoryReader, self->_objcABI, a5 + 16);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)labelForMallocBlock:(_VMURange)a3
{
  if (a3.location == self->_cfBooleanTrueAddress)
  {
    unsigned int objectContentLevel = self->_objectContentLevel;
    BOOL v4 = @"YES";
  }

  else
  {
    if (a3.location != self->_cfBooleanFalseAddress)
    {
      -[VMUObjectIdentifier labelForMallocBlock:usingHandlerBlock:]( self,  "labelForMallocBlock:usingHandlerBlock:",  a3.location,  a3.length,  0LL);
      return (id)objc_claimAutoreleasedReturnValue();
    }

    unsigned int objectContentLevel = self->_objectContentLevel;
    BOOL v4 = @"NO";
  }

  if (objectContentLevel == 3) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v5;
}

- (id)labelForMallocBlock:(_VMURange)a3 usingHandlerBlock:(id)a4
{
  size_t length = a3.length;
  unint64_t location = a3.location;
  id memoryReader = self->_memoryReader;
  uint64_t v8 = (uint64_t (*)(void *, unint64_t, size_t))memoryReader[2];
  id v9 = a4;
  uint64_t v10 = (unsigned __int8 *)v8(memoryReader, location, length);
  -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]( (uint64_t)self,  v10,  length,  location,  0LL,  v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)labelForMemory:(size_t)a3 length:(uint64_t)a4 remoteAddress:(void *)a5 classInfo:(void *)a6 usingHandlerBlock:
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = 0LL;
  if (a1 && a2)
  {
    if ((*(_DWORD *)(a1 + 180) & 0xFFFFFFFE) == 2)
    {
      id v14 = (void *)MEMORY[0x186E32E40]();
      if (!*(void *)(a1 + 320)) {
        [(id)a1 buildIsaToObjectLabelHandlerMap];
      }
      if ([v11 remoteIsa])
      {
        id v15 = v11;
      }

      else
      {
        [(id)a1 classInfoForMemory:a2 length:a3 remoteAddress:a4];
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v16 = v15;
      if (v15)
      {
        if ([v15 instanceSize] > a3)
        {
LABEL_12:
          uint64_t v13 = 0LL;
LABEL_55:

LABEL_62:
          objc_autoreleasePoolPop(v14);
          goto LABEL_63;
        }

        if (!v11) {
          goto LABEL_38;
        }
        goto LABEL_22;
      }

      if (!v11) {
        goto LABEL_29;
      }
      uint64_t v17 = *(id **)(a1 + 232);
      if (v17)
      {
        if (*v17 == v11 || v17[1] == v11)
        {
          uint64_t v18 = [(id)a1 labelForClassStructure:a2 length:a3 remoteAddress:a4];
          goto LABEL_34;
        }

        if (v17[2] == v11)
        {
          uint64_t v18 = [(id)a1 labelForClassDataRW:a2 length:a3 remoteAddress:a4];
          goto LABEL_34;
        }

        if (v17[3] == v11)
        {
          uint64_t v18 = [(id)a1 labelForClassDataExtRW:a2 length:a3 remoteAddress:a4];
          goto LABEL_34;
        }

        if (v17[5] == v11)
        {
          uint64_t v18 = [(id)a1 labelForClassDataRO:a2 length:a3 remoteAddress:a4];
LABEL_34:
          uint64_t v13 = (void *)v18;
          goto LABEL_55;
        }
      }

- (id)labelForObjectOfClass:(id)a3 atOffset:(unsigned int)a4 ofObject:(void *)a5 withLength:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = *(void *)((char *)a5 + a4);
  if (!v11) {
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v13 = objc_loadWeakRetained((id *)&self->_scanner);
  uint64_t v14 = [v13 nodeForAddress:v11];

  if ((_DWORD)v14 == -1) {
    goto LABEL_10;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_scanner);
  id v16 = v15;
  if (v15)
  {
    [v15 nodeDetails:v14];
  }

  else
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
  }

  uint64_t v17 = v24 & 0xFFFFFFFFFFFFFFFLL;
  if ((v24 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __74__VMUObjectIdentifier_labelForObjectOfClass_atOffset_ofObject_withLength___block_invoke;
    v20[3] = &unk_189DFF578;
    id v21 = v10;
    uint64_t v22 = self;
    -[VMUObjectIdentifier labelForMallocBlock:usingHandlerBlock:]( self,  "labelForMallocBlock:usingHandlerBlock:",  v11,  v17,  v20);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_10:
    uint64_t v18 = 0LL;
  }

  return v18;
}

id __74__VMUObjectIdentifier_labelForObjectOfClass_atOffset_ofObject_withLength___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  id v9 = a2;
  if ([*((id *)v9 + 1) isEqualToString:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) *((SEL *)v9 + 3) a3, a4, a5];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

void *__87__VMUObjectIdentifier_labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock___block_invoke()
{
  ptrdiff_t result = dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "class_createInstance");
  labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__located_class_createInstance = result;
  return result;
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]( (uint64_t)self,  (unsigned __int8 *)a3,  a4,  0LL,  0LL,  0LL);
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]( (uint64_t)self,  (unsigned __int8 *)a3,  a4,  a5,  0LL,  0LL);
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 classInfo:(id)a6
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]( (uint64_t)self,  (unsigned __int8 *)a3,  a4,  a5,  a6,  0LL);
}

- (_CSTypeRef)_symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (id)_scanner
{
  return objc_loadWeakRetained((id *)&self->_scanner);
}

- (BOOL)_dlopenLibSwiftRemoteMirrorFromDir:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4
    || (__int128 v27 = 0u,
        __int128 v28 = 0u,
        __int128 v25 = 0u,
        __int128 v26 = 0u,
        (uint64_t v5 = [&unk_189E1D0F0 countByEnumeratingWithState:&v25 objects:v29 count:16]) == 0))
  {
    char v7 = 0;
    goto LABEL_26;
  }

  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v26;
  do
  {
    uint64_t v9 = 0LL;
    do
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(&unk_189E1D0F0);
      }
      [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v25 + 1) + 8 * v9)];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
      if (libSwiftRemoteMirrors)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](libSwiftRemoteMirrors, "objectForKeyedSubscript:", v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12) {
          goto LABEL_9;
        }
      }

      id v13 = v10;
      uint64_t v14 = (const char *)[v13 UTF8String];
      if (v14)
      {
        id v15 = v14;
        if (access(v14, 4))
        {
          if (self->_debugSwiftRemoteMirror)
          {
            uint64_t v24 = *__error();
            NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Unable to access %@ with errno: %d", v13, v24);
          }
        }

        else
        {
          id v16 = dlopen(v15, 1);
          if (v16)
          {
            uint64_t v17 = v16;
            if (!self->_libSwiftRemoteMirrors)
            {
              uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
              unint64_t v19 = self->_libSwiftRemoteMirrors;
              self->_libSwiftRemoteMirrors = v18;
            }

            [MEMORY[0x189607B18] valueWithPointer:v17];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_libSwiftRemoteMirrors,  "setObject:forKeyedSubscript:",  v20,  v13);

            if (self->_debugSwiftRemoteMirror) {
              NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Successfully dlopened %@", v13);
            }
LABEL_9:
            char v7 = 1;
            goto LABEL_14;
          }

          if (self->_debugSwiftRemoteMirror) {
            NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Failed to dlopen %@", v13, v23);
          }
        }
      }

- (BOOL)_dlopenLibSwiftRemoteMirrorNearLibSwiftCore
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  int v7 = 0;
  CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
  BOOL v2 = *((_DWORD *)v5 + 6) == *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  return v2;
}

void __66__VMUObjectIdentifier__dlopenLibSwiftRemoteMirrorNearLibSwiftCore__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1895F89C0];
  uint64_t Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    [NSString stringWithUTF8String:Path];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringByDeletingLastPathComponent];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      char v5 = [v4 hasSuffix:@"/usr/lib/swift"];
      uint64_t v6 = *(id **)(a1 + 32);
      if ((v5 & 1) != 0)
      {
        if (([v6 _dlopenLibSwiftRemoteMirrorFromDir:v4] & 1) == 0)
        {
          int v7 = (void *)NSString;
          v14[0] = @"/System/Cryptexes/OS/";
          v14[1] = v4;
          uint64_t v8 = [MEMORY[0x189603F18] arrayWithObjects:v14 count:2];
          [v7 pathWithComponents:v8];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v8) = [*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v9];
          if ((v8 & 1) == 0) {
            goto LABEL_19;
          }
        }

        goto LABEL_18;
      }

      id WeakRetained = objc_loadWeakRetained(v6 + 7);
      [WeakRetained executablePath];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringByDeletingLastPathComponent];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && [v12 length])
      {
        if (![v4 hasPrefix:v12])
        {

          if (([*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v4] & 1) == 0)
          {
            [v4 stringByDeletingLastPathComponent];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              uint64_t v4 = 0LL;
              goto LABEL_19;
            }

            if ([*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v13])
            {
              uint64_t v4 = v13;
            }

            else
            {
              [v13 stringByAppendingPathComponent:@"Resources"];
              uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

- (BOOL)_dlopenLibSwiftRemoteMirrorNearExecutable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  [WeakRetained executablePath];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v4 stringByDeletingLastPathComponent];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (-[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:](self, "_dlopenLibSwiftRemoteMirrorFromDir:", v5))
      {
        BOOL v6 = 1;
      }

      else
      {
        [v5 stringByDeletingLastPathComponent];
        int v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          [v7 stringByAppendingPathComponent:@"Resources"];
          char v5 = (void *)objc_claimAutoreleasedReturnValue();

          BOOL v6 = -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:]( self,  "_dlopenLibSwiftRemoteMirrorFromDir:",  v5);
        }

        else
        {
          BOOL v6 = 0;
          char v5 = 0LL;
        }
      }
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_dlopenLibSwiftRemoteMirror
{
  if (-[VMUTask isExclave](self->_task, "isExclave")) {
    return -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:]( self,  "_dlopenLibSwiftRemoteMirrorFromDir:",  @"/usr/lib/swift");
  }
  if (-[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorNearLibSwiftCore]( self,  "_dlopenLibSwiftRemoteMirrorNearLibSwiftCore"))
  {
    return 1;
  }

  if (access("/Developer/usr/lib/swift", 5)) {
    return 0;
  }
  char v5 = opendir("/Developer/usr/lib/swift");
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5;
  BOOL v7 = 0;
  do
  {
    uint64_t v8 = readdir(v6);
    BOOL v4 = v8 != 0LL;
    if (!v8) {
      break;
    }
    if (v8->d_type == 4)
    {
      d_name = v8->d_name;
      if (v8->d_name[0] != 46)
      {
        [NSString stringWithUTF8String:"/Developer/usr/lib/swift"];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithUTF8String:d_name];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stringByAppendingPathComponent:v11];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        BOOL v7 = -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:]( self,  "_dlopenLibSwiftRemoteMirrorFromDir:",  v12);
      }
    }
  }

  while (!v7);
  closedir(v6);
  return v4;
}

- (int)_populateSwiftReflectionInfo:(SwiftReflectionInteropContext *)a3
{
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  int v8 = 0;
  -[VMUTask createSymbolicatorWithFlags:andNotification:]( self->_task,  "createSymbolicatorWithFlags:andNotification:",  CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData(),  0LL);
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  int v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __52__VMUObjectIdentifier__populateSwiftReflectionInfo___block_invoke(uint64_t a1)
{
  unint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
  uint64_t result = vmu_swift_reflection_addImage(*(int **)(a1 + 40), BaseAddress);
  if ((_DWORD)result) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }
  return result;
}

- (void)_populateSwiftABIVariables
{
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
  {
    swiftMirror = (uint64_t *)self->_swiftMirror;
    uint64_t v4 = 2LL;
LABEL_8:
    swiftMirror[1] = v4;
    goto LABEL_10;
  }

  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore")) {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
  }
  else {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t v7 = SymbolOwner;
  uint64_t v8 = v6;
  if ((CSIsNull() & 1) != 0)
  {
    swiftMirror = (uint64_t *)self->_swiftMirror;
    uint64_t v4 = 1LL;
    goto LABEL_8;
  }

  _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"_objc_debug_swift_stable_abi_bit",  v7,  v8,  8uLL,  &self->_swiftMirror->var1);
  swiftMirror = (uint64_t *)self->_swiftMirror;
LABEL_10:
  if (*swiftMirror) {
    vmu_swift_reflection_interop_setClassIsSwiftMask(*swiftMirror, swiftMirror[1]);
  }
}

- (void)loadSwiftReflectionLibraries
{
  int v3 = getenv("SYMBOLICATION_NO_SWIFT_REMOTE_MIRROR");
  if (!v3 || (uint64_t v4 = v3, strcmp(v3, "YES")) && strcmp(v4, "1"))
  {
    uint64_t v5 = getenv("SYMBOLICATION_LOG_SWIFT_REMOTE_MIRROR_MEMORY_READS");
    if (v5) {
      int v6 = atoi(v5);
    }
    else {
      int v6 = 0;
    }
    _CSTypeRef symbolicator = self->_symbolicator;
    uint64_t v22 = MEMORY[0x186E33044](self->_memoryReader);
    uint64_t v23 = [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:259];
    uint64_t v24 = [MEMORY[0x189607920] mapTableWithKeyOptions:1282 valueOptions:1282];
    char v25 = 0;
    uint64_t v27 = 0LL;
    int v26 = v6;
    objc_initWeak(&v28, self);
    objc_copyWeak(&v29, (id *)&self->_scanner);
    __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64( (uint64_t)&self->_swiftMirrorReaderContext,  (uint64_t)&symbolicator);
    ReflectionContext = (int *)vmu_swift_reflection_createReflectionContext( (uint64_t)&self->_swiftMirrorReaderContext,  (uint64_t)_query_data_layout_function,  0LL,  (uint64_t)_read_bytes_function,  (uint64_t)_get_string_length,  (uint64_t)_get_symbol_address);
    uint64_t v8 = MEMORY[0x1895F87A8];
    if (ReflectionContext)
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x2020000000LL;
      int v20 = 0;
      -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirror](self, "_dlopenLibSwiftRemoteMirror");
      libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
      v16[0] = v8;
      v16[1] = 3221225472LL;
      v16[2] = __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke;
      v16[3] = &unk_189DFF610;
      v16[5] = &v17;
      v16[6] = ReflectionContext;
      void v16[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( libSwiftRemoteMirrors,  "enumerateKeysAndObjectsUsingBlock:",  v16);
      if (!*((_DWORD *)v18 + 6))
      {
        vmu_swift_reflection_destroyReflectionContext(ReflectionContext);
        ReflectionContext = 0LL;
      }

      _Block_object_dispose(&v17, 8);
      if (ReflectionContext
        && !-[VMUObjectIdentifier _populateSwiftReflectionInfo:]( self,  "_populateSwiftReflectionInfo:",  ReflectionContext))
      {
        vmu_swift_reflection_destroyReflectionContext(ReflectionContext);
        ReflectionContext = 0LL;
      }
    }

    v15[0] = v8;
    v15[1] = 3221225472LL;
    v15[2] = __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke_2;
    v15[3] = &unk_189DFE6D0;
    v15[4] = self;
    uint64_t v10 = (void (**)(void, void, void))MEMORY[0x186E33044](v15);
    if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
    {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    }

    else
    {
      CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
      uint64_t SymbolOwner = CSSymbolicatorGetAOutSymbolOwner();
    }

    v10[2](v10, SymbolOwner, v12);
    -[VMUObjectIdentifier _loadSwiftAsyncTaskAndSlabRecognitionInfo](self, "_loadSwiftAsyncTaskAndSlabRecognitionInfo");
    if (ReflectionContext)
    {
      uint64_t v13 = vmu_swift_reflection_interop_typeRefForMangledTypeName((uint64_t)ReflectionContext, (uint64_t)"_$sBb", 5LL);
      swiftMirror = self->_swiftMirror;
      if (v13) {
        swiftMirror->var2 = v13;
      }
      else {
        swiftMirror->var2 = 0LL;
      }
    }

    else
    {
      swiftMirror = self->_swiftMirror;
    }

    swiftMirror->var0 = (SwiftReflectionInteropContext *)ReflectionContext;

    __destructor_8_sb16_s24_s32_w56_w64((id *)&symbolicator);
  }

void __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (vmu_swift_reflection_interop_addLibrary( *(void **)(a1 + 48),  (void *)[a3 pointerValue]))
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (*(_BYTE *)(*(void *)(a1 + 32) + 176LL)) {
      NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Loaded Swift Remote Mirror from %@", v5);
    }
  }

  else if (*(_BYTE *)(*(void *)(a1 + 32) + 176LL))
  {
    NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: swift_reflection_interop_addLibrary failed for %@", v5);
  }
}

void __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 176LL))
  {
    uint64_t Path = CSSymbolOwnerGetPath();
    uint64_t v7 = "<unavailable>";
    if (Path) {
      uint64_t v7 = (const char *)Path;
    }
    NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: loading info for Swift runtime at %s", v7);
  }

  uint64_t v8 = -[VMUSwiftRuntimeInfo initWithSwiftCore:memoryReader:task:]( objc_alloc(&OBJC_CLASS___VMUSwiftRuntimeInfo),  "initWithSwiftCore:memoryReader:task:",  a2,  a3,  *(void *)(*(void *)(a1 + 32) + 48LL),  *(void *)(*(void *)(a1 + 32) + 8LL));
  if (v8)
  {
    obuint64_t j = v8;
    BOOL v9 = -[VMUSwiftRuntimeInfo runtimeHasStableABI](v8, "runtimeHasStableABI");
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      if (*(void *)(v10 + 160))
      {
        uint64_t v8 = obj;
        if (*(_BYTE *)(v10 + 176))
        {
          NSLog( @"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Runtime with stable ABI has already been loaded, ignoring this other one.",  obj);
LABEL_14:
          uint64_t v8 = obj;
        }
      }

      else
      {
        objc_storeStrong((id *)(v10 + 160), obj);
        uint64_t v8 = obj;
        if (*(_BYTE *)(*(void *)(a1 + 32) + 176LL))
        {
          NSLog(@"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Runtime with stable ABI has been loaded", v12);
          goto LABEL_14;
        }
      }
    }

    else
    {
      objc_storeStrong((id *)(v10 + 168), obj);
      uint64_t v8 = obj;
      if (*(_BYTE *)(*(void *)(a1 + 32) + 176LL))
      {
        NSLog( @"SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Runtime pre-dating the stable ABI has been loaded",  v11);
        goto LABEL_14;
      }
    }
  }
}

- (void)_loadSwiftAsyncTaskAndSlabRecognitionInfo
{
  int v3 = getenv("DT_SKIP_PRECISE_SCANNING_SWIFT_ASYNC_ALLOCATIONS");
  if (!v3 || (uint64_t v4 = v3, strcmp(v3, "YES")) && strcmp(v4, "1"))
  {
    if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore")) {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    }
    else {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    }
    uint64_t v7 = SymbolOwner;
    uint64_t v8 = v6;
    if (CSIsNull())
    {
      BOOL v9 = "libswift_Concurrency";
      goto LABEL_20;
    }

    CSSymbolicatorCreateWithTask();
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    CSSymbolOwnerGetSymbolWithMangledName();
    if (CSIsNull())
    {
      CSRelease();
LABEL_18:
      BOOL v9 = "libswiftRemoteMirror version or it wasn't new enough";
      goto LABEL_20;
    }

    uint64_t Range = (_DWORD *)CSSymbolGetRange();
    CSRelease();
    if (!Range || *Range <= 2u) {
      goto LABEL_18;
    }
    _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"__swift_concurrency_debug_asyncTaskMetadata",  v7,  v8,  8uLL,  &v16);
    _copy_remote_mangled_symbol_value( self->_memoryReader,  (uint64_t)"__swift_concurrency_debug_asyncTaskSlabMetadata",  v7,  v8,  8uLL,  &v15);
    if (v16 && (unint64_t v11 = v15) != 0)
    {
      self->_swiftConcurrencyDebugAsyncTaskMetadataIsa = v16;
      self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa = v11;
      if (CSSymbolOwnerGetPath())
      {
        [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v12 = &stru_189E010C8;
      }

      +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"AsyncTask",  v12,  8LL);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setDisplayName:@"Task stack"];
      [v13 setDefaultScanType:1];
      [v13 setIsRootClass:1];
      -[VMUClassInfoMap addClassInfo:forAddress:]( self->_realizedIsaToClassInfo,  "addClassInfo:forAddress:",  v13,  self->_swiftConcurrencyDebugAsyncTaskMetadataIsa);
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"AsyncTask Slab",  v12,  8LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setDisplayName:@"Task stack"];
      [v14 setDefaultScanType:1];
      [v14 setIsRootClass:1];
      -[VMUClassInfoMap addClassInfo:forAddress:]( self->_realizedIsaToClassInfo,  "addClassInfo:forAddress:",  v14,  self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa);
    }

    else if (_debugSwiftAsyncPrintfIsEnabled())
    {
      BOOL v9 = "pseudo-isas for AsyncTasks and Slabs";
LABEL_20:
      _debugSwiftAsyncPrintf( 0,  "Won't attempt precise Swift Concurrency allocation scanning because couldn't find %s\n",  v9);
    }
  }

- (void)destroy_libSwiftRemoteMirror
{
  swiftMirror = (int **)self->_swiftMirror;
  if (swiftMirror)
  {
    if (*swiftMirror)
    {
      vmu_swift_reflection_destroyReflectionContext(*swiftMirror);
      swiftMirror = (int **)self->_swiftMirror;
    }

    free(swiftMirror);
    self->_swiftMirror = 0LL;
  }

  remoteAddressToLocalAddressAndSizeMap = self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap;
  if (remoteAddressToLocalAddressAndSizeMap) {
    NSResetMapTable(remoteAddressToLocalAddressAndSizeMap);
  }
  uint64_t v6 = 0LL;
  memset(v5, 0, sizeof(v5));
  __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)v5);
  __destructor_8_sb16_s24_s32_w56_w64((id *)v5);
}

- (BOOL)hasSwiftContent
{
  return self->_swiftRuntimeInfoStableABI || self->_swiftRuntimeInfoPreABI != 0LL;
}

- (BOOL)hasSwiftReflection
{
  return self->_swiftMirror->var0 != 0LL;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3
{
  return -[VMUObjectIdentifier initWithTask:symbolicator:](self, "initWithTask:symbolicator:", *(void *)&a3, 0LL, 0LL);
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_unsigned int objectContentLevel = a3;
}

- (VMURangeArray)readonlyRegionRanges
{
  return self->_readonlyRegionRanges;
}

- (void)setReadonlyRegionRanges:(id)a3
{
}

- (id)memoryReader
{
  return self->_memoryReader;
}

- (VMUClassInfoMap)realizedClasses
{
  return self->_realizedIsaToClassInfo;
}

- (VMUSwiftRuntimeInfo)swiftRuntimeInfoPreABI
{
  return self->_swiftRuntimeInfoPreABI;
}

- (VMUSwiftRuntimeInfo)swiftRuntimeInfoStableABI
{
  return self->_swiftRuntimeInfoStableABI;
}

- (libSwiftRemoteMirrorWrapper)swiftMirror
{
  return self->_swiftMirror;
}

- (unint64_t)taggedPointerMask
{
  return self->_taggedPointerMask;
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (_CSTypeRef)libobjcSymbolOwner
{
  unint64_t opaque_2 = self->_libobjcSymbolOwner._opaque_2;
  unint64_t opaque_1 = self->_libobjcSymbolOwner._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (unsigned)objcABI
{
  return self->_objcABI;
}

- (unint64_t)figBaseObjectFinalizeAddress
{
  return self->_figBaseObjectFinalizeAddress;
}

- (BOOL)taskIsDriverKit
{
  return self->_taskIsDriverKit;
}

- (VMUAutoreleasePoolPageLayout)autoreleasePoolPageLayout
{
  return self->_autoreleasePoolPageLayout;
}

- (VMUTaskMemoryScanner)scanner
{
  return (VMUTaskMemoryScanner *)objc_loadWeakRetained((id *)&self->_scanner);
}

- (NSMutableDictionary)moduleNameToBinaryPathDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368LL, 1);
}

- (unint64_t)swiftConcurrencyDebugAsyncTaskMetadataIsa
{
  return self->_swiftConcurrencyDebugAsyncTaskMetadataIsa;
}

- (unint64_t)swiftConcurrencyDebugAsyncTaskSlabMetadataIsa
{
  return self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa;
}

- (void).cxx_destruct
{
}

@end