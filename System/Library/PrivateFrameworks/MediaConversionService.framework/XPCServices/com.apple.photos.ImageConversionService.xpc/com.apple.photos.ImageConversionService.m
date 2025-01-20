int main(int argc, const char **argv, const char **envp)
{
  +[ImageConversionService run](&OBJC_CLASS___ImageConversionService, "run", envp);
  return 0;
}

void sub_1000045C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_24:
      goto LABEL_25;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    v15 = [v14 isEqualToString:NSCocoaErrorDomain];
    v13 = v15;
    if (v15)
    {
      v16 = [v12 code];

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
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](&OBJC_CLASS___UTType, "typeWithFilenameExtension:", v17));
      v19 = objc_claimAutoreleasedReturnValue([v18 identifier]);

      v10 = (id)v19;
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

    v10 = 0LL;
    goto LABEL_24;
  }

  v10 = 0LL;
LABEL_25:

  return v10;
}

void sub_1000050C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000052C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100005414( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000054F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005C84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

uint64_t sub_100005E4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005E5C(uint64_t a1)
{
}

void sub_100005E64(void *a1, void *a2, void *a3, _BYTE *a4)
{
  v7 = (void *)a1[4];
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

void sub_100005F28(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 url]);
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

int64_t sub_100005F94(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

void sub_100005F9C(uint64_t a1, void *a2, void *a3)
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

void sub_100006118(uint64_t a1, void *a2, void *a3)
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

void sub_100006220(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isReadableFileAtPath:v7];

  *a4 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) ^ 1;
}

void sub_10000628C(void *a1, void *a2, void *a3, _BYTE *a4)
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
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }

LABEL_17:
}

void sub_1000064AC(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
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

void sub_1000067F8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
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

id sub_100006940(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = 0LL;
  id result = [a3 getPathHash:&v5 lastPathComponent:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) ^= v5;
  return result;
}

void sub_100006B90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

int64_t sub_100006EA0(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

void sub_100006EA8(void *a1, void *a2, uint64_t a3, _BYTE *a4)
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

void sub_10000724C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___PAMediaConversionServiceImageMetadataPolicy);
  v2 = (void *)qword_100030508;
  qword_100030508 = (uint64_t)v1;
}

void sub_100007840(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___PAMediaConversionServiceDefaultImageMetadataPolicy);
  v2 = (void *)qword_100030518;
  qword_100030518 = (uint64_t)v1;
}

LABEL_17:
}

LABEL_11:
  return (char)v6;
}

void sub_100008580(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy);
  v2 = (void *)qword_100030528;
  qword_100030528 = (uint64_t)v1;
}

void sub_10000901C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v11]);
    id v7 = [v6 mutableCopy];
    uint64_t v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v10 = v9;

    [v10 addEntriesFromDictionary:v5];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

uint64_t sub_1000090D8(void *a1, void *a2, void *a3)
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
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v18));
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
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
}

void sub_100009C84(uint64_t a1, uint64_t a2)
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

void sub_10000A448( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A50C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A91C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A9C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000AA64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000ABC8(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a2 requestTracker]);
  unint64_t v6 = (unint64_t)[v5 effectivePriority];

  if (v6 > 4 || ((6u >> v6) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

void sub_10000AC34(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a2 requestTracker]);
  unint64_t v6 = (unint64_t)[v5 effectivePriority];

  if (v6 > 4 || (v6 & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

void sub_10000AC98(uint64_t a1, void *a2)
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

int64_t sub_10000AD0C(id a1, ClientRequest *a2, ClientRequest *a3)
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientRequest requestTracker](a2, "requestTracker"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientRequest requestTracker](v4, "requestTracker"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10000AD78(uint64_t a1, void *a2)
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

uint64_t sub_10000AE04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000AE14(uint64_t a1)
{
}

void sub_10000AE1C(uint64_t a1, void *a2, _BYTE *a3)
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

void sub_10000AE8C(uint64_t a1, void *a2, _BYTE *a3)
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

void sub_10000AF10(id a1, ClientRequest *a2, BOOL *a3)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ClientRequest requestTracker](a2, "requestTracker", a3));
  [v3 didDequeueAndStartProcessingRequest];
}

uint64_t sub_10000AF40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_6:
  os_unfair_lock_unlock(&self->_queueStateLock);
  if (v18)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueue delegate](self, "delegate"));
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

