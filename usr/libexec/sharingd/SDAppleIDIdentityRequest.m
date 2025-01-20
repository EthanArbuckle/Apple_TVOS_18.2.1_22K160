@interface SDAppleIDIdentityRequest
- (NSString)appleID;
- (OS_dispatch_queue)dispatchQueue;
- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3;
- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5;
- (id)certificateTokenHandler;
- (id)responseHandler;
- (void)_activate;
- (void)_handleCertificate:(__SecCertificate *)a3 intermediateCertificate:(__SecCertificate *)a4 withTrustResult:(BOOL)a5 error:(int)a6;
- (void)_handleCertificateCreateResponseError:(id)a3;
- (void)_handleCertificateCreateResponseWithInfo:(id)a3 error:(id)a4;
- (void)_handleCertificateFetchResponseError:(id)a3;
- (void)_handleCertificateFetchResponseWithInfo:(id)a3 error:(id)a4;
- (void)_handleCreateTimerFired;
- (void)_handleFetchTimerFired;
- (void)_handleKeyPairAvailable;
- (void)_handleReceivedCertificate;
- (void)_invalidate;
- (void)_responseHandlerWithIdentity:(id)a3 error:(id)a4;
- (void)_scheduleCreateCertificateTaskWithDelay:(unint64_t)a3;
- (void)_scheduleCreateRetryWithDelay:(unint64_t)a3;
- (void)_scheduleFetchCertificateTaskWithDelay:(unint64_t)a3;
- (void)_scheduleFetchRetryWithDelay:(unint64_t)a3;
- (void)_sendCreateCertificateRequest;
- (void)_sendFetchCertificateRequest;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setCertificateTokenHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation SDAppleIDIdentityRequest

- (void)_activate
{
  if (self->_activated)
  {
    v3 = "### Already activated\n";
LABEL_23:
    LogPrintF(&dword_100642C08, "-[SDAppleIDIdentityRequest _activate]", 60LL, v3);
    return;
  }

  if (self->_invalidated)
  {
    v3 = "### Object invalidated\n";
    goto LABEL_23;
  }

  if (self->_certificateToken && self->_privateKeyPersistentReference)
  {
    if (dword_100642C08 <= 30
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 30LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _activate]",  30LL,  "Certificate token and private key reference are available, skip create request\n");
    }

    -[SDAppleIDIdentityRequest _sendFetchCertificateRequest](self, "_sendFetchCertificateRequest");
  }

  else
  {
    -[SDAppleIDIdentityRequest _sendCreateCertificateRequest](self, "_sendCreateCertificateRequest");
  }

  self->_activated = 1;
}

- (void)_invalidate
{
  if (self->_invalidated)
  {
    if (dword_100642C08 <= 60
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
    {
      LogPrintF(&dword_100642C08, "-[SDAppleIDIdentityRequest _invalidate]", 60LL, "### Object invalidated\n");
    }
  }

  else
  {
    if (dword_100642C08 <= 30
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 30LL)))
    {
      LogPrintF(&dword_100642C08, "-[SDAppleIDIdentityRequest _invalidate]", 30LL, "Invalidate\n");
    }

    createDelayTimer = self->_createDelayTimer;
    if (createDelayTimer)
    {
      v4 = createDelayTimer;
      dispatch_source_cancel(v4);
      v5 = self->_createDelayTimer;
      self->_createDelayTimer = 0LL;
    }

    -[SDAppleIDServerTask setResponseHandler:](self->_certificateCreateTask, "setResponseHandler:", 0LL);
    -[SDAppleIDServerTask invalidate](self->_certificateCreateTask, "invalidate");
    certificateCreateTask = self->_certificateCreateTask;
    self->_certificateCreateTask = 0LL;

    fetchDelayTimer = self->_fetchDelayTimer;
    if (fetchDelayTimer)
    {
      v8 = fetchDelayTimer;
      dispatch_source_cancel(v8);
      v9 = self->_fetchDelayTimer;
      self->_fetchDelayTimer = 0LL;
    }

    -[SDAppleIDServerTask setResponseHandler:](self->_certificateFetchTask, "setResponseHandler:", 0LL);
    -[SDAppleIDServerTask invalidate](self->_certificateFetchTask, "invalidate");
    certificateFetchTask = self->_certificateFetchTask;
    self->_certificateFetchTask = 0LL;

    if (self->_activated)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960573LL, 0LL, 0LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      v14 = @"?";
      if (v12) {
        v14 = (const __CFString *)v12;
      }
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6723LL,  v15));
      -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:]( self,  "_responseHandlerWithIdentity:error:",  0LL,  v16);
    }

    self->_invalidated = 1;
  }

