@interface NSURLSessionTask
- (BOOL)_assumesHTTP3Capable;
- (BOOL)_disallowCellular;
- (BOOL)_failInsecureLoadWithHTTPSDNSRecord;
- (BOOL)_isAVAssetTask;
- (BOOL)_isKnownTracker;
- (BOOL)_isWebSearchContent;
- (BOOL)_preconnect;
- (BOOL)_privacyProxyFailClosed;
- (BOOL)_privacyProxyFailClosedForUnreachableHosts;
- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts;
- (BOOL)_prohibitPrivacyProxy;
- (BOOL)_requiresSecureHTTPSProxyConnection;
- (BOOL)_shouldPipelineHTTP;
- (BOOL)_shouldSkipPipelineProbe;
- (BOOL)_shouldUsePipelineHeuristics;
- (BOOL)_strictContentLength;
- (BOOL)_useEnhancedPrivacyMode;
- (BOOL)prefersIncrementalDelivery;
- (NSData)_TCPConnectionMetadata;
- (NSData)_backtrace;
- (NSDictionary)_DuetActivityProperties;
- (NSDictionary)_dependencyInfo;
- (NSDictionary)_legacySocketStreamProperties;
- (NSDictionary)_proxySettings;
- (NSDictionary)_sslSettings;
- (NSError)error;
- (NSString)_APSRelayTopic;
- (NSString)_boundInterfaceIdentifier;
- (NSString)_description;
- (NSString)_loggableDescription;
- (NSString)_sourceApplicationBundleIdentifierForMobileAsset;
- (NSString)_trackerContext;
- (NSUInteger)taskIdentifier;
- (NSURL)currentRequest_URL;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSURLSession)session;
- (NSURLSessionConfiguration)_effectiveConfiguration;
- (NSURLSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (NSURLSessionTask)initWithTaskGroup:(id)a3;
- (NSURLSessionTaskHTTPAuthenticator)authenticator;
- (NSURLSessionTaskState)state;
- (NSUUID)_uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (OS_nw_activity)_nw_activity;
- (OS_nw_activity)_private_nw_activity;
- (OS_nw_endpoint)_hostOverride;
- (OS_voucher)_voucher;
- (_CFHSTSPolicy)_cfHSTS;
- (_CFHSTSPolicy)_copyHSTSPolicy;
- (_CFURLCache)_cfCache;
- (_CFURLCredentialStorage)_cfCreds;
- (__CFDictionary)_copyATSState;
- (__CFDictionary)_copySocketStreamProperties;
- (__CFN_TaskMetrics)_metrics;
- (__CFSet)_getAuthenticatorStatusCodes;
- (__NSCFResumableUploadState)resumableUploadState;
- (__NSURLSessionTaskGroupForConfiguration)_taskGroup;
- (const)_createXCredentialStorage;
- (double)_timeWindowDelay;
- (double)_timeWindowDuration;
- (double)_timeoutInterval;
- (double)_timeoutIntervalForResource;
- (double)startTime;
- (float)priority;
- (id)_httpConnectionInfoCompletionBlock;
- (id)_incompleteTaskMetrics;
- (id)_protocolForTask;
- (id)_timingData;
- (int)_allowsCellularOverride;
- (int)_allowsConstrainedOverride;
- (int)_allowsExpensiveOverride;
- (int)_networkServiceType;
- (int)_requiresDNSSECValidation;
- (int64_t)_bytesPerSecondLimit;
- (int64_t)_countOfBytesReceivedEncoded;
- (int64_t)_countOfPendingBytesReceivedEncoded;
- (int64_t)_requestPriority;
- (int64_t)_suspensionThreshhold;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (unint64_t)_allowedProtocolTypes;
- (unint64_t)_attribution;
- (unint64_t)_cachePolicy;
- (unint64_t)_expectedProgressTarget;
- (unsigned)_darkWakePowerAssertion;
- (unsigned)_powerAssertion;
- (unsigned)_qos;
- (void)_addAdditionalHeaders:(void *)a1 toRequest:(void *)a2;
- (void)_appendCountOfPendingBytesReceivedEncoded:(int64_t)a3;
- (void)_completeUploadProgress;
- (void)_consumePendingBytesReceivedEncoded;
- (void)_finishProgressReporting;
- (void)_logUnlistedTracker:(id)a3;
- (void)_onSessionQueue_cleanupAndBreakCycles;
- (void)_releasePreventIdleSleepAssertionIfAppropriate;
- (void)_resetTaskDelegate;
- (void)_setConnectionIsCellular:(BOOL)a3;
- (void)_takePreventIdleSleepAssertionIfAppropriate;
- (void)_withXURLCache:(id)a3;
- (void)dealloc;
- (void)fillTaskDescriptionWithTaskIdentifier:(void *)a3 uniqueIdentifier:(uint64_t)a4 FixedTemplate:;
- (void)resume;
- (void)setCountOfBytesExpectedToReceive:(int64_t)a3;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesReceived:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate;
- (void)setError:(id)a3;
- (void)setResponse:(id)a3;
- (void)setState:(int64_t)a3;
- (void)set_APSRelayTopic:(id)a3;
- (void)set_TCPConnectionMetadata:(id)a3;
- (void)set_allowedProtocolTypes:(unint64_t)a3;
- (void)set_allowsCellular:(BOOL)a3;
- (void)set_allowsCellularOverride:(int)a3;
- (void)set_allowsConstrainedOverride:(int)a3;
- (void)set_allowsExpensiveOverride:(int)a3;
- (void)set_assumesHTTP3Capable:(BOOL)a3;
- (void)set_attribution:(unint64_t)a3;
- (void)set_cachePolicy:(unint64_t)a3;
- (void)set_cachedSocketStreamProperties:(id)a3;
- (void)set_connectionIsCompanionLink:(BOOL)a3;
- (void)set_cookieAcceptPolicy:(int)a3;
- (void)set_cookieTransformCallback:(id)a3;
- (void)set_countOfBytesReceivedEncoded:(int64_t)a3;
- (void)set_countOfPendingBytesReceivedEncoded:(int64_t)a3;
- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3;
- (void)set_extractor:(id)a3;
- (void)set_failInsecureLoadWithHTTPSDNSRecord:(BOOL)a3;
- (void)set_hasSZExtractor:(BOOL)a3;
- (void)set_httpConnectionInfoCompletionBlock:(id)a3;
- (void)set_isKnownTracker:(BOOL)a3;
- (void)set_isWebSearchContent:(BOOL)a3;
- (void)set_networkServiceType:(int)a3;
- (void)set_nw_activity:(id)a3;
- (void)set_preventsIdleSystemSleep:(BOOL)a3;
- (void)set_privacyProxyFailClosed:(BOOL)a3;
- (void)set_privacyProxyFailClosedForUnreachableHosts:(BOOL)a3;
- (void)set_privacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3;
- (void)set_private_nw_activity:(id)a3;
- (void)set_prohibitPrivacyProxy:(BOOL)a3;
- (void)set_protocolForTask:(id)a3;
- (void)set_proxyHandshakePending:(BOOL)a3;
- (void)set_qos:(unsigned int)a3;
- (void)set_requiresDNSSECValidation:(int)a3;
- (void)set_resolvedCNAMEChain:(id)a3;
- (void)set_shouldHandleCookies:(BOOL)a3;
- (void)set_shouldPipelineHTTP:(BOOL)a3;
- (void)set_shouldSkipPipelineProbe:(BOOL)a3;
- (void)set_shouldUsePipelineHeuristics:(BOOL)a3;
- (void)set_sslSettings:(id)a3;
- (void)set_timeoutInterval:(double)a3;
- (void)set_trackerContext:(id)a3;
- (void)set_trailers:(id)a3;
- (void)set_useEnhancedPrivacyMode:(BOOL)a3;
- (void)set_voucher:(id)a3;
- (void)updateCurrentRequest:(id)a3;
@end

@implementation NSURLSessionTask

- (NSURLSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v8 = -[NSURLSessionTask initWithTaskGroup:](self, "initWithTaskGroup:", a5);
  if (v8)
  {
    v8->_effectiveConfiguration = (NSURLSessionConfiguration *)(id)[a5 _groupConfiguration];
    uint64_t v9 = [a3 copy];
    v8->_originalRequest = (NSURLRequest *)v9;
    -[NSURLSessionTask updateCurrentRequest:](v8, "updateCurrentRequest:", v9);
    v8->_taskIdentifier = a4;
    v8->_uniqueIdentifier = (NSUUID *)(id)[MEMORY[0x189607AB8] UUID];
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    v8->_startTime = v10;
    v8->_state = 1LL;
    -[NSURLSessionConfiguration timeoutIntervalForResource](v8->_effectiveConfiguration, "timeoutIntervalForResource");
    v8->_timeoutIntervalForResource_ivar = v11;
    if (-[NSURLSessionConfiguration _appleIDContext](v8->_effectiveConfiguration, "_appleIDContext")
      || -[NSURLSessionConfiguration _authenticatorStatusCodes]( v8->_effectiveConfiguration,  "_authenticatorStatusCodes"))
    {
      -[NSURLSessionTask initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:]( v8,  "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:",  -[NSURLSessionConfiguration _appleIDContext](v8->_effectiveConfiguration, "_appleIDContext"),  -[NSURLSessionConfiguration _authenticatorStatusCodes](v8->_effectiveConfiguration, "_authenticatorStatusCodes"));
    }

    v8->_countOfBytesClientExpectsToSend = -1LL;
    v8->_countOfBytesClientExpectsToReceive = -1LL;
    BOOL v12 = -[NSURLSessionConfiguration _requiresSustainedDataDelivery]( v8->_effectiveConfiguration,  "_requiresSustainedDataDelivery");
    v8->_legacySocketStreamProperties = 0LL;
    uint64_t v13 = 0x200000LL;
    if (v12) {
      uint64_t v13 = 0x10000LL;
    }
    v8->_strictContentLength = 1;
    v8->_qos = 0;
    v8->_voucher = 0LL;
    v8->_suspensionThreshhold = v13;
    v8->_requestPriority = -1LL;
    v8->_priorityValue = 300LL;
    v8->_loadingPriorityValue = 0.5;
    v8->_networkServiceType = 0;
    v8->_priorityAPIStorage = 0.5;
    v8->_prefersIncrementalDeliveryAPIStorage = 1;
    *(_DWORD *)&v8->__TLSMinimumSupportedProtocolVersion = 0;
    v8->_shouldSkipPreferredClientCertificateLookup = -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup]( v8->_effectiveConfiguration,  "_shouldSkipPreferredClientCertificateLookup");
    v8->_preventsSystemHTTPProxyAuthentication = -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication]( v8->_effectiveConfiguration,  "_preventsSystemHTTPProxyAuthentication");
    v8->_requiresSecureHTTPSProxyConnection = -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection]( v8->_effectiveConfiguration,  "_requiresSecureHTTPSProxyConnection");
    v8->_preventsAppSSO = -[NSURLSessionConfiguration _preventsAppSSO](v8->_effectiveConfiguration, "_preventsAppSSO");
    v8->_discretionaryOverride = 0LL;
    v8->_unfair_lock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v8->_extractorFinishedDecoding = 0;
    if (__CFNIsRunningInXcode::envCheckOnce != -1) {
      dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_29);
    }
    if ((__CFNIsRunningInXcode::runningInXcode & 1) != 0 || ne_tracker_should_save_stacktrace())
    {
      *(void *)buf = 0LL;
      -[NSURLSessionTask set_backtrace:]( v8,  "set_backtrace:",  [MEMORY[0x189603F48] dataWithBytesNoCopy:ne_tracker_copy_current_stacktrace() length:0]);
    }

    v8->_metrics = (__CFN_TaskMetrics *)-[__CFN_TaskMetrics initWithTask:]( (char *)objc_alloc(&OBJC_CLASS_____CFN_TaskMetrics),  v8);
    v14 = objc_alloc(&OBJC_CLASS_____NSCFResumableUploadState);
    v15 = v8->_originalRequest;
    v16 = v15;
    if (!v14)
    {
      v19 = 0LL;
      goto LABEL_31;
    }

    if (v15)
    {
      v32.receiver = v14;
      v32.super_class = (Class)&OBJC_CLASS_____NSCFResumableUploadState;
      v17 = -[NSURLSessionTask init](&v32, sel_init);
      v19 = (__NSCFResumableUploadState *)v17;
      if (!v17)
      {
LABEL_31:

        v8->_resumableUploadState = v19;
        return v8;
      }

      HIDWORD(v17->_uploadProgress) = 0;
      objc_setProperty_atomic(v17, v18, @"6", 56LL);
      objc_setProperty_atomic_copy(v19, v20, v16, 32LL);
      v19->_bodyType = -1;
      v19->_offset = 0LL;
      v19->_streamLength = -1LL;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      -[NSURLRequest allHTTPHeaderFields](v16, "allHTTPHeaderFields", 0LL);
      v14 = (__NSCFResumableUploadState *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = -[__NSCFResumableUploadState countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v28,  buf,  16LL);
      if (v21)
      {
        uint64_t v22 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0LL; i != v21; ++i)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * i) lowercaseString];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            char v25 = [v24 hasPrefix:@"upload-"];

            if ((v25 & 1) != 0)
            {
              v19->_userOverride = 1;
              goto LABEL_30;
            }
          }

          uint64_t v21 = -[__NSCFResumableUploadState countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v28,  buf,  16LL);
          if (v21) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v26 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_18298D000,  v26,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: cannot initWithOriginalRequest with nil request",  buf,  2u);
      }

      v19 = 0LL;
    }

