LABEL_11:
  }

  v16 = sub_3980();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Check AS\n", buf, 2u);
  }

  v28 = v7;
  v18 = -[CoreControlCECDeviceProvider givePhysicalAddressTo:error:]( self,  "givePhysicalAddressTo:error:",  5LL,  &v28);
  v19 = v28;

  if ((v18 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
    v21 = v20;
    if (v20 == (void *)CoreCECErrorDomain)
    {
      v22 = (char *)[v19 code];

      if (v22 == (_BYTE *)&dword_0 + 2)
      {
        v23 = sub_3980();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "Check AS => AS is either not present or not responding\n",  buf,  2u);
        }

        goto LABEL_22;
      }
    }

    else
    {
    }

    v25 = sub_3980();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
      v27 = [v26 UTF8String];
      *(_DWORD *)buf = 136315138;
      v31 = v27;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "GivePhysicalAddress => %s\n", buf, 0xCu);
    }

LABEL_22:
  }
}

id sub_3980()
{
  if (qword_8218 != -1) {
    dispatch_once(&qword_8218, &stru_40D0);
  }
  return (id)qword_8210;
}

void sub_39C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CoreControl", "default");
  v2 = (void *)qword_8210;
  qword_8210 = (uint64_t)v1;
}

LABEL_10:
  return v17;
}

id objc_msgSend_pollTo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pollTo:error:");
}