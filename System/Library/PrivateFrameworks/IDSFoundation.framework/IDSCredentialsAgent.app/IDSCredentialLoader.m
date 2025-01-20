@interface IDSCredentialLoader
- (IDSCredentialLoader)initWithCommand:(id)a3 completionBlock:(id)a4;
- (NSString)uniqueID;
- (id)block;
@end

@implementation IDSCredentialLoader

- (IDSCredentialLoader)initWithCommand:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IDSCredentialLoader;
  v9 = -[IDSCredentialLoader init](&v19, "init");
  if (v9)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("URLLoading", v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating loader with command: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"URLLoading"))
    {
      id v18 = v6;
      _IDSLogV(0LL, @"IDSFoundation", @"URLLoading", @"Creating loader with command: %@");
    }

    id v13 = objc_msgSend(v7, "copy", v18);
    id block = v9->_block;
    v9->_id block = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    uniqueID = v9->_uniqueID;
    v9->_uniqueID = (NSString *)v15;
  }

  return v9;
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end