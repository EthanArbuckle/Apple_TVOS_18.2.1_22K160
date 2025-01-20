void sub_22F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  os_log_s *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  v5 = a3;
  v6 = _ACLogSystem(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Remove success %@ error %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_29C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v13 = v11;

    if (!v13) {
      goto LABEL_12;
    }
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v5];
  }

  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = _ACLogSystem(v12);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_3008((uint64_t)v5, a1, v13);
    }
  }
}

void sub_2B30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _ACLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Did remove obsolete account %@ with success %@ error %@",  (uint8_t *)&v10,  0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_2D0C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2E78(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _ACLogSystem();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (a2) {
      uint64_t v8 = @"YES";
    }
    int v9 = 138412546;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Ran account migration plugins, success: %@ error: %@",  (uint8_t *)&v9,  0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2F70(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_2F84( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_2F94(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_2F70(&dword_0, a2, a3, "Couldn't remove file at %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_3008(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 40);
  sub_2F70( &dword_0,  a2,  a3,  "Could not find acceptable action for dataclass %@ for removal of account %@. Probably orphaning data.",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
}

void sub_3080( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_30B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_writeMigrationVersionPrefForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMigrationVersionPrefForKey:");
}