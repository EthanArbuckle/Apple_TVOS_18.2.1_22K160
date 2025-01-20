void sub_2368(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v8;
  if (a4)
  {
    v8 = objc_autoreleasePoolPush();
    if (a1 == 2)
    {
      [a4 removeClient:a2];
    }

    else if (a1 == 1)
    {
      [a4 addClient:a2 eventMatchDict:a3];
    }

    objc_autoreleasePoolPop(v8);
  }
}

void EAMatchingPlugin_Initialize()
{
  v0 = objc_autoreleasePoolPush();
  xpc_event_module_get_aslclient();
}

void xpc_event_module_get_aslclient()
{
  while (1)
    ;
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}