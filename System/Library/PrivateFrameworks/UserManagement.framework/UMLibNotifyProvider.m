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
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  uint32_t v8 = notify_post(v7);
  if (v8)
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    v9 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = sub_185F385E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
LABEL_17:
        v14 = (void *)_os_log_send_and_compose_impl();
        if (v14) {
          sub_185F385EC();
        }
        goto LABEL_20;
      }

- (int)registerPlain:(id)a3
{
  id v3 = a3;
  objc_msgSend_UTF8String(v3, v4, v5, v6);
  if (notify_register_plain())
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    v7 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = sub_185F385E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();
        if (v10) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v10 = 0LL;
      }

      free(v10);
    }
  }

  else
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    v7 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = sub_185F385E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        unsigned int v13 = (void *)_os_log_send_and_compose_impl();
        if (v13) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v13 = 0LL;
      }

      free(v13);
    }
  }

  return -1;
}

- (int)registerCheck:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  int out_token = -1;
  id v3 = a3;
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  uint32_t v8 = notify_register_check(v7, &out_token);
  if (v8)
  {
    uint32_t v9 = v8;
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    unsigned int v10 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = sub_185F385E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        int v21 = 138543618;
        id v22 = v3;
        __int16 v23 = 1024;
        int v24 = v9;
        unsigned int v13 = (void *)_os_log_send_and_compose_impl();
        if (v13) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v13 = 0LL;
      }

      free(v13);
    }

    int v18 = -1;
  }

  else
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    v14 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v15 = sub_185F385E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        int v21 = 138543618;
        id v22 = v3;
        __int16 v23 = 1024;
        int v24 = out_token;
        v17 = (void *)_os_log_send_and_compose_impl();
        if (v17) {
          sub_185F385EC();
        }
      }

      else
      {
        v17 = 0LL;
      }

      free(v17);
    }

    int v18 = out_token;
  }

  return v18;
}

- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  *a4 = 0LL;
  int check = 0;
  uint32_t v6 = notify_check(a3, &check);
  if (v6)
  {
    uint32_t v7 = v6;
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    uint32_t v8 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_185F385E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        int v20 = 67109376;
        int v21 = a3;
        __int16 v22 = 1024;
        int v23 = v7;
        unsigned int v11 = (void *)_os_log_send_and_compose_impl();
        if (v11) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v11 = 0LL;
      }

      free(v11);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v16, *MEMORY[0x189607688], 5, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a4 = v17;
  }

  else
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    unsigned int v12 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = sub_185F385E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int v20 = 67109376;
        int v21 = a3;
        __int16 v22 = 1024;
        int v23 = check;
        unsigned int v15 = (void *)_os_log_send_and_compose_impl();
        if (v15) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v15 = 0LL;
      }

      free(v15);
    }

    return check == 1;
  }

  return result;
}

- (BOOL)setState:(unint64_t)a3 forToken:(int)a4
{
  uint32_t v4 = notify_set_state(a4, a3);
  if (v4)
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    uint64_t v5 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sub_185F385E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = v6 & 0xFFFFFFFE;
      }
      if (v7)
      {
LABEL_17:
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();
        if (v10) {
          sub_185F385EC();
        }
        goto LABEL_20;
      }

- (unint64_t)stateForToken:(int)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  *a4 = 0LL;
  uint64_t state64 = 0LL;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v6 = state;
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    unsigned int v7 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = sub_185F385E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v17 = 67109376;
        int v18 = a3;
        __int16 v19 = 1024;
        LODWORD(v20) = v6;
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();
        if (v10) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v10 = 0LL;
      }

      free(v10);
    }

    return 0LL;
  }

  else
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    unsigned int v11 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v12 = sub_185F385E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        int v17 = 67109376;
        int v18 = a3;
        __int16 v19 = 2048;
        uint64_t v20 = state64;
        unsigned int v14 = (void *)_os_log_send_and_compose_impl();
        if (v14) {
          sub_185F385EC();
        }
      }

      else
      {
        unsigned int v14 = 0LL;
      }

      free(v14);
    }

    return state64;
  }

@end