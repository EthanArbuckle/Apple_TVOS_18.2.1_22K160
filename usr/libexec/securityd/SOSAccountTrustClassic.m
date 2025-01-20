@interface SOSAccountTrustClassic
+ (id)trustClassic;
- (BOOL)activeValidInCircle:(id)a3 err:(__CFError *)a4;
- (BOOL)addEscrowToPeerInfo:(__OpaqueSOSFullPeerInfo *)a3 err:(__CFError *)a4;
- (BOOL)addiCloudIdentity:(__OpaqueSOSCircle *)a3 key:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)checkForRings:(__CFError *)a3;
- (BOOL)checkForSponsorshipTrust:(__OpaqueSOSCircle *)a3;
- (BOOL)cleanupAfterPeer:(id)a3 circleTransport:(id)a4 seconds:(unint64_t)a5 circle:(__OpaqueSOSCircle *)a6 cleanupPeer:(__OpaqueSOSPeerInfo *)a7 err:(__CFError *)a8;
- (BOOL)cleanupRetirementTickets:(id)a3 circle:(__OpaqueSOSCircle *)a4 time:(unint64_t)a5 err:(__CFError *)a6;
- (BOOL)clearValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4;
- (BOOL)clientPing:(id)a3;
- (BOOL)ensureExpansion:(__CFError *)a3;
- (BOOL)ensureFullPeerAvailable:(id)a3 err:(__CFError *)a4;
- (BOOL)fixICloudIdentities:(id)a3 circle:(__OpaqueSOSCircle *)a4;
- (BOOL)forEachRing:(id)a3;
- (BOOL)fullPeerInfoVerify:(__SecKey *)a3 err:(__CFError *)a4;
- (BOOL)ghostBustingOK:(__OpaqueSOSCircle *)a3 updatingTo:(__OpaqueSOSCircle *)a4;
- (BOOL)handleUpdateCircle:(__OpaqueSOSCircle *)a3 transport:(id)a4 update:(BOOL)a5 err:(__CFError *)a6;
- (BOOL)handleUpdateRing:(id)a3 prospectiveRing:(__OpaqueSOSRing *)a4 transport:(id)a5 userPublicKey:(__SecKey *)a6 writeUpdate:(BOOL)a7 err:(__CFError *)a8;
- (BOOL)hasCircle:(__CFError *)a3;
- (BOOL)hasFullPeerInfo:(__CFError *)a3;
- (BOOL)hasLeft;
- (BOOL)haveConfirmedOctagonKeys;
- (BOOL)isAccountIdentity:(__OpaqueSOSPeerInfo *)a3 err:(__CFError *)a4;
- (BOOL)isInCircleOnly:(__CFError *)a3;
- (BOOL)isLockedError:(id)a3;
- (BOOL)isMyPeerActive:(__CFError *)a3;
- (BOOL)isSyncingV0;
- (BOOL)joinCircle:(id)a3 userKey:(__SecKey *)a4 useCloudPeer:(BOOL)a5 err:(__CFError *)a6;
- (BOOL)leaveCircle:(id)a3 err:(__CFError *)a4;
- (BOOL)leaveCircleWithAccount:(id)a3 err:(__CFError *)a4;
- (BOOL)matchOTUserViewSettings:(id)a3 userViewsEnabled:(BOOL)a4 err:(__CFError *)a5;
- (BOOL)modifyCircle:(id)a3 err:(__CFError *)a4 action:(id)a5;
- (BOOL)peerSignatureUpdate:(__SecKey *)a3 err:(__CFError *)a4;
- (BOOL)postDebugScope:(id)a3 scope:(void *)a4 err:(__CFError *)a5;
- (BOOL)removeIncompleteiCloudIdentities:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)requestSyncWithAllPeers:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)resetAccountToEmpty:(id)a3 transport:(id)a4 err:(__CFError *)a5;
- (BOOL)resetAllRings:(id)a3 err:(__CFError *)a4;
- (BOOL)resetCircleToOffering:(id)a3 userKey:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)resetRing:(id)a3 ringName:(__CFString *)a4 err:(__CFError *)a5;
- (BOOL)resetToOffering:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5;
- (BOOL)setRing:(__OpaqueSOSRing *)a3 ringName:(__CFString *)a4 err:(__CFError *)a5;
- (BOOL)setValueInExpansion:(__CFString *)a3 value:(void *)a4 err:(__CFError *)a5;
- (BOOL)updateCircle:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5;
- (BOOL)updateCircleFromRemote:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5;
- (BOOL)updateFullPeerInfo:(id)a3 minimum:(__CFSet *)a4 excluded:(__CFSet *)a5;
- (BOOL)updateGestalt:(id)a3 newGestalt:(__CFDictionary *)a4;
- (BOOL)updatePeerInfo:(id)a3 description:(__CFString *)a4 err:(__CFError *)a5 update:(id)a6;
- (BOOL)updateV2Dictionary:(id)a3 v2:(__CFDictionary *)a4;
- (BOOL)updateViewSets:(id)a3 enabled:(__CFSet *)MutableCopy disabled:(__CFSet *)a5;
- (BOOL)upgradeiCloudIdentity:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4;
- (BOOL)valueSetContainsValue:(__CFString *)a3 value:(void *)a4;
- (SOSAccountTrustClassic)init;
- (SOSAccountTrustClassic)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7;
- (__CFArray)copyPeersToListenTo:(__SecKey *)a3 err:(__CFError *)a4;
- (__CFArray)copySortedPeerArray:(__CFError *)a3 action:(id)a4;
- (__CFDictionary)getRings:(__CFError *)a3;
- (__CFSet)copyPeerSetForView:(__CFString *)a3;
- (__CFSet)copyPeerSetMatching:(id)a3;
- (__CFSet)copyPreApprovedHSA2Info;
- (__CFSet)syncWithPeers:(id)a3 peerIDs:(__CFSet *)a4 err:(__CFError *)a5;
- (__OpaqueSOSCircle)ensureCircle:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5;
- (__OpaqueSOSCircle)getCircle:(__CFError *)a3;
- (__OpaqueSOSEngine)getDataSourceEngine:(SOSDataSourceFactory *)a3;
- (__OpaqueSOSFullPeerInfo)CopyAccountIdentityPeerInfo;
- (__OpaqueSOSFullPeerInfo)getMyFullPeerInfo;
- (__OpaqueSOSPeerInfo)copyPeerWithID:(__CFString *)a3 err:(__CFError *)a4;
- (__OpaqueSOSRing)copyRing:(__CFString *)a3 err:(__CFError *)a4;
- (__SecKey)copyDeviceKey:(__CFError *)a3;
- (__SecKey)copyPublicKeyForPeer:(__CFString *)a3 err:(__CFError *)a4;
- (__SecKey)randomPermanentFullECKey:(int)a3 name:(id)a4 error:(__CFError *)a5;
- (char)encodeToDER:(id)a3 err:(id *)a4 start:(const char *)a5 end:(char *)a6;
- (id)iCloudCheckEventHandle:(id)a3;
- (id)iCloudCleanerHandle:(id)a3;
- (int)getCircleStatusOnly:(__CFError *)a3;
- (int)thisDeviceStatusInCircle:(__OpaqueSOSCircle *)a3 peer:(__OpaqueSOSPeerInfo *)a4;
- (int)updateView:(id)a3 name:(__CFString *)a4 code:(int)a5 err:(__CFError *)a6;
- (int)viewStatus:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5;
- (unint64_t)getDEREncodedSize:(id)a3 err:(id *)a4;
- (void)addRingDictionary;
- (void)addSyncablePeerBlock:(id)a3 dsName:(__CFString *)a4 change:(id)a5;
- (void)ensureOctagonPeerKeys:(id)a3;
- (void)forEachCirclePeerExceptMe:(id)a3;
- (void)generationSignatureUpdateWith:(id)a3 key:(__SecKey *)a4;
- (void)getValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4;
- (void)pendEnableViewSet:(__CFSet *)a3;
- (void)purgeIdentity;
- (void)removeInvalidApplications:(__OpaqueSOSCircle *)a3 userPublic:(__SecKey *)a4;
- (void)resetRingDictionary;
- (void)setRings:(__CFDictionary *)a3;
- (void)valueSubtractFrom:(__CFString *)a3 valuesToSubtract:(__CFSet *)a4;
- (void)valueUnionWith:(__CFString *)a3 valuesToUnion:(__CFSet *)a4;
@end

@implementation SOSAccountTrustClassic

- (BOOL)cleanupRetirementTickets:(id)a3 circle:(__OpaqueSOSCircle *)a4 time:(unint64_t)a5 err:(__CFError *)a6
{
  id v10 = a3;
  MutableForSOSPeerInfosByID = (const __CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  v12 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust retirees](self, "retirees"));
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472LL;
  context[2] = sub_10019B6B0;
  context[3] = &unk_100291E40;
  context[4] = a5;
  context[5] = a4;
  context[6] = MutableForSOSPeerInfosByID;
  CFSetApplyFunction(v12, (CFSetApplierFunction)sub_10019B718, context);

  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10019B72C;
  v26[3] = &unk_100292230;
  v26[4] = self;
  v26[5] = Mutable;
  CFSetApplyFunction(MutableForSOSPeerInfosByID, (CFSetApplierFunction)sub_10019B718, v26);
  if (MutableForSOSPeerInfosByID) {
    CFRelease(MutableForSOSPeerInfosByID);
  }
  uint64_t Name = SOSCircleGetName(a4);
  CFDictionaryRef v22 = sub_100107FA8(kCFAllocatorDefault, v15, v16, v17, v18, v19, v20, v21, Name, (uint64_t)Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "circle_transport"));
  unsigned __int8 v24 = [v23 expireRetirementRecords:v22 err:a6];

  if (v22) {
    CFRelease(v22);
  }

  return v24;
}

- (BOOL)cleanupAfterPeer:(id)a3 circleTransport:(id)a4 seconds:(unint64_t)a5 circle:(__OpaqueSOSCircle *)a6 cleanupPeer:(__OpaqueSOSPeerInfo *)a7 err:(__CFError *)a8
{
  id v14 = a3;
  id v15 = a4;
  int v16 = -[SOSAccountTrust peerInfo](self, "peerInfo");
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo") || !v16)
  {
    SOSErrorCreate(1032LL, a8, 0LL, @"I have no peer");
    goto LABEL_27;
  }

  if (!SOSCircleHasActivePeer(a6, -[SOSAccountTrust peerInfo](self, "peerInfo"), a8))
  {
LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }

  PeerID = (const void *)SOSPeerInfoGetPeerID(a7);
  uint64_t Name = (const void *)SOSCircleGetName(a6);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  Value = (__CFArray *)CFDictionaryGetValue(Mutable, Name);
  if (!Value || (CFMutableArrayRef v21 = Value, v22 = CFGetTypeID(Value), v22 != CFArrayGetTypeID()))
  {
    CFMutableArrayRef v21 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFDictionarySetValue(Mutable, Name, v21);
    if (v21) {
      CFRelease(v21);
    }
  }

  CFArrayAppendValue(v21, PeerID);
  CFTypeRef cf = 0LL;
  unsigned int v23 = [v14 SOSTransportMessageCleanupAfterPeerMessages:v14 peers:Mutable err:&cf];
  if ((v23 & 1) == 0)
  {
    unsigned __int8 v24 = sub_10001267C("account");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = PeerID;
      __int16 v35 = 2112;
      CFTypeRef v36 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to cleanup after peer %@ messages: %@",  buf,  0x16u);
    }
  }

  CFTypeRef v26 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v26);
  }

  if (([v15 expireRetirementRecords:Mutable err:&cf] & 1) == 0)
  {
    v28 = sub_10001267C("account");
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = PeerID;
      __int16 v35 = 2112;
      CFTypeRef v36 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Failed to cleanup after peer %@ retirement: %@",  buf,  0x16u);
    }

