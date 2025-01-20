@interface OTConfigurationContext
- (BOOL)isGuitarfish;
- (BOOL)octagonCapableRecordsExist;
- (BOOL)overrideEscrowCache;
- (BOOL)overrideForJoinAfterRestore;
- (BOOL)overrideForSetupAccountScript;
- (BOOL)testsEnabled;
- (CKKSControl)ckksControl;
- (NSString)altDSID;
- (NSString)authenticationAppleID;
- (NSString)containerName;
- (NSString)context;
- (NSString)deviceSessionID;
- (NSString)dsid;
- (NSString)flowID;
- (NSString)passwordEquivalentToken;
- (OTConfigurationContext)init;
- (OTControl)otControl;
- (id)description;
- (id)makeCKKSControl:(id *)a3;
- (id)makeOTControl:(id *)a3;
- (id)sbd;
- (int64_t)escrowFetchSource;
- (void)setAltDSID:(id)a3;
- (void)setAuthenticationAppleID:(id)a3;
- (void)setCkksControl:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEscrowFetchSource:(int64_t)a3;
- (void)setFlowID:(id)a3;
- (void)setIsGuitarfish:(BOOL)a3;
- (void)setOctagonCapableRecordsExist:(BOOL)a3;
- (void)setOtControl:(id)a3;
- (void)setOverrideEscrowCache:(BOOL)a3;
- (void)setOverrideForJoinAfterRestore:(BOOL)a3;
- (void)setOverrideForSetupAccountScript:(BOOL)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setSbd:(id)a3;
- (void)setTestsEnabled:(BOOL)a3;
@end

@implementation OTConfigurationContext

- (BOOL)overrideEscrowCache
{
  return -[OTConfigurationContext escrowFetchSource](self, "escrowFetchSource") == 2;
}

- (void)setOverrideEscrowCache:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  -[OTConfigurationContext setEscrowFetchSource:](self, "setEscrowFetchSource:", v3);
}

- (id)makeOTControl:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    -[OTConfigurationContext otControl](self, "otControl");
  }
  else {
    +[OTControl controlObject:error:](&OBJC_CLASS___OTControl, "controlObject:error:", 1LL, a3);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeCKKSControl:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    -[OTConfigurationContext ckksControl](self, "ckksControl");
  }
  else {
    +[CKKSControl CKKSControlObject:error:](&OBJC_CLASS___CKKSControl, "CKKSControlObject:error:", 1LL, a3);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OTConfigurationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OTConfigurationContext;
  v2 = -[OTConfigurationContext init](&v5, sel_init);
  uint64_t v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_context, (id)OTDefaultContext);
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  v4 = -[OTConfigurationContext context](self, "context");
  -[OTConfigurationContext containerName](self, "containerName");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OTConfigurationContext altDSID](self, "altDSID");
  [v3 stringWithFormat:@"<OTConfigurationContext %@, %@, %@>", v4, v5, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)authenticationAppleID
{
  return self->_authenticationAppleID;
}

- (void)setAuthenticationAppleID:(id)a3
{
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
}

- (int64_t)escrowFetchSource
{
  return self->_escrowFetchSource;
}

- (void)setEscrowFetchSource:(int64_t)a3
{
  self->_escrowFetchSource = a3;
}

- (BOOL)octagonCapableRecordsExist
{
  return self->_octagonCapableRecordsExist;
}

- (void)setOctagonCapableRecordsExist:(BOOL)a3
{
  self->_octagonCapableRecordsExist = a3;
}

- (BOOL)overrideForSetupAccountScript
{
  return self->_overrideForSetupAccountScript;
}

- (void)setOverrideForSetupAccountScript:(BOOL)a3
{
  self->_overrideForSetupAccountScript = a3;
}

- (BOOL)overrideForJoinAfterRestore
{
  return self->_overrideForJoinAfterRestore;
}

- (void)setOverrideForJoinAfterRestore:(BOOL)a3
{
  self->_overrideForJoinAfterRestore = a3;
}

- (BOOL)isGuitarfish
{
  return self->_isGuitarfish;
}

- (void)setIsGuitarfish:(BOOL)a3
{
  self->_isGuitarfish = a3;
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
}

- (OTControl)otControl
{
  return (OTControl *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOtControl:(id)a3
{
}

- (CKKSControl)ckksControl
{
  return (CKKSControl *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCkksControl:(id)a3
{
}

- (id)sbd
{
  return objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSbd:(id)a3
{
}

- (BOOL)testsEnabled
{
  return self->_testsEnabled;
}

- (void)setTestsEnabled:(BOOL)a3
{
  self->_testsEnabled = a3;
}

- (void).cxx_destruct
{
}

@end