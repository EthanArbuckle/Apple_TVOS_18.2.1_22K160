@interface CXCallUpdate
- (BOOL)isRemoteMomentsAvailable;
- (CXCallUpdate)initWithDialRequest:(id)a3;
- (CXCallUpdate)initWithFaceTimeIDSChat:(id)a3;
- (CXCallUpdate)initWithIDSChat:(id)a3;
- (CXCallUpdate)initWithIMAVChat:(id)a3;
- (CXCallUpdate)initWithJoinConversationRequest:(id)a3;
- (CXCallUpdate)initWithStartCallAction:(id)a3;
- (CXCallUpdate)initWithTUConversation:(id)a3;
- (CXCallUpdate)sanitizedCallUpdate;
- (NSNumber)handoffRecipientParticipant;
- (NSString)localizedHandoffRecipientDeviceCategory;
- (NSString)remoteIDSDestination;
- (NSUUID)conversationID;
- (TUMediaTokens)tuMediaTokens;
- (id)tuCallUpdateWithProvider:(id)a3 withCallUUID:(id)a4;
- (int64_t)faceTimeTransportType;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (unint64_t)initialLinkType;
- (void)setConversationID:(id)a3;
- (void)setFaceTimeTransportType:(int64_t)a3;
- (void)setHandoffRecipientParticipant:(id)a3;
- (void)setInitialLinkType:(unint64_t)a3;
- (void)setInputAudioPowerSpectrumToken:(int64_t)a3;
- (void)setLocalizedHandoffRecipientDeviceCategory:(id)a3;
- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3;
- (void)setRemoteIDSDestination:(id)a3;
- (void)setRemoteMomentsAvailable:(BOOL)a3;
- (void)updatePropertiesForVideo:(BOOL)a3;
@end

@implementation CXCallUpdate

- (CXCallUpdate)initWithFaceTimeIDSChat:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate initWithIDSChat:](self, "initWithIDSChat:", v4);
  v6 = v5;
  if (v5)
  {
    -[CXCallUpdate setFaceTimeTransportType:](v5, "setFaceTimeTransportType:", 2LL);
    -[CXCallUpdate setRemoteMomentsAvailable:]( v6,  "setRemoteMomentsAvailable:",  [v4 isRemoteMomentsAvailable]);
    -[CXCallUpdate setShouldSuppressInCallUI:]( v6,  "setShouldSuppressInCallUI:",  [v4 shouldSuppressInCallUI]);
    -[CXCallUpdate setSupportsScreening:](v6, "setSupportsScreening:", 0LL);
  }

  return v6;
}

- (CXCallUpdate)initWithIMAVChat:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___CXHandle);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 otherIMHandle]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ID]);
    v9 = -[CXHandle initWithDestinationID:](v6, "initWithDestinationID:", v8);
    -[CXCallUpdate setRemoteHandle:](v5, "setRemoteHandle:", v9);

    -[CXCallUpdate setSupportsHolding:](v5, "setSupportsHolding:", [v4 isVideo] ^ 1);
    -[CXCallUpdate setSupportsGrouping:](v5, "setSupportsGrouping:", 0LL);
    -[CXCallUpdate setSupportsUngrouping:](v5, "setSupportsUngrouping:", 0LL);
    -[CXCallUpdate setSupportsDTMF:](v5, "setSupportsDTMF:", 0LL);
    -[CXCallUpdate setSupportsScreening:](v5, "setSupportsScreening:", 0LL);
    -[CXCallUpdate setRequiresInCallSounds:](v5, "setRequiresInCallSounds:", 1LL);
    id v10 = sub_10001A848(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[CXCallUpdate setCrossDeviceIdentifier:](v5, "setCrossDeviceIdentifier:", v11);

    -[CXCallUpdate setAudioInterruptionProvider:](v5, "setAudioInterruptionProvider:", 1LL);
    else {
      uint64_t v12 = 3LL;
    }
    -[CXCallUpdate setAudioInterruptionOperationMode:](v5, "setAudioInterruptionOperationMode:", v12);
    if (!qword_10044CE30)
    {
      v13 = (void **)CUTWeakLinkSymbol("kMXSessionAudioCategory_PlayAndRecord_NoBluetooth", @"MediaExperience");
      if (v13) {
        v14 = *v13;
      }
      else {
        v14 = 0LL;
      }
      objc_storeStrong((id *)&qword_10044CE30, v14);
    }

    -[CXCallUpdate setAudioCategory:](v5, "setAudioCategory:");
    -[CXCallUpdate updatePropertiesForVideo:](v5, "updatePropertiesForVideo:", [v4 isVideo]);
  }

  return v5;
}

