@interface CLKeychainItemWrapper
- (CLKeychainItemWrapper)initWithIdentifier:(id)a3;
- (CLKeychainItemWrapper)initWithIdentifier:(id)a3 keyType:(__CFString *)a4;
- (NSMutableDictionary)genericPasswordQuery;
- (NSMutableDictionary)keychainItemData;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)objectForKey:(id)a3;
- (id)secItemFormatToDictionary:(id)a3;
- (void)dealloc;
- (void)initializeKeychainItemWithIdentifier:(id)a3 keyType:(__CFString *)a4;
- (void)resetKeychainItem;
- (void)setGenericPasswordQuery:(id)a3;
- (void)setKeychainItemData:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)writeToKeychain;
@end

@implementation CLKeychainItemWrapper

- (CLKeychainItemWrapper)initWithIdentifier:(id)a3 keyType:(__CFString *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CLKeychainItemWrapper;
  v6 = -[CLKeychainItemWrapper init](&v19, "init");
  if (v6)
  {
    if (a3)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10182FC88);
      }
      v7 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        id v8 = [a3 UTF8String];
        *(_DWORD *)buf = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        v23 = "";
        __int16 v24 = 2081;
        id v25 = v8;
        __int16 v26 = 2113;
        v27 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Initializing CLKeychainItemWrapper with identifier and key., identifier:%{private , location:escape_only}s, key:%{private, location:escape_only}@}",  buf,  0x26u);
      }

      v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v6->_genericPasswordQuery = v9;
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
      -[NSMutableDictionary setObject:forKey:](v6->_genericPasswordQuery, "setObject:forKey:", a3, a4);
      -[NSMutableDictionary setObject:forKey:]( v6->_genericPasswordQuery,  "setObject:forKey:",  kSecMatchLimitOne,  kSecMatchLimit);
      -[NSMutableDictionary setObject:forKey:]( v6->_genericPasswordQuery,  "setObject:forKey:",  kCFBooleanTrue,  kSecReturnAttributes);
      result[0] = 0LL;
      OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)v6->_genericPasswordQuery, result);
      if (v10 == -25300) {
        goto LABEL_20;
      }
      OSStatus v11 = v10;
      if (!v10)
      {
        v12 = (NSMutableDictionary *) -[CLKeychainItemWrapper secItemFormatToDictionary:]( v6,  "secItemFormatToDictionary:",  result[0]);
        if (v12)
        {
          v6->_keychainItemData = v12;
LABEL_21:

          return v6;
        }

- (CLKeychainItemWrapper)initWithIdentifier:(id)a3
{
  return -[CLKeychainItemWrapper initWithIdentifier:keyType:](self, "initWithIdentifier:keyType:", a3, kSecAttrGeneric);
}

- (void)dealloc
{
  self->_keychainItemData = 0LL;
  self->_genericPasswordQuery = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLKeychainItemWrapper;
  -[CLKeychainItemWrapper dealloc](&v3, "dealloc");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if ((objc_msgSend(-[CLKeychainItemWrapper objectForKey:](self, "objectForKey:", a4), "isEqual:", a3) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:]( -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"),  "setObject:forKey:",  a3,  a4);
      -[CLKeychainItemWrapper writeToKeychain](self, "writeToKeychain");
    }
  }

- (id)objectForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:]( -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"),  "objectForKey:",  a3);
}

- (void)initializeKeychainItemWithIdentifier:(id)a3 keyType:(__CFString *)a4
{
}

- (void)resetKeychainItem
{
  if (-[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"))
  {
    SecItemDelete((CFDictionaryRef)-[CLKeychainItemWrapper dictionaryToSecItemFormat:]( self,  "dictionaryToSecItemFormat:",  -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData")));
    -[NSMutableDictionary removeAllObjects]( -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"),  "removeAllObjects");
  }

  else
  {
    -[CLKeychainItemWrapper setKeychainItemData:]( self,  "setKeychainItemData:",  objc_opt_new(&OBJC_CLASS___NSMutableDictionary));
  }

  -[NSMutableDictionary setObject:forKey:]( -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"),  "setObject:forKey:",  @"com.apple.locationd",  kSecAttrService);
  -[NSMutableDictionary setObject:forKey:]( -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"),  "setObject:forKey:",  &stru_1018A4B00,  kSecValueData);
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  if (!a3)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "nil dictionary passed for converstion", buf, 2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    LOWORD(v11[0]) = 0;
    v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "nil dictionary passed for converstion",  v11,  2,  v11[0]);
    goto LABEL_22;
  }

  v4 = +[NSMutableDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSMutableDictionary, "dictionaryWithDictionary:");
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  id v5 = [a3 objectForKey:kSecValueData];
  if (!v5)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    id v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "Conversion of dictionary without kSecValueData key requested.",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    LOWORD(v11[0]) = 0;
    v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "Conversion of dictionary without kSecValueData key requested.",  v11,  2,  v11[0]);
LABEL_22:
    OSStatus v10 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLKeychainItemWrapper dictionaryToSecItemFormat:]", "%s\n", v7);
    if (v10 != buf) {
      free(v10);
    }
    return 0LL;
  }

  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  [v5 dataUsingEncoding:4],  kSecValueData);
  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  if (!a3)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    id v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "nil dictionary passed for retrieving keychain item",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    LOWORD(result[0]) = 0;
    v9 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  16LL,  "nil dictionary passed for retrieving keychain item",  result,  2);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLKeychainItemWrapper secItemFormatToDictionary:]", "%s\n");
LABEL_21:
    if (v9 != buf) {
      free(v9);
    }
    return 0LL;
  }

  objc_super v3 = +[NSMutableDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSMutableDictionary, "dictionaryWithDictionary:");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  result[0] = 0LL;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, result);
  if (v4 == -25300)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    OSStatus v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Expected keychain item not found.", buf, 2u);
    }

    if (!sub_1002921D0(115, 2)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    v14[0] = 0;
    v9 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  1LL,  "Expected keychain item not found.",  v14,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKeychainItemWrapper secItemFormatToDictionary:]", "%s\n");
    goto LABEL_21;
  }

  OSStatus v5 = v4;
  if (v4)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10182FC88);
    }
    OSStatus v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      objc_super v19 = "";
      __int16 v20 = 1026;
      OSStatus v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unable to retrieve keychain item, error:%{public}d}",  buf,  0x18u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10182FC88);
      }
    }

    v12 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      objc_super v19 = "";
      __int16 v20 = 1026;
      OSStatus v21 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Unable to retrieve keychain item",  "{msg%{public}.0s:Unable to retrieve keychain item, error:%{public}d}",  buf,  0x18u);
    }

    return 0LL;
  }

  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", kSecReturnData);
  v6 = objc_alloc(&OBJC_CLASS___NSString);
  v7 = -[NSString initWithData:encoding:](v6, "initWithData:encoding:", result[0], 4LL);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, kSecValueData);

  return v3;
}

