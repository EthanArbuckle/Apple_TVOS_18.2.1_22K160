void sub_100002B0C(id a1)
{
  UIFoundationBundleHelper *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___UIFoundationBundleHelper);
  v2 = (void *)qword_100008978;
  qword_100008978 = (uint64_t)v1;
}

void sub_100002B74(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UIFoundationBundleHelper));
  v2 = (void *)qword_100008988;
  qword_100008988 = v1;
}

LABEL_19:
  v9[2](v9, v10, v12);
}

void sub_1000031E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_100003200(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kTCCInfoService]);
  unsigned int v7 = [v6 isEqualToString:kTCCServicePhotos];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kTCCInfoGranted]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 BOOLValue];

    *a4 = 1;
  }
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___UIFoundationBundleHelperListenerDelegate, argv, envp);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 1;
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}