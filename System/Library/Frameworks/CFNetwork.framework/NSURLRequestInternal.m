@interface NSURLRequestInternal
- (BOOL)isEqual:(id)a3;
- (NSURLRequestInternal)init;
- (id).cxx_construct;
- (id)_initWithMessage:(__CFHTTPMessage *)a3 bodyParts:(__CFArray *)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 mainDocumentURL:(__CFURL *)a7 mutable:(unsigned __int8)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_inner;
- (void)dealloc;
@end

@implementation NSURLRequestInternal

- (id).cxx_construct
{
  self->_request._vptr$CoreLoggable = (void **)off_189C07050;
  self->_request.fRequiresDNSSECValidation = 0;
  self->_request.fHSTSPolicy.__ptr_.__value_ = 0LL;
  *(void *)&self->_request.fAllowsExpensiveNetworkAccess = 0LL;
  self->_request.fCachePolicy = 0LL;
  self->_request.fTimeout = 0.0;
  *(_OWORD *)&self->_request.fRequestPriority = xmmword_182C9D800;
  *(_WORD *)&self->_request.fFlags = 0;
  self->_request.fBoundInterfaceIdentifier = 0LL;
  self->_request.fProtocolProperties = 0LL;
  self->_request._explicitStorageSession = 0LL;
  self->_request.fAllowsUCA = 0;
  self->_request.fTimeWindowDuration = 0.0;
  self->_request.fStartTimeoutTime = 0.0;
  self->_request.fTimeWindowDelay = 0.0;
  *(_DWORD *)&self->_request.fRequiresShortConnectionTimeout = 0;
  self->_request.fPayloadTransmissionTimeout = 0.0;
  self->_request.fATSOverrides = 0LL;
  if (__CFNGetHTTP3Override::onceToken != -1) {
    dispatch_once(&__CFNGetHTTP3Override::onceToken, &__block_literal_global_45);
  }
  self->_request.fAssumesHTTP3Capable = __CFNGetHTTP3Override::value == 2;
  self->_request.fAttribution = 0LL;
  self->_request.fTrackerContext = 0LL;
  self->_request.fCookiePartitionIdentifier = 0LL;
  *(void *)&self->_request.fKnownTracker = 0LL;
  *(_DWORD *)&self->_request.fBlockTrackers = 0;
  return self;
}

- (NSURLRequestInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLRequestInternal;
  return -[NSURLRequestInternal init](&v3, sel_init);
}

- (void)_inner
{
  return &self->_request;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSURLRequestInternal;
  -[NSURLRequestInternal dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  URLRequest::initialize( (URLRequest *)[v4 _inner],  (const URLRequest *)-[NSURLRequestInternal _inner](self, "_inner"));
  return v4;
}

- (id)_initWithMessage:(__CFHTTPMessage *)a3 bodyParts:(__CFArray *)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 mainDocumentURL:(__CFURL *)a7 mutable:(unsigned __int8)a8
{
  int v8 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NSURLRequestInternal;
  v14 = -[NSURLRequestInternal init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v8) {
      *(_WORD *)&v14->_request.fFlags |= 2u;
    }
    CFURLRef v16 = CFHTTPMessageCopyRequestURL(a3);
    if (a5) {
      __int16 v17 = 1033;
    }
    else {
      __int16 v17 = 9;
    }
    __int16 v18 = *(_WORD *)&v15->_request.fFlags & 0xFFEF | v17;
    *(_WORD *)&v15->_request.fFlags = v18;
    v15->_request.fURL = v16;
    v15->_request.fCachePolicy = a5;
    if (a6 != 60.0) {
      *(_WORD *)&v15->_request.fFlags = v18 | 0x800;
    }
    v15->_request.fTimeout = a6;
    if (a7) {
      v19 = (__CFURL *)CFRetain(a7);
    }
    else {
      v19 = 0LL;
    }
    v15->_request.fMainDocumentURL = v19;
    if (v15->_request.fHTTPRequest && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "can't be here", buf, 2u);
    }

    Instance = (_OWORD *)_CFRuntimeCreateInstance();
    v21 = Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      v21 = Instance + 1;
      Instance[13] = 0u;
      Instance[14] = 0u;
      Instance[11] = 0u;
      Instance[12] = 0u;
      Instance[9] = 0u;
      Instance[10] = 0u;
      Instance[7] = 0u;
      Instance[8] = 0u;
      Instance[5] = 0u;
      Instance[6] = 0u;
      Instance[3] = 0u;
      Instance[4] = 0u;
      Instance[2] = 0u;
    }

    if (a3)
    {
      if (*((_BYTE *)a3 + 40)) {
        v22 = 0LL;
      }
      else {
        v22 = (__CFHTTPMessage *)((char *)a3 + 16);
      }
    }

    else
    {
      v22 = 0LL;
    }

    HTTPRequestMessage::HTTPRequestMessage((HTTPRequestMessage *)v21, v22);
    *(void *)v21 = &off_189C06CF0;
    *((void *)v21 + 1) = &unk_189C06D70;
    *((void *)v21 + 2) = &unk_189C06D90;
    *((void *)v21 + 16) = &unk_189C06DC0;
    *(_OWORD *)((char *)v21 + 184) = 0u;
    *(_OWORD *)((char *)v21 + 200) = 0u;
    *((_DWORD *)v21 + 54) = 256;
    if (a4)
    {
      v23 = CFGetAllocator(v21 - 1);
      CFIndex Count = CFArrayGetCount(a4);
      *((void *)v21 + 26) = CFArrayCreateMutableCopy(v23, Count, a4);
      (*(void (**)(_OWORD *, void))(*(void *)v21 + 64LL))(v21, 0LL);
    }

    v15->_request.fHTTPRequest = (HTTPRequest *)v21;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = [a3 _inner];
  if (self->_request.fCachePolicy != *(void *)(v4 + 16)) {
    goto LABEL_91;
  }
  uint64_t v5 = v4;
  if (((*(unsigned __int16 *)(v4 + 64) ^ *(_WORD *)&self->_request.fFlags) & 1) != 0
    || typesNotEqualWithAppropriateNullChecks(self->_request.fURL, *(const void **)(v4 + 8))
    || typesNotEqualWithAppropriateNullChecks(self->_request.fMainDocumentURL, *(const void **)(v5 + 32))
    || dictsNotEqualWithAppropriateNullAndEmptyDictionaryChecks( self->_request.fProtocolProperties,  *(const __CFDictionary **)(v5 + 40))
    || typesNotEqualWithAppropriateNullChecks(self->_request.fMainDocumentURL, *(const void **)(v5 + 32))
    || dictsNotEqualWithAppropriateNullAndEmptyDictionaryChecks( self->_request.fSSLProps,  *(const __CFDictionary **)(v5 + 72)))
  {
    goto LABEL_91;
  }

  fHTTPRequest = self->_request.fHTTPRequest;
  if (!fHTTPRequest)
  {
    v7 = @"GET";
    goto LABEL_10;
  }

  CFGetAllocator((char *)fHTTPRequest - 16);
  v7 = (const void *)*((void *)fHTTPRequest + 19);
  if (v7)
  {
LABEL_10:
    CFTypeRef v8 = CFRetain(v7);
    goto LABEL_13;
  }

  CFTypeRef v8 = 0LL;