- (void)dealloc
{
  privateKey = self->_privateKey;
  if (privateKey) {
    CFRelease(privateKey);
  }
  publicKey = self->_publicKey;
  if (publicKey) {
    CFRelease(publicKey);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDAppleIDIdentityRequest;
  -[SDAppleIDIdentityRequest dealloc](&v5, "dealloc");
}

- (void)_handleCertificateCreateResponseError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100642C08 <= 90 && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 90LL)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificateCreateResponseError:]",  90LL,  "### Create Certificate request failed with error %@\n",  v4);
  }

  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0LL, v5);
}

- (void)_handleCertificateCreateResponseWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v20 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDAppleIDServerTask invalidate](self->_certificateCreateTask, "invalidate");
  certificateCreateTask = self->_certificateCreateTask;
  self->_certificateCreateTask = 0LL;

  if (v7)
  {
    id v15 = v7;
    v11 = 0LL;
    goto LABEL_20;
  }

  if (!v6)
  {
    v11 = 0LL;
    uint64_t v19 = -6705LL;
LABEL_19:
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v19,  0LL));
    if (!v15) {
      goto LABEL_15;
    }
LABEL_20:
    -[SDAppleIDIdentityRequest _handleCertificateCreateResponseError:]( self,  "_handleCertificateCreateResponseError:",  v15);

    id v15 = 0LL;
    goto LABEL_15;
  }

  if (dword_100642C08 <= 30 && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 30LL))) {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificateCreateResponseWithInfo:error:]",  30LL,  "Certificate Create Response: %@\n",  v6);
  }
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"AltDSID", TypeID, 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v11
    || (objc_storeStrong((id *)&self->_altDSID, v11),
        CFTypeID v12 = CFStringGetTypeID(),
        uint64_t v13 = CFDictionaryGetTypedValue(v6, @"CertificateToken", v12, 0LL),
        (v14 = (void *)objc_claimAutoreleasedReturnValue(v13)) == 0LL))
  {
    uint64_t v19 = -6712LL;
    goto LABEL_19;
  }

  id v15 = v14;
  objc_storeStrong((id *)&self->_certificateToken, v14);
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v6, @"Delay", 0LL, 0xFFFFFFFFLL, &v20);
  if (Int64Ranged) {
    uint64_t v17 = Int64Ranged;
  }
  else {
    uint64_t v17 = 60LL;
  }
  -[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:]( self,  "_scheduleFetchCertificateTaskWithDelay:",  v17);
  certificateTokenHandler = (void (**)(id, NSString *))self->_certificateTokenHandler;
  if (certificateTokenHandler && self->_privateKeyPersistentReference) {
    certificateTokenHandler[2](certificateTokenHandler, self->_certificateToken);
  }
LABEL_15:
}

- (void)_handleCertificateFetchResponseError:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100642C08 <= 90 && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 90LL))) {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificateFetchResponseError:]",  90LL,  "### Fetch Certificate request failed with error %{error}\n",  v8);
  }
  if (NSErrorToOSStatus(v8) == -6712 && self->_fetchRetryCount <= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    unint64_t Int64 = CFDictionaryGetInt64(v4, SFAppleIDErrorUserInfoRetryDelaySecondsKey, 0LL);

    uint64_t v6 = 7200LL;
    if (Int64 < 0x1C20) {
      uint64_t v6 = Int64;
    }
    if (Int64) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 60LL;
    }
    -[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:](self, "_scheduleFetchRetryWithDelay:", v7);
  }

  else
  {
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:]( self,  "_responseHandlerWithIdentity:error:",  0LL,  v8);
  }
}

- (void)_handleCertificateFetchResponseWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDAppleIDServerTask invalidate](self->_certificateFetchTask, "invalidate");
  certificateFetchTask = self->_certificateFetchTask;
  self->_certificateFetchTask = 0LL;

  if (v7)
  {
    id v43 = v7;
    uint64_t v17 = 0LL;
    CFTypeID v12 = 0LL;
    goto LABEL_68;
  }

  if (!v6)
  {
    NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
    v44 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)v45;
    v47 = @"?";
    if (v45) {
      v47 = (const __CFString *)v45;
    }
    v102 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
    NSErrorDomain v49 = NSOSStatusErrorDomain;
    uint64_t v50 = -6705LL;
    goto LABEL_53;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"AltDSID", TypeID, 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v11)
  {
    NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
    v51 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960584LL, 0LL, 0LL));
    uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);
    v46 = (void *)v52;
    v53 = @"?";
    if (v52) {
      v53 = (const __CFString *)v52;
    }
    v100 = v53;
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
    NSErrorDomain v49 = NSOSStatusErrorDomain;
    uint64_t v50 = -6712LL;
LABEL_53:
    id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v49,  v50,  v48));

    CFTypeID v12 = 0LL;
LABEL_61:
    uint64_t v17 = 0LL;
    goto LABEL_67;
  }

  CFTypeID v12 = v11;
  altDSID = self->_altDSID;
  if (!altDSID)
  {
    objc_storeStrong((id *)&self->_altDSID, v11);
    altDSID = self->_altDSID;
  }

  if (([v12 isEqualToString:altDSID] & 1) == 0)
  {
    NSErrorDomain v54 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
    v55 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960584LL, 0LL, 0LL));
    uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)v56;
    v58 = @"?";
    if (v56) {
      v58 = (const __CFString *)v56;
    }
    v98 = v58;
    v59 = &v98;
    v60 = &v97;
    goto LABEL_60;
  }

  CFTypeID v14 = CFStringGetTypeID();
  uint64_t v15 = CFDictionaryGetTypedValue(v6, @"CertificateToken", v14, 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!v16)
  {
    NSErrorDomain v54 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
    v61 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960584LL, 0LL, 0LL));
    uint64_t v62 = objc_claimAutoreleasedReturnValue(v61);
    v57 = (void *)v62;
    v63 = @"?";
    if (v62) {
      v63 = (const __CFString *)v62;
    }
    v96 = v63;
    v59 = &v96;
    v60 = &v95;
LABEL_60:
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v60,  1LL));
    id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v54,  -6712LL,  v64));

    goto LABEL_61;
  }

  uint64_t v17 = v16;
  if (([v16 isEqualToString:self->_certificateToken] & 1) == 0)
  {
    NSErrorDomain v65 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
    v66 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960584LL, 0LL, 0LL));
    uint64_t v67 = objc_claimAutoreleasedReturnValue(v66);
    v68 = (void *)v67;
    v69 = @"?";
    if (v67) {
      v69 = (const __CFString *)v67;
    }
    v94 = v69;
    v70 = &v94;
    v71 = &v93;
LABEL_65:
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v71,  1LL));
    id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v65,  -6712LL,  v72));

LABEL_67:
    if (!v43) {
      goto LABEL_33;
    }
LABEL_68:
    -[SDAppleIDIdentityRequest _handleCertificateFetchResponseError:]( self,  "_handleCertificateFetchResponseError:",  v43);

    goto LABEL_33;
  }

  int Int64Ranged = CFDictionaryGetInt64Ranged(v6, @"CertificateStatus", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  unint64_t certificateStatus = Int64Ranged;
  self->_unint64_t certificateStatus = Int64Ranged;
  switch(Int64Ranged)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if (dword_100642C08 > 60) {
        goto LABEL_31;
      }
      if (dword_100642C08 != -1) {
        goto LABEL_12;
      }
      if (_LogCategory_Initialize(&dword_100642C08, 60LL))
      {
        unint64_t certificateStatus = self->_certificateStatus;
LABEL_12:
        if (certificateStatus > 5) {
          int v20 = @"?";
        }
        else {
          int v20 = *(&off_1005CDA98 + certificateStatus);
        }
        LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificateFetchResponseWithInfo:error:]",  60LL,  "### Certificate status %d/%@\n",  certificateStatus,  v20);
      }

