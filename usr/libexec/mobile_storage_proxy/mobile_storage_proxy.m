id sub_1000037BC()
{
  if (qword_1000241E0 != -1) {
    dispatch_once(&qword_1000241E0, &stru_100020608);
  }
  return (id)qword_1000241E8;
}

void sub_1000037FC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobile_storage_proxy.filetransfer", 0LL);
  v2 = (void *)qword_1000241E8;
  qword_1000241E8 = (uint64_t)v1;
}

id sub_100003828()
{
  if (qword_1000241F0 != -1) {
    dispatch_once(&qword_1000241F0, &stru_100020628);
  }
  return (id)qword_1000241F8;
}

void sub_100003868(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobile_storage_proxy.hostconnections", 0LL);
  v2 = (void *)qword_1000241F8;
  qword_1000241F8 = (uint64_t)v1;
}

void sub_100003894(uint64_t a1)
{
  id v2 = sub_1000037BC();
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003900;
  block[3] = &unk_100020648;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void sub_100003900(uint64_t a1)
{
  if (byte_100024200)
  {
    unlink(&byte_100024200);
    bzero(&byte_100024200, 0x400uLL);
  }

  id v2 = *(const char **)(a1 + 32);
  if (v2) {
    strncpy(&byte_100024200, v2, 0x3FFuLL);
  }
}

uint64_t sub_100003964()
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  id v0 = sub_1000037BC();
  dispatch_queue_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000039FC;
  block[3] = &unk_100020670;
  block[4] = &v5;
  dispatch_sync(v1, block);

  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000039FC(uint64_t result)
{
  if (byte_100024200) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = &byte_100024200;
  }
  return result;
}

void sub_100003A20(char a1)
{
  id v2 = sub_1000037BC();
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003A8C;
  block[3] = &unk_100020690;
  char v5 = a1;
  dispatch_sync(v3, block);
}

uint64_t sub_100003A8C(uint64_t result)
{
  byte_100024600 = *(_BYTE *)(result + 32);
  return result;
}

uint64_t sub_100003A9C()
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  id v0 = sub_1000037BC();
  dispatch_queue_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003B34;
  block[3] = &unk_100020670;
  void block[4] = &v5;
  dispatch_sync(v1, block);

  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100003B34(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = byte_100024600;
  return result;
}

uint64_t sub_100003B4C()
{
  uint64_t result = MKBGetDeviceLockState(0LL);
  if ((_DWORD)result != 1) {
    return MKBGetDeviceLockState(0LL) == 2;
  }
  return result;
}

uint64_t sub_100003B7C(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    v35 = @"Invalid input(s).";
    uint64_t v36 = 122LL;
    int v37 = -3;
    goto LABEL_34;
  }

  value = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!value)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create array.",  buf,  2u);
    }

    v35 = @"Failed to create array.";
    uint64_t v36 = 128LL;
    int v37 = -2;
LABEL_34:
    id v38 = sub_10000B128((uint64_t)"handle_lookup_image", v36, v37, 0LL, v35, v32, v33, v34, v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    value = 0LL;
    char v8 = 0LL;
    uint64_t v5 = 0LL;
    goto LABEL_35;
  }

  v4 = CFDictionaryGetValue(a1, @"ImageType");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = sub_10000A950(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    char v8 = (void *)MobileStorageCopyDevicesWithError(0LL, &cf);
    id v9 = sub_10000A8F8(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      if ([v8 count])
      {
        unint64_t v11 = 0LL;
        v12 = 0LL;
        v13 = 0LL;
        v14 = 0LL;
        v15 = 0LL;
        do
        {
          v16 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v11]);

          id v17 = sub_10000A8A0(v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"DeviceType"]);

            id v20 = sub_10000A950(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

            if (v21)
            {
              if ([v19 isEqualToString:@"DiskImage"])
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"DiskImageType"]);

                id v23 = sub_10000A950(v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                if (v24)
                {
                  if ([v5 isEqualToString:v22])
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"ImageSignature"]);

                    id v26 = sub_10000A9A8(v25);
                    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

                    if (v27)
                    {
                      -[NSMutableArray addObject:](value, "addObject:", v25);
                    }

                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v31 = [v8 count];
                      *(_DWORD *)buf = 138412802;
                      *(void *)v56 = @"ImageSignature";
                      *(_WORD *)&v56[8] = 1024;
                      *(_DWORD *)v57 = v11 + 1;
                      *(_WORD *)&v57[4] = 1024;
                      *(_DWORD *)&v57[6] = v31;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value %@ for entry %d of %d.",  buf,  0x18u);
                    }

                    v15 = v25;
                  }
                }

                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v30 = [v8 count];
                  *(_DWORD *)buf = 138412802;
                  *(void *)v56 = @"DiskImageType";
                  *(_WORD *)&v56[8] = 1024;
                  *(_DWORD *)v57 = v11 + 1;
                  *(_WORD *)&v57[4] = 1024;
                  *(_DWORD *)&v57[6] = v30;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value %@ for entry %d of %d.",  buf,  0x18u);
                }

                v14 = v22;
              }
            }

            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v29 = [v8 count];
              *(_DWORD *)buf = 138412802;
              *(void *)v56 = @"DeviceType";
              *(_WORD *)&v56[8] = 1024;
              *(_DWORD *)v57 = v11 + 1;
              *(_WORD *)&v57[4] = 1024;
              *(_DWORD *)&v57[6] = v29;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value %@ for entry %d of %d.",  buf,  0x18u);
            }

            v13 = v19;
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v28 = [v8 count];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v56 = v11;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve entry %d of %d.",  buf,  0xEu);
          }

          ++v11;
        }

        while (v11 < [v8 count]);
      }

      else
      {
        v15 = 0LL;
        v14 = 0LL;
        v13 = 0LL;
        v12 = 0LL;
      }

      CFDictionarySetValue(a2, @"ImageSignature", value);
      CFDictionarySetValue(a2, @"Status", @"Complete");
      v39 = 0LL;
      uint64_t v40 = 1LL;
      goto LABEL_51;
    }

    v45 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy device list.");
    if (cf)
    {
      uint64_t v52 = (uint64_t)v45;
      uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      v45 = (NSString *)v46;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v56 = v45;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v50 = sub_10000B128( (uint64_t)"handle_lookup_image",  143LL,  -2,  (void *)cf,  @"Failed to copy device list.",  v47,  v48,  v49,  v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v50);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v56 = @"ImageType";
      *(_WORD *)&v56[8] = 2112;
      *(void *)v57 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
    }

    id v44 = sub_10000B128( (uint64_t)"handle_lookup_image",  135LL,  -2,  0LL,  @"Invalid value for %@: %@",  v41,  v42,  v43,  (uint64_t)@"ImageType");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v44);
    CFDictionarySetValue(a2, @"Error", @"MissingImageType");
    char v8 = 0LL;
  }

LABEL_35:
  v12 = 0LL;
  uint64_t v40 = 0LL;
  if (a2 && v39)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v39 description]);
    uint64_t v40 = 0LL;
    v12 = 0LL;
    v13 = 0LL;
    v14 = 0LL;
    v15 = 0LL;
  }

  else
  {
    v13 = 0LL;
    v14 = 0LL;
    v15 = 0LL;
  }

LABEL_51:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v40;
}

uint64_t sub_1000042F0(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v33 = sub_10000B128((uint64_t)"handle_mount_image", 232LL, -3, 0LL, @"Invalid input(s).", v30, v31, v32, v78);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v34 = 0LL;
    v21 = 0LL;
    v14 = 0LL;
    v35 = 0LL;
    id v9 = 0LL;
    uint64_t v5 = 0LL;
    goto LABEL_48;
  }

  Value = CFDictionaryGetValue(a1, @"ImageType");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  id v6 = sub_10000A950(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = @"ImageType";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v39 = sub_10000B128( (uint64_t)"handle_mount_image",  239LL,  -3,  0LL,  @"Invalid value for %@.",  v36,  v37,  v38,  (uint64_t)@"ImageType");
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v39);
    CFDictionarySetValue(a2, @"Error", @"MissingImageType");
    uint64_t v34 = 0LL;
    v21 = 0LL;
    v14 = 0LL;
    v35 = 0LL;
    id v9 = 0LL;
    goto LABEL_48;
  }

  char v8 = CFDictionaryGetValue(a1, @"ImageSignature");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_10000A9A8(v9);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = @"ImageSignature";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v43 = sub_10000B128( (uint64_t)"handle_mount_image",  247LL,  -3,  0LL,  @"Invalid value for %@.",  v40,  v41,  v42,  (uint64_t)@"ImageSignature");
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v43);
    CFDictionarySetValue(a2, @"Error", @"MissingImageSignature");
    uint64_t v34 = 0LL;
    v21 = 0LL;
    v14 = 0LL;
    goto LABEL_47;
  }

  v12 = CFDictionaryGetValue(a1, @"ImageTrustCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v13)
  {
    id v15 = sub_10000A9A8(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (!v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v81 = @"ImageTrustCache";
        __int16 v82 = 2112;
        v83 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for option %@: %@",  buf,  0x16u);
      }

      id v54 = sub_10000B128( (uint64_t)"handle_mount_image",  254LL,  -2,  0LL,  @"Invalid value for option %@: %@",  v51,  v52,  v53,  (uint64_t)@"ImageTrustCache");
      goto LABEL_43;
    }
  }

  if (![v5 isEqualToString:@"Cryptex"])
  {
    v21 = 0LL;
    goto LABEL_24;
  }

  id v17 = sub_10000A9A8(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v81 = @"ImageTrustCache";
      __int16 v82 = 2112;
      v83 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for required option %@: %@",  buf,  0x16u);
    }

    id v54 = sub_10000B128( (uint64_t)"handle_mount_image",  261LL,  -2,  0LL,  @"Invalid value for required option %@: %@",  v59,  v60,  v61,  (uint64_t)@"ImageTrustCache");
LABEL_43:
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v54);
    CFDictionarySetValue(a2, @"Error", @"MissingTrustCache");
    uint64_t v34 = 0LL;
    v21 = 0LL;
    goto LABEL_47;
  }

  v19 = CFDictionaryGetValue(a1, @"ImageInfoPlist");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v20)
  {
    id v22 = sub_10000A9A8(v20);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (!v23)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v81 = @"ImageInfoPlist";
        __int16 v82 = 2112;
        v83 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for option %@: %@",  buf,  0x16u);
      }

      id v27 = sub_10000B128( (uint64_t)"handle_mount_image",  268LL,  -2,  0LL,  @"Invalid value for option %@: %@",  v24,  v25,  v26,  (uint64_t)@"ImageInfoPlist");
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      unsigned int v29 = off_1000208D8;
LABEL_39:
      CFDictionarySetValue(a2, @"Error", *v29);
      uint64_t v34 = 0LL;
LABEL_47:
      v35 = 0LL;
      goto LABEL_48;
    }
  }

LABEL_24:
  id v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v44)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
    }

    id v58 = sub_10000B128( (uint64_t)"handle_mount_image",  277LL,  -2,  0LL,  @"Failed to create dictionary.",  v55,  v56,  v57,  v78);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v58);
    unsigned int v29 = off_100020908;
    goto LABEL_39;
  }

  uint64_t v34 = v44;
  uint64_t v45 = sub_100003964();
  if (!v45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disk image is missing.",  buf,  2u);
    }

    id v65 = sub_10000B128( (uint64_t)"handle_mount_image",  294LL,  -2,  0LL,  @"Disk image is missing.",  v62,  v63,  v64,  v78);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v65);
    CFDictionarySetValue(a2, @"Error", @"MissingImagePath");
    goto LABEL_47;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v45));
  id v46 = sub_10000A950(v35);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

  if (v47)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v34,  "setObject:forKeyedSubscript:",  @"DiskImage",  @"DeviceType");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v5, @"DiskImageType");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v34,  "setObject:forKeyedSubscript:",  v9,  @"ImageSignature");
    if (v14) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v34,  "setObject:forKeyedSubscript:",  v14,  @"ImageTrustCache");
    }
    if (v21) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v34,  "setObject:forKeyedSubscript:",  v21,  @"ImageInfoPlist");
    }
    uint64_t v48 = MobileStorageMountWithError(v35, v34, &cf);
    if (v48)
    {
      uint64_t v49 = (void *)v48;
      CFDictionarySetValue(a2, @"Status", @"Complete");

      unsigned int v28 = 0LL;
      uint64_t v50 = 1LL;
      goto LABEL_53;
    }

    v72 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to mount %@.",  v35);
    if (cf)
    {
      uint64_t v73 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)", v72, cf));

      v72 = (NSString *)v73;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = (const __CFString *)v72;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v77 = sub_10000B128( (uint64_t)"handle_mount_image",  315LL,  -2,  (void *)cf,  @"Failed to mount %@.",  v74,  v75,  v76,  (uint64_t)v35);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v77);

    v71 = off_100020910;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    id v70 = sub_10000B128( (uint64_t)"handle_mount_image",  289LL,  -2,  0LL,  @"Failed to create string.",  v67,  v68,  v69,  v78);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v71 = off_1000208F8;
  }

  CFDictionarySetValue(a2, @"Error", *v71);
LABEL_48:
  sub_100003894(0LL);
  uint64_t v50 = 0LL;
  if (a2 && v28)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v28 description]);
    uint64_t v50 = 0LL;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  return v12;
}

LABEL_53:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v50;
}

uint64_t sub_100004C4C(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    Value = (void *)CFDictionaryGetValue(a1, @"MountPath");
    id v4 = sub_10000A950(Value);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5)
    {
      if (!MobileStorageUnmountWithError(Value, 0LL, &cf))
      {
        CFDictionarySetValue(a2, @"Status", @"Complete");
        v12 = 0LL;
        uint64_t v21 = 1LL;
        goto LABEL_22;
      }

      id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to unmount %@.",  Value);
      if (cf)
      {
        uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)", v6, cf));

        id v6 = (NSString *)v7;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (const __CFString *)v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      id v11 = sub_10000B128( (uint64_t)"handle_unmount_image",  368LL,  -2,  (void *)cf,  @"Failed to unmount %@.",  v8,  v9,  v10,  (uint64_t)Value);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = @"MountPath";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
      }

      id v20 = sub_10000B128( (uint64_t)"handle_unmount_image",  362LL,  -3,  0LL,  @"Invalid value for %@.",  v17,  v18,  v19,  (uint64_t)@"MountPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v20);
      CFDictionarySetValue(a2, @"Error", @"MissingImagePath");
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v16 = sub_10000B128((uint64_t)"handle_unmount_image", 356LL, -3, 0LL, @"Invalid input(s).", v13, v14, v15, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  uint64_t v21 = 0LL;
  if (a2 && v12)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v12 description]);
    uint64_t v21 = 0LL;
  }

LABEL_22:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v21;
}

      if (v3 > 0)
      {
        id v11 = (void *)MGCopyAnswer(@"3kmXfug8VcxLI5yEmsqQKw", 0LL);
        v12 = [v11 BOOLValue];

        if (((v12 | os_variant_is_recovery("com.apple.mobile.storage_mounter")) & 1) == 0)
        {
          uint64_t v14 = cryptex_copy_list_4MSM(a1 ^ 1u, &v48, &v47, 0LL);
          if ((v14 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = strerror(v14);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v14;
              LOWORD(v54) = 2080;
              *(void *)((char *)&v54 + 2) = v15;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to copy cryptex list (%d (%s)), non-fatal.",  buf,  0x12u);
            }

            if (v48)
            {
              cryptex_msm_array_destroy(v48, v47);
              uint64_t v48 = 0LL;
            }

            uint64_t v47 = 0LL;
          }
        }

        id v16 = 0LL;
        uint64_t v17 = 0LL;
        uint64_t v18 = v3;
        *(void *)&uint64_t v13 = 136315138LL;
        id v39 = v13;
        while (1)
        {
          *(void *)buf = 0LL;
          *(void *)&id v54 = buf;
          *((void *)&v54 + 1) = 0x2020000000LL;
          uint64_t v55 = 0;
          uint64_t v19 = sub_10000BE00((uint64_t)&v41[v16], v48, v47);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          uint64_t v21 = v20;
          if (!v20) {
            break;
          }
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"MountPath"]);
          if (!v22)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v51 = 138412290;
              f_mntonname = @"MountPath";
              uint64_t v26 = "Map entry missing value for key %@.";
              id v27 = 12;
LABEL_39:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, v51, v27);
            }

            goto LABEL_40;
          }

          uint64_t v23 = v22;
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"DiskImageType"]);
          uint64_t v25 = [v24 isEqualToString:@"Cryptex"];

          if (v25)
          {
            *(_BYTE *)(v54 + 24) = 1;
          }

          else
          {
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_10000CB10;
            v43[3] = &unk_100020C48;
            uint64_t v32 = v23;
            id v44 = v32;
            uint64_t v45 = v21;
            id v46 = buf;
            [&off_1000235B8 enumerateObjectsUsingBlock:v43];

            if (!*(_BYTE *)(v54 + 24))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_1000158C8(v49, (uint64_t)v32, &v50);
              }
              unsigned int v28 = 0LL;
              unsigned int v29 = 0LL;
              uint64_t v30 = 0LL;
              uint64_t v31 = 0LL;
              uint64_t v42 = (uint64_t)v17;
              uint64_t v23 = v32;
              goto LABEL_62;
            }
          }

          uint64_t v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", @"DeviceNode", v39));

          if (v42)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"DeviceType"]);
            if (v31)
            {
              if ([@"DiskImage" isEqualToString:v31])
              {
                id v33 = sub_10000CB94((uint64_t)v41[v16].f_mntfromname);
                uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);
                if (v34)
                {
                  [v21 setObject:v34 forKeyedSubscript:@"BackingImage"];
                  unsigned int v28 = (id)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"ImageSignature"]);
                  if (v28)
                  {
                    uint64_t v30 = 0LL;
                    unsigned int v29 = v34;
LABEL_61:
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v21, v42);
                    goto LABEL_62;
                  }

                  v35 = sub_10000CB94((uint64_t)v41[v16].f_mntfromname);
                  unsigned int v29 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);

                  if (v29)
                  {
                    uint64_t v36 = sub_10000CD38(v29);
                    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v36);
                    if (v30)
                    {
                      unsigned int v28 = -[NSMutableData initDataWithHexString:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initDataWithHexString:",  v30);
                      if (v28)
                      {
                        [v21 setObject:v28 forKeyedSubscript:@"ImageSignature"];
                        goto LABEL_61;
                      }

                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t v51 = 138412290;
                        f_mntonname = v29;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to convert signature from %@",  v51,  0xCu);
                      }
                    }

                    else
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t v51 = 138412290;
                        f_mntonname = v29;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to recover signature from %@",  v51,  0xCu);
                      }

                      uint64_t v30 = 0LL;
                    }

                    goto LABEL_60;
                  }

                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_58:
                    *(_DWORD *)uint64_t v51 = v39;
                    f_mntonname = (const __CFString *)v41[v16].f_mntonname;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get backing image path for %s",  v51,  0xCu);
                  }
                }

                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  goto LABEL_58;
                }
              }

              uint64_t v30 = 0LL;
              unsigned int v29 = 0LL;
