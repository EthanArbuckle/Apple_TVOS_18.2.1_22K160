void sub_100003570(uint64_t a1)
{
  void *v2;
  NSOperationQueue *v3;
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlRequest]);
  +[NSURLConnection sendAsynchronousRequest:queue:completionHandler:]( &OBJC_CLASS___NSURLConnection,  "sendAsynchronousRequest:queue:completionHandler:",  v2,  v3,  *(void *)(a1 + 40));
}

void sub_1000035E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v35 = a3;
  id v8 = a4;
  context = objc_autoreleasePoolPush();
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_100003AF0;
  v49 = sub_100003B00;
  id v50 = 0LL;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_100003AF0;
  v43 = sub_100003B00;
  id v44 = 0LL;
  if (v7)
  {
    id v9 = v7;
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 valueForHTTPHeaderField:@"Location"]);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 valueForHTTPHeaderField:@"Replay-Nonce"]);
    if (v10)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100003B08;
      v38[3] = &unk_100008678;
      v38[4] = &v39;
      sub_100004B8C(v10, (uint64_t)v38);
    }

    if (v11)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100003B3C;
      v37[3] = &unk_100008678;
      v37[4] = &v45;
      sub_100004B8C(v11, (uint64_t)v37);
      v53 = @"Replay-Nonce";
      v54 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      uint64_t v36 = 0LL;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v12,  0LL,  &v36));
    }

    else
    {
      v13 = 0LL;
    }

    id v17 = [v9 statusCode];
    int64_t v18 = (int64_t)v17;
    if (v17 == (id)204 && v13 || v17 == (id)200 || v17 == (id)201 && -[__CFString length](v10, "length"))
    {
      xpc_object_t v14 = 0LL;
      v16 = 0LL;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v18));
      xpc_object_t v14 = xpc_int64_create(v18);
    }

    if (v8)
    {
      if (v16) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }

    if (v16)
    {
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      v52 = v16;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  v18,  v20));

      id v22 = sub_100003B70(v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v22);

      xpc_object_t v23 = 0LL;
      goto LABEL_30;
    }

    v15 = 0LL;
  }

  else
  {
    xpc_object_t v14 = 0LL;
    v13 = 0LL;
    v15 = 0LL;
    v16 = 0LL;
    if (v8)
    {
LABEL_18:
      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
LABEL_19:
      id v19 = sub_100003B70(v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (!v14) {
        xpc_object_t v14 = xpc_int64_create((int64_t)[v8 code]);
      }
    }
  }

  xpc_object_t v23 = 0LL;
  if (v35 && !v16)
  {
    id v24 = [v35 length];
    if (v24) {
      xpc_object_t v23 = xpc_data_create([v35 bytes], (size_t)v24);
    }
    else {
      xpc_object_t v23 = 0LL;
    }
    v16 = 0LL;
  }

LABEL_30:
  if (v13)
  {
    id v25 = v13;
    xpc_object_t v26 = xpc_data_create([v25 bytes], (size_t)objc_msgSend(v25, "length"));
  }

  else
  {
    xpc_object_t v26 = 0LL;
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v28 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  v30 = reply;
  if (reply)
  {
    if (v15) {
      xpc_dictionary_set_value(reply, "AcmeError", v15);
    }
    if (v14) {
      xpc_dictionary_set_value(v30, "AcmeStatus", v14);
    }
    v31 = (void *)v46[5];
    if (v31) {
      xpc_dictionary_set_value(v30, "AcmeNonce", v31);
    }
    v32 = (void *)v40[5];
    if (v32) {
      xpc_dictionary_set_value(v30, "AcmeLocation", v32);
    }
    v33 = v23;
    if (v23 || (v33 = v26) != 0LL) {
      xpc_dictionary_set_value(v30, "AcmeReply", v33);
    }
    xpc_connection_send_message(v28, v30);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  objc_autoreleasePoolPop(context);
}

void sub_100003A9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_100003AF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003B00(uint64_t a1)
{
}

void sub_100003B08(uint64_t a1, char *string)
{
  xpc_object_t v3 = xpc_string_create(string);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100003B3C(uint64_t a1, char *string)
{
  xpc_object_t v3 = xpc_string_create(string);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_100003B70(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:NSUnderlyingErrorKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);

  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:NSErrorFailingURLStringKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:NSLocalizedDescriptionKey]);
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:NSErrorFailingURLStringKey];
  }
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  id v8 = [v1 code];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  v10 = (__CFError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  v8,  v5));
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  Domain = CFErrorGetDomain(v10);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_100006824;
  v27[3] = &unk_100008838;
  v27[4] = v11;
  v27[5] = "domain";
  sub_100004B8C(Domain, (uint64_t)v27);
  int64_t Code = CFErrorGetCode(v10);
  xpc_dictionary_set_int64(v11, "code", Code);
  xpc_object_t v14 = (const __CFString *)CFErrorCopyUserInfo(v10);
  size_t v18 = sub_100005270(v14, 0LL, v15, v16, v17);
  if (v18)
  {
    size_t v19 = v18;
    xpc_object_t v26 = v7;
    v20 = v6;
    v21 = (UInt8 *)malloc(v18);
    unint64_t v22 = (unint64_t)&v21[v19];
    xpc_object_t v23 = (const void *)sub_1000054A0(v14, 0LL, 0LL, v21, v22);
    if (v23) {
      xpc_dictionary_set_data(v11, "userinfo", v23, v22 - (void)v23);
    }
    free(v21);
    v6 = v20;
    id v7 = v26;
  }

  CFRelease(v14);
  id v24 = v11;

  return v24;
}

