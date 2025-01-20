void start()
{
  BOOL v0;
  uint64_t v1;
  os_log_s *v2;
  void *v3;
  IconCacheService *v4;
  void *v5;
  IconCacheService *v6;
  int v7;
  const char *v8;
  uint8_t buf[16];
  v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "iconservicesagent launched.",  buf,  2u);
  }

  v1 = _ISDefaultLog(v0);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "com.apple.iconservices";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Stating IconServices agent service with name: %s",  (uint8_t *)&v7,  0xCu);
  }

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc(&OBJC_CLASS___IconCacheService);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.iconservices"));
  v6 = -[IconCacheService initWithServiceName:](v4, "initWithServiceName:", v5);

  -[IconCacheService start](v6, "start");
  dispatch_main();
}

void sub_100003058(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [[LSRecord alloc] initWithPersistentIdentifier:v6];

  if (!v7)
  {
    uint64_t v9 = _ISDefaultLog(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing store unit: %@", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
    unsigned int v12 = [v11 removeUnitForUUID:v5];

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unitSourceRegistry]);
      [v13 removeDataForUUID:v5];
    }
  }
}

void sub_100003464( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100003480(uint64_t a1)
{
  uint64_t v2 = _ISDefaultLog(a1);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100004E00(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = (dispatch_queue_s *)WeakRetained[8];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000352C;
    block[3] = &unk_100008380;
    id v15 = WeakRetained;
    dispatch_async(v13, block);
  }
}

id sub_10000352C(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearCache];
}

void sub_100003600( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100003948(id a1)
{
  uint64_t v1 = _ISDefaultLog(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "InterruptionHandler called", v3, 2u);
  }
}

void sub_1000039AC(id a1)
{
  uint64_t v1 = _ISDefaultLog(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "InvalidationHandler called", v3, 2u);
  }
}

void sub_100003CFC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) icon]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) imageDescriptor]);
  uint64_t v4 = _ISDefaultLog(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v21 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v39 = v21;
    *(_WORD *)&v39[4] = 2112;
    *(void *)&v39[6] = v2;
    *(_WORD *)&v39[14] = 2112;
    *(void *)&v39[16] = v3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Processing generation request from %d icon: %@ image descriptor: %@",  buf,  0x1Cu);
  }

  if (v2 && v3)
  {
    id v7 = [v3 ignoreCache];
    if ((_DWORD)v7)
    {
      uint64_t v8 = _ISDefaultLog(v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100004FE0(a1, v9);
      }
      id v10 = 0LL;
      id v11 = 0LL;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) iconCache]);
      id v36 = 0LL;
      id v37 = 0LL;
      unsigned int v17 = [v16 findStoreUnitForIcon:v2 descriptor:v3 UUID:&v37 validationToken:&v36];
      id v10 = v37;
      id v11 = v36;

      if (!v17)
      {
LABEL_18:
        v24 = v11;
        uint64_t v26 = *(void *)(a1 + 32);
        v25 = *(void **)(a1 + 40);
        id v35 = v11;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v25 generateStoreUnitWithRequest:v26 validationToken:&v35]);
        id v11 = v35;

        if (!v23)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -2582LL,  0LL));
          uint64_t v33 = _ISDefaultLog(v23);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            sub_100004EF0();
          }

          id v15 = [[ISGenerationResponse alloc] initWithError:v23];
          goto LABEL_25;
        }

LABEL_19:
        id v27 = objc_alloc(&OBJC_CLASS___ISGenerationResponse);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v23 data]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v23 UUID]);
        id v15 = [v27 initWithData:v28 uuid:v29 validationToken:v11];

        uint64_t v31 = _ISDefaultLog(v30);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_100004F50(v15, v32);
        }

LABEL_25:
        goto LABEL_26;
      }

      id v18 = [v2 assessValidationToken:v11];
      if (!v18)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) iconCache]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 storeUnitForUUID:v10]);

        if (v23) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }

      id v19 = v18;
      uint64_t v20 = _ISDefaultLog(v18);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v39 = v2;
        *(_WORD *)&v39[8] = 2112;
        *(void *)&v39[10] = v3;
        *(_WORD *)&v39[18] = 2048;
        *(void *)&v39[20] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Rejected cached image for %@ : %@ validation state %lu ",  buf,  0x20u);
      }
    }

    goto LABEL_18;
  }

  uint64_t v12 = _ISDefaultLog(v6);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v39 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to queue nil generation request for pid %d",  buf,  8u);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  0LL));
  id v15 = [[ISGenerationResponse alloc] initWithError:v10];
