id InternalStorageDirectoryPath()
{
  if (InternalStorageDirectoryPath_onceToken != -1) {
    dispatch_once(&InternalStorageDirectoryPath_onceToken, &__block_literal_global);
  }
  return (id)InternalStorageDirectoryPath_path;
}

void __InternalStorageDirectoryPath_block_invoke()
{
  v0 = (void *)InternalStorageDirectoryPath_path;
  InternalStorageDirectoryPath_path = (uint64_t)@"/var/db/accessoryupdater/uarp/";
}

void *uarpFilepathForRemotePath(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (([a1 checkResourceIsReachableAndReturnError:&v19] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      uarpFilepathForRemotePath_cold_2();
    }
    return 0LL;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "uarpFilepathForRemotePath";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)a1;
    _os_log_impl(&dword_1887DD000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%s: Valid firmware file %@", buf, 0x16u);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "uarpFilepathForRemotePath";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)a4;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, firmwareVersion is %@",  buf,  0x16u);
  }

  v8 = (void *)[MEMORY[0x189607940] stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), a2];
  if ([a3 caseInsensitiveCompare:objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPAccessoryHardwareFusingToString())])
  {
    [v8 appendFormat:@"-%@", a3];
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "uarpFilepathForRemotePath";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v8;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpAccessoryPath(1) is %@",  buf,  0x16u);
  }

  [v8 appendFormat:@"/%@", a4];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "uarpFilepathForRemotePath";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v8;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpAccessoryPath(2) is %@",  buf,  0x16u);
  }

  uint64_t v9 = [a1 lastPathComponent];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "uarpFilepathForRemotePath";
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpFileName is %@",  buf,  0x16u);
  }

  uint64_t v10 = [v8 stringByAppendingPathComponent:v9];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "uarpFilepathForRemotePath";
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpFilePath is %@",  buf,  0x16u);
  }

  v11 = (void *)[MEMORY[0x189604030] fileURLWithPath:v10];
  if (([v11 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    v12 = (void *)[MEMORY[0x189604030] fileURLWithPath:v8 isDirectory:1];
    if (([v12 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      char v13 = objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v12,  1,  0,  &v19);
      BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO);
      if ((v13 & 1) == 0)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315394;
          v23 = "uarpFilepathForRemotePath";
          __int16 v24 = 2112;
          uint64_t v25 = v19;
          v16 = (os_log_s *)MEMORY[0x1895F8DA0];
          v17 = "%s: Failed to create UARP Firmware directory error: %@";
          goto LABEL_31;
        }

        return 0LL;
      }

      if (v14)
      {
        *(_DWORD *)buf = 136315394;
        v23 = "uarpFilepathForRemotePath";
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v8;
        _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: UARP Firmware directory created %@",  buf,  0x16u);
      }

      uint64_t v20 = *MEMORY[0x189607500];
      v21 = &unk_18A28F2E0;
      uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "setAttributes:ofItemAtPath:error:",  v15,  objc_msgSend(v12, "path"),  &v19) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          uarpFilepathForRemotePath_cold_1();
        }
        return 0LL;
      }
    }

    if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "copyItemAtURL:toURL:error:",  a1,  v11,  &v19) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "uarpFilepathForRemotePath";
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v11;
        v16 = (os_log_s *)MEMORY[0x1895F8DA0];
        v17 = "%s: Failed to write to path %@";
LABEL_31:
        _os_log_impl(&dword_1887DD000, v16, OS_LOG_TYPE_INFO, v17, buf, 0x16u);
        return 0LL;
      }

      return 0LL;
    }
  }

  return v11;
}

void *mobileAssetCacheFileURLForRemoteURL(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (([a1 checkResourceIsReachableAndReturnError:&v21] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      mobileAssetCacheFileURLForRemoteURL_cold_2();
    }
    return 0LL;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)a1;
    _os_log_impl(&dword_1887DD000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%s: Valid firmware file %@", buf, 0x16u);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)a4;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, firmwareVersion is %@",  buf,  0x16u);
  }

  uint64_t v10 = (void *)[MEMORY[0x189607940] stringWithFormat:@"%@/%@/%@/%@", objc_msgSend( (id)objc_msgSend( NSString, "stringWithFormat:", @"%@/%s", InternalStorageDirectoryPath(), "mobileAssetCache"), "stringByStandardizingPath"), a2, a3, a5];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)v10;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpAccessoryPath(1) is %@",  buf,  0x16u);
  }

  [v10 appendFormat:@"/%@", a4];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)v10;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpAccessoryPath(2) is %@",  buf,  0x16u);
  }

  uint64_t v11 = [a1 lastPathComponent];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpFileName is %@",  buf,  0x16u);
  }

  uint64_t v12 = [v10 stringByAppendingPathComponent:v11];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Valid firmware file, uarpFilePath is %@",  buf,  0x16u);
  }

  char v13 = (void *)[MEMORY[0x189604030] fileURLWithPath:v12];
  if (([v13 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    BOOL v14 = (void *)[MEMORY[0x189604030] fileURLWithPath:v10 isDirectory:1];
    if (([v14 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      char v15 = objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v14,  1,  0,  &v21);
      BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO);
      if ((v15 & 1) == 0)
      {
        if (v16)
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
          __int16 v26 = 2112;
          uint64_t v27 = v21;
          v18 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v19 = "%s: Failed to create UARP Firmware directory error: %@";
          goto LABEL_29;
        }

        return 0LL;
      }

      if (v16)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v10;
        _os_log_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: UARP Firmware directory created %@",  buf,  0x16u);
      }

      uint64_t v22 = *MEMORY[0x189607500];
      v23 = &unk_18A28F2E0;
      uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "setAttributes:ofItemAtPath:error:",  v17,  objc_msgSend(v14, "path"),  &v21) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          mobileAssetCacheFileURLForRemoteURL_cold_1();
        }
        return 0LL;
      }
    }

    if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "copyItemAtURL:toURL:error:",  a1,  v13,  &v21) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "mobileAssetCacheFileURLForRemoteURL";
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v13;
        v18 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v19 = "%s: Failed to write to path %@";
LABEL_29:
        _os_log_impl(&dword_1887DD000, v18, OS_LOG_TYPE_INFO, v19, buf, 0x16u);
        return 0LL;
      }

      return 0LL;
    }
  }

  return v13;
}

uint64_t InternalStorageCacheDirectoryPath()
{
  return [(id)objc_msgSend( NSString stringWithFormat:@"%@/%s", InternalStorageDirectoryPath(), "mobileAssetCache"), "stringByStandardizingPath"];
}

uint64_t latestMobileAssetCacheFileURL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[2] = *MEMORY[0x1895F89C0];
  uint64_t v3 = [MEMORY[0x189607940] stringWithFormat:@"%@/%@/%@/%@", objc_msgSend( (id)objc_msgSend( NSString, "stringWithFormat:", @"%@/%s", InternalStorageDirectoryPath(), "mobileAssetCache"), "stringByStandardizingPath"), a1, a2, a3];
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "enumeratorAtPath:", v3);
  __int128 v12 = 0uLL;
  uint64_t result = [v4 nextObject];
  if (result)
  {
    v6 = (void *)result;
    uint64_t v7 = 0LL;
    v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      v15[0] = v3;
      v15[1] = v6;
      uint64_t v9 = objc_msgSend( NSString,  "pathWithComponents:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v15, 2));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        latestMobileAssetCacheFileURL_cold_1(buf, v9, &v14);
      }
      if (objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "isEqualToString:", @"uarp"))
      {
        SuperBinaryVersionForAsset = getSuperBinaryVersionForAsset(v9);
        if (SuperBinaryVersionForAsset)
        {
          [MEMORY[0x18960E7B0] versionFromString:SuperBinaryVersionForAsset version:&v11];
          if (uarpVersionCompare(&v12, &v11) == 1)
          {
            __int128 v12 = v11;
            uint64_t v7 = v9;
          }
        }
      }

      v6 = (void *)[v4 nextObject];
    }

    while (v6);
    if (v7) {
      return [MEMORY[0x189604030] fileURLWithPath:v7];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void *getSuperBinaryVersionForAsset(uint64_t a1)
{
  uint64_t v10 = 0LL;
  v2 = os_log_create("com.apple.accessoryupdater.uarp", "assetManager");
  uint64_t v3 = (void *)[MEMORY[0x189603F48] dataWithContentsOfFile:a1 options:1 error:&v10];
  if (!v3)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      getSuperBinaryVersionForAsset_cold_1(a1, &v10, v2);
    }
    return 0LL;
  }

  v4 = v3;
  unsigned int v5 = [v3 length];
  if (v5 <= 0x2CuLL)
  {
    int v6 = v5;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      getSuperBinaryVersionForAsset_cold_2(a1, v6, v2);
    }
    return 0LL;
  }

  objc_msgSend(v4, "getBytes:range:", v11, 0, 44);
  int8x16_t v12 = vrev32q_s8(v12);
  v8 = (void *)objc_msgSend( MEMORY[0x189607940],  "stringWithFormat:",  @"%u.%u.%u",  v12.u32[0],  v12.u32[1],  v12.u32[2],  v10);
  uint64_t v7 = v8;
  if (v12.i32[3]) {
    objc_msgSend(v8, "appendFormat:", @".%u", v12.u32[3]);
  }
  return v7;
}

uint64_t getCachedAccessories()
{
  return [MEMORY[0x189603FA8] arrayWithContentsOfFile:objc_msgSend( NSString, "stringWithFormat:", @"%@/%@", InternalStorageDirectoryPath(), @"uarpAccessories.plist")];
}

CFStringRef mobileAssetStateToString(unint64_t a1)
{
  if (a1 > 6) {
    return @"MAInvalid";
  }
  else {
    return off_18A28BA90[a1];
  }
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1887E18F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1887E2254( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

LABEL_20:
    __int16 v26 = [MEMORY[0x189603FB8] dataWithLength:32];
    CC_SHA256_Final((unsigned __int8 *)[v26 mutableBytes], &c);

    int v6 = v28;
  }

  else
  {
    __int16 v26 = 0LL;
  }

  return v26;
}

void OUTLINED_FUNCTION_2_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_15:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = v3;
  v42 = [v39 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v42)
  {
    v41 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v42; ++j)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v39);
        }
        __int16 v24 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v24;
          _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_DEFAULT, "Deleting iCloud Cache file:%@", buf, 0xCu);
        }

        [MEMORY[0x1896078A8] defaultManager];
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 removeItemAtPath:v24 error:0];

        [v24 stringByDeletingLastPathComponent];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        InternalStorageDirectoryPath();
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = [v27 isEqualToString:v28];

        if ((v29 & 1) == 0)
        {
          while (1)
          {
            [MEMORY[0x1896078A8] defaultManager];
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            [v30 contentsOfDirectoryAtPath:v27 error:0];
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

            if ([v31 count]) {
              break;
            }
            v32 = self->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v27;
              _os_log_impl(&dword_1887DD000, v32, OS_LOG_TYPE_DEFAULT, "Deleting iCloud Cache directory:%@", buf, 0xCu);
            }

            [MEMORY[0x1896078A8] defaultManager];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 removeItemAtPath:v27 error:0];

            [v27 stringByDeletingLastPathComponent];
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            InternalStorageDirectoryPath();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = [v34 isEqualToString:v35];

            uint64_t v27 = v34;
            if (v36) {
              goto LABEL_30;
            }
          }
        }

        v34 = v27;
LABEL_30:
      }

      v42 = [v39 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }

    while (v42);
  }
}

    if (v3 >= 2)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = 8LL * (v3 - 1);
      do
      {
        __int128 v11 = *(void *)(a2 + 120);
        if (!*(void *)(v11 + v9))
        {
          *(void *)(v11 + v9) = *(void *)(v11 + v9 + 8);
          *(void *)(*(void *)(a2 + 120) + v9 + _Block_object_dispose(va, 8) = 0LL;
        }

        v9 += 8LL;
      }

      while (v10 != v9);
    }
  }

  return 0LL;
}

LABEL_22:
          v29 = objc_alloc(&OBJC_CLASS___UARPiCloudAccessory);
          v30 = -[NSMutableDictionary accessoryID](v17, "accessoryID");
          [v30 productGroup];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[NSMutableDictionary accessoryID](v17, "accessoryID");
          [v32 productNumber];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[UARPiCloudAccessory initWithProductGroup:productNumber:firmwareVersion:]( v29,  "initWithProductGroup:productNumber:firmwareVersion:",  v31,  v33,  v19);
          v35 = -[NSMutableDictionary assetID](v17, "assetID");
          -[UARPiCloudAccessory setSignatureValidationNeeded:]( v34,  "setSignatureValidationNeeded:",  [v35 signatureValidationNeeded]);

          v8 = v44;
          [v44 addObject:v34];
          -[NSMutableDictionary setObject:forKey:](self->_accessories, "setObject:forKey:", v17, v34);
          v36 = self->_log;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = self->_accessories;
            *(_DWORD *)buf = 136315650;
            v52 = "-[UARPiCloudAssetManager handleRemoteQueryRequestForAccessories:inContainer:]";
            v53 = 2112;
            v54 = v17;
            v55 = 2112;
            v56 = v37;
            _os_log_impl( &dword_1887DD000,  v36,  OS_LOG_TYPE_DEFAULT,  "%s: Added internalAccessory %@ to _accessories %@",  buf,  0x20u);
          }
        }

        v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v47,  v57,  16LL);
      }

      while (v45);
    }

    [self->_cloudManager performRemoteFetchForAccessories:v8];
    v38 = 0LL;
    uint64_t v7 = v40;
    int v6 = v41;
  }

  else
  {
    v38 = 2LL;
  }

  return v38;
}

        char v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }

    uint64_t v25 = 0LL;
    goto LABEL_22;
  }

LABEL_4:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.1( log,  v10);
  }
  char v15 = 0;
LABEL_24:

  return v15;
}
}

LABEL_17:
}

LABEL_21:
    -[UARPiCloudAssetManager setFirmwareDownloadFailureStatusForAccessory:]( self,  "setFirmwareDownloadFailureStatusForAccessory:",  v7);
    goto LABEL_22;
  }

  [v7 assetID];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setValidationStatus:0];
  v18 = -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]( self,  "moveToUARPCacheFromRemoteURL:assetType:forAcessory:",  v6,  0LL,  v7);
  if (!v18) {
    goto LABEL_21;
  }
LABEL_20:
  [v7 assetID];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 setLocalURL:v18];

  -[UARPiCloudAssetManager setFirmwareDownloadSuccessStatusForAccessory:]( self,  "setFirmwareDownloadSuccessStatusForAccessory:",  v7);
LABEL_22:
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __82__UARPiCloudAssetManager_handleFirmwareDownloadResponseFromLocation_forAccessory___block_invoke;
  v40[3] = &unk_18A28BC10;
  v40[4] = self;
  v41 = v7;
  v39 = v7;
  dispatch_async(v38, v40);
}

LABEL_18:
    -[UARPiCloudAssetManager setReleaseNotesDownloadFailureStatusForAccessory:]( self,  "setReleaseNotesDownloadFailureStatusForAccessory:",  v7);
    goto LABEL_19;
  }

  [v7 assetID];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setValidationStatus:0];
  v18 = -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]( self,  "moveToUARPCacheFromRemoteURL:assetType:forAcessory:",  v6,  1LL,  v7);
  if (!v18) {
    goto LABEL_18;
  }
LABEL_17:
  [v7 assetID];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 setReleaseNotesLocalURL:v18];

  -[UARPiCloudAssetManager setReleaseNotesDownloadSuccessStatusForAccessory:]( self,  "setReleaseNotesDownloadSuccessStatusForAccessory:",  v7);
LABEL_19:
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__UARPiCloudAssetManager_handleReleaseNotesDownloadResponseFromLocation_forAccessory___block_invoke;
  block[3] = &unk_18A28BC10;
  block[4] = self;
  v32 = v7;
  v30 = v7;
  dispatch_async(v29, block);
}

LABEL_31:
LABEL_32:
      v40 = 0LL;
      goto LABEL_33;
    }

    if (v25)
    {
      *(_DWORD *)buf = 138412290;
      v53 = v17;
      _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_INFO, "UARP Firmware directory created %@", buf, 0xCu);
    }

    v50 = *MEMORY[0x189607500];
    v51 = &unk_18A28F2F8;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v23;
    uint64_t v28 = [v27 setAttributes:v26 ofItemAtPath:v17 error:&v46];
    uint64_t v20 = v46;

    if ((v28 & 1) == 0 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:].cold.2();
    }
  }

  [v8 URLByDeletingPathExtension];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 lastPathComponent];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 appendFormat:@"/%@", v30];

  [MEMORY[0x189604030] fileURLWithPath:v17];
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (([v23 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    [MEMORY[0x1896078A8] defaultManager];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v20;
    v33 = [v32 copyItemAtURL:v8 toURL:v23 error:&v45];
    v34 = v45;

    if ((v33 & 1) != 0)
    {
      v43 = v9;
      uint64_t v31 = v8;
      uint64_t v20 = v34;
      goto LABEL_20;
    }

    v41 = self->_log;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v23;
      _os_log_impl(&dword_1887DD000, v41, OS_LOG_TYPE_INFO, "Failed to write to path %@", buf, 0xCu);
    }

    goto LABEL_31;
  }

  v43 = v9;
  uint64_t v31 = v8;
LABEL_20:
  v48 = *MEMORY[0x189607500];
  v49 = &unk_18A28F310;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896078A8] defaultManager];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 path];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v20;
  v38 = [v36 setAttributes:v35 ofItemAtPath:v37 error:&v44];
  v39 = v44;

  if ((v38 & 1) != 0)
  {
    v40 = v23;
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:].cold.2();
    }
    v40 = 0LL;
  }

  v8 = v31;

  uint64_t v9 = v43;
