void sub_3418(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  os_log_s *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_36D0(a1, (uint64_t)v4, v5);
    }
    if (*(void *)(a1 + 40))
    {
      v6 = objc_alloc(&OBJC_CLASS___SACommandFailed);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedFailureReason]);
      v8 = [v6 initWithReason:v7];

      v9 = *(void *)(a1 + 40);
      v10 = v8;
LABEL_8:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionary]);
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
    }
  }

  else
  {
    v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
      v8 = v10;
      goto LABEL_8;
    }
  }
}

void sub_3650(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[OnScreenActionActivateUIElement _isValid]";
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%s ActivateUIElement called wihout elementId",  (uint8_t *)&v1,  0xCu);
}

void sub_36D0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  v5 = "-[OnScreenActionActivateUIElement _activateUIElementWithCompletion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%s Error activating elementID %@ : %{public}@",  (uint8_t *)&v4,  0x20u);
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}