void sub_10000B608( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
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
      JUMPOUT(0x10000B390LL);
    }

    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v30);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x10000B724LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10000C86C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000CA60( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int buf, __int128 a18)
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
      JUMPOUT(0x10000C9D4LL);
    }

    os_unfair_lock_unlock(v18);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x10000CB00LL);
  }

  _Unwind_Resume(a1);
}

void sub_10000CC94( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, __int128 a14)
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
      JUMPOUT(0x10000CC04LL);
    }

    os_unfair_lock_unlock(v14);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x10000CD38LL);
  }

  _Unwind_Resume(a1);
}

LABEL_13:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12 != 0;
}

void sub_10000CFFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_10000D710(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 requestIdentifiersForConnectionIdentifier:*(void *)(a1 + 40)]);
  [v2 addObjectsFromArray:v3];
}

void sub_10000D754(void *a1, void *a2, _BYTE *a3)
{
  id v6 = a2;
  uint64_t v12 = 0LL;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 removeAndReturnClientRequestWithIdentifier:a1[4] remainingRequestCount:&v12]);
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  id v9 = *(void **)(v8 + 40);
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

void sub_10000D894(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue([a2 clientRequestForIdentifier:*(void *)(a1 + 32)]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    *a3 = 1;
  }
}

void sub_10000D8F0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceURLForRole:v7]);
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
    __int128 v20 = *(void **)(v19 + 40);
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

int64_t sub_10000DBE4(id a1, MediaConversionQueueEntry *a2, MediaConversionQueueEntry *a3)
{
  return -[MediaConversionQueueEntry compareProcessingOrderToEntry:](a2, "compareProcessingOrderToEntry:", a3);
}

id sub_10000DBEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) processQueue];
}

uint64_t sub_10000DBF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000DC04(uint64_t a1, void *a2, _BYTE *a3)
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
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
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

void sub_100010D18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v6, v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v8]);

  [*(id *)(a1 + 40) setResourceURL:v9 forRole:v6];
}

CGColorSpaceRef sub_100010DC4(uint64_t a1, CGColorSpaceRef space)
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

void sub_100011D04(_Unwind_Exception *a1)
{
}

LABEL_5:
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPassthroughConversionKey"]);
  id v21 = [v20 BOOLValue];

  id v22 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"]);
  __int16 v23 = [v22 BOOLValue];

  NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"]);
  if (!v24)
  {
    NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue( [v16 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"]);
    if (!v24)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v107 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to determine output file type from destination URL, defaulting to JPEG.",  v107,  2u);
      }

      NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
    }
  }

  v97 = self;
  *(CGSize *)v107 = CGSizeZero;
  v104 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  NSFileAttributeKey v25 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMetadataPolicyKey"]);
  if (v25) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v23;
  }
  if ((v26 & 1) == 0)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v88 handleFailureInMethod:a2 object:v97 file:@"ImageConversionService.m" lineNumber:372 description:@"Missing metadata policy"];
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequiresBlastDoorAccessKey"]);
  v103 = v16;
  if ([v27 BOOLValue])
  {
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v28 BOOLForKey:@"PADisablePhotosBlastDoorProcessing"];

    __int16 v16 = v103;
  }

  if (!v21)
  {
    if (v23)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to calculate photos adjustments information on this platform",  buf,  2u);
      }

      uint64_t v31 = 0LL;
      v35 = 0LL;
      id v34 = 0;
      goto LABEL_39;
    }

    v36 = objc_alloc(&OBJC_CLASS___PAMediaConversionServiceImageConversionJob);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"]);
    v38 = v16;
    v39 = -[PAMediaConversionServiceImageConversionJob initWithRequestIdentifier:sourceResourceURLCollection:outputFileType:]( v36,  "initWithRequestIdentifier:sourceResourceURLCollection:outputFileType:",  v37,  v14,  v24);

    -[PAMediaConversionServiceImageConversionJob setDestinationResourceURLCollection:]( v39,  "setDestinationResourceURLCollection:",  v38);
    -[PAMediaConversionServiceImageConversionJob setMetadataPolicy:](v39, "setMetadataPolicy:", v25);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"]);

    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"]);
      v42 = [v41 integerValue];
    }

    else
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRotationAngleDegreesKey"]);

      if (!v52)
      {
        -[PAMediaConversionServiceImageConversionJob setOrientation:](v39, "setOrientation:", 0LL);
        goto LABEL_50;
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRotationAngleDegreesKey"]);
      v42 = (id)IPAOrientationFromClockwiseRotation([v41 integerValue]);
    }

    -[PAMediaConversionServiceImageConversionJob setOrientation:](v39, "setOrientation:", v42);