- (NSURLSessionTask)initWithTaskGroup:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSURLSessionTask;
  v4 = -[NSURLSessionTask init](&v9, sel_init);
  if (v4)
  {
    v4->__taskGroup = (__NSURLSessionTaskGroupForConfiguration *)a3;
    v5 = (void *)[a3 _groupSession];
    v6 = -[__NSCFURLSessionDelegateWrapper initWithSession:]( (id *)objc_alloc(&OBJC_CLASS_____NSCFURLSessionDelegateWrapper),  v5);
    v4->_publicDelegateWrapper = (__NSCFURLSessionDelegateWrapper *)v6;
    if (v5) {
      v7 = (void *)v5[9];
    }
    else {
      v7 = 0LL;
    }
    -[__NSCFURLSessionDelegateWrapper setFallbackDelegateWrapper:]((uint64_t)v6, v7);
  }

  return v4;
}

- (void)updateCurrentRequest:(id)a3
{
  if (!a3)
  {
    -[NSURLSessionTask setCurrentRequest:](self, "setCurrentRequest:");
    return;
  }

  id v39 = (id)[a3 mutableCopy];
  uint64_t v4 = [v39 _inner];
  v5 = -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration");
  -[NSURLSessionTask set_cachePolicy:](self, "set_cachePolicy:", *(void *)(v4 + 16));
  -[NSURLSessionTask set_timeoutInterval:](self, "set_timeoutInterval:", *(double *)(v4 + 24));
  uint64_t v6 = *(void *)(v4 + 56);
  if (v6 && *(_BYTE *)(v6 + 216))
  {
    v7 = *(const __CFString **)(v6 + 152);
    BOOL v9 = v7
      && (CFStringCompare(v7, (CFStringRef)&gConstantCFStringValueTable[2604], 0LL) == kCFCompareEqualTo
       || ((v8 = *(const __CFString **)(v6 + 152)) != 0LL
        || os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)
        && (LOWORD(number[0]) = 0,
            _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "these should always be initialized now",  (uint8_t *)number,  2u),  (v8 = *(const __CFString **)(v6 + 152)) != 0LL))
       && CFStringCompare(v8, (CFStringRef)&gConstantCFStringValueTable[2611], 0LL) == kCFCompareEqualTo)
      || *(_BYTE *)(v6 + 218) != 0;
  }

  else
  {
    BOOL v9 = 0LL;
  }

  -[NSURLSessionTask set_shouldPipelineHTTP:](self, "set_shouldPipelineHTTP:", v9);
  uint64_t v10 = *(void *)(v4 + 56);
  if (v10) {
    BOOL v11 = *(unsigned __int8 *)(v10 + 217) != 0;
  }
  else {
    BOOL v11 = 0LL;
  }
  -[NSURLSessionTask set_shouldUsePipelineHeuristics:](self, "set_shouldUsePipelineHeuristics:", v11);
  uint64_t v12 = *(void *)(v4 + 56);
  if (v12) {
    BOOL v13 = *(unsigned __int8 *)(v12 + 219) != 0;
  }
  else {
    BOOL v13 = 0LL;
  }
  -[NSURLSessionTask set_shouldSkipPipelineProbe:](self, "set_shouldSkipPipelineProbe:", v13);
  -[NSURLSessionTask set_shouldHandleCookies:](self, "set_shouldHandleCookies:", *(_WORD *)(v4 + 64) & 1);
  __int16 v14 = *(_WORD *)(v4 + 64);
  if ((v14 & 0x400) == 0)
  {
    __int16 v14 = *(_WORD *)(v4 + 64);
  }

  if ((v14 & 0x800) == 0)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if ((hasConfigValue((const void **)number, TypeID, v5, (const __CFString *)&unk_18C5B2958) & 1) != 0)
    {
      CFNumberRef v16 = number[0];
      int Value = CFNumberGetValue(number[0], kCFNumberDoubleType, &valuePtr);
      if (v16) {
        CFRelease(v16);
      }
      if (Value) {
        -[NSURLSessionTask set_timeoutInterval:](self, "set_timeoutInterval:", *(double *)&valuePtr);
      }
    }
  }

  if ((*(void *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8))) && (*(_WORD *)(v4 + 64) & 0x200) == 0)
  {
    if ((hasConfigValue((BOOL *)&valuePtr, v5, (const __CFString *)&unk_18C5B28E8) & 1) == 0) {
      LOBYTE(valuePtr) = 0;
    }
    if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_18C5B2808))
    {
      -[NSURLSessionTask set_shouldPipelineHTTP:](self, "set_shouldPipelineHTTP:", LOBYTE(number[0]));
      -[NSURLSessionTask set_shouldUsePipelineHeuristics:]( self,  "set_shouldUsePipelineHeuristics:",  valuePtr);
      uint64_t v18 = *(void *)(v4 + 56);
      if (v18) {
        BOOL v19 = *(unsigned __int8 *)(v18 + 219) != 0;
      }
      else {
        BOOL v19 = 0LL;
      }
      -[NSURLSessionTask set_shouldSkipPipelineProbe:](self, "set_shouldSkipPipelineProbe:", v19);
    }
  }

  if ((*(void *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8)))
    && (*(_WORD *)(v4 + 64) & 0x20) == 0
    && hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_18C5B27D0))
  {
    -[NSURLSessionTask set_shouldHandleCookies:](self, "set_shouldHandleCookies:", LOBYTE(number[0]));
  }

  if ((*(void *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8)))
    && hasConfigValue((uint64_t *)number, v5, (const __CFString *)&unk_18C5B2798))
  {
    -[NSURLSessionTask set_cookieAcceptPolicy:](self, "set_cookieAcceptPolicy:", LODWORD(number[0]));
  }

  __int16 v20 = *(_WORD *)(v4 + 64);
  if ((v20 & 0x100) != 0)
  {
    if ((v20 & 0x80) != 0) {
      goto LABEL_53;
    }
  }

  else
  {
    __int16 v20 = *(_WORD *)(v4 + 64);
    if ((v20 & 0x80) != 0)
    {
LABEL_53:
      if ((v20 & 0x40) == 0) {
        goto LABEL_62;
      }
      goto LABEL_59;
    }
  }

  __int16 v20 = *(_WORD *)(v4 + 64);
  if ((v20 & 0x40) == 0)
  {
LABEL_62:
    if ((*(_WORD *)(v4 + 64) & 0x1000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_65;
  }

- (NSURLSessionConfiguration)_effectiveConfiguration
{
  return self->_effectiveConfiguration;
}

- (void)set_cachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)set_timeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)set_shouldPipelineHTTP:(BOOL)a3
{
  self->_shouldPipelineHTTP = a3;
}

- (void)set_shouldUsePipelineHeuristics:(BOOL)a3
{
  self->_shouldUsePipelineHeuristics = a3;
}

- (void)set_shouldSkipPipelineProbe:(BOOL)a3
{
  self->_shouldSkipPipelineProbe = a3;
}

- (void)set_shouldHandleCookies:(BOOL)a3
{
  self->_shouldHandleCookies = a3;
}

- (void)set_cookieAcceptPolicy:(int)a3
{
  self->_cookieAcceptPolicy = a3;
}

- (void)set_preventsIdleSystemSleep:(BOOL)a3
{
  self->_preventsIdleSystemSleep = a3;
}

