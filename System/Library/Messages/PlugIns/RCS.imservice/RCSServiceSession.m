@interface RCSServiceSession
- (BOOL)_isActiveServiceForRelay;
- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3;
- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3;
- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4;
- (BOOL)chatCanMergeWithSuperChat:(id)a3;
- (BOOL)isGroupMessagingEnabledFor:(id)a3;
- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3;
- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3;
- (BOOL)replicationRequiredForMultipleMessageParts;
- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)shouldExcludeChatFromRelay:(id)a3;
- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4;
- (RCSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (id)groupIDForChat:(id)a3;
- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6;
- (id)replicationPhoneNumbers;
- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4;
- (void)_updatePhoneNumberCallerID;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6;
- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7;
- (void)leaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4;
@end

@implementation RCSServiceSession

- (BOOL)isGroupMessagingEnabledFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  unsigned __int8 v6 = _sSo17RCSServiceSessionC3RCSE23isGroupMessagingEnabled3forSbSo7IMDChatC_tF_0(v4);

  return v6 & 1;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return 104857600LL;
}

- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  if (a6)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  id v15 = a3;
  v16 = self;
  RCSServiceSession.didReceiveMessage(_:forChat:style:fromIDSID:)(v15, v10, v12, a5, v13, (uint64_t)a6);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(a6);
}

- (void)leaveChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  v9 = self;
  RCSServiceSession.leaveChat(_:style:)(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7
{
  id v11 = a3;
  if (a3)
  {
    uint64_t v13 = sub_5C28(&qword_76568);
    id v11 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v13);
  }

  if (!a5)
  {
    uint64_t v14 = 0LL;
    if (a6) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v16 = 0LL;
    goto LABEL_8;
  }

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v15;
  if (!a6) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v17;
LABEL_8:
  id v18 = a4;
  v19 = self;
  sub_13400(2, (uint64_t)v11, v14, (uint64_t)a5, v16, (uint64_t)a6, a7);

  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(v11);
}

- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  if (a3)
  {
    uint64_t v11 = sub_5C28(&qword_76568);
    id v9 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v11);
  }

  if (!a4)
  {
    uint64_t v12 = 0LL;
    if (a5) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v14 = 0LL;
    goto LABEL_8;
  }

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v13;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v15;
LABEL_8:
  uint64_t v16 = self;
  sub_13400(3, (uint64_t)v9, v12, (uint64_t)a4, v14, (uint64_t)a5, a6);

  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(v9);
}

- (id)replicationPhoneNumbers
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RCSServiceSession;
  v2 = self;
  id v3 = -[RCSServiceSession replicationPhoneNumbers](&v7, "replicationPhoneNumbers");
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for String);

  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v11 = self;
  v12._countAndFlagsBits = v6;
  v12._object = v8;
  v13.value._countAndFlagsBits = v9;
  v13.value._object = a4;
  Swift::Bool v14 = RCSServiceSession.replicationRequirementsSatisfied(forPhoneNumber:simID:)(v12, v13);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(a4);
  return v14;
}

- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  RCSServiceSession.replicationRequiredForFeaturesUsed(by:)(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)replicationRequiredForMultipleMessageParts
{
  return 0;
}

- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  if (static String._unconditionallyBridgeFromObjectiveC(_:)(IMFileTransferGUIDAttributeName) == v4 && v7 == v6)
  {
    swift_bridgeObjectRelease_n(v6, 2LL);
    return 0;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t v11 = self;
    swift_bridgeObjectRelease(v9);
    if ((v10 & 1) != 0)
    {

      swift_bridgeObjectRelease(v6);
      return 0;
    }

    else
    {
      NSString v13 = String._bridgeToObjectiveC()();
      v15.receiver = v11;
      v15.super_class = (Class)&OBJC_CLASS___RCSServiceSession;
      BOOL v12 = -[RCSServiceSession replicationRequiredForMessageBodyAttributeName:]( &v15,  "replicationRequiredForMessageBodyAttributeName:",  v13);

      swift_bridgeObjectRelease(v6);
    }
  }

  return v12;
}

- (RCSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  RCSServiceSession.init(account:service:replicatingFor:)(v7, v8, a5);
  return result;
}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return 0;
}

- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v7 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v9 = v8;
  char v10 = (void *)objc_opt_self(&OBJC_CLASS___IMCTRCSUtilitiesManager);
  uint64_t v11 = self;
  id v12 = [v10 sharedManager];
  NSString v13 = String._bridgeToObjectiveC()();
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v12 groupMessagingMaxGroupSizeForPhoneNumber:v13 simID:v14];

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v9);

  return (int64_t)v15;
}

- (BOOL)_isActiveServiceForRelay
{
  id v3 = (void *)objc_opt_self(&OBJC_CLASS___IMFeatureFlags);
  uint64_t v4 = self;
  id v5 = [v3 sharedFeatureFlags];
  unsigned __int8 v6 = [v5 isLazuliEnabled];

  return v6;
}

- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6
{
  return 0LL;
}

- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  uint64_t v8 = self;
  NSString v9 = String._bridgeToObjectiveC()();
  v11.receiver = v8;
  v11.super_class = (Class)&OBJC_CLASS___RCSServiceSession;
  LOBYTE(v4) = -[RCSServiceSession shouldSendReadReceiptsForChat:style:]( &v11,  "shouldSendReadReceiptsForChat:style:",  v9,  v4);

  swift_bridgeObjectRelease(v7);
  return v4;
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v7 = a5;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v11 = v10;
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    if (a5)
    {
LABEL_3:
      static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
      id v7 = v12;
      if (v11) {
        goto LABEL_4;
      }
LABEL_8:
      id v17 = a3;
      id v18 = self;
      NSString v15 = 0LL;
      if (v7) {
        goto LABEL_5;
      }
LABEL_9:
      NSString v16 = 0LL;
      goto LABEL_10;
    }
  }

  if (!v11) {
    goto LABEL_8;
  }
