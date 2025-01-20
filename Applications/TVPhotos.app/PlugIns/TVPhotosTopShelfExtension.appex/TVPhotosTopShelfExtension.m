void sub_100004E5C(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  v8 = a4;
  v9 = a5;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localIdentifier]);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[TVPhotosTopShelfExtension] Download for top shelf asset with identifier: %@ did complete with success",  (uint8_t *)&v11,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100005D98(a1, (uint64_t)v9);
  }
}

void sub_1000050FC(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:ACAccountIdentifierKey]);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _accountDidChangeWithIdenfitier:v4];
}

void sub_100005D98(uint64_t a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localIdentifier]);
  int v4 = 138412546;
  v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[TVPhotosTopShelfExtension] Download for top shelf asset with identifier: %@ did not complete with error: %@",  (uint8_t *)&v4,  0x16u);
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}