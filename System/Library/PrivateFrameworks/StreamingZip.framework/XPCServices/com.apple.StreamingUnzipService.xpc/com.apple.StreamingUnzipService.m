LABEL_20:
  v14 = sub_100019E30();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v4 setExportedInterface:v15];

  v16 = -[StreamingUnzipper initForClient:connection:]( objc_alloc(&OBJC_CLASS___StreamingUnzipper),  "initForClient:connection:",  v9,  v4);
  [v4 setExportedObject:v16];
  v17 = sub_100019A00();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v4 setRemoteObjectInterface:v18];

  [v16 setXpcConnection:v4];
  [v4 setInterruptionHandler:&stru_1000286E8];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000046C0;
  v21[3] = &unk_100028C10;
  v22 = v16;
  v19 = v16;
  [v4 setInvalidationHandler:v21];
  [v4 resume];

  return 1;
}

void *sub_100004680()
{
  if (qword_10002F340 != -1) {
    dispatch_once(&qword_10002F340, &stru_1000286A8);
  }
  return off_10002EE98;
}

id sub_1000046C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

void sub_1000046D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.streamingzip", "unzip_service");
  v2 = off_10002EE98;
  off_10002EE98 = v1;
}

void *sub_100004700()
{
  if (qword_10002F348 != -1) {
    dispatch_once(&qword_10002F348, &stru_1000286C8);
  }
  return off_10002EEA0;
}

void sub_100004740(id a1)
{
  os_log_t v1 = os_log_create("com.apple.streamingzip.signposts", "unzip_service");
  v2 = off_10002EEA0;
  off_10002EEA0 = v1;
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", envp));
  unsigned int v4 = [v3 BOOLForKey:@"EnableDebugLogging"];

  if (v4)
  {
    v5 = sub_100004680();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Debug logging is enabled",  (uint8_t *)&v15,  2u);
    }
  }

  v7 = sub_100004680();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    v16 = "Nov 10 2024";
    __int16 v17 = 2080;
    v18 = "01:25:02";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Streaming unzip service built at %s %s started",  (uint8_t *)&v15,  0x16u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v10);
  dispatch_source_set_event_handler(v11, &stru_100028708);
  dispatch_activate(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  v13 = objc_opt_new(&OBJC_CLASS___StreamingUnzipServiceDelegate);
  [v12 setDelegate:v13];
  [v12 resume];

  return 0;
}

void sub_100004944(id a1)
{
  os_log_t v1 = sub_100004680();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Got SIGTERM; Exiting when clean", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

uint64_t sub_1000049B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 212) = 0;
  *(_OWORD *)(result + 196) = 0u;
  *(_OWORD *)(result + 180) = 0u;
  *(_OWORD *)(result + 164) = 0u;
  *(_OWORD *)(result + 148) = 0u;
  *(_OWORD *)(result + 132) = 0u;
  *(_OWORD *)(result + 116) = 0u;
  *(_OWORD *)(result + 100) = 0u;
  *(_OWORD *)(result + 84) = 0u;
  *(_OWORD *)(result + 68) = 0u;
  *(_OWORD *)(result + 52) = 0u;
  *(_OWORD *)(result + 36) = 0u;
  *(_OWORD *)(result + 20) = 0u;
  *(_OWORD *)(result + 4) = 0u;
  *(_DWORD *)result = a2;
  switch(a2)
  {
    case 0:
      result = CC_MD5_Init((CC_MD5_CTX *)(result + 8));
      break;
    case 1:
      result = CC_SHA1_Init((CC_SHA1_CTX *)(result + 8));
      break;
    case 4:
      result = CC_SHA224_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 5:
      result = CC_SHA256_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 6:
      result = CC_SHA384_Init((CC_SHA512_CTX *)(result + 8));
      break;
    case 7:
      result = CC_SHA512_Init((CC_SHA512_CTX *)(result + 8));
      break;
    default:
      return result;
  }

  return result;
}

unsigned __int8 *sub_100004A48(unsigned __int8 *result, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      result = (unsigned __int8 *)CC_MD5_Final(result, (CC_MD5_CTX *)(a2 + 8));
      break;
    case 1:
      result = (unsigned __int8 *)CC_SHA1_Final(result, (CC_SHA1_CTX *)(a2 + 8));
      break;
    case 4:
      result = (unsigned __int8 *)CC_SHA224_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 5:
      result = (unsigned __int8 *)CC_SHA256_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 6:
      result = (unsigned __int8 *)CC_SHA384_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    case 7:
      result = (unsigned __int8 *)CC_SHA512_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    default:
      return result;
  }

  return result;
}

uint64_t sub_100004AA0(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  unint64_t v3 = *(unsigned __int16 *)(a1 + 28);
  if (*(_WORD *)(a1 + 28))
  {
    uint64_t v4 = 0LL;
    int v5 = 0;
    uint64_t v6 = a1 + *(unsigned __int16 *)(a1 + 26) + 30;
    do
    {
      uint64_t v7 = v4 + 4;
      if (v4 + 4 > v3) {
        break;
      }
      uint64_t result = v6 + v4;
      int v9 = *(unsigned __int16 *)(v6 + v4);
      uint64_t v10 = *(unsigned __int16 *)(v6 + v4 + 2);
      if (v9 == *a2)
      {
        return 0LL;
      }

      v5 += v10 + 4;
      uint64_t v4 = (unsigned __int16)v5;
    }

    while (v3 > (unsigned __int16)v5);
  }

  return 0LL;
}

uint64_t sub_100004B14(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 18) == -1 || (unsigned int v2 = *(_DWORD *)(a1 + 22), v2 == -1))
  {
    uint64_t v3 = sub_100004AA0(a1, &word_10001DB40, 0x10u);
    if (v3 && *(_WORD *)(v3 + 2) == 16) {
      return *(void *)(v3 + 4);
    }
    return *(unsigned int *)(a1 + 22);
  }

  return v2;
}

time_t sub_100004B7C(unsigned int a1)
{
  time_t v6 = time(0LL);
  uint64_t v3 = (tm *)qword_10002F350;
  if (!qword_10002F350)
  {
    uint64_t v3 = localtime_r(&v6, &stru_10002F358);
    qword_10002F350 = (uint64_t)v3;
  }

  v3->tm_isdst = -1;
  v2.i32[0] = a1;
  int8x16_t v4 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_10001DBE0);
  v4.i32[0] = vshlq_u32(v2, (uint32x4_t)xmmword_10001DBD0).u32[0];
  *(int8x16_t *)&v3->tm_sec = vandq_s8(v4, (int8x16_t)xmmword_10001DBF0);
  v3->tm_mon = ((a1 >> 21) & 0xF) - 1;
  v3->tm_year = (a1 >> 25) + 80;
  return mktime(v3);
}

LABEL_15:
    v23 = [v6 privileged];
    v21 = v23 ^ -[SZExtractor privileged](self, "privileged") ^ 1;
    goto LABEL_16;
  }

  LOBYTE(v21) = 0;
LABEL_17:

  return v21;
}

LABEL_7:
  v16 = (NSString *)[v6 copy];
  extractionPath = self->_extractionPath;
  self->_extractionPath = v16;

  v18 = (NSDictionary *)[v7 copy];
  options = self->_options;
  self->_options = v18;

  v20 = sub_100004680();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = self;
    v35 = 2112;
    v36 = v6;
    v37 = 2112;
    v38 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: initialized with path: %@ options: %@",  buf,  0x20u);
  }
}

void sub_100005880(_Unwind_Exception *a1)
{
}

LABEL_13:
}
}

void sub_1000066A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

LABEL_17:
    goto LABEL_18;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = self;
    __int16 v17 = 2048;
    v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Setting extractor delegate to 0x%p",  (uint8_t *)&v15,  0x16u);
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  v11 = objc_opt_respondsToSelector(v4, "setExtractionProgress:");
  if ((objc_opt_respondsToSelector(v4, "extractionCompleteAtArchivePath:") & 1) != 0) {
    LODWORD(v12) = v11 & 1 | 2;
  }
  else {
    LODWORD(v12) = v11 & 1;
  }
  if ((objc_opt_respondsToSelector(v4, "extractionEnteredPassThroughMode") & 1) != 0) {
    v12 = v12 | 4;
  }
  else {
    v12 = v12;
  }
  v13 = objc_claimAutoreleasedReturnValue(-[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate"));
  v14 = (void *)v13;
  if (v13) {
    objc_storeWeak((id *)(v13 + 8), v4);
  }

  -[SZExtractor setActiveExtractorDelegateMethods:](self, "setActiveExtractorDelegateMethods:", v12);
LABEL_18:
}

    a3 = v40;
  }

  else
  {
    v32 = *__error();
    v33 = sub_100004680();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = [v7 fileSystemRepresentation];
      v49 = 2080;
      v50 = strerror(v32);
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Call to realpath failed for suspicious path %s: %s",  buf,  0x16u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v32,  0LL));
    v54 = NSFilePathErrorKey;
    v55 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    v35 = [v7 fileSystemRepresentation];
    strerror(v32);
    v37 = sub_100007A7C( (uint64_t)"_CheckRealpathHasBasePrefix",  430LL,  @"SZExtractorErrorDomain",  5LL,  v10,  v11,  @"Call to realpath failed for suspicious path %s: %s",  v36,  (uint64_t)v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v24 = 0LL;
  }

  if (a3 && (v24 & 1) == 0) {
    *a3 = v23;
  }

  return v24;
}

void sub_100007974(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
  [v2 setActiveDelegateMethods:*(unsigned int *)(a1 + 40)];
}

void sub_1000079B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100004680();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%@: Failed to set delegate methods enabled: %@",  (uint8_t *)&v7,  0x16u);
  }
}

id sub_100007A7C( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    v19 = (NSMutableDictionary *)[v17 mutableCopy];
  }
  else {
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v20 = v19;
  if (v18)
  {
    v21 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v18,  &a9);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v21,  NSLocalizedDescriptionKey);
  }

  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, NSUnderlyingErrorKey);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v22,  @"SZExtractorFunctionNameErrorKey");

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v23,  @"SZExtractorSourceFileLineErrorKey");

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a4,  v20));
  return v24;
}

void sub_100007C08(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100004680();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: calling completion block with error %@",  (uint8_t *)&v7,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100007CE4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
  [v2 terminateStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t sub_100007D24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007D30(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100004680();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: calling completion block with error %@",  (uint8_t *)&v7,  0x16u);
  }

  if (v3) {
    [*(id *)(a1 + 32) setError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100007E1C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
  [v2 finishStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t sub_100007E5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007E68(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_100004680();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: calling completion block with offset %llu, error %@",  (uint8_t *)&v9,  0x20u);
  }

  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100007F68(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
  [v2 suspendStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t sub_100007FA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007FBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100004700();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v3) {
      int v7 = 78;
    }
    else {
      int v7 = 89;
    }
    int v8 = 134218240;
    uint64_t v9 = v6;
    __int16 v10 = 1024;
    int v11 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES",  "Supply bytes with length %lu succeeded: %c",  (uint8_t *)&v8,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000080B8(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = sub_100004680();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@: calling completion block with error %@",  (uint8_t *)&v12,  0x16u);
    }

    [*(id *)(a1 + 32) setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) _invalidateObject];
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      if (a3) {
        int v11 = 89;
      }
      else {
        int v11 = 78;
      }
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 1024;
      LODWORD(v15) = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%@: calling completion block with no error, dataComplete=%c",  (uint8_t *)&v12,  0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100008230(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
  [v2 supplyBytes:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48)];
}

uint64_t sub_100008270(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008280(uint64_t a1)
{
}

void sub_100008288(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v11 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  pthread_mutex_lock(&stru_10002F148);
  qword_10002F188 += a4;
  pthread_cond_broadcast(&stru_10002F190);
  pthread_mutex_unlock(&stru_10002F148);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000832C(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) length];
  if ((unint64_t)(v2 - 5242881) >= 0xFFFFFFFFFFB00000LL)
  {
    unint64_t v3 = (unint64_t)v2;
    pthread_mutex_lock(&stru_10002F148);
    if (qword_10002F188 >= v3) {
      qword_10002F188 -= v3;
    }
    else {
      unint64_t v3 = 0LL;
    }
    pthread_mutex_unlock(&stru_10002F148);
  }

  else
  {
    unint64_t v3 = 0LL;
  }

  if ((id)v3 == [*(id *)(a1 + 32) length])
  {
    int8x16_t v4 = sub_100004680();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Supplying entire byte range data of length %lu",  buf,  0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v6 = sub_100004700();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Sending buffer of size %lu to the unzip service over XPC",  buf,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) unzipServiceConnection]);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_100008D78;
    v71[3] = &unk_100028910;
    v72 = (os_log_s *)*(id *)(a1 + 56);
    unint64_t v73 = v3;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxyWithErrorHandler:v71]);
    uint64_t v10 = *(void *)(a1 + 32);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_100008E40;
    v68[3] = &unk_100028870;
    id v69 = *(id *)(a1 + 56);
    unint64_t v70 = v3;
    [v9 supplyBytes:v10 withReply:v68];

    id v11 = v72;
    goto LABEL_62;
  }

  int v12 = sub_100004700();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    id v14 = [*(id *)(a1 + 32) length];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v14;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FRAGMENT_DATA",  "Starting fragmentation of the supplied buffer of length : %lu",  buf,  0xCu);
  }

  if ([*(id *)(a1 + 32) length])
  {
    unint64_t v15 = 0LL;
    unint64_t v51 = 0LL;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v64 = 0LL;
      v65 = &v64;
      uint64_t v66 = 0x2020000000LL;
      uint64_t v67 = 0LL;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v22 = v16 - v15 + v51;
      if (v22)
      {
        pthread_mutex_lock(&stru_10002F148);
        unint64_t v23 = qword_10002F188;
        if (!((unint64_t)qword_10002F188 >> 17))
        {
          do
          {
            pthread_cond_wait(&stru_10002F190, &stru_10002F148);
            unint64_t v23 = qword_10002F188;
          }

          while ((unint64_t)qword_10002F188 < 0x20000);
        }

        if (v23 < v22) {
          unint64_t v22 = v23;
        }
        qword_10002F188 = v23 - v22;
        pthread_mutex_unlock(&stru_10002F148);
        v24 = (unint64_t *)(v65 + 3);
      }

      else
      {
        v24 = (unint64_t *)&v67;
      }

      unint64_t *v24 = v22;
      v25 = sub_100004680();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v45 = v65[3];
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2048;
        v81 = (const char *)v16;
        LOWORD(v82) = 2048;
        *(void *)((char *)&v82 + 2) = v51;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}",  buf,  0x2Au);
      }

LABEL_49:
      v31 = sub_100004680();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v44 = v65[3];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v15;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Supplying byte range data of length %lu at location %lu",  buf,  0x16u);
      }

      v33 = objc_autoreleasePoolPush();
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", v15, v65[3]));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v35 = sub_100004700();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_signpost_enabled(v36))
      {
        id v37 = [v34 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v37;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Sending buffer of size %lu to the unzip service over XPC",  buf,  0xCu);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) unzipServiceConnection]);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_100009148;
      v59[3] = &unk_100028960;
      id v61 = *(id *)(a1 + 56);
      v62 = &v64;
      id v39 = v34;
      id v60 = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue([v38 remoteObjectProxyWithErrorHandler:v59]);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_10000921C;
      v55[3] = &unk_100028988;
      id v57 = *(id *)(a1 + 56);
      v58 = &v64;
      id v41 = v39;
      id v56 = v41;
      [v40 supplyBytes:v41 withReply:v55];

      objc_autoreleasePoolPop(v33);
      v15 += v65[3];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_58;
      }
      if (v15 >= v51 + v16)
      {
        v42 = sub_100004680();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v51;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "Active partial range {%lu, %lu} exhausted",  buf,  0x16u);
        }

        unint64_t v51 = 0LL;
LABEL_58:
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      }

      _Block_object_dispose(&v64, 8);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000LL;
    v81 = "";
    __int128 v82 = xmmword_10001DC00;
    id v17 = *(void **)(a1 + 32);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_100008F2C;
    v63[3] = &unk_100028938;
    v63[5] = buf;
    v63[6] = v15;
    v63[4] = &v64;
    [v17 enumerateByteRangesUsingBlock:v63];
    if (!v65[3])
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 32LL);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn( "-[SZExtractor supplyBytes:withCompletionBlock:]_block_invoke_2",  "SZExtractor.m",  822,  "NSNotFound != lastByteRange.location");
      }
      unint64_t v18 = *(void *)(*(void *)&buf[8] + 40LL);
      if (v18 > 0x500000)
      {
        pthread_mutex_lock(&stru_10002F148);
        unint64_t v27 = qword_10002F188;
        if (!((unint64_t)qword_10002F188 >> 17))
        {
          do
          {
            pthread_cond_wait(&stru_10002F190, &stru_10002F148);
            unint64_t v27 = qword_10002F188;
          }

          while ((unint64_t)qword_10002F188 < 0x20000);
        }

        if (v27 >= v18) {
          unint64_t v28 = v18;
        }
        else {
          unint64_t v28 = v27;
        }
        qword_10002F188 = v27 - v28;
        pthread_mutex_unlock(&stru_10002F148);
        v65[3] = v28;
        v29 = sub_100004680();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v47 = v65[3];
          *(_DWORD *)v74 = 134218496;
          uint64_t v75 = v47;
          __int16 v76 = 2048;
          uint64_t v77 = v16;
          __int16 v78 = 2048;
          unint64_t v79 = v18;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "Reserved %ld bytes for too-big partial range {%lu, %lu}",  v74,  0x20u);
        }

        unint64_t v51 = v18;
        goto LABEL_48;
      }

      v19 = sub_100004680();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v46 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v74 = 134217984;
        uint64_t v75 = v46;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Waiting for %lu bytes to become available",  v74,  0xCu);
      }

      unint64_t v21 = *(void *)(*(void *)&buf[8] + 40LL);
      if (v21)
      {
        pthread_mutex_lock(&stru_10002F148);
        while (qword_10002F188 < v21)
          pthread_cond_wait(&stru_10002F190, &stru_10002F148);
        qword_10002F188 -= v21;
        pthread_mutex_unlock(&stru_10002F148);
      }

      v65[3] = v21;
    }

    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
    _Block_object_dispose(buf, 8);
    goto LABEL_49;
  }

LABEL_60:
  v48 = sub_100004700();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FRAGMENT_DATA",  "Ending fragmentation of the supplied buffer",  buf,  2u);
  }

LABEL_62:
  v49 = *(dispatch_group_s **)(a1 + 40);
  v50 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) serialQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009324;
  block[3] = &unk_1000289B0;
  id v53 = *(id *)(a1 + 64);
  __int128 v54 = *(_OWORD *)(a1 + 72);
  dispatch_group_notify(v49, v50, block);
}

  unint64_t v51 = v51;
  v72 = 0;
  v71 = v51;
LABEL_63:

  int v12 = v71;
  if ((v72 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
  v4[2](v4, v12);
}

      sub_1000049B0((uint64_t)__errnum, v81);
      *((void *)v9 + 5) = 0LL;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + _Block_object_dispose((const void *)(v30 - 176), 8) = 0u;
      __int128 v82 = v7;
      if (stat((const char *)[v82 fileSystemRepresentation], &v310))
      {
        v83 = *__error();
        v84 = sub_100004680();
        v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          v140 = strerror(v83);
          *(_DWORD *)buf = 138412546;
          *(void *)v320 = v82;
          *(_WORD *)&v320[8] = 2080;
          *(void *)v321 = v140;
          _os_log_error_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_ERROR,  "Failed to stat path %@: %s",  buf,  0x16u);
        }

        v328 = NSFilePathErrorKey;
        v329 = v82;
        v86 = (void *)objc_claimAutoreleasedReturnValue([v16[29] dictionaryWithObjects:&v329 forKeys:&v328 count:1]);
        strerror(v83);
        v88 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  938LL,  NSPOSIXErrorDomain,  v83,  0LL,  v86,  @"Failed to stat path %@: %s",  v87,  (uint64_t)v82);
LABEL_66:
        v49 = (id)objc_claimAutoreleasedReturnValue(v88);

LABEL_67:
LABEL_68:
        v71 = 0LL;
LABEL_69:
        unint64_t v70 = v282;
        goto LABEL_70;
      }

      v89 = v310.st_mode & 0xF000;
      if (v89 != 0x4000 && v89 != 0x8000)
      {
        v109 = sub_100004680();
        v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v320 = v82;
          *(_WORD *)&v320[8] = 1024;
          *(_DWORD *)v321 = v310.st_mode;
          _os_log_error_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_ERROR,  "Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)",  buf,  0x12u);
        }

        v326 = NSFilePathErrorKey;
        v327 = v82;
        v111 = (void *)objc_claimAutoreleasedReturnValue([v16[29] dictionaryWithObjects:&v327 forKeys:&v326 count:1]);
        v113 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  944LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  v111,  @"Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)",  v112,  (uint64_t)v82);
        v49 = (id)objc_claimAutoreleasedReturnValue(v113);

        goto LABEL_67;
      }

      v309 = -1;
      v308 = -1;
      if ([v9 resolveOwnershipWithExtraField:0 outUID:&v309 outGID:&v308])
      {
        v90 = v82;
        v91 = (const char *)[v90 fileSystemRepresentation];
        if (lchown(v91, v309, v308))
        {
          v279 = v82;
          v92 = *__error();
          v93 = sub_100004680();
          v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            v95 = [v90 fileSystemRepresentation];
            v273 = v309;
            v276 = v308;
            v96 = strerror(v92);
            *(_DWORD *)buf = 136316162;
            *(void *)v320 = v95;
            *(_WORD *)&v320[8] = 1024;
            *(_DWORD *)v321 = v273;
            *(_WORD *)&v321[4] = 1024;
            *(_DWORD *)&v321[6] = v276;
            LOWORD(v322) = 1024;
            *(_DWORD *)((char *)&v322 + 2) = v92;
            HIWORD(v322) = 2080;
            v323[0] = v96;
            _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "Failed to lchown %s to (%d:%d) : %d (%s)",  buf,  0x28u);
          }

          __int128 v82 = v279;
        }
      }

      if ((v310.st_mode & 0xF000) == 0x4000)
      {
        __n = 0LL;
        v280 = v82;
        v97 = objc_claimAutoreleasedReturnValue([v82 stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"]);
        v298 = 0LL;
        v98 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v97,  2LL,  &v298));
        v99 = v298;
        v274 = v99;
        v277 = (id)v98;
        v272 = (void *)v97;
        if (v98)
        {
          v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          v295 = 0LL;
          v101 = [v100 removeItemAtPath:v97 error:&v295];
          v271 = v295;

          if ((v101 & 1) == 0)
          {
            v102 = sub_100004680();
            v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v320 = v272;
              *(_WORD *)&v320[8] = 2112;
              *(void *)v321 = v271;
              _os_log_error_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_ERROR,  "Failed to remove %@: %@",  buf,  0x16u);
            }
          }

          v294 = v286;
          v71 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v277,  &v294);
          v49 = v294;

          -[NSKeyedUnarchiver setDecodingFailurePolicy:](v71, "setDecodingFailurePolicy:", 0LL);
          if (!v71)
          {
            v141 = sub_100004680();
            v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v320 = v49;
              _os_log_error_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_ERROR,  "Failed to deserialize resumption data (%@); resuming from offset 0",
                buf,
                0xCu);
            }

            v292 = v49;
            sub_100018718(v280, &v292);
            v143 = v292;
            v71 = 0LL;
            goto LABEL_193;
          }

          v104 = -[NSKeyedUnarchiver decodeIntForKey:](v71, "decodeIntForKey:", @"SerializationVersion");
          if (v104 == 8)
          {
            v105 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"CurrentOffset");
            v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
            v287 = (unint64_t)[v106 unsignedLongLongValue];

            if (![*((id *)v9 + 12) count]) {
              goto LABEL_160;
            }
            v107 = *((void *)v9 + 7);
            if (v107) {
              v108 = v287 / v107;
            }
            else {
              v108 = 0LL;
            }
            if (v108 < (unint64_t)[*((id *)v9 + 12) count])
            {
              v163 = v71;
              v164 = -[NSKeyedUnarchiver decodeBytesForKey:returnedLength:]( v163,  "decodeBytesForKey:returnedLength:",  @"HashContext",  &__n);
              if (v164 && __n)
              {
                if (__n != qword_10001DB48[*__errnum])
                {
                  v228 = sub_100004680();
                  v229 = (os_log_s *)objc_claimAutoreleasedReturnValue(v228);
                  if (os_log_type_enabled(v229, OS_LOG_TYPE_ERROR))
                  {
                    v264 = *__errnum;
                    v265 = off_100028B28[v264];
                    v266 = (const char *)qword_10001DB48[v264];
                    *(_DWORD *)buf = 136315650;
                    *(void *)v320 = v265;
                    *(_WORD *)&v320[8] = 2048;
                    *(void *)v321 = __n;
                    *(_WORD *)&v321[8] = 2048;
                    v322 = v266;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v229,  OS_LOG_TYPE_ERROR,  "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                      buf,
                      0x20u);
                  }

                  v290 = v49;
                  sub_100018718(v280, &v290);
                  v152 = v49;
                  v49 = v290;
                  v71 = v163;
                  goto LABEL_194;
                }

                memcpy(v9 + 136, v164, __n);
                v165 = *((void *)v9 + 7);
                v166 = v287;
                if (v165) {
                  v166 = v287 % v165;
                }
                *((void *)v9 + _Block_object_dispose((const void *)(v30 - 176), 8) = v166;
              }

void sub_100008D28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

void sub_100008D78(uint64_t a1)
{
  id v2 = sub_100004700();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_signpost_enabled(v3))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_100008E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004700();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (a2) {
      int v7 = 78;
    }
    else {
      int v7 = 89;
    }
    v8[0] = 67109376;
    v8[1] = v7;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)v8,  0x12u);
  }
}