LABEL_33:

  return v40;
}

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = log;
    [v12 objectForKey:v13];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[UARPiCloudManager processRecordsInContainer:forAccessory:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    v45 = 2112;
    v46 = v6;
    _os_log_impl( &dword_1887DD000,  v31,  OS_LOG_TYPE_INFO,  "%s: Greatest Firmware Version %@ available on iCloud for accessory: %@",  buf,  0x20u);
  }

  -[UARPiCloudManager processCKRecord:inContainer:forAccessory:]( self,  "processCKRecord:inContainer:forAccessory:",  v12,  v38,  v6);

LABEL_34:
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_2_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

  ;
}

uint64_t saveEntryForKey(void *a1, void *a2)
{
  uint64_t v3 = (void *)NSString;
  id v4 = a2;
  id v5 = a1;
  InternalStorageDirectoryPath();
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@/%@", v6, @"icloudTokens.plist"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __int128 v11 = v10;
  [v10 setObject:v5 forKey:v4];

  uint64_t v12 = [v11 writeToFile:v7 atomically:1];
  return v12;
}

id getEntryForKey(void *a1)
{
  v1 = (void *)NSString;
  id v2 = a1;
  InternalStorageDirectoryPath();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 stringWithFormat:@"%@/%@", v3, @"icloudTokens.plist"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v2];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t getMultiValueHash(uint64_t a1, uint64_t a2)
{
  return a2 ^ __ROR8__(a1, 32);
}

id generateSHA256HashForDataAtLocationAsData(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

id generateHashForDataAtLocationAsData(void *a1, int a2, uint64_t a3)
{
  v16[129] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  uint64_t v6 = [MEMORY[0x189607898] fileHandleForReadingFromURL:v5 error:a3];
  uint64_t v7 = (void *)v6;
  v8 = 0LL;
  if (a2 && v6)
  {
    uint64_t v9 = CCDigestInit();
    do
    {
      uint64_t v10 = (void *)MEMORY[0x1895CCAB4](v9);
      id v11 = [v7 uarpReadDataUpToLength:0x4000 error:a3];
      [v11 bytes];
      [v11 length];
      CCDigestUpdate();
      unint64_t v12 = [v11 length];

      objc_autoreleasePoolPop(v10);
    }

    while (v12 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize();
    uint64_t v14 = (char *)v16 - ((MEMORY[0x1895F8858]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    CCDigestFinal();
    else {
      v8 = 0LL;
    }
  }

  return v8;
}

id generateSHA256HashForDataAtLocation(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    id v7 = objc_alloc_init(MEMORY[0x189607940]);
    if ([v5 length])
    {
      unint64_t v8 = 0LL;
      do
        objc_msgSend(v7, "appendFormat:", @"%02x", *(unsigned __int8 *)(v6 + v8++));
      while (v8 < [v5 length]);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

id generateBase64HashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 base64EncodedStringWithOptions:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

LABEL_11:
      if (++v11 >= v10)
      {
        uint64_t v17 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (!v17) {
          goto LABEL_23;
        }
        uint64_t v10 = v17;
        id v11 = 0LL;
      }
    }

    [v4 objectForKey:v14];
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(data) = bswap32([v15 unsignedIntValue]);
    BOOL v16 = 4;
LABEL_9:
    CC_SHA256_Update(&c, &data, v16);
LABEL_10:

    goto LABEL_11;
  }

LABEL_23:
  uint64_t v19 = [MEMORY[0x189603FB8] dataWithLength:32];
  CC_SHA256_Final((unsigned __int8 *)[v19 mutableBytes], &c);
  [MEMORY[0x189603F48] dataWithData:v19];
  uint64_t v20 = (NSData *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = self->_digest;
  self->_digest = v20;
}

  if (*(_BYTE *)(a2 + 50) == 1) {
    return 0LL;
  }
  uint64_t v10 = *(unsigned __int8 *)(v6 + 30);
  if (*(unsigned __int16 *)(a2 + 18) >= v10)
  {
    *(_BYTE *)(v6 + 30) = v10 + 1;
    *(_BYTE *)(v6 + 32) = 1;
    if (*(_BYTE *)(v6 + 31) == 1) {
      UARPLayer2WatchdogSet(v4, a2);
    }
    *(_WORD *)(*(void *)(v6 + 16) + 4LL) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
    ++*(_WORD *)(a2 + 58);
    uint64_t v9 = UARPLayer2SendMessage( v4,  a2,  *(const void **)v6,  *(unsigned __int16 *)(a2 + 30) + *(unsigned __int16 *)(v6 + 28));
    UARPLayer2LogPacket(v4, a2);
    if ((_DWORD)v9)
    {
      *(_BYTE *)(v6 + 32) = 0;
      uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(void *)(v6 + 16));
    }
  }

  else
  {
    active = uarpHtons(**(unsigned __int16 **)(v6 + 16));
    switch((_DWORD)active)
    {
      case 0xFFFF:
        active = UARPLayer2VendorSpecificExceededRetries(v4, a2);
        break;
      case 3:
        active = uarpHtonl(*(_DWORD *)(*(void *)(v6 + 16) + 6LL));
        switch((int)active)
        {
          case 1:
            active = UARPLayer2ManufacturerNameResponse(v4, a2);
            break;
          case 2:
            active = UARPLayer2ModelNameResponse(v4, a2);
            break;
          case 3:
            active = UARPLayer2SerialNumberResponse(v4, a2);
            break;
          case 4:
            active = UARPLayer2HardwareVersionResponse(v4, a2);
            break;
          case 5:
            active = UARPLayer2ActiveFirmwareVersionResponse(v4, a2);
            break;
          case 6:
            active = UARPLayer2StagedFirmwareVersionResponse(v4, a2);
            break;
          case 7:
            active = UARPLayer2StatisticsResponse(v4, a2);
            break;
          case 8:
            active = UARPLayer2LastErrorResponse(v4, a2);
            break;
          case 9:
            active = UARPLayer2FriendlyNameResponse(v4, a2);
            break;
          default:
            goto LABEL_34;
        }

        break;
      case 1:
        *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = 0;
        active = UARPLayer2ProtocolVersion(v4, a2);
        break;
    }

void sub_1887ECAD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}
}

void OUTLINED_FUNCTION_0_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_3_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4_2(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id UARPArrayOfExpiredFiles(void *a1, void *a2, double a3)
{
  v40[2] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  v33 = (void *)objc_opt_new();
  v32 = v5;
  [MEMORY[0x189607940] stringWithString:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = v7;
  uint64_t v31 = v6;
  if (v6)
  {
    uint64_t v9 = [v7 stringByAppendingPathComponent:v6];

    unint64_t v8 = (void *)v9;
  }

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 enumeratorAtPath:v8];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603F50] now];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v11;
  uint64_t v13 = [v11 nextObject];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v34 = *MEMORY[0x1896074E0];
    char v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      BOOL v16 = (void *)NSString;
      v40[0] = v8;
      v40[1] = v14;
      [MEMORY[0x189603F18] arrayWithObjects:v40 count:2];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 pathWithComponents:v17];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        UARPArrayOfExpiredFiles_cold_1(v38, (uint64_t)v18, &v39);
      }
      id v19 = v12;
      uint64_t v20 = (void *)MEMORY[0x1896078A8];
      id v21 = v18;
      [v20 defaultManager];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 attributesOfItemAtPath:v21 error:0];
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        [v23 objectForKeyedSubscript:v34];
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 dateByAddingTimeInterval:a3];
        uint64_t v25 = v15;
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = [v19 compare:v26];

        char v15 = v25;
        if (v27 == 1)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v21;
            _os_log_impl(&dword_1887DD000, v25, OS_LOG_TYPE_DEFAULT, "Expired temp file %@ ", buf, 0xCu);
          }

          [v33 addObject:v21];
        }
      }

      else
      {
      }

      uint64_t v28 = [v35 nextObject];

      uint64_t v14 = (void *)v28;
    }

    while (v28);
  }

  [MEMORY[0x189603F18] arrayWithArray:v33];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

uint64_t uarpPlatformEndpointStreamingRecvInit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    id v7 = 0LL;
    UARPLayer2RequestBuffer(a1, &v7, 0x18u);
    if (v7)
    {
      unsigned int v5 = *(_DWORD *)(a2 + 4) + 36;
      UARPLayer2RequestBuffer(a1, v7, v5);
      id v6 = v7;
      if (*(void *)v7)
      {
        uint64_t result = 0LL;
        *((_DWORD *)v7 + 2) = v5;
        *(void *)(a2 + 8_Block_object_dispose(va, 8) = v6;
        return result;
      }

      UARPLayer2ReturnBuffer(a1, v7);
    }

    return 11LL;
  }

  return result;
}

void uarpPlatformEndpointStreamingRecvDeinit(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v3 = *(void ***)(a2 + 88);
      if (v3)
      {
        if (*v3)
        {
          UARPLayer2ReturnBuffer(a1, *v3);
          uint64_t v3 = *(void ***)(a2 + 88);
          *uint64_t v3 = 0LL;
        }

        UARPLayer2ReturnBuffer(a1, v3);
        *(void *)(a2 + 8_Block_object_dispose(va, 8) = 0LL;
      }
    }
  }

uint64_t uarpPlatformEndpointStreamingRecvBytes(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      id v7 = a3;
      if (a3)
      {
        LODWORD(v_Block_object_dispose(va, 8) = a4;
        if (a4)
        {
          uint64_t v9 = *(_DWORD **)(a2 + 88);
          if (v9) {
            goto LABEL_6;
          }
          uint64_t result = uarpPlatformEndpointStreamingRecvInit(a1, a2);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v9 = *(_DWORD **)(a2 + 88);
          if (v9)
          {
LABEL_6:
            if (v9[2] >= v8)
            {
              uint64_t v8 = v8;
              unsigned int v10 = v9[4];
              do
              {
                char v11 = *v7++;
                *(_BYTE *)(*(void *)v9 + v10) = v11;
                unsigned int v10 = v9[4] + 1;
                v9[4] = v10;
                if (v10 == 6)
                {
                  unsigned int v12 = uarpHtons(*(unsigned __int16 *)(*(void *)v9 + 2LL)) + 6;
                  v9[3] = v12;
                  unsigned int v10 = v9[4];
                }

                else
                {
                  unsigned int v12 = v9[3];
                }

                if (v10 == v12)
                {
                  uint64_t result = uarpPlatformEndpointRecvMessage(a1, a2, *(unsigned __int16 **)v9, v12);
                  if ((_DWORD)result) {
                    return result;
                  }
                  bzero(*(void **)v9, v9[2]);
                  unsigned int v10 = 0;
                  v9[3] = 0;
                  v9[4] = 0;
                }

                --v8;
              }

              while (v8);
              return 0LL;
            }

            else
            {
              return 30LL;
            }
          }

          else
          {
            return 27LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformAssetProcessingCompleteInternal( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result = 30LL;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      *(void *)(a3 + 696) = 0LL;
      if (!a2 || (uint64_t result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !(_DWORD)result))
      {
        uint64_t result = 0LL;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0LL;
        }
      }
    }

    else
    {
      return 23LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30LL;
  }
  uint64_t v3 = *(void *)(a2 + 696);
  if (!v3) {
    return 30LL;
  }
  if (*(_BYTE *)(a3 + 80) == 1) {
    return 16LL;
  }
  if (*(_BYTE *)(a2 + 73) == 1 || !*(_BYTE *)(v3 + 56)) {
    return 31LL;
  }
  int v6 = *(_DWORD *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 84);
  unsigned int v8 = v7 + v6 + *(_DWORD *)a3;
  unsigned int v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7) {
    unsigned int v9 = *(_DWORD *)(a3 + 24) - v7;
  }
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(void *)(a2 + 696) + 4LL)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(a2 + 696) + 4LL);
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a3 + 96) = v10;
  uint64_t result = uarpSendAssetRequestData(a1, *(void *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!(_DWORD)result) {
    *(_BYTE *)(a3 + 80) = 1;
  }
  return result;
}

uint64_t uarpPlatformAssetResponseData( uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  if (!*(_BYTE *)(a2 + 392)) {
    return 29LL;
  }
  uint64_t v7 = a3;
  if ((_DWORD)a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }

  if (*(_DWORD *)(a2 + 404) != a5) {
    return 29LL;
  }
  if (*(_DWORD *)(a2 + 408) != a6) {
    return 29LL;
  }
  uint64_t v10 = *(unsigned int *)(a2 + 396);
  *(_BYTE *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(void *)(a2 + 328) + v10), __src, __n);
  int v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  int v13 = *(_DWORD *)(a2 + 320) + v12;
  int v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if ((_DWORD)v7) {
      return v7;
    }
    int v15 = *(_DWORD *)(a2 + 396);
    uint64_t v16 = *(unsigned int *)(a2 + 400);
    int v17 = v15 - v16;
    if (v15 != (_DWORD)v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(void *)(a2 + 328) + v16), (v15 - v16));
      int v15 = *(_DWORD *)(a2 + 400);
    }

    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }

  if (v13 == v14) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384))(a1, a2, a2 + 312);
  }
  else {
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
}