LABEL_26:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_100004498(uint64_t a1)
{
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "iconCache", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mutableStoreIndex]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000046FC;
  v26[3] = &unk_100008458;
  __int128 v4 = *(_OWORD *)(a1 + 128);
  __int128 v33 = *(_OWORD *)(a1 + 112);
  __int128 v34 = v4;
  __int128 v35 = *(_OWORD *)(a1 + 144);
  int v36 = *(_DWORD *)(a1 + 160);
  __int128 v5 = *(_OWORD *)(a1 + 64);
  __int128 v29 = *(_OWORD *)(a1 + 48);
  __int128 v30 = v5;
  __int128 v6 = *(_OWORD *)(a1 + 96);
  __int128 v31 = *(_OWORD *)(a1 + 80);
  __int128 v32 = v6;
  v28 = &v20;
  id v27 = *(id *)(a1 + 40);
  [v3 removeValuePassingTest:v26];

  if (*((_BYTE *)v21 + 24))
  {
    uint64_t v8 = _ISDefaultLog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v10;
      id v11 = "UPDATEING_EXISTING_INDEX_ITEM: %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
    }
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iconCache]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mutableStoreIndex]);
    unsigned int v14 = [v13 addValue:a1 + 48];

    if (v14)
    {
      uint64_t v16 = _ISDefaultLog(v15);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v17;
        id v11 = "ADDED_INDEX_ITEM: %@";
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v18 = _ISDefaultLog(v15);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v19;
        id v11 = "FAILED_TO_ADD_INDEX_ITEM: %@";
        goto LABEL_9;
      }
    }
  }

  _Block_object_dispose(&v20, 8);
}

void sub_1000046D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000046FC(uint64_t a1, unsigned __int8 *uu2)
{
  if (*(_DWORD *)(a1 + 88) != *((_DWORD *)uu2 + 10)) {
    return 0LL;
  }
  double v4 = *(double *)(a1 + 80);
  if (v4 < *((double *)uu2 + 2)
    || v4 > *((double *)uu2 + 3)
    || uuid_compare((const unsigned __int8 *)(a1 + 48), uu2)
    || uuid_compare((const unsigned __int8 *)(a1 + 92), uu2 + 44))
  {
    return 0LL;
  }

  uint64_t result = uuid_compare((const unsigned __int8 *)(a1 + 108), uu2 + 60);
  if ((_DWORD)result || (uint64_t result = memcmp((const void *)(a1 + 124), uu2 + 76, 0x28uLL), (_DWORD)result))
  {
    uint64_t v6 = _ISDefaultLog(result);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "REMOVE_INDEX_ITEM: %@", (uint8_t *)&v9, 0xCu);
    }

    return 1LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

uint64_t sub_100004834(void *a1)
{
  id v12 = 0LL;
  acl_t accessControlList = 0LL;
  id v11 = 0LL;
  unsigned int v1 = [a1 getResourceValue:&v12 forKey:NSURLFileSecurityKey error:&v11];
  uint64_t v2 = (__CFFileSecurity *)v12;
  id v3 = v11;
  double v4 = v3;
  if (v1) {
    BOOL v5 = v2 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = _ISDefaultLog(v3);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000515C();
    }

    goto LABEL_11;
  }

  if (!CFFileSecurityCopyAccessControlList(v2, &accessControlList))
  {
LABEL_11:
    uint64_t v9 = 0LL;
    goto LABEL_12;
  }

  acl_free(accessControlList);
  uint64_t v9 = 1LL;
LABEL_12:

  return v9;
}

void sub_100004904( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100004928( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100004944( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000049C8()
{
}

void sub_100004A28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid cache url", v1, 2u);
  sub_10000493C();
}

void sub_100004A64(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 code];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not serialize cache info file. Error domain: %@ code %ld",  (uint8_t *)&v5,  0x16u);
}

void sub_100004B18(void *a1, void *a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 domain]);
  int v7 = 138412802;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2048;
  id v12 = [a2 code];
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Could not write cache info file to %@. Error domain: %@ code %ld",  (uint8_t *)&v7,  0x20u);
}

void sub_100004BEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004C1C()
{
}

void sub_100004C7C()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_FAULT,  "Error creating cache folder at path: %@ with error: %@",  v2,  0x16u);
  sub_100004920();
}

void sub_100004CF8()
{
}

void sub_100004D7C()
{
}

void sub_100004E00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004E30()
{
}

void sub_100004E90()
{
}

void sub_100004EF0()
{
}

void sub_100004F50(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 uuid]);
  sub_100004914();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Returning data with UUID: %@", v4, 0xCu);
}

void sub_100004FE0(uint64_t a1, os_log_s *a2)
{
  int v2 = *(_DWORD *)(a1 + 64);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Ignoring cache for request from %d",  (uint8_t *)v3,  8u);
  sub_10000493C();
}

void sub_100005054(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = &stru_1000085A0;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = 0LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Generated image for icon %@ -- Validation token DB UUID %@ seq No %llu",  buf,  0x20u);
}

void sub_1000050B8(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  id v8 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a1);
  uint64_t v9 = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 138412802;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = v8;
  *(_WORD *)(a2 + 22) = 2048;
  *(void *)(a2 + 24) = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_DEBUG,  "Generated image for icon %@ -- Validation token DB UUID %@ seq No %llu",  (uint8_t *)a2,  0x20u);
}

void sub_10000515C()
{
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}