void sub_100008F2C(void *a1, uint64_t a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  if (a3 + a4 <= a1[6])
  {
    uint64_t v10 = sub_100004680();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134218240;
      unint64_t v18 = a3;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Already processed {%lu, %lu}",  (uint8_t *)&v17,  0x16u);
    }
  }

  else
  {
    if (a4 - 5242881 >= 0xFFFFFFFFFFB00000LL)
    {
      pthread_mutex_lock(&stru_10002F148);
      if (qword_10002F188 >= a4)
      {
        qword_10002F188 -= a4;
        unint64_t v9 = a4;
      }

      else
      {
        unint64_t v9 = 0LL;
      }

      pthread_mutex_unlock(&stru_10002F148);
    }

    else
    {
      unint64_t v9 = 0LL;
    }

    int v12 = sub_100004680();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v14)
      {
        unint64_t v16 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
        int v17 = 134218240;
        unint64_t v18 = a4;
        __int16 v19 = 2048;
        unint64_t v20 = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Reserved %ld bytes; adding to existing length %ld",
          (uint8_t *)&v17,
          0x16u);
      }

      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) += a4;
    }

    else
    {
      if (v14)
      {
        int v17 = 134218240;
        unint64_t v18 = a3;
        __int16 v19 = 2048;
        unint64_t v20 = a4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Failed to reserve last range; falling out with last range {%lu, %lu}",
          (uint8_t *)&v17,
          0x16u);
      }

      uint64_t v15 = *(void *)(a1[5] + 8LL);
      *(void *)(v15 + 32) = a3;
      *(void *)(v15 + 40) = a4;
      *a5 = 1;
    }
  }

void sub_100009148(uint64_t a1)
{
  id v2 = sub_100004700();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_signpost_enabled(v3))
  {
    id v4 = [*(id *)(a1 + 32) length];
    int v5 = 134217984;
    id v6 = v4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_10000921C(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v4 = sub_100004700();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    if (v3) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    id v7 = [*(id *)(a1 + 32) length];
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 2048;
    id v10 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)v8,  0x12u);
  }
}

uint64_t sub_100009324(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16LL))( a1[4],  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL));
}

void sub_100009348(uint64_t a1)
{
  id v2 = -[StreamingUnzipper initForClient:connection:]( objc_alloc(&OBJC_CLASS___StreamingUnzipper),  "initForClient:connection:",  @"In-process unzipper",  0LL);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 4_Block_object_dispose((const void *)(v30 - 176), 8) = v2;

  int v5 = objc_alloc_init(&OBJC_CLASS___SZExtractorInternalDelegate);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) != 0) {
    goto LABEL_4;
  }
  NSFileAttributeKey v39 = NSFilePosixPermissions;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 16877LL));
  v40 = v11;
  int v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
  id v34 = 0LL;
  unsigned int v15 = [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v12 error:&v34];
  dispatch_queue_t v16 = (dispatch_queue_t)v34;

  if (v15)
  {

LABEL_4:
    int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000096E8;
    v33[3] = &unk_100028820;
    v33[4] = *(void *)(a1 + 32);
    [v17 setupUnzipperWithOutputPath:v18 sandboxExtensionToken:0 options:v19 withReply:v33];

    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalExtractorDelegate]);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
    [v21 setInProcessExtractorDelegate:v20];

    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_proces_delegate", v12);
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessUnzipper]);
    [v23 setInProcessDelegateQueue:v16];
    goto LABEL_8;
  }

  v24 = sub_100004680();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
    *(_DWORD *)buf = 138412546;
    v36 = v32;
    __int16 v37 = 2112;
    dispatch_queue_t v38 = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to create extraction directory at path %@: %@",  buf,  0x16u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
  id v28 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForLocalExtraction:]_block_invoke",  594LL,  @"SZExtractorErrorDomain",  1LL,  v16,  0LL,  @"Failed to create extraction directory at path %@: %@",  v27,  (uint64_t)v26);
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v28);

  [*(id *)(a1 + 32) setError:v23];
LABEL_8:

  uint64_t v29 = *(void *)(a1 + 40);
  id v30 = [*(id *)(a1 + 32) lastResumptionOffset];
  v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  (*(void (**)(uint64_t, id, void *))(v29 + 16))(v29, v30, v31);
}

id sub_1000096E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setLastResumptionOffset:a3];
}

void sub_10000A374( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

os_unfair_lock_s *sub_10000B024(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(dispatch_group_s **)&a1[24]._os_unfair_lock_opaque;
    if (v2) {
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v3 = v1 + 28;
    os_unfair_lock_lock(v1 + 28);
    uint64_t v1 = *(os_unfair_lock_s **)&v1[26]._os_unfair_lock_opaque;
    if (v1) {
      id v4 = v1;
    }
    os_unfair_lock_unlock(v3);
  }

  return v1;
}

void sub_10000B078(uint64_t a1)
{
  if (a1)
  {
    [*(id *)(a1 + 64) setStreamState:8];
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) unzipPath]);
    if (v2)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v8 = 0LL;
      unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v8];
      id v5 = v8;

      if ((v4 & 1) == 0)
      {
        uint64_t v6 = sub_100004680();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v10 = v2;
          __int16 v11 = 2112;
          id v12 = v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to remove unzip path at %@ : %@",  buf,  0x16u);
        }
      }
    }
  }

uint64_t sub_10000B198(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 1LL;
  }
  if ((*(_WORD *)(*(void *)(a2 + 96) + 4LL) & 0xF000) != 0xA000) {
    return 1LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  *(void *)(a2 + 48),  0LL,  0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  LODWORD(a3) = sub_10000B240(v6, v7, a3);

  uint64_t result = 0LL;
  if ((_DWORD)a3) {
    return 1LL;
  }
  return result;
}

uint64_t sub_10000B240(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  bzero(__s, 0x400uLL);
  id v7 = v5;
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], __s) || *__error() == 2)
  {
    v40 = a3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = [v8 stringWithFileSystemRepresentation:__s length:strlen(__s)];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pathComponents]);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 pathComponents]);
    id v13 = [v12 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = 0LL;
      uint64_t v16 = *(void *)v42;
      NSFileAttributeKey v39 = v10;
      while (2)
      {
        id v17 = v7;
        id v18 = v6;
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v12);
          }
          unint64_t v20 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          if ((char *)i + v15 < [v11 count])
          {
            unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:(char *)i + v15]);
            unsigned __int8 v22 = [v20 isEqualToString:v21];

            if ((v22 & 1) != 0) {
              continue;
            }
          }

          v25 = sub_100004680();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          id v6 = v18;
          id v7 = v17;
          uint64_t v10 = v39;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v38 = [v7 fileSystemRepresentation];
            *(_DWORD *)buf = 136315650;
            id v48 = v38;
            __int16 v49 = 2112;
            v50 = (char *)v39;
            __int16 v51 = 2112;
            id v52 = v6;
            _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Rejecting %s because its resolved path %@ points outside or to the unzip dir %@",  buf,  0x20u);
          }

          NSErrorUserInfoKey v45 = NSFilePathErrorKey;
          id v46 = v7;
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
          id v28 = [v7 fileSystemRepresentation];
          id v30 = sub_100007A7C( (uint64_t)"_CheckRealpathHasBasePrefix",  442LL,  @"SZExtractorErrorDomain",  5LL,  0LL,  v27,  @"Rejecting %s because its resolved path %@ points outside or to the unzip dir %@",  v29,  (uint64_t)v28);
          unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v30);

          uint64_t v24 = 0LL;
          goto LABEL_17;
        }

        v15 += (uint64_t)i;
        id v14 = [v12 countByEnumeratingWithState:&v41 objects:v53 count:16];
        unint64_t v23 = 0LL;
        uint64_t v24 = 1LL;
        id v6 = v18;
        id v7 = v17;
        uint64_t v10 = v39;
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
      unint64_t v23 = 0LL;
      uint64_t v24 = 1LL;
    }

uint64_t sub_10000B6B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B6C4(uint64_t a1)
{
}

void sub_10000B6CC(uint64_t a1, const Bytef *a2, uint64_t a3, size_t a4, _BYTE *a5)
{
  uint64_t v10 = sub_100004680();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Got block of length %lu at offset %lu",  buf,  0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000B810;
  v14[3] = &unk_100028C38;
  __int128 v15 = *(_OWORD *)(a1 + 40);
  sub_10000B85C(v12, a2, a4, v14);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    || *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    *a5 = 1;
  }

void sub_10000B810(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
}

void sub_10000B85C(uint64_t a1, const Bytef *a2, size_t a3, void *a4)
{
  id v7 = a4;
  if (!a1) {
    goto LABEL_525;
  }
  v627 = a2;
  size_t v626 = a3;
  id v9 = (id *)(a1 + 64);
  id v8 = *(void **)(a1 + 64);
  if (!v8)
  {
    v330 = sub_100004680();
    v331 = (os_log_s *)objc_claimAutoreleasedReturnValue(v330);
    if (os_log_type_enabled(v331, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v668.st_dev) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v331,  OS_LOG_TYPE_ERROR,  "Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  (uint8_t *)&v668,  2u);
    }

    id v333 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  470LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.",  v332,  v563);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v333);
    v581 = 0LL;
LABEL_383:
    uint64_t v14 = 0LL;
    if (v10) {
      goto LABEL_519;
    }
    goto LABEL_524;
  }

  v581 = (void *)objc_claimAutoreleasedReturnValue([v8 unzipPath]);
  id v10 = 0LL;
  NSErrorUserInfoKey v579 = NSFilePathErrorKey;
  NSErrorDomain v574 = NSPOSIXErrorDomain;
  *(void *)&__int128 v11 = 138412546LL;
  __int128 v572 = v11;
  *(void *)&__int128 v11 = 136315138LL;
  __int128 v568 = v11;
  *(void *)&__int128 v11 = 136315394LL;
  __int128 v570 = v11;
  *(void *)&__int128 v11 = 136316162LL;
  __int128 v567 = v11;
  *(void *)&__int128 v11 = 138412290LL;
  __int128 v573 = v11;
  *(void *)&__int128 v11 = 138413058LL;
  __int128 v571 = v11;
  *(void *)&__int128 v11 = 134217984LL;
  __int128 v575 = v11;
  *(void *)&__int128 v11 = 67109632LL;
  __int128 v569 = v11;
  *(void *)&__int128 v11 = 136315650LL;
  __int128 v566 = v11;
  uint64_t v583 = a1;
  v584 = (id *)(a1 + 64);
  while (2)
  {
    unint64_t v12 = v626;
    if (!v626) {
      goto LABEL_383;
    }
    uint64_t v13 = objc_autoreleasePoolPush();
    uint64_t v14 = 0LL;
    switch([*v9 streamState])
    {
      case 0u:
        if (![*v9 currentLFRecord]) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  485,  "_currentState.currentLFRecord");
        }
        id v15 = sub_1000104FC((uint64_t)[*v9 currentLFRecord], 4, *v9, (const void **)&v627, &v626);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v15);

        if (v16) {
          goto LABEL_469;
        }
        if ((unint64_t)[*v9 thisStageBytesComplete] >= 5) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  493,  "_currentState.thisStageBytesComplete <= peekSignatureSize");
        }
        id v17 = [*v9 thisStageBytesComplete];
        id v18 = *v9;
        if (v17 != (id)4)
        {
          [v18 markResumptionPoint];
          goto LABEL_54;
        }

        int v19 = *(_DWORD *)[v18 currentLFRecord];
        id v20 = *v9;
        if (v19 == 67324752)
        {
          [v20 setStreamState:1];
LABEL_54:
          id v10 = 0LL;
          goto LABEL_55;
        }

        v413 = (void *)objc_claimAutoreleasedReturnValue([v20 unsureData]);

        if (v413)
        {
          v414 = sub_100004680();
          v415 = (os_log_s *)objc_claimAutoreleasedReturnValue(v414);
          if (os_log_type_enabled(v415, OS_LOG_TYPE_DEFAULT))
          {
            int v416 = *(unsigned __int8 *)[*v9 currentLFRecord];
            int v417 = *((unsigned __int8 *)[*v9 currentLFRecord] + 1);
            uid_t v418 = *((unsigned __int8 *)[*v9 currentLFRecord] + 2);
            gid_t v419 = *((unsigned __int8 *)[*v9 currentLFRecord] + 3);
            v668.st_dev = 67109888;
            *(_DWORD *)&v668.st_mode = v416;
            a1 = v583;
            LOWORD(v668.st_ino) = 1024;
            *(_DWORD *)((char *)&v668.st_ino + 2) = v417;
            HIWORD(v668.st_ino) = 1024;
            v668.st_uid = v418;
            LOWORD(v668.st_gid) = 1024;
            *(gid_t *)((char *)&v668.st_gid + 2) = v419;
            _os_log_impl( (void *)&_mh_execute_header,  v415,  OS_LOG_TYPE_DEFAULT,  "Got unexpected local file signature %c%c%c%c ; entering passthrough mode",
              (uint8_t *)&v668,
              0x1Au);
          }

          v385 = v627;
          uint64_t v387 = v626;
          uint64_t v386 = a1;
LABEL_439:
          id v420 = sub_1000105F8(v386, (uint64_t)v385, v387);
          id v10 = (id)objc_claimAutoreleasedReturnValue(v420);
          goto LABEL_481;
        }

        if (*(_DWORD *)[*v9 currentLFRecord] != 33639248)
        {
          v471 = sub_100004680();
          v472 = (os_log_s *)objc_claimAutoreleasedReturnValue(v471);
          if (os_log_type_enabled(v472, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v668.st_dev) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v472,  OS_LOG_TYPE_ERROR,  "Encountered unexpectedly non-stream-compliant data in stream!",  (uint8_t *)&v668,  2u);
          }

          v681 = @"SZExtractorFileOffsetErrorKey";
          v473 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
          v682 = v473;
          v474 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v682,  &v681,  1LL));
          id v476 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  552LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v474,  @"Encountered unexpectedly non-stream-compliant data in stream!",  v475,  v563);
          id v10 = (id)objc_claimAutoreleasedReturnValue(v476);

          goto LABEL_481;
        }

        if ([*v9 bytesHashedInChunk])
        {
          v513 = (void *)objc_claimAutoreleasedReturnValue([*v9 lastChunkPartialHash]);

          if (!v513)
          {
            v529 = sub_100004680();
            v517 = (os_log_s *)objc_claimAutoreleasedReturnValue(v529);
            if (os_log_type_enabled(v517, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v668.st_dev) = 0;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v517,  OS_LOG_TYPE_DEBUG,  "No last chunk partial hash; will need full chunk to validate.",
                (uint8_t *)&v668,
                2u);
            }

            v515 = 0LL;
            goto LABEL_531;
          }

          uint64_t v514 = objc_claimAutoreleasedReturnValue([*v9 checkLastChunkPartialHash]);
          if (v514)
          {
            v515 = (void *)v514;
            v516 = sub_100004680();
            v517 = (os_log_s *)objc_claimAutoreleasedReturnValue(v516);
            if (os_log_type_enabled(v517, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v668.st_dev) = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v517,  OS_LOG_TYPE_ERROR,  "Last chunk's partial hash did not validate (store hashed chunk size mismatch?); consuming more data to c"
                "heck full chunk.",
                (uint8_t *)&v668,
                2u);
            }

LABEL_531:
            v352 = v13;
            v530 = sub_100004680();
            v531 = (os_log_s *)objc_claimAutoreleasedReturnValue(v530);
            if (os_log_type_enabled(v531, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v668.st_dev) = 0;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v531,  OS_LOG_TYPE_DEBUG,  "Finished central directory signature; updating hash with remainder of stream data",
                (uint8_t *)&v668,
                2u);
            }

            size_t v532 = v626;
            v533 = v584;
            if ([*v584 hashedChunkSize])
            {
              v534 = [*v533 hashedChunkSize];
              v535 = [*v533 bytesHashedInChunk];
              if (v534 - v535 >= v532) {
                size_t v536 = v532;
              }
              else {
                size_t v536 = v534 - v535;
              }
            }

            else
            {
              size_t v536 = v532;
            }

            id v537 = *v533;
            id v538 = [*v533 currentOffset];
            id v10 = (id)objc_claimAutoreleasedReturnValue( [v537 updateHashFromOffset:v538 withBytes:v627 length:v536 onlyFinishCurrentChunk:1]);

            objc_msgSend(*v533, "setCurrentOffset:", (char *)objc_msgSend(*v533, "currentOffset") + v536);
            if (v10)
            {
              uint64_t v14 = 0LL;
              id v9 = v584;
            }

            else
            {
              if ([*v584 bytesHashedInChunk])
              {
                if (v536 != v532) {
                  __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  543,  "lengthToRead == length");
                }
                v539 = sub_100004680();
                v540 = (os_log_s *)objc_claimAutoreleasedReturnValue(v539);
                if (os_log_type_enabled(v540, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v668.st_dev) = 0;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v540,  OS_LOG_TYPE_DEBUG,  "After hitting Central Directory, we need more data to finish the chunk",  (uint8_t *)&v668,  2u);
                }

                id v9 = v584;
                [*v584 setStreamState:6];
                id v10 = 0LL;
                uint64_t v14 = 0LL;
              }

              else
              {
                v552 = sub_100004680();
                v553 = (os_log_s *)objc_claimAutoreleasedReturnValue(v552);
                if (os_log_type_enabled(v553, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v668.st_dev) = 0;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v553,  OS_LOG_TYPE_DEBUG,  "After hitting Central Directory, we had enough data already to finish the chunk",  (uint8_t *)&v668,  2u);
                }

                id v9 = v584;
                [*v584 setStreamState:7];
                id v10 = 0LL;
                uint64_t v14 = 1LL;
              }

              a1 = v583;
            }

            goto LABEL_403;
          }
        }

        else
        {
          v519 = sub_100004680();
          v520 = (os_log_s *)objc_claimAutoreleasedReturnValue(v519);
          if (os_log_type_enabled(v520, OS_LOG_TYPE_DEBUG))
          {
            id v555 = [*v9 currentOffset];
            v668.st_dev = v575;
            *(void *)&v668.st_mode = v555;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v520,  OS_LOG_TYPE_DEBUG,  "Finished central directory signature at offset %llu and we are also at a chunk boundary.",  (uint8_t *)&v668,  0xCu);
          }
        }

LABEL_516:
        [*v9 setStreamState:7];
        id v10 = 0LL;
LABEL_517:
        uint64_t v14 = 1LL;
        goto LABEL_518;
      case 1u:
        if (![*v9 currentLFRecord]) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  567,  "_currentState.currentLFRecord");
        }
        id v21 = sub_1000104FC((uint64_t)[*v9 currentLFRecord], 30, *v9, (const void **)&v627, &v626);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v21);

        if (v16) {
          goto LABEL_469;
        }
        id v10 = 0LL;
LABEL_16:
        if ([*v9 thisStageBytesComplete] != (id)30) {
          goto LABEL_21;
        }
        objc_msgSend( *v9,  "setCurrentLFRequiresDataDescriptor:",  (*((unsigned __int16 *)objc_msgSend(*v9, "currentLFRecord") + 3) >> 3) & 1);
        int v22 = *((unsigned __int16 *)[*v9 currentLFRecord] + 13);
        id v23 = *v9;
        if (!v22)
        {
          v403 = (void *)objc_claimAutoreleasedReturnValue([v23 unsureData]);

          v404 = sub_100004680();
          v405 = (os_log_s *)objc_claimAutoreleasedReturnValue(v404);
          v406 = v405;
          if (!v403)
          {
            if (os_log_type_enabled(v405, OS_LOG_TYPE_ERROR))
            {
              id v541 = [*v9 currentOffset];
              v668.st_dev = v575;
              *(void *)&v668.st_mode = v541;
              _os_log_error_impl( (void *)&_mh_execute_header,  v406,  OS_LOG_TYPE_ERROR,  "Encountered zero-length filename for local file record at offset %llu",  (uint8_t *)&v668,  0xCu);
            }

            v679 = @"SZExtractorFileOffsetErrorKey";
            v467 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
            v680 = v467;
            v468 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v680,  &v679,  1LL));
            id v560 = [*v9 currentOffset];
            id v470 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  589LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v468,  @"Encountered zero-length filename for local file record at offset %llu",  v469,  (uint64_t)v560);
            goto LABEL_510;
          }

          if (os_log_type_enabled(v405, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v668.st_dev) = 0;
            v407 = "Got zero-length filename; entering passthrough mode";
            v408 = v406;
            uint32_t v409 = 2;
LABEL_433:
            _os_log_impl((void *)&_mh_execute_header, v408, OS_LOG_TYPE_DEFAULT, v407, (uint8_t *)&v668, v409);
          }

LABEL_434:
          v410 = v627;
          uint64_t v411 = v626;
          uint64_t v412 = a1;
LABEL_447:
          id v430 = sub_1000105F8(v412, (uint64_t)v410, v411);
          uint64_t v425 = objc_claimAutoreleasedReturnValue(v430);
LABEL_448:
          id v16 = (id)v425;
LABEL_468:

LABEL_469:
          uint64_t v14 = 0LL;
LABEL_470:
          id v10 = v16;
          goto LABEL_518;
        }

        uint64_t v24 = *((unsigned __int16 *)[v23 currentLFRecord] + 4);
        if ((v24 > 0xE || ((1 << v24) & 0x4101) == 0) && (_DWORD)v24 != 99)
        {
          v502 = (void *)objc_claimAutoreleasedReturnValue([*v9 unsureData]);

          v503 = sub_100004680();
          v504 = (os_log_s *)objc_claimAutoreleasedReturnValue(v503);
          v406 = v504;
          if (!v502)
          {
            if (os_log_type_enabled(v504, OS_LOG_TYPE_ERROR))
            {
              id v554 = [*v9 currentOffset];
              v668.st_dev = 67109376;
              *(_DWORD *)&v668.st_mode = v24;
              LOWORD(v668.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&v668.st_ino + 2) = (__darwin_ino64_t)v554;
              _os_log_error_impl( (void *)&_mh_execute_header,  v406,  OS_LOG_TYPE_ERROR,  "Encountered unsupported compression method %hu in stream at offset %llu",  (uint8_t *)&v668,  0x12u);
            }

            v677 = @"SZExtractorFileOffsetErrorKey";
            v467 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
            v678 = v467;
            v468 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v678,  &v677,  1LL));
            [*v9 currentOffset];
            id v470 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  601LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v468,  @"Encountered unsupported compression method %hu in stream at offset %llu",  v518,  v24);
            goto LABEL_510;
          }

          if (os_log_type_enabled(v504, OS_LOG_TYPE_DEFAULT))
          {
            v668.st_dev = 67109120;
            *(_DWORD *)&v668.st_mode = v24;
            v407 = "Got unexpected compression method: %hu; entering passthrough mode";
            v408 = v406;
            uint32_t v409 = 8;
            goto LABEL_433;
          }

          goto LABEL_434;
        }

