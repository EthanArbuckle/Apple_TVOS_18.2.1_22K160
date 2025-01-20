@interface SAAttributionTag
+ (id)getBundleIdForTag:(unint64_t)a3 onVolumeName:(char *)a4;
+ (void)enableAttributionTagging:(BOOL)a3;
+ (void)processAttributionTagsForVol:(id)a3 withBlock:(id)a4;
@end

@implementation SAAttributionTag

+ (void)enableAttributionTagging:(BOOL)a3
{
  if (a3)
  {
    int v23 = 1;
    uint64_t v3 = fsctl((const char *)[@"/private/var" fileSystemRepresentation], 0xC0044A75uLL, &v23, 1u);
    if ((_DWORD)v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = SALog(v3);
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100033038(v4, v6, v7, v8, v9, v10, v11, v12);
      }
    }

    int v23 = 1;
    uint64_t v13 = fsctl( (const char *)[@"/private/var/mobile" fileSystemRepresentation],  0xC0044A75uLL,  &v23,  1u);
    if ((_DWORD)v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = SALog(v13);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100032FD4(v14, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }

+ (id)getBundleIdForTag:(unint64_t)a3 onVolumeName:(char *)a4
{
  __int128 v11 = 0u;
  __int128 v10 = 0u;
  unint64_t v9 = a3;
  uint64_t v5 = fsctl(a4, 0xC1284A72uLL, &v9, 1u);
  if (!(_DWORD)v5) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v12));
  }
  uint64_t v6 = SALog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10003309C(a3, v7);
  }

  return 0LL;
}

+ (void)processAttributionTagsForVol:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = SALog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000331E0((uint64_t)v5, v8);
  }

  unint64_t v9 = (char *)malloc(0x169540uLL);
  if (v9)
  {
    __int128 v10 = v9;
    __int128 v11 = (const char *)[v5 cStringUsingEncoding:1];
    uint64_t v35 = 0LL;
    uint64_t v36 = 0LL;
    while (1)
    {
      LODWORD(v36) = 5000;
      v37 = v10;
      uint64_t v12 = fsctl(v11, 0xC0184A76uLL, &v35, 1u);
      if ((_DWORD)v12) {
        break;
      }
      unint64_t v13 = v36;
      if ((_DWORD)v36)
      {
        unint64_t v14 = 0LL;
        uint64_t v15 = v10 + 40;
        do
        {
          if (*v15 && *((void *)v15 - 2))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
            (*((void (**)(id, void *, void, void, void, void))v6 + 2))( v6,  v16,  *((void *)v15 - 2),  *((void *)v15 - 1),  *((void *)v15 - 3),  *((void *)v15 - 5));

            unint64_t v13 = v36;
          }

          ++v14;
          v15 += 296;
        }

        while (v14 < v13);
      }

      if ((v36 & 0x100000000LL) != 0) {
        goto LABEL_20;
      }
    }

    uint64_t v26 = v12;
    uint64_t v27 = SALog(v12);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10003317C(v26, v28, v29, v30, v31, v32, v33, v34);
    }

LABEL_20:
    free(v10);
  }

  else
  {
    uint64_t v17 = SALog(0LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100033110(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

@end