LABEL_20:
    BOOL v27 = 0;
    goto LABEL_21;
  }

  BOOL v27 = 1;
LABEL_21:
  CFTypeRef v30 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v30);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
LABEL_25:

  return v27;
}

- (void)getValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion", a3, a4));

  if (!v6) {
    return 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  id v8 = [v7 objectForKey:a3];

  return v8;
}

- (BOOL)ensureExpansion:(__CFError *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[SOSAccountTrust setExpansion:](self, "setExpansion:", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  BOOL v8 = sub_1000195D0((uint64_t)v7, (CFTypeRef *)a3, @"Can't Alloc Account Expansion dictionary");

  return v8;
}

- (BOOL)clearValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4
{
  BOOL v6 = -[SOSAccountTrustClassic ensureExpansion:](self, "ensureExpansion:", a4);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
    [v7 removeObjectForKey:a3];
  }

  return v6;
}

- (BOOL)setValueInExpansion:(__CFString *)a3 value:(void *)a4 err:(__CFError *)a5
{
  if (a4)
  {
    BOOL v8 = -[SOSAccountTrustClassic ensureExpansion:](self, "ensureExpansion:", a5);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
      [v9 setObject:a4 forKey:a3];

      LOBYTE(v8) = 1;
    }
  }

  else
  {
    LOBYTE(v8) = -[SOSAccountTrustClassic clearValueFromExpansion:err:](self, "clearValueFromExpansion:err:", a3, a5);
  }

  return v8;
}

- (BOOL)valueSetContainsValue:(__CFString *)a3 value:(void *)a4
{
  v5 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", a3, 0LL);
  if (v5)
  {
    BOOL v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    LOBYTE(v5) = v7 == CFSetGetTypeID() && CFSetContainsValue(v6, a4) != 0;
  }

  return (char)v5;
}

- (void)valueUnionWith:(__CFString *)a3 valuesToUnion:(__CFSet *)a4
{
  CFMutableSetRef MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0LL, a4);
  CFTypeID v7 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", a3, 0LL);
  if (v7)
  {
    BOOL v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFSetGetTypeID())
    {
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472LL;
      context[2] = sub_1001A5500;
      context[3] = &unk_100293EA8;
      context[4] = MutableCopy;
      CFSetApplyFunction(v8, (CFSetApplierFunction)sub_1001A52D8, context);
    }
  }

  -[SOSAccountTrustClassic setValueInExpansion:value:err:](self, "setValueInExpansion:value:err:", a3, MutableCopy, 0LL);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

- (void)valueSubtractFrom:(__CFString *)a3 valuesToSubtract:(__CFSet *)a4
{
  CFTypeID v7 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", a3, 0LL);
  if (v7)
  {
    BOOL v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFSetGetTypeID())
    {
      CFMutableSetRef MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0LL, v8);
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472LL;
      context[2] = sub_1001A54F8;
      context[3] = &unk_100293EA8;
      context[4] = MutableCopy;
      CFSetApplyFunction(a4, (CFSetApplierFunction)sub_1001A52D8, context);
      -[SOSAccountTrustClassic setValueInExpansion:value:err:]( self,  "setValueInExpansion:value:err:",  a3,  MutableCopy,  0LL);
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
    }
  }

- (void)pendEnableViewSet:(__CFSet *)a3
{
  if (CFSetGetValue(a3, kSOSViewKeychainV0))
  {
    v5 = sub_10001267C("viewChange");
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFTypeID v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Warning, attempting to Add KeychainV0",  v7,  2u);
    }
  }

  -[SOSAccountTrustClassic valueUnionWith:valuesToUnion:]( self,  "valueUnionWith:valuesToUnion:",  @"pendingEnableViews",  a3);
  -[SOSAccountTrustClassic valueSubtractFrom:valuesToSubtract:]( self,  "valueSubtractFrom:valuesToSubtract:",  @"pendingDisableViews",  a3);
}

- (BOOL)updateV2Dictionary:(id)a3 v2:(__CFDictionary *)a4
{
  id v6 = a3;
  if (a4)
  {
    -[SOSAccountTrustClassic setValueInExpansion:value:err:]( self,  "setValueInExpansion:value:err:",  @"v2dictionary",  a4,  0LL);
    if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
    {
      if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
        && SOSFullPeerInfoUpdateV2Dictionary( -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"),  a4,  0LL))
      {
        CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_1001A5468;
        v9[3] = &unk_100293E88;
        id v10 = v6;
        -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v7, 0LL, v9);
      }
    }
  }

  return 1;
}

- (BOOL)forEachRing:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  v26[3] = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  v25[3] = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  v24[3] = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  v23[3] = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  v22[3] = 0LL;
  v5 = -[SOSAccountTrustClassic getRings:](self, "getRings:", 0LL);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v7 = Mutable;
  if (!v5)
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    goto LABEL_8;
  }

  if (!Mutable)
  {
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }

  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_1001A52EC;
  v13 = &unk_100292378;
  id v15 = v26;
  int v16 = v25;
  CFMutableDictionaryRef v21 = Mutable;
  int v17 = v24;
  int v18 = v23;
  id v14 = v4;
  int v19 = v22;
  int v20 = &v27;
  CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_1001A5450, &v10);
  if (*((_BYTE *)v28 + 24)) {
    -[SOSAccountTrustClassic setRings:](self, "setRings:", v7, v10, v11, v12, v13);
  }
  CFRelease(v7);

  BOOL v8 = 1;
LABEL_9:
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

  return v8;
}

- (BOOL)resetAllRings:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 1;
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  BOOL v8 = Mutable;
  if (Mutable)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001A5268;
    v15[3] = &unk_100292398;
    v15[4] = Mutable;
    -[SOSAccountTrustClassic forEachRing:](self, "forEachRing:", v15);
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472LL;
    context[2] = sub_1001A5284;
    context[3] = &unk_1002923C0;
    v13 = &v16;
    context[4] = self;
    id v12 = v6;
    id v14 = a4;
    CFSetApplyFunction(v8, (CFSetApplierFunction)sub_1001A52D8, context);
    CFRelease(v8);
    int v9 = *((unsigned __int8 *)v17 + 24);
  }

  else
  {
    int v9 = *((unsigned __int8 *)v17 + 24);
  }

  _Block_object_dispose(&v16, 8);

  return v9 != 0;
}

- (BOOL)resetAccountToEmpty:(id)a3 transport:(id)a4 err:(__CFError *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 1;
  CFTypeRef cf = 0LL;
  unsigned __int8 v10 = -[SOSAccountTrustClassic resetAllRings:err:](self, "resetAllRings:err:", v8, &cf);
  if (*((_BYTE *)v27 + 24)) {
    unsigned __int8 v11 = v10;
  }
  else {
    unsigned __int8 v11 = 0;
  }
  *((_BYTE *)v27 + 24) = v11;
  if (cf)
  {
    id v12 = sub_10001267C("SecError");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v31 = cf;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "reset all rings error: %@", buf, 0xCu);
    }

    CFTypeRef v14 = cf;
    if (a5)
    {
      *a5 = (__CFError *)cf;
    }

    else if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v14);
    }
  }

  -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", 0LL);
  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2LL);
  id v15 = sub_10001267C("circleOps");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Reset Rings to empty by client request",  buf,  2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001A5224;
  v24[3] = &unk_1002923E8;
  void v24[4] = &v26;
  v24[5] = a5;
  unsigned __int8 v17 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, a5, v24);
  if (*((_BYTE *)v27 + 24)) {
    unsigned __int8 v18 = v17;
  }
  else {
    unsigned __int8 v18 = 0;
  }
  *((_BYTE *)v27 + 24) = v18;
  if ((v18 & 1) != 0)
  {
    notify_post(kSOSCCCircleOctagonKeysChangedNotification);
  }

  else
  {
    char v19 = sub_10001267C("SecError");
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        CFMutableDictionaryRef v21 = *a5;
      }
      else {
        CFMutableDictionaryRef v21 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      CFTypeRef v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "error: %@", buf, 0xCu);
    }
  }

  BOOL v22 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v22;
}

- (void)setRings:(__CFDictionary *)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  [v4 setObject:a3 forKey:@"trusted_rings"];
}

