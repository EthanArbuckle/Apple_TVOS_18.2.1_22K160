void *sub_1000015A8()
{
  if (qword_10000D348 != -1) {
    dispatch_once(&qword_10000D348, &stru_1000082D8);
  }
  return off_10000D0F0;
}

void sub_1000015E8(id a1)
{
  v1 = STGetLoggingCategory();
  os_log_t v2 = os_log_create("com.apple.StreamingExtractor", v1);
  v3 = off_10000D0F0;
  off_10000D0F0 = v2;
}

void *sub_100001618()
{
  if (qword_10000D350 != -1) {
    dispatch_once(&qword_10000D350, &stru_1000082F8);
  }
  return off_10000D0F8;
}

void sub_100001658(id a1)
{
  v1 = STGetLoggingCategory();
  os_log_t v2 = os_log_create("com.apple.StreamingExtractor.signposts", v1);
  v3 = off_10000D0F8;
  off_10000D0F8 = v2;
}

id sub_100001688(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a3;
  v17 = a4;
  id v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%s:%d][%s] %@",  a7,  a8,  a6,  v16));
  v20 = sub_1000015A8();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v26 = &stru_1000086C0;
    *(_DWORD *)buf = 136448002;
    v28 = "STCreateErrorWithInfo";
    __int16 v29 = 2080;
    if (v17) {
      v26 = v17;
    }
    uint64_t v30 = a7;
    __int16 v31 = 1024;
    int v32 = a8;
    __int16 v33 = 2080;
    uint64_t v34 = a6;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2048;
    uint64_t v38 = a2;
    __int16 v39 = 2112;
    id v40 = v16;
    __int16 v41 = 2112;
    v42 = v26;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s: Error [%s:%d][%s]: %@ - %ld - %@ %@\n",  buf,  0x4Eu);
  }

  if (v18) {
    id v22 = [v18 mutableCopy];
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  }
  v23 = v22;
  [v22 setObject:v19 forKey:NSDebugDescriptionErrorKey];
  if (v17) {
    [v23 setObject:v17 forKey:NSUnderlyingErrorKey];
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a2,  v23));

  return v24;
}

id sub_10000189C(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100001688(a1, a2, a3, a4, 0LL, a5, a6, a7);
}

const char *STGetLoggingCategory()
{
  return "STExtractionService";
}

id sub_100001D48(uint64_t a1)
{
  os_log_t v2 = sub_1000015A8();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sessionID]);
    int v7 = 136446722;
    v8 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Connection interrupted [%@ - %@]",  (uint8_t *)&v7,  0x20u);
  }

  return [*(id *)(a1 + 40) connectionInterrupted];
}

id sub_100001E28(uint64_t a1)
{
  os_log_t v2 = sub_1000015A8();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sessionID]);
    int v7 = 136446722;
    v8 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Connection invalidated [%@ - %@]",  (uint8_t *)&v7,  0x20u);
  }

  [*(id *)(a1 + 40) connectionInvalidated];
  return [*(id *)(a1 + 40) setXpcConnection:0];
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = sub_1000015A8();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446722;
    v12 = "main";
    __int16 v13 = 2080;
    v14 = "Nov 10 2024";
    __int16 v15 = 2080;
    id v16 = "01:26:50";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Service started (built at %s %s)",  (uint8_t *)&v11,  0x20u);
  }

  _set_user_dir_suffix("com.apple.STExtractionService");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  int v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v6);

  dispatch_source_set_event_handler(v7, &stru_100008388);
  dispatch_resume(v7);
  v8 = objc_opt_new(&OBJC_CLASS___STExtractionServiceDelegate);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

void sub_100002080(id a1)
{
  v1 = sub_1000015A8();
  os_log_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446210;
    uint64_t v4 = "main_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}s: SIGTERM received - suspending active extractions.",  (uint8_t *)&v3,  0xCu);
  }

  xpc_transaction_exit_clean();
  +[STExtractionService setProcessTerminated](&OBJC_CLASS___STExtractionService, "setProcessTerminated");
}

void sub_100002134( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100002300(_Unwind_Exception *a1)
{
}

void sub_1000024A0(_Unwind_Exception *a1)
{
}

void sub_1000025C4(_Unwind_Exception *a1)
{
}

void sub_1000025E8(id a1, id a2, BOOL *a3)
{
}

id sub_100002828(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    if ([*(id *)(a1 + 32) extractionValid]
      && [*(id *)(a1 + 32) extractionPrepared])
    {
      int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
      [v3 suspendStreamWithCompletionBlock:&stru_100008408];
    }

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    char v5 = objc_opt_respondsToSelector(v4, "invalidate");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
      [v6 invalidate];
    }
  }

  return [*(id *)(a1 + 32) invalidate];
}
}

