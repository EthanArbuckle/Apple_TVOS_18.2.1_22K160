@interface NSCFBackgroundDataTask
@end

@implementation NSCFBackgroundDataTask

void __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke( void *a1,  void *a2)
{
  if ((void *)a1[4] == a2)
  {
    uint64_t v7 = a1[5];
    v6 = *(void **)(v7 + 808);
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }

  if (!a2)
  {
    uint64_t v5 = [0 HTTPBodyStream];
    goto LABEL_8;
  }

  CFArrayRef v4 = CFURLRequestCopyHTTPRequestBodyParts(a2);
  uint64_t v5 = [a2 HTTPBodyStream];
  if (!v4)
  {
LABEL_8:
    v6 = (void *)v5;
    goto LABEL_9;
  }

  CFRelease(v4);
  v6 = 0LL;
LABEL_9:
  uint64_t v7 = a1[5];
LABEL_10:
LABEL_13:
  uint64_t v8 = a1[5];
  if (*(void *)(v8 + 800) && (v9 = [*(id *)(v8 + 800) streamStatus], uint64_t v8 = a1[5], v9))
  {
    if (*(_BYTE *)(v8 + 840))
    {
      (*(void (**)(void, void *, void))(a1[6] + 16LL))(a1[6], a2, 0LL);
    }

    else
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2;
      v11[3] = &unk_189C0B5D0;
      uint64_t v10 = a1[6];
      v11[4] = a2;
      v11[5] = v10;
      -[__NSCFBackgroundDataTask _onqueue_needNewBodyStream:withCompletion:]((void *)v8, 1, (uint64_t)v11);
    }
  }

  else
  {
    -[__NSCFBackgroundDataTask _onqueue_startReadingFromStream](v8);
    (*(void (**)(void, void *, id))(a1[6] + 16LL))( a1[6],  a2,  *(id *)(a1[5] + 816LL));
  }

  *(void *)(a1[5] + 808LL) = 0LL;
}

uint64_t __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2);
}

void __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke( uint64_t a1,  dispatch_data_s *a2,  uint64_t a3,  int a4,  int a5)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 32);
  if (a4)
  {
    uint64_t v7 = (dispatch_queue_s *)[*(id *)(a1 + 32) workQueue];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke_2;
    v16[3] = &unk_189C1A548;
    v16[4] = *(void *)(a1 + 32);
    dispatch_async(v7, v16);
    return;
  }

  if (v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)[*(id *)(a1 + 32) workQueue]);
    if (*(void *)(v5 + 824))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v10 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(v5 + 832);
        *(_DWORD *)io_handler = 138412546;
        *(void *)&io_handler[4] = v5;
        *(_WORD *)&io_handler[12] = 2048;
        *(void *)&io_handler[14] = v15;
        _os_log_debug_impl( &dword_18298D000,  v10,  OS_LOG_TYPE_DEBUG,  "%@ got data from stream (ongoing writes: %zu)",  io_handler,  0x16u);
        if (!a2) {
          goto LABEL_11;
        }
      }

      else if (!a2)
      {
LABEL_11:
        if (a5)
        {
          v13 = (dispatch_queue_s *)[(id)v5 workQueue];
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke_14;
          block[3] = &unk_189C1A548;
          block[4] = v5;
          dispatch_async(v13, block);
        }

        if (*(void *)(v5 + 832) >= 4uLL)
        {
          dispatch_assert_queue_V2((dispatch_queue_t)[(id)v5 workQueue]);
          if (*(_BYTE *)(v5 + 841))
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
            }
            v14 = (os_log_s *)CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v23 = v5;
              _os_log_debug_impl(&dword_18298D000, v14, OS_LOG_TYPE_DEBUG, "%@ suspend reading from stream", buf, 0xCu);
            }

            *(_BYTE *)(v5 + 841) = 0;
            (*(void (**)(void))(**(void **)(v5 + 784) + 24LL))(*(void *)(v5 + 784));
          }
        }

        return;
      }

      ++*(void *)(v5 + 832);
      v11 = *(dispatch_io_s **)(v5 + 824);
      v12 = (dispatch_queue_s *)[(id)v5 workQueue];
      *(void *)io_handler = MEMORY[0x1895F87A8];
      *(void *)&io_handler[8] = 3221225472LL;
      *(void *)&io_handler[16] = __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke;
      v19 = &unk_189C0B648;
      uint64_t v20 = v5;
      char v21 = a5;
      dispatch_io_write(v11, 0LL, a2, v12, io_handler);
      goto LABEL_11;
    }
  }

void __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke_2(uint64_t a1)
{
}

void __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke( uint64_t a1,  int a2,  dispatch_data_s *a3,  int a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a4 || a2)
  {
    if (a4)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 67109120;
        LODWORD(size) = a4;
        _os_log_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_DEFAULT,  "Background upload error %d writing to pipe",  (uint8_t *)&v14,  8u);
      }
    }

    size_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      int v10 = *(unsigned __int8 *)(a1 + 40);
      dispatch_assert_queue_V2((dispatch_queue_t)[*(id *)(a1 + 32) workQueue]);
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v11 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = *(void *)(v9 + 832);
        int v14 = 138412546;
        size_t size = v9;
        __int16 v16 = 2048;
        uint64_t v17 = v13;
        _os_log_debug_impl( &dword_18298D000,  v11,  OS_LOG_TYPE_DEBUG,  "%@ sent data from stream (ongoing writes: %zu)",  (uint8_t *)&v14,  0x16u);
      }

      unint64_t v12 = *(void *)(v9 + 832) - 1LL;
      *(void *)(v9 + 832) = v12;
      if (!v10 && v12 <= 2) {
        -[__NSCFBackgroundDataTask _onqueue_startReadingFromStream](v9);
      }
    }
  }

  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v7 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      size_t size = dispatch_data_get_size(a3);
      _os_log_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_INFO,  "Background upload not done!! remaining size: %ld",  (uint8_t *)&v14,  0xCu);
    }
  }

void __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke_14(uint64_t a1)
{
}

uint64_t __70____NSCFBackgroundDataTask__onqueue_needNewBodyStream_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 808LL) = 0LL;
  -[__NSCFBackgroundDataTask _onqueue_captureStream:](*(void *)(a1 + 32), a2);
  if (*(_BYTE *)(a1 + 48)) {
    -[__NSCFBackgroundDataTask _onqueue_startReadingFromStream](*(void *)(a1 + 32));
  }
  return (*(uint64_t (**)(void, id))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(id *)(*(void *)(a1 + 32) + 816LL));
}

void __51____NSCFBackgroundDataTask__onqueue_captureStream___block_invoke(uint64_t a1)
{
}

@end