void sub_100003DE4(void *a1)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x4012000000LL;
  v6 = sub_100003EDC;
  id v7 = sub_100003EF4;
  uint64_t v8 = 256LL;
  id v1 = a1;
  id v9 = v1;
  v4[7] = 0LL;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003EFC;
  handler[3] = &unk_100008650;
  handler[4] = &v3;
  xpc_connection_set_event_handler((xpc_connection_t)v1, handler);
  xpc_connection_set_finalizer_f((xpc_connection_t)v1, (xpc_finalizer_t)j__xpc_transaction_end);
  xpc_transaction_begin();
  xpc_connection_resume((xpc_connection_t)v1);
  _Block_object_dispose(&v3, 8);
}

void sub_100003EBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003EDC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0LL;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = *(void *)(a2 + 56);
  return result;
}

void sub_100003EF4(uint64_t a1)
{
}

void sub_100003EFC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v3 = a2;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_type_t type = xpc_get_type(v3);
  if (*(_DWORD *)(v2 + 60)) {
    goto LABEL_2;
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 != &_xpc_error_termination_imminent) {
      *(_DWORD *)(v2 + 60) = 1;
    }
  }

  else
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_2;
    }
    size_t length = 0LL;
    string = xpc_dictionary_get_string(v3, "operation");
    memset(&v31, 0, sizeof(v31));
    xpc_connection_get_audit_token(v5, &v31);
    if (!string || strcmp(string, "AcmeRequest")) {
      goto LABEL_2;
    }
    audit_token_t token = v31;
    uint64_t v8 = SecTaskCreateWithAuditToken(0LL, &token);
    if (!v8) {
      goto LABEL_12;
    }
    id v9 = v8;
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, @"com.apple.security.app-sandbox", 0LL);
    if (!v10) {
      goto LABEL_11;
    }
    xpc_object_t v11 = v10;
    if (CFEqual(kCFBooleanFalse, v10))
    {
      CFRelease(v11);
LABEL_11:
      CFRelease(v9);
LABEL_12:
      data = (const UInt8 *)xpc_dictionary_get_data(v3, "request", &length);
      v13 = xpc_dictionary_get_string(v3, "url");
      xpc_object_t v14 = xpc_dictionary_get_string(v3, "method");
      xpc_dictionary_get_int64(v3, "state");
      size_t v15 = length;
      id v16 = v3;
      if (v13)
      {
        CFDataRef v17 = CFDataCreate(kCFAllocatorDefault, data, v15);
        *(void *)token.val = _NSConcreteStackBlock;
        *(void *)&token.val[2] = 3221225472LL;
        *(void *)&token.val[4] = sub_1000035E0;
        *(void *)&token.val[6] = &unk_1000086A0;
        id v34 = v16;
        size_t v18 = objc_retainBlock(&token);
        size_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
        else {
          v20 = @"application/json";
        }
        v21 = v17;
        id v22 = v19;
        xpc_object_t v23 = v20;
        id v24 = v18;
        id v25 = objc_autoreleasePoolPush();
        xpc_object_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
        v27 = -[AcmeClient initWithURLString:](objc_alloc(&OBJC_CLASS___AcmeClient), "initWithURLString:", v26);
        -[AcmeClient post:withMethod:contentType:](v27, "post:withMethod:contentType:", v21, v22, v23);
        -[AcmeClient start3:](v27, "start3:", v24);

        objc_autoreleasePoolPop(v25);
      }

      goto LABEL_2;
    }

    CFTypeRef v28 = SecTaskCopyValueForEntitlement(v9, @"com.apple.security.network.client", 0LL);
    if (!v28)
    {
      CFRelease(v11);
      CFRelease(v9);
      goto LABEL_2;
    }

    v29 = v28;
    int v30 = CFEqual(kCFBooleanFalse, v28);
    CFRelease(v29);
    CFRelease(v11);
    CFRelease(v9);
    if (!v30) {
      goto LABEL_12;
    }
  }

LABEL_2:
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = getenv("WAIT4DEBUGGER");
  if (v3)
  {
    if (!strcasecmp("YES", v3))
    {
      syslog(3, "Waiting for debugger");
      pid_t v4 = getpid();
      kill(v4, 17);
    }
  }

  sub_1000042B4();
  sub_100004328();
  xpc_main((xpc_connection_handler_t)sub_100003DE4);
}

size_t sub_1000042B4()
{
  return confstr(65537, v1, 0x400uLL);
}

void sub_100004328()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v1);
  id v3 = (void *)qword_10000C308;
  qword_10000C308 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C308, &stru_1000086E0);
  dispatch_activate((dispatch_object_t)qword_10000C308);
}

void sub_1000043A0(id a1)
{
  id v1 = sub_100004530("acme");
  dispatch_source_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Received signal SIGTERM. Will terminate when clean.",  v3,  2u);
  }

  xpc_transaction_exit_clean();
}