LABEL_21:
        uint64_t v25 = v626;
        id v26 = *v9;
        if (!v626)
        {
LABEL_408:
          [v26 markResumptionPoint];
LABEL_481:
          uint64_t v14 = 0LL;
          goto LABEL_518;
        }

        if ((unint64_t)[v26 thisStageBytesComplete] <= 0x1D) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  617,  "_currentState.thisStageBytesComplete >= sizeof(LocalFileRecord)");
        }
        uint64_t v27 = (unsigned __int16 *)[*v9 currentLFRecord];
        id v28 = (id)(v27[13] + (unint64_t)v27[14] + 30);
        if (v28 > [*v9 currentLFRecordAllocationSize])
        {
          objc_msgSend(*v9, "setCurrentLFRecord:", reallocf(objc_msgSend(*v9, "currentLFRecord"), (size_t)v28));
          if (![*v9 currentLFRecord])
          {
            v421 = sub_100004680();
            v422 = (os_log_s *)objc_claimAutoreleasedReturnValue(v421);
            if (os_log_type_enabled(v422, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v668.st_dev) = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v422,  OS_LOG_TYPE_ERROR,  "Could not allocate memory for local file record",  (uint8_t *)&v668,  2u);
            }

            id v424 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  624LL,  v574,  12LL,  0LL,  0LL,  @"Could not allocate memory for local file record",  v423,  v563);
            uint64_t v425 = objc_claimAutoreleasedReturnValue(v424);
            goto LABEL_448;
          }

          [*v9 setCurrentLFRecordAllocationSize:v28];
        }

        if ([*v9 thisStageBytesComplete] < v28)
        {
          id v29 = sub_1000104FC( (uint64_t)[*v9 currentLFRecord],  (uint64_t)v28,  *v9,  (const void **)&v627,  &v626);
          id v16 = (id)objc_claimAutoreleasedReturnValue(v29);

          if (v16) {
            goto LABEL_469;
          }
          uint64_t v25 = v626;
          if (!v626)
          {
LABEL_415:
            id v51 = *v9;
LABEL_416:
            [v51 markResumptionPoint];
            id v10 = 0LL;
            goto LABEL_481;
          }

          id v10 = 0LL;
        }

        if ([*v9 thisStageBytesComplete] != v28) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  643,  "_currentState.thisStageBytesComplete == fullLFRSize");
        }
        unsigned __int8 v30 = [*v9 currentLFRequiresDataDescriptor];
        v580 = v13;
        if ((v30 & 1) == 0)
        {
          uint64_t v31 = sub_100010C1C(*v9);
          uint64_t v32 = sub_100010D08(*v9);
          id v33 = *v9;
          if (v32 || !v31)
          {
            if (!*((_WORD *)[v33 currentLFRecord] + 4) && v31 != v32)
            {
              v431 = (void *)objc_claimAutoreleasedReturnValue([*v9 unsureData]);

              v432 = sub_100004680();
              v433 = (os_log_s *)objc_claimAutoreleasedReturnValue(v432);
              v434 = v433;
              if (v431)
              {
                if (os_log_type_enabled(v433, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v668.st_dev) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v434,  OS_LOG_TYPE_DEFAULT,  "Stored file has compressed size != uncompressed size; entering passthrough mode",
                    (uint8_t *)&v668,
                    2u);
                }

                id v435 = sub_1000105F8(a1, (uint64_t)v627, v25);
                uint64_t v436 = objc_claimAutoreleasedReturnValue(v435);
              }

              else
              {
                if (os_log_type_enabled(v433, OS_LOG_TYPE_ERROR))
                {
                  id v543 = [*v9 currentOffset];
                  v668.st_dev = 134218496;
                  *(void *)&v668.st_mode = v543;
                  WORD2(v668.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = v31;
                  HIWORD(v668.st_gid) = 2048;
                  *(void *)&v668.st_rdev = v32;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v434,  OS_LOG_TYPE_ERROR,  "Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)",  (uint8_t *)&v668,  0x20u);
                }

                v673 = @"SZExtractorFileOffsetErrorKey";
                v478 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
                v674 = v478;
                v479 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v674,  &v673,  1LL));
                id v480 = [*v9 currentOffset];
                id v482 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  671LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v479,  @"Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)",  v481,  (uint64_t)v480);
                uint64_t v436 = objc_claimAutoreleasedReturnValue(v482);
              }

              uint64_t v14 = 0LL;
              id v10 = (id)v436;
              goto LABEL_394;
            }

            goto LABEL_36;
          }

          v426 = (void *)objc_claimAutoreleasedReturnValue([v33 unsureData]);

          v427 = sub_100004680();
          v428 = (os_log_s *)objc_claimAutoreleasedReturnValue(v427);
          v429 = v428;
          if (v426)
          {
            if (os_log_type_enabled(v428, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v668.st_dev) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v429,  OS_LOG_TYPE_DEFAULT,  "File has 0-length compressed size but non-zero uncompressed size; entering passthrough mode",
                (uint8_t *)&v668,
                2u);
            }

            v410 = v627;
            uint64_t v412 = a1;
            uint64_t v411 = v25;
            goto LABEL_447;
          }

          if (os_log_type_enabled(v428, OS_LOG_TYPE_ERROR))
          {
            id v542 = [*v9 currentOffset];
            v668.st_dev = v575;
            *(void *)&v668.st_mode = v542;
            _os_log_error_impl( (void *)&_mh_execute_header,  v429,  OS_LOG_TYPE_ERROR,  "Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zer o uncompressed size",  (uint8_t *)&v668,  0xCu);
          }

          v675 = @"SZExtractorFileOffsetErrorKey";
          v467 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
          v676 = v467;
          v468 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v676,  &v675,  1LL));
          id v561 = [*v9 currentOffset];
          id v470 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  658LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v468,  @"Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size",  v477,  (uint64_t)v561);
LABEL_510:
          uint64_t v50 = objc_claimAutoreleasedReturnValue(v470);

LABEL_511:
          uint64_t v14 = 0LL;
          id v10 = (id)v50;
          goto LABEL_518;
        }

LABEL_36:
        id v585 = v10;
        id v34 = sub_100010E30([*v9 currentLFRecord]);
        id v10 = objc_claimAutoreleasedReturnValue(v34);
        id v35 = (const char *)[v10 fileSystemRepresentation];
        id v36 = *v9;
        if (!v10 || !v35)
        {
          v388 = (void *)objc_claimAutoreleasedReturnValue([v36 unsureData]);

          v389 = sub_100004680();
          v390 = (os_log_s *)objc_claimAutoreleasedReturnValue(v389);
          v391 = v390;
          if (v388)
          {
            BOOL v392 = os_log_type_enabled(v390, OS_LOG_TYPE_DEFAULT);
            uint64_t v13 = v580;
            if (v392)
            {
              LOWORD(v668.st_dev) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v391,  OS_LOG_TYPE_DEFAULT,  "Failed to get filename for file; entering passthrough mode",
                (uint8_t *)&v668,
                2u);
            }

            id v393 = sub_1000105F8(a1, (uint64_t)v627, v25);
            id v16 = (id)objc_claimAutoreleasedReturnValue(v393);
          }

          else
          {
            BOOL v458 = os_log_type_enabled(v390, OS_LOG_TYPE_ERROR);
            uint64_t v13 = v580;
            if (v458)
            {
              id v528 = [*v9 currentOffset];
              v668.st_dev = v575;
              *(void *)&v668.st_mode = v528;
              _os_log_error_impl( (void *)&_mh_execute_header,  v391,  OS_LOG_TYPE_ERROR,  "Failed to get filename for file at offset %llu.",  (uint8_t *)&v668,  0xCu);
            }

            v671 = @"SZExtractorFileOffsetErrorKey";
            v459 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
            v672 = v459;
            v460 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v672,  &v671,  1LL));
            id v461 = [*v9 currentOffset];
            id v463 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  686LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v460,  @"Failed to get filename for file at offset %llu.",  v462,  (uint64_t)v461);
            id v16 = (id)objc_claimAutoreleasedReturnValue(v463);
          }

LABEL_467:
          goto LABEL_468;
        }

        id v37 = (unsigned __int8 *)[v36 currentLFRecord];
        int v38 = v37[*((unsigned __int16 *)v37 + 13) + 29];
        [*v9 setPerformingExtraction:1];
        int v39 = *((unsigned __int16 *)[*v9 currentLFRecord] + 4);
        unsigned int v40 = [*v9 currentLFRequiresDataDescriptor];
        __int128 v41 = sub_100004700();
        __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        BOOL v43 = os_signpost_enabled(v42);
        if (v40)
        {
          if (v43)
          {
            v668.st_dev = v572;
            *(void *)&v668.st_mode = v10;
            WORD2(v668.st_ino) = 1024;
            *(_DWORD *)((char *)&v668.st_ino + 6) = v39;
            __int128 v44 = v42;
            NSErrorUserInfoKey v45 = "Processing file %@ (csize: ??; usize: ??; cmethod: %hu)";
            uint32_t v46 = 18;
LABEL_58:
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  v45,  (uint8_t *)&v668,  v46);
          }
        }

        else if (v43)
        {
          uint64_t v62 = sub_100010D08(*v9);
          uint64_t v63 = sub_100010C1C(*v9);
          v668.st_dev = v571;
          *(void *)&v668.st_mode = v10;
          WORD2(v668.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = v62;
          HIWORD(v668.st_gid) = 2048;
          *(void *)&v668.st_rdev = v63;
          LOWORD(v668.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&v668.st_atimespec.tv_sec + 2) = v39;
          __int128 v44 = v42;
          NSErrorUserInfoKey v45 = "Processing file %@ (csize: %llu; usize: %llu; cmethod: %hu)";
          uint32_t v46 = 38;
          goto LABEL_58;
        }

        if (v38 == 47
          && ([*v9 currentLFRequiresDataDescriptor] & 1) == 0
          && sub_100010D08(*v9))
        {
          v464 = (void *)objc_claimAutoreleasedReturnValue([*v9 unsureData]);

          v465 = sub_100004680();
          v466 = (os_log_s *)objc_claimAutoreleasedReturnValue(v465);
          v395 = v466;
          a1 = v583;
          if (v464)
          {
            if (os_log_type_enabled(v466, OS_LOG_TYPE_DEFAULT))
            {
              v668.st_dev = v568;
              *(void *)&v668.st_mode = v35;
              v397 = "Got directory %s with non-zero compressed data size; entering passthrough mode";
              v398 = v395;
              uint32_t v399 = 12;
LABEL_427:
              _os_log_impl((void *)&_mh_execute_header, v398, OS_LOG_TYPE_DEFAULT, v397, (uint8_t *)&v668, v399);
            }

LABEL_428:
            id v400 = sub_1000105F8(a1, (uint64_t)v627, v25);
            id v16 = (id)objc_claimAutoreleasedReturnValue(v400);
          }

          else
          {
            if (os_log_type_enabled(v466, OS_LOG_TYPE_ERROR))
            {
              v668.st_dev = v568;
              *(void *)&v668.st_mode = v35;
              _os_log_error_impl( (void *)&_mh_execute_header,  v395,  OS_LOG_TYPE_ERROR,  "Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
                (uint8_t *)&v668,
                0xCu);
            }

            v669 = @"SZExtractorFileOffsetErrorKey";
            v509 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
            v670 = v509;
            v510 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v670,  &v669,  1LL));
            id v512 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  708LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v510,  @"Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
                     v511,
                     (uint64_t)v35);
            id v16 = (id)objc_claimAutoreleasedReturnValue(v512);
          }

          uint64_t v13 = v580;
          goto LABEL_467;
        }

        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([*v9 unsureData]);

        a1 = v583;
        if (!v64) {
          goto LABEL_107;
        }
        if ((unint64_t)[*v9 recordsProcessed] >= 3) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  714,  "_currentState.recordsProcessed <= 2");
        }
        if (![*v9 recordsProcessed])
        {
          if (!strcmp(v35, "META-INF/")) {
            goto LABEL_107;
          }
          v65 = v35;
          uint64_t v66 = "mimetype";
          goto LABEL_94;
        }

        if ([*v9 recordsProcessed] != (id)1)
        {
          if ([*v9 recordsProcessed] == (id)2 && !strcmp(v35, "META-INF/com.apple.ZipMetadata.plist"))
          {
LABEL_104:
            v106 = sub_100004680();
            v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
            {
              v668.st_dev = v568;
              *(void *)&v668.st_mode = v35;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEBUG,  "File %s is metadata file, so keeping in memory",  (uint8_t *)&v668,  0xCu);
            }

            [*v9 setStoreCurrentFileInMemory:1];
            goto LABEL_107;
          }

LABEL_425:
          v394 = sub_100004680();
          v395 = (os_log_s *)objc_claimAutoreleasedReturnValue(v394);
          if (os_log_type_enabled(v395, OS_LOG_TYPE_DEFAULT))
          {
            id v396 = [*v9 recordsProcessed];
            v668.st_dev = 134218498;
            *(void *)&v668.st_mode = v396;
            WORD2(v668.st_ino) = 2080;
            *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v35;
            HIWORD(v668.st_gid) = 2080;
            *(void *)&v668.st_rdev = "META-INF/";
            v397 = "Item %lld (%s) in archive was not 'mimetype' or %s; entering passthrough mode";
            v398 = v395;
            uint32_t v399 = 32;
            goto LABEL_427;
          }

          goto LABEL_428;
        }

        if (!strcmp(v35, "META-INF/com.apple.ZipMetadata.plist")) {
          goto LABEL_104;
        }
        v65 = v35;
        uint64_t v66 = "META-INF/";
LABEL_94:
        if (strcmp(v65, v66)) {
          goto LABEL_425;
        }
LABEL_107:
        if (!strcmp(v35, "META-INF/com.apple.FixedZipMetadata.bin"))
        {
          v108 = sub_100004680();
          v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
          {
            v668.st_dev = v568;
            *(void *)&v668.st_mode = v35;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEBUG,  "File %s is fixed metadata file, so keeping in memory",  (uint8_t *)&v668,  0xCu);
          }

          [*v9 setStoreCurrentFileInMemory:1];
        }

        id v110 = objc_claimAutoreleasedReturnValue([v581 stringByAppendingPathComponent:v10]);
        v582 = (char *)[v110 fileSystemRepresentation];
        v111 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);

        id v112 = *v9;
        if (!v111)
        {
          if (v38 == 47) {
            uint64_t v114 = 16877LL;
          }
          else {
            uint64_t v114 = 33188LL;
          }
          goto LABEL_120;
        }

        uint64_t v113 = sub_100004AA0((uint64_t)[v112 currentLFRecord], word_10001DB42, 2u);
        if (v113)
        {
          uint64_t v114 = *(unsigned __int16 *)(v113 + 4);
          id v112 = *v9;
LABEL_120:
          [v112 setCurrentLFMode:v114];
          goto LABEL_192;
        }

        v115 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
        v116 = v115;
        if (v38 != 47)
        {
          v117 = (void *)objc_claimAutoreleasedReturnValue([v115 objectForKeyedSubscript:@"StandardFilePerms"]);

          if (!v117)
          {
            uint64_t v118 = 33188LL;
            goto LABEL_191;
          }

LABEL_134:
          uint64_t v118 = (uint64_t)[v117 unsignedShortValue];
          goto LABEL_191;
        }

        v117 = (void *)objc_claimAutoreleasedReturnValue([v115 objectForKeyedSubscript:@"StandardDirectoryPerms"]);

        if (v117) {
          goto LABEL_134;
        }
        uint64_t v118 = 16877LL;
LABEL_191:
        [*v9 setCurrentLFMode:v118];

LABEL_192:
        objc_msgSend(*v9, "setCurrentLFMode:", (unint64_t)objc_msgSend(*v9, "currentLFMode") & 0xFFFFF1FF);
        if (([*v9 currentLFMode] & 0xF000) == 0xA000)
        {
          v183 = sub_100004680();
          v184 = (os_log_s *)objc_claimAutoreleasedReturnValue(v183);
          if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v291 = [*v9 currentLFMode];
            v668.st_dev = v570;
            *(void *)&v668.st_mode = v35;
            WORD2(v668.st_ino) = 1024;
            *(_DWORD *)((char *)&v668.st_ino + 6) = v291;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v184,  OS_LOG_TYPE_DEBUG,  "File %s is a symlink (mode = 0%o), so keeping in memory",  (uint8_t *)&v668,  0x12u);
          }

          [*v9 setStoreCurrentFileInMemory:1];
        }

        unint64_t v185 = sub_100004B14((uint64_t)[*v9 currentLFRecord]);
        if (v185 > 0x500000)
        {
          __darwin_ino64_t v186 = v185;
          v187 = sub_100004680();
          v188 = (os_log_s *)objc_claimAutoreleasedReturnValue(v187);
          if (os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG))
          {
            v668.st_dev = v570;
            *(void *)&v668.st_mode = v35;
            WORD2(v668.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = v186;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v188,  OS_LOG_TYPE_DEBUG,  "File %s is larger than 5 MB (%llu) so not keeping in memory",  (uint8_t *)&v668,  0x16u);
          }

          [*v9 setStoreCurrentFileInMemory:0];
        }

        v189 = (void *)objc_claimAutoreleasedReturnValue([v110 stringByDeletingLastPathComponent]);
        if (([v189 isEqualToString:v581] & 1) == 0)
        {
          id v190 = v189;
          v191 = (const char *)[v190 fileSystemRepresentation];
          if (stat(v191, &v668))
          {
            v192 = v7;
            if (*__error() != 2)
            {
              uint64_t v219 = *__error();
              v220 = sub_100004680();
              v221 = (os_log_s *)objc_claimAutoreleasedReturnValue(v220);
              if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
              {
                v312 = strerror(v219);
                uid_t v664 = v572;
                id v665 = v190;
                __int16 v666 = 2080;
                v667 = v312;
                _os_log_error_impl( (void *)&_mh_execute_header,  v221,  OS_LOG_TYPE_ERROR,  "Can't determine if parent path exists %@: %s",  (uint8_t *)&v664,  0x16u);
              }

              NSErrorUserInfoKey v660 = v579;
              id v661 = v190;
              v222 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v661,  &v660,  1LL));
              strerror(v219);
              id v224 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  881LL,  v574,  v219,  0LL,  v222,  @"Can't determine if parent path exists %@: %s",  v223,  (uint64_t)v190);
              v225 = (void *)objc_claimAutoreleasedReturnValue(v224);

              int v61 = 2;
              id v585 = v225;
              id v7 = v192;
              goto LABEL_247;
            }

            v193 = sub_100004680();
            v194 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
            {
              uid_t v664 = v573;
              id v665 = v190;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEBUG,  "Parent path %@ did not exist",  (uint8_t *)&v664,  0xCu);
            }

            int v195 = mkpath_np(v191, 0x1EDu);
            int v196 = v195;
            int v61 = 0;
            int v197 = 1;
            if (v195 && v195 != 17)
            {
              v198 = sub_100004680();
              v199 = (os_log_s *)objc_claimAutoreleasedReturnValue(v198);
              if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
              {
                v328 = strerror(v196);
                uid_t v664 = v572;
                id v665 = v190;
                __int16 v666 = 2080;
                v667 = v328;
                _os_log_error_impl( (void *)&_mh_execute_header,  v199,  OS_LOG_TYPE_ERROR,  "Failed to create parent directory %@: %s",  (uint8_t *)&v664,  0x16u);
              }

              NSErrorUserInfoKey v662 = v579;
              id v663 = v190;
              v200 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v663,  &v662,  1LL));
              strerror(v196);
              id v202 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  834LL,  v574,  v196,  0LL,  v200,  @"Failed to create parent directory %@: %s",  v201,  (uint64_t)v190);
              v203 = (void *)objc_claimAutoreleasedReturnValue(v202);

              int v197 = 0;
              int v61 = 2;
              id v585 = v203;
            }

            id v7 = v192;
            a1 = v583;
            if (v196 && v196 != 17 && !v197) {
              goto LABEL_248;
            }
          }
        }

        v204 = v584;
        uint64_t v205 = sub_100004AA0((uint64_t)[*v584 currentLFRecord], &word_10001DB3E, 8u);
        id v206 = *v204;
        if (v38 != 47)
        {
          if (objc_claimAutoreleasedReturnValue([*v204 fileWriter])) {
            __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  929,  "!_currentState.fileWriter");
          }
          unsigned __int8 v217 = [*v204 currentLFRequiresDataDescriptor];
          v577 = v7;
          if ((v217 & 1) != 0) {
            uint64_t v218 = -1LL;
          }
          else {
            uint64_t v218 = sub_100010C1C(*v204);
          }
          uint64_t v233 = v583;
          id v234 = [*(id *)(v583 + 64) performCachedWrites];
          uint64_t v235 = *(void *)(v233 + 96);
          id v236 = v585;
          id v624 = v585;
          v237 = (void *)objc_claimAutoreleasedReturnValue( +[StreamingFileWriter fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:error:]( &OBJC_CLASS___StreamingFileWriter,  "fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncT rackingGroup:errorDelegate:error:",  v110,  1537LL,  384LL,  0LL,  v234,  v218,  v235,  v233,  &v624));
          id v238 = v624;

          if (v237)
          {
            v668.st_dev = -1;
            uid_t v664 = -1;
            v204 = v584;
            id v239 = [*v584 resolveOwnershipWithExtraField:v205 outUID:&v668 outGID:&v664];
            [v237 configureFileAndSetOwnership:v239 toUID:v668.st_dev GID:v664];
            [*v204 setFileWriter:v237];

            id v585 = v238;
            id v7 = v577;
            a1 = v583;
            goto LABEL_240;
          }

          v240 = sub_100004680();
          v241 = (os_log_s *)objc_claimAutoreleasedReturnValue(v240);
          if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR))
          {
            v668.st_dev = v573;
            *(void *)&v668.st_mode = v110;
            _os_log_error_impl( (void *)&_mh_execute_header,  v241,  OS_LOG_TYPE_ERROR,  "Failed to open output file at path %@",  (uint8_t *)&v668,  0xCu);
          }

          NSErrorUserInfoKey v656 = v579;
          id v657 = v110;
          v242 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v657,  &v656,  1LL));
          id v244 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  940LL,  @"SZExtractorErrorDomain",  1LL,  v238,  v242,  @"Failed to open output file at path %@",  v243,  (uint64_t)v110);
          id v585 = (id)objc_claimAutoreleasedReturnValue(v244);

          int v61 = 2;
          id v7 = v577;
LABEL_247:
          a1 = v583;
          goto LABEL_248;
        }

        mode_t v207 = (unsigned __int16)[*v204 currentLFMode];
        v208 = v582;
        if (!mkdir(v582, v207)) {
          goto LABEL_222;
        }
        if (*__error() == 17)
        {
          if (chmod(v208, (mode_t)[*v204 currentLFMode]))
          {
            v209 = sub_100004680();
            v210 = (os_log_s *)objc_claimAutoreleasedReturnValue(v209);
            if (os_log_type_enabled(v210, OS_LOG_TYPE_ERROR))
            {
              v317 = __error();
              v318 = strerror(*v317);
              v668.st_dev = v572;
              *(void *)&v668.st_mode = v110;
              WORD2(v668.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v318;
              _os_log_error_impl( (void *)&_mh_execute_header,  v210,  OS_LOG_TYPE_ERROR,  "Failed to set proper mode on directory %@: %s",  (uint8_t *)&v668,  0x16u);
            }
          }

LABEL_222:
          uid_t v664 = -1;
          gid_t v625 = -1;
          if ([*v204 resolveOwnershipWithExtraField:v205 outUID:&v664 outGID:&v625]
            && lchown(v208, v664, v625))
          {
            dev_t v211 = *__error();
            v212 = sub_100004680();
            v213 = (os_log_s *)objc_claimAutoreleasedReturnValue(v212);
            if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
            {
              uid_t v214 = v664;
              v577 = v7;
              gid_t v215 = v625;
              v216 = strerror(v211);
              v668.st_dev = v567;
              *(void *)&v668.st_mode = v208;
              WORD2(v668.st_ino) = 1024;
              *(_DWORD *)((char *)&v668.st_ino + 6) = v214;
              a1 = v583;
              HIWORD(v668.st_uid) = 1024;
              v668.st_gid = v215;
              id v7 = v577;
              LOWORD(v668.st_rdev) = 1024;
              *(dev_t *)((char *)&v668.st_rdev + 2) = v211;
              *((_WORD *)&v668.st_rdev + 3) = 2080;
              v668.st_atimespec.tv_sec = (__darwin_time_t)v216;
              _os_log_impl( (void *)&_mh_execute_header,  v213,  OS_LOG_TYPE_DEFAULT,  "Failed to lchown %s to (%d:%d) : %d (%s)",  (uint8_t *)&v668,  0x28u);
            }
          }

LABEL_240:
          if (([*v204 currentLFRequiresDataDescriptor] & 1) != 0 || sub_100010D08(*v204))
          {
            [*v204 setStreamState:2];
            int v61 = 0;
          }

          else
          {
            [*v204 setStreamState:4];
            int v61 = 3;
          }

          goto LABEL_248;
        }

        uint64_t v226 = *__error();
        v227 = sub_100004680();
        v228 = (os_log_s *)objc_claimAutoreleasedReturnValue(v227);
        if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
        {
          v313 = strerror(v226);
          v668.st_dev = v572;
          *(void *)&v668.st_mode = v110;
          WORD2(v668.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v313;
          _os_log_error_impl( (void *)&_mh_execute_header,  v228,  OS_LOG_TYPE_ERROR,  "Failed to create directory at path %@: %s",  (uint8_t *)&v668,  0x16u);
        }

        NSErrorUserInfoKey v658 = v579;
        id v659 = v110;
        v229 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v659,  &v658,  1LL));
        strerror(v226);
        id v231 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  899LL,  v574,  v226,  0LL,  v229,  @"Failed to create directory at path %@: %s",  v230,  (uint64_t)v110);
        v232 = (void *)objc_claimAutoreleasedReturnValue(v231);

        int v61 = 2;
        id v585 = v232;