LABEL_50:
    v53 = (id)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"]);

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"]);
      v53 = [v54 integerValue];

      if ((unint64_t)v53 >= 3)
      {
        if (a9)
        {
          v110 = NSLocalizedDescriptionKey;
          v111 = @"Illegal ColorSpace option";
          v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v111,  &v110,  1LL));
          *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v58));
        }

        v35 = 0LL;
        uint64_t v31 = 0LL;
        goto LABEL_45;
      }
    }

    -[PAMediaConversionServiceImageConversionJob setColorspaceMode:](v39, "setColorspaceMode:", v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionScaleFactorKey"]);
    v56 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"]);
    v57 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumLongSideLengthKey"]);
    v98 = v14;
    v94 = v56;
    v96 = v57;
    if (v55)
    {
      [v55 doubleValue];
      -[PAMediaConversionServiceImageConversionJob setScaleFactor:](v39, "setScaleFactor:");
    }

    else if (v56)
    {
      -[PAMediaConversionServiceImageConversionJob setRequestedMaximumPixelCount:]( v39,  "setRequestedMaximumPixelCount:",  [v56 integerValue]);
    }

    else
    {
      if (!v57)
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v95 handleFailureInMethod:a2 object:v97 file:@"ImageConversionService.m" lineNumber:478 description:@"Missing scale parameters"];
        v86 = 0;
        v35 = 0LL;
        v93 = 0;
        uint64_t v31 = 0LL;
        goto LABEL_89;
      }

      -[PAMediaConversionServiceImageConversionJob setRequestedMaximumLongSideLength:]( v39,  "setRequestedMaximumLongSideLength:",  [v57 integerValue]);
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionApplyOrientationTransformKey"]);
    -[PAMediaConversionServiceImageConversionJob setApplySourceOrientationTransform:]( v39,  "setApplySourceOrientationTransform:",  [v59 BOOLValue]);

    v60 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionFormatConversionOnlyKey"]);
    -[PAMediaConversionServiceImageConversionJob setFormatConversionOnly:]( v39,  "setFormatConversionOnly:",  [v60 BOOLValue]);

    v61 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRasterizationDPIKey"]);
    v62 = v61;
    if (v61) {
      -[PAMediaConversionServiceImageConversionJob setRasterizationDPI:]( v39,  "setRasterizationDPI:",  [v61 integerValue]);
    }
    v63 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAdjustmentInformationKey"]);
    -[PAMediaConversionServiceImageConversionJob setAdjustmentInformation:](v39, "setAdjustmentInformation:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionEnableOutputCorruptionDetectionHeuristicsKey"]);
    -[PAMediaConversionServiceImageConversionJob setShouldCheckForOutputCorruption:]( v39,  "setShouldCheckForOutputCorruption:",  [v64 BOOLValue]);

    v65 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUseEmbeddedImageAsSourceKey"]);
    -[PAMediaConversionServiceImageConversionJob setShouldUseEmbeddedImageAsSource:]( v39,  "setShouldUseEmbeddedImageAsSource:",  [v65 BOOLValue]);

    +[PAMediaConversionServiceSharedUtilitiesServiceSide executeConversionJob:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "executeConversionJob:",  v39);
    if (!-[PAMediaConversionServiceImageConversionJob status](v39, "status"))
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v89 handleFailureInMethod:a2 object:v97 file:@"ImageConversionService.m" lineNumber:504 description:@"Unexpected unknown image conversion job state after execution"];
    }

    v66 = -[PAMediaConversionServiceImageConversionJob status](v39, "status");
    v67 = v66 == (id)1;
    v95 = v62;
    if (v66 == (id)1)
    {
      v93 = 1;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob destinationData](v39, "destinationData"));

      if (v68) {
        uint64_t v31 = (id)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob destinationData](v39, "destinationData"));
      }
      else {
        uint64_t v31 = 0LL;
      }
      -[PAMediaConversionServiceImageConversionJob outputImageSize](v39, "outputImageSize");
      *(void *)v107 = v70;
      *(void *)&v107[8] = v71;
      v72 = (id)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
      if ([v72 isBlastDoorAccessRequired])
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
        v74 = (void *)objc_claimAutoreleasedReturnValue([v73 blastDoorMainSourceProperties]);

        if (!v74)
        {
          v35 = 0LL;
          v86 = 1;
          v93 = 1;
LABEL_88:
          v56 = v94;
LABEL_89:

          if (!v86)
          {
            id v34 = 0;
            __int16 v14 = v98;
            goto LABEL_46;
          }

          if (!v93)
          {
            id v34 = 0;
LABEL_38:
            __int16 v14 = v98;
            goto LABEL_39;
          }

          if (!v31)
          {
            id v34 = 1;
LABEL_35:
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)v107));
            [v104 setObject:v43 forKeyedSubscript:@"PAMediaConversionServicePixelWidthKey"];

            v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&v107[8]));
            [v104 setObject:v44 forKeyedSubscript:@"PAMediaConversionServicePixelHeightKey"];

            if (a7) {
              *a7 = v24;
            }
            *v102 = v104;
            goto LABEL_38;
          }

          __int16 v32 = v35;
          __int16 v14 = v98;
          __int16 v16 = v103;