id sub_100002984(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkProcessTerminated];
}

void sub_100002B44(uint64_t a1)
{
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472LL;
  v124[2] = sub_10000382C;
  v124[3] = &unk_100008478;
  os_log_t v2 = (id *)(a1 + 32);
  v124[4] = *(void *)(a1 + 32);
  id v125 = *(id *)(a1 + 64);
  v114 = objc_retainBlock(v124);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2[1] objectForKeyedSubscript:@"STRemoteExtractorSessionID"]);
  if (!v3 || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 UUIDString]);

    int v3 = (void *)v6;
  }

  v113 = v3;
  [*(id *)(a1 + 32) setSessionID:v3];
  id v7 = [*(id *)(a1 + 40) mutableCopy];
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) keyEnumerator]);
  id v9 = [v8 countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v121;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v121 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v120 + 1) + 8LL * (void)i);
      }

      id v10 = [v8 countByEnumeratingWithState:&v120 objects:v135 count:16];
    }

    while (v10);
  }

  v14 = sub_1000015A8();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (char *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sessionID]);
    uint64_t v17 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413059;
    v128 = v16;
    __int16 v129 = 2082;
    v130 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
    __int16 v131 = 2113;
    uint64_t v132 = v17;
    __int16 v133 = 2112;
    id v134 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: sandbox_token: %{private}@ - options: %@",  buf,  0x2Au);
  }

  [(id)objc_opt_class(*(void *)(a1 + 32)) addActiveExtractionService:*(void *)(a1 + 32)];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginBundlePath"]);
  if (v18)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
    {
      v90 = sub_1000015A8();
      v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        sub_100004D90();
      }

      v92 = STExtractorErrorDomain;
      v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundle path option is not an NSString"));
      id v93 = sub_10000189C( v92,  3LL,  v115,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withComplet ionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  274LL);
      id v37 = (id)objc_claimAutoreleasedReturnValue(v93);
      goto LABEL_74;
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v18));
    if (v20)
    {
      v21 = (void *)v20;
      v115 = 0LL;
      goto LABEL_27;
    }
  }

  uint64_t v22 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"]);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
  v115 = (void *)v22;
  if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
  {
    v104 = sub_1000015A8();
    v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
    v49 = v113;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      sub_100004CF4();
    }

    v106 = STExtractorErrorDomain;
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundle name option is not an NSString"));
    id v107 = sub_10000189C( v106,  3LL,  v25,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompleti onBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  282LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v107);
    v47 = (void (**)(void, void, void, void))v114;
    goto LABEL_84;
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginDirectory"]);
  if (v24)
  {
    v25 = (__CFString *)v24;
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
    {
      v27 = v18;
      goto LABEL_24;
    }

    v108 = sub_1000015A8();
    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      sub_100004C58();
    }

    v110 = STExtractorErrorDomain;
    v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"plugin directory option is not an NSString"));
    id v112 = sub_10000189C( v110,  3LL,  v111,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompleti onBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  286LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v112);

    v49 = v113;
    v47 = (void (**)(void, void, void, void))v114;
LABEL_84:

    goto LABEL_46;
  }

  v27 = v18;
  v25 = @"/System/Library/StreamingExtractorPlugins";
LABEL_24:
  v126[0] = v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.bundle", v115));
  v126[1] = v28;
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v126, 2LL));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v29));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v30));

  __int16 v31 = sub_1000015A8();
  int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = (char *)objc_claimAutoreleasedReturnValue([v21 path]);
    *(_DWORD *)buf = 136446466;
    v128 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
    __int16 v129 = 2112;
    v130 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s: pluginURL: %@", buf, 0x16u);
  }

  id v18 = v27;
  if (!v21)
  {
    v58 = sub_1000015A8();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1000046B8();
    }

    v60 = STExtractorErrorDomain;
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to get plugin URL"));
    id v62 = sub_10000189C( v60,  6LL,  v61,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletio nBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  299LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v62);

    goto LABEL_74;
  }

LABEL_27:
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v21));
  if (!v34)
  {
    v63 = sub_1000015A8();
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_100004754();
    }

    v65 = STExtractorErrorDomain;
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to get plugin bundle: %@",  v21));
    id v67 = sub_10000189C( v65,  6LL,  v66,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletio nBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  302LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v67);

    goto LABEL_60;
  }

  __int16 v35 = v34;
  id v119 = 0LL;
  unsigned __int8 v36 = [v34 loadAndReturnError:&v119];
  id v37 = v119;
  if ((v36 & 1) == 0)
  {
    v68 = sub_1000015A8();
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_100004BBC();
    }

    v70 = sub_1000015A8();
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_100004AFC(v2, (uint64_t)v37, v71);
    }

