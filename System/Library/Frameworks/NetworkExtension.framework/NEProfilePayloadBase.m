@interface NEProfilePayloadBase
- (BOOL)addCertificatePending:(id)a3 certificateTag:(id)a4;
- (BOOL)addCertificatePending:(id)a3 certificateTag:(id)a4 accessGroup:(id)a5;
- (BOOL)setPostprocessedPayloadContents:(id)a3;
- (NEProfilePayloadBase)initWithPayload:(id)a3;
- (NSDictionary)payloadAtom;
- (NSDictionary)pluginUpgradeInfo;
- (NSMutableDictionary)pendingCertificates;
- (id)getPreprocessedPayloadContents;
- (id)validatePayload;
- (void)setPayloadAtom:(id)a3;
- (void)setPendingCertificates:(id)a3;
- (void)setPluginUpgradeInfo:(id)a3;
@end

@implementation NEProfilePayloadBase

- (NEProfilePayloadBase)initWithPayload:(id)a3
{
  v4 = (NSDictionary *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEProfilePayloadBase;
  v5 = -[NEProfilePayloadBase init](&v8, sel_init);
  payloadAtom = v5->_payloadAtom;
  v5->_payloadAtom = v4;

  return v5;
}

- (id)validatePayload
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  ne_log_large_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    id v6 = v5;
    v7 = -[NEProfilePayloadBase payloadAtom](self, "payloadAtom");
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_debug_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_DEBUG,  "%@: NEProfilePayloadBase validatePayload should be overriden, dict %@",  (uint8_t *)&v8,  0x16u);
  }

  return 0LL;
}

- (id)getPreprocessedPayloadContents
{
  return 0LL;
}

- (BOOL)setPostprocessedPayloadContents:(id)a3
{
  return 1;
}

- (BOOL)addCertificatePending:(id)a3 certificateTag:(id)a4
{
  return -[NEProfilePayloadBase addCertificatePending:certificateTag:accessGroup:]( self,  "addCertificatePending:certificateTag:accessGroup:",  a3,  a4,  0LL);
}

- (BOOL)addCertificatePending:(id)a3 certificateTag:(id)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_pendingCertificates
    || (v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:4],
        pendingCertificates = self->_pendingCertificates,
        self->_pendingCertificates = v11,
        pendingCertificates,
        self->_pendingCertificates))
  {
    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v13 setObject:v8 forKeyedSubscript:@"PayloadUUID"];
    if (v10) {
      [v13 setObject:v10 forKeyedSubscript:@"AccessGroup"];
    }
    -[NSMutableDictionary setObject:forKey:](self->_pendingCertificates, "setObject:forKey:", v13, v9);

    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSDictionary)payloadAtom
{
  return self->_payloadAtom;
}

- (void)setPayloadAtom:(id)a3
{
}

- (NSMutableDictionary)pendingCertificates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPendingCertificates:(id)a3
{
}

- (NSDictionary)pluginUpgradeInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPluginUpgradeInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end