LABEL_248:

        if (v61)
        {
          uint64_t v13 = v580;
          id v10 = v585;
          goto LABEL_362;
        }

        unint64_t v12 = v626;
        id v9 = v584;
        id v10 = v585;
        uint64_t v13 = v580;
LABEL_251:
        unsigned int v245 = [*v9 currentLFRequiresDataDescriptor];
        int v246 = *((unsigned __int16 *)[*v9 currentLFRecord] + 4);
        unsigned int v578 = v245;
        if (!v245 || (unint64_t v247 = v12, !v246))
        {
          uint64_t v248 = sub_100010D08(*v9);
          id v249 = [*v9 thisStageBytesComplete];
          else {
            unint64_t v247 = v12;
          }
        }

        if ([*v9 thisStageBytesComplete])
        {
          if (v247) {
            goto LABEL_260;
          }
LABEL_326:
          if (v578 && *((_WORD *)[*v9 currentLFRecord] + 4))
          {
            if ((v247 & 1) != 0)
            {
              id v286 = *v9;
LABEL_332:
              int v61 = 3;
              [v286 setStreamState:3];
              goto LABEL_362;
            }

            goto LABEL_55;
          }

          id v287 = [*v9 thisStageBytesComplete];
          if (v287 != (id)sub_100010D08(*v9))
          {
            if (v12) {
              __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1295,  "0 == length");
            }
            goto LABEL_481;
          }

          id v286 = *v9;
          if (v578) {
            goto LABEL_332;
          }
          [v286 setStreamState:4];
LABEL_55:
          int v61 = 3;
LABEL_362:
          objc_autoreleasePoolPop(v13);
          BOOL v309 = v61 == 3;
          id v9 = v584;
          if (!v309) {
            goto LABEL_383;
          }
          continue;
        }

        objc_msgSend(*v9, "setCurrentCRC32:", crc32(0, 0, 0));
        if (!v247) {
          goto LABEL_326;
        }
LABEL_260:
        id v585 = v10;
        int v564 = 0;
        int v565 = v246;
        v577 = v7;
        v580 = v13;
        while (2)
        {
          if (v247 >= 0x7FFFFFFF) {
            __darwin_ino64_t v250 = 0x7FFFFFFFLL;
          }
          else {
            __darwin_ino64_t v250 = v247;
          }
          unint64_t v576 = v247 - v250;
          if (v246 <= 13)
          {
            if (v246)
            {
              if (v246 != 8) {
                goto LABEL_456;
              }
              goto LABEL_270;
            }

            id v272 = [*v9 currentCRC32];
            v273 = v627;
            objc_msgSend(*v9, "setCurrentCRC32:", crc32((uLong)v272, v627, v250));
            unsigned int v274 = [*v9 storeCurrentFileInMemory];
            id v275 = *v9;
            if (v274)
            {
              v276 = (void *)objc_claimAutoreleasedReturnValue([v275 inMemoryFileData]);
              [v276 appendBytes:v273 length:v250];
            }

            else
            {
              v277 = (void *)objc_claimAutoreleasedReturnValue([v275 fileWriter]);
              if (!v277) {
                __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  993,  "_currentState.fileWriter");
              }

              v278 = (void *)objc_claimAutoreleasedReturnValue([*v9 fileWriter]);
              id v279 = v585;
              id v623 = v585;
              uint64_t v14 = (uint64_t)[v278 writeBuffer:v273 length:v250 error:&v623];
              id v16 = v623;

              if (!(_DWORD)v14) {
                goto LABEL_470;
              }
              id v585 = v16;
            }

            objc_msgSend(*v9, "setCurrentOffset:", (char *)objc_msgSend(*v9, "currentOffset") + v250);
            objc_msgSend(*v9, "setThisStageBytesComplete:", (char *)objc_msgSend(*v9, "thisStageBytesComplete") + v250);
            objc_msgSend( *v9,  "setUncompressedBytesOutput:",  (char *)objc_msgSend(*v9, "uncompressedBytesOutput") + v250);
            objc_msgSend(*v9, "setTotalFileSizeWritten:", (char *)objc_msgSend(*v9, "totalFileSizeWritten") + v250);
            if ([*v9 totalUncompressedBytes]) {
              sub_1000112B0( a1,  (double)(unint64_t)[*(id *)(a1 + 64) totalFileSizeWritten]
            }
              / (double)(unint64_t)[*(id *)(a1 + 64) totalUncompressedBytes]);
            id v280 = *v9;
            v281 = (char *)[*v9 currentOffset];
            id v16 = (id)objc_claimAutoreleasedReturnValue([v280 updateHashFromOffset:&v281[-v250] withBytes:v627 length:v250]);

            if (v16) {
              goto LABEL_469;
            }
            [*v9 markResumptionPoint];
            id v585 = 0LL;
LABEL_324:
            v284 = (void *)objc_claimAutoreleasedReturnValue([*v9 unsureData]);
            v285 = v627;
            [v284 appendBytes:v627 length:v250];

            unint64_t v12 = v626 - v250;
            size_t v626 = v12;
            v627 = &v285[v250];
            int v246 = v565;
            unint64_t v247 = v576;
            if (!v576)
            {
              id v10 = v585;
              LOBYTE(v247) = v564;
              goto LABEL_326;
            }

            continue;
          }

          break;
        }

        if (v246 != 14 && v246 != 99)
        {
LABEL_456:
          v352 = v13;
          v444 = sub_100010E30([*v9 currentLFRecord]);
          v445 = (void *)objc_claimAutoreleasedReturnValue(v444);
          v644[0] = @"SZExtractorFileOffsetErrorKey";
          v446 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
          v644[1] = v579;
          v645[0] = v446;
          v645[1] = v445;
          v447 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v645,  v644,  2LL));

          v448 = sub_100004680();
          v449 = (os_log_s *)objc_claimAutoreleasedReturnValue(v448);
          if (os_log_type_enabled(v449, OS_LOG_TYPE_ERROR))
          {
            int v523 = *((unsigned __int16 *)[*v9 currentLFRecord] + 4);
            v668.st_dev = 67109378;
            *(_DWORD *)&v668.st_mode = v523;
            LOWORD(v668.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&v668.st_ino + 2) = (__darwin_ino64_t)v445;
            _os_log_error_impl( (void *)&_mh_execute_header,  v449,  OS_LOG_TYPE_ERROR,  "Unknown compression method %hu for file %@",  (uint8_t *)&v668,  0x12u);
          }

          v450 = (unsigned __int16 *)[*v9 currentLFRecord];
          id v452 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1283LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v447,  @"Unknown compression method %hu for file %@",  v451,  v450[4]);
          id v10 = (id)objc_claimAutoreleasedReturnValue(v452);

          uint64_t v14 = 0LL;
          goto LABEL_403;
        }

LABEL_270:
        if (!*(void *)(a1 + 56)) {
          *(void *)(a1 + 56) = malloc(0x10000uLL);
        }
        v251 = (compression_stream *)[*v9 cmpState];
        if (![*v9 thisStageBytesComplete])
        {
          if (v246 == 99) {
            unsigned int v252 = 2049;
          }
          else {
            unsigned int v252 = 0;
          }
          if (v246 == 14) {
            unsigned int v252 = 774;
          }
          uint64_t v253 = v246 == 8 ? 517LL : v252;
          uint64_t v254 = compression_stream_reinit(v251, 1LL, v253);
          if ((_DWORD)v254)
          {
            uint64_t v437 = v254;
            v352 = v13;
            v438 = sub_100004680();
            v439 = (os_log_s *)objc_claimAutoreleasedReturnValue(v438);
            if (os_log_type_enabled(v439, OS_LOG_TYPE_ERROR))
            {
              v668.st_dev = 67109120;
              *(_DWORD *)&v668.st_mode = v437;
              _os_log_error_impl( (void *)&_mh_execute_header,  v439,  OS_LOG_TYPE_ERROR,  "Failed to initialize compression: %d",  (uint8_t *)&v668,  8u);
            }

            v654 = @"SZExtractorCompressionLibErrorKey";
            v440 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v437));
            v655 = v440;
            v441 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v655,  &v654,  1LL));
            id v443 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1044LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v441,  @"Failed to initialize compression: %d",  v442,  v437);
            id v10 = (id)objc_claimAutoreleasedReturnValue(v443);

            uint64_t v14 = 0LL;
            id v7 = v577;
            goto LABEL_403;
          }
        }

        LODWORD(v582) = 0;
        src_ptr = v627;
        v251->src_ptr = v627;
        v251->size_t src_size = v250;
        while (2)
        {
          v251->dst_ptr = *(uint8_t **)(a1 + 56);
          v251->unint64_t dst_size = 0x10000LL;
          uint64_t v256 = compression_stream_process(v251, 0);
          size_t src_size = v251->src_size;
          __darwin_ino64_t v258 = v250 - src_size;
          v259 = sub_100004680();
          v260 = (os_log_s *)objc_claimAutoreleasedReturnValue(v259);
          if (os_log_type_enabled(v260, OS_LOG_TYPE_DEBUG))
          {
            v668.st_dev = v575;
            *(void *)&v668.st_mode = v250 - src_size;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v260,  OS_LOG_TYPE_DEBUG,  "compression_stream_process consumed %zu bytes",  (uint8_t *)&v668,  0xCu);
          }

          v261 = v584;
          objc_msgSend(*v584, "setCurrentOffset:", (char *)objc_msgSend(*v584, "currentOffset") + v258);
          objc_msgSend( *v261,  "setThisStageBytesComplete:",  (char *)objc_msgSend(*v261, "thisStageBytesComplete") + v258);
          unint64_t dst_size = v251->dst_size;
          if (dst_size > 0x10000) {
            __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1083,  "outputSize >= cmpState->dst_size");
          }
          if (!(_DWORD)v256 && v250 && v250 == src_size && dst_size == 0x10000)
          {
            v652[0] = @"SZExtractorFileOffsetErrorKey";
            id v9 = v584;
            v334 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v584 currentOffset]));
            v653[0] = v334;
            v652[1] = v579;
            v335 = sub_100010E30([*v9 currentLFRecord]);
            v336 = (void *)objc_claimAutoreleasedReturnValue(v335);
            v653[1] = v336;
            v337 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v653,  v652,  2LL));

            v338 = sub_100004680();
            v339 = (os_log_s *)objc_claimAutoreleasedReturnValue(v338);
            if (os_log_type_enabled(v339, OS_LOG_TYPE_ERROR))
            {
              v401 = sub_100010E30([*v9 currentLFRecord]);
              id v402 = (id)objc_claimAutoreleasedReturnValue(v401);
              v668.st_dev = 138412802;
              *(void *)&v668.st_mode = v402;
              WORD2(v668.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = v250;
              HIWORD(v668.st_gid) = 2048;
              *(void *)&v668.st_rdev = 0x10000LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  v339,  OS_LOG_TYPE_ERROR,  "compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                (uint8_t *)&v668,
                0x20u);
            }

            v340 = sub_100010E30([*v9 currentLFRecord]);
            v341 = (void *)objc_claimAutoreleasedReturnValue(v340);
            id v343 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1089LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v337,  @"compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                     v342,
                     (uint64_t)v341);
            id v10 = (id)objc_claimAutoreleasedReturnValue(v343);

LABEL_391:
LABEL_392:
            uint64_t v14 = 0LL;
            id v7 = v577;
            goto LABEL_393;
          }

          if (v256 >= 2)
          {
            v650[0] = @"SZExtractorCompressionLibErrorKey";
            v344 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v256));
            v651[0] = v344;
            v650[1] = @"SZExtractorFileOffsetErrorKey";
            id v9 = v584;
            v345 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v584 currentOffset]));
            v651[1] = v345;
            v650[2] = v579;
            v346 = sub_100010E30([*v9 currentLFRecord]);
            v347 = (void *)objc_claimAutoreleasedReturnValue(v346);
            v651[2] = v347;
            v337 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v651,  v650,  3LL));

            v348 = sub_100004680();
            v349 = (os_log_s *)objc_claimAutoreleasedReturnValue(v348);
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
            {
              v668.st_dev = 67109120;
              *(_DWORD *)&v668.st_mode = v256;
              _os_log_error_impl( (void *)&_mh_execute_header,  v349,  OS_LOG_TYPE_ERROR,  "compression_stream_process returned unexpected result %d",  (uint8_t *)&v668,  8u);
            }

            id v351 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1097LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v337,  @"compression_stream_process returned unexpected result %d",  v350,  v256);
            id v10 = (id)objc_claimAutoreleasedReturnValue(v351);
            goto LABEL_391;
          }

          if (v250 == src_size)
          {
            id v9 = v584;
            id v10 = v585;
          }

          else
          {
            id v9 = v584;
            id v10 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( *v584,  "updateHashFromOffset:withBytes:length:",  (char *)objc_msgSend(*v584, "currentOffset") - v258,  src_ptr,  v258));

            if (v10) {
              goto LABEL_392;
            }
            LODWORD(v582) = (_DWORD)v582 + v258;
          }

          if (dst_size == 0x10000)
          {
            a1 = v583;
          }

          else
          {
            unint64_t v263 = 0x10000 - dst_size;
            a1 = v583;
            objc_msgSend( *(id *)(v583 + 64),  "setUncompressedBytesOutput:",  (char *)objc_msgSend(*(id *)(v583 + 64), "uncompressedBytesOutput") + v263);
            objc_msgSend( *(id *)(a1 + 64),  "setCurrentCRC32:",  crc32((uLong)objc_msgSend(*(id *)(a1 + 64), "currentCRC32"), *(const Bytef **)(a1 + 56), v263));
            unsigned int v264 = [*(id *)(a1 + 64) storeCurrentFileInMemory];
            v265 = *(void **)(a1 + 64);
            if (v264)
            {
              v266 = (void *)objc_claimAutoreleasedReturnValue([v265 inMemoryFileData]);
              [v266 appendBytes:*(void *)(a1 + 56) length:v263];
            }

            else
            {
              v267 = (void *)objc_claimAutoreleasedReturnValue([v265 fileWriter]);
              if (!v267) {
                __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1118,  "_currentState.fileWriter");
              }

              v268 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) fileWriter]);
              uint64_t v269 = *(void *)(a1 + 56);
              id v622 = v10;
              unsigned int v270 = [v268 writeBuffer:v269 length:v263 error:&v622];
              id v271 = v622;

              if (!v270)
              {
                uint64_t v14 = 0LL;
                id v10 = v271;
                id v7 = v577;
                goto LABEL_394;
              }

              id v10 = v271;
            }

            objc_msgSend(*v9, "setTotalFileSizeWritten:", (char *)objc_msgSend(*v9, "totalFileSizeWritten") + v263);
            if ([*v9 totalUncompressedBytes]) {
              sub_1000112B0( a1,  (double)(unint64_t)[*(id *)(a1 + 64) totalFileSizeWritten]
            }
              / (double)(unint64_t)[*(id *)(a1 + 64) totalUncompressedBytes]);
          }

          id v585 = v10;
          if (!(_DWORD)v256)
          {
            __darwin_ino64_t v250 = v251->src_size;
            if (!v250 && v251->dst_size)
            {
              LODWORD(v250) = (_DWORD)v582;
              id v7 = v577;
LABEL_323:
              uint64_t v13 = v580;
              goto LABEL_324;
            }

            src_ptr = v251->src_ptr;
            continue;
          }

          break;
        }

        id v7 = v577;
        if ((v578 & 1) != 0)
        {
          unint64_t v576 = 0LL;
          int v564 = 1;
          goto LABEL_321;
        }

        id v282 = (id)sub_100010D08(*v9);
        if (v282 != [*v9 thisStageBytesComplete])
        {
          v483 = sub_100004680();
          v484 = (os_log_s *)objc_claimAutoreleasedReturnValue(v483);
          if (os_log_type_enabled(v484, OS_LOG_TYPE_ERROR))
          {
            uint64_t v544 = sub_100010D08(*v9);
            uint64_t v545 = v544 - (void)[*v9 thisStageBytesComplete];
            v546 = sub_100010E30([*v9 currentLFRecord]);
            id v547 = (id)objc_claimAutoreleasedReturnValue(v546);
            v668.st_dev = 134218242;
            *(void *)&v668.st_mode = v545;
            WORD2(v668.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v547;
            _os_log_error_impl( (void *)&_mh_execute_header,  v484,  OS_LOG_TYPE_ERROR,  "Hit compression stream end with %llu compressed bytes remaining for file %@",  (uint8_t *)&v668,  0x16u);
          }

          v648 = @"SZExtractorFileOffsetErrorKey";
          v485 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
          v649 = v485;
          v486 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v649,  &v648,  1LL));
          uint64_t v487 = sub_100010D08(*v9);
          uint64_t v488 = v487 - (void)[*v9 thisStageBytesComplete];
          v489 = sub_100010E30([*v9 currentLFRecord]);
          v562 = (void *)objc_claimAutoreleasedReturnValue(v489);
          id v491 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1140LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v486,  @"Hit compression stream end with %llu compressed bytes remaining for file %@",  v490,  v488);
          uint64_t v492 = objc_claimAutoreleasedReturnValue(v491);

          uint64_t v14 = 0LL;
          id v10 = (id)v492;
LABEL_393:
          a1 = v583;
          goto LABEL_394;
        }

        id v283 = (id)sub_100010C1C(*v9);
        if (v283 == [*v9 uncompressedBytesOutput])
        {
LABEL_321:
          LODWORD(v250) = (_DWORD)v582;
          goto LABEL_323;
        }

        v493 = sub_100004680();
        v494 = (os_log_s *)objc_claimAutoreleasedReturnValue(v493);
        if (os_log_type_enabled(v494, OS_LOG_TYPE_ERROR))
        {
          id v548 = [*v9 uncompressedBytesOutput];
          v549 = sub_100010E30([*v9 currentLFRecord]);
          id v550 = (id)objc_claimAutoreleasedReturnValue(v549);
          uint64_t v551 = sub_100010C1C(*v9);
          v668.st_dev = 134218498;
          *(void *)&v668.st_mode = v548;
          WORD2(v668.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v550;
          HIWORD(v668.st_gid) = 2048;
          *(void *)&v668.st_rdev = v551;
          _os_log_error_impl( (void *)&_mh_execute_header,  v494,  OS_LOG_TYPE_ERROR,  "Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes",  (uint8_t *)&v668,  0x20u);
        }

        v646 = @"SZExtractorFileOffsetErrorKey";
        v495 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
        v647 = v495;
        v496 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v647,  &v646,  1LL));
        id v497 = [*v9 uncompressedBytesOutput];
        v498 = sub_100010E30([*v9 currentLFRecord]);
        v559 = (void *)objc_claimAutoreleasedReturnValue(v498);
        sub_100010C1C(*v9);
        id v500 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1143LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v496,  @"Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes",  v499,  (uint64_t)v497);
        uint64_t v501 = objc_claimAutoreleasedReturnValue(v500);

        uint64_t v14 = 0LL;
        id v10 = (id)v501;
LABEL_394:
        uint64_t v13 = v580;
LABEL_518:
        objc_autoreleasePoolPop(v13);
        if (v10)
        {
LABEL_519:
          if ([*v9 performingExtraction])
          {
            v521 = sub_100004700();
            v522 = (os_log_s *)objc_claimAutoreleasedReturnValue(v521);
            if (os_signpost_enabled(v522))
            {
              LOWORD(v668.st_dev) = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v522,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  "Extraction failed",  (uint8_t *)&v668,  2u);
            }

            [*v9 setPerformingExtraction:0];
          }

          sub_10000B078(a1);
        }

LABEL_524:
        v7[2](v7, v10, v14);
LABEL_525:

        return;
      case 2u:
        goto LABEL_251;
      case 3u:
        if (![*v9 dataDescriptor]) {
          objc_msgSend(*v9, "setDataDescriptor:", calloc(1uLL, 0x18uLL));
        }
        uint64_t v47 = sub_100004AA0((uint64_t)[*v9 currentLFRecord], &word_10001DB40, 0x10u);
        if (v47) {
          uint64_t v48 = 24LL;
        }
        else {
          uint64_t v48 = 16LL;
        }
        id v49 = sub_1000104FC((uint64_t)[*v9 dataDescriptor], v48, *v9, (const void **)&v627, &v626);
        uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);

        if (v50) {
          goto LABEL_511;
        }
        unint64_t v12 = v626;
        id v51 = *v9;
        if (!v626) {
          goto LABEL_416;
        }
        if ([v51 thisStageBytesComplete] != (id)v48) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1334,  "_currentState.thisStageBytesComplete == expected_size");
        }
        if (*(_DWORD *)[*v9 dataDescriptor] != 134695760)
        {
          v377 = (void *)objc_claimAutoreleasedReturnValue([*v9 unsureData]);

          v378 = sub_100004680();
          v379 = (os_log_s *)objc_claimAutoreleasedReturnValue(v378);
          v380 = v379;
          if (!v377)
          {
            if (os_log_type_enabled(v379, OS_LOG_TYPE_ERROR))
            {
              int v524 = *(unsigned __int8 *)[*v9 dataDescriptor];
              int v525 = *((unsigned __int8 *)[*v9 dataDescriptor] + 1);
              uid_t v526 = *((unsigned __int8 *)[*v9 dataDescriptor] + 2);
              gid_t v527 = *((unsigned __int8 *)[*v9 dataDescriptor] + 3);
              v668.st_dev = 67109888;
              *(_DWORD *)&v668.st_mode = v524;
              LOWORD(v668.st_ino) = 1024;
              *(_DWORD *)((char *)&v668.st_ino + 2) = v525;
              HIWORD(v668.st_ino) = 1024;
              v668.st_uid = v526;
              LOWORD(v668.st_gid) = 1024;
              *(gid_t *)((char *)&v668.st_gid + 2) = v527;
              _os_log_error_impl( (void *)&_mh_execute_header,  v380,  OS_LOG_TYPE_ERROR,  "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).",  (uint8_t *)&v668,  0x1Au);
            }

            v642 = @"SZExtractorFileOffsetErrorKey";
            v453 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
            v643 = v453;
            v454 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v643,  &v642,  1LL));
            uint64_t v455 = *(unsigned __int8 *)[*v9 dataDescriptor];
            [*v9 dataDescriptor];
            [*v9 dataDescriptor];
            [*v584 dataDescriptor];
            id v9 = v584;
            id v457 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1343LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v454,  @"Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).",  v456,  v455);
            id v10 = (id)objc_claimAutoreleasedReturnValue(v457);

            uint64_t v14 = 0LL;
            a1 = v583;
            goto LABEL_518;
          }

          if (os_log_type_enabled(v379, OS_LOG_TYPE_DEFAULT))
          {
            int v381 = *(unsigned __int8 *)[*v9 dataDescriptor];
            int v382 = *((unsigned __int8 *)[*v9 dataDescriptor] + 1);
            uid_t v383 = *((unsigned __int8 *)[*v9 dataDescriptor] + 2);
            gid_t v384 = *((unsigned __int8 *)[*v9 dataDescriptor] + 3);
            v668.st_dev = 67109888;
            *(_DWORD *)&v668.st_mode = v381;
            a1 = v583;
            LOWORD(v668.st_ino) = 1024;
            *(_DWORD *)((char *)&v668.st_ino + 2) = v382;
            HIWORD(v668.st_ino) = 1024;
            v668.st_uid = v383;
            LOWORD(v668.st_gid) = 1024;
            *(gid_t *)((char *)&v668.st_gid + 2) = v384;
            _os_log_impl( (void *)&_mh_execute_header,  v380,  OS_LOG_TYPE_DEFAULT,  "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx); entering passthrough mode",
              (uint8_t *)&v668,
              0x1Au);
          }

          v385 = v627;
          uint64_t v386 = a1;
          uint64_t v387 = v12;
          goto LABEL_439;
        }

        id v52 = sub_100004680();
        id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
        if (v47)
        {
          if (v54)
          {
            int v55 = *((_DWORD *)[*v9 dataDescriptor] + 1);
            __darwin_ino64_t v56 = *((void *)[*v9 dataDescriptor] + 2);
            uint64_t v57 = *((void *)[*v9 dataDescriptor] + 1);
            v668.st_dev = v569;
            *(_DWORD *)&v668.st_mode = v55;
            a1 = v583;
            LOWORD(v668.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v668.st_ino + 2) = v56;
            HIWORD(v668.st_uid) = 2048;
            *(void *)&v668.st_gid = v57;
            v58 = v53;
            v59 = "Got data descriptor with CRC 0x%x, uncompressed size %llu, compressed size %llu";
            uint32_t v60 = 28;
LABEL_338:
            _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, v59, (uint8_t *)&v668, v60);
          }
        }

        else if (v54)
        {
          int v292 = *((_DWORD *)[*v9 dataDescriptor] + 1);
          int v293 = *((_DWORD *)[*v9 dataDescriptor] + 3);
          uid_t v294 = *((_DWORD *)[*v9 dataDescriptor] + 2);
          v668.st_dev = v569;
          *(_DWORD *)&v668.st_mode = v292;
          a1 = v583;
          LOWORD(v668.st_ino) = 1024;
          *(_DWORD *)((char *)&v668.st_ino + 2) = v293;
          HIWORD(v668.st_ino) = 1024;
          v668.st_uid = v294;
          v58 = v53;
          v59 = "Got data descriptor with CRC 0x%x, uncompressed size %u, compressed size %u";
          uint32_t v60 = 20;
          goto LABEL_338;
        }

        [*v9 setStreamState:4];
        id v10 = 0LL;