const void *sub_100004410(const __CFString *a1)
{
  if (a1) {
    id v1 = a1;
  }
  else {
    id v1 = @"logging";
  }
  os_unfair_lock_lock_with_options(&unk_10000C310, 0x10000LL);
  Mutable = (const __CFDictionary *)qword_10000C318;
  if (!qword_10000C318)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFCopyStringDictionaryKeyCallBacks, 0LL);
    qword_10000C318 = (uint64_t)Mutable;
  }

  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000LL;
    v5[2] = sub_1000044F4;
    v5[3] = &unk_100008700;
    v5[4] = v1;
    sub_100004B8C(v1, (uint64_t)v5);
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10000C318, v1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10000C310);
  return Value;
}

void sub_1000044F4(uint64_t a1, const char *a2)
{
  dispatch_source_t v2 = (__CFDictionary *)qword_10000C318;
  id v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);
  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_100004530(const char *a1)
{
  if (!a1) {
    return sub_100004410(0LL);
  }
  dispatch_source_t v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
  id v3 = sub_100004410(v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

uint64_t sub_1000045AC(const __CFDictionary *a1, uint64_t a2)
{
  __int128 v3 = xmmword_100007490;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_10000460C, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof(0x2000000000000011LL, *((void *)&v3 + 1));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000460C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)a3)
  {
    result = sub_100004650(result, a2, *(CFTypeRef **)(a3 + 16));
    if (result) {
      *(void *)(a3 + 8) += result;
    }
    else {
      *(_BYTE *)a3 = 0;
    }
  }

  return result;
}

uint64_t sub_100004650(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v5 = sub_100005270(a1, a3);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = sub_100005270(a2, a3);
    if (v10) {
      return ccder_sizeof(0x2000000000000010LL, v10 + v9);
    }
  }

  sub_1000051A8(-6LL, v6, v7, a3, v8, @"null input");
  return 0LL;
}

uint64_t sub_1000046CC(const __CFDictionary *a1, CFTypeRef *a2, char a3, uint64_t a4, uint64_t a5)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  v21[0] = 0xAAAAAAAAAAAAAA01LL;
  v21[1] = a2;
  BYTE1(v21[0]) = a3;
  v21[2] = Mutable;
  v21[3] = 0LL;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_100004834, v21);
  if (!LOBYTE(v21[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0LL;
  }

  v22.size_t length = CFArrayGetCount(Mutable);
  v22.location = 0LL;
  CFArraySortValues(Mutable, v22, (CFComparatorFunction)sub_100004968, 0LL);
  CFIndex Count = CFArrayGetCount(Mutable);
  uint64_t v12 = a5;
  if (Count >= 1)
  {
    unint64_t v13 = Count + 1;
    uint64_t v12 = a5;
    do
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v13 - 2);
      CFIndex Length = CFDataGetLength(ValueAtIndex);
      BytePtr = CFDataGetBytePtr(ValueAtIndex);
      uint64_t v12 = ccder_encode_body(Length, BytePtr, a4, v12);
      --v13;
    }

    while (v13 > 1);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl(0x2000000000000011LL, a5, a4, v12);
  if (!result)
  {
    sub_1000051A8(-7LL, v18, v19, a2, v20, @"ccder failed to encode");
    return 0LL;
  }

  return result;
}

void sub_100004834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)a3)
  {
    CFIndex v6 = sub_100004650(a1, a2, *(CFTypeRef **)(a3 + 8));
    if (!v6)
    {
      *(_BYTE *)a3 = 0;
      return;
    }

    CFIndex v7 = v6;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a3 + 24), v6);
    CFDataSetLength(Mutable, v7);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint64_t v10 = &MutableBytePtr[v7];
    xpc_object_t v11 = *(CFTypeRef **)(a3 + 8);
    uint64_t v12 = *(unsigned __int8 *)(a3 + 1);
    uint64_t v13 = sub_1000054A0(a2, v11, v12, MutableBytePtr, v10);
    uint64_t v14 = sub_1000054A0(a1, v11, v12, MutableBytePtr, v13);
    uint64_t v15 = ccder_encode_constructed_tl(0x2000000000000010LL, v10, MutableBytePtr, v14);
    if (v15)
    {
      v19.size_t length = v15 - (void)MutableBytePtr;
      v19.location = 0LL;
      CFDataDeleteBytes(Mutable, v19);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }

    else
    {
      sub_1000051A8(-7LL, v16, v17, v11, v18, @"ccder failed to encode");
      *(_BYTE *)a3 = 0;
      if (!Mutable) {
        return;
      }
    }

    CFRelease(Mutable);
  }
}

uint64_t sub_100004968(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = -1LL;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1LL;
    }
  }

  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint64_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }

    else
    {
      return 1LL;
    }
  }

uint64_t sub_100004A2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (qword_10000C330 != -1) {
    dispatch_once(&qword_10000C330, &stru_1000087D8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, qword_10000C338);
}

void sub_100004A80(id a1)
{
  qword_10000C338 = (uint64_t)CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
  uint64_t v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)qword_10000C338, v1);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_100004AF0(id a1)
{
  qword_10000C328 = (uint64_t)dispatch_queue_create("ZuluCalendar", 0LL);
}

uint64_t sub_100004B18(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFIndex v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16LL))();
  }

  return result;
}

