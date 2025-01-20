void init_gestalt_plugin()
{
  xpc_event_provider_create();
}

void sub_35F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (qword_42E0 != -1) {
    dispatch_once(&qword_42E0, &stru_4148);
  }
  if (a1 == 2)
  {
    v11 = (void *)qword_42D8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

    if (v8)
    {
      MGCancelNotifications([v8 pointerValue]);
      v13 = (void *)qword_42D8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a2));
      [v13 removeObjectForKey:v14];
    }

    goto LABEL_21;
  }

  if (a1 == 1)
  {
    xpc_object_t value = xpc_dictionary_get_value(v5, "Queries");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    v8 = v7;
    if (!v7)
    {
      v17 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m",  47);
      if (v17) {
        v18 = v17 + 1;
      }
      else {
        v18 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
      }
      NSLog(&cfstr_SDNoQueriesSpe.isa, v18, 16LL);
      goto LABEL_21;
    }

    if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_array)
    {
      v9 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m",  47);
      if (v9) {
        v10 = v9 + 1;
      }
      else {
        v10 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
      }
      NSLog(&cfstr_SDQueriesValue.isa, v10, 21LL);
LABEL_21:

      goto LABEL_22;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    size_t count = xpc_array_get_count(v8);
    if (count)
    {
      size_t v21 = count;
      for (size_t i = 0LL; i != v21; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
          [v19 addObject:v24];
        }

        else
        {
          v25 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m",  47);
          if (v25) {
            v26 = v25 + 1;
          }
          else {
            v26 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
          }
          NSLog(&cfstr_SDIllegalQuery.isa, v26, 30LL, i);
        }
      }
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);

    if (v27)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_39AC;
      v36[3] = &unk_4168;
      v36[4] = a2;
      uint64_t v30 = MGRegisterForBulkUpdates(v27, 0LL, v29, v36);

      if (v30 == -1)
      {
        v34 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m",  47);
        if (v34) {
          v35 = v34 + 1;
        }
        else {
          v35 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
        }
        NSLog(&cfstr_SDMgregisterfo.isa, v35, 66LL);
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v30));
        v32 = (void *)qword_42D8;
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a2));
        [v32 setObject:v31 forKeyedSubscript:v33];
      }
    }
  }

  else
  {
    v15 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m",  47);
    if (v15) {
      v16 = v15 + 1;
    }
    else {
      v16 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
    }
    NSLog(&cfstr_SDUnknownActio.isa, v16, 85LL, a1);
  }

LABEL_22:
}

uint64_t sub_3978()
{
  return notify_post("com.apple.MobileGestalt.LocaleChanged");
}

void sub_3984(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v2 = (void *)qword_42D8;
  qword_42D8 = (uint64_t)v1;
}

void sub_39AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a2) {
    [v5 setObject:a2 forKeyedSubscript:@"ChangedQuestions"];
  }
  if (a3) {
    [v5 setObject:a3 forKeyedSubscript:@"AdditionalInfo"];
  }
  _CFXPCCreateXPCObjectFromCFObject();
  xpc_event_provider_token_fire();
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

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}