- (void)set_allowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (void)set_networkServiceType:(int)a3
{
  self->_networkServiceType = a3;
}

- (void)set_cachedSocketStreamProperties:(id)a3
{
}

- (NSDictionary)_sslSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 376LL, 1);
}

- (void)set_sslSettings:(id)a3
{
}

- (void)set_allowsCellularOverride:(int)a3
{
  self->_allowsCellularOverride = a3;
}

- (void)set_allowsConstrainedOverride:(int)a3
{
  self->_allowsConstrainedOverride = a3;
}

- (void)set_allowsExpensiveOverride:(int)a3
{
  self->_allowsExpensiveOverride = a3;
}

- (void)set_assumesHTTP3Capable:(BOOL)a3
{
  self->_assumesHTTP3Capable = a3;
}

- (void)set_requiresDNSSECValidation:(int)a3
{
  self->_requiresDNSSECValidation = a3;
}

- (void)set_allowedProtocolTypes:(unint64_t)a3
{
  self->_allowedProtocolTypes = a3;
}

- (void)set_attribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (void)set_isKnownTracker:(BOOL)a3
{
  self->_isKnownTracker = a3;
}

- (void)set_trackerContext:(id)a3
{
}

- (void)set_privacyProxyFailClosed:(BOOL)a3
{
  self->_privacyProxyFailClosed = a3;
}

- (void)set_privacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3
{
  self->_privacyProxyFailClosedForUnreachableNonMainHosts = a3;
}

- (void)set_privacyProxyFailClosedForUnreachableHosts:(BOOL)a3
{
  self->_privacyProxyFailClosedForUnreachableHosts = a3;
}

- (void)set_prohibitPrivacyProxy:(BOOL)a3
{
  self->_prohibitPrivacyProxy = a3;
}

- (void)set_useEnhancedPrivacyMode:(BOOL)a3
{
  self->_useEnhancedPrivacyMode = a3;
}

- (void)set_failInsecureLoadWithHTTPSDNSRecord:(BOOL)a3
{
  self->_failInsecureLoadWithHTTPSDNSRecord = a3;
}

- (void)set_isWebSearchContent:(BOOL)a3
{
  self->_isWebSearchContent = a3;
}

- (void)_addAdditionalHeaders:(void *)a1 toRequest:(void *)a2
{
  if (a1)
  {
    uint64_t v4 = *(HTTPMessage **)([a2 _inner] + 56);
    if (v4) {
      CFMutableDictionaryRef v5 = HTTPMessage::copyAllHeaderFields(v4);
    }
    else {
      CFMutableDictionaryRef v5 = 0LL;
    }
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __52__NSURLSessionTask__addAdditionalHeaders_toRequest___block_invoke;
    v6[3] = &__block_descriptor_48_e15_v32__0_8_16_B24l;
    v6[4] = v5;
    v6[5] = a2;
    [a1 enumerateKeysAndObjectsUsingBlock:v6];
    if (v5) {
      CFRelease(v5);
    }
  }

- (void)setCurrentRequest:(id)a3
{
}

- (NSUUID)_uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSUInteger)taskIdentifier
{
  return self->_taskIdentifier;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setDelegate:(id)delegate
{
  if (self->_seenFirstResume)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"Cannot set task delegate after resumption" userInfo:0]);
    __break(1u);
  }

  else
  {
    publicDelegateWrapper = self->_publicDelegateWrapper;
    if (publicDelegateWrapper) {
      objc_setProperty_atomic(publicDelegateWrapper, v5, delegate, 32LL);
    }
    objc_sync_exit(self);
  }

- (NSURLSessionTaskState)state
{
  return self->_state;
}

- (NSString)_description
{
  v3 = -[NSURLSessionTask session](self, "session");
  if (v3)
  {
    uint64_t v4 = @"Local";
    if (CFEqual( -[NSURLSessionConfiguration disposition](v3->_local_immutable_configuration_ivar, "disposition"),  &unk_18C5B2680))
    {
      CFMutableDictionaryRef v5 = -[NSURLSessionTask session](self, "session");
      if (v5)
      {
        if (!-[NSURLSessionConfiguration _isProxySession](v5->_local_immutable_configuration_ivar, "_isProxySession")) {
          uint64_t v4 = @"Background";
        }
      }

      else
      {
        uint64_t v4 = @"Background";
      }
    }
  }

  else
  {
    uint64_t v4 = @"Local";
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = @"Upload";
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v6 = @"WebSocket";
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v6 = @"Data";
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v6 = @"Download";
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v6 = @"Stream";
          }

          else
          {
            uint64_t v6 = &stru_189C1D1D8;
            if (objc_opt_class())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                uint64_t v6 = @"AVAssetDownload";
              }

              else
              {
                gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v7);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0) {
                  uint64_t v6 = @"AVAggregateAssetDownload";
                }
              }
            }
          }
        }
      }
    }
  }

  return (NSString *)[NSString stringWithFormat:@"%@%@%@", v4, v6, -[NSURLSessionTask _loggableDescription](self, "_loggableDescription")];
}

- (NSURLSession)session
{
  return (NSURLSession *)-[__NSURLSessionTaskGroupForConfiguration _groupSession]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupSession");
}

- (__NSURLSessionTaskGroupForConfiguration)_taskGroup
{
  return (__NSURLSessionTaskGroupForConfiguration *)objc_getProperty(self, a2, 584LL, 1);
}

- (NSString)_loggableDescription
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  objc_sync_enter(self);
  if (!self->_loggableDescription)
  {
    v3 = -[NSURLSessionTask session](self, "session");
    if (v3 && -[NSURLSessionConfiguration _isProxySession](v3->_local_immutable_configuration_ivar, "_isProxySession"))
    {
      __int16 v7 = 0;
      int v8 = 0;
      strcpy(v6, "PDTask <00000000-0000-0000-0000-000000000000>.<0>");
      -[NSURLSessionTask fillTaskDescriptionWithTaskIdentifier:uniqueIdentifier:FixedTemplate:]( (uint64_t)self,  -[NSURLSessionTask taskIdentifier]( self,  "taskIdentifier",  *(_OWORD *)v6,  *(void *)&v6[16],  *(void *)&v6[24],  *(void *)&v6[32],  *(void *)&v6[40],  *(unsigned __int16 *)&v6[48],  0LL,  0LL,  0LL),  -[NSURLSessionTask _uniqueIdentifier](self, "_uniqueIdentifier"),  (uint64_t)&v6[7]);
      uint64_t v4 = (NSString *)(id)[NSString stringWithCString:v6 encoding:1];
    }

    else
    {
      strcpy(v6, "Task <00000000-0000-0000-0000-000000000000>.<0>");
      -[NSURLSessionTask fillTaskDescriptionWithTaskIdentifier:uniqueIdentifier:FixedTemplate:]( (uint64_t)self,  -[NSURLSessionTask taskIdentifier]( self,  "taskIdentifier",  *(void *)v6,  *(void *)&v6[8],  *(void *)&v6[16],  *(void *)&v6[24],  *(void *)&v6[32],  *(void *)&v6[40],  0LL,  unk_182BD8418,  0LL,  0LL),  -[NSURLSessionTask _uniqueIdentifier](self, "_uniqueIdentifier"),  (uint64_t)&v6[5]);
      uint64_t v4 = (NSString *)(id)[NSString stringWithCString:v6 encoding:1];
    }

    self->_loggableDescription = v4;
  }

  objc_sync_exit(self);
  return self->_loggableDescription;
}

- (void)fillTaskDescriptionWithTaskIdentifier:(void *)a3 uniqueIdentifier:(uint64_t)a4 FixedTemplate:
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [a3 getUUIDBytes:uu];
    uuid_unparse(uu, (char *)(a4 + 1));
    *(_BYTE *)(a4 + 37) = 62;
    if (a2)
    {
      uint64_t v6 = 39LL;
      unint64_t v7 = a2;
      do
      {
        ++v6;
        BOOL v8 = v7 >= 0xA;
        v7 /= 0xAuLL;
      }

      while (v8);
      int v9 = v6 - 40;
      do
      {
        *(_BYTE *)(a4 + v6) = (a2 % 0xA) | 0x30;
        unint64_t v10 = v6 - 39;
        --v6;
        a2 /= 0xAuLL;
      }

      while (v10 > 1);
      uint64_t v11 = (v9 + 41);
    }

    else
    {
      uint64_t v11 = 40LL;
    }

    *(_BYTE *)(a4 + v11) = 62;
  }

