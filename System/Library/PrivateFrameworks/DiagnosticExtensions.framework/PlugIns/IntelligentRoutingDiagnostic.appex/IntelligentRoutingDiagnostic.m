void sub_100003228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003248(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003258(uint64_t a1)
{
}

void sub_100003260(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (os_log_t *)&IRLogObject;
  if (v6)
  {
    v8 = (os_log_s *)IRLogObject;
    if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_ERROR)) {
      sub_1000036C0((uint64_t)v6, v8, v9);
    }
  }

  unsigned __int8 v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) BOOLValue];
  v11 = (os_log_s *)IRLogObject;
  if ((v10 & 1) != 0)
  {
    id v33 = v6;
    if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension, database export reply called with urls: %@",  buf,  0xCu);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v34 = v5;
    id obj = v5;
    id v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v37;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          v16 = v7;
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v33));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
          unsigned __int8 v20 = [v18 fileExistsAtPath:v19];

          if ((v20 & 1) == 0)
          {
            os_log_t v32 = *v16;
            if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
              sub_1000035F0(v32, v17);
            }
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

            goto LABEL_25;
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v21));

          [v22 setDeleteOnAttach:&__kCFBooleanTrue];
          [v22 setShouldCompress:&__kCFBooleanTrue];
          v7 = v16;
          v23 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension, intelligentRoutingAttachment attachment: %@",  buf,  0xCu);
          }

          [*(id *)(a1 + 40) addObject:v22];
        }

        id v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v24 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension, database export reply finished",  buf,  2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_25:
    id v6 = v33;
    id v5 = v34;
  }

  else if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_ERROR))
  {
    sub_10000368C(v11, v25, v26, v27, v28, v29, v30, v31);
  }
}

void sub_1000035A0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000035B0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000035BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000035F0(void *a1, void *a2)
{
  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  int v6 = 138412290;
  v7 = v4;
  sub_1000035B0( (void *)&_mh_execute_header,  v3,  v5,  "#diagnosticExtension, [ErrorId - Diagnostics extension non existing file] got a non-existing file from exportDatabas e! This should never happen. path: %@",  (uint8_t *)&v6);
}

void sub_10000368C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000036C0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000035B0( (void *)&_mh_execute_header,  a2,  a3,  "#diagnosticExtension, [ErrorId - Diagnostics extension export error] got reply with error: %@",  (uint8_t *)&v3);
}

id objc_msgSend_setShouldCompress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCompress:");
}