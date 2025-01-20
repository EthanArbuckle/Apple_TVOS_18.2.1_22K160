void sub_10000236C(id a1)
{
  PAMediaConversionServiceImageMetadataPolicy *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___PAMediaConversionServiceImageMetadataPolicy);
  v2 = (void *)qword_100039750;
  qword_100039750 = (uint64_t)v1;
}

void sub_100002960(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___PAMediaConversionServiceDefaultImageMetadataPolicy);
  v2 = (void *)qword_100039760;
  qword_100039760 = (uint64_t)v1;
}

LABEL_17:
}

LABEL_11:
  return (char)v6;
}

void sub_1000036A0(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy);
  v2 = (void *)qword_100039770;
  qword_100039770 = (uint64_t)v1;
}

void sub_10000413C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v11]);
    id v7 = [v6 mutableCopy];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    v10 = v9;

    [v10 addEntriesFromDictionary:v5];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

uint64_t sub_1000041F8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
        unsigned int v15 = [v13 isEqual:v14];

        if (!v15)
        {
          uint64_t v16 = 0LL;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = 1LL;
LABEL_11:

  return v16;
}

void sub_100005448( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_24:
      goto LABEL_25;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    unsigned int v15 = [v14 isEqualToString:NSCocoaErrorDomain];
    v13 = v15;
    if (v15)
    {
      uint64_t v16 = [v12 code];

      if (v16 != (id)260)
      {
        v13 = 0;
        if (v10) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](&OBJC_CLASS___UTType, "typeWithFilenameExtension:", v17));
      __int128 v19 = objc_claimAutoreleasedReturnValue([v18 identifier]);

      uint64_t v10 = (id)v19;
    }

    if (v10) {
      goto LABEL_13;
    }
LABEL_21:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 138543874;
      v35 = v5;
      v36 = 2112;
      v37 = v29;
      v38 = 2114;
      v39 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to determine type identifier for URL with role %{public}@ %@: %{public}@",  buf,  0x20u);
    }

    uint64_t v10 = 0LL;
    goto LABEL_24;
  }

  uint64_t v10 = 0LL;
LABEL_25:

  return v10;
}

void sub_100005F48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100006144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100006298( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100006374( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100006B08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006CD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006CE0(uint64_t a1)
{
}

void sub_100006CE8(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v9]);
  uint64_t v11 = (void *)a1[5];
  uint64_t v12 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v12 + 40);
  unsigned __int8 v13 = [v11 copyURL:v8 forRole:v9 toDirectory:v10 error:&obj];

  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    *a4 = 1;
  }
}

void sub_100006DAC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 url]);
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

int64_t sub_100006E18(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

void sub_100006E20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v13 = 0LL;
  uint64_t v14 = 0LL;
  unsigned __int8 v6 = [a3 getFileSize:&v14 error:&v13];
  id v7 = v13;
  if ((v6 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 stringValue]);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get file size for url with role %{public}@: %{public}@",  buf,  0x16u);
    }

    id v9 = @"?";
  }

  uint64_t v10 = *(void **)(a1 + 32);
  v15[0] = v5;
  v15[1] = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@"="]);
  [v10 addObject:v12];
}

void sub_100006F9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v14[0] = v5;
  int v8 = *(unsigned __int8 *)(a1 + 40);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  uint64_t v10 = v9;
  uint64_t v11 = v9;
  if (!v8) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
  }
  v14[1] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@"="]);
  [v7 addObject:v13];

  if (!v8) {
}
  }

void sub_1000070A4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isReadableFileAtPath:v7];

  *a4 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) ^ 1;
}

void sub_100007110(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v9 + 40);
  uint64_t v20 = 0LL;
  unsigned __int8 v10 = [v8 getFileSize:&v20 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 url]);
      uint64_t v17 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
      *(_DWORD *)buf = 138543874;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      uint64_t v16 = "Unable to get file size for URL ref with role %{public}@ %@: %{public}@";
      goto LABEL_10;
    }

LABEL_7:
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    *a4 = 1;
    goto LABEL_8;
  }

  if (!v20)
  {
    uint64_t v11 = (void *)a1[4];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 url]);
    uint64_t v13 = *(void *)(a1[5] + 8LL);
    id v18 = *(id *)(v13 + 40);
    LOBYTE(v11) = [v11 removeItemAtURL:v12 error:&v18];
    objc_storeStrong((id *)(v13 + 40), v18);

    if ((v11 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 url]);
        uint64_t v15 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
        *(_DWORD *)buf = 138543874;
        id v22 = v7;
        __int16 v23 = 2112;
        v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        uint64_t v16 = "Unable to remove empty file for URL ref with role %{public}@ %@: %{public}@";