uint64_t uarpPlatformAssetUpdateMetaData( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8) {
    return 0LL;
  }
  unsigned int v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    uint64_t v10 = uarpHtonl(*v9);
    uint64_t v11 = uarpHtonl(v9[1]);
    unsigned int v12 = v11;
    unsigned int v13 = v4 - 8;
    unsigned int v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      int v14 = v9 + 2;
      int v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        int v15 = *(_DWORD *)(a3 + 88);
      }

      unsigned int v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v15 + v12;
      if (v4 > 7) {
        continue;
      }
    }

    return 0LL;
  }

  return 53LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(void *)(a2 + 312) = 0x2C00000000LL;
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpHtonl(*v6);
  *(_DWORD *)(a2 + 4) = uarpHtonl(v6[1]);
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = uarpHtonl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 2_Block_object_dispose(va, 8) = uarpHtonl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpHtonl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpHtonl(v6[9]);
  int v7 = uarpHtonl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = *(_DWORD *)(a3 + 84);
  unsigned int v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (uint64_t result = 0LL, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return 47LL;
  }

  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 68_Block_object_dispose(va, 8) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16LL;
      }

      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 28);
        *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      return 40LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    uint64_t v11 = 0LL;
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }

  else
  {
    int v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uarpHtonl(*v7);
      unsigned int v8 = uarpHtonl(v7[1]);
      if (v8 > *(_DWORD *)(a3 + 24) - 8) {
        break;
      }
      unsigned int v9 = v8;
      unsigned int v10 = v6 - 8;
      unsigned int v6 = v6 - 8 - v8;
      if (v10 >= v8)
      {
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2AssetMetaDataTLV(a1, a2);
        int v7 = (unsigned int *)((char *)v7 + v9 + 8);
        *(_DWORD *)(a3 + 88) += v9;
        if (v6 > 7) {
          continue;
        }
      }

      goto LABEL_6;
    }

    uint64_t v11 = 53LL;
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }

  return v11;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadHeaderRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetPayloadHeaderRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if ((_DWORD)v6) {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else {
    *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = *(_DWORD *)(a3 + 84);
  }
  return v6;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestCompleted(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a2 = uarpHtonl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpHtonl(a1[6]);
  *(_DWORD *)(a2 + 2_Block_object_dispose(va, 8) = uarpHtonl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpHtonl(a1[8]);
  int v6 = uarpHtonl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(_BYTE *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 12_Block_object_dispose(va, 8) = v6;
  uint64_t v7 = 48LL;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3) {
      return 0LL;
    }
    else {
      return 48LL;
    }
  }

  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44LL;
    }

    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16LL;
      }

      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 488);
        *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetPayloadMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetPayloadMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      return 40LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestWindowFilled(void *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    uint64_t v13 = 0LL;
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }

  else
  {
    uint64_t v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uint64_t v8 = uarpHtonl(*v7);
      uint64_t v9 = uarpHtonl(v7[1]);
      unsigned int v10 = v9;
      unsigned int v11 = v6 - 8;
      unsigned int v6 = v6 - 8 - v9;
      if (v11 >= v9)
      {
        unsigned int v12 = v7 + 2;
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2PayloadMetaDataTLV(a1, a2, v8, v9, v12);
        uint64_t v7 = (_DWORD *)((char *)v12 + v10);
        *(_DWORD *)(a3 + 88) += v10;
        if (v6 > 7) {
          continue;
        }
      }

      goto LABEL_6;
    }

    uint64_t v13 = 53LL;
    UARPLayer2PayloadMetaDataProcessingError((uint64_t)a1, a2);
  }

  return v13;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1) {
      return 44LL;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8)) {
      return 43LL;
    }
    if (*(_BYTE *)(a2 + 392) == 1) {
      return 16LL;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
    int v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 36_Block_object_dispose(va, 8) = v7;
    *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestWindowFilled;
    *(void *)(a2 + 384) = uarpPlatformAssetPayloadDataRequestCompleted;
    if (*(_BYTE *)(a2 + 516) == 1)
    {
      *(_BYTE *)(a2 + 356) = 1;
      *(_DWORD *)(a2 + 336) = 10;
      *(void *)(a2 + 344) = *(void *)(a2 + 656);
      *(_DWORD *)(a2 + 352) = *(_DWORD *)(a2 + 664);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
    }

    uint64_t v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    unsigned int v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 424), v9);
      if ((_DWORD)result) {
        return result;
      }
      if (!*(void *)(a2 + 424)) {
        return 11LL;
      }
    }

    unsigned int v10 = *(_DWORD *)(a2 + 432);
    if (!v10)
    {
LABEL_19:
      UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(void *)(a2 + 424));
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }

    uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 440), v10);
    if (!(_DWORD)result)
    {
      if (*(void *)(a2 + 440)) {
        goto LABEL_19;
      }
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetPayloadDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned int *)(a2 + 520);
  if (!(_DWORD)v5) {
    goto LABEL_7;
  }
  UARPLayer2HashFinal(a1, v5, *(void *)(a3 + 112), *(void *)(a3 + 128), *(unsigned int *)(a3 + 120));
  BOOL v7 = uarpPlatformCompareHash( a1,  *(void **)(a3 + 128),  *(unsigned int *)(a3 + 120),  *(void **)(a2 + 528),  *(_DWORD *)(a2 + 536));
  uint64_t v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a3 + 112) = 0LL;
    *(_DWORD *)(a3 + 10_Block_object_dispose(va, 8) = 0;
  }

  unsigned int v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a3 + 12_Block_object_dispose(va, 8) = 0LL;
    *(_DWORD *)(a3 + 120) = 0;
  }

  *(_DWORD *)(a3 + 104) = 0;
  if (!v7) {
    UARPLayer2AssetCorrupt(a1, a2);
  }
  else {
LABEL_7:
  }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressionHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v5;
  *(_DWORD *)(a2 + 508) += v5;
  *(_BYTE *)(a3 + 44) = 0;
  unsigned int v6 = *(unsigned __int16 *)(a3 + 51);
  *(_DWORD *)(a3 + 24) = v6;
  uint64_t result = 0LL;
  *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressedBlock;
  return result;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uint64_t v7 = 0LL;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 36);
        *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetAllPayloadHeadersRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetAllPayloadHeadersRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }

      else
      {
        int v5 = 0;
        while (1)
        {
          uint64_t result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if ((_DWORD)result) {
            break;
          }
          uint64_t v6 = v7;
          *(void *)(v7 + 176) = *(void *)(a2 + 632);
          *(void *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448)) {
            goto LABEL_9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformAssetAllPayloadHeadersRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = *(unsigned int **)(a3 + 16);
  uint64_t v8 = *(void *)(a2 + 632);
  while (1)
  {
    if (!v8) {
      return 11LL;
    }
    uint64_t v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if ((_DWORD)v9) {
      break;
    }
    *(_DWORD *)(v8 + 124) = v6;
    uint64_t v8 = *(void *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
  }

  uint64_t v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4 = uarpHtonl(*a2);
  unsigned int v5 = uarpHtonl(a2[1]);
  uint64_t v9 = 0LL;
  int v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  uint64_t v7 = 0LL;
  if (!v6)
  {
    uint64_t v7 = v9;
    *uint64_t v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((void *)v7 + 1) = v7 + 6;
  }

  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1) {
      return 16LL;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 28);
    unsigned int v5 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 312) = v6;
    *(_DWORD *)(a2 + 316) = v5;
    for (uint64_t i = *(void *)(a2 + 632); i; uint64_t i = *(void *)(i + 176))
    {
      int v8 = *(_DWORD *)(i + 24);
      if (v8)
      {
        if (v8 != v5 + v6) {
          return 43LL;
        }
        v5 += *(_DWORD *)(i + 28);
        *(_DWORD *)(a2 + 316) = v5;
      }
    }

    *(_DWORD *)(a2 + 680) = v5;
    *(void *)(a2 + 672) = 0LL;
    if (v5)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 672), v5);
      if ((_DWORD)result) {
        return result;
      }
      int v9 = *(_DWORD *)(a2 + 680);
      int v10 = *(_DWORD *)(a2 + 316);
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 672);
      *(_DWORD *)(a2 + 336) = v9;
      *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
      if (v10) {
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = 0LL;
      *(_DWORD *)(a2 + 336) = 0;
      *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
    }

    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
    return 0LL;
  }

  return result;
}

uint64_t uarpPlatformAssetAllMetaDataWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3) {
    return 18LL;
  }
  if (v3)
  {
    int v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      int v10 = uarpProcessTLV(a1, v9);
      if (!v10) {
        return 10LL;
      }
      uint64_t v11 = (v10[1] + 8);
      int v9 = (unsigned int *)((char *)v9 + v11);
      *((void *)v10 + 2) = *(void *)(a2 + 720);
      *(void *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        int v12 = *(_DWORD *)(a2 + 32);
        int v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }

  else
  {
    int v12 = 0;
LABEL_9:
    unsigned int v13 = v4 + v12;
    *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v13;
    uint64_t v14 = *(void *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        unsigned int v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15) {
          return 18LL;
        }
        if (v15)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(a3 + 16) + v13);
          while (1)
          {
            int v17 = uarpProcessTLV(a1, v16);
            if (!v17) {
              return 10LL;
            }
            uint64_t v18 = (v17[1] + 8);
            uint64_t v16 = (unsigned int *)((char *)v16 + v18);
            *((void *)v17 + 2) = *(void *)(v14 + 168);
            *(void *)(v14 + 16_Block_object_dispose(va, 8) = v17;
            v15 -= v18;
            if (!v15)
            {
              int v19 = *(_DWORD *)(v14 + 28);
              unsigned int v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }

        int v19 = 0;
LABEL_17:
        uint64_t result = 0LL;
        v13 += v19;
        *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v13;
        uint64_t v14 = *(void *)(v14 + 176);
        if (!v14) {
          return result;
        }
      }
    }

    return 0LL;
  }

uint64_t uarpPlatformAssetAllMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressedBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = UARPLayer2DecompressBuffer( a1,  *(unsigned __int16 *)(a3 + 45),  *(void *)(a3 + 16),  *(unsigned __int16 *)(a3 + 51),  *(void *)(a3 + 32),  *(unsigned __int16 *)(a3 + 53));
  if ((_DWORD)v6)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, const char *))(a1 + 400);
    if (v7) {
      v7(*(void *)(a1 + 544), 2LL, "Error decompressing buffer for payload");
    }
    else {
      uarpLogError(2u, "Error decompressing buffer for payload");
    }
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }

  else
  {
    UARPLayer2HashUpdate( a1,  *(unsigned int *)(a3 + 104),  *(void *)(a3 + 112),  *(void *)(a3 + 32),  *(unsigned __int16 *)(a3 + 53));
    UARPLayer2PayloadData(a1, a2);
    int v8 = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v8;
    *(_DWORD *)(a2 + 508) += v8;
    *(_BYTE *)(a3 + 44) = 1;
    *(_DWORD *)(a3 + 24) = 10;
    *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
  }

  return v6;
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, void *a2, unsigned int a3)
{
  int v4 = *(uint64_t (**)(void, void *))(a1 + 48);
  if (v4) {
    return v4(*(void *)(a1 + 544), a2);
  }
  uint64_t v6 = uarpZalloc(a3);
  *a2 = v6;
  if (v6) {
    return 0LL;
  }
  else {
    return 11LL;
  }
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void, void *))(a1 + 56);
  if (v2) {
    v2(*(void *)(a1 + 544), a2);
  }
  else {
    uarpFree(a2);
  }
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  size_t v5 = *a4;
  uint64_t v6 = *(uint64_t (**)(void, void *, size_t))(a1 + 48);
  if (v6) {
    return v6(*(void *)(a1 + 544), a3, v5);
  }
  int v8 = uarpZalloc(v5);
  *a3 = v8;
  if (v8) {
    return 0LL;
  }
  else {
    return 11LL;
  }
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  unsigned int v3 = *(void (**)(void, void *))(a1 + 56);
  if (v3) {
    v3(*(void *)(a1 + 544), a3);
  }
  else {
    uarpFree(a3);
  }
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(void, void, const void *, uint64_t))(a1 + 80);
  if (!v4) {
    return 14LL;
  }
  if (!*(_WORD *)(a2 + 136)) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3, a4);
  }
  uarpPlatformDownstreamEndpointSendMessageInternal(a1, *(void *)(a2 + 176), a2, a3, a4);
  uarpPlatformEndpointSendMessageComplete(a1, a2, (uint64_t)a3);
  return 0LL;
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 88);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 96);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 104);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 112);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 120);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 128);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 136);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 144);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 152);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 160);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 168);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 176);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 184);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 192);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 200);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(void, unsigned int *, void *))a1[27];
  if (v5) {
    return v5(a1[68], a2, a3);
  }
  uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[64];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpPayloadTagPack(a2);
      uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[64];
    }

    return v7(a1[68], a2, a3);
  }

  else
  {
    *a3 = -1LL;
    a3[1] = -1LL;
    return 0LL;
  }

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 224);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(void, unsigned int *, void *))a1[29];
  if (v5) {
    return v5(a1[68], a2, a3);
  }
  uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[65];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpPayloadTagPack(a2);
      uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[65];
    }

    return v7(a1[68], a2, a3);
  }

  else
  {
    *a3 = -1LL;
    a3[1] = -1LL;
    return 0LL;
  }

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 240);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, void *a2)
{
  id v2 = *(uint64_t (**)(void))(a1 + 248);
  if (v2) {
    return v2(*(void *)(a1 + 544));
  }
  *a2 = -1LL;
  return 0LL;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 256);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 272);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2) {
      a2 = *(void *)(a2 + 40);
    }
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), a2, a3);
  }

  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, uint64_t))(result + 288);
  if (v3)
  {
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), a3);
  }

  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 296);
  if (!v2) {
    return 14LL;
  }
  *(_BYTE *)(a2 + 50) = 1;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 304);
  if (!v2) {
    return 14LL;
  }
  *(_BYTE *)(a2 + 50) = 0;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 312);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 320);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 328);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  int v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4) {
    return v4(a2, a3, a4);
  }
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 392);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 432);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReachable(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 440);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointUnreachable(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 448);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReleased(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 456);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointRecvMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a1 + 464);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 472);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(void *a1, uint64_t a2)
{
  id v2 = (uint64_t (*)(void, void))a1[60];
  if (v2) {
    return v2(a1[68], *(void *)(a2 + 40));
  }
  int v4 = (uint64_t (*)(void))a1[74];
  if (v4) {
    return v4();
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 488);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1LL;
  }
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a1 + 496);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1LL;
  }
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(result + 504);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 80);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 88);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 96);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 104);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 112);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  uint64_t v11 = *(uint64_t (**)(void, void, uint64_t, uint64_t, _DWORD *))(a2 + 120);
  if (v11) {
    return (void *)v11(a1[68], *(void *)(a2 + 704), a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 540);
  if (!(_DWORD)result) {
    goto LABEL_5;
  }
  size_t v5 = *(void (**)(void))(a1 + 376);
  if (v5) {
    v5();
  }
  uint64_t result = uarpPlatformCompareHash( a1,  *(void **)(a2 + 560),  *(unsigned int *)(a2 + 568),  *(void **)(a2 + 576),  *(_DWORD *)(a2 + 584));
  if ((_DWORD)result)
  {
LABEL_5:
    uint64_t v6 = *(uint64_t (**)(void, void))(a2 + 128);
    if (!v6) {
      return result;
    }
    return v6(*(void *)(a1 + 544), *(void *)(a2 + 704));
  }

  uint64_t v6 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v6) {
    return v6(*(void *)(a1 + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 136);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 144);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 152);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, void *a2)
{
  id v2 = (uint64_t (*)(void, void))a2[20];
  if (v2) {
    return v2(*(void *)(result + 544), a2[88]);
  }
  unsigned int v3 = (uint64_t (*)(void, void))a2[19];
  if (v3) {
    return v3(*(void *)(result + 544), a2[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v7 = (uint64_t (*)(void, uint64_t, void))a3[21];
  if (v7) {
    return v7(*(void *)(a1 + 544), a2, a3[88]);
  }
  int v9 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9) {
    return v9(*(void *)(a1 + 544), a3[88], a4, a5, a6, a7);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetSetBytesAtOffset2( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v6 = (uint64_t (*)(void, uint64_t, void))a3[22];
  if (v6) {
    return v6(*(void *)(a1 + 544), a2, a3[88]);
  }
  int v8 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8) {
    return v8(*(void *)(a1 + 544), a3[88], a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 184);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 192);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = (uint64_t (*)(void, uint64_t, void))a3[27];
  if (v3) {
    return v3(*(void *)(result + 544), a2, a3[88]);
  }
  int v4 = (uint64_t (*)(void, void))a3[36];
  if (v4) {
    return v4(*(void *)(result + 544), a3[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  int v4 = (uint64_t (*)(void, void, void))a3[28];
  if (v4) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3[88]);
  }
  uint64_t v6 = (uint64_t (*)(void, void, uint64_t))a3[37];
  if (v6) {
    return v6(*(void *)(a1 + 544), a3[88], a4);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 232);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 240);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 248);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 256);
  if (v3) {
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void))(a2 + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
  }

  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  for (uint64_t i = *(void *)(a1 + 568); i; uint64_t i = *(void *)(i + 712))
  {
  }

  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 580) != 1)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    for (*(void *)(a1 + 56_Block_object_dispose(va, 8) = 0LL; v4; *(void *)(a1 + 56_Block_object_dispose(va, 8) = v7)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 712);
        *(void *)(v7 + 712) = 0LL;
        uint64_t v8 = *(void *)(v7 + 696);
        BOOL v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0) {
          break;
        }
        if (a3 == 1)
        {
          if ((*(_WORD *)(v7 + 46) & 1) != 0)
          {
            *(void *)(v7 + 696) = 0LL;
            UARPLayer2AssetOrphaned(a1, v7);
          }

          else
          {
            *(_BYTE *)(v7 + 72) = 1;
          }
        }

        if (*(_BYTE *)(v7 + 72) != 1) {
          break;
        }
        UARPLayer2AssetReleased2(a1, a2, (void *)v7);
        *(void *)(v7 + 704) = 0LL;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4) {
          return;
        }
      }

      *(void *)(v7 + 712) = *(void *)(a1 + 568);
    }
  }

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 696) = 0LL;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0LL;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 640);
  if (v4 && !*(_BYTE *)(a2 + 652)) {
    UARPLayer2ReturnBuffer(a1, v4);
  }
  *(void *)(a2 + 640) = 0LL;
  *(_DWORD *)(a2 + 64_Block_object_dispose(va, 8) = 0;
  size_t v5 = *(void **)(a2 + 656);
  if (v5 && !*(_BYTE *)(a2 + 668)) {
    UARPLayer2ReturnBuffer(a1, v5);
  }
  *(void *)(a2 + 656) = 0LL;
  *(_DWORD *)(a2 + 664) = 0;
  uint64_t v6 = *(void **)(a2 + 672);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 672) = 0LL;
  }

  *(_DWORD *)(a2 + 680) = 0;
  uint64_t v7 = *(void **)(a2 + 720);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[2];
      v7[2] = 0LL;
      UARPLayer2ReturnBuffer(a1, v7);
      uint64_t v7 = v8;
    }

    while (v8);
  }

  *(void *)(a2 + 720) = 0LL;
  BOOL v9 = *(void **)(a2 + 632);
  if (v9)
  {
    do
    {
      int v10 = (void *)v9[21];
      uint64_t v11 = (void *)v9[22];
      if (v10)
      {
        do
        {
          int v12 = (void *)v10[2];
          v10[2] = 0LL;
          UARPLayer2ReturnBuffer(a1, v10);
          int v10 = v12;
        }

        while (v12);
      }

      v9[21] = 0LL;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v9);
      UARPLayer2ReturnBuffer(a1, v9);
      BOOL v9 = v11;
    }

    while (v11);
  }

  uarpPlatformPayloadCleanup(a1, a2 + 464);
  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 0LL;
  }
  while (v3 != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 0LL;
    }
  }

  return 1LL;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          uint64_t v12 = v16;
          if (v16)
          {
            *(void *)(v16 + 704) = a3;
            *(void *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              uint64_t v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                int v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534) {
                  int v15 = 1;
                }
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }

              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }

              *(_WORD *)(v14 + 44) = v15;
              *(void *)(v14 + 712) = *(void *)(a1 + 568);
              *(void *)(a1 + 56_Block_object_dispose(va, 8) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 4_Block_object_dispose(va, 8) = *a4;
              }

              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 80) = 0LL;
    *(_DWORD *)(a2 + 8_Block_object_dispose(va, 8) = 0;
  }

  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(void *)(a2 + 96) = 0LL;
    *(_DWORD *)(a2 + 104) = 0;
  }

  uint64_t v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 112) = 0LL;
    *(_DWORD *)(a2 + 120) = 0;
  }

  uint64_t v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(void *)(a2 + 64) = 0LL;
    *(_DWORD *)(a2 + 72) = 0;
  }

  uint64_t v8 = *(void **)(a2 + 152);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 152) = 0LL;
    *(_DWORD *)(a2 + 160) = 0;
  }

  BOOL v9 = *(void **)(a2 + 136);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a2 + 136) = 0LL;
    *(_DWORD *)(a2 + 144) = 0;
  }

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4) {
    return UARPLayer2AssetStore(result, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }

    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0LL);
    }
  }

  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(void *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0) {
        uint64_t result = uarpPlatformEndpointOfferAsset(v4, a2, *(void *)(v2 + 704));
      }
      uint64_t v2 = *(void *)(v2 + 712);
    }

    while (v2);
  }

  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(void *a1, uint64_t a2, _DWORD *a3)
{
  int v5 = *a3;
  unsigned int v6 = a3[1];
  unsigned int v9 = v6;
  if (v5 != 7)
  {
    uint64_t result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if ((_DWORD)result) {
      return result;
    }
    unsigned int v7 = v9;
    goto LABEL_6;
  }

  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    unsigned int v7 = 16;
LABEL_6:
    uint64_t result = 0LL;
    a3[1] = v7;
    return result;
  }

  return 39LL;
}