LABEL_70:
        id v67 = [*v9 uncompressedBytesOutput];
        uint64_t v68 = sub_100010C1C(*v9);
        id v69 = *v9;
        if (v67 == (id)v68)
        {
          id v70 = [v69 currentCRC32];
          unsigned int v71 = sub_1000113D0(*v9);
          v72 = [*v9 currentLFRecord];
          if (v70 == (id)v71)
          {
            id v585 = v10;
            uint64_t v73 = sub_100004AA0((uint64_t)v72, &word_10001DB3E, 8u);
            v74 = sub_100010E30([*v9 currentLFRecord]);
            id v75 = objc_claimAutoreleasedReturnValue(v74);
            __int16 v76 = (const char *)[v75 fileSystemRepresentation];
            id v77 = *v9;
            if (!v75 || !v76)
            {
              __int128 v82 = (void *)objc_claimAutoreleasedReturnValue([v77 unsureData]);

              if (v82)
              {
                v83 = sub_100004680();
                v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v668.st_dev) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "Couldn't get filename for stream metadata file; entering passthrough mode",
                    (uint8_t *)&v668,
                    2u);
                }

                id v85 = sub_1000105F8(a1, (uint64_t)v627, v12);
                id v86 = (id)objc_claimAutoreleasedReturnValue(v85);

                int v61 = 2;
              }

              else
              {
                v87 = (unsigned __int16 *)[*v9 currentLFRecord];
                size_t v88 = v87[13];
                v89 = calloc(v88 + 1, 1uLL);
                memcpy(v89, v87 + 15, v88);
                v90 = sub_100004680();
                v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                {
                  v668.st_dev = v568;
                  *(void *)&v668.st_mode = v89;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "Couldn't get filename for current file %s",  (uint8_t *)&v668,  0xCu);
                }

                v636 = @"SZExtractorFileOffsetErrorKey";
                v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
                v637 = v92;
                v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v637,  &v636,  1LL));
                int v61 = 2;
                id v95 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1387LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v93,  @"Couldn't get filename for current file %s",  v94,  (uint64_t)v89);
                id v86 = (id)objc_claimAutoreleasedReturnValue(v95);

                free(v89);
              }

              goto LABEL_361;
            }

            id v78 = [v77 recordsProcessed];
            v580 = v13;
            if ((unint64_t)v78 > 2 || strcmp(v76, "META-INF/com.apple.ZipMetadata.plist"))
            {
              if ((unint64_t)[*v9 recordsProcessed] > 3
                || strcmp(v76, "META-INF/com.apple.FixedZipMetadata.bin"))
              {
                if (([*v9 currentLFMode] & 0xF000) == 0xA000)
                {
                  unint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v581 stringByAppendingPathComponent:v75]);
                  if ([*v9 storeCurrentFileInMemory])
                  {
                    v80 = (void *)objc_claimAutoreleasedReturnValue([*v9 inMemoryFileData]);
                    if (!v80) {
                      __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1496,  "_currentState.inMemoryFileData");
                    }

                    v81 = (void *)objc_claimAutoreleasedReturnValue([*v9 inMemoryFileData]);
                    goto LABEL_123;
                  }

                  id v590 = 0LL;
                  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSMutableData,  "dataWithContentsOfFile:options:error:",  v79,  3LL,  &v590));
                  id v119 = v590;
                  if (v81)
                  {
                    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                    [v120 removeItemAtPath:v79 error:0];

LABEL_123:
                    char v589 = 0;
                    [v81 appendBytes:&v589 length:1];
                    id v121 = v81;
                    v122 = (const char *)[v121 bytes];
                    id v97 = v79;
                    v123 = (const char *)[v97 fileSystemRepresentation];
                    unsigned int v124 = [*v9 denyInvalidSymlinks];
                    v582 = (char *)v121;
                    if (v124)
                    {
                      if (*v122 == 47)
                      {
                        v125 = sub_100004680();
                        v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
                        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                        {
                          v668.st_dev = v570;
                          *(void *)&v668.st_mode = v123;
                          WORD2(v668.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v122;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_ERROR,  "Invalid symlink: %s -> %s (absolute symlinks are forbidden)",  (uint8_t *)&v668,  0x16u);
                        }

                        NSErrorUserInfoKey v632 = v579;
                        id v633 = v97;
                        v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v633,  &v632,  1LL));
                        id v129 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1520LL,  @"SZExtractorErrorDomain",  5LL,  0LL,  v127,  @"Invalid symlink: %s -> %s (absolute symlinks are forbidden)",  v128,  (uint64_t)v123);
LABEL_186:
                        id v86 = (id)objc_claimAutoreleasedReturnValue(v129);

                        goto LABEL_187;
                      }

                      uid_t v664 = 0;
                      gid_t v625 = 0;
                      if (!sub_10001150C( (const char *)[v75 fileSystemRepresentation], 0, (int *)&v625)
                        || !sub_10001150C(v122, v625, (int *)&v664))
                      {
                        v180 = sub_100004680();
                        v181 = (os_log_s *)objc_claimAutoreleasedReturnValue(v180);
                        if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                        {
                          v668.st_dev = v570;
                          *(void *)&v668.st_mode = v123;
                          WORD2(v668.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v122;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v181,  OS_LOG_TYPE_ERROR,  "Invalid symlink: %s -> %s",  (uint8_t *)&v668,  0x16u);
                        }

                        NSErrorUserInfoKey v630 = v579;
                        id v631 = v97;
                        v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v631,  &v630,  1LL));
                        id v129 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1533LL,  @"SZExtractorErrorDomain",  5LL,  0LL,  v127,  @"Invalid symlink: %s -> %s",  v182,  (uint64_t)v123);
                        goto LABEL_186;
                      }
                    }

                    if (symlink(v122, v123))
                    {
                      v157 = v7;
                      uint64_t v158 = *__error();
                      v159 = sub_100004680();
                      v160 = (os_log_s *)objc_claimAutoreleasedReturnValue(v159);
                      if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
                      {
                        v316 = strerror(v158);
                        v668.st_dev = v566;
                        *(void *)&v668.st_mode = v123;
                        WORD2(v668.st_ino) = 2080;
                        *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v122;
                        HIWORD(v668.st_gid) = 2080;
                        *(void *)&v668.st_rdev = v316;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v160,  OS_LOG_TYPE_ERROR,  "Failed to create symlink at %s to %s: %s",  (uint8_t *)&v668,  0x20u);
                      }

                      NSErrorUserInfoKey v628 = v579;
                      id v629 = v97;
                      v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v629,  &v628,  1LL));
                      strerror(v158);
                      id v163 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1541LL,  v574,  v158,  0LL,  v161,  @"Failed to create symlink at %s to %s: %s",  v162,  (uint64_t)v123);
                      id v86 = (id)objc_claimAutoreleasedReturnValue(v163);

                      id v7 = v157;
                      a1 = v583;
                      goto LABEL_187;
                    }

                    lchmod(v123, (mode_t)[*v9 currentLFMode]);
                    if ([*v9 denyInvalidSymlinks])
                    {
                      uint64_t v177 = a1;
                      id v178 = v585;
                      id v588 = v585;
                      int v179 = sub_10000B240(v97, v581, &v588);
                      id v86 = v588;

                      a1 = v177;
                      id v9 = v584;
                      id v585 = v86;
                      if (!v179)
                      {
LABEL_187:
                        v148 = v582;
LABEL_188:

LABEL_344:
                        int v61 = 2;
                        uint64_t v13 = v580;
                        goto LABEL_361;
                      }
                    }

                    if (v73)
                    {
                      *(void *)&v668.st_dev = *(unsigned int *)(v73 + 4);
                      LODWORD(v668.st_ino) = 0;
                      *(void *)&v668.st_uid = *(unsigned int *)(v73 + 8);
                    }

                    else
                    {
                      LODWORD(v668.st_ino) = 0;
                      *(void *)&v668.st_uid = *(void *)&v668.st_dev;
                    }

                    v668.st_rdev = 0;
                    lutimes(v123, (const timeval *)&v668);

                    goto LABEL_350;
                  }

                  v164 = sub_100004680();
                  v165 = (os_log_s *)objc_claimAutoreleasedReturnValue(v164);
                  if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
                  {
                    v668.st_dev = v573;
                    *(void *)&v668.st_mode = v79;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v165,  OS_LOG_TYPE_ERROR,  "Failed to read symlink path from %@",  (uint8_t *)&v668,  0xCu);
                  }

                  NSErrorUserInfoKey v634 = v579;
                  v635 = v79;
                  v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v635,  &v634,  1LL));
                  id v168 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1502LL,  @"SZExtractorErrorDomain",  5LL,  v119,  v166,  @"Failed to read symlink path from %@",  v167,  (uint64_t)v79);
                  id v86 = (id)objc_claimAutoreleasedReturnValue(v168);

LABEL_343:
                  goto LABEL_344;
                }

                if ([*v9 storeCurrentFileInMemory])
                {
                  v96 = sub_100004680();
                  id v97 = (id)objc_claimAutoreleasedReturnValue(v96);
                  if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_DEBUG))
                  {
                    v668.st_dev = v573;
                    *(void *)&v668.st_mode = v75;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v97,  OS_LOG_TYPE_DEBUG,  "Not doing anything with data for file %@",  (uint8_t *)&v668,  0xCu);
                  }
                }

                else
                {
                  if (v73)
                  {
                    time_t v131 = *(unsigned int *)(v73 + 4);
                    time_t v130 = *(unsigned int *)(v73 + 8);
                  }

                  else
                  {
                    time_t v130 = sub_100004B7C(*(_DWORD *)((char *)[*v9 currentLFRecord] + 10));
                    time_t v131 = v130;
                  }

                  v169 = [*v9 currentLFRecord];
                  if (v169[*((unsigned __int16 *)v169 + 13) + 29] != 47)
                  {
                    uint64_t v171 = a1;
                    v172 = (void *)objc_claimAutoreleasedReturnValue([*v9 fileWriter]);
                    if (!v172) {
                      __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1582,  "_currentState.fileWriter");
                    }

                    v173 = (void *)objc_claimAutoreleasedReturnValue([*v9 fileWriter]);
                    id v174 = [*v9 currentLFMode];
                    id v175 = v585;
                    id v587 = v585;
                    unsigned __int8 v176 = objc_msgSend( v173,  "finalizeFileWithAccessTime:modTime:mode:error:",  v131,  0,  v130,  0,  v174,  &v587);
                    id v86 = v587;

                    if ((v176 & 1) == 0)
                    {
                      int v61 = 2;
                      uint64_t v13 = v580;
                      a1 = v171;
LABEL_361:

                      id v10 = v86;
                      goto LABEL_362;
                    }

                    uint64_t v13 = v580;
                    a1 = v171;
LABEL_351:
                    v303 = sub_100004700();
                    v304 = (os_log_s *)objc_claimAutoreleasedReturnValue(v303);
                    if (os_signpost_enabled(v304))
                    {
                      v668.st_dev = v573;
                      *(void *)&v668.st_mode = v75;
                      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v304,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  "Extraction completed successfully for file %@",  (uint8_t *)&v668,  0xCu);
                    }

                    [*(id *)(a1 + 64) setPerformingExtraction:0];
                    id v305 = v75;
                    if ((*(_BYTE *)(a1 + 80) & 2) != 0)
                    {
                      v306 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 xpcConnection]);
                      v307 = v306;
                      if (v306)
                      {
                        id v308 = (id)objc_claimAutoreleasedReturnValue([v306 remoteObjectProxy]);
                        [v308 extractionCompleteAtArchivePath:v305];
                      }

                      else
                      {
                        id v308 = (id)objc_claimAutoreleasedReturnValue([(id)a1 inProcessExtractorDelegate]);
                        if (v308)
                        {
                          v310 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessDelegateQueue]);

                          if (v310)
                          {
                            v311 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessDelegateQueue]);
                            *(void *)&v668.st_dev = _NSConcreteStackBlock;
                            v668.st_ino = 3221225472LL;
                            *(void *)&v668.st_uid = sub_1000115E4;
                            *(void *)&v668.st_rdev = &unk_100028BE8;
                            id v308 = v308;
                            v668.st_atimespec.tv_sec = (__darwin_time_t)v308;
                            v668.st_atimespec.tv_nsec = (uint64_t)v305;
                            dispatch_async(v311, &v668);
                          }
                        }
                      }

                      id v9 = v584;
                    }

                    [*v9 setStreamState:0];
                    if (![*v9 totalUncompressedBytes] && objc_msgSend(*v9, "totalRecordCount")) {
                      sub_1000112B0( a1,  (double)(unint64_t)[*(id *)(a1 + 64) recordsProcessed]
                    }
                      / (double)(unint64_t)[*(id *)(a1 + 64) totalRecordCount]);
                    int v61 = 3;
                    goto LABEL_361;
                  }

                  v170 = (void *)objc_claimAutoreleasedReturnValue([v581 stringByAppendingPathComponent:v75]);
                  *(void *)&v668.st_dev = v131;
                  v668.st_ino = 0LL;
                  *(void *)&v668.st_uid = v130;
                  *(void *)&v668.st_rdev = 0LL;
                  id v97 = v170;
                  lutimes((const char *)[v97 fileSystemRepresentation], (const timeval *)&v668);
                }

LABEL_350:
                id v86 = v585;
                uint64_t v13 = v580;
                goto LABEL_351;
              }

              if ([*v9 storeCurrentFileInMemory])
              {
                v132 = (void *)objc_claimAutoreleasedReturnValue([*v9 inMemoryFileData]);
                if (!v132) {
                  __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1452,  "_currentState.inMemoryFileData");
                }

                id v97 = (id)objc_claimAutoreleasedReturnValue([*v9 inMemoryFileData]);
              }

              else
              {
                v149 = (void *)objc_claimAutoreleasedReturnValue([v581 stringByAppendingPathComponent:v75]);
                id v619 = 0LL;
                id v97 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v149,  3LL,  &v619));
                id v150 = v619;
                if (!v97)
                {
                  v151 = sub_100004680();
                  v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
                  if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                  {
                    v668.st_dev = v572;
                    *(void *)&v668.st_mode = v149;
                    WORD2(v668.st_ino) = 2112;
                    *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v150;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_ERROR,  "Failed to read fixed stream metadata from %@: %@",  (uint8_t *)&v668,  0x16u);
                  }
                }
              }

              if (!v97) {
                goto LABEL_350;
              }
              id v153 = v97;
              v154 = (unsigned __int8 *)[v153 bytes];
              id v155 = [v153 length];
              if ((unint64_t)v155 < 7 || *(_DWORD *)v154 != 2017879117)
              {
                v156 = sub_100004680();
                v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);
                if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
                {
                  v668.st_dev = v575;
                  *(void *)&v668.st_mode = v155;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_ERROR,  "Got a fixed metadata file that did not match expected content (length %lu). Ignoring.",  (uint8_t *)&v668,  0xCu);
                }

LABEL_163:
                goto LABEL_350;
              }

              id v300 = *v9;
              if (*v9)
              {
                [v300 hashContext];
                id v300 = *v9;
                unsigned __int8 v301 = v605 + 1;
                if (*v9)
                {
                  id v300 = [v300 hashContext];
                  uint64_t v302 = v591;
                  goto LABEL_370;
                }

                __int128 v314 = 0uLL;
              }

              else
              {
                uint64_t v618 = 0LL;
                __int128 v314 = 0uLL;
                __int128 v616 = 0u;
                __int128 v617 = 0u;
                __int128 v614 = 0u;
                __int128 v615 = 0u;
                __int128 v612 = 0u;
                __int128 v613 = 0u;
                __int128 v610 = 0u;
                __int128 v611 = 0u;
                __int128 v608 = 0u;
                __int128 v609 = 0u;
                __int128 v606 = 0u;
                __int128 v607 = 0u;
                unsigned __int8 v301 = 1;
                __int128 v605 = 0u;
              }

              uint64_t v302 = 0LL;
              uint64_t v604 = 0LL;
              __int128 v602 = v314;
              __int128 v603 = v314;
              __int128 v600 = v314;
              __int128 v601 = v314;
              __int128 v598 = v314;
              __int128 v599 = v314;
              __int128 v597 = v314;
              __int128 v595 = v314;
              __int128 v596 = v314;
              __int128 v593 = v314;
              __int128 v594 = v314;
              __int128 v591 = v314;
              __int128 v592 = v314;
LABEL_370:
              uint64_t v319 = qword_10001DB88[v302];
              LOWORD(v664) = v319;
              BOOL v309 = v154[4] == v301;
              a1 = v583;
              if (!v309) {
                goto LABEL_350;
              }
              size_t v320 = (unsigned __int16)v319;
              __chkstk_darwin(v300);
              v322 = (char *)&v563 - v321;
              bzero((char *)&v563 - v321, v320);
              v323 = v154 + 7;
              if (!memcmp(v322, v323, v320))
              {
                v329 = sub_100004680();
                v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v329);
                if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v668.st_dev) = 0;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEBUG,  "Found last chunk partial hash data but the hash was not computed.",  (uint8_t *)&v668,  2u);
                }
              }

              else
              {
                id v324 = sub_100011498(v323, v320);
                v325 = (void *)objc_claimAutoreleasedReturnValue(v324);
                [*v9 setLastChunkPartialHash:v325];

                v326 = sub_100004680();
                v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v326);
                if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
                {
                  v327 = (void *)objc_claimAutoreleasedReturnValue([*v9 lastChunkPartialHash]);
                  v668.st_dev = v573;
                  *(void *)&v668.st_mode = v327;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEBUG,  "Got last chunk partial hash %@",  (uint8_t *)&v668,  0xCu);
                }
              }

              goto LABEL_163;
            }

            if ([*v9 storeCurrentFileInMemory])
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue([*v9 inMemoryFileData]);
              if (!v98) {
                __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1396,  "_currentState.inMemoryFileData");
              }

              unint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([*v9 inMemoryFileData]);
              id v621 = 0LL;
              v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v79,  0LL,  0LL,  &v621));
              id v100 = v621;
              [*v9 setStreamInfoDict:v99];

              v101 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
              if (!v101)
              {
                v102 = v13;
                v103 = sub_100004680();
                v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v668.st_dev) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "Failed to decode stream metadata; entering passthrough mode",
                    (uint8_t *)&v668,
                    2u);
                }

                id v105 = sub_1000105F8(a1, (uint64_t)v627, v12);
                id v86 = (id)objc_claimAutoreleasedReturnValue(v105);

                int v61 = 2;
                uint64_t v13 = v102;
                goto LABEL_361;
              }

              goto LABEL_138;
            }

            unint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v581 stringByAppendingPathComponent:v75]);
            id v119 = (id)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v79));
            if (v119)
            {
              id v620 = 0LL;
              v133 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v119,  0LL,  0LL,  &v620));
              id v100 = v620;
              [*v9 setStreamInfoDict:v133];

              v134 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
              if (v134)
              {

LABEL_138:
                v135 = sub_100004680();
                v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
                if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
                {
                  v315 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
                  v668.st_dev = v573;
                  *(void *)&v668.st_mode = v315;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v136,  OS_LOG_TYPE_DEBUG,  "Got stream metadata: %@",  (uint8_t *)&v668,  0xCu);
                }

                v137 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
                id v97 = (id)objc_claimAutoreleasedReturnValue([v137 objectForKey:@"Version"]);

                if (!v97
                  || (uint64_t v138 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v97, v138) & 1) == 0)
                  || [v97 intValue] != 2)
                {
                  v145 = sub_100004680();
                  v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v668.st_dev) = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_DEFAULT,  "Stream metadata was incompatible version or not present; entering passthrough mode",
                      (uint8_t *)&v668,
                      2u);
                  }

                  id v147 = sub_1000105F8(a1, (uint64_t)v627, v12);
                  id v86 = (id)objc_claimAutoreleasedReturnValue(v147);
                  v148 = (char *)v585;
                  goto LABEL_188;
                }

                [*v9 setUnsureData:0];
                v139 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
                v140 = (os_log_s *)objc_claimAutoreleasedReturnValue([v139 objectForKey:@"RecordCount"]);

                if (v140)
                {
                  uint64_t v141 = objc_opt_class(&OBJC_CLASS___NSNumber);
                  if ((objc_opt_isKindOfClass(v140, v141) & 1) != 0) {
                    objc_msgSend( *v9,  "setTotalRecordCount:",  -[os_log_s unsignedLongLongValue](v140, "unsignedLongLongValue"));
                  }
                }

                v142 = (void *)objc_claimAutoreleasedReturnValue([*v9 streamInfoDict]);
                v143 = (void *)objc_claimAutoreleasedReturnValue([v142 objectForKey:@"TotalUncompressedBytes"]);

                if (v143)
                {
                  uint64_t v144 = objc_opt_class(&OBJC_CLASS___NSNumber);
                  if ((objc_opt_isKindOfClass(v143, v144) & 1) != 0) {
                    objc_msgSend(*v9, "setTotalUncompressedBytes:", objc_msgSend(v143, "unsignedLongLongValue"));
                  }
                }

                goto LABEL_163;
              }

              v295 = v7;
              v296 = sub_100004680();
              v297 = (os_log_s *)objc_claimAutoreleasedReturnValue(v296);
              if (os_log_type_enabled(v297, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v668.st_dev) = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v297,  OS_LOG_TYPE_DEFAULT,  "Failed to decode stream metadata; entering passthrough mode",
                  (uint8_t *)&v668,
                  2u);
              }

              uint64_t v298 = v583;
              id v299 = sub_1000105F8(v583, (uint64_t)v627, v12);
              id v86 = (id)objc_claimAutoreleasedReturnValue(v299);

              id v7 = v295;
              a1 = v298;
            }

            else
            {
              v288 = sub_100004680();
              v289 = (os_log_s *)objc_claimAutoreleasedReturnValue(v288);
              if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
              {
                v668.st_dev = v573;
                *(void *)&v668.st_mode = v79;
                _os_log_impl( (void *)&_mh_execute_header,  v289,  OS_LOG_TYPE_DEFAULT,  "Failed to read stream metadata from %@; entering passthrough mode",
                  (uint8_t *)&v668,
                  0xCu);
              }

              id v290 = sub_1000105F8(a1, (uint64_t)v627, v12);
              id v86 = (id)objc_claimAutoreleasedReturnValue(v290);
              id v100 = v585;
            }

            goto LABEL_343;
          }

          v352 = v13;
          v361 = sub_100010E30(v72);
          v354 = (void *)objc_claimAutoreleasedReturnValue(v361);
          v638[0] = @"SZExtractorFileOffsetErrorKey";
          v362 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
          v638[1] = v579;
          v639[0] = v362;
          v639[1] = v354;
          v356 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v639,  v638,  2LL));

          v363 = sub_100004680();
          v364 = (os_log_s *)objc_claimAutoreleasedReturnValue(v363);
          if (os_log_type_enabled(v364, OS_LOG_TYPE_ERROR))
          {
            id v507 = [*v9 currentCRC32];
            int v508 = sub_1000113D0(*v9);
            v668.st_dev = 134218498;
            *(void *)&v668.st_mode = v507;
            WORD2(v668.st_ino) = 1024;
            *(_DWORD *)((char *)&v668.st_ino + 6) = v508;
            HIWORD(v668.st_uid) = 2112;
            *(void *)&v668.st_gid = v354;
            _os_log_error_impl( (void *)&_mh_execute_header,  v364,  OS_LOG_TYPE_ERROR,  "CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
              (uint8_t *)&v668,
              0x1Cu);
          }

          id v365 = [*v9 currentCRC32];
          sub_1000113D0(*v9);
          id v360 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1372LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v356,  @"CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
                   v366,
                   (uint64_t)v365);
        }

        else
        {
          v352 = v13;
          v353 = sub_100010E30([v69 currentLFRecord]);
          v354 = (void *)objc_claimAutoreleasedReturnValue(v353);
          v640[0] = @"SZExtractorFileOffsetErrorKey";
          v355 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*v9 currentOffset]));
          v640[1] = v579;
          v641[0] = v355;
          v641[1] = v354;
          v356 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v641,  v640,  2LL));

          v357 = sub_100004680();
          v358 = (os_log_s *)objc_claimAutoreleasedReturnValue(v357);
          if (os_log_type_enabled(v358, OS_LOG_TYPE_ERROR))
          {
            id v505 = [*v9 uncompressedBytesOutput];
            uint64_t v506 = sub_100010C1C(*v9);
            v668.st_dev = 138412802;
            *(void *)&v668.st_mode = v354;
            WORD2(v668.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v668.st_ino + 6) = (__darwin_ino64_t)v505;
            HIWORD(v668.st_gid) = 2048;
            *(void *)&v668.st_rdev = v506;
            _os_log_error_impl( (void *)&_mh_execute_header,  v358,  OS_LOG_TYPE_ERROR,  "Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
              (uint8_t *)&v668,
              0x20u);
          }

          [*v9 uncompressedBytesOutput];
          sub_100010C1C(*v9);
          id v360 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]",  1364LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v356,  @"Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
                   v359,
                   (uint64_t)v354);
        }

        uint64_t v367 = objc_claimAutoreleasedReturnValue(v360);

        uint64_t v14 = 0LL;
        id v10 = (id)v367;