LABEL_10:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);

        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

    id v7 = 0;
  }

  return v7;
}

LABEL_8:
}

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
LABEL_9:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v17 = *(void **)(a1 + 32);
    __int16 v25 = NSFileOwnerAccountName;
    uint64_t v26 = @"mobile";
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    LOBYTE(v17) = [v17 createFileAtPath:v8 contents:0 attributes:v18];

    if ((v17 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create empty file at destination %@",  buf,  0xCu);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    *a4 = 1;
    id v19 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  0LL));
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int128 v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }

LABEL_17:
}

  return v6;
}

void sub_100007330(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 url]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 url]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);

  char v24 = 0;
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  LODWORD(v11) = [v11 fileExistsAtPath:v12 isDirectory:&v24];

  if ((_DWORD)v11)
  {
    if (v24) {
      goto LABEL_9;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    uint64_t v13 = "Attempting to create empty destination output file at path %@ but the parent directory path exists and is not a directory";
    goto LABEL_19;
  }

  uint64_t v14 = *(void **)(a1 + 32);
  NSFileAttributeKey v27 = NSFileOwnerAccountName;
  v28 = @"mobile";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v16 + 40);
  LOBYTE(v14) = [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v15 error:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    *(_DWORD *)buf = 138412290;
    v30 = v22;
    uint64_t v13 = "Attempting to create empty destination output file at path %@ but parent directory creation failed:";
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
  }

void sub_10000767C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 dictionaryRepresentationWithError:&obj]);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to encode bookmark data for resource in role %{public}@: %{public}@",  buf,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  *a4 = *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
}

id sub_1000077C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = 0LL;
  id result = [a3 getPathHash:&v5 lastPathComponent:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) ^= v5;
  return result;
}

void sub_100007A14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

int64_t sub_100007D24(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

void sub_100007D2C(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceResourceURLReference referenceWithDictionaryRepresentation:error:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLReference,  "referenceWithDictionaryRepresentation:error:",  a3,  &obj));
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1[4] + 8) setObject:v9 forKeyedSubscript:v7];
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to decode bookmark data for resource in role %{public}@: %{public}@",  buf,  0x16u);
    }

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  *a4 = *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}
}

void sub_1000083D0(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to send progress update for request %{public}@ to client: %{public}@",  (uint8_t *)&v5,  0x16u);
  }

void sub_100008B94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100008C58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009068( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000910C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000091B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009314(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a2 requestTracker]);
  unint64_t v6 = (unint64_t)[v5 effectivePriority];

  if (v6 > 4 || ((6u >> v6) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

void sub_100009380(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a2 requestTracker]);
  unint64_t v6 = (unint64_t)[v5 effectivePriority];

  if (v6 > 4 || (v6 & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

void sub_1000093E4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v2 + 24))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([a2 requestTracker]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 effectivePriority] == *(id *)(a1 + 40);
  }

  else
  {
    *(_BYTE *)(v2 + 24) = 0;
  }

int64_t sub_100009458(id a1, ClientRequest *a2, ClientRequest *a3)
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientRequest requestTracker](a2, "requestTracker"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientRequest requestTracker](v4, "requestTracker"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_1000094C4(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v8 connectionIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  unsigned int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    unint64_t v6 = *(void **)(a1 + 40);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    [v6 addObject:v7];
  }
}

uint64_t sub_100009550(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009560(uint64_t a1)
{
}

void sub_100009568(uint64_t a1, void *a2, _BYTE *a3)
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([a2 requestTracker]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 destinationURLCollection]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    *a3 = 1;
  }
}

void sub_1000095D8(uint64_t a1, void *a2, _BYTE *a3)
{
  id v8 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

void sub_10000965C(id a1, ClientRequest *a2, BOOL *a3)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ClientRequest requestTracker](a2, "requestTracker", a3));
  [v3 didDequeueAndStartProcessingRequest];
}

uint64_t sub_10000968C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_6:
  os_unfair_lock_unlock(&self->_queueStateLock);
  if (v18)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueue delegate](self, "delegate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v19;
      v44 = 2114;
      v45 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Enqueued new request while currently processing queue entry is optional, requesting delegate %@ to cancel %{public}@",  buf,  0x16u);
    }

    if (v19)
    {
      -[MediaConversionQueue assertDelegate:respondsToSelector:]( self,  "assertDelegate:respondsToSelector:",  v19,  "conversionQueue:cancelCurrentlyProcessingEntry:");
      [v19 conversionQueue:self cancelCurrentlyProcessingEntry:v18];
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v13;
}