LABEL_20:
          v98 = v14;
          if (v16)
          {
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v16 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"]);
            v105 = v32;
            id v34 = [v31 writeToURL:v33 options:0 error:&v105];
            v35 = v105;

            if ((v34 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v109 = v35;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error writing result image data to URL passed in destination URL collection: %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            if (a6)
            {
              uint64_t v31 = v31;
              *a6 = v31;
            }

            else
            {
              v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
              objc_msgSend( v90,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v97,  @"ImageConversionService.m",  542,  @"Invalid request output configuration, missing both destination URL collection and data pointer");
            }

            id v34 = 1;
            v35 = v32;
          }

          goto LABEL_35;
        }

        v92 = v55;
        v75 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
        v76 = (void *)objc_claimAutoreleasedReturnValue([v75 blastDoorMainSourceProperties]);
        [v104 setObject:v76 forKeyedSubscript:@"PAMediaConversionServiceBlastDoorSourcePropertiesKey"];

        v77 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
        v78 = (void *)objc_claimAutoreleasedReturnValue([v77 blastDoorVideoComplementProperties]);
        [v104 setObject:v78 forKeyedSubscript:@"PAMediaConversionServiceBlastDoorVideoComplementSourcePropertiesKey"];

        v79 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
        v80 = (void *)objc_claimAutoreleasedReturnValue([v79 blastDoorSourceURL]);

        if (!v80)
        {
          v35 = 0LL;
          v86 = 1;
          v93 = 1;
          goto LABEL_88;
        }

        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v82 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
        v83 = (void *)objc_claimAutoreleasedReturnValue([v82 blastDoorSourceURL]);
        v106 = 0LL;
        v91 = [v81 removeItemAtURL:v83 error:&v106];
        v72 = v106;

        if ((v91 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v109 = v72;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[BlastDoor] Failed to remove temporary blast door source file: %{public}@",  buf,  0xCu);
        }

        v35 = 0LL;
        v55 = v92;
      }

      else
      {
        v35 = 0LL;
      }
    }

    else
    {
      v69 = objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob error](v39, "error"));
      if (v69)
      {
        v35 = (id)v69;
LABEL_86:
        v93 = 0;
        uint64_t v31 = 0LL;
        goto LABEL_87;
      }

      v93 = v67;
      v84 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
      v85 = [v84 isBlastDoorAccessRequired];

      if (!v85)
      {
        v35 = 0LL;
        goto LABEL_86;
      }

      v72 = (id)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( v39,  "sourceResourceURLCollection"));
      v35 = (id)objc_claimAutoreleasedReturnValue([v72 blastDoorError]);
      uint64_t v31 = 0LL;
    }

LABEL_87:
    v86 = 1;
    goto LABEL_88;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v14 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"]);
  __int16 v30 = objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceImagingUtilities imageDataForPassthroughConversionForSourceURL:metadataPolicy:outResultImageSize:]( &OBJC_CLASS___PAMediaConversionServiceImagingUtilities,  "imageDataForPassthroughConversionForSourceURL:metadataPolicy:outResultImageSize:",  v29,  v25,  v107));

  uint64_t v31 = 0LL;
  if (v30)
  {
    __int16 v32 = 0LL;
    uint64_t v31 = (id)v30;
    goto LABEL_20;
  }

  id v34 = 0;
  v35 = 0LL;
