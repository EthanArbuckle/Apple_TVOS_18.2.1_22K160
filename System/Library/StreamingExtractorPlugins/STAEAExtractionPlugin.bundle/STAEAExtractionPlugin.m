id sub_21B4(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  os_log_s *v21;
  id v22;
  void *v23;
  void *v24;
  CFStringRef v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  CFStringRef v42;
  v15 = a1;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%s:%d][%s] %@",  a7,  a8,  a6,  v16));
  v20 = sub_23DC();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v26 = &stru_8300;
    *(_DWORD *)buf = 136448002;
    v28 = "STCreateErrorWithInfo";
    v29 = 2080;
    if (v17) {
      v26 = v17;
    }
    v30 = a7;
    v31 = 1024;
    v32 = a8;
    v33 = 2080;
    v34 = a6;
    v35 = 2112;
    v36 = v15;
    v37 = 2048;
    v38 = a2;
    v39 = 2112;
    v40 = v16;
    v41 = 2112;
    v42 = v26;
    _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s: Error [%s:%d][%s]: %@ - %ld - %@ %@\n",  buf,  0x4Eu);
  }

  if (v18) {
    v22 = [v18 mutableCopy];
  }
  else {
    v22 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  }
  v23 = v22;
  [v22 setObject:v19 forKey:NSDebugDescriptionErrorKey];
  if (v17) {
    [v23 setObject:v17 forKey:NSUnderlyingErrorKey];
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a2,  v23));

  return v24;
}

id sub_23C8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_21B4(a1, a2, a3, a4, 0LL, a5, a6, a7);
}

void *sub_23DC()
{
  if (qword_CA90 != -1) {
    dispatch_once(&qword_CA90, &stru_8228);
  }
  return off_C9C0;
}

void sub_241C(id a1)
{
  v1 = STGetLoggingCategory();
  os_log_t v2 = os_log_create("com.apple.StreamingExtractor", v1);
  v3 = off_C9C0;
  off_C9C0 = v2;
}

void *sub_244C()
{
  if (qword_CA98 != -1) {
    dispatch_once(&qword_CA98, &stru_8248);
  }
  return off_C9C8;
}

void sub_248C(id a1)
{
  v1 = STGetLoggingCategory();
  os_log_t v2 = os_log_create("com.apple.StreamingExtractor.signposts", v1);
  v3 = off_C9C8;
  off_C9C8 = v2;
}

id STCreateAEAError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  uint64_t v8 = AAThreadErrorContextLeave(0LL);
  uint64_t v9 = (int)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"aaError: 0x%x - %@",  v8,  v7));

  id v11 = sub_23C8(@"AAError", v9, v10, 0LL, a2, a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

const char *STGetLoggingCategory()
{
  return "STAEAExtractorPlugin";
}

LABEL_22:
  return v12;
}
}

LABEL_17:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor signingPublicKey](self, "signingPublicKey"));
  if (v31)
  {
    if (!a3)
    {
      v62 = sub_23DC();
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_4D54();
      }

      v64 = STExtractorErrorDomain;
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Archive is not signed - signing key was provided and is required"));
      v36 = v64;
      v37 = v6;
      v38 = 234LL;
      goto LABEL_24;
    }

    FieldUInt = AEAContextGetFieldUInt(a3, 0);
    if (FieldUInt <= 5 && ((1 << FieldUInt) & 0x2A) != 0)
    {
      v33 = sub_23DC();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_4E8C();
      }

      v35 = STExtractorErrorDomain;
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Archive is not signed - signing key was provided"));
      v36 = v35;
      v37 = v6;
      v38 = 237LL;
LABEL_24:
      v39 = sub_23C8( v36,  6LL,  v37,  0LL,  (uint64_t)"-[STAEAExtractor aeaContextCallback:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      -[STAEAExtractor setError:](self, "setError:", v40);
LABEL_25:

      return -1;
    }

    v42 = objc_claimAutoreleasedReturnValue(-[STAEAExtractor signingPublicKey](self, "signingPublicKey"));
    v43 = (const uint8_t *)[v42 bytes];
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor signingPublicKey](self, "signingPublicKey"));
    v45 = AEAContextSetFieldBlob(a3, 7u, 1u, v43, (size_t)[v44 length]);

    if (v45 == -1)
    {
      v66 = sub_23DC();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_4DF0();
      }

      v68 = STExtractorErrorDomain;
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set signing key on extractor context"));
      v36 = v68;
      v37 = v6;
      v38 = 240LL;
      goto LABEL_24;
    }
  }

  return 0;
}

id STAEAProgressCallback(id result)
{
  if (result) {
    return objc_msgSend(result, "extractionProgress:");
  }
  return result;
}

id STAEAEntryMessageCallback(id result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result) {
    return [result processEntryMessage:a2 path:a3 data:a4];
  }
  return result;
}