LABEL_60:
              unsigned int v28 = 0LL;
              goto LABEL_61;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v51 = 138412290;
              f_mntonname = @"DeviceType";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Map entry missing %@.",  v51,  0xCu);
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v51 = 138412290;
              f_mntonname = @"DeviceNode";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Map entry missing %@.",  v51,  0xCu);
            }

            uint64_t v42 = 0LL;
          }

          unsigned int v28 = 0LL;
          unsigned int v29 = 0LL;
          uint64_t v30 = 0LL;
          uint64_t v31 = 0LL;
LABEL_62:
          _Block_object_dispose(buf, 8);

          ++v16;
          uint64_t v8 = (void *)v42;
          uint64_t v17 = (void *)v42;
          if (!--v18) {
            goto LABEL_78;
          }
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v51 = 0;
          uint64_t v26 = "Failed to create map entry.";
          id v27 = 2;
          goto LABEL_39;
        }

uint64_t sub_100004F6C(uint64_t a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    if ((MobileStorageRollPersonalizationNonceWithError(0LL, &cf) & 1) != 0)
    {
      CFDictionarySetValue(a2, @"Status", @"Complete");
      v3 = 0LL;
      uint64_t v4 = 1LL;
      goto LABEL_18;
    }

    uint64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to roll personalization nonce.");
    if (cf)
    {
      uint64_t v16 = (uint64_t)v9;
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v9 = (NSString *)v10;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v14 = sub_10000B128( (uint64_t)"handle_roll_personalization_nonce",  409LL,  -2,  (void *)cf,  @"Failed to roll personalization nonce.",  v11,  v12,  v13,  v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v8 = sub_10000B128( (uint64_t)"handle_roll_personalization_nonce",  403LL,  -3,  0LL,  @"Invalid input(s).",  v5,  v6,  v7,  v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  uint64_t v4 = 0LL;
  if (a2 && v3)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v3 description]);
    uint64_t v4 = 0LL;
  }

LABEL_18:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v4;
}

  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v4;
}

  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v6;
}
}

uint64_t sub_1000051B8(uint64_t a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    if ((MobileStorageRollCryptexNonceWithError(0LL, &cf) & 1) != 0)
    {
      CFDictionarySetValue(a2, @"Status", @"Complete");
      v3 = 0LL;
      uint64_t v4 = 1LL;
      goto LABEL_18;
    }

    uint64_t v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to roll cryptex nonce.");
    if (cf)
    {
      uint64_t v16 = (uint64_t)v9;
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v9 = (NSString *)v10;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v14 = sub_10000B128( (uint64_t)"handle_roll_cryptex_nonce",  450LL,  -2,  (void *)cf,  @"Failed to roll cryptex nonce.",  v11,  v12,  v13,  v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v8 = sub_10000B128( (uint64_t)"handle_roll_cryptex_nonce",  444LL,  -3,  0LL,  @"Invalid input(s).",  v5,  v6,  v7,  v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  uint64_t v4 = 0LL;
  if (a2 && v3)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v3 description]);
    uint64_t v4 = 0LL;
  }

uint64_t sub_100005404(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    Value = CFDictionaryGetValue(a1, @"PersonalizedImageType");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
    id v6 = sub_10000A950(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      id v8 = CFDictionaryGetValue(a1, @"ImageSignature");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = sub_10000A9A8(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (v11)
      {
        uint64_t v12 = (void *)MobileStorageCopyPersonalizationManifestWithError(v5, v9, 0LL, &cf);
        if (v12)
        {
          uint64_t v13 = v12;
          CFDictionarySetValue(a2, @"ImageSignature", v12);

          id v14 = 0LL;
          uint64_t v15 = 1LL;
          goto LABEL_26;
        }

        unsigned int v28 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy personalization manifest.");
        if (cf)
        {
          uint64_t v35 = (uint64_t)v28;
          uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

          unsigned int v28 = (NSString *)v29;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = (const __CFString *)v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        id v33 = sub_10000B128( (uint64_t)"handle_query_personalization_manifest",  505LL,  -2,  (void *)cf,  @"Failed to copy personalization manifest.",  v30,  v31,  v32,  v35);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v33);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = @"ImageSignature";
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
        }

        id v27 = sub_10000B128( (uint64_t)"handle_query_personalization_manifest",  499LL,  -3,  0LL,  @"Invalid value for %@.",  v24,  v25,  v26,  (uint64_t)@"ImageSignature");
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v27);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = @"PersonalizedImageType";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
      }

      id v23 = sub_10000B128( (uint64_t)"handle_query_personalization_manifest",  493LL,  -3,  0LL,  @"Invalid value for %@.",  v20,  v21,  v22,  (uint64_t)@"PersonalizedImageType");
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v19 = sub_10000B128( (uint64_t)"handle_query_personalization_manifest",  487LL,  -3,  0LL,  @"Invalid input(s).",  v16,  v17,  v18,  v35);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v9 = 0LL;
    uint64_t v5 = 0LL;
  }

  uint64_t v15 = 0LL;
  if (a2 && v14)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v14 description]);
    uint64_t v15 = 0LL;
  }

LABEL_26:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v15;
}

uint64_t sub_1000057CC(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    Value = CFDictionaryGetValue(a1, @"PersonalizedImageType");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    id v7 = sub_10000A950(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v6,  @"PersonalizedImageType");
    }
    uint64_t v9 = (void *)MobileStorageCopyPersonalizationNonceWithError(v4, &cf);
    if (v9)
    {
      id v10 = v9;
      CFDictionarySetValue(a2, @"PersonalizationNonce", v9);

      uint64_t v11 = 0LL;
      uint64_t v12 = 1LL;
      goto LABEL_20;
    }

    uint64_t v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy personalization nonce.");
    if (cf)
    {
      uint64_t v24 = (uint64_t)v17;
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v17 = (NSString *)v18;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v22 = sub_10000B128( (uint64_t)"handle_query_personalization_nonce",  555LL,  -2,  (void *)cf,  @"Failed to copy personalization nonce.",  v19,  v20,  v21,  v24);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v22);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v16 = sub_10000B128( (uint64_t)"handle_query_personalization_nonce",  542LL,  -3,  0LL,  @"Invalid input(s).",  v13,  v14,  v15,  v24);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v4 = 0LL;
    id v6 = 0LL;
  }

  uint64_t v12 = 0LL;
  if (a2 && v11)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v11 description]);
    uint64_t v12 = 0LL;
  }

LABEL_20:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v12;
}

  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v12;
}

  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v7;
}

uint64_t sub_100005A88(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    Value = CFDictionaryGetValue(a1, @"PersonalizedImageType");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    id v7 = sub_10000A950(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v6,  @"PersonalizedImageType");
    }
    uint64_t v9 = (void *)MobileStorageCopyPersonalizationIdentifiersWithError(v4, &cf);
    if (v9)
    {
      id v10 = v9;
      CFDictionarySetValue(a2, @"PersonalizationIdentifiers", v9);

      uint64_t v11 = 0LL;
      uint64_t v12 = 1LL;
      goto LABEL_20;
    }

    uint64_t v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy personalization identifiers.");
    if (cf)
    {
      uint64_t v24 = (uint64_t)v17;
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v17 = (NSString *)v18;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v22 = sub_10000B128( (uint64_t)"handle_query_personalization_identifiers",  604LL,  -2,  (void *)cf,  @"Failed to copy personalization identifiers.",  v19,  v20,  v21,  v24);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v22);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v16 = sub_10000B128( (uint64_t)"handle_query_personalization_identifiers",  591LL,  -3,  0LL,  @"Invalid input(s).",  v13,  v14,  v15,  v24);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v4 = 0LL;
    id v6 = 0LL;
  }

  uint64_t v12 = 0LL;
  if (a2 && v11)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v11 description]);
    uint64_t v12 = 0LL;
  }

uint64_t sub_100005D44(uint64_t a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    v3 = (void *)MobileStorageCopyCryptexNonceWithError(0LL, &cf);
    if (v3)
    {
      uint64_t v4 = v3;
      CFDictionarySetValue(a2, @"CryptexNonce", v3);

      uint64_t v5 = 0LL;
      uint64_t v6 = 1LL;
      goto LABEL_18;
    }

    uint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy cryptex nonce.");
    if (cf)
    {
      uint64_t v18 = (uint64_t)v11;
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v11 = (NSString *)v12;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v16 = sub_10000B128( (uint64_t)"handle_query_cryptex_nonce",  644LL,  -2,  (void *)cf,  @"Failed to copy cryptex nonce.",  v13,  v14,  v15,  v18);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v10 = sub_10000B128( (uint64_t)"handle_query_cryptex_nonce",  638LL,  -3,  0LL,  @"Invalid input(s).",  v7,  v8,  v9,  v18);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  uint64_t v6 = 0LL;
  if (a2 && v5)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v5 description]);
    uint64_t v6 = 0LL;
  }

uint64_t sub_100005F90(uint64_t a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    uint64_t v3 = MobileStorageCopyDeveloperModeStatusWithError(0LL, &cf);
    if ((v3 & 1) != 0 || !cf)
    {
      CFDictionarySetValue( a2,  @"DeveloperModeStatus",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
      id v10 = 0LL;
      uint64_t v15 = 1LL;
      goto LABEL_19;
    }

    uint64_t v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy developer mode status.");
    if (cf)
    {
      uint64_t v17 = (uint64_t)v4;
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v4 = (NSString *)v5;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v9 = sub_10000B128( (uint64_t)"handle_query_developer_mode_status",  684LL,  -2,  (void *)cf,  @"Failed to copy developer mode status.",  v6,  v7,  v8,  v17);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v14 = sub_10000B128( (uint64_t)"handle_query_developer_mode_status",  678LL,  -3,  0LL,  @"Invalid input(s).",  v11,  v12,  v13,  v17);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  uint64_t v15 = 0LL;
  if (a2 && v10)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v10 description]);
    uint64_t v15 = 0LL;
  }

LABEL_19:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v15;
}

uint64_t sub_1000061F0(uint64_t a1, __CFDictionary *a2)
{
  CFTypeRef cf = 0LL;
  if (a1 && a2)
  {
    uint64_t v3 = (void *)MobileStorageCopyDevicesWithError(0LL, &cf);
    id v4 = sub_10000A8F8(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5)
    {
      if (v3) {
        CFDictionarySetValue(a2, @"EntryList", v3);
      }
      CFDictionarySetValue(a2, @"Status", @"Complete");
      uint64_t v6 = 0LL;
      uint64_t v7 = 1LL;
      goto LABEL_20;
    }

    uint64_t v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy device list.");
    if (cf)
    {
      uint64_t v19 = (uint64_t)v12;
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v12 = (NSString *)v13;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v17 = sub_10000B128( (uint64_t)"handle_copy_devices",  724LL,  -2,  (void *)cf,  @"Failed to copy device list.",  v14,  v15,  v16,  v19);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v11 = sub_10000B128((uint64_t)"handle_copy_devices", 718LL, -3, 0LL, @"Invalid input(s).", v8, v9, v10, v19);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v3 = 0LL;
  }

  uint64_t v7 = 0LL;
  if (a2 && v6)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v6 description]);
    uint64_t v7 = 0LL;
  }

uint64_t sub_100006474(uint64_t a1, CFMutableDictionaryRef theDict)
{
  if (a1) {
    BOOL v3 = theDict == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  (uint8_t *)&v12,  2u);
    }

    id v9 = sub_10000B128((uint64_t)"handle_hangup", 760LL, -3, 0LL, @"Invalid input(s).", v6, v7, v8, v12);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    uint64_t v5 = (void *)v10;
    if (theDict && v10)
    {
      if (!CFDictionaryGetValue(theDict, @"Error")) {
        CFDictionarySetValue(theDict, @"Error", @"InternalError");
      }
      CFDictionarySetValue(theDict, @"DetailedError", [v5 description]);
    }
  }

  else
  {
    CFDictionarySetValue(theDict, @"Goodbye", kCFBooleanTrue);
    uint64_t v5 = 0LL;
  }

  return v4;
}

BOOL sub_1000065A8()
{
  uint64_t v7 = 0LL;
  v8[0] = &v7;
  v8[1] = 0x2020000000LL;
  if (!&_lockdown_checkin_xpc)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Platform does not support lockdown.",  buf,  2u);
    }

    goto LABEL_8;
  }

  id v0 = sub_100003828();
  dispatch_queue_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000066FC;
  v5[3] = &unk_1000206B8;
  v5[4] = &v7;
  int v2 = lockdown_checkin_xpc("com.apple.mobile.storage_mounter_proxy", 0LL, v1, v5);
  *(_DWORD *)(v8[0] + 24LL) = v2;

  if (!*(_DWORD *)(v8[0] + 24LL))
  {
LABEL_8:
    BOOL v3 = 1LL;
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100015528((uint64_t)v8);
  }
  BOOL v3 = *(_DWORD *)(v8[0] + 24LL) == 0;
LABEL_9:
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_1000066E4(_Unwind_Exception *a1)
{
}

void sub_1000066FC(uint64_t a1, uint64_t a2, CFDictionaryRef theDict, __n128 a4)
{
  uint64_t v25 = 0LL;
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"ClientName");
    uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  uint64_t v7 = 0LL;
  a4.n128_u64[0] = 138412290LL;
  __n128 v23 = a4;
  while (1)
  {
    CFMutableDictionaryRef v8 = sub_10000A578();
    if (!v8) {
      break;
    }
    id v9 = (__CFString *)v8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = lockdown_receive_message(a2, &v25);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v22;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to receive message: 0x%08x",  buf,  8u);
      }

      CFRelease(v9);
      goto LABEL_106;
    }

    uint64_t v10 = CFDictionaryGetValue(v25, @"Command");
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);

    id v12 = sub_10000A950(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412546;
        id v27 = @"Command";
        __int16 v28 = 2112;
        uint64_t v29 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
      }

      id v17 = (__CFDictionary *)v9;
      uint64_t v18 = @"MissingCommand";
LABEL_17:
      CFDictionarySetValue(v17, @"Error", v18);
LABEL_48:
      char v15 = 0;
      goto LABEL_49;
    }

    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v24;
      __int16 v28 = 2114;
      uint64_t v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Host connection (%{public}@): %{public}@",  buf,  0x16u);
    }

    if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"LookupImage", *(_OWORD *)&v23))
    {
      if ((sub_100003B7C(v25, (__CFDictionary *)v9) & 1) != 0) {
        goto LABEL_39;
      }
      char v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to lookup image.";
        goto LABEL_46;
      }
    }

    else if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"CopyDevices"))
    {
      char v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to copy device list.";
        goto LABEL_46;
      }
    }

    else if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"MountImage"))
    {
      if (sub_100003B4C())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        goto LABEL_30;
      }

      if ((sub_1000042F0(v25, (__CFDictionary *)v9) & 1) != 0) {
        goto LABEL_39;
      }
      char v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to mount image.";
        goto LABEL_46;
      }
    }

    else if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"UnmountImage"))
    {
      if (sub_100003B4C())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        goto LABEL_30;
      }

      if ((sub_100004C4C(v25, (__CFDictionary *)v9) & 1) != 0) {
        goto LABEL_39;
      }
      char v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to unmount image.";
        goto LABEL_46;
      }
    }

    else
    {
      if (!-[__CFString isEqualToString:](v11, "isEqualToString:", @"Hangup"))
      {
        if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"ReceiveBytes"))
        {
          if (sub_100003B4C())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            goto LABEL_30;
          }

          CFDictionarySetValue((CFMutableDictionaryRef)v9, @"Status", @"ReceiveBytesAck");
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = lockdown_send_message(a2, v9, 100LL);
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            int v21 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            *(_DWORD *)buf = 67109120;
            LODWORD(v27) = v21;
            uint64_t v16 = "Failed to send message: 0x%08x";
            uint32_t v19 = 8;
            goto LABEL_47;
          }

          if (sub_100007200(a2, v25, (__CFDictionary *)v9))
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to receive bytes.";
            goto LABEL_46;
          }
        }

        else if (-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"RollPersonalizationNonce"))
        {
          if (sub_100003B4C())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            goto LABEL_30;
          }

          if ((sub_100004F6C((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to roll personalization nonce.";
LABEL_46:
            uint32_t v19 = 2;
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v19);
            goto LABEL_48;
          }
        }

        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"RollCryptexNonce"))
        {
          if (sub_100003B4C())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
LABEL_29:
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device is locked, denying host request.",  buf,  2u);
            }

