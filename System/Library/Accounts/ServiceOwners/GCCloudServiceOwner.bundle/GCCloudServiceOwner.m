id sub_1BE8(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) altDSIDForAccount:a2 service:*(void *)(a1 + 40)]);
  v4 = [v3 isEqualToString:*(void *)(a1 + 48)];

  return v4;
}

id sub_1D40(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
  LODWORD(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if ((_DWORD)a1) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

void sub_228C(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_231C;
  v8[3] = &unk_4230;
  id v9 = v3;
  id v7 = v3;
  [v4 signOutService:v5 withContext:v6 completion:v8];
}

uint64_t sub_231C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_2328(uint64_t a1)
{
  return [*(id *)(a1 + 32) authenticateWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t sub_2474(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_26A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_2910(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Unexpectedly found more than one account matching username during sign in. Proceeding with first account.",  v1,  2u);
}

void sub_2950()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "No local player signed into GameCenter, no need to call signOutWithCompletionHandler.",  v0,  2u);
}

id objc_msgSend_utilityServicePrivate(void *a1, const char *a2, ...)
{
  return [a1 utilityServicePrivate];
}