- (CXCallUpdate)initWithTUConversation:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");
  if (!v5) {
    goto LABEL_90;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
  id v8 = [v7 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v99;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v99 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v98 + 1) + 8 * (void)i) handle]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v12));
        [v6 addObject:v13];
      }

      id v9 = [v7 countByEnumeratingWithState:&v98 objects:v107 count:16];
    }

    while (v9);
  }

  -[CXCallUpdate setRemoteParticipantHandles:](v5, "setRemoteParticipantHandles:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
  -[CXCallUpdate setLocalMemberHandleValue:](v5, "setLocalMemberHandleValue:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate remoteParticipantHandles](v5, "remoteParticipantHandles"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 anyObject]);
  -[CXCallUpdate setRemoteHandle:](v5, "setRemoteHandle:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 initiator]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v19));
  -[CXCallUpdate setInitiator:](v5, "setInitiator:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 groupUUID]);
  -[CXCallUpdate setParticipantGroupUUID:](v5, "setParticipantGroupUUID:", v21);

  -[CXCallUpdate setSupportsGrouping:](v5, "setSupportsGrouping:", 0LL);
  -[CXCallUpdate setSupportsUngrouping:](v5, "setSupportsUngrouping:", 0LL);
  -[CXCallUpdate setSupportsDTMF:](v5, "setSupportsDTMF:", 0LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
  id v23 = [v22 count];
  BOOL v24 = 0LL;
  if (v23 == (id)1) {
    BOOL v24 = objc_msgSend(v4, "avMode", 0) != (id)2;
  }
  -[CXCallUpdate setSupportsHolding:](v5, "setSupportsHolding:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 localScreenSharingRequest]);
  v26 = v25;
  if (v25)
  {
    if ([v25 type] == (id)2) {
      uint64_t v27 = 1LL;
    }
    else {
      uint64_t v27 = 2LL;
    }
    -[CXCallUpdate setScreenSharingIntention:](v5, "setScreenSharingIntention:", v27);
  }

  if ((unint64_t)[v6 count] > 1 || objc_msgSend(v4, "avMode") == (id)2)
  {
    -[CXCallUpdate setSupportsScreening:](v5, "setSupportsScreening:", 0LL);
  }

  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 screenSharingRequests]);
    -[CXCallUpdate setSupportsScreening:](v5, "setSupportsScreening:", [v28 count] == 0);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  -[CXCallUpdate setMutuallyExclusiveCall:]( v5,  "setMutuallyExclusiveCall:",  [v29 isDefaultProvider] ^ 1);

  if (![v4 isLocallyCreated]
    || ![v4 isOneToOneModeEnabled]
    || [v4 state] == (id)3)
  {
    -[CXCallUpdate setConversation:](v5, "setConversation:", 1LL);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  if ([v30 isDefaultProvider])
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);
    -[CXCallUpdate setRequiresInCallSounds:]( v5,  "setRequiresInCallSounds:",  [v31 isLightweightMember] ^ 1);
  }

  else
  {
    -[CXCallUpdate setRequiresInCallSounds:](v5, "setRequiresInCallSounds:", 0LL);
  }

  -[CXCallUpdate setAudioInterruptionProvider:](v5, "setAudioInterruptionProvider:", 1LL);
  -[CXCallUpdate setAudioInterruptionOperationMode:](v5, "setAudioInterruptionOperationMode:", 2LL);
  if (!qword_10044CE38)
  {
    v32 = (void **)CUTWeakLinkSymbol("kMXSessionAudioCategory_PlayAndRecord_NoBluetooth", @"MediaExperience");
    if (v32) {
      v33 = *v32;
    }
    else {
      v33 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044CE38, v33);
  }

  -[CXCallUpdate setAudioCategory:](v5, "setAudioCategory:");
  if ([v4 avMode])
  {
    -[CXCallUpdate updatePropertiesForVideo:](v5, "updatePropertiesForVideo:", [v4 avMode] == (id)2);
  }

  else
  {
    id v34 = sub_1001704C4();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
      *(_DWORD *)buf = 138412290;
      v106 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Not setting video properties for conversation UUID: %@ because we're in AVLess",  buf,  0xCu);
    }
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v4 activeRemoteParticipants]);
  id v38 = [v37 countByEnumeratingWithState:&v94 objects:v104 count:16];
  v80 = v26;
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v95;
    while (2)
    {
      for (j = 0LL; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v95 != v40) {
          objc_enumerationMutation(v37);
        }
        if ([*(id *)(*((void *)&v94 + 1) + 8 * (void)j) isScreenEnabled])
        {
          char v42 = 1;
          goto LABEL_47;
        }
      }

      id v39 = [v37 countByEnumeratingWithState:&v94 objects:v104 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }

  char v42 = 0;
LABEL_47:

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CPAudioRoutePolicyManager sharedInstance](&OBJC_CLASS___CPAudioRoutePolicyManager, "sharedInstance"));
  unsigned int v44 = [v43 sharePlaySupported];

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v4 activitySessions]);
  id v46 = [v45 countByEnumeratingWithState:&v90 objects:v103 count:16];
  v81 = v6;
  if (v46)
  {
    id v47 = v46;
    LOBYTE(v48) = 0;
    uint64_t v49 = *(void *)v91;
    char v84 = v42;
    unsigned int v82 = v44;
    while (2)
    {
      id v50 = v4;
      for (k = 0LL; k != v47; k = (char *)k + 1)
      {
        if (*(void *)v91 != v49) {
          objc_enumerationMutation(v45);
        }
        v52 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)k);
        if ((v48 & 1) != 0) {
          uint64_t v48 = 1LL;
        }
        else {
          uint64_t v48 = (uint64_t)[*(id *)(*((void *)&v90 + 1) + 8 * (void)k) isUsingAirplay];
        }
        id v53 = [v52 state];
        BOOL v54 = v53 != (id)4;
        if (v53 == (id)4) {
          goto LABEL_67;
        }
        if ([v52 state] == (id)1)
        {
          if ((v48 & 1) != 0)
          {
            BOOL v54 = 1;
LABEL_67:
            uint64_t v48 = 1LL;
          }

          else
          {
            uint64_t v48 = (uint64_t)[v52 isUsingAirplay];
            BOOL v54 = 1;
          }

- (int64_t)faceTimeTransportType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:TUCallFaceTimeTransportTypeKey]);

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (void)setFaceTimeTransportType:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v8 = [v6 mutableCopy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v8 setObject:v7 forKeyedSubscript:TUCallFaceTimeTransportTypeKey];

  -[CXCallUpdate setContext:](self, "setContext:", v8);
}

