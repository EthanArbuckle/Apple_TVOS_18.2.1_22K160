void sub_100003778( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, void);
  v11 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000037B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000037C8(uint64_t a1)
{
}

void sub_1000037D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100003858(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_10000389C);
  }
  return (id)predicate[2];
}

os_log_t sub_10000389C(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMask:");
}
33;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, void *);
  void *v38;
  dispatch_semaphore_s *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  os_log_s *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  id v5 = a3;
  v48 = 0LL;
  v49 = &v48;
  v50 = 0x3032000000LL;
  v51 = sub_1000037B8;
  v52 = sub_1000037C8;
  v53 = 0LL;
  v42 = 0LL;
  v43 = &v42;
  v44 = 0x3032000000LL;
  v45 = sub_1000037B8;
  v46 = sub_1000037C8;
  v47 = 0LL;
  id v6 = sub_100003858(&qword_100008140);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "diagnostic extension parameters, %@", buf, 0xCu);
  }

  v8 = [[RTDiagnosticOptions alloc] initWithOptionsMask:0];
  if ([(id)objc_opt_class(self) isLocationWorkoutStudiesComponent:v5])
  {
    uint64_t v9 = sub_100003858(&qword_100008140);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = NSStringFromSelector(a2);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412290;
      v56 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@, adding Location Workout Studies related diagnostic files",  buf,  0xCu);
    }

    v13 = 2LL;
LABEL_14:

    goto LABEL_15;
  }

  v14 = [(id)objc_opt_class(self) isLocationMonitoringStudiesComponent:v5];
  v15 = sub_100003858(&qword_100008140);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  v16 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v16)
    {
      v19 = NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412290;
      v56 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@, adding CoreRoutine related diagnostic files",  buf,  0xCu);
    }

    v13 = 1LL;
    goto LABEL_14;
  }

  if (v16)
  {
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412290;
    v56 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@, adding Location Monitoring Studies related diagnostic files",  buf,  0xCu);
  }

  [v8 setMask:4];
  v13 = 1LL;
LABEL_15:
  [v8 setMask:v13];
  v21 = dispatch_semaphore_create(0LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](&OBJC_CLASS___RTRoutineManager, "defaultManager"));
  v35 = _NSConcreteStackBlock;
  v36 = 3221225472LL;
  v37 = sub_1000037D0;
  v38 = &unk_100004148;
  v40 = &v48;
  v41 = &v42;
  v23 = v21;
  v39 = v23;
  [v22 fetchPathToDiagnosticFilesWithOptions:v8 handler:&v35];

  v24 = dispatch_time(0LL, 300000000000LL);
  v25 = dispatch_semaphore_wait(v23, v24);
  v26 = sub_100003858(&qword_100008140);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (v25)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Timed-out waiting for fetchPathToDiagnosticFilesWithOptions:handler",  buf,  2u);
    }

    v29 = &__NSArray0__struct;
  }

  else
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v30 = NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = v49[5];
      v33 = v43[5];
      *(_DWORD *)buf = 138412802;
      v56 = v31;
      v57 = 2112;
      v58 = v32;
      v59 = 2112;
      v60 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%@, path to CoreRoutine diagnostic files, %@, error, %@",  buf,  0x20u);
    }

    if (!objc_msgSend((id)v49[5], "length", v35, v36, v37, v38))
    {
      v29 = &__NSArray0__struct;
      goto LABEL_24;
    }

    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v49[5]));
    v54 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
  }

LABEL_24:
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v29;
}

@end