LABEL_4:
  id v13 = a3;
  NSString v14 = self;
  NSString v15 = String._bridgeToObjectiveC()();
  if (!v7) {
    goto LABEL_9;
  }
LABEL_5:
  NSString v16 = String._bridgeToObjectiveC()();
LABEL_10:
  -[RCSServiceSession sendReadReceiptForMessage:toChatID:identifier:style:reflectOnly:]( self,  "sendReadReceiptForMessage:toChatID:identifier:style:reflectOnly:",  a3,  v15,  v16,  v6,  0LL);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v11);
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  id v9 = a5;
  if (!a4)
  {
    uint64_t v13 = 0LL;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0LL;
    goto LABEL_6;
  }

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  id v9 = v15;
LABEL_6:
  id v16 = a3;
  id v17 = self;
  sub_1962C(a3, v14, (unint64_t)v9, a6, a7);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v9);
}

- (BOOL)chatCanMergeWithSuperChat:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BOOL CanMerge13withSuperChatSbSo7IMDChatC_tF_0 = _sSo17RCSServiceSessionC3RCSE12chatCanMerge13withSuperChatSbSo7IMDChatC_tF_0(v4);

  return CanMerge13withSuperChatSbSo7IMDChatC_tF_0;
}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  if (a3)
  {
    uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v80 = v14;
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v78 = 0LL;
    v80 = 0LL;
    if (a4)
    {
LABEL_3:
      static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
      v77 = v15;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v16 = 0LL;
      id v18 = 0LL;
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  v77 = 0LL;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v18 = v17;
  if (a6)
  {
LABEL_5:
    a6 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v20 = v19;
    goto LABEL_10;
  }

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  int v57 = a6;
  if (a3)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    NSString v15 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
    NSString v15 = 0LL;
  }

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v18 = v17;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v21 = v20;
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  uint64_t v24 = v23;
  v25 = self;
  RCSServiceSession.sendGroupPhotoUpdate(_:toChatID:identifier:style:account:isPhotoRefresh:)( v13,  (uint64_t)v15,  v16,  (uint64_t)v18,  v19,  (uint64_t)v21,  v57,  v22,  (uint64_t)v24,  a8);

  swift_bridgeObjectRelease(v18, v26, v27, v28, v29, v30, v31, v32, v54);
  swift_bridgeObjectRelease(v21, v33, v34, v35, v36, v37, v38, v39, v55);
  swift_bridgeObjectRelease(v24, v40, v41, v42, v43, v44, v45, v46, v56);
  swift_bridgeObjectRelease(v15, v47, v48, v49, v50, v51, v52, v53, v58);
}

- (void)_updatePhoneNumberCallerID
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RCSServiceSession;
  -[RCSServiceSession _updatePhoneNumberCallerID](&v2, "_updatePhoneNumberCallerID");
}

- (id)groupIDForChat:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RCSServiceSession.groupID(for:)(v4);
  id v7 = v6;

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  return v8;
}

- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSString v8 = self;
  RCSServiceSession.allowed(toSendMessage:to:)(v6, v7);
  char v10 = v9;

  return v10 & 1;
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  id v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject(&unk_71638, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(void *)(*(void *)&self->IMDTelephonyServiceSession_opaque[OBJC_IVAR___RCSServiceSession_state] + 48LL);
  if (v8)
  {
    uint64_t v9 = v7;
    char v10 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, double))(*(void *)v8 + 136LL);
    id v11 = self;
    swift_retain(v8);
    v10(sub_19E40, v9, a4);

    swift_release(v9);
    swift_release(v8);
  }

  else
  {
    __break(1u);
  }

- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char v6 = _sSo17RCSServiceSessionC3RCSE33allowedToOverwriteOriginalGroupID3forSbSo7IMDChatC_tF_0(v4);

  return v6 & 1;
}

- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4
{
  char v6 = (void (**)(void))_Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  v6[2](v6);
  _Block_release(v6);
}

- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char v6 = _sSo17RCSServiceSessionC3RCSE24_messageUpgradesWhenSent18fromCurrentServiceSbSo13IMMessageItemC_tF_0(v4);

  return v6 & 1;
}

- (void).cxx_destruct
{
}

- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  id v11 = (RCSServiceSession *)a5;
  if (a4)
  {
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v16 = v15;
    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v14 = 0LL;
  uint64_t v16 = 0LL;
  if (a5)
  {
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    id v11 = v17;
  }

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v7 = sub_5C28(&qword_765B0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = a3;
  swift_unknownObjectRetain(a4);
  id v11 = self;
  static TaskPriority.userInitiated.getter(v11);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 0LL, 1LL, v12);
  type metadata accessor for MainActor(0LL);
  id v13 = v10;
  swift_unknownObjectRetain(a4);
  uint64_t v14 = v11;
  uint64_t v15 = static MainActor.shared.getter(v14);
  uint64_t v16 = (void *)swift_allocObject(&unk_71910, 56LL, 7LL);
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v14;
  v16[5] = v13;
  v16[6] = a4;
  uint64_t v17 = sub_1DB20((uint64_t)v9, (uint64_t)&unk_76AD0, (uint64_t)v16);

  swift_unknownObjectRelease(a4);
  swift_release(v17);
}

@end