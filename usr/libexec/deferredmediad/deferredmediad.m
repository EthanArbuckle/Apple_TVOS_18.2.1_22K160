uint64_t start()
{
  uint64_t i;
  int v1;
  dispatch_source_s *v2;
  uint64_t v3;
  void v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  v6 = 0LL;
  v7 = &v6;
  v8 = 0x2020000000LL;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000038D4;
  v5[3] = &unk_100004090;
  v5[4] = &v6;
  v5[5] = CFRunLoopGetCurrent();
  _set_user_dir_suffix("com.apple.deferredmediad");
  for (i = 0LL; i != 3; ++i)
  {
    v1 = dword_1000039A0[i];
    signal(v1, (void (__cdecl *)(int))1);
    v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v1, 0LL, &_dispatch_main_q);
    qword_100008000[i] = v2;
    dispatch_source_set_event_handler(v2, v5);
    dispatch_activate(qword_100008000[i]);
  }

  v3 = FigCommonMediaProcessInitialization(9LL, 0LL);
  FigCaptureDeferredPhotoProcessorServerStart(v3);
  while (!*((_BYTE *)v7 + 24))
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  _Block_object_dispose(&v6, 8);
  return 0LL;
}

void sub_1000038B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000038D4(uint64_t a1)
{
  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    CFRunLoopStop(v2);
  }