- (void)resume
{
  v78[2] = *MEMORY[0x1895F89C0];
  if (-[NSURLSessionTask state](self, "state") > NSURLSessionTaskStateSuspended
    || !-[NSURLSessionTask workQueue](self, "workQueue"))
  {
    return;
  }

  -[NSURLSessionTask setState:](self, "setState:", 0LL);
  -[NSURLSessionTask set_qos:](self, "set_qos:", qos_class_self());
  -[NSURLSessionTask set_voucher:](self, "set_voucher:", (id)voucher_copy());
  v76[0] = 0LL;
  v76[1] = 0LL;
  if (-[NSURLSessionTask _nw_activity](self, "_nw_activity"))
  {
    -[NSURLSessionTask _nw_activity](self, "_nw_activity");
    nw_activity_activate();
    -[NSURLSessionTask _nw_activity](self, "_nw_activity");
    nw_activity_get_token();
  }

  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v3 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
    -[NSURLSessionTask _timeoutInterval](self, "_timeoutInterval");
    uint64_t v6 = v5;
    -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
    *(_DWORD *)buf = 138544898;
    *(void *)v69 = v4;
    *(_WORD *)&v69[8] = 2048;
    *(void *)&v69[10] = v6;
    *(_WORD *)&v69[18] = 2048;
    *(void *)v70 = v7;
    *(_WORD *)&v70[8] = 1024;
    *(_DWORD *)v71 = -[NSURLSessionTask _qos](self, "_qos");
    *(_WORD *)&v71[4] = 2112;
    *(void *)v72 = -[NSURLSessionTask _voucher](self, "_voucher");
    *(_WORD *)&v72[8] = 1042;
    int v73 = 16;
    __int16 v74 = 2098;
    v75 = v76;
    _os_log_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ resuming, timeouts(%.1f, %.1f) qos(0x%x) voucher(%@) activity(%{public,uuid_t}.16P)",  buf,  0x40u);
  }

  BOOL v8 = self;
  -[NSURLSessionTask _effectiveConfiguration](v8, "_effectiveConfiguration");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = HARLoggingEnabled([v9 _pidForHAR]);

  if (!v10 || -[NSURLSessionTask _isAVAssetTask](v8, "_isAVAssetTask")) {
    goto LABEL_32;
  }
  instrumentsTaskLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTask _uniqueIdentifier](v8, "_uniqueIdentifier");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v11, v12);

  uint64_t v13 = v8;
  uint64_t v14 = -[NSURLSessionTask session](v13, "session");
  v15 = (_BYTE *)v14;
  if (v14) {
    CFNumberRef v16 = *(void **)(v14 + 112);
  }
  else {
    CFNumberRef v16 = 0LL;
  }
  id v17 = v16;
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask taskIdentifier](v13, "taskIdentifier"));
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v19 forKeyedSubscript:@"taskIdentifier"];

  -[NSURLSessionTask taskDescription](v13, "taskDescription");
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v20 forKeyedSubscript:@"taskDescription"];

  -[NSURLSessionTask originalRequest](v13, "originalRequest");
  CFTypeID v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 URL];
  int v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 absoluteString];
  CFNumberRef v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v23 forKeyedSubscript:@"url"];

  -[NSURLSessionTask originalRequest](v13, "originalRequest");
  CFTypeID v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 HTTPMethod];
  char v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v25 forKeyedSubscript:@"method"];

  v26 = (void *)MEMORY[0x189607968];
  v27 = -[NSURLSessionTask originalRequest](v13, "originalRequest");
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "attribution"));
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v28 forKeyedSubscript:@"attribution"];

  if (v15) {
    uint64_t v29 = v15[68] & 1;
  }
  else {
    uint64_t v29 = 0LL;
  }
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", v29, spid);
  CFTypeID v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v30 forKeyedSubscript:@"isSharedSession"];

  [v15 sessionDescription];
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v31 forKeyedSubscript:@"sessionDescription"];

  objc_super v32 = (void *)MEMORY[0x189607968];
  [v17 disposition];
  int v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isEqualToString:", 0x18C5B2728));
  int v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v34 forKeyedSubscript:@"isEphemeralSession"];

  [v17 identifier];
  int v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v35 forKeyedSubscript:@"backgroundIdentifier"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFTypeRef v36 = @"Data";
LABEL_25:
    [v18 setObject:v36 forKeyedSubscript:@"taskType"];
    goto LABEL_26;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFTypeRef v36 = @"Upload";
    goto LABEL_25;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFTypeRef v36 = @"Download";
    goto LABEL_25;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFTypeRef v36 = @"Stream";
    goto LABEL_25;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFTypeRef v36 = @"WebSocket";
    goto LABEL_25;
  }

- (OS_dispatch_queue)workQueue
{
  result = -[NSURLSessionTask session](self, "session");
  if (result) {
    return (OS_dispatch_queue *)*((void *)result + 15);
  }
  return result;
}

- (void)set_qos:(unsigned int)a3
{
  self->_qos = a3;
}

- (void)set_voucher:(id)a3
{
}

- (double)_timeoutInterval
{
  return self->_timeoutInterval;
}

- (double)_timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource_ivar;
}

- (unsigned)_qos
{
  return self->_qos;
}

- (OS_voucher)_voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 384LL, 1);
}

- (OS_nw_activity)_nw_activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 624LL, 1);
}

- (void)set_private_nw_activity:(id)a3
{
}

- (OS_nw_activity)_private_nw_activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 632LL, 1);
}

- (BOOL)_isAVAssetTask
{
  return 0;
}

- (NSURL)currentRequest_URL
{
  return -[NSURLRequest URL](-[NSURLSessionTask currentRequest](self, "currentRequest"), "URL");
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 168LL, 1);
}

void __26__NSURLSessionTask_resume__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E1578C]();
  uint64_t v3 = [*(id *)(a1 + 32) _metrics];
  if (v3) {
    double v4 = *(double *)(v3 + 56);
  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_resume", v4);
  objc_autoreleasePoolPop(v2);
}

- (__CFN_TaskMetrics)_metrics
{
  return (__CFN_TaskMetrics *)objc_getProperty(self, a2, 616LL, 1);
}

- (__NSCFResumableUploadState)resumableUploadState
{
  return (__NSCFResumableUploadState *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)set_protocolForTask:(id)a3
{
  self->_protocolForTask = a3;
}

- (_CFHSTSPolicy)_copyHSTSPolicy
{
  if (!-[NSURLSessionTask _cfHSTS](self, "_cfHSTS")) {
    return (_CFHSTSPolicy *)objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "copyHSTSPolicy");
  }
  result = -[NSURLSessionTask _cfHSTS](self, "_cfHSTS");
  if (result) {
    return (_CFHSTSPolicy *)CFRetain(result);
  }
  return result;
}

