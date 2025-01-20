@interface UMSecurityProvider
- (BOOL)deleteKeychainItemsForPersonaWithUUID:(id)a3 error:(id *)a4;
@end

@implementation UMSecurityProvider

- (BOOL)deleteKeychainItemsForPersonaWithUUID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (qword_1000DBC58 != -1) {
    dispatch_once(&qword_1000DBC58, &stru_1000CDC30);
  }
  v6 = (os_log_s *)(id)qword_1000DBC50;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = 0LL;
    unsigned int v7 = sub_100053B4C(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v7 & 0xFFFFFFFE;
    }
    if ((_DWORD)v8)
    {
      __int16 v19 = 0;
      v9 = (const char *)_os_log_send_and_compose_impl( v8,  &v20,  0LL,  0LL,  &_mh_execute_header,  v6,  2LL,  "Calling _SecKeychainDeleteMultiUser, not waiting for completion..",  &v19,  2);
      v10 = (char *)v9;
      if (v9) {
        sub_100053B7C(v9);
      }
    }

    else
    {
      v10 = 0LL;
    }

    free(v10);
  }

  id v11 = v5;
  _SecKeychainDeleteMultiUser();
  if (qword_1000DBC58 != -1) {
    dispatch_once(&qword_1000DBC58, &stru_1000CDC30);
  }
  v12 = (os_log_s *)(id)qword_1000DBC50;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = 0LL;
    unsigned int v13 = sub_100053B4C(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v13 & 0xFFFFFFFE;
    }
    if ((_DWORD)v14)
    {
      __int16 v19 = 0;
      LODWORD(v18) = 2;
      v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v20,  0LL,  0LL,  &_mh_execute_header,  v12,  2LL,  "Waiting for _SecKeychainDeleteMultiUser complete",  &v19,  v18);
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

  if (a4) {
    *a4 = 0LL;
  }

  return 1;
}

@end