- (BOOL)checkForRings:(__CFError *)a3
{
  uint64_t v10 = 0LL;
  unsigned __int8 v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 1;
  v5 = -[SOSAccountTrustClassic getRings:](self, "getRings:", 0LL);
  if (v5 && (CFTypeID v6 = CFGetTypeID(v5), v6 == CFDictionaryGetTypeID()))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A5140;
    v9[3] = &unk_100292410;
    void v9[4] = &v10;
    -[SOSAccountTrustClassic forEachRing:](self, "forEachRing:", v9);
    BOOL v7 = *((_BYTE *)v11 + 24) != 0;
  }

  else
  {
    SOSCreateError(4LL, @"Rings not present", 0LL, a3);
    BOOL v7 = 0;
    *((_BYTE *)v11 + 24) = 0;
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)setRing:(__OpaqueSOSRing *)a3 ringName:(__CFString *)a4 err:(__CFError *)a5
{
  if (a3)
  {
    id v8 = -[SOSAccountTrustClassic getRings:](self, "getRings:", 0LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = (const void *)sub_1001A8D6C((const __CFDictionary **)a3, (CFTypeRef *)a5);
      if (v10)
      {
        unsigned __int8 v11 = v10;
        CFDictionarySetValue(v9, a4, v10);
        CFRelease(v11);
        LOBYTE(v10) = 1;
      }
    }

    else
    {
      SOSCreateError(1043LL, @"No Rings found", 0LL, a5);
      LOBYTE(v10) = 0;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (BOOL)handleUpdateRing:(id)a3 prospectiveRing:(__OpaqueSOSRing *)a4 transport:(id)a5 userPublicKey:(__SecKey *)a6 writeUpdate:(BOOL)a7 err:(__CFError *)a8
{
  BOOL v9 = a7;
  id v152 = a3;
  id v151 = a5;
  if (v9) {
    CFTypeRef v14 = "local";
  }
  else {
    CFTypeRef v14 = "remote";
  }
  int v15 = sub_1001D5AEC(a4);
  int v16 = sub_1001D5AEC(a4);
  if (v15 != 1 && v16 != 5)
  {
    unsigned __int8 v17 = sub_10001267C("ring");
    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "start:[%s] halt processing invalid ring",  buf,  0xCu);
    }

    BOOL v19 = 0;
    goto LABEL_244;
  }

  int v138 = v16;
  char v145 = v9;
  v149 = (uint64_t *)a8;
  int v20 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo(v20);
  uint64_t PeerID = SOSPeerInfoGetPeerID(PeerInfo);
  CFTypeRef v146 = (CFTypeRef)SOSFullPeerInfoCopyDeviceKey(v20, 0LL);
  v148 = (__SecKey *)SOSFullPeerInfoCopyPubKey(v20, 0LL);
  unsigned int v23 = 0;
  v139 = v14;
  uint64_t v140 = PeerInfo;
  if (v20 && PeerInfo && PeerID) {
    unsigned int v23 = -[SOSAccountTrustClassic isInCircleOnly:](self, "isInCircleOnly:", 0LL);
  }
  v143 = sub_1001D570C(a4->var2);
  CFTypeRef v141 = (CFTypeRef)SOSCircleCopyPeers(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), kCFAllocatorDefault);
  CFMutableSetRef cf = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  uint64_t MutableForSOSPeerInfosByID = CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  Value = (const __CFString *)CFDictionaryGetValue(a4->var1, @"LastModifier");
  cf1 = (const __CFString *)PeerID;
  CFTypeRef v144 = (CFTypeRef)MutableForSOSPeerInfosByID;
  if (Value)
  {
    uint64_t v26 = Value;
    if (CFStringGetLength(Value) > 8)
    {
      v163.location = 0LL;
      v163.length = 8LL;
      CFStringRef Copy = CFStringCreateWithSubstring(kCFAllocatorDefault, v26, v163);
    }

    else
    {
      CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, v26);
    }

    CFStringRef v28 = Copy;
  }

  else
  {
    CFStringRef v28 = 0LL;
  }

  char v29 = sub_10001267C("ring");
  char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v139;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "start:[%s] modifier: %@", buf, 0x16u);
  }

  if (v28) {
    CFRelease(v28);
  }
  v150 = -[SOSAccountTrustClassic copyRing:err:](self, "copyRing:err:", v143, 0LL);
  if ((v145 & 1) != 0) {
    goto LABEL_36;
  }
  CFTypeRef v31 = (const __CFString *)CFDictionaryGetValue(a4->var1, @"LastModifier");
  if (cf1 && v31)
  {
    if (!CFEqual(cf1, v31)) {
      goto LABEL_36;
    }
  }

  else if (cf1 != v31)
  {
    goto LABEL_36;
  }

  if (a4 && v150)
  {
    if (CFEqual(v150, a4))
    {
LABEL_32:
      v32 = sub_10001267C("ring");
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Ceasing ring handling for an echo of our own posted ring",  buf,  2u);
      }

      goto LABEL_56;
    }
  }

  else if (v150 == a4)
  {
    goto LABEL_32;
  }

- (__OpaqueSOSRing)copyRing:(__CFString *)a3 err:(__CFError *)a4
{
  CFTypeID v6 = -[SOSAccountTrustClassic getRings:](self, "getRings:", a4);
  if (v6)
  {
    Value = (const __CFData *)CFDictionaryGetValue(v6, a3);
    if (Value) {
      return (__OpaqueSOSRing *)sub_1001A902C(0LL, Value);
    }
    SOSCreateErrorWithFormat(1043LL, 0LL, a4, 0LL, @"No Ring found %@");
  }

  else
  {
    SOSCreateError(1043LL, @"No Rings found", 0LL, a4);
  }

  return 0LL;
}

- (__CFDictionary)getRings:(__CFError *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  CFTypeID v6 = (__CFDictionary *)[v5 objectForKey:@"trusted_rings"];

  if (v6) {
    return v6;
  }
  -[SOSAccountTrustClassic addRingDictionary](self, "addRingDictionary");
  return -[SOSAccountTrustClassic getRings:](self, "getRings:", a3);
}

- (BOOL)resetRing:(id)a3 ringName:(__CFString *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  BOOL v9 = -[SOSAccountTrustClassic copyRing:err:](self, "copyRing:err:", a4, a5);
  unsigned int v10 = sub_1001D5AEC(v9);
  uint64_t v11 = sub_1001ABB38((uint64_t)a4, 0LL, v10, (uint64_t)a5);
  if (v11)
  {
    Value = CFDictionaryGetValue(v9->var2, @"Generation");
    char v13 = (const void *)SOSGenerationCreateWithBaseline(Value);
    if (v13)
    {
      CFTypeRef v14 = v13;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 24), @"Generation", v13);
      CFRelease(v14);
    }
  }

  int v15 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  int v16 = sub_1001D5C8C((uint64_t)v9);
  sub_100197264(v11, (uint64_t)v15, v16, (CFTypeRef *)a5);
  if (v11)
  {
    if (v9) {
      CFRelease(v9);
    }
    id v17 = v8;
    if (sub_100199E38(v17, (uint64_t)a5))
    {
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 trust]);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "circle_transport"));
      unsigned __int8 v20 = objc_msgSend( v18,  "handleUpdateRing:prospectiveRing:transport:userPublicKey:writeUpdate:err:",  v17,  v11,  v19,  objc_msgSend(v17, "accountKey"),  1,  a5);
    }

    else
    {
      unsigned __int8 v20 = 0;
    }

    BOOL v9 = (__OpaqueSOSRing *)v11;
  }

  else
  {
    unsigned __int8 v20 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }

  CFRelease(v9);
  LOBYTE(v11) = v20;
LABEL_11:

  return v11;
}

- (SOSAccountTrustClassic)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SOSAccountTrustClassic;
  v2 = -[SOSAccountTrust init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[SOSAccountTrust setRetirees:](v2, "setRetirees:", v3);

    -[SOSAccountTrust setFullPeerInfo:](v2, "setFullPeerInfo:", 0LL);
    -[SOSAccountTrust setTrustedCircle:](v2, "setTrustedCircle:", 0LL);
    -[SOSAccountTrust setDepartureCode:](v2, "setDepartureCode:", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[SOSAccountTrust setExpansion:](v2, "setExpansion:", v4);

    -[SOSAccountTrustClassic addRingDictionary](v2, "addRingDictionary");
  }

  return v2;
}

- (SOSAccountTrustClassic)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SOSAccountTrustClassic;
  CFTypeRef v14 = -[SOSAccountTrust init](&v18, "init");
  if (v14)
  {
    int v15 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v12);
    -[SOSAccountTrust setRetirees:](v14, "setRetirees:", v15);

    if (a4) {
      CFRetain(a4);
    }
    -[SOSAccountTrust setFullPeerInfo:](v14, "setFullPeerInfo:", a4);
    if (a5) {
      CFRetain(a5);
    }
    -[SOSAccountTrust setTrustedCircle:](v14, "setTrustedCircle:", a5);
    -[SOSAccountTrust setDepartureCode:](v14, "setDepartureCode:", v8);
    int v16 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v13);
    -[SOSAccountTrust setExpansion:](v14, "setExpansion:", v16);

    -[SOSAccountTrustClassic addRingDictionary](v14, "addRingDictionary");
  }

  return v14;
}

- (BOOL)updateGestalt:(id)a3 newGestalt:(__CFDictionary *)a4
{
  id v6 = a3;
  BOOL v7 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v6 gestalt]);
  uint64_t v8 = v7;
  if (a4 && v7)
  {
    int v9 = CFEqual(a4, v7);

    if (v9)
    {
LABEL_4:
      BOOL v10 = 0;
      goto LABEL_11;
    }
  }

  else
  {

    if (v8 == a4) {
      goto LABEL_4;
    }
  }

  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle")
    && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    && SOSFullPeerInfoUpdateGestalt(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, 0LL))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A8CC8;
    v14[3] = &unk_100293E88;
    v14[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v11, 0LL, v14);
  }

  id v12 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", a4);
  [v6 setGestalt:v12];

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (int)updateView:(id)a3 name:(__CFString *)a4 code:(int)a5 err:(__CFError *)a6
{
  id v10 = a3;
  BOOL v11 = sub_1001A19D8(v10, 2LL);
  id v12 = (const void *)SOSViewCopyViewSet(3LL);
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v25 = @"No Trusted Circle";
    uint64_t v26 = 1037LL;
LABEL_47:
    SOSCreateError(v26, v25, 0LL, a6);
    goto LABEL_48;
  }

  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    v25 = @"No Peer for Account";
    uint64_t v26 = 1032LL;
    goto LABEL_47;
  }

  if ((a5 - 3) < 0xFFFFFFFE
    || (id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 trust]),
        int updated = [v13 viewStatus:v10 name:a4 err:a6],
        v13,
        (updated - 3) < 0xFFFFFFFE))
  {
LABEL_48:
    int updated = 0;
    if (!v12) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  if (a4 && kSOSViewKeychainV0)
  {
    if (CFEqual(a4, kSOSViewKeychainV0)) {
      goto LABEL_8;
    }
  }

  else if ((__CFString *)kSOSViewKeychainV0 == a4)
  {
LABEL_8:
    else {
      int updated = 2 * (a5 == 1);
    }
    if (!v12) {
      goto LABEL_42;
    }
LABEL_41:
    CFRelease(v12);
    goto LABEL_42;
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 trust]);
  if ([v15 isSyncingV0])
  {
    char IsV0Subview = SOSViewsIsV0Subview(a4);

    if ((IsV0Subview & 1) != 0)
    {
      int updated = 1;
      if (!v12) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
  }

  else
  {
  }

  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  CFSetAddValue(Mutable, a4);
  if (a5 == 1 && updated == 2)
  {
    if (v11)
    {
      int updated = SOSFullPeerInfoUpdateViews(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 1LL, a4, a6);
      BOOL v18 = updated == 1;
      goto LABEL_29;
    }

    -[SOSAccountTrustClassic pendEnableViewSet:](self, "pendEnableViewSet:", Mutable);
    goto LABEL_35;
  }

  int v19 = 0;
  if (a5 != 2 || updated != 1)
  {
LABEL_36:
    if (!Mutable) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }

  if (v12 && CFSetContainsValue((CFSetRef)v12, a4))
  {
LABEL_35:
    int v19 = 0;
    int updated = 1;
    goto LABEL_36;
  }

  if (!v11)
  {
    id v22 = v10;
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 trust]);
    [v23 valueUnionWith:@"pendingDisableViews" valuesToUnion:Mutable];

    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 trust]);
    [v24 valueSubtractFrom:@"pendingEnableViews" valuesToSubtract:Mutable];

    int v19 = 0;
    int updated = 2;
    if (!Mutable) {
      goto LABEL_38;
    }
LABEL_37:
    CFRelease(Mutable);
    goto LABEL_38;
  }

  int updated = SOSFullPeerInfoUpdateViews(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 2LL, a4, a6);
  BOOL v18 = updated == 2;
LABEL_29:
  int v19 = v18;
  if (Mutable) {
    goto LABEL_37;
  }
LABEL_38:
  if (v19)
  {
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "circle_transport"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001A8C38;
    v27[3] = &unk_100293E88;
    v27[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v20, 0LL, v27);
  }

  if (v12) {
    goto LABEL_41;
  }
LABEL_42:

  return updated;
}

- (BOOL)activeValidInCircle:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  BOOL v7 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"));
  id v9 = sub_100199E38(v6, (uint64_t)a4);

  return SOSCircleHasActiveValidPeer(v7, PeerInfo, v9, a4);
}