- (_CFHSTSPolicy)_cfHSTS
{
  return (_CFHSTSPolicy *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)_withXURLCache:(id)a3
{
  if (-[NSURLSessionTask _cfCache](self, "_cfCache"))
  {
    uint64_t v5 = -[NSURLSessionTask _cfCache](self, "_cfCache");
    uint64_t v6 = -[NSURLSessionTask session](self, "session");
    CFXURLCache = XURLCache::createCFXURLCache((XURLCache *)v5, v6, v7);
  }

  else
  {
    int v9 = -[NSURLSessionConfiguration URLCache](self->_effectiveConfiguration, "URLCache");
    if (!v9) {
      return;
    }
    BOOL v10 = (XURLCache *)v9;
    uint64_t v11 = -[NSURLSessionTask session](self, "session");
    CFXURLCache = XURLCache::createNSXURLCache(v10, v11, v12);
  }

  uint64_t v13 = CFXURLCache;
  if (CFXURLCache)
  {
    (*((void (**)(id, CFXURLCache *))a3 + 2))(a3, CFXURLCache);
    (*(void (**)(CFXURLCache *))(*(void *)v13 + 8LL))(v13);
  }

- (_CFURLCache)_cfCache
{
  return (_CFURLCache *)objc_getProperty(self, a2, 320LL, 1);
}

- (__CFDictionary)_copySocketStreamProperties
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  cachedSocketStreamProperties = self->_cachedSocketStreamProperties;
  if (cachedSocketStreamProperties) {
    return (__CFDictionary *)CFRetain(cachedSocketStreamProperties);
  }
  uint64_t v5 = -[NSURLSessionConfiguration _socketStreamProperties](self->_effectiveConfiguration, "_socketStreamProperties");
  uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v5) {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, (CFDictionaryRef)v5);
  }
  else {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  BOOL v8 = MutableCopy;
  BOOL v9 = -[NSURLSessionConfiguration allowsExpensiveNetworkAccess]( self->_effectiveConfiguration,  "allowsExpensiveNetworkAccess");
  BOOL v10 = (const void **)MEMORY[0x189604DE0];
  if (!v9) {
    CFDictionaryAddValue(v8, &unk_18C5AD750, (const void *)*MEMORY[0x189604DE0]);
  }
  if (!-[NSURLSessionConfiguration allowsConstrainedNetworkAccess]( self->_effectiveConfiguration,  "allowsConstrainedNetworkAccess")) {
    CFDictionaryAddValue(v8, &unk_18C5AD718, *v10);
  }
  BOOL v11 = -[NSURLSessionConfiguration _allowsUCA](self->_effectiveConfiguration, "_allowsUCA");
  uint64_t v12 = (const void **)MEMORY[0x189604DE8];
  if (v11) {
    CFDictionaryAddValue(v8, &unk_18C5AC058, (const void *)*MEMORY[0x189604DE8]);
  }
  if (!-[NSURLSessionConfiguration _allowsVirtualInterfaces](self->_effectiveConfiguration, "_allowsVirtualInterfaces")) {
    CFDictionaryAddValue(v8, &unk_18C5AC090, *v10);
  }
  if (-[NSURLSessionConfiguration _multipathAlternatePort](self->_effectiveConfiguration, "_multipathAlternatePort")) {
    CFDictionaryAddValue( v8,  &unk_18C5ABA70,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionConfiguration _multipathAlternatePort]( self->_effectiveConfiguration,  "_multipathAlternatePort")));
  }
  if (-[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self->_effectiveConfiguration, "_TCPAdaptiveReadTimeout")) {
    CFDictionaryAddValue( v8,  &unk_18C5ACC98,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout]( self->_effectiveConfiguration,  "_TCPAdaptiveReadTimeout")));
  }
  if (-[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self->_effectiveConfiguration, "_TCPAdaptiveWriteTimeout")) {
    CFDictionaryAddValue( v8,  &unk_18C5ACCD0,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout]( self->_effectiveConfiguration,  "_TCPAdaptiveWriteTimeout")));
  }
  if (-[NSURLSessionConfiguration _allowsPowerNapScheduling]( self->_effectiveConfiguration,  "_allowsPowerNapScheduling"))
  {
    CFDictionaryAddValue(v8, &unk_18C5ADCC8, *v12);
  }

  if (-[NSURLSessionConfiguration _tcpConnectionPoolName](self->_effectiveConfiguration, "_tcpConnectionPoolName"))
  {
    CFDictionaryAddValue( v8,  &unk_18C5AC1E0,  -[NSURLSessionConfiguration _tcpConnectionPoolName](self->_effectiveConfiguration, "_tcpConnectionPoolName"));
    CFDictionaryAddValue( v8,  &unk_18C5AC218,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[NSURLSessionTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority")));
  }

  if (-[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset]( self,  "_sourceApplicationBundleIdentifierForMobileAsset"))
  {
    uint64_t v13 = -[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset]( self,  "_sourceApplicationBundleIdentifierForMobileAsset");
  }

  else
  {
    if (!-[NSURLSessionConfiguration _sourceApplicationBundleIdentifier]( self->_effectiveConfiguration,  "_sourceApplicationBundleIdentifier")) {
      goto LABEL_29;
    }
    uint64_t v13 = -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier]( self->_effectiveConfiguration,  "_sourceApplicationBundleIdentifier");
  }

  CFDictionaryAddValue(v8, &unk_18C5ADF68, v13);
LABEL_29:
  if (-[NSURLSessionConfiguration _companionAppBundleIdentifier]( self->_effectiveConfiguration,  "_companionAppBundleIdentifier"))
  {
    CFDictionaryAddValue( v8,  &unk_18C5AB3E0,  -[NSURLSessionConfiguration _companionAppBundleIdentifier]( self->_effectiveConfiguration,  "_companionAppBundleIdentifier"));
  }

  if (-[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier]( self->_effectiveConfiguration,  "_sourceApplicationSecondaryIdentifier"))
  {
    CFDictionaryAddValue( v8,  &unk_18C5AD6E0,  -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier]( self->_effectiveConfiguration,  "_sourceApplicationSecondaryIdentifier"));
  }

  if (-[NSURLSessionConfiguration _sourceApplicationAuditTokenData]( self->_effectiveConfiguration,  "_sourceApplicationAuditTokenData"))
  {
    CFDictionaryAddValue( v8,  &unk_18C5ADF30,  -[NSURLSessionConfiguration _sourceApplicationAuditTokenData]( self->_effectiveConfiguration,  "_sourceApplicationAuditTokenData"));
  }

  if (-[NSURLSessionConfiguration _attributedBundleIdentifier]( self->_effectiveConfiguration,  "_attributedBundleIdentifier"))
  {
    CFDictionaryAddValue( v8,  &unk_18C5AD788,  -[NSURLSessionConfiguration _attributedBundleIdentifier]( self->_effectiveConfiguration,  "_attributedBundleIdentifier"));
  }

  if (-[NSURLSessionConfiguration _preventsIdleSleepOnceConnected]( self->_effectiveConfiguration,  "_preventsIdleSleepOnceConnected"))
  {
    CFDictionaryAddValue(v8, &unk_18C5ABBF8, *v12);
  }

  if (-[NSURLSessionConfiguration _forcesNewConnections](self->_effectiveConfiguration, "_forcesNewConnections")) {
    CFDictionaryAddValue( v8,  @"uniqueTaskIdentifier",  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")));
  }
  if (!-[NSURLSessionConfiguration allowsCellularAccess](self->_effectiveConfiguration, "allowsCellularAccess")) {
    CFDictionarySetValue(v8, &unk_18C5ADC20, *v12);
  }
  if (-[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode]( self->_effectiveConfiguration,  "shouldUseExtendedBackgroundIdleMode"))
  {
    CFDictionarySetValue(v8, &unk_18C5ADD38, *v12);
  }

  if (-[NSURLSessionConfiguration _allowsMultipathTCP](self->_effectiveConfiguration, "_allowsMultipathTCP")) {
    CFDictionarySetValue(v8, &unk_18C5ADA98, *v12);
  }
  if (-[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission]( self->_effectiveConfiguration,  "_allowsResponseMonitoringDuringBodyTranmission"))
  {
    CFDictionarySetValue(v8, &unk_18C5B0268, *v12);
  }

  if (-[NSURLSessionConfiguration waitsForConnectivity](self->_effectiveConfiguration, "waitsForConnectivity")
    || -[NSURLSessionConfiguration _allowsIndefiniteConnections]( self->_effectiveConfiguration,  "_allowsIndefiniteConnections"))
  {
    CFDictionarySetValue(v8, &unk_18C5ADAD0, *v12);
  }

  if (-[NSURLSessionConfiguration _CTDataConnectionServiceType]( self->_effectiveConfiguration,  "_CTDataConnectionServiceType"))
  {
    CFDictionarySetValue( v8,  &unk_18C5AD9B8,  -[NSURLSessionConfiguration _CTDataConnectionServiceType]( self->_effectiveConfiguration,  "_CTDataConnectionServiceType"));
  }

  if (-[NSURLSessionConfiguration _allowsTCPFastOpen](self->_effectiveConfiguration, "_allowsTCPFastOpen")) {
    CFDictionarySetValue(v8, &unk_18C5ABF08, *v12);
  }
  if (-[NSURLSessionConfiguration _allowsTLSSessionTickets](self->_effectiveConfiguration, "_allowsTLSSessionTickets")) {
    CFDictionarySetValue(v8, &unk_18C5ABED0, *v12);
  }
  if (!-[NSURLSessionConfiguration _allowsTLSSessionResumption]( self->_effectiveConfiguration,  "_allowsTLSSessionResumption")) {
    CFDictionarySetValue(v8, &unk_18C5ABE98, *v10);
  }
  if (-[NSURLSessionConfiguration _allowsTLSFalseStart](self->_effectiveConfiguration, "_allowsTLSFalseStart"))
  {
    int Value = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_18C5AE048);
    v15 = Value
        ? CFDictionaryCreateMutableCopy(v6, 0LL, Value)
        : CFDictionaryCreateMutable(v6, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFNumberRef v16 = v15;
    if (v15)
    {
      id v17 = *v12;
      CFDictionarySetValue(v15, &unk_18C5AD2F0, *v12);
      CFDictionarySetValue(v16, &unk_18C5AD328, v17);
      CFDictionarySetValue(v8, &unk_18C5AE048, v16);
      CFRelease(v16);
    }
  }

  if (-[NSURLSessionConfiguration _tlsTrustPinningPolicyName]( self->_effectiveConfiguration,  "_tlsTrustPinningPolicyName"))
  {
    CFDictionarySetValue( v8,  &unk_18C5ACC28,  -[NSURLSessionConfiguration _tlsTrustPinningPolicyName]( self->_effectiveConfiguration,  "_tlsTrustPinningPolicyName"));
  }

  if (-[NSURLSessionConfiguration _allowsTLSECH](self->_effectiveConfiguration, "_allowsTLSECH")) {
    CFDictionarySetValue(v8, &unk_18C5ABF40, *v12);
  }
  if (-[NSURLSessionConfiguration _customReadBufferSize](self->_effectiveConfiguration, "_customReadBufferSize")) {
    CFDictionarySetValue( v8,  &unk_18C5AC8E0,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionConfiguration _customReadBufferSize]( self->_effectiveConfiguration,  "_customReadBufferSize")));
  }
  -[NSURLSessionConfiguration _customReadBufferTimeout](self->_effectiveConfiguration, "_customReadBufferTimeout");
  if (v18 > 0.0)
  {
    BOOL v19 = (void *)MEMORY[0x189607968];
    -[NSURLSessionConfiguration _customReadBufferTimeout](self->_effectiveConfiguration, "_customReadBufferTimeout");
    CFDictionarySetValue(v8, &unk_18C5AC918, (const void *)objc_msgSend(v19, "numberWithDouble:"));
  }

  if (-[NSURLSessionConfiguration _expiredDNSBehavior](self->_effectiveConfiguration, "_expiredDNSBehavior")) {
    CFDictionarySetValue( v8,  &unk_18C5AC480,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[NSURLSessionConfiguration _expiredDNSBehavior]( self->_effectiveConfiguration,  "_expiredDNSBehavior")));
  }
  if (-[NSURLSessionTask _sslSettings](self, "_sslSettings"))
  {
    __int16 v20 = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_18C5AE048);
    CFTypeID v21 = v6;
    if (v20) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutableCopy(v6, 0LL, v20);
    }
    else {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    }
    CFNumberRef v23 = Mutable;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    CFTypeID v24 = -[NSURLSessionTask _sslSettings](self, "_sslSettings");
    uint64_t v25 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v62,  v68,  16LL);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v63;
      do
      {
        for (uint64_t i = 0LL; i != v26; ++i)
        {
          if (*(void *)v63 != v27) {
            objc_enumerationMutation(v24);
          }
          CFDictionarySetValue( v23,  *(const void **)(*((void *)&v62 + 1) + 8 * i),  -[NSDictionary objectForKeyedSubscript:]( -[NSURLSessionTask _sslSettings](self, "_sslSettings"),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v62 + 1) + 8 * i)));
        }

        uint64_t v26 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v62,  v68,  16LL);
      }

      while (v26);
    }

    CFDictionarySetValue(v8, &unk_18C5AE048, v23);
    uint64_t v6 = v21;
    uint64_t v12 = (const void **)MEMORY[0x189604DE8];
    BOOL v10 = (const void **)MEMORY[0x189604DE0];
    if (v23) {
      CFRelease(v23);
    }
  }

  if (-[NSURLSessionTask _boundInterfaceIdentifier](self, "_boundInterfaceIdentifier")) {
    CFDictionaryAddValue( v8,  &unk_18C5AD7F8,  -[NSURLSessionTask _boundInterfaceIdentifier](self, "_boundInterfaceIdentifier"));
  }
  if (-[NSURLSessionTask _allowsCellularOverride](self, "_allowsCellularOverride"))
  {
    if (-[NSURLSessionTask _allowsCellularOverride](self, "_allowsCellularOverride") == 2) {
      uint64_t v29 = v12;
    }
    else {
      uint64_t v29 = v10;
    }
    CFDictionarySetValue(v8, &unk_18C5ADC20, *v29);
  }

  if (-[NSURLSessionTask _disallowCellular](self, "_disallowCellular")) {
    CFDictionarySetValue(v8, &unk_18C5ADC20, *v12);
  }
  if (-[NSURLSessionTask _allowsExpensiveOverride](self, "_allowsExpensiveOverride"))
  {
    if (-[NSURLSessionTask _allowsExpensiveOverride](self, "_allowsExpensiveOverride") == 1) {
      CFTypeID v30 = v12;
    }
    else {
      CFTypeID v30 = v10;
    }
    CFDictionarySetValue(v8, &unk_18C5AD750, *v30);
  }

  if (-[NSURLSessionTask _allowsConstrainedOverride](self, "_allowsConstrainedOverride"))
  {
    if (-[NSURLSessionTask _allowsConstrainedOverride](self, "_allowsConstrainedOverride") == 1) {
      __int128 v31 = v12;
    }
    else {
      __int128 v31 = v10;
    }
    CFDictionarySetValue(v8, &unk_18C5AD718, *v31);
  }

  if (-[NSURLSessionTask _allowsUCAOverride](self, "_allowsUCAOverride"))
  {
    if (-[NSURLSessionTask _allowsUCAOverride](self, "_allowsUCAOverride") == 1) {
      objc_super v32 = v12;
    }
    else {
      objc_super v32 = v10;
    }
    CFDictionarySetValue(v8, &unk_18C5AC058, *v32);
  }

  unint64_t v33 = -[NSURLSessionConfiguration _forcedNetworkServiceType]( self->_effectiveConfiguration,  "_forcedNetworkServiceType");
  if (!v33) {
    LODWORD(v33) = -[NSURLSessionTask _networkServiceType](self, "_networkServiceType");
  }
  if ((_DWORD)v33)
  {
    NetworkServiceTypeString = (const void *)ClassicURLConnection::getNetworkServiceTypeString(v33);
    CFDictionarySetValue(v8, &unk_18C5AD440, NetworkServiceTypeString);
  }

  if (-[NSURLRequest _requiresShortConnectionTimeout]( -[NSURLSessionTask currentRequest](self, "currentRequest"),  "_requiresShortConnectionTimeout"))
  {
    uint64_t valuePtr = 0x4024000000000000LL;
    CFNumberRef v35 = CFNumberCreate(v6, kCFNumberDoubleType, &valuePtr);
    if (v35)
    {
      CFNumberRef v36 = v35;
      CFDictionarySetValue(v8, &unk_18C5AB488, v35);
      CFRelease(v36);
    }
  }

  if (-[NSURLSessionTask _hostOverride](self, "_hostOverride")) {
    CFDictionarySetValue(v8, &unk_18C5AB728, -[NSURLSessionTask _hostOverride](self, "_hostOverride"));
  }
  int v37 = -[NSURLSessionConfiguration _allowsHTTP3Internal]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "_allowsHTTP3Internal");
  if (v37 == 1
    || !v37 && (nw_settings_get_quic_enabled() & 1) != 0
    || -[NSURLSessionTask _assumesHTTP3Capable](self, "_assumesHTTP3Capable"))
  {
    CFDictionarySetValue(v8, &unk_18C5AB958, *v12);
  }

  if (-[NSURLSessionTask _allowsPersistentDNS](self, "_allowsPersistentDNS")) {
    CFDictionarySetValue(v8, &unk_18C5AB220, *v12);
  }
  if (-[NSURLSessionTask _isKnownTracker](self, "_isKnownTracker")) {
    CFDictionaryAddValue(v8, &unk_18C5ABA38, *v12);
  }
  if (-[NSURLSessionTask _attribution](self, "_attribution")) {
    CFDictionaryAddValue( v8,  &unk_18C5AB300,  (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask _attribution](self, "_attribution")));
  }
  if (-[NSURLSessionTask _trackerContext](self, "_trackerContext")) {
    CFDictionaryAddValue(v8, &unk_18C5ABF78, -[NSURLSessionTask _trackerContext](self, "_trackerContext"));
  }
  if (-[NSURLSessionTask _privacyProxyFailClosed](self, "_privacyProxyFailClosed")) {
    CFDictionaryAddValue(v8, &unk_18C5ABC30, *v12);
  }
  if (-[NSURLSessionTask _privacyProxyFailClosedForUnreachableNonMainHosts]( self,  "_privacyProxyFailClosedForUnreachableNonMainHosts"))
  {
    CFDictionaryAddValue(v8, &unk_18C5ABCA0, *v12);
  }

  if (-[NSURLSessionTask _privacyProxyFailClosedForUnreachableHosts]( self,  "_privacyProxyFailClosedForUnreachableHosts"))
  {
    CFDictionaryAddValue(v8, &unk_18C5ABC68, *v12);
  }

  if (-[NSURLSessionConfiguration _enablesL4SInternal]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "_enablesL4SInternal"))
  {
    if (-[NSURLSessionConfiguration _enablesL4SInternal]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "_enablesL4SInternal") == 1) {
      v38 = v12;
    }
    else {
      v38 = v10;
    }
    CFDictionaryAddValue(v8, &unk_18C5AB6F0, *v38);
  }

  if (-[NSURLSessionTask _prohibitPrivacyProxy](self, "_prohibitPrivacyProxy")) {
    CFDictionaryAddValue(v8, &unk_18C5ABD10, *v12);
  }
  if (-[NSURLSessionTask _useEnhancedPrivacyMode](self, "_useEnhancedPrivacyMode")) {
    CFDictionaryAddValue(v8, &unk_18C5ABFB0, *v12);
  }
  if (-[NSURLSessionTask _blockTrackers](self, "_blockTrackers")) {
    CFDictionaryAddValue(v8, &unk_18C5AB338, *v12);
  }
  if (-[NSURLSessionTask _failInsecureLoadWithHTTPSDNSRecord](self, "_failInsecureLoadWithHTTPSDNSRecord")) {
    CFDictionaryAddValue(v8, &unk_18C5AB8B0, *v12);
  }
  if (-[NSURLSessionTask _isWebSearchContent](self, "_isWebSearchContent")
    && -[NSURLSessionTask _useEnhancedPrivacyMode](self, "_useEnhancedPrivacyMode"))
  {
    CFDictionaryAddValue(v8, &unk_18C5ABA00, *v12);
  }

  if (-[NSURLSessionTask _requiresDNSSECValidation](self, "_requiresDNSSECValidation"))
  {
    if (-[NSURLSessionTask _requiresDNSSECValidation](self, "_requiresDNSSECValidation") == 1) {
      id v39 = v12;
    }
    else {
      id v39 = v10;
    }
    v40 = *v39;
    uint64_t v41 = v8;
  }

  else
  {
    if (!-[NSURLSessionConfiguration requiresDNSSECValidation]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "requiresDNSSECValidation")) {
      goto LABEL_165;
    }
    v40 = *v12;
    uint64_t v41 = v8;
  }

  CFDictionaryAddValue(v41, &unk_18C5ABDF0, v40);