void sub_100009D54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v33 = objc_begin_catch(exception_object);
      id v34 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
        *(_DWORD *)(v32 - 144) = 138543618;
        *(void *)(v31 + 4) = v35;
        *(_WORD *)(v32 - 132) = 2114;
        *(void *)(v31 + 14) = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Exception while enqueueing new queue entry %{public}@: %{public}@",  (uint8_t *)(v32 - 144),  0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x100009ADCLL);
    }

    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v30);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x100009E70LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10000AFB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000B1AC( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int buf, __int128 a18)
{
  if (a2)
  {
    _Block_object_dispose(&buf, 8);
    id v21 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      id v22 = v21;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        buf = 138543618;
        WORD2(a1_Block_object_dispose((const void *)(v11 - 96), 8) = 2114;
        *(void *)((char *)&a18 + 6) = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Exception while modifying request with identifier %{public}@: %{public}@",  (uint8_t *)&buf,  0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x10000B120LL);
    }

    os_unfair_lock_unlock(v18);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x10000B24CLL);
  }

  _Unwind_Resume(a1);
}

void sub_10000B3E0( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, __int128 a14)
{
  if (a2)
  {
    id v16 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      id v17 = v16;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        buf = 138543618;
        WORD2(a14) = 2114;
        *(void *)((char *)&a14 + 6) = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Exception while cancelling request with identifier %{public}@: %{public}@",  (uint8_t *)&buf,  0x16u);
      }

      objc_end_catch();
      os_unfair_lock_unlock(v14);
      JUMPOUT(0x10000B350LL);
    }

    os_unfair_lock_unlock(v14);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x10000B484LL);
  }

  _Unwind_Resume(a1);
}

LABEL_13:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12 != 0;
}

void sub_10000B748( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000BE5C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 requestIdentifiersForConnectionIdentifier:*(void *)(a1 + 40)]);
  [v2 addObjectsFromArray:v3];
}

void sub_10000BEA0(void *a1, void *a2, _BYTE *a3)
{
  id v6 = a2;
  uint64_t v12 = 0LL;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 removeAndReturnClientRequestWithIdentifier:a1[4] remainingRequestCount:&v12]);
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
  if (v10)
  {
    [v10 setCancellationReasonDebugDescription:@"Client request"];
    *a3 = 1;
    if (!v12) {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[4];
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Found client request reference for cancelled request identifier %{public}@ in conversion %{public}@, remaining r equest count %lu",  buf,  0x20u);
    }
  }
}

void sub_10000BFE0(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue([a2 clientRequestForIdentifier:*(void *)(a1 + 32)]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    *a3 = 1;
  }
}

void sub_10000C03C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceURLForRole:v7]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    __int16 v32 = 2114;
    uint64_t v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Copying conversion output %@ (role %@) to destination %@ for request %{public}@",  buf,  0x2Au);
  }

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to copy conversion request output - destination URL collection for request %{public}@ is missing URL for role %@",  buf,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to copy conversion output - destination URL collection is missing URL for role %@",  v7));
    NSFileAttributeKey v25 = v16;
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v17));
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    goto LABEL_11;
  }

  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v14 + 40);
  unsigned __int8 v15 = [v13 copyItemAtURL:v8 toURL:v9 error:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v22 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      *(_DWORD *)buf = 138543618;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to copy conversion output for role %{public}@: %@",  buf,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
LABEL_11:
    *a4 = 1;
  }
}

int64_t sub_10000C330(id a1, MediaConversionQueueEntry *a2, MediaConversionQueueEntry *a3)
{
  return -[MediaConversionQueueEntry compareProcessingOrderToEntry:](a2, "compareProcessingOrderToEntry:", a3);
}

id sub_10000C338(uint64_t a1)
{
  return [*(id *)(a1 + 32) processQueue];
}