void sub_100004B8C(const __CFString *a1, uint64_t a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_100004C98;
  v5[3] = &unk_100008778;
  v5[4] = a2;
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    strlen(CStringPtr);
    sub_100004C98((uint64_t)v5);
  }

  else
  {
    CFIndex usedBufLen = 0LL;
    CFIndex Length = CFStringGetLength(a1);
    v8.location = 0LL;
    v8.size_t length = Length;
    CFStringGetBytes(a1, v8, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_100004B18;
    v6[3] = &unk_100008750;
    v6[6] = 0LL;
    v6[7] = Length;
    v6[8] = usedBufLen;
    v6[4] = v5;
    v6[5] = a1;
    sub_1000066D8(usedBufLen + 1, (uint64_t)v6);
  }

uint64_t sub_100004C98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004CA4(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarDecomposeAbsoluteTime( calendar,  *(CFAbsoluteTime *)(a1 + 40),  "yMdHms",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result != 0;
  return result;
}

uint64_t sub_100004D04(const __CFNumber *a1, CFTypeRef *a2)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    unint64_t v6 = HIBYTE(valuePtr);
    if ((HIBYTE(valuePtr) + 1) > 1u)
    {
      uint64_t v12 = 8LL;
    }

    else
    {
      uint64_t v7 = 9LL;
      uint64_t v8 = 48LL;
      uint64_t v9 = 1LL;
      while ((unint64_t)(v7 - 2) >= 2)
      {
        uint64_t v10 = valuePtr >> v8;
        --v7;
        v8 -= 8LL;
        if ((_DWORD)v6 != v10)
        {
          uint64_t v9 = v7 - 1;
          goto LABEL_10;
        }
      }

      uint64_t v7 = 2LL;
LABEL_10:
      else {
        uint64_t v12 = v9;
      }
    }

    return ccder_sizeof(2LL, v12);
  }

  else
  {
    sub_1000051A8(-4LL, v3, v4, a2, v5, @"Unable to get number from data");
    return 0LL;
  }

uint64_t sub_100004DD4(const __CFNumber *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (!CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    sub_1000051A8(-4LL, v7, v8, a2, v9, @"Unable to get number from data");
    return 0LL;
  }

  uint64_t v10 = valuePtr;
  unint64_t v11 = HIBYTE(valuePtr);
  if ((HIBYTE(valuePtr) + 1) > 1u)
  {
    uint64_t v16 = 8LL;
    if (!a4) {
      goto LABEL_22;
    }
  }

  else
  {
    uint64_t v12 = 9LL;
    uint64_t v13 = 48LL;
    uint64_t v14 = 1LL;
    while ((unint64_t)(v12 - 2) >= 2)
    {
      uint64_t v15 = valuePtr >> v13;
      --v12;
      v13 -= 8LL;
      if ((_DWORD)v11 != v15)
      {
        uint64_t v14 = v12 - 1;
        goto LABEL_11;
      }
    }

    uint64_t v12 = 2LL;
LABEL_11:
    else {
      uint64_t v16 = v14;
    }
    if (!a4) {
      goto LABEL_22;
    }
  }

  if (a4 - a3 < v16)
  {
LABEL_22:
    sub_1000051A8(-3LL, v16, v8, a2, v9, @"Unknown size");
    return 0LL;
  }

  else {
    uint64_t v17 = v16;
  }
  do
  {
    *(_BYTE *)--a4 = v10;
    v10 >>= 8;
    --v17;
  }

  while (v17);
  uint64_t valuePtr = v10;
  uint64_t result = ccder_encode_tl(2LL);
  if (!result)
  {
    sub_1000051A8(-7LL, v19, v20, a2, v21, @"ccder failed to encode");
    return 0LL;
  }

  return result;
}

void sub_100004F0C( CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return;
  }
  if (*a4)
  {
    if (cf)
    {
      if (*a4 != cf) {
        CFRelease(cf);
      }
    }

    return;
  }

  uint64_t v10 = CFStringCreateWithFormatAndArguments(0LL, 0LL, format, arguments);
  uint64_t v28 = 0LL;
  if (!cf) {
    goto LABEL_28;
  }
  unint64_t v11 = CFErrorCopyUserInfo((CFErrorRef)cf);
  Value = (const __CFString *)CFDictionaryGetValue(v11, kCFErrorDescriptionKey);
  if (Value)
  {
    BOOL v13 = CFStringCompare(v10, Value, 0LL) == kCFCompareEqualTo;
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  BOOL v13 = 0;
  if (v11) {
LABEL_9:
  }
    CFRelease(v11);
LABEL_10:
  CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
  Domain = CFErrorGetDomain((CFErrorRef)cf);
  CFComparisonResult v16 = CFStringCompare(a2, Domain, 0LL);
  BOOL v18 = Code == a1 && v16 == kCFCompareEqualTo && v13;
  uint64_t v19 = cf;
  if (v18) {
    goto LABEL_17;
  }
  uint64_t v21 = CFErrorCopyUserInfo((CFErrorRef)cf);
  if (v21)
  {
    CFRange v22 = v21;
    xpc_object_t v23 = (const void *)kSOSCountKey;
    if (CFDictionaryContainsKey(v21, kSOSCountKey) == 1)
    {
      id v24 = (const __CFNumber *)CFDictionaryGetValue(v22, v23);
      if (v24)
      {
        uint64_t valuePtr = 0LL;
        CFNumberGetValue(v24, kCFNumberLongType, &valuePtr);
        if (valuePtr > 199)
        {
          CFRelease(v22);
          uint64_t v19 = cf;
LABEL_17:
          CFRetain(v19);
          *a4 = cf;
          CFRelease(cf);
          if (!v10) {
            return;
          }
          uint64_t v20 = v10;
          goto LABEL_42;
        }

        uint64_t v28 = valuePtr + 1;
      }
    }

    CFRelease(v22);
  }

LABEL_28:
  CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v28);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v27 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, cf);
  }
  if (v25) {
    CFDictionaryAddValue(v27, kSOSCountKey, v25);
  }
  if (v10) {
    CFDictionaryAddValue(v27, kCFErrorDescriptionKey, v10);
  }
  *a4 = CFErrorCreate(kCFAllocatorDefault, a2, a1, v27);
  if (v25) {
    CFRelease(v25);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (cf)
  {
    uint64_t v20 = cf;
LABEL_42:
    CFRelease(v20);
  }

void sub_1000051A8(CFIndex a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
}

void sub_1000051E0( uint64_t a1, __CFString **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeRef cf = 0LL;
  if (a2)
  {
    sub_100004F0C(-1LL, kCFErrorDomainOSStatus, *a2, &cf, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", &a9);
    *a2 = (__CFString *)cf;
  }

  else
  {
    sub_100004F0C(-1LL, kCFErrorDomainOSStatus, 0LL, &cf, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", &a9);
    CFTypeRef v10 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v10);
    }
  }

uint64_t sub_100005270(const __CFString *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    sub_1000051A8(-5LL, (uint64_t)a2, a3, a2, a5, @"Null CFType");
    return 0LL;
  }

  CFTypeID v7 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() != v7)
  {
    if (CFBooleanGetTypeID() == v7) {
      return ccder_sizeof(1LL, 1LL);
    }
    if (CFDataGetTypeID() == v7)
    {
      CFIndex Length = CFDataGetLength((CFDataRef)a1);
      return ccder_sizeof_raw_octet_string(Length);
    }

    if (CFDateGetTypeID() == v7)
    {
      double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a1);
      int v24 = -1431655766;
      int v25 = -1431655766;
      unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v17 = __dtoa(0LL, 0LL, &v25, &v24, &v23, AbsoluteTime);
      int64_t v18 = v23 - v17;
      __freedtoa();
      int64_t v19 = v18 - v25;
      if (v18 < v25) {
        int64_t v19 = 0LL;
      }
      if (v19) {
        uint64_t v15 = v19 + 16;
      }
      else {
        uint64_t v15 = 15LL;
      }
      uint64_t v14 = 24LL;
      return ccder_sizeof(v14, v15);
    }

    if (CFDictionaryGetTypeID() == v7) {
      return sub_1000045AC((const __CFDictionary *)a1, (uint64_t)a2);
    }
    if (CFSetGetTypeID() == v7) {
      return sub_100006334((const __CFSet *)a1, (uint64_t)a2);
    }
    if (CFStringGetTypeID() == v7) {
      return sub_10000617C(a1);
    }
    if (CFNumberGetTypeID() == v7) {
      return sub_100004D04((const __CFNumber *)a1, a2);
    }
    if (CFNullGetTypeID() == v7) {
      return ccder_sizeof(5LL, 0LL);
    }
    sub_1000051A8(-5LL, v20, v21, a2, v22, @"Unsupported CFType");
    return 0LL;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
  if (Count < 1)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = Count + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v10 - 2);
      v9 += sub_100005270(ValueAtIndex, a2);
      --v10;
    }

    while (v10 > 1);
  }

  uint64_t v14 = 0x2000000000000010LL;
  uint64_t v15 = v9;
  return ccder_sizeof(v14, v15);
}