LABEL_30:
            id v17 = (__CFDictionary *)v9;
            uint64_t v18 = @"DeviceLocked";
            goto LABEL_17;
          }

          if ((sub_1000051B8((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to roll cryptex nonce.";
            goto LABEL_46;
          }
        }

        else if (-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"QueryPersonalizationManifest"))
        {
          if ((sub_100005404(v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to query personalization manifest.";
            goto LABEL_46;
          }
        }

        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"QueryNonce"))
        {
          if ((sub_1000057CC(v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            goto LABEL_85;
          }
        }

        else if (-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"QueryPersonalizationIdentifiers"))
        {
          if ((sub_100005A88(v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to query personalization identifiers.";
            goto LABEL_46;
          }
        }

        else if (-[__CFString isEqualToString:](v11, "isEqualToString:", @"QueryCryptexNonce"))
        {
          if ((sub_100005D44((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
LABEL_85:
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to query personalization nonce.";
            goto LABEL_46;
          }
        }

        else
        {
          if (!-[__CFString isEqualToString:](v11, "isEqualToString:", @"QueryDeveloperModeStatus"))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23.n128_u32[0];
              id v27 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid command: %@",  buf,  0xCu);
            }

            id v17 = (__CFDictionary *)v9;
            uint64_t v18 = @"UnknownCommand";
            goto LABEL_17;
          }

          if ((sub_100005F90((uint64_t)v25, (__CFDictionary *)v9) & 1) == 0)
          {
            char v15 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v16 = "Failed to query developer mode status.";
            goto LABEL_46;
          }
        }

LABEL_39:
        char v15 = 1;
        goto LABEL_49;
      }

      char v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to hangup.";
        goto LABEL_46;
      }
    }

LABEL_49:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sending response: %{public}@",  buf,  0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = lockdown_send_message(a2, v9, 100LL);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      char v15 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v20;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to send message: 0x%08x",  buf,  8u);
        char v15 = 0;
      }
    }

    CFRelease(v9);
    if (v25) {
      CFRelease(v25);
    }
    uint64_t v25 = 0LL;
    uint64_t v7 = v11;
    if ((v15 & 1) == 0) {
      goto LABEL_107;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
  }

  uint64_t v57 = sub_10000EF68();
  id v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  if (!v58)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query working directory.",  buf,  2u);
    }

    uint64_t v37 = @"Failed to query working directory.";
    uint64_t v38 = 213LL;
    goto LABEL_67;
  }

  uint64_t v59 = v58;
  uint64_t v60 = sub_10000E4E8(v16, v58);
  char v15 = (id)objc_claimAutoreleasedReturnValue(v60);

  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      v96 = 2112;
      v97 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path with signature %@ in %@.",  buf,  0x16u);
    }

    uint64_t v37 = @"Failed to create path with signature %@ in %@.";
    v90 = (uint64_t)v16;
    uint64_t v38 = 219LL;
    goto LABEL_67;
  }

  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v93 = NSFilePosixPermissions;
  v94 = &off_1000234F8;
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL));
  v91 = 0LL;
  uint64_t v63 = [v61 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:v62 error:&v91];
  uint64_t v10 = v91;

  if ((v63 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %@.",  buf,  0xCu);
    }

    uint64_t v74 = sub_10000B128( (uint64_t)"handle_receive_bytes",  224LL,  -2,  0LL,  @"Failed to create %@.",  v71,  v72,  v73,  (uint64_t)v15);
    goto LABEL_79;
  }

  char v15 = v15;
  snprintf(__str, 0x400uLL, "%s/XXXXXX.dmg", (const char *)[v15 UTF8String]);
  uint64_t v64 = mkstemps(__str, 4);
  if (v64 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v79 = __error();
      v80 = strerror(*v79);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = __str;
      v96 = 2080;
      v97 = v80;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %s: %s",  buf,  0x16u);
    }

    v81 = __error();
    strerror(*v81);
    uint64_t v74 = sub_10000B128( (uint64_t)"handle_receive_bytes",  233LL,  -2,  0LL,  @"Failed to create %s: %s",  v82,  v83,  v84,  (uint64_t)__str);
LABEL_79:
    v85 = objc_claimAutoreleasedReturnValue(v74);

    CFDictionarySetValue(a3, @"Error", @"FileCreateFailed");
    uint32_t v19 = -1;
    uint64_t v10 = (id)v85;
    goto LABEL_12;
  }

  uint32_t v19 = v64;
  if (sub_10000E6CC(__str))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Path is bad: %s",  buf,  0xCu);
    }

    uint64_t v68 = sub_10000B128( (uint64_t)"handle_receive_bytes",  239LL,  -2,  0LL,  @"Path is bad: %s",  v65,  v66,  v67,  (uint64_t)__str);
    uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);

    id v70 = off_100020918;
  }

  else
  {
    sub_100003A20(1);
    sub_100003894((uint64_t)__str);
    if (sub_100007DF4(v19, a1, (unint64_t)[v17 unsignedLongValue]))
    {
      CFDictionarySetValue(a3, @"Status", @"Complete");
      int v20 = 0LL;
      goto LABEL_13;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to receive bytes into %s.",  buf,  0xCu);
    }

    v89 = sub_10000B128( (uint64_t)"handle_receive_bytes",  249LL,  -2,  0LL,  @"Failed to receive bytes into %s.",  v86,  v87,  v88,  (uint64_t)__str);
    uint64_t v69 = objc_claimAutoreleasedReturnValue(v89);

    id v70 = off_100020938;
  }

  CFDictionarySetValue(a3, @"Error", *v70);
  int v20 = 0xFFFFFFFFLL;
  uint64_t v10 = (id)v69;
LABEL_13:
  if (v10)
  {
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v10 description]);
  }

  if (v19 != -1) {
    close(v19);
  }
  if (v10) {
    sub_100003894(0LL);
  }
  sub_100003A20(0);

  return v20;
}

LABEL_106:
  id v11 = v7;
LABEL_107:
  if (a2) {
    lockdown_disconnect(a2);
  }
}

uint64_t sub_100007200(uint64_t a1, const __CFDictionary *a2, __CFDictionary *a3)
{
  uint64_t v101 = 0LL;
  memset(v100, 0, sizeof(v100));
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v14 = sub_10000B128((uint64_t)"handle_receive_bytes", 135LL, -3, 0LL, @"Invalid input(s).", v11, v12, v13, v90);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_10;
  }

  if (sub_100003A9C())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Existing file transfer in progress.",  buf,  2u);
    }

    id v9 = sub_10000B128( (uint64_t)"handle_receive_bytes",  140LL,  -2,  0LL,  @"Existing file transfer in progress.",  v6,  v7,  v8,  v90);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    CFDictionarySetValue(a3, @"Error", @"ExistingTransferInProgress");
LABEL_10:
    id v15 = 0LL;
    uint64_t v16 = 0LL;
    id v17 = 0LL;
    uint64_t v18 = 0LL;
LABEL_11:
    int v19 = -1;
LABEL_12:
    uint64_t v20 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }

  Value = CFDictionaryGetValue(a2, @"ImageType");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(Value);
  id v23 = sub_10000A950(v18);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (!v24)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageType";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v42 = sub_10000B128( (uint64_t)"handle_receive_bytes",  148LL,  -3,  0LL,  @"Invalid value for %@.",  v39,  v40,  v41,  (uint64_t)@"ImageType");
    id v10 = (id)objc_claimAutoreleasedReturnValue(v42);
    CFDictionarySetValue(a3, @"Error", @"MissingImageType");
    id v15 = 0LL;
    uint64_t v16 = 0LL;
    id v17 = 0LL;
    goto LABEL_11;
  }

  uint64_t v25 = CFDictionaryGetValue(a2, @"ImageSize");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v26 = sub_10000A848(v17);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageSize";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v46 = sub_10000B128( (uint64_t)"handle_receive_bytes",  156LL,  -3,  0LL,  @"Invalid value for %@.",  v43,  v44,  v45,  (uint64_t)@"ImageSize");
    id v10 = (id)objc_claimAutoreleasedReturnValue(v46);
    CFDictionarySetValue(a3, @"Error", @"MissingImageSize");
    id v15 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_11;
  }

  __int16 v28 = CFDictionaryGetValue(a2, @"ImageSignature");
  uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue(v28);
  id v29 = sub_10000A9A8(v16);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (!v30)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageSignature";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v50 = sub_10000B128( (uint64_t)"handle_receive_bytes",  164LL,  -3,  0LL,  @"Invalid value for %@.",  v47,  v48,  v49,  (uint64_t)@"ImageSignature");
    goto LABEL_68;
  }

  if (([v18 isEqualToString:@"Personalized"] & 1) != 0
    || [v18 isEqualToString:@"Cryptex"])
  {
    *(void *)buf = 0LL;
    uint64_t v92 = 0LL;
    unsigned int v31 = [v18 isEqualToString:@"Personalized"];
    uint64_t v16 = v16;
    uint64_t inited = Img4DecodeInitManifest( (uint64_t)-[NSData bytes](v16, "bytes"),  -[NSData length](v16, "length"),  (uint64_t)v100);
    if ((_DWORD)inited)
    {
      uint64_t v33 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v98 = 67109120;
        int v99 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to init img4 manifest: %d",  v98,  8u);
      }

      uint64_t v37 = @"Failed to init img4 manifest: %d";
      uint64_t v90 = v33;
      uint64_t v38 = 186LL;
LABEL_67:
      id v50 = sub_10000B128((uint64_t)"handle_receive_bytes", v38, -2, 0LL, v37, v34, v35, v36, v90);
LABEL_68:
      id v10 = (id)objc_claimAutoreleasedReturnValue(v50);
LABEL_69:
      id v15 = 0LL;
      goto LABEL_11;
    }

    if (v31) {
      uint64_t v51 = 1885629799LL;
    }
    else {
      uint64_t v51 = 1668315236LL;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v100, v51, 1145525076LL, buf, &v92);
    uint64_t v53 = v52;
    if ((_DWORD)v52 == 1)
    {
      if (![v18 isEqualToString:@"Cryptex"])
      {
        uint64_t v53 = 1LL;
        goto LABEL_61;
      }

      Img4DecodeGetObjectPropertyData((uint64_t)v100, 1885629799LL, 1145525076LL, buf, &v92);
      uint64_t v53 = v54;
    }

    if (!(_DWORD)v53)
    {
      uint64_t v55 = objc_alloc(&OBJC_CLASS___NSData);
      uint64_t v56 = -[NSData initWithBytes:length:](v55, "initWithBytes:length:", *(void *)buf, v92);

      if (!v56)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v98 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  v98,  2u);
        }

        id v78 = sub_10000B128( (uint64_t)"handle_receive_bytes",  206LL,  -2,  0LL,  @"Failed to create data.",  v75,  v76,  v77,  v90);
        id v10 = (id)objc_claimAutoreleasedReturnValue(v78);
        uint64_t v16 = 0LL;
        goto LABEL_69;
      }

      uint64_t v16 = v56;
      goto LABEL_49;
    }

LABEL_61:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v98 = 67109120;
      int v99 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  v98,  8u);
    }

    uint64_t v37 = @"Failed to retrieve data from manifest: %d";
    uint64_t v90 = v53;
    uint64_t v38 = 200LL;
    goto LABEL_67;
  }

uint64_t sub_100007DF4(int a1, uint64_t a2, unint64_t a3)
{
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  v24[3] = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  uint64_t v18 = sub_1000080C8;
  int v19 = &unk_1000206E0;
  int v21 = v25;
  unint64_t v22 = a3;
  uint64_t v20 = v24;
  int v23 = a1;
  uint64_t v5 = v17;
  if (a3 >= 0x20000) {
    size_t v6 = 0x20000LL;
  }
  else {
    size_t v6 = a3;
  }
  uint64_t v7 = malloc(v6);
  if (v7)
  {
    uint64_t v8 = v7;
    if (!a3)
    {
LABEL_13:
      free(v8);

      uint64_t v12 = 1LL;
      goto LABEL_24;
    }

    unint64_t v9 = 0LL;
    while (1)
    {
      if (a3 - v9 >= v6) {
        size_t v10 = v6;
      }
      else {
        size_t v10 = a3 - v9;
      }
      uint64_t v11 = lockdown_recv(a2, v8, v10);
      if ((unint64_t)(v11 + 1) <= 1)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        int v13 = *__error();
        *(_DWORD *)buf = 67109120;
        int v28 = v13;
        id v14 = "Failed to receive secure message: %{errno}d";
        uint32_t v15 = 8;
        goto LABEL_20;
      }

      v9 += v11;
      if (v9 >= a3) {
        goto LABEL_13;
      }
    }

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    id v14 = "Transfer cancelled.";
    uint32_t v15 = 2;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
LABEL_21:
    free(v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate buffer.",  buf,  2u);
  }

  uint64_t v12 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to receive data.",  buf,  2u);
    uint64_t v12 = 0LL;
  }

void sub_100008098( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000080C8(uint64_t a1, void *__buf, size_t __nbyte)
{
  uint64_t v6 = a1 + 32;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += __nbyte;
  uint64_t v7 = (uint64_t *)(a1 + 48);
  int v8 = (int)(float)((float)((float)*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_DWORD *)(v9 + 24) != v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000155AC(v6, v7, v8);
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  }

  *(_DWORD *)(v9 + 24) = v8;
  ssize_t v10 = write(*(_DWORD *)(a1 + 56), __buf, __nbyte);
  if (v10 == -1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *__error();
    v13[0] = 67109120;
    v13[1] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Write failed: %{errno}d",  (uint8_t *)v13,  8u);
  }

  return v10 != -1;
}

uint64_t sub_100008238()
{
  id v0 = (void *)MGCopyAnswer(@"DeviceSupportsLockdown", 0LL);
  if (!v0)
  {
    uint64_t remote_service_listener = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Failed to read DeviceSupportsLockdown from gestalt.";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    uint64_t remote_service_listener = 0LL;
    goto LABEL_11;
  }

  id v1 = sub_100003828();
  int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t remote_service_listener = xpc_remote_connection_create_remote_service_listener( "com.apple.mobile.storage_mounter_proxy.bridge",  v2,  0LL);

  if (!remote_service_listener)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Failed to create remote listener.";
    goto LABEL_10;
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100008404;
  void v8[3] = &unk_100020758;
  id v9 = v0;
  xpc_remote_connection_set_event_handler(remote_service_listener, v8, v4, v5);
  xpc_remote_connection_activate(remote_service_listener);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "com.apple.mobile.storage_mounter_proxy.bridge";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RemoteXPC service (%s) alive.",  buf,  0xCu);
  }

  uint64_t remote_service_listener = 1LL;
LABEL_11:

  return remote_service_listener;
}

void sub_100008404(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008498;
  v6[3] = &unk_100020730;
  id v7 = a2;
  id v8 = *(id *)(a1 + 32);
  id v3 = v7;
  xpc_remote_connection_set_event_handler(v3, v6, v4, v5);
  xpc_remote_connection_activate(v3);
}

void sub_100008498(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_remote_connection_cancel(*(void *)(a1 + 32));
    goto LABEL_18;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    uint64_t v5 = reply;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    if (v6)
    {
      dispatch_semaphore_t v7 = v6;
      xpc_object_t value = xpc_dictionary_get_value(v3, "XPCRequestDictionary");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(value);
      ssize_t v10 = v9;
      if (!v9 || xpc_get_type(v9) != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "XPCRequestDictionary";
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %s: %@",  buf,  0x16u);
        }

        uint64_t v14 = @"Invalid value for %s: %@";
        v81 = "XPCRequestDictionary";
        uint64_t v15 = 796LL;
LABEL_9:
        id v16 = sub_10000B128((uint64_t)"remote_service_init_block_invoke", v15, -2, 0LL, v14, v11, v12, v13, (uint64_t)v81);

LABEL_10:
LABEL_11:

        goto LABEL_18;
      }

      id v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject(v10);
      if (!v17)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cannot create CF object from XPC request dictionary",  buf,  2u);
        }

        uint64_t v14 = @"Cannot create CF object from XPC request dictionary";
        uint64_t v15 = 802LL;
        goto LABEL_9;
      }

      uint64_t v18 = v17;
      int v19 = CFDictionaryGetValue(v17, @"HostProcessName");
      uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = sub_10000A950(v20);
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      if (!v22)
      {

        uint64_t v20 = @"unknown";
      }

      int v23 = CFDictionaryGetValue(v18, @"Command");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = sub_10000A950(v24);
      int v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

      BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v27)
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v20;
          *(_WORD *)&_BYTE buf[12] = 2114;
          *(void *)&buf[14] = v24;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Remote connection (%{public}@): %{public}@",  buf,  0x16u);
        }

        CFMutableDictionaryRef v31 = sub_10000A578();
        if (v31)
        {
          CFMutableDictionaryRef v32 = v31;
          if ([v24 isEqualToString:@"ReceiveBytes"])
          {
            if ((sub_100009538(v3, v5, v18, v32) & 1) != 0)
            {

              CFRelease(v18);
LABEL_132:
              CFRelease(v32);

              goto LABEL_11;
            }

            uint64_t v85 = v20;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            uint64_t v39 = "Failed to receive bytes.";
            goto LABEL_45;
          }

          uint64_t v85 = v20;
          if ([v24 isEqualToString:@"LookupImage"])
          {
            if ((sub_100003B7C(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }

            *(_WORD *)buf = 0;
            uint64_t v39 = "Failed to lookup image.";
            goto LABEL_45;
          }

          if ([v24 isEqualToString:@"CopyDevices"])
          {
            if ((sub_1000061F0((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }

            *(_WORD *)buf = 0;
            uint64_t v39 = "Failed to copy device list.";
            goto LABEL_45;
          }

          if ([v24 isEqualToString:@"MountImage"])
          {
            if (sub_100003B4C())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device is locked.",  buf,  2u);
              }

              uint64_t v43 = 855LL;
LABEL_60:
              id v44 = sub_10000B128( (uint64_t)"remote_service_init_block_invoke",  v43,  -2,  0LL,  @"Device is locked.",  v40,  v41,  v42,  (uint64_t)v81);
              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              id v46 = off_100020930;
LABEL_74:
              CFDictionarySetValue(v32, @"Error", *v46);
LABEL_104:
              int v84 = 0;
              goto LABEL_105;
            }

            if (sub_100003A9C())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Existing file transfer in progress.",  buf,  2u);
              }

              uint64_t v50 = 861LL;
LABEL_73:
              id v51 = sub_10000B128( (uint64_t)"remote_service_init_block_invoke",  v50,  -2,  0LL,  @"Existing file transfer in progress.",  v47,  v48,  v49,  (uint64_t)v81);
              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(v51);
              id v46 = off_100020950;
              goto LABEL_74;
            }

            if ((sub_1000042F0(v18, v32) & 1) == 0)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_103;
              }
              *(_WORD *)buf = 0;
              uint64_t v39 = "Failed to mount image.";
LABEL_45:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
LABEL_103:
              uint64_t v45 = 0LL;
              goto LABEL_104;
            }

            goto LABEL_84;
          }

          if ([v24 isEqualToString:@"UnmountImage"])
          {
            if (sub_100003B4C())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device is locked.",  buf,  2u);
              }

              uint64_t v43 = 876LL;
              goto LABEL_60;
            }

            if (sub_100003A9C())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Existing file transfer in progress.",  buf,  2u);
              }

              uint64_t v50 = 882LL;
              goto LABEL_73;
            }

            if ((sub_100004C4C(v18, v32) & 1) == 0)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_103;
              }
              *(_WORD *)buf = 0;
              uint64_t v39 = "Failed to unmount image.";
              goto LABEL_45;
            }

