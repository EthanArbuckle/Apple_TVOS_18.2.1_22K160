@interface StoreKitClientIdentity
+ (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4;
+ (void)initialize;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)hidesConfirmationDialogs;
- (BOOL)ignoresInAppPurchaseRestriction;
- (BOOL)isSandboxed;
- (BOOL)requiresAuthenticationForPayment;
- (BOOL)usesIdentityAttributes;
- (NSNumber)accountIdentifier;
- (NSNumber)storeIdentifier;
- (NSNumber)storeVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)receiptDirectoryPath;
- (NSString)vendorIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setHidesConfirmationDialogs:(BOOL)a3;
- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3;
- (void)setReceiptDirectoryPath:(id)a3;
- (void)setRequiresAuthenticationForPayment:(BOOL)a3;
- (void)setSandboxed:(BOOL)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setStoreVersion:(id)a3;
- (void)setUsesIdentityAttributes:(BOOL)a3;
- (void)setValuesWithPaymentQueueClient:(id)a3;
- (void)setValuesWithSoftwareApplicationProxy:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation StoreKitClientIdentity

+ (void)initialize
{
  qword_1003A3548 = (uint64_t)dispatch_queue_create("com.apple.appstored.StoreKit.ForcedSandbox", 0LL);
  qword_1003A3550 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

+ (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4
{
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    int v14 = 138543874;
    uint64_t v15 = objc_opt_class(a1);
    __int16 v16 = 2114;
    id v17 = a3;
    __int16 v18 = 2114;
    id v19 = a4;
    uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%{public}@: Forcing sandbox for %{public}@ until %{public}@",  &v14,  32);
    if (v11)
    {
      v12 = (void *)v11;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      SSFileLog(v7, @"%@");
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154F9C;
  block[3] = &unk_10034AE70;
  block[4] = a3;
  block[5] = a4;
  dispatch_sync((dispatch_queue_t)qword_1003A3548, block);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreKitClientIdentity;
  -[StoreKitClientIdentity dealloc](&v3, "dealloc");
}

- (void)setValuesWithPaymentQueueClient:(id)a3
{
  id v5 = [a3 storeItemIdentifier];
  id v6 = [a3 storeExternalVersion];
  -[StoreKitClientIdentity setStoreIdentifier:](self, "setStoreIdentifier:", v5);
  -[StoreKitClientIdentity setStoreVersion:](self, "setStoreVersion:", v6);
  if ((objc_opt_respondsToSelector(a3, "environmentType") & 1) == 0) {
    goto LABEL_5;
  }
  id v7 = [a3 environmentType];
  if (v7 == (id)1)
  {
    uint64_t v8 = 0LL;
    goto LABEL_12;
  }

  if (v7 == (id)2)
  {
    uint64_t v8 = 1LL;
  }

  else
  {
LABEL_5:
    if (v5) {
      BOOL v9 = v6 == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v8 = v9;
  }

- (void)setValuesWithSoftwareApplicationProxy:(id)a3
{
  id v5 = [a3 bundleIdentifier];
  -[StoreKitClientIdentity setAccountIdentifier:]( self,  "setAccountIdentifier:",  SSAccountGetUniqueIdentifierFromValue([a3 applicationDSID]));
  -[StoreKitClientIdentity setBundleIdentifier:](self, "setBundleIdentifier:", v5);
  -[StoreKitClientIdentity setBundleVersion:](self, "setBundleVersion:", [a3 bundleVersion]);
  -[StoreKitClientIdentity setStoreIdentifier:](self, "setStoreIdentifier:", [a3 itemID]);
  -[StoreKitClientIdentity setStoreVersion:](self, "setStoreVersion:", [a3 externalVersionIdentifier]);
  if (v5)
  {
    if ((objc_opt_respondsToSelector(a3, "deviceIdentifierForVendor") & 1) != 0) {
      -[StoreKitClientIdentity setVendorIdentifier:]( self,  "setVendorIdentifier:",  objc_msgSend(objc_msgSend(a3, "deviceIdentifierForVendor"), "UUIDString"));
    }
  }

- (BOOL)isSandboxed
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  if (-[StoreKitClientIdentity bundleIdentifier](self, "bundleIdentifier"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100155318;
    v5[3] = &unk_10034DC10;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)qword_1003A3548, v5);
  }

  if (*((_BYTE *)v7 + 24)) {
    BOOL sandboxed = 1;
  }
  else {
    BOOL sandboxed = self->_sandboxed;
  }
  _Block_object_dispose(&v6, 8);
  return sandboxed;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  *((_BYTE *)v5 + 16) = self->_allowsBootstrapCellularData;
  v5[3] = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v5[4] = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  *((_BYTE *)v5 + 40) = self->_hidesConfirmationDialogs;
  *((_BYTE *)v5 + 41) = self->_ignoresInAppPurchaseRestriction;
  void v5[6] = -[NSString copyWithZone:](self->_receiptDirectoryPath, "copyWithZone:", a3);
  *((_BYTE *)v5 + 56) = self->_requiresAuthenticationForPayment;
  *((_BYTE *)v5 + 80) = self->_sandboxed;
  v5[8] = -[NSNumber copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
  v5[9] = -[NSNumber copyWithZone:](self->_storeVersion, "copyWithZone:", a3);
  *((_BYTE *)v5 + 81) = self->_usesIdentityAttributes;
  v5[11] = -[NSString copyWithZone:](self->_vendorIdentifier, "copyWithZone:", a3);
  return v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreKitClientIdentity;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [bid: %@, bv: %@, sid: %@, sv: %@, sbox: %d",  -[StoreKitClientIdentity description](&v3, "description"),  self->_bundleIdentifier,  self->_bundleVersion,  self->_storeIdentifier,  self->_storeVersion,  self->_sandboxed);
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (BOOL)hidesConfirmationDialogs
{
  return self->_hidesConfirmationDialogs;
}

- (void)setHidesConfirmationDialogs:(BOOL)a3
{
  self->_hidesConfirmationDialogs = a3;
}

- (BOOL)ignoresInAppPurchaseRestriction
{
  return self->_ignoresInAppPurchaseRestriction;
}

- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3
{
  self->_ignoresInAppPurchaseRestriction = a3;
}

- (NSString)receiptDirectoryPath
{
  return self->_receiptDirectoryPath;
}

- (void)setReceiptDirectoryPath:(id)a3
{
}

- (BOOL)requiresAuthenticationForPayment
{
  return self->_requiresAuthenticationForPayment;
}

- (void)setRequiresAuthenticationForPayment:(BOOL)a3
{
  self->_requiresAuthenticationForPayment = a3;
}

- (void)setSandboxed:(BOOL)a3
{
  self->_BOOL sandboxed = a3;
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSNumber)storeVersion
{
  return self->_storeVersion;
}

- (void)setStoreVersion:(id)a3
{
}

- (BOOL)usesIdentityAttributes
{
  return self->_usesIdentityAttributes;
}

- (void)setUsesIdentityAttributes:(BOOL)a3
{
  self->_usesIdentityAttributes = a3;
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

@end