uint64_t sub_1000054A0(const __CFString *a1, CFTypeRef *a2, uint64_t a3, UInt8 *a4, unint64_t a5)
{
  if (!a1)
  {
    sub_1000051A8(-5LL, (uint64_t)a2, a3, a2, a5, @"Null CFType");
    return 0LL;
  }

  CFTypeID v10 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v10)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    uint64_t v12 = a5;
    if (Count >= 1)
    {
      unint64_t v13 = Count + 1;
      uint64_t v12 = a5;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v13 - 2);
        uint64_t v12 = sub_1000054A0(ValueAtIndex, a2, a3, a4, v12);
        --v13;
      }

      while (v13 > 1);
    }

    uint64_t v15 = 0x2000000000000010LL;
    unint64_t v16 = a5;
    uint64_t v17 = a4;
    uint64_t v18 = v12;
    goto LABEL_7;
  }

  if (CFBooleanGetTypeID() == v10)
  {
    buf[0] = CFBooleanGetValue((CFBooleanRef)a1);
    ccder_encode_body(1LL, buf, a4, a5);
    uint64_t v24 = 1LL;
LABEL_14:
    uint64_t v19 = ccder_encode_tl(v24);
LABEL_15:
    uint64_t v23 = v19;
    if (!v19) {
      sub_1000051A8(-7LL, v20, v21, a2, v22, @"ccder failed to encode");
    }
    return v23;
  }

  if (CFDataGetTypeID() == v10)
  {
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    ccder_encode_body(Length, BytePtr, a4, a5);
    uint64_t v24 = 4LL;
    goto LABEL_14;
  }

  if (CFDateGetTypeID() == v10)
  {
    double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a1);
    uint64_t v98 = 0LL;
    uint64_t v99 = 0LL;
    uint64_t v97 = 0LL;
    v100 = 0LL;
    v101 = &v100;
    uint64_t v102 = 0x2000000000LL;
    char v103 = -86;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 0x40000000LL;
    *(void *)&buf[16] = sub_100004CA4;
    v105 = &unk_100008800;
    v106 = &v100;
    double v107 = AbsoluteTime;
    v108 = (char *)&v99 + 4;
    v109 = &v99;
    v110 = (char *)&v98 + 4;
    v111 = &v98;
    v112 = (char *)&v97 + 4;
    v113 = &v97;
    if (qword_10000C320 != -1) {
      dispatch_once(&qword_10000C320, &stru_100008798);
    }
    *(void *)&__int128 block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 0x40000000LL;
    v115 = sub_100004A2C;
    v116 = &unk_100008728;
    v117 = buf;
    dispatch_sync((dispatch_queue_t)qword_10000C328, &block);
    if (*((_BYTE *)v101 + 24))
    {
      _Block_object_dispose(&v100, 8);
    }

    else
    {
      sub_1000051A8(-1LL, v29, v30, a2, v31, @"Failed to encode date.");
      int v39 = *((unsigned __int8 *)v101 + 24);
      _Block_object_dispose(&v100, 8);
      if (!v39)
      {
        id v44 = (os_log_s *)sub_100004530("SecError");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          if (a2) {
            CFTypeRef v45 = *a2;
          }
          else {
            CFTypeRef v45 = 0LL;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "der: unable to encode date: %@",  buf,  0xCu);
        }

        goto LABEL_109;
      }
    }

    CFErrorRef err = 0LL;
    int v40 = HIDWORD(v99);
    if ((v99 & 0x300000000LL) != 0)
    {
      BOOL v41 = 0LL;
    }

    else
    {
      HIDWORD(v42) = -1030792151 * HIDWORD(v99) + 85899344;
      LODWORD(v42) = HIDWORD(v42);
      if ((v42 >> 2) <= 0x28F5C28)
      {
        HIDWORD(v46) = -1030792151 * HIDWORD(v99) + 85899344;
        LODWORD(v46) = HIDWORD(v46);
        BOOL v41 = (v46 >> 4) < 0xA3D70B;
      }

      else
      {
        BOOL v41 = 1LL;
      }
    }

    int v48 = HIDWORD(v98);
    int v47 = v99;
    int v49 = HIDWORD(v97);
    if ((int)v97 <= 61
      && SHIDWORD(v97) <= 59
      && (int)v98 <= 23
      && (v99 - 13) >= 0xFFFFFFF4
      && (HIDWORD(v98) - 32) >= 0xFFFFFFE1
      && ((_DWORD)v99 != 2 || (v41 | 0x1C) >= HIDWORD(v98)))
    {
      if ((_DWORD)v99 == 2)
      {
        int v47 = 2;
        goto LABEL_77;
      }

      if (dword_1000074E8[v99] - dword_1000074E8[(v99 - 1)] >= SHIDWORD(v98))
      {
LABEL_77:
        if ((unint64_t)(a4 + 1) <= a5)
        {
          *(_BYTE *)(a5 - 1) = 90;
          unint64_t v61 = a5 - 1;
        }

        else
        {
          unint64_t v61 = 0LL;
        }

        int v94 = v98;
        int v95 = v97;
        LODWORD(block) = -1431655766;
        LODWORD(v100) = -1431655766;
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v62 = __dtoa(0LL, 0LL, &block, &v100, buf, AbsoluteTime);
        uint64_t v63 = v62;
        int v64 = block;
        uint64_t v65 = *(void *)buf;
        if (AbsoluteTime < 0.0)
        {
          unint64_t v66 = v62 + (block & ~((int)block >> 31));
          if (v66 < *(void *)buf)
          {
            v67 = (_BYTE *)(*(void *)buf - 1LL);
          }

          int v64 = block;
          uint64_t v65 = *(void *)buf;
        }

        uint64_t v69 = v65 - v62;
        if (v65 - v63 <= v64) {
          goto LABEL_100;
        }
        if (v64 < 0)
        {
          int v93 = v40;
          uint64_t v70 = ccder_encode_body(v69, v63, a4, v61);
          size_t v71 = -(uint64_t)(int)block;
          v72 = (void *)ccder_encode_body_nocopy(v71, a4, v70);
          unint64_t v61 = (unint64_t)v72;
          if (!v72)
          {
            int v40 = v93;
LABEL_100:
            __freedtoa(v63);
            if (v61)
            {
              unint64_t v80 = (unint64_t)(a4 + 2);
              if ((unint64_t)(a4 + 2) <= v61)
              {
                *(_BYTE *)(v61 - 2) = v95 / 10 + 48;
                *(_BYTE *)(v61 - 1) = v95 % 10 + 48;
                if (v80 <= v61 - 2)
                {
                  *(_BYTE *)(v61 - 4) = v49 / 10 + 48;
                  *(_BYTE *)(v61 - 3) = v49 % 10 + 48;
                  if (v80 <= v61 - 4)
                  {
                    *(_BYTE *)(v61 - 6) = v94 / 10 + 48;
                    *(_BYTE *)(v61 - 5) = v94 % 10 + 48;
                    if (v80 <= v61 - 6)
                    {
                      *(_BYTE *)(v61 - 8) = v48 / 10 + 48;
                      *(_BYTE *)(v61 - 7) = v48 % 10 + 48;
                      if (v80 <= v61 - 8)
                      {
                        *(_BYTE *)(v61 - 10) = v47 / 10 + 48;
                        *(_BYTE *)(v61 - 9) = v47 % 10 + 48;
                        if (v80 <= v61 - 10)
                        {
                          unsigned int v81 = (((103 * (v40 % 100)) >> 15) & 1) + ((103 * (v40 % 100)) >> 10);
                          *(_BYTE *)(v61 - 12) = v81 + 48;
                          *(_BYTE *)(v61 - 11) = v40 % 100 - 10 * v81 + 48;
                          if (v80 <= v61 - 12)
                          {
                            *(_BYTE *)(v61 - 14) = v40 / 1000 + 48;
                            unint64_t v82 = v61 - 14;
                            *(_BYTE *)(v82 + 1) = v40 / 100 % 10 + 48;
                            goto LABEL_110;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }

            sub_1000051A8(-7LL, v77, v78, a2, v79, @"ccder failed to encode");
LABEL_109:
            unint64_t v82 = 0LL;
LABEL_110:
            uint64_t v15 = 24LL;
            unint64_t v16 = a5;
            uint64_t v17 = a4;
            uint64_t v18 = v82;
LABEL_7:
            uint64_t v19 = ccder_encode_constructed_tl(v15, v16, v17, v18);
            goto LABEL_15;
          }

          if (AbsoluteTime >= 0.0) {
            int v73 = 48;
          }
          else {
            int v73 = 57;
          }
          memset(v72, v73, v71);
          int v40 = v93;
        }

        else
        {
          unint64_t v61 = ccder_encode_body(v69 - v64, v63 + v64, a4, v61);
        }

        else {
          unint64_t v61 = 0LL;
        }
        goto LABEL_100;
      }
    }

    uint64_t v91 = v97;
    BOOL v92 = v41;
    uint64_t v89 = v98;
    uint64_t v90 = HIDWORD(v97);
    uint64_t v87 = v99;
    uint64_t v88 = HIDWORD(v98);
    sub_1000051E0(v32, (__CFString **)&err, v33, v34, v35, v36, v37, v38, SBYTE4(v99));
    id v50 = (__CFString *)CFErrorCopyDescription(err);
    NSErrorUserInfoKey v51 = sub_100004530("SecError");
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091842;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Simulating crash, reason: %@, code=%08x",  buf,  0x12u);
    }

    int v53 = dword_10000C300;
    if (dword_10000C300 == -1)
    {
      if (!qword_10000C340)
      {
        *(_OWORD *)buf = off_100008820;
        *(void *)&buf[16] = 0LL;
        qword_10000C340 = _sl_dlopen(buf, 0LL);
      }

      if (qword_10000C340)
      {
        uint64_t v54 = getpid();
        v55 = v50;
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        v56 = off_10000C348;
        v105 = off_10000C348;
        if (!off_10000C348)
        {
          v100 = 0LL;
          if (!qword_10000C340)
          {
            __int128 block = off_100008820;
            v115 = 0LL;
            qword_10000C340 = _sl_dlopen(&block, &v100);
          }

          v57 = (void *)qword_10000C340;
          if (!qword_10000C340) {
            goto LABEL_117;
          }
          if (v100) {
            free(v100);
          }
          v56 = dlsym(v57, "SimulateCrash");
          *(void *)(*(void *)&buf[8] + 24LL) = v56;
          off_10000C348 = v56;
        }

        _Block_object_dispose(buf, 8);
        if (!v56)
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"));
          objc_msgSend( v83,  "handleFailureInFunction:file:lineNumber:description:",  v84,  @"simulate_crash.m",  22,  @"%s",  dlerror(),  v87,  v88,  v89,  v90,  v91,  v92);

          while (1)
          {
            __break(1u);
LABEL_117:
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CrashReporterSupportLibrary(void)"));
            objc_msgSend( v85,  "handleFailureInFunction:file:lineNumber:description:",  v86,  @"simulate_crash.m",  18,  @"%s",  v100);
          }
        }

        ((void (*)(uint64_t, uint64_t, __CFString *))v56)(v54, 1405091842LL, v55);

        goto LABEL_66;
      }

      int v53 = dword_10000C300;
    }

    dword_10000C300 = v53 + 1;
LABEL_66:
    if (v50) {
      CFRelease(v50);
    }
    v58 = (os_log_s *)sub_100004530("SecError");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = "continuing";
      if ((_DWORD)a3) {
        v59 = "setting default value";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = err;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "der: invalid date: %@; %s", buf, 0x16u);
    }

    CFErrorRef v60 = err;
    if (err)
    {
      CFErrorRef err = 0LL;
      CFRelease(v60);
    }

    if ((a3 & 1) != 0)
    {
      int v40 = 2001;
      int v49 = 1;
      uint64_t v99 = 0x7D100000001LL;
      HIDWORD(v98) = 1;
      HIDWORD(v97) = 1;
      int v48 = 1;
      int v47 = 1;
    }

    else
    {
      int v47 = v99;
      int v40 = HIDWORD(v99);
      int v48 = HIDWORD(v98);
      int v49 = HIDWORD(v97);
    }

    goto LABEL_77;
  }

  if (CFDictionaryGetTypeID() == v10) {
    return sub_1000046CC((const __CFDictionary *)a1, a2, a3, (uint64_t)a4, a5);
  }
  if (CFSetGetTypeID() == v10) {
    return sub_1000063D8((const __CFSet *)a1, a2, a3, (uint64_t)a4, a5);
  }
  if (CFStringGetTypeID() == v10) {
    return sub_1000061F8(a1, a2, a4, a5, v43);
  }
  if (CFNumberGetTypeID() == v10) {
    return sub_100004DD4((const __CFNumber *)a1, a2, (uint64_t)a4, a5);
  }
  if (CFNullGetTypeID() != v10)
  {
    sub_1000051A8(-5LL, v74, v75, a2, v76, @"Unsupported CFType");
    return 0LL;
  }

  return sub_1000062E4(a2);
}

void sub_10000615C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10000617C(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0LL;
  v7.location = 0LL;
  v7.size_t length = Length;
  if (CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0LL, MaximumSizeForEncoding, &usedBufLen) == Length) {
    CFIndex v4 = usedBufLen;
  }
  else {
    CFIndex v4 = 0LL;
  }
  return ccder_sizeof(12LL, v4);
}

uint64_t sub_1000061F8(const __CFString *a1, CFTypeRef *a2, UInt8 *a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex usedBufLen = 0LL;
    v18.location = 0LL;
    v18.size_t length = Length;
    if (CFStringGetBytes(a1, v18, 0x8000100u, 0, 0, a3, a4 - (void)a3, &usedBufLen) == Length)
    {
      ccder_encode_body(usedBufLen, a3, a3, a4);
      uint64_t result = ccder_encode_tl(12LL);
      if (result) {
        return result;
      }
      sub_1000051A8(-7LL, v14, v15, a2, v16, @"ccder failed to encode");
    }

    else
    {
      sub_1000051A8(-5LL, v10, v11, a2, v12, @"String extraction failed");
    }
  }

  else
  {
    sub_1000051A8(-6LL, (uint64_t)a2, (uint64_t)a3, a2, a5, @"null input");
  }

  return 0LL;
}