LABEL_165:
  if (-[NSURLSessionConfiguration _prohibitEncryptedDNS]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "_prohibitEncryptedDNS"))
  {
    CFDictionaryAddValue(v8, &unk_18C5ABCD8, *v12);
  }

  if (-[NSURLSessionConfiguration _disableAPWakeOnIdleConnections]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "_disableAPWakeOnIdleConnections"))
  {
    CFDictionaryAddValue(v8, &unk_18C5AB648, *v12);
  }

  v42 = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_18C5AD830);
  if (v42) {
    v43 = CFDictionaryCreateMutableCopy(v6, 0LL, v42);
  }
  else {
    v43 = CFDictionaryCreateMutable(v6, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  }
  id v44 = v43;
  if (v43
    && !CFDictionaryGetValue(v43, @"kConditionalConnectionIdentifier")
    && CFDictionaryGetValue(v44, @"kConditionalConnectionLaunchOnDemand")
    && (uint64_t v59 = -[NSURLSessionTask currentRequest](self, "currentRequest")) != 0LL
    && (uint64_t v60 = -[NSURLRequest URL](v59, "URL")) != 0LL)
  {
    CFStringRef v45 = CFURLGetString(v60);
  }

  else
  {
    CFStringRef v45 = 0LL;
  }

  -[NSURLSessionTask _timeWindowDelay](self, "_timeWindowDelay");
  uint64_t valuePtr = v46;
  -[NSURLSessionTask _timeWindowDuration](self, "_timeWindowDuration");
  double v66 = v47;
  if (v47 == 0.0) {
    goto LABEL_183;
  }
  CFNumberRef v48 = CFNumberCreate(v6, kCFNumberDoubleType, &valuePtr);
  CFNumberRef v49 = CFNumberCreate(v6, kCFNumberDoubleType, &v66);
  CFNumberRef v50 = v49;
  if (v48 && v49)
  {
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementTimeWindowDelay", v48);
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementTimeWindowDuration", v50);
    uint64_t v51 = (void *)MEMORY[0x189603F50];
    -[NSURLSessionTask startTime](self, "startTime");
    double v53 = v52;
    -[NSURLSessionTask _timeWindowDelay](self, "_timeWindowDelay");
    CFDictionarySetValue( v44,  @"kConditionalConnectionRequirementTimeWindowStartTime",  (const void *)[v51 dateWithTimeIntervalSinceReferenceDate:(double)(60 * ((unint64_t)(v53 + v54) / 0x3C))]);
  }

  else if (!v48)
  {
    goto LABEL_181;
  }

  CFRelease(v48);
LABEL_181:
  if (v50) {
    CFRelease(v50);
  }
LABEL_183:
  if (v45) {
    CFDictionarySetValue(v44, @"kConditionalConnectionIdentifier", v45);
  }
  if (-[NSURLSessionConfiguration _requiresPowerPluggedIn](self->_effectiveConfiguration, "_requiresPowerPluggedIn"))
  {
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementPowerPluggedIn", *v12);
    legacySocketStreamProperties = self->_legacySocketStreamProperties;
    if (legacySocketStreamProperties)
    {
      if (-[NSDictionary objectForKeyedSubscript:]( legacySocketStreamProperties,  "objectForKeyedSubscript:",  0x18C5AD830LL))
      {
        uint64_t v56 = (void *)-[NSDictionary mutableCopy](self->_legacySocketStreamProperties, "mutableCopy");
        uint64_t v57 = (void *)objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( self->_legacySocketStreamProperties,  "objectForKeyedSubscript:",  0x18C5AD830),  "mutableCopy");
        [v57 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"kConditionalConnectionRequirementPowerPluggedIn"];
        [v56 setObject:v57 forKeyedSubscript:0x18C5AD830];
        -[NSURLSessionTask set_legacySocketStreamProperties:](self, "set_legacySocketStreamProperties:", v56);
      }
    }
  }

  if (v44)
  {
    if (CFDictionaryGetCount(v44)) {
      CFDictionarySetValue(v8, &unk_18C5AD830, v44);
    }
    CFRelease(v44);
  }

  if (-[NSURLSessionTask _legacySocketStreamProperties](self, "_legacySocketStreamProperties"))
  {
    uint64_t v58 = -[NSURLSessionTask _legacySocketStreamProperties](self, "_legacySocketStreamProperties");
    v61[0] = MEMORY[0x1895F87A8];
    v61[1] = 3221225472LL;
    v61[2] = __47__NSURLSessionTask__copySocketStreamProperties__block_invoke;
    v61[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v61[4] = v8;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v58, "enumerateKeysAndObjectsUsingBlock:", v61);
  }

  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", v8);
  return v8;
}

- (NSString)_sourceApplicationBundleIdentifierForMobileAsset
{
  return self->_sourceApplicationBundleIdentifierForMobileAsset;
}

- (NSString)_boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (int)_allowsCellularOverride
{
  return self->_allowsCellularOverride;
}

- (BOOL)_disallowCellular
{
  return self->_disallowCellular;
}

- (int)_allowsExpensiveOverride
{
  return self->_allowsExpensiveOverride;
}

- (int)_allowsConstrainedOverride
{
  return self->_allowsConstrainedOverride;
}

- (int)_networkServiceType
{
  return self->_networkServiceType;
}

