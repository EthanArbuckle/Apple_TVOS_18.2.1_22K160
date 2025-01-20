@interface FudPersonalizer
- (BOOL)personalizeWithServer:(id)a3;
- (FudPersonalizer)initWithDelegate:(id)a3;
- (FudPersonalizerDelegate)delegate;
- (__CFDictionary)createPersonalizationManifestCFDict:(id)a3;
- (__CFDictionary)createPersonalizationObjectCFDict:(id)a3;
- (void)dealloc;
- (void)doPersonalization:(id)a3;
- (void)freePersonalizationData;
- (void)overrideSecurityDomain:(BOOL)a3;
- (void)overrideServerURL:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FudPersonalizer

- (FudPersonalizer)initWithDelegate:(id)a3
{
  if (!a3)
  {
    v9 = @"%s(): delegate=nil\n";
LABEL_9:
    FudLog(3LL, v9);
    return self;
  }

  v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fud.personalizer", v5);
  self->_personalizationQueue = v6;
  if (!v6)
  {
    v9 = @"%s(): Queue create error\n";
    goto LABEL_9;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FudPersonalizer;
  v7 = -[FudPersonalizer init](&v10, "init");
  self = v7;
  if (!v7)
  {
    v9 = @"%s(): super init error\n";
    goto LABEL_9;
  }

  v7->_delegate = (FudPersonalizerDelegate *)a3;
  *(_OWORD *)&v7->_manifestDict = 0u;
  *(_OWORD *)&v7->_serverRequestDict = 0u;
  *(_OWORD *)&v7->_responseData = 0u;
  *(_OWORD *)&v7->_amai = 0u;
  v7->_overrideSecurityDomain = 0;
  return self;
}

- (void)freePersonalizationData
{
  manifestDict = self->_manifestDict;
  if (manifestDict)
  {
    CFRelease(manifestDict);
    self->_manifestDict = 0LL;
  }

  objectsDict = self->_objectsDict;
  if (objectsDict)
  {
    CFRelease(objectsDict);
    self->_objectsDict = 0LL;
  }

  serverRequestDict = self->_serverRequestDict;
  if (serverRequestDict)
  {
    CFRelease(serverRequestDict);
    self->_serverRequestDict = 0LL;
  }

  serverResponseDict = self->_serverResponseDict;
  if (serverResponseDict)
  {
    CFRelease(serverResponseDict);
    self->_serverResponseDict = 0LL;
  }

  responseData = self->_responseData;
  if (responseData)
  {
    CFRelease(responseData);
    self->_responseData = 0LL;
  }

  amai = self->_amai;
  if (amai)
  {
    CFRelease(amai);
    self->_amai = 0LL;
  }

  ticketName = self->_ticketName;
  if (ticketName)
  {
    CFRelease(ticketName);
    self->_ticketName = 0LL;
  }

- (void)dealloc
{
  personalizationQueue = (dispatch_object_s *)self->_personalizationQueue;
  if (personalizationQueue) {
    dispatch_release(personalizationQueue);
  }
  -[FudPersonalizer freePersonalizationData](self, "freePersonalizationData");
  serverURL = self->_serverURL;
  if (serverURL)
  {
    CFRelease(serverURL);
    self->_serverURL = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FudPersonalizer;
  -[FudPersonalizer dealloc](&v5, "dealloc");
}

- (void)overrideServerURL:(id)a3
{
  serverURL = self->_serverURL;
  if (serverURL)
  {
    CFRelease(serverURL);
    self->_serverURL = 0LL;
  }

  if (a3) {
    v6 = (__CFString *)CFRetain(a3);
  }
  else {
    v6 = 0LL;
  }
  self->_serverURL = v6;
}

- (void)overrideSecurityDomain:(BOOL)a3
{
  self->_overrideSecurityDomain = a3;
}

- (void)doPersonalization:(id)a3
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = sub_100002BB8;
  v16 = sub_100002BC8;
  if (!self->_delegate)
  {
    v7 = @"Personalization delegate=nil";
LABEL_13:
    uint64_t v8 = 1LL;
    goto LABEL_19;
  }

  if (!self->_personalizationQueue)
  {
    v7 = @"Personalization queue=nil";
    goto LABEL_13;
  }

  if (a3)
  {
    if ([a3 responseFormat] > 2)
    {
      v7 = @"Invalid response format";
    }

    else if ([a3 responseFormat] && !objc_msgSend(a3, "payload"))
    {
      v7 = @"Response format requires payload";
    }

    else
    {
      if ([a3 responseFormat] == 1 || !objc_msgSend(a3, "responseAlignment"))
      {
        -[FudPersonalizer freePersonalizationData](self, "freePersonalizationData");
        id v5 = a3;
        v13[5] = (uint64_t)v5;
        personalizationQueue = (dispatch_queue_s *)self->_personalizationQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100002BD4;
        block[3] = &unk_10002D3D0;
        block[5] = a3;
        block[6] = &v12;
        block[4] = self;
        dispatch_async(personalizationQueue, block);
        goto LABEL_10;
      }

      v7 = @"Response format doesn't support alignment";
    }
  }

  else
  {
    v7 = @"Personalization request=nil";
  }

  uint64_t v8 = 2LL;
LABEL_19:
  uint64_t v9 = FUDError(v8, v7);
  FudLog(3LL, @"%s(): %@");
  delegate = self->_delegate;
  if (delegate) {
    -[FudPersonalizerDelegate personalizationDone:response:error:]( delegate,  "personalizationDone:response:error:",  a3,  0LL,  v9,  "-[FudPersonalizer doPersonalization:]",  v7);
  }
LABEL_10:
  _Block_object_dispose(&v12, 8);
}

- (__CFDictionary)createPersonalizationObjectCFDict:(id)a3
{
  if (![a3 objectTag])
  {
    uint64_t v9 = @"%s(): objectTag=nil\n";
LABEL_27:
    FudLog(3LL, v9);
    return 0LL;
  }

  if (![a3 digest])
  {
    uint64_t v9 = @"%s(): digest=nil\n";
    goto LABEL_27;
  }

  if (([a3 isEffectiveProductionModeSet] & 1) == 0)
  {
    uint64_t v9 = @"%s(): epro not set\n";
    goto LABEL_27;
  }

  if (([a3 isEffectiveSecurityModeSet] & 1) == 0)
  {
    objc_super v10 = "-[FudPersonalizer createPersonalizationObjectCFDict:]";
    FudLog(4LL, @"%s(): esec not set.\n");
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if ([a3 isEffectiveSecurityModeSet])
    {
      else {
        id v5 = (const void **)&kCFBooleanFalse;
      }
      CFDictionarySetValue(Mutable, @"ESEC", *v5);
    }

    if (objc_msgSend(a3, "isEffectiveProductionModeSet", v10))
    {
      else {
        v6 = (const void **)&kCFBooleanFalse;
      }
      CFDictionarySetValue(Mutable, @"EPRO", *v6);
    }

    if ([a3 isTrustedSet])
    {
      else {
        v7 = (const void **)&kCFBooleanFalse;
      }
      CFDictionarySetValue(Mutable, @"Trusted", *v7);
    }

    CFDictionarySetValue(Mutable, @"Digest", [a3 digest]);
  }

  else
  {
    FudLog(3LL, @"%s(): error creating cfdict\n");
  }

  return Mutable;
}

- (__CFDictionary)createPersonalizationManifestCFDict:(id)a3
{
  if (![a3 requestName])
  {
    v26 = @"%s(): name=nil\n";
LABEL_55:
    FudLog(3LL, v26);
    return 0LL;
  }

  if (![a3 chipID])
  {
    v26 = @"%s(): chipID=0\n";
    goto LABEL_55;
  }

  if (![a3 ecID] && !objc_msgSend(a3, "extEcID") && !objc_msgSend(a3, "globalSigning"))
  {
    v26 = @"%s(): ecID/globalSigning invalid\n";
    goto LABEL_55;
  }

  if (![a3 isProductionModeSet])
  {
    v26 = @"%s(): cpro not set\n";
    goto LABEL_55;
  }

  if (![a3 nonceHash])
  {
    v26 = @"%s(): nonceHash=nil\n";
    goto LABEL_55;
  }

  if (![a3 objectList])
  {
    v26 = @"%s(): objectList=nil\n";
    goto LABEL_55;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v26 = @"%s(): error creating cfdict\n";
    goto LABEL_55;
  }

  v6 = Mutable;
  if ([a3 requestPrefix])
  {
    v7 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
    uint64_t v8 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryBuildKeySetTag( v8,  @"ApBoardID",  (const __CFString *)[a3 requestPrefix],  @"BoardID");
    CFDictionaryBuildKeySetTag( v8,  @"ApChipID",  (const __CFString *)[a3 requestPrefix],  @"ChipID");
    CFDictionaryBuildKeySetTag( v8,  @"ApECID",  (const __CFString *)[a3 requestPrefix],  @"ECID");
    CFDictionaryBuildKeySetTag( v8,  @"ApSecurityDomain",  (const __CFString *)[a3 requestPrefix],  @"SecurityDomain");
    CFDictionaryBuildKeySetTag( v8,  @"ApProductionMode",  (const __CFString *)[a3 requestPrefix],  @"ProductionMode");
    CFDictionaryBuildKeySetTag( v8,  @"ApManifestEpoch",  (const __CFString *)[a3 requestPrefix],  @"ManifestEpoch");
    if ([a3 isSecurityModeSet]) {
      CFDictionaryBuildKeySetTag( v8,  @"ApSecurityMode",  (const __CFString *)[a3 requestPrefix],  @"SecurityMode");
    }
    CFDictionaryBuildKeySetTag( v8,  @"ApNonce",  (const __CFString *)[a3 requestPrefix],  @"Nonce");
    uint64_t v9 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
    CFStringAppendFormat(v9, 0LL, @"@%@", @"ApImg4Ticket");
    CFDictionaryBuildKeySetTicket(v8, v9, (const __CFString *)[a3 requestPrefix], @"Ticket");
    CFRelease(v9);
    CFStringAppendFormat(v7, 0, @"%@,%@", [a3 requestPrefix], @"Ticket");
    self->_ticketName = v7;
    FudLog(7LL, @"%s(): overriding personalization request=%@\n");
    CFDictionarySetValue(v6, @"APTagOverrides", v8);
    CFRelease(v8);
  }

  else
  {
    self->_ticketName = (__CFString *)CFStringCreateCopy(kCFAllocatorDefault, @"ApImg4Ticket");
  }

  objc_super v10 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(v10, 0LL, @"@%@", @"ApImg4Ticket");
  CFDictionarySetValue(v6, v10, kCFBooleanTrue);
  CFRelease(v10);
  CFDictionaryBuildKeySetInt32(v6, @"ApBoardID", (int)[a3 boardID]);
  CFDictionaryBuildKeySetInt32(v6, @"ApChipID", (int)[a3 chipID]);
  if ([a3 globalSigning])
  {
    v11 = @"UseGlobalSigning";
    uint64_t v12 = v6;
    CFBooleanRef v13 = kCFBooleanTrue;
  }

  else
  {
    if (![a3 extEcID])
    {
      CFDictionaryBuildKeySetInt64(v6, @"ApECID", (uint64_t)[a3 ecID]);
      goto LABEL_20;
    }

    CFBooleanRef v13 = (CFBooleanRef)[a3 extEcID];
    v11 = @"ApECID";
    uint64_t v12 = v6;
  }

  CFDictionarySetValue(v12, v11, v13);
LABEL_20:
  if (self->_overrideSecurityDomain) {
    int v14 = 1;
  }
  else {
    int v14 = [a3 securityDomain];
  }
  CFDictionaryBuildKeySetInt32(v6, @"ApSecurityDomain", v14);
  else {
    CFBooleanRef v15 = kCFBooleanFalse;
  }
  CFDictionarySetValue(v6, @"ApProductionMode", v15);
  if ([a3 isSecurityModeSet])
  {
    else {
      CFBooleanRef v16 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v6, @"ApSecurityMode", v16);
  }

  CFDictionarySetValue(v6, @"ApNonce", [a3 nonceHash]);
  if ([a3 enableMixMatch])
  {
    else {
      CFBooleanRef v17 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v6, @"ApAllowMixAndMatch", v17);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v18 = [a3 objectList];
  id v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        v24 = -[FudPersonalizer createPersonalizationObjectCFDict:](self, "createPersonalizationObjectCFDict:", v23);
        if (v24) {
          CFDictionarySetValue(v6, [v23 objectTag], v24);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v20);
  }

  return v6;
}

- (BOOL)personalizeWithServer:(id)a3
{
  id v5 = -[FudPersonalizer createPersonalizationManifestCFDict:](self, "createPersonalizationManifestCFDict:");
  self->_manifestDict = v5;
  if (!v5)
  {
    uint64_t v33 = 2LL;
    v34 = @"Failed to build manifest dictionary";
    goto LABEL_36;
  }

  v42 = v5;
  FudLog(7LL, @"%s(): manifestDictionary=%@");
  if (!self->_amai)
  {
    v6 = (__AMAuthInstall *)AMAuthInstallCreate(kCFAllocatorDefault);
    self->_amai = v6;
    if (!v6)
    {
      uint64_t v33 = 1LL;
      v34 = @"Failed to create Signing Request";
      goto LABEL_36;
    }

    if (objc_msgSend(a3, "useSSOCredentials", "-[FudPersonalizer personalizeWithServer:]", v42))
    {
      if (AMAuthInstallSsoInitialize(0LL))
      {
        FudLog(7LL, @"%s(): SSO not installed. Continuing.\n");
      }

      else
      {
        if (AMAuthInstallSsoEnable(self->_amai))
        {
          uint64_t v33 = 1LL;
          v34 = @"Failed to enable SSO";
          goto LABEL_36;
        }

        amai = self->_amai;
        if (self->_serverURL) {
          serverURL = self->_serverURL;
        }
        else {
          serverURL = @"https://gs.apple.com:443/";
        }
        CFURLRef v12 = CFURLCreateWithString(kCFAllocatorDefault, serverURL, 0LL);
        if (AMAuthInstallSetSigningServerURL(amai, v12))
        {
          uint64_t v33 = 1LL;
          v34 = @"Failed to set Signing Server URL";
          goto LABEL_36;
        }
      }
    }

    else
    {
      v7 = self->_serverURL;
      if (v7)
      {
        uint64_t v8 = self->_amai;
        CFURLRef v9 = CFURLCreateWithString(kCFAllocatorDefault, v7, 0LL);
        AMAuthInstallSetSigningServerURL(v8, v9);
      }
    }

    AMAuthInstallLogSetHandler(sub_10000395C);
  }

  CFBooleanRef v13 = self->_serverURL;
  if (v13)
  {
    CFStringGetCStringPtr(v13, 0x8000100u);
    FudLog(7LL, @"%s(): Overriding signing server URL=%s\n");
  }

  if (AMAuthInstallApSetParameters(self->_amai, self->_manifestDict))
  {
    uint64_t v33 = 1LL;
    v34 = @"Failed to add manifest properties to Signing Request";
    goto LABEL_36;
  }

  CFIndex Count = CFDictionaryGetCount(self->_manifestDict);
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, Count, self->_manifestDict);
  self->_serverRequestDict = MutableCopy;
  CFDictionaryRemoveValue(MutableCopy, @"APTagOverrides");
  p_serverResponseDict = &self->_serverResponseDict;
  uint64_t PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse( self->_amai,  self->_serverRequestDict,  &self->_serverResponseDict);
  int v18 = PersonalizedResponse;
  uint64_t v43 = PersonalizedResponse;
  FudLog(6LL, @"%s(): AMAuthInstallApCreatePersonalizedResponse status = %d\n");
  if (v18 == 3194
    && (objc_msgSend(a3, "useSSOCredentials", "-[FudPersonalizer personalizeWithServer:]", v43) & 1) == 0)
  {
    [a3 setUseSSOCredentials:1];
    return 0;
  }

  if (!*p_serverResponseDict)
  {
    uint64_t v33 = 3LL;
    v34 = @"Failed to generate signed manifest";
    goto LABEL_36;
  }

  Value = (const __CFData *)CFDictionaryGetValue(*p_serverResponseDict, self->_ticketName);
  if (!Value)
  {
    uint64_t v33 = 3LL;
    v34 = @"Failed to retrieve signed manifest";
    goto LABEL_36;
  }

  id v20 = Value;
  unsigned int v21 = [a3 responseFormat];
  if (v21)
  {
    if (v21 == 2)
    {
      id v46 = [a3 responseFormat];
      FudLog(7LL, @"%s(): Returning stitched img4 format specified by plugin=%d\n");
      CFAllocatorRef v36 = CFGetAllocator(self->_amai);
      StitchTicket = (__CFData *)AMAuthInstallApImg4CreateStitchTicket( v36,  objc_msgSend(a3, "payload", "-[FudPersonalizer personalizeWithServer:]", v46),  v20);
      self->_responseData = StitchTicket;
      if (!StitchTicket)
      {
        uint64_t v33 = 4LL;
        v34 = @"Failed to stitch img4 response";
        goto LABEL_36;
      }
    }

    else
    {
      if (v21 != 1)
      {
        uint64_t v33 = 2LL;
        v34 = @"Invalid response format";
        goto LABEL_36;
      }

      v22 = (const __CFData *)[a3 payload];
      CFIndex Length = CFDataGetLength(v22);
      CFIndex v24 = CFDataGetLength(v20);
      v25 = CFDataCreateMutableCopy(kCFAllocatorDefault, 0LL, v22);
      id v44 = [a3 responseFormat];
      FudLog(7LL, @"%s(): Returning stitched ftab format specified by plugin=%d\n");
      BytePtr = CFDataGetBytePtr(v20);
      CFDataAppendBytes(v25, BytePtr, v24);
      MutableBytePtr = CFDataGetMutableBytePtr(v25);
      *((_DWORD *)MutableBytePtr + 4) = Length;
      *((_DWORD *)MutableBytePtr + 5) = v24;
      if ([a3 responseAlignment])
      {
        unsigned int v28 = [a3 responseAlignment];
        unsigned int v29 = [a3 responseAlignment];
        CFDataIncreaseLength( v25,  (int)(v28 + (v24 + Length) / v29 * v29 - (v24 + Length)) % (int)[a3 responseAlignment]);
      }

      __int128 v30 = CFDataGetBytePtr(v25);
      CFIndex v31 = CFDataGetLength(v25);
      StitchTicket = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v30, v31, kCFAllocatorDefault);
      self->_responseData = StitchTicket;
      if (!StitchTicket)
      {
        uint64_t v33 = 4LL;
        v34 = @"Failed to stitch ftab response";
LABEL_36:
        uint64_t v40 = FUDError(v33, v34);
        v41 = "-[FudPersonalizer personalizeWithServer:]";
        v45 = v34;
        FudLog(3LL, @"%s(): %@");
        delegate = self->_delegate;
        id v38 = a3;
        StitchTicket = 0LL;
        uint64_t v39 = v40;
        goto LABEL_37;
      }
    }
  }

  else
  {
    v41 = "-[FudPersonalizer personalizeWithServer:]";
    v45 = (const __CFString *)[a3 responseFormat];
    FudLog(7LL, @"%s(): Returning manifest only format specified by plugin=%d\n");
    StitchTicket = (__CFData *)CFRetain(v20);
    self->_responseData = StitchTicket;
  }

  delegate = self->_delegate;
  id v38 = a3;
  uint64_t v39 = 0LL;
LABEL_37:
  -[FudPersonalizerDelegate personalizationDone:response:error:]( delegate,  "personalizationDone:response:error:",  v38,  StitchTicket,  v39,  v41,  v45);
  return 1;
}

- (FudPersonalizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FudPersonalizerDelegate *)a3;
}

@end