- (BOOL)isRemoteMomentsAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:TUCallFaceTimeRemoteMomentsAvailableKey]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setRemoteMomentsAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v8 = [v6 mutableCopy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v8 setObject:v7 forKeyedSubscript:TUCallFaceTimeRemoteMomentsAvailableKey];

  -[CXCallUpdate setContext:](self, "setContext:", v8);
}

- (NSString)localizedHandoffRecipientDeviceCategory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);

  return (NSString *)v4;
}

- (void)setLocalizedHandoffRecipientDeviceCategory:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v7 = [v6 mutableCopy];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  [v7 setObject:v4 forKeyedSubscript:TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey];
  -[CXCallUpdate setContext:](self, "setContext:", v7);
}

- (NSNumber)handoffRecipientParticipant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:TUCallFaceTimeHandoffRecipientParticipantKey]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 numberValue]);

  return (NSNumber *)v4;
}

- (void)setHandoffRecipientParticipant:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v7 = [v6 mutableCopy];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  [v7 setObject:v4 forKeyedSubscript:TUCallFaceTimeHandoffRecipientParticipantKey];
  -[CXCallUpdate setContext:](self, "setContext:", v7);
}

- (void)updatePropertiesForVideo:(BOOL)a3
{
  if (!qword_10044CE40)
  {
    id v4 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_VoiceChat", @"MediaExperience");
    if (v4) {
      v5 = *v4;
    }
    else {
      v5 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044CE40, v5);
  }

  if (!qword_10044CE48)
  {
    v6 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_VideoChat", @"MediaExperience");
    if (v6) {
      id v7 = *v6;
    }
    else {
      id v7 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044CE48, v7);
  }

  unsigned int v8 = -[CXCallUpdate hasVideo](self, "hasVideo");
  id v9 = &qword_10044CE48;
  if (!v8) {
    id v9 = &qword_10044CE40;
  }
  -[CXCallUpdate setAudioMode:](self, "setAudioMode:", *v9);
}