uint64_t sub_10000C340(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000C350(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6 = a2;
  unsigned __int8 v11 = 0;
  unsigned int v7 = [*(id *)(a1 + 32) taskTypeSupportsDeduplication];
  LOBYTE(v_Block_object_dispose((const void *)(v11 - 96), 8) = 0;
  if (v7)
  {
    unsigned int v8 = [v6 taskTypeSupportsDeduplication];
    if (v8) {
      LOBYTE(v_Block_object_dispose((const void *)(v11 - 96), 8) = [v6 clientRequestIsDuplicate:*(void *)(a1 + 40) identicalDestination:&v11];
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v8;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    if (![*(id *)(a1 + 40) requiresDeduplicationAgainstOriginalWithIdenticalOutput] || v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
        *(_DWORD *)buf = 138544130;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        unsigned __int8 v15 = v10;
        __int16 v16 = 2114;
        id v17 = v6;
        __int16 v18 = 1024;
        int v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "New queue entry %{public}@ for request %{public}@ is duplicate of existing entry %{public}@ (identical output: %d), attached request to existing entry",  buf,  0x26u);
      }

      [v6 addClientRequest:*(void *)(a1 + 40)];
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

LABEL_48:
            v39 = 2LL;
            goto LABEL_49;
          }

          __int16 v32 = v31;
          CGImageDestinationAddImage(v24, v31, (CFDictionaryRef)v13);
          CGImageRelease(v32);
LABEL_43:
          if (CGImageDestinationFinalize(v24))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue([v5 imageDestinationData]);
            [v5 setDestinationData:v37];

            v38 = (void *)objc_claimAutoreleasedReturnValue([v5 imageDestinationData]);
            +[PAMediaConversionServiceSharedUtilitiesServiceSide imageSizeForImageData:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "imageSizeForImageData:",  v38);
            objc_msgSend(v5, "setOutputImageSize:");

            v39 = 1LL;
LABEL_49:
            [v5 setStatus:v39];
LABEL_50:

LABEL_51:
            goto LABEL_52;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 logMessageSummary]);
            *(_DWORD *)buf = 138412290;
            *(void *)v64 = v41;
            v42 = "Unable to finalize output image for image conversion of %@";
LABEL_63:
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  v42,  buf,  0xCu);

            goto LABEL_48;
          }

          goto LABEL_48;
        }

        if (v12
          && (([v5 isRAWSourceUTI] & 1) != 0
           || [v26 isEqual:UTTypeTIFF])
          && ([v5 shouldUseEmbeddedImageAsSource] & 1) == 0)
        {
          v61[0] = kCIContextCacheIntermediates;
          v61[1] = kCIContextName;
          v62[0] = &__kCFBooleanFalse;
          v62[1] = @"PAMediaConversionSeriveSharedUtilitiesServerSide-executeConversionJob";
          v61[2] = kCIContextIntermediateMemoryTarget;
          v62[2] = &off_1000332E8;
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  3LL));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[CIContext contextWithOptions:](&OBJC_CLASS___CIContext, "contextWithOptions:", v43));

          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          [v5 scaleFactor];
          if (v46 != 1.0)
          {
            [v5 scaleFactor];
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            [v45 setObject:v47 forKeyedSubscript:kCIInputScaleFactorKey];
          }

          v48 = (void *)objc_claimAutoreleasedReturnValue([v5 mainSourceResourceURL]);
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[CIFilter filterWithImageURL:options:]( &OBJC_CLASS___CIFilter,  "filterWithImageURL:options:",  v48,  v45));

          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 outputImage]);
          v51 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
          v52 = (CGColorSpace *)CFAutorelease(v51);
          [v50 extent];
          v57 = (CGImage *)objc_msgSend( v44,  "createCGImage:fromRect:format:colorSpace:deferred:",  v50,  kCIFormatRGBA8,  sub_10000F540((uint64_t)objc_msgSend(v5, "colorspaceMode"), v52),  1,  v53,  v54,  v55,  v56);
          if (v57)
          {
            [v13 setObject:&off_100033300 forKeyedSubscript:kCGImagePropertyOrientation];
            [v13 removeObjectForKey:kCGImageDestinationOptimizeColorForSharing];
            CGImageDestinationAddImage(v24, v57, (CFDictionaryRef)v13);
            CFRelease(v57);
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);
              v58 = (void *)objc_claimAutoreleasedReturnValue([v60 logMessageSummary]);
              *(_DWORD *)buf = 138412290;
              *(void *)v64 = v58;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to generate image using CIRawFilter for %@",  buf,  0xCu);
            }

            [v5 setStatus:2];
          }

          if (!v57) {
            goto LABEL_50;
          }
          goto LABEL_43;
        }

        [v5 scaleFactor];
        if (v33 != 1.0)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 requestedOrCalculatedMaximumLongSideLength]));
          [v13 setObject:v34 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];
        }

        [v13 setObject:kCGImageSourceDecodeToSDR forKeyedSubscript:kCGImageSourceDecodeRequest];
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationCreateHDRGainMap];
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationPreserveGainMap];
        [v13 setObject:&off_100033348 forKeyedSubscript:kCGImageDestinationLossyCompressionQuality];
        if (v16)
        {
          if (v16 == (id)1)
          {
            [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageSourceCreateThumbnailWithTransform];
LABEL_41:
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 requestedOrCalculatedMaximumLongSideLength]));
            [v13 setObject:v35 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];
          }
        }

        else if ([v5 shouldUseEmbeddedImageAsSource])
        {
          goto LABEL_41;
        }

        PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v23);
        CGImageDestinationAddImageFromSource(v24, v23, PrimaryImageIndex, (CFDictionaryRef)v13);
        goto LABEL_43;
      }

      unsigned __int8 v15 = @"sRGB";
    }

    [v13 setObject:v15 forKeyedSubscript:kCGImageDestinationOptimizeColorForSharing];
    goto LABEL_17;
  }

  [v5 setStatus:2];
