id PowerMSSLog()
{
  if (qword_100008158 != -1) {
    dispatch_once(&qword_100008158, &stru_100004130);
  }
  return (id)qword_100008150;
}

void sub_100003380(id a1)
{
  os_log_t v1 = os_log_create("com.apple.DiagnosticExtensions.Microstackshot", "");
  v2 = (void *)qword_100008150;
  qword_100008150 = (uint64_t)v1;
}

LABEL_16:
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, @"endDate");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, @"startDate");
  v10 = PLQueryRegistered(52LL, @"LogFiles", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"microstackshots"]);
    NSLog(@"[DEMicrostackshotExtension] attachmentsForParameters(parameters=%@): %@\n", v3, v13);
    v14 = PowerMSSLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10000392C((uint64_t)v13, v15);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if ([v16 fileExistsAtPath:v13])
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v13));
      [v17 setDeleteOnAttach:&__kCFBooleanTrue];
      [v17 setShouldCompress:&__kCFBooleanTrue];
      v36 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
    }

    else
    {
      v27 = PowerMSSLog();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
        sub_1000038F8((os_log_s *)v17, v28, v29, v30, v31, v32, v33, v34);
      }
      v18 = &__NSArray0__struct;
    }
  }

  else
  {
    v19 = PowerMSSLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000038C4(v13, v20, v21, v22, v23, v24, v25, v26);
    }
    v18 = &__NSArray0__struct;
  }

  return v18;
}

void sub_1000038B4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000038C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000038B4((void *)&_mh_execute_header, a1, a3, "PLQueryRegistered returned empty", a5, a6, a7, a8, 0);
}

void sub_1000038F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000392C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "MSS file path: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_setShouldCompress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCompress:");
}