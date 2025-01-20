@interface UMLibNotifyProvider
- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4;
- (BOOL)post:(id)a3;
- (BOOL)setState:(unint64_t)a3 forToken:(int)a4;
- (int)registerCheck:(id)a3;
- (int)registerPlain:(id)a3;
- (unint64_t)stateForToken:(int)a3 error:(id *)a4;
@end

@implementation UMLibNotifyProvider

- (BOOL)post:(id)a3
{
  id v3 = a3;
  uint32_t v4 = notify_post((const char *)[v3 UTF8String]);
  if (v4)
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    v5 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = 0LL;
      unsigned int v6 = sub_100053B4C(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = v6 & 0xFFFFFFFE;
      }
      if ((_DWORD)v7)
      {
        int v14 = 138543618;
        id v15 = v3;
        __int16 v16 = 1024;
        uint32_t v17 = v4;
        v8 = (const char *)_os_log_send_and_compose_impl( v7,  &v13,  0LL,  0LL,  &_mh_execute_header,  v5,  16LL,  "notify_post(%{public}@) failed: %d",  &v14,  18);
        goto LABEL_18;
      }

      goto LABEL_20;
    }
  }

  else
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    v5 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = 0LL;
      unsigned int v9 = sub_100053B4C(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        int v14 = 138543362;
        id v15 = v3;
        v8 = (const char *)_os_log_send_and_compose_impl( v10,  &v13,  0LL,  0LL,  &_mh_execute_header,  v5,  2LL,  "notify_post(%{public}@)",  &v14,  12);
LABEL_18:
        v11 = (char *)v8;
        if (v8) {
          sub_100053B7C(v8);
        }
        goto LABEL_21;
      }

- (int)registerPlain:(id)a3
{
  int v19 = -1;
  id v3 = a3;
  int v4 = notify_register_plain([v3 UTF8String], &v19);
  if (v4)
  {
    int v5 = v4;
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    unsigned int v6 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = 0LL;
      unsigned int v7 = sub_100053B4C(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = v7 & 0xFFFFFFFE;
      }
      if ((_DWORD)v8)
      {
        int v20 = 138543618;
        id v21 = v3;
        __int16 v22 = 1024;
        int v23 = v5;
        unsigned int v9 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  16LL,  "notify_register_plain(%{public}@) failed: %d",  &v20,  18);
        uint64_t v10 = (char *)v9;
        if (v9) {
          sub_100053B7C(v9);
        }
      }

      else
      {
        uint64_t v10 = 0LL;
      }

      free(v10);
    }

    int v16 = -1;
  }

  else
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    v11 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = 0LL;
      unsigned int v12 = sub_100053B4C(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v13)
      {
        int v20 = 138543618;
        id v21 = v3;
        __int16 v22 = 1024;
        int v23 = v19;
        int v14 = (const char *)_os_log_send_and_compose_impl( v13,  &v18,  0LL,  0LL,  &_mh_execute_header,  v11,  2LL,  "notify_register_plain(%{public}@) -> %d",  &v20,  18);
        id v15 = (char *)v14;
        if (v14) {
          sub_100053B7C(v14);
        }
      }

      else
      {
        id v15 = 0LL;
      }

      free(v15);
    }

    int v16 = v19;
  }

  return v16;
}

- (int)registerCheck:(id)a3
{
  int out_token = -1;
  id v3 = a3;
  uint32_t v4 = notify_register_check((const char *)[v3 UTF8String], &out_token);
  if (v4)
  {
    uint32_t v5 = v4;
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    unsigned int v6 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = 0LL;
      unsigned int v7 = sub_100053B4C(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = v7 & 0xFFFFFFFE;
      }
      if ((_DWORD)v8)
      {
        int v20 = 138543618;
        id v21 = v3;
        __int16 v22 = 1024;
        int v23 = v5;
        unsigned int v9 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  16LL,  "notify_register_check(%{public}@) failed: %d",  &v20,  18);
        uint64_t v10 = (char *)v9;
        if (v9) {
          sub_100053B7C(v9);
        }
      }

      else
      {
        uint64_t v10 = 0LL;
      }

      free(v10);
    }

    int v16 = -1;
  }

  else
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    v11 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = 0LL;
      unsigned int v12 = sub_100053B4C(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v13)
      {
        int v20 = 138543618;
        id v21 = v3;
        __int16 v22 = 1024;
        int v23 = out_token;
        int v14 = (const char *)_os_log_send_and_compose_impl( v13,  &v18,  0LL,  0LL,  &_mh_execute_header,  v11,  2LL,  "notify_register_check(%{public}@) -> %d",  &v20,  18);
        id v15 = (char *)v14;
        if (v14) {
          sub_100053B7C(v14);
        }
      }

      else
      {
        id v15 = 0LL;
      }

      free(v15);
    }

    int v16 = out_token;
  }

  return v16;
}

- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4
{
  *a4 = 0LL;
  int check = 0;
  uint32_t v6 = notify_check(a3, &check);
  if (v6)
  {
    uint32_t v7 = v6;
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    uint64_t v8 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = 0LL;
      unsigned int v9 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        int v22 = 67109376;
        int v23 = a3;
        __int16 v24 = 1024;
        int v25 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v20,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "notify_check(%d) failed: %d",  &v22,  14);
        unsigned int v12 = (char *)v11;
        if (v11) {
          sub_100053B7C(v11);
        }
      }

      else
      {
        unsigned int v12 = 0LL;
      }

      free(v12);
    }

    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
    BOOL result = 0;
    *a4 = v18;
  }

  else
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    uint64_t v13 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = 0LL;
      unsigned int v14 = sub_100053B4C(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        int v22 = 67109376;
        int v23 = a3;
        __int16 v24 = 1024;
        int v25 = check;
        int v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v20,  0LL,  0LL,  &_mh_execute_header,  v13,  2LL,  "notify_check(%d) -> %d",  &v22,  14);
        uint32_t v17 = (char *)v16;
        if (v16) {
          sub_100053B7C(v16);
        }
      }

      else
      {
        uint32_t v17 = 0LL;
      }

      free(v17);
    }

    return check == 1;
  }

  return result;
}

- (BOOL)setState:(unint64_t)a3 forToken:(int)a4
{
  uint32_t v6 = notify_set_state(a4, a3);
  if (v6)
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    uint32_t v7 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = 0LL;
      unsigned int v8 = sub_100053B4C(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        int v16 = 67109632;
        int v17 = a4;
        __int16 v18 = 2048;
        unint64_t v19 = a3;
        __int16 v20 = 1024;
        uint32_t v21 = v6;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v15,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "notify_set_state(%d, %llu) failed: %d",  &v16,  24);
        goto LABEL_18;
      }

      goto LABEL_20;
    }
  }

  else
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    uint32_t v7 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = 0LL;
      unsigned int v11 = sub_100053B4C(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v11 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        int v16 = 67109376;
        int v17 = a4;
        __int16 v18 = 2048;
        unint64_t v19 = a3;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v12,  &v15,  0LL,  0LL,  &_mh_execute_header,  v7,  2LL,  "notify_set_state(%d, %llu)",  &v16,  18);
LABEL_18:
        uint64_t v13 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
        goto LABEL_21;
      }

- (unint64_t)stateForToken:(int)a3 error:(id *)a4
{
  *a4 = 0LL;
  uint64_t state64 = 0LL;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v6 = state;
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    uint32_t v7 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = 0LL;
      unsigned int v8 = sub_100053B4C(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        int v21 = 67109376;
        int v22 = a3;
        __int16 v23 = 1024;
        LODWORD(v24) = v6;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v19,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "notify_get_state(%d) failed: %d",  &v21,  14);
        unsigned int v11 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
      }

      else
      {
        unsigned int v11 = 0LL;
      }

      free(v11);
    }

    return 0LL;
  }

  else
  {
    if (qword_1000DBA40 != -1) {
      dispatch_once(&qword_1000DBA40, &stru_1000CD2F8);
    }
    uint64_t v12 = (os_log_s *)(id)qword_1000DBA38;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = 0LL;
      unsigned int v13 = sub_100053B4C(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        int v21 = 67109376;
        int v22 = a3;
        __int16 v23 = 2048;
        uint64_t v24 = state64;
        LODWORD(v18) = 18;
        uint64_t v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v19,  0LL,  0LL,  &_mh_execute_header,  v12,  2LL,  "notify_get_state(%d) -> %llu",  &v21,  v18);
        int v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        int v16 = 0LL;
      }

      free(v16);
    }

    return state64;
  }

@end