LABEL_39:
  if (a9 && (v34 & 1) == 0)
  {
    v39 = (PAMediaConversionServiceImageConversionJob *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary"));
    v45 = v14;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v14 logMessageSummary]);
    -[PAMediaConversionServiceImageConversionJob setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v46,  @"PAMediaConversionServiceErrorSourceResourceSummaryKey");

    v47 = (void *)objc_claimAutoreleasedReturnValue([v35 description]);
    -[PAMediaConversionServiceImageConversionJob setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v47,  @"PAMediaConversionServiceErrorUnderlyingErrorDescriptionKey");

    v48 = (void *)objc_claimAutoreleasedReturnValue([v35 domain]);
    v49 = [v48 isEqualToString:@"BlastDoor.Explosion"];

    __int16 v14 = v45;
    if (v49) {
      v50 = 12LL;
    }
    else {
      v50 = 2LL;
    }
    *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  v50,  v39));
LABEL_45:

    id v34 = 0;
  }

LABEL_46:
  return v34;
}

void sub_1000138E8(_Unwind_Exception *a1)
{
}

void sub_100013BEC(id a1, NSString *a2, NSString *a3)
{
}

void sub_100013C08(id a1, NSString *a2, NSString *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  id v6 = -[NSString UTF8String](v4, "UTF8String");
  unsigned int v7 = v5;
  unsigned int v8 = -[NSString UTF8String](v7, "UTF8String");

  setenv(v6, v8, 1);
}

id sub_100014CA0(uint64_t a1, uint64_t a2)
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

void sub_100015AB8(_Unwind_Exception *a1)
{
}

LABEL_25:
LABEL_26:
  return v11;
}

LABEL_28:
      uint64_t v10 = (char *)v10 + 1;
    }

    while (v10 != v8);
    unsigned int v8 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v8) {
      continue;
    }
    break;
  }

LABEL_33:
  return v9;
}

int64_t sub_1000180F8(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

uint64_t sub_100018100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100018110(uint64_t a1)
{
}

void sub_100018118(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceURLForRole:v7]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestIdentifier]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) requestIdentifier]);
    *(_DWORD *)buf = 138413314;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v9;
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
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to copy duplicate request output - destination URL collection is missing URL for role %@",  v7));
    __int16 v23 = v15;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v16));
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8LL);
    int v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    goto LABEL_11;
  }

  uint64_t v12 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id obj = *(id *)(v13 + 40);
  unsigned __int8 v14 = [v12 copyItemAtURL:v8 toURL:v9 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int128 v20 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
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

id objc_msgSend_convertImageWithOptions_sourceURLCollection_outputURLCollection_outputData_outputFileType_outputImageInfo_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "convertImageWithOptions:sourceURLCollection:outputURLCollection:outputData:outputFileType:outputImageInfo:error:");
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

id objc_msgSend_imageDataForPassthroughConversionForSourceURL_metadataPolicy_outResultImageSize_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageDataForPassthroughConversionForSourceURL:metadataPolicy:outResultImageSize:");
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

id objc_msgSend_processCompletedQueueEntry_resultURLCollection_didConvertSuccessfully_conversionOutputInformation_conversionOutputData_conversionOutputFileType_conversionError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "processCompletedQueueEntry:resultURLCollection:didConvertSuccessfully:conversionOutputInformation:conversionO utputData:conversionOutputFileType:conversionError:");
}

id objc_msgSend_replyToCompletionHandler_requestIdentifier_resultData_resultImageInformation_signpostID_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "replyToCompletionHandler:requestIdentifier:resultData:resultImageInformation:signpostID:error:");
}

id objc_msgSend_temporaryDestinationURLCollectionForFinalDestinationURLCollection_inParentDirectoryURL_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDestinationURLCollectionForFinalDestinationURLCollection:inParentDirectoryURL:");
}

id objc_msgSend_urlCollectionForBookmarkDictionaryKey_inOptions_removeExistingEmptyFiles_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlCollectionForBookmarkDictionaryKey:inOptions:removeExistingEmptyFiles:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}