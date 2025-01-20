@interface VMUSwiftRuntimeInfo
- (BOOL)nativeWeakReferencePointerIsSideTable;
- (BOOL)runtimeHasStableABI;
- (VMUMutableClassInfo)sideTableLayoutWithScannableOwnerPointer;
- (VMUMutableClassInfo)sideTableLayoutWithUnscannableOwnerPointer;
- (VMUMutableClassInfo)unownedExtraDataLayout;
- (VMUSwiftRuntimeInfo)initWithSwiftCore:(_CSTypeRef)a3 memoryReader:(id)a4 task:(id)a5;
- (unint64_t)nativeWeakReferenceMarkerMask;
- (unint64_t)nativeWeakReferenceMarkerValue;
- (unint64_t)nativeWeakReferencePointerMask;
- (unint64_t)refcountIsSideTableMarkerMask;
- (unint64_t)refcountIsSideTableMarkerValue;
- (unint64_t)sideTablePointerMask;
- (unsigned)sideTablePointerLeftShift;
- (unsigned)sideTablePointerRightShift;
@end

@implementation VMUSwiftRuntimeInfo

- (VMUSwiftRuntimeInfo)initWithSwiftCore:(_CSTypeRef)a3 memoryReader:(id)a4 task:(id)a5
{
  unint64_t opaque_2 = a3._opaque_2;
  unint64_t opaque_1 = a3._opaque_1;
  v58[1] = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___VMUSwiftRuntimeInfo;
  v11 = -[VMUSwiftRuntimeInfo init](&v55, sel_init);
  if (!v11) {
    goto LABEL_12;
  }
  int v12 = [v10 isExclave];
  id v13 = v9;
  int v14 = CSIsNull();
  char v15 = v14;
  if (((v12 | v14) & 1) != 0)
  {

    if ((v15 & 1) != 0) {
      goto LABEL_12;
    }
  }

  else
  {
    CSSymbolOwnerGetSymbolWithMangledName();
    if ((CSIsNull() & 1) != 0
      || (uint64_t Range = CSSymbolGetRange(),
          (v17 = (_WORD *)(*((uint64_t (**)(id, uint64_t, uint64_t))v13 + 2))(v13, Range, 2LL)) == 0LL)
      || !*v17)
    {

LABEL_12:
      v18 = 0LL;
      goto LABEL_13;
    }
  }

  if (!_copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_nativeWeakReferenceMarkerMask",  opaque_1,  opaque_2,  8uLL,  v11 + 8))
  {
    v54[0] = 0LL;
    v54[1] = v54;
    v54[2] = 0x3010000000LL;
    v54[5] = 0LL;
    v54[3] = &unk_1861837AD;
    v54[4] = 0LL;
    CSSymbolOwnerForeachSection();
    if (CSIsNull())
    {
      v20 = (FILE *)*MEMORY[0x1895F89D0];
      CSSymbolOwnerGetPath();
      fprintf(v20, "NO __DATA_DIRTY,__objc_imageinfo section in %s\n");
LABEL_16:
      _Block_object_dispose(v54, 8);
      goto LABEL_12;
    }

    if ([v10 isExclave])
    {
      unsigned int v21 = 7;
    }

    else
    {
      uint64_t v22 = CSRegionGetRange();
      if (v22)
      {
        uint64_t v23 = (*((uint64_t (**)(id, uint64_t, uint64_t))v13 + 2))(v13, v22, 8LL);
        if (!v23)
        {
          v53 = (FILE *)*MEMORY[0x1895F89D0];
          CSSymbolOwnerGetPath();
          fprintf(v53, "Unable to read __DATA __objc_imageinfo from %s\n");
          goto LABEL_16;
        }

        unsigned int v21 = *(unsigned __int8 *)(v23 + 5);
      }

      else
      {
        unsigned int v21 = 0;
      }
    }

    int v24 = [v10 isExclaveCore];
    unint64_t v25 = 0x8000000000000001LL;
    if (v24) {
      unint64_t v25 = 0LL;
    }
    *((void *)v11 + 1) = v25;
    *((void *)v11 + 2) = v24 ^ 1u;
    int v26 = [v10 isExclaveCore];
    uint64_t v27 = -8LL;
    if (v26) {
      uint64_t v27 = -1LL;
    }
    *((void *)v11 + 3) = v27;
    if (v21 <= 4)
    {
      char v28 = 0;
      v11[32] = 0;
      *(_OWORD *)(v11 + 40) = xmmword_18616BD10;
      *((void *)v11 + 7) = 0LL;
      v11[64] = 0;
      uint64_t v34 = 65LL;
    }

    else
    {
      char v28 = 1;
      v11[32] = 1;
      __asm { FMOV            V0.2D, #-2.0 }

      *(_OWORD *)(v11 + 40) = _Q0;
      *((void *)v11 + 7) = 0x3FFFFFFFFFFFFFFFLL;
      *((_WORD *)v11 + 32) = 768;
      if (v21 < 7)
      {
LABEL_32:
        _Block_object_dispose(v54, 8);
        goto LABEL_33;
      }

      uint64_t v34 = 96LL;
    }

    v11[v34] = v28;
    goto LABEL_32;
  }

  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_nativeWeakReferenceMarkerValue",  opaque_1,  opaque_2,  8uLL,  v11 + 16);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_nativeWeakReferencePointerMask",  opaque_1,  opaque_2,  8uLL,  v11 + 24);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_nativeWeakReferencePointerIsSideTable",  opaque_1,  opaque_2,  1uLL,  v11 + 32);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_refcountIsSideTableMarkerMask",  opaque_1,  opaque_2,  8uLL,  v11 + 40);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_refcountIsSideTableMarkerValue",  opaque_1,  opaque_2,  8uLL,  v11 + 48);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_sideTablePointerMask",  opaque_1,  opaque_2,  8uLL,  v11 + 56);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_sideTablePointerRightShift",  opaque_1,  opaque_2,  1uLL,  v11 + 64);
  _copy_remote_mangled_symbol_value( v13,  (uint64_t)"_swift_debug_sideTablePointerLeftShift",  opaque_1,  opaque_2,  1uLL,  v11 + 65);
  v11[96] = 1;
