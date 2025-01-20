id TITypologyDiagnosticExtensionOSLogFacility()
{
  if (qword_1000081C8 != -1) {
    dispatch_once(&qword_1000081C8, &stru_100004148);
  }
  return (id)qword_1000081C0;
}

void sub_100002A10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TextInput", "TITypologyDiagnosticExtension");
  v2 = (void *)qword_1000081C0;
  qword_1000081C0 = (uint64_t)v1;
}

void sub_100002ADC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
  id v9 = 0LL;
  [v4 removeItemAtURL:v5 error:&v9];
  id v6 = v9;

  if (v6)
  {
    id v7 = TITypologyDiagnosticExtensionOSLogFacility();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000302C(v3);
    }
  }
}

void sub_100002D00(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]);
  unsigned int v6 = [v5 isEqualToString:@"log"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
    id v23 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v7,  4LL,  &v23));
    id v9 = v23;

    id v10 = TITypologyDiagnosticExtensionOSLogFacility();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v12) {
        sub_1000033E0(v3);
      }

      v13 = *(void **)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:v15]);

      v16 = *(void **)(a1 + 40);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
      id v22 = v9;
      [v16 copyItemAtURL:v17 toURL:v11 error:&v22];
      id v18 = v22;

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v11));
      [v19 setDeleteOnAttach:&off_100004308];
      id v20 = TITypologyDiagnosticExtensionOSLogFacility();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1000032DC(v19, v21);
      }

      [*(id *)(a1 + 48) addObject:v19];
      id v9 = v18;
    }

    else if (v12)
    {
      sub_100003220(v3);
    }
  }
}

void sub_100002FF0( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
}

  ;
}

  ;
}

  ;
}

void sub_10000302C(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 url]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 lastPathComponent]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s failed to delete %@ from datavault"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v4,  v5,  "%@",  v6,  v7,  v8,  v9,  (uint64_t)"-[TypologyDiagnosticExtension cleanupDatavault]_block_invoke",  (uint64_t)v2,  v10);

  sub_100003010();
}

void sub_1000030E8(void *a1)
{
  id v8 = [a1 count];
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s total attachments: %lu"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v2,  v3,  "%@",  v4,  v5,  v6,  v7,  (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]",  (uint64_t)v8,  v9);

  sub_100003004();
}

void sub_100003184()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s %@"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v1,  v2,  "%@",  v3,  v4,  v5,  v6,  (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]",  (uint64_t)@"attachmentsForParameters called",  v7);

  sub_100003004();
}

void sub_100003220(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 url]);
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 lastPathComponent]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s unable to access %@ from datavault"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v4,  v5,  "%@",  v6,  v7,  v8,  v9,  (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]_block_invoke",  (uint64_t)v2,  v10);

  sub_100003010();
}

void sub_1000032DC(void *a1, os_log_s *a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 modificationDate]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a1 deleteOnAttach]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s adding attachment with path %@ and date %@ and deleteOnAttach %@",  "-[TypologyDiagnosticExtension attachmentsForParameters:]_block_invoke",  v4,  v5,  v6));
  *(_DWORD *)buf = 138412290;
  int v9 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_1000033E0(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 url]);
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 lastPathComponent]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s accessing %@ from datavault"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v4,  v5,  "%@",  v6,  v7,  v8,  v9,  (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]_block_invoke",  (uint64_t)v2,  v10);

  sub_100003010();
}

void sub_10000349C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s %@"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v1,  v2,  "%@",  v3,  v4,  v5,  v6,  (uint64_t)"-[TypologyDiagnosticExtension setupWithParameters:]",  (uint64_t)@"setupWithParameters called",  v7);

  sub_100003004();
}

void sub_100003538()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s %@"));
  sub_100003020();
  sub_100002FF0( (void *)&_mh_execute_header,  v1,  v2,  "%@",  v3,  v4,  v5,  v6,  (uint64_t)"-[TypologyDiagnosticExtension teardownWithParameters:]",  (uint64_t)@"teardownWithParameters called",  v7);

  sub_100003004();
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}