LABEL_403:
        uint64_t v13 = v352;
        goto LABEL_518;
      case 4u:
        goto LABEL_70;
      case 5u:
        v368 = (void *)objc_claimAutoreleasedReturnValue([*v9 fileWriter]);
        if (!v368) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1612,  "_currentState.fileWriter");
        }

        objc_msgSend(*v9, "setCurrentOffset:", (char *)objc_msgSend(*v9, "currentOffset") + v12);
        id v369 = *v9;
        v370 = (char *)[*v9 currentOffset];
        id v16 = (id)objc_claimAutoreleasedReturnValue([v369 updateHashFromOffset:&v370[-v12] withBytes:v627 length:v12]);

        if (v16) {
          goto LABEL_469;
        }
        v371 = (void *)objc_claimAutoreleasedReturnValue([*v9 fileWriter]);
        id v586 = 0LL;
        unsigned int v372 = [v371 writeBuffer:v627 length:v626 error:&v586];
        id v10 = v586;

        if (!v372) {
          goto LABEL_481;
        }
        id v26 = *v9;
        goto LABEL_408;
      case 6u:
        if ([*v9 hashedChunkSize])
        {
          v373 = [*v9 hashedChunkSize];
          v374 = [*v9 bytesHashedInChunk];
          if (v373 - v374 < v12) {
            unint64_t v12 = v373 - v374;
          }
        }

        id v375 = *v9;
        id v376 = [*v9 currentOffset];
        id v16 = (id)objc_claimAutoreleasedReturnValue( [v375 updateHashFromOffset:v376 withBytes:v627 length:v12 onlyFinishCurrentChunk:1]);

        objc_msgSend(*v9, "setCurrentOffset:", (char *)objc_msgSend(*v9, "currentOffset") + v12);
        if (v16) {
          goto LABEL_469;
        }
        if (![*v9 bytesHashedInChunk]) {
          goto LABEL_516;
        }
        if (v12 != v626) {
          __assert_rtn( "-[StreamingUnzipper _supplyBytes:length:withReply:]",  "StreamingUnzipper.m",  1645,  "lengthToRead == length");
        }
        goto LABEL_415;
      case 7u:
        goto LABEL_518;
      case 8u:
        goto LABEL_517;
      default:
        v556 = sub_100004680();
        v557 = (os_log_s *)objc_claimAutoreleasedReturnValue(v556);
        if (os_log_type_enabled(v557, OS_LOG_TYPE_ERROR))
        {
          unsigned int v558 = [*v584 streamState];
          v668.st_dev = 67109120;
          *(_DWORD *)&v668.st_mode = v558;
          _os_log_error_impl( (void *)&_mh_execute_header,  v557,  OS_LOG_TYPE_ERROR,  "Invalid unzip state encountered: %hhu",  (uint8_t *)&v668,  8u);
        }

        __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1658, "false");
    }
  }

id sub_1000104FC(uint64_t a1, uint64_t a2, void *a3, const void **a4, size_t *a5)
{
  size_t v9 = *a5;
  id v10 = a3;
  id v11 = [v10 thisStageBytesComplete];
  else {
    size_t v12 = v9;
  }
  memcpy((char *)[v10 thisStageBytesComplete] + a1, *a4, v12);
  objc_msgSend(v10, "setThisStageBytesComplete:", (char *)objc_msgSend(v10, "thisStageBytesComplete") + v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 unsureData]);
  [v13 appendBytes:*a4 length:v12];

  objc_msgSend(v10, "setCurrentOffset:", (char *)objc_msgSend(v10, "currentOffset") + v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "updateHashFromOffset:withBytes:length:",  (char *)objc_msgSend(v10, "currentOffset") - v12,  *a4,  v12));

  if (!v14)
  {
    *a4 = (char *)*a4 + v12;
    *a5 -= v12;
  }

  return v14;
}

id sub_1000105F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) unzipPath]);
  id v7 = *(dispatch_group_s **)(a1 + 96);
  if (v7) {
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([*(id *)(a1 + 64) performingExtraction])
  {
    id v8 = sub_100004700();
    size_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_signpost_enabled(v9))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "EXTRACTION",  "Extraction entered passthrough mode",  (uint8_t *)&buf,  2u);
    }

    [*(id *)(a1 + 64) setPerformingExtraction:0];
  }

  id v10 = sub_100004680();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Beginning passthrough of non-streamable zip file to %@",  (uint8_t *)&buf,  0xCu);
  }

  size_t v12 = sub_100004700();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "PASSTHROUGH_MODE",  "Beginning passthrough of non-streamable zip file to %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v14 removeItemAtPath:v6 error:0];

  id v15 = [*(id *)(a1 + 64) performCachedWrites];
  id v47 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:]( &OBJC_CLASS___StreamingFileWriter,  "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:",  v6,  1537LL,  384LL,  0LL,  v15,  &v47));
  id v17 = v47;
  if (!v16)
  {
    id v28 = sub_100004680();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to open passthrough output file at %@",  (uint8_t *)&buf,  0xCu);
    }

    NSErrorUserInfoKey v52 = NSFilePathErrorKey;
    id v53 = v6;
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    id v32 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]",  196LL,  @"SZExtractorErrorDomain",  1LL,  v17,  v30,  @"Failed to open passthrough output file at %@",  v31,  (uint64_t)v6);
    goto LABEL_33;
  }

  [v16 setIncompleteExtractionAttribute];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) unsureData]);
  int v19 = (char *)[v18 length];

  id v20 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) unsureData]);
  id v46 = v17;
  unsigned __int8 v21 = objc_msgSend(v16, "writeBuffer:length:error:", objc_msgSend(v20, "bytes"), v19, &v46);
  id v22 = v46;

  if ((v21 & 1) != 0)
  {
    if (!a3)
    {
LABEL_16:
      [*(id *)(a1 + 64) setFileWriter:v16];
      [*(id *)(a1 + 64) setCurrentOffset:&v19[a3]];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) updateHashFromOffset:v19 withBytes:a2 length:a3]);

      if (!v24)
      {
        [*(id *)(a1 + 64) setStreamState:5];
        if ((*(_BYTE *)(a1 + 80) & 4) != 0)
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 xpcConnection]);
          id v26 = v25;
          if (v25)
          {
            id v27 = (id)objc_claimAutoreleasedReturnValue([v25 remoteObjectProxy]);
            [v27 extractionEnteredPassThroughMode];
          }

          else
          {
            id v27 = (id)objc_claimAutoreleasedReturnValue([(id)a1 inProcessExtractorDelegate]);
            if (v27)
            {
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessDelegateQueue]);

              if (v42)
              {
                BOOL v43 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessDelegateQueue]);
                *(void *)&__int128 buf = _NSConcreteStackBlock;
                *((void *)&buf + 1) = 3221225472LL;
                int v55 = sub_1000146E0;
                __darwin_ino64_t v56 = &unk_100028C10;
                id v27 = v27;
                id v57 = v27;
                dispatch_async(v43, &buf);
              }
            }
          }
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) serializeState]);
        if (!v24) {
          goto LABEL_35;
        }
      }

LABEL_34:
      sub_10000B078(a1);
      goto LABEL_35;
    }

    id v45 = v22;
    unsigned __int8 v23 = [v16 writeBuffer:a2 length:a3 error:&v45];
    id v17 = v45;

    if ((v23 & 1) != 0)
    {
      id v22 = v17;
      goto LABEL_16;
    }

    int v38 = sub_100004680();
    int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to write remaining initial data to passthrough output file",  (uint8_t *)&buf,  2u);
    }

    NSErrorUserInfoKey v48 = NSFilePathErrorKey;
    id v49 = v6;
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    id v32 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]",  211LL,  @"SZExtractorErrorDomain",  1LL,  v17,  v30,  @"Failed to write remaining initial data to passthrough output file",  v40,  v44);
LABEL_33:
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v32);

    if (!v24) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  id v33 = sub_100004680();
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Failed to write initial data to passthrough output file",  (uint8_t *)&buf,  2u);
  }

  NSErrorUserInfoKey v50 = NSFilePathErrorKey;
  id v51 = v6;
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
  id v37 = sub_100007A7C( (uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]",  205LL,  @"SZExtractorErrorDomain",  1LL,  v22,  v35,  @"Failed to write initial data to passthrough output file",  v36,  v44);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v37);

  if (v24) {
    goto LABEL_34;
  }
LABEL_35:

  return v24;
}

uint64_t sub_100010C1C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 currentLFRecord];
  if (*((_WORD *)[v1 currentLFRecord] + 4)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn( "_GetUncompressedSize",  "StreamingUnzipper.m",  339,  "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 340, "NULL != currentState.dataDescriptor");
    }
    uint64_t v3 = sub_100004AA0((uint64_t)[v1 currentLFRecord], &word_10001DB40, 0x10u);
    unsigned __int8 v4 = [v1 dataDescriptor];
    if (v3) {
      uint64_t v5 = v4[2];
    }
    else {
      uint64_t v5 = *((unsigned int *)v4 + 3);
    }
  }

  else
  {
    uint64_t v5 = sub_100004B14((uint64_t)v2);
  }

  return v5;
}

uint64_t sub_100010D08(void *a1)
{
  id v1 = a1;
  id v2 = (char *)[v1 currentLFRecord];
  if (*((_WORD *)[v1 currentLFRecord] + 4)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn( "_GetCompressedSize",  "StreamingUnzipper.m",  356,  "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 357, "NULL != currentState.dataDescriptor");
    }
    uint64_t v3 = sub_100004AA0((uint64_t)[v1 currentLFRecord], &word_10001DB40, 0x10u);
    unsigned __int8 v4 = [v1 dataDescriptor];
    if (v3) {
      uint64_t v5 = v4[1];
    }
    else {
      uint64_t v5 = *((unsigned int *)v4 + 2);
    }
  }

  else
  {
    uint64_t v5 = *(unsigned int *)(v2 + 18);
    if ((_DWORD)v5 == -1 || *(_DWORD *)(v2 + 22) == -1)
    {
      uint64_t v6 = sub_100004AA0((uint64_t)v2, &word_10001DB40, 0x10u);
      if (v6)
      {
        if (*(_WORD *)(v6 + 2) == 16) {
          uint64_t v5 = *(void *)(v6 + 12);
        }
      }
    }
  }

  return v5;
}

NSString *sub_100010E30(_WORD *a1)
{
  size_t v2 = (unsigned __int16)a1[13];
  uint64_t v3 = (unsigned __int8 *)calloc(v2 + 1, 1uLL);
  memcpy(v3, a1 + 15, v2);
  if (!v3)
  {
    id v11 = sub_100004680();
    size_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to get name from local file record.",  buf,  2u);
    }

    return (NSString *)0LL;
  }

  uint64_t v4 = 0LL;
  char v5 = 0;
  int v6 = 0;
  int v7 = 0;
  do
  {
    int v8 = v3[v4];
    if ((char)v3[v4] < 0)
    {
      char v5 = 1;
    }

    else if (v2 != v4 && !v3[v4])
    {
      uint64_t v14 = sub_100004680();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315650;
        unsigned __int8 v30 = v3;
        __int16 v31 = 2048;
        size_t v32 = v2;
        __int16 v33 = 2048;
        uint64_t v34 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Found NUL in path %s length %zu at %zu",  buf,  0x20u);
      }

LABEL_43:
      id v10 = 0LL;
      goto LABEL_66;
    }

    switch(v7)
    {
      case 0:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 1;
        }
        break;
      case 1:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 2;
        }
        break;
      case 2:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 47) {
          int v9 = 1;
        }
        else {
          int v9 = v6;
        }
        if (v3[v4])
        {
          int v6 = v9;
        }

        else
        {
          int v7 = 0;
          int v6 = 1;
        }

        break;
      case 3:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        break;
      default:
        break;
    }

    ++v4;
  }

  while (v2 + 1 != v4);
  if ((v5 & 1) != 0)
  {
    if (!(((a1[3] & 0x800) == 0) | v6 & 1))
    {
LABEL_36:
      id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v3,  v2,  4LL);
      goto LABEL_66;
    }
  }

  else if ((v6 & 1) == 0)
  {
    goto LABEL_36;
  }

  id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v3,  v2,  4LL);
  if (!v10)
  {
    id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v3,  v2,  +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding"));
    if (!v10)
    {
      id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v3,  v2,  CFStringConvertEncodingToNSStringEncoding(0x600u));
      if (!v10)
      {
        id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v3,  v2,  CFStringConvertEncodingToNSStringEncoding(0x400u));
        if (!v10)
        {
          uint64_t v25 = sub_100004680();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136315138;
            unsigned __int8 v30 = v3;
            _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to convert path to string: %s",  buf,  0xCu);
          }

          goto LABEL_43;
        }
      }
    }
  }

  if ((v6 & 1) != 0)
  {
    id v28 = v10;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v10, "componentsSeparatedByString:", @"/"));
    id v17 = [v27 mutableCopy];
    id v18 = (char *)[v17 count];
    if (v18)
    {
      int v19 = v18;
      for (i = 0LL; i != v19; ++i)
      {
        id v21 = [v17 count];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = 0LL;
          while (1)
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:v23]);
            if (v23
              && (([v24 isEqualToString:@"."] & 1) != 0
               || [v24 isEqualToString:&stru_10002A2C8]))
            {
              goto LABEL_62;
            }

            if (v22 == (id)++v23) {
              goto LABEL_64;
            }
          }

          [v17 removeObjectAtIndex:v23];
          if (!v23) {
            goto LABEL_63;
          }
          --v23;
LABEL_62:
          [v17 removeObjectAtIndex:v23];
LABEL_63:
        }

LABEL_64:
        ;
      }
    }

    id v10 = (NSString *)objc_claimAutoreleasedReturnValue([v17 componentsJoinedByString:@"/"]);
  }

LABEL_66:
  free(v3);
  return v10;
}

void sub_1000112B0(uint64_t a1, double a2)
{
  if ((*(_BYTE *)(a1 + 80) & 1) != 0 && a2 - *(double *)(a1 + 88) >= 0.00999999978)
  {
    *(double *)(a1 + 8_Block_object_dispose((const void *)(v30 - 176), 8) = a2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 xpcConnection]);
    char v5 = v4;
    if (v4)
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);
      [v6 setExtractionProgress:a2];
    }

    else
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessExtractorDelegate]);
      if (v6)
      {
        int v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessDelegateQueue]);

        if (v7)
        {
          int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 inProcessDelegateQueue]);
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472LL;
          v9[2] = sub_1000115F0;
          v9[3] = &unk_100028BC0;
          id v10 = v6;
          double v11 = a2;
          dispatch_async(v8, v9);
        }
      }
    }
  }

uint64_t sub_1000113D0(void *a1)
{
  id v1 = a1;
  size_t v2 = (char *)[v1 currentLFRecord];
  if ([v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn( "_GetCRC32",  "StreamingUnzipper.m",  322,  "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 323, "NULL != currentState.dataDescriptor");
    }
    sub_100004AA0((uint64_t)[v1 currentLFRecord], &word_10001DB40, 0x10u);
    uint64_t v3 = (unsigned int *)((char *)[v1 dataDescriptor] + 4);
  }

  else
  {
    uint64_t v3 = (unsigned int *)(v2 + 14);
  }

  uint64_t v4 = *v3;

  return v4;
}

id sub_100011498(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  for (i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", a2));
        v2;
        --v2)
  {
    unsigned int v5 = *a1++;
    objc_msgSend(i, "appendFormat:", @"%02x", v5);
  }

  return i;
}

uint64_t sub_10001150C(const char *a1, int a2, int *a3)
{
  int v6 = strndup(a1, 0x400uLL);
  __stringp = v6;
  if (!v6) {
    return 0LL;
  }
  int v7 = v6;
  if (*v6 == 47 || !*a1)
  {
LABEL_14:
    uint64_t v9 = 0LL;
    goto LABEL_15;
  }

  while (1)
  {
    int v8 = strsep(&__stringp, "/");
    if (!v8) {
      break;
    }
    if (*v8)
    {
      if (*v8 != 46) {
        goto LABEL_10;
      }
      if (v8[1])
      {
        if (v8[1] == 46 && !v8[2])
        {
          --a2;
          goto LABEL_11;
        }

LABEL_10:
        ++a2;
      }
    }

LABEL_11:
    if (a2 < 1) {
      goto LABEL_14;
    }
  }

  *a3 = a2;
  uint64_t v9 = 1LL;
LABEL_15:
  free(v7);
  return v9;
}

id sub_1000115E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionCompleteAtArchivePath:*(void *)(a1 + 40)];
}

id sub_1000115F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExtractionProgress:*(double *)(a1 + 40)];
}

LABEL_25:
  return (int)v18 >= 0;
}

LABEL_19:
  if (((v19 | !v13) & 1) == 0)
  {
    uint64_t v25 = sub_100004700();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_DWORD *)__int128 buf = 138412546;
      unsigned __int8 v30 = v9;
      __int16 v31 = 2048;
      size_t v32 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_FILE_QUEUE_FULL",  "Insufficient buffer avilable for %@ size %lld",  buf,  0x16u);
    }
  }

  *a6 = v17;

  return v20;
}

id sub_1000145B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runOperation:*(void *)(a1 + 40)];
}

id sub_1000145C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runOperation:*(void *)(a1 + 40)];
}

void sub_100014688(_Unwind_Exception *a1)
{
}

void sub_10001469C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  byte_10002F3B8 = [v1 BOOLForKey:@"PerformAllWritesSynchronously"];
}

id sub_1000146E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionEnteredPassThroughMode];
}

LABEL_18:
      free(self->_currentLFRecord);
      self->_currentLFRecord = 0LL;
      break;
    default:
      break;
  }

  self->_streamState = v3;
  -[StreamingUnzipState markResumptionPoint](self, "markResumptionPoint");
}

LABEL_24:
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_uncompressedBytesOutput));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v25, @"CurrentOutputFileOffset");

  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalFileSizeWritten));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v26, @"TotalFileSizeWritten");

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  self->_currentCRC32));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v27, @"CurrentCRC32");

  state = self->_cmpState.state;
  if (state)
  {
    id v29 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  state,  compression_stream_get_state_size(&self->_cmpState),  0LL);
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v30, @"SerializedCompressionState");
  }

  -[NSData encodeBool:forKey:](v9, "encodeBool:forKey:", self->_fileWriter != 0LL, @"OpenCurrentOutputFile");
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_recordsProcessed));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v31, @"RecordsProcessed");

  size_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  self->_currentLFMode));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v32, @"LocalFileMode");

  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  self->_streamState));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v33, @"StreamState");

  -[NSData encodeBool:forKey:]( v9,  "encodeBool:forKey:",  self->_storeCurrentFileInMemory,  @"StoreCurrentFileInMemory");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSData encodedData](v9, "encodedData"));
  id v35 = (char *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_unzipPath,  "stringByAppendingPathComponent:",  @"com.apple.StreamingUnzipResumptionData"));
  uint64_t v36 = sub_100004680();
  id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  int v38 = v37;
  if (!v34)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v90 = v35;
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failed to create archive for resumption data to path %@",  buf,  0xCu);
    }

    v81 = NSFilePathErrorKey;
    __int128 v82 = v35;
    __int128 v41 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v82,  &v81,  1LL));
    uint64_t v63 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState serializeState]",  424LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v41,  @"Failed to create archive for resumption data to path %@",  v62,  (uint64_t)v35);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v63);
    goto LABEL_46;
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v72 = (const char *)[v34 length];
    currentOffset = self->_currentOffset;
    *(_DWORD *)__int128 buf = 134218240;
    v90 = v72;
    v91 = 2048;
    v92 = currentOffset;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Serializing %lu bytes of resumption data for offset %llu",  buf,  0x16u);
  }

  __int16 v76 = 0LL;
  int v39 = 1;
  uint64_t v40 = [v34 writeToFile:v35 options:1 error:&v76];
  __int128 v41 = v76;
  if ((v40 & 1) == 0)
  {
    __int128 v42 = sub_100004680();
    BOOL v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      v90 = v35;
      v91 = 2112;
      v92 = (unint64_t)v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Failed to save resumption data to path %@: %@",  buf,  0x16u);
    }

    unint64_t v79 = NSFilePathErrorKey;
    v80 = v35;
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
    id v46 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState serializeState]",  431LL,  @"SZExtractorErrorDomain",  1LL,  v41,  v44,  @"Failed to save resumption data to path %@: %@",  v45,  (uint64_t)v35);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v46);

LABEL_46:
    int v39 = 0;
  }

  if (v39) {
    return 0LL;
  }
  return v2;
}

id sub_100015F8C(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = a1 + 128;
  uint64_t v5 = qword_10001DB88[*(unsigned int *)(a1 + 128)];
  sub_100004A48(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)], a1 + 128);
  id v6 = sub_100011498(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = *(void *)(v4 - 72);
  if (v8) {
    unint64_t v9 = a2 / v8;
  }
  else {
    unint64_t v9 = 0LL;
  }
  if (v9 >= (unint64_t)[*(id *)(a1 + 96) count])
  {
    v37[0] = @"SZExtractorFileOffsetErrorKey";
    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2));
    v38[0] = v19;
    v38[1] = v7;
    v37[1] = @"SZExtractorActualHashValueErrorKey";
    v37[2] = @"SZExtractorHashChunkIndexErrorKey";
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
    v38[2] = v20;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));

    id v21 = sub_100004680();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v28 = [*(id *)(a1 + 96) count];
      *(_DWORD *)__int128 buf = 134218240;
      unint64_t v30 = v9;
      __int16 v31 = 2048;
      unint64_t v32 = (unint64_t)v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
        buf,
        0x16u);
    }

    [*(id *)(a1 + 96) count];
    id v24 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState _checkHashForOffset:]",  457LL,  @"SZExtractorErrorDomain",  4LL,  0LL,  v10,  @"Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
            v23,
            v9);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v24);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 96) objectAtIndex:v9]);
    if ([v10 caseInsensitiveCompare:v7])
    {
      v35[0] = @"SZExtractorFileOffsetErrorKey";
      double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2));
      v36[0] = v11;
      v36[1] = v7;
      v35[1] = @"SZExtractorActualHashValueErrorKey";
      v35[2] = @"SZExtractorHashChunkIndexErrorKey";
      size_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
      v36[2] = v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));

      uint64_t v14 = sub_100004680();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134218498;
        unint64_t v30 = a2;
        __int16 v31 = 2112;
        unint64_t v32 = (unint64_t)v10;
        __int16 v33 = 2112;
        uint64_t v34 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Hash mismatch for chunk containing offset %llu: expected %@, got %@",  buf,  0x20u);
      }

      id v17 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState _checkHashForOffset:]",  466LL,  @"SZExtractorErrorDomain",  4LL,  0LL,  v13,  @"Hash mismatch for chunk containing offset %llu: expected %@, got %@",  v16,  a2);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    }

    else
    {
      uint64_t v25 = sub_100004680();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 134218498;
        unint64_t v30 = a2;
        __int16 v31 = 2048;
        unint64_t v32 = v9;
        __int16 v33 = 2112;
        uint64_t v34 = v10;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Verified that hashed data offset %llu matches index %llu: %@",  buf,  0x20u);
      }

      id v18 = 0LL;
    }
  }

  return v18;
}

