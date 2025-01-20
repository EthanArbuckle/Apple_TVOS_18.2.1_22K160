@interface HeimCredDecoder
+ (id)allowedClasses;
+ (id)copyCF2NS:(void *)a3;
+ (id)copyUnarchiveObjectWithFileSecureEncoding:(id)a3;
+ (void)archiveRootObject:(id)a3 toFile:(id)a4;
+ (void)copyNS2CF:(id)a3;
- (id)allowedClasses;
@end

@implementation HeimCredDecoder

+ (void)copyNS2CF:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v21 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v21, v3) & 1) != 0
      || (v20 = location[0], uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v20, v4) & 1) != 0)
      || (v19 = location[0], uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v19, v5) & 1) != 0)
      || (v18 = location[0], uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v18, v6) & 1) != 0))
    {
      id v17 = [location[0] copy];
      id v38 = 0LL;
      objc_storeStrong(&v38, v17);
      v16 = (__CFArray *)v38;
      objc_storeStrong(&v38, 0LL);
      CFMutableArrayRef v37 = v16;

      int v35 = 1;
    }

    else
    {
      id v15 = location[0];
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSUUID);
      if ((objc_opt_isKindOfClass(v15, v7) & 1) != 0)
      {
        objc_msgSend(location[0], "getUUIDBytes:");
        if (uuid_compare(&v34.byte0, byte_100024E50))
        {
          if (uuid_compare(&v34.byte0, byte_100024E60)) {
            CFMutableArrayRef v37 = CFUUIDCreateFromUUIDBytes(0LL, v34);
          }
          else {
            CFMutableArrayRef v37 = kCFBooleanTrue;
          }
          int v35 = 1;
        }

        else
        {
          CFMutableArrayRef v37 = kCFBooleanFalse;
          int v35 = 1;
        }
      }

      else
      {
        id v14 = location[0];
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v14, v8) & 1) != 0)
        {
          v32 = (char *)[location[0] count];
          CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, (CFIndex)v32, &kCFTypeArrayCallBacks);
          if (Mutable)
          {
            for (i = 0LL; (uint64_t)i < (uint64_t)v32; ++i)
            {
              id v12 = [location[0] objectAtIndex:i];
              v13 = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:");

              v30 = v13;
              if (v13) {
                CFArrayAppendValue(Mutable, v30);
              }
              if (v30)
              {
                CFRelease(v30);
                v30 = 0LL;
              }
            }

            CFMutableArrayRef v37 = Mutable;
            int v35 = 1;
          }

          else
          {
            CFMutableArrayRef v37 = 0LL;
            int v35 = 1;
          }
        }

        else
        {
          id v11 = location[0];
          uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v11, v9) & 1) != 0)
          {
            id v29 = [location[0] count];
            CFMutableDictionaryRef v28 = CFDictionaryCreateMutable( 0LL,  (CFIndex)v29,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            if (v28)
            {
              v22 = _NSConcreteStackBlock;
              int v23 = -1073741824;
              int v24 = 0;
              v25 = sub_100016C34;
              v26 = &unk_100020A30;
              CFMutableDictionaryRef v27 = v28;
              [location[0] enumerateKeysAndObjectsUsingBlock:&v22];
              CFMutableArrayRef v37 = v28;
            }

            else
            {
              CFMutableArrayRef v37 = 0LL;
            }

            int v35 = 1;
          }

          else
          {
            CFMutableArrayRef v37 = 0LL;
            int v35 = 1;
          }
        }
      }
    }
  }

  else
  {
    CFMutableArrayRef v37 = 0LL;
    int v35 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v37;
}

+ (id)copyCF2NS:(void *)a3
{
  id v15 = a1;
  SEL v14 = a2;
  v13 = (__CFString *)a3;
  if (!a3) {
    return 0LL;
  }
  CFTypeID v12 = CFGetTypeID(v13);
  if (v12 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)v13)) {
      return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", byte_100024E60);
    }
    else {
      return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", byte_100024E50);
    }
  }

  else if (v12 == CFStringGetTypeID())
  {
    return (id)(id)(id)CFStringCreateCopy(0LL, v13);
  }

  else if (v12 == CFDataGetTypeID())
  {
    return CFDataCreateCopy(0LL, (CFDataRef)v13);
  }

  else if (v12 == CFNumberGetTypeID() || v12 == CFDateGetTypeID())
  {
    return v13;
  }

  else if (v12 == CFUUIDGetTypeID())
  {
    CFUUIDBytes v11 = CFUUIDGetUUIDBytes((CFUUIDRef)v13);
    return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v11);
  }

  else if (v12 == CFArrayGetTypeID())
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)v13);
    id v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", Count);
    if (v8)
    {
      for (CFIndex i = 0LL; i < Count; ++i)
      {
        id location = +[HeimCredDecoder copyCF2NS:]( &OBJC_CLASS___HeimCredDecoder,  "copyCF2NS:",  CFArrayGetValueAtIndex((CFArrayRef)v13, i));
        if (location) {
          [v8 addObject:location];
        }
        objc_storeStrong(&location, 0LL);
      }

      id v16 = v8;
      int v7 = 1;
    }

    else
    {
      id v16 = 0LL;
      int v7 = 1;
    }

    objc_storeStrong(&v8, 0LL);
  }

  else if (v12 == CFDictionaryGetTypeID())
  {
    CFIndex v5 = CFDictionaryGetCount((CFDictionaryRef)v13);
    context = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v5);
    if (context)
    {
      CFDictionaryApplyFunction((CFDictionaryRef)v13, (CFDictionaryApplierFunction)sub_100017178, context);
      id v16 = context;
    }

    else
    {
      id v16 = 0LL;
    }

    int v7 = 1;
    objc_storeStrong(&context, 0LL);
  }

  else
  {
    return 0LL;
  }

  return v16;
}

