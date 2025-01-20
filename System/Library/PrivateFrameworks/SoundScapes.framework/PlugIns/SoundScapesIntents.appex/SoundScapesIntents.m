id sub_10000108C()
{
  if (qword_100008B68 != -1) {
    dispatch_once(&qword_100008B68, &stru_1000041E8);
  }
  return (id)qword_100008B60;
}

void sub_1000010CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.soundscapes.intents", "log");
  v2 = (void *)qword_100008B60;
  qword_100008B60 = (uint64_t)v1;
}

void sub_100001658( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000016A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000016B8(uint64_t a1)
{
}

void sub_1000016C0(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = a2;
  uint64_t v9 = *(void *)(a1[5] + 8LL);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8LL);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

void sub_100001CD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (([v5 isEqualToString:SoundScapesErrorDomain] & 1) == 0)
  {

    goto LABEL_8;
  }

  id v6 = [v4 code];

  if (v6 != (id)3)
  {
LABEL_8:
    uint64_t v9 = 4LL;
    goto LABEL_9;
  }

  id v7 = sub_10000108C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000022C8((uint64_t)v4, v8);
  }

  uint64_t v9 = 11LL;
LABEL_9:
  v10 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  v9,  0LL);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000022C8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error sending playbackQueue command %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_updateMediaAffinity_withPlaybackContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMediaAffinity:withPlaybackContext:");
}