- (void)setConversationID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v7 = [v6 mutableCopy];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  [v7 setObject:v4 forKeyedSubscript:@"conversationID"];
  -[CXCallUpdate setContext:](self, "setContext:", v7);
}

- (NSUUID)conversationID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"conversationID"]);
  }

  else
  {
    v5 = 0LL;
  }

  return (NSUUID *)v5;
}

- (CXCallUpdate)initWithIDSChat:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v6));
    -[CXCallUpdate setRemoteHandle:](v5, "setRemoteHandle:", v7);

    -[CXCallUpdate setHasVideo:](v5, "setHasVideo:", [v4 isVideo]);
    -[CXCallUpdate setSupportsHolding:](v5, "setSupportsHolding:", [v4 isVideo] ^ 1);
    -[CXCallUpdate setSupportsGrouping:](v5, "setSupportsGrouping:", 0LL);
    -[CXCallUpdate setSupportsUngrouping:](v5, "setSupportsUngrouping:", 0LL);
    -[CXCallUpdate setSupportsDTMF:](v5, "setSupportsDTMF:", 0LL);
    -[CXCallUpdate setRequiresInCallSounds:](v5, "setRequiresInCallSounds:", 1LL);
    -[CXCallUpdate setRemoteUplinkMuted:](v5, "setRemoteUplinkMuted:", [v4 isRemoteUplinkMuted]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 crossDeviceIdentifier]);
    -[CXCallUpdate setCrossDeviceIdentifier:](v5, "setCrossDeviceIdentifier:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteFromID]);
    -[CXCallUpdate setRemoteIDSDestination:](v5, "setRemoteIDSDestination:", v9);

    -[CXCallUpdate setInitialLinkType:](v5, "setInitialLinkType:", [v4 initialLinkType]);
    -[CXCallUpdate setInputAudioPowerSpectrumToken:]( v5,  "setInputAudioPowerSpectrumToken:",  [v4 inputAudioPowerSpectrumToken]);
    -[CXCallUpdate setOutputAudioPowerSpectrumToken:]( v5,  "setOutputAudioPowerSpectrumToken:",  [v4 outputAudioPowerSpectrumToken]);
    -[CXCallUpdate setAudioInterruptionProvider:](v5, "setAudioInterruptionProvider:", 1LL);
    else {
      uint64_t v10 = 3LL;
    }
    -[CXCallUpdate setAudioInterruptionOperationMode:](v5, "setAudioInterruptionOperationMode:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    -[CXCallUpdate setLocalSenderIdentityUUID:](v5, "setLocalSenderIdentityUUID:", v11);

    if (!qword_10044CF48)
    {
      uint64_t v12 = (void **)CUTWeakLinkSymbol("kMXSessionAudioCategory_PlayAndRecord_NoBluetooth", @"MediaExperience");
      if (v12) {
        v13 = *v12;
      }
      else {
        v13 = 0LL;
      }
      objc_storeStrong((id *)&qword_10044CF48, v13);
    }

    -[CXCallUpdate setAudioCategory:](v5, "setAudioCategory:");
    if (!qword_10044CF50)
    {
      v14 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_VoiceChat", @"MediaExperience");
      if (v14) {
        v15 = *v14;
      }
      else {
        v15 = 0LL;
      }
      objc_storeStrong((id *)&qword_10044CF50, v15);
    }

    if (!qword_10044CF58)
    {
      v16 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_VideoChat", @"MediaExperience");
      if (v16) {
        v17 = *v16;
      }
      else {
        v17 = 0LL;
      }
      objc_storeStrong((id *)&qword_10044CF58, v17);
    }

    unsigned int v18 = [v4 isVideo];
    v19 = &qword_10044CF58;
    if (!v18) {
      v19 = &qword_10044CF50;
    }
    -[CXCallUpdate setAudioMode:](v5, "setAudioMode:", *v19);
  }

  return v5;
}