uint64_t sub_1000062E4(CFTypeRef *a1)
{
  uint64_t v5 = ccder_encode_tl(5LL);
  if (!v5) {
    sub_1000051A8(-7LL, v2, v3, a1, v4, @"ccder failed to encode");
  }
  return v5;
}

uint64_t sub_100006334(const __CFSet *a1, uint64_t a2)
{
  __int128 v3 = xmmword_100007490;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100006394, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof(0xC000000000000011LL, *((void *)&v3 + 1));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100006394(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)a2)
  {
    uint64_t result = sub_100005270(result, *(void *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) += result;
    }
    else {
      *(_BYTE *)a2 = 0;
    }
  }

  return result;
}

uint64_t sub_1000063D8(const __CFSet *a1, CFTypeRef *a2, char a3, uint64_t a4, uint64_t a5)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  v21[0] = 0xAAAAAAAAAAAAAA01LL;
  v21[1] = a2;
  BYTE1(v21[0]) = a3;
  v21[2] = Mutable;
  v21[3] = 0LL;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100006540, v21);
  if (!LOBYTE(v21[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0LL;
  }

  v22.size_t length = CFArrayGetCount(Mutable);
  v22.location = 0LL;
  CFArraySortValues(Mutable, v22, (CFComparatorFunction)sub_100006614, 0LL);
  CFIndex Count = CFArrayGetCount(Mutable);
  uint64_t v12 = a5;
  if (Count >= 1)
  {
    unint64_t v13 = Count + 1;
    uint64_t v12 = a5;
    do
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v13 - 2);
      CFIndex Length = CFDataGetLength(ValueAtIndex);
      BytePtr = CFDataGetBytePtr(ValueAtIndex);
      uint64_t v12 = ccder_encode_body(Length, BytePtr, a4, v12);
      --v13;
    }

    while (v13 > 1);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl(0xC000000000000011LL, a5, a4, v12);
  if (!result)
  {
    sub_1000051A8(-7LL, v18, v19, a2, v20, @"ccder failed to encode");
    return 0LL;
  }

  return result;
}

