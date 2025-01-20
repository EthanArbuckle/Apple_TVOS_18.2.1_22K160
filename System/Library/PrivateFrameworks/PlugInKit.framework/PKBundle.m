@interface PKBundle
- (NSDictionary)infoDictionary;
- (NSString)bundleIdentifier;
- (NSString)executablePath;
- (NSString)path;
- (NSString)plugInsPath;
- (NSString)supportPath;
- (NSURL)url;
- (OS_xpc_object)_bundle;
- (PKBundle)initWithExecutablePath:(id)a3;
- (PKBundle)initWithExecutableURL:(id)a3;
- (PKBundle)initWithPath:(id)a3;
- (PKBundle)initWithURL:(id)a3;
- (PKBundle)initWithXPCBundle:(id)a3;
- (id)bundleDirectory:(id)a3;
- (id)initForMainBundle;
- (id)stringProperty:(int)a3;
- (void)set_bundle:(id)a3;
@end

@implementation PKBundle

- (id)initForMainBundle
{
  main = (void *)xpc_bundle_create_main();
  v7 = (void *)objc_msgSend_initWithXPCBundle_(self, v4, (uint64_t)main, v5, v6);

  return v7;
}

- (PKBundle)initWithURL:(id)a3
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (PKBundle *)objc_msgSend_initWithPath_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (PKBundle)initWithPath:(id)a3
{
  id v4 = a3;
  objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)xpc_bundle_create();
  if (xpc_bundle_get_property())
  {
    self = (PKBundle *)(id)objc_msgSend_initWithXPCBundle_(self, v10, (uint64_t)v9, v11, v12);
    v13 = self;
  }

  else
  {
    xpc_bundle_get_error();
    pklog_handle_for_category(1);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_186A269A4();
    }

    objc_msgSend_lastPathComponent(v4, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathExtension(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    int isEqualToString = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)@"appex", v26, v27);

    if (isEqualToString)
    {
      id v29 = objc_alloc(MEMORY[0x189605720]);
      objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x189604030], v30, (uint64_t)v4, 1, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      id v41 = 0LL;
      v35 = (void *)objc_msgSend_initWithURL_error_(v29, v33, (uint64_t)v32, (uint64_t)&v41, v34);
      id v36 = v41;

      if (v35)
      {
        pklog_handle_for_category(1);
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_186A26914(v35, (const char *)v4, (uint64_t)v37, v38, v39);
        }
      }
    }

    v13 = 0LL;
  }

  return v13;
}

- (PKBundle)initWithExecutableURL:(id)a3
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (PKBundle *)objc_msgSend_initWithExecutablePath_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (PKBundle)initWithExecutablePath:(id)a3
{
  id v4 = a3;
  objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)xpc_bundle_create();
  if (xpc_bundle_get_property()) {
    v13 = (void *)objc_msgSend_initWithXPCBundle_(self, v10, (uint64_t)v9, v11, v12);
  }
  else {
    v13 = (void *)objc_msgSend_initWithPath_(self, v10, (uint64_t)v4, v11, v12);
  }
  v14 = v13;

  return v14;
}

- (PKBundle)initWithXPCBundle:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PKBundle;
  uint64_t v5 = -[PKBundle init](&v11, sel_init);
  uint64_t v9 = v5;
  if (v5) {
    objc_msgSend_set_bundle_(v5, v6, (uint64_t)v4, v7, v8);
  }

  return v9;
}

- (id)stringProperty:(int)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t property = xpc_bundle_get_property();

  if (property)
  {
    objc_msgSend_stringWithUTF8String_(NSString, v7, property, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (NSDictionary)infoDictionary
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_bundle_get_info_dictionary();
  uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    pklog_handle_for_category(1);
    uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_186A26AC0(self, v8, v9, v10, v11);
    }
  }

  uint64_t v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v12)
  {
    pklog_handle_for_category(1);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_186A26A30(self, v7, (uint64_t)v13, v14, v15);
    }
  }

  return (NSDictionary *)v12;
}

- (NSString)bundleIdentifier
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_bundle_get_info_dictionary();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    string = xpc_dictionary_get_string(v6, "CFBundleIdentifier");
    objc_msgSend_stringWithUTF8String_(NSString, v8, (uint64_t)string, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return (NSString *)v11;
}

- (NSURL)url
{
  uint64_t v5 = (void *)MEMORY[0x189604030];
  objc_msgSend_path(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (NSString)path
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)supportPath
{
  if (!self->_supportPath)
  {
    objc_msgSend__bundle(self, a2, v2, v3, v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t property = (void *)xpc_bundle_get_property();

    objc_msgSend_stringWithUTF8String_(NSString, v8, (uint64_t)property, v9, v10);
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    supportPath = self->_supportPath;
    self->_supportPath = v11;

    free(property);
  }

  return self->_supportPath;
}

- (id)bundleDirectory:(id)a3
{
  id v4 = a3;
  objc_msgSend_supportPath(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)executablePath
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_stringProperty_(self, v6, 2, v7, v8);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (NSString)plugInsPath
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (OS_xpc_object)_bundle
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)set_bundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end