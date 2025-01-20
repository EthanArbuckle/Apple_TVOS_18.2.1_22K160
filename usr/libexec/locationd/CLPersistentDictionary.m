@interface CLPersistentDictionary
+ (id)persistentDictionaryWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (BOOL)isModified;
- (CLPersistentDictionary)initWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (NSMutableDictionary)underlyingDictionary;
- (NSString)filename;
- (id)dictionary;
- (int)dataProtection;
- (void)clear;
- (void)dealloc;
- (void)markModifiedClean;
- (void)markModifiedDirty;
- (void)persist;
- (void)refresh;
- (void)setDictionary:(id)a3;
- (void)setUnderlyingDictionary:(id)a3;
@end

@implementation CLPersistentDictionary

+ (id)persistentDictionaryWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  return [objc_alloc((Class)a1) initWithFilename:a3 withDataProtectionClass:*(void *)&a4];
}

- (CLPersistentDictionary)initWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  if (!a3) {
    sub_101249270();
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLPersistentDictionary;
  v6 = -[CLPersistentDictionary init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLPersistentDictionary setUnderlyingDictionary:](v6, "setUnderlyingDictionary:", 0LL);
    v7->_filename = (NSString *)a3;
    v7->_dataProtection = a4;
    -[CLPersistentDictionary refresh](v7, "refresh");
  }

  return v7;
}

- (void)dealloc
{
  -[CLPersistentDictionary setUnderlyingDictionary:](self, "setUnderlyingDictionary:", 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPersistentDictionary;
  -[CLPersistentDictionary dealloc](&v3, "dealloc");
}

- (id)dictionary
{
  return  -[NSMutableDictionary cl_deepMutableCopy]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "cl_deepMutableCopy");
}

- (void)setDictionary:(id)a3
{
  if ((objc_msgSend( a3,  "isEqualToDictionary:",  -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary")) & 1) == 0)
  {
    -[CLPersistentDictionary setUnderlyingDictionary:]( self,  "setUnderlyingDictionary:",  +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  }

- (void)persist
{
  if (-[CLPersistentDictionary isModified](self, "isModified"))
  {
    objc_super v3 = -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary");
    v4 = -[CLPersistentDictionary filename](self, "filename");
    unsigned int v5 = -[CLPersistentDictionary dataProtection](self, "dataProtection");
    if (byte_101998390 == 1)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10184D0F8);
      }
      v6 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 2114;
        v23 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#PersistentDictionary saving to file which didn't exist on boot, file:%{public, l ocation:escape_only}@}",  buf,  0x1Cu);
      }
    }

    v7 = objc_autoreleasePoolPush();
    sub_100222B94(v17, (uint64_t)"CLPersistentDictionary saving to file", 0);
    uint64_t v16 = 0LL;
    v8 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  &v16);
    if (v16)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10184D0F8);
      }
      objc_super v9 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 2114;
        v23 = v4;
        __int16 v24 = 2114;
        uint64_t v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#PersistentDictionary Errors serializing the plist indicate non-plist types being store d therein, file:%{public, location:escape_only}@, error:%{public, location:escape_only}@}",  buf,  0x26u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_10184D0F8);
        }
      }

      v10 = (os_log_s *)qword_101934988;
      if (!os_signpost_enabled((os_log_t)qword_101934988)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      v11 = "#PersistentDictionary Errors serializing the plist indicate non-plist types being stored therein";
      v12 = "{msg%{public}.0s:#PersistentDictionary Errors serializing the plist indicate non-plist types being sto"
            "red therein, file:%{public, location:escape_only}@, error:%{public, location:escape_only}@}";
    }

    else
    {
      uint64_t v13 = 536870913LL;
      if (v5) {
        uint64_t v13 = 1LL;
      }
      if (v5 == 1) {
        uint64_t v14 = 1073741825LL;
      }
      else {
        uint64_t v14 = v13;
      }
      -[NSData writeToFile:options:error:](v8, "writeToFile:options:error:", v4, v14, &v16);
      if (!v16) {
        goto LABEL_29;
      }
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10184D0F8);
      }
      v15 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 2114;
        v23 = v4;
        __int16 v24 = 2114;
        uint64_t v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#PersistentDictionary Writing plist to file should never result in an error, file :%{public, location:escape_only}@, error:%{public, location:escape_only}@}",  buf,  0x26u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_10184D0F8);
        }
      }

      v10 = (os_log_s *)qword_101934988;
      if (!os_signpost_enabled((os_log_t)qword_101934988)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      v11 = "#PersistentDictionary Writing plist to file should never result in an error";
      v12 = "{msg%{public}.0s:#PersistentDictionary Writing plist to file should never result in an error, file"
            ":%{public, location:escape_only}@, error:%{public, location:escape_only}@}";
    }

    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v11,  v12,  buf,  0x26u);