- (CXCallUpdate)initWithStartCallAction:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    -[CXCallUpdate setRemoteHandle:](v5, "setRemoteHandle:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handles]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
    -[CXCallUpdate setRemoteParticipantHandles:](v5, "setRemoteParticipantHandles:", v8);

    -[CXCallUpdate setTTYType:](v5, "setTTYType:", [v4 ttyType]);
    -[CXCallUpdate setHasVideo:](v5, "setHasVideo:", [v4 isVideo]);
    -[CXCallUpdate setEmergency:](v5, "setEmergency:", [v4 isEmergency]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    -[CXCallUpdate setLocalSenderIdentityUUID:](v5, "setLocalSenderIdentityUUID:", v9);
  }

  return v5;
}

- (CXCallUpdate)initWithDialRequest:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v7));
      -[CXCallUpdate setRemoteHandle:](v5, "setRemoteHandle:", v8);
    }

    id v9 = [v4 ttyType];
    if (v9 == (id)3) {
      uint64_t v10 = 2LL;
    }
    else {
      uint64_t v10 = v9 == (id)2;
    }
    -[CXCallUpdate setTTYType:](v5, "setTTYType:", v10);
    -[CXCallUpdate setEmergency:](v5, "setEmergency:", [v4 dialType] == (id)1);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    -[CXCallUpdate setLocalSenderIdentityUUID:](v5, "setLocalSenderIdentityUUID:", v11);

    -[CXCallUpdate setShouldSuppressInCallUI:]( v5,  "setShouldSuppressInCallUI:",  [v4 shouldSuppressInCallUI]);
  }

  return v5;
}

- (CXCallUpdate)initWithJoinConversationRequest:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v6 count]));

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    id v9 = [v8 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)v12) handle]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v13));
          [v7 addObject:v14];

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }

      while (v10);
    }

    -[CXCallUpdate setRemoteParticipantHandles:](v5, "setRemoteParticipantHandles:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate remoteParticipantHandles](v5, "remoteParticipantHandles"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);
    -[CXCallUpdate setRemoteHandle:](v5, "setRemoteHandle:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 otherInvitedHandles]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v17 count]));

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "otherInvitedHandles", 0));
    id v20 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        id v23 = 0LL;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[CXHandle handleWithTUHandle:]( &OBJC_CLASS___CXHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v23)));
          [v18 addObject:v24];

          id v23 = (char *)v23 + 1;
        }

        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }

      while (v21);
    }

    -[CXCallUpdate setOtherInvitedHandles:](v5, "setOtherInvitedHandles:", v18);
    -[CXCallUpdate setHasVideo:](v5, "setHasVideo:", [v4 isVideo]);
    -[CXCallUpdate setShouldSuppressInCallUI:]( v5,  "setShouldSuppressInCallUI:",  [v4 shouldSuppressInCallUI]);
    uint64_t v38 = TUConversationProviderIdentifierKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
    id v39 = v26;
    uint64_t v27 = 1LL;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    -[CXCallUpdate setContext:](v5, "setContext:", v28);

    if (([v4 requestToShareMyScreen] & 1) == 0)
    {
      if (![v4 requestToShareScreen])
      {
LABEL_20:

        goto LABEL_21;
      }

      uint64_t v27 = 2LL;
    }

    -[CXCallUpdate setScreenSharingIntention:](v5, "setScreenSharingIntention:", v27);
    goto LABEL_20;
  }