LABEL_13:
  uint64_t v9 = *(void *)(v5 + 56);
  if (!v9)
  {
    v10 = @"GET";
    goto LABEL_15;
  }

  CFGetAllocator((CFTypeRef)(v9 - 16));
  v10 = *(const void **)(v9 + 152);
  if (v10)
  {
LABEL_15:
    CFTypeRef v11 = CFRetain(v10);
    goto LABEL_18;
  }

  CFTypeRef v11 = 0LL;
LABEL_18:
  int v12 = CFEqual(v8, v11);
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (!v12) {
    goto LABEL_91;
  }
  explicitStorageSession = self->_request._explicitStorageSession;
  v14 = *(const void **)(v5 + 232);
  if ((explicitStorageSession != 0LL) == (v14 == 0LL)) {
    goto LABEL_91;
  }
  if (!explicitStorageSession || !v14 || (int v15 = CFEqual(explicitStorageSession, v14)) != 0)
  {
    CFURLRef v16 = self->_request.fHTTPRequest;
    uint64_t v17 = *(void *)(v5 + 56);
    if (!v16)
    {
      if (v17 && !HTTPRequest::isEffectivelyEmpty(*(HTTPRequest **)(v5 + 56))) {
        goto LABEL_91;
      }
LABEL_40:
      if (((*(unsigned __int16 *)(v5 + 64) ^ *(_WORD *)&self->_request.fFlags) & 8) == 0
        && self->_request.fTimeWindowDuration == *(double *)(v5 + 144)
        && self->_request.fTimeWindowDelay == *(double *)(v5 + 136)
        && self->_request.fRequestPriority == *(void *)(v5 + 88)
        && self->_request.fStartTimeoutTime == *(double *)(v5 + 152)
        && self->_request.fRequiresShortConnectionTimeout == *(unsigned __int8 *)(v5 + 160)
        && self->_request.fPayloadTransmissionTimeout == *(double *)(v5 + 192)
        && self->_request.fAllowedProtocolTypes == *(void *)(v5 + 96)
        && self->_request.fAllowsExpensiveNetworkAccess == *(_DWORD *)(v5 + 216)
        && self->_request.fAllowsConstrainedNetworkAccess == *(_DWORD *)(v5 + 220)
        && self->_request.fAllowsUCA == *(_DWORD *)(v5 + 224)
        && self->_request.fAssumesHTTP3Capable == *(unsigned __int8 *)(v5 + 164)
        && self->_request.fAttribution == *(void *)(v5 + 184)
        && self->_request.fKnownTracker == *(unsigned __int8 *)(v5 + 165)
        && !typesNotEqualWithAppropriateNullChecks(self->_request.fTrackerContext, *(const void **)(v5 + 120))
        && self->_request.fPrivacyProxyFailClosed == *(unsigned __int8 *)(v5 + 166)
        && self->_request.fPrivacyProxyFailClosedForUnreachableNonMainHosts == *(unsigned __int8 *)(v5 + 167)
        && self->_request.fPrivacyProxyFailClosedForUnreachableHosts == *(unsigned __int8 *)(v5 + 168)
        && self->_request.fRequiresDNSSECValidation == *(_DWORD *)(v5 + 176)
        && self->_request.fAllowsPersistentDNS == *(unsigned __int8 *)(v5 + 180)
        && self->_request.fProhibitPrivacyProxy == *(unsigned __int8 *)(v5 + 169)
        && self->_request.fAllowPrivateAccessTokensForThirdParty == *(unsigned __int8 *)(v5 + 170)
        && self->_request.fUseEnhancedPrivacyMode == *(unsigned __int8 *)(v5 + 171)
        && self->_request.fBlockTrackers == *(unsigned __int8 *)(v5 + 172)
        && self->_request.fFailInsecureLoadWithHTTPSDNSRecord == *(unsigned __int8 *)(v5 + 173)
        && self->_request.fIsWebSearchContent == *(unsigned __int8 *)(v5 + 174))
      {
        LOBYTE(v15) = self->_request.fAllowOnlyPartitionedCookies == *(unsigned __int8 *)(v5 + 175);
        return v15;
      }

@end