LABEL_60:
LABEL_74:
    v47 = (void (**)(void, void, void, void))v114;
LABEL_40:
    v49 = v113;
    goto LABEL_46;
  }

  uint64_t v38 = (objc_class *)[v35 principalClass];
  if (!v38)
  {
    v72 = sub_1000015A8();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      sub_1000047F0();
    }

    v74 = STExtractorErrorDomain;
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to get principal class from plugin: %@",  v21));
    v76 = v74;
    v77 = v75;
    uint64_t v78 = 306LL;
    goto LABEL_67;
  }

  __int16 v39 = v38;
  if ((-[objc_class conformsToProtocol:](v38, "conformsToProtocol:", &OBJC_PROTOCOL___STExtractionPlugin) & 1) == 0)
  {
    v79 = sub_1000015A8();
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_100004A60();
    }

    v81 = STExtractorErrorDomain;
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"principal class for plugin does not conform to STExtractorPlugin protocol: %@",  v21));
    v76 = v81;
    v77 = v75;
    uint64_t v78 = 307LL;
LABEL_67:
    id v82 = sub_10000189C( v76,  6LL,  v77,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletio nBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  v78);
    uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);

    id v37 = (id)v83;
    goto LABEL_74;
  }

  id v40 = *(void **)(a1 + 48);
  if (v40
    && (objc_msgSend( *v2, "setSandboxToken:", sandbox_extension_consume(objc_msgSend(v40, "UTF8String"))), objc_msgSend(*v2, "sandboxToken") == (id) -1))
  {
    v94 = v18;
    v95 = sub_1000015A8();
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    v47 = (void (**)(void, void, void, void))v114;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      sub_1000049C4();
    }

    v97 = STExtractorErrorDomain;
    v98 = __error();
    v99 = strerror(*v98);
    v100 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to consume sandbox token: %s (%d)",  v99,  *__error());
    v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
    id v102 = sub_10000189C( v97,  10LL,  v101,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompleti onBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  311LL);
    uint64_t v103 = objc_claimAutoreleasedReturnValue(v102);

    id v37 = (id)v103;
    v49 = v113;
    id v18 = v94;
  }

  else
  {
    if (*v2) {
      [*v2 auditToken];
    }
    else {
      memset(v118, 0, sizeof(v118));
    }
    uint64_t v41 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_CANONICAL | 1u;
    [*(id *)(a1 + 56) fileSystemRepresentation];
    int v42 = sandbox_check_by_audit_token(v118, "file-write-create", v41);
    if (!v42)
    {
LABEL_38:
      id v43 = [[v39 alloc] initWithOptions:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) setPlugin:v43];

      v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
      if (v44)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
        uint64_t v46 = *(void *)(a1 + 56);
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472LL;
        v116[2] = sub_1000038B0;
        v116[3] = &unk_1000084A0;
        v47 = (void (**)(void, void, void, void))v114;
        v48 = v114;
        v116[4] = *(void *)(a1 + 32);
        id v117 = v48;
        [v45 prepareForExtractionToPath:v46 withCompletionBlock:v116];
      }

      else
      {
        v84 = sub_1000015A8();
        v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        v47 = (void (**)(void, void, void, void))v114;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          sub_100004928();
        }

        v86 = STExtractorErrorDomain;
        v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to initialize plugin class: %@",  v39));
        id v88 = sub_10000189C( v86,  6LL,  v87,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompl etionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  323LL);
        uint64_t v89 = objc_claimAutoreleasedReturnValue(v88);

        id v37 = (id)v89;
      }

      goto LABEL_40;
    }

    if (v42 == -1) {
      uint64_t v50 = *__error();
    }
    else {
      uint64_t v50 = 1LL;
    }
    v51 = sub_1000015A8();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    v47 = (void (**)(void, void, void, void))v114;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_10000488C();
    }

    v53 = STExtractorErrorDomain;
    v54 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot write to path: %s (%d)",  strerror(v50),  v50);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    id v56 = sub_10000189C( v53,  14LL,  v55,  0LL,  (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletio nBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  319LL);
    uint64_t v57 = objc_claimAutoreleasedReturnValue(v56);

    id v37 = (id)v57;
    v49 = v113;
  }

LABEL_46:
  if (v37) {
    ((void (**)(void, void, void, id))v47)[2](v47, 0LL, 0LL, v37);
  }
}