- (int)viewStatus:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  if (!sub_100199E38(v8, (uint64_t)a5))
  {
    id v13 = @"No Trusted UserKey";
    uint64_t v14 = 1033LL;
LABEL_24:
    SOSCreateError(v14, v13, 0LL, a5);
    int v9 = 0;
    goto LABEL_19;
  }

  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    id v13 = @"No Trusted Circle";
    uint64_t v14 = 1037LL;
    goto LABEL_24;
  }

  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    id v13 = @"No Peer for Account";
    uint64_t v14 = 1032LL;
    goto LABEL_24;
  }

  if (!-[SOSAccountTrustClassic activeValidInCircle:err:](self, "activeValidInCircle:err:", v8, a5))
  {
    id v13 = @"Not in Circle";
    uint64_t v14 = 1046LL;
    goto LABEL_24;
  }

  if (!-[SOSAccountTrustClassic valueSetContainsValue:value:]( self,  "valueSetContainsValue:value:",  @"pendingEnableViews",  a4))
  {
    if (-[SOSAccountTrustClassic valueSetContainsValue:value:]( self,  "valueSetContainsValue:value:",  @"pendingDisableViews",  a4))
    {
      int v9 = 2;
LABEL_9:
      if (a4 && kSOSViewKeychainV0)
      {
        if (!CFEqual(a4, kSOSViewKeychainV0))
        {
LABEL_14:
        }
      }

      else if ((__CFString *)kSOSViewKeychainV0 != a4)
      {
        goto LABEL_14;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 trust]);
      unsigned int v11 = [v10 isSyncingV0];

      if (!v11) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }

    int v9 = SOSFullPeerInfoViewStatus(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, a5);
    if (v9 != 1) {
      goto LABEL_9;
    }
  }

- (BOOL)matchOTUserViewSettings:(id)a3 userViewsEnabled:(BOOL)a4 err:(__CFError *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v22 = 0LL;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  UserVisibleSet = (const __CFSet *)SOSViewsGetUserVisibleSet();
  if ([v8 isInCircle:a5])
  {
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472LL;
    context[2] = sub_1001A8BE4;
    context[3] = &unk_1002924E8;
    id v18 = v8;
    int v19 = &v26;
    unsigned __int8 v20 = &v22;
    CFMutableDictionaryRef v21 = a5;
    CFSetApplyFunction(UserVisibleSet, (CFSetApplierFunction)sub_1001A81B8, context);
  }

  if (!v6)
  {
    if (*((_BYTE *)v23 + 24))
    {
      id v13 = sub_10001267C("circleChange");
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Disabling User Visible Views to match OT Settings",  v16,  2u);
      }

      id v12 = 0LL;
      goto LABEL_12;
    }

- (BOOL)updateViewSets:(id)a3 enabled:(__CFSet *)MutableCopy disabled:(__CFSet *)a5
{
  id v8 = a3;
  if (MutableCopy) {
    CFMutableSetRef MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0LL, MutableCopy);
  }
  if (a5) {
    a5 = CFSetCreateMutableCopy(kCFAllocatorDefault, 0LL, a5);
  }
  sub_1001A87C0((uint64_t)@"Enabled", MutableCopy);
  sub_1001A87C0((uint64_t)@"Disabled", a5);
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    uint64_t v22 = sub_10001267C("views");
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Attempt to set viewsets with no trusted circle";
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_42;
  }

  int v9 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  if (!v9)
  {
    char v25 = sub_10001267C("views");
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Attempt to set viewsets with no fullPeerInfo";
    goto LABEL_41;
  }

  if ((unint64_t)MutableCopy | (unint64_t)a5)
  {
    id v10 = v9;
    uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo(v9);
    uint64_t Copy = SOSPeerInfoCreateCopy(kCFAllocatorDefault, PeerInfo, 0LL);
    if (Copy)
    {
      id v13 = (const void *)Copy;
      int IsCurrent = SOSPeerInfoVersionIsCurrent(Copy);
      if ((IsCurrent & 1) == 0)
      {
        CFTypeRef cf = 0LL;
        if ((SOSPeerInfoUpdateToV2(v13, &cf) & 1) == 0)
        {
          v33 = sub_10001267C("views");
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFTypeRef v39 = cf;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Unable to update peer to V2- can't update views: %@",  buf,  0xCu);
          }

          CFTypeRef v35 = cf;
          if (cf)
          {
            CFTypeRef cf = 0LL;
            CFRelease(v35);
          }

- (void)addSyncablePeerBlock:(id)a3 dsName:(__CFString *)a4 change:(id)a5
{
  id v8 = a5;
  if (!v8) {
    goto LABEL_12;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue([a3 account]);
  if (a4) {
    CFRetain(a4);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001A8474;
  v13[3] = &unk_100292550;
  int v15 = a4;
  v13[4] = self;
  id v14 = v8;
  id v10 = objc_retainBlock(v13);
  sub_100190FF0(v9, v10);
  uint64_t MutableForSOSPeerInfosByID = (const void *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    uint64_t Name = (__CFString *)SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle"));
    if (!a4 || !Name)
    {
      if (Name != a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    if (CFEqual(a4, Name)) {
LABEL_8:
    }
      ((void (*)(void *, void *, __OpaqueSOSCircle *, const void *, const void *, const void *, const void *))v10[2])( v10,  v9,  -[SOSAccountTrust trustedCircle](self, "trustedCircle"),  MutableForSOSPeerInfosByID,  MutableForSOSPeerInfosByID,  MutableForSOSPeerInfosByID,  MutableForSOSPeerInfosByID);
  }

- (__CFSet)copyPeerSetForView:(__CFString *)a3
{
  uint64_t MutableForSOSPeerInfosByID = (__CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001A842C;
    v7[3] = &unk_100292FD0;
    v7[4] = a3;
    v7[5] = MutableForSOSPeerInfosByID;
    SOSCircleForEachPeer(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), v7);
  }

  return MutableForSOSPeerInfosByID;
}

- (__SecKey)copyPublicKeyForPeer:(__CFString *)a3 err:(__CFError *)a4
{
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    uint64_t v7 = SOSCircleCopyPeerWithID(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), a3, a4);
    if (v7)
    {
      id v8 = (const void *)v7;
      int v9 = (__SecKey *)SOSPeerInfoCopyPubKey(v7, a4);
      CFRelease(v8);
      return v9;
    }
  }

  else
  {
    SOSErrorCreate(1037LL, a4, 0LL, @"No circle to get peer key from");
  }

  return 0LL;
}

- (__OpaqueSOSPeerInfo)copyPeerWithID:(__CFString *)a3 err:(__CFError *)a4
{
  result = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (result) {
    return (__OpaqueSOSPeerInfo *)SOSCircleCopyPeerWithID( -[SOSAccountTrust trustedCircle](self, "trustedCircle"),  a3,  a4);
  }
  return result;
}

- (BOOL)isAccountIdentity:(__OpaqueSOSPeerInfo *)a3 err:(__CFError *)a4
{
  v5 = -[SOSAccountTrust peerInfo](self, "peerInfo", a3, a4);
  if (a3 && v5) {
    return CFEqual(a3, v5) != 0;
  }
  else {
    return v5 == a3;
  }
}

- (__CFSet)copyPeerSetMatching:(id)a3
{
  id v4 = a3;
  uint64_t MutableForSOSPeerInfosByID = (__CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    BOOL v6 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001A83E8;
    v8[3] = &unk_100292F40;
    id v9 = v4;
    id v10 = MutableForSOSPeerInfosByID;
    SOSCircleForEachPeer(v6, v8);
  }

  return MutableForSOSPeerInfosByID;
}

- (__CFArray)copyPeersToListenTo:(__SecKey *)a3 err:(__CFError *)a4
{
  uint64_t PeerID = -[SOSAccountTrust peerInfo](self, "peerInfo");
  if (PeerID) {
    uint64_t PeerID = (__OpaqueSOSPeerInfo *)SOSPeerInfoGetPeerID(PeerID);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001A82F4;
  v9[3] = &unk_100292590;
  void v9[4] = PeerID;
  void v9[5] = a3;
  return -[SOSAccountTrustClassic copySortedPeerArray:action:](self, "copySortedPeerArray:action:", a4, v9);
}

- (BOOL)peerSignatureUpdate:(__SecKey *)a3 err:(__CFError *)a4
{
  uint64_t v7 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  if (v7) {
    LOBYTE(v7) = SOSFullPeerInfoUpgradeSignatures(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a3, a4);
  }
  return (char)v7;
}

- (BOOL)updatePeerInfo:(id)a3 description:(__CFString *)a4 err:(__CFError *)a5 update:(id)a6
{
  id v10 = a3;
  unsigned int v11 = (unsigned int (**)(id, __OpaqueSOSFullPeerInfo *, __CFError **))a6;
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")) {
    goto LABEL_5;
  }
  if (!v11[2](v11, -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a5))
  {
    BOOL v12 = 0;
    goto LABEL_7;
  }

  if (-[SOSAccountTrustClassic hasCircle:](self, "hasCircle:", 0LL))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A8228;
    v14[3] = &unk_100292EF0;
    v14[4] = self;
    void v14[5] = a4;
    BOOL v12 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v10, a5, v14);
  }

  else
  {
LABEL_5:
    BOOL v12 = 1;
  }

- (void)removeInvalidApplications:(__OpaqueSOSCircle *)a3 userPublic:(__SecKey *)a4
{
  uint64_t MutableForSOSPeerInfosByID = (const __CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001A81D4;
  v8[3] = &unk_100292FD0;
  void v8[4] = a4;
  v8[5] = MutableForSOSPeerInfosByID;
  SOSCircleForEachApplicant(a3, v8);
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472LL;
  context[2] = sub_1001A821C;
  context[3] = &unk_100293EA8;
  void context[4] = a3;
  CFSetApplyFunction(MutableForSOSPeerInfosByID, (CFSetApplierFunction)sub_1001A81B8, context);
}

- (BOOL)upgradeiCloudIdentity:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4
{
  uint64_t v6 = SOSCircleCopyiCloudFullPeerInfoRef(a3, 0LL);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = (const void *)v6;
  if (SOSFullPeerInfoUpgradeSignatures(v6, a4, 0LL))
  {
    uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo(v7);
    char updated = SOSCircleUpdatePeerInfo(a3, PeerInfo);
  }

  else
  {
    char updated = 0;
  }

  CFRelease(v7);
  return updated;
}

- (__CFSet)copyPreApprovedHSA2Info
{
  v2 = -[SOSAccountTrustClassic getValueFromExpansion:err:]( self,  "getValueFromExpansion:err:",  @"HSAPreApprovedPeer",  0LL);
  if (v2) {
    return CFSetCreateMutableCopy(0LL, 0LL, v2);
  }
  else {
    return CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  }
}

- (BOOL)addiCloudIdentity:(__OpaqueSOSCircle *)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  SecKeyRef v9 = sub_10019B778( 256,  (uint64_t)@"Cloud Identity",  (uint64_t)kSecAttrAccessibleWhenUnlocked,  (uint64_t)kCFBooleanTrue,  a5);
  if (!v9)
  {
    sub_1000194E0(-108, (__CFString **)a5, @"Can't generate keypair for icloud identity");
    return 0;
  }

  SecKeyRef v17 = v9;
  CFDictionaryRef v18 = sub_100107FA8( kCFAllocatorDefault,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  kPIUserDefinedDeviceNameKey,  (uint64_t)@"iCloud");
  if (!v18)
  {
    sub_1000194E0(-108, (__CFString **)a5, @"Can't allocate gestalt");
LABEL_18:
    CFRelease(v17);
    return 0;
  }

  CFDictionaryRef v19 = v18;
  uint64_t CloudIdentity = SOSPeerInfoCreateCloudIdentity(kCFAllocatorDefault, v18, v17, a5);
  if (!CloudIdentity)
  {
    CFRelease(v19);
    goto LABEL_18;
  }

  uint64_t v28 = (const void *)CloudIdentity;
  char v29 = sub_100107FA8(kCFAllocatorDefault, v21, v22, v23, v24, v25, v26, v27, (uint64_t)kSecClass, (uint64_t)kSecClassKey);
  uint64_t PeerID = SOSPeerInfoGetPeerID(v28);
  CFStringRef v31 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Cloud Identity - '%@'", PeerID);
  CFTypeRef v39 = sub_100107FA8(kCFAllocatorDefault, v32, v33, v34, v35, v36, v37, v38, (uint64_t)kSecAttrLabel, (uint64_t)v31);
  OSStatus v40 = SecItemUpdate(v29, v39);
  sub_1000194E0(v40, (__CFString **)a5, @"Couldn't update name");
  if (v31) {
    CFRelease(v31);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v39) {
    CFRelease(v39);
  }
  CFRelease(v19);
  CFRelease(v17);
  unsigned int v41 = (const void *)SOSFullPeerInfoCreateCloudIdentity(0LL, v28, a5);
  CFRelease(v28);
  if (!v41) {
    return 0;
  }
  if (SOSCircleRequestAdmission(a3, a4, v41, a5))
  {
    uint64_t v42 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
    uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo(v41);
    char v44 = SOSCircleAcceptRequest(a3, a4, v42, PeerInfo, a5);
  }

  else
  {
    char v44 = 0;
  }

  CFRelease(v41);
  return v44;
}

- (BOOL)addEscrowToPeerInfo:(__OpaqueSOSFullPeerInfo *)a3 err:(__CFError *)a4
{
  return SOSFullPeerInfoReplaceEscrowRecords( a3,  -[SOSAccountTrustClassic getValueFromExpansion:err:]( self,  "getValueFromExpansion:err:",  @"EscrowRecord"),  a4);
}

- (__CFArray)copySortedPeerArray:(__CFError *)a3 action:(id)a4
{
  v5 = (void (**)(id, __OpaqueSOSCircle *, __CFArray *))a4;
  CFMutableSetRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  v5[2](v5, -[SOSAccountTrust trustedCircle](self, "trustedCircle"), Mutable);

  CFArrayOfSOSPeerInfosSortByID(Mutable);
  return Mutable;
}

- (unint64_t)getDEREncodedSize:(id)a3 err:(id *)a4
{
  id v5 = a3;
  id v38 = 0LL;
  uint64_t v6 = ccder_sizeof_uint64(8LL);
  if (!v6) {
    goto LABEL_20;
  }
  uint64_t v8 = v6;
  SecKeyRef v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v5 gestalt]);
  uint64_t v10 = sub_100012920(v9, (uint64_t)&v38);

  uint64_t v37 = v10;
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t DEREncodedSize = SOSCircleGetDEREncodedSize(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), &v38);
  if (!DEREncodedSize) {
    goto LABEL_20;
  }
  int v11 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  uint64_t v12 = v11 ? SOSFullPeerInfoGetDEREncodedSize(v11, &v38) : ccder_sizeof(5LL, 0LL);
  uint64_t v35 = v12;
  if (!v12) {
    goto LABEL_20;
  }
  uint64_t v34 = ccder_sizeof_uint64(-[SOSAccountTrust departureCode](self, "departureCode"));
  if (!v34) {
    goto LABEL_20;
  }
  [v5 accountKeyIsTrusted];
  uint64_t v13 = ccder_sizeof(1LL, 1LL);
  if (!v13) {
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_10019885C([v5 accountKey], (uint64_t)&v38);
  if (!v15) {
    goto LABEL_20;
  }
  uint64_t v16 = v15;
  uint64_t v17 = sub_10019885C([v5 previousAccountKey], (uint64_t)&v38);
  if (!v17) {
    goto LABEL_20;
  }
  uint64_t v18 = v17;
  CFDictionaryRef v19 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKeyDerivationParameters]);
  uint64_t v20 = der_sizeof_data_or_null(v19, &v38);

  if (!v20) {
    goto LABEL_20;
  }
  int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust retirees](self, "retirees"));
  uint64_t DEREncodedArraySize = SOSPeerInfoSetGetDEREncodedArraySize(v21, &v38);

  if (!DEREncodedArraySize) {
    goto LABEL_20;
  }
  int v23 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backup_key"));
  int v24 = v23;
  if (v23)
  {
    CFIndex Length = CFDataGetLength(v23);
    uint64_t v26 = ccder_sizeof_raw_octet_string(Length);
  }

  else
  {
    uint64_t v26 = 0LL;
  }

  int v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  uint64_t v28 = sub_100012920(v27, (uint64_t)&v38);

  if (v28)
  {
    unint64_t v29 = ccder_sizeof( 0x2000000000000010LL,  v37 + v8 + DEREncodedSize + v35 + v34 + v14 + v16 + v18 + v20 + DEREncodedArraySize + v26 + v28);
  }

  else
  {
LABEL_20:
    sub_1000194B4( -1LL,  @"com.apple.security.cfder.error",  0LL,  (CFTypeRef *)&v38,  v7,  @"don't know how to encode",  a4,  v34,  v35,  DEREncodedSize,  v37);
    id v31 = v38;
    if (v33 && v38)
    {
      unint64_t v29 = 0LL;
      void *v33 = v38;
    }

    else
    {
      if (v38)
      {
        id v38 = 0LL;
        CFRelease(v31);
      }

      unint64_t v29 = 0LL;
    }
  }

  return v29;
}

