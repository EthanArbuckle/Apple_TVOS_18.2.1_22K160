void ADEventModuleInitializer()
{
  void *v0;
  ADEventListener *v1;
  if (!qword_5060)
  {
    v0 = objc_autoreleasePoolPush();
    v1 = objc_alloc(&OBJC_CLASS___ADEventListener);
    xpc_event_module_get_queue();
  }
}

id sub_2174(uint64_t a1, uint64_t a2)
{
  v4 = (os_log_s *)gADEventListenerLogObject;
  if (os_log_type_enabled((os_log_t)gADEventListenerLogObject, OS_LOG_TYPE_DEBUG)) {
    sub_2DDC(a2, v4);
  }
  return [*(id *)(a1 + 32) applicationStateChanged:a2];
}

void sub_21D0(uint64_t a1)
{
  v2 = (os_log_s *)gADEventListenerLogObject;
  if (os_log_type_enabled((os_log_t)gADEventListenerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "dumping session data:\nActive:\n%@", (uint8_t *)&v4, 0xCu);
  }

void sub_24CC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v3)
  {
    id v3 = -[ADBundleSession initBundle:](objc_alloc(&OBJC_CLASS___ADBundleSession), "initBundle:", *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  [v3 updateState:*(unsigned int *)(a1 + 56) at:*(unsigned int *)(a1 + 60) fromPid:*(double *)(a1 + 48)];
  objc_autoreleasePoolPop(v2);
}

LABEL_43:
  self->appstate.state = v7;
  self->appstate.abs_time = a4;
}

void sub_2DDC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_0,  a2,  OS_LOG_TYPE_DEBUG,  "appStateMonitor's handler was called with %@",  (uint8_t *)&v2,  0xCu);
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_updateState_at_fromPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:at:fromPid:");
}