LABEL_33:
  uint64_t Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    [MEMORY[0x189607A28] stringWithUTF8String:Path];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    VMUSanitizePath(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"Swift weak reference storage",  v37,  16LL);
    [v38 setDefaultScanType:4];
    v39 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"_owner",  @"^@",  4LL,  0LL,  8LL);
    uint64_t v40 = [v38 mutableCopy];
    v41 = (void *)*((void *)v11 + 9);
    *((void *)v11 + 9) = v40;

    v42 = (void *)*((void *)v11 + 9);
    v58[0] = v39;
    [MEMORY[0x189603F18] arrayWithObjects:v58 count:1];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 addFields:v43];

    id v44 = -[VMUFieldInfo mutableCopy](v39, "mutableCopy");
    [v44 setScanType:0];
    uint64_t v45 = [v38 mutableCopy];
    v46 = (void *)*((void *)v11 + 10);
    *((void *)v11 + 10) = v45;

    v47 = (void *)*((void *)v11 + 10);
    id v57 = v44;
    [MEMORY[0x189603F18] arrayWithObjects:&v57 count:1];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 addFields:v48];

    uint64_t v49 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  @"Swift unowned reference storage",  v37,  16LL);
    v50 = (void *)*((void *)v11 + 11);
    *((void *)v11 + 11) = v49;

    [*((id *)v11 + 11) setDefaultScanType:4];
    v51 = (void *)*((void *)v11 + 11);
    v56 = v39;
    [MEMORY[0x189603F18] arrayWithObjects:&v56 count:1];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 addFields:v52];
  }

  v18 = v11;
LABEL_13:

  return v18;
}

char *__59__VMUSwiftRuntimeInfo_initWithSwiftCore_memoryReader_task___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  Name = (const char *)CSRegionGetName();
  result = strstr(Name, " __objc_imageinfo");
  if (result)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(void *)(v8 + 32) = a2;
    *(void *)(v8 + 40) = a3;
  }

  return result;
}

- (unint64_t)nativeWeakReferenceMarkerMask
{
  return self->_nativeWeakReferenceMarkerMask;
}

- (unint64_t)nativeWeakReferenceMarkerValue
{
  return self->_nativeWeakReferenceMarkerValue;
}

- (unint64_t)nativeWeakReferencePointerMask
{
  return self->_nativeWeakReferencePointerMask;
}

- (BOOL)nativeWeakReferencePointerIsSideTable
{
  return self->_nativeWeakReferencePointerIsSideTable;
}

- (unint64_t)refcountIsSideTableMarkerMask
{
  return self->_refcountIsSideTableMarkerMask;
}

- (unint64_t)refcountIsSideTableMarkerValue
{
  return self->_refcountIsSideTableMarkerValue;
}

- (unint64_t)sideTablePointerMask
{
  return self->_sideTablePointerMask;
}

- (unsigned)sideTablePointerRightShift
{
  return self->_sideTablePointerRightShift;
}

- (unsigned)sideTablePointerLeftShift
{
  return self->_sideTablePointerLeftShift;
}

- (VMUMutableClassInfo)sideTableLayoutWithScannableOwnerPointer
{
  return self->_sideTableLayoutWithScannableOwnerPointer;
}

- (VMUMutableClassInfo)sideTableLayoutWithUnscannableOwnerPointer
{
  return self->_sideTableLayoutWithUnscannableOwnerPointer;
}

- (VMUMutableClassInfo)unownedExtraDataLayout
{
  return self->_unownedExtraDataLayout;
}

- (BOOL)runtimeHasStableABI
{
  return self->_runtimeHasStableABI;
}

- (void).cxx_destruct
{
}

@end