- (void)_handleCertificate:(__SecCertificate *)a3 intermediateCertificate:(__SecCertificate *)a4 withTrustResult:(BOOL)a5 error:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
  if ((_DWORD)v6)
  {
    CFTypeID v12 = 0LL;
    id v39 = 0LL;
    id v40 = 0LL;
    uint64_t v13 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    goto LABEL_47;
  }

  uint64_t v6 = 201209LL;
  if (!v7)
  {
    CFTypeID v12 = 0LL;
    id v39 = 0LL;
    id v40 = 0LL;
    uint64_t v13 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    uint64_t v6 = 201219LL;
    goto LABEL_47;
  }

  if (dword_100642C08 <= 50 && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 50LL))) {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  50LL,  "Received certificates are trusted.\n");
  }
  if (!self->_altDSID || !self->_appleID || !self->_privateKeyPersistentReference)
  {
    CFTypeID v12 = 0LL;
    id v39 = 0LL;
    id v40 = 0LL;
    uint64_t v13 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    uint64_t v6 = 4294960587LL;
    goto LABEL_47;
  }

  id v45 = 0LL;
  int v16 = SFAppleIDExpirationDateForCertificate(a3, &v45);
  id v17 = v45;
  if (v16
    && dword_100642C08 <= 60
    && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
  {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  60LL,  "### Failed to get expiration date from certificate\n");
  }

  -[NSDate timeIntervalSinceDate:](self->_certificateExpirationDate, "timeIntervalSinceDate:", v17);
  if (v17)
  {
    if (v18 < 0.0) {
      double v18 = -v18;
    }
    if (v18 > 2592000.0
      && dword_100642C08 <= 60
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  60LL,  "### Large certificate expiration date discrepancy. Certificate=%@; Response=%@\n",
        v17,
        self->_certificateExpirationDate);
    }
  }

  id v44 = 0LL;
  int v19 = SFAppleIDExpirationDateForCertificate(a4, &v44);
  id v20 = v44;
  v11 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
  if (v19
    && dword_100642C08 <= 60
    && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
  {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  60LL,  "### Failed to get expiration date from intermediate certificate\n");
  }

  [v20 timeIntervalSinceNow];
  double v22 = v21;
  if (v21 < 7776000.0
    && dword_100642C08 <= 60
    && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
  {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  60LL,  "### Intermediate certificate expiration date warning: expiration date: %@, time interval since now: %lf",  v20,  *(void *)&v22);
  }

  id v40 = v20;
  id v43 = 0LL;
  uint64_t v23 = SFAppleIDCommonNameForCertificate(a3, &v43);
  id v24 = v43;
  id v39 = v24;
  if ((_DWORD)v23)
  {
    id v15 = v17;
    CFTypeID v12 = 0LL;
    uint64_t v13 = 0LL;
    id v14 = 0LL;
    uint64_t v6 = v23;
    goto LABEL_47;
  }

  v25 = v24;
  if (([v24 hasPrefix:@"com.apple.idms.appleid."] & 1) == 0)
  {
    id v15 = v17;
    if (dword_100642C08 <= 90
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 90LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  90LL,  "### Common name %@ has unexpected prefix\n",  v39);
    }

    CFTypeID v12 = 0LL;
    uint64_t v13 = 0LL;
    id v14 = 0LL;
    goto LABEL_47;
  }

  appleID = self->_appleID;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Apple ID authorization certificate for %@",  appleID));
  id v42 = 0LL;
  uint64_t v6 = SFAppleIDAddCertificateToKeychain(appleID, a3, v27, &v42);
  id v14 = v42;

  if ((_DWORD)v6)
  {
    id v15 = v17;
    CFTypeID v12 = 0LL;
LABEL_46:
    uint64_t v13 = 0LL;
    goto LABEL_47;
  }

  if (![v14 length])
  {
    id v15 = v17;
    CFTypeID v12 = 0LL;
LABEL_67:
    uint64_t v13 = 0LL;
    uint64_t v6 = 4294960534LL;
    goto LABEL_47;
  }

  if (dword_100642C08 <= 50 && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 50LL))) {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  50LL,  "Added certificate for %@ to keychain\n",  self->_appleID);
  }
  v28 = self->_appleID;
  id v41 = 0LL;
  uint64_t v6 = SFAppleIDAddCertificateToKeychain(v28, a4, @"Apple ID authorization intermediate certificate", &v41);
  id v29 = v41;
  CFTypeID v12 = v29;
  if ((_DWORD)v6)
  {
    id v15 = v17;
    goto LABEL_46;
  }

  if (![v29 length])
  {
    id v15 = v17;
    goto LABEL_67;
  }

  v37 = v40;
  if (dword_100642C08 <= 50 && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 50LL))) {
    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _handleCertificate:intermediateCertificate:withTrustResult:error:]",  50LL,  "Added intermediate certificate for %@ to keychain\n",  self->_appleID);
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v38 = [[SFAppleIDIdentity alloc] initWithAppleID:self->_appleID altDSID:self->_altDSID];
  if (v38)
  {
    v33 = v38;
    [v38 setAccountIdentifier:v25];
    [v33 setCertificateExpirationDate:self->_certificateExpirationDate];
    [v33 setCertificatePersistentReference:v14];
    [v33 setIntermediateCertificateExpirationDate:v40];
    [v33 setIntermediateCertificatePersistentReference:v12];
    [v33 setLastValidationAttemptDate:v13];
    [v33 setLastValidationDate:v13];
    [v33 setModificationDate:v13];
    [v33 setPrivateKeyPersistentReference:self->_privateKeyPersistentReference];
    [v33 setSerialNumber:self->_certificateSerialNumber];
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:]( self,  "_responseHandlerWithIdentity:error:",  v33,  0LL);
    goto LABEL_50;
  }

  id v15 = v17;
  uint64_t v6 = 4294960568LL;
