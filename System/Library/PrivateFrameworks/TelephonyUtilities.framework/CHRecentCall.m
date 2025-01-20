@interface CHRecentCall
+ (id)predicateForFilteringOutFaceTimeAudioCalls;
+ (id)recentCallJunkIdentificationCategoryString:(int64_t)a3;
+ (int64_t)toCHEmergencyMediaType:(int64_t)a3;
- (CHRecentCall)initWithConversation:(id)a3 startDate:(id)a4 avMode:(unint64_t)a5;
- (id)initWithCall:(id)a3;
- (id)provider;
@end

@implementation CHRecentCall

- (id)initWithCall:(id)a3
{
  id v5 = a3;
  v6 = -[CHRecentCall init](self, "init");

  if (!v6) {
    goto LABEL_108;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 callHistoryIdentifier]);

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"This call's call history identifier is nil"));
    NSLog(@"** TUAssertion failure: %@", v8);

    if (_TUAssertShouldCrashApplication())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 callHistoryIdentifier]);

      if (!v9)
      {
        v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v119 handleFailureInMethod:a2 object:v6 file:@"CHRecentCall_CSD.m" lineNumber:40 description:@"This call's call history identifier is nil"];
      }
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localSenderIdentityAccountUUID]);
  -[CHRecentCall setLocalParticipantUUID:](v6, "setLocalParticipantUUID:", v10);

  id v121 = v5;
  id v11 = v5;
  v12 = &OBJC_CLASS___IDSMessageContext_ptr;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteParticipantHandles]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v13 count]));

  id v15 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteParticipantHandles]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 callCenter]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activeConversationForCall:v15 backedByGroupSession:1]);

  v122 = v15;
  if (v18)
  {
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 mergedRemoteMembers]);
    id v22 = [v21 countByEnumeratingWithState:&v128 objects:v133 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v129;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v129 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v128 + 1) + 8 * (void)i) handle]);
          [v20 addObject:v26];
        }

        id v23 = [v21 countByEnumeratingWithState:&v128 objects:v133 count:16];
      }

      while (v23);
    }

    if ([v20 count])
    {
      id v27 = [v20 copy];

      v16 = v27;
    }

    v6 = v19;
    v12 = &OBJC_CLASS___IDSMessageContext_ptr;

    id v15 = v122;
  }

  else
  {
    uint64_t v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bs_filter:", &stru_1003DA4C0));

    v16 = (void *)v28;
  }

  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  id v29 = v16;
  id v30 = [v29 countByEnumeratingWithState:&v128 objects:v133 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v129;
    do
    {
      for (j = 0LL; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v129 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[CHHandle handleWithTUHandle:]( &OBJC_CLASS___CHHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v128 + 1) + 8LL * (void)j)));
        [v14 addObject:v34];
      }

      id v31 = [v29 countByEnumeratingWithState:&v128 objects:v133 count:16];
    }

    while (v31);
  }

  id v35 = [v14 copy];
  -[CHRecentCall setRemoteParticipantHandles:](v6, "setRemoteParticipantHandles:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue([v15 initiator]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[CHHandle handleWithTUHandle:](&OBJC_CLASS___CHHandle, "handleWithTUHandle:", v36));
  v120 = v6;
  -[CHRecentCall setInitiator:](v6, "setInitiator:", v37);

  id v38 = objc_alloc((Class)v12[47]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v15 emergencyMediaItems]);
  id v123 = objc_msgSend(v38, "initWithCapacity:", objc_msgSend(v39, "count"));

  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  v40 = (void *)objc_claimAutoreleasedReturnValue([v15 emergencyMediaItems]);
  id v41 = [v40 countByEnumeratingWithState:&v124 objects:v132 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v125;
    do
    {
      for (k = 0LL; k != v42; k = (char *)k + 1)
      {
        if (*(void *)v125 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)k);
        id v46 = objc_alloc(&OBJC_CLASS___CHEmergencyMediaItem);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v45 assetId]);
        id v48 = objc_msgSend( v46,  "initWithAssetId:mediaType:",  v47,  +[CHRecentCall toCHEmergencyMediaType:]( CHRecentCall,  "toCHEmergencyMediaType:",  objc_msgSend(v45, "emergencyMediaType")));

        [v123 addObject:v48];
      }

      id v42 = [v40 countByEnumeratingWithState:&v124 objects:v132 count:16];
    }

    while (v42);
  }

  v6 = v120;
  -[CHRecentCall setEmergencyMediaItems:](v120, "setEmergencyMediaItems:", v123);
  -[CHRecentCall setUsedEmergencyVideoStreaming:]( v120,  "setUsedEmergencyVideoStreaming:",  [v122 hasEmergencyVideoStream]);
  -[CHRecentCall setWasEmergencyCall:](v120, "setWasEmergencyCall:", [v122 isEmergency]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v122 handle]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 value]);
  -[CHRecentCall setCallerId:](v120, "setCallerId:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue([v122 handle]);
  -[CHRecentCall setHandleType:]( v120,  "setHandleType:",  +[CHHandle handleTypeForTUHandle:](&OBJC_CLASS___CHHandle, "handleTypeForTUHandle:", v51));

  if ([v122 isJunk])
  {
    -[CHRecentCall setName:](v120, "setName:", 0LL);
  }

  else
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v122 callerNameFromNetwork]);
    -[CHRecentCall setName:](v120, "setName:", v52);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v122 callDirectoryName]);

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue([v122 callDirectoryName]);
    -[CHRecentCall setName:](v120, "setName:", v54);
  }

  uint64_t v55 = objc_claimAutoreleasedReturnValue([v122 imageURL]);
  if (v55)
  {
    v56 = (void *)v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue([v122 callDirectoryName]);

    if (!v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/stock",  0LL));
      -[CHRecentCall setImageURL:](v120, "setImageURL:", v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue([v122 companyName]);
      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue([v122 companyName]);
        -[CHRecentCall setName:](v120, "setName:", v60);
      }
    }
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue([v122 callHistoryIdentifier]);
  -[CHRecentCall setUniqueId:](v120, "setUniqueId:", v61);

  v62 = (void *)objc_claimAutoreleasedReturnValue([v122 isoCountryCode]);
  -[CHRecentCall setIsoCountryCode:](v120, "setIsoCountryCode:", v62);

  [v122 callDuration];
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v63));
  -[CHRecentCall setDate:](v120, "setDate:", v64);

  unsigned __int8 v65 = [v122 isScreening];
  double v66 = 0.0;
  if ((v65 & 1) == 0) {
    objc_msgSend(v122, "callDuration", 0.0);
  }
  -[CHRecentCall setDuration:](v120, "setDuration:", v66);
  id v67 = v122;
  if ([v67 isVideo])
  {
    uint64_t v68 = 2LL;
  }

  else if ([v67 isThirdPartyVideo])
  {
    uint64_t v68 = 2LL;
  }

  else
  {
    uint64_t v68 = 1LL;
  }

  -[CHRecentCall setMediaType:](v120, "setMediaType:", v68);
  unsigned int v69 = [v67 ttyType];
  if (v69 == 1) {
    uint64_t v70 = 1LL;
  }
  else {
    uint64_t v70 = 2LL * (v69 == 2);
  }
  -[CHRecentCall setTtyType:](v120, "setTtyType:", v70);
  id v71 = v67;
  v72 = (void *)objc_claimAutoreleasedReturnValue([v71 provider]);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v72 identifier]);

  v74 = (void *)objc_claimAutoreleasedReturnValue([v71 provider]);
  unsigned __int8 v75 = [v74 isTelephonyProvider];

  if ((v75 & 1) != 0)
  {
    v76 = (id *)&kCHServiceProviderTelephony;
  }

  else
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue([v71 provider]);
    unsigned int v78 = [v77 isFaceTimeProvider];

    if (!v78) {
      goto LABEL_56;
    }
    v76 = (id *)&kCHServiceProviderFaceTime;
  }

  id v79 = *v76;

  v73 = v79;