- (char)encodeToDER:(id)a3 err:(id *)a4 start:(const char *)a5 end:(char *)a6
{
  id v35 = 0LL;
  id v9 = a3;
  id v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v9 gestalt]);
  char v30 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  uint64_t v34 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  uint64_t v33 = -[SOSAccountTrust departureCode](self, "departureCode");
  unsigned __int8 v10 = [v9 accountKeyIsTrusted];
  id v11 = [v9 accountKey];
  id v12 = [v9 previousAccountKey];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 accountKeyDerivationParameters]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust retirees](self, "retirees"));
  uint64_t v15 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backup_key"));

  uint64_t v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  uint64_t v17 = sub_100012A4C(v16, (CFTypeRef *)&v35, 0, (uint64_t)a5, (uint64_t)a6);
  if (v15) {
    uint64_t v17 = sub_10001A7CC(v15, (CFTypeRef *)&v35, (uint64_t)a5, v17);
  }
  uint64_t v18 = SOSPeerInfoSetEncodeToArrayDER(v14, &v35, a5, v17);
  uint64_t v19 = der_encode_data_or_null(v13, &v35, a5, v18);
  uint64_t v20 = sub_1001988B4(v12, (uint64_t)&v35, (uint64_t)a5, v19);
  uint64_t v21 = sub_1001988B4(v11, (uint64_t)&v35, (uint64_t)a5, v20);
  unsigned __int8 v36 = v10;
  uint64_t v22 = ccder_encode_body(1LL, &v36, a5, v21);
  ccder_encode_tl(1LL, 1LL, a5, v22);
  uint64_t v23 = ccder_encode_uint64(v33);
  if (v34) {
    uint64_t v24 = SOSFullPeerInfoEncodeToDER(v34, &v35, a5, v23);
  }
  else {
    uint64_t v24 = ccder_encode_tl(5LL, 0LL, a5, v23);
  }
  uint64_t v25 = SOSCircleEncodeToDER(v30, &v35, a5, v24);
  sub_100012A4C(v31, (CFTypeRef *)&v35, 0, (uint64_t)a5, v25);
  uint64_t v26 = ccder_encode_uint64(8LL);
  int v27 = (char *)ccder_encode_constructed_tl(0x2000000000000010LL, a6, a5, v26);

  id v28 = v35;
  if (a4 && v35)
  {
    *a4 = v35;
  }

  else if (v35)
  {
    id v35 = 0LL;
    CFRelease(v28);
  }

  return v27;
}

- (__CFSet)syncWithPeers:(id)a3 peerIDs:(__CFSet *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 account]);
  if ([v9 isInCircle:a5])
  {
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    id v11 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    id v12 = [v9 peerInfo];
    if (v12)
    {
      uint64_t PeerID = (const void *)SOSPeerInfoGetPeerID(v12);
      CFMutableSetRef MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0LL, a4);
      CFSetRemoveValue(MutableCopy, PeerID);
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472LL;
      context[2] = sub_1001A7FD8;
      context[3] = &unk_1002925B8;
      void context[4] = self;
      id v18 = v9;
      uint64_t v19 = v11;
      uint64_t v20 = Mutable;
      CFSetApplyFunction(MutableCopy, (CFSetApplierFunction)sub_1001A81B8, context);
      uint64_t v15 = sub_100197CEC(v8, v11);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1001A81CC;
      v21[3] = &unk_100293EA8;
      v21[4] = Mutable;
      CFSetApplyFunction(v15, (CFSetApplierFunction)sub_1001A81B8, v21);
      if (v15) {
        CFRelease(v15);
      }
      sub_100197A04(v8);
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
      if (v11) {
        CFRelease(v11);
      }
    }

    else if (v11)
    {
      CFRelease(v11);
    }
  }

  else
  {
    CFMutableSetRef Mutable = CFSetCreateMutableCopy(kCFAllocatorDefault, 0LL, a4);
  }

  return Mutable;
}

- (BOOL)requestSyncWithAllPeers:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 account]);
  unsigned int v10 = [v9 isInCircle:a5];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v12 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001A7FAC;
    v15[3] = &unk_1002925E0;
    id v16 = v11;
    id v13 = v11;
    SOSCircleForEachValidSyncingPeer(v12, a4, v15);
    [v8 requestSyncWithPeers:v13];
  }

  return v10;
}

- (BOOL)isSyncingV0
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001A7F64;
  v4[3] = &unk_100292608;
  v4[4] = &v5;
  -[SOSAccountTrustClassic forEachCirclePeerExceptMe:](self, "forEachCirclePeerExceptMe:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (__OpaqueSOSEngine)getDataSourceEngine:(SOSDataSourceFactory *)a3
{
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    uint64_t v7 = sub_10001267C("engine");
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Tried to set dataSourceEngine with no circle",  v10,  2u);
    }

    return 0LL;
  }

  uint64_t Name = SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle"));
  if (a3)
  {
    uint64_t v6 = ((uint64_t (*)(SOSDataSourceFactory *, uint64_t, void))a3->var1)(a3, Name, 0LL);
    if (v6)
    {
      a3 = *(SOSDataSourceFactory **)v6;
      (*(void (**)(uint64_t, void))(v6 + 72))(v6, 0LL);
      return (__OpaqueSOSEngine *)a3;
    }

    return 0LL;
  }

  return (__OpaqueSOSEngine *)a3;
}

