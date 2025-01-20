@interface UMDPersonaManifest
+ (Class)platformClass;
+ (id)dataForPersonaSet:(id)a3;
+ (id)dictForUserSet:(id)a3;
+ (id)manifest;
+ (id)manifestFromData:(id)a3;
+ (id)personaSetFromData:(id)a3;
+ (id)userSetFromDict:(id)a3;
+ (unsigned)currentVersion;
- (NSData)dataValue;
- (NSSet)users;
- (UMDPersonaManifest)init;
- (unint64_t)generation;
- (unsigned)version;
- (void)setGeneration:(unint64_t)a3;
- (void)setUsers:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation UMDPersonaManifest

+ (Class)platformClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UMDPersonaManifestEmbedded);
}

+ (unsigned)currentVersion
{
  return objc_msgSend(objc_msgSend(a1, "platformClass"), "currentVersion");
}

+ (id)manifest
{
  return objc_msgSend(objc_msgSend(a1, "platformClass"), "manifest");
}

+ (id)manifestFromData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "platformClass"), "manifestFromData:", v4));

  return v5;
}

- (UMDPersonaManifest)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UMDPersonaManifest;
  v2 = -[UMDPersonaManifest init](&v7, "init");
  if (!v2) {
    sub_1000A9C18();
  }
  v3 = v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  users = v3->_users;
  v3->_users = (NSSet *)v4;

  return v3;
}

- (NSData)dataValue
{
  if (qword_1000DBBC8 != -1) {
    dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
  }
  v2 = (os_log_s *)(id)qword_1000DBBC0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = 0LL;
    unsigned int v3 = sub_100053B4C(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = v3 & 0xFFFFFFFE;
    }
    if ((_DWORD)v4)
    {
      __int16 v8 = 0;
      v5 = (const char *)_os_log_send_and_compose_impl( v4,  &v9,  0LL,  0LL,  &_mh_execute_header,  v2,  16LL,  "-dataValue called on UMDPersonaManifest",  &v8,  2);
      v6 = (char *)v5;
      if (v5) {
        sub_100053B7C(v5);
      }
    }

    else
    {
      v6 = 0LL;
    }

    free(v6);
  }

  return 0LL;
}

+ (id)personaSetFromData:(id)a3
{
  id v3 = sub_10008573C((uint64_t)a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (!v4)
  {
    if (qword_1000DBBC8 != -1) {
      dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
    }
    v6 = (os_log_s *)(id)qword_1000DBBC0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(void *)v58 = 0LL;
      unsigned int v30 = sub_100053B4C(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = v30 & 0xFFFFFFFE;
      }
      if ((_DWORD)v31)
      {
        LOWORD(v56[0]) = 0;
        v32 = (const char *)_os_log_send_and_compose_impl( v31,  v58,  0LL,  0LL,  &_mh_execute_header,  v6,  16LL,  "Failed to parse persona manifest persona list: data is invalid",  v56,  2);
        v33 = (char *)v32;
        if (v32) {
          sub_100053B7C(v32);
        }
      }

      else
      {
        v33 = 0LL;
      }

      free(v33);
    }

    v25 = 0LL;
    goto LABEL_99;
  }

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"NUMENT"]);
  if (!v6 || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
  {
    if (qword_1000DBBC8 != -1) {
      dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
    }
    __int16 v8 = (os_log_s *)(id)qword_1000DBBC0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(void *)v58 = 0LL;
      unsigned int v26 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = v26 & 0xFFFFFFFE;
      }
      if ((_DWORD)v27)
      {
        LOWORD(v56[0]) = 0;
        v28 = (const char *)_os_log_send_and_compose_impl( v27,  v58,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "Failed to parse persona manifest persona list: entry count is invalid",  v56,  2);
        v29 = (char *)v28;
        if (v28) {
          sub_100053B7C(v28);
        }
      }

      else
      {
        v29 = 0LL;
      }

      free(v29);
    }

    v25 = 0LL;
    goto LABEL_98;
  }

  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BLOB"]);
  if (!v8 || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    if (qword_1000DBBC8 != -1) {
      dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
    }
    v12 = (os_log_s *)(id)qword_1000DBBC0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(void *)v58 = 0LL;
      unsigned int v34 = sub_100053B4C(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v35 = v34;
      }
      else {
        uint64_t v35 = v34 & 0xFFFFFFFE;
      }
      if ((_DWORD)v35)
      {
        LOWORD(v56[0]) = 0;
        v36 = (const char *)_os_log_send_and_compose_impl( v35,  v58,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "Failed to parse persona manifest persona list: data blob is invalid",  v56,  2);
        v37 = (char *)v36;
        if (v36) {
          sub_100053B7C(v36);
        }
      }

      else
      {
        v37 = 0LL;
      }

      free(v37);
    }

    v25 = 0LL;
    goto LABEL_97;
  }

  id v10 = sub_1000859B8((uint64_t)v8);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v11)
  {
    if (qword_1000DBBC8 != -1) {
      dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
    }
    v24 = (os_log_s *)(id)qword_1000DBBC0;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_95;
    }
    *(void *)v58 = 0LL;
    unsigned int v38 = sub_100053B4C(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = v38 & 0xFFFFFFFE;
    }
    if ((_DWORD)v39)
    {
      LOWORD(v56[0]) = 0;
      v40 = (void *)_os_log_send_and_compose_impl( v39,  v58,  0LL,  0LL,  &_mh_execute_header,  v24,  16LL,  "Failed to parse persona manifest persona list: persona list is invalid",  v56,  2);
      if (!v40) {
        goto LABEL_73;
      }
      goto LABEL_71;
    }