uint64_t uarpPlatformQueryAccessoryInfo( void *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) <= 1)
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            unsigned int v9 = 0;
            uint64_t active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }

          else
          {
            unsigned int v10 = 0;
            uint64_t active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }

          uint64_t Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }

        return 39LL;
      }

      if (a2 == 8)
      {
        *a5 = 8;
        if (a4 < 8) {
          return 39LL;
        }
        uint64_t Error = UARPLayer2LastError((uint64_t)a1, a3);
        *a3 = uarpHtonl(*a3);
        a3[1] = uarpHtonl(a3[1]);
      }

      else
      {
        *a5 = 0;
        return 28LL;
      }

      return Error;
  }

uint64_t uarpPlatformResponseAccessoryInfo( uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8 = result;
  switch(a4)
  {
    case 1:
      uint64_t result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      uint64_t result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      uint64_t result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      uint64_t result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 13_Block_object_dispose(va, 8) = *(_OWORD *)a6;
      }

      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }

      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpHtonl(*a6);
        a6[1] = uarpHtonl(a6[1]);
        a6[2] = uarpHtonl(a6[2]);
        a6[3] = uarpHtonl(a6[3]);
        uint64_t result = UARPLayer2StatisticsResponse(v8, a2);
      }

      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpHtonl(*a6);
        a6[1] = uarpHtonl(a6[1]);
        uint64_t result = UARPLayer2LastErrorResponse(v8, a2);
      }

      break;
    case 9:
      uint64_t result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t uarpPlatformAssetDataRequest( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8 = *(void *)(a1 + 568);
  if (!v8) {
    return 17LL;
  }
  while (*(_DWORD *)(v8 + 304) != 1 || *(void *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    uint64_t v8 = *(void *)(v8 + 712);
    if (!v8) {
      return 17LL;
    }
  }

  unsigned int v10 = *(_DWORD *)(v8 + 68);
  else {
    unsigned __int16 v11 = a4;
  }
  else {
    unsigned __int16 v12 = 0;
  }
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return UARPLayer2DataTransferResume(a1, a2);
  }
  while (1)
  {
    if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 696) == a2)
    {
      uint64_t result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
      if ((_DWORD)result) {
        break;
      }
    }

    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return UARPLayer2DataTransferResume(a1, a2);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4) {
      return uarpPlatformAssetRescind(result, a2, v4);
    }
    uint64_t v5 = *(void *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(void *)(v5 + 696) == a2) {
        *(_BYTE *)(v5 + 72) = 1;
      }
      uint64_t v5 = *(void *)(v5 + 712);
    }

    while (v5);
  }

  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    if (a3 != 0xFFFF) {
      return result;
    }
    uint64_t v4 = 0LL;
  }

  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2)
  {
    uint64_t v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      uint64_t v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + _Block_object_dispose(va, 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }

    else
    {
      return 11LL;
    }
  }

  else if (a4 == 3)
  {
    return 0LL;
  }

  else
  {
    return 13LL;
  }

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpPayloadTagPack((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6) {
    return 11LL;
  }
  *(_DWORD *)(v6[2] + 6LL) = *a3;
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  if ((a4 & 2) == 0) {
    return 0LL;
  }
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(void *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }

  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  int v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  uint64_t result = 0LL;
  if (!v4)
  {
    uint64_t result = v6;
    if (v6)
    {
      *(void *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(void *)(result + 712) = *(void *)(a1 + 568);
      *(void *)(a1 + 56_Block_object_dispose(va, 8) = result;
    }
  }

  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(void *)(a1 + 376)) {
    return 1LL;
  }
  if ((_DWORD)__n == a5) {
    return memcmp(__s1, __s2, __n) == 0;
  }
  return 0LL;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!*(void *)(a2 + 80)) {
    return 1LL;
  }
  if (!*(_WORD *)(a2 + 28)) {
    return 2LL;
  }
  uint64_t v5 = 0LL;
  unint64_t v6 = 0LL;
  while (uarpAssetTagIsValid((_BYTE *)(*(void *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4LL;
  }

  *(_DWORD *)(*(void *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (uint64_t i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            uint64_t v5 = *i;
            if (*i)
            {
              if (*(void *)v5 == a3) {
                break;
              }
            }

            if (!--v3) {
              return result;
            }
          }

          *(_BYTE *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(_BYTE *)(v5 + 31)) {
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
          }
        }
      }
    }
  }

  return result;
}

uint64_t UARPPlatformDownstreamEndpointByID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*i)
        {
        }

        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t UARPPlatformDownstreamEndpointByDelegate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*(void *)(*i + 176) == a2 && *(void *)(result + 40) == a3) {
          break;
        }
        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformDownstreamEndpointSendMessageInternal( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  return uarpTransmitBufferUpstream(a1, a2, *(unsigned __int16 *)(a3 + 136), a4, a5);
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 560);
    uint64_t v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6) {
        goto LABEL_5;
      }
    }

    uint64_t result = 0LL;
    *uint64_t v5 = a2;
  }

  else
  {
LABEL_5:
    int v7 = v4 + 1;
    uint64_t v11 = 0LL;
    uint64_t result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!(_DWORD)result)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 556);
      if ((_DWORD)v9)
      {
        uint64_t v10 = 0LL;
        do
        {
          *(void *)(v11 + v10) = *(void *)(*(void *)(a1 + 560) + v10);
          v10 += 8LL;
        }

        while (8 * v9 != v10);
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      *(void *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 556) = v7;
      *(void *)(a1 + 560) = v11;
    }
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  uint64_t v4 = 0LL;
  int v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  uint64_t result = 0LL;
  if (!v2)
  {
    else {
      return v4;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 46) != 1 || !*(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v3 = (_DWORD *)(a2 + 52);
  int v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2) {
    return 59LL;
  }
  if (!v4) {
    return 60LL;
  }
  int v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 62;
  }
  if (v6 == 2) {
    return 61LL;
  }
  else {
    return v7;
  }
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5) {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    unsigned int v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      if (a3 >= 4) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = a3;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = a3;
    int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      uint64_t v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + _Block_object_dispose(va, 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 1u);
}

uint64_t uarpSendDataTransferNotification(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + _Block_object_dispose(va, 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF) {
    unsigned int v13 = 0xFFFF;
  }
  else {
    unsigned int v13 = a5;
  }
  *(_WORD *)(v12 + 12) = uarpHtons(v13);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific( uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (!a2) {
    return 13LL;
  }
  uint64_t v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12) {
    return 11LL;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v12[2];
  __int16 v15 = *a3;
  *(_BYTE *)(v14 + _Block_object_dispose(va, 8) = *((_BYTE *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5)
  {
    if (a6) {
      memcpy((void *)(v14 + 11), a5, a6);
    }
  }

  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t uarpSendDownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  int v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x15u, 6u, 1);
  if (v4) {
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  }
  else {
    return 11LL;
  }
}

uint64_t uarpSendDownstreamEndpointReachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x17u, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDownstreamEndpointUnreachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x19u, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpTransmitBufferUpstream(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Bu, (unsigned __int16)(a5 + 8), 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  memcpy((void *)(v12 + 8), a4, a5);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30LL;
  if (!a1 || !a2 || !a3) {
    return v4;
  }
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6) {
    return 9LL;
  }
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  unsigned __int16 v9 = uarpHtons(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4) {
    return 9LL;
  }
  uint64_t v4 = 1LL;
  *(_BYTE *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_183;
      }

      unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_165;
      }
      uint64_t v13 = 0LL;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(a2 + 120) + 8 * v13);
        if (v14)
        {
          if (!uarpHtons(**(unsigned __int16 **)(v14 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v14);
LABEL_165:
            *(void *)(a2 + 146) = 0LL;
            *(void *)(a2 + 13_Block_object_dispose(va, 8) = 0LL;
            *(void *)(a2 + 162) = 0LL;
            *(void *)(a2 + 154) = 0LL;
            int v123 = *(_DWORD *)(a1 + 552);
            if (v123 == 1
              || v123 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(void *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }

            if (*(_BYTE *)(a2 + 14) == 1) {
              uarpPlatformReOfferFirmware(a1, a2);
            }
            goto LABEL_183;
          }

          unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
        }
      }

    case 1u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      unsigned int v15 = uarpHtons(a3[3]);
      unsigned int v16 = *(unsigned __int16 *)(a1 + 12);
      if (v15 < v16) {
        unsigned int v16 = v15;
      }
      if (v16 <= 1) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = v16;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = v17;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_183;
    case 2u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v18 = uarpHtons(a3[3]);
      a3[3] = v18;
      if (v18)
      {
        uint64_t v4 = 2LL;
        goto LABEL_184;
      }

      unsigned int v118 = uarpHtons(a3[4]);
      if (v118 <= 1) {
        unsigned int v119 = 1;
      }
      else {
        unsigned int v119 = v118;
      }
      if (v119 >= 4) {
        LOWORD(v119) = 4;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = v119;
      unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_182;
      }
      uint64_t v121 = 0LL;
      break;
    case 3u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v19 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v19) {
        goto LABEL_147;
      }
      uint64_t v20 = v19;
      uint64_t v21 = v19[2];
      *(_DWORD *)(v21 + _Block_object_dispose(va, 8) = uarpHtonl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v21 + 12) = *((_DWORD *)v20 + 6) - 16;
      int updated = uarpCallbackUpdateInformationTLV((void *)a1, a2, (_DWORD *)(v21 + 8));
      unsigned __int16 v23 = updated;
      if (updated)
      {
        __int16 v24 = 16;
      }

      else
      {
        __int16 v124 = *(_WORD *)(v21 + 12);
        *(_WORD *)(v21 + 2) = uarpHtons((unsigned __int16)(v124 + 10));
        *(_DWORD *)(v21 + _Block_object_dispose(va, 8) = uarpHtonl(*(_DWORD *)(v21 + 8));
        *(_DWORD *)(v21 + 12) = uarpHtonl(*(_DWORD *)(v21 + 12));
        __int16 v24 = v124 + 16;
      }

      *(_WORD *)(v21 + 6) = uarpHtons(v23);
      *((_WORD *)v20 + 14) = v24;
      goto LABEL_175;
    case 4u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      uint64_t v25 = uarpHtons(a3[3]);
      int v26 = uarpHtonl(*((_DWORD *)a3 + 2));
      unsigned int v27 = uarpHtonl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v25, v26, v27, (unsigned int *)a3 + 4);
      goto LABEL_183;
    case 5u:
      if (a4 < 0x24) {
        goto LABEL_94;
      }
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v130);
      unsigned int v28 = uarpHtons(a3[5]);
      uint64_t v29 = uarpHtons(a3[6]);
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), &v129);
      unsigned int v30 = uarpHtonl(*(_DWORD *)(a3 + 15));
      unsigned int v31 = uarpHtons(a3[17]);
      v32 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v32) {
        goto LABEL_147;
      }
      uint64_t v33 = (uint64_t)v32;
      uint64_t v34 = v32[2];
      *(_DWORD *)(v34 + 6) = uarpPayloadTagPack(&v130);
      *(_WORD *)(v34 + 10) = uarpHtons(v28);
      *(_WORD *)(v34 + 12) = uarpHtons(v29);
      uarpVersionEndianSwap((unsigned int *)&v129, (_DWORD *)(v34 + 14));
      *(_DWORD *)(v34 + 30) = uarpHtonl(v30);
      *(_WORD *)(v34 + 34) = uarpHtons(v31);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v33);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v35 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v29);
      if (v35 && !*(_DWORD *)(v35 + 8)) {
        goto LABEL_183;
      }
      uint64_t PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v29, v28, (unsigned __int8 *)&v130);
      if (!PreparedAsset)
      {
        uint64_t PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset) {
          goto LABEL_147;
        }
      }

      *(void *)(PreparedAsset + 452) = -1LL;
      *(_DWORD *)(PreparedAsset + 44_Block_object_dispose(va, 8) = uarpHtons(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v29;
      *(_WORD *)(PreparedAsset + 46) = v28;
      *(_DWORD *)(PreparedAsset + 4_Block_object_dispose(va, 8) = v130;
      *(_OWORD *)(PreparedAsset + 52) = v129;
      *(_DWORD *)(PreparedAsset + 6_Block_object_dispose(va, 8) = uarpHtonl(*(_DWORD *)(a3 + 15));
      __int16 v37 = *(_WORD *)(PreparedAsset + 46);
      if ((v37 & 1) != 0)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }

      else
      {
        if ((v37 & 2) == 0)
        {
          uint64_t v4 = 22LL;
          goto LABEL_184;
        }

        UARPLayer2DynamicAssetOffered(a1, a2);
      }

      goto LABEL_183;
    case 6u:
      if (a4 < 0xE) {
        goto LABEL_94;
      }
      unsigned int v38 = uarpHtons(a3[6]);
      if (*(_DWORD *)a2 >= v38) {
        unsigned __int16 v39 = v38;
      }
      else {
        unsigned __int16 v39 = *(_DWORD *)a2;
      }
      LOWORD(v129) = v39;
      uint64_t v40 = uarpHtonl(*((_DWORD *)a3 + 2));
      int v41 = uarpHtons(a3[3]);
      v42 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v39 + 18), 0);
      if (!v42) {
        goto LABEL_147;
      }
      uint64_t v20 = v42;
      uint64_t v43 = v42[2];
      unsigned __int16 v44 = uarpPlatformAssetDataRequest(a1, a2, v41, v39, v40, (void *)(v43 + 18), (unsigned __int16 *)&v129);
      *(_WORD *)(v43 + 6) = uarpHtons(v44);
      *(_WORD *)(v43 + _Block_object_dispose(va, 8) = a3[3];
      *(_DWORD *)(v43 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v43 + 14) = a3[6];
      *(_WORD *)(v43 + 16) = uarpHtons((unsigned __int16)v129);
      __int16 v45 = v129 + 18;
      *(_WORD *)(v43 + 2) = uarpHtons((unsigned __int16)(v129 + 12));
      *((_WORD *)v20 + 14) = v45;
LABEL_175:
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v20;
LABEL_176:
      uint64_t v11 = uarpTransmitBuffer2(v70, v71, v72);
      goto LABEL_177;
    case 7u:
      if (a4 < 0x12) {
        goto LABEL_94;
      }
      int v46 = uarpHtons(a3[4]);
      uint64_t v47 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v46);
      if (!v47) {
        goto LABEL_149;
      }
      uint64_t v48 = v47;
      uint64_t v49 = uarpHtons(a3[3]);
      int v50 = uarpHtonl(*(_DWORD *)(a3 + 5));
      int v51 = uarpHtons(a3[7]);
      size_t v52 = uarpHtons(a3[8]);
      unsigned int v53 = uarpPlatformAssetResponseData(a1, v48, v49, a3 + 9, v50, v51, v52);
      if (v53 == 29) {
        uint64_t v4 = 0LL;
      }
      else {
        uint64_t v4 = v53;
      }
      goto LABEL_184;
    case 8u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      char v54 = uarpHtons(a3[3]);
      v55 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v55) {
        goto LABEL_147;
      }
      *(_WORD *)(v55[2] + 6LL) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v55);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if ((v54 & 1) != 0 && *(_BYTE *)(a2 + 56) == 1)
      {
        *(_BYTE *)(a2 + 56) = 0;
        uint64_t v11 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_177;
      }

      if ((v54 & 2) == 0 || *(_BYTE *)(a2 + 56))
      {
        uint64_t v4 = 33LL;
        goto LABEL_184;
      }

      *(_BYTE *)(a2 + 56) = 1;
      uint64_t v11 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_177;
    case 9u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      unsigned int v56 = uarpHtons(a3[3]);
      uint64_t v57 = uarpHtons(a3[4]);
      uint64_t v58 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v56);
      if (!v58) {
        goto LABEL_183;
      }
      v59 = (void *)v58;
      LODWORD(v129) = *(_DWORD *)(v58 + 48);
      __int16 v60 = *(_WORD *)(v58 + 46);
      v61 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v61) {
        goto LABEL_147;
      }
      uint64_t v62 = (uint64_t)v61;
      uint64_t v63 = v61[2];
      *(_WORD *)(v63 + 6) = uarpHtons(v56);
      *(_WORD *)(v63 + _Block_object_dispose(va, 8) = uarpHtons(v57);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v62);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v59, v57);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if ((v60 & 2) != 0)
      {
        v64 = *(unsigned __int8 **)(a2 + 80);
        if (v64)
        {
          if (uarp4ccCompare((unsigned __int8 *)&v129, v64))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              unint64_t v65 = 0LL;
            }

            else
            {
              unint64_t v127 = 0LL;
              do
              {
                *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127) = *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127 + 4);
                unint64_t v65 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v127;
              }

              while (v127 < v65);
            }

            v128 = *(_BYTE **)(a2 + 80);
            *(_DWORD *)&v128[4 * v65] = 0;
            if (uarpAssetTagIsValid(v128)) {
              goto LABEL_189;
            }
          }
        }
      }

      goto LABEL_183;
    case 0xAu:
      unsigned __int16 v66 = UARPLayer2ApplyStagedAssets(a1, a2);
      uint64_t v4 = 11LL;
      v67 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v67) {
        goto LABEL_184;
      }
      v68 = v67;
      uint64_t v69 = v67[2];
      *(_WORD *)(v69 + 6) = uarpHtons(v66);
      *(_WORD *)(v69 + _Block_object_dispose(va, 8) = uarpHtons((unsigned __int16)v129);
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v68;
      goto LABEL_176;
    case 0xBu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      uarpHtons(a3[3]);
      uarpHtons(a3[4]);
      uint64_t v11 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_177;
    case 0xCu:
      if (a4 < 8) {
        goto LABEL_94;
      }
      int v73 = uarpHtons(a3[3]);
      v74 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v74) {
        goto LABEL_147;
      }
      *(_WORD *)(v74[2] + 6LL) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v74);
      if (!(_DWORD)v4) {
        uarpPlatformAssetRescinded(a1, a2, v73);
      }
      goto LABEL_184;
    case 0xDu:
      BOOL v10 = a4 >= 0x24;
      goto LABEL_109;
    case 0xEu:
      if (a4 < 8) {
        goto LABEL_131;
      }
      char v75 = uarpHtons(a3[3]);
      if ((v75 & 1) != 0)
      {
        uint64_t v11 = UARPLayer2DataTransferPauseAck(a1, a2);
      }

      else
      {
        if ((v75 & 2) == 0)
        {
          uint64_t v4 = 26LL;
          goto LABEL_184;
        }

        uint64_t v11 = UARPLayer2DataTransferResumeAck(a1, a2);
      }

      goto LABEL_177;
    case 0xFu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v76 = uarpHtons(a3[3]);
      uarpHtons(a3[4]);
      uint64_t v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77) {
        goto LABEL_183;
      }
      uint64_t v78 = v77;
      uint64_t v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(_BYTE *)(v78 + 72) = 1;
      goto LABEL_184;
    case 0x10u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v79 = uarpHtons(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0LL);
        goto LABEL_183;
      }

      uint64_t v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_183;
      }

