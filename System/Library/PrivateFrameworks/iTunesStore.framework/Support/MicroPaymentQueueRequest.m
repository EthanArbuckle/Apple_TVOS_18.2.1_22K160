@interface MicroPaymentQueueRequest
- (BOOL)usesSoftwareMap;
- (MicroPaymentQueueRequest)init;
- (NSNumber)rangeEndIdentifier;
- (NSNumber)rangeStartIdentifier;
- (NSNumber)userIdentifier;
- (StoreKitClientIdentity)clientIdentity;
- (id)_copyApplicationIdentity:(id *)a3;
- (id)_ntsQueryParameters:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newStoreURLOperation:(id *)a3;
- (int64_t)URLBagType;
- (void)dealloc;
- (void)setClientIdentity:(id)a3;
- (void)setRangeEndIdentifier:(id)a3;
- (void)setRangeStartIdentifier:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation MicroPaymentQueueRequest

- (MicroPaymentQueueRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MicroPaymentQueueRequest;
  v2 = -[MicroPaymentQueueRequest init](&v4, "init");
  if (v2) {
    v2->_lock = objc_alloc_init(&OBJC_CLASS___NSLock);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPaymentQueueRequest;
  -[MicroPaymentQueueRequest dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  -[NSLock lock](self->_lock, "lock");
  v5[1] = -[StoreKitClientIdentity copyWithZone:](self->_clientIdentity, "copyWithZone:", a3);
  v5[3] = -[NSNumber copyWithZone:](self->_rangeEndIdentifier, "copyWithZone:", a3);
  v5[4] = -[NSNumber copyWithZone:](self->_rangeStartIdentifier, "copyWithZone:", a3);
  v5[5] = -[NSNumber copyWithZone:](self->_userIdentifier, "copyWithZone:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (StoreKitClientIdentity)clientIdentity
{
  objc_super v3 = self->_clientIdentity;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)newStoreURLOperation:(id *)a3
{
  v11 = 0LL;
  -[NSLock lock](self->_lock, "lock");
  id v5 = -[MicroPaymentQueueRequest _ntsQueryParameters:](self, "_ntsQueryParameters:", &v11);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    v8 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  self->_userIdentifier);
    -[SSMutableAuthenticationContext setAllowsBootstrapCellularData:]( v8,  "setAllowsBootstrapCellularData:",  -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
    -[SSMutableAuthenticationContext setTokenType:](v8, "setTokenType:", 1LL);
    [v7 setAuthenticationContext:v8];

    v9 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setAllowsBootstrapCellularData:]( v9,  "setAllowsBootstrapCellularData:",  -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
    -[SSMutableURLRequestProperties setCachePolicy:](v9, "setCachePolicy:", 1LL);
    -[SSMutableURLRequestProperties setHTTPMethod:](v9, "setHTTPMethod:", @"POST");
    -[SSMutableURLRequestProperties setRequestParameters:](v9, "setRequestParameters:", v6);
    -[SSMutableURLRequestProperties setShouldDecodeResponse:](v9, "setShouldDecodeResponse:", 0LL);
    if (-[StoreKitClientIdentity isSandboxed](self->_clientIdentity, "isSandboxed")) {
      -[SSMutableURLRequestProperties setURLBagType:](v9, "setURLBagType:", 1LL);
    }
    [v7 setRequestProperties:v9];
  }

  else
  {
    id v7 = 0LL;
  }

  -[NSLock unlock](self->_lock, "unlock");
  if (a3) {
    *a3 = v11;
  }
  return v7;
}

- (NSNumber)rangeEndIdentifier
{
  objc_super v3 = self->_rangeEndIdentifier;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSNumber)rangeStartIdentifier
{
  objc_super v3 = self->_rangeStartIdentifier;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setClientIdentity:(id)a3
{
  clientIdentity = self->_clientIdentity;
  if (clientIdentity != a3)
  {

    self->_clientIdentity = (StoreKitClientIdentity *)a3;
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setRangeEndIdentifier:(id)a3
{
  rangeEndIdentifier = self->_rangeEndIdentifier;
  if (rangeEndIdentifier != a3)
  {

    self->_rangeEndIdentifier = (NSNumber *)a3;
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setRangeStartIdentifier:(id)a3
{
  rangeStartIdentifier = self->_rangeStartIdentifier;
  if (rangeStartIdentifier != a3)
  {

    self->_rangeStartIdentifier = (NSNumber *)a3;
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setUserIdentifier:(id)a3
{
  userIdentifier = self->_userIdentifier;
  if (userIdentifier != a3)
  {

    self->_userIdentifier = (NSNumber *)a3;
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (NSNumber)userIdentifier
{
  objc_super v3 = self->_userIdentifier;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)usesSoftwareMap
{
  BOOL v3 = !-[StoreKitClientIdentity usesIdentityAttributes](self->_clientIdentity, "usesIdentityAttributes");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (int64_t)URLBagType
{
  int64_t v3 = -[StoreKitClientIdentity isSandboxed](self->_clientIdentity, "isSandboxed");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MicroPaymentQueueRequest;
  int64_t v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: (%@, user: %@, range: [%@,%@])",  -[MicroPaymentQueueRequest description](&v5, "description"),  -[StoreKitClientIdentity bundleIdentifier](self->_clientIdentity, "bundleIdentifier"),  self->_userIdentifier,  self->_rangeStartIdentifier,  self->_rangeEndIdentifier);
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)_copyApplicationIdentity:(id *)a3
{
  id v5 = -[StoreKitClientIdentity copy](self->_clientIdentity, "copy");
  id v6 = [v5 bundleIdentifier];
  id v7 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6);
  if (v7)
  {
    id v8 = v7;
    id v9 = [v7 itemID];
  }

  else
  {
    id v8 = +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:]( &OBJC_CLASS___AppExtensionSupport,  "supportedProxyExtensionForBundleIdentifier:",  v6);
    id v9 = [v8 itemID];
    if (!v8) {
      goto LABEL_8;
    }
  }

  if ([v9 integerValue] || objc_msgSend(objc_msgSend(v8, "bundleIdentifier"), "length"))
  {
    [v5 setValuesWithSoftwareApplicationProxy:v8];
    v10 = 0LL;
    if (!a3) {
      return v5;
    }
    goto LABEL_20;
  }

- (id)_ntsQueryParameters:(id *)a3
{
  id v5 = self->_clientIdentity;
  if (!-[StoreKitClientIdentity usesIdentityAttributes](v5, "usesIdentityAttributes"))
  {

    id v5 = -[MicroPaymentQueueRequest _copyApplicationIdentity:](self, "_copyApplicationIdentity:", a3);
  }

  if (v5)
  {
    id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    id v7 = -[StoreKitClientIdentity bundleIdentifier](v5, "bundleIdentifier");
    if (v7)
    {
      id v8 = -[NSString copyUTF8StringOfLength:](v7, "copyUTF8StringOfLength:", 256LL);
      if (v8)
      {
        id v9 = v8;
        [v6 setObject:v8 forKey:@"bid"];
      }
    }

    v10 = -[StoreKitClientIdentity bundleVersion](v5, "bundleVersion");
    if (v10)
    {
      id v11 = -[NSString copyUTF8StringOfLength:](v10, "copyUTF8StringOfLength:", 100LL);
      if (v11)
      {
        unsigned int v12 = v11;
        [v6 setObject:v11 forKey:@"bvrs"];
      }
    }

    uint64_t v13 = -[StoreKitClientIdentity storeIdentifier](v5, "storeIdentifier");
    if (v13) {
      objc_msgSend(v6, "setObject:forKey:", -[NSNumber stringValue](v13, "stringValue"), @"appAdamId");
    }
    v14 = -[StoreKitClientIdentity storeVersion](v5, "storeVersion");
    if (v14) {
      objc_msgSend(v6, "setObject:forKey:", -[NSNumber stringValue](v14, "stringValue"), @"appExtVrsId");
    }
    uint64_t v15 = -[StoreKitClientIdentity vendorIdentifier](v5, "vendorIdentifier");
    if (v15) {
      [v6 setObject:v15 forKey:@"vid"];
    }
    id v16 = -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid");
    if (v16) {
      [v6 setObject:v16 forKey:@"guid"];
    }
    id v17 = -[ISDevice serialNumber](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "serialNumber");
    if (v17) {
      [v6 setObject:v17 forKey:@"serialNumber"];
    }
    rangeStartIdentifier = self->_rangeStartIdentifier;
    if (rangeStartIdentifier) {
      int v19 = -[NSNumber unsignedLongLongValue](rangeStartIdentifier, "unsignedLongLongValue");
    }
    else {
      int v19 = 0LL;
    }
    rangeEndIdentifier = self->_rangeEndIdentifier;
    if (rangeEndIdentifier)
    {
      __int16 v21 = (char *)-[NSNumber itemIdentifierValue](rangeEndIdentifier, "itemIdentifierValue");
      if (v19 - 1 < v21)
      {
        id v22 = v21;
        v23 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v19);
        [v6 setObject:v23 forKey:kISLoadMoreStartIDParameter];
        v24 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v22);
        [v6 setObject:v24 forKey:kISLoadMoreEndIDParameter];
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

@end