char *sub_100016470(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    __darwin_ino64_t v56 = 0LL;
    goto LABEL_42;
  }

  if (a4) {
    *a4 = 0LL;
  }
  v312.receiver = a1;
  v312.super_class = (Class)&OBJC_CLASS___StreamingUnzipState;
  unint64_t v9 = (char *)objc_msgSendSuper2(&v312, "init");

  if (!v9)
  {
    id v51 = sub_100004680();
    NSErrorUserInfoKey v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to init", buf, 2u);
    }

    id v54 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  856LL,  NSPOSIXErrorDomain,  12LL,  0LL,  0LL,  @"Failed to init",  v53,  v270);
    int v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    id v49 = v55;
    if (a4)
    {
      id v50 = v55;
      id v49 = v50;
      unint64_t v9 = 0LL;
      goto LABEL_38;
    }

    unint64_t v9 = 0LL;
LABEL_40:
    __darwin_ino64_t v56 = 0LL;
    goto LABEL_41;
  }

  id v10 = v8;
  double v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
  if (sub_100018E38(v10, @"SZExtractorOptionsHashType", v11)
    && (size_t v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSArray),
        sub_100018E38(v10, @"SZExtractorOptionsHashesArray", v12))
    && (uint64_t v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSNumber),
        sub_100018E38(v10, @"SZExtractorOptionsHashedChunkSize", v13))
    && (uint64_t v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSNumber),
        sub_100018E38(v10, @"SZExtractorOptionsDenyInvalidSymlinks", v14))
    && (id v15 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSNumber),
        sub_100018E38(v10, @"SZExtractorOptionsPerformCachedWrites", v15))
    && (uint64_t v16 = &CC_MD5_Final_ptr,
        id v17 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSDictionary),
        sub_100018E38(v10, @"SZExtractorOptionsQuarantineInfo", v17))
    && (id v18 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSNumber),
        (sub_100018E38(v10, @"SZExtractorOptionsOwnerUserID", v18) & 1) != 0))
  {
    int v19 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSNumber);
    char v20 = sub_100018E38(v10, @"SZExtractorOptionsOwnerGroupID", v19);

    if ((v20 & 1) != 0)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SZ_stringByDeletingTrailingSlashes"));
      id v22 = (void *)*((void *)v9 + 11);
      *((void *)v9 + 11) = v21;

      uint64_t v23 = (void *)*((void *)v9 + 49);
      *((void *)v9 + 49) = 0LL;

      *((void *)v9 + 15) = 30LL;
      id v24 = calloc(1uLL, 0x1EuLL);
      *((void *)v9 + 47) = v24;
      if (!v24)
      {
        v58 = sub_100004680();
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "Could not allocate memory for local file record",  buf,  2u);
        }

        NSErrorDomain v61 = NSPOSIXErrorDomain;
        uint64_t v62 = @"Could not allocate memory for local file record";
        uint64_t v63 = 879LL;
        uint64_t v64 = 12LL;
        goto LABEL_54;
      }

      uint64_t v25 = objc_opt_new(&OBJC_CLASS___NSMutableData);
      id v26 = (void *)*((void *)v9 + 45);
      *((void *)v9 + 45) = v25;

      id v27 = objc_opt_new(&OBJC_CLASS___NSMutableData);
      id v28 = (void *)*((void *)v9 + 46);
      *((void *)v9 + 46) = v27;

      id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SZExtractorOptionsHashedChunkSize"]);
      *((void *)v9 + 7) = [v29 unsignedLongLongValue];

      uint64_t v30 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SZExtractorOptionsHashesArray"]);
      __int16 v31 = (void *)*((void *)v9 + 12);
      *((void *)v9 + 12) = v30;

      if ((unint64_t)[*((id *)v9 + 12) count] >= 2 && !*((void *)v9 + 7))
      {
        id v67 = sub_100004680();
        uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "Ambiguous chunk size (hashes > 1 but chunkSize == 0)",  buf,  2u);
        }

        NSErrorDomain v61 = NSPOSIXErrorDomain;
        uint64_t v62 = @"Ambiguous chunk size (hashes > 1 but chunkSize == 0)";
        uint64_t v63 = 890LL;
        goto LABEL_53;
      }

      if (![*((id *)v9 + 12) count] && *((void *)v9 + 7))
      {
        v65 = sub_100004680();
        uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Hash chunk size given as > 0, but no hashes",  buf,  2u);
        }

        NSErrorDomain v61 = NSPOSIXErrorDomain;
        uint64_t v62 = @"Hash chunk size given as > 0, but no hashes";
        uint64_t v63 = 895LL;
LABEL_53:
        uint64_t v64 = 22LL;
LABEL_54:
        id v69 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  v63,  v61,  v64,  0LL,  0LL,  v62,  v60,  v270);
        id v49 = (id)objc_claimAutoreleasedReturnValue(v69);
        id v70 = 0LL;
        unsigned int v71 = 0LL;
LABEL_70:
        -[NSKeyedUnarchiver finishDecoding](v71, "finishDecoding");
        if (v49)
        {
          if (a4) {
            *a4 = v49;
          }

          unint64_t v9 = 0LL;
        }

        unint64_t v9 = v9;

        __darwin_ino64_t v56 = v9;
        goto LABEL_41;
      }

      unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SZExtractorOptionsDenyInvalidSymlinks"]);
      v9[453] = [v32 BOOLValue];

      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SZExtractorOptionsPerformCachedWrites"]);
      v9[454] = [v33 BOOLValue];

      if (v9[454])
      {
        uint64_t v34 = sub_100004680();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)size_t v320 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Performing cached writes to extraction under %@",  buf,  0xCu);
        }
      }

      id v311 = 0LL;
      id v36 = sub_100018F78(&v311);
      id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      id v286 = v311;
      if (!v37)
      {
        int v38 = sub_100004680();
        int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)size_t v320 = v286;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch current group access list, falling back to always calling chown: %@",  buf,  0xCu);
        }

        id v286 = 0LL;
        id v37 = 0LL;
        uint64_t v16 = &CC_MD5_Final_ptr;
      }

      id v282 = v37;
      objc_storeStrong((id *)v9 + 57, v37);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerUserID"]);
      if (v40)
      {
        if (getuid())
        {
          __int128 v41 = sub_100004680();
          __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uid_t v43 = getuid();
            *(_DWORD *)__int128 buf = 67109120;
            *(_DWORD *)size_t v320 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Use of SZExtractorOptionsOwnerUserID requires the caller to be running as root, but it was running as uid %d; ignoring.",
              buf,
              8u);
          }
        }

        else
        {
          v72 = -[NSNumber initWithUnsignedInt:]( [NSNumber alloc],  "initWithUnsignedInt:",  [v40 unsignedIntValue]);
          __int128 v42 = (os_log_s *)*((void *)v9 + 13);
          *((void *)v9 + 13) = v72;
        }

        uint64_t v16 = &CC_MD5_Final_ptr;
      }

      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerGroupID"]);
      if (v73)
      {
        v74 = objc_alloc(&OBJC_CLASS___NSNumber);
        id v75 = [v73 unsignedIntValue];
        __int16 v76 = v74;
        uint64_t v16 = &CC_MD5_Final_ptr;
        id v77 = -[NSNumber initWithUnsignedInt:](v76, "initWithUnsignedInt:", v75);
        id v78 = (void *)*((void *)v9 + 14);
        *((void *)v9 + 14) = v77;
      }

      id v79 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SZExtractorOptionsHashType"]);
      v80 = v79;
      __errnum = (unsigned int *)(v9 + 128);
      if ([v80 isEqualToString:@"SZExtractorHashTypeSHA1"])
      {
        int v81 = 1;
      }

      else if ([v80 isEqualToString:@"SZExtractorHashTypeSHA224"])
      {
        int v81 = 4;
      }

      else if ([v80 isEqualToString:@"SZExtractorHashTypeSHA256"])
      {
        int v81 = 5;
      }

      else if ([v80 isEqualToString:@"SZExtractorHashTypeSHA384"])
      {
        int v81 = 6;
      }

      else
      {
        if (([v80 isEqualToString:@"SZExtractorHashTypeSHA512"] & 1) == 0)
        {
          v161 = sub_100004680();
          uint64_t v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
          if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)size_t v320 = v80;
            _os_log_error_impl( (void *)&_mh_execute_header,  v162,  OS_LOG_TYPE_ERROR,  "Unsupported hash type: %@. Defaulting to MD5",  buf,  0xCu);
          }

LABEL_61:
          int v81 = 0;
          goto LABEL_62;
        }

        int v81 = 7;
      }

LABEL_160:
              uint64_t v167 = objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodePropertyListForKey:]( v71,  "decodePropertyListForKey:",  @"StreamInfoDict"));
              id v168 = (void *)*((void *)v9 + 43);
              *((void *)v9 + 43) = v167;

              v169 = (void *)*((void *)v9 + 43);
              if (v169)
              {
                v170 = (void *)objc_claimAutoreleasedReturnValue([v169 objectForKeyedSubscript:@"RecordCount"]);
                *((void *)v9 + 53) = [v170 unsignedLongLongValue];

                uint64_t v171 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)v9 + 43) objectForKeyedSubscript:@"TotalUncompressedBytes"]);
                *((void *)v9 + 54) = [v171 unsignedLongLongValue];
              }

              id v172 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  @"LastChunkPartialHash");
              uint64_t v173 = objc_claimAutoreleasedReturnValue(v172);
              id v174 = (void *)*((void *)v9 + 44);
              *((void *)v9 + 44) = v173;

              id v175 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSData),  @"UnsureData");
              unsigned __int8 v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
              id v177 = [v176 mutableCopy];
              id v178 = (void *)*((void *)v9 + 45);
              *((void *)v9 + 45) = v177;

              id v179 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSData),  @"InMemoryFileData");
              v180 = (void *)objc_claimAutoreleasedReturnValue(v179);
              id v181 = [v180 mutableCopy];
              uint64_t v182 = (void *)*((void *)v9 + 46);
              *((void *)v9 + 46) = v181;

              size_t __n = 0LL;
              unsigned int v71 = v71;
              v183 = -[NSKeyedUnarchiver decodeBytesForKey:returnedLength:]( v71,  "decodeBytesForKey:returnedLength:",  @"LocalFileRecord",  &__n);
              if (v183)
              {
                size_t v184 = __n;
                if (__n)
                {
                  unint64_t v185 = v183;
                  __darwin_ino64_t v186 = (void *)*((void *)v9 + 47);
                  if (*((void *)v9 + 15) < __n)
                  {
                    __darwin_ino64_t v186 = reallocf(v186, __n);
                    *((void *)v9 + 47) = v186;
                    if (!v186)
                    {
                      v240 = sub_100004680();
                      v241 = (os_log_s *)objc_claimAutoreleasedReturnValue(v240);
                      if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v241,  OS_LOG_TYPE_ERROR,  "Could not allocate memory for local file record",  buf,  2u);
                      }

                      id v227 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1160LL,  NSPOSIXErrorDomain,  12LL,  0LL,  0LL,  @"Could not allocate memory for local file record",  v242,  v270);
LABEL_230:
                      id v143 = (id)objc_claimAutoreleasedReturnValue(v227);
                      goto LABEL_193;
                    }

                    size_t v184 = __n;
                    *((void *)v9 + 15) = __n;
                  }

                  memcpy(v186, v185, v184);
                }
              }

              v9[452] = (*(_BYTE *)(*((void *)v9 + 47) + 6LL) & 8) != 0;
              size_t __n = 0LL;
              unsigned int v71 = v71;
              if (-[NSKeyedUnarchiver decodeBytesForKey:returnedLength:]( v71,  "decodeBytesForKey:returnedLength:",  @"DataDescriptorUnion",  &__n)
                && __n)
              {
                *((void *)v9 + 4_Block_object_dispose((const void *)(v30 - 176), 8) = calloc(1uLL, 0x18uLL);
                __memcpy_chk();
              }

              id v187 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"StageBytesComplete");
              v188 = (void *)objc_claimAutoreleasedReturnValue(v187);
              *((void *)v9 + 50) = [v188 unsignedLongLongValue];

              *((void *)v9 + 51) = v287;
              id v189 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"StreamState");
              id v190 = (void *)objc_claimAutoreleasedReturnValue(v189);
              v9[450] = [v190 unsignedCharValue];

              id v191 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"CurrentCRC32");
              v192 = (void *)objc_claimAutoreleasedReturnValue(v191);
              *((void *)v9 + 55) = [v192 unsignedLongValue];

              id v193 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"RecordsProcessed");
              v194 = (void *)objc_claimAutoreleasedReturnValue(v193);
              *((void *)v9 + 52) = [v194 unsignedShortValue];

              id v195 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"LocalFileMode");
              int v196 = (void *)objc_claimAutoreleasedReturnValue(v195);
              *((_WORD *)v9 + 224) = (unsigned __int16)[v196 unsignedShortValue] & 0xF1FF;

              v9[451] = -[NSKeyedUnarchiver decodeBoolForKey:]( v71,  "decodeBoolForKey:",  @"StoreCurrentFileInMemory");
              *((void *)v9 + 6) = *((void *)v9 + 51);
              id v197 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"CurrentOutputFileOffset");
              v198 = (void *)objc_claimAutoreleasedReturnValue(v197);
              *((void *)v9 + 9) = [v198 unsignedLongLongValue];

              id v199 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"TotalFileSizeWritten");
              v200 = (void *)objc_claimAutoreleasedReturnValue(v199);
              *((void *)v9 + 10) = [v200 unsignedLongLongValue];

              uint64_t v201 = (_WORD *)*((void *)v9 + 47);
              if (v201)
              {
                id v202 = sub_100010E30(v201);
                uint64_t v203 = objc_claimAutoreleasedReturnValue(v202);
                if (!v203)
                {
                  uint64_t v235 = sub_100004680();
                  id v236 = (os_log_s *)objc_claimAutoreleasedReturnValue(v235);
                  if (os_log_type_enabled(v236, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v236,  OS_LOG_TYPE_ERROR,  "Failed to get path from current local file record.",  buf,  2u);
                  }

                  NSErrorUserInfoKey v315 = NSFilePathErrorKey;
                  v316 = v280;
                  v237 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v316,  &v315,  1LL));
                  id v239 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1202LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v237,  @"Failed to get path from current local file record.",  v238,  v270);
                  id v215 = (id)objc_claimAutoreleasedReturnValue(v239);

                  v152 = v49;
                  goto LABEL_247;
                }

                v152 = (void *)v203;
                __errnumb = (void *)objc_claimAutoreleasedReturnValue([v280 stringByAppendingPathComponent:v203]);
                v204 = sub_100004680();
                uint64_t v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);
                if (os_log_type_enabled(v205, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v262 = *((void *)v9 + 9);
                  *(_DWORD *)__int128 buf = 138412546;
                  *(void *)size_t v320 = __errnumb;
                  *(_WORD *)&v320[8] = 2048;
                  *(void *)uint64_t v321 = v262;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v205,  OS_LOG_TYPE_DEBUG,  "Resuming %@ at offset %lld",  buf,  0x16u);
                }

                if (-[NSKeyedUnarchiver decodeBoolForKey:](v71, "decodeBoolForKey:", @"OpenCurrentOutputFile"))
                {
                  uint64_t v206 = v9[454];
                  id v289 = v49;
                  uint64_t v207 = objc_claimAutoreleasedReturnValue( +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:]( &OBJC_CLASS___StreamingFileWriter,  "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:",  __errnumb,  2LL,  0LL,  0LL,  v206,  &v289));
                  id v288 = v289;

                  v208 = (void *)*((void *)v9 + 49);
                  *((void *)v9 + 49) = v207;

                  if (!*((void *)v9 + 49))
                  {
                    uint64_t v254 = sub_100004680();
                    v255 = (os_log_s *)objc_claimAutoreleasedReturnValue(v254);
                    if (os_log_type_enabled(v255, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)__int128 buf = 138412290;
                      *(void *)size_t v320 = __errnumb;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v255,  OS_LOG_TYPE_ERROR,  "Failed to open output file at path %@",  buf,  0xCu);
                    }

                    NSErrorUserInfoKey v313 = NSFilePathErrorKey;
                    __int128 v314 = __errnumb;
                    id v49 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v314,  &v313,  1LL));
                    id v257 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1213LL,  @"SZExtractorErrorDomain",  1LL,  v288,  v49,  @"Failed to open output file at path %@",  v256,  (uint64_t)__errnumb);
                    goto LABEL_244;
                  }

                  id v49 = v288;
                }

                int v209 = *(unsigned __int16 *)(*((void *)v9 + 47) + 8LL);
                if (v209 != 8 && v209 != 99 && v209 != 14)
                {
LABEL_185:
                  if (!*((void *)v9 + 9)
                    || (v213 = (void *)*((void *)v9 + 49)) == 0LL
                    || (unsigned __int8 v214 = objc_msgSend(v213, "setCurrentOffset:error:"),
                        id v215 = v49,
                        v49,
                        id v49 = v215,
                        (v214 & 1) != 0))
                  {

LABEL_194:
LABEL_195:

                    uint64_t v218 = v272;
LABEL_196:

                    goto LABEL_69;
                  }

                  goto LABEL_246;
                }

                id v210 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v71,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSData),  @"SerializedCompressionState");
                id v288 = (id)objc_claimAutoreleasedReturnValue(v210);
                if (!v288)
                {
                  id v244 = sub_100004680();
                  unsigned int v245 = (os_log_s *)objc_claimAutoreleasedReturnValue(v244);
                  if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v245,  OS_LOG_TYPE_ERROR,  "Failed to get serialized compression state from save data",  buf,  2u);
                  }

                  id v247 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1222LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Failed to get serialized compression state from save data",  v246,  v270);
                  id v215 = (id)objc_claimAutoreleasedReturnValue(v247);
                  id v288 = 0LL;
                  goto LABEL_245;
                }

                id v211 = [v288 length];
                v212 = malloc((size_t)v211);
                [v288 getBytes:v212 length:v211];
                if (compression_stream_is_state_valid(v212))
                {
                  *((void *)v9 + 5) = v212;

                  goto LABEL_185;
                }

                v259 = sub_100004680();
                v260 = (os_log_s *)objc_claimAutoreleasedReturnValue(v259);
                if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v260,  OS_LOG_TYPE_ERROR,  "Compression save state was not valid.",  buf,  2u);
                }

                id v257 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1231LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Compression save state was not valid.",  v261,  v270);
LABEL_244:
                id v215 = (id)objc_claimAutoreleasedReturnValue(v257);
LABEL_245:

LABEL_246:
LABEL_247:
                id v49 = v215;
                goto LABEL_194;
              }

              id v224 = sub_100004680();
              v225 = (os_log_s *)objc_claimAutoreleasedReturnValue(v224);
              if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138412290;
                *(void *)size_t v320 = v280;
                _os_log_error_impl( (void *)&_mh_execute_header,  v225,  OS_LOG_TYPE_ERROR,  "Invalid state in resumption data at path %@",  buf,  0xCu);
              }

              id v227 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1377LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Invalid state in resumption data at path %@",  v226,  (uint64_t)v280);
              goto LABEL_230;
            }

            v216 = sub_100004680();
            unsigned __int8 v217 = (os_log_s *)objc_claimAutoreleasedReturnValue(v216);
            if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
            {
              id v258 = [*((id *)v9 + 12) count];
              *(_DWORD *)__int128 buf = 134218240;
              *(void *)size_t v320 = v108;
              *(_WORD *)&v320[8] = 2048;
              *(void *)uint64_t v321 = v258;
              _os_log_error_impl( (void *)&_mh_execute_header,  v217,  OS_LOG_TYPE_ERROR,  "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            id v291 = v49;
            sub_100018718(v280, &v291);
            id v147 = v291;
          }

          else
          {
            unsigned int v144 = v104;
            v145 = sub_100004680();
            v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);
            if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 67109634;
              *(_DWORD *)size_t v320 = v144;
              *(_WORD *)&v320[4] = 1024;
              *(_DWORD *)&v320[6] = 8;
              *(_WORD *)uint64_t v321 = 2112;
              *(void *)&v321[2] = v280;
              _os_log_error_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_ERROR,  "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            id v293 = v49;
            sub_100018718(v280, &v293);
            id v147 = v293;
          }

          id v143 = v147;
