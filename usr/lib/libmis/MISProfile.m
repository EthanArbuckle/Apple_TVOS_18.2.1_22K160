@interface MISProfile
- (CEQueryContext)derEntitlements;
- (MISProfile)init;
- (NSArray)certs;
- (NSDictionary)entitlements;
- (NSMutableDictionary)payload;
- (NSString)uuid;
- (int)fixUp;
- (int)flavor;
- (void)dealloc;
- (void)setCerts:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setFlavor:(int)a3;
- (void)setPayload:(id)a3;
@end

@implementation MISProfile

- (MISProfile)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MISProfile;
  v2 = -[MISProfile init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fixedup = 0;
    signature = v2->signature;
    v2->signature = 0LL;

    derEntitlementsStorage = v3->derEntitlementsStorage;
    v3->ceCtx = 0LL;
    v3->derEntitlementsStorage = 0LL;

    objc_msgSend_setPayload_(v3, v6, 0, v7);
    objc_msgSend_setEntitlements_(v3, v8, 0, v9);
    objc_msgSend_setCerts_(v3, v10, 0, v11);
    v12 = v3;
  }

  return v3;
}

- (NSString)uuid
{
  return (NSString *)MISProfileGetValue(self, (uint64_t)@"UUID");
}

- (CEQueryContext)derEntitlements
{
  return self->ceCtx;
}

- (void)dealloc
{
  if (self->ceCtx) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MISProfile;
  -[MISProfile dealloc](&v3, sel_dealloc);
}

- (int)fixUp
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!self->_fixedup)
  {
    if ((self->flavor | 2) == 2)
    {
      MISProfileGetValue(self, (uint64_t)@"Entitlements");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      entitlements = self->entitlements;
      self->entitlements = v4;

      MISProfileGetValue(self, (uint64_t)@"DeveloperCertificates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (void *)MEMORY[0x189603FA8];
      uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
      objc_msgSend_arrayWithCapacity_(v7, v12, v11, v13);
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v15 = v6;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, (uint64_t)v43, 16);
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v15);
            }
            CFDataRef v21 = sub_1840646E8(*(const __CFData **)(*((void *)&v39 + 1) + 8 * i));
            objc_msgSend_addObject_(v14, v22, (uint64_t)v21, v23);
          }

          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v24, (uint64_t)&v39, (uint64_t)v43, 16);
        }

        while (v18);
      }

      objc_storeStrong((id *)&self->certs, v14);
      v38 = 0LL;
      uint64_t v25 = CESerializeCFDictionary();
      v26 = (void *)MEMORY[0x1896135D8];
      if (v25 != *MEMORY[0x1896135D8])
      {
        sub_184068378();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
LABEL_29:
          _os_log_error_impl( &dword_18404B000,  v27,  OS_LOG_TYPE_ERROR,  "Invalid entitlements in a provisioning profile",  v37,  2u);
          goto LABEL_19;
        }

        goto LABEL_19;
      }

      derEntitlementsStorage = self->derEntitlementsStorage;
      self->derEntitlementsStorage = v38;

      if (CEManagedContextFromCFData() != *v26)
      {
        sub_184068378();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
          goto LABEL_29;
        }

- (NSMutableDictionary)payload
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPayload:(id)a3
{
}

- (int)flavor
{
  return self->flavor;
}

- (void)setFlavor:(int)a3
{
  self->flavor = a3;
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (NSArray)certs
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCerts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end