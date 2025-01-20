LABEL_8:
    v14 = &__NSArray0__struct;
    goto LABEL_9;
  }

  v11 = dispatch_time(0LL, 120000000000LL);
  if (dispatch_semaphore_wait(v6, v11))
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      v13 = "FaceTime logging timed out";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v16, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (!v21[5])
  {
    v14 = &__NSArray0__struct;
    goto LABEL_10;
  }

  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:"));
  v26 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
LABEL_9:

LABEL_10:
  _Block_object_dispose(&v20, 8);

  return v14;
}

void sub_100003ABC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100003AE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003AF8(uint64_t a1)
{
}

void sub_100003B00(uint64_t a1, int a2, void *a3)
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

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}