LABEL_56:

  -[CHRecentCall setServiceProvider:](v120, "setServiceProvider:", v73);
  if ((uint64_t)[v71 bytesOfDataUsed] >= 1)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v71 bytesOfDataUsed]));
    -[CHRecentCall setBytesOfDataUsed:](v120, "setBytesOfDataUsed:", v80);
  }

  else {
    unsigned int v81 = 1;
  }
  if ([v71 disconnectedReason] == 1
    || ([v71 wasDeclined] & 1) != 0)
  {
    uint64_t v82 = 1LL;
  }

  else
  {
    uint64_t v82 = (uint64_t)[v71 isOutgoing];
    if ((v82 & 1) == 0 && ((v81 ^ 1) & 1) == 0)
    {
      objc_msgSend(v71, "callDuration", v82);
      uint64_t v82 = v88 > 0.0;
    }
  }

  -[CHRecentCall setRead:](v120, "setRead:", v82);
  id v83 = [v71 verificationStatus];
  id v84 = v71;
  if ([v84 isOutgoing])
  {
    [v84 callDuration];
    if (v85 <= 0.0) {
      v86 = (unsigned int *)&kCHCallStatusCancelled;
    }
    else {
      v86 = (unsigned int *)&kCHCallStatusConnectedOutgoing;
    }
  }

  else
  {
    v86 = (unsigned int *)&kCHCallStatusMissed;
    if (([v84 isScreening] & 1) == 0)
    {
      [v84 callDuration];
      if (v87 <= 0.0)
      {
      }

      else
      {
        v86 = (unsigned int *)&kCHCallStatusConnectedIncoming;
      }
    }
  }

  uint64_t v89 = *v86;

  -[CHRecentCall setCallStatus:](v120, "setCallStatus:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (int)[v84 disconnectedReason]));
  -[CHRecentCall setDisconnectedCause:](v120, "setDisconnectedCause:", v90);

  id v5 = v121;
  if (([v84 isScreening] & 1) != 0
    || ([v84 wasScreened] & 1) == 0)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue([v84 blockedByExtension]);

    if (v91)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue([v84 blockedByExtension]);
      -[CHRecentCall setBlockedByExtension:](v120, "setBlockedByExtension:", v92);

      v93 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall blockedByExtension](v120, "blockedByExtension"));
      v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionWithIdentifier:error:]( &OBJC_CLASS___NSExtension,  "extensionWithIdentifier:error:",  v93,  0LL));

      if (v94)
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue([v94 _plugIn]);
        v96 = (void *)objc_claimAutoreleasedReturnValue([v95 localizedContainingName]);
        -[CHRecentCall setBlockedByExtensionName:](v120, "setBlockedByExtensionName:", v96);
      }

      else
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall blockedByExtension](v120, "blockedByExtension"));
        -[CHRecentCall setBlockedByExtensionName:](v120, "setBlockedByExtensionName:", v95);
      }
    }

    v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (int)[v84 filteredOutReason]));
    -[CHRecentCall setFilteredOutReason:](v120, "setFilteredOutReason:", v97);
  }

  if ([v84 isBlocked])
  {
    -[CHRecentCall setCallerIdAvailability:](v120, "setCallerIdAvailability:", 1LL);
  }

  else
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue([v84 handle]);
    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 value]);
    -[CHRecentCall setCallerIdAvailability:]( v120,  "setCallerIdAvailability:",  2 * ([v99 length] == 0));
  }

  id v100 = v84;
  if ([v100 isJunk])
  {
    v101 = (char *)[v100 junkConfidence];
    else {
      v102 = v101;
    }
  }

  else
  {
    v102 = 0LL;
  }

  -[CHRecentCall setJunkConfidence:](v120, "setJunkConfidence:", v102);
  if ([v100 isJunk])
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue( +[CHRecentCall recentCallJunkIdentificationCategoryString:]( CHRecentCall,  "recentCallJunkIdentificationCategoryString:",  [v100 identificationCategory]));
    -[CHRecentCall setJunkIdentificationCategory:](v120, "setJunkIdentificationCategory:", v103);
  }

  else
  {
    -[CHRecentCall setJunkIdentificationCategory:](v120, "setJunkIdentificationCategory:", 0LL);
  }

  v104 = (void *)objc_claimAutoreleasedReturnValue([v100 conversationID]);
  -[CHRecentCall setConversationID:](v120, "setConversationID:", v104);

  id v105 = [v100 callDirectoryIdentityType];
  if (v105 == (id)2) {
    uint64_t v106 = 2LL;
  }
  else {
    uint64_t v106 = v105 == (id)1;
  }
  -[CHRecentCall setCallDirectoryIdentityType:](v120, "setCallDirectoryIdentityType:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue([v100 callDirectoryIdentityExtension]);
  -[CHRecentCall setIdentityExtension:](v120, "setIdentityExtension:", v107);

  v108 = (void *)objc_claimAutoreleasedReturnValue([v100 dateConnected]);
  if (v108)
  {
    uint64_t v109 = objc_claimAutoreleasedReturnValue([v100 dateConnected]);
LABEL_104:
    v111 = (void *)v109;
    v112 = (void *)objc_claimAutoreleasedReturnValue([v100 dateCreated]);
    [v111 timeIntervalSinceDate:v112];
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[CHRecentCall setTimeToEstablish:](v120, "setTimeToEstablish:", v113);

    goto LABEL_105;
  }

  v110 = (void *)objc_claimAutoreleasedReturnValue([v100 dateEnded]);

  if (v110)
  {
    uint64_t v109 = objc_claimAutoreleasedReturnValue([v100 dateEnded]);
    goto LABEL_104;
  }

- (CHRecentCall)initWithConversation:(id)a3 startDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = -[CHRecentCall init](self, "init");
  if (v10)
  {
    id v33 = v9;
    id v34 = v8;
    id v11 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteMembers]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v12 count]));

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 mergedRemoteMembers]);
    id v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) handle]);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[CHHandle handleWithTUHandle:](&OBJC_CLASS___CHHandle, "handleWithTUHandle:", v19));
          [v13 addObject:v20];
        }

        id v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v16);
    }

    id v21 = [v13 copy];
    -[CHRecentCall setRemoteParticipantHandles:](v10, "setRemoteParticipantHandles:", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 initiator]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[CHHandle handleWithTUHandle:](&OBJC_CLASS___CHHandle, "handleWithTUHandle:", v22));
    -[CHRecentCall setInitiator:](v10, "setInitiator:", v23);

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    -[CHRecentCall setUniqueId:](v10, "setUniqueId:", v25);

    id v9 = v33;
    -[CHRecentCall setDate:](v10, "setDate:", v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v26 timeIntervalSinceDate:v33];
    -[CHRecentCall setDuration:](v10, "setDuration:");

    -[CHRecentCall setTtyType:](v10, "setTtyType:", 0LL);
    -[CHRecentCall setServiceProvider:](v10, "setServiceProvider:", kCHServiceProviderFaceTime);
    if (a5 == 1) {
      uint64_t v27 = 1LL;
    }
    else {
      uint64_t v27 = 2LL;
    }
    -[CHRecentCall setMediaType:](v10, "setMediaType:", v27);
    -[CHRecentCall setRead:](v10, "setRead:", 1LL);
    -[CHRecentCall setVerificationStatus:](v10, "setVerificationStatus:", 0LL);
    -[CHRecentCall setCallStatus:](v10, "setCallStatus:", kCHCallStatusConnectedOutgoing);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    -[CHRecentCall setDisconnectedCause:](v10, "setDisconnectedCause:", v28);

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    -[CHRecentCall setFilteredOutReason:](v10, "setFilteredOutReason:", v29);

    -[CHRecentCall setJunkConfidence:](v10, "setJunkConfidence:", 0LL);
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[CHRecentCall recentCallJunkIdentificationCategoryString:]( &OBJC_CLASS___CHRecentCall,  "recentCallJunkIdentificationCategoryString:",  0LL));
    -[CHRecentCall setJunkIdentificationCategory:](v10, "setJunkIdentificationCategory:", v30);

    id v31 = (void *)objc_claimAutoreleasedReturnValue([v11 groupUUID]);
    -[CHRecentCall setParticipantGroupUUID:](v10, "setParticipantGroupUUID:", v31);

    -[CHRecentCall setScreenSharingType:]( v10,  "setScreenSharingType:",  (unint64_t)[v11 screenSharingType] & 3);
    id v8 = v34;
  }

  return v10;
}

- (id)provider
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 providerManager]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 providerForRecentCall:self]);

  return v5;
}

+ (id)predicateForFilteringOutFaceTimeAudioCalls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  kCHCallCategoryAudio));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"!(call_category == %@ && service_provider == %@)",  v2,  kCHServiceProviderFaceTime));

  return v3;
}

+ (int64_t)toCHEmergencyMediaType:(int64_t)a3
{
  return a3 != 0;
}

+ (id)recentCallJunkIdentificationCategoryString:(int64_t)a3
{
  else {
    return off_1003DA4E0[a3 - 1];
  }
}

@end