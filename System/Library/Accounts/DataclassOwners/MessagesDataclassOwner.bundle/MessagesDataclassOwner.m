id sub_3D58(void *a1)
{
  id v1;
  NSBundle *v2;
  void *v3;
  void *v4;
  v1 = a1;
  v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___IMiCloudSettingsPlugin));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v1 value:&stru_8260 table:@"IMiCloudSettingsPlugin"]);

  return v4;
}

LABEL_22:
    v24 = 0LL;
    goto LABEL_23;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 2LL));
  v26 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));

LABEL_23:
  return v24;
}

void sub_4A20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _disablementOptionForUserNotificationResponse:v3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "User chose disablement option {%ld} in IMUserNotificationCenter completion.",  (uint8_t *)&v9,  0xCu);
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
}
}

LABEL_15:
      }
    }

    else if (v16)
    {
      v22 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v23 = 67109120;
        v24 = byte_C868;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Signal enable_semaphore, didSucceed: %d", (uint8_t *)&v23, 8u);
      }

      goto LABEL_15;
    }

    return byte_C868 != 0;
  }

  if (IMOSLoggingEnabled(v7, v8))
  {
    v19 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "setCloudEnable: Did nothing as it was already enabled/disabled",  (uint8_t *)&v23,  2u);
    }
  }

  return 1;
}

LABEL_20:
      }
    }

    else if (IMOSLoggingEnabled(0LL, v12))
    {
      v18 = OSLogHandleForIMFoundationCategory("IMCloudSettingsPlugin");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        if (byte_C888) {
          v19 = @"YES";
        }
        else {
          v19 = @"NO";
        }
        v21 = 138412290;
        v22 = v19;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Signal eligible_semaphore, isEligible: %@",  (uint8_t *)&v21,  0xCu);
      }

      goto LABEL_20;
    }
  }

  return byte_C888;
}

LABEL_13:
    }
  }

  else if (IMOSLoggingEnabled(0LL, v12))
  {
    v16 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = *((unsigned __int8 *)v24 + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v17;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Signal has_max_tier_semaphore, hasMaxTier: %d", buf, 8u);
    }

    goto LABEL_13;
  }

  v18 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return v18;
}

void sub_5C94( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x5C2CLL);
  }

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

void sub_5CF4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);

  int v14 = IMOSLoggingEnabled(v12, v13);
  if (v11)
  {
    if (v14)
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
        int v20 = 138412290;
        v21 = v17;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "request quota with error: %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }

  else
  {
    if (v14)
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v20 = 67109120;
        LODWORD(v21) = [v10 hasMaxTier];
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "request quota returned: hasMaxTier: %d", (uint8_t *)&v20, 8u);
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 hasMaxTier];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_5E98(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x5E38LL);
  }

  _Unwind_Resume(a1);
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:");
}