LABEL_149:
      uint64_t v4 = 17LL;
      goto LABEL_184;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_94:
        uint64_t v4 = 9LL;
        goto LABEL_184;
      }

      v108 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v108)
      {
LABEL_147:
        uint64_t v4 = 11LL;
        goto LABEL_184;
      }

      uint64_t v109 = (uint64_t)v108;
      uint64_t v110 = v108[2];
      *(_DWORD *)(v110 + 6) = uarpHtonl(0);
      *(_DWORD *)(v110 + 10) = *(_DWORD *)(a3 + 3);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v109);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      LODWORD(v129) = *(_DWORD *)(a3 + 3);
      int v111 = uarpAssetQueueSolicitation(a1, a2, &v129);
      if (v111 == 1)
      {
LABEL_189:
        UARPLayer2AssetSolicitation(a1, a2);
      }

      else if (v111 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, &v129, 2u, 3328);
      }

      goto LABEL_183;
    case 0x12u:
      BOOL v10 = a4 >= 0xE;
      goto LABEL_109;
    case 0x13u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      unsigned int v81 = uarpHtons(a3[5]);
      int v82 = *(_DWORD *)(a3 + 3);
      LODWORD(v129) = v82;
      v83 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v83) {
        goto LABEL_147;
      }
      uint64_t v84 = (uint64_t)v83;
      uint64_t v85 = v83[2];
      *(_DWORD *)(v85 + 6) = v82;
      *(_WORD *)(v85 + 10) = uarpHtons(v81);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v84);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v86 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)&v129);
      if (v86)
      {
        *(_BYTE *)(v86 + 72) = 1;
        uint64_t v11 = UARPLayer2AssetPreProcessingNotification(a1, a2, v86);
        goto LABEL_177;
      }

      uint64_t v4 = 3LL;
      goto LABEL_184;
    case 0x14u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      uarpHtons(a3[5]);
      LODWORD(v129) = *(_DWORD *)(a3 + 3);
      uint64_t v87 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)&v129);
      if (v87)
      {
        *(_BYTE *)(v87 + 72) = 1;
        uint64_t v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v87);
        if ((_DWORD)v4 != 3) {
          goto LABEL_184;
        }
      }

      goto LABEL_183;
    case 0x15u:
      v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x16u, 8u, 0);
      if (!v88) {
        goto LABEL_147;
      }
      uint64_t v89 = (uint64_t)v88;
      uint64_t v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v89);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointDiscovery(a1, a2);
      goto LABEL_177;
    case 0x16u:
      BOOL v10 = a4 >= 8;
      goto LABEL_109;
    case 0x17u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v92 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x18u, 0xAu, 0);
      if (!v92) {
        goto LABEL_147;
      }
      uint64_t v93 = (uint64_t)v92;
      uint64_t v94 = v92[2];
      *(_WORD *)(v94 + 6) = uarpHtons(0);
      *(_WORD *)(v94 + _Block_object_dispose(va, 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v93);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v95 = uarpPlatformRemoteEndpointAlloc(a1);
      if (!v95) {
        goto LABEL_147;
      }
      v96 = (void *)v95;
      *(_WORD *)(v95 + 136) = uarpHtons(a3[3]);
      v96[22] = a2;
      uint64_t v4 = fUarpLayer3DownstreamEndpointReachable(a1, a2);
      if ((_DWORD)v4) {
        UARPLayer2ReturnBuffer(a1, v96);
      }
      goto LABEL_184;
    case 0x18u:
    case 0x1Cu:
      BOOL v10 = a4 >= 0xA;
LABEL_109:
      int v91 = !v10;
      uint64_t v4 = (8 * v91);
      goto LABEL_184;
    case 0x19u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v97 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Au, 0xAu, 0);
      if (!v97) {
        goto LABEL_147;
      }
      uint64_t v98 = (uint64_t)v97;
      int v99 = uarpHtons(a3[3]);
      uint64_t v100 = UARPPlatformDownstreamEndpointByID(a1, a2, v99);
      uint64_t v101 = *(void *)(v98 + 16);
      if (v100) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = 58;
      }
      *(_WORD *)(v101 + 6) = uarpHtons(v102);
      *(_WORD *)(v101 + _Block_object_dispose(va, 8) = a3[3];
      uint64_t v103 = uarpTransmitBuffer2(a1, a2, v98);
      uint64_t v4 = v103;
      if (!v100 || (_DWORD)v103) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointUnreachable(a1, a2);
      goto LABEL_177;
    case 0x1Au:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v104 = uarpHtons(a3[4]);
      fUarpLayer3DownstreamEndpointReleased(a1, a2);
      goto LABEL_183;
    case 0x1Bu:
      if (a4 < 0xE) {
        goto LABEL_131;
      }
      v112 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Cu, 0xAu, 0);
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v113 = (uint64_t)v112;
      int v114 = uarpHtons(a3[3]);
      uint64_t v115 = UARPPlatformDownstreamEndpointByID(a1, a2, v114);
      uint64_t v116 = *(void *)(v113 + 16);
      if (v115) {
        unsigned int v117 = 0;
      }
      else {
        unsigned int v117 = 58;
      }
      *(_WORD *)(v116 + 6) = uarpHtons(v117);
      *(_WORD *)(v116 + _Block_object_dispose(va, 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v113);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if (v115)
      {
        uint64_t v11 = fUarpLayer3DownstreamEndpointRecvMessage(a1, a2, v115);
        goto LABEL_177;
      }

      v126 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 400);
      if (v126) {
        v126( *(void *)(a1 + 544),  8LL,  "UARP.LAYER2 <%s> Cannot find downstream endpoint",  "uarpMsgRecvDownstreamEndpointMessage");
      }
      else {
        uarpLogError(8u, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
LABEL_194:
      uint64_t v4 = 58LL;
      goto LABEL_184;
    case 0x1Du:
      v105 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v105) {
        goto LABEL_147;
      }
      uint64_t v106 = (uint64_t)v105;
      uint64_t v107 = v105[2];
      *(_WORD *)(v107 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v106);
      if (!(_DWORD)v4) {
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      }
      goto LABEL_184;
    case 0x1Eu:
      goto LABEL_183;
    default:
      if (*a3 != 0xFFFF) {
        goto LABEL_184;
      }
      if (a4 < 0xB)
      {
LABEL_131:
        uint64_t v4 = 8LL;
      }

      else
      {
        uarpHtons(*(unsigned __int16 *)((char *)a3 + 9));
        uint64_t v11 = UARPLayer2VendorSpecificRecvMessage((void *)a1, a2);
LABEL_177:
        uint64_t v4 = v11;
      }

      goto LABEL_184;
  }

  while (1)
  {
    uint64_t v122 = *(void *)(*(void *)(a2 + 120) + 8 * v121);
    if (v122) {
      break;
    }
LABEL_161:
  }

  if (uarpHtons(**(unsigned __int16 **)(v122 + 16)) != 1)
  {
    unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_161;
  }

  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v122);
LABEL_182:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_183:
  uint64_t v4 = 0LL;
LABEL_184:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(_BYTE *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

uint64_t uarpCompressionHeaderEndianSwap(unsigned __int16 *a1, uint64_t a2)
{
  *(_WORD *)a2 = uarpHtons(*a1);
  *(_DWORD *)(a2 + 2) = uarpHtonl(*(_DWORD *)(a1 + 1));
  *(_WORD *)(a2 + 6) = uarpHtons(a1[3]);
  uint64_t result = uarpHtons(a1[4]);
  *(_WORD *)(a2 + _Block_object_dispose(va, 8) = result;
  return result;
}

char *uarpAssetTagChdr4cc()
{
  uint64_t result = uarpAssetTagChdr4cc_assetTag;
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagChdr4cc_assetTag);
}

int *uarpAssetTagStructChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructChdr_myTag;
  uarpAssetTagStructChdr_myTag = *(_DWORD *)uarpAssetTagChdr4cc_assetTag;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2 = result >> 8;
  unsigned int v3 = WORD1(result);
  if ((_DWORD)result) {
    char v4 = result;
  }
  else {
    char v4 = 48;
  }
  if (!(_DWORD)result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }

  *a2 = v4;
  a2[1] = v2;
  if ((_DWORD)result) {
    char v5 = BYTE3(result);
  }
  else {
    char v5 = 48;
  }
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

_BYTE *uarpPayloadTagStructPack(_BYTE *result, _BYTE *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2) {
    return 2LL;
  }
  if (*a1 < *a2) {
    return 1LL;
  }
  unsigned int v2 = a1[1];
  unsigned int v3 = a2[1];
  if (v2 > v3) {
    return 2LL;
  }
  if (v2 < v3) {
    return 1LL;
  }
  unsigned int v4 = a1[2];
  unsigned int v5 = a2[2];
  if (v4 > v5) {
    return 2LL;
  }
  if (v4 < v5) {
    return 1LL;
  }
  unsigned int v7 = a1[3];
  unsigned int v8 = a2[3];
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 == v8;
  BOOL v11 = v7 < v8;
  if (!v10 && v9) {
    return 2LL;
  }
  else {
    return v11;
  }
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }

  else
  {
    return 3LL;
  }

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  uint64_t result = uarpHtonl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E) {
    return "<unknown>";
  }
  else {
    return (&off_18A28BE88)[a1];
  }
}

BOOL uarpAssetTagIsValid(_BYTE *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  uint64_t result = &uarpAssetTagStructSuperBinary_myTag;
  uarpAssetTagStructSuperBinary_myTag = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  else {
    return (&off_18A28C080)[a1 - 1];
  }
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0xE) {
    return "<unknown>";
  }
  else {
    return (&off_18A28C0B0)[v1];
  }
}

const char *uarpProcessingStatusToString(int a1)
{
  else {
    return (&off_18A28C128)[(__int16)(a1 - 1)];
  }
}

__int128 *uarpStageStatusToString(unsigned __int16 a1)
{
  unsigned int v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)uarpStageStatusToString_stageStatusString, "Upload Complete");
      return uarpStageStatusToString_stageStatusString;
    case 2:
      goto LABEL_7;
    case 3:
      unsigned int v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      unsigned int v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      unsigned int v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      unsigned int v1 = "<unknown>";
LABEL_7:
      unint64_t v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)uarpStageStatusToString_stageStatusString, 0x100uLL, "%s (%s)", v1, v2);
      return uarpStageStatusToString_stageStatusString;
  }

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2) {
    return "<unknown>";
  }
  else {
    return (&off_18A28C198)[a1];
  }
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8) {
    return "<unknown>";
  }
  else {
    return (&off_18A28C150)[a1];
  }
}

void *uarpProcessPayloadTLVInternal( void *result, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v10 = (uint64_t)result;
  if (a4 == -858619624)
  {
    *(_DWORD *)(a3 + 120) = a5;
    unsigned int v15 = (void **)(a3 + 112);
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 == -858619625)
  {
    if ((_DWORD)a5 == 2)
    {
      uint64_t v12 = uarpHtons(*(unsigned __int16 *)a6);
      *(_DWORD *)(a3 + 76) = v12;
      UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
      unsigned int v13 = *(_DWORD *)(a3 + 88);
      if (!v13 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 80), v13) && *(void *)(a3 + 80))
      {
        unsigned int v14 = *(_DWORD *)(a3 + 104);
      }

      *(_DWORD *)(a3 + 76) = 0;
    }

    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (*(_DWORD *)(a3 + 76))
  {
    int v18 = uarpHtonl(a4);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v18, 4LL);
    int v17 = uarpHtonl(a5);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v17, 4LL);
    uint64_t result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)a6, a5);
  }

  if (a4 > -858619631)
  {
    if (a4 == -858619630)
    {
      if ((_DWORD)a5 == 2)
      {
        uint64_t result = (void *)uarpHtons(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 56) = (_DWORD)result;
        return result;
      }
    }

    else
    {
      if (a4 != -858619623) {
        return result;
      }
      if ((_DWORD)a5 == 4)
      {
        uint64_t result = (void *)uarpHtonl(*a6);
        *(_DWORD *)(a3 + 12_Block_object_dispose(va, 8) = (_DWORD)result;
        return result;
      }
    }

    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 == -858619641)
  {
    *(_DWORD *)(a3 + 72) = a5;
    unsigned int v16 = (void **)(a3 + 64);
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 != -858619636) {
    return result;
  }
  if ((_DWORD)a5 != 4) {
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  uint64_t result = (void *)uarpHtonl(*a6);
  if (!(_DWORD)result) {
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  *(_BYTE *)(a3 + 52) = 1;
  if (!*(void *)(a2 + 656))
  {
    uint64_t result = (void *)UARPLayer2RequestBuffer(v10, (void *)(a2 + 656), *(_DWORD *)(a2 + 648));
    if (*(void *)(a2 + 656))
    {
      *(_DWORD *)(a2 + 664) = *(_DWORD *)(a2 + 648);
      *(_BYTE *)(a2 + 66_Block_object_dispose(va, 8) = 0;
    }
  }

  return result;
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3) {
    return 2LL;
  }
  else {
    return 3LL;
  }
}

uint64_t uarpDownstreamEndpointGetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_WORD *)(a1 + 136);
    }
  }

  return result;
}