+ (id)copyUnarchiveObjectWithFileSecureEncoding:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  context = objc_autoreleasePoolPush();
  id v12 = 0LL;
  id v11 =  +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  location[0],  1LL,  0LL);
  if (v11)
  {
    id v3 = (id)off_100024EB0(v11);
    id v4 = v12;
    id v12 = v3;

    if (v12)
    {
      id v9 = -[HeimCredDecoder initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___HeimCredDecoder),  "initForReadingFromData:error:",  v12,  0LL);
      if (v9)
      {
        id v6 = +[HeimCredDecoder allowedClasses](&OBJC_CLASS___HeimCredDecoder, "allowedClasses");
        id v8 = objc_msgSend(v9, "decodeObjectOfClasses:forKey:");

        [v9 finishDecoding];
        id v14 = v8;
        int v10 = 1;
        objc_storeStrong(&v8, 0LL);
      }

      else
      {
        id v14 = 0LL;
        int v10 = 1;
      }

      objc_storeStrong(&v9, 0LL);
    }

    else
    {
      id v14 = 0LL;
      int v10 = 1;
    }
  }

  else
  {
    id v14 = 0LL;
    int v10 = 1;
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_autoreleasePoolPop(context);
  objc_storeStrong(location, 0LL);
  return v14;
}

+ (void)archiveRootObject:(id)a3 toFile:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v34 = 0LL;
  objc_storeStrong(&v34, a4);
  context = objc_autoreleasePoolPush();
  id v33 = sub_10000EABC();
  char v32 = 1;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v33;
    os_log_type_t type = v32;
    sub_100002064(v31);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Save credentials to disk", v31, 2u);
  }

  objc_storeStrong(&v33, 0LL);
  id v30 = 0LL;
  id v28 = 0LL;
  id v11 =  +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  location[0],  1LL,  &v28);
  objc_storeStrong(&v30, v28);
  id v29 = v11;
  if (v11)
  {
    id v24 = (id)off_100024EA8(v29);
    if (v24)
    {
      NSFileAttributeKey v36 = NSFilePosixPermissions;
      CFMutableArrayRef v37 = &off_1000222C0;
      id v20 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL);
      id v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      unsigned __int8 v7 = -[NSFileManager createFileAtPath:contents:attributes:]( v6,  "createFileAtPath:contents:attributes:",  v34,  v24,  v20);

      char v19 = v7 & 1;
      if ((v7 & 1) == 0)
      {
        os_log_t oslog = (os_log_t)sub_10000EABC();
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          id v4 = oslog;
          os_log_type_t v5 = v17;
          sub_100002064(v16);
          _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "Error writing credentials to disk", v16, 2u);
        }

        objc_storeStrong((id *)&oslog, 0LL);
      }

      objc_storeStrong(&v20, 0LL);
      int v25 = 0;
    }

    else
    {
      id v23 = sub_10000EABC();
      char v22 = 16;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        id v9 = (os_log_s *)v23;
        os_log_type_t v10 = v22;
        sub_100002064(v21);
        _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "Failed to wrap credentials", v21, 2u);
      }

      objc_storeStrong(&v23, 0LL);
      id v8 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      -[NSFileManager removeItemAtPath:error:](v8, "removeItemAtPath:error:", v34, 0LL);

      int v25 = 1;
    }

    objc_storeStrong(&v24, 0LL);
  }

  else
  {
    id v27 = sub_10000EABC();
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      sub_1000178D8((uint64_t)v38, (uint64_t)v30);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  v26,  "Failed to archive credentials: %{public}@",  v38,  0xCu);
    }

    objc_storeStrong(&v27, 0LL);
    int v25 = 1;
  }

  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_autoreleasePoolPop(context);
  if (!v25) {
    int v25 = 0;
  }
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)allowedClasses
{
  return +[HeimCredDecoder allowedClasses](&OBJC_CLASS___HeimCredDecoder, "allowedClasses", a2, self);
}

+ (id)allowedClasses
{
  id v4 = (dispatch_once_t *)&unk_100025010;
  id location = 0LL;
  objc_storeStrong(&location, &stru_100021120);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100025018;
}

@end