- (BOOL)postDebugScope:(id)a3 scope:(void *)a4 err:(__CFError *)a5
{
  if (a3) {
    return [a3 kvssendDebugInfo:@"Scope" debug:a4 err:a5];
  }
  else {
    return 0;
  }
}

- (__SecKey)copyDeviceKey:(__CFError *)a3
{
  if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")) {
    return (__SecKey *)SOSFullPeerInfoCopyDeviceKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a3);
  }
  SOSErrorCreate(1032LL, a3, 0LL, @"No identity to get key from");
  return 0LL;
}

- (BOOL)removeIncompleteiCloudIdentities:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4 err:(__CFError *)a5
{
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001A7EFC;
  v11[3] = &unk_100292840;
  v11[4] = Mutable;
  SOSCircleForEachActivePeer(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), v11);
  CFIndex Count = CFSetGetCount(Mutable);
  if (Count >= 1) {
    SOSCircleRemovePeers( -[SOSAccountTrust trustedCircle](self, "trustedCircle"),  a4,  -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"),  Mutable,  a5);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Count > 0;
}

- (BOOL)clientPing:(id)a3
{
  id v4 = a3;
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle")
    && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    && SOSFullPeerInfoPing(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 0LL))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "circle_transport"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001A7E6C;
    v7[3] = &unk_100293E88;
    v7[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v5, 0LL, v7);
  }

  return 1;
}

- (void)addRingDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"trusted_rings"]);

    if (!v5)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
      [v6 setObject:v7 forKey:@"trusted_rings"];
    }
  }

- (void)resetRingDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));

  if (v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
    [v4 setObject:v5 forKey:@"trusted_rings"];
  }

+ (id)trustClassic
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isInCircleOnly:(__CFError *)a3
{
  unsigned int v4 = -[SOSAccountTrustClassic getCircleStatusOnly:](self, "getCircleStatusOnly:");
  if (v4) {
    SOSErrorCreate(1037LL, a3, 0LL, @"Not in circle");
  }
  return v4 == 0;
}

- (BOOL)hasCircle:(__CFError *)a3
{
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle")) {
    SOSCreateErrorWithFormat(1037LL, 0LL, a3, 0LL, @"No trusted circle");
  }
  return -[SOSAccountTrust trustedCircle](self, "trustedCircle") != 0LL;
}

- (int)thisDeviceStatusInCircle:(__OpaqueSOSCircle *)a3 peer:(__OpaqueSOSPeerInfo *)a4
{
  if (!a3) {
    return 1;
  }
  if (!a4 || (SOSPeerInfoIsRetirementTicket(a4) & 1) != 0) {
    return 1;
  }
  if ((SOSCircleHasPeer(a3, a4, 0LL) & 1) != 0) {
    return 0;
  }
  if ((SOSCircleHasApplicant(a3, a4, 0LL) & 1) == 0) {
    return 1;
  }
  return 2;
}

- (int)getCircleStatusOnly:(__CFError *)a3
{
  return -[SOSAccountTrustClassic thisDeviceStatusInCircle:peer:]( self,  "thisDeviceStatusInCircle:peer:",  -[SOSAccountTrust trustedCircle](self, "trustedCircle", a3),  -[SOSAccountTrust peerInfo](self, "peerInfo"));
}

- (__OpaqueSOSCircle)getCircle:(__CFError *)a3
{
  unsigned int v4 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  id v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNullGetTypeID())
    {
      SOSCreateError(5LL, @"Incompatible circle in KVS", 0LL, a3);
      return 0LL;
    }
  }

  return v5;
}

- (__OpaqueSOSCircle)ensureCircle:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5
{
  id v7 = a3;
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    char v8 = (const void *)SOSCircleCreate(0LL, a4, 0LL);
    -[SOSAccountTrust setTrustedCircle:](self, "setTrustedCircle:", v8);
    if (v8) {
      CFRelease(v8);
    }
    id v9 = sub_10001267C("circleop");
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting key_interests_need_updating to true in ensureCircle",  v13,  2u);
    }

    objc_msgSend(v7, "setKey_interests_need_updating:", 1);
  }

  -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  id v11 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");

  return v11;
}

- (BOOL)hasLeft
{
  unsigned int v2 = -[SOSAccountTrust departureCode](self, "departureCode");
  return (v2 < 8) & (0xDCu >> v2);
}

- (BOOL)ghostBustingOK:(__OpaqueSOSCircle *)a3 updatingTo:(__OpaqueSOSCircle *)a4
{
  CFTypeID v6 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  if (!v6) {
    return 0;
  }
  uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo(v6);
  if (!PeerInfo) {
    return 0;
  }
  uint64_t v8 = PeerInfo;
  uint64_t PeerID = (const void *)SOSPeerInfoGetPeerID(v8);
  unsigned int v10 = (const __CFDictionary *)SOSCircleCopyAllSignatures(a4);
  CFIndex CountOfKey = CFDictionaryGetCountOfKey(v10, PeerID);
  CFIndex Count = CFDictionaryGetCount(v10);
  char HasPeer = SOSCircleHasPeer(a3, v8, 0LL);
  BOOL v14 = Count - 2 > 1;
  if (!CountOfKey) {
    BOOL v14 = 1;
  }
  BOOL v15 = (HasPeer & 1) != 0 || v14;
  if (v10) {
    CFRelease(v10);
  }
  return v15;
}

- (BOOL)checkForSponsorshipTrust:(__OpaqueSOSCircle *)a3
{
  id v5 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (!a3 || !v5)
  {
    if (v5 != a3) {
      goto LABEL_6;
    }
    return 0;
  }

  if (CFEqual(v5, a3)) {
    return 0;
  }
LABEL_6:
  uint64_t v6 = SOSFullPeerInfoCopyPubKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 0LL);
  if (!v6) {
    return 0;
  }
  id v7 = (const void *)v6;
  if (SOSCircleVerify(a3, v6, 0LL)
    && SOSCircleIsOlderGeneration(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), a3))
  {
    -[SOSAccountTrust setTrustedCircle:](self, "setTrustedCircle:", a3);
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  CFRelease(v7);
  return v8;
}

- (id)iCloudCheckEventHandle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_alloc(&OBJC_CLASS___SOSIntervalEvent);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);

  uint64_t v6 = -[SOSIntervalEvent initWithDefaults:dateDescription:earliest:latest:]( v4,  "initWithDefaults:dateDescription:earliest:latest:",  v5,  @"iCloudIDCheck",  86400.0,  129600.0);
  return v6;
}

- (id)iCloudCleanerHandle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_alloc(&OBJC_CLASS___SOSIntervalEvent);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);

  uint64_t v6 = -[SOSIntervalEvent initWithDefaults:dateDescription:earliest:latest:]( v4,  "initWithDefaults:dateDescription:earliest:latest:",  v5,  @"iCloudCleanerCheck",  432000.0,  604800.0);
  return v6;
}

- (BOOL)handleUpdateCircle:(__OpaqueSOSCircle *)a3 transport:(id)a4 update:(BOOL)a5 err:(__CFError *)a6
{
  unsigned int v7 = a5;
  id v10 = a4;
  id v11 = v10;
  id v12 = "remote";
  if (v7) {
    id v12 = "local";
  }
  CFTypeRef v146 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 getAccount]);
  BOOL v14 = sub_10001267C("signing");
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v146;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "start:[%s]", buf, 0xCu);
  }

  if (![v13 accountKey] || (objc_msgSend(v13, "accountKeyIsTrusted") & 1) == 0)
  {
    SOSCreateError(2LL, @"Can't handle updates with no trusted public key here", 0LL, a6);
LABEL_14:
    LOBYTE(v18) = 0;
    goto LABEL_15;
  }

  if (!a3)
  {
    uint64_t v22 = sub_10001267C("SecError");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "##### Can't update to a NULL circle ######",  buf,  2u);
    }

    goto LABEL_21;
  }

  if ((v7 & 1) == 0 && -[SOSAccountTrustClassic checkForSponsorshipTrust:](self, "checkForSponsorshipTrust:", a3))
  {
    _os_activity_initiate( (void *)&_mh_execute_header,  "CloudCircle EnsurePeerRegistration",  OS_ACTIVITY_FLAG_DEFAULT,  &stru_1002935E8);
    id v16 = sub_10001267C("circleop");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Setting key_interests_need_updating to true in handleUpdateCircle",  buf,  2u);
    }

    objc_msgSend(v13, "setKey_interests_need_updating:", 1);
    [v13 sosEvaluateIfNeeded];
    LOBYTE(v18) = 1;
    goto LABEL_15;
  }

  uint64_t Name = SOSCircleGetName(a3);
  uint64_t v21 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  CFTypeRef cf = v21;
  if (!v21)
  {
    SOSCreateErrorWithFormat(5LL, 0LL, a6, 0LL, @"Current Entry is NULL; rejecting %@");
    uint64_t v24 = sub_10001267C("SecError");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "##### Can't replace circle - we don't care about it ######",  buf,  2u);
    }

- (BOOL)updateCircleFromRemote:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5
{
  return -[SOSAccountTrustClassic handleUpdateCircle:transport:update:err:]( self,  "handleUpdateCircle:transport:update:err:",  a4,  a3,  0LL,  a5);
}

- (BOOL)updateCircle:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5
{
  return -[SOSAccountTrustClassic handleUpdateCircle:transport:update:err:]( self,  "handleUpdateCircle:transport:update:err:",  a4,  a3,  1LL,  a5);
}

- (BOOL)modifyCircle:(id)a3 err:(__CFError *)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = (unsigned int (**)(id, uint64_t))a5;
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    SOSErrorCreate(1037LL, a4, 0LL, @"No circle to get peer key from");
    goto LABEL_8;
  }

  uint64_t v10 = SOSCircleCopyCircle(kCFAllocatorDefault, -[SOSAccountTrust trustedCircle](self, "trustedCircle"), a4);
  if (!v10)
  {
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_6;
  }

  id v11 = (const void *)v10;
  if (v9[2](v9, v10)) {
    BOOL v12 = -[SOSAccountTrustClassic updateCircle:newCircle:err:](self, "updateCircle:newCircle:err:", v8, v11, a4);
  }
  else {
    BOOL v12 = 1;
  }
  CFRelease(v11);
LABEL_6:

  return v12;
}