LABEL_47:
  uint64_t v30 = (int)v6;
  NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
  id v31 = objc_msgSend(v11[230], "stringWithUTF8String:", DebugGetErrorString(v6, 0, 0));
  uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)v32;
  CFTypeID v34 = @"?";
  if (v32) {
    CFTypeID v34 = (const __CFString *)v32;
  }
  v47 = v34;
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v30,  v35));
  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0LL, v36);

  id v17 = v15;
  v25 = v39;
  v37 = v40;
LABEL_50:
}

- (void)_handleCreateTimerFired
{
  createDelayTimer = self->_createDelayTimer;
  if (createDelayTimer)
  {
    v4 = createDelayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_createDelayTimer;
    self->_createDelayTimer = 0LL;
  }

  -[SDAppleIDIdentityRequest _sendCreateCertificateRequest](self, "_sendCreateCertificateRequest");
}

- (void)_handleFetchTimerFired
{
  fetchDelayTimer = self->_fetchDelayTimer;
  if (fetchDelayTimer)
  {
    v4 = fetchDelayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_fetchDelayTimer;
    self->_fetchDelayTimer = 0LL;
  }

  -[SDAppleIDIdentityRequest _sendFetchCertificateRequest](self, "_sendFetchCertificateRequest");
}

- (void)_handleReceivedCertificate
{
  CFTypeRef v14 = 0LL;
  CFTypeRef cf = 0LL;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_appleID)
  {
    uint64_t v3 = 4294960587LL;
    goto LABEL_5;
  }

  uint64_t v3 = SFAppleIDCreateCertificateWithPEMString(self->_certificatePEM, &cf);
  if ((_DWORD)v3)
  {
LABEL_5:
    uint64_t v4 = (int)v3;
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    id v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v3, 0LL, 0LL));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    BOOL v7 = (void *)v6;
    id v8 = @"?";
    if (v6) {
      id v8 = (const __CFString *)v6;
    }
    id v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v4,  v9));
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:]( self,  "_responseHandlerWithIdentity:error:",  0LL,  v10);

    goto LABEL_8;
  }

  if (!cf) {
    goto LABEL_21;
  }
  uint64_t v3 = SFAppleIDCreateCertificateWithPEMString(self->_intermediateCertificatePEM, &v14);
  if ((_DWORD)v3) {
    goto LABEL_5;
  }
  if (!v14)
  {
LABEL_21:
    uint64_t v3 = 4294960534LL;
    goto LABEL_5;
  }

  v18[0] = cf;
  v18[1] = v14;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  if (cf) {
    CFRetain(cf);
  }
  if (v14)
  {
    CFRetain(v14);
    CFTypeRef v11 = v14;
  }

  else
  {
    CFTypeRef v11 = 0LL;
  }

  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C8FB8;
  v13[3] = &unk_1005CDA00;
  v13[4] = self;
  v13[5] = cf;
  v13[6] = v11;
  SFAppleIDVerifyCertificateChain(v7, dispatchQueue, v13);