+ (id)dataForPersonaSet:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = sub_1000760E4(*(void *)(*((void *)&v19 + 1) + 8LL * (void)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v5, "addObject:", v12, (void)v19);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 count]));
  [v4 setObject:v13 forKeyedSubscript:@"NUMENT"];

  id v14 = sub_1000855C0((uint64_t)v5);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v4 setObject:v15 forKeyedSubscript:@"BLOB"];

  id v16 = sub_100085444((uint64_t)v4);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

+ (id)userSetFromDict:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v64;
    id v10 = &AKSGetLastUser_ptr;
    id v11 = &AKSGetLastUser_ptr;
    __int128 v55 = v6;
    v56 = v5;
    uint64_t v52 = *(void *)v64;
    id v53 = a1;
LABEL_3:
    v12 = 0LL;
    id v54 = v8;
    while (1)
    {
      if (*(void *)v64 != v9) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v12);
      id v14 = sub_100017CFC((uint64_t)v10[126], v13);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!v15) {
        break;
      }
      id v16 = (id)v15;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
      uint64_t v18 = objc_opt_class(v11[114]);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
      {
        if (qword_1000DBBC8 != -1) {
          dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
        }
        __int128 v20 = (os_log_s *)(id)qword_1000DBBC0;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(void *)v67 = 0LL;
          unsigned int v44 = sub_100053B4C(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            uint64_t v45 = v44;
          }
          else {
            uint64_t v45 = v44 & 0xFFFFFFFE;
          }
          if ((_DWORD)v45)
          {
            LOWORD(v62[0]) = 0;
            v46 = (const char *)_os_log_send_and_compose_impl( v45,  v67,  0LL,  0LL,  &_mh_execute_header,  v20,  16LL,  "Failed to parse persona manifest user list: user value is invalid",  v62,  2);
            unsigned int v47 = (char *)v46;
            if (v46) {
              sub_100053B7C(v46);
            }
          }

          else
          {
            unsigned int v47 = 0LL;
          }

          free(v47);
        }

        goto LABEL_37;
      }

      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 personaSetFromData:v17]);
      __int128 v20 = v19;
      if (!v19)
      {
        if (qword_1000DBBC8 != -1) {
          dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
        }
        __int128 v21 = (os_log_s *)(id)qword_1000DBBC0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(void *)v67 = 0LL;
          unsigned int v48 = sub_100053B4C(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            uint64_t v49 = v48;
          }
          else {
            uint64_t v49 = v48 & 0xFFFFFFFE;
          }
          if ((_DWORD)v49)
          {
            LOWORD(v62[0]) = 0;
            v50 = (const char *)_os_log_send_and_compose_impl( v49,  v67,  0LL,  0LL,  &_mh_execute_header,  v21,  16LL,  "Failed to parse persona manifest user list: failed to parse user personas",  v62,  2);
            v51 = (char *)v50;
            if (v50) {
              sub_100053B7C(v50);
            }
          }

          else
          {
            v51 = 0LL;
          }

          free(v51);
        }

+ (id)dictForUserSet:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v46;
    unsigned int v38 = v5;
    uint64_t v39 = v4;
    uint64_t v36 = *(void *)v46;
    while (2)
    {
      id v37 = v6;
      for (i = 0LL; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
        if (!v9 || !*(void *)(v9 + 24))
        {
          if (qword_1000DBBC8 != -1) {
            dispatch_once(&qword_1000DBBC8, &stru_1000CDB00);
          }
          id v10 = (os_log_s *)(id)qword_1000DBBC0;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(void *)uint64_t v49 = 0LL;
            unsigned int v32 = sub_100053B4C(0);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              uint64_t v33 = v32;
            }
            else {
              uint64_t v33 = v32 & 0xFFFFFFFE;
            }
            if ((_DWORD)v33)
            {
              LOWORD(v40[0]) = 0;
              unsigned int v34 = (const char *)_os_log_send_and_compose_impl( v33,  v49,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "Failed to generate dict for persona manifest user: missing user UUID",  v40,  2);
              uint64_t v35 = (char *)v34;
              if (v34) {
                sub_100053B7C(v34);
              }
            }

            else
            {
              uint64_t v35 = 0LL;
            }

            free(v35);
          }

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (NSSet)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end