- (BOOL)fixICloudIdentities:(id)a3 circle:(__OpaqueSOSCircle *)a4
{
  id v6 = a3;
  unsigned int v7 = (const void *)SOSCircleCopyiCloudFullPeerInfoRef(a4, 0LL);
  if (v7)
  {
    CFRelease(v7);
LABEL_21:
    LOBYTE(v14) = 0;
    goto LABEL_22;
  }

  sub_10019987C(v6);
  if (!sub_100199708(v6, 0LL) && !sub_10019A050(v6, 0LL))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    uint64_t v17 = v16;
    int v18 = &off_1002AE7A0;
    goto LABEL_20;
  }

  id v8 = sub_100199708(v6, 0LL);
  if (!v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    uint64_t v17 = v16;
    int v18 = &off_1002AE778;
LABEL_20:
    [v16 logHardFailureForEventNamed:@"iCloudIdentityFix" withAttributes:v18];

    goto LABEL_21;
  }

  id v9 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrustClassic iCloudCleanerHandle:](self, "iCloudCleanerHandle:", v6));
  if ([v10 checkDate])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
    id v12 = [v11 fullPeerInfo];
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    cf[0] = _NSConcreteStackBlock;
    cf[1] = (CFTypeRef)3221225472LL;
    cf[2] = sub_1001914AC;
    cf[3] = &unk_100292840;
    cf[4] = Mutable;
    SOSCircleForEachActivePeer(a4, cf);
    if (CFSetGetCount(Mutable) >= 1) {
      SOSCircleRemovePeers(a4, v9, v12, Mutable, 0LL);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }

    [v10 followup];
  }

  cf[0] = 0LL;
  BOOL v14 = -[SOSAccountTrustClassic addiCloudIdentity:key:err:](self, "addiCloudIdentity:key:err:", a4, v9, cf);
  if (v14)
  {
    [v6 setNotifyBackupOnExit:1];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    [v15 logSuccessForEventNamed:@"iCloudIdentityFix"];
  }

  else
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    [v15 logResultForEvent:@"iCloudIdentityFix" hardFailure:1 result:cf[0]];
  }

  CFTypeRef v19 = cf[0];
  if (cf[0])
  {
    cf[0] = 0LL;
    CFRelease(v19);
  }

LABEL_22:
  return v14;
}

- (void)generationSignatureUpdateWith:(id)a3 key:(__SecKey *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
  if ([v7 trustedCircle] && (sub_10019B9B8(v6, (uint64_t)a4) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
    int v9 = SOSCircleVerify([v8 trustedCircle], objc_msgSend(v6, "accountKey"), 0);

    if (v9)
    {
      uint64_t v10 = sub_10001267C("updatingGenSignature");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "no change to userKey - skipping gensign",  buf,  2u);
      }

      goto LABEL_10;
    }
  }

  else
  {
  }

  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle") && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001BA96C;
    v13[3] = &unk_100292EA0;
    BOOL v14 = (os_log_s *)v6;
    BOOL v15 = self;
    id v16 = a4;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v12, 0LL, v13);

    id v11 = v14;
LABEL_10:
  }
}

- (void)forEachCirclePeerExceptMe:(id)a3
{
  id v4 = a3;
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle") && -[SOSAccountTrust peerInfo](self, "peerInfo"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust peerID](self, "peerID"));
    id v6 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001BA918;
    v8[3] = &unk_100292EC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    SOSCircleForEachPeer(v6, v8);
  }
}

- (BOOL)leaveCircleWithAccount:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  id v7 = sub_10001267C("circleOps");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "leaveCircleWithAccount: Leaving circle by client request",  buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  BOOL v15 = sub_1001BA90C;
  id v16 = &unk_100292EF0;
  id v17 = v6;
  int v18 = a4;
  id v10 = v6;
  BOOL v11 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, a4, &v13);

  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2LL, v13, v14, v15, v16);
  return v11;
}

- (BOOL)leaveCircle:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  id v7 = sub_10001267C("circleOps");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Leaving circle by client request", buf, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  BOOL v15 = sub_1001BA900;
  id v16 = &unk_100292EF0;
  id v17 = v6;
  int v18 = a4;
  id v10 = v6;
  BOOL v11 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, a4, &v13);

  objc_msgSend(v10, "setBackup_key:", 0, v13, v14, v15, v16);
  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2LL);

  return v11;
}

- (BOOL)resetToOffering:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  -[SOSAccountTrustClassic purgeIdentity](self, "purgeIdentity");
  id v9 = sub_10001267C("resetToOffering");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Resetting circle to offering by request from client",  v13,  2u);
  }

  if (a4) {
    BOOL v11 = -[SOSAccountTrustClassic resetCircleToOffering:userKey:err:]( self,  "resetCircleToOffering:userKey:err:",  v8,  a4,  a5);
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)resetCircleToOffering:(id)a3 userKey:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 account]);
  if (-[SOSAccountTrustClassic hasCircle:](self, "hasCircle:", a5)
    && -[SOSAccountTrustClassic ensureFullPeerAvailable:err:](self, "ensureFullPeerAvailable:err:", v9, a5))
  {
    -[SOSAccountTrustClassic resetAllRings:err:](self, "resetAllRings:err:", v9, a5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "circle_transport"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001BA784;
    v20[3] = &unk_100292F18;
    uint64_t v22 = a4;
    uint64_t v23 = a5;
    v20[4] = self;
    id v11 = v9;
    id v21 = v11;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v10, a5, v20);

    sub_1001A164C(v11);
    AllCurrent = (const __CFSet *)SOSViewsGetAllCurrent(v12, v13, v14, v15, v16);
    sub_1001A1CD0(v8, AllCurrent);
    notify_post(kSOSCCCircleOctagonKeysChangedNotification);

    BOOL v18 = 1;
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)joinCircle:(id)a3 userKey:(__SecKey *)a4 useCloudPeer:(BOOL)a5 err:(__CFError *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 0;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1001BA570;
  id v31 = sub_1001BA580;
  id v32 = (id)0xAAAAAAAAAAAAAAAALL;
  id v32 = (id)objc_claimAutoreleasedReturnValue([v10 account]);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    if (-[SOSAccountTrustClassic ensureFullPeerAvailable:err:](self, "ensureFullPeerAvailable:err:", v28[5], a6))
    {
      if (SOSCircleCountPeers(-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
        && !sub_1001B2D9C((void *)v28[5]))
      {
        -[SOSAccountTrustClassic setValueInExpansion:value:err:]( self,  "setValueInExpansion:value:err:",  @"unsynced",  kCFBooleanTrue,  0LL);
        if (v7)
        {
          uint64_t v14 = SOSCircleCopyiCloudFullPeerInfoRef(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), 0LL);
          v34[3] = v14;
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "circle_transport"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_1001BA588;
        v25[3] = &unk_100292F68;
        void v25[4] = self;
        v25[5] = &v37;
        v25[8] = a6;
        v25[9] = a4;
        v25[6] = &v27;
        v25[7] = &v33;
        -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v15, a6, v25);

        if (v7 || (BOOL v16 = sub_1001A19D8((void *)v28[5], 2LL)))
        {
          AllCurrent = (const __CFSet *)SOSViewsGetAllCurrent(v16, v17, v18, v19, v20);
          sub_1001A1CD0(v10, AllCurrent);
        }
      }

      else
      {
        id v11 = sub_10001267C("resetToOffering");
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Resetting circle to offering since there are no peers",  buf,  2u);
        }

        unsigned __int8 v13 = -[SOSAccountTrustClassic resetCircleToOffering:userKey:err:]( self,  "resetCircleToOffering:userKey:err:",  v10,  a4,  a6);
        *((_BYTE *)v38 + 24) = v13;
      }
    }
  }

  else
  {
    SOSCreateErrorWithFormat(1032LL, 0LL, a6, 0LL, @"Don't have circle when joining???");
  }

  uint64_t v22 = (const void *)v34[3];
  if (v22)
  {
    v34[3] = 0LL;
    CFRelease(v22);
  }

  char v23 = *((_BYTE *)v38 + 24);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

- (BOOL)isLockedError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    else {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)updateFullPeerInfo:(id)a3 minimum:(__CFSet *)a4 excluded:(__CFSet *)a5
{
  id v8 = a3;
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle")
    && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    && SOSFullPeerInfoUpdateToCurrent(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, a5))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "circle_transport"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001DA494;
    v11[3] = &unk_100293E88;
    v11[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, 0LL, v11);
  }

  return 1;
}

- (__OpaqueSOSFullPeerInfo)getMyFullPeerInfo
{
  result = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (result) {
    return -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  }
  return result;
}

- (BOOL)fullPeerInfoVerify:(__SecKey *)a3 err:(__CFError *)a4
{
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")) {
    return 0;
  }
  PublicFromPrivate = (const void *)SecKeyCreatePublicFromPrivate(a3);
  char v8 = SOSPeerInfoApplicationVerify(-[SOSAccountTrust peerInfo](self, "peerInfo"), PublicFromPrivate, a4);
  if (PublicFromPrivate) {
    CFRelease(PublicFromPrivate);
  }
  return v8;
}

- (BOOL)hasFullPeerInfo:(__CFError *)a3
{
  BOOL v5 = -[SOSAccountTrustClassic hasCircle:](self, "hasCircle:");
  if (v5)
  {
    if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      SOSCreateErrorWithFormat(1032LL, 0LL, a3, 0LL, @"No peer for circle");
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (__OpaqueSOSFullPeerInfo)CopyAccountIdentityPeerInfo
{
  return (__OpaqueSOSFullPeerInfo *)SOSFullPeerInfoCopyFullPeerInfo(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"));
}

- (__SecKey)randomPermanentFullECKey:(int)a3 name:(id)a4 error:(__CFError *)a5
{
  return sub_10019B778( a3,  (uint64_t)a4,  (uint64_t)kSecAttrAccessibleWhenUnlockedThisDeviceOnly,  (uint64_t)kCFBooleanFalse,  a5);
}

- (BOOL)haveConfirmedOctagonKeys
{
  id v3 = (__SecKey *)SOSFullPeerInfoCopyOctagonPublicSigningKey( -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"),  0LL);
  if (-[SOSAccountTrust cachedOctagonSigningKey](self, "cachedOctagonSigningKey"))
  {
    id v4 = -[SOSAccountTrust cachedOctagonSigningKey](self, "cachedOctagonSigningKey");
    if (v3 && v4)
    {
      if (CFEqual(v3, v4))
      {
LABEL_5:
        char v5 = 1;
        goto LABEL_10;
      }
    }

    else if (v3 == v4)
    {
      goto LABEL_5;
    }
  }

  BOOL v6 = sub_10001267C("SecError");
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "circleChange: No extant octagon signing key",  buf,  2u);
  }

  char v5 = 0;
LABEL_10:
  char v8 = (__SecKey *)SOSFullPeerInfoCopyOctagonPublicEncryptionKey( -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"),  0LL);
  if (-[SOSAccountTrust cachedOctagonEncryptionKey](self, "cachedOctagonEncryptionKey"))
  {
    id v9 = -[SOSAccountTrust cachedOctagonEncryptionKey](self, "cachedOctagonEncryptionKey");
    if (v8 && v9)
    {
      if (CFEqual(v8, v9)) {
        goto LABEL_14;
      }
    }

    else if (v8 == v9)
    {
LABEL_14:
      char v10 = 1;
      if (!v3) {
        goto LABEL_21;
      }
LABEL_20:
      CFRelease(v3);
      goto LABEL_21;
    }
  }

  id v11 = sub_10001267C("SecError");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "circleChange: No extant octagon encryption key",  v14,  2u);
  }

  char v10 = 0;
  if (v3) {
    goto LABEL_20;
  }
LABEL_21:
  if (v8) {
    CFRelease(v8);
  }
  return v5 & v10;
}

- (void)ensureOctagonPeerKeys:(id)a3
{
  id v4 = a3;
  if (-[SOSAccountTrustClassic haveConfirmedOctagonKeys](self, "haveConfirmedOctagonKeys")) {
    goto LABEL_118;
  }
  CFErrorRef err = 0LL;
  char v5 = (__SecKey *)SOSFullPeerInfoCopyOctagonSigningKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), &err);
  if (err && !-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:"))
  {
    BOOL v6 = sub_10001267C("SecError");
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = err;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "circleChange: Error fetching Octagon signing key: %@",  buf,  0xCu);
    }
  }

  if (v5)
  {
    char v8 = sub_10001267C("circleChange");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Already have Octagon signing key", buf, 2u);
    }

    cachedOctagonSigningKey = self->super._cachedOctagonSigningKey;
    if (cachedOctagonSigningKey)
    {
      self->super._cachedOctagonSigningKey = 0LL;
      CFRelease(cachedOctagonSigningKey);
    }

    id v11 = SecKeyCopyPublicKey(v5);
    self->super._cachedOctagonSigningKey = v11;
    sub_1001D3FF8((uint64_t)v11, kSOSInternalAccessGroup);