void sub_10000382C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6) {
    [(id)objc_opt_class(v7) removeExtractionService:*(void *)(a1 + 32)];
  }
  else {
    *(_BYTE *)(v7 + 18) = 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000038B0(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 plugin]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 extractionMemoryFootprint]));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v7,  @"STRemoteExtractorMemoryFootprint"));
  (*(void (**)(uint64_t, void *, uint64_t, id))(v4 + 16))(v4, v8, a2, v6);
}

void sub_100003A2C(uint64_t a1)
{
  if (processTerminated)
  {
    uint64_t v7 = sub_1000015A8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100004F64();
    }

    id v9 = STExtractorErrorDomain;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"extraction stopped - system is shutting down"));
    id v11 = sub_100001688( v9,  13LL,  v10,  0LL,  &off_100008B38,  (uint64_t)"-[STExtractionService remote_supplyBytes:withCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  351LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

    if (v2)
    {
      if ([*(id *)(a1 + 32) extractionValid])
      {
        int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100003C90;
        v24[3] = &unk_1000084F0;
        uint64_t v4 = *(void *)(a1 + 40);
        id v5 = *(id *)(a1 + 48);
        v24[4] = *(void *)(a1 + 32);
        id v25 = v5;
        [v3 supplyBytes:v4 withCompletionBlock:v24];

        id v6 = v25;
LABEL_5:

        return;
      }

      uint64_t v20 = sub_1000015A8();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100004EC8();
      }

      uint64_t v22 = STExtractorErrorDomain;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"extraction is invalid - it likely has already been finished, suspended or terminated"));
      id v16 = v22;
      uint64_t v17 = 8LL;
      id v18 = v10;
      uint64_t v19 = 353LL;
    }

    else
    {
      __int16 v13 = sub_1000015A8();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100004E2C();
      }

      __int16 v15 = STExtractorErrorDomain;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no plugin for -supplyBytes"));
      id v16 = v15;
      uint64_t v17 = 6LL;
      id v18 = v10;
      uint64_t v19 = 352LL;
    }

    id v23 = sub_10000189C( v16,  v17,  v18,  0LL,  (uint64_t)"-[STExtractionService remote_supplyBytes:withCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  v19);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v23);
  }

  id v6 = (void *)v12;

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    goto LABEL_5;
  }

void sub_100003C90(uint64_t a1)
{
  os_log_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) messageQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003D10;
  block[3] = &unk_100008430;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100003D10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkProcessTerminated];
}

void sub_100003DB0(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    [v3 suspendStreamWithCompletionBlock:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) invalidate];
  }

  else
  {
    uint64_t v4 = sub_1000015A8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100005000();
    }

    id v6 = STExtractorErrorDomain;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no plugin for -suspendStream"));
    id v8 = sub_10000189C( v6,  6LL,  v7,  0LL,  (uint64_t)"-[STExtractionService remote_suspendStreamWithCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  383LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

void sub_100003F54(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    [v3 finishStreamWithCompletionBlock:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) invalidate];
  }

  else
  {
    uint64_t v4 = sub_1000015A8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000509C();
    }

    id v6 = STExtractorErrorDomain;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no plugin for -finishStream"));
    id v8 = sub_10000189C( v6,  6LL,  v7,  0LL,  (uint64_t)"-[STExtractionService remote_finishStreamWithCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  408LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

void sub_100004118(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    [v3 terminateStreamWithError:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];

    [*(id *)(a1 + 32) invalidate];
  }

  else
  {
    uint64_t v4 = sub_1000015A8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100005138();
    }

    id v6 = STExtractorErrorDomain;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no plugin for -terminateStream"));
    id v8 = sub_10000189C( v6,  6LL,  v7,  0LL,  (uint64_t)"-[STExtractionService remote_terminateStreamWithError:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m",  434LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

void sub_100004404( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_10000443C()
{
}

void sub_1000044A8()
{
}

void sub_100004514()
{
}

void sub_100004580()
{
}

void sub_10000461C()
{
}

void sub_1000046B8()
{
}

void sub_100004754()
{
}

void sub_1000047F0()
{
}

void sub_10000488C()
{
}

void sub_100004928()
{
}

void sub_1000049C4()
{
}

void sub_100004A60()
{
}

void sub_100004AFC(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 sessionID]);
  int v6 = 138412802;
  uint64_t v7 = v5;
  __int16 v8 = 2082;
  id v9 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "[%@] %{public}s: failed to load plugin: %@",  (uint8_t *)&v6,  0x20u);

  sub_100004428();
}

void sub_100004BBC()
{
}

void sub_100004C58()
{
}

void sub_100004CF4()
{
}

void sub_100004D90()
{
}

void sub_100004E2C()
{
}

void sub_100004EC8()
{
}

void sub_100004F64()
{
}

void sub_100005000()
{
}

void sub_10000509C()
{
}

void sub_100005138()
{
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}