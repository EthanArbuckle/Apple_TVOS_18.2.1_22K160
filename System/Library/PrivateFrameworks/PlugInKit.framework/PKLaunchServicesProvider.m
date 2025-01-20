@interface PKLaunchServicesProvider
- (BOOL)hasLSDatabaseAccess;
- (id)applicationProxyForBundleURL:(id)a3;
- (id)defaultApplicationWorkspace;
- (id)extensionPointForIdentifier:(id)a3 platform:(id)a4;
- (id)extensionPointRecordEnumeratorForExtensionPointIdentifier:(id)a3;
- (id)plugInKitProxyForURL:(id)a3;
- (id)plugInKitProxyForUUID:(id)a3;
- (id)plugInRecordEnumerator;
- (id)plugInRecordEnumeratorForExtensionPointRecord:(id)a3;
- (id)plugInRecordEnumeratorWithExtensionPointName:(id)a3 platform:(unsigned int)a4;
- (id)plugInRecordForIdentifier:(id)a3;
- (id)plugInRecordForUUID:(id)a3;
- (id)pluginKitProxyForIdentifier:(id)a3;
@end

@implementation PKLaunchServicesProvider

- (BOOL)hasLSDatabaseAccess
{
  return ((uint64_t (*)(void, char *))MEMORY[0x189616718])(MEMORY[0x189605780], sel_hasDatabaseAccess);
}

- (id)applicationProxyForBundleURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultApplicationWorkspace
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInKitProxyForURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInKitProxyForUUID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pluginKitProxyForIdentifier:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInRecordForUUID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x189605720];
  id v4 = a3;
  id v5 = objc_alloc(v3);
  v8 = (void *)objc_msgSend_initWithUUID_error_(v5, v6, (uint64_t)v4, 0, v7);

  return v8;
}

- (id)plugInRecordForIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x189605720];
  id v4 = a3;
  LODWORD(v3) = objc_msgSend_instancesRespondToSelector_( v3,  v5,  (uint64_t)sel_initWithBundleIdentifier_requireValid_error_,  v6,  v7);
  id v8 = objc_alloc(MEMORY[0x189605720]);
  if ((_DWORD)v3) {
    uint64_t valid = objc_msgSend_initWithBundleIdentifier_requireValid_error_(v8, v9, (uint64_t)v4, 1, 0);
  }
  else {
    uint64_t valid = objc_msgSend_initWithBundleIdentifier_error_(v8, v9, (uint64_t)v4, 0, v10);
  }
  v12 = (void *)valid;

  return v12;
}

- (id)plugInRecordEnumerator
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plugInRecordEnumeratorWithExtensionPointName:(id)a3 platform:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x189605770]);
  id v15 = 0LL;
  id v8 = (void *)objc_msgSend_initWithIdentifier_platform_error_(v6, v7, (uint64_t)v5, v4, (uint64_t)&v15);
  id v11 = v15;
  if (v8)
  {
    objc_msgSend_enumeratorWithExtensionPointRecord_options_(MEMORY[0x189605720], v9, (uint64_t)v8, 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    pklog_handle_for_category(3);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_186A24E20((uint64_t)v5, (uint64_t)v11, v13);
    }

    v12 = 0LL;
  }

  return v12;
}

- (id)extensionPointRecordEnumeratorForExtensionPointIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x186E413A8]();
  objc_msgSend_enumeratorForExtensionPointIdentifier_(MEMORY[0x189605770], v5, (uint64_t)v3, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v8;
}

- (id)plugInRecordEnumeratorForExtensionPointRecord:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_enumeratorWithExtensionPointRecord_options_(MEMORY[0x189605720], v4, (uint64_t)v3, 0, v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    pklog_handle_for_category(3);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_186A24EA4((uint64_t)v3, v7);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

@end