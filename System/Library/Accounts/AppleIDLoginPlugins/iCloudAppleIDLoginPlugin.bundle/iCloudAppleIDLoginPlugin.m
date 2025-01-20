void sub_2760(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  v6 = a3;
  kdebug_trace(728563720LL, 0LL, 0LL, 0LL, 0LL);
  v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void sub_2A5C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = _AALogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error saving account: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2DF0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](&OBJC_CLASS___FMDFMIPManager, "sharedInstance"));
  [v2 didReceiveLostModeExitAuthToken:*(void *)(a1 + 32)];
}

void sub_2E34(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = _AALogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error saving account: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}