LABEL_47:
    int v19 = 0;
    BOOL v16 = 0LL;
    goto LABEL_48;
  }

  if (!err) {
    goto LABEL_42;
  }
  CFErrorDomain Domain = CFErrorGetDomain(err);
  if (Domain && kCFErrorDomainOSStatus)
  {
    if (!CFEqual(Domain, kCFErrorDomainOSStatus)) {
      goto LABEL_20;
    }
  }

  else if (Domain != kCFErrorDomainOSStatus)
  {
    goto LABEL_20;
  }

  if (CFErrorGetCode(err) == -25300) {
    goto LABEL_32;
  }
LABEL_20:
  CFErrorDomain v13 = CFErrorGetDomain(err);
  if (kCFErrorDomainOSStatus && v13)
  {
    if (!CFEqual(v13, kCFErrorDomainOSStatus)) {
      goto LABEL_26;
    }
  }

  else if (v13 != kCFErrorDomainOSStatus)
  {
    goto LABEL_26;
  }

  if (CFErrorGetCode(err) == -26275) {
    goto LABEL_32;
  }
LABEL_26:
  uint64_t v14 = CFErrorGetDomain(err);
  if (!kCFErrorDomainOSStatus || !v14)
  {
    if (v14 == kCFErrorDomainOSStatus) {
      goto LABEL_31;
    }
LABEL_42:
    if (!-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:", err))
    {
      char v23 = sub_10001267C("SecError");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v62 = err;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "error is too scary, not creating new Octagon signing key: %@",  buf,  0xCu);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
      [v25 logResultForEvent:@"SOSCheckOctagonSigningKey" hardFailure:1 result:err];
    }

    char v5 = 0LL;
    goto LABEL_47;
  }

  if (!CFEqual(v14, kCFErrorDomainOSStatus)) {
    goto LABEL_42;
  }
LABEL_31:
  if (CFErrorGetCode(err) != -50) {
    goto LABEL_42;
  }
LABEL_32:
  uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Octagon Peer Signing ID for %@",  SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle")));
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  CFTypeRef cf = 0LL;
  uint64_t v17 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:]( self,  "randomPermanentFullECKey:name:error:",  384LL,  v16,  &cf);
  char v5 = v17;
  if (cf) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v17 == 0LL;
  }
  int v19 = !v18;
  if (v18)
  {
    id v38 = sub_10001267C("SecError");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_86;
    }
    *(_DWORD *)buf = 138412290;
    v62 = (void *)cf;
    uint64_t v22 = "circleChange: Error creating Octagon signing key: %@";
    goto LABEL_84;
  }

  SOSFullPeerInfoUpdateOctagonSigningKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), v17, &cf);
  if (cf)
  {
    uint64_t v20 = sub_10001267C("SecError");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_86;
    }
    *(_DWORD *)buf = 138412290;
    v62 = (void *)cf;
    uint64_t v22 = "circleChange: Error upgrading Octagon signing key: %@";
LABEL_84:
    uint64_t v39 = v21;
    uint32_t v40 = 12;
LABEL_85:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v22, buf, v40);
    goto LABEL_86;
  }

  v54 = sub_10001267C("circleChange");
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v22 = "Successfully created new Octagon signing key";
    uint64_t v39 = v21;
    uint32_t v40 = 2;
    goto LABEL_85;
  }

- (BOOL)ensureFullPeerAvailable:(id)a3 err:(__CFError *)a4
{
  id v6 = a3;
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    SOSCreateErrorWithFormat(1037LL, 0LL, a4, 0LL, @"Don't have circle");
    goto LABEL_64;
  }

  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    || (SOSFullPeerInfoPrivKeyExists(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")) & 1) == 0)
  {
    if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    {
      BOOL v7 = sub_10001267C("circleOps");
      char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "FullPeerInfo has no matching private key - resetting FPI and attendant keys",  (uint8_t *)&buf,  2u);
      }

      fulluint64_t PeerInfo = self->super.fullPeerInfo;
      if (fullPeerInfo)
      {
        self->super.fulluint64_t PeerInfo = 0LL;
        CFRelease(fullPeerInfo);
      }

      peerInfo = self->super.peerInfo;
      if (peerInfo)
      {
        self->super.peerInfo = 0LL;
        CFRelease(peerInfo);
      }

      cachedOctagonSigningKey = self->super._cachedOctagonSigningKey;
      if (cachedOctagonSigningKey)
      {
        self->super._cachedOctagonSigningKey = 0LL;
        CFRelease(cachedOctagonSigningKey);
      }

      cachedOctagonEncryptionKey = self->super._cachedOctagonEncryptionKey;
      if (cachedOctagonEncryptionKey)
      {
        self->super._cachedOctagonEncryptionKey = 0LL;
        CFRelease(cachedOctagonEncryptionKey);
      }
    }

    CFStringRef v53 = a4;
    uint64_t Name = SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 gestalt]);
    uint64_t v15 = SOSPeerGestaltGetName(v14);
    CFStringRef v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"ID for %@-%@", v15, Name);

    v54 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:]( self,  "randomPermanentFullECKey:name:error:",  256LL,  v16,  0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([@"Octagon Peer Signing " stringByAppendingString:v16]);
    if ([v6 octagonSigningFullKeyRef])
    {
      BOOL v18 = (__SecKey *)[v6 octagonSigningFullKeyRef];
      int v19 = v18;
      if (v18) {
        CFRetain(v18);
      }
    }

    else
    {
      int v19 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:]( self,  "randomPermanentFullECKey:name:error:",  384LL,  v17,  0LL);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue([@"Octagon Peer Encryption " stringByAppendingString:v16]);

    int v52 = (void *)v20;
    if ([v6 octagonEncryptionFullKeyRef])
    {
      id v21 = (__SecKey *)[v6 octagonEncryptionFullKeyRef];
      uint64_t v22 = v21;
      if (!v21)
      {
        BOOL v25 = 0;
        BOOL v23 = v54 != 0LL;
        BOOL v24 = v19 != 0LL;
        goto LABEL_50;
      }

      uint64_t v51 = Name;
      CFRetain(v21);
    }

    else
    {
      uint64_t v51 = Name;
      uint64_t v22 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:]( self,  "randomPermanentFullECKey:name:error:",  384LL,  v20,  0LL);
    }

    BOOL v23 = v54 != 0LL;
    BOOL v24 = v19 != 0LL;
    BOOL v25 = v22 != 0LL;
    if (v54 && v19 && v22)
    {
      BOOL v48 = v16;
      CFErrorRef v26 = (const __CFSet *)SOSViewCopyViewSet(2LL);
      CFErrorRef v27 = (const __CFSet *)SOSViewCopyViewSet(3LL);
      uint64_t v28 = SOSViewCopyViewSet(1LL);
      uint64_t v29 = (const __CFSet *)SOSViewCopyViewSet(5LL);
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      CFTypeRef v56 = sub_1001DA448;
      CFErrorRef v57 = &unk_100293EA8;
      CFTypeRef v49 = (CFTypeRef)v28;
      CFSetRef theSet = v27;
      int v58 = v27;
      id v30 = (const __CFSet *)v28;
      id v31 = v26;
      CFSetApplyFunction(v30, (CFSetApplierFunction)sub_1001DA450, &buf);
      CFIndex Count = CFSetGetCount(v26);
      if (!Count)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        CFTypeRef v56 = sub_1001DA448;
        CFErrorRef v57 = &unk_100293EA8;
        int v58 = v26;
        CFSetApplyFunction(v27, (CFSetApplierFunction)sub_1001DA450, &buf);
      }

      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      CFTypeRef v56 = sub_1001DA448;
      CFErrorRef v57 = &unk_100293EA8;
      int v58 = v26;
      CFTypeRef cf = v29;
      CFSetApplyFunction(v29, (CFSetApplierFunction)sub_1001DA450, &buf);
      -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", 0LL);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 gestalt]);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backup_key"));
      uint64_t v34 = (const void *)SOSFullPeerInfoCreateWithViews(kCFAllocatorDefault, v51, v32, v33, v26, v54, v19, v22, v53);

      -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", v34);
      CFErrorDomain v35 = (const void *)SOSFullPeerInfoCopyPubKey(v34, 0LL);
      [v6 setPeerPublicKey:v35];
      if (v35) {
        CFRelease(v35);
      }
      CFStringRef v16 = v48;
      if (![v6 peerPublicKey])
      {
        CFErrorDomain v36 = sub_10001267C("circleOp");
        CFErrorDomain v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Failed to copy peer public key for account object",  (uint8_t *)&buf,  2u);
        }
      }

      if (v34) {
        CFRelease(v34);
      }
      id v38 = -[SOSAccountTrustClassic getValueFromExpansion:err:]( self,  "getValueFromExpansion:err:",  @"v2dictionary",  0LL);
      uint64_t v39 = v52;
      if (v38) {
        SOSFullPeerInfoUpdateV2Dictionary(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), v38, 0LL);
      }
      if (Count)
      {
        -[SOSAccountTrustClassic pendEnableViewSet:](self, "pendEnableViewSet:", theSet);
        -[SOSAccountTrustClassic setValueInExpansion:value:err:]( self,  "setValueInExpansion:value:err:",  @"unsynced",  kCFBooleanTrue,  0LL);
      }

      if (v31) {
        CFRelease(v31);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (theSet) {
        CFRelease(theSet);
      }
      if (v49) {
        CFRelease(v49);
      }
      CFRelease(v54);
      CFRelease(v19);
      goto LABEL_60;
    }

- (BOOL)isMyPeerActive:(__CFError *)a3
{
  char v5 = -[SOSAccountTrust peerInfo](self, "peerInfo");
  if (v5) {
    LOBYTE(v5) = SOSCircleHasActivePeer( -[SOSAccountTrust trustedCircle](self, "trustedCircle"),  -[SOSAccountTrust peerInfo](self, "peerInfo"),  a3);
  }
  return (char)v5;
}

- (void)purgeIdentity
{
  if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    CFTypeRef cf = 0LL;
    if ((SOSFullPeerInfoPurgePersistentKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), &cf) & 1) == 0)
    {
      id v3 = sub_10001267C("SecWarning");
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        char v5 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
        *(_DWORD *)__int128 buf = 138412546;
        id v9 = v5;
        __int16 v10 = 2112;
        CFTypeRef v11 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Couldn't purge persistent keys for %@ [%@]",  buf,  0x16u);
      }
    }

    CFTypeRef v6 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v6);
    }

    -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", 0LL);
  }

@end