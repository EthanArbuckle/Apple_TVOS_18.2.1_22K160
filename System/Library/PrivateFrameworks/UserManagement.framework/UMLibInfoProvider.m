@interface UMLibInfoProvider
- (id)passwdForUID:(unsigned int)a3 error:(id *)a4;
@end

@implementation UMLibInfoProvider

- (id)passwdForUID:(unsigned int)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1895F89C0];
  if (a4) {
    *a4 = 0LL;
  }
  *__error() = 0;
  v6 = getpwuid(a3);
  if (!v6)
  {
    int v8 = *__error();
    if (v8)
    {
      if (qword_18C682AF0 != -1) {
        dispatch_once(&qword_18C682AF0, &unk_189DD4A98);
      }
      v9 = (os_log_s *)(id)qword_18C682AE0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v25[0] = 0LL;
        unsigned int v10 = sub_185F385E4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          unsigned int v11 = v10;
        }
        else {
          unsigned int v11 = v10 & 0xFFFFFFFE;
        }
        if (v11)
        {
          LODWORD(v22) = 67109376;
          HIDWORD(v22) = a3;
          __int16 v23 = 1024;
          int v24 = v8;
          int v21 = 14;
          v20 = &v22;
          v12 = (void *)_os_log_send_and_compose_impl();
          if (v12) {
            sub_185F385EC();
          }
        }

        else
        {
          v12 = 0LL;
        }

        free(v12);
      }

      if (a4)
      {
        objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v17,  *MEMORY[0x189607688],  v8,  0,  v20,  v21,  v22);
LABEL_32:
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return 0LL;
      }
    }

    else
    {
      if (qword_18C682AF0 != -1) {
        dispatch_once(&qword_18C682AF0, &unk_189DD4A98);
      }
      v13 = (os_log_s *)(id)qword_18C682AE0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = 0LL;
        unsigned int v14 = sub_185F385E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v14 & 0xFFFFFFFE;
        }
        if (v15)
        {
          LODWORD(v25[0]) = 67109120;
          HIDWORD(v25[0]) = a3;
          int v21 = 8;
          v20 = v25;
          v16 = (void *)_os_log_send_and_compose_impl();
          if (v16) {
            sub_185F385EC();
          }
        }

        else
        {
          v16 = 0LL;
        }

        free(v16);
      }

      if (a4)
      {
        objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v18,  *MEMORY[0x189607688],  2,  0,  v20,  v21,  v22);
        goto LABEL_32;
      }
    }

    v7 = 0LL;
    return v7;
  }

  sub_185F473F0((uint64_t)&OBJC_CLASS___UMPasswd, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

@end