LABEL_29:
    sub_1001BA1BC(v17);
    objc_autoreleasePoolPop(v7);
    -[CLPersistentDictionary markModifiedClean](self, "markModifiedClean");
  }

- (void)refresh
{
  objc_super v3 = -[CLPersistentDictionary filename](self, "filename");
  uint64_t v16 = 0LL;
  v4 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v3,  0LL,  &v16);
  if (!v4)
  {
    if (qword_101998398 != -1) {
      dispatch_once(&qword_101998398, &stru_10184D118);
    }
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10184D0F8);
    }
    v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v18 = 0;
      __int16 v19 = 2082;
      __int16 v20 = "";
      __int16 v21 = 2114;
      __int16 v22 = v3;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#PersistentDictionary #warning Couldn't load plist from file. Defaulting to empty diction ary., file:%{public, location:escape_only}@, error:%{public, location:escape_only}@}",  buf,  0x26u);
    }

    goto LABEL_17;
  }

  id v5 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  1LL,  0LL,  &v16);
  if (v16) {
    goto LABEL_3;
  }
  id v12 = v5;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    goto LABEL_18;
  }
  if (v16)
  {
LABEL_3:
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10184D0F8);
    }
    v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v18 = 0;
      __int16 v19 = 2082;
      __int16 v20 = "";
      __int16 v21 = 2114;
      __int16 v22 = v3;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty dic tionary., file:%{public, location:escape_only}@, error:%{public, location:escape_only}@}",  buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10184D0F8);
      }
    }

    uint64_t v7 = qword_101934988;
    if (!os_signpost_enabled((os_log_t)qword_101934988)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 68289538;
    int v18 = 0;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v21 = 2114;
    __int16 v22 = v3;
    __int16 v23 = 2114;
    id v24 = v16;
    v8 = "#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty dictionary.";
    objc_super v9 = "{msg%{public}.0s:#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty di"
         "ctionary., file:%{public, location:escape_only}@, error:%{public, location:escape_only}@}";
    v10 = (os_log_s *)v7;
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_10184D0F8);
    }
    uint64_t v14 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v18 = 0;
      __int16 v19 = 2082;
      __int16 v20 = "";
      __int16 v21 = 2114;
      __int16 v22 = v3;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dicti onary., file:%{public, location:escape_only}@, data:%{public, location:escape_only}@}",  buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_10184D0F8);
      }
    }

    uint64_t v15 = qword_101934988;
    if (!os_signpost_enabled((os_log_t)qword_101934988)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 68289538;
    int v18 = 0;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v21 = 2114;
    __int16 v22 = v3;
    __int16 v23 = 2114;
    id v24 = v12;
    v8 = "#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dictionary.";
    objc_super v9 = "{msg%{public}.0s:#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dict"
         "ionary., file:%{public, location:escape_only}@, data:%{public, location:escape_only}@}";
    v10 = (os_log_s *)v15;
  }

  _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v8,  v9,  buf,  0x26u);
LABEL_17:
  id v12 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
LABEL_18:
  -[CLPersistentDictionary setUnderlyingDictionary:](self, "setUnderlyingDictionary:", v12);
}

- (void)clear
{
}

- (BOOL)isModified
{
  return self->_modified;
}

- (void)markModifiedDirty
{
  self->_modified = 1;
}

- (void)markModifiedClean
{
  self->_modified = 0;
}

- (NSString)filename
{
  return self->_filename;
}

- (int)dataProtection
{
  return self->_dataProtection;
}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
{
}

@end