LABEL_31:
    v46 = STCreateAEAError( v31,  (uint64_t)"-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v46);

    goto LABEL_15;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor sourceDirectorySandboxExtension](self, "sourceDirectorySandboxExtension"));

  if (v21
    && (v22 = objc_claimAutoreleasedReturnValue( -[STAEAExtractor sourceDirectorySandboxExtension]( self, "sourceDirectorySandboxExtension")), -[STAEAExtractor setSandboxToken:]( self, "setSandboxToken:", sandbox_extension_consume([v22 UTF8String])), v22, -[STAEAExtractor sandboxToken](self, "sandboxToken") == -1))
  {
    v52 = sub_23DC();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_5678();
    }

    v54 = STExtractorErrorDomain;
    v55 = __error();
    v56 = strerror(*v55);
    v57 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't acquire sandbox extension: %s (%d)",  v56,  *__error());
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    v59 = sub_23C8( v54,  10LL,  v58,  0LL,  (uint64_t)"-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  338LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v59);

    AAThreadErrorContextLeave(0LL);
  }

  else
  {
    extractor = self->_extractor;
    v24 = objc_claimAutoreleasedReturnValue(-[STAEAExtractor sourceDirectory](self, "sourceDirectory"));
    v25 = AAAssetExtractorSetParameterPtr(extractor, 105, [v24 UTF8String]);

    if (!(_DWORD)v25) {
      goto LABEL_10;
    }
    v47 = sub_23DC();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_55DC();
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor sourceDirectory](self, "sourceDirectory"));
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't set input directory %@, returned %d",  v49,  v25));
    v51 = STCreateAEAError( v50,  (uint64_t)"-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  342LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v51);
  }

LABEL_15:
  v8[2](v8, *p_offset, v30);
}

uint64_t sub_3988(void *a1, uint64_t a2)
{
  if (a1) {
    return (uint64_t)[a1 aeaContextCallback:a2];
  }
  os_log_t v2 = sub_23DC();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_5714();
  }

  return 0xFFFFFFFFLL;
}

void sub_3D2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3D6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_3D7C(uint64_t a1)
{
}

void sub_3D84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9 = sub_23DC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = *(void *)(v11 + 32);
    unint64_t v13 = *(void *)(v11 + 16);
    *(_DWORD *)buf = 138413058;
    uint64_t v31 = v12;
    __int16 v32 = 2082;
    v33 = "-[STAEAExtractor supplyBytes:withCompletionBlock:]_block_invoke";
    __int16 v34 = 2048;
    uint64_t v35 = a4;
    __int16 v36 = 2048;
    unint64_t v37 = v13;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Extracting %zu bytes, offset %lld", buf, 0x2Au);
  }

  if (!*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
  {
    unint64_t v14 = 0LL;
    v15 = (id *)(a1 + 4);
    while (1)
    {
      if (v14 >= a1[7]) {
        goto LABEL_20;
      }
      uint64_t v16 = AAAssetExtractorWrite(*((void *)*v15 + 1), a2 + v14, a4 - v14);
      uint64_t v17 = v16;
      if (v16 < 0) {
        break;
      }
      if (!v16)
      {
        v28 = sub_23DC();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_595C();
        }

        [*v15 setIsComplete:1];
LABEL_19:
        *a5 = 1;
        goto LABEL_20;
      }

      v14 += v16;
      v18 = sub_23DC();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *((void *)*v15 + 4);
        *(_DWORD *)buf = 138413314;
        uint64_t v31 = v20;
        __int16 v32 = 2082;
        v33 = "-[STAEAExtractor supplyBytes:withCompletionBlock:]_block_invoke";
        __int16 v34 = 2048;
        uint64_t v35 = v17;
        __int16 v36 = 2048;
        unint64_t v37 = v14;
        __int16 v38 = 2048;
        uint64_t v39 = a4;
        _os_log_debug_impl( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "[%@] %{public}s: AAAssetExtractorWrite wrote %ld bytes which brings it to %zu out of %zu",  buf,  0x34u);
      }

      if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL)) {
        goto LABEL_20;
      }
    }

    v21 = sub_23DC();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_58E8();
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AAAssetExtractorWrite returned %ld",  v17));
    id v24 = STCreateAEAError( v23,  (uint64_t)"-[STAEAExtractor supplyBytes:withCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  393LL);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = *(void *)(a1[5] + 8LL);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
    goto LABEL_19;
  }

  unint64_t v14 = 0LL;
LABEL_20:
  *(void *)(a1[4] + 16LL) += v14;
}

void sub_48FC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_4948(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_495C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

void sub_49A0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_49AC()
{
}

void sub_4A48()
{
}

void sub_4AE4()
{
}

void sub_4B80()
{
}

void sub_4C1C()
{
}

void sub_4CB8()
{
}

void sub_4D54()
{
}

void sub_4DF0()
{
}

void sub_4E8C()
{
}

void sub_4F28()
{
}

void sub_4FC4()
{
}

void sub_5060()
{
}

void sub_50FC()
{
}

void sub_5198()
{
}

void sub_5234()
{
}

void sub_52D0()
{
}

void sub_536C()
{
}

void sub_5408()
{
}

void sub_54A4()
{
}

void sub_5540()
{
}

void sub_55DC()
{
}

void sub_5678()
{
}

void sub_5714()
{
}

void sub_57B0()
{
}

void sub_584C()
{
}

void sub_58E8()
{
  sub_4948(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractorWrite returned %ld");
  sub_4970();
}

void sub_595C()
{
}

void sub_59D0()
{
  uint64_t v2 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "[%@] %{public}s: No extractor to suspend", v1, 0x16u);
}

void sub_5A4C()
{
}

void sub_5AE8()
{
  sub_495C(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractorDestroy returned %d ");
  sub_4970();
}

void sub_5B54()
{
  sub_495C(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractorDestroy returned %d");
  sub_4970();
}

void sub_5BC0()
{
}

id objc_msgSend_symmetricDecryptionKey(void *a1, const char *a2, ...)
{
  return [a1 symmetricDecryptionKey];
}