LABEL_84:
            uint64_t v45 = 0LL;
            int v84 = 1;
            goto LABEL_105;
          }

          if ([v24 isEqualToString:@"Hangup"])
          {
            if ((sub_100006474((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }

            *(_WORD *)buf = 0;
            uint64_t v39 = "Failed to hangup.";
            goto LABEL_45;
          }

          if ([v24 isEqualToString:@"RollPersonalizationNonce"])
          {
            if (sub_100003B4C())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device is locked.",  buf,  2u);
              }

              uint64_t v43 = 904LL;
              goto LABEL_60;
            }

            if ((sub_100004F6C((uint64_t)v18, v32) & 1) == 0
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to roll personalization nonce.",  buf,  2u);
            }

            int v84 = 0;
            uint64_t v45 = 0LL;
LABEL_105:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v32;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sending response: %{public}@",  buf,  0xCu);
            }

            uint64_t v53 = _CFXPCCreateXPCObjectFromCFObject(v32);
            uint64_t v86 = (void *)v53;
            if (v53)
            {
              uint64_t v54 = (void *)v53;
              id v55 = v5;
              *(void *)buf = _NSConcreteStackBlock;
              *(void *)&buf[8] = 3221225472LL;
              *(void *)&uint8_t buf[16] = sub_10000A418;
              uint64_t v90 = &unk_1000207A8;
              id v91 = v55;
              LOBYTE(v54) = xpc_dictionary_apply(v54, buf);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create XPC object from CF object.",  buf,  2u);
              }

              id v59 = sub_10000B128( (uint64_t)"remote_service_init_block_invoke",  1038LL,  -2,  0LL,  @"Failed to create XPC object from CF object.",  v56,  v57,  v58,  (uint64_t)v81);
              uint64_t v60 = objc_claimAutoreleasedReturnValue(v59);

              uint64_t v45 = (void *)v60;
            }

            BOOL v61 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v45)
            {
              if (v61)
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to merge XPC dictionary.",  buf,  2u);
              }

              goto LABEL_120;
            }

            if (v61)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to merge XPC dictionary.",  buf,  2u);
            }

            id v65 = sub_10000B128( (uint64_t)"remote_service_init_block_invoke",  1043LL,  -2,  0LL,  @"Failed to merge XPC dictionary.",  v62,  v63,  v64,  (uint64_t)v81);
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(v65);
LABEL_119:
            if (!v45)
            {
LABEL_123:
              xpc_dictionary_send_reply(v5);
              uint64_t v20 = v85;
              uint64_t v75 = v86;
              if (v84)
              {
                if ([*(id *)(a1 + 40) BOOLValue])
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Delegating RSD reset to lockdownd.",  buf,  2u);
                  }
                }

                else
                {
                  uint64_t v76 = v24;
                  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
                  id v78 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
                  v87[0] = _NSConcreteStackBlock;
                  v87[1] = 3221225472LL;
                  v87[2] = sub_10000A0E8;
                  v87[3] = &unk_100020708;
                  v79 = v7;
                  uint64_t v88 = v79;
                  remote_device_browse_present(0xFFFFLL, v78, v87);

                  dispatch_time_t v80 = dispatch_time(0LL, 20000000000LL);
                  if (dispatch_semaphore_wait(v79, v80)
                    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                  {
                    sub_10001564C();
                  }

                  uint64_t v24 = v76;
                  uint64_t v75 = v86;
                }
              }

              CFRelease(v18);

              goto LABEL_132;
            }

LABEL_120:
            uint64_t v83 = v32;
            uint64_t v82 = v24;
            CStringPtr = CFStringGetCStringPtr(@"Error", 0x8000100u);
            xpc_object_t v67 = xpc_dictionary_get_value(v5, CStringPtr);
            id v68 = (void *)objc_claimAutoreleasedReturnValue(v67);

            if (!v68)
            {
              uint64_t v69 = CFStringGetCStringPtr(@"Error", 0x8000100u);
              id v70 = CFStringGetCStringPtr(@"InternalError", 0x8000100u);
              xpc_object_t v71 = xpc_string_create(v70);
              xpc_dictionary_set_value(v5, v69, v71);
            }

            uint64_t v72 = CFStringGetCStringPtr(@"DetailedError", 0x8000100u);
            id v73 = objc_claimAutoreleasedReturnValue([v45 description]);
            xpc_object_t v74 = xpc_string_create((const char *)[v73 UTF8String]);
            xpc_dictionary_set_value(v5, v72, v74);

            uint64_t v24 = v82;
            CFMutableDictionaryRef v32 = v83;
            goto LABEL_123;
          }

          if ([v24 isEqualToString:@"RollCryptexNonce"])
          {
            if (!sub_100003B4C())
            {
              if ((sub_1000051B8((uint64_t)v18, v32) & 1) != 0
                || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                goto LABEL_103;
              }

              *(_WORD *)buf = 0;
              uint64_t v39 = "Failed to roll cryptex nonce.";
              goto LABEL_45;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Device is locked.",  buf,  2u);
            }

            uint64_t v43 = 917LL;
            goto LABEL_60;
          }

          if ([v24 isEqualToString:@"QueryPersonalizationManifest"])
          {
            if ((sub_100005404(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }

            *(_WORD *)buf = 0;
            uint64_t v52 = "Failed to query personalization manifest.";
          }

          else if ([v24 isEqualToString:@"QueryNonce"])
          {
            if ((sub_1000057CC(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }

            *(_WORD *)buf = 0;
            uint64_t v52 = "Failed to query personalization nonce.";
          }

          else if ([v24 isEqualToString:@"QueryPersonalizationIdentifiers"])
          {
            if ((sub_100005A88(v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }

            *(_WORD *)buf = 0;
            uint64_t v52 = "Failed to query personalization identifiers.";
          }

          else if ([v24 isEqualToString:@"QueryCryptexNonce"])
          {
            if ((sub_100005D44((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }

            *(_WORD *)buf = 0;
            uint64_t v52 = "Failed to query cryptex nonce.";
          }

          else
          {
            if (![v24 isEqualToString:@"QueryDeveloperModeStatus"])
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v24;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid command: %@",  buf,  0xCu);
              }

              CFDictionarySetValue(v32, @"Error", @"UnknownCommand");
              goto LABEL_150;
            }

            if ((sub_100005F90((uint64_t)v18, v32) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
LABEL_150:
              uint64_t v45 = 0LL;
              int v84 = 0;
              goto LABEL_105;
            }

            *(_WORD *)buf = 0;
            uint64_t v52 = "Failed to query developer mode status.";
          }

          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
          goto LABEL_150;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
        }

        id v38 = sub_10000B128( (uint64_t)"remote_service_init_block_invoke",  822LL,  -2,  0LL,  @"Failed to create dictionary.",  v35,  v36,  v37,  (uint64_t)v81);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v38);
      }

      else
      {
        if (v27)
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"Command";
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v24;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
        }

        id v33 = sub_10000B128( (uint64_t)"remote_service_init_block_invoke",  813LL,  -2,  0LL,  @"Invalid value for %@: %@",  v28,  v29,  v30,  (uint64_t)@"Command");
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        CFDictionarySetValue(0LL, @"Error", @"MissingCommand");
      }

      CFRelease(v18);

      goto LABEL_10;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create semaphore.",  buf,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create reply.",  buf,  2u);
  }

uint64_t sub_100009538(void *a1, void *a2, const __CFDictionary *a3, __CFDictionary *a4)
{
  id v7 = a1;
  id v8 = a2;
  bzero(__str, 0x400uLL);
  uint64_t v109 = 0LL;
  memset(v108, 0, sizeof(v108));
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    id v18 = sub_10000B128((uint64_t)"handle_receive_bytes", 59LL, -3, 0LL, @"Invalid input(s).", v15, v16, v17, v94);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_22;
  }

  if (sub_100003A9C())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Existing file transfer in progress.",  buf,  2u);
    }

    id v12 = sub_10000B128( (uint64_t)"handle_receive_bytes",  64LL,  -2,  0LL,  @"Existing file transfer in progress.",  v9,  v10,  v11,  v94);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = off_100020950;
LABEL_21:
    CFDictionarySetValue(a4, @"Error", *v14);
LABEL_22:
    id v40 = 0LL;
    id v28 = 0LL;
    int v23 = 0LL;
LABEL_23:
    uint64_t v41 = 0LL;
    LODWORD(v42) = -1;
    goto LABEL_24;
  }

  xpc_object_t value = xpc_dictionary_get_value(v7, "XPCRequestRecvTx");
  uint64_t v20 = objc_claimAutoreleasedReturnValue(value);
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "XPCRequestRecvTx";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %s.",  buf,  0xCu);
    }

    id v39 = sub_10000B128( (uint64_t)"handle_receive_bytes",  71LL,  -3,  0LL,  @"Invalid value for %s.",  v36,  v37,  v38,  (uint64_t)"XPCRequestRecvTx");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v14 = off_100020940;
    goto LABEL_21;
  }

  id v21 = (void *)v20;
  unint64_t v22 = CFDictionaryGetValue(a3, @"ImageType");
  int v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = sub_10000A950(v23);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageType";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v48 = sub_10000B128( (uint64_t)"handle_receive_bytes",  79LL,  -3,  0LL,  @"Invalid value for %@.",  v45,  v46,  v47,  (uint64_t)@"ImageType");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v48);
    CFDictionarySetValue(a4, @"Error", @"MissingImageType");
    goto LABEL_40;
  }

  int v26 = CFDictionaryGetValue(a3, @"ImageSignature");
  uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageSignature";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
    }

    id v52 = sub_10000B128( (uint64_t)"handle_receive_bytes",  87LL,  -3,  0LL,  @"Invalid value for %@.",  v49,  v50,  v51,  (uint64_t)@"ImageSignature");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v52);
LABEL_40:

    id v40 = 0LL;
    id v28 = 0LL;
    goto LABEL_23;
  }

  id v28 = (id)v27;
  if (([v23 isEqualToString:@"Personalized"] & 1) == 0
    && ![v23 isEqualToString:@"Cryptex"])
  {
    goto LABEL_50;
  }

  *(void *)buf = 0LL;
  uint64_t v100 = 0LL;
  unsigned int v29 = [v23 isEqualToString:@"Personalized"];
  id v28 = v28;
  uint64_t inited = Img4DecodeInitManifest( (uint64_t)[v28 bytes],  (uint64_t)objc_msgSend(v28, "length"),  (uint64_t)v108);
  if ((_DWORD)inited)
  {
    uint64_t v31 = inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 67109120;
      int v107 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to init img4 manifest: %d",  v106,  8u);
    }

    id v35 = sub_10000B128( (uint64_t)"handle_receive_bytes",  109LL,  -2,  0LL,  @"Failed to init img4 manifest: %d",  v32,  v33,  v34,  v31);
    goto LABEL_69;
  }

  if (v29) {
    uint64_t v53 = 1885629799LL;
  }
  else {
    uint64_t v53 = 1668315236LL;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v108, v53, 1145525076LL, buf, &v100);
  uint64_t v55 = v54;
  if ((_DWORD)v54 == 1)
  {
    if (![v23 isEqualToString:@"Cryptex"])
    {
      uint64_t v55 = 1LL;
      goto LABEL_62;
    }

    Img4DecodeGetObjectPropertyData((uint64_t)v108, 1885629799LL, 1145525076LL, buf, &v100);
    uint64_t v55 = v56;
  }

  if ((_DWORD)v55)
  {
LABEL_62:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 67109120;
      int v107 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  v106,  8u);
    }

    id v35 = sub_10000B128( (uint64_t)"handle_receive_bytes",  123LL,  -2,  0LL,  @"Failed to retrieve data from manifest: %d",  v77,  v78,  v79,  v55);
    goto LABEL_69;
  }

  uint64_t v57 = objc_alloc(&OBJC_CLASS___NSData);
  uint64_t v58 = -[NSData initWithBytes:length:](v57, "initWithBytes:length:", *(void *)buf, v100);

  if (!v58)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v106 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  v106,  2u);
    }

    id v87 = sub_10000B128( (uint64_t)"handle_receive_bytes",  129LL,  -2,  0LL,  @"Failed to create data.",  v84,  v85,  v86,  v94);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v87);
    id v28 = 0LL;
    goto LABEL_70;
  }

  id v28 = v58;
LABEL_50:
  id v59 = sub_10000EF68();
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  if (!v60)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query working directory.",  buf,  2u);
    }

    uint64_t v75 = @"Failed to query working directory.";
    uint64_t v76 = 136LL;
    goto LABEL_68;
  }

  BOOL v61 = v60;
  uint64_t v62 = sub_10000E4E8(v28, v60);
  id v40 = (id)objc_claimAutoreleasedReturnValue(v62);

  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v28;
      __int16 v104 = 2112;
      v105 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path with signature %@ in %@.",  buf,  0x16u);
    }

    uint64_t v75 = @"Failed to create path with signature %@ in %@.";
    uint64_t v94 = (uint64_t)v28;
    uint64_t v76 = 142LL;
LABEL_68:
    id v35 = sub_10000B128((uint64_t)"handle_receive_bytes", v76, -2, 0LL, v75, v72, v73, v74, v94);
LABEL_69:
    id v13 = (id)objc_claimAutoreleasedReturnValue(v35);
LABEL_70:

    id v40 = 0LL;
    goto LABEL_23;
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v101 = NSFilePosixPermissions;
  v102 = &off_100023510;
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
  id v99 = 0LL;
  unsigned __int8 v64 = [v95 createDirectoryAtPath:v40 withIntermediateDirectories:1 attributes:v63 error:&v99];
  id v13 = v99;

  if ((v64 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %@.",  buf,  0xCu);
    }

    id v83 = sub_10000B128( (uint64_t)"handle_receive_bytes",  147LL,  -2,  0LL,  @"Failed to create %@.",  v80,  v81,  v82,  (uint64_t)v40);
    goto LABEL_80;
  }

  id v40 = v40;
  snprintf(__str, 0x400uLL, "%s/XXXXXX.dmg", (const char *)[v40 UTF8String]);
  uint64_t v65 = mkstemps(__str, 4);
  if ((_DWORD)v65 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v88 = __error();
      id v89 = strerror(*v88);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = __str;
      __int16 v104 = 2080;
      v105 = v89;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %s: %s",  buf,  0x16u);
    }

    uint64_t v90 = __error();
    strerror(*v90);
    id v83 = sub_10000B128( (uint64_t)"handle_receive_bytes",  156LL,  -2,  0LL,  @"Failed to create %s: %s",  v91,  v92,  v93,  (uint64_t)__str);
LABEL_80:
    uint64_t v96 = objc_claimAutoreleasedReturnValue(v83);

    CFDictionarySetValue(a4, @"Error", @"FileCreateFailed");
    uint64_t v41 = 0LL;
    LODWORD(v42) = -1;
LABEL_81:
    id v13 = (id)v96;
    goto LABEL_24;
  }

  uint64_t v42 = v65;
  int v66 = sub_10000E6CC(__str);
  BOOL v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v66)
  {
    if (v67)
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Path is bad: %s",  buf,  0xCu);
    }

    id v71 = sub_10000B128( (uint64_t)"handle_receive_bytes",  162LL,  -2,  0LL,  @"Path is bad: %s",  v68,  v69,  v70,  (uint64_t)__str);
    uint64_t v96 = objc_claimAutoreleasedReturnValue(v71);

    CFDictionarySetValue(a4, @"Error", @"FileCreateFailed");
    uint64_t v41 = 0LL;
    goto LABEL_81;
  }

  if (v67)
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = __str;
    __int16 v104 = 1024;
    LODWORD(v105) = v42;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Writing file %s (%d) ...",  buf,  0x12u);
  }

  uint64_t v41 = 1LL;
  sub_100003A20(1);
  sub_100003894((uint64_t)__str);
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472LL;
  v97[2] = sub_10000A1CC;
  v97[3] = &unk_100020780;
  id v98 = v8;
  xpc_file_transfer_write_to_fd(v21, v42, v97);

LABEL_24:
  if (v13)
  {
    if (!CFDictionaryGetValue(a4, @"Error")) {
      CFDictionarySetValue(a4, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a4, @"DetailedError", [v13 description]);
  }

  if ((_DWORD)v42 == -1) {
    char v43 = 1;
  }
  else {
    char v43 = v41;
  }
  if ((v43 & 1) == 0) {
    close(v42);
  }

  return v41;
}

