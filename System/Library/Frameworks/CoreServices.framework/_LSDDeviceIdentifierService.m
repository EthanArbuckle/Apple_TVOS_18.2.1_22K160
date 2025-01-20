@interface _LSDDeviceIdentifierService
+ (Class)clientClass;
+ (id)XPCInterface;
+ (id)vendorNameForDeviceIdentifiersWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
+ (unsigned)connectionType;
+ (void)clearIdentifiersForUninstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
+ (void)generateIdentifiersForInstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
@end

@implementation _LSDDeviceIdentifierService

+ (id)vendorNameForDeviceIdentifiersWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  v5 = 0LL;
  if (a3 && a4 && a5)
  {
    v5 = (__CFString *)_CSStringCopyCFString();
    if (v5) {
      goto LABEL_5;
    }
    v8 = (void *)_CSStringCopyCFString();
    if (!v8)
    {
      v5 = 0LL;
      return v5;
    }

    id v9 = v8;
    if ([v9 hasPrefix:@"com.apple."])
    {
      v5 = @"Apple Inc.";
    }

    else
    {
      [v9 componentsSeparatedByString:@"."];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)[v10 mutableCopy];

      if ((unint64_t)[v11 count] >= 2)
      {
        [v11 removeLastObject];
        v12 = (void *)NSString;
        [v11 componentsJoinedByString:@"."];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 stringWithFormat:@"BundleID:%@", v13];
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [NSString stringWithFormat:@"BundleID:%@", v9];
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    if (v5)
    {
LABEL_5:
      if ((*((_BYTE *)&a5->_clas + 6) & 0x20) != 0)
      {
        uint64_t v7 = [NSString stringWithFormat:@"Beta:%@", v5];

        v5 = (__CFString *)v7;
      }
    }
  }

  return v5;
}

+ (void)clearIdentifiersForUninstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  if (a3 && a4)
  {
    if (a5)
    {
      objc_msgSend(a1, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)_CSStringCopyCFString();
      +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0LL);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 clearIdentifiersForUninstallationWithVendorName:v8 bundleIdentifier:v6];
    }
  }

+ (void)generateIdentifiersForInstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  uint64_t v6 = *(void *)&a4;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[_LSDServiceDomain defaultServiceDomain]();
  _LSDServiceGetXPCConnection(a1, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11) {
    [v11 auditToken];
  }

  if (a3 && (_DWORD)v6 && a5 && (a5->_bundleFlags & 0x8000000) == 0)
  {
    [a1 vendorNameForDeviceIdentifiersWithContext:a3 bundleUnit:v6 bundleData:a5];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)_CSStringCopyCFString();
    [v9 generateIdentifiersWithVendorName:v13 bundleIdentifier:v14];
  }
}

+ (unsigned)connectionType
{
  return 7;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __43___LSDDeviceIdentifierService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDDeviceIdentifierService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDDeviceIdentifierService XPCInterface]::once, v3);
  }
  return (id)+[_LSDDeviceIdentifierService XPCInterface]::result;
}

@end