LABEL_8:

  if (cf) {
    CFRelease(cf);
  }
  if (v14) {
    CFRelease(v14);
  }
}

- (void)_handleKeyPairAvailable
{
  if (!self->_appleID)
  {
    id v5 = 0LL;
    int v9 = -6705;
    goto LABEL_9;
  }

  if (!self->_privateKey || !self->_publicKey || self->_certificateCreateTask)
  {
    id v5 = 0LL;
    goto LABEL_14;
  }

  p_csrPEM = &self->_csrPEM;
  csrPEM = self->_csrPEM;
  if (!csrPEM)
  {
    v11[5] = 0LL;
    int v9 = SFAppleIDCreateCertificateRequestPEMStringForKeyPair();
    id v10 = 0LL;
    id v5 = v10;
    if (v9)
    {
LABEL_9:
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  0LL));
      -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:]( self,  "_responseHandlerWithIdentity:error:",  0LL,  v6);
      goto LABEL_10;
    }

    if (v10)
    {
      objc_storeStrong((id *)&self->_csrPEM, 0LL);
      csrPEM = *p_csrPEM;
      goto LABEL_7;
    }

- (void)_responseHandlerWithIdentity:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDIdentityRequest responseHandler](self, "responseHandler"));

  if (v7)
  {
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SDAppleIDIdentityRequest responseHandler]( self,  "responseHandler"));
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);

    -[SDAppleIDIdentityRequest setResponseHandler:](self, "setResponseHandler:", 0LL);
  }
}

- (void)_scheduleCreateCertificateTaskWithDelay:(unint64_t)a3
{
  if (self->_createDelayTimer)
  {
    if (dword_100642C08 <= 60
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _scheduleCreateCertificateTaskWithDelay:]",  60LL,  "### Create certificate task already scheduled\n");
    }
  }

  else
  {
    if (dword_100642C08 <= 30
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 30LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _scheduleCreateCertificateTaskWithDelay:]",  30LL,  "Start create certificate delay timer for %ld seconds\n",  a3);
    }

    id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    createDelayTimer = self->_createDelayTimer;
    self->_createDelayTimer = v5;

    BOOL v7 = self->_createDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000C93D4;
    handler[3] = &unk_1005CB2F8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    SFDispatchTimerSet(self->_createDelayTimer, (double)a3, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_createDelayTimer);
  }

- (void)_scheduleFetchCertificateTaskWithDelay:(unint64_t)a3
{
  if (self->_fetchDelayTimer)
  {
    if (dword_100642C08 <= 60
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 60LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:]",  60LL,  "### Fetch certificate task already scheduled\n");
    }
  }

  else
  {
    if (dword_100642C08 <= 30
      && (dword_100642C08 != -1 || _LogCategory_Initialize(&dword_100642C08, 30LL)))
    {
      LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:]",  30LL,  "Start fetch certificate delay timer for %ld seconds\n",  a3);
    }

    id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    fetchDelayTimer = self->_fetchDelayTimer;
    self->_fetchDelayTimer = v5;

    BOOL v7 = self->_fetchDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000C9538;
    handler[3] = &unk_1005CB2F8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    SFDispatchTimerSet(self->_fetchDelayTimer, (double)a3, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_fetchDelayTimer);
  }

