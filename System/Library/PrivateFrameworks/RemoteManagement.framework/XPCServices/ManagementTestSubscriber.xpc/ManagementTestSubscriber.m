int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  v8 = objc_opt_class(&OBJC_CLASS___ManagementTestApplicator, argv, envp);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  v6 = +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:publisherClass:]( &OBJC_CLASS___RMConfigurationSubscriberClient,  "runConfigurationSubscriberClientWithApplicators:publisherClass:",  v3,  objc_opt_class(&OBJC_CLASS___ManagementTestStatus, v4, v5));

  return v6;
}

void sub_10000435C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "managementTestAdapter");
  v2 = (void *)qword_10000CF18;
  qword_10000CF18 = (uint64_t)v1;
}

void sub_1000045BC(_Unwind_Exception *a1)
{
}

id sub_1000046F8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyConfiguration:*(void *)(a1 + 40) replaceKey:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) reasonDescription:a2 completionHandler:*(void *)(a1 + 56)];
}

void sub_1000047C0(_Unwind_Exception *a1)
{
}

LABEL_18:
      v23 = 0LL;
      goto LABEL_19;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[RMDevice currentDevice](&OBJC_CLASS___RMDevice, "currentDevice"));
    v28 = [v27 locked];

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason reasonWithCode:description:underlyingError:]( &OBJC_CLASS___RMModelStatusReason,  "reasonWithCode:description:underlyingError:",  @"Device.Locked",  @"Device is locked",  0LL));
      v37 = v29;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
      goto LABEL_19;
    }

    -[ManagementTestAdapter _addDeclarationKey:scope:](self, "_addDeclarationKey:scope:", v34, a5);
    if ([v19 length] || objc_msgSend(v14, "length"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason reasonWithCode:description:underlyingError:]( &OBJC_CLASS___RMModelStatusReason,  "reasonWithCode:description:underlyingError:",  v19,  v14,  0LL));
      v36 = v33;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));

      goto LABEL_7;
    }

LABEL_17:
    v24 = 0LL;
    goto LABEL_18;
  }

  -[ManagementTestAdapter _addDeclarationKey:scope:](self, "_addDeclarationKey:scope:", v34, a5);
  if (![v19 length] && !objc_msgSend(v14, "length")) {
    goto LABEL_17;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason reasonWithCode:description:underlyingError:]( &OBJC_CLASS___RMModelStatusReason,  "reasonWithCode:description:underlyingError:",  v19,  v14,  0LL));
  v38 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));

LABEL_7:
  v24 = 0LL;
LABEL_19:
  v15[2](v15, v23, v24);
}

void sub_100004EF0(_Unwind_Exception *a1)
{
}

void sub_1000050C4(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a2) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  *(void *)(a1 + 32),  4LL,  0LL));
  }
  else {
    v5 = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v6 removeItemAtURL:*(void *)(a1 + 32) error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000051F0(_Unwind_Exception *a1)
{
}

void sub_100005604( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000056EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "managementTestStatus");
  v2 = (void *)qword_10000CF28;
  qword_10000CF28 = (uint64_t)v1;
}

LABEL_30:
        v15 = (char *)v15 + 1;
      }

      while (v11 != v15);
      v39 = [v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
      v11 = v39;
    }

    while (v39);
  }

  v40 = [v8 copy];
  v41[2](v41, v40, 0LL);
}

void sub_100005DB8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Adapter begin", v1, 2u);
}

void sub_100005DF8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005E78( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005EE0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Querying management test status for key paths: %{public}@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}