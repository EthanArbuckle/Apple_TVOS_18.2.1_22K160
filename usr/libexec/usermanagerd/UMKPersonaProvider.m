@interface UMKPersonaProvider
- (BOOL)allocatePersonaWithInfo:(id)a3 andPath:(id)a4 error:(id *)a5;
- (BOOL)deallocatePersonaWithID:(unsigned int)a3 error:(id *)a4;
- (id)infoForPersonaWithID:(unsigned int)a3 error:(id *)a4;
- (id)infoForProcessWithPID:(int)a3 error:(id *)a4;
@end

@implementation UMKPersonaProvider

- (BOOL)allocatePersonaWithInfo:(id)a3 andPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5) {
    *a5 = 0LL;
  }
  int v51 = 0;
  double v9 = sub_100080A48(v7, (uint64_t)&v64);
  if (!v64)
  {
    if (qword_1000DBBF8 != -1) {
      dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
    }
    v15 = (os_log_s *)(id)qword_1000DBBF0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = 0LL;
      unsigned int v16 = sub_100053B4C(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        *(_WORD *)v52 = 0;
        v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v53,  0LL,  0LL,  &_mh_execute_header,  v15,  16LL,  "Failed to allocate kernel persona: Failed to create kpersona_info struct from UMKPersonaInfo object",  v52,  2);
        v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        v19 = 0LL;
      }

      free(v19);
    }

    if (a5)
    {
      NSErrorDomain v34 = NSPOSIXErrorDomain;
      uint64_t v35 = 22LL;
LABEL_62:
      BOOL v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v34,  v35,  0LL));
      goto LABEL_83;
    }

- (BOOL)deallocatePersonaWithID:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  int v6 = kpersona_dealloc(*(void *)&a3, a2);
  if (v6)
  {
    int v7 = *__error();
    if (qword_1000DBBF8 != -1) {
      dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
    }
    id v8 = (os_log_s *)(id)qword_1000DBBF0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = 0LL;
      unsigned int v9 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        LODWORD(v19) = 67109632;
        HIDWORD(v19) = a3;
        __int16 v20 = 1024;
        unsigned int v21 = a3;
        __int16 v22 = 1024;
        int v23 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v24,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "Failed to deallocate kernel persona %u: kpersona_delloc(%u) failed: %{darwin.errno}d",  &v19,  20);
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

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
  }

  else
  {
    if (qword_1000DBBF8 != -1) {
      dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
    }
    uint64_t v13 = (os_log_s *)(id)qword_1000DBBF0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = 0LL;
      unsigned int v14 = sub_100053B4C(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        LODWORD(v24) = 67109120;
        HIDWORD(v24) = a3;
        unsigned int v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v19,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "Deallocated kernel persona with ID: %u",  &v24);
        uint64_t v17 = (char *)v16;
        if (v16) {
          sub_100053B7C(v16);
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      free(v17);
    }
  }

  return v6 == 0;
}

- (id)infoForPersonaWithID:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  memset(&__src[1], 0, 344);
  __src[0] = 2;
  if (kpersona_info(*(void *)&a3, __src))
  {
    int v6 = *__error();
    if (v6 == 3)
    {
      if (qword_1000DBBF8 != -1) {
        dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
      }
      int v7 = (os_log_s *)(id)qword_1000DBBF0;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_44;
      }
      uint64_t v35 = 0LL;
      unsigned int v8 = sub_100053B4C(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        LODWORD(__dst[0]) = 67109632;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = a3;
        HIWORD(__dst[1]) = 1024;
        LODWORD(__dst[2]) = 3;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v35,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "Failed to retrieve info for kernel persona ID %u: kpersona_info(%u) failed: %{darwin.errno}d",  __dst,  20,  __dst[0],  __dst[1],  __dst[2]);
        goto LABEL_31;
      }
    }

    else
    {
      if (qword_1000DBBF8 != -1) {
        dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
      }
      int v7 = (os_log_s *)(id)qword_1000DBBF0;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      uint64_t v35 = 0LL;
      unsigned int v24 = sub_100053B4C(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v24 & 0xFFFFFFFE;
      }
      if ((_DWORD)v25)
      {
        LODWORD(__dst[0]) = 67109632;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = a3;
        HIWORD(__dst[1]) = 1024;
        LODWORD(__dst[2]) = v6;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v25,  &v35,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "Failed to retrieve info for kernel persona ID %u: kpersona_info(%u) failed: %{darwin.errno}d",  __dst,  20,  __dst[0],  __dst[1],  __dst[2]);
LABEL_31:
        v26 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
        goto LABEL_43;
      }
    }

    v26 = 0LL;
LABEL_43:
    free(v26);
