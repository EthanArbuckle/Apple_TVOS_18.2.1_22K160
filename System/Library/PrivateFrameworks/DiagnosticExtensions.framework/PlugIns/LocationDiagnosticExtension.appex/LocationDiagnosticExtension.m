uint64_t sub_1000037BC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  os_log_s *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = CLGetPipelinedCache();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    v5 = v4;
    v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(os_log_s **)(a1 + 32);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension adding pipelined tiles at %@",  buf,  0xCu);
        }
      }

      v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }

    while (v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}