- (void)writeToKeychain
{
  CFTypeRef result = 0LL;
  OSStatus v3 = SecItemCopyMatching( (CFDictionaryRef)-[CLKeychainItemWrapper genericPasswordQuery](self, "genericPasswordQuery"),  &result);
  if (v3 == -25300)
  {
    OSStatus v13 = SecItemAdd( (CFDictionaryRef)-[CLKeychainItemWrapper dictionaryToSecItemFormat:]( self,  "dictionaryToSecItemFormat:",  -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData")),  0LL);
    if (v13)
    {
      OSStatus v14 = v13;
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10182FC88);
      }
      v15 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        OSStatus v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Couldn't add the Keychain Item, error:%{public}d}",  buf,  0x18u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_10182FC88);
        }
      }

      OSStatus v10 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        OSStatus v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v14;
        OSStatus v11 = "Couldn't add the Keychain Item";
        v12 = "{msg%{public}.0s:Couldn't add the Keychain Item, error:%{public}d}";
        goto LABEL_26;
      }
    }
  }

  else
  {
    OSStatus v4 = v3;
    if (v3)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10182FC88);
      }
      v16 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        OSStatus v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Couldn't query for the Keychain Item to add, error:%{public}d}",  buf,  0x18u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_10182FC88);
        }
      }

      OSStatus v10 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        OSStatus v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v4;
        OSStatus v11 = "Couldn't query for the Keychain Item to add";
        v12 = "{msg%{public}.0s:Couldn't query for the Keychain Item to add, error:%{public}d}";
        goto LABEL_26;
      }
    }

    else
    {
      OSStatus v5 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  result);
      -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  -[NSMutableDictionary objectForKey:]( -[CLKeychainItemWrapper genericPasswordQuery](self, "genericPasswordQuery"),  "objectForKey:",  kSecClass),  kSecClass);
      id v6 = -[CLKeychainItemWrapper dictionaryToSecItemFormat:]( self,  "dictionaryToSecItemFormat:",  -[CLKeychainItemWrapper keychainItemData](self, "keychainItemData"));
      [v6 removeObjectForKey:kSecClass];
      OSStatus v7 = SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v6);
      if (v7)
      {
        OSStatus v8 = v7;
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_10182FC88);
        }
        v9 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289282;
          int v19 = 0;
          __int16 v20 = 2082;
          OSStatus v21 = "";
          __int16 v22 = 1026;
          OSStatus v23 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Couldn't update the Keychain Item, error:%{public}d}",  buf,  0x18u);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_10182FC88);
          }
        }

        OSStatus v10 = (os_log_s *)qword_101934988;
        if (os_signpost_enabled((os_log_t)qword_101934988))
        {
          *(_DWORD *)buf = 68289282;
          int v19 = 0;
          __int16 v20 = 2082;
          OSStatus v21 = "";
          __int16 v22 = 1026;
          OSStatus v23 = v8;
          OSStatus v11 = "Couldn't update the Keychain Item";
          v12 = "{msg%{public}.0s:Couldn't update the Keychain Item, error:%{public}d}";
LABEL_26:
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v11,  v12,  buf,  0x18u);
        }
      }
    }
  }
}

- (NSMutableDictionary)keychainItemData
{
  return self->_keychainItemData;
}

- (void)setKeychainItemData:(id)a3
{
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->_genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
}

@end