void sub_10000A0E8(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Done resetting devices.",  buf,  2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resetting device.",  v7,  2u);
    }

    if ((remote_device_reset(v5) & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000156CC();
    }
  }
}

void sub_10000A1CC(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to write from remote file: %d",  buf,  8u);
    }

    id v7 = sub_10000B128( (uint64_t)"handle_receive_bytes_block_invoke",  185LL,  -2,  0LL,  @"Failed to write from remote file: %d",  v4,  v5,  v6,  a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = *(void **)(a1 + 32);
    CStringPtr = CFStringGetCStringPtr(@"Error", 0x8000100u);
    uint64_t v11 = CFStringGetCStringPtr(@"InternalError", 0x8000100u);
    xpc_object_t v12 = xpc_string_create(v11);
    xpc_dictionary_set_value(v9, CStringPtr, v12);

    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = CFStringGetCStringPtr(@"DetailedError", 0x8000100u);
    id v15 = objc_claimAutoreleasedReturnValue([v8 description]);
    xpc_object_t v16 = xpc_string_create((const char *)[v15 UTF8String]);
    xpc_dictionary_set_value(v13, v14, v16);

    xpc_dictionary_send_reply(*(void *)(a1 + 32));
    if (v8)
    {
      sub_100003894(0LL);
    }
  }

  else
  {
    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = CFStringGetCStringPtr(@"Status", 0x8000100u);
    int v19 = CFStringGetCStringPtr(@"Complete", 0x8000100u);
    xpc_object_t v20 = xpc_string_create(v19);
    xpc_dictionary_set_value(v17, v18, v20);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully wrote remote file.",  buf,  2u);
    }

    xpc_dictionary_send_reply(*(void *)(a1 + 32));
  }

  sub_100003A20(0);
}

uint64_t sub_10000A418(uint64_t a1, const char *a2, void *a3)
{
  return 1LL;
}

uint64_t start()
{
  if ((_set_user_dir_suffix("com.apple.mobile_storage_proxy") & 1) == 0) {
    sub_1000157F0();
  }
  id v0 = sub_10000EF68();
  uint64_t v1 = objc_claimAutoreleasedReturnValue(v0);
  if (!v1) {
    sub_100015710(0LL, v2, v3, v4, v5, v6, v7, v8);
  }
  uint64_t v9 = (void *)v1;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v22 = NSFilePosixPermissions;
  int v23 = &off_100023528;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  id v21 = 0LL;
  unsigned __int8 v12 = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:v11 error:&v21];
  id v13 = v21;

  if ((v12 & 1) == 0) {
    sub_10001578C(v13, (uint64_t)v9, v14, v15, v16, v17, v18, v19);
  }
  if ((sub_100008238() & 1) == 0) {
    sub_100015774();
  }
  if (!sub_1000065A8()) {
    sub_10001575C();
  }
  CFRunLoopRun();

  return 0LL;
}

id sub_10000A570(void *a1, const char *a2)
{
  return [a1 UTF8String];
}

CFMutableDictionaryRef sub_10000A578()
{
  return CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
}

NSString *sub_10000A59C(void *a1)
{
  io_registry_entry_t entry = 0;
  id v1 = sub_10000A70C(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = IOBSDNameMatching( kIOMasterPortDefault, 0, (const char *)[v2 UTF8String]);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    io_registry_entry_t entry = MatchingService;
    if (MatchingService)
    {
      io_object_t v6 = MatchingService;
      if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
      {
        uint64_t v9 = 0LL;
        CFProperty = 0LL;
LABEL_17:
        IOObjectRelease(v6);
        goto LABEL_18;
      }

      if (sub_10000A7AC(&entry, "AppleAPFSContainer")
        && sub_10000A7AC(&entry, "AppleAPFSMedia")
        && sub_10000A7AC(&entry, "AppleAPFSContainerScheme")
        && sub_10000A7AC(&entry, "IOMedia"))
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"BSD Name", kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/dev/%@",  CFProperty);
          if (v8)
          {
            uint64_t v9 = v8;
            goto LABEL_14;
          }
        }
      }

      else
      {
        CFProperty = 0LL;
      }

      uint64_t v9 = 0LL;
LABEL_14:
      io_object_t v6 = entry;
      if (!entry) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  uint64_t v9 = 0LL;
  CFProperty = 0LL;
LABEL_18:

  return v9;
}

id sub_10000A70C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = @"/dev/r";
    if (([v3 hasPrefix:@"/dev/r"] & 1) != 0
      || (uint64_t v4 = @"/dev/", [v3 hasPrefix:@"/dev/"]))
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v4, "length")));

      id v3 = (id)v5;
    }

    id v6 = v3;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

uint64_t sub_10000A7AC(io_object_t *a1, const char *a2)
{
  uint64_t result = 0LL;
  io_registry_entry_t parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      uint64_t result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0LL;
      }
    }

    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1LL;
    }
  }

  return result;
}

id sub_10000A834(void *a1)
{
  return a1;
}

id sub_10000A848(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10000A8A0(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10000A8F8(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10000A950(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10000A9A8(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10000AA00(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSURL), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t sub_10000AA58(void *a1, void *a2)
{
  id v3 = a1;
  bzero(v28, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_registry_entry_t entry = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  entry,  2u);
    }

    id v3 = 0LL;
    goto LABEL_32;
  }

  id v4 = sub_10000A70C(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (!v5
    || (id v7 = v5,
        uint64_t v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v7 UTF8String]),
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8),
        (*(_DWORD *)io_registry_entry_t entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }

  io_object_t v10 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v10);

    goto LABEL_16;
  }

  if (!sub_10000F23C((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !sub_10000F23C((io_object_t *)entry, "AppleAPFSMedia"))
  {
    char v22 = 0;
    uint64_t v11 = 0LL;
LABEL_45:
    id CFProperty = 0LL;
    goto LABEL_46;
  }

  uint64_t v11 = (void *)IORegistryEntrySearchCFProperty( *(io_registry_entry_t *)entry,  "IOService",  @"Content Hint",  kCFAllocatorDefault,  0);
  if (!a2)
  {
    id CFProperty = 0LL;
    goto LABEL_55;
  }

  if (!sub_10000F23C((io_object_t *)entry, "AppleAPFSContainer")
    || !sub_10000F23C((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    char v22 = 0;
    goto LABEL_45;
  }

  id CFProperty = (id)IORegistryEntryCreateCFProperty( *(io_registry_entry_t *)entry,  @"BSD Name",  kCFAllocatorDefault,  0);
  id v13 = sub_10000A950(CFProperty);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([@"/dev/" stringByAppendingString:CFProperty]);

    if (v15)
    {
      id CFProperty = v15;
      *a2 = CFProperty;
LABEL_55:
      char v22 = 1;
      goto LABEL_46;
    }

    goto LABEL_44;
  }

  char v22 = 0;
LABEL_46:
  if (*(_DWORD *)entry) {
    IOObjectRelease(*(io_object_t *)entry);
  }

  if ((v22 & 1) != 0)
  {
    uint64_t v19 = 6LL;
    goto LABEL_53;
  }

LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", @"/dev/", *(void *)entry) & 1) == 0)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([@"/dev" stringByAppendingString:v3]);

    id v3 = (id)v16;
  }

  id v3 = v3;
  int v17 = open((const char *)[v3 UTF8String], 0);
  if (v17 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v26 = 1024;
      int v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to open %@: %{errno}d",  entry,  0x12u);
    }

LABEL_32:
    uint64_t v19 = 0LL;
    goto LABEL_53;
  }

  int v18 = v17;
  if (read(v17, v28, 0x1000uLL) == 4096)
  {
    if (v28[0] == 233 || v28[0] == 235 && v28[2] == 144)
    {
      if (v29 == 0x202020205346544ELL)
      {
        uint64_t v19 = 5LL;
      }

      else if (v29 == 0x2020205441465845LL)
      {
        uint64_t v19 = 4LL;
      }

      else
      {
        uint64_t v19 = 1LL;
      }
    }

    else if (v30 == 11080)
    {
      uint64_t v19 = 2 * (v31 == 4);
    }

    else if (v31 == 5 && v30 == 22600)
    {
      uint64_t v19 = 3LL;
    }

    else
    {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v26 = 1024;
      int v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to read %@ volume header: %{errno}d",  entry,  0x12u);
      uint64_t v19 = 0LL;
    }
  }

  close(v18);
LABEL_53:

  return v19;
}

  return v31;
}

BOOL sub_10000AEF4()
{
  size_t v4 = 8LL;
  uint64_t v5 = 0LL;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0LL, 0LL)) {
    return v5 == 1;
  }
  id v0 = __error();
  BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0LL;
  if (v1)
  {
    int v3 = *v0;
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to read developer mode status: %{darwin.errno}d",  buf,  8u);
    return 0LL;
  }

  return result;
}

BOOL sub_10000AFDC(BOOL *a1, void *a2)
{
  int v13 = 0;
  size_t v12 = 4LL;
  if (sysctlbyname("security.codesigning.config", &v13, &v12, 0LL, 0LL))
  {
    int v4 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "security.codesigning.config";
      __int16 v16 = 1024;
      int v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to read sysctl (%s): %{darwin.errno}d",  buf,  0x12u);
    }

    id v8 = sub_10000B128( (uint64_t)"systemSupportsRestrictedExecutionMode",  773LL,  -2,  0LL,  @"Failed to read sysctl (%s): %{darwin.errno}d",  v5,  v6,  v7,  (uint64_t)"security.codesigning.config");
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (a2 && v9)
    {
      id v9 = v9;
      *a2 = v9;
    }
  }

  else
  {
    id v9 = 0LL;
    if (a1) {
      *a1 = (v13 & 0x2000000) != 0;
    }
  }

  BOOL v10 = v9 == 0LL;

  return v10;
}

id sub_10000B128( uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = -[NSMutableString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:arguments:",  v14,  &a9);

  __int16 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v17 = v16;
  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v15,  NSLocalizedDescriptionKey);
  }
  if (v13) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);
  }
  if (os_variant_allows_internal_security_policies(0LL))
  {
    if (a1)
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  @"FunctionName");
    }

    if ((_DWORD)a2)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, @"SourceLine");
    }
  }

  int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileStorage.ErrorDomain",  a3,  v17));

  return v20;
}

BOOL sub_10000B29C()
{
  uint64_t v4 = 0LL;
  if ((os_parse_boot_arg_int("allow_msm_to_invalidate_attestations", &v4) & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v0 = (const char *)&unk_10001E39A;
      *(_DWORD *)buf = 136315650;
      if (!v4) {
        id v0 = " not";
      }
      uint64_t v6 = v0;
      __int16 v7 = 2080;
      id v8 = "allow_msm_to_invalidate_attestations";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      BOOL v1 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      uint32_t v2 = 32;
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v6 = "allow_msm_to_invalidate_attestations";
      BOOL v1 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
      uint32_t v2 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v1, buf, v2);
    }
  }

  return v4 != 0;
}

BOOL sub_10000B3E0(io_registry_entry_t a1)
{
  BOOL v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"Protocol Characteristics",  kCFAllocatorDefault,  3u);
  if (!v1) {
    return 0LL;
  }
  uint32_t v2 = v1;
  Value = (const __CFString *)CFDictionaryGetValue(v1, @"Physical Interconnect");
  if (Value) {
    BOOL v4 = CFStringCompare(Value, @"Virtual Interface", 0LL) == kCFCompareEqualTo;
  }
  else {
    BOOL v4 = 0LL;
  }
  CFRelease(v2);
  return v4;
}

NSMutableDictionary *sub_10000B468(int a1)
{
  uint64_t v47 = 0LL;
  id v48 = 0LL;
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v40)
  {
    int v2 = getfsstat(0LL, 0, 2);
    if (v2 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
      }

      uint64_t v41 = 0LL;
    }

    else
    {
      int v3 = v2;
      unint64_t v4 = 0LL;
      uint64_t v41 = 0LL;
      do
      {
        unint64_t v5 = 2168LL * v3;
        if (v4 > v5)
        {
          if (v41) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }

        if (v41) {
          free(v41);
        }
        unint64_t v4 = v5 + 2168;
        uint64_t v6 = (statfs *)malloc(v5 + 2168);
        if (!v6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v10;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %{errno}d",  buf,  8u);
          }

LABEL_21:
          uint64_t v41 = 0LL;
          goto LABEL_22;
        }

        uint64_t v41 = v6;
        int v3 = getfsstat(v6, v5 + 2168, 2);
      }

      while ((v3 & 0x80000000) == 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
      }

LABEL_40:
        id v28 = 0LL;
        uint64_t v29 = 0LL;
        id v23 = 0LL;
        __int16 v30 = 0LL;
        char v31 = 0LL;
        uint64_t v42 = (uint64_t)v17;
        goto LABEL_62;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v37;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
    }

    id v8 = 0LL;
LABEL_78:
    if (v41) {
      free(v41);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
    }

    id v8 = 0LL;
  }

  if (v48) {
    cryptex_msm_array_destroy(v48, v47);
  }

  return v40;
}

void sub_10000BDE0(_Unwind_Exception *a1)
{
}

NSMutableDictionary *sub_10000BE00(uint64_t a1, CFDictionaryRef *a2, uint64_t a3)
{
  if (!a1 || (v3 = a3, (unint64_t v4 = a2) == 0LL) && a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      int v7 = 0LL;
      id v8 = 0LL;
      int v9 = 0LL;
      int v10 = 0LL;
      unint64_t v4 = 0LL;
      uint64_t v11 = 0LL;
      unsigned int v12 = 0LL;
      __int128 v13 = 0LL;
      int v14 = 0LL;
LABEL_8:
      uint64_t v15 = 0LL;
      goto LABEL_9;
    }

    *(_WORD *)buf = 0;
    uint64_t v6 = "Invalid intput.";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_7;
  }

  int v17 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a1 + 1112,  4LL);
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Failed to create string.";
    goto LABEL_6;
  }

  int v14 = (__CFString *)v17;
  uint64_t v18 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a1 + 88,  4LL);
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    unsigned int v12 = 0LL;
    __int128 v13 = 0LL;
    goto LABEL_8;
  }

  __int128 v13 = v18;
  uint64_t v19 = -[NSString UTF8String](v13, "UTF8String");
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v35 = "Failed to get C string.";
LABEL_51:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    }

LABEL_52:
    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    unsigned int v12 = 0LL;
    goto LABEL_8;
  }

  int v20 = v19;
  int v21 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a1 + 72,  4LL);
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v35 = "Failed to create string.";
      goto LABEL_51;
    }

    goto LABEL_52;
  }

  unsigned int v12 = v21;
  char v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_8;
  }

  uint64_t v15 = v22;
  __s2 = v20;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", @"MassStorage");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, @"DeviceNode");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, @"MountPath");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, @"FilesystemType");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"IsMounted");
  id v23 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v14);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v58 = v14;
      __int16 v59 = 2080;
      uint64_t v60 = (NSString *)(a1 + 88);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create URL (%@ / %s).",  buf,  0x16u);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    goto LABEL_62;
  }

  int v10 = v23;
  id v24 = objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v23, "lastPathComponent"));
  matching = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v24 UTF8String]);

  if (!matching)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v10, "lastPathComponent"));
      *(_DWORD *)buf = 138412290;
      CFStringRef v58 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create a BSD matching dictionary for %@.",  buf,  0xCu);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
LABEL_62:
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_9;
  }

  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  mach_port_t mainPort = MatchingService;
  if (!MatchingService || !sub_10000B3E0(MatchingService)) {
    goto LABEL_99;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"DiskImage",  @"DeviceType");
  if (!strcmp("/Developer", __s2))
  {
    int v37 = @"Developer";
    uint64_t v38 = off_100020B08;
LABEL_98:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v37, *v38);
    goto LABEL_99;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
    __int128 v39 = off_100020B50;
LABEL_97:
    int v37 = *v39;
    uint64_t v38 = off_100020B28;
    goto LABEL_98;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
    __int128 v39 = off_100020B40;
    goto LABEL_97;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
    __int128 v39 = off_100020B30;
    goto LABEL_97;
  }

  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = off_100020B48;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = off_100020B60;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = off_100020B68;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = off_100020B70;
    }

    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = off_100020B78;
    }

    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          CFDictionaryRef matchingb = 0LL;
          id v8 = 0LL;
          int v9 = 0LL;
          goto LABEL_100;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Cryptex",  @"DiskImageType");
        if (v3)
        {
          while (1)
          {
            CFDictionaryRef matchinga = *v4;
            uint64_t v26 = ((uint64_t (*)(void))cryptex_msm_get_string)();
            if (v26)
            {
              uint32_t v27 = (const char *)v26;
              size_t v28 = strlen((const char *)(a1 + 1112));
              if (strnstr(v27, (const char *)(a1 + 1112), v28))
              {
                uint64_t string = cryptex_msm_get_string(matchinga, 1LL);
                if (string)
                {
                  uint64_t v30 = string;
                  uint64_t v31 = cryptex_msm_get_string(matchinga, 0LL);
                  if (v31) {
                    break;
                  }
                }
              }
            }

            ++v4;
            if (!--v3) {
              goto LABEL_37;
            }
          }

          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v49,  @"CryptexName");

          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v30));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v50,  @"CryptexVersion");
        }

LABEL_37:
        uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"CryptexName"));
        if (!v32
          || (id v33 = (void *)v32,
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15,  "objectForKeyedSubscript:",  @"CryptexVersion")),  v34,  v33,  !v34))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v58 = v14;
            __int16 v59 = 2112;
            uint64_t v60 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).",  buf,  0x16u);
          }

          int v7 = 0LL;
          CFDictionaryRef matchingb = 0LL;
          id v8 = 0LL;
          int v9 = 0LL;
          unint64_t v4 = 0LL;
          uint64_t v11 = 0LL;