- (void)_scheduleCreateRetryWithDelay:(unint64_t)a3
{
  unint64_t createRetryCount = self->_createRetryCount + 1;
  self->_unint64_t createRetryCount = createRetryCount;
  if (dword_100642C08 <= 50)
  {
    if (dword_100642C08 == -1)
    {
      unint64_t createRetryCount = self->_createRetryCount;
    }

    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _scheduleCreateRetryWithDelay:]",  50LL,  "Scheduling create retry %d with delay %u seconds.\n",  createRetryCount,  a3);
  }

- (void)_scheduleFetchRetryWithDelay:(unint64_t)a3
{
  unint64_t fetchRetryCount = self->_fetchRetryCount + 1;
  self->_unint64_t fetchRetryCount = fetchRetryCount;
  if (dword_100642C08 <= 50)
  {
    if (dword_100642C08 == -1)
    {
      unint64_t fetchRetryCount = self->_fetchRetryCount;
    }

    LogPrintF( &dword_100642C08,  "-[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:]",  50LL,  "Scheduling fetch retry %d with delay %u seconds.\n",  fetchRetryCount,  a3);
  }

- (void)_sendCreateCertificateRequest
{
  if (self->_appleID)
  {
    if (self->_certificateCreateTask)
    {
      uint64_t v8 = -6762LL;
    }

    else
    {
      if (self->_privateKey && self->_publicKey)
      {
        -[SDAppleIDIdentityRequest _handleKeyPairAvailable](self, "_handleKeyPairAvailable");
        return;
      }

      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      unsigned int v4 = [v3 deviceWasUnlockedOnce];

      if (v4)
      {
        appleID = self->_appleID;
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_1000C97D0;
        v10[3] = &unk_1005CDA78;
        v10[4] = self;
        SFAppleIDCreateKeyPair(appleID, v7, v10);

        return;
      }

      uint64_t v8 = 201226LL;
    }
  }

  else
  {
    uint64_t v8 = -6705LL;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v8,  0LL));
  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0LL, v9);
}

- (void)_sendFetchCertificateRequest
{
  if (!self->_appleID)
  {
    unsigned int v4 = 0LL;
    uint64_t v8 = -6705LL;
    goto LABEL_10;
  }

  certificateToken = self->_certificateToken;
  if (!certificateToken || self->_certificateFetchTask)
  {
    unsigned int v4 = 0LL;
    goto LABEL_8;
  }

  CFTypeRef v11 = @"certificateToken";
  CFTypeID v12 = certificateToken;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  id v5 = -[SDAppleIDServerTask initWithType:appleID:info:]( objc_alloc(&OBJC_CLASS___SDAppleIDServerTask),  "initWithType:appleID:info:",  1LL,  self->_appleID,  v4);
  certificateFetchTask = self->_certificateFetchTask;
  self->_certificateFetchTask = v5;

  BOOL v7 = self->_certificateFetchTask;
  if (!v7)
  {
LABEL_8:
    uint64_t v8 = -6762LL;
LABEL_10:
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v8,  0LL));
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:]( self,  "_responseHandlerWithIdentity:error:",  0LL,  v9);

    goto LABEL_6;
  }

  -[SDAppleIDServerTask setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C9B54;
  v10[3] = &unk_1005CDA28;
  v10[4] = self;
  -[SDAppleIDServerTask setResponseHandler:](self->_certificateFetchTask, "setResponseHandler:", v10);
  -[SDAppleIDServerTask activate](self->_certificateFetchTask, "activate");
LABEL_6:
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9BBC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SDAppleIDIdentityRequest;
  id v6 = -[SDAppleIDIdentityRequest init](&v14, "init");
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleID, a3);
    uint64_t v10 = SFMainQueue(v8, v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v11;
  }

  return v7;
}

- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SDAppleIDIdentityRequest;
  CFTypeID v12 = -[SDAppleIDIdentityRequest init](&v20, "init");
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appleID, a3);
    objc_storeStrong((id *)&v13->_certificateToken, a4);
    objc_storeStrong((id *)&v13->_privateKeyPersistentReference, a5);
    uint64_t v16 = SFMainQueue(v14, v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v17;
  }

  return v13;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9D6C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)certificateTokenHandler
{
  return self->_certificateTokenHandler;
}

- (void)setCertificateTokenHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end