void uarpPrintDataResponseDetails( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 544);
    uint64_t v14 = *(int *)(a1 + 552);
    else {
      unsigned int v15 = (&off_18A28C198)[v14];
    }
    int v18 = uarpStatusCodeToString(a4);
    v12( v13,  1LL,  "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u",  v15,  v18,  a5,  a6,  a7);
  }

  else
  {
    uint64_t v16 = *(int *)(a1 + 552);
    else {
      int v17 = (&off_18A28C198)[v16];
    }
    int v19 = uarpStatusCodeToString(a4);
    uarpLogInfo( 1u,  "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u",  v17,  v19,  a5,  a6,  a7);
  }

  uint64_t v20 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    uint64_t v21 = *(int *)(a1 + 552);
    else {
      uint64_t v22 = (&off_18A28C198)[v21];
    }
    if (*(_BYTE *)(a3 + 80) == 1) {
      uint64_t v25 = "YES";
    }
    else {
      uint64_t v25 = "NO";
    }
    v20( *(void *)(a1 + 544),  1LL,  "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u",  v22,  v25,  *(_DWORD *)(a3 + 92),  *(_DWORD *)(a3 + 96));
  }

  else
  {
    uint64_t v23 = *(int *)(a1 + 552);
    else {
      __int16 v24 = (&off_18A28C198)[v23];
    }
    if (*(_BYTE *)(a3 + 80) == 1) {
      int v26 = "YES";
    }
    else {
      int v26 = "NO";
    }
    uarpLogInfo( 1u,  "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u",  v24,  v26,  *(_DWORD *)(a3 + 92),  *(_DWORD *)(a3 + 96));
  }

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

void *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = 0LL;
  int v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  uint64_t result = 0LL;
  if (!v6)
  {
    unsigned int v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3) {
      unsigned int v8 = a3;
    }
    unsigned int v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0LL;
    }

    else
    {
      unsigned int v9 = v11;
      uint64_t result = v12;
      *((_DWORD *)v12 + 2) = v11;
      uint64_t v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }

  return result;
}

void *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10) {
    goto LABEL_2;
  }
  __int16 v14 = *(_WORD *)(a2 + 96);
  uint64_t v23 = 0LL;
  unsigned int v15 = 16 * (v14 & 0x7FFF);
  unsigned __int16 v16 = 2 * v14;
  uint64_t v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(void *)(v23 + 8 * v17++) = TransmitBuffer2;
    }

    while (v16 != v17);
  }

  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(void *)(a2 + 104) = v23;
  uint64_t v22 = 0LL;
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 8LL * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(void *)(v22 + v20) = *(void *)(*(void *)(a2 + 120) + v20);
      v20 += 8LL;
    }

    while (v21 != v20);
  }

  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(void *)(a2 + 120) = v22;
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    size_t v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((_BYTE *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)v10[2] = uarpHtons(a3);
      __int16 v12 = uarpHtons((unsigned __int16)(a4 - 6));
      uint64_t v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }

    return 0LL;
  }

  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    uint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(a2 + 120);
      if (!*(void *)(v5 + v4))
      {
        *(void *)(v5 + v4) = *(void *)(v5 + v4 + 8);
        *(void *)(*(void *)(a2 + 120) + v4 + _Block_object_dispose(va, 8) = 0LL;
      }

      v4 += 8LL;
    }

    while (8LL * (v3 - 1) != v4);
  }

  if (!(_DWORD)v3) {
    return 11LL;
  }
  for (uint64_t i = *(void **)(a2 + 120); *i; ++i)
  {
    if (!--v3) {
      return 11LL;
    }
  }

  *uint64_t i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0LL;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112)) {
    return 0LL;
  }
  uint64_t v4 = a1;
  while (1)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
        if (v6) {
          break;
        }
        if (++v5 == v2) {
          return 0LL;
        }
      }

      if (*(_BYTE *)(v6 + 32) != 1) {
        break;
      }
      ++v5;
      if (*(void *)(v4 + 296)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v5 == v2;
      }
      if (v7) {
        return 0LL;
      }
    }

    if (*(_BYTE *)(v6 + 33) == 1) {
      goto LABEL_21;
    }
    int v8 = uarpHtons(**(unsigned __int16 **)(v6 + 16));
    if (v8 != 0xFFFF) {
      break;
    }
    a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
    if ((_DWORD)a1) {
      goto LABEL_23;
    }
LABEL_21:
    a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v6);
    uint64_t v9 = 0LL;
    int v2 = *(unsigned __int16 *)(a2 + 112);
    if (!*(_WORD *)(a2 + 112)) {
      return v9;
    }
  }

  if (v8 == 3
    && uarpHtonl(*(_DWORD *)(*(void *)(v6 + 16) + 6LL)) == 9
    && *(unsigned __int16 *)(a2 + 48) <= 2u)
  {
    a1 = UARPLayer2FriendlyNameResponse(v4, a2);
    goto LABEL_21;
  }

LABEL_34:
    uarpTransmitQueuePendingEntryComplete(active, a2, v6);
    uarpTransmitQueueService(v4, a2);
    return 0LL;
  }

  return v9;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v4 = *(void **)(a2 + 120);
    uint64_t v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_15;
      }
    }

    void *v4 = 0LL;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 2_Block_object_dispose(va, 8) = 0;
    uint64_t v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      int v8 = *(void **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7) {
          goto LABEL_15;
        }
      }

      void *v8 = a3;
    }

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = (unsigned __int8 *)(a3 + 3);
    uint64_t v10 = (unsigned __int8 *)(a3 + 5);
    int v25 = a4 & 0xFFF8;
    int v11 = a4 & 0xFFF0;
    while (1)
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 120) + 8 * v8);
      if (!v12) {
        goto LABEL_38;
      }
      int v13 = uarpHtons(*a3);
      int v14 = uarpHtons(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 4 && v14 == 3)
      {
        if (!v11) {
          goto LABEL_38;
        }
        int v19 = *((_DWORD *)a3 + 2);
        int v20 = *(_DWORD *)(*(void *)(v12 + 16) + 6LL);
        goto LABEL_37;
      }

      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[7];
        goto LABEL_26;
      }

      if (v13 == 11 && v14 == 10)
      {
LABEL_63:
        uint64_t v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0LL;
      }

      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[6];
LABEL_26:
        int v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_37;
      }

      if (v13 == 14 && v14 == 8) {
        goto LABEL_63;
      }
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu) {
          goto LABEL_38;
        }
        goto LABEL_36;
      }

      if (v13 == 16 && v14 == 12)
      {
        if (!v25) {
          goto LABEL_38;
        }
LABEL_36:
        int v19 = *(unsigned __int16 *)v9;
        int v20 = *(unsigned __int16 *)(*(void *)(v12 + 16) + 6LL);
LABEL_37:
        if (v19 == v20) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }

      if (v13 == 18 && v14 == 17) {
        break;
      }
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu) {
          goto LABEL_38;
        }
        uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6LL);
        uint64_t v22 = v9;
LABEL_48:
        if (uarp4ccCompare(v22, v21)) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }

      if (v13 == 22 && v14 == 21
        || v13 == 24 && v14 == 23
        || v13 == 26 && v14 == 25
        || v13 == 28 && v14 == 27
        || v13 == 30 && v14 == 29
        || v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1)
      {
        goto LABEL_63;
      }

LABEL_38:
    }

    if (a4 < 0xEu) {
      goto LABEL_38;
    }
    uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6LL);
    uint64_t v22 = v10;
    goto LABEL_48;
  }

  return 0LL;
}

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 104);
  if (v4)
  {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      unint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = *(void ***)(*(void *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(void *)(*(void *)(a2 + 104) + 8 * v6) = 0LL;
          unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
        }

        ++v6;
      }

      while (v6 < v5);
      uint64_t v4 = *(void **)(a2 + 104);
    }

    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 104) = 0LL;
    *(_WORD *)(a2 + 96) = 0;
  }

  uint64_t v8 = *(void **)(a2 + 120);
  if (v8)
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      unint64_t v10 = 0LL;
      do
      {
        int v11 = *(void ***)(*(void *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(void *)(*(void *)(a2 + 120) + 8 * v10) = 0LL;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
        }

        ++v10;
      }

      while (v10 < v9);
      uint64_t v8 = *(void **)(a2 + 120);
    }

    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 120) = 0LL;
    *(_WORD *)(a2 + 112) = 0;
  }

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_WORD *)(a2 + 112)) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpHtons(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(_BYTE *)(*(void *)(*(void *)(a2 + 120) + 8 * v5) + 33LL) != 1)
      {
        break;
      }
    }
  }

  return 1LL;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && *(_WORD *)(a2 + 112))
  {
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpHtons(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          int v7 = uarpHtons(*(unsigned __int16 *)(*(void *)(v6 + 16) + 6LL));
        }
      }

      ++v5;
    }

    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }

void *uarpAvailableTransmitBuffer(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96)) {
    return 0LL;
  }
  for (uint64_t i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    uint64_t v8 = *i;
    if (*i) {
      break;
    }
    if (!--v3) {
      return 0LL;
    }
  }

  *uint64_t i = 0LL;
  if (v8[6] < a3)
  {
    UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);
    return uarpAllocateTransmitBuffer2(a1, a2, a3);
  }

  return v8;
}

void *uarpZalloc(size_t a1)
{
  return calloc(a1, 1uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5 = 1538;
  switch(a1)
  {
    case 0:
      if ((_DWORD)src_size != (_DWORD)__n) {
        return 51LL;
      }
      memcpy(__dst, __src, __n);
      return 0LL;
    case 1:
      goto LABEL_6;
    case 2:
      compression_algorithm v5 = 1794;
      goto LABEL_6;
    case 3:
      compression_algorithm v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer( (uint8_t *)__dst,  __n,  (const uint8_t *)__src,  src_size,  0LL,  v5) == __n) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = 51LL;
      }
      break;
    default:
      uint64_t result = 50LL;
      break;
  }

  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50LL;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3 = result - 1;
  if ((result - 1) > 2)
  {
    int v4 = 0;
    int v5 = 0;
  }

  else
  {
    int v4 = dword_1887F8C84[v3];
    int v5 = 16 * v3 + 32;
  }

  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }

  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }

  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if ((_DWORD)result == 2)
  {
    if (a4 == 48) {
      return CC_SHA384_Final(md, a2);
    }
  }

  else if ((_DWORD)result == 1)
  {
    if (a4 == 32) {
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
    }
  }

  else if ((_DWORD)result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }

  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogError_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