LABEL_108:
          io_object_t v46 = mainPort;
          if (!mainPort) {
            goto LABEL_110;
          }
          goto LABEL_109;
        }

LABEL_99:
        CFDictionaryRef matchingb = 0LL;
        id v8 = 0LL;
        int v9 = 0LL;
        unint64_t v4 = 0LL;
LABEL_100:
        uint64_t v11 = 0LL;
        goto LABEL_101;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = off_100020B80;
    }

    goto LABEL_97;
  }

  uint64_t v40 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v13,  "stringByAppendingPathComponent:",  @"Library/Frameworks/DTRemoteServices.framework"));
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path.",  buf,  2u);
    }

    uint64_t v11 = 0LL;
    unint64_t v4 = 0LL;
    goto LABEL_86;
  }

  unint64_t v4 = (CFDictionaryRef *)v40;
  Unique = (__CFBundle *)_CFBundleCreateUnique( 0LL,  +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v40,  0LL));
  if (!Unique)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query bundle for DTRemoteServices.framework.",  buf,  2u);
    }

    uint64_t v11 = 0LL;
LABEL_86:
    int v9 = 0LL;
    id v8 = 0LL;
    CFDictionaryRef matchingb = 0LL;
    goto LABEL_95;
  }

  CFDictionaryRef matchingb = Unique;
  CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(Unique, kCFBundleVersionKey);
  uint64_t v43 = objc_claimAutoreleasedReturnValue(ValueForInfoDictionaryKey);
  if (v43)
  {
    uint64_t v11 = (void *)v43;
    uint64_t v44 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", @"version.plist"));
    if (v44)
    {
      id v8 = (void *)v44;
      id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int __s2a = [v45 fileExistsAtPath:v8];

      if (__s2a)
      {
        int v9 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  v8);
        if (v9)
        {
LABEL_76:
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v11,  @"PersonalizedImageVersion");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v9,  @"PersonalizedImageVersionInfo");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"DeveloperDiskImage",  @"PersonalizedImageType");
LABEL_101:
          if ((*(_DWORD *)(a1 + 64) & 1) != 0) {
            uint64_t v47 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v47 = &__kCFBooleanFalse;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v47,  @"IsReadOnly");
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0) {
            id v48 = &__kCFBooleanTrue;
          }
          else {
            id v48 = &__kCFBooleanFalse;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v48,  @"SupportsContentProtection");
          int v7 = v15;
          goto LABEL_108;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100015908((uint64_t)v8, (uint64_t)v11);
        }
      }

      int v9 = 0LL;
      goto LABEL_76;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path.",  buf,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v58 = kCFBundleVersionKey;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query bundle key %@.",  buf,  0xCu);
    }

    uint64_t v11 = 0LL;
  }

  int v9 = 0LL;
  id v8 = 0LL;
LABEL_95:
  int v7 = 0LL;
  io_object_t v46 = mainPort;
LABEL_109:
  IOObjectRelease(v46);
LABEL_110:
  if (matchingb) {
    CFRelease(matchingb);
  }
LABEL_9:

  return v7;
}

void sub_10000CB10(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (([*(id *)(a1 + 32) hasPrefix:a2] & 1) != 0
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"DiskImageType"]),
        unsigned int v7 = [v6 isEqualToString:@"Cryptex"],
        v6,
        v7))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }
}

id sub_10000CB94(uint64_t a1)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Invalid input.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }

LABEL_10:
    unint64_t v5 = 0LL;
    int v2 = 0LL;
    id v4 = 0LL;
LABEL_11:
    uint64_t v3 = 0LL;
    goto LABEL_12;
  }

  uint64_t v1 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a1);
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Failed to create string.";
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  int v2 = v1;
  id v8 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[DiskImages2 imageURLFromDevice:error:]( &OBJC_CLASS___DiskImages2,  "imageURLFromDevice:error:",  v1,  &v8));
  id v4 = v8;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve image URL: %@",  buf,  0xCu);
    }

    unint64_t v5 = 0LL;
    goto LABEL_11;
  }

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
LABEL_12:

  return v5;
}

  unint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  BOOL result = 0LL;
  *a2 = v5;
  return result;
}

NSString *sub_10000CD38(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 pathComponents]);
  if ((unint64_t)[v1 count] >= 4)
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 3));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 2));
    int v2 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@%@", v4, v5);
  }

  else
  {
    int v2 = 0LL;
  }

  return v2;
}

NSMutableDictionary *sub_10000CDF0()
{
  kern_return_t v8;
  __int16 v9;
  void *Value;
  NSMutableDictionary *v11;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;
  properties = 0LL;
  existing = 0;
  id v0 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v0)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (CFMutableDictionaryRef v2 = v1,
          -[__CFDictionary setObject:forKeyedSubscript:]( v1,  "setObject:forKeyedSubscript:",  &off_100023540,  @"bInterfaceClass"),  -[__CFDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &off_100023558,  @"bInterfaceSubClass"),  -[__CFDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &off_100023558,  @"bInterfaceProtocol"),  !IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))
      && (io_object_t v6 = IOIteratorNext(existing)) != 0)
    {
      io_object_t v7 = v6;
      id v4 = 0LL;
      uint64_t v3 = 0LL;
      do
      {
        id v8 = IORegistryEntryCreateCFProperties(v7, &properties, 0LL, 0);
        if (v8)
        {
          int v9 = v8;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v15) = v9 & 0x3FFF;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryCreateCFProperties failed: 0x%04x",  buf,  8u);
          }
        }

        else
        {
          Value = (void *)CFDictionaryGetValue(properties, @"locationID");

          if (Value)
          {
            uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

            if (v11)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  Value,  @"LocationID");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  @"PTPCamera",  @"DeviceType");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v0,  "setObject:forKeyedSubscript:",  v11,  @"PTPNode");
              uint64_t v3 = v11;
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
              }

              uint64_t v3 = 0LL;
            }

            id v4 = Value;
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v15 = "locationID";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve %s.",  buf,  0xCu);
            }

            id v4 = 0LL;
          }
        }

        if (properties) {
          CFRelease(properties);
        }
        properties = 0LL;
        IOObjectRelease(v7);
        io_object_t v7 = IOIteratorNext(existing);
      }

      while (v7);
    }

    else
    {
      uint64_t v3 = 0LL;
      id v4 = 0LL;
    }

    if (existing) {
      IOObjectRelease(existing);
    }
  }

  else
  {
    id v4 = 0LL;
    uint64_t v3 = 0LL;
  }

  return v0;
}

NSMutableDictionary *sub_10000D118()
{
  kern_return_t v12;
  __int16 v13;
  const char *v14;
  uint32_t v15;
  const void *Value;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  const void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  void *v28;
  id v29;
  void *v30;
  const void *v31;
  void *v32;
  id v33;
  void *v34;
  const void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  int v41;
  NSMutableDictionary *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v46;
  char v47;
  NSMutableDictionary *v48;
  NSMutableDictionary *v49;
  uint8_t v50;
  char v51[15];
  uint8_t v52;
  char v53[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v56[4];
  uint64_t v57;
  uint8_t v58[4];
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const char *v63;
  _BYTE v64[72];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  properties = 0LL;
  existing = 0;
  bzero(v64, 0x878uLL);
  id v0 = IOServiceMatching("IOMedia");
  CFMutableDictionaryRef v1 = 0LL;
  CFMutableDictionaryRef v2 = 0LL;
  uint64_t v3 = 0LL;
  id v4 = 0LL;
  unint64_t v5 = 0LL;
  io_object_t v6 = 0LL;
  io_object_t v7 = 0LL;
  id v8 = 0LL;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
  {
    int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v9)
    {
      CFMutableDictionaryRef v1 = v9;
      io_object_t v10 = IOIteratorNext(existing);
      if (v10)
      {
        io_object_t v11 = v10;
        id v48 = v1;
        uint64_t v49 = 0LL;
        id v8 = 0LL;
        io_object_t v7 = 0LL;
        io_object_t v6 = 0LL;
        unint64_t v5 = 0LL;
        id v4 = 0LL;
        uint64_t v3 = 0LL;
        uint64_t v47 = 1;
        while (1)
        {
          if (!sub_10000B3E0(v11))
          {
            unsigned int v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0LL, 0);
            if (v12)
            {
              __int128 v13 = v12;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v61) = v13 & 0x3FFF;
                int v14 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                uint64_t v15 = 8;
LABEL_9:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v14,  buf,  v15);
              }
            }

            else
            {
              if (properties)
              {
                Value = CFDictionaryGetValue(properties, @"BSD Name");
                int v17 = (void *)objc_claimAutoreleasedReturnValue(Value);

                uint64_t v18 = sub_10000A950(v17);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

                if (v19)
                {
                  int v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/dev/%@",  v17);

                  if (v20)
                  {
                    int v21 = CFDictionaryGetValue(properties, @"Content");
                    char v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

                    id v23 = sub_10000A950(v22);
                    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                    if (v24)
                    {
                      if ([@"C12A7328-F81F-11D2-BA4B-00A0C93EC93B" isEqualToString:v22])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_100015990(&v52, v53, v25);
                        }
LABEL_32:
                        uint64_t v3 = v20;
                        unint64_t v5 = v22;
                        io_object_t v6 = v17;
                        goto LABEL_33;
                      }

                      if ([@"Apple_partition_map" isEqualToString:v22])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_1000159C8(&v50, v51, v26);
                        }
                        goto LABEL_32;
                      }

                      uint32_t v27 = CFDictionaryGetValue(properties, @"Removable");
                      size_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

                      uint64_t v29 = sub_10000A848(v28);
                      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

                      if (v30)
                      {
                        if (([v28 BOOLValue] & 1) == 0 && (sub_10000DBBC(v11) & 1) == 0)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                            sub_100015A40(v58, (uint64_t)v17, &v59);
                          }
                          uint64_t v3 = v20;
                          unint64_t v5 = v22;
                          io_object_t v6 = v17;
LABEL_59:
                          id v8 = v28;
                          goto LABEL_33;
                        }

                        uint64_t v31 = CFDictionaryGetValue(properties, @"Leaf");
                        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

                        id v33 = sub_10000A848(v32);
                        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

                        if (v34)
                        {
                          if ([v32 BOOLValue])
                          {
                            io_object_t v46 = v32;
                            id v35 = CFDictionaryGetValue(properties, @"Writable");
                            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

                            int v37 = sub_10000A848(v36);
                            uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
                            if (v38)
                            {
                              __int128 v39 = (void *)v38;
                              uint64_t v40 = [v36 BOOLValue];

                              v47 &= v40 ^ 1;
                            }

                            uint64_t v41 = sub_10000AA58(v20, 0LL);
                            if (v41 == 4 || (v41 & 3) == 1)
                            {
                              uint64_t v3 = v20;
                              if ((unint64_t)__strlcpy_chk( &v66,  -[NSString UTF8String](v3, "UTF8String"),  1024LL,  1024LL) >= 0x400)
                              {
                                id v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
LABEL_71:
                                *(_WORD *)buf = 0;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid string size.",  buf,  2u);
                                goto LABEL_72;
                              }

                              uint64_t v3 = v3;
                              if ((unint64_t)__strlcpy_chk( &v67,  -[NSString UTF8String](v3, "UTF8String"),  1024LL,  1024LL) >= 0x400)
                              {
                                id v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
                                goto LABEL_71;
                              }

                              if ((unint64_t)__strlcpy_chk(&v65, "exfat", 16LL, 16LL) >= 0x10)
                              {
                                id v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_71;
                                }
LABEL_72:
                                id v4 = v36;
                                unint64_t v5 = v22;
                                io_object_t v6 = v17;
                                io_object_t v7 = v46;
                                goto LABEL_33;
                              }

                              uint64_t v44 = sub_10000BE00((uint64_t)v64, 0LL, 0LL);
                              uint64_t v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v44);

                              if (!v42)
                              {
                                id v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  uint64_t v49 = 0LL;
                                  id v4 = v36;
                                  unint64_t v5 = v22;
                                  io_object_t v6 = v17;
                                  io_object_t v7 = v46;
                                  goto LABEL_33;
                                }

                                *(_DWORD *)buf = 138412290;
                                BOOL v61 = (const char *)v3;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create map entry for %@.",  buf,  0xCu);
                                uint64_t v49 = 0LL;
                                goto LABEL_72;
                              }
                            }

                            else
                            {
                              uint64_t v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

                              if (!v42)
                              {
                                id v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
                                }

                                uint64_t v49 = 0LL;
                                uint64_t v3 = v20;
                                goto LABEL_72;
                              }

                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  @"MassStorage",  @"DeviceType");
                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  v20,  @"DeviceNode");
                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"IsMounted");
                              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v47 & 1));
                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  v43,  @"IsReadOnly");
                            }

                            -[NSMutableDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  v42,  v20);
                            uint64_t v49 = v42;
                            uint64_t v3 = v20;
                            id v4 = v36;
                            unint64_t v5 = v22;
                            io_object_t v6 = v17;
                            io_object_t v7 = v32;
                          }

                          else
                          {
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                              sub_100015A00(v56, (uint64_t)v17, &v57);
                            }
                            uint64_t v3 = v20;
                            unint64_t v5 = v22;
                            io_object_t v6 = v17;
                            io_object_t v7 = v32;
                          }

                          goto LABEL_59;
                        }

                        io_object_t v7 = v32;
                        id v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          BOOL v61 = (const char *)v17;
                          uint64_t v62 = 2080;
                          uint64_t v63 = "Leaf";
LABEL_26:
                          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The attached media object %@ does not have a '%s' flag.",  buf,  0x16u);
                        }
                      }

                      else
                      {
                        id v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          BOOL v61 = (const char *)v17;
                          uint64_t v62 = 2080;
                          uint64_t v63 = "Removable";
                          goto LABEL_26;
                        }
                      }
                    }

                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      BOOL v61 = (const char *)v17;
                      uint64_t v62 = 2080;
                      uint64_t v63 = "Content";
                      goto LABEL_26;
                    }

                    uint64_t v3 = v20;
                    unint64_t v5 = v22;
                  }

                  else
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
                    }

                    uint64_t v3 = 0LL;
                  }
                }

                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  BOOL v61 = "BSD Name";
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve %s.",  buf,  0xCu);
                }

                io_object_t v6 = v17;
                goto LABEL_33;
              }

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                int v14 = "Failed to retrieve any properties for the matched service.";
                uint64_t v15 = 2;
                goto LABEL_9;
              }
            }
          }

LABEL_33:
          IOObjectRelease(v11);
          if (properties) {
            CFRelease(properties);
          }
          properties = 0LL;
          io_object_t v11 = IOIteratorNext(existing);
          if (!v11)
          {
            CFMutableDictionaryRef v1 = v48;
            CFMutableDictionaryRef v2 = v49;
            goto LABEL_81;
          }
        }
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
      }

      CFMutableDictionaryRef v1 = 0LL;
    }

    CFMutableDictionaryRef v2 = 0LL;
    uint64_t v3 = 0LL;
    id v4 = 0LL;
    unint64_t v5 = 0LL;
    io_object_t v6 = 0LL;
    io_object_t v7 = 0LL;
    id v8 = 0LL;
  }

LABEL_81:
  if (existing) {
    IOObjectRelease(existing);
  }

  return v1;
}

uint64_t sub_10000DBBC(io_object_t a1)
{
  kern_return_t ParentEntry;
  void v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;
  unsigned int v12 = 0LL;
  __int128 v13 = &v12;
  int v14 = 0x2020000000LL;
  uint64_t v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  int v9 = (void (*)(void))sub_10000E460;
  io_object_t v10 = &unk_100020C70;
  io_object_t v11 = &v12;
  CFMutableDictionaryRef v2 = v8;
  int v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        io_registry_entry_t parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0) {
          break;
        }
        a1 = parent;
        if (!parent) {
          goto LABEL_3;
        }
        ((void (*)(void *, void, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v19 = ParentEntry & 0x3FFF;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryGetParentEntry failed: 0x%04x",  buf,  8u);
      }
    }
  }

LABEL_3:
  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_10000DD78( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

NSMutableDictionary *sub_10000DD9C(int a1)
{
  CFMutableDictionaryRef v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v2)
  {
    uint64_t v3 = sub_10000CDF0();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4) {
      -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v4);
    }
    unint64_t v5 = sub_10000D118();
    io_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (v6) {
      -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v6);
    }
    io_object_t v7 = sub_10000B468(a1);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v8);
    }
  }

  return v2;
}

id sub_10000DE3C(void *a1)
{
  CFMutableDictionaryRef v1 = sub_10000DEE8(@"MassStorage", @"DeviceNode", a1, 0);
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = v2;
  if (v2
    && [v2 count]
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]),
        id v5 = sub_10000A8A0(v4),
        io_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v6,
        v4,
        v6))
  {
    io_object_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
  }

  else
  {
    io_object_t v7 = 0LL;
  }

  return v7;
}

NSMutableArray *sub_10000DEE8(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v33 = a2;
  id v32 = a3;
  if (!v7 || !v33 || !v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    goto LABEL_26;
  }

  id v8 = sub_10000DD9C(a4);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v26) {
      sub_100015A80(v26, v27, v28);
    }
