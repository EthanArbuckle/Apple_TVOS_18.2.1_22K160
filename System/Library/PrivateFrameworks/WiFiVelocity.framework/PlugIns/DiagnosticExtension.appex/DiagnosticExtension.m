void sub_1000036B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000385C(uint64_t a1)
{
  v5 = 0LL;
  v2 = (const char *)&DiagnosticExtension__metaData;
  if (!qword_100008158)
  {
    __int128 v6 = off_100004138;
    uint64_t v7 = 0LL;
    qword_100008158 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    if (!qword_100008158)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }

    if (v5) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    v2 = "DEAttachmentItem";
    Class result = objc_getClass("DEAttachmentItem");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }

  qword_100008150 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}
NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    v15 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 collectLogsDiagnosticMode:v7 update:0 receipts:0 error:&v15]);
    v9 = v15;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Waiting for WiFiVelocity to complete log collection",  (uint8_t *)&buf,  2u);
    }

    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "WiFiVelocity returned: %@",  (uint8_t *)&buf,  0xCu);
      }

      v16 = 0LL;
      v17 = &v16;
      v18 = 0x2050000000LL;
      v10 = (void *)qword_100008150;
      v19 = qword_100008150;
      if (!qword_100008150)
      {
        *(void *)&buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v23 = sub_10000385C;
        v24 = &unk_100004118;
        v25 = &v16;
        sub_10000385C((uint64_t)&buf);
        v10 = (void *)v17[3];
      }

      v11 = v10;
      _Block_object_dispose(&v16, 8);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 attachmentWithPath:v12]);

      [v4 addObject:v13];
    }
  }

  return v4;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "WiFiVelocity Diagnostic Mode DE, params=%@",  (uint8_t *)&v10,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
  if ([v6 hasPrefix:@"com.apple.taptoradar"])
  {

LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[DiagnosticExtension __attachmentsForDiagnosticsModeWithParameters:]( self,  "__attachmentsForDiagnosticsModeWithParameters:",  v4));
    goto LABEL_10;
  }

  unsigned __int8 v7 = [v5 isEqualToString:@"com.apple.diagnosticextensionsd"];

  if ((v7 & 1) != 0) {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "WiFiVelocity Diagnostic Mode DE, Unrecognized HostApp: %@",  (uint8_t *)&v10,  0xCu);
  }

  v8 = &__NSArray0__struct;
LABEL_10:

  return v8;
}

@end