- (OS_nw_endpoint)_hostOverride
{
  return self->_hostOverride;
}

- (BOOL)_isKnownTracker
{
  return self->_isKnownTracker;
}

- (unint64_t)_attribution
{
  return self->_attribution;
}

- (NSString)_trackerContext
{
  return (NSString *)objc_getProperty(self, a2, 736LL, 1);
}

- (BOOL)_privacyProxyFailClosed
{
  return self->_privacyProxyFailClosed;
}

- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return self->_privacyProxyFailClosedForUnreachableNonMainHosts;
}

- (BOOL)_privacyProxyFailClosedForUnreachableHosts
{
  return self->_privacyProxyFailClosedForUnreachableHosts;
}

- (BOOL)_prohibitPrivacyProxy
{
  return self->_prohibitPrivacyProxy;
}

- (BOOL)_useEnhancedPrivacyMode
{
  return self->_useEnhancedPrivacyMode;
}

- (BOOL)_failInsecureLoadWithHTTPSDNSRecord
{
  return self->_failInsecureLoadWithHTTPSDNSRecord;
}

- (BOOL)_isWebSearchContent
{
  return self->_isWebSearchContent;
}

- (int)_requiresDNSSECValidation
{
  return self->_requiresDNSSECValidation;
}

- (double)_timeWindowDelay
{
  return self->_timeWindowDelay;
}

- (double)_timeWindowDuration
{
  return self->_timeWindowDuration;
}

- (NSDictionary)_legacySocketStreamProperties
{
  return self->_legacySocketStreamProperties;
}

- (BOOL)_strictContentLength
{
  return self->_strictContentLength;
}

- (BOOL)_preconnect
{
  return self->_preconnect;
}

- (unint64_t)_cachePolicy
{
  return self->_cachePolicy;
}

- (id)_protocolForTask
{
  return self->_protocolForTask;
}

- (int64_t)_suspensionThreshhold
{
  return self->_suspensionThreshhold;
}

- (int64_t)_bytesPerSecondLimit
{
  return self->_bytesPerSecondLimitValue;
}

- (const)_createXCredentialStorage
{
  if (-[NSURLSessionTask _cfCreds](self, "_cfCreds"))
  {
    uint64_t v3 = -[NSURLSessionTask _cfCreds](self, "_cfCreds");
    return (const XCredentialStorage *)XCredentialStorage::createCFXCredentialStorage((XCredentialStorage *)v3, v4);
  }

  else
  {
    uint64_t v6 = -[NSURLSessionConfiguration URLCredentialStorage](self->_effectiveConfiguration, "URLCredentialStorage");
    if (v6)
    {
      uint64_t v7 = v6;
      BOOL v8 = (NSXCredentialStorage *)MEMORY[0x186E12804](*MEMORY[0x189604DB0], 32LL, 0LL);
      *(_OWORD *)BOOL v8 = 0u;
      *((_OWORD *)v8 + 1) = 0u;
      NSXCredentialStorage::NSXCredentialStorage(v8, v7);
    }

    else
    {
      return (const XCredentialStorage *)XCredentialStorage::createEmptyXCredentialStorage(0LL);
    }
  }

  return result;
}

- (_CFURLCredentialStorage)_cfCreds
{
  return (_CFURLCredentialStorage *)objc_getProperty(self, a2, 328LL, 1);
}

- (__CFDictionary)_copyATSState
{
  result = self->_atsStateCache;
  if (result) {
    return (__CFDictionary *)CFRetain(result);
  }
  result = createDictionaryFromData((const __CFData *)objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "_atsContext"));
  if (result) {
    goto LABEL_9;
  }
  double v4 = -[NSURLSessionTask session](self, "session");
  if (v4)
  {
    uint64_t v5 = v4;
    atsState_ivar = v4->_atsState_ivar;
    if (atsState_ivar) {
      goto LABEL_14;
    }
    DictionaryFromData = createDictionaryFromData((const __CFData *)-[NSURLSessionConfiguration _atsContext]( v5->_local_immutable_configuration_ivar,  "_atsContext"));
    if (DictionaryFromData)
    {
      v5->_atsState_ivar = (NSDictionary *)DictionaryFromData;
      CFRelease(DictionaryFromData);
    }

    atsState_ivar = v5->_atsState_ivar;
    if (atsState_ivar)
    {
LABEL_14:
      result = (__CFDictionary *)CFRetain(atsState_ivar);
      if (result)
      {
LABEL_9:
        self->_atsStateCache = result;
        return (__CFDictionary *)CFRetain(result);
      }
    }
  }

  result = self->_atsStateCache;
  if (result) {
    return (__CFDictionary *)CFRetain(result);
  }
  return result;
}

- (NSData)_backtrace
{
  return self->_backtrace;
}

- (__CFSet)_getAuthenticatorStatusCodes
{
  return (__CFSet *)-[NSURLSessionTaskHTTPAuthenticator statusCodes]( -[NSURLSessionTask authenticator](self, "authenticator"),  "statusCodes");
}

- (NSURLSessionTaskHTTPAuthenticator)authenticator
{
  return (NSURLSessionTaskHTTPAuthenticator *)objc_getProperty(self, a2, 456LL, 1);
}

- (id)_httpConnectionInfoCompletionBlock
{
  return self->_httpConnectionInfoCompletionBlock;
}

- (NSDictionary)_proxySettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)set_resolvedCNAMEChain:(id)a3
{
  self->_resolvedCNAMEChain = (NSArray *)[a3 copy];
}

- (int64_t)_requestPriority
{
  return self->_requestPriority;
}

- (float)priority
{
  if (self) {
    return self->_priorityAPIStorage;
  }
  else {
    return 0.0;
  }
}

- (BOOL)prefersIncrementalDelivery
{
  if (self) {
    LOBYTE(self) = self->_prefersIncrementalDeliveryAPIStorage;
  }
  return (char)self;
}

- (unint64_t)_allowedProtocolTypes
{
  return self->_allowedProtocolTypes;
}

- (BOOL)_shouldUsePipelineHeuristics
{
  return self->_shouldUsePipelineHeuristics;
}

- (BOOL)_shouldSkipPipelineProbe
{
  return self->_shouldSkipPipelineProbe;
}

- (BOOL)_shouldPipelineHTTP
{
  return self->_shouldPipelineHTTP;
}

- (NSDictionary)_DuetActivityProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 488LL, 1);
}

- (NSString)_APSRelayTopic
{
  return self->_APSRelayTopic;
}