LABEL_52:
}

void sub_10000F3F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v6, v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v8]);

  [*(id *)(a1 + 40) setResourceURL:v9 forRole:v6];
}

CGColorSpaceRef sub_10000F4A0(CGImage *a1, void *a2, uint64_t a3)
{
  if ([a2 conformsToType:UTTypeRAWImage])
  {
    CGColorSpaceRef v5 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
    ColorSpace = (CGColorSpace *)CFAutorelease(v5);
  }

  else
  {
    ColorSpace = CGImageGetColorSpace(a1);
  }

  unsigned int v7 = ColorSpace;
  if (ColorSpace)
  {
    if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB) {
      uint64_t v8 = a3;
    }
    else {
      uint64_t v8 = 0LL;
    }
    return sub_10000F540(v8, v7);
  }

  else
  {
    CGColorSpaceRef result = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    if (result) {
      return (CGColorSpaceRef)CFAutorelease(result);
    }
  }

  return result;
}

CGColorSpaceRef sub_10000F540(uint64_t a1, CGColorSpaceRef space)
{
  if (a1)
  {
    CGColorSpaceRef result = CGColorSpaceRetain(space);
    if (!result) {
      return result;
    }
    return (CGColorSpaceRef)CFAutorelease(result);
  }

  CGColorSpaceRef result = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  if (result) {
    return (CGColorSpaceRef)CFAutorelease(result);
  }
  return result;
}

id sub_100010584(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0LL;
  id v3 = 0LL;
  if (PFFigGetImageSourceImageIndexForContainerItemID( *(void *)(a1 + 48),  *(void *)(a1 + 32),  a2,  &v7))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:v7]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned int v5 = [v3 isEqual:v4];

    if (v5)
    {

      id v3 = 0LL;
    }
  }

  return v3;
}

void sub_100010E9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001178C(_Unwind_Exception *a1)
{
}

void sub_1000119B0(_Unwind_Exception *a1)
{
}

void sub_100011C94(_Unwind_Exception *a1)
{
}

void sub_100011D6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_1000122C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineAndNotifyProgress];
}

void sub_100012418( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001267C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001268C(uint64_t a1)
{
}

void sub_100012694(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PFMetadataUtilities itemsByRemovingMetadataItemForIdentifier:fromArray:]( &OBJC_CLASS___PFMetadataUtilities,  "itemsByRemovingMetadataItemForIdentifier:fromArray:",  v6,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)));
    id v9 = [v8 mutableCopy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unsigned __int8 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (([v7 isEqual:&stru_1000325B0] & 1) == 0
      && (+[PFMetadataUtilities addQuickTimeMetadataItemsWithIdentifier:value:toItems:]( &OBJC_CLASS___PFMetadataUtilities,  "addQuickTimeMetadataItemsWithIdentifier:value:toItems:",  v6,  v7,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create metadata item for key %{public}@",  (uint8_t *)&v12,  0xCu);
    }
  }
}

void sub_1000127F0(id a1)
{
  v6[0] = @"PAMediaConversionServiceOptionAVMetadataOriginatingSignatureKey";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[PFMetadata originatingAssetIdentifierMetadataIdentifier]( &OBJC_CLASS___PFMetadata,  "originatingAssetIdentifierMetadataIdentifier"));
  v7[0] = v1;
  v6[1] = @"PAMediaConversionServiceOptionAVMetadataRenderOriginatingSignatureKey";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[PFMetadata renderOriginatingAssetIdentifierMetadataIdentifier]( &OBJC_CLASS___PFMetadata,  "renderOriginatingAssetIdentifierMetadataIdentifier"));
  v7[1] = v2;
  v6[2] = @"PAMediaConversionServiceOptionLivePhotoPairingIdentifierKey";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PFMetadata livePhotoPairingIdentifierMetadataIdentifier]( &OBJC_CLASS___PFMetadata,  "livePhotoPairingIdentifierMetadataIdentifier"));
  v7[2] = v3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));
  id v5 = (void *)qword_100039780;
  qword_100039780 = v4;
}