- (CXCallUpdate)sanitizedCallUpdate
{
  id v2 = -[CXCallUpdate copy](self, "copy");
  id v26 = [v2 hasSet];
  int v27 = v3;
  if ((v26 & 4) != 0
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteHandle]),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]),
        id v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    [v2 setRemoteHandle:0];
  }

  else
  {
    unint64_t v24 = (unint64_t)[v2 hasSet];
    int v25 = v7;
    if ((v24 & 0x10000000000LL) != 0)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteParticipantHandles", 0));
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
            id v16 = [v15 length];

            if (v16) {
              [v8 addObject:v14];
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v11);
      }

      id v17 = [v8 copy];
      [v2 setRemoteParticipantHandles:v17];
    }
  }

  return (CXCallUpdate *)v2;
}

- (NSString)remoteIDSDestination
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:TUCallFaceTimeRemoteIDSDestinationKey]);

  return (NSString *)v3;
}

- (void)setRemoteIDSDestination:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v7 = [v6 mutableCopy];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  [v7 setObject:v4 forKeyedSubscript:TUCallFaceTimeRemoteIDSDestinationKey];
  -[CXCallUpdate setContext:](self, "setContext:", v7);
}

- (unint64_t)initialLinkType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CSDIDSInitialLinkTypeKey"]);
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)setInitialLinkType:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v8 = [v6 mutableCopy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v8 setObject:v7 forKeyedSubscript:@"CSDIDSInitialLinkTypeKey"];

  -[CXCallUpdate setContext:](self, "setContext:", v8);
}

- (int64_t)inputAudioPowerSpectrumToken
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"]);
  id v4 = [v3 unsignedIntegerValue];

  return (int64_t)v4;
}

- (void)setInputAudioPowerSpectrumToken:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v8 = [v6 mutableCopy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v8 setObject:v7 forKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"];

  -[CXCallUpdate setContext:](self, "setContext:", v8);
}

- (int64_t)outputAudioPowerSpectrumToken
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"]);
  id v4 = [v3 unsignedIntegerValue];

  return (int64_t)v4;
}

- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate context](self, "context"));
    id v8 = [v6 mutableCopy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v8 setObject:v7 forKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"];

  -[CXCallUpdate setContext:](self, "setContext:", v8);
}

- (TUMediaTokens)tuMediaTokens
{
  int v3 = objc_alloc_init(&OBJC_CLASS___TUMediaTokens);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate callTokens](self, "callTokens"));
  -[TUMediaTokens setCombinedAudioStreamToken:]( v3,  "setCombinedAudioStreamToken:",  [v4 combinedAudioStreamToken]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate callTokens](self, "callTokens"));
  -[TUMediaTokens setUplinkStreamToken:](v3, "setUplinkStreamToken:", [v5 uplinkStreamToken]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate callTokens](self, "callTokens"));
  -[TUMediaTokens setDownlinkStreamToken:](v3, "setDownlinkStreamToken:", [v6 downlinkStreamToken]);

  return v3;
}

- (id)tuCallUpdateWithProvider:(id)a3 withCallUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[TUCallUpdate alloc] initWithProvider:v7];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate UUID](self, "UUID"));
  id v10 = [v9 copy];
  [v8 setUUID:v10];

  id v11 = [v6 copy];
  [v8 setCallUUID:v11];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate remoteHandle](self, "remoteHandle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tuHandle]);
  id v14 = [v13 copy];
  [v8 setHandle:v14];

  v15 = (char *)-[CXCallUpdate junkConfidence](self, "junkConfidence");
  else {
    id v16 = v15;
  }
  [v8 setJunkConfidence:v16];
  id v17 = -[CXCallUpdate priority](self, "priority");
  if (v17 == (id)2) {
    uint64_t v18 = 2LL;
  }
  else {
    uint64_t v18 = v17 == (id)1;
  }
  [v8 setPriority:v18];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate remoteParticipantHandles](self, "remoteParticipantHandles"));
  objc_msgSend(v8, "setRemoteParticipantCount:", objc_msgSend(v19, "count"));

  objc_msgSend(v8, "setHasVideo:", -[CXCallUpdate hasVideo](self, "hasVideo"));
  objc_msgSend(v8, "setConversation:", -[CXCallUpdate isConversation](self, "isConversation"));
  id v20 = [v8 copy];

  return v20;
}

@end