LABEL_44:

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v6,  0LL));
    }
    return 0LL;
  }

  memcpy(__dst, __src, 0x15CuLL);
  id v11 = sub_1000807CC((uint64_t)&OBJC_CLASS___UMKPersonaInfo, (int *)__dst);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    if (qword_1000DBBF8 != -1) {
      dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
    }
    uint64_t v13 = (os_log_s *)(id)qword_1000DBBF0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = 0LL;
      unsigned int v14 = sub_100053B4C(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        unsigned int v16 = v13;
        int v17 = sub_10005682C((uint64_t)v12);
        int v18 = sub_100064168((uint64_t)v12);
        id v20 = sub_1000741F8(v12, v19);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        int v22 = sub_1000642D4((uint64_t)v12);
        LODWORD(__dst[0]) = 67109890;
        HIDWORD(__dst[0]) = v17;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = v18;
        HIWORD(__dst[1]) = 2114;
        __dst[2] = v21;
        LOWORD(__dst[3]) = 1024;
        *(_DWORD *)((char *)&__dst[3] + 2) = v22;
        int v23 = (char *)_os_log_send_and_compose_impl( v15,  &v35,  0LL,  0LL,  &_mh_execute_header,  v16,  2LL,  "Found kernel persona with ID: %u, Type: %u, Name: %{public}@, UID: %u",  __dst,  30);

        if (v23) {
          sub_100053B7C(v23);
        }
      }

      else
      {
        int v23 = 0LL;
      }

      free(v23);
    }

    id v33 = v12;
  }

  else
  {
    if (qword_1000DBBF8 != -1) {
      dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
    }
    v27 = (os_log_s *)(id)qword_1000DBBF0;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __dst[0] = 0LL;
      unsigned int v28 = sub_100053B4C(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = v28 & 0xFFFFFFFE;
      }
      if ((_DWORD)v29)
      {
        LODWORD(v35) = 67109120;
        HIDWORD(v35) = a3;
        uint64_t v30 = (const char *)_os_log_send_and_compose_impl( v29,  __dst,  0LL,  0LL,  &_mh_execute_header,  v27,  16LL,  "Failed to retrieve info for kernel persona ID %u: Failed to parse kpersona_info struct",  &v35);
        v31 = (char *)v30;
        if (v30) {
          sub_100053B7C(v30);
        }
      }

      else
      {
        v31 = 0LL;
      }

      free(v31);
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  34LL,  0LL));
    }
  }

  return v12;
}

- (id)infoForProcessWithPID:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  memset(&__src[1], 0, 344);
  __src[0] = 2;
  if (kpersona_pidinfo(*(void *)&a3, __src))
  {
    int v6 = *__error();
    if (qword_1000DBBF8 != -1) {
      dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
    }
    int v7 = (os_log_s *)(id)qword_1000DBBF0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = 0LL;
      unsigned int v8 = sub_100053B4C(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        LODWORD(__dst[0]) = 67109376;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = v6;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v33,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "Failed to retrieve persona info for pid %u: %{darwin.errno}d",  __dst,  14);
        id v11 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
      }

      else
      {
        id v11 = 0LL;
      }

      free(v11);
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v6,  0LL));
    }
    return 0LL;
  }

  else
  {
    memcpy(__dst, __src, 0x15CuLL);
    id v12 = sub_1000807CC((uint64_t)&OBJC_CLASS___UMKPersonaInfo, (int *)__dst);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v13)
    {
      if (qword_1000DBBF8 != -1) {
        dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
      }
      unsigned int v14 = (os_log_s *)(id)qword_1000DBBF0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = 0LL;
        unsigned int v15 = sub_100053B4C(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = v15 & 0xFFFFFFFE;
        }
        if ((_DWORD)v16)
        {
          int v17 = v14;
          int v18 = sub_10005682C((uint64_t)v13);
          int v19 = sub_100064168((uint64_t)v13);
          id v21 = sub_1000741F8(v13, v20);
          int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          int v23 = sub_1000642D4((uint64_t)v13);
          LODWORD(__dst[0]) = 67110146;
          HIDWORD(__dst[0]) = a3;
          LOWORD(__dst[1]) = 1024;
          *(_DWORD *)((char *)&__dst[1] + 2) = v18;
          HIWORD(__dst[1]) = 1024;
          LODWORD(__dst[2]) = v19;
          WORD2(__dst[2]) = 2114;
          *(void *)((char *)&__dst[2] + 6) = v22;
          HIWORD(__dst[3]) = 1024;
          LODWORD(__dst[4]) = v23;
          unsigned int v24 = (char *)_os_log_send_and_compose_impl( v16,  &v33,  0LL,  0LL,  &_mh_execute_header,  v17,  2LL,  "Found kernel persona that is the at-spawn persona for PID: %u, ID: %u, Type: %u, Name: %{public}@, UID: %u",  __dst,  36);

          if (v24) {
            sub_100053B7C(v24);
          }
        }

        else
        {
          unsigned int v24 = 0LL;
        }

        free(v24);
      }

      id v31 = v13;
    }

    else
    {
      if (qword_1000DBBF8 != -1) {
        dispatch_once(&qword_1000DBBF8, &stru_1000CDB88);
      }
      uint64_t v25 = (os_log_s *)(id)qword_1000DBBF0;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 0LL;
        unsigned int v26 = sub_100053B4C(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = v26 & 0xFFFFFFFE;
        }
        if ((_DWORD)v27)
        {
          LODWORD(v33) = 67109120;
          HIDWORD(v33) = a3;
          unsigned int v28 = (const char *)_os_log_send_and_compose_impl( v27,  __dst,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "Failed to retrieve persona info for pid %u: Failed to parse kpersona_info struct",  &v33);
          uint64_t v29 = (char *)v28;
          if (v28) {
            sub_100053B7C(v28);
          }
        }

        else
        {
          uint64_t v29 = 0LL;
        }

        free(v29);
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  34LL,  0LL));
      }
    }

    return v13;
  }

@end