LABEL_193:
          v152 = v49;
          id v49 = v143;
          goto LABEL_194;
        }

        NSErrorDomain v139 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v99 domain]);
        if (NSCocoaErrorDomain == v139)
        {
          id v148 = [v274 code];

          if (v148 == (id)260)
          {
LABEL_138:
            v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v297 = v286;
            v152 = (void *)objc_claimAutoreleasedReturnValue([v151 contentsOfDirectoryAtPath:v280 error:&v297]);
            id v153 = v297;

            if (v152 && ![v152 count])
            {
              id v49 = 0LL;
            }

            else
            {
              id v296 = v153;
              sub_100018718(v280, &v296);
              id v49 = v296;
            }

            id v271 = 0LL;
            unsigned int v71 = 0LL;
            goto LABEL_194;
          }
        }

        else
        {
        }

        v149 = sub_100004680();
        id v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)size_t v320 = v97;
          *(_WORD *)&v320[8] = 2112;
          *(void *)uint64_t v321 = v274;
          _os_log_error_impl( (void *)&_mh_execute_header,  v150,  OS_LOG_TYPE_ERROR,  "Failed to read resumption data from path %@: %@; starting from offset 0",
            buf,
            0x16u);
        }

        goto LABEL_138;
      }

      off_t st_size = v310.st_size;
      id v115 = v82;
      ssize_t v116 = getxattr( (const char *)[v115 fileSystemRepresentation],  "com.apple.StreamingPassthroughResumptionData",  0,  0,  0,  1);
      if (v116 == -1)
      {
        if (*__error() == 2 || *__error() == 93)
        {
          id v307 = v286;
          sub_100018718(v115, &v307);
          id v49 = v307;

          goto LABEL_68;
        }

        uint64_t __errnuma = *__error();
        uint64_t v158 = sub_100004680();
        v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          uint64_t v243 = strerror(__errnuma);
          *(_DWORD *)__int128 buf = 136315650;
          *(void *)size_t v320 = "com.apple.StreamingPassthroughResumptionData";
          *(_WORD *)&v320[8] = 2112;
          *(void *)uint64_t v321 = v115;
          *(_WORD *)&v321[8] = 2080;
          v322 = v243;
          _os_log_error_impl( (void *)&_mh_execute_header,  v159,  OS_LOG_TYPE_ERROR,  "Failed to get size of xattr %s from path %@: %s",  buf,  0x20u);
        }

        NSErrorUserInfoKey v324 = NSFilePathErrorKey;
        id v325 = v115;
        id v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v325,  &v324,  1LL));
        strerror(__errnuma);
        id v88 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  976LL,  NSPOSIXErrorDomain,  __errnuma,  0LL,  v86,  @"Failed to get size of xattr %s from path %@: %s",  v160,  (uint64_t)"com.apple.StreamingPassthroughResumptionData");
        goto LABEL_66;
      }

      size_t v117 = v116;
      if (v116 < 1 || ![*((id *)v9 + 12) count])
      {
        unsigned int v71 = 0LL;
        id v123 = v286;
        goto LABEL_115;
      }

      uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", v117));
      [v118 setLength:v117];
      id v278 = v115;
      id v119 = (const char *)[v278 fileSystemRepresentation];
      id v281 = v118;
      ssize_t v120 = getxattr( v119,  "com.apple.StreamingPassthroughResumptionData",  [v281 mutableBytes],  v117,  0,  1);
      if (v120 == v117)
      {
        id v275 = v278;
        if (removexattr( (const char *)[v275 fileSystemRepresentation],  "com.apple.StreamingPassthroughResumptionData",  1))
        {
          id v121 = sub_100004680();
          v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            id v251 = [v275 fileSystemRepresentation];
            unsigned int v252 = __error();
            uint64_t v253 = strerror(*v252);
            *(_DWORD *)__int128 buf = 136315650;
            *(void *)size_t v320 = "com.apple.StreamingPassthroughResumptionData";
            *(_WORD *)&v320[8] = 2080;
            *(void *)uint64_t v321 = v251;
            *(_WORD *)&v321[8] = 2080;
            v322 = v253;
            _os_log_error_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_ERROR,  "Failed to remove EA %s from %s: %s",  buf,  0x20u);
          }
        }

        id v305 = v286;
        unsigned int v71 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v281,  &v305);
        id v123 = v305;

        -[NSKeyedUnarchiver setDecodingFailurePolicy:](v71, "setDecodingFailurePolicy:", 0LL);
        if (v71)
        {
          unsigned int v124 = -[NSKeyedUnarchiver decodeIntForKey:](v71, "decodeIntForKey:", @"SerializationVersion");
          if (v124 == 8)
          {
            unint64_t v125 = *((void *)v9 + 7);
            if (v125) {
              unint64_t v126 = (st_size - (unint64_t)(st_size > 0)) / v125;
            }
            else {
              unint64_t v126 = 0LL;
            }
            if (v126 < (unint64_t)[*((id *)v9 + 12) count])
            {
              size_t __n = 0LL;
              unsigned int v71 = v71;
              uint64_t v230 = -[NSKeyedUnarchiver decodeBytesForKey:returnedLength:]( v71,  "decodeBytesForKey:returnedLength:",  @"HashContext",  &__n);
              if (!v230 || !__n)
              {
LABEL_217:

LABEL_115:
                v9[450] = 5;
                *((void *)v9 + 6) = st_size;
                v127 = (void *)*((void *)v9 + 45);
                *((void *)v9 + 45) = 0LL;

                uint64_t v128 = (void *)*((void *)v9 + 46);
                *((void *)v9 + 46) = 0LL;

                *((void *)v9 + 51) = st_size;
                uint64_t v129 = v9[454];
                time_t v130 = v123;
                id v299 = v123;
                uint64_t v131 = objc_claimAutoreleasedReturnValue( +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:]( &OBJC_CLASS___StreamingFileWriter,  "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:",  v115,  9LL,  0LL,  0LL,  v129,  &v299));
                id v49 = v299;

                v132 = (void *)*((void *)v9 + 49);
                *((void *)v9 + 49) = v131;

                if (!*((void *)v9 + 49))
                {
                  v133 = sub_100004680();
                  v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
                  if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)__int128 buf = 138412290;
                    *(void *)size_t v320 = v115;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v134,  OS_LOG_TYPE_ERROR,  "Failed to open output file at path %@",  buf,  0xCu);
                  }

                  NSErrorUserInfoKey v317 = NSFilePathErrorKey;
                  id v318 = v115;
                  v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v318,  &v317,  1LL));
                  id v137 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  1060LL,  @"SZExtractorErrorDomain",  1LL,  v49,  v135,  @"Failed to open output file at path %@",  v136,  (uint64_t)v115);
                  uint64_t v138 = objc_claimAutoreleasedReturnValue(v137);

                  id v49 = (id)v138;
                }

                goto LABEL_69;
              }

              if (__n == qword_10001DB48[*__errnum])
              {
                memcpy(v9 + 136, v230, __n);
                unint64_t v231 = *((void *)v9 + 7);
                unint64_t v232 = st_size;
                if (v231) {
                  unint64_t v232 = st_size % v231;
                }
                *((void *)v9 + _Block_object_dispose((const void *)(v30 - 176), 8) = v232;
                goto LABEL_217;
              }

              uint64_t v248 = sub_100004680();
              id v249 = (os_log_s *)objc_claimAutoreleasedReturnValue(v248);
              if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
              {
                uint64_t v267 = *__errnum;
                v268 = off_100028B28[v267];
                uint64_t v269 = (const char *)qword_10001DB48[v267];
                *(_DWORD *)__int128 buf = 136315650;
                *(void *)size_t v320 = v268;
                *(_WORD *)&v320[8] = 2048;
                *(void *)uint64_t v321 = __n;
                *(_WORD *)&v321[8] = 2048;
                v322 = v269;
                _os_log_error_impl( (void *)&_mh_execute_header,  v249,  OS_LOG_TYPE_ERROR,  "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                  buf,
                  0x20u);
              }

              __darwin_ino64_t v250 = v123;
              id v300 = v123;
              sub_100018718(v275, &v300);
              id v49 = v300;

LABEL_223:
              uint64_t v218 = v281;
              goto LABEL_196;
            }

            uint64_t v233 = sub_100004680();
            id v234 = (os_log_s *)objc_claimAutoreleasedReturnValue(v233);
            if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR))
            {
              id v263 = [*((id *)v9 + 12) count];
              *(_DWORD *)__int128 buf = 134218240;
              *(void *)size_t v320 = v126;
              *(_WORD *)&v320[8] = 2048;
              *(void *)uint64_t v321 = v263;
              _os_log_error_impl( (void *)&_mh_execute_header,  v234,  OS_LOG_TYPE_ERROR,  "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            id v302 = v123;
            v157 = &v302;
          }

          else
          {
            unsigned int v221 = v124;
            v222 = sub_100004680();
            uint64_t v223 = (os_log_s *)objc_claimAutoreleasedReturnValue(v222);
            if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 67109634;
              *(_DWORD *)size_t v320 = v221;
              *(_WORD *)&v320[4] = 1024;
              *(_DWORD *)&v320[6] = 8;
              *(_WORD *)uint64_t v321 = 2112;
              *(void *)&v321[2] = v275;
              _os_log_error_impl( (void *)&_mh_execute_header,  v223,  OS_LOG_TYPE_ERROR,  "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            id v304 = v123;
            v157 = &v304;
          }
        }

        else
        {
          uint64_t v219 = sub_100004680();
          v220 = (os_log_s *)objc_claimAutoreleasedReturnValue(v219);
          if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)size_t v320 = v123;
            _os_log_error_impl( (void *)&_mh_execute_header,  v220,  OS_LOG_TYPE_ERROR,  "Unable to deserialize resumption data (%@); resuming from offset 0",
              buf,
              0xCu);
          }

          unsigned int v71 = 0LL;
          id v303 = v123;
          v157 = &v303;
        }

        id v286 = v123;
      }

      else
      {
        ssize_t v154 = v120;
        id v155 = sub_100004680();
        v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 134218754;
          *(void *)size_t v320 = v117;
          *(_WORD *)&v320[8] = 2048;
          *(void *)uint64_t v321 = v154;
          *(_WORD *)&v321[8] = 2080;
          v322 = "com.apple.StreamingPassthroughResumptionData";
          LOWORD(v323[0]) = 2112;
          *(void *)((char *)v323 + 2) = v278;
          _os_log_error_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_ERROR,  "Expected to read %ld bytes but got %ld for EA %s on %@; resuming from offset 0",
            buf,
            0x2Au);
        }

        unsigned int v71 = 0LL;
        id v306 = v286;
        v157 = &v306;
      }

      sub_100018718(v278, v157);
      id v49 = *v157;

      goto LABEL_223;
    }
  }

  else
  {
  }

  uint64_t v44 = sub_100004680();
  id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)size_t v320 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Options dictionary supplied has one or more options with an incorrect type: %@",  buf,  0xCu);
  }

  id v47 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  864LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  0LL,  @"Options dictionary supplied has one or more options with an incorrect type: %@",  v46,  (uint64_t)v10);
  NSErrorUserInfoKey v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  id v49 = v48;
  if (!a4) {
    goto LABEL_40;
  }
  id v50 = v48;
  id v49 = v50;
LABEL_38:
  __darwin_ino64_t v56 = 0LL;
  *a4 = v50;
LABEL_41:

LABEL_42:
  return v56;
}

uint64_t sub_100018718(void *a1, void *a2)
{
  id v3 = a1;
  NSFileAttributeKey v72 = NSFilePosixPermissions;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 16877LL));
  uint64_t v73 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));

  id v6 = v3;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 256);
  if (v7 < 0)
  {
    uint64_t v12 = *__error();
    uint64_t v13 = sub_100004680();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v60 = [v6 fileSystemRepresentation];
      NSErrorDomain v61 = strerror(v12);
      *(_DWORD *)__int128 buf = 136315394;
      id v75 = v60;
      __int16 v76 = 2080;
      v77[0] = v61;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
    }

    NSErrorDomain v15 = NSPOSIXErrorDomain;
    id v16 = [v6 fileSystemRepresentation];
    strerror(v12);
    id v18 = sub_100007A7C( (uint64_t)"_GetDataProtectionClassForPath",  586LL,  NSPOSIXErrorDomain,  v12,  0LL,  0LL,  @"Failed to open %s : %s",  v17,  (uint64_t)v16);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }

  else
  {
    int v8 = v7;
    uint64_t v9 = fcntl(v7, 63);
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = v9;
      close(v8);

      int v11 = 1;
      goto LABEL_14;
    }

    uint64_t v20 = *__error();
    uint64_t v21 = sub_100004680();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v64 = [v6 fileSystemRepresentation];
      v65 = strerror(v20);
      *(_DWORD *)__int128 buf = 136315394;
      id v75 = v64;
      __int16 v76 = 2080;
      v77[0] = v65;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to get protection class on %s : %s",  buf,  0x16u);
    }

    NSErrorDomain v15 = NSPOSIXErrorDomain;
    id v23 = [v6 fileSystemRepresentation];
    strerror(v20);
    id v25 = sub_100007A7C( (uint64_t)"_GetDataProtectionClassForPath",  593LL,  NSPOSIXErrorDomain,  v20,  0LL,  0LL,  @"Failed to get protection class on %s : %s",  v24,  (uint64_t)v23);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v25);
    close(v8);
  }

  id v26 = v19;

  id v27 = v26;
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 domain]);
  if (v15 != (NSErrorDomain)v28)
  {
    id v29 = (os_log_s *)v28;
    goto LABEL_29;
  }

  id v30 = [v27 code];

  if (v30 != (id)2) {
    goto LABEL_30;
  }

  int v11 = 0;
  uint64_t v10 = 0xFFFFFFFFLL;
LABEL_14:
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v71 = 0LL;
  unsigned __int8 v32 = [v31 removeItemAtPath:v6 error:&v71];
  id v27 = v71;

  if ((v32 & 1) != 0)
  {
LABEL_15:
    __int16 v33 = v27;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v70 = v27;
    unsigned __int8 v35 = [v34 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v5 error:&v70];
    id v27 = v70;

    if ((v35 & 1) != 0)
    {
      if (!v11)
      {
        uint64_t v51 = 1LL;
        goto LABEL_42;
      }

      id v36 = v6;
      int v37 = open((const char *)[v36 fileSystemRepresentation], 256);
      if (v37 < 0)
      {
        uint64_t v52 = *__error();
        uint64_t v53 = sub_100004680();
        id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          id v68 = [v36 fileSystemRepresentation];
          id v69 = strerror(v52);
          *(_DWORD *)__int128 buf = 136315394;
          id v75 = v68;
          __int16 v76 = 2080;
          v77[0] = v69;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
        }

        id v55 = [v36 fileSystemRepresentation];
        strerror(v52);
        id v57 = sub_100007A7C( (uint64_t)"_SetDataProtectionClassOnPath",  615LL,  NSPOSIXErrorDomain,  v52,  0LL,  0LL,  @"Failed to open %s : %s",  v56,  (uint64_t)v55);
        id v45 = (void *)objc_claimAutoreleasedReturnValue(v57);
      }

      else
      {
        int v38 = v37;
        if (!fcntl(v37, 64, v10))
        {
          close(v38);
          char v59 = 1;
          id v58 = v27;
LABEL_38:

          id v62 = v58;
          if ((v59 & 1) != 0)
          {
            uint64_t v51 = 1LL;
            id v27 = v62;
            goto LABEL_42;
          }

          id v27 = v62;
          if (!a2)
          {
LABEL_41:
            uint64_t v51 = 0LL;
            goto LABEL_42;
          }

          goto LABEL_31;
        }

        uint64_t v39 = *__error();
        uint64_t v40 = sub_100004680();
        __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          id v66 = [v36 fileSystemRepresentation];
          id v67 = strerror(v39);
          *(_DWORD *)__int128 buf = 136315650;
          id v75 = v66;
          __int16 v76 = 1024;
          LODWORD(v77[0]) = v10;
          WORD2(v77[0]) = 2080;
          *(void *)((char *)v77 + 6) = v67;
          _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to set protection class on %s to %d: %s",  buf,  0x1Cu);
        }

        id v42 = [v36 fileSystemRepresentation];
        strerror(v39);
        id v44 = sub_100007A7C( (uint64_t)"_SetDataProtectionClassOnPath",  621LL,  NSPOSIXErrorDomain,  v39,  0LL,  0LL,  @"Failed to set protection class on %s to %d: %s",  v43,  (uint64_t)v42);
        id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        close(v38);
      }

      id v58 = v45;

      char v59 = 0;
      goto LABEL_38;
    }

    id v47 = sub_100004680();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)__int128 buf = 138412546;
    id v75 = v6;
    __int16 v76 = 2112;
    v77[0] = v27;
    NSErrorUserInfoKey v48 = "Failed to create extraction directory at path %@: %@";
    goto LABEL_44;
  }

  NSErrorDomain v46 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v27 domain]);
  if (NSCocoaErrorDomain == v46)
  {
    id v49 = [v27 code];

    if (v49 == (id)4)
    {

      id v27 = 0LL;
      goto LABEL_15;
    }
  }

  else
  {
  }

  id v50 = sub_100004680();
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v75 = v6;
    __int16 v76 = 2112;
    v77[0] = v27;
    NSErrorUserInfoKey v48 = "Failed to remove bad extraction path at %@: %@";
LABEL_44:
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v48, buf, 0x16u);
  }

LABEL_29:
LABEL_30:
  if (!a2) {
    goto LABEL_41;
  }
LABEL_31:
  id v27 = v27;
  uint64_t v51 = 0LL;
  *a2 = v27;
LABEL_42:

  return v51;
}

uint64_t sub_100018E38(void *a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 objectForKey:v5]);
  int v7 = (void *)v6;
  if (v6 && (objc_opt_isKindOfClass(v6, a3) & 1) == 0)
  {
    uint64_t v9 = sub_100004680();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromClass(a3);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = (objc_class *)objc_opt_class(v7);
      NSErrorDomain v15 = NSStringFromClass(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v17 = 138412802;
      id v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Value of key %@ in options dictionary was not an object of type %@. Was %@",  (uint8_t *)&v17,  0x20u);
    }

    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  return v8;
}

id sub_100018F78(void *a1)
{
  int v2 = getgroups(16, v20);
  if (v2 != -1)
  {
    int v3 = v2;
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    if (v3 >= 1)
    {
      uint64_t v5 = v3;
      uint64_t v6 = v20;
      do
      {
        unsigned int v7 = *v6++;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
        -[NSMutableSet addObject:](v4, "addObject:", v8);

        --v5;
      }

      while (v5);
    }

    id v9 = -[NSMutableSet copy](v4, "copy");
    uint64_t v10 = 0LL;
    if (!a1) {
      goto LABEL_12;
    }
LABEL_10:
    if (!v9) {
      *a1 = v10;
    }
    goto LABEL_12;
  }

  uint64_t v11 = *__error();
  uint64_t v12 = sub_100004680();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v19 = strerror(v11);
    _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to get current group access list: %s",  buf,  0xCu);
  }

  uint64_t v14 = strerror(v11);
  id v16 = sub_100007A7C( (uint64_t)"FetchGroupIDs",  250LL,  NSPOSIXErrorDomain,  v11,  0LL,  0LL,  @"Failed to get current group access list: %s",  v15,  (uint64_t)v14);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v4 = 0LL;
  id v9 = 0LL;
  if (a1) {
    goto LABEL_10;
  }
LABEL_12:

  return v9;
}

void sub_10001912C(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v81 = 0LL;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 _serviceConnectionWithError:&v81]);
  uint64_t v4 = (char *)v81;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 40LL);
  *(void *)(*(void *)(a1 + 32) + 40LL) = v3;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
  LODWORD(v3) = v6 == 0LL;

  if (!(_DWORD)v3)
  {
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___SZExtractorInternalDelegate);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 64);
    *(void *)(v8 + 64) = v7;

    id v10 = sub_100019A00();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
    [v12 setExportedInterface:v11];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalExtractorDelegate]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
    [v14 setExportedObject:v13];

    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472LL;
    v79[2] = sub_100019A74;
    v79[3] = &unk_100028780;
    objc_copyWeak(&v80, (id *)location);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
    [(id)v15 setInterruptionHandler:v79];

    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_100019B3C;
    void v77[3] = &unk_100028780;
    objc_copyWeak(&v78, (id *)location);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
    [v16 setInvalidationHandler:v77];

    objc_destroyWeak(&v78);
    objc_destroyWeak(&v80);
    objc_destroyWeak((id *)location);
    int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
    [v17 resume];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
    LOBYTE(v15) = [v18 fileExistsAtPath:v19];

    if ((v15 & 1) != 0)
    {
      uint64_t v20 = v4;
    }

    else
    {
      NSFileAttributeKey v87 = NSFilePosixPermissions;
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 16877LL));
      id v88 = v21;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));

      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
      __int16 v76 = v4;
      unsigned int v25 = [v23 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:v22 error:&v76];
      uint64_t v20 = v76;

      if (!v25)
      {
        id v45 = sub_100004680();
        NSErrorDomain v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          id v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = v70;
          __int16 v83 = 2112;
          v84 = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Failed to create extraction directory at path %@: %@",  location,  0x16u);
        }

        id v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
        id v49 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  510LL,  @"SZExtractorErrorDomain",  1LL,  v20,  0LL,  @"Failed to create extraction directory at path %@: %@",  v48,  (uint64_t)v47);
        id v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

        [*(id *)(a1 + 32) setError:v50];
LABEL_20:
        uint64_t v4 = v20;
        goto LABEL_21;
      }
    }

    id v26 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
    BOOL v28 = realpath_DARWIN_EXTSN((const char *)[v26 fileSystemRepresentationWithPath:v27], __s) == 0;

    if (v28)
    {
      uint64_t v38 = *__error();
      uint64_t v39 = sub_100004680();
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v68 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
        id v69 = strerror(v38);
        *(_DWORD *)location = 138412802;
        *(void *)&location[4] = v68;
        __int16 v83 = 2080;
        v84 = __s;
        __int16 v85 = 2080;
        id v86 = v69;
        _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to realpath %@ at %s: %s",  location,  0x20u);
      }

      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extractionPath]);
      strerror(v38);
      id v43 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  517LL,  NSPOSIXErrorDomain,  v38,  0LL,  0LL,  @"Failed to realpath %@ at %s: %s",  v42,  (uint64_t)v41);
      id v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

      [*(id *)(a1 + 32) setError:v44];
    }

    else
    {
      id v29 = (void *)sandbox_extension_issue_file("com.apple.StreamingUnzipService", __s, 0LL);
      if (v29)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v31 = [v30 stringWithFileSystemRepresentation:__s length:strlen(__s)];
        unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_100019C24;
        v74[3] = &unk_1000287A8;
        uint8_t v74[4] = *(void *)(a1 + 32);
        id v75 = *(id *)(a1 + 40);
        __int16 v33 = objc_retainBlock(v74);
        BOOL v34 = *(_BYTE *)(a1 + 48) == 0;
        unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unzipServiceConnection]);
        id v36 = v35;
        if (v34) {
          uint64_t v37 = objc_claimAutoreleasedReturnValue([v35 remoteObjectProxyWithErrorHandler:v33]);
        }
        else {
          uint64_t v37 = objc_claimAutoreleasedReturnValue([v35 synchronousRemoteObjectProxyWithErrorHandler:v33]);
        }
        id v66 = (void *)v37;

        id v67 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) options]);
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_100019D20;
        v72[3] = &unk_1000287D0;
        v72[4] = *(void *)(a1 + 32);
        id v73 = *(id *)(a1 + 40);
        [v66 setupUnzipperWithOutputPath:v32 sandboxExtensionToken:v29 options:v67 withReply:v72];

        free(v29);
        goto LABEL_26;
      }

      uint64_t v51 = *__error();
      uint64_t v52 = sub_100004680();
      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        id v71 = strerror(v51);
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = __s;
        __int16 v83 = 2080;
        v84 = v71;
        _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Failed to issue sandbox extension for %s : %s",  location,  0x16u);
      }

      strerror(v51);
      id v55 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  525LL,  NSPOSIXErrorDomain,  v51,  0LL,  0LL,  @"Failed to issue sandbox extension for %s : %s",  v54,  (uint64_t)__s);
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      [*(id *)(a1 + 32) setError:v56];
    }

    goto LABEL_20;
  }

  [*(id *)(a1 + 32) setError:v4];
LABEL_21:
  id v57 = sub_100004680();
  id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    char v59 = *(void **)(a1 + 32);
    id v60 = (char *)[v59 lastResumptionOffset];
    NSErrorDomain v61 = (char *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v59;
    __int16 v83 = 2048;
    v84 = v60;
    __int16 v85 = 2112;
    id v86 = v61;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "%@: calling prepare completion block with offset %llu, error %@",  location,  0x20u);
  }

  uint64_t v62 = *(void *)(a1 + 40);
  id v63 = [*(id *)(a1 + 32) lastResumptionOffset];
  id v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  (*(void (**)(uint64_t, id, void *))(v62 + 16))(v62, v63, v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  if (v65) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
  uint64_t v20 = v4;
LABEL_26:
}

void sub_1000199CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, id location)
{
}

id sub_100019A00()
{
  id WeakRetained = objc_loadWeakRetained(&qword_10002F3A8);
  if (!WeakRetained)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___StreamingUnzipDelegateProtocol));
    objc_storeWeak(&qword_10002F3A8, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002F3A0);
  return WeakRetained;
}

void sub_100019A74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = sub_100004680();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v7) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Connection interrupted to streaming unzip service.",  (uint8_t *)&v7,  2u);
  }

  id v5 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  490LL,  NSCocoaErrorDomain,  4097LL,  0LL,  0LL,  @"Connection interrupted to streaming unzip service.",  v4,  v7);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [WeakRetained setError:v6];

  [WeakRetained _invalidateObject];
}

void sub_100019B3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  id v5 = @"Connection invalidated to streaming unzip service.";
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4099LL,  v2));
  [WeakRetained setError:v3];

  [WeakRetained _invalidateObject];
}

void sub_100019C24(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = sub_100004680();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%@: prepare returning error %@",  (uint8_t *)&v7,  0x16u);
  }

  [*(id *)(a1 + 32) setError:v3];
  [*(id *)(a1 + 32) setLastResumptionOffset:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100019D20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  [*(id *)(a1 + 32) setLastResumptionOffset:a3];
  uint64_t v6 = sub_100004680();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: calling prepare completion block with offset %llu, error %@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (v5) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
}

id sub_100019E30()
{
  id WeakRetained = objc_loadWeakRetained(&qword_10002F398);
  if (!WeakRetained)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___StreamingUnzipProtocol));
    objc_storeWeak(&qword_10002F398, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002F390);
  return WeakRetained;
}

void sub_100019EA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = sub_100004680();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@: prepare for extraction failed: %@",  (uint8_t *)&v9,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  else
  {
    **(void **)(a1 + 4_Block_object_dispose((const void *)(v30 - 176), 8) = a2;
  }
}

void sub_100019F8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100004680();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@: Suspending stream prior to encoding failed with error: %@",  (uint8_t *)&v8,  0x16u);
    }
  }
}

LABEL_9:
  [v7 invalidate];
  __int16 v10 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void sub_10001A284( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001A2AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004680();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "remoteObjectProxy returning error %@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_10001A374(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2 < 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    id v6 = v7;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
}

id objc_msgSend__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_reservation_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:e rrorDelegate:reservation:error:");
}

id objc_msgSend__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:");
}

id objc_msgSend__openCurrentOutputFDForPath_withOpenFlags_mode_performCachedWrites_quarantineInfo_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:");
}

id objc_msgSend_fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:error:");
}

id objc_msgSend_synchronousFileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}