- (void)_takePreventIdleSleepAssertionIfAppropriate
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateSuspended
    && -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected]( self->_effectiveConfiguration,  "_preventsIdleSleepOnceConnected"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (!-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
    {
      uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      double v4 = -[NSURLSessionTask _uniqueIdentifier](self, "_uniqueIdentifier");
      if (!v4) {
        double v4 = (NSUUID *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
      }
      CFStringRef v5 = CFStringCreateWithFormat(v3, 0LL, @"NSURLSessionTask %@", v4);
      values = @"PreventUserIdleSystemSleep";
      *(void *)&__int128 keys = @"AssertType";
      *((void *)&keys + 1) = @"AssertLevel";
      int valuePtr = 255;
      CFTypeRef cf = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
      CFStringRef v16 = v5;
      __int16 v20 = @"AssertName";
      CFTypeID v21 = @"TimeoutSeconds";
      int v12 = 10800;
      CFNumberRef v6 = CFNumberCreate(v3, kCFNumberIntType, &v12);
      int v22 = @"TimeoutAction";
      CFTypeRef v17 = v6;
      double v18 = @"TimeoutActionTurnOff";
      uint64_t v7 = CFDictionaryCreate( v3,  (const void **)&keys,  (const void **)&values,  5LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      if (cf) {
        CFRelease(cf);
      }
      if (v17) {
        CFRelease(v17);
      }
      IOReturn v8 = IOPMAssertionCreateWithProperties(v7, &AssertionID);
      if (v7) {
        CFRelease(v7);
      }
      if (!v8)
      {
        -[NSURLSessionTask set_powerAssertion:](self, "set_powerAssertion:", AssertionID);
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        BOOL v9 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v10 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
          LODWORD(keys) = 138543362;
          *(void *)((char *)&keys + 4) = v10;
          _os_log_impl( &dword_18298D000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ TAKING power assertion.",  (uint8_t *)&keys,  0xCu);
        }
      }

      if (v5) {
        CFRelease(v5);
      }
    }

    -[NSURLSessionTask set_powerAssertionReleaseTime:](self, "set_powerAssertionReleaseTime:", -1LL);
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }

- (NSDictionary)_dependencyInfo
{
  v5[1] = *MEMORY[0x1895F89C0];
  result = self->_dependencyInfo_ivar;
  if (!result)
  {
    double v4 = @"TaskIdentifier";
    v5[0] = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
    result = (NSDictionary *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v5,  &v4,  1),  "copy");
    self->_dependencyInfo_ivar = result;
  }

  return result;
}

- (NSData)_TCPConnectionMetadata
{
  return (NSData *)objc_getProperty(self, a2, 496LL, 1);
}

- (void)_setConnectionIsCellular:(BOOL)a3
{
  self->_connectionIsCellular = a3;
}

- (void)set_connectionIsCompanionLink:(BOOL)a3
{
  self->_connectionIsCompanionLink = a3;
}

- (unint64_t)_expectedProgressTarget
{
  return self->_expectedProgressTargetValue;
}

- (void)_logUnlistedTracker:(id)a3
{
  if (a3)
  {
    Property = objc_getProperty(a3, a2, 88LL, 1);
    if (Property)
    {
      if (Property[20]
        && -[NSURLSessionTask _backtrace](self, "_backtrace")
        && !-[NSURLSessionConfiguration _skipsStackTraceCapture]( -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  "_skipsStackTraceCapture"))
      {
        -[NSString UTF8String]( -[NSURL host]( -[NSURLRequest URL](-[NSURLSessionTask originalRequest](self, "originalRequest"), "URL"),  "host"),  "UTF8String");
        -[NSData bytes](-[NSURLSessionTask _backtrace](self, "_backtrace"), "bytes");
        -[NSData length](-[NSURLSessionTask _backtrace](self, "_backtrace"), "length");
        ne_tracker_create_xcode_issue();
      }
    }
  }

- (BOOL)_assumesHTTP3Capable
{
  return self->_assumesHTTP3Capable;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return self->_requiresSecureHTTPSProxyConnection;
}

- (void)dealloc
{
  cfHSTS = self->_cfHSTS;
  if (cfHSTS) {
    CFRelease(cfHSTS);
  }
  cfCache = self->_cfCache;
  if (cfCache) {
    CFRelease(cfCache);
  }
  cfCreds = self->_cfCreds;
  if (cfCreds) {
    CFRelease(cfCreds);
  }
  cfCookies = self->_cfCookies;
  if (cfCookies) {
    CFRelease(cfCookies);
  }

  uploadProgress = self->_uploadProgress;
  if (uploadProgress)
  {
    -[NSURLSessionTask removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, @"countOfBytesSent");
    -[NSURLSessionTask removeObserver:forKeyPath:]( self,  "removeObserver:forKeyPath:",  self,  @"countOfBytesExpectedToSend");
    uploadProgress = self->_uploadProgress;
  }

  downloadProgress = self->_downloadProgress;
  if (downloadProgress)
  {
    -[NSURLSessionTask removeObserver:forKeyPath:]( self,  "removeObserver:forKeyPath:",  self,  @"countOfBytesReceived");
    -[NSURLSessionTask removeObserver:forKeyPath:]( self,  "removeObserver:forKeyPath:",  self,  @"countOfBytesExpectedToReceive");
    downloadProgress = self->_downloadProgress;
  }

  -[NSURLSessionTask set_extractor:](self, "set_extractor:", 0LL);
  -[NSURLSessionTask set_hasSZExtractor:](self, "set_hasSZExtractor:", 0LL);
  -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:](self, "set_doesSZExtractorConsumeExtractedData:", 0LL);

  -[NSURLSessionTask set_APSRelayTopic:](self, "set_APSRelayTopic:", 0LL);
  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0LL;
  if (atsStateCache) {
    CFRelease(atsStateCache);
  }
  -[NSURLSessionTask set_voucher:](self, "set_voucher:", 0LL);
  -[NSURLSessionTask set_httpConnectionInfoCompletionBlock:](self, "set_httpConnectionInfoCompletionBlock:", 0LL);

  -[NSURLSessionTask setEarliestBeginDate:](self, "setEarliestBeginDate:", 0LL);
  -[NSURLSessionTask set_nw_activity:](self, "set_nw_activity:", 0LL);
  -[NSURLSessionTask set_private_nw_activity:](self, "set_private_nw_activity:", 0LL);

  -[NSURLSessionTask set_cookieTransformCallback:](self, "set_cookieTransformCallback:", 0LL);
  -[NSURLSessionTask set_trackerContext:](self, "set_trackerContext:", 0LL);

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSURLSessionTask;
  -[NSURLSessionTask dealloc](&v10, sel_dealloc);
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
    {
      unsigned int v3 = -[NSURLSessionTask _powerAssertion](self, "_powerAssertion");
      -[NSURLSessionTask set_powerAssertion:](self, "set_powerAssertion:", 0LL);
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v3)
      {
        double v4 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
        dispatch_time_t v5 = dispatch_time(0LL, 3000000000LL);
        CFNumberRef v6 = -[NSURLSessionTask workQueue](self, "workQueue");
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke;
        block[3] = &unk_189C1A318;
        block[4] = v4;
        unsigned int v13 = v3;
        dispatch_after(v5, (dispatch_queue_t)v6, block);
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }

  if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
    {
      unsigned int v7 = -[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion");
      -[NSURLSessionTask set_darkWakePowerAssertion:](self, "set_darkWakePowerAssertion:", 0LL);
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v7)
      {
        dispatch_time_t v8 = dispatch_time(0LL, 3000000000LL);
        BOOL v9 = -[NSURLSessionTask workQueue](self, "workQueue");
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke_82;
        v10[3] = &__block_descriptor_36_e5_v8__0l;
        unsigned int v11 = v7;
        dispatch_after(v8, (dispatch_queue_t)v9, v10);
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }

- (unsigned)_powerAssertion
{
  return self->_powerAssertion;
}

- (unsigned)_darkWakePowerAssertion
{
  return self->_darkWakePowerAssertion;
}

- (void)set_extractor:(id)a3
{
  extractor = self->_extractor;
  if (a3)
  {
    if (extractor != a3)
    {
      id v6 = a3;

      self->_extractor = (STExtractor *)a3;
    }

    self->_hasSZExtractor = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      self->_doesSZExtractorConsumeExtractedData = [a3 doesConsumeExtractedData];
    }
    else {
      self->_doesSZExtractorConsumeExtractedData = 0;
    }
  }

  else
  {
    if (extractor)
    {

      self->_extractor = 0LL;
    }

    *(_WORD *)&self->_hasSZExtractor = 0;
  }

- (void)set_hasSZExtractor:(BOOL)a3
{
  self->_hasSZExtractor = a3;
}

- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3
{
  self->_doesSZExtractorConsumeExtractedData = a3;
}

- (void)set_APSRelayTopic:(id)a3
{
}

- (void)set_httpConnectionInfoCompletionBlock:(id)a3
{
}

- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate
{
}

- (void)set_nw_activity:(id)a3
{
}

- (void)set_cookieTransformCallback:(id)a3
{
}

- (void)_appendCountOfPendingBytesReceivedEncoded:(int64_t)a3
{
  p_unfair_lock = &self->_unfair_lock;
  os_unfair_lock_lock(&self->_unfair_lock);
  -[NSURLSessionTask set_countOfPendingBytesReceivedEncoded:]( self,  "set_countOfPendingBytesReceivedEncoded:",  -[NSURLSessionTask _countOfPendingBytesReceivedEncoded](self, "_countOfPendingBytesReceivedEncoded") + a3);
  os_unfair_lock_unlock(p_unfair_lock);
}

- (int64_t)_countOfPendingBytesReceivedEncoded
{
  return self->__countOfPendingBytesReceivedEncoded;
}

- (void)set_countOfPendingBytesReceivedEncoded:(int64_t)a3
{
  self->__countOfPendingBytesReceivedEncoded = a3;
}

- (void)setResponse:(id)a3
{
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (void)_consumePendingBytesReceivedEncoded
{
  p_unfair_lock = &self->_unfair_lock;
  os_unfair_lock_lock(&self->_unfair_lock);
  if (-[NSURLSessionTask _countOfPendingBytesReceivedEncoded](self, "_countOfPendingBytesReceivedEncoded"))
  {
    int64_t v4 = -[NSURLSessionTask _countOfPendingBytesReceivedEncoded](self, "_countOfPendingBytesReceivedEncoded");
    -[NSURLSessionTask set_countOfPendingBytesReceivedEncoded:](self, "set_countOfPendingBytesReceivedEncoded:", 0LL);
    os_unfair_lock_unlock(p_unfair_lock);
    if (v4) {
      -[NSURLSessionTask set_countOfBytesReceivedEncoded:]( self,  "set_countOfBytesReceivedEncoded:",  -[NSURLSessionTask _countOfBytesReceivedEncoded](self, "_countOfBytesReceivedEncoded") + v4);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_unfair_lock);
  }

- (int64_t)_countOfBytesReceivedEncoded
{
  return self->__countOfBytesReceivedEncoded;
}

- (void)set_countOfBytesReceivedEncoded:(int64_t)a3
{
  self->__countOfBytesReceivedEncoded = a3;
}

- (void)set_TCPConnectionMetadata:(id)a3
{
}

- (void)_releasePreventIdleSleepAssertionIfAppropriate
{
  if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _powerAssertion](self, "_powerAssertion"))
    {
      -[NSURLSessionTask set_powerAssertionReleaseTime:]( self,  "set_powerAssertionReleaseTime:",  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 3000000000u);
      objc_initWeak(&location, self);
      dispatch_time_t v3 = dispatch_time(0LL, 3000000000LL);
      int64_t v4 = -[NSURLSessionTask workQueue](self, "workQueue");
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke;
      block[3] = &unk_189C1A3C0;
      objc_copyWeak(&v10, &location);
      dispatch_after(v3, (dispatch_queue_t)v4, block);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }

  if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (-[NSURLSessionTask _darkWakePowerAssertion](self, "_darkWakePowerAssertion"))
    {
      -[NSURLSessionTask set_darkWakePowerAssertionReleaseTime:]( self,  "set_darkWakePowerAssertionReleaseTime:",  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 3000000000u);
      objc_initWeak(&location, self);
      dispatch_time_t v5 = dispatch_time(0LL, 3000000000LL);
      id v6 = -[NSURLSessionTask workQueue](self, "workQueue");
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke_81;
      v7[3] = &unk_189C1A3C0;
      objc_copyWeak(&v8, &location);
      dispatch_after(v5, (dispatch_queue_t)v6, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }

- (void)set_trailers:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setError:(id)a3
{
}

- (void)_finishProgressReporting
{
  if (!self->_progressReportingFinished)
  {
    self->_progressReportingFinished = 1;
    if (!-[NSURLSessionTask error](self, "error"))
    {
      -[NSURLSessionTask _completeUploadProgress](self, "_completeUploadProgress");
      -[NSProgress setCompletedUnitCount:]( self->_downloadProgress,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](self->_downloadProgress, "totalUnitCount"));
    }

    objc_sync_enter(self);
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", 0LL);
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", 0LL);
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", 0LL);
    objc_sync_exit(self);
  }

- (void)_completeUploadProgress
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 176LL, 1);
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)_resetTaskDelegate
{
  if (a1)
  {
    dispatch_time_t v3 = *(void **)(a1 + 696);
    if (v3) {
      objc_setProperty_atomic(v3, a2, 0LL, 32LL);
    }
    int64_t v4 = *(void **)(a1 + 704);
    if (v4) {
      objc_setProperty_atomic(v4, a2, 0LL, 32LL);
    }
  }

- (void)set_proxyHandshakePending:(BOOL)a3
{
  self->_proxyHandshakePending = a3;
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 160LL, 1);
}

- (id)_timingData
{
  Property = -[NSURLSessionTask _metrics](self, "_metrics");
  if (Property) {
    Property = (__CFN_TaskMetrics *)objc_getProperty(Property, v3, 96LL, 1);
  }
  return -[__CFN_TransactionMetrics legacyStaticMetrics]((uint64_t)Property);
}

- (id)_incompleteTaskMetrics
{
  return  -[NSURLSessionTaskMetrics initWithMetrics:]( (id *)objc_alloc(&OBJC_CLASS___NSURLSessionTaskMetrics),  -[NSURLSessionTask _metrics](self, "_metrics"));
}

@end