void sub_100006540(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_BYTE *)a2)
  {
    CFIndex v7 = sub_100005270(a1, *(CFTypeRef **)(a2 + 8), a3, a4, a5);
    if (!v7)
    {
      *(_BYTE *)a2 = 0;
      return;
    }

    CFIndex v8 = v7;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a2 + 24), v7);
    CFDataSetLength(Mutable, v8);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint64_t v11 = sub_1000054A0(a1, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 1), MutableBytePtr, &MutableBytePtr[v8]);
    if (v11)
    {
      v12.size_t length = v11 - (void)MutableBytePtr;
      v12.location = 0LL;
      CFDataDeleteBytes(Mutable, v12);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }

    else
    {
      *(_BYTE *)a2 = 0;
      if (!Mutable) {
        return;
      }
    }

    CFRelease(Mutable);
  }

uint64_t sub_100006614(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = -1LL;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1LL;
    }
  }

  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint64_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }

    else
    {
      return 1LL;
    }
  }

void sub_1000066D8(size_t __size, uint64_t a2)
{
  if (__size)
  {
    if (__size > 0x800)
    {
      uint64_t v4 = malloc(__size);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, __size, v4);
      if (v4) {
        free(v4);
      }
    }

    else
    {
      __chkstk_darwin();
      memset((char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL), 170, __size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))( a2,  __size,  (char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
  }

void sub_100006824(uint64_t a1, char *string)
{
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}