uint64_t uarpLogToken(unsigned int a1)
{
  for (uint64_t i = 0LL; i != 9; ++i)
  {
    int v3 = uarpLoggingCategoryToString(i);
    uarpLogToken_tokens[i] = os_log_create("com.apple.uarp.embedded", v3);
  }

  if (a1 <= 8) {
    return uarpLogToken_tokens[a1];
  }
  else {
    return MEMORY[0x1895F8DA0];
  }
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    uarpLogDebug_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  vsnprintf(uarpLogInfo_logBuffer, 0x200uLL, __format, va);
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = uarpLogInfo_logBuffer;
    _os_log_impl(&dword_1887DD000, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogFault_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpPlatformDarwinLogError( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    uarpPlatformDarwinLogError_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogInfo( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  vsnprintf(uarpPlatformDarwinLogInfo_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = uarpPlatformDarwinLogInfo_logBuffer;
    _os_log_impl(&dword_1887DD000, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }

void uarpPlatformDarwinLogDebug( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    uarpPlatformDarwinLogDebug_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogFault( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    uarpPlatformDarwinLogFault_cold_1(v10);
  }
}

void OUTLINED_FUNCTION_2_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, __int128 *a4, int a5)
{
  uint64_t v9 = (void *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  uint64_t result = 30LL;
  if (a3 >= 2)
  {
    if (v9)
    {
      uarpZero(&v13, 0x2CuLL);
      uint64_t v13 = 0x2C00000002LL;
      __int128 v15 = *a4;
      int v17 = 44;
      int v18 = 40 * a5;
      int v16 = 40 * a5 + 44;
      int v14 = v16;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v9, (uint64_t)&v13, 44LL, 0LL);
      if (!(_DWORD)result)
      {
        if (a5)
        {
          uint64_t v11 = 44LL;
          while (1)
          {
            uarpZero(v12, 0x28uLL);
            v12[0] = 40;
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v9, (uint64_t)v12, 40LL, v11);
            if ((_DWORD)result) {
              break;
            }
            uint64_t v11 = (v11 + 40);
            if (!--a5) {
              return 0LL;
            }
          }
        }

        else
        {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  uint64_t v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v18);
  int v12 = result;
  if (v18[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v18[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  unsigned __int16 v17 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v18, 44LL, 0LL, &v17);
  if (!(_DWORD)result)
  {
    if (v17 == 44)
    {
      uint64_t v14 = (v21 + v20);
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v16, 8LL, v14);
      if (!(_DWORD)result)
      {
        v21 += 8;
        v19 += 8;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  v10,  a5,  (unsigned __int16)a4,  (v20 + v21));
        if (!(_DWORD)result)
        {
          v21 += (unsigned __int16)a4;
          v19 += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v18, 44LL, 0LL);
        }
      }
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, __int128 *a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  uint64_t v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v16);
  int v12 = result;
  if (v16[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v16[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v16, 44LL, 0LL, &v21);
  if (!(_DWORD)result)
  {
    if (v21 != 44) {
      return 11LL;
    }
    uint64_t v14 = (v17 + 40 * a3);
    uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v18, 40LL, v14, &v21);
    if (!(_DWORD)result)
    {
      if (v21 == 40)
      {
        int v19 = uarpPayloadTagPack(a4);
        __int128 v20 = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v18, 40LL, v14);
      }

      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData( uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 30LL;
  }
  int v12 = (void *)v11;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v11, &__dst, 4LL, 0LL, v21);
  int v14 = result;
  if (v21[0] == 4) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v15;
  }
  if (v14 || v21[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v12, v21, 44LL, 0LL, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if (v27 != 44) {
    return 11LL;
  }
  uint64_t v16 = (v23 + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v12, v24, 40LL, v16, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if (v27 != 40) {
    return 11LL;
  }
  int v17 = v25;
  if (!v25)
  {
    int v17 = v22;
    int v25 = v22;
  }

  uint64_t v18 = (v26 + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v20, 8LL, v18);
  if (!(_DWORD)result)
  {
    v26 += 8;
    v22 += 8;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  v12,  a6,  (unsigned __int16)a5,  (v25 + v26));
    if (!(_DWORD)result)
    {
      v26 += (unsigned __int16)a5;
      v22 += (unsigned __int16)a5;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v24, 40LL, v16);
      if (!(_DWORD)result) {
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v21, 44LL, 0LL);
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF) {
      unsigned int v11 = 0xFFFF;
    }
    else {
      unsigned int v11 = a5;
    }
    uint64_t result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if ((_DWORD)result) {
      return result;
    }
  }

  return 0LL;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (HIWORD(a5)) {
    return 39LL;
  }
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  unsigned int v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v17);
  int v12 = result;
  if (v17[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v17[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v17, 44LL, 0LL, &v23);
  if ((_DWORD)result) {
    return result;
  }
  if (v23 != 44) {
    return 11LL;
  }
  uint64_t v14 = (v19 + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v20, 40LL, v14, &v23);
  if ((_DWORD)result) {
    return result;
  }
  if (v23 != 40) {
    return 11LL;
  }
  int v15 = v21;
  if (!v21)
  {
    int v15 = v18;
    int v21 = v18;
  }

  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, a4, (unsigned __int16)a5, (v22 + v15));
  if (!(_DWORD)result)
  {
    v22 += a5;
    v18 += a5;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v20, 40LL, v14);
    if (!(_DWORD)result) {
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v17, 44LL, 0LL);
    }
  }

  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3) {
    return 30LL;
  }
  uint64_t v4 = v3;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v3, &__dst, 4LL, 0LL, &v12);
  if ((_DWORD)result) {
    return result;
  }
  if (v12 != 4) {
    return 11LL;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v4, &v13, 44LL, 0LL, &v16);
  if ((_DWORD)result) {
    return result;
  }
  if (v16 != 44) {
    return 11LL;
  }
  __int128 v6 = v13;
  __int128 v7 = *(_OWORD *)v14;
  *(_OWORD *)(v4 + 2_Block_object_dispose(va, 8) = *(_OWORD *)&v14[12];
  *(_OWORD *)uint64_t v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)&v13, &v13);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)v4, (uint64_t)&v13, 44LL, 0LL);
  if (!(_DWORD)result)
  {
    unsigned int v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      unsigned int v9 = v8 / 0x28;
      uint64_t v10 = *(unsigned int *)(v4 + 36);
      do
      {
        uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v4, v15, 40LL, v10, &v16);
        if ((_DWORD)result) {
          break;
        }
        if (v16 != 40) {
          return 11LL;
        }
        uarpPayloadHeaderEndianSwap(v15, v15);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)v4, (uint64_t)v15, 40LL, v10);
        if ((_DWORD)result) {
          break;
        }
        uint64_t v10 = (v10 + 40);
        --v9;
      }

      while (v9);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, a2, __dst, 44LL, 0LL, &v5);
  if (!(_DWORD)result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap(__dst, __dst);
      uint64_t result = 0LL;
      *a3 = __dst[2];
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryPrepareDynamicAsset(int a1, char *a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a2 + 12) = a3;
  *(void *)(a2 + 20) = a4;
  *((_DWORD *)a2 + 2) = 44;
  *(void *)a2 = 0x2C00000002LL;
  *(_OWORD *)(a2 + 2_Block_object_dispose(va, 8) = xmmword_1887F8CA0;
  *((_DWORD *)a2 + 12) = a5;
  *((_DWORD *)a2 + 112) = 0;
  *((void *)a2 + 79) = 0LL;
  *((void *)a2 + 90) = 0LL;
  *((_OWORD *)a2 + 42) = 0u;
  return 0LL;
}

uint64_t UARPSuperBinaryAddSuperBinaryMetaData( uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5)
{
  size_t v9 = a4;
  UARPLayer2RequestBuffer(a1, &v13, a4 + 24);
  uint64_t v10 = v13;
  unsigned int v11 = (void *)(v13 + 24);
  *(void *)(v13 + _Block_object_dispose(va, 8) = v13 + 24;
  *(_DWORD *)uint64_t v10 = a3;
  *(_DWORD *)(v10 + 4) = a4;
  memcpy(v11, a5, v9);
  *(void *)(v10 + 16) = *(void *)(a2 + 720);
  *(void *)(a2 + 720) = v10;
  *(_DWORD *)(a2 + 8) += a4 + 8;
  *(_DWORD *)(a2 + 32) += a4 + 8;
  *(_WORD *)(a2 + 46) |= 0x80u;
  return 0LL;
}

uint64_t UARPSuperBinaryAddPayload( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8)
{
  return 0LL;
}

uint64_t UARPSuperBinaryAddPayload2( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, char a9)
{
  unsigned __int16 v16 = v21;
  *((void *)v21 + 22) = *(void *)(a2 + 632);
  *(void *)(a2 + 632) = v16;
  uarpZero(v16, 0x28uLL);
  _DWORD *v16 = 40;
  v16[1] = a4;
  *((void *)v16 + 1) = a5;
  *((void *)v16 + 2) = a6;
  v16[9] = a8;
  v16[7] = 0;
  v16[31] = a3;
  if (!a9)
  {
    UARPLayer2RequestBuffer(a1, &v20, a8);
    int v17 = v20;
    *((void *)v16 + 17) = v20;
    memcpy(v17, a7, a8);
  }

  *((_BYTE *)v16 + 14_Block_object_dispose(va, 8) = a9;
  v16[36] = a8;
  *((void *)v16 + 21) = 0LL;
  *(_DWORD *)(a2 + 8) += a8 + 40;
  *(_DWORD *)(a2 + 40) += 40;
  *(_DWORD *)(a2 + 28) += 40;
  ++*(_DWORD *)(a2 + 448);
  return 0LL;
}

uint64_t UARPSuperBinaryAppendPayloadMetaData( uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, const void *a6)
{
  unsigned int v6 = *(_DWORD *)(a2 + 448);
  uint64_t v7 = *(void *)(a2 + 632);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 11LL;
  }
  unsigned int v14 = 1;
  uint64_t result = 11LL;
  while (*(_DWORD *)(v7 + 124) != a3)
  {
    if (v14 < v6)
    {
      uint64_t v7 = *(void *)(v7 + 176);
      ++v14;
      if (v7) {
        continue;
      }
    }

    return result;
  }

  UARPLayer2RequestBuffer(a1, &v18, a5 + 24);
  uint64_t v16 = v18;
  int v17 = (void *)(v18 + 24);
  *(void *)(v18 + _Block_object_dispose(va, 8) = v18 + 24;
  *(_DWORD *)uint64_t v16 = a4;
  *(_DWORD *)(v16 + 4) = a5;
  memcpy(v17, a6, a5);
  uint64_t result = 0LL;
  *(void *)(v16 + 16) = *(void *)(v7 + 168);
  *(void *)(v7 + 16_Block_object_dispose(va, 8) = v16;
  *(_DWORD *)(v7 + 28) += a5 + 8;
  *(_DWORD *)(a2 + 8) += a5 + 8;
  *(_DWORD *)(a2 + 684) += a5 + 8;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryAppendPayloadMetaDataBlob( uint64_t a1, uint64_t a2, int a3, const void *a4, unsigned int a5)
{
  unsigned int v5 = *(_DWORD *)(a2 + 448);
  uint64_t v6 = *(void *)(a2 + 632);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 11LL;
  }
  unsigned int v12 = 1;
  uint64_t result = 11LL;
  while (*(_DWORD *)(v6 + 124) != a3)
  {
    if (v12 < v5)
    {
      uint64_t v6 = *(void *)(v6 + 176);
      ++v12;
      if (v6) {
        continue;
      }
    }

    return result;
  }

  if (*(void *)(v6 + 152)) {
    return 27LL;
  }
  UARPLayer2ReturnBuffer(a1, 0LL);
  *(void *)(v6 + 152) = 0LL;
  *(_DWORD *)(v6 + 160) = 0;
  UARPLayer2RequestBuffer(a1, 0LL, a5);
  memcpy(*(void **)(v6 + 152), a4, a5);
  uint64_t result = 0LL;
  *(_DWORD *)(v6 + 160) = a5;
  *(_DWORD *)(v6 + 28) += a5;
  *(_DWORD *)(a2 + 8) += a5;
  *(_DWORD *)(a2 + 684) += a5;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryBuildMetaData( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t **a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  size_t v9 = *a4;
  if (a3)
  {
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = uarpHtonl(*(_DWORD *)v11);
      uint64_t v13 = uarpHtonl(*(_DWORD *)(v11 + 4));
      v8 += *(_DWORD *)(v11 + 4) + 8;
      if (v8 > a5) {
        return 11LL;
      }
      *size_t v9 = v12 | (unint64_t)(v13 << 32);
      unsigned int v14 = (char *)(v9 + 1);
      memcpy(v14, *(const void **)(v11 + 8), *(unsigned int *)(v11 + 4));
      size_t v9 = (unint64_t *)&v14[*(unsigned int *)(v11 + 4)];
      uint64_t v11 = *(void *)(v11 + 16);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    uint64_t result = 0LL;
    *a6 = v8;
    *a4 = v9;
  }

  return result;
}

uint64_t UARPSuperBinaryFinalizeDynamicAsset(uint64_t a1, uint64_t a2)
{
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)a2, a2, 44LL, 0LL);
  if (!(_DWORD)result)
  {
    uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    unsigned int v6 = *(_DWORD *)(a2 + 32);
    BOOL v7 = (uint64_t *)(a2 + 632);
    unsigned int v8 = *(_DWORD *)(a2 + 448);
    if (v8)
    {
      unsigned int v9 = 0;
      unsigned int v10 = *(_DWORD *)(a2 + 40) + v5 + v6;
      unsigned int v11 = v10 + *(_DWORD *)(a2 + 684);
      unsigned int v12 = (unsigned int **)(a2 + 632);
      while (1)
      {
        uint64_t v13 = *v12;
        v13[6] = v10;
        v13[8] = v11;
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)a2, (uint64_t)v13, 40LL, v5);
        if ((_DWORD)result) {
          break;
        }
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t v5 = *v13 + v5;
        v10 += v13[7];
        v11 += v13[9];
        unsigned int v12 = (unsigned int **)(v13 + 44);
        ++v9;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
        if (v9 >= v8)
        {
          unsigned int v6 = *(_DWORD *)(a2 + 32);
          goto LABEL_8;
        }
      }
    }

    else
    {
LABEL_8:
      if (v6)
      {
        unsigned int __dst = 0LL;
        unsigned int v28 = 0;
        uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v6);
        if ((_DWORD)result) {
          return result;
        }
        unsigned __int16 v27 = (unint64_t *)__dst;
        uint64_t result = UARPSuperBinaryBuildMetaData(result, v14, *(void *)(a2 + 720), &v27, *(_DWORD *)(a2 + 32), &v28);
        if ((_DWORD)result) {
          return result;
        }
        int v15 = __dst;
        *(void *)(a2 + 672) = __dst;
        unsigned int v16 = v28;
        *(_DWORD *)(a2 + 680) = v28;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  (uint64_t)v15,  (unsigned __int16)v16,  v5);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v5 = v16 + v5;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
      }

      if (!v8) {
        return 0LL;
      }
      unsigned int v17 = 0;
      uint64_t v18 = a2 + 632;
      do
      {
        uint64_t v19 = *(void *)v18;
        unsigned int v20 = *(_DWORD *)(*(void *)v18 + 28LL);
        if (v20)
        {
          unsigned int __dst = 0LL;
          unsigned int v28 = 0;
          uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v20);
          if ((_DWORD)result) {
            return result;
          }
          int v21 = __dst;
          unsigned __int16 v27 = (unint64_t *)__dst;
          int v22 = *(const void **)(v19 + 152);
          if (v22)
          {
            int v21 = memcpy(__dst, v22, *(unsigned int *)(v19 + 160));
            unsigned int v28 = *(_DWORD *)(v19 + 160);
          }

          uint64_t result = UARPSuperBinaryBuildMetaData( (uint64_t)v21,  (uint64_t)v22,  *(void *)(v19 + 168),  &v27,  *(_DWORD *)(v19 + 28),  &v28);
          if ((_DWORD)result) {
            return result;
          }
          unsigned __int16 v23 = __dst;
          *(void *)(v19 + 152) = __dst;
          unsigned int v24 = v28;
          *(_DWORD *)(v19 + 160) = v28;
          uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  (uint64_t)v23,  (unsigned __int16)v24,  v5);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v5 = v24 + v5;
          unsigned int v8 = *(_DWORD *)(a2 + 448);
        }

        uint64_t v18 = v19 + 176;
        ++v17;
      }

      while (v17 < v8);
      if (v8)
      {
        for (unsigned int i = 0; i < v8; ++i)
        {
          uint64_t v26 = *v7;
          if (!*(_BYTE *)(v26 + 148))
          {
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  *(void *)(v26 + 136),  *(unsigned __int16 *)(v26 + 144),  v5);
            if ((_DWORD)result) {
              return result;
            }
            unsigned int v8 = *(_DWORD *)(a2 + 448);
          }

          uint64_t result = 0LL;
          uint64_t v5 = (*(_DWORD *)(v26 + 144) + v5);
          BOOL v7 = (uint64_t *)(v26 + 176);
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData( int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((v8 = *(_DWORD *)(a2 + 28), unsigned int v9 = v7 + v8, v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    unsigned __int16 v15 = v7 - v11;
    if (a4 >= v15) {
      unsigned __int16 v13 = v15;
    }
    else {
      unsigned __int16 v13 = a4;
    }
    memcpy(__dst, (const void *)(*(void *)(a2 + 672) + v11), v13);
    uint64_t result = 0LL;
  }

  else
  {
    unsigned __int16 v13 = 0;
    uint64_t result = 40LL;
  }

  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData( int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7 = *(void *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    unsigned __int16 v14 = 0;
    uint64_t result = 40LL;
    goto LABEL_14;
  }

  while (1)
  {
    int v8 = *(_DWORD *)(v7 + 28);
    if (v8) {
      break;
    }
LABEL_8:
    if (!v7) {
      goto LABEL_9;
    }
  }

  unsigned int v9 = *(_DWORD *)(v7 + 24);
  unsigned int v10 = v8 + v9;
  BOOL v11 = a5 >= v9;
  uint64_t v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    uint64_t v7 = *(void *)(v7 + 176);
    goto LABEL_8;
  }

  unsigned __int16 v16 = v8 - v12;
  if (a4 >= v16) {
    unsigned __int16 v14 = v16;
  }
  else {
    unsigned __int16 v14 = a4;
  }
  memcpy(__dst, (const void *)(*(void *)(v7 + 152) + v12), v14);
  uint64_t result = 0LL;
LABEL_14:
  *a6 = v14;
  return result;
}

uint64_t uarpPlatformEndpointInit2( char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0LL);
}

uint64_t uarpPlatformEndpointInit( char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 30LL;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((void *)a1 + 6_Block_object_dispose(va, 8) = a2;
    *((void *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((void *)a1 + 74) = a7;
    __int128 v16 = *a4;
    __int128 v15 = a4[1];
    *((_DWORD *)a1 + _Block_object_dispose(va, 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6)) {
      *((_WORD *)a1 + 6) = 4;
    }
    uint64_t result = 0LL;
    *((_DWORD *)a1 + 13_Block_object_dispose(va, 8) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(void *)(a2 + 40) = a4;
        __int128 v7 = *(_OWORD *)a1;
        __int128 v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (__int128 v10 = *a3,
              __int128 v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (unsigned int v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12)) {
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          }
          *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = 0;
          int v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(_BYTE *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 5_Block_object_dispose(va, 8) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (uint64_t result = UARPLayer2RequestBuffer( a1,  (void *)(a2 + 80),  4 * *(unsigned __int16 *)(a2 + 28)),  !(_DWORD)result))
          {
            uint64_t result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!(_DWORD)result)
            {
              int v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                int v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }

              *(_WORD *)(a2 + 96) = v13;
              uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 104), 8 * v13);
              if (!(_DWORD)result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  unint64_t v14 = 0LL;
                  do
                    *(void *)(*(void *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }

                int v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 120), 8 * v15);
                if (!(_DWORD)result)
                {
                  uint64_t result = uarpPlatformEndpointSendSyncMsg(a1, a2);
                  if (!(_DWORD)result)
                  {
                    if (*(_DWORD *)(a1 + 552) != 2) {
                      return 0LL;
                    }
                    uint64_t result = uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
                    if (!(_DWORD)result) {
                      return 0LL;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 560);
        if (*(void *)(v8 + v6) == a2) {
          *(void *)(v8 + v6) = 0LL;
        }
        v6 += 8LL;
      }

      while (v7 != v6);
    }

    uarpPlatformEndpointStreamingRecvDeinit(a1, a2);
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    uint64_t result = 0LL;
    *(void *)(a2 + 80) = 0LL;
  }

  return result;
}

uint64_t uarpPlatformEndpointRequestInfoProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3 - 10 >= 0xFFFFFFF7) {
    return uarpSendInformationRequest(a1, a2, a3);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(void *a1, uint64_t a2, _BYTE *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!(_DWORD)ActiveFirmwareVersion)
          {
            int v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if ((_DWORD)ActiveFirmwareVersion) {
                return ActiveFirmwareVersion;
              }
              int v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1) {
                return ActiveFirmwareVersion;
              }
              *a3 = 0;
              BOOL v11 = v10 == 0;
              __int16 v12 = 1280;
              __int16 v13 = 768;
            }

            else
            {
              uint64_t ActiveFirmwareVersion = 0LL;
              *a3 = 0;
              BOOL v11 = v9 == 0;
              __int16 v12 = 1536;
              __int16 v13 = 1024;
            }

            if (v11) {
              __int16 v12 = v13;
            }
            *a4 = v12;
          }
        }
      }
    }
  }

  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0LL, 0, 0LL, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0LL, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    uint64_t v15 = *(void *)(a1 + 568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        uint64_t v16 = *(void *)(v16 + 712);
        if (!v16) {
          goto LABEL_15;
        }
      }
    }

    else
    {
LABEL_15:
      *(void *)(a3 + 712) = v15;
      *(void *)(a1 + 56_Block_object_dispose(va, 8) = a3;
    }

    if (a4) {
      *(void *)(a3 + 704) = a4;
    }
    *(_WORD *)(a3 + 72) = 0;
    if (!a5) {
      return 30LL;
    }
    __int128 v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    __int128 v18 = a5[2];
    __int128 v19 = a5[3];
    __int128 v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 12_Block_object_dispose(va, 8) = v19;
    __int128 v21 = a5[6];
    __int128 v22 = a5[7];
    __int128 v23 = a5[9];
    *(_OWORD *)(a3 + 20_Block_object_dispose(va, 8) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    __int128 v24 = a5[10];
    __int128 v25 = a5[11];
    __int128 v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 28_Block_object_dispose(va, 8) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(_BYTE *)(a3 + 652)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      }
      *(void *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 64_Block_object_dispose(va, 8) = a7;
      *(_BYTE *)(a3 + 652) = 1;
    }

    else if (!*(void *)(a3 + 640))
    {
      uint64_t v29 = (void *)(a3 + 640);
      *(_BYTE *)(a3 + 652) = 0;
      unsigned int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 64_Block_object_dispose(va, 8) = v30;
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a3 + 640), v30);
      if ((_DWORD)result) {
        return result;
      }
      if (!*v29) {
        return 11LL;
      }
    }

    if (a8)
    {
      if (!*(_BYTE *)(a3 + 668)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      }
      *(void *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      char v27 = 1;
    }

    else
    {
      char v27 = 0;
    }

    *(_BYTE *)(a3 + 66_Block_object_dispose(va, 8) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }

    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      int v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0LL;
      }

      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508)) {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
          uint64_t result = uarpPlatformAssetPayloadPullData(a1, a3);
          if (!(_DWORD)result) {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
        }

        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }

      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }

    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }

  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __int128 v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      __int128 v4 = *(_OWORD *)(a3 + 32);
      __int128 v5 = *(_OWORD *)(a3 + 48);
      __int128 v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 12_Block_object_dispose(va, 8) = v5;
      __int128 v7 = *(_OWORD *)(a3 + 96);
      __int128 v8 = *(_OWORD *)(a3 + 112);
      __int128 v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 20_Block_object_dispose(va, 8) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      __n128 result = *(__n128 *)(a3 + 160);
      __int128 v11 = *(_OWORD *)(a3 + 176);
      __int128 v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 28_Block_object_dispose(va, 8) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6 = 30LL;
  if (a1 && a2 && a3)
  {
    if (a5) {
      *(void *)(a3 + 704) = a5;
    }
    if (a6)
    {
      __int128 v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      __int128 v9 = a6[2];
      __int128 v10 = a6[3];
      __int128 v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 12_Block_object_dispose(va, 8) = v10;
      __int128 v12 = a6[6];
      __int128 v13 = a6[7];
      __int128 v14 = a6[9];
      *(_OWORD *)(a3 + 20_Block_object_dispose(va, 8) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      __int128 v15 = a6[10];
      __int128 v16 = a6[11];
      __int128 v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 28_Block_object_dispose(va, 8) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      uint64_t v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!(_DWORD)v6) {
        *(_BYTE *)(a3 + 72) = 1;
      }
    }

    else
    {
      return 30LL;
    }
  }

  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, *(void *)(a3 + 704));
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0LL, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, a3);
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0LL, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    if (v4)
    {
      uint64_t result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(void *)(result + 704) != a2)
      {
        uint64_t result = *(void *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 704) == a2) {
              return v4;
            }
            uint64_t v4 = *(void *)(v4 + 712);
          }

          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *a2;
    }
  }

  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __n128 result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(void *a1, uint64_t a2, int a3)
{
  return uarpPlatformEndpointAssetSetPayloadIndex2(a1, a2, a3);
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(void *a1, uint64_t a2, int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) <= a3)
    {
      return 44LL;
    }

    else
    {
      *(_DWORD *)(a2 + 456) = a3;
      uint64_t v6 = (_OWORD *)(a2 + 464);
      *(void *)(a2 + 50_Block_object_dispose(va, 8) = 0LL;
      if (*(_BYTE *)(a2 + 460) == 1)
      {
        __int128 v7 = *(__int128 **)(a2 + 632);
        if (v7)
        {
          while (1)
          {
            int v8 = *((_DWORD *)v7 + 31);
            if (v8 == *(_DWORD *)(a2 + 456))
            {
              *(_DWORD *)(a2 + 452) = v8;
              __int128 v9 = *v7;
              __int128 v10 = v7[2];
              *(_OWORD *)(a2 + 480) = v7[1];
              *(_OWORD *)(a2 + 496) = v10;
              _OWORD *v6 = v9;
              __int128 v11 = v7[3];
              __int128 v12 = v7[4];
              __int128 v13 = v7[6];
              *(_OWORD *)(a2 + 544) = v7[5];
              *(_OWORD *)(a2 + 560) = v13;
              *(_OWORD *)(a2 + 512) = v11;
              *(_OWORD *)(a2 + 52_Block_object_dispose(va, 8) = v12;
              __int128 v14 = v7[7];
              __int128 v15 = v7[8];
              __int128 v16 = v7[9];
              *(void *)(a2 + 624) = *((void *)v7 + 20);
              *(_OWORD *)(a2 + 592) = v15;
              *(_OWORD *)(a2 + 60_Block_object_dispose(va, 8) = v16;
              *(_OWORD *)(a2 + 576) = v14;
              for (uint64_t i = *((void *)v7 + 21); i; uint64_t i = *(void *)(i + 16))
                uarpProcessPayloadTLVInternal( a1,  a2,  a2 + 464,  *(_DWORD *)i,  *(unsigned int *)(i + 4),  *(_DWORD **)(i + 8));
              uint64_t v18 = *((unsigned int *)v7 + 19);
              if ((_DWORD)v18)
              {
                UARPLayer2HashFinal( (uint64_t)a1,  v18,  *((void *)v7 + 10),  *((void *)v7 + 12),  *((unsigned int *)v7 + 26));
              }
            }

            __int128 v7 = (__int128 *)*((void *)v7 + 22);
            if (!v7) {
              return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
            }
          }

          return 54LL;
        }

        else
        {
          return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
        }
      }

      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader((uint64_t)a1, a2);
      }
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30LL;
  if (a1 && a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 500);
    if (v3) {
      v3 -= *(_DWORD *)(a2 + 508);
    }
    if (v3 >= *(_DWORD *)(a2 + 648)) {
      unsigned int v3 = *(_DWORD *)(a2 + 648);
    }
    if (v3) {
      return uarpPlatformAssetPayloadPullData(a1, a2);
    }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
    return 0LL;
  }

  return v2;
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 460) = 1;
  if (*(_DWORD *)(a2 + 32)) {
    return uarpPlatformAssetPullAllMetaData(a1, a2);
  }
  UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
  return 0LL;
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 30LL;
  }
  if (*(_DWORD *)(a2 + 452) == -1) {
    return 44LL;
  }
  if (*(_DWORD *)(a2 + 500) <= a3) {
    return 43LL;
  }
  if (*(_BYTE *)(a2 + 392) == 1) {
    return 16LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a2 + 50_Block_object_dispose(va, 8) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a2 + 73) = 1;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30LL;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(_BYTE *)(a2 + 73)) {
    return v2;
  }
  *(_BYTE *)(a2 + 73) = 0;
  uint64_t v2 = *(void *)(a2 + 696);
  if (!v2) {
    return v2;
  }
  if (*(_BYTE *)(a2 + 392) == 1) {
    return 0LL;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetProcessingComplete(a1, *(void *)(a2 + 696), a2, 1u);
  }
  else {
    return 30LL;
  }
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, __int128 *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __int128 v3 = *a2;
      __int128 v4 = a2[1];
      *(_OWORD *)(a3 + 2_Block_object_dispose(va, 8) = *(__int128 *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((_BYTE *)a2 + 72) = 1;
      *(_BYTE *)(a3 + 72) = 0;
      *(_BYTE *)(a3 + 73) = *((_BYTE *)a2 + 73);
      *((_BYTE *)a2 + 392) = 0;
      __int128 v6 = *(__int128 *)((char *)a2 + 360);
      __int128 v5 = *(__int128 *)((char *)a2 + 376);
      __int128 v7 = *(__int128 *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 32_Block_object_dispose(va, 8) = *(__int128 *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(__int128 *)((char *)a2 + 312);
      __int128 v8 = *(__int128 *)((char *)a2 + 392);
      __int128 v9 = *(__int128 *)((char *)a2 + 408);
      __int128 v10 = *(__int128 *)((char *)a2 + 424);
      *(void *)(a3 + 440) = *((void *)a2 + 55);
      *(_OWORD *)(a3 + 40_Block_object_dispose(va, 8) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      __int128 v11 = a2[29];
      __int128 v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      __int128 v13 = a2[32];
      __int128 v14 = a2[33];
      __int128 v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 52_Block_object_dispose(va, 8) = v14;
      __int128 v16 = a2[36];
      __int128 v17 = a2[37];
      __int128 v18 = a2[38];
      *(void *)(a3 + 624) = *((void *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 60_Block_object_dispose(va, 8) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((void *)a2 + 7_Block_object_dispose(va, 8) = 0LL;
      double result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(void *)(a3 + 640) = *((void *)a2 + 80);
      *((void *)a2 + 80) = 0LL;
      *(_BYTE *)(a3 + 652) = *((_BYTE *)a2 + 652);
      *(_DWORD *)(a3 + 64_Block_object_dispose(va, 8) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(void *)(a3 + 656) = *((void *)a2 + 82);
      *((void *)a2 + 82) = 0LL;
      *(_BYTE *)(a3 + 66_Block_object_dispose(va, 8) = *((_BYTE *)a2 + 668);
      *(_DWORD *)(a3 + 664) = *((_DWORD *)a2 + 166);
      *((_DWORD *)a2 + 166) = 0;
      *(_DWORD *)(a3 + 68_Block_object_dispose(va, 8) = *((_DWORD *)a2 + 172);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(_BYTE *)(a1 + 580)) {
    return uarpTransmitQueueService(a1, a2);
  }
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0LL, 0);
  }
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
  }
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(void *)(v6 + 704) != a3)
          {
            uint64_t v6 = *(void *)(v6 + 712);
            if (!v6) {
              return 30LL;
            }
          }

          unsigned __int16 v7 = 0;
          uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44LL, 0LL, &v7);
          if (!(_DWORD)result)
          {
            uarpSuperBinaryHeaderEndianSwap(__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 6_Block_object_dispose(va, 8) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 44_Block_object_dispose(va, 8) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            uint64_t result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!(_DWORD)result) {
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (uint64_t result = *(void *)(result + 568); result; uint64_t result = *(void *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 704) == a2) {
        break;
      }
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset( uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result = 30LL;
  if (a1 && a3 && __dst && (_DWORD)a5)
  {
    __int16 v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      uint64_t result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if ((_DWORD)result != 40) {
        return result;
      }
      __int16 v15 = *(_WORD *)(a3 + 46);
    }

    if ((v15 & 8) == 0) {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
    uint64_t result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7);
    if ((_DWORD)result == 40) {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30LL;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a3 = *(void *)(a2 + 640);
      *(void *)(a2 + 640) = 0LL;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 64_Block_object_dispose(va, 8) = 0;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30LL;
  if (a3 && a4)
  {
    __int128 v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(_BYTE *)(a2 + 652)) {
        UARPLayer2ReturnBuffer(a1, v9);
      }
    }

    uint64_t result = 0LL;
    *(void *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 64_Block_object_dispose(va, 8) = a4;
    *(_BYTE *)(a2 + 652) = 1;
  }

  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3) {
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && (_DWORD)a5) {
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(a2 + 50) = 0;
    if (!*(_BYTE *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30LL;
  }
  if (!a2) {
    return 30LL;
  }
  if (!a3) {
    return 30LL;
  }
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 30LL;
  }
  while (*(_DWORD *)(v3 + 304) != 1 || *(void *)(v3 + 704) != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 30LL;
    }
  }

  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    __int128 v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5) {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationPause(a1, a2);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationResume(a1, a2);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (!a1) {
    return 30LL;
  }
  if (!a2) {
    return 30LL;
  }
  if (!a4) {
    return 30LL;
  }
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return 30LL;
  }
  while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 704) != a4)
  {
    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return 30LL;
    }
  }

  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific( uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5) {
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformDownstreamEndpointAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30LL;
  }
  unsigned __int16 v6 = *(_WORD *)(a1 + 600);
  while (v6)
  {
    uint64_t v7 = UARPPlatformDownstreamEndpointByID(a1, a2, v6);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 600);
    unsigned __int16 v6 = v8 + 1;
    *(_WORD *)(a1 + 600) = v8 + 1;
    if (v7 && v8) {
      return uarpPlatformDownstreamEndpointAddWithID(a1, a2, a3, v8);
    }
  }

  *(_WORD *)(a1 + 600) = 1;
  return 11LL;
}

uint64_t uarpPlatformDownstreamEndpointAddWithID(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a1) {
    return 30LL;
  }
  uint64_t v8 = uarpPlatformRemoteEndpointAlloc(a1);
  if (!v8) {
    return 11LL;
  }
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 176) = a2;
  *(_WORD *)(v8 + 136) = a4;
  return uarpSendDownstreamEndpointReachable(a1, a2, a4);
}