LABEL_26:
    uint64_t v31 = 0LL;
    uint64_t v29 = 0LL;
    __int128 v13 = 0LL;
    id v10 = 0LL;
    goto LABEL_32;
  }

  id v10 = (id)v9;
  uint64_t v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v31)
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v10 = v10;
    id v11 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v11)
    {
      id v12 = v11;
      id v35 = 0LL;
      __int128 v13 = 0LL;
      uint64_t v14 = *(void *)v37;
      do
      {
        uint64_t v15 = 0LL;
        id v34 = v12;
        do
        {
          uint64_t v16 = v13;
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v10);
          }
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * (void)v15)]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"DeviceType"]);

          if (v13)
          {
            if ([v13 isEqual:v7])
            {
              uint64_t v18 = v14;
              id v19 = v10;
              id v20 = v7;
              int v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v33]);

              id v22 = sub_10000A950(v21);
              uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
              if (v23)
              {
                id v24 = (void *)v23;
                unsigned int v25 = [v21 isEqual:v32];

                if (v25) {
                  -[NSMutableArray addObject:](v31, "addObject:", v17);
                }
              }

              id v35 = v21;
              id v7 = v20;
              id v10 = v19;
              uint64_t v14 = v18;
              id v12 = v34;
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = @"DeviceType";
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
          }

          uint64_t v15 = (char *)v15 + 1;
        }

        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }

      while (v12);
    }

    else
    {
      id v35 = 0LL;
      __int128 v13 = 0LL;
    }

    uint64_t v29 = v35;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create array.",  buf,  2u);
    }

    uint64_t v31 = 0LL;
    uint64_t v29 = 0LL;
    __int128 v13 = 0LL;
  }

NSMutableArray *sub_10000E25C(void *a1, int a2)
{
  return sub_10000DEE8(@"DiskImage", @"DiskImageType", a1, a2);
}

id sub_10000E280(void *a1, int a2)
{
  id v3 = a1;
  id v4 = sub_10000DD9C(a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  io_object_t v6 = v5;
  if (v5)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      unsigned int v25 = v6;
      id v10 = 0LL;
      uint64_t v11 = *(void *)v27;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v12)]);
        id v14 = sub_10000A8A0(v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MountPath"]);

          id v10 = (void *)v16;
        }

        id v17 = sub_10000A950(v10);
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          id v19 = (void *)v18;
          unsigned __int8 v20 = [v10 isEqualToString:v3];

          if ((v20 & 1) != 0) {
            break;
          }
        }

        if (v9 == (id)++v12)
        {
          id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v9) {
            goto LABEL_4;
          }
          __int128 v13 = 0LL;
          break;
        }
      }

      io_object_t v6 = v25;
    }

    else
    {
      id v10 = 0LL;
      __int128 v13 = 0LL;
    }
  }

  else
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v21) {
      sub_100015A80(v21, v22, v23);
    }
    id v10 = 0LL;
    __int128 v13 = 0LL;
  }

  return v13;
}

void sub_10000E460(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0LL, 0);
  if (CFProperty)
  {
    io_object_t v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      *a3 = 1;
    }

    CFRelease(v6);
  }

NSString *sub_10000E4E8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = -[NSString initHexStringWithData:](objc_alloc(&OBJC_CLASS___NSString), "initHexStringWithData:", v3);
  io_object_t v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      id v8 = 0LL;
      id v7 = 0LL;
      id v9 = 0LL;
      goto LABEL_10;
    }

    *(_WORD *)buf = 0;
    id v10 = "Failed to create hex string with data.";
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }

  if ([v5 length] != (id)256
    && [v6 length] != (id)96
    && [v6 length] != (id)40)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = [v6 length];
    __int16 v16 = 2112;
    id v17 = v3;
    id v10 = "Unsupported signature length: %d characters (%@)";
    uint32_t v11 = 18;
    goto LABEL_8;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  id v9 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@/%@/%@", v4, v7, v8);
LABEL_10:
  uint64_t v12 = v9;

  return v12;
}

uint64_t sub_10000E6CC(const char *a1)
{
  if (strlen(a1) > 0x400) {
    goto LABEL_18;
  }
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  char v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  __int16 v16 = sub_10000F2E8;
  id v17 = &unk_100020CB8;
  uint64_t v18 = buf;
  id v19 = a1;
  CFMutableDictionaryRef v2 = v15;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = [v3 stringWithFileSystemRepresentation:a1 length:strlen(a1)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  io_object_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathComponents]);
  id v7 = [v6 mutableCopy];

  if (v7)
  {
    id v8 = (char *)[v7 count];
    if (v8)
    {
      do
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v7));
        id v10 = v9;
        if (v9)
        {
          id v11 = v9;
          id v12 = [v11 fileSystemRepresentation];
          if (!((unsigned int (*)(void *, id))v16)(v2, v12))
          {

            break;
          }

          [v7 removeLastObject];
        }
      }

      while (--v8);
    }
  }

  int v13 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  if (v13 || !realpath_DARWIN_EXTSN(a1, __s1) || (uint64_t result = strcmp(__s1, a1), (_DWORD)result))
  {
LABEL_18:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&_BYTE buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Paths don't match: (%s/%s)",  buf,  0x16u);
    }

    return 1LL;
  }

  return result;
}

void sub_10000E918(_Unwind_Exception *a1)
{
}

uint64_t sub_10000E93C(const char *a1, removefile_flags_t a2)
{
  int value = 0;
  id v4 = removefile_state_alloc();
  if (v4)
  {
    id v5 = v4;
    if (removefile_state_set(v4, 3u, sub_10000EB74)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      id v7 = __error();
      id v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      int v19 = v6;
      __int16 v20 = 2080;
      BOOL v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_set failed: %d (%s)",  buf,  0x12u);
    }

    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *__error();
      id v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      int v19 = v9;
      __int16 v20 = 2080;
      BOOL v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_set failed: %d (%s)",  buf,  0x12u);
    }

    if (removefile(a1, v5, a2))
    {
      uint64_t v12 = 0LL;
      if (*__error() != 2 || value) {
        goto LABEL_17;
      }
    }

    else if (value)
    {
      uint64_t v12 = 0LL;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }

    uint64_t v12 = 1LL;
    goto LABEL_17;
  }

  uint64_t v12 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *__error();
    id v14 = __error();
    unsigned int v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    int v19 = v13;
    __int16 v20 = 2080;
    BOOL v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_alloc failed: %d (%s)",  buf,  0x12u);
    return 0LL;
  }

  return v12;
}

uint64_t sub_10000EB74(_removefile_state *a1, const char *a2, int *a3)
{
  int dst = 0;
  memset(&v17, 0, sizeof(v17));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_get failed: %{errno}d",  buf,  8u);
    }

    int dst = 2;
    goto LABEL_17;
  }

  if (dst == 1)
  {
    if (lstat(a2, &v17))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *__error();
        id v7 = __error();
        id v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v6;
        __int16 v23 = 2080;
        id v24 = v8;
        int v9 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
      }
    }

    else
    {
      if ((v17.st_flags & 2) == 0) {
        goto LABEL_17;
      }
      if (lchflags(a2, v17.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v10 = *__error();
        id v11 = __error();
        uint64_t v12 = strerror(*v11);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 2080;
        id v24 = v12;
        int v9 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }

      if (!unlink(a2)) {
        return 0LL;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        id v14 = __error();
        unsigned int v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 2080;
        id v24 = v15;
        int v9 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }

LABEL_17:
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0LL;
}

NSString *sub_10000EE0C(void *a1)
{
  id v1 = a1;
  CFMutableDictionaryRef v2 = v1;
  uint64_t v10 = 1LL;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Invalid input.";
      uint32_t v8 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
    }

LABEL_9:
    int v6 = 0LL;
    goto LABEL_10;
  }

  id v3 = v1;
  uint64_t v4 = container_system_group_path_for_identifier(0, [v3 UTF8String], &v10);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 1024;
      int v14 = v10;
      id v7 = "Failed to copy system group container (%@): %d";
      uint32_t v8 = 18;
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  int v5 = (void *)v4;
  int v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v4);
  free(v5);
LABEL_10:

  return v6;
}

  return v8;
}

id sub_10000EF68()
{
  if (qword_100024608 != -1) {
    dispatch_once(&qword_100024608, &stru_100020C90);
  }
  return (id)qword_100024610;
}

void sub_10000EFA8(id a1)
{
  id v1 = sub_10000EE0C(@"systemgroup.com.apple.mobilestorageproxy");
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"backingStore"]);
  id v3 = (void *)qword_100024610;
  qword_100024610 = v2;
}

uint64_t sub_10000EFFC(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0LL;
  if (v5 && v6)
  {
    do
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
      if ([v9 isEqualToString:v7])
      {
        id v10 = [v5 code];

        if (v10 == a3)
        {
          uint64_t v8 = 1LL;
          goto LABEL_9;
        }
      }

      else
      {
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      id v5 = (id)v12;
    }

    while (v12);
    uint64_t v8 = 0LL;
  }

id sub_10000F0D8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  CFTypeRef CFProperty = 0LL;
  if (a1 && v3)
  {
    io_registry_entry_t v6 = IORegistryEntryFromPath( kIOMainPortDefault, (const char *)[a1 fileSystemRepresentation]);
    if (v6)
    {
      io_object_t v7 = v6;
      CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0LL, 0);
      IOObjectRelease(v7);
    }

    else
    {
      CFTypeRef CFProperty = 0LL;
    }
  }

  return CFProperty;
}

id sub_10000F168(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  io_registry_entry_t v6 = v5;
  io_object_t v7 = 0LL;
  unsigned int v15 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v8 = v5;
  if (a2)
  {
    id v9 = sub_10000F0D8(a1, a2);
    io_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v10 = sub_10000A9A8(v7);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = [v7 length];

      if (v13 == (id)4)
      {
        [v7 getBytes:&v15 length:4];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));

        goto LABEL_7;
      }
    }

LABEL_6:
    uint64_t v8 = v6;
  }

LABEL_7:
  return v8;
}

uint64_t sub_10000F23C(io_object_t *a1, const char *a2)
{
  uint64_t v2 = 0LL;
  io_iterator_t iterator = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      uint64_t v2 = 0LL;
    }

    else
    {
      while (1)
      {
        uint64_t v5 = IOIteratorNext(iterator);
        uint64_t v2 = v5;
        if (!(_DWORD)v5) {
          break;
        }
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          uint64_t v2 = 1LL;
          break;
        }

        IOObjectRelease(v2);
      }
    }

    if (iterator) {
      IOObjectRelease(iterator);
    }
  }

  return v2;
}

uint64_t sub_10000F2E8(uint64_t a1)
{
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    uint64_t result = 1LL;
    if ((v8.st_mode & 0xF000) != 0xA000) {
      return result;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  if (*__error() == 2) {
    return 1LL;
  }
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *__error();
    io_registry_entry_t v6 = __error();
    io_object_t v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2080;
    int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "lstat failed for %s: %d (%s)",  buf,  0x1Cu);
    return 0LL;
  }

  return result;
}

void sub_10000F430(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000F43C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  uint64_t v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  int v5 = &v4[v3];
  io_registry_entry_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      int v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            uint64_t result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          __int128 v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  uint64_t v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_54;
  }
  int v5 = &v4[v3];
  io_registry_entry_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      int v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3LL;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7LL;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0LL;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }

        goto LABEL_55;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }

      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3LL;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }

LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  *a3 = 0;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(result + 8)) {
    return 3LL;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }

      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }

      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1LL)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }

        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0LL;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }

        goto LABEL_19;
      }
    }

    return 3LL;
  }

  if (v3) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3LL;
  }
  uint64_t result = 0LL;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0LL;
      *a3 = a2;
      return result;
    }
  }

  return 3LL;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008LL)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }

      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0LL;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }

      __break(0x5519u);
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    __int128 v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent( unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0LL);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012LL >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }

  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result) {
      break;
    }
    if (v7) {
      return 0LL;
    }
  }

  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }

  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100017EC8, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_1000180D6, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust( unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0LL;
  __int128 v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }

  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1LL;
  }
  unsigned int v5 = 0;
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010LL)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }

          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0LL);
            if (!(_DWORD)result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }

          else
          {
            return 7LL;
          }
        }

        else
        {
          return 2LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject( a1,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)a2,  0x20uLL,  0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1) {
            return 0LL;
          }
          else {
            return 6LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else if (!*(void *)(a2 + 80) {
               || (__int128 v7 = 0u,
        }
                   __int128 v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0LL;
          }
          __int128 v7 = 0u;
          __int128 v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0LL;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }

    else
    {
      __int128 v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      __int128 v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = v8;
      __int128 v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }

  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_100010754(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_100010754(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0LL;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }

    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0LL);
    if (!(_DWORD)result)
    {
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v9 > 2) {
        return 2LL;
      }
      return 0LL;
    }
  }

  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return sub_100010754(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return sub_100010754(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return sub_100010754(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              __int128 v16 = 0u;
              __int128 v17 = 0u;
              __int128 v14 = 0u;
              __int128 v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011LL) {
                  return 2LL;
                }
                if (!DERParseSequenceContentToObject( &v19,  2u,  (uint64_t)&DERIM4CItemSpecs,  (unint64_t)&v16,  0x20uLL,  0LL))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010LL) {
                    return 2LL;
                  }
                  if (!DERParseSequenceContentToObject( &v19,  2u,  (uint64_t)&DERCRTPSequenceItemSpecs,  (unint64_t)&v14,  0x20uLL,  0LL))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0LL;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }

                    return 2LL;
                  }
                }

                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0LL;
      __int128 v15 = 0uLL;
      __int128 v13 = 0uLL;
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010LL) {
          return 2LL;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result) {
          return result;
        }
        if (v14 != 22) {
          return 2LL;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result) {
          return result;
        }
        if ((v8 | 0xE000000000000000LL) != a2) {
          return 2LL;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1) {
          return 2LL;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }

        else if (v11 == *a1 + v7)
        {
          return 0LL;
        }

        else
        {
          return 7LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0LL;
  unint64_t v9[2] = 0LL;
  v9[1] = 22LL;
  v9[3] = 24LL;
  __int128 v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000LL) == a2)
      {
        uint64_t result = 0LL;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000LL;
        *(void *)(a4 + 40) = a3;
      }

      else
      {
        return 2LL;
      }
    }
  }

  return result;
}

void DERImg4DecodeFindPropertyInSequence( unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  __int128 v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0LL;
  v7[1] = 0LL;
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_100010CE0(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0LL;
      v15[0] = 0LL;
      v15[1] = 0LL;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011LL
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010LL : 0x2000000000000011LL;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000LL, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty( (unint64_t *)&v13[1] + 1,  0xE00000004D414E50LL,  0x2000000000000011uLL,  (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  v16[0] = 0LL;
  v16[1] = 0LL;
  v14[1] = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0LL;
  v14[0] = 0LL;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010LL) {
            return 2LL;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7LL;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }

              else
              {
                uint64_t result = 0LL;
                *a4 = v10;
              }

              return result;
            }

            return 2LL;
          }
        }

        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6LL;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }

  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }

  uint64_t result = 1LL;
  if (!a2) {
    return result;
  }
LABEL_7:
  if ((_DWORD)result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6LL;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1LL;
    goto LABEL_14;
  }

  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }

    return result;
  }

  uint64_t result = DERParseSequenceContentToObject( v7,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)&v9,  0x20uLL,  0LL);
  if ((_DWORD)result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }

  return result;
}

double Img4DecodeCopyPayloadHashWithCallback( uint64_t a1, void (*a2)(void, void, __int128 *), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    return *(double *)&v7;
  }

  BOOL v9 = 0;
  if (*(_BYTE *)a1)
  {
    __int128 v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }

  else
  {
    __int128 v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&__int128 v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }

  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest( uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7LL;
                }

                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0LL;
                }

                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }

              else
              {
                return 1LL;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(void *)(a1 + 24) != 0LL;
    }
  }

  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    return *(double *)&v5;
  }

  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 1))
  {
    __int128 v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }

  else
  {
    a2();
    *(void *)&__int128 v5 = 0LL;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }

  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest( uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          __int128 v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7LL;
              }

              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0LL;
              }

              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }

            else
            {
              return 1LL;
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }

  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6LL;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }

    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }

    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0LL;
    *a3 = v4;
  }

  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
      uint64_t v4 = v6;
      if (!(_DWORD)v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }

  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6LL;
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = 6LL;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result) {
        *a2 = (void)v8 != 0LL;
      }
    }
  }

  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v10 = 0uLL;
        __int128 v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010LL, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0uLL;
    __int128 v9 = 0uLL;
    __int128 v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v19 = 0uLL;
        __int128 v20 = 0uLL;
        __int128 v17 = 0uLL;
        __int128 v18 = 0uLL;
        __int128 v15 = 0uLL;
        __int128 v16 = 0uLL;
        __int128 v13 = 0uLL;
        __int128 v14 = 0uLL;
        __int128 v11 = 0uLL;
        __int128 v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010LL, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  if (!a1) {
    return 6LL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t result = 6LL;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((void)v9)
        {
          uint64_t result = 0LL;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }

        return 6LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest( void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7LL;
    }

    else if (a4)
    {
      __int128 v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0LL;
        }
      }
    }
  }

  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v22[0] = 0LL;
    v22[1] = 0LL;
    v21[0] = 0LL;
    v21[1] = 0LL;
    unint64_t v20 = 0LL;
    v19[0] = 0LL;
    v19[1] = 0LL;
    unint64_t v18 = 0LL;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    unint64_t v14 = 0LL;
    __int128 v13 = 0uLL;
    __int128 v12 = 0uLL;
    __int128 v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010LL, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22LL, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011LL, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }

                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22LL, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }

                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0LL;
  v14[1] = 0LL;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0LL);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000LL, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
    if (!(_DWORD)v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }

  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
    }
  }

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
    }
  }

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }

    *a5 = v8;
  }

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }

    *a5 = v8;
  }

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0LL;
    v15[0] = 0LL;
    v15[1] = 0LL;
    memset(v13, 0, sizeof(v13));
    __int128 v12 = 0uLL;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0LL;
      *a3 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }

    *a4 = v8;
  }

double Img4DecodeGetPropertyFromSection( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)__int128 v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)__int128 v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }

      DERImg4DecodeParseManifestProperties(a1, 0LL, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }

    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }

  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) != 2LL)
    {
      uint64_t result = 2LL;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }

    if (!a3) {
      return 6LL;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }

  if (!a3) {
    return result;
  }
LABEL_6:
  if ((_DWORD)result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) != 2LL)
    {
      uint64_t result = 2LL;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }

    if (!a3) {
      return 6LL;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }

  if (!a3) {
    return result;
  }
