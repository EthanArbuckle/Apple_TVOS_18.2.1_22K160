void sub_100003A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003A44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003A54(uint64_t a1)
{
}

void sub_100003A5C(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if (a2)
  {
    uint64_t v5 = DLCLogPathKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:DLCLogPathKey]);

    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v5]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003AF0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100003B00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003B34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}