uint64_t uarpPlatformDownstreamEndpointRemove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (v5) {
    return uarpSendDownstreamEndpointUnreachable(a1, a2, *(unsigned __int16 *)(v5 + 136));
  }
  else {
    return 58LL;
  }
}

uint64_t uarpPlatformDownstreamEndpointSendMessage( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  uint64_t v9 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (v9) {
    return uarpPlatformDownstreamEndpointSendMessageInternal(a1, a2, v9, a4, a5);
  }
  else {
    return 58LL;
  }
}

uint64_t uarpPlatformNoFirmwareUpdateAvailable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Du, 6u, 1);
  if (v4) {
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  }
  else {
    return 11LL;
  }
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 696)) != 0) {
    return *(unsigned int *)(v1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 696);
    if (v1) {
      return *(void *)(v1 + 40);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

__n128 uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  if (a1 && a2 && *(_DWORD *)(a1 + 452) != -1 && *(_BYTE *)(a1 + 460) != 1)
  {
    uarpZero(a2, 0x20uLL);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
    __n128 result = *(__n128 *)(a1 + 472);
    *(__n128 *)(a2 + 4) = result;
    int v5 = *(_DWORD *)(a1 + 500);
    *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
    *((_DWORD *)a2 + 6) = v5;
  }

  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460)) {
      return *(void *)(a2 + 720);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460) && (uint64_t v5 = *(void *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        uint64_t v5 = *(void *)(v5 + 176);
        if (!v5) {
          return 0LL;
        }
      }

      return *(void *)(v5 + 168);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(_BYTE *)(a2 + 460))
      {
        uint64_t v6 = *(void *)(a2 + 632);
        if (!v6) {
          return 54LL;
        }
        while (*(_DWORD *)(v6 + 124) != a3)
        {
          uint64_t v6 = *(void *)(v6 + 176);
          if (!v6) {
            return 54LL;
          }
        }

        *(_DWORD *)a4 = *(_DWORD *)(v6 + 4);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(v6 + 8);
        int v9 = *(_DWORD *)(v6 + 36);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(v6 + 28);
        *(_DWORD *)(a4 + 24) = v9;
        uint64_t v8 = (_DWORD *)(v6 + 128);
        goto LABEL_14;
      }

      if (*(_DWORD *)(a2 + 452) == a3)
      {
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        int v7 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v7;
        uint64_t v8 = (_DWORD *)(a2 + 592);
LABEL_14:
        uint64_t result = 0LL;
        *(_DWORD *)(a4 + 2_Block_object_dispose(va, 8) = *v8;
        return result;
      }

      return 44LL;
    }

    else
    {
      return 26LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }

  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }

  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = a3;
    }
  }

  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }

  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }

  return result;
}

void uarpFilepathForRemotePath_cold_1()
{
}

void uarpFilepathForRemotePath_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1887DD000, MEMORY[0x1895F8DA0], v0, "%s: Invalid firmware file %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void mobileAssetCacheFileURLForRemoteURL_cold_1()
{
}

void mobileAssetCacheFileURLForRemoteURL_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1887DD000, MEMORY[0x1895F8DA0], v0, "%s: Invalid firmware file %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void latestMobileAssetCacheFileURL_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Checking mobileasset cache file %@",  buf,  0xCu);
}

void getSuperBinaryVersionForAsset_cold_1(uint64_t a1, uint64_t *a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_0( &dword_1887DD000,  a3,  (uint64_t)a3,  "Failed to open file %{public}@ with error %{public}@",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void getSuperBinaryVersionForAsset_cold_2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = a2;
  _os_log_error_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_ERROR,  "SuperBinary file %{public}@ has invalid length %{public}u",  (uint8_t *)&v3,  0x12u);
  OUTLINED_FUNCTION_2();
}

void UARPArrayOfExpiredFiles_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl( &dword_1887DD000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Checking age of temp file %@",  buf,  0xCu);
}

void uarpLogError_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpLogDebug_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpLogFault_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogError_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogDebug_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogFault_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  uint64_t v2 = &uarpPlatformDarwinLogFault_logBuffer;
  _os_log_fault_impl(&dword_1887DD000, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1895F8168]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x1895F8170]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x1895F8178]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1895F8190]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x18960B290](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x18960B2E8](allocator, data);
}

Boolean SecKeyVerifySignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x18960B510](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleAccessoryUpdateSigning()
{
  return MEMORY[0x18960B540]();
}

uint64_t SecPolicyCreateAppleCHIPUpdateSigning()
{
  return MEMORY[0x18960B550]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x18960B6B8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x18960B6E0](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x18960B6E8](trust, ix);
}

uint64_t UARPAccessoryHardwareFusingToString()
{
  return MEMORY[0x18960E7B8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

uint64_t uarpVersionCompareStrings()
{
  return MEMORY[0x18960E7D8]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

uint64_t objc_msgSend_assetAvailabilityUpdateForAccessory_assetID_downstreamAppleModelNumber_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_assetAvailabilityUpdateForAccessory_assetID_downstreamAppleModelNumber_);
}

uint64_t objc_msgSend_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath_);
}

uint64_t objc_msgSend_handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier_inContainer_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier_inContainer_);
}

uint64_t objc_msgSend_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer_);
}

uint64_t objc_msgSend_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier_);
}

uint64_t objc_msgSend_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete_);
}

uint64_t objc_msgSend_handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest_);
}

uint64_t objc_msgSend_handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier_);
}

uint64_t objc_msgSend_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error_);
}

uint64_t objc_msgSend_remoteFetchCompletionForSupportedAccessories_productGroup_isComplete_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_remoteFetchCompletionForSupportedAccessories_productGroup_isComplete_error_);
}