void sub_100012920(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  uint64_t v2 = (void *)qword_100039798;
  qword_100039798 = (uint64_t)v1;

  [(id)qword_100039798 setFormatOptions:1907];
}

LABEL_28:
    goto LABEL_29;
  }

  -[ExportSessionVideoTranscodingTask performMetadataTrackExtractionConversion]( self,  "performMetadataTrackExtractionConversion");
LABEL_32:
}

      uint64_t v10 = (char *)v10 + 1;
    }

    while (v10 != v8);
    uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v8) {
      continue;
    }
    break;
  }

void sub_100012F50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000147A4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) exportSession]);
  [*(id *)(a1 + 32) determineAndNotifyProgress];
  [*(id *)(a1 + 32) cancelProgressUpdateTimerAndMarkEndTime];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    id v4 = [v2 status];
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);
    *(_DWORD *)buf = 138543874;
    __int16 v28 = v3;
    __int16 v29 = 2048;
    id v30 = v4;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Export session completion for task %{public}@, status: %ld, error: %@",  buf,  0x20u);
  }

  id v6 = [v2 status];
  if (v6 != (id)3)
  {
    if (v6 == (id)5)
    {
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v24 = @"Export was cancelled";
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      [*(id *)(a1 + 32) setStatus:4];
      uint64_t v9 = 5LL;
      goto LABEL_12;
    }

    if (v6 == (id)4)
    {
      [*(id *)(a1 + 32) setStatus:2];
      v26[0] = @"Export failed";
      v25[0] = NSLocalizedDescriptionKey;
      v25[1] = NSUnderlyingErrorKey;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);
      v26[1] = v7;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));

      uint64_t v9 = 2LL;
LABEL_12:
      int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  v9,  v8));
      [*(id *)(a1 + 32) setError:v19];

      unsigned __int8 v11 = 0LL;
      id v12 = 0LL;
      goto LABEL_16;
    }

    unsigned __int8 v11 = 0LL;
    id v12 = 0LL;
    goto LABEL_15;
  }

  uint64_t v10 = *(void **)(a1 + 32);
  id v20 = 0LL;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 outputAssetInformationWithError:&v20]);
  id v12 = v20;
  id v13 = *(void **)(a1 + 32);
  if (!v11)
  {
    [v13 setStatus:2];
    [*(id *)(a1 + 32) setError:v12];
    goto LABEL_15;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resultInformation]);
  [v14 addEntriesFromDictionary:v11];

  [*(id *)(a1 + 32) setStatus:1];
  [*(id *)(a1 + 32) dumpStatistics];
  if (![*(id *)(a1 + 32) wantsResultAsData])
  {
LABEL_15:
    uint64_t v8 = 0LL;
    goto LABEL_16;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outputMainResourceURL]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v15));

  uint64_t v17 = *(void **)(a1 + 32);
  if (v16)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resultInformation]);
    [v18 setObject:v16 forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];
    uint64_t v8 = 0LL;
  }

  else
  {
    [v17 setStatus:2];
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    id v22 = @"Unable to initialize data buffer with video conversion result";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v8));
    [*(id *)(a1 + 32) setError:v18];
  }

LABEL_16:
  [*(id *)(a1 + 32) callCompletionHandler];
}

void sub_100014B64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) exportSessionCompletionHandler]);
  [v2 exportAsynchronouslyWithCompletionHandler:v3];
}

void sub_100014BB0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  else
  {
    [*(id *)(a1 + 32) setStatus:2];
    [*(id *)(a1 + 32) setError:v7];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      int v10 = 138543619;
      unsigned __int8 v11 = v8;
      __int16 v12 = 2113;
      uint64_t v13 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get export session for conversion task %{public}@ from PFVideoAVObjectBuilder, asset %{private}@",  (uint8_t *)&v10,  0x16u);
    }

    [*(id *)(a1 + 32) callCompletionHandler];
  }
}