LABEL_6:
  if ((_DWORD)result) {
    *a3 = 0LL;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) == 1LL)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6LL;
      }
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  uint64_t result = 6LL;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000LL, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((void *)&v14 + 1) == 4LL)
      {
        uint64_t result = 0LL;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }

      uint64_t result = 2LL;
    }

    int v10 = 0;
    *a3 = 0LL;
    goto LABEL_6;
  }

  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_100012734(void *a1, _OWORD *a2)
{
  v21[0] = 0LL;
  v21[1] = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  uint64_t v19 = 0LL;
  __int128 v18 = 0uLL;
  size_t __n = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v14 = 0LL;
  __s1 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __int128 __s2 = 0uLL;
  __int128 v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011LL)
  {
    while (1)
    {
      uint64_t v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50LL:
LABEL_11:
          __int128 v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011LL
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }

          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1LL << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }

            else if (*((void *)&v10 + 1) != 0xA000000000000000LL)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001LL || v6 != 1) {
                return;
              }
              int v6 = 0;
            }

            if (v6) {
              return;
            }
          }

          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78LL:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50LL:
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement( void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&__int128 v13 = &unk_100019378;
        *((void *)&v13 + 1) = 156LL;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        sub_100012734(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              __int128 v12 = v17;
              if (!((unsigned int (*)(void, _BYTE **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties( a1 + 7,  0LL,  (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))sub_10001382C,  (uint64_t)v11)
                && !((unsigned int (*)(void, _BYTE **, uint64_t, _BYTE *))v15[2])( *(void *)(v14 + 32),  &v12,  48LL,  v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeEvaluateManifestProperties( uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0LL, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties( unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v14 = 0LL;
  v13[0] = 0LL;
  v13[1] = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  memset(v8, 0, sizeof(v8));
  __int128 v9 = 0u;
  if (!a3) {
    return 6LL;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1) {
        return 0LL;
      }
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = 2LL;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1LL << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000LL) == 0)
      {
        return result;
      }

      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 7LL;
  }

  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties( uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1LL, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      __int128 v5 = 0u;
      __int128 v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 20_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 28_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 36_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 44_Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }

  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&__int128 v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 20_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 28_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 36_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 44_Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = v5;
    }
  }

  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_100012E00(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 12_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 20_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 28_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 36_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 44_Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }

    else
    {
      if (a5 != 1229796429) {
        return 2LL;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }

    if (!(_DWORD)result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0LL);
        if (!(_DWORD)result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }

          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0LL;
            }
            else {
              return 7LL;
            }
          }
        }
      }

      else
      {
        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012E00(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3LL;
    }
  }

  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks( unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4( *(void *)(a2 + 296),  *(unsigned int *)(a2 + 304),  *(void *)(a2 + 280),  *(unsigned int *)(a2 + 288),  a2 + 376,  20LL,  a2 + 312,  a2 + 320,  a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty( (unint64_t *)(a2 + 40),  a1 | 0xE000000000000000LL,  0x2000000000000011uLL,  (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }

                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0LL, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1LL, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[0] = a3;
  sub_100013568(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[0] = a3;
  sub_100013568(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = 0LL;
  __int128 v39 = 0u;
  memset(v40, 0, sizeof(v40));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t result = 6LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (sub_100012E00(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)( *((void *)&v33 + 1),  v34,  (char *)v40 + 8,  **(void **)(a9 + 32),  a9)
      || (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))( a1,  a2,  *((void *)&v34 + 1),  v35,  (char *)v40 + 8,  **(void **)(a9 + 32),  a9,  a10,  v17,  *((void *)&v17 + 1),  v18,  *((void *)&v18 + 1),  v19,  *((void *)&v19 + 1),  v20,  *((void *)&v20 + 1),  v21,  *((void *)&v21 + 1),  v22,  *((void *)&v22 + 1),  v23,  *((void *)&v23 + 1),  v24,  *((void *)&v24 + 1),  v25,  *((void *)&v25 + 1),  v26,  *((void *)&v26 + 1),  v27,  *((void *)&v27 + 1),  v28,  *((void *)&v28 + 1),  v29,  *((void *)&v29 + 1),  v30,  *((void *)&v30 + 1),  v31,  *((void *)&v31 + 1),  v32,  *((void *)&v32 + 1),  v33))
    {
      return 0xFFFFFFFFLL;
    }

    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100013568(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0LL
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }

                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))( *(void *)(a2 + 296),  *(void *)(a2 + 304),  &v22,  &v23,  a2 + 312,  a2 + 320,  a4,  a6)
                          || **(void **)(a4 + 32) > 0x30uLL
                          || (*(unsigned int (**)(void, void, uint64_t))a4)( *(void *)(a2 + 264),  *(void *)(a2 + 272),  a2 + 376)
                          || (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))( v22,  v23,  *(void *)(a2 + 280),  *(void *)(a2 + 288),  a2 + 376,  **(void **)(a4 + 32),  a4,  a6))
                        {
                          return;
                        }

                        int v15 = 1;
                      }

                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        __int128 v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000LL;
                        __int128 v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011LL, v24, a6)) {
                            return;
                          }
                        }

                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }

                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }

                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)( *(void *)(a2 + 8),  *(void *)(a2 + 16),  a2 + 184,  **(void **)(a4 + 32),  a4))
                          {
                            return;
                          }

                          *(_BYTE *)a2 = 1;
                        }

                        if (!Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 56),  0LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6)
                          && (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 72),  1LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10001382C(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void **)a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  v12[0] = 0LL;
  v12[1] = 0LL;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78LL, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011LL
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000LL;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24LL) + 8LL))( *(void *)(*(void *)(*(void *)a4 + 16LL) + 32LL),  a4 + 24,  4LL,  &v10);
        return 0LL;
      }
    }
  }

  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24LL) + 8LL))( *(void *)(*(void *)(*(void *)a4 + 16LL) + 32LL),  a4 + 24,  *(unsigned int *)(a2 + 8),  *(void *)a2);
  return 0LL;
}

uint64_t sha1_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ccdigest(sha1_digest_info, a2, a1, a3);
}

uint64_t verify_signature_rsa3k( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_1000139E4((uint64_t)v13, v9[4], v11, v12, 3072LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000139E4(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v24[0] = 0LL;
  v24[1] = 0LL;
  unint64_t v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  uint64_t v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  *uint64_t v11 = v9;
  uint64_t v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(void *)a1;
  v23[1] = v12;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t result = DERParseSequenceToObject( (uint64_t)v23,  (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs,  (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs,  (unint64_t)&v21,  0x20uLL,  0x20uLL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v14 = *((void *)&v21 + 1);
  __int128 v15 = (_BYTE *)v21;
  for (__int128 i = v22; v14; --v14)
  {
    if (*v15) {
      break;
    }
    if (v15 == (_BYTE *)-1LL) {
      __break(0x5513u);
    }
    ++v15;
  }

  if (v14 >= 0xFFFFFFFFFFFFFFF8LL)
  {
    __break(0x5500u);
    return result;
  }

  unint64_t v17 = (v14 + 7) >> 3;
  if (v17 > *v11) {
    return 0xFFFFFFFFLL;
  }
  *uint64_t v11 = v17;
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v18 = &CCRSA_PKCS1_FAULT_CANARY == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    int v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    return 0xFFFFFFFFLL;
  }

  LOBYTE(v21) = 0;
  int v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21) {
    return 0LL;
  }
  return result;
}

uint64_t verify_signature_rsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_1000139E4((uint64_t)v13, v9[4], v11, v12, 4096LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6)
                  {
                    v10[0] = a1;
                    v10[1] = a2;
                    v9[0] = a3;
                    v9[1] = a4;
                    v8[0] = a5;
                    v8[1] = a6;
                    sub_100013D10(v10, v8, v9);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void sub_100013D10(void *a1, void *a2, void *a3)
{
  char v18 = 0;
  uint64_t v6 = ccec_x963_import_pub_size(a1[1]);
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp(v6);
    uint64_t v8 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v8, 3uLL))
    {
      __break(0x550Cu);
    }

    else
    {
      uint64_t v9 = 24 * v8;
      BOOL v10 = __CFADD__(v9, 16LL);
      uint64_t v11 = v9 + 16;
      if (!v10)
      {
        BOOL v10 = __CFADD__(v11, 16LL);
        uint64_t v12 = v11 + 16;
        if (!v10)
        {
          __int128 v13 = cp;
          unint64_t v14 = v12 - 1;
          __chkstk_darwin();
          int v16 = &v17[-v15];
          bzero(&v17[-v15], v15);
          if (v14 < 0x10)
          {
            __break(1u);
          }

          else
          {
            void *v16 = v13;
          }

          return;
        }
      }
    }

    __break(0x5500u);
  }

uint64_t verify_chain_img4_v1( unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215LL;
        if (!sub_1000152F4(v26, (uint64_t)v27, 3u)
          && !sub_100014158((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          __int128 v24 = a6;
          uint64_t v15 = 0LL;
          int v16 = (const void **)v32;
          unint64_t v17 = &v30;
          char v18 = (const void **)v32;
          while (1)
          {
            int v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            __int128 v21 = *v18;
            v18 += 20;
            uint64_t result = sub_1000143BC(&v34[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              __int128 v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }

              v42[0] = 0LL;
              v42[1] = 0LL;
              unint64_t v40 = 0LL;
              v41[0] = 0LL;
              v41[1] = 0LL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011LL)
              {
                v47[0] = 0LL;
                v47[1] = 0LL;
                unint64_t v45 = 0LL;
                v46[0] = 0LL;
                v46[1] = 0LL;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }

                    if (v45 != 0x2000000000000010LL
                      || DERParseSequenceContentToObject( v46,  (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs,  (uint64_t)&DERAttributeTypeAndValueItemSpecs,  (unint64_t)&v43,  0x20uLL,  0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }

                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  __int128 v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_100021C20, (uint64_t)&v25);
                  if (!(_DWORD)result) {
                    return 0xFFFFFFFFLL;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if (!v38) {
                    return 0LL;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0LL;
                  }
                  uint64_t result = 0LL;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0LL;
                      *a5 = v38;
                      void *v24 = v23;
                    }
                  }

                  return result;
                }
              }

              return 0xFFFFFFFFLL;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_100014158(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( v15 + 16 * v8,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + 48 * v8,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + 48 * v8,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + 160 * v8,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    char v21 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + 160 * v8 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v22,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v22,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v19,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2LL || *(_BYTE *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1LL) {
        break;
      }
      if (*(_BYTE *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_1000153CC(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_1000143BC(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  __int128 v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject( a2 + 2,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v11,  0x20uLL,  0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }

  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2LL || *(_BYTE *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1LL)
      {
        __break(0x5513u);
        return result;
      }

      if (*(_BYTE *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)( *a2,  a2[1],  v13,  **(void **)(a3 + 32),  a3))
  {
    return 0xFFFFFFFFLL;
  }

  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))( *a1,  a1[1],  v8,  v9,  v13,  **(void **)(a3 + 32),  a3,  0LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000146FC);
}

uint64_t sub_10001456C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2LL)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = sub_100014158((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }

        else
        {
          char v16 = 1;
          uint64_t v17 = 1LL;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = sub_1000143BC(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2LL;
              if (!(_DWORD)result) {
                continue;
              }
            }

            return 0xFFFFFFFFLL;
          }

          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }

          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0LL;
            if (a5 && a6)
            {
              uint64_t result = 0LL;
              *a5 = v29;
              *a6 = v19;
            }
          }

          else
          {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000146FC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001473C);
}

uint64_t sub_10001473C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_global( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001477C);
}

uint64_t sub_10001477C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_fake( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000147BC);
}

uint64_t sub_1000147BC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_fake_global( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000147FC);
}

uint64_t sub_1000147FC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_avp( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001483C);
}

uint64_t sub_10001483C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001487C);
}

uint64_t sub_10001487C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000148BC);
}

uint64_t sub_1000148BC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_rsa3k( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000148FC);
}

uint64_t sub_1000148FC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001493C);
}

uint64_t sub_10001493C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_AWG1( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001497C);
}

uint64_t sub_10001497C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_PED( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000149BC);
}

uint64_t sub_1000149BC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ec_v1( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3LL)
          && !sub_100014BA0( (uint64_t)v27,  3u,  (uint64_t)&v28,  (uint64_t)&v30,  (unint64_t)v32,  (unint64_t)&v35,  (uint64_t)v36))
        {
          __int128 v25 = a4;
          uint64_t v15 = 0LL;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            uint64_t result = sub_1000143BC(&v32[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, void *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }

              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0LL;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0LL;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }

              else
              {
                return 0LL;
              }

              return result;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_100014BA0( uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16LL * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject( v21 + v11,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + v10,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + v10,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + v9,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    char v30 = 0;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + v9 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v31,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v31,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v28,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    void *v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = sub_1000153CC(a4 + v9, (void *)(a7 + v11));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16LL;
    v10 += 48LL;
    v9 += 160LL;
    if (v15 == v11) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014E1C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_100014F9C);
}

uint64_t sub_100014E1C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2LL)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_100014BA0( (uint64_t)v20,  2u,  (uint64_t)v21,  (uint64_t)v23,  (unint64_t)v28,  (unint64_t)&v29,  (uint64_t)v30);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }

  uint64_t result = sub_1000143BC(v28, v22, a7);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if (!v31) {
    return 0LL;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0LL;
      *a5 = v31;
      *a6 = v17;
    }
  }

  return result;
}

uint64_t sub_100014F9C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014E1C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_100014FDC);
}

uint64_t sub_100014FDC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_100015034);
}

uint64_t sub_100015034(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_100014FDC);
}

uint64_t verify_chain_img4_ecdsa384_qa( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_1000150B0);
}

uint64_t sub_1000150B0(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540LL;
  else {
    return 0LL;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = *(void **)(a1 + 16);
  if (!v2 || !*v2) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init(*v2, *a2);
  return 0LL;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = **(void **)(a1 + 16);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update(v2, *a2);
  return 0LL;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0LL;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void **)v8[2]) != 0LL && *v8 == a4 && (v10 = *v9) != 0LL && *v10 == a4)
    {
      ccdigest(v10, a2, a1, a3);
      return 0LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t img4_verify_signature_with_chain( unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000152F4(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16LL * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0LL;
      }
      return 0xFFFFFFFFLL;
    }
  }

  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_1000153CC(uint64_t a1, void *a2)
{
  v11[0] = 0LL;
  v11[1] = 0LL;
  v9[1] = 0LL;
  uint64_t v10 = 0LL;
  unint64_t v8 = 0LL;
  v9[0] = 0LL;
  __int128 v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(a1 + 152)) {
    return 0LL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010LL
      || DERParseSequenceContentToObject( v9,  (unsigned __int16)DERNumExtensionItemSpecs,  (uint64_t)&DERExtensionItemSpecs,  (unint64_t)v6,  0x30uLL,  0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }

    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }

  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

void sub_100015528(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)a1 + 24LL);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to checkin with lockdown: 0x%08x",  (uint8_t *)v2,  8u);
}

void sub_1000155AC(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8LL) + 24LL);
  uint64_t v4 = *a2;
  v5[0] = 67109632;
  v5[1] = a3;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received bytes: %d %% (%ld/%ld).",  (uint8_t *)v5,  0x1Cu);
}

void sub_10001564C()
{
  v0[0] = 67109120;
  v0[1] = 20;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Resetting remote services timed out after %d seconds.",  (uint8_t *)v0,  8u);
}

void sub_1000156CC()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to reset device.",  v0,  2u);
}

void sub_100015710( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = sub_10000B128((uint64_t)"main", 36LL, -2, 0LL, @"Failed to query working directory.", a6, a7, a8, v14);
  id v10 = [(id)objc_claimAutoreleasedReturnValue(v9) description];
  id v11 = objc_claimAutoreleasedReturnValue(v10);
  id v13 = sub_10000A570(v11, v12);
  _os_crash(v13);

  __break(1u);
}

void sub_10001575C()
{
}

void sub_100015774()
{
}

void sub_10001578C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = sub_10000B128((uint64_t)"main", 41LL, -2, a1, @"Failed to create %@.", a6, a7, a8, a2);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = objc_claimAutoreleasedReturnValue([v10 description]);
  id v13 = sub_10000A570(v11, v12);
  _os_crash(v13);

  __break(1u);
}

void sub_1000157F0()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v0 = *__error();
    int v1 = __error();
    uint64_t v2 = strerror(*v1);
    *(_DWORD *)buf = 67109378;
    int v14 = v0;
    __int16 v15 = 2080;
    uint64_t v16 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set temporary directory subpath: %d (%s)",  buf,  0x12u);
  }

  uint64_t v3 = *__error();
  uint64_t v4 = __error();
  strerror(*v4);
  id v8 = sub_10000B128( (uint64_t)"main",  28LL,  -2,  0LL,  @"Failed to set temporary directory subpath: %d (%s)",  v5,  v6,  v7,  v3);
  id v9 = [(id)objc_claimAutoreleasedReturnValue(v8) description];
  id v10 = objc_claimAutoreleasedReturnValue(v9);
  id v12 = sub_10000A570(v10, v11);
  _os_crash(v12);

  __break(1u);
}

void sub_1000158C8(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10000F43C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "Skipping %@, as we didn't mount it.",  a1);
}

void sub_100015908(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to load version dictionary at %@ (image version: %@).",  (uint8_t *)&v2,  0x16u);
}

void sub_100015990(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000F430((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, a3, "Ignoring EFI partition.", a1);
}

void sub_1000159C8(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000F430( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Ignoring Apple_partition_map partition.",  a1);
}

void sub_100015A00(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10000F43C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "The attached media %@ is not a leaf, ignoring.",  a1);
}

void sub_100015A40(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10000F43C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "The attached media %@ is not removable, ignoring.",  a1);
}

void sub_100015A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000F430( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Failed to retrieve the list of attached devices.",  v3);
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}