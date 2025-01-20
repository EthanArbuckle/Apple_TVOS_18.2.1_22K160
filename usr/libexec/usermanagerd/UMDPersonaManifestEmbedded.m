@interface UMDPersonaManifestEmbedded
+ (id)manifest;
+ (id)manifestFromData:(id)a3;
+ (unsigned)currentVersion;
- (id)dataValue;
@end

@implementation UMDPersonaManifestEmbedded

+ (unsigned)currentVersion
{
  return 1;
}

+ (id)manifest
{
  id v3 = objc_alloc_init((Class)a1);
  objc_msgSend(v3, "setVersion:", objc_msgSend(a1, "currentVersion"));
  return v3;
}

+ (id)manifestFromData:(id)a3
{
  id v4 = a3;
  id v5 = sub_10008573C((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v6)
  {
    if (qword_1000DBB48 != -1) {
      dispatch_once(&qword_1000DBB48, &stru_1000CD690);
    }
    v8 = (os_log_s *)(id)qword_1000DBB40;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = 0LL;
      unsigned int v13 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        LOWORD(v27[0]) = 0;
        v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v26,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "Failed to parse persona manifest: manifest data is invalid",  v27,  2);
        v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        v16 = 0LL;
      }

      free(v16);
    }

    goto LABEL_41;
  }

  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UsePersonaManifestVersion"]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      if (qword_1000DBB48 != -1) {
        dispatch_once(&qword_1000DBB48, &stru_1000CD690);
      }
      v17 = (os_log_s *)(id)qword_1000DBB40;
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      uint64_t v26 = 0LL;
      unsigned int v18 = sub_100053B4C(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v18 & 0xFFFFFFFE;
      }
      if ((_DWORD)v19)
      {
        LOWORD(v27[0]) = 0;
        v20 = (void *)_os_log_send_and_compose_impl( v19,  &v26,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "Failed to parse persona manifest: manifest version is invalid",  v27,  2);
        if (!v20) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }

- (id)dataValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:&off_1000D1198 forKeyedSubscript:@"UsePersonaManifestVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UMDPersonaManifest generation](self, "generation")));
  [v3 setObject:v4 forKeyedSubscript:@"UsePersonaGenerationID"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UMDPersonaManifest users](self, "users"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMDPersonaManifest dictForUserSet:](&OBJC_CLASS___UMDPersonaManifest, "dictForUserSet:", v5));

  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"UserPersonaDictionary"];
    id v7 = sub_100085444((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    if (qword_1000DBB48 != -1) {
      dispatch_once(&qword_1000DBB48, &stru_1000CD690);
    }
    uint64_t v9 = (os_log_s *)(id)qword_1000DBB40;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = 0LL;
      unsigned int v10 = sub_100053B4C(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = v10 & 0xFFFFFFFE;
      }
      if ((_DWORD)v11)
      {
        __int16 v15 = 0;
        uint64_t v12 = (const char *)_os_log_send_and_compose_impl( v11,  &v16,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "Failed to generate data for persona manifest: failed to build user dict",  &v15,  2);
        unsigned int v13 = (char *)v12;
        if (v12) {
          sub_100053B7C(v12);
        }
      }

      else
      {
        unsigned int v13 = 0LL;
      }

      free(v13);
    }

    v8 = 0LL;
  }

  return v8;
}

@end