void sub_1000151E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100015518(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Single pass video export item %{public}@ for conversion task %{public}@ cancelled",  (uint8_t *)&v5,  0x16u);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000155F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  switch(a2)
  {
    case 0LL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
        int v15 = 138543874;
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = 0LL;
        __int16 v19 = 2114;
        id v20 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Ignoring single pass video export item %{public}@ unexpected status %lu for conversion task %{public}@",  (uint8_t *)&v15,  0x20u);
      }

      break;
    case 1LL:
      uint64_t v10 = 2LL;
      [*(id *)(a1 + 32) setStatus:2];
      if ([v7 code] == (id)5) {
        uint64_t v10 = 5LL;
      }
      v21[0] = NSLocalizedDescriptionKey;
      v21[1] = NSUnderlyingErrorKey;
      v22[0] = @"Unable to create single pass export item";
      v22[1] = v7;
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  v10,  v11));
      [*(id *)(a1 + 32) setError:v12];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
        int v15 = 138543874;
        uint64_t v16 = v13;
        __int16 v17 = 2114;
        uint64_t v18 = v14;
        __int16 v19 = 2114;
        id v20 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Single pass video export item %{public}@ for conversion task %{public}@ failed with error %{public}@",  (uint8_t *)&v15,  0x20u);
      }

      goto LABEL_10;
    case 2LL:
      [*(id *)(a1 + 32) determineAndNotifyProgress];
      break;
    case 3LL:
      [*(id *)(a1 + 32) setStatus:1];
LABEL_10:
      [*(id *)(a1 + 32) callCompletionHandler];
      break;
    default:
      break;
  }
}

void sub_100015838(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v9 = 0LL;
  unsigned __int8 v3 = [v2 startConversionWithError:&v9 outputAvailableHandler:*(void *)(a1 + 56)];
  id v4 = v9;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v3;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 32) setSinglePassExportItem:0];
    [*(id *)(a1 + 32) setStatus:2];
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSUnderlyingErrorKey;
    v17[0] = @"Unable to start single pass export item";
    v17[1] = v4;
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v5));
    [*(id *)(a1 + 32) setError:v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to start single pass video export item %{public}@ for conversion task %{public}@: %{public}@",  buf,  0x20u);
    }

    [*(id *)(a1 + 32) callCompletionHandler];
  }
}

void sub_100015D98(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) setStatus:1];
  }

  else
  {
    if ([v5 code] == (id)3) {
      uint64_t v6 = 5LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    [*(id *)(a1 + 32) setStatus:v6];
    [*(id *)(a1 + 32) setError:v7];
  }

  [*(id *)(a1 + 32) callCompletionHandler];
}

LABEL_26:
  }
}

void sub_10001799C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_10001853C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543874;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Connection %{public}@ to %p terminated: %@",  (uint8_t *)&v5,  0x20u);
  }

  if (WeakRetained) {
    [WeakRetained cancelJobsForConnectionWithIdentifier:*(void *)(a1 + 32)];
  }
}

void sub_100018614(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v27 = @"PAMediaConversionServiceOptionJobPriorityKey";
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v27,  1LL));
    id v4 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v8]);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            id v21 = v3;
            __int16 v22 = 2114;
            NSErrorUserInfoKey v23 = v8;
            __int16 v24 = 2114;
            NSFileAttributeKey v25 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Applying modification to request %{public}@: %{public}@ / %{public}@",  buf,  0x20u);
          }

          if ([v8 isEqualToString:@"PAMediaConversionServiceOptionJobPriorityKey"])
          {
            if ((objc_opt_respondsToSelector(v9, "integerValue") & 1) == 0)
            {
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
              [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"VideoConversionService.m", 1857, @"Unexpected value type %@ for request modification key %@ for request %@", objc_opt_class(v9), v8, *(void *)(a1 + 32) object file lineNumber description];
            }

            id v10 = [v9 integerValue];
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 requestTracker]);
            [v11 setEffectivePriority:v10];
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            __int16 v12 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            id v21 = v12;
            __int16 v22 = 2112;
            NSErrorUserInfoKey v23 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Ignoring modification for request %@ with unknown key %@",  buf,  0x16u);
          }
        }

        id v5 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
      }

      while (v5);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v21 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Ignoring modifications for unknown request identifier %@",  buf,  0xCu);
  }
}

uint64_t sub_100018934(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100018948(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138543362;
    uint64_t v4 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Request queue issued cancellation for queue entry %{public}@",  (uint8_t *)&v3,  0xCu);
  }

void sub_1000198C0(_Unwind_Exception *a1)
{
}

LABEL_25:
LABEL_26:
  return v11;
}

LABEL_33:
  return v9;
}

int64_t sub_10001BF00(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

uint64_t sub_10001BF08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001BF18(uint64_t a1)
{
}

void sub_10001BF20(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceURLForRole:v7]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestIdentifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) requestIdentifier]);
    *(_DWORD *)buf = 138413314;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2114;
    __int16 v29 = v10;
    __int16 v30 = 2112;
    __int16 v31 = v9;
    __int16 v32 = 2114;
    uint64_t v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Copying destination URL (role %@) from original %@ (request %{public}@) to duplicate %@ (request %{public}@) ",  buf,  0x34u);
  }

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to copy duplicate request output - destination URL collection is missing URL for role %@",  buf,  0xCu);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to copy duplicate request output - destination URL collection is missing URL for role %@",  v7));
    NSErrorUserInfoKey v23 = v15;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v16));
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8LL);
    __int128 v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    goto LABEL_11;
  }

  __int16 v12 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id obj = *(id *)(v13 + 40);
  unsigned __int8 v14 = [v12 copyItemAtURL:v8 toURL:v9 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v20 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
      *(_DWORD *)buf = 138543618;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to copy duplicate request output for role %{public}@: %@",  buf,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
LABEL_11:
    *a4 = 1;
  }
}

id objc_msgSend_URLByResolvingBookmarkData_options_relativeToURL_bookmarkDataIsStale_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:");
}

id objc_msgSend__generatePosterFrameExportForVideoURL_imageDestinationToAddToAndFinalize_maximumSize_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:");
}

id objc_msgSend_bookmarkDataWithOptions_includingResourceValuesForKeys_relativeToURL_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:");
}

id objc_msgSend_connectionTerminationEventHandlerForConnectionIdentifier_eventDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTerminationEventHandlerForConnectionIdentifier:eventDescription:");
}

id objc_msgSend_dataForSingleImageJPEGPassthroughConversionForImageSource_primaryImageProperties_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForSingleImageJPEGPassthroughConversionForImageSource:primaryImageProperties:");
}

id objc_msgSend_dumpResourceURLCollection_toParentDirectory_directoryName_updatingDebugInformation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpResourceURLCollection:toParentDirectory:directoryName:updatingDebugInformation:");
}

id objc_msgSend_findAndRemoveCancelledRequest_queueEntryWithoutRemainingClients_forRequestIdentifier_shouldCancelCurrentQueueEntry_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "findAndRemoveCancelledRequest:queueEntryWithoutRemainingClients:forRequestIdentifier:shouldCancelCurrentQueueEntry:");
}

id objc_msgSend_initWithSourceBookmarkDictionary_outputURLCollection_options_requestTracker_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSourceBookmarkDictionary:outputURLCollection:options:requestTracker:");
}

id objc_msgSend_logMissingPropertiesInCMPhotoOutputData_comparedToProcessedSourceImagePropertiesByIndex_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMissingPropertiesInCMPhotoOutputData:comparedToProcessedSourceImagePropertiesByIndex:");
}

id objc_msgSend_markCompletionAndRetrieveClientRequestsForQueueEntry_resultURLCollection_didConvertSuccessfully_conversionOutputInformation_conversionOutputData_conversionOutputFileType_conversionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "markCompletionAndRetrieveClientRequestsForQueueEntry:resultURLCollection:didConvertSuccessfully:conversionOut putInformation:conversionOutputData:conversionOutputFileType:conversionError:");
}

id objc_msgSend_newScaledImageForImageRef_inputSize_outputSize_sx_sy_orientation_colorspace_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newScaledImageForImageRef:inputSize:outputSize:sx:sy:orientation:colorspace:");
}

id objc_msgSend_performConversionOfClass_forSourceBookmarkDictionary_destinationBookmarkDictionary_options_replyHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performConversionOfClass:forSourceBookmarkDictionary:destinationBookmarkDictionary:options:replyHandler:");
}

id objc_msgSend_processCompletedQueueEntry_resultURLCollection_didConvertSuccessfully_conversionOutputInformation_conversionOutputData_conversionOutputFileType_conversionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "processCompletedQueueEntry:resultURLCollection:didConvertSuccessfully:conversionOutputInformation:conversionO utputData:conversionOutputFileType:conversionError:");
}

id objc_msgSend_shouldMaximizeVideoConversionPowerEfficiencyForOptions_inputAssetDuration_taskIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldMaximizeVideoConversionPowerEfficiencyForOptions:inputAssetDuration:taskIdentifier:");
}

id objc_msgSend_singlePassExportItemForAssetAtFileURL_destinationURL_targetFileSize_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singlePassExportItemForAssetAtFileURL:destinationURL:targetFileSize:error:");
}

id objc_msgSend_temporaryDestinationURLCollectionForFinalDestinationURLCollection_inParentDirectoryURL_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDestinationURLCollectionForFinalDestinationURLCollection:inParentDirectoryURL:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}