uint64_t start()
{
  NSAutoreleasePool *v0;
  CertUIRelay *v1;
  v0 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  CertUILoggingInitialize();
  v1 = objc_alloc_init(&OBJC_CLASS___CertUIRelay);
  -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");

  -[NSAutoreleasePool drain](v0, "drain");
  return 0LL;
}
}

void sub_100001460(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000150C;
  v4[3] = &unk_1000042E0;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 showPromptWithCompletion:v4];
}

void sub_10000150C(uint64_t a1, void *a2)
{
  id v9 = a2;
  int8x16_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _relayCenter]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) replyContext]);
  [v3 sendDelayedReply:v4 dictionary:v9];

  [*(id *)(a1 + 32) _registerReply];
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 0;
  if ((unint64_t)[*(id *)(a1 + 48) count] >= 2)
  {
    unint64_t v5 = 1LL;
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectAtIndex:v5]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _relayCenter]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 replyContext]);
      [v7 sendDelayedReply:v8 dictionary:v9];

      [*(id *)(a1 + 32) _registerReply];
      ++v5;
    }

    while ((unint64_t)[*(id *)(a1 + 48) count] > v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 56)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count]) {
    [*(id *)(a1 + 32) _showNextPrompt];
  }
}

void sub_10000244C(const __CFDictionary *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  CFUserNotificationRef v7 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, a1);
  Mutable = (__CFDictionary *)qword_1000085D0;
  if (!qword_1000085D0)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
    qword_1000085D0 = (uint64_t)Mutable;
  }

  id v9 = malloc(0x10uLL);
  *id v9 = a2;
  v9[1] = a3;
  CFDictionaryAddValue(Mutable, v7, v9);
  RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v7,  (CFUserNotificationCallBack)sub_100002598,  0LL);
  Current = CFRunLoopGetCurrent();
  v12 = CFRunLoopCopyCurrentMode(Current);
  CFRunLoopAddSource(Current, RunLoopSource, v12);
  if (v12) {
    CFRelease(v12);
  }
  if (RunLoopSource) {
    CFRelease(RunLoopSource);
  }
}

void sub_100002598(void *key, uint64_t a2)
{
  if (qword_1000085D0)
  {
    Value = (void **)CFDictionaryGetValue((CFDictionaryRef)qword_1000085D0, key);
    if (Value)
    {
      unint64_t v5 = *Value;
      id v6 = Value[1];
      free(Value);
    }

    else
    {
      unint64_t v5 = 0LL;
      id v6 = 0LL;
    }

    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_1000085D0, key);
    if (!CFDictionaryGetCount((CFDictionaryRef)qword_1000085D0))
    {
      CFRelease((CFTypeRef)qword_1000085D0);
      qword_1000085D0 = 0LL;
    }

    if (v5 && v6) {
      [v5 performSelector:v6 withObject:key withObject:a2];
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  if (key) {
    CFRelease(key);
  }
}

id objc_msgSend_trustDigest(void *a1, const char *a2, ...)
{
  return [a1 trustDigest];
}