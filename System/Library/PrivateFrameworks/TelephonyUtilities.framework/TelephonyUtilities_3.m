uint64_t sub_1002A2E6C()
{
  uint64_t v0;
  uint64_t v2;
  Lock.withLock<A>(_:)(&v2, sub_1002A3D44, v0, &type metadata for Int);
  return v2;
}

void sub_1002A2EBC(void *a1@<X8>)
{
  uint64_t v3 = v2 + 1;
  if (__OFADD__(v2, 1LL))
  {
    __break(1u);
  }

  else
  {
    sub_1002A2F8C(v2 + 1);
    *a1 = v3;
  }

void sub_1002A2F08()
{
  if ((v0 & 1) != 0)
  {
    sub_1002A36C0(0xD000000000000014LL, 0x8000000100377B00LL);
  }

  else if ((sub_1002A2FF4() & 1) != 0)
  {
    sub_1002A3C20();
  }

  sub_10010B978();
}

void sub_1002A2F8C(uint64_t a1)
{
  if ((sub_1002A2FF4(a1, 0xD000000000000014LL, 0x8000000100377B00LL) & 1) == 0) {
    sub_1002A3B60(a1, 0);
  }
}

#error "1002A3108: call analysis failed (funcsize=125)"
#error "1002A332C: call analysis failed (funcsize=131)"
void *sub_1002A3424()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_s *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  id v28[12];
  uint64_t v29;
  uint64_t v30;
  sub_10024D838();
  v29 = v0;
  v30 = v1;
  uint64_t v3 = v2;
  v5 = v4;
  sub_1002A3DF8();
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  v28[0] = 0LL;
  v9 = [v7 stringForKey:v8 error:v28];

  v10 = v28[0];
  if (v9)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    sub_1002A3E00();
    v11 = v10;
  }

  else
  {
    v12 = v28[0];
    v13 = _convertNSErrorToError(_:)(v10);

    swift_willThrow(v14);
    if (qword_100446930 != -1) {
      swift_once(&qword_100446930, sub_100258A18);
    }
    v15 = sub_1001B0E98();
    v16 = (os_log_s *)sub_1001B0D98(v15, (uint64_t)qword_1004541B0);
    sub_1001B9234();
    sub_1002A3DF0();
    sub_1001B9234();
    v17 = sub_1002A3DF0();
    Logger.logObject.getter(v17, v18, v19);
    v20 = sub_1001E0A4C();
    if (os_log_type_enabled(v16, v20))
    {
      v21 = sub_1001B0E78(22LL);
      v22 = (void *)sub_1001B0E78(8LL);
      v23 = (void *)sub_1001B0E78(32LL);
      v28[0] = v23;
      *(_DWORD *)v21 = 136315394;
      sub_1001B9234();
      v26 = sub_1001D7CF0(v5, v3, (uint64_t *)v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v21 + 4, v21 + 12);
      sub_10028EAF0(v3);
      *(_WORD *)(v21 + 12) = 2112;
      sub_1002A3DF0();
      v24 = _swift_stdlib_bridgeErrorToNSError(v13);
      v26 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v21 + 14, v21 + 22);
      *v22 = v24;
      sub_1001B4C80();
      sub_1001B4C80();
      sub_1002A3D98( (void *)&_mh_execute_header,  v16,  v20,  "ConversationLinkSync: Failed to read string in ConversationLinkDescriptorManager %s %@");
      sub_1001AFF14(&qword_100447E80);
      sub_1001B0F64((uint64_t)v22);
      sub_1001B0E60((uint64_t)v22);
      sub_1001B0F64((uint64_t)v23);
      sub_1001B0E60((uint64_t)v23);
      sub_1001B0E60(v21);

      sub_1001B4C80();
    }

    else
    {
      sub_1001B4C80();
      sub_10022CCA4(v3);
      sub_1001B4C80();
      sub_1001B4C80();
    }

    return 0LL;
  }

  return v7;
}

id sub_1002A36C0(uint64_t a1, unint64_t a2)
{
  v5 = v4;
  NSString v6 = String._bridgeToObjectiveC()();
  id v25 = 0LL;
  id v7 = [v5 integerForKey:v6 error:&v25];

  id v28 = v25;
  if (v25)
  {
    uint64_t v8 = qword_100446930;
    id v9 = v25;
    if (v8 != -1) {
      swift_once(&qword_100446930, sub_100258A18);
    }
    uint64_t v10 = sub_1001B0E98();
    sub_1001B0D98(v10, (uint64_t)qword_1004541B0);
    uint64_t v11 = sub_1002A3DA4();
    v14 = (os_log_s *)Logger.logObject.getter(v11, v12, v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = sub_1001B0E78(22LL);
      v17 = (void *)sub_1001B0E78(8LL);
      uint64_t v18 = sub_1001B0E78(32LL);
      uint64_t v27 = v18;
      *(_DWORD *)uint64_t v16 = 136315394;
      swift_bridgeObjectRetain(a2);
      id v25 = (id)sub_1001D7CF0(a1, a2, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v16 + 4, v16 + 12);
      sub_10028EAF0(a2);
      *(_WORD *)(v16 + 12) = 2112;
      swift_beginAccess(&v28, &v25, 0LL, 0LL);
      id v19 = v28;
      if (v28)
      {
        id v24 = v28;
        id v20 = v28;
        uint64_t v21 = v16 + 14;
        uint64_t v22 = v16 + 22;
      }

      else
      {
        uint64_t v22 = v16 + 22;
        id v24 = 0LL;
        uint64_t v21 = v16 + 14;
      }

      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v21, v22);
      void *v17 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "ConversationLinkSync: Failed to read int in ConversationLinkDescriptorManager %s %@",  (uint8_t *)v16,  0x16u);
      sub_1001AFF14(&qword_100447E80);
      sub_1001B0F64((uint64_t)v17);
      sub_1001B0E60((uint64_t)v17);
      sub_1001B0F64(v18);
      sub_1001B0E60(v18);
      sub_1001B0E60(v16);
    }

    else
    {

      sub_10022CCA4(a2);
    }

    return 0LL;
  }

  else if (v7 == (id)NSNotFound.getter())
  {
    return 0LL;
  }

  else
  {
    return v7;
  }

uint64_t sub_1002A3964()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (!v2) {
    return 0LL;
  }
  _bridgeAnyObjectToAny(_:)(v4, v2);
  swift_unknownObjectRelease(v2);
  sub_1001B03EC(v4, v5);
  sub_1001B03EC(v5, v4);
  else {
    return 0LL;
  }
}

uint64_t sub_1002A3A60()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (!v2) {
    return 0LL;
  }
  _bridgeAnyObjectToAny(_:)(v4, v2);
  swift_unknownObjectRelease(v2);
  sub_1001B03EC(v4, v5);
  sub_1001B03EC(v5, v4);
  else {
    return 0LL;
  }
}

void sub_1002A3B60(uint64_t a1, char a2)
{
  id v4 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  if ((a2 & 1) != 0)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v7 = a1;
    uint64_t v5 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v7, &type metadata for Int);
  }

  NSString v6 = String._bridgeToObjectiveC()();
  [v4 setObject:v5 forKey:v6];

  swift_unknownObjectRelease(v5);
}

void sub_1002A3C20()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  id v1 = String._bridgeToObjectiveC()();
  [v0 removeObjectForKey:v1];
}

uint64_t sub_1002A3CA0()
{
  return v0;
}

uint64_t sub_1002A3CC4()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for ConversationLinkDescriptorManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC13callservicesd33ConversationLinkDescriptorManager);
}

uint64_t sub_1002A3D04()
{
  uint64_t v1 = type metadata accessor for Lock(0LL);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  *(void *)(v0 + 16) = Lock.init()();
  *(void *)(v0 + 24) = 0LL;
  return v0;
}

void sub_1002A3D44(void *a1@<X8>)
{
}

uint64_t sub_1002A3D5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a9 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a9, &a10, v11, v10 + 12);
}

uint64_t sub_1002A3D7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  a9 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a9, v11, v10, v9 + 22);
}

void sub_1002A3D98(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_1002A3DA4()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t sub_1002A3DB4(uint64_t a1, uint64_t a2, ...)
{
  return sub_1001D7CF0(v3, v2, (uint64_t *)va);
}

uint64_t sub_1002A3DC4()
{
  return _convertNSErrorToError(_:)(v0);
}

NSString sub_1002A3DD0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1002A3DDC()
{
  return v0;
}

uint64_t sub_1002A3DF0()
{
  return swift_errorRetain(v0);
}

void sub_1002A3DF8()
{
}

  ;
}

void sub_1002A3E0C(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    id v3 = sub_1001705A4();
    uint64_t v4 = sub_1001AFF14((uint64_t *)&unk_100447E30);
    uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
    *(_OWORD *)(v5 + 16) = xmmword_10037B290;
    unsigned int v13 = sub_1002A6C30();
    uint64_t v6 = String.init<A>(reflecting:)(&v13, &type metadata for Int32);
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    unint64_t v9 = sub_1001B2330();
    *(void *)(v5 + 64) = v9;
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    uint64_t v10 = static os_log_type_t.default.getter(v9);
    os_log(_:dso:log:type:_:)("Reporting originating UI type as =%@", 36LL, 2LL, &_mh_execute_header, v3, v10, v5);

    swift_bridgeObjectRelease(v5);
    LODWORD(v3) = sub_1002A6C30();

    *(_DWORD *)(v1 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_originatingUIType) = (_DWORD)v3;
  }

  else
  {
    sub_1001B4B94(0LL, (unint64_t *)&unk_10044C050, &OBJC_CLASS___OS_os_log_ptr);
    id v12 = (id)static OS_os_log.default.getter();
    uint64_t v11 = static os_log_type_t.default.getter(v12);
    os_log(_:dso:log:type:_:)( "Found no active call to update originatingUIType",  48LL,  2LL,  &_mh_execute_header,  v12,  v11,  _swiftEmptyArrayStorage);
  }

uint64_t sub_1002A3F84(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maximumMemberCount;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maximumMemberCount);
  id v4 = [a1 remoteMembers];
  uint64_t v5 = sub_1002A6BFC();
  sub_1002A6C44((unint64_t *)&qword_10044A420);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v5, v6);

  uint64_t v7 = sub_1002A6C3C();
  uint64_t result = sub_1001B2428();
  uint64_t v9 = v7 + 1;
  if (__OFADD__(v7, 1LL))
  {
    __break(1u);
  }

  else
  {
    if (v9 <= v3) {
      uint64_t v9 = v3;
    }
    *(void *)(v1 + v2) = v9;
  }

  return result;
}

void sub_1002A4038()
{
  uint64_t v2 = v0;
  sub_1001AFF14(&qword_100447EA0);
  sub_1001B0E88();
  __chkstk_darwin(v3);
  sub_1001B0F00();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1001F86B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v34[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v9);
  unsigned int v13 = &v34[-v12];
  sub_1002A6BD0(OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase);
  sub_1002A68BC(v1, v6);
  if (sub_1001AB0AC(v6, 1LL, v7) == 1)
  {
    sub_1001C6CE4(v6, &qword_100447EA0);
LABEL_12:
    sub_10022CD38();
    return;
  }

  uint64_t v14 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 32))(v13, v6, v7);
  id v15 = sub_1001D909C(v14, "activeRemoteParticipants");
  sub_1001B4B94(0LL, &qword_100447E88, &OBJC_CLASS___TUConversationParticipant_ptr);
  sub_10022B8BC((unint64_t *)&unk_100447E90, &qword_100447E88, &OBJC_CLASS___TUConversationParticipant_ptr);
  uint64_t v16 = sub_1002A6C50((uint64_t)v15);

  uint64_t v17 = sub_10024E694(v16);
  uint64_t v18 = swift_bridgeObjectRelease(v16);
  id v19 = sub_1001D909C(v18, "state");
  BOOL v20 = v19 == (id)3;
  BOOL v21 = __OFADD__(v17, v20);
  uint64_t v22 = v17 + v20;
  if (!v21)
  {
    if (v22 <= *(void *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maxNumberOfParticipants)) {
      uint64_t v22 = *(void *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maxNumberOfParticipants);
    }
    *(void *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maxNumberOfParticipants) = v22;
    id v23 = sub_1001D909C((uint64_t)v19, "activeRemoteParticipants");
    uint64_t v24 = sub_1002A6C50((uint64_t)v23);

    uint64_t v25 = sub_10024E694(v24);
    uint64_t v26 = swift_bridgeObjectRelease(v24);
    if (v25 < 1)
    {
      if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasHadActiveParticipants) & 1) != 0)
      {
        Date.init()(v26);
        double v31 = Date.timeIntervalSince(_:)(v13);
        v32 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
        v32(v11, v7);
        v32(v13, v7);
        uint64_t v33 = v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone;
        *(double *)uint64_t v33 = v31;
        *(_BYTE *)(v33 + 8) = 0;
        goto LABEL_12;
      }
    }

    else
    {
      *(_BYTE *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasHadActiveParticipants) = 1;
      uint64_t v27 = v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone;
      if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone + 8) & 1) == 0)
      {
        double v28 = *(double *)v27;
        Date.init()(v26);
        double v29 = Date.timeIntervalSince(_:)(v13);
        v30 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
        v30(v11, v7);
        v30(v13, v7);
        *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_cumulativeTimeAlone) = v29 - v28 + *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_cumulativeTimeAlone);
        *(void *)uint64_t v27 = 0LL;
        *(_BYTE *)(v27 + 8) = 1;
        goto LABEL_12;
      }
    }

    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_12;
  }

  __break(1u);
}

void *sub_1002A430C()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_AVCBlobRecoveryAttempts);
}

void *sub_1002A4318()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_remoteMemberNotInMemberListCounts);
}

void *sub_1002A4324()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_transitionAttempts);
}

void *sub_1002A4330()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_AVCBlobRecoveryTimeouts);
}

void *sub_1002A433C()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_switchToOneToOneModeFailures);
}

void *sub_1002A4348()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_switchToGFTModeFailures);
}

void *sub_1002A4354()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetryAttempts);
}

void *sub_1002A4360()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetryFailures);
}

void *sub_1002A436C()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetrySuccesses);
}

void *sub_1002A4378()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetryAttempts);
}

void *sub_1002A4384()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetryFailures);
}

void *sub_1002A4390()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetrySuccesses);
}

void *sub_1002A439C()
{
  return sub_1002A43A8(&OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIRequests);
}

void *sub_1002A43A8(void *result)
{
  uint64_t v2 = *(void *)(v1 + *result);
  BOOL v3 = __OFADD__(v2, 1LL);
  uint64_t v4 = v2 + 1;
  if (v3) {
    __break(1u);
  }
  else {
    *(void *)(v1 + *result) = v4;
  }
  return result;
}

uint64_t sub_1002A43C4(uint64_t result)
{
  if ((result & 1) != 0)
  {
    uint64_t v2 = (void *)(v1 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIApprovals);
    uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIApprovals);
    BOOL v4 = __OFADD__(v3, 1LL);
    uint64_t v5 = v3 + 1;
    if (!v4) {
      goto LABEL_6;
    }
    __break(1u);
  }

  uint64_t v2 = (void *)(v1 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIDismissals);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIDismissals);
  BOOL v4 = __OFADD__(v6, 1LL);
  uint64_t v5 = v6 + 1;
  if (!v4)
  {
LABEL_6:
    *uint64_t v2 = v5;
    return result;
  }

  __break(1u);
  return result;
}

void sub_1002A4408(void *a1)
{
  uint64_t v2 = v1;
  sub_1001AFF14(&qword_100447EA0);
  sub_1001B0E88();
  __chkstk_darwin(v4);
  sub_1001BB4B4();
  uint64_t v34 = v5;
  sub_1001BB5CC();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v9 = sub_1001F86B8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  unsigned int v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v33 = (char *)&v33 - v14;
  id v15 = [a1 remoteMembers];
  uint64_t v16 = sub_1001B4B94(0LL, (unint64_t *)&unk_100447E20, &OBJC_CLASS___TUConversationMember_ptr);
  sub_10022B8BC( (unint64_t *)&qword_10044A420,  (unint64_t *)&unk_100447E20,  &OBJC_CLASS___TUConversationMember_ptr);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(v15, v16, v17);

  uint64_t v18 = sub_1002A6C3C();
  sub_1001B2428();
  if (__OFADD__(v18, 1LL))
  {
    __break(1u);
  }

  else
  {
    *(void *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_finalMemberCount) = v18 + 1;
    unsigned __int8 v19 = [a1 isOneToOneModeEnabled];
    *(_BYTE *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_uPlusOneModeAtEnd) = v19;
    sub_1002A6BD0(OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase);
    sub_1002A68BC(v18, (uint64_t)v8);
    if (sub_1001AB0AC((uint64_t)v8, 1LL, v9) == 1)
    {
      sub_1001C6CE4((uint64_t)v8, &qword_100447EA0);
    }

    else
    {
      BOOL v20 = v33;
      uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v33, v8, v9);
      Date.init()(v21);
      double v22 = Date.timeIntervalSince(_:)(v20);
      id v23 = *(void (**)(char *, uint64_t))(v10 + 8);
      v23(v13, v9);
      uint64_t v24 = v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_relativeEnd;
      *(double *)uint64_t v24 = v22;
      *(_BYTE *)(v24 + 8) = 0;
      uint64_t v25 = v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_duration;
      *(double *)uint64_t v25 = v22 - *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_relativeStart);
      *(_BYTE *)(v25 + 8) = 0;
      id v26 = [a1 activeRemoteParticipants];
      uint64_t v27 = sub_1001B4B94(0LL, &qword_100447E88, &OBJC_CLASS___TUConversationParticipant_ptr);
      sub_10022B8BC((unint64_t *)&unk_100447E90, &qword_100447E88, &OBJC_CLASS___TUConversationParticipant_ptr);
      static Set._unconditionallyBridgeFromObjectiveC(_:)(v26, v27, v28);
      sub_1002A6BE8();
      uint64_t v29 = sub_10024E694(&qword_100447E88);
      sub_1001B2428();
      v23(v20, v9);
      if (!v29
        && (*(_BYTE *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone + 8) & 1) == 0)
      {
        double v30 = v22 - *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone);
        *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_cumulativeTimeAlone) = v30 + *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_cumulativeTimeAlone);
        *(double *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timeAloneAtEnd) = v30;
      }
    }

    uint64_t v31 = v34;
    sub_1001A9670(v34, 1LL, 1LL, v9);
    sub_1001BB4D4(v18, (uint64_t)v35);
    sub_1002A6904(v31, v18);
    swift_endAccess(v35);
    uint64_t v32 = v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone;
    *(void *)uint64_t v32 = 0LL;
    *(_BYTE *)(v32 + 8) = 1;
    *(_BYTE *)(v2 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasHadActiveParticipants) = 2;
    sub_10022CD38();
  }

void sub_1002A475C(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  sub_1001AFF14(&qword_100447EA0);
  sub_1001B0E88();
  __chkstk_darwin(v4);
  sub_1001B0F00();
  uint64_t v92 = v6 - v5;
  uint64_t v7 = sub_1001F86B8();
  uint64_t v98 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_1001BB4B4();
  uint64_t v94 = v8;
  sub_1001BB5CC();
  __chkstk_darwin(v9);
  v97 = (char *)&v88 - v10;
  sub_1001BB5CC();
  __chkstk_darwin(v11);
  v96 = (char *)&v88 - v12;
  sub_1001AFF14((uint64_t *)&unk_10044A400);
  sub_1001B0E88();
  __chkstk_darwin(v13);
  sub_1001BB4B4();
  uint64_t v93 = v14;
  sub_1001BB5CC();
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v88 - v16;
  uint64_t v18 = type metadata accessor for UUID(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  sub_1001B0F00();
  uint64_t v22 = v21 - v20;
  id v23 = &v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_relativeEnd];
  *(void *)id v23 = 0LL;
  uint64_t v24 = 1LL;
  v23[8] = 1;
  uint64_t v25 = &v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_duration];
  *(void *)uint64_t v25 = 0LL;
  v25[8] = 1;
  *(_DWORD *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_originatingUIType] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_AVCBlobRecoveryAttempts] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_AVCBlobRecoveryTimeouts] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_remoteMemberNotInMemberListCounts] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_transitionAttempts] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_switchToOneToOneModeFailures] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_switchToGFTModeFailures] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIRequests] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIApprovals] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIDismissals] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetryAttempts] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetryFailures] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetrySuccesses] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetryAttempts] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetryFailures] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetrySuccesses] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_cumulativeTimeAlone] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timeAloneAtEnd] = 0LL;
  v91 = &v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase];
  uint64_t v95 = v7;
  sub_1001A9670((uint64_t)&v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase], 1LL, 1LL, v7);
  uint64_t v89 = OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasHadActiveParticipants;
  v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasHadActiveParticipants] = 2;
  id v26 = &v2[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone];
  *(void *)id v26 = 0LL;
  v26[8] = 1;
  uint64_t v27 = v2;
  id v28 = sub_1001F8700((uint64_t)v27, "UUID");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v28);

  uint64_t v29 = UUID.uuidString.getter();
  uint64_t v31 = v30;
  uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8);
  uint64_t v33 = v32(v22, v18);
  uint64_t v34 = (uint64_t *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_uuid];
  *uint64_t v34 = v29;
  v34[1] = v31;
  id v35 = sub_1001F8700(v33, "report");
  id v36 = [v35 conversationID];

  uint64_t v37 = v93;
  if (v36)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v36);

    uint64_t v24 = 0LL;
  }

  sub_1001A9670(v37, v24, 1LL, v18);
  sub_1001C6C08(v37, (uint64_t)v17);
  int v38 = sub_1001AB0AC((uint64_t)v17, 1LL, v18);
  uint64_t v39 = (uint64_t)v97;
  if (v38 == 1)
  {
    sub_1001C6CE4((uint64_t)v17, (uint64_t *)&unk_10044A400);
    uint64_t v41 = 0LL;
    v42 = 0LL;
  }

  else
  {
    uint64_t v41 = UUID.uuidString.getter();
    v42 = v43;
    uint64_t v40 = v32((uint64_t)v17, v18);
  }

  v44 = (uint64_t *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_CID];
  uint64_t *v44 = v41;
  v44[1] = (uint64_t)v42;
  uint64_t v45 = (uint64_t)v96;
  uint64_t v46 = Date.init()(v40);
  id v47 = sub_1001F8700(v46, "report");

  uint64_t v49 = v94;
  uint64_t v50 = v95;
  if (v47)
  {
    id v51 = objc_msgSend(sub_1001F8700(v48, "report"), "timebase");
    sub_1002A6BE8();
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v42);

    uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v98 + 8))(v49, v50);
    id v53 = objc_msgSend(sub_1001F8700(v52, "report"), "timebase");
    sub_1002A6BE8();
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v42);
  }

  else
  {
    sub_1002A6C28(v39, v45, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v98 + 16));
  }

  *(double *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_relativeStart] = Date.timeIntervalSince(_:)(v39);
  double v54 = Date.timeIntervalSinceReferenceDate.getter() / 14400.0;
  if ((~*(void *)&v54 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (v54 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (v54 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  Date.init(timeIntervalSinceReferenceDate:)((double)(uint64_t)v54 * 4.0 * 3600.0);
  uint64_t v55 = v98;
  sub_1002A6C28( (uint64_t)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_conversationBaseTime],  v49,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v98 + 32));
  v56 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 16);
  uint64_t v57 = v92;
  sub_1002A6C28(v92, v39, v56);
  sub_1001A9670(v57, 0LL, 1LL, v50);
  uint64_t v58 = (uint64_t)v91;
  sub_1001BB4D4((uint64_t)v91, (uint64_t)v100);
  sub_1002A6904(v57, v58);
  uint64_t v59 = swift_endAccess(v100);
  id v60 = sub_1001F8700(v59, "remoteMembers");
  uint64_t v61 = sub_1002A6BFC();
  sub_1002A6C44((unint64_t *)&qword_10044A420);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(v60, v61, v62);
  sub_1002A6BE8();
  uint64_t v63 = sub_1002A6C3C();
  uint64_t v64 = sub_1001B2428();
  *(void *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_initialMemberCount] = v63;
  *(void *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maximumMemberCount] = v63;
  *(void *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_finalMemberCount] = v63;
  id v65 = sub_1001F8700(v64, "activeRemoteParticipants");
  sub_1001B4B94(0LL, &qword_100447E88, &OBJC_CLASS___TUConversationParticipant_ptr);
  sub_10022B8BC((unint64_t *)&unk_100447E90, &qword_100447E88, &OBJC_CLASS___TUConversationParticipant_ptr);
  uint64_t v66 = sub_1002A6C1C((uint64_t)v65);

  uint64_t v67 = sub_10024E694(v66);
  uint64_t v68 = swift_bridgeObjectRelease(v66);
  id v69 = sub_1001F8700(v68, "state");
  BOOL v70 = v69 == (id)3;
  BOOL v71 = __OFADD__(v67, v70);
  uint64_t v72 = v67 + v70;
  if (v71)
  {
LABEL_19:
    __break(1u);
    return;
  }

  *(void *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maxNumberOfParticipants] = v72;
  id v73 = sub_1001F8700((uint64_t)v69, "isOneToOneModeEnabled");
  v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_uPlusOneModeAtStart] = (_BYTE)v73;
  id v74 = sub_1001F8700((uint64_t)v73, "isOneToOneModeEnabled");
  v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_uPlusOneModeAtEnd] = (_BYTE)v74;
  id v75 = sub_1001F8700((uint64_t)v74, "link");
  id v76 = v75;
  if (v75) {

  }
  v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasLink] = v76 != 0LL;
  id v77 = sub_1001F8700((uint64_t)v75, "isPendingConversation");
  v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_isPending] = (_BYTE)v77;
  id v78 = sub_1001F8700((uint64_t)v77, "activeRemoteParticipants");
  uint64_t v79 = sub_1002A6C1C((uint64_t)v78);

  v80 = (void *)sub_10024E694(v79);
  uint64_t v81 = swift_bridgeObjectRelease(v79);
  v2[v89] = (uint64_t)v80 > 0;
  id v82 = objc_msgSend(sub_1001F8700(v81, "provider"), "identifier");
  sub_1002A6BE8();
  uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v80);
  uint64_t v85 = v84;

  v86 = (uint64_t *)&v27[OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_conversationProvider];
  uint64_t *v86 = v83;
  v86[1] = v85;

  v99.receiver = v27;
  v99.super_class = ObjectType;
  objc_msgSendSuper2(&v99, "init");

  v87 = *(void (**)(char *, uint64_t))(v98 + 8);
  v87(v97, v50);
  v87(v96, v50);
}

void sub_1002A4F78()
{
}

uint64_t sub_1002A4FB0(uint64_t a1, unint64_t a2)
{
  if (a1 == 1684632949 && a2 == 0xE400000000000000LL)
  {
    unint64_t v5 = 0xE400000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684632949LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x65766974616C6572LL && a2 == 0xED00007472617453LL)
  {
    unint64_t v8 = 0xED00007472617453LL;
    goto LABEL_16;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65766974616C6572LL, 0xED00007472617453LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1LL;
  }

  if (a1 == 4475203 && a2 == 0xE300000000000000LL)
  {
    unint64_t v10 = 0xE300000000000000LL;
    goto LABEL_24;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(4475203LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v10);
    return 2LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v11 = 0x8000000100377BB0LL;
    if (a2 == 0x8000000100377BB0LL) {
      goto LABEL_29;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100377BB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
LABEL_29:
    swift_bridgeObjectRelease(v11);
    return 3LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v12 = 0x8000000100377BD0LL;
    if (a2 == 0x8000000100377BD0LL) {
      goto LABEL_34;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100377BD0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v12 = a2;
LABEL_34:
    swift_bridgeObjectRelease(v12);
    return 4LL;
  }

  if (a1 == 0x6B6E694C736168LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v14 = 0xE700000000000000LL;
    goto LABEL_42;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6B6E694C736168LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
LABEL_42:
    swift_bridgeObjectRelease(v14);
    return 5LL;
  }

  if (a1 == 0x6E69646E65507369LL && a2 == 0xE900000000000067LL)
  {
    unint64_t v16 = 0xE900000000000067LL;
    goto LABEL_50;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E69646E65507369LL, 0xE900000000000067LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v16 = a2;
LABEL_50:
    swift_bridgeObjectRelease(v16);
    return 6LL;
  }

  if (a1 == 0x65766974616C6572LL && a2 == 0xEB00000000646E45LL)
  {
    unint64_t v18 = 0xEB00000000646E45LL;
    goto LABEL_58;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65766974616C6572LL, 0xEB00000000646E45LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v18 = a2;
LABEL_58:
    swift_bridgeObjectRelease(v18);
    return 7LL;
  }

  if (a1 == 0x6E6F697461727564LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v20 = 0xE800000000000000LL;
    goto LABEL_66;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461727564LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v20 = a2;
LABEL_66:
    swift_bridgeObjectRelease(v20);
    return 8LL;
  }

  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v21 = 0x8000000100372930LL;
    if (a2 == 0x8000000100372930LL) {
      goto LABEL_71;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100372930LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v21 = a2;
LABEL_71:
    swift_bridgeObjectRelease(v21);
    return 9LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v22 = 0x8000000100372950LL;
    if (a2 == 0x8000000100372950LL) {
      goto LABEL_76;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100372950LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v22 = a2;
LABEL_76:
    swift_bridgeObjectRelease(v22);
    return 10LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v23 = 0x8000000100372AF0LL;
    if (a2 == 0x8000000100372AF0LL) {
      goto LABEL_81;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100372AF0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v23 = a2;
LABEL_81:
    swift_bridgeObjectRelease(v23);
    return 11LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v24 = 0x8000000100377C10LL;
    if (a2 == 0x8000000100377C10LL) {
      goto LABEL_86;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000100377C10LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v24 = a2;
LABEL_86:
    swift_bridgeObjectRelease(v24);
    return 12LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v25 = 0x8000000100377C30LL;
    if (a2 == 0x8000000100377C30LL) {
      goto LABEL_91;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000100377C30LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v25 = a2;
LABEL_91:
    swift_bridgeObjectRelease(v25);
    return 13LL;
  }

  if (a1 == 0xD000000000000010LL)
  {
    unint64_t v26 = 0x8000000100377C50LL;
    if (a2 == 0x8000000100377C50LL) {
      goto LABEL_96;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100377C50LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v26 = a2;
LABEL_96:
    swift_bridgeObjectRelease(v26);
    return 14LL;
  }

  if (a1 == 0xD000000000000017LL)
  {
    unint64_t v27 = 0x8000000100377C70LL;
    if (a2 == 0x8000000100377C70LL) {
      goto LABEL_101;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017LL, 0x8000000100377C70LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v27 = a2;
LABEL_101:
    swift_bridgeObjectRelease(v27);
    return 15LL;
  }

  if (a1 == 0xD000000000000017LL)
  {
    unint64_t v28 = 0x8000000100377C90LL;
    if (a2 == 0x8000000100377C90LL) {
      goto LABEL_106;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017LL, 0x8000000100377C90LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v28 = a2;
LABEL_106:
    swift_bridgeObjectRelease(v28);
    return 16LL;
  }

  if (a1 == 0xD000000000000017LL)
  {
    unint64_t v29 = 0x8000000100377CB0LL;
    if (a2 == 0x8000000100377CB0LL) {
      goto LABEL_111;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017LL, 0x8000000100377CB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v29 = a2;
LABEL_111:
    swift_bridgeObjectRelease(v29);
    return 17LL;
  }

  if (a1 == 0xD000000000000021LL && a2 == 0x8000000100377CD0LL)
  {
    unint64_t v30 = 0x8000000100377CD0LL;
LABEL_117:
    swift_bridgeObjectRelease(v30);
    return 18LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000021LL, 0x8000000100377CD0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v30 = a2;
    goto LABEL_117;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v31 = 0x8000000100377D00LL;
    if (a2 == 0x8000000100377D00LL) {
      goto LABEL_122;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000100377D00LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v31 = a2;
LABEL_122:
    swift_bridgeObjectRelease(v31);
    return 19LL;
  }

  if (a1 == 0xD00000000000001CLL && a2 == 0x8000000100377D20LL)
  {
    unint64_t v32 = 0x8000000100377D20LL;
LABEL_128:
    swift_bridgeObjectRelease(v32);
    return 20LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001CLL, 0x8000000100377D20LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v32 = a2;
    goto LABEL_128;
  }

  if (a1 == 0xD000000000000017LL)
  {
    unint64_t v33 = 0x8000000100377D40LL;
    if (a2 == 0x8000000100377D40LL) {
      goto LABEL_133;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017LL, 0x8000000100377D40LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v33 = a2;
LABEL_133:
    swift_bridgeObjectRelease(v33);
    return 21LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v34 = 0x8000000100377D60LL;
    if (a2 == 0x8000000100377D60LL) {
      goto LABEL_138;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100377D60LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v34 = a2;
LABEL_138:
    swift_bridgeObjectRelease(v34);
    return 22LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v35 = 0x8000000100377D80LL;
    if (a2 == 0x8000000100377D80LL) {
      goto LABEL_143;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000100377D80LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v35 = a2;
LABEL_143:
    swift_bridgeObjectRelease(v35);
    return 23LL;
  }

  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v36 = 0x8000000100377DA0LL;
    if (a2 == 0x8000000100377DA0LL) {
      goto LABEL_148;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100377DA0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v36 = a2;
LABEL_148:
    swift_bridgeObjectRelease(v36);
    return 24LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v37 = 0x8000000100377DC0LL;
    if (a2 == 0x8000000100377DC0LL) {
      goto LABEL_153;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100377DC0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v37 = a2;
LABEL_153:
    swift_bridgeObjectRelease(v37);
    return 25LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v38 = 0x8000000100377DE0LL;
    if (a2 == 0x8000000100377DE0LL) {
      goto LABEL_158;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100377DE0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v38 = a2;
LABEL_158:
    swift_bridgeObjectRelease(v38);
    return 26LL;
  }

  if (a1 == 0xD000000000000015LL && a2 == 0x8000000100377E00LL)
  {
    unint64_t v39 = 0x8000000100377E00LL;
LABEL_164:
    swift_bridgeObjectRelease(v39);
    return 27LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x8000000100377E00LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v39 = a2;
    goto LABEL_164;
  }

  if (a1 == 0xD000000000000023LL)
  {
    unint64_t v40 = 0x8000000100377E20LL;
    if (a2 == 0x8000000100377E20LL) {
      goto LABEL_169;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000023LL, 0x8000000100377E20LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v40 = a2;
LABEL_169:
    swift_bridgeObjectRelease(v40);
    return 28LL;
  }

  if (a1 == 0xD000000000000023LL)
  {
    unint64_t v41 = 0x8000000100377E50LL;
    if (a2 == 0x8000000100377E50LL) {
      goto LABEL_174;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000023LL, 0x8000000100377E50LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v41 = a2;
LABEL_174:
    swift_bridgeObjectRelease(v41);
    return 29LL;
  }

  if (a1 == 0xD000000000000024LL && a2 == 0x8000000100377E80LL)
  {
    unint64_t v42 = 0x8000000100377E80LL;
LABEL_180:
    swift_bridgeObjectRelease(v42);
    return 30LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000024LL, 0x8000000100377E80LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v42 = a2;
    goto LABEL_180;
  }

  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v43 = 0x8000000100377EB0LL;
    if (a2 == 0x8000000100377EB0LL) {
      goto LABEL_185;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100377EB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v43 = a2;
LABEL_185:
    swift_bridgeObjectRelease(v43);
    return 31LL;
  }

  if (a1 == 0x6E6F6C41656D6974LL && a2 == 0xEE00646E45744165LL)
  {
    unint64_t v45 = 0xEE00646E45744165LL;
    goto LABEL_193;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6C41656D6974LL, 0xEE00646E45744165LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v45 = a2;
LABEL_193:
    swift_bridgeObjectRelease(v45);
    return 32LL;
  }

  if (a1 == 0x65736162656D6974LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v47 = 0xE800000000000000LL;
    goto LABEL_201;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65736162656D6974LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v47 = a2;
LABEL_201:
    swift_bridgeObjectRelease(v47);
    return 33LL;
  }

  if (a1 == 0xD000000000000018LL && a2 == 0x8000000100377EE0LL)
  {
    unint64_t v48 = 0x8000000100377EE0LL;
LABEL_207:
    swift_bridgeObjectRelease(v48);
    return 34LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x8000000100377EE0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v48 = a2;
    goto LABEL_207;
  }

  if (a1 == 0xD000000000000010LL && a2 == 0x8000000100377F00LL)
  {
    swift_bridgeObjectRelease(0x8000000100377F00LL);
    return 35LL;
  }

  else
  {
    char v49 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100377F00LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v49 & 1) != 0) {
      return 35LL;
    }
    else {
      return 36LL;
    }
  }

uint64_t sub_1002A5C64()
{
  return 36LL;
}

uint64_t sub_1002A5C6C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1002A5C98 + 4 * byte_10037F650[a1]))( 1684632949LL,  0xE400000000000000LL);
}

uint64_t sub_1002A5C98()
{
  return 0x65766974616C6572LL;
}

uint64_t sub_1002A5D40()
{
  return 0x6E6F697461727564LL;
}

uint64_t sub_1002A5F90()
{
  return 0x65736162656D6974LL;
}

unint64_t sub_1002A5FA8()
{
  return 0xD000000000000018LL;
}

void sub_1002A5FC0()
{
}

uint64_t sub_1002A5FE0()
{
  return sub_1002A5C6C(*v0);
}

uint64_t sub_1002A5FE8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1002A4FB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1002A600C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1002A5C64();
  *a1 = result;
  return result;
}

uint64_t sub_1002A6030(uint64_t a1)
{
  unint64_t v2 = sub_1002A6880();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002A6058(uint64_t a1)
{
  unint64_t v2 = sub_1002A6880();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002A6108()
{
  return type metadata accessor for RTCCSDConversationInfo(0LL);
}

uint64_t type metadata accessor for RTCCSDConversationInfo(uint64_t a1)
{
  uint64_t result = qword_10044C890;
  if (!qword_10044C890) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RTCCSDConversationInfo);
  }
  return result;
}

void sub_1002A6148(uint64_t a1)
{
  v6[0] = &unk_10037F698;
  v6[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[2] = &unk_10037F6B0;
  uint64_t v2 = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v6[3] = *(void *)(v2 - 8) + 64LL;
    v6[4] = &unk_10037F6B0;
    v6[5] = &unk_10037F6C8;
    v6[6] = &unk_10037F6C8;
    v6[9] = &unk_10037F6C8;
    v6[10] = &unk_10037F6C8;
    v6[7] = &unk_10037F6E0;
    v6[8] = &unk_10037F6E0;
    v6[11] = (char *)&value witness table for Builtin.Int32 + 64;
    v6[12] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[13] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[14] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[15] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[16] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[17] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[18] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[19] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[20] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[21] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[22] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[23] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[24] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[25] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[26] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[27] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[28] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[29] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[30] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[31] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[32] = (char *)&value witness table for Builtin.Int64 + 64;
    sub_1002468D0(319LL);
    if (v5 <= 0x3F)
    {
      v6[33] = *(void *)(v4 - 8) + 64LL;
      v6[34] = &unk_10037F6F8;
      v6[35] = &unk_10037F6E0;
      swift_updateClassMetadata2(a1, 256LL, 36LL, v6, a1 + 80);
    }
  }

uint64_t sub_1002A6258(void *a1)
{
  uint64_t v3 = v1;
  sub_1001AFF14(&qword_100447EA0);
  sub_1001B0E88();
  __chkstk_darwin(v5);
  sub_1001B0F00();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1001AFF14(&qword_10044C8A0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_1001B0F00();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = a1[3];
  uint64_t v15 = a1[4];
  sub_1001B204C(a1, v14);
  unint64_t v16 = sub_1002A6880();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for RTCCSDConversationInfo.CodingKeys,  &type metadata for RTCCSDConversationInfo.CodingKeys,  v16,  v14,  v15);
  v44[0] = 0;
  sub_1002A6BF0();
  KeyedEncodingContainer.encode(_:forKey:)(v17, v18, v19, v20);
  if (!v2)
  {
    sub_1002A6B90(1);
    sub_1002A6BB8( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_CID),  *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_CID + 8),  2);
    v44[0] = 3;
    type metadata accessor for Date(0LL);
    sub_1001A9F18( &qword_100449E30,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    sub_1002A6BF0();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, v22, v23, v24);
    sub_1002A6BB8( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_conversationProvider),  *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_conversationProvider + 8),  4);
    sub_1002A6B78(*(unsigned __int8 *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_hasLink), 5);
    sub_1002A6B78(*(unsigned __int8 *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_isPending), 6);
    uint64_t v25 = sub_1002A6C0C(OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_relativeEnd);
    v44[0] = 7;
    sub_1002A6BA8(v25, v26, (uint64_t)v44);
    uint64_t v27 = sub_1002A6C0C(OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_duration);
    v44[0] = 8;
    sub_1002A6BA8(v27, v28, (uint64_t)v44);
    sub_1002A6B78( *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_uPlusOneModeAtStart),  9);
    sub_1002A6B78( *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_uPlusOneModeAtEnd),  10);
    v44[0] = 11;
    sub_1002A6BF0();
    KeyedEncodingContainer.encode(_:forKey:)(v29, v30, v31);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maximumMemberCount), 12);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_initialMemberCount), 13);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_finalMemberCount), 14);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_maxNumberOfParticipants), 15);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_AVCBlobRecoveryAttempts), 16);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_AVCBlobRecoveryTimeouts), 17);
    sub_1002A6B60( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_remoteMemberNotInMemberListCounts),  18);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_transitionAttempts), 19);
    sub_1002A6B60( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_switchToOneToOneModeFailures),  20);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_switchToGFTModeFailures), 21);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIRequests), 22);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIApprovals), 23);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_numberLMIDismissals), 24);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetryAttempts), 25);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetryFailures), 26);
    sub_1002A6B60(*(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_messageRetrySuccesses), 27);
    sub_1002A6B60( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetryAttempts),  28);
    sub_1002A6B60( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetryFailures),  29);
    sub_1002A6B60( *(void *)(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_avcBlobRecoveryMessageRetrySuccesses),  30);
    sub_1002A6B90(31);
    sub_1002A6B90(32);
    uint64_t v32 = v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase;
    swift_beginAccess(v3 + OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_timebase, v44, 0LL, 0LL);
    sub_1002A68BC(v32, v8);
    char v45 = 33;
    sub_1002A6BF0();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v33, v34, v35, v36, v37);
    sub_1001C6CE4(v8, &qword_100447EA0);
    char v45 = 34;
    sub_1002A6BF0();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v38, v39, v40);
    uint64_t v41 = sub_1002A6C0C(OBJC_IVAR____TtC13callservicesd22RTCCSDConversationInfo_lastTimeNotAlone);
    char v45 = 35;
    sub_1002A6BA8(v41, v42, (uint64_t)&v45);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t sub_1002A6824(void *a1)
{
  return sub_1002A6258(a1);
}

void sub_1002A6844(uint64_t a1)
{
  *(void *)(a1 + 8) = v2;
}

unint64_t sub_1002A6880()
{
  unint64_t result = qword_10044C8A8;
  if (!qword_10044C8A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10037F818, &type metadata for RTCCSDConversationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10044C8A8);
  }

  return result;
}

uint64_t sub_1002A68BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1001AFF14(&qword_100447EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1002A6904(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1001AFF14(&qword_100447EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for RTCCSDConversationInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xDD)
  {
    if (a2 + 35 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 35) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 36;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for RTCCSDConversationInfo.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 35 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 35) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xDD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDC) {
    return ((uint64_t (*)(void))((char *)&loc_1002A6A20 + 4 * byte_10037F679[v4]))();
  }
  *a1 = a2 + 35;
  return ((uint64_t (*)(void))((char *)sub_1002A6A54 + 4 * byte_10037F674[v4]))();
}

uint64_t sub_1002A6A54(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1002A6A5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1002A6A64LL);
  }
  return result;
}

uint64_t sub_1002A6A70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1002A6A78LL);
  }
  *(_BYTE *)unint64_t result = a2 + 35;
  return result;
}

uint64_t sub_1002A6A7C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1002A6A84(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RTCCSDConversationInfo.CodingKeys()
{
  return &type metadata for RTCCSDConversationInfo.CodingKeys;
}

unint64_t sub_1002A6AA4()
{
  unint64_t result = qword_10044C8B0;
  if (!qword_10044C8B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10037F7F0, &type metadata for RTCCSDConversationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10044C8B0);
  }

  return result;
}

unint64_t sub_1002A6AE4()
{
  unint64_t result = qword_10044C8B8;
  if (!qword_10044C8B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10037F760, &type metadata for RTCCSDConversationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10044C8B8);
  }

  return result;
}

unint64_t sub_1002A6B24()
{
  unint64_t result = qword_10044C8C0;
  if (!qword_10044C8C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10037F788, &type metadata for RTCCSDConversationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10044C8C0);
  }

  return result;
}

uint64_t sub_1002A6B60@<X0>(uint64_t a1@<X0>, char a2@<W8>)
{
  *(_BYTE *)(v3 - 104) = a2;
  return KeyedEncodingContainer.encode(_:forKey:)(a1, v3 - 104, v2);
}

uint64_t sub_1002A6B78@<X0>(uint64_t a1@<X0>, char a2@<W8>)
{
  *(_BYTE *)(v3 - 104) = a2;
  return KeyedEncodingContainer.encode(_:forKey:)(a1, v3 - 104, v2);
}

uint64_t sub_1002A6B90@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v2 - 104) = a1;
  return KeyedEncodingContainer.encode(_:forKey:)(v2 - 104, v1);
}

uint64_t sub_1002A6BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_1002A6BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W8>)
{
  *(_BYTE *)(v4 - 104) = a3;
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, v4 - 104, v3);
}

uint64_t sub_1002A6BD0@<X0>(uint64_t a1@<X8>)
{
  return swift_beginAccess(v1 + a1, v2 - 120, 0LL, 0LL);
}

void sub_1002A6BE8()
{
}

  ;
}

uint64_t sub_1002A6BFC()
{
  return sub_1001B4B94(0LL, v0, v1);
}

uint64_t sub_1002A6C0C@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t sub_1002A6C1C(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, v1, v2);
}

uint64_t sub_1002A6C28@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

id sub_1002A6C30()
{
  return [v0 *(SEL *)(v1 + 3576)];
}

uint64_t sub_1002A6C3C()
{
  return sub_10024E694(v0);
}

void sub_1002A6C44(unint64_t *a1)
{
}

uint64_t sub_1002A6C50(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, v1, v2);
}

uint64_t sub_1002A6C7C()
{
  return swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate);
}

uint64_t sub_1002A6CD8(uint64_t a1)
{
  return swift_unknownObjectRelease(a1);
}

char *sub_1002A6D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unsigned int v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType(v6);
  uint64_t v13 = OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments;
  *(void *)&v6[OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments] = 0LL;
  uint64_t v14 = &v6[OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate];
  swift_unknownObjectWeakInit(&v6[OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate]);
  uint64_t v15 = *(void **)&v6[v13];
  *(void *)&v6[v13] = 0LL;
  unint64_t v16 = v6;

  swift_unknownObjectWeakAssign(v14, a4);
  v21.receiver = v16;
  v21.super_class = ObjectType;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v21, "init");
  id v18 = sub_1002A7788(a1, a2, a3, v17, a5);

  swift_unknownObjectRelease(a4);
  if (v18)
  {
    uint64_t v19 = *(void **)&v17[OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments];
    *(void *)&v17[OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments] = v18;
  }

  else
  {

    return 0LL;
  }

  return v17;
}

id sub_1002A6ED8()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments);
  if (result) {
    return [result streamToken];
  }
  __break(1u);
  return result;
}

SEL *sub_1002A6FA0(SEL *result)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments)) {
    return (SEL *)[*(id *)(v1 + OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments) *result];
  }
  __break(1u);
  return result;
}

id sub_1002A6FC0(id result, unsigned __int8 a2, uint64_t a3, void *a4)
{
  int v5 = *(void **)(v4 + OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_moments);
  if (v5)
  {
    NSString v6 = a4;
    unsigned __int8 v8 = result;
    if (a4)
    {
      id v9 = v5;
      NSString v6 = String._bridgeToObjectiveC()();
    }

    else
    {
      id v10 = v5;
    }

    id v11 = [v5 newRequestWithMediaType:v8 mode:a2 requesteeID:v6];

    return v11;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1002A70E0()
{
}

uint64_t type metadata accessor for CSDAVCMoments()
{
  return objc_opt_self(&OBJC_CLASS____TtC13callservicesd13CSDAVCMoments);
}

void sub_1002A7170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_1001F8604(OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate);
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    [v4 moments:v2 capabilitiesDidChange:a2];
    sub_1002A7820(v5);
  }

  else
  {
    sub_10010B978();
  }

uint64_t sub_1002A7220(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  uint64_t result = sub_1001F8604(OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate);
  if (result)
  {
    id v9 = (void *)result;
    if (a3) {
      a3 = (void *)_convertErrorToNSError(_:)(a3);
    }
    objc_msgSend(v9, *a4, v4, a2, a3);

    return swift_unknownObjectRelease(v9);
  }

  return result;
}

void sub_1002A72B8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, SEL *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = a5;
  sub_1002A7220((uint64_t)v13, (uint64_t)a4, a5, a6);
}

uint64_t sub_1002A73DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = sub_1001AFF14((uint64_t *)&unk_100447DE0);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v26 - v15;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v6 + OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate);
  if (result)
  {
    id v18 = (void *)result;
    sub_10021300C(a3, (uint64_t)v16);
    uint64_t v19 = type metadata accessor for URL(0LL);
    objc_super v21 = 0LL;
    if (sub_1002A782C((uint64_t)v16) != 1)
    {
      URL._bridgeToObjectiveC()(v20);
      objc_super v21 = v22;
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8LL))(v16, v19);
    }

    sub_10021300C(a4, (uint64_t)v14);
    if (sub_1002A782C((uint64_t)v14) == 1)
    {
      uint64_t v24 = 0LL;
      if (!a5) {
        goto LABEL_9;
      }
    }

    else
    {
      URL._bridgeToObjectiveC()(v23);
      uint64_t v24 = v25;
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8LL))(v14, v19);
      if (!a5)
      {
LABEL_9:
        [v18 moments:v6 didEndProcessingRequest:a2 stillImageURL:v21 movieURL:v24 error:a5];

        return swift_unknownObjectRelease(v18);
      }
    }

    a5 = (void *)_convertErrorToNSError(_:)(a5);
    goto LABEL_9;
  }

  return result;
}

void sub_1002A76DC()
{
  uint64_t v1 = (void *)sub_1001F8604(OBJC_IVAR____TtC13callservicesd13CSDAVCMoments_delegate);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_1002A7820((uint64_t)v2);
  }

  else
  {
    sub_10010B978();
  }

id sub_1002A7788(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  if (a3)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }

  else
  {
    NSString v9 = 0LL;
  }

  id v10 = [objc_allocWithZone(AVCMoments) initWithStreamToken:a1 requesterID:v9 delegate:a4 dispatchQueue:a5];

  return v10;
}

uint64_t sub_1002A7820(uint64_t a1)
{
  return swift_unknownObjectRelease(a1);
}

uint64_t sub_1002A782C(uint64_t a1)
{
  return sub_1001AB0AC(a1, 1LL, v1);
}

void sub_1002A7838(void *a1)
{
  if (a1[2])
  {
    sub_1001AFF14((uint64_t *)&unk_10044CA40);
    uint64_t v2 = (void *)sub_1002AB5BC();
  }

  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }

  sub_1002AB4D8();
  unint64_t v5 = v4 & v3;
  sub_1002AB83C();
  sub_1001EE280();
  swift_retain(v2);
  uint64_t v6 = 0LL;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v8 = v7 | (v6 << 6);
  while (1)
  {
    uint64_t v22 = (uint64_t *)(a1[6] + 16 * v8);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    sub_1001B03FC(a1[7] + 32 * v8, (uint64_t)v45);
    *(void *)&__int128 v44 = v24;
    *((void *)&v44 + 1) = v23;
    v42[2] = v44;
    v43[0] = v45[0];
    v43[1] = v45[1];
    *(void *)&v42[0] = v24;
    *((void *)&v42[0] + 1) = v23;
    sub_1001E927C();
    sub_1001E9260( (uint64_t)&v34,  (uint64_t)v42,  (uint64_t)&type metadata for String,  (uint64_t)&type metadata for AnyHashable);
    sub_1001B03EC(v43, v37);
    __int128 v38 = v34;
    __int128 v39 = v35;
    uint64_t v40 = v36;
    sub_1001B03EC(v37, v41);
    __int128 v34 = v38;
    __int128 v35 = v39;
    uint64_t v36 = v40;
    sub_1001B03EC(v41, v42);
    sub_1001B03EC(v42, &v38);
    AnyHashable._rawHashValue(seed:)(v2[5]);
    sub_1002AB5D8();
    if (v25)
    {
      sub_100201674();
      while (++v28 != v29 || (v27 & 1) == 0)
      {
        BOOL v30 = v28 == v29;
        if (v28 == v29) {
          uint64_t v28 = 0LL;
        }
        v27 |= v30;
        if (v2[v28 + 8] != -1LL)
        {
          sub_100201660();
          goto LABEL_36;
        }
      }

      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }

    sub_100201688();
LABEL_36:
    sub_1002AB4AC(v26);
    *(_OWORD *)uint64_t v31 = v34;
    *(_OWORD *)(v31 + 16) = v35;
    *(void *)(v31 + 32) = v36;
    sub_1001B03EC(&v38, (_OWORD *)(v2[7] + 32 * v32));
    ++v2[2];
    if (v5) {
      goto LABEL_5;
    }
LABEL_6:
    if (__OFADD__(v6, 1LL)) {
      goto LABEL_40;
    }
    sub_1002AB808();
    if (v10 == v11) {
      goto LABEL_38;
    }
    if (!*(void *)(v33 + 8 * v9))
    {
      sub_1002AB560();
      if (v10 == v11) {
        goto LABEL_38;
      }
      sub_1002AB6CC();
      if (!v12)
      {
        sub_1002AB560();
        if (v10 == v11) {
          goto LABEL_38;
        }
        sub_1002AB6CC();
        if (!v13)
        {
          sub_1002AB560();
          if (v10 == v11) {
            goto LABEL_38;
          }
          sub_1002AB6CC();
          if (!v14)
          {
            sub_1002AB808();
            if (v10 == v11)
            {
LABEL_38:
              sub_1002AB7A8();
              sub_1002AB780();
              return;
            }

            if (!*(void *)(v33 + 8 * v15)) {
              break;
            }
          }
        }
      }
    }

void sub_1002A7AFC(void *a1)
{
  if (a1[2])
  {
    sub_1001AFF14((uint64_t *)&unk_10044CA40);
    uint64_t v2 = (void *)sub_1002AB5BC();
  }

  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }

  sub_1002AB4D8();
  unint64_t v5 = v4 & v3;
  sub_1002AB83C();
  sub_1001EE280();
  swift_retain(v2);
  uint64_t v6 = 0LL;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v8 = v7 | (v6 << 6);
  while (1)
  {
    uint64_t v22 = (uint64_t *)(a1[6] + 16 * v8);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    char v25 = (uint64_t *)(a1[7] + 16 * v8);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    *(void *)&v46[0] = v24;
    *((void *)&v46[0] + 1) = v23;
    swift_bridgeObjectRetain(v23);
    sub_1001E927C();
    sub_1001E9260( (uint64_t)&v38,  (uint64_t)v46,  (uint64_t)&type metadata for String,  (uint64_t)&type metadata for AnyHashable);
    v37[0] = v27;
    v37[1] = v26;
    sub_1001E9260((uint64_t)v41, (uint64_t)v37, (uint64_t)&type metadata for String, (uint64_t)&type metadata for Any + 8);
    __int128 v42 = v38;
    __int128 v43 = v39;
    uint64_t v44 = v40;
    sub_1001B03EC(v41, v45);
    __int128 v38 = v42;
    __int128 v39 = v43;
    uint64_t v40 = v44;
    sub_1001B03EC(v45, v46);
    sub_1001B03EC(v46, &v42);
    AnyHashable._rawHashValue(seed:)(v2[5]);
    sub_1002AB5D8();
    if (v28)
    {
      sub_100201674();
      while (++v31 != v32 || (v30 & 1) == 0)
      {
        BOOL v33 = v31 == v32;
        if (v31 == v32) {
          uint64_t v31 = 0LL;
        }
        v30 |= v33;
        if (v2[v31 + 8] != -1LL)
        {
          sub_100201660();
          goto LABEL_36;
        }
      }

      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }

    sub_100201688();
LABEL_36:
    sub_1002AB4AC(v29);
    *(_OWORD *)uint64_t v34 = v38;
    *(_OWORD *)(v34 + 16) = v39;
    *(void *)(v34 + 32) = v40;
    sub_1001B03EC(&v42, (_OWORD *)(v2[7] + 32 * v35));
    ++v2[2];
    if (v5) {
      goto LABEL_5;
    }
LABEL_6:
    if (__OFADD__(v6, 1LL)) {
      goto LABEL_40;
    }
    sub_1002AB808();
    if (v10 == v11) {
      goto LABEL_38;
    }
    if (!*(void *)(v36 + 8 * v9))
    {
      sub_1002AB560();
      if (v10 == v11) {
        goto LABEL_38;
      }
      sub_1002AB6CC();
      if (!v12)
      {
        sub_1002AB560();
        if (v10 == v11) {
          goto LABEL_38;
        }
        sub_1002AB6CC();
        if (!v13)
        {
          sub_1002AB560();
          if (v10 == v11) {
            goto LABEL_38;
          }
          sub_1002AB6CC();
          if (!v14)
          {
            sub_1002AB808();
            if (v10 == v11)
            {
LABEL_38:
              sub_1002AB7A8();
              sub_1002AB780();
              return;
            }

            if (!*(void *)(v36 + 8 * v15)) {
              break;
            }
          }
        }
      }
    }

void sub_1002A7DB0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1001AFF14(&qword_10044CA28);
    uint64_t v2 = (void *)sub_1002AB5BC();
  }

  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v37 = a1 + 64;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v36 = (unint64_t)(63 - v3) >> 6;
  sub_1001EE280();
  uint64_t v6 = 0LL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v8 = v7 | (v6 << 6);
      }

      else
      {
        int64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1LL)) {
          goto LABEL_37;
        }
        if (v9 >= v36)
        {
LABEL_34:
          sub_1001B4B8C(a1);
          return;
        }

        if (!*(void *)(v37 + 8 * v9))
        {
          sub_1002AB7F0();
          if (v10 == v11) {
            goto LABEL_34;
          }
          sub_1002AB850();
          if (!v12)
          {
            sub_1002AB7F0();
            if (v10 == v11) {
              goto LABEL_34;
            }
            sub_1002AB850();
            if (!v13)
            {
              sub_1002AB7F0();
              if (v10 == v11) {
                goto LABEL_34;
              }
              sub_1002AB850();
              if (!v15)
              {
                int64_t v16 = v14 + 4;
                if (v16 >= v36) {
                  goto LABEL_34;
                }
                if (!*(void *)(v37 + 8 * v16))
                {
                  while (!__OFADD__(v16, 1LL))
                  {
                    sub_1002AB7F0();
                    if (v10 == v11) {
                      goto LABEL_34;
                    }
                    sub_1002AB850();
                    int64_t v16 = v17 + 1;
                    if (v18) {
                      goto LABEL_28;
                    }
                  }

                  goto LABEL_38;
                }
              }
            }
          }
        }

void sub_1002A8008(void *a1)
{
}

void sub_1002A8064(void *a1)
{
}

void sub_1002A8084(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (qword_100446920 != -1) {
    swift_once(&qword_100446920, sub_1002589D4);
  }
  uint64_t v9 = sub_1001B0E98();
  char v10 = (os_log_s *)sub_1001B0D98(v9, (uint64_t)qword_100454180);
  id v11 = a1;
  uint64_t v12 = v10;
  Logger.logObject.getter(v11, v13, v14);
  os_log_type_t v15 = sub_1001B105C();
  if (sub_10022CD18(v15))
  {
    uint64_t v24 = a4;
    int64_t v16 = (uint8_t *)sub_1001B0E78(12LL);
    uint64_t v17 = sub_1001B0E78(32LL);
    uint64_t v25 = (uint64_t)v11;
    uint64_t v26 = v17;
    *(_DWORD *)int64_t v16 = 136315138;
    uint64_t v18 = sub_1001B4C00(v17, &qword_100449418, &OBJC_CLASS___TUConversationActivitySession_ptr);
    id v19 = v11;
    uint64_t v20 = String.init<A>(reflecting:)(&v25, v18);
    unint64_t v22 = v21;
    uint64_t v25 = sub_1001D7CF0(v20, v21, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v16 + 4, v16 + 12);

    unint64_t v23 = v22;
    a4 = v24;
    swift_bridgeObjectRelease(v23);
    sub_1001B0FD8((void *)&_mh_execute_header, v12, v4, a2, v16);
    sub_1001B0F64(v17);
    sub_1001B0E60(v17);
    sub_1001B0E60((uint64_t)v16);
  }

  else
  {
  }

  sub_1002A8830(v11, a3, a4);
  sub_1001E9024();
}

void sub_1002A8278(uint64_t a1, int a2)
{
  if (qword_100446920 != -1) {
    swift_once(&qword_100446920, sub_1002589D4);
  }
  uint64_t v4 = sub_1001B0E98();
  sub_1001B0D98(v4, (uint64_t)qword_100454180);
  id v5 = sub_1002AB874();
  unint64_t v8 = (os_log_s *)Logger.logObject.getter(v5, v6, v7);
  os_log_type_t v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = sub_1001B0E78(22LL);
    uint64_t v11 = sub_1001B0E78(64LL);
    uint64_t v49 = (uint64_t)v5;
    uint64_t v50 = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = sub_1001B4C00(v11, &qword_100449418, &OBJC_CLASS___TUConversationActivitySession_ptr);
    int v13 = a2;
    id v14 = v5;
    uint64_t v15 = String.init<A>(reflecting:)(&v49, v12);
    uint64_t v49 = sub_1002AB7E4(v15, v16, v17, v18, v19);
    sub_1002AB7FC(v49, (uint64_t)&v50, v20, v10 + 12, v21, v22);

    a2 = v13;
    sub_1001B92A4();
    *(_WORD *)(v10 + 12) = 2080;
    LODWORD(v49) = v13;
    type metadata accessor for IDSGroupSessionServerErrorCode(0LL);
    uint64_t v24 = String.init<A>(reflecting:)(&v49, v23);
    uint64_t v49 = sub_1002AB7E4(v24, v25, v26, v27, v28);
    sub_1002AB7FC(v49, (uint64_t)&v50, v29, v10 + 22, v30, v31);
    sub_1001B92A4();
    sub_1002AB7D8( (void *)&_mh_execute_header,  v8,  v9,  "Logged session server termination event for session: %s reason: %s");
    swift_arrayDestroy(v11, 2LL);
    sub_1001B0E60(v11);
    sub_1001B0E60(v10);
  }

  else
  {
  }

  id v33 = sub_1001B115C(v32, "activity");
  sub_1002AB318(v33);
  if (v35)
  {
    uint64_t v37 = v34;
    uint64_t v38 = v35;
    uint64_t v39 = sub_1001AFF14(&qword_10044CA20);
    uint64_t inited = swift_initStackObject(v39, v51);
    *(_OWORD *)(inited + 16) = xmmword_10037B1B0;
    *(void *)(inited + 32) = 0xD000000000000010LL;
    *(void *)(inited + 40) = 0x800000010036C0D0LL;
    uint64_t v41 = sub_1001B4C00(inited, (unint64_t *)&qword_1004491D8, &OBJC_CLASS___NSString_ptr);
    *(void *)(inited + 48) = sub_1002A85B0(v37, v38);
    *(void *)(inited + 56) = 0xD000000000000012LL;
    *(void *)(inited + 64) = 0x8000000100378430LL;
    LODWORD(v50) = a2;
    uint64_t v42 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt32,  &protocol witness table for UInt32);
    *(void *)(inited + 72) = sub_1002A85B0(v42, v43);
    uint64_t v44 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  v41,  &protocol witness table for String);
    sub_1002AB864(v44);
    sub_1001B0EB8();
    sub_1002AB740(0xD00000000000003BLL, (uint64_t)"com.apple.callservicesd.shareplay-session-server-terminated");
    sub_1001AA9C8();
  }

  else
  {
    char v45 = (os_log_s *)Logger.logObject.getter(v34, 0LL, v36);
    os_log_type_t v47 = static os_log_type_t.error.getter(v45, v46);
    if (sub_1001D9224(v47))
    {
      unint64_t v48 = (uint8_t *)sub_1001B0E78(2LL);
      *(_WORD *)unint64_t v48 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  v2,  "Couldn't log server termination event because of no bundleIdentifier on activitySession",  v48,  2u);
      sub_1001B0E60((uint64_t)v48);
    }
  }

id sub_1002A85B0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithString:v5];

  return v6;
}

uint64_t sub_1002A8670(char a1)
{
  if (qword_100446920 != -1) {
    swift_once(&qword_100446920, sub_1002589D4);
  }
  uint64_t v2 = sub_1001B0E98();
  uint64_t v3 = (os_log_s *)sub_1001B0D98(v2, (uint64_t)qword_100454180);
  Logger.logObject.getter(v3, v4, v5);
  os_log_type_t v6 = sub_1001B105C();
  if (os_log_type_enabled(v3, v6))
  {
    uint64_t v7 = (uint8_t *)sub_1001B0E78(8LL);
    *(_DWORD *)uint64_t v7 = 67109120;
    int v14 = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, v15, v7 + 4, v7 + 8);
    _os_log_impl((void *)&_mh_execute_header, v3, v6, "Logged DualSIMRingtoneState: %{BOOL}d", v7, 8u);
    sub_1001B0E60((uint64_t)v7);
  }

  uint64_t v8 = sub_1001AFF14((uint64_t *)&unk_10044CA30);
  uint64_t inited = swift_initStackObject(v8, v15);
  *(_OWORD *)(inited + 16) = xmmword_10037B290;
  *(void *)(inited + 32) = 0xD00000000000001ALL;
  *(void *)(inited + 40) = 0x80000001003783E0LL;
  v10.super.super.isa = Bool._bridgeToObjectiveC()().super.super.isa;
  *(NSNumber *)(inited + 48) = v10;
  uint64_t v11 = sub_1001B4C00((uint64_t)v10.super.super.isa, (unint64_t *)&qword_100448780, &OBJC_CLASS___NSNumber_ptr);
  uint64_t v12 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String, v11, &protocol witness table for String);
  sub_1002AB864(v12);
  sub_1001B0EB8();
  sub_1002AB740(0xD000000000000027LL, (uint64_t)"com.apple.callservicesd.dualSIMRingtone");
  return sub_1001AA9C8();
}

uint64_t sub_1002A8830(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = [a1 activity];
  id v7 = [v6 metadata];
  sub_1002AB86C();
  if (v3)
  {
    id v8 = [v3 context];
    sub_10022D294();
    id v10 = sub_1001D92AC(v9, "analyticsIdentifier");

    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    uint64_t v13 = v12;
  }

  else
  {
    uint64_t v13 = 0xE700000000000000LL;
    uint64_t v11 = 0x6E776F6E6B6E55LL;
  }

  uint64_t v14 = sub_1001AFF14(&qword_10044CA20);
  uint64_t inited = swift_initStackObject(v14, &v21);
  *(_OWORD *)(inited + 16) = xmmword_10037B1B0;
  strcpy((char *)(inited + 32), "activity_type");
  *(_WORD *)(inited + 46) = -4864;
  uint64_t v16 = sub_1001B4C00(inited, (unint64_t *)&qword_1004491D8, &OBJC_CLASS___NSString_ptr);
  *(void *)(inited + 48) = sub_1002A85B0(v11, v13);
  *(void *)(inited + 56) = 0x745F6E6F69746361LL;
  *(void *)(inited + 64) = 0xEB00000000657079LL;
  sub_1001EE280();
  *(void *)(inited + 72) = sub_1002A85B0(a2, a3);
  uint64_t v17 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String, v16, &protocol witness table for String);
  sub_1002AB864(v17);
  uint64_t v19 = v18;
  sub_1001B0EB8();
  sub_1002A96F0(0xD00000000000002ELL, 0x80000001003783B0LL, v19);
  return sub_1001AA9C8();
}

void sub_1002A89F0(void *a1, id a2)
{
  uint64_t v3 = v2;
  if ([a2 status] != 6 || !objc_msgSend(a2, "isEndpointOnCurrentDevice"))
  {
    id v33 = [a2 provider];
    unsigned int v34 = [v33 isTelephonyProvider];

    if (!v34) {
      return;
    }
    uint64_t v35 = (uint64_t *)(v3 + OBJC_IVAR___CSDAnalyticsReporter_callToStartTransportType);
    sub_1001B0E80(v3 + OBJC_IVAR___CSDAnalyticsReporter_callToStartTransportType, (uint64_t)v120, 0LL);
    uint64_t v36 = *v35;
    id v37 = a2;
    swift_bridgeObjectRetain(v36);
    sub_1001CA488(v37, v36);
    uint64_t v39 = v38;

    sub_1001B0F5C();
    if (v39) {
      return;
    }
    uint64_t v40 = sub_1002AB820();
    if (v40)
    {
      uint64_t v41 = v40;
      sub_1002AB698();
      uint64_t v115 = v42;
      uint64_t v116 = v43;
      AnyHashable.init<A>(_:)(v117, &v115, &type metadata for String, &protocol witness table for String);
      sub_1001CA108((uint64_t)v117, v41, &v118);
      sub_1001B0F5C();
      sub_1001D8504((uint64_t)v117);
      if (*((void *)&v119 + 1))
      {
        sub_1001B03EC(&v118, v117);
        type metadata accessor for AnalyticsReporter();
        sub_1001B03FC((uint64_t)v117, (uint64_t)&v118);
        uint64_t v44 = (uint64_t *)v37;
        unsigned __int8 v45 = sub_1002AA9E8((uint64_t)&v118);
        sub_1001BB478((uint64_t)&v118, (uint64_t *)&unk_1004474B0);
        id v46 = [objc_allocWithZone(NSNumber) initWithInteger:v45];
        sub_1001B0E80((uint64_t)v35, (uint64_t)&v118, 33LL);
        if (v46)
        {
          sub_1001FE660((uint64_t)v46, v44);
        }

        else
        {
          sub_1001FE00C(v44);
          sub_1002AB86C();
          uint64_t v44 = v35;
        }

        swift_endAccess(&v118);
        uint64_t v97 = sub_1001B0438(v117);
        goto LABEL_84;
      }
    }

    else
    {
      __int128 v118 = 0u;
      __int128 v119 = 0u;
    }

    uint64_t v97 = sub_1001BB478((uint64_t)&v118, (uint64_t *)&unk_1004474B0);
LABEL_84:
    id v98 = sub_1001B115C(v97, "callCenter");
    objc_super v99 = v98;
    if (v98)
    {
      id v100 = [v98 routeController];
      sub_10022D294();
      id v102 = sub_1001D92AC(v101, "pickedRoute");
      sub_1002AB86C();
    }

    type metadata accessor for AnalyticsReporter();
    uint64_t v103 = sub_1002AB06C(v99);
    uint64_t v105 = v104;

    sub_1001B0E80(v3 + OBJC_IVAR___CSDAnalyticsReporter_callToAudioRoutesTracker, (uint64_t)v117, 33LL);
    id v106 = v37;
    sub_1001FE654(v103, v105, (uint64_t)v106);
    swift_endAccess(v117);

    return;
  }

  type metadata accessor for AnalyticsReporter();
  uint64_t v6 = v2 + OBJC_IVAR___CSDAnalyticsReporter_callToStartTransportType;
  sub_1001B0E80(v2 + OBJC_IVAR___CSDAnalyticsReporter_callToStartTransportType, (uint64_t)v117, 0LL);
  uint64_t v7 = *(void *)v6;
  uint64_t v8 = (uint64_t)a2;
  sub_1001B922C();
  sub_1001CA488((void *)v8, v7);
  id v10 = v9;
  sub_1001B0F28();
  uint64_t v11 = (uint64_t *)(v2 + OBJC_IVAR___CSDAnalyticsReporter_callToAudioRoutesTracker);
  sub_1001B0E80(v2 + OBJC_IVAR___CSDAnalyticsReporter_callToAudioRoutesTracker, (uint64_t)&v118, 0LL);
  v110 = v11;
  uint64_t v12 = *v11;
  sub_1001B922C();
  sub_1001CA54C(v8, v12);
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  sub_1001B0F28();
  sub_1002A982C((void *)v8, v10, v14, v16);
  uint64_t v18 = v17;

  sub_1001B92A4();
  if (qword_100446920 != -1) {
    goto LABEL_90;
  }
LABEL_4:
  uint64_t v19 = sub_1001B0E98();
  uint64_t v20 = (os_log_s *)sub_1001B0D98(v19, (uint64_t)qword_100454180);
  uint64_t v21 = swift_bridgeObjectRetain_n(v18, 2LL);
  Logger.logObject.getter(v21, v22, v23);
  os_log_type_t v24 = sub_1001B105C();
  if (sub_10022CD18(v24))
  {
    unint64_t v25 = (uint8_t *)sub_1001B0E78(12LL);
    uint64_t v26 = sub_1001B0E78(32LL);
    v120[0] = v26;
    *(_DWORD *)unint64_t v25 = 136315138;
    uint64_t v27 = sub_1001B4C00(v26, (unint64_t *)&qword_100447BB0, &OBJC_CLASS___NSObject_ptr);
    uint64_t v28 = Dictionary.description.getter(v18, &type metadata for String, v27, &protocol witness table for String);
    uint64_t v29 = v6;
    unint64_t v31 = v30;
    uint64_t v115 = sub_1001D7CF0(v28, v30, v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, &v116, v25 + 4, v25 + 12);
    sub_1001B9280();
    unint64_t v32 = v31;
    uint64_t v6 = v29;
    swift_bridgeObjectRelease(v32);
    sub_1001B0FD8((void *)&_mh_execute_header, v20, (os_log_type_t)v14, "Logging end call to core analytics: %s", v25);
    sub_1001B0F64(v26);
    sub_1001B0E60(v26);
    sub_1001B0E60((uint64_t)v25);
  }

  else
  {

    sub_1001B9280();
  }

  sub_1002A96F0(0xD000000000000025LL, 0x8000000100378380LL, v18);
  sub_1001B0F28();
  sub_1001B0E80(v6, (uint64_t)v120, 33LL);
  id v47 = (id)v8;
  unint64_t v48 = (void *)sub_1001FE00C(v47);
  swift_endAccess(v120);

  uint64_t v115 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v49 = (uint64_t)[a1 calls];
  uint64_t v113 = sub_1001B4C00(v49, (unint64_t *)&qword_100447CE0, off_1003D5D70);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v49, v113);

  uint64_t v109 = *v110 + 64;
  uint64_t v50 = 1LL << *(_BYTE *)(*v110 + 32);
  uint64_t v51 = -1LL;
  if (v50 < 64) {
    uint64_t v51 = ~(-1LL << v50);
  }
  uint64_t v6 = v51 & *(void *)(*v110 + 64);
  uint64_t v52 = v8 & 0xFFFFFFFFFFFFFF8LL;
  int64_t v111 = (unint64_t)(v50 + 63) >> 6;
  if (v8 < 0) {
    uint64_t v52 = v8;
  }
  uint64_t v108 = v52;
  a1 = (void *)(v8 & 0xC000000000000001LL);
  uint64_t v112 = *v110;
  swift_bridgeObjectRetain(*v110);
  int64_t v53 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v54 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v55 = v54 | (v53 << 6);
      goto LABEL_43;
    }

    int64_t v56 = v53 + 1;
    if (__OFADD__(v53, 1LL)) {
      goto LABEL_89;
    }
    if (v56 >= v111)
    {
LABEL_69:
      sub_1001D9020();
      swift_release(v112);
      uint64_t v83 = v115;
      if ((unint64_t)v115 >> 62)
      {
        if (v115 < 0) {
          uint64_t v107 = v115;
        }
        else {
          uint64_t v107 = v115 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v115);
        uint64_t v84 = _CocoaArrayWrapper.endIndex.getter(v107);
        sub_1001B0F5C();
        if (v84)
        {
LABEL_71:
          if (v84 < 1) {
            goto LABEL_97;
          }
          for (uint64_t i = 0LL; i != v84; ++i)
          {
            if ((v83 & 0xC000000000000001LL) != 0) {
              id v86 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v83);
            }
            else {
              id v86 = *(id *)(v83 + 8 * i + 32);
            }
            v87 = v86;
            sub_1001B0E80((uint64_t)v110, (uint64_t)v120, 33LL);
            sub_1001E927C();
            sub_1001D7318((uint64_t)v87);
            uint64_t v89 = v88;
            char v91 = v90;
            sub_1001AA9C8();
            if ((v91 & 1) != 0)
            {
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v110);
              uint64_t v114 = *v110;
              uint64_t v93 = *v110;
              uint64_t *v110 = 0x8000000000000000LL;
              Swift::Int v94 = *(void *)(v93 + 24);
              sub_1001AFF14((uint64_t *)&unk_10044CA10);
              _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v94);

              unint64_t v95 = sub_100201124();
              _NativeDictionary._delete(at:)(v89, v114, v113, &type metadata for String, v95);
              uint64_t v96 = *v110;
              uint64_t *v110 = v114;
              sub_1001E43E0();
              swift_bridgeObjectRelease(v96);
            }

            swift_endAccess(v120);
          }
        }
      }

      else
      {
        uint64_t v84 = *(void *)((v115 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        if (v84) {
          goto LABEL_71;
        }
      }

      sub_1001B0F5C();
      return;
    }

    unint64_t v57 = *(void *)(v109 + 8 * v56);
    ++v53;
    if (v57) {
      goto LABEL_42;
    }
    int64_t v53 = v56 + 1;
    sub_1002AB764();
    if (v58 == v59) {
      goto LABEL_69;
    }
    sub_1002AB758();
    if (v57) {
      goto LABEL_42;
    }
    int64_t v53 = v60 + 2;
    sub_1002AB764();
    if (v58 == v59) {
      goto LABEL_69;
    }
    sub_1002AB758();
    if (v57) {
      goto LABEL_42;
    }
    int64_t v53 = v61 + 3;
    sub_1002AB764();
    if (v58 == v59) {
      goto LABEL_69;
    }
    sub_1002AB758();
    if (v57) {
      goto LABEL_42;
    }
    int64_t v53 = v62 + 4;
    sub_1002AB764();
    if (v58 == v59) {
      goto LABEL_69;
    }
    sub_1002AB758();
    if (v57) {
      goto LABEL_42;
    }
    int64_t v64 = v63 + 5;
    if (v64 >= v111) {
      goto LABEL_69;
    }
    unint64_t v57 = *(void *)(v109 + 8 * v64);
    if (!v57) {
      break;
    }
    int64_t v53 = v64;
LABEL_42:
    uint64_t v6 = (v57 - 1) & v57;
    unint64_t v55 = __clz(__rbit64(v57)) + (v53 << 6);
LABEL_43:
    uint64_t v66 = *(void **)(*(void *)(v112 + 48) + 8 * v55);
    if ((unint64_t)v8 >> 62)
    {
      id v82 = v66;
      swift_bridgeObjectRetain(v8);
      uint64_t v14 = (uint8_t *)_CocoaArrayWrapper.endIndex.getter(v108);
      if (!v14) {
        goto LABEL_50;
      }
    }

    else
    {
      uint64_t v14 = *(uint8_t **)((v8 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      id v67 = v66;
      swift_bridgeObjectRetain(v8);
      if (!v14) {
        goto LABEL_50;
      }
    }

    if (a1) {
      id v68 = (id)sub_1002AB7C8(0LL);
    }
    else {
      id v68 = *(id *)(v8 + 32);
    }
    sub_1002AB6B8((uint64_t)v68);
    sub_1002AB7D0();
    if ((v49 & 1) != 0)
    {
LABEL_48:

      sub_1001D9020();
    }

    else
    {
      if (v14 != (uint8_t *)1)
      {
        if (a1) {
          id v79 = (id)sub_1002AB7C8(1LL);
        }
        else {
          id v79 = *(id *)(v8 + 40);
        }
        sub_1002AB6B8((uint64_t)v79);
        sub_1002AB7D0();
        if ((v49 & 1) != 0) {
          goto LABEL_48;
        }
        if (v14 != (uint8_t *)2)
        {
          uint64_t v80 = 6LL;
          while (1)
          {
            uint64_t v49 = v80 - 4;
            id v81 = a1 ? (id)sub_1002AB7C8(v80 - 4) : *(id *)(v8 + 8 * v80);
            uint64_t v18 = v80 - 3;
            if (__OFADD__(v49, 1LL)) {
              break;
            }
            sub_1002AB6B8((uint64_t)v81);
            sub_1002AB7D0();
            if ((v49 & 1) != 0) {
              goto LABEL_48;
            }
            ++v80;
          }

          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          swift_once(&qword_100446920, sub_1002589D4);
          goto LABEL_4;
        }
      }

void sub_1002A93E4(int a1, void *a2, id a3)
{
  uint64_t v4 = v3;
  id v7 = [a3 status];
  if ((_DWORD)v7 != 5 && sub_1001B115C((uint64_t)v7, "status") != 6)
  {
    if (qword_100446920 != -1) {
      swift_once(&qword_100446920, sub_1002589D4);
    }
    uint64_t v8 = sub_1001B0E98();
    sub_1001B0D98(v8, (uint64_t)qword_100454180);
    id v9 = a3;
    id v10 = a2;
    id v11 = sub_1002AB874();
    id v12 = a2;
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v12, v13, v14);
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = sub_1001B0E78(22LL);
      uint64_t v27 = (void *)sub_1001B0E78(8LL);
      uint64_t v28 = sub_1001B0E78(32LL);
      v30[0] = v28;
      *(_DWORD *)uint64_t v17 = 136315394;
      id v18 = sub_1001B115C(v28, "callUUID");
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      unint64_t v21 = v20;

      uint64_t v29 = sub_1001D7CF0(v19, v21, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v17 + 4, v17 + 12);

      swift_bridgeObjectRelease(v21);
      *(_WORD *)(v17 + 12) = 2112;
      uint64_t v29 = (uint64_t)v12;
      id v22 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v17 + 14, v17 + 22);
      *uint64_t v27 = v12;

      sub_1002AB7D8((void *)&_mh_execute_header, v15, v16, "Audio route update for %s: %@");
      sub_1001AFF14(&qword_100447E80);
      sub_1001B0F64((uint64_t)v27);
      sub_1001B0E60((uint64_t)v27);
      sub_1001B0F64(v28);
      sub_1001B0E60(v28);
      sub_1001B0E60(v17);
    }

    else
    {
    }

    type metadata accessor for AnalyticsReporter();
    id v23 = v11;
    uint64_t v24 = sub_1002AB06C(v12);
    uint64_t v26 = v25;
    sub_1001B0E80(v4 + OBJC_IVAR___CSDAnalyticsReporter_callToAudioRoutesTracker, (uint64_t)v30, 33LL);
    sub_1001FE654(v24, v26, (uint64_t)v23);
    swift_endAccess(v30);
  }

  sub_1001E9024();
}

void sub_1002A96F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = swift_allocObject(&unk_1003E6768, 24LL, 7LL);
  *(void *)(v5 + 16) = a3;
  v8[4] = sub_1002AB408;
  uint64_t v9 = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_1002A97A8;
  v8[3] = &unk_1003E6780;
  uint64_t v6 = _Block_copy(v8);
  uint64_t v7 = v9;
  sub_1001EE280();
  swift_release(v7);
  AnalyticsSendEventLazy(v4, v6);
  _Block_release(v6);
}

Class sub_1002A97A8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_1001B4B94(0LL, (unint64_t *)&qword_100447BB0, &OBJC_CLASS___NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.isa = 0LL;
  }

  return v5.super.isa;
}

void sub_1002A982C(void *a1, void *a2, uint8_t *a3, uint64_t a4)
{
  v150 = a3;
  id v148 = a2;
  uint64_t v6 = sub_1001AFF14(&qword_100447EA0);
  __chkstk_darwin(v6);
  sub_1001BB4B4();
  v144 = (void *)v7;
  sub_1001BB5CC();
  __chkstk_darwin(v8);
  v149 = (char *)&v141 - v9;
  sub_1001BB5CC();
  __chkstk_darwin(v10);
  uint64_t v146 = (uint64_t)&v141 - v11;
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v153 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1001BB4B4();
  v142 = v13;
  sub_1001BB5CC();
  __chkstk_darwin(v14);
  v147 = (char *)&v141 - v15;
  sub_1001BB5CC();
  __chkstk_darwin(v16);
  v152 = (__objc2_meth_list **)((char *)&v141 - v17);
  sub_1001BB5CC();
  uint64_t v19 = __chkstk_darwin(v18);
  v143 = (char *)&v141 - v20;
  uint64_t v145 = sub_1001B4C00(v19, (unint64_t *)&qword_100447BB0, &OBJC_CLASS___NSObject_ptr);
  uint64_t v21 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  v145,  &protocol witness table for String);
  id v22 = sub_1001B115C(v21, "displayContext");
  sub_1002AACE4(v22);

  Int._bridgeToObjectiveC()();
  swift_isUniquelyReferenced_nonNull_native(v21);
  v156[0] = v21;
  v159[0] = 0x8000000000000000LL;
  v151 = (uint8_t *)0xD000000000000010LL;
  sub_10020051C();
  uint64_t v23 = sub_1002AB458();
  id v24 = sub_1001B115C(v23, "provider");
  sub_1002AB318(v24);
  if (v26) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = 0LL;
  }
  if (v26) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = (void *)0xE000000000000000LL;
  }
  sub_1001B4C00(v25, (unint64_t *)&qword_1004491D8, &OBJC_CLASS___NSString_ptr);
  sub_1002AB6D8(v27, (uint64_t)v28);
  sub_1002AB44C();
  sub_1002AB7B8();
  sub_1002AB48C();
  uint64_t v29 = v156[0];
  uint64_t v30 = sub_1002AB458();
  id v31 = objc_msgSend(sub_1001B115C(v30, "provider"), "identifier");
  sub_10022D294();
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v34 = v33;

  sub_1002AB6D8(v32, v34);
  sub_1002AB44C();
  v156[0] = v29;
  v159[0] = 0x8000000000000000LL;
  sub_1002AB750();
  uint64_t v35 = v156[0];
  uint64_t v36 = sub_1002AB458();
  sub_1001B115C(v36, "isIncoming");
  id v37 = sub_1002AB444();
  sub_1002AB4A0(v37);
  sub_1002AB44C();
  v156[0] = v35;
  sub_1002AB624();
  sub_1002AB750();
  uint64_t v38 = v156[0];
  uint64_t v39 = sub_1002AB458();
  sub_1001B115C(v39, "isOnHold");
  id v40 = sub_1002AB444();
  sub_1002AB4A0(v40);
  sub_1002AB44C();
  v156[0] = v38;
  sub_1002AB624();
  sub_10020051C();
  uint64_t v41 = sub_1002AB458();
  sub_1001B115C(v41, "isConnected");
  id v42 = sub_1002AB444();
  sub_1002AB4A0(v42);
  sub_1002AB44C();
  sub_1002AB638();
  sub_1002AB728();
  uint64_t v43 = sub_1002AB458();
  sub_1001B115C(v43, "status");
  id v44 = sub_1002AB444();
  sub_1002AB4A0(v44);
  sub_1002AB44C();
  sub_1002AB638();
  sub_10020051C();
  uint64_t v45 = sub_1002AB458();
  sub_1001B115C(v45, "isConferenced");
  id v46 = sub_1002AB444();
  sub_1002AB4A0(v46);
  sub_1002AB44C();
  sub_1002AB7B8();
  sub_1002AB48C();
  uint64_t v47 = v156[0];
  sub_1002AB458();
  [a1 callDuration];
  sub_1002355DC();
  if (v49)
  {
    __break(1u);
    goto LABEL_72;
  }

  if (v48 <= -1.0)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }

  if (v48 >= 1.84467441e19)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }

  [objc_allocWithZone(NSNumber) initWithUnsignedLongLong:(unint64_t)v48];
  sub_1002AB814();
  v156[0] = v47;
  v159[0] = 0x8000000000000000LL;
  sub_1002AB750();
  uint64_t v50 = v156[0];
  uint64_t v51 = sub_1002AB458();
  objc_msgSend(objc_allocWithZone(NSNumber), "initWithBool:", sub_1001B115C(v51, "isJunk"));
  sub_1002AB814();
  v156[0] = v50;
  sub_1002AB624();
  sub_10020051C();
  uint64_t v52 = v156[0];
  sub_1002AB458();
  if (a4) {
    uint64_t v53 = (uint64_t)v150;
  }
  else {
    uint64_t v53 = 1701736270LL;
  }
  if (a4) {
    uint64_t v54 = a4;
  }
  else {
    uint64_t v54 = 0xE400000000000000LL;
  }
  sub_1001B922C();
  sub_1002AB6D8(v53, v54);
  sub_1002AB554();
  v156[0] = v52;
  v159[0] = 0x8000000000000000LL;
  sub_1002AB750();
  uint64_t v55 = sub_1002AB458();
  id v56 = sub_1001B115C(v55, "junkConfidence");
  uint64_t v57 = sub_1002AADB4((uint64_t)v56);
  sub_1002AB6D8(v57, v58);
  sub_1002AB554();
  sub_1002AB678();
  sub_1002AB728();
  uint64_t v59 = sub_1002AB458();
  id v60 = sub_1001B115C(v59, "identificationCategory");
  uint64_t v61 = sub_1002AAE28((uint64_t)v60);
  sub_1002AB6D8(v61, v62);
  sub_1002AB554();
  sub_1002AB678();
  sub_10020051C();
  uint64_t v63 = v156[0];
  sub_1002AB458();
  uint64_t v64 = sub_1001B4B94(0LL, (unint64_t *)&qword_100448780, &OBJC_CLASS___NSNumber_ptr);
  unsigned __int8 v65 = sub_1001B115C(v64, "wasScreened");
  NSNumber.init(BOOLeanLiteral:)(v65);
  sub_1002AB554();
  v156[0] = v63;
  v159[0] = 0x8000000000000000LL;
  sub_10020051C();
  uint64_t v66 = v156[0];
  uint64_t v67 = sub_1002AB458();
  id v68 = sub_1001B115C(v67, "wasScreened");
  if ((_DWORD)v68) {
    LOBYTE(v68) = sub_1001B115C((uint64_t)v68, "isScreening") ^ 1;
  }
  NSNumber.init(BOOLeanLiteral:)((Swift::Bool)v68);
  swift_isUniquelyReferenced_nonNull_native(v66);
  v156[0] = v66;
  v159[0] = 0x8000000000000000LL;
  sub_1002AB460();
  uint64_t v69 = sub_1002AB458();
  id v70 = sub_1001B115C(v69, "liveVoicemailUnavailableReason");
  [sub_1002AB444() initWithInteger:v70];
  sub_1002AB44C();
  sub_1002AB7B8();
  sub_1002AB48C();
  uint64_t v71 = sub_1002AB428();
  id v72 = sub_1001B115C(v71, "provider");
  [v72 isSystemProvider];
  sub_1001D9294();
  uint64_t v74 = v152;
  uint64_t v75 = v153;
  if (!(_DWORD)v70)
  {
LABEL_27:
    p_opt_inst_meths = &OBJC_PROTOCOL___CSDCoreTelephonyClient.opt_inst_meths;
    if (sub_1001B115C(v73, "dateConnected"))
    {
      sub_1002AB5CC();

      uint64_t v84 = *(uint64_t (**)(char *, void *, uint64_t))(v75 + 32);
      uint64_t v85 = v149;
      sub_1002AB770();
      sub_1002AB57C();
      if (!v49)
      {
        uint64_t v86 = v84(v147, v85, v12);
        if (sub_1001B115C(v86, "dateStartedConnecting"))
        {
          sub_1002AB5CC();

          uint64_t v85 = v144;
          sub_1002AB770();
          sub_1002AB57C();
          if (!v49)
          {
            v87 = v85;
            uint64_t v88 = v142;
            v84(v142, v87, v12);
            os_log_type_t v77 = v147;
            if (Date.timeIntervalSince(_:)(v88) * 1000.0 < 0.0)
            {
              [sub_1002AB444() initWithInteger:0];
              sub_1002AB438();
              sub_1002AB524();
              sub_1002AB460();
              sub_1002AB428();
              uint64_t v74 = &OBJC_PROTOCOL___CSDCoreTelephonyClient.opt_inst_meths;
              if (qword_100446920 == -1) {
                goto LABEL_33;
              }
              goto LABEL_78;
            }

            sub_1002355DC();
            if (v49)
            {
              __break(1u);
            }

            else if (v139 > -1.0)
            {
              if (v139 < 1.84467441e19)
              {
                uint64_t v74 = &OBJC_PROTOCOL___CSDCoreTelephonyClient.opt_inst_meths;
                id v140 = sub_1002AB444();
                sub_10028EA98(v140, "initWithUnsignedLongLong:");
                sub_1002AB438();
                sub_1002AB524();
                sub_1002AB460();
                sub_1002AB428();
LABEL_69:
                uint64_t v104 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
                v104((uint64_t)v142, v12);
                goto LABEL_70;
              }

uint64_t sub_1002AA994(void *a1)
{
  id v1 = [a1 initialLinkType];
  else {
    return (0x60403020100uLL >> (8 * v1));
  }
}

uint64_t sub_1002AA9D0(uint64_t a1)
{
  if (a1 == 2) {
    return 2LL;
  }
  else {
    return a1 == 1;
  }
}

uint64_t sub_1002AA9E8(uint64_t a1)
{
  if (v18)
  {
    if ((swift_dynamicCast(v16, v17, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
    {
      uint64_t v2 = v16[0];
      unint64_t v1 = v16[1];
      uint64_t v3 = "kCallSubTypeWifi";
      if (v16[0] == 0xD000000000000010LL)
      {
        unint64_t v4 = sub_1002AB5FC((uint64_t)"kCallSubTypeWifi");
        if (v5) {
          goto LABEL_7;
        }
      }

      if ((sub_1002AB504((uint64_t)v3) & 1) != 0)
      {
        unint64_t v4 = v1;
LABEL_7:
        swift_bridgeObjectRelease(v4);
        return 2LL;
      }

      uint64_t v7 = 0xD000000000000011LL;
      uint64_t v8 = "kCallSubTypeVoLTE";
      if (v2 == 0xD000000000000011LL)
      {
        unint64_t v9 = sub_1002AB5FC((uint64_t)"kCallSubTypeVoLTE");
        if (v5) {
          goto LABEL_15;
        }
      }

      if ((sub_1002AB60C(v7, (uint64_t)v8) & 1) != 0)
      {
        unint64_t v9 = v1;
LABEL_15:
        swift_bridgeObjectRelease(v9);
        return 3LL;
      }

      uint64_t v10 = 0xD000000000000015LL;
      uint64_t v11 = "kCallSubTypeTelephony";
      if (v2 == 0xD000000000000015LL)
      {
        unint64_t v12 = sub_1002AB5FC((uint64_t)"kCallSubTypeTelephony");
        if (v5) {
          goto LABEL_20;
        }
      }

      if ((sub_1002AB60C(v10, (uint64_t)v11) & 1) != 0)
      {
        unint64_t v12 = v1;
LABEL_20:
        swift_bridgeObjectRelease(v12);
        return 1LL;
      }

      uint64_t v13 = "kCallSubTypeVoNR";
      if (v2 == 0xD000000000000010LL)
      {
        unint64_t v14 = sub_1002AB5FC((uint64_t)"kCallSubTypeVoNR");
        if (v5)
        {
          swift_bridgeObjectRelease(v14);
          return 4LL;
        }
      }

      char v15 = sub_1002AB504((uint64_t)v13);
      sub_1001B0EB8();
      if ((v15 & 1) != 0) {
        return 4LL;
      }
    }
  }

  else
  {
    sub_1001BB478((uint64_t)v17, (uint64_t *)&unk_1004474B0);
  }

  return 0LL;
}

id sub_1002AAB38(void *a1)
{
  id v1 = [a1 isVideo];
  if ((_DWORD)v1) {
    uint64_t v2 = 0xEE006F656469565FLL;
  }
  else {
    uint64_t v2 = 0xEE006F696475415FLL;
  }
  uint64_t v3 = (uint64_t)sub_1001B115C((uint64_t)v1, "isTTY");
  if ((_DWORD)v3)
  {
    sub_1001EE280();
    sub_1002AB85C(1498698847LL);
    uint64_t v3 = sub_1001B0EB8();
  }

  uint64_t v4 = (uint64_t)sub_1001B115C(v3, "isEmergency");
  if ((_DWORD)v4)
  {
    sub_1001EE280();
    v5._object = (void *)0xEA00000000007963LL;
    v5._countAndFlagsBits = 0x6E656772656D455FLL;
    String.append(_:)(v5);
    uint64_t v4 = sub_1001B0EB8();
  }

  uint64_t v6 = (uint64_t)sub_1001B115C(v4, "isVoicemail");
  if ((_DWORD)v6)
  {
    sub_1001EE280();
    v7._countAndFlagsBits = 0x616D6563696F565FLL;
    v7._object = (void *)0xEA00000000006C69LL;
    String.append(_:)(v7);
    uint64_t v6 = sub_1001B0EB8();
  }

  uint64_t v8 = (uint64_t)sub_1001B115C(v6, "isSOS");
  if ((_DWORD)v8)
  {
    sub_1001EE280();
    sub_1002AB85C(1397707615LL);
    uint64_t v8 = sub_1001B0EB8();
  }

  uint64_t v9 = (uint64_t)sub_1001B115C(v8, "isRTT");
  if ((_DWORD)v9)
  {
    sub_1001EE280();
    sub_1002AB85C(1414812255LL);
    uint64_t v9 = sub_1001B0EB8();
  }

  sub_1001B4C00(v9, (unint64_t *)&qword_1004491D8, &OBJC_CLASS___NSString_ptr);
  return sub_1002A85B0(0x657079546C6C6143LL, v2);
}

uint64_t sub_1002AACE4(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v2 = a1;
  sub_10024D128(v2, (SEL *)&selRef_contactName);
  uint64_t v5 = sub_1002AB5B0(v3, v4);
  if (v1)
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    sub_1002AB828(v5, (SEL *)&selRef_mapName);
    uint64_t v9 = sub_1002AB5B0(v7, v8);
    sub_1002AB828(v9, (SEL *)&selRef_suggestedName);
    uint64_t v12 = sub_1002AB5B0(v10, v11);
    sub_1002AB828(v12, (SEL *)&selRef_callDirectoryLabel);
    sub_1002AB5B0(v13, v14);
    id v15 = [v2 location];
    if (v15)
    {

      uint64_t v6 = 5LL;
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  return v6;
}

uint64_t sub_1002AADB4(uint64_t a1)
{
  uint64_t result = 1701736270LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      uint64_t result = 7827276LL;
      break;
    case 2LL:
      uint64_t result = 0x6D756964654DLL;
      break;
    case 3LL:
      uint64_t result = 1751607624LL;
      break;
    default:
      uint64_t result = 0x726568744FLL;
      break;
  }

  return result;
}

uint64_t sub_1002AAE28(uint64_t a1)
{
  uint64_t result = 1701736302LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      uint64_t result = 0x656E696665646E75LL;
      break;
    case 2LL:
      uint64_t result = 0x726568746FLL;
      break;
    case 3LL:
      uint64_t result = 0x7373656E69737562LL;
      break;
    case 4LL:
      uint64_t result = 0x6C6F632D74626564LL;
      break;
    case 5LL:
      uint64_t result = 0x636E656772656D65LL;
      break;
    case 6LL:
      uint64_t result = 0x6475617266LL;
      break;
    case 7LL:
      uint64_t result = 0x656D6E7265766F67LL;
      break;
    case 8LL:
      uint64_t result = 0x68746C616568LL;
      break;
    case 9LL:
      uint64_t result = 0x74616D726F666E69LL;
      break;
    case 10LL:
      uint64_t result = 0x2D726F662D746F6ELL;
      break;
    case 11LL:
      uint64_t result = 0x6C616E6F73726570LL;
      break;
    case 12LL:
      uint64_t result = 0x61636974696C6F70LL;
      break;
    case 13LL:
      uint64_t result = 0x732D63696C627570LL;
      break;
    case 14LL:
      uint64_t result = 0x6E6F73697270LL;
      break;
    case 15LL:
      uint64_t result = 1835102323LL;
      break;
    case 16LL:
      uint64_t v3 = 0x65666F6F7073LL;
      goto LABEL_22;
    case 17LL:
      uint64_t result = 0x796576727573LL;
      break;
    case 18LL:
      uint64_t result = 0x6B72616D656C6574LL;
      break;
    case 19LL:
      uint64_t v3 = 0x657473757274LL;
LABEL_22:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x64000000000000LL;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75LL;
      break;
  }

  return result;
}

uint64_t sub_1002AB06C(void *a1)
{
  if (!a1) {
    return 0x6E776F6E6B6E55LL;
  }
  id v2 = a1;
  id v3 = [v2 isBluetooth];
  if ((_DWORD)v3)
  {

    return 0x746F6F7465756C42LL;
  }

  else
  {
    id v5 = sub_1001D8F3C((uint64_t)v3, "isSpeaker");
    if ((_DWORD)v5)
    {

      return 0x72656B61657053LL;
    }

    else
    {
      id v6 = sub_1001D8F3C((uint64_t)v5, "isReceiver");
      if ((_DWORD)v6)
      {

        return 0x7265766965636552LL;
      }

      else
      {
        uint64_t v7 = (uint64_t)sub_1001D8F3C((uint64_t)v6, "isWiredHeadset");
        if ((v7 & 1) != 0 || (id v8 = sub_1001D8F3C(v7, "isWiredHeadphones"), (_DWORD)v8))
        {

          return 0x6465726957LL;
        }

        else
        {
          sub_1001D8F3C((uint64_t)v8, "isAuxiliary");
          sub_1001D9294();
          if (v1) {
            return 0x7261696C69787541LL;
          }
          else {
            return 0x726568744FLL;
          }
        }
      }
    }
  }

id sub_1002AB1B4()
{
  *(void *)&v0[OBJC_IVAR___CSDAnalyticsReporter_callToStartTransportType] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR___CSDAnalyticsReporter_callToAudioRoutesTracker] = &_swiftEmptyDictionarySingleton;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsReporter();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1002AB224()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsReporter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnalyticsReporter()
{
  return objc_opt_self(&OBJC_CLASS___CSDAnalyticsReporter);
}

uint64_t sub_1002AB2AC(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFF8LL) + 0x18);
  return result;
}

void sub_1002AB2D8(uint64_t a1)
{
  if (a1 + 1 > *(void *)(*(void *)v1 + 24LL) >> 1)
  {
    sub_1002B079C();
    *(void *)uint64_t v1 = v2;
  }

void sub_1002AB318(void *a1)
{
  id v2 = [a1 bundleIdentifier];

  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  sub_10010B978();
}

uint64_t sub_1002AB37C(void *a1)
{
  id v1 = [a1 providerContext];
  if (!v1) {
    return 0LL;
  }
  id v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  return v3;
}

uint64_t sub_1002AB3E4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1002AB408()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 16));
}

uint64_t sub_1002AB410(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1002AB420(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1002AB428()
{
  uint64_t v1 = *(void *)(v0 - 112);
  *(void *)(v0 - 112) = *(void *)(v0 - 184);
  return swift_bridgeObjectRelease(v1);
}

uint64_t sub_1002AB438()
{
  return swift_isUniquelyReferenced_nonNull_native(*(void *)(v0 - 112));
}

id sub_1002AB444()
{
  return objc_allocWithZone(*(Class *)(v0 + 400));
}

uint64_t sub_1002AB44C()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_1002AB458()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 112));
}

void sub_1002AB460()
{
}

void sub_1002AB47C()
{
}

void sub_1002AB48C()
{
}

id sub_1002AB4A0(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v2 + 2592), v1);
}

void sub_1002AB4AC(unint64_t a1@<X8>)
{
  *(void *)(v1 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << a1;
}

  ;
}

uint64_t sub_1002AB504@<X0>(uint64_t a1@<X8>)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)( v2,  v1,  0xD000000000000010LL,  (a1 - 32) | 0x8000000000000000LL,  0LL);
}

void sub_1002AB524()
{
  *(void *)(v0 - 184) = *(void *)(v0 - 112);
  *(void *)(v0 - 112) = 0x8000000000000000LL;
}

uint64_t sub_1002AB53C()
{
  *(void *)(v2 - 184) = *(void *)(v2 - 112);
  *(void *)(v2 - 112) = v1;
  return v0;
}

uint64_t sub_1002AB554()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

  ;
}

uint64_t sub_1002AB56C(uint64_t a1)
{
  return sub_1001A9670(a1, 1LL, 1LL, v1);
}

uint64_t sub_1002AB57C()
{
  return sub_1001AB0AC(v0, 1LL, v1);
}

uint64_t sub_1002AB5B0(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1002AB5BC()
{
  return static _DictionaryStorage.allocate(capacity:)(v0);
}

uint64_t sub_1002AB5CC()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

  ;
}

unint64_t sub_1002AB5FC@<X0>(uint64_t a1@<X8>)
{
  return (a1 - 32) | 0x8000000000000000LL;
}

uint64_t sub_1002AB60C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(v3, v2, a1, (a2 - 32) | 0x8000000000000000LL, 0LL);
}

uint64_t sub_1002AB624()
{
  *(void *)(v2 - 112) = v1;
  return v0;
}

uint64_t sub_1002AB638()
{
  *(void *)(v3 - 184) = v0;
  *(void *)(v3 - 112) = v2;
  return v1;
}

uint64_t sub_1002AB658()
{
  *(void *)(v1 - 184) = *(void *)(v1 - 112);
  *(void *)(v1 - 112) = 0x8000000000000000LL;
  return v0;
}

uint64_t sub_1002AB678()
{
  *(void *)(v3 - 184) = v0;
  *(void *)(v3 - 112) = v2;
  return v1;
}

  ;
}

uint64_t sub_1002AB6B8(uint64_t a1)
{
  return static NSObject.== infix(_:_:)(a1, v1);
}

void sub_1002AB6C4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
}

  ;
}

id sub_1002AB6D8(uint64_t a1, uint64_t a2)
{
  return sub_1002A85B0(a1, a2);
}

void sub_1002AB6E0()
{
  *(void *)(v0 - 184) = *(void *)(v0 - 112);
  *(void *)(v0 - 112) = 0x8000000000000000LL;
}

void sub_1002AB6FC()
{
  *(void *)(v0 - 184) = *(void *)(v0 - 112);
  *(void *)(v0 - 112) = 0x8000000000000000LL;
}

double sub_1002AB718()
{
  return sub_1001CA108(v1 - 184, v0, (_OWORD *)(v1 - 144));
}

void sub_1002AB728()
{
}

  ;
}

void sub_1002AB740(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_1002AB750()
{
}

  ;
}

  ;
}

uint64_t sub_1002AB770()
{
  return v1(v0, v3, v2);
}

uint64_t sub_1002AB780()
{
  return v1;
}

uint64_t sub_1002AB7A8()
{
  return swift_release(v0);
}

void sub_1002AB7B8()
{
  *(void *)(v2 - 184) = v0;
  *(void *)(v2 - 112) = v1;
}

uint64_t sub_1002AB7C8(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

void sub_1002AB7D0()
{
}

void sub_1002AB7D8(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_1002AB7E4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return sub_1001D7CF0(a1, a2, (uint64_t *)va);
}

  ;
}

uint64_t sub_1002AB7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, a2, v6, a4);
}

  ;
}

uint64_t sub_1002AB814()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_1002AB820()
{
  return sub_1002AB37C(v0);
}

void sub_1002AB828(uint64_t a1, SEL *a2)
{
}

id sub_1002AB830(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v2 + 2592), v1);
}

  ;
}

  ;
}

void sub_1002AB85C(uint64_t a1)
{
  unint64_t v1 = 0xE400000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

void sub_1002AB864(uint64_t a1)
{
}

void sub_1002AB86C()
{
}

id sub_1002AB874()
{
  return v0;
}

uint64_t sub_1002AB87C()
{
  uint64_t result = NSString.init(stringLiteral:)("com.apple.telephonyutilities.callservicesd", 42LL, 2LL);
  qword_1004543C0 = result;
  return result;
}

uint64_t sub_1002AB8E8()
{
  uint64_t result = NSString.init(stringLiteral:)("TelephonyUtilities", 18LL, 2LL);
  qword_1004543C8 = result;
  return result;
}

id sub_1002AB928(void *a1, id *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return *a2;
}

uint64_t sub_1002AB9C4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_account);
  swift_bridgeObjectRetain(*(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_account + 8));
  return v1;
}

uint64_t sub_1002ABA58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR___CSDKeychainPasswordItem_account);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___CSDKeychainPasswordItem_account + 8);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

id sub_1002ABA74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (objc_class *)sub_1001B5DB8();
  uint64_t v14 = &v6[OBJC_IVAR___CSDKeychainPasswordItem_service];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  id v15 = &v6[OBJC_IVAR___CSDKeychainPasswordItem_account];
  *(void *)id v15 = a3;
  *((void *)v15 + 1) = a4;
  uint64_t v16 = &v6[OBJC_IVAR___CSDKeychainPasswordItem_accessGroup];
  *(void *)uint64_t v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v6;
  v18.super_class = v13;
  return objc_msgSendSuper2(&v18, "init");
}

char *sub_1002ABB88()
{
  uint64_t v1 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1002ABC6C();
  if (!v0)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    static String.Encoding.utf8.getter();
    uint64_t v8 = String.init(data:encoding:)(v6, v7, v3);
    if (v9)
    {
      uint64_t v3 = (char *)v8;
    }

    else
    {
      unint64_t v11 = sub_1002AC7DC();
      sub_1001BB4C8((uint64_t)&type metadata for KeychainPasswordItem.KeychainError, v11);
      *(_DWORD *)uint64_t v12 = 1;
      *(_BYTE *)(v12 + 4) = 1;
      sub_1002AC900();
    }

    sub_1002AC924();
  }

  return v3;
}

uint64_t sub_1002ABC6C()
{
  uint64_t v8 = sub_1002AC2C0();
  v10[3] = &type metadata for Bool;
  LOBYTE(v10[0]) = 1;
  sub_1001FC598((uint64_t)v10, (void *)(id)kSecReturnData);
  CFTypeRef result = 0LL;
  uint64_t v0 = v8;
  type metadata accessor for CFString(0LL);
  sub_1002AC79C();
  isa = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  SecItemCopyMatching(isa, &result);

  if (result
    && (CFTypeRef v7 = result,
        swift_unknownObjectRetain(result),
        (swift_dynamicCast(v10, &v7, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for Data, 6LL) & 1) != 0))
  {
    uint64_t v0 = v10[0];
    id v2 = sub_1001704C4();
    uint64_t v3 = static os_log_type_t.default.getter(v2);
    os_log(_:dso:log:type:_:)( "Successfully read data from keychain",  36LL,  2LL,  &_mh_execute_header,  v2,  v3,  _swiftEmptyArrayStorage,  v7);

    swift_unknownObjectRelease(result);
  }

  else
  {
    unint64_t v4 = sub_1002AC7DC();
    sub_1001BB4C8((uint64_t)&type metadata for KeychainPasswordItem.KeychainError, v4);
    *(_DWORD *)uint64_t v5 = 0;
    *(_BYTE *)(v5 + 4) = 1;
    sub_1002AC900();
    swift_unknownObjectRelease(result);
  }

  return v0;
}

uint64_t sub_1002ABEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static String.Encoding.utf8.getter(v6);
  uint64_t v9 = String.data(using:allowLossyConversion:)(v8, 0LL, a1, a2);
  unint64_t v11 = v10;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (v11 >> 60 == 15)
  {
    __break(1u);
  }

  else
  {
    sub_1002ABF9C(v9, v11);
    return sub_1001BB464(v9, v11);
  }

  return result;
}

void sub_1002ABF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = sub_1002AC2C0();
  v31[3] = &type metadata for Data;
  v31[0] = a1;
  v31[1] = a2;
  uint64_t v4 = (id)kSecValueData;
  sub_1002AC918();
  sub_1001FC598((uint64_t)v31, v4);
  uint64_t v5 = v32;
  type metadata accessor for CFString(0LL);
  uint64_t v7 = v6;
  unint64_t v8 = sub_1002AC79C();
  isa = (const __CFDictionary *)sub_1002AC908().super.isa;
  swift_bridgeObjectRelease(v5);
  OSStatus v10 = SecItemAdd(isa, 0LL);

  if (v10 == -25299)
  {
    uint64_t v11 = sub_1002AC2C0();
    swift_bridgeObjectRelease(v11);
    uint64_t v12 = sub_1001AFF14(&qword_10044CA98);
    uint64_t inited = swift_initStackObject(v12, v30);
    *(_OWORD *)(inited + 16) = xmmword_10037B290;
    *(void *)(inited + 32) = v4;
    *(void *)(inited + 40) = a1;
    *(void *)(inited + 48) = a2;
    sub_1002AC918();
    uint64_t v14 = v4;
    uint64_t v15 = Dictionary.init(dictionaryLiteral:)(inited, v7, &type metadata for Data, v8);
    v16.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v15);
    uint64_t v17 = sub_1002AC2C0();
    objc_super v18 = (const __CFDictionary *)sub_1002AC908().super.isa;
    swift_bridgeObjectRelease(v17);
    LODWORD(v17) = SecItemUpdate(v18, (CFDictionaryRef)v16.super.isa);

    if ((_DWORD)v17 == noErr.getter())
    {
      id v19 = sub_1001704C4();
      uint64_t v20 = static os_log_type_t.default.getter(v19);
      sub_1001E43F4( (uint64_t)"Successfully updated item from keychain",  39LL,  v21,  (uint64_t)&_mh_execute_header,  v22,  v20,  (uint64_t)_swiftEmptyArrayStorage);

LABEL_6:
      return;
    }

    unint64_t v26 = sub_1002AC7DC();
    sub_1001BB4C8((uint64_t)&type metadata for KeychainPasswordItem.KeychainError, v26);
    *(_DWORD *)uint64_t v27 = -25299;
    *(_BYTE *)(v27 + 4) = 0;
    sub_1002AC900();
  }

  else
  {
    if (v10 == noErr.getter())
    {
      id v19 = sub_1001704C4();
      uint64_t v23 = static os_log_type_t.default.getter(v19);
      sub_1001E43F4( (uint64_t)"Successfully added item to keychain",  35LL,  v24,  (uint64_t)&_mh_execute_header,  v25,  v23,  (uint64_t)_swiftEmptyArrayStorage);
      goto LABEL_6;
    }

    unint64_t v28 = sub_1002AC7DC();
    sub_1001BB4C8((uint64_t)&type metadata for KeychainPasswordItem.KeychainError, v28);
    *(_DWORD *)uint64_t v29 = v10;
    *(_BYTE *)(v29 + 4) = 0;
    sub_1002AC900();
  }

uint64_t sub_1002AC2C0()
{
  uint64_t v1 = sub_1001AFF14((uint64_t *)&unk_10044CAA0);
  uint64_t inited = swift_initStackObject(v1, v16);
  *(_OWORD *)(inited + 16) = xmmword_10037B140;
  *(void *)(inited + 32) = kSecClass;
  type metadata accessor for CFString(0LL);
  uint64_t v15 = v3;
  *(void *)(inited + 40) = kSecClassGenericPassword;
  *(void *)(inited + 64) = v3;
  *(void *)(inited + 72) = kSecAttrService;
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_service + 8);
  *(void *)(inited + 80) = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_service);
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 104) = &type metadata for String;
  *(void *)(inited + 112) = kSecAttrAccount;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_account + 8);
  *(void *)(inited + 120) = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_account);
  *(void *)(inited + 128) = v5;
  *(void *)(inited + 144) = &type metadata for String;
  *(void *)(inited + 152) = kSecAttrAccessGroup;
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_accessGroup);
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_accessGroup + 8);
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 160) = v6;
  *(void *)(inited + 168) = v7;
  unint64_t v8 = sub_1002AC79C();
  uint64_t v9 = (id)kSecClass;
  OSStatus v10 = (id)kSecClassGenericPassword;
  uint64_t v11 = (id)kSecAttrService;
  swift_bridgeObjectRetain(v4);
  uint64_t v12 = (id)kSecAttrAccount;
  swift_bridgeObjectRetain(v5);
  uint64_t v13 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain(v7);
  return Dictionary.init(dictionaryLiteral:)(inited, v15, (char *)&type metadata for Any + 8, v8);
}

uint64_t sub_1002AC5E4()
{
  uint64_t v1 = sub_1001B5DB8();
  uint64_t v14 = _typeName(_:qualified:)(v1, 0LL);
  unint64_t v15 = v2;
  sub_1001B0FB4(40LL);
  uint64_t v4 = v14;
  unint64_t v3 = v15;
  uint64_t v14 = 0x3D746E756F636361LL;
  unint64_t v15 = 0xE800000000000000LL;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_account + 8);
  v13[0] = *(void *)(v0 + OBJC_IVAR___CSDKeychainPasswordItem_account);
  v13[1] = v5;
  swift_bridgeObjectRetain(v5);
  v6._countAndFlagsBits = String.init<A>(reflecting:)(v13, &type metadata for String);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  sub_1001B0FB4(32LL);
  uint64_t v8 = v14;
  uint64_t v9 = (void *)v15;
  uint64_t v14 = v4;
  unint64_t v15 = v3;
  swift_bridgeObjectRetain(v3);
  v10._countAndFlagsBits = v8;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v9);
  unint64_t v11 = v15;
  swift_bridgeObjectRetain(v15);
  sub_1001B0FB4(41LL);
  swift_bridgeObjectRelease(v11);
  return v14;
}

void sub_1002AC6F0()
{
}

uint64_t type metadata accessor for KeychainPasswordItem()
{
  return objc_opt_self(&OBJC_CLASS___CSDKeychainPasswordItem);
}

unint64_t sub_1002AC79C()
{
  unint64_t result = qword_100446DF0;
  if (!qword_100446DF0)
  {
    type metadata accessor for CFString(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10037A8D8, v1);
    atomic_store(result, (unint64_t *)&qword_100446DF0);
  }

  return result;
}

unint64_t sub_1002AC7DC()
{
  unint64_t result = qword_10044CA90;
  if (!qword_10044CA90)
  {
    unint64_t result = swift_getWitnessTable(&unk_10037F8F4, &type metadata for KeychainPasswordItem.KeychainError);
    atomic_store(result, (unint64_t *)&qword_10044CA90);
  }

  return result;
}

unint64_t sub_1002AC818()
{
  unint64_t result = qword_1004491D8;
  if (!qword_1004491D8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSString);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1004491D8);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for KeychainPasswordItem.KeychainError(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for KeychainPasswordItem.KeychainError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for KeychainPasswordItem.KeychainError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_1002AC8B4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1002AC8D0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    char v2 = 1;
  }

  else
  {
    char v2 = 0;
  }

  *(_BYTE *)(result + 4) = v2;
  return result;
}

ValueMetadata *type metadata accessor for KeychainPasswordItem.KeychainError()
{
  return &type metadata for KeychainPasswordItem.KeychainError;
}

uint64_t sub_1002AC900()
{
  return swift_willThrow();
}

NSDictionary sub_1002AC908()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1002AC918()
{
  return sub_1001BB31C(v1, v0);
}

uint64_t sub_1002AC924()
{
  return sub_1001BB39C(v1, v0);
}

void *sub_1002AC930(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = a3;
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (v6)
  {
    do
    {
      for (uint64_t i = 4LL; ; ++i)
      {
        id v8 = (v4 & 0xC000000000000001LL) != 0
           ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v4)
           : *(id *)(v4 + 8 * i);
        uint64_t v9 = v8;
        uint64_t v10 = i - 3;
        if (__OFADD__(i - 4, 1LL)) {
          break;
        }
        if ([v8 isBluetooth])
        {
          uint64_t v11 = sub_1002AD2EC();
          if (v11 == a2 && v12 == a3)
          {
            swift_bridgeObjectRelease(v4);
            uint64_t v16 = a3;
            uint64_t v4 = a3;
LABEL_18:
            swift_bridgeObjectRelease(v16);
            swift_bridgeObjectRelease(v4);
            return v9;
          }

          uint64_t v14 = v12;
          char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v12, a2, a3, 0LL);
          swift_bridgeObjectRelease(v14);
          if ((v15 & 1) != 0)
          {
            uint64_t v16 = a3;
            goto LABEL_18;
          }
        }

        if (v10 == v6)
        {
          swift_bridgeObjectRelease(a3);
          swift_bridgeObjectRelease(v4);
          return 0LL;
        }
      }

      __break(1u);
LABEL_20:
      if (v4 < 0) {
        uint64_t v17 = v4;
      }
      else {
        uint64_t v17 = v4 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v4);
      uint64_t v18 = _CocoaArrayWrapper.endIndex.getter(v17);
      uint64_t v5 = a3;
      uint64_t v6 = v18;
    }

    while (v18);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  return 0LL;
}

NSString sub_1002ACAB8()
{
  NSString result = String._bridgeToObjectiveC()();
  static HandoffAudioController.routeIdentifierChangedNotification = (uint64_t)result;
  return result;
}

uint64_t *HandoffAudioController.routeIdentifierChangedNotification.unsafeMutableAddressor()
{
  if (qword_1004469A8 != -1) {
    swift_once(&qword_1004469A8, sub_1002ACAB8);
  }
  return &static HandoffAudioController.routeIdentifierChangedNotification;
}

id static HandoffAudioController.routeIdentifierChangedNotification.getter()
{
  return sub_1002AB928(&qword_1004469A8, (id *)&static HandoffAudioController.routeIdentifierChangedNotification);
}

NSString sub_1002ACB5C()
{
  NSString result = String._bridgeToObjectiveC()();
  static HandoffAudioController.continueHandoffAudioRouteNotification = (uint64_t)result;
  return result;
}

uint64_t *HandoffAudioController.continueHandoffAudioRouteNotification.unsafeMutableAddressor()
{
  if (qword_1004469B0 != -1) {
    swift_once(&qword_1004469B0, sub_1002ACB5C);
  }
  return &static HandoffAudioController.continueHandoffAudioRouteNotification;
}

id static HandoffAudioController.continueHandoffAudioRouteNotification.getter()
{
  return sub_1002AB928(&qword_1004469B0, (id *)&static HandoffAudioController.continueHandoffAudioRouteNotification);
}

uint64_t sub_1002ACC00(uint64_t a1, uint64_t a2)
{
  char v3 = (void *)(v2 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier + 8);
  *char v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

char *HandoffAudioController.init()()
{
  uint64_t ObjectType = swift_getObjectType(v0);
  id v2 = [(id)objc_opt_self(TUCallCenter) sharedInstance];
  id v3 = [v2 queue];

  id v4 = sub_1002AF594();
  id v5 = [v4 audioDeviceController];

  id v6 = sub_1002AF594();
  id v7 = [v6 routeController];

  id v8 = sub_1002AF594();
  id v9 = [v8 conversationManager];

  uint64_t v10 = HandoffAudioController.__allocating_init(callCenterQueue:audioDeviceController:routeController:conversationManager:)();
  swift_deallocPartialClassInstance(v0, ObjectType, 64LL, 7LL);
  return v10;
}

char *HandoffAudioController.__allocating_init(callCenterQueue:audioDeviceController:routeController:conversationManager:)()
{
  uint64_t v32 = v1;
  uint64_t v33 = v2;
  uint64_t v29 = v3;
  uint64_t v30 = v4;
  uint64_t v27 = v5;
  unint64_t v28 = v6;
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_1001B0F00();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  sub_1001C7334();
  __chkstk_darwin(v13);
  sub_1001B0F00();
  uint64_t v16 = v15 - v14;
  type metadata accessor for DispatchQoS(0LL);
  sub_1001C7334();
  __chkstk_darwin(v17);
  sub_10022D01C();
  uint64_t v19 = sub_1001B4C00(v18, (unint64_t *)&qword_100449F70, &OBJC_CLASS___OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter(v19);
  id v31 = _swiftEmptyArrayStorage;
  uint64_t v20 = sub_1001E1F68( (unint64_t *)&unk_100449280,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v21 = sub_1001AFF14((uint64_t *)&unk_100449F80);
  uint64_t v22 = sub_10027AC40(&qword_100449290, (uint64_t *)&unk_100449F80);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v21, v22, v12, v20);
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))( v11,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v7);
  uint64_t v23 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000041LL,  0x80000001003786C0LL,  v0,  v16,  v11,  0LL);
  id v24 = [objc_allocWithZone((Class)type metadata accessor for SharedConversationServerBag()) init];
  uint64_t v25 = (char *)objc_allocWithZone((Class)type metadata accessor for HandoffAudioController());
  return sub_1002AEBBC(v23, v27, v28, v29, v30, v24, v25);
}

char *HandoffAudioController.__allocating_init(queue:callCenterQueue:audioDeviceController:routeController:conversationManager:serverBag:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v6 = (void *)sub_1002AF554();
  return sub_1002AEB48(v6, v7, v8, v9, v10, v11);
}

uint64_t type metadata accessor for HandoffAudioController()
{
  return objc_opt_self(&OBJC_CLASS___CSDHandoffAudioController);
}

char *HandoffAudioController.init(queue:callCenterQueue:audioDeviceController:routeController:conversationManager:serverBag:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v6 = (void *)sub_1002AF554();
  return sub_1002AEF50(v6, v7, v8, v9, v10, v11, v12);
}

void sub_1002ACFD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v29, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v11 = (char *)Strong;
    uint64_t v12 = OBJC_IVAR___CSDHandoffAudioController_routeController;
    [*(id *)(Strong + OBJC_IVAR___CSDHandoffAudioController_routeController) addDelegate:Strong];
    id v13 = [*(id *)&v11[v12] pickedRoute];
    if (v13)
    {
      uint64_t v14 = v13;
      if ([v13 isBluetooth])
      {
        uint64_t v25 = *(void *)&v11[OBJC_IVAR___CSDHandoffAudioController_queue];
        uint64_t v15 = swift_allocObject(&unk_1003E6940, 24LL, 7LL);
        swift_unknownObjectWeakInit(v15 + 16);
        uint64_t v16 = swift_allocObject(&unk_1003E6AD0, 32LL, 7LL);
        *(void *)(v16 + 16) = v15;
        *(void *)(v16 + 24) = v14;
        uint64_t v24 = v15;
        aBlock[4] = sub_1002AF4D8;
        uint64_t v28 = v16;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256LL;
        aBlock[2] = sub_1002356BC;
        aBlock[3] = &unk_1003E6AE8;
        uint64_t v22 = _Block_copy(aBlock);
        swift_retain(v15);
        id v23 = v14;
        static DispatchQoS.unspecified.getter(v23);
        unint64_t v26 = _swiftEmptyArrayStorage;
        uint64_t v17 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        uint64_t v18 = sub_1001AFF14((uint64_t *)&unk_1004478D0);
        uint64_t v19 = sub_10027AC40((unint64_t *)&qword_100447CC0, (uint64_t *)&unk_1004478D0);
        dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v18, v19, v2, v17);
        uint64_t v20 = v22;
        OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v5);
        _Block_release(v20);

        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

        uint64_t v21 = v28;
        swift_release(v24);
        swift_release(v21);
        return;
      }
    }
  }

void sub_1002AD290(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    uint64_t v4 = sub_1002AD2EC();
    sub_1002ACC00(v4, v5);
  }

uint64_t sub_1002AD2EC()
{
  unsigned int v1 = [v0 isBluetooth];
  id v2 = [v0 uniqueIdentifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  uint64_t v5 = v4;

  if (!v1) {
    return v3;
  }
  v9[2] = v3;
  v9[3] = v5;
  v9[0] = 45LL;
  v9[1] = 0xE100000000000000LL;
  unint64_t v6 = sub_1002683B8();
  uint64_t v7 = (void *)StringProtocol.components<A>(separatedBy:)( v9,  &type metadata for String,  &type metadata for String,  v6,  v6);
  uint64_t result = swift_bridgeObjectRelease(v5);
  if (v7[2])
  {
    uint64_t v3 = v7[4];
    swift_bridgeObjectRetain(v7[5]);
    swift_bridgeObjectRelease(v7);
    return v3;
  }

  __break(1u);
  return result;
}

void HandoffAudioController.__deallocating_deinit()
{
  uint64_t v2 = sub_1001C7360();
  uint64_t v17 = *(void *)(v2 - 8);
  sub_1001C7334();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_1001C7290();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  [*(id *)&v0[OBJC_IVAR___CSDHandoffAudioController_conversationManager] removeDelegate:v0];
  v16[1] = *(void *)&v0[OBJC_IVAR___CSDHandoffAudioController_callCenterQueue];
  uint64_t v8 = sub_1001C7370((uint64_t)&unk_1003E68F0, 24LL);
  *(void *)(v8 + 16) = v0;
  uint64_t v22 = sub_1002AF30C;
  uint64_t v23 = v8;
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256LL;
  uint64_t v9 = sub_1001E2064((uint64_t)sub_1002356BC);
  uint64_t v10 = v0;
  sub_1001C7348();
  uint64_t v19 = _swiftEmptyArrayStorage;
  uint64_t v11 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  sub_1001C7340();
  sub_1002AF5A0((unint64_t *)&qword_100447CC0);
  uint64_t v12 = sub_1002AF5C8();
  dispatch thunk of SetAlgebra.init<A>(_:)(v12, v13, v14, v2, v11);
  sub_1002AF5C0(0LL, (uint64_t)v7, v1, (uint64_t)v9);
  _Block_release(v9);
  sub_1001E91BC(v17);
  sub_100235674((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  swift_release(v23);
  uint64_t v15 = (objc_class *)type metadata accessor for HandoffAudioController();
  v18.receiver = v10;
  v18.super_class = v15;
  objc_msgSendSuper2(&v18, "dealloc");
  sub_1001B0FF8();
}

uint64_t sub_1002AD608(uint64_t a1, NSString a2)
{
  id v3 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  if (qword_1004469A8 != -1) {
    swift_once(&qword_1004469A8, sub_1002ACAB8);
  }
  uint64_t v4 = static HandoffAudioController.routeIdentifierChangedNotification;
  if (a2) {
    a2 = String._bridgeToObjectiveC()();
  }
  [v3 postNotificationName:v4 object:a2];

  return swift_unknownObjectRelease(a2);
}

void sub_1002AD6B8()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v28 = *(void *)(sub_1001C7360() - 8);
  sub_1001C7334();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_1001C7290();
  v27[2] = *(void *)(v5 - 8);
  v27[3] = v5;
  sub_1001C7334();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_1002AF518();
  uint64_t v8 = type metadata accessor for Notification(v7);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v27[1] = *(void *)(v1 + OBJC_IVAR___CSDHandoffAudioController_queue);
  uint64_t v12 = sub_1001C7370((uint64_t)&unk_1003E6940, 24LL);
  swift_unknownObjectWeakInit(v12 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v3, v8);
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = (v13 + 16) & ~v13;
  unint64_t v15 = (v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v16 = swift_allocObject(&unk_1003E6A08, v15 + 8, v13 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v16 + v14, v11, v8);
  *(void *)(v16 + v15) = v12;
  uint64_t v32 = sub_1002AF42C;
  uint64_t v33 = v16;
  uint64_t v30 = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256LL;
  uint64_t v17 = sub_1001E2064((uint64_t)sub_1002356BC);
  sub_10023929C();
  sub_1001C7348();
  uint64_t v29 = _swiftEmptyArrayStorage;
  uint64_t v18 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  sub_1001C7340();
  sub_1002AF5A0((unint64_t *)&qword_100447CC0);
  uint64_t v19 = sub_1002AF578();
  dispatch thunk of SetAlgebra.init<A>(_:)(v19, v20, v21, v22, v18);
  uint64_t v23 = sub_1002AF5E8();
  sub_1002AF5C0(v23, v24, v25, v26);
  _Block_release(v17);
  sub_1001E91BC(v28);
  sub_1001C73DC();
  sub_100239264();
  sub_100207134();
  sub_1001B0FF8();
}

uint64_t sub_1002AD8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Notification(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Notification.object.getter(v30, v6);
  if (!v30[3])
  {
    sub_1001B14E8((uint64_t)v30);
    goto LABEL_6;
  }

  if ((swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) == 0)
  {
LABEL_6:
    id v21 = sub_100170614();
    uint64_t v23 = static os_log_type_t.error.getter(v21, v22);
    uint64_t v24 = sub_1001AFF14((uint64_t *)&unk_100447E30);
    uint64_t v10 = swift_allocObject(v24, 72LL, 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_10037B290;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    uint64_t v25 = String.init<A>(reflecting:)(v8, v4);
    uint64_t v27 = v26;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_1001B2330();
    *(void *)(v10 + 32) = v25;
    *(void *)(v10 + 40) = v27;
    os_log(_:dso:log:type:_:)( "Could not parse audio route identifier from continue handoff notification: %@",  77LL,  2LL,  &_mh_execute_header,  v21,  v23,  v10);
    goto LABEL_7;
  }

  uint64_t v9 = a2 + 16;
  uint64_t v11 = v29[0];
  uint64_t v10 = v29[1];
  id v12 = sub_100170614();
  uint64_t v13 = sub_1001AFF14((uint64_t *)&unk_100447E30);
  uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_10037B290;
  v30[0] = v11;
  v30[1] = v10;
  swift_bridgeObjectRetain(v10);
  uint64_t v15 = String.init<A>(reflecting:)(v30, &type metadata for String);
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = &type metadata for String;
  unint64_t v18 = sub_1001B2330();
  *(void *)(v14 + 64) = v18;
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  uint64_t v19 = static os_log_type_t.default.getter(v18);
  os_log(_:dso:log:type:_:)( "Continuing handoff of audio route with identifier %@",  52LL,  2LL,  &_mh_execute_header,  v12,  v19,  v14);

  swift_bridgeObjectRelease(v14);
  swift_beginAccess(v9, v30, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v9);
  if (Strong)
  {
    id v21 = (id)Strong;
    sub_1002ADAF0();
LABEL_7:
  }

  return swift_bridgeObjectRelease(v10);
}

void sub_1002ADAF0()
{
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v24 = *(void *)(sub_1001C7360() - 8);
  sub_1001C7334();
  __chkstk_darwin(v6);
  sub_1001C7290();
  sub_1001C7334();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_1002AF518();
  uint64_t v9 = type metadata accessor for DispatchPredicate(v8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10022D01C();
  uint64_t v11 = *(void **)&v0[OBJC_IVAR___CSDHandoffAudioController_queue];
  *uint64_t v1 = v11;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v1, enum case for DispatchPredicate.onQueue(_:), v9);
  id v12 = v11;
  LOBYTE(v11) = _dispatchPreconditionTest(_:)(v1);
  (*(void (**)(void *, uint64_t))(v10 + 8))(v1, v9);
  if ((v11 & 1) != 0)
  {
    uint64_t v13 = (void *)sub_1001C7370((uint64_t)&unk_1003E6A58, 40LL);
    void v13[2] = v0;
    v13[3] = v5;
    v13[4] = v3;
    uint64_t v25 = v13;
    uint64_t v14 = sub_1001E2064((uint64_t)sub_1002356BC);
    uint64_t v15 = v0;
    swift_bridgeObjectRetain(v3);
    sub_1001C7348();
    uint64_t v16 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    sub_1001C7340();
    sub_1002AF5A0((unint64_t *)&qword_100447CC0);
    uint64_t v17 = sub_1002AF578();
    dispatch thunk of SetAlgebra.init<A>(_:)(v17, v18, v19, v20, v16);
    uint64_t v21 = sub_1002AF5E8();
    OS_dispatch_queue.async(group:qos:flags:execute:)(v21, v22, v23);
    _Block_release(v14);
    sub_1001E91BC(v24);
    sub_1001C73DC();
    swift_release(v25);
    sub_1001B0FF8();
  }

  else
  {
    __break(1u);
  }

void sub_1002ADD5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR___CSDHandoffAudioController_routeController;
  id v7 = [*(id *)(a1 + OBJC_IVAR___CSDHandoffAudioController_routeController) routes];
  uint64_t v8 = sub_1001B4B94(0LL, (unint64_t *)&qword_10044CAD0, &OBJC_CLASS___TURoute_ptr);
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  swift_bridgeObjectRetain(a3);
  id v18 = sub_1002AC930(v9, a2, a3);
  swift_bridgeObjectRelease(v9);
  if (v18)
  {
    [*(id *)(a1 + v6) pickRoute:v18];
  }

  else
  {
    id v10 = sub_100170614();
    uint64_t v12 = static os_log_type_t.error.getter(v10, v11);
    uint64_t v13 = sub_1001AFF14((uint64_t *)&unk_100447E30);
    uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
    *(_OWORD *)(v14 + 16) = xmmword_10037B290;
    v19[0] = a2;
    v19[1] = a3;
    swift_bridgeObjectRetain(a3);
    uint64_t v15 = String.init<A>(reflecting:)(v19, &type metadata for String);
    uint64_t v17 = v16;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = sub_1001B2330();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    os_log(_:dso:log:type:_:)( "Could not take audio route with identifier %@ active because either it could not be found as a valid route",  106LL,  2LL,  &_mh_execute_header,  v10,  v12,  v14);

    swift_bridgeObjectRelease(v14);
  }

void HandoffAudioController.conversationManager(_:stateChangedFor:)()
{
  uint64_t v3 = sub_1001C7360();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1001C7290();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  sub_1001C7334();
  __chkstk_darwin(v6);
  sub_1001B0F00();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_1001D920C();
  uint64_t v12 = *(void **)(v0 + OBJC_IVAR___CSDHandoffAudioController_callCenterQueue);
  *uint64_t v2 = v12;
  sub_1002AF5DC( enum case for DispatchPredicate.onQueue(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 104));
  id v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)(v2);
  uint64_t v14 = sub_100235674((uint64_t)v2, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  if ((v12 & 1) != 0)
  {
    if (sub_10022D078(v14, "state") == (id)3)
    {
      uint64_t v43 = v4;
      uint64_t v44 = v3;
      id v15 = sub_100170614();
      uint64_t v16 = sub_1001AFF14((uint64_t *)&unk_100447E30);
      uint64_t v17 = sub_1001C7370(v16, 72LL);
      *(_OWORD *)(v17 + 16) = xmmword_10037B290;
      uint64_t v18 = OBJC_IVAR___CSDHandoffAudioController_routeController;
      id v19 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                  + OBJC_IVAR___CSDHandoffAudioController_routeController), "pickedRoute"));
      if (v19)
      {
        uint64_t v20 = sub_1001B4C00((uint64_t)v19, (unint64_t *)&qword_10044CAD0, &OBJC_CLASS___TURoute_ptr);
        uint64_t v21 = sub_1001F8818(v20);
        unint64_t v23 = v22;
      }

      else
      {
        unint64_t v23 = 0xE300000000000000LL;
        uint64_t v21 = 7104878LL;
      }

      *(void *)(v17 + 56) = &type metadata for String;
      unint64_t v24 = sub_1001B2330();
      *(void *)(v17 + 64) = v24;
      *(void *)(v17 + 32) = v21;
      *(void *)(v17 + 40) = v23;
      uint64_t v25 = static os_log_type_t.default.getter(v24);
      os_log(_:dso:log:type:_:)( "Conversation become joined, current route is %@",  47LL,  2LL,  &_mh_execute_header,  v15,  v25,  v17);

      swift_bridgeObjectRelease(v17);
      id v26 = [*(id *)(v0 + v18) pickedRoute];
      if (v26)
      {
        uint64_t v27 = v26;
        if ([v26 isBluetooth])
        {
          uint64_t v28 = sub_1001C7370((uint64_t)&unk_1003E6940, 24LL);
          sub_1002AF5B0(v28);
          uint64_t v29 = sub_1001C7370((uint64_t)&unk_1003E6968, 32LL);
          *(void *)(v29 + 16) = v23;
          *(void *)(v29 + 24) = v27;
          uint64_t v30 = sub_1001E2064((uint64_t)sub_1002356BC);
          sub_10023929C();
          id v31 = v27;
          static DispatchQoS.unspecified.getter(v31);
          uint64_t v32 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
          sub_1001C7340();
          sub_1002AF5A0((unint64_t *)&qword_100447CC0);
          uint64_t v33 = sub_1002AF5C8();
          dispatch thunk of SetAlgebra.init<A>(_:)(v33, v34, v35, v44, v32);
          OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v1);
          _Block_release(v30);

          (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v1, v44);
          (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v9, v46);
          sub_100239264();
          sub_100207134();
          goto LABEL_14;
        }
      }

      id v36 = sub_100170614();
      uint64_t v37 = sub_1001C7370(v16, 72LL);
      *(_OWORD *)(v37 + 16) = xmmword_10037B290;
      id v38 = [*(id *)(v0 + v18) pickedRoute];
      if (v38)
      {
        uint64_t v39 = sub_1001B4C00((uint64_t)v38, (unint64_t *)&qword_10044CAD0, &OBJC_CLASS___TURoute_ptr);
        uint64_t v40 = sub_1001F8818(v39);
      }

      else
      {
        unint64_t v41 = 0xE300000000000000LL;
        uint64_t v40 = 7104878LL;
      }

      *(void *)(v37 + 56) = &type metadata for String;
      *(void *)(v37 + 64) = v24;
      *(void *)(v37 + 32) = v40;
      *(void *)(v37 + 40) = v41;
      uint64_t v42 = static os_log_type_t.default.getter(v40);
      os_log(_:dso:log:type:_:)( "Not triggering route change notification for handoff in response to conversation becoming joined, as a non-bluet ooth route is in use: %@",  136LL,  2LL,  &_mh_execute_header,  v36,  v42,  v37);

      swift_bridgeObjectRelease(v37);
    }

uint64_t sub_1002AE2F4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = sub_1002AD2EC();
    sub_1002ACC00(v4, v5);
    uint64_t v6 = sub_1002AD2EC();
    uint64_t v8 = v7;
    sub_1002AD608(v6, v7);

    return swift_bridgeObjectRelease(v8);
  }

  return result;
}

void HandoffAudioController.routesChanged(for:)()
{
  uint64_t v4 = v3;
  uint64_t v5 = sub_1001C7360();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = sub_1002AF518();
  uint64_t v8 = type metadata accessor for DispatchQoS(v7);
  uint64_t v32 = *(void *)(v8 - 8);
  sub_1001C7334();
  __chkstk_darwin(v9);
  sub_1001B0F00();
  uint64_t v31 = v11 - v10;
  uint64_t v12 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1001D920C();
  uint64_t v14 = *(void **)(v0 + OBJC_IVAR___CSDHandoffAudioController_callCenterQueue);
  *uint64_t v2 = v14;
  sub_1002AF5DC( enum case for DispatchPredicate.onQueue(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 104));
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v2);
  uint64_t v16 = sub_100235674((uint64_t)v2, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
  if ((v14 & 1) != 0)
  {
    id v17 = sub_10022D078(v16, "receiverRoute");
    uint64_t v30 = v6;
    id v18 = sub_10022D078((uint64_t)v17, "speakerRoute");
    id v19 = sub_10022D078((uint64_t)v18, "pickedRoute");
    uint64_t v20 = sub_1001C7370((uint64_t)&unk_1003E6940, 24LL);
    sub_1002AF5B0(v20);
    uint64_t v21 = (void *)sub_1001C7370((uint64_t)&unk_1003E69B8, 48LL);
    v21[2] = v4;
    v21[3] = v19;
    v21[4] = v17;
    v21[5] = v18;
    v33[5] = sub_1002AF3AC;
    v33[6] = v21;
    v33[1] = _NSConcreteStackBlock;
    v33[2] = 1107296256LL;
    uint64_t v29 = v8;
    unint64_t v22 = sub_1001E2064((uint64_t)sub_1002356BC);
    sub_10023929C();
    id v28 = v19;
    id v23 = v17;
    id v24 = v18;
    static DispatchQoS.unspecified.getter(v24);
    v33[0] = _swiftEmptyArrayStorage;
    uint64_t v25 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v26 = sub_1001C7340();
    uint64_t v27 = sub_1002AF5A0((unint64_t *)&qword_100447CC0);
    dispatch thunk of SetAlgebra.init<A>(_:)(v33, v26, v27, v5, v25);
    sub_1002AF5C0(0LL, v31, v1, (uint64_t)v22);
    _Block_release(v22);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v1, v5);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v29);
    sub_100239264();
    sub_100207134();
    sub_1001B0FF8();
  }

  else
  {
    __break(1u);
  }

void sub_1002AE674(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v26, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    uint64_t v9 = (char *)Strong;
    if ((sub_1002AE854(a2, a3, a4) & 1) == 0)
    {
LABEL_14:

      return;
    }

    if (a2)
    {
      id v10 = a2;
      if (([v10 isReceiver] & 1) != 0 || objc_msgSend(v10, "isSpeaker"))
      {
        sub_1002ACC00(0LL, 0LL);

LABEL_10:
        id v13 = sub_100170614();
        uint64_t v14 = sub_1001AFF14((uint64_t *)&unk_100447E30);
        uint64_t v15 = swift_allocObject(v14, 72LL, 7LL);
        *(_OWORD *)(v15 + 16) = xmmword_10037B290;
        uint64_t v16 = (uint64_t *)&v9[OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier];
        uint64_t v17 = *(void *)&v9[OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier + 8];
        if (v17)
        {
          v25[0] = *v16;
          v25[1] = v17;
          swift_bridgeObjectRetain(v17);
          uint64_t v18 = String.init<A>(reflecting:)(v25, &type metadata for String);
          unint64_t v20 = v19;
        }

        else
        {
          unint64_t v20 = 0xE300000000000000LL;
          uint64_t v18 = 7104878LL;
        }

        *(void *)(v15 + 56) = &type metadata for String;
        unint64_t v21 = sub_1001B2330();
        *(void *)(v15 + 64) = v21;
        *(void *)(v15 + 32) = v18;
        *(void *)(v15 + 40) = v20;
        uint64_t v22 = static os_log_type_t.default.getter(v21);
        os_log(_:dso:log:type:_:)("Picked route changed to: %@", 27LL, 2LL, &_mh_execute_header, v13, v22, v15);

        swift_bridgeObjectRelease(v15);
        uint64_t v23 = *v16;
        id v24 = (void *)v16[1];
        swift_bridgeObjectRetain(v24);
        sub_1002AD608(v23, v24);
        swift_bridgeObjectRelease(v24);
        goto LABEL_14;
      }

      uint64_t v11 = sub_1002AD2EC();
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
    }

    sub_1002ACC00(v11, v12);
    goto LABEL_10;
  }

uint64_t sub_1002AE854(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (uint64_t *)((char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = *(void **)(v3 + OBJC_IVAR___CSDHandoffAudioController_queue);
  *id v10 = v11;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchPredicate.onQueue(_:), v7);
  id v12 = v11;
  LOBYTE(v11) = _dispatchPreconditionTest(_:)(v10);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if ((v11 & 1) != 0)
  {
    if (a1)
    {
      id v14 = a1;
      if ([v14 isBluetooth])
      {
        uint64_t v15 = *(void *)(v3 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier + 8);
        if (v15)
        {
          uint64_t v16 = *(void *)(v3 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier);
          swift_bridgeObjectRetain(*(void *)(v3 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier + 8));
          uint64_t v17 = sub_1002AD2EC();
          uint64_t v19 = v18;
          if (v16 != v17 || v15 != v18)
          {
            char v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v15, v17, v18, 0LL);
            swift_bridgeObjectRelease(v19);
            swift_bridgeObjectRelease(v15);

            if ((v21 & 1) != 0) {
              goto LABEL_38;
            }
            goto LABEL_37;
          }

          swift_bridgeObjectRelease(v18);
          swift_bridgeObjectRelease(v15);

LABEL_38:
          char v30 = 0;
          return v30 & 1;
        }

LABEL_37:
        char v30 = 1;
        return v30 & 1;
      }
    }

    uint64_t v22 = (uint64_t *)(v3 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier);
    uint64_t v23 = *(void *)(v3 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier + 8);
    if (!v23) {
      goto LABEL_38;
    }
    uint64_t v24 = *v22;
    if (a2)
    {
      swift_bridgeObjectRetain(*(void *)(v3 + OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier + 8));
      uint64_t v25 = sub_1002AD2EC();
      uint64_t v27 = v26;
      if (v24 == v25 && v23 == v26)
      {
        swift_bridgeObjectRelease(v23);
        uint64_t v36 = v27;
        goto LABEL_29;
      }

      char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v23, v25, v26, 0LL);
      swift_bridgeObjectRelease(v23);
      swift_bridgeObjectRelease(v27);
      char v30 = 0;
      if ((v29 & 1) != 0) {
        return v30 & 1;
      }
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
    }

    if (a3)
    {
      swift_bridgeObjectRetain(v23);
      uint64_t v31 = sub_1002AD2EC();
      uint64_t v33 = v32;
      if (!v23)
      {
        if (!v32) {
          goto LABEL_38;
        }
        uint64_t v37 = v32;
        goto LABEL_36;
      }

      if (v32)
      {
        if (v24 != v31 || v23 != v32)
        {
          char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v23, v31, v32, 0LL);
          swift_bridgeObjectRelease(v23);
          swift_bridgeObjectRelease(v33);
          char v30 = v35 ^ 1;
          return v30 & 1;
        }

        swift_bridgeObjectRelease(v23);
        uint64_t v36 = v33;
LABEL_29:
        swift_bridgeObjectRelease(v36);
        goto LABEL_38;
      }
    }

    else
    {
      swift_bridgeObjectRetain(v23);
      if (!v23) {
        goto LABEL_38;
      }
    }

    uint64_t v37 = v23;
LABEL_36:
    swift_bridgeObjectRelease(v37);
    goto LABEL_37;
  }

  __break(1u);
  return result;
}

char *sub_1002AEB48(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v12 = (char *)objc_allocWithZone((Class)type metadata accessor for HandoffAudioController());
  return sub_1002AEF50(a1, a2, a3, a4, a5, a6, v12);
}

char *sub_1002AEBBC(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char *a7)
{
  id v44 = a3;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v38 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v36 = *(void *)(v16 - 8);
  uint64_t v37 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = &a7[OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier];
  *(void *)uint64_t v19 = 0LL;
  *((void *)v19 + 1) = 0LL;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_routeController] = a4;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_queue] = a1;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_callCenterQueue] = a2;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_conversationManager] = a5;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_serverBag] = a6;
  unint64_t v20 = (objc_class *)type metadata accessor for HandoffAudioController();
  v48.receiver = a7;
  v48.super_class = v20;
  id v43 = a4;
  id v40 = a1;
  id v39 = a2;
  id v42 = a5;
  id v41 = a6;
  char v21 = (char *)objc_msgSendSuper2(&v48, "init");
  uint64_t v22 = *(void **)&v21[OBJC_IVAR___CSDHandoffAudioController_conversationManager];
  uint64_t v23 = *(void *)&v21[OBJC_IVAR___CSDHandoffAudioController_callCenterQueue];
  uint64_t v24 = v21;
  [v22 addDelegate:v24 queue:v23];
  uint64_t v25 = swift_allocObject(&unk_1003E6940, 24LL, 7LL);
  swift_unknownObjectWeakInit(v25 + 16);
  aBlock[4] = sub_1002AF4A4;
  uint64_t v47 = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1002356BC;
  aBlock[3] = &unk_1003E6B10;
  uint64_t v26 = _Block_copy(aBlock);
  uint64_t v27 = swift_retain(v25);
  static DispatchQoS.unspecified.getter(v27);
  uint64_t v45 = _swiftEmptyArrayStorage;
  uint64_t v28 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v29 = sub_1001AFF14((uint64_t *)&unk_1004478D0);
  uint64_t v30 = sub_10027AC40((unint64_t *)&qword_100447CC0, (uint64_t *)&unk_1004478D0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v45, v29, v30, v13, v28);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v18, v15);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v13);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v37);
  uint64_t v31 = v47;
  swift_release(v25);
  swift_release(v31);
  id v32 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  uint64_t v33 = qword_1004469B0;
  uint64_t v34 = v24;
  if (v33 != -1) {
    swift_once(&qword_1004469B0, sub_1002ACB5C);
  }
  [v32 addObserver:v34 selector:"handleContinueHandoffAudioRouteNotification:" name:static HandoffAudioController.continueHandoffAudioRouteNotification object:0];

  return v34;
}

char *sub_1002AEF50(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, char *a7)
{
  id v43 = a3;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v38 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v36 = *(void *)(v16 - 8);
  uint64_t v37 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = &a7[OBJC_IVAR___CSDHandoffAudioController_pickedRouteUniqueIdentifier];
  *(void *)uint64_t v19 = 0LL;
  *((void *)v19 + 1) = 0LL;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_routeController] = a4;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_queue] = a1;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_callCenterQueue] = a2;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_conversationManager] = a5;
  *(void *)&a7[OBJC_IVAR___CSDHandoffAudioController_serverBag] = a6;
  unint64_t v20 = (objc_class *)type metadata accessor for HandoffAudioController();
  v48.receiver = a7;
  v48.super_class = v20;
  id v42 = a4;
  id v40 = a1;
  id v39 = a2;
  id v41 = a5;
  uint64_t v44 = a6;
  swift_unknownObjectRetain(a6);
  char v21 = (char *)objc_msgSendSuper2(&v48, "init");
  uint64_t v22 = *(void **)&v21[OBJC_IVAR___CSDHandoffAudioController_conversationManager];
  uint64_t v23 = *(void *)&v21[OBJC_IVAR___CSDHandoffAudioController_callCenterQueue];
  uint64_t v24 = v21;
  [v22 addDelegate:v24 queue:v23];
  uint64_t v25 = swift_allocObject(&unk_1003E6940, 24LL, 7LL);
  swift_unknownObjectWeakInit(v25 + 16);
  aBlock[4] = sub_1002AF4A4;
  uint64_t v47 = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1002356BC;
  aBlock[3] = &unk_1003E6A98;
  uint64_t v26 = _Block_copy(aBlock);
  uint64_t v27 = swift_retain(v25);
  static DispatchQoS.unspecified.getter(v27);
  uint64_t v45 = _swiftEmptyArrayStorage;
  uint64_t v28 = sub_1001E1F68( (unint64_t *)&qword_100447CB0,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v29 = sub_1001AFF14((uint64_t *)&unk_1004478D0);
  uint64_t v30 = sub_10027AC40((unint64_t *)&qword_100447CC0, (uint64_t *)&unk_1004478D0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v45, v29, v30, v13, v28);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v18, v15);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v13);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v37);
  uint64_t v31 = v47;
  swift_release(v25);
  swift_release(v31);
  id v32 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  uint64_t v33 = qword_1004469B0;
  uint64_t v34 = v24;
  if (v33 != -1) {
    swift_once(&qword_1004469B0, sub_1002ACB5C);
  }
  [v32 addObserver:v34 selector:"handleContinueHandoffAudioRouteNotification:" name:static HandoffAudioController.continueHandoffAudioRouteNotification object:0];

  swift_unknownObjectRelease(v44);
  return v34;
}

uint64_t sub_1002AF2E8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_1002AF30C()
{
  return objc_msgSend( *(id *)(*(void *)(v0 + 16) + OBJC_IVAR___CSDHandoffAudioController_routeController),  "removeDelegate:");
}

uint64_t sub_1002AF328(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1002AF338(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1002AF340()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1002AF368()
{
  return sub_1002AE2F4(*(void *)(v0 + 16));
}

uint64_t sub_1002AF370()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_1002AF3AC()
{
}

uint64_t sub_1002AF3B8()
{
  uint64_t v1 = type metadata accessor for Notification(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_1002AF42C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Notification(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_1002AD8A0(v0 + v2, *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_1002AF46C()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1002AF498()
{
}

uint64_t sub_1002AF4AC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1002AF4D8()
{
}

uint64_t sub_1002AF518()
{
  return 0LL;
}

uint64_t sub_1002AF534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return swift_getObjectType(a6);
}

uint64_t sub_1002AF554()
{
  return v0;
}

uint64_t sub_1002AF578()
{
  return v0 - 136;
}

id sub_1002AF594()
{
  return [v0 *(SEL *)(v1 + 4048)];
}

uint64_t sub_1002AF5A0(unint64_t *a1)
{
  return sub_10027AC40(a1, v1);
}

void sub_1002AF5A8()
{
}

uint64_t sub_1002AF5B0(uint64_t a1)
{
  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

uint64_t sub_1002AF5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)(a1, a2, a3, a4);
}

uint64_t sub_1002AF5C8()
{
  return v0 - 136;
}

uint64_t sub_1002AF5DC@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v3, a1, v2);
}

uint64_t sub_1002AF5E8()
{
  return 0LL;
}

void *sub_1002AF5FC(void *a1)
{
  uint64_t v3 = sub_1001AFF14(&qword_100447EA0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v1[2] = 0LL;
  v1[5] = 0LL;
  uint64_t v6 = (uint64_t)v1 + OBJC_IVAR____TtC13callservicesdP33_0A1659627E4D14053DCC87F1CE1AA4A69CallTimes_jailTimeFinish;
  uint64_t v7 = type metadata accessor for Date(0LL);
  sub_1001A9670(v6, 1LL, 1LL, v7);
  sub_1001A9670((uint64_t)v5, 1LL, 1LL, v7);
  v1[3] = sub_1002AF6E4((uint64_t)v5, (uint64_t)[a1 voIPDOSCount]);
  v1[4] = a1;
  swift_unknownObjectRetain(a1);
  sub_1002AF7F8();
  swift_unknownObjectRelease(a1);
  return v1;
}

uint64_t sub_1002AF6E4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL);
    __break(1u);
  }

  else
  {
    if (a2)
    {
      uint64_t v4 = sub_1001AFF14(&qword_100447EA0);
      uint64_t v5 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(a2, v4);
      _OWORD v5[2] = a2;
      uint64_t v6 = *(void *)(sub_1001AFF14(&qword_100447EA0) - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      sub_1002A68BC(a1, (uint64_t)v5 + v7);
      uint64_t v8 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v9 = *(void *)(v6 + 72);
        uint64_t v10 = (uint64_t)v5 + v9 + v7;
        do
        {
          sub_1002A68BC(a1, v10);
          v10 += v9;
          --v8;
        }

        while (v8);
      }
    }

    else
    {
      uint64_t v5 = _swiftEmptyArrayStorage;
    }

    sub_1002B13B0(a1);
    return (uint64_t)v5;
  }

  return result;
}

uint64_t sub_1002AF7F8()
{
  uint64_t v3 = sub_1001AFF14(&qword_100447EA0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = v7 + 1;
  if (__OFADD__(v7, 1LL))
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v1 = (uint64_t *)(v0 + 24);
  uint64_t v9 = swift_beginAccess(v0 + 24, v15, 0LL, 0LL);
  uint64_t v10 = *(void *)(*(void *)(v0 + 24) + 16LL);
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v2 = v8 % v10;
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v8 % v10;
  static Date.now.getter(v9);
  uint64_t v11 = type metadata accessor for Date(0LL);
  sub_1001A9670((uint64_t)v6, 0LL, 1LL, v11);
  swift_beginAccess(v0 + 24, v14, 33LL, 0LL);
  uint64_t v12 = *(void *)(v0 + 24);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(v12);
  *(void *)(v0 + 24) = v12;
  if ((result & 1) != 0)
  {
    if ((v2 & 0x8000000000000000LL) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

uint64_t sub_1002AF944()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1001AFF14(&qword_100447EA0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v44 = (uint64_t)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v42 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  id v43 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v20 = (char *)&v42 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v42 - v21;
  uint64_t v23 = (uint64_t)v1 + OBJC_IVAR____TtC13callservicesdP33_0A1659627E4D14053DCC87F1CE1AA4A69CallTimes_jailTimeFinish;
  swift_beginAccess( (char *)v1 + OBJC_IVAR____TtC13callservicesdP33_0A1659627E4D14053DCC87F1CE1AA4A69CallTimes_jailTimeFinish,  v47,  0LL,  0LL);
  sub_1002A68BC(v23, (uint64_t)v13);
  if (sub_1001AB0AC((uint64_t)v13, 1LL, v14) == 1)
  {
    uint64_t result = sub_1002B13B0((uint64_t)v13);
  }

  else
  {
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v22, v13, v14);
    double v26 = Date.timeIntervalSinceNow.getter(v25);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
    if (v26 >= 0.0)
    {
LABEL_21:
      sub_1002AF7F8();
      return 0LL;
    }

    sub_1001A9670((uint64_t)v11, 1LL, 1LL, v14);
    swift_beginAccess(v23, v46, 33LL, 0LL);
    sub_1002A6904((uint64_t)v11, v23);
    uint64_t result = swift_endAccess(v46);
  }

  uint64_t v27 = v1[2];
  uint64_t v28 = v27 + 1;
  if (__OFADD__(v27, 1LL))
  {
    __break(1u);
    goto LABEL_23;
  }

  uint64_t result = swift_beginAccess(v1 + 3, v46, 0LL, 0LL);
  uint64_t v29 = v1[3];
  uint64_t v30 = *(void *)(v29 + 16);
  if (!v30)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v31 = v28 % v30;
  if (v31 < 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  sub_1002A68BC( v29 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
  + *(void *)(v3 + 72) * v31,
    (uint64_t)v8);
  if (sub_1001AB0AC((uint64_t)v8, 1LL, v14) == 1)
  {
    sub_1002B13B0((uint64_t)v8);
LABEL_13:
    sub_1002AF7F8();
    return 1LL;
  }

  uint64_t v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v20, v8, v14);
  double v33 = Date.timeIntervalSinceNow.getter(v32);
  if (v33 >= 0.0
    || (double v34 = -v33,
        char v35 = (void *)v1[4],
        uint64_t result = (uint64_t)[v35 voIPDOSTimeSeconds],
        v34 > (double)(unint64_t)result))
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
    goto LABEL_13;
  }

  uint64_t v36 = v1[5];
  if (!v36)
  {
    uint64_t v37 = &selRef_voIPDOSMinJailTimeSeconds;
LABEL_19:
    id v38 = [v35 *v37];
    v1[5] = v38;
LABEL_20:
    id v39 = v43;
    static Date.now.getter(v38);
    static Date.+ infix(_:_:)(v39, (double)(unint64_t)v1[5]);
    id v40 = *(void (**)(char *, uint64_t))(v15 + 8);
    v40(v39, v14);
    v40(v20, v14);
    sub_1001A9670((uint64_t)v11, 0LL, 1LL, v14);
    uint64_t v41 = v44;
    sub_1002B14F4((uint64_t)v11, v44);
    swift_beginAccess(v23, v45, 33LL, 0LL);
    sub_1002A6904(v41, v23);
    swift_endAccess(v45);
    goto LABEL_21;
  }

  if ((v36 & 0x8000000000000000LL) == 0)
  {
    v1[5] = 2 * v36;
    uint64_t v37 = &selRef_voIPDOSMaxJailTimeSeconds;
    id v38 = [v35 voIPDOSMaxJailTimeSeconds];
    goto LABEL_19;
  }

uint64_t sub_1002AFD2C()
{
  return v0;
}

uint64_t sub_1002AFD60()
{
  uint64_t v0 = sub_1002AFD2C();
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1002AFD80()
{
  return type metadata accessor for CallTimes(0LL);
}

uint64_t type metadata accessor for CallTimes(uint64_t a1)
{
  uint64_t result = qword_10044CBC0;
  if (!qword_10044CBC0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CallTimes);
  }
  return result;
}

void sub_1002AFDC0(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  _OWORD v4[2] = "\b";
  v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
  sub_1002468D0(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
  }

id sub_1002AFE54()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for SharedConversationServerBag()) init];
  uint64_t v2 = (char *)objc_allocWithZone((Class)type metadata accessor for VoIPDOSCache());
  id v3 = sub_1002B1440(v1, v2);
  uint64_t ObjectType = swift_getObjectType(v0);
  swift_deallocPartialClassInstance(v0, ObjectType, 24LL, 7LL);
  return v3;
}

uint64_t sub_1002AFEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR___CSDVoIPDOSCache_requestCache);
  swift_beginAccess(v2 + OBJC_IVAR___CSDVoIPDOSCache_requestCache, v21, 0LL, 0LL);
  uint64_t v6 = *v5;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v6);
  sub_1001CA40C(a1, a2, v6);
  uint64_t v8 = v7;
  sub_1001B0EB8();
  swift_bridgeObjectRelease(v6);
  if (v8)
  {
    char v9 = sub_1002AF944();
    swift_release(v8);
  }

  else
  {
    uint64_t v10 = *(void *)(v2 + OBJC_IVAR___CSDVoIPDOSCache_serverBag);
    uint64_t v11 = type metadata accessor for CallTimes(0LL);
    swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
    swift_bridgeObjectRetain(a2);
    uint64_t v12 = (void *)swift_unknownObjectRetain(v10);
    uint64_t v13 = sub_1002AF5FC(v12);
    swift_beginAccess(v5, v20, 33LL, 0LL);
    sub_1001FE74C((uint64_t)v13, a1, a2, v14, v15, v16, v17, v18, v20[0], v20[1]);
    swift_endAccess(v20);
    sub_1001B0EB8();
    char v9 = 1;
  }

  return v9 & 1;
}

id sub_1002B0064()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoIPDOSCache();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VoIPDOSCache()
{
  return objc_opt_self(&OBJC_CLASS___CSDVoIPDOSCache);
}

void sub_1002B00EC()
{
  if ((v2 & 1) != 0)
  {
    sub_1002510E4();
    if (v3 != v4)
    {
      sub_10025112C();
      if (v3)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B156C();
  if (v1)
  {
    uint64_t v5 = sub_1001AFF14((uint64_t *)&unk_1004478C0);
    uint64_t v6 = (const void *)sub_1001E909C(v5, 16 * v1);
    sub_1002B15C4(v6);
    sub_1002B15F8(v7 / 16);
  }

  if ((v0 & 1) != 0)
  {
    uint64_t v8 = (char *)sub_1002B1624();
    sub_10024F1F0(v8, v9, v10);
    sub_1002B153C();
  }

  else
  {
    uint64_t v11 = sub_1002B155C();
    sub_1002B094C(v11, v12, v13, v14);
  }

  sub_10010B978();
}

void sub_1002B0188()
{
}

void sub_1002B01A4()
{
  if ((v2 & 1) != 0)
  {
    sub_1002510E4();
    if (v3 != v4)
    {
      sub_10025112C();
      if (v3)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B15DC();
  if (v1)
  {
    uint64_t v10 = sub_100251198(v5, v6, v7, v8, v9);
    uint64_t v11 = (const void *)sub_1001E909C(v10, 16 * v1);
    size_t v12 = j__malloc_size(v11);
    sub_1002B1630((uint64_t)(v12 - 32) / 16);
  }

  if ((v0 & 1) != 0)
  {
    sub_1002B15A4();
    sub_1002B153C();
  }

  else
  {
    uint64_t v13 = sub_1002B157C();
    sub_1002B1210(v13, v14, v15, v16, v17);
  }

  sub_1001B0F4C();
}

uint64_t sub_1002B0240()
{
  if ((v3 & 1) != 0)
  {
    sub_1002510E4();
    if (v5 != v6)
    {
      sub_10025112C();
      if (v5)
      {
        __break(1u);
LABEL_23:
        sub_100250FF0();
        uint64_t v24 = "Division by zero";
        uint64_t v25 = 16LL;
LABEL_25:
        uint64_t result = sub_1002B1618( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)v24,  v25,  v23,  (uint64_t)"Swift/IntegerTypes.swift");
        __break(1u);
        return result;
      }

      sub_1002510D4();
    }
  }

  else
  {
    uint64_t v4 = v2;
  }

  uint64_t v7 = *(void *)(v0 + 16);
  if (v4 <= v7) {
    uint64_t v8 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v8 = v4;
  }
  if (!v8)
  {
    uint64_t v14 = _swiftEmptyArrayStorage;
    goto LABEL_18;
  }

  uint64_t v9 = sub_1001AFF14((uint64_t *)&unk_10044CD70);
  uint64_t v10 = *(void *)(type metadata accessor for URLQueryItem(0LL) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = (void *)swift_allocObject(v9, v13 + v11 * v8, v12 | 7);
  size_t v15 = j__malloc_size(v14);
  if (!v11) {
    goto LABEL_23;
  }
  if (v15 - v13 == 0x8000000000000000LL && v11 == -1)
  {
    sub_100250FF0();
    uint64_t v24 = "Division results in an overflow";
    uint64_t v25 = 31LL;
    goto LABEL_25;
  }

  sub_1002B15F8((uint64_t)(v15 - v13) / v11);
LABEL_18:
  type metadata accessor for URLQueryItem(0LL);
  sub_1002B1604();
  if ((v1 & 1) != 0)
  {
    sub_10024F38C(v0 + v17, v7);
    sub_1002B153C();
  }

  else
  {
    uint64_t v18 = sub_1002B155C();
    sub_1002B0A40(v18, v19, v20, v21);
  }

  return (uint64_t)v14;
}

void sub_1002B03B8()
{
}

void sub_1002B03D4()
{
}

void sub_1002B03F0()
{
  if ((v2 & 1) != 0)
  {
    sub_1002510E4();
    if (v3 != v4)
    {
      sub_10025112C();
      if (v3)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B156C();
  if (v1)
  {
    uint64_t v5 = sub_1001AFF14((uint64_t *)&unk_10044CDA0);
    char v6 = (const void *)swift_allocObject(v5, 48 * v1 + 32, 7LL);
    sub_1002B15C4(v6);
    sub_1002B15F8(v7 / 48);
  }

  if ((v0 & 1) != 0)
  {
    uint64_t v8 = (char *)sub_1002B1624();
    sub_10024F32C(v8, v9, v10);
    sub_1002B153C();
  }

  else
  {
    uint64_t v11 = sub_1002B155C();
    sub_1002B0B60(v11, v12, v13, v14);
  }

  sub_1001B0F4C();
}

void sub_1002B0498()
{
}

void sub_1002B04B4()
{
  if ((v2 & 1) != 0)
  {
    sub_1002510E4();
    if (v3 != v4)
    {
      sub_10025112C();
      if (v3)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B156C();
  if (v1)
  {
    uint64_t v5 = sub_1001AFF14(&qword_10044CD68);
    char v6 = (const void *)sub_1001E909C(v5, 8 * v1);
    sub_1002B15C4(v6);
    sub_1002B15F8(v7 / 8);
  }

  if ((v0 & 1) != 0)
  {
    uint64_t v8 = (char *)sub_1002B1624();
    sub_10024F584(v8, v9, v10);
    sub_1002B153C();
  }

  else
  {
    uint64_t v11 = sub_1002B155C();
    sub_1002B0D78(v11, v12, v13, v14);
  }

  sub_10010B978();
}

void sub_1002B0550()
{
  if ((v2 & 1) != 0)
  {
    sub_1002510E4();
    if (v3 != v4)
    {
      sub_10025112C();
      if (v3)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B156C();
  if (v1)
  {
    uint64_t v5 = sub_1001AFF14(&qword_10044CD60);
    char v6 = (const void *)sub_1001E909C(v5, 32 * v1);
    sub_1002B15C4(v6);
    sub_1002B15F8(v7 / 32);
  }

  if ((v0 & 1) != 0)
  {
    uint64_t v8 = (char *)sub_1002B1624();
    sub_10024F2D4(v8, v9, v10);
    sub_1002B153C();
  }

  else
  {
    uint64_t v11 = sub_1002B155C();
    sub_1002B0E68(v11, v12, v13, v14);
  }

  sub_10010B978();
}

void sub_1002B05EC()
{
}

void sub_1002B0608()
{
}

void sub_1002B0624()
{
  if ((v5 & 1) != 0)
  {
    sub_1002510E4();
    if (v6 != v7)
    {
      sub_10025112C();
      if (v6)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B15DC();
  if (v4)
  {
    uint64_t v13 = sub_100251198(v8, v9, v10, v11, v12);
    uint64_t v14 = (void *)swift_allocObject(v13, 40 * v4 + 32, 7LL);
    size_t v15 = j__malloc_size(v14);
    sub_1002B1630((uint64_t)(v15 - 32) / 40);
  }

  else
  {
    uint64_t v14 = _swiftEmptyArrayStorage;
  }

  if ((v2 & 1) != 0)
  {
    sub_1002B15A4();
    sub_1002B153C();
  }

  else
  {
    v1(0LL, v3, v14 + 4, v0);
  }

void sub_1002B06E4()
{
}

void sub_1002B0700()
{
  if ((v2 & 1) != 0)
  {
    sub_1002510E4();
    if (v3 != v4)
    {
      sub_10025112C();
      if (v3)
      {
        __break(1u);
        return;
      }

      sub_1002510D4();
    }
  }

  sub_1002B15DC();
  if (v1)
  {
    uint64_t v10 = sub_100251198(v5, v6, v7, v8, v9);
    uint64_t v11 = (const void *)sub_1001E909C(v10, 8 * v1);
    size_t v12 = j__malloc_size(v11);
    sub_1002B1630((uint64_t)(v12 - 32) / 8);
  }

  if ((v0 & 1) != 0)
  {
    sub_1002B15A4();
    sub_1002B153C();
  }

  else
  {
    uint64_t v13 = sub_1002B157C();
    sub_1002B1158(v13, v14, v15, v16, v17);
  }

  sub_1001B0F4C();
}

void sub_1002B079C()
{
}

uint64_t sub_1002B07B8()
{
  return sub_1002B07D4();
}

uint64_t sub_1002B07D4()
{
  if ((v6 & 1) != 0)
  {
    sub_1002510E4();
    if (v10 != v11)
    {
      sub_10025112C();
      if (v10)
      {
        __break(1u);
LABEL_23:
        sub_100250FF0();
        uint64_t v30 = "Division by zero";
        uint64_t v31 = 16LL;
LABEL_25:
        uint64_t result = sub_1002B1618( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)v30,  v31,  v29,  (uint64_t)"Swift/IntegerTypes.swift");
        __break(1u);
        return result;
      }

      sub_1002510D4();
    }
  }

  else
  {
    uint64_t v9 = v5;
  }

  uint64_t v12 = *(void *)(v0 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (!v13)
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
    goto LABEL_18;
  }

  uint64_t v14 = sub_100251198(v4, v5, v6, v7, v8);
  uint64_t v15 = *(void *)(sub_1001AFF14(v1) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = (void *)swift_allocObject(v14, v18 + v16 * v13, v17 | 7);
  size_t v20 = j__malloc_size(v19);
  if (!v16) {
    goto LABEL_23;
  }
  if (v20 - v18 == 0x8000000000000000LL && v16 == -1)
  {
    sub_100250FF0();
    uint64_t v30 = "Division results in an overflow";
    uint64_t v31 = 31LL;
    goto LABEL_25;
  }

  sub_1002B1630((uint64_t)(v20 - v18) / v16);
LABEL_18:
  sub_1001AFF14(v1);
  sub_1002B1604();
  if ((v3 & 1) != 0)
  {
    v2(v0 + v22, v12, (char *)v19 + v22);
    sub_1002B153C();
  }

  else
  {
    uint64_t v23 = sub_1002B157C();
    sub_1002B12C8(v23, v24, v25, v26, v27);
  }

  return (uint64_t)v19;
}

uint64_t sub_1002B094C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 16 * a1 + 32;
  unint64_t v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1002B0A40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(type metadata accessor for URLQueryItem(0LL) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3, v11);
    swift_bridgeObjectRelease(a4);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1002B0B60(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 48 * a1 + 32;
  unint64_t v7 = a3 + 48 * v4;
  if (v6 >= v7 || v6 + 48 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1002B0C5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v7 = a4 + 40 * a1 + 32;
  unint64_t v8 = a3 + 40 * v4;
  if (v7 >= v8 || v7 + 40 * v4 <= a3)
  {
    sub_1001AFF14((uint64_t *)&unk_10044CD80);
    swift_arrayInitWithCopy(a3, v7);
    swift_bridgeObjectRelease(a4);
    return v8;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1002B0D78(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = (char *)(a4 + 8 * a1 + 32);
  unint64_t v7 = &__dst[8 * v4];
  if (v6 >= v7 || &v6[8 * v4] <= __dst)
  {
    memcpy(__dst, v6, 8 * v4);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1002B0E68(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 32 * a1 + 32;
  unint64_t v7 = a3 + 32 * v4;
  if (v6 >= v7 || v6 + 32 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1002B0F60(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v4;
  if (v6 >= v7 || v6 + 40 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1002B105C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v4;
  if (v6 >= v7 || v6 + 40 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_1002B1158(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    sub_100250FF0();
    sub_100251058();
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 8 * a1 + 32;
  if (v6 >= a3 + 8 * v5 || v6 + 8 * v5 <= a3)
  {
    sub_100251198(a1, a2, a3, a4, a5);
    sub_1002B1590();
    sub_1001B0EB8();
    sub_1002B15B0();
    return;
  }

  sub_100250FF0();
  sub_100251048();
LABEL_11:
  sub_10025102C(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  __break(1u);
}

void sub_1002B1210(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    sub_100250FF0();
    sub_100251058();
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 16 * a1 + 32;
  if (v6 >= a3 + 16 * v5 || v6 + 16 * v5 <= a3)
  {
    sub_100251198(a1, a2, a3, a4, a5);
    sub_1002B1590();
    sub_1001B0EB8();
    sub_1002B15B0();
    return;
  }

  sub_100250FF0();
  sub_100251048();
LABEL_11:
  sub_10025102C(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  __break(1u);
}

uint64_t sub_1002B12C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    sub_100250FF0();
    sub_100251058();
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(sub_100251198(a1, a2, a3, a4, a5) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  uint64_t v13 = v11 * v5;
  unint64_t v14 = a3 + v13;
  unint64_t v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3, v12);
    sub_1001B0EB8();
    return v14;
  }

  sub_100250FF0();
  sub_100251048();
LABEL_11:
  uint64_t result = sub_10025102C(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
  __break(1u);
  return result;
}

uint64_t sub_1002B13B0(uint64_t a1)
{
  uint64_t v2 = sub_1001AFF14(&qword_100447EA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_1002B13F0()
{
}

uint64_t sub_1002B1404()
{
  return sub_1002B07D4();
}

id sub_1002B1440(void *a1, char *a2)
{
  uint64_t v4 = OBJC_IVAR___CSDVoIPDOSCache_requestCache;
  uint64_t v5 = type metadata accessor for CallTimes(0LL);
  unint64_t v6 = a2;
  *(void *)&a2[v4] = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  v5,  &protocol witness table for String);
  *(void *)&v6[OBJC_IVAR___CSDVoIPDOSCache_serverBag] = a1;
  swift_unknownObjectRetain(a1);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for VoIPDOSCache();
  id v7 = objc_msgSendSuper2(&v9, "init");

  return v7;
}

uint64_t sub_1002B14F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1001AFF14(&qword_100447EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1002B153C()
{
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_1002B155C()
{
  return 0LL;
}

  ;
}

uint64_t sub_1002B157C()
{
  return 0LL;
}

uint64_t sub_1002B1590()
{
  return swift_arrayInitWithCopy(v0, v1);
}

uint64_t sub_1002B15A4()
{
  return v1(v0 + 32, v2);
}

  ;
}

size_t sub_1002B15C4(const void *a1)
{
  return j__malloc_size(a1);
}

  ;
}

  ;
}

void sub_1002B15F8(uint64_t a1@<X8>)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  *(void *)(v2 + 24) = 2 * a1;
}

  ;
}

uint64_t sub_1002B1618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 24LL);
}

uint64_t sub_1002B1624()
{
  return v0 + 32;
}

void sub_1002B1630(uint64_t a1@<X8>)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  *(void *)(v2 + 24) = 2 * a1;
}

uint64_t sub_1002B165C()
{
  return swift_unknownObjectRetain(*(void *)(v0 + OBJC_IVAR___CSDMomentsRequest_avcRequest));
}

id sub_1002B168C()
{
  return *(id *)(v0 + OBJC_IVAR___CSDMomentsRequest_session);
}

id sub_1002B169C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v2);
  *(void *)&v2[OBJC_IVAR___CSDMomentsRequest_avcRequest] = a1;
  *(void *)&v2[OBJC_IVAR___CSDMomentsRequest_session] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, "init");
}

void sub_1002B1748()
{
}

uint64_t type metadata accessor for MomentsRequest()
{
  return objc_opt_self(&OBJC_CLASS___CSDMomentsRequest);
}

void sub_1002B17D8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Simulated a crash report for reason: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B184C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Wanted to file a simulated crash report for reason: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B18C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B18F0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to initialize a new call with device role %d.",  (uint8_t *)v2,  8u);
  sub_1000117DC();
}

void sub_1002B1960()
{
  uint64_t v3 = v0;
  sub_1000117E4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Error fetching local invite dictionary %@: %@", v2);
  sub_1000117C4();
}

void sub_1002B19CC(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 configuration]);
  sub_1000117F0();
  uint64_t v8 = a2;
  sub_1000117E4((void *)&_mh_execute_header, a3, v6, "Failed to start connection with configuration=%@: %@", v7);
}

void sub_1002B1A68(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Attempting to set state to %d, which precedes current state %d",  (uint8_t *)v4,  0xEu);
  sub_1000117C4();
}

void sub_1002B1AEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B1B1C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000117B4((void *)&_mh_execute_header, a2, a3, "Failed to start session. error=%@", a5, a6, a7, a8, 2u);
  sub_1000117C4();
}

void sub_1002B1B84( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B1BE8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B1C50(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No matching conversation found for call after handoff, not re-registering for handoff %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B1CC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "This chat's conferenceID and GUID are nil or empty, we cannot create a safe call history identifier",  v1,  2u);
}

void sub_1002B1D04( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B1D68(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 handle]);
  sub_100021D5C();
  sub_100021D48( (void *)&_mh_execute_header,  v2,  v3,  "Could not initiate FaceTime call - No IM handle returned for handle %@ with account %@",  v4,  v5,  v6,  v7,  v8);

  sub_100021D74();
}

void sub_1002B1DEC(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 handle]);
  sub_100021D5C();
  sub_100021D48( (void *)&_mh_execute_header,  v2,  v3,  "Could not initiate FaceTime call - No chat returned for handle %@ with account %@",  v4,  v5,  v6,  v7,  v8);

  sub_100021D74();
}

void sub_1002B1E70( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B1ED4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B1F38()
{
}

void sub_1002B1F70()
{
}

void sub_1002B1F9C()
{
  sub_1000117B4((void *)&_mh_execute_header, v0, v1, "Failed to return to HomeScreen %@", v2, v3, v4, v5, v6);
  sub_1000117C4();
}

void sub_1002B1FFC()
{
}

void sub_1002B2068(void *a1, uint64_t a2, os_log_s *a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 pluginName]);
  int v7 = 138412802;
  uint8_t v8 = v6;
  __int16 v9 = 2048;
  id v10 = [a1 identifier];
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Trying to add virtual participant for plugin %@ with different identifier %llu: %@",  (uint8_t *)&v7,  0x20u);
}

void sub_1002B212C()
{
}

void sub_1002B218C()
{
}

void sub_1002B21FC()
{
}

void sub_1002B2228(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 UUID]);
  sub_1000434D0();
  sub_10004350C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);

  sub_10004351C();
}

void sub_1002B22A8()
{
}

void sub_1002B22D4()
{
}

void sub_1002B2334()
{
}

void sub_1002B2394()
{
}

void sub_1002B23F4(void *a1)
{
}

void sub_1002B2470( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B24D8()
{
}

void sub_1002B2538(void *a1)
{
}

void sub_1002B25C0()
{
}

void sub_1002B2620(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  sub_1000434DC( (void *)&_mh_execute_header,  a2,  a3,  "for particiapntID: %llu, invalid csdParticipant from conversationParticipant: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_1000117C4();
}

void sub_1002B2690()
{
}

void sub_1002B26F0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Dropping unexpected data blob with type: %u",  (uint8_t *)v2,  8u);
  sub_1000117DC();
}

void sub_1002B2760()
{
}

void sub_1002B278C()
{
  __assert_rtn("-[CSDConversation executeSessionDidStart]", "CSDConversation.m", 5486, "self.avcSession != nil");
}

void sub_1002B27B4()
{
}

void sub_1002B27E0()
{
}

void sub_1002B280C()
{
}

void sub_1002B286C()
{
}

void sub_1002B28CC(uint64_t a1, void *a2)
{
  int v7 = (void *)objc_claimAutoreleasedReturnValue([a2 UUID]);
  sub_10004350C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_1002B2974()
{
}

void sub_1002B29A0()
{
}

void sub_1002B29CC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "handleReceivedDTMFUpdateMessageFromHost with !hasDtmfUpdateDigits. Message:%@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B2A40(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to prepare conference for pull message %@ and call %@",  (uint8_t *)&v4,  0x16u);
}

void sub_1002B2AC4(void *a1)
{
}

void sub_1002B2B30(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to call failed because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2BA8(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to account unsupported because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2C20(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to network unsupported because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2C98(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to provider crashed because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2D10(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to media start failed because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2D88(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to media server crashed because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2E00(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to other secondary device in use because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2E78(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to kicked because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2EF0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to rejected because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2F68(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to invalid conversation link because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B2FE0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to conversation links disabled because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B3058(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to no destinations available because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B30D0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to vision call establishment version mismatch because failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B3148(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to blocked remote participant bc failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B31C0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to travel mode prevents calls bc failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B3238(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 failureContext]);
  sub_1000542F0(v2, v3);
  sub_1000434D0();
  sub_1000542D0( (void *)&_mh_execute_header,  v4,  v5,  "Setting disconnected reason to guest mode prevents calls bc failure reason is %ld",  v6,  v7,  v8,  v9,  v10);

  sub_10004351C();
}

void sub_1002B32B0()
{
}

void sub_1002B3314()
{
}

void sub_1002B3380()
{
}

void sub_1002B33E4()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Creating sandbox extension directory '%@' failed with error %@",  v2,  0x16u);
  sub_1000117C4();
}

void sub_1002B3460( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B34C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_1000117C4();
}

void sub_1002B3528( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_1000117C4();
}

void sub_1002B358C(char a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "There was an error enabling emergency mode. Enabled successfully (%d) Error: %@",  (uint8_t *)v3,  0x12u);
  sub_1000117C4();
}

void sub_1002B3610(uint64_t a1, os_log_s *a2)
{
  int v5 = 138412546;
  id v6 = (id)objc_opt_class(a1, a2);
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  id v4 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Prefereces object was of unexpected class %@: %@",  (uint8_t *)&v5,  0x16u);
}

void sub_1002B36B4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000542E4( (void *)&_mh_execute_header,  a2,  a3,  "Could not determine UUID for FaceTime app bundle identifier %@",  (uint8_t *)&v3);
}

void sub_1002B3720(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Setting disconnected reason to call failed because CSDAVConference ended reason is %ld for call %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1002B37A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B37D8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 protoUpgradeSessionUUID]);
  int v5 = 138412290;
  uint64_t v6 = v3;
  sub_1000542E4((void *)&_mh_execute_header, a2, v4, "Error while creating UUID from protoUUID: %@", (uint8_t *)&v5);
}

void sub_1002B3864( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B3898( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B38C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B38F8()
{
}

void sub_1002B3958()
{
}

void sub_1002B39B8()
{
}

void sub_1002B3A18()
{
}

void sub_1002B3A78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "CSDMessagingCallMessage could not be read",  v1,  2u);
}

void sub_1002B3AB8(void *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 type];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "CSDMessagingCallMessage is of unsupported type: %d",  (uint8_t *)v3,  8u);
  sub_1000117C4();
}

void sub_1002B3B3C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B3BA0()
{
}

void sub_1002B3C04()
{
}

void sub_1002B3C68()
{
}

void sub_1002B3CCC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 groupUUID]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_1000542E4( (void *)&_mh_execute_header,  a2,  v4,  "No call found for conversation with group UUID: %@ so not sending buzz members relay message",  (uint8_t *)&v5);

  sub_10004351C();
}

void sub_1002B3D50(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 groupUUID]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_1000542E4( (void *)&_mh_execute_header,  a2,  v4,  "No call found for conversation with group UUID: %@ so not sending add remote members relay message",  (uint8_t *)&v5);

  sub_10004351C();
}

void sub_1002B3DD4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not create notification for XPC event %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B3E48()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008676C();
  sub_100086758( (void *)&_mh_execute_header,  v1,  v2,  "failed to initialize temporary directory (%d): %s",  v3,  v4,  v5,  v6,  v7);
  sub_10004351C();
}

void sub_1002B3EC4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008676C();
  sub_100086758( (void *)&_mh_execute_header,  v1,  v2,  "failed to resolve temporary directory (%d): %s",  v3,  v4,  v5,  v6,  v7);
  sub_10004351C();
}

void sub_1002B3F40( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B3FA8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B4010()
{
}

void sub_1002B4074()
{
}

void sub_1002B40D8(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 handle]);
  sub_1000117F0();
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Cannot start FaceTime IDS chat using handle %@ because IDS destination was '%@'",  v6,  0x16u);
}

void sub_1002B4178()
{
}

void sub_1002B41DC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_1000434DC( (void *)&_mh_execute_header,  a2,  a3,  "Requested transaction to answer already-ringing call with UUID %@ failed with error %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_1000117C4();
}

void sub_1002B4250(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to find existing chat for conversation: %@",  (uint8_t *)&v2,  0xCu);
  sub_1000117C4();
}

void sub_1002B42C0(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 remoteFromID]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Unable to convert to remoteIDSToken: %@",  a1,  0xCu);
}

void sub_1002B4334()
{
}

void sub_1002B4398()
{
}

void sub_1002B4414()
{
}

void sub_1002B4474()
{
}

void sub_1002B44D4()
{
}

void sub_1002B4534()
{
}

void sub_1002B4594()
{
}

void sub_1002B4604()
{
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Error occurred during IMFileCopierOperation type %ld on inputURL %@ and outputURL %@",  v3,  0x20u);
}

void sub_1002B4684(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to start conference connection when pulling call %@: %@",  (uint8_t *)&v4,  0x16u);
}

void sub_1002B470C(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 processBundleIdentifier]);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to grab assertion for process %@, reason: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_1002B47B8(void *a1, os_log_s *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received unsuccessful didSend for message with identifier %@ using account %@: %@",  (uint8_t *)&v5,  0x20u);
}

void sub_1002B4848(id *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 typeString]);
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to send %@ message: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_1002B48F8()
{
  sub_1000117CC( (void *)&_mh_execute_header,  v0,  v1,  "Can't perform start call action since queries did not return any destinations",  v2,  v3,  v4,  v5,  v6);
  sub_1000117DC();
}

void sub_1002B4924(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 callUUID]);
  sub_1000542D0( (void *)&_mh_execute_header,  v2,  v3,  "No longer handling call with UUID %@, requesting end",  v4,  v5,  v6,  v7,  2u);

  sub_10004351C();
}

void sub_1002B49A4(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 handle]);
  sub_1000542D0( (void *)&_mh_execute_header,  v2,  v3,  "Could not initiate FaceTime call - No IDS or IMAV call returned for handle %@",  v4,  v5,  v6,  v7,  2u);

  sub_10004351C();
}

void sub_1002B4A24()
{
}

void sub_1002B4A50()
{
}

void sub_1002B4A7C()
{
}

void sub_1002B4AA8()
{
  sub_1000117CC( (void *)&_mh_execute_header,  v0,  v1,  "Can't perform join call action since queries did not return any destinations",  v2,  v3,  v4,  v5,  v6);
  sub_1000117DC();
}

void sub_1002B4AD4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Attempted to prepare a new conference connection with the same identifier as an existing conference connection: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B4B48(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 conferenceConnections]);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  v6,  "Did not find conference connection to start for identifier %@. All conference connections: %@",  (uint8_t *)&v7);
}

void sub_1002B4BF0(id *a1, void **a2, os_log_s *a3)
{
  uint64_t v6 = v5;
  int v7 = *a2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 conference]);
  int v9 = 134218498;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  unint64_t v14 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "It's been %fs since asked to prepare to stop conference and conference connection still exists: %@. Forcefully clean ing up all conference connections for conference %@",  (uint8_t *)&v9,  0x20u);
}

void sub_1002B4CC0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Relay conference ended in failure (reason: %ld): %@",  (uint8_t *)&v3);
}

void sub_1002B4D3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "We were unable to send the PIN to the other device to be displayed, Sorry",  v1,  2u);
}

void sub_1002B4D7C(uint8_t *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
  *(_DWORD *)a1 = 138412290;
  *a2 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Could not obtain caller ID from Thumper IDS service %@",  a1,  0xCu);
}

void sub_1002B4DF4(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 faceTimeProvider]);
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Aborting Thumper registration; could not obtain sender identities from call provider %@.",
    (uint8_t *)&v4,
    0xCu);
}

void sub_1002B4E88(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Received didSendWithSuccess=NO for message with identifier %@: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1002B4F0C(uint64_t a1, id *a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([*a2 thumperService]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "No device found for account %@. All accounts: %@",  (uint8_t *)&v7,  0x16u);
}

void sub_1002B4FCC()
{
}

void sub_1002B502C()
{
}

void sub_1002B5058()
{
}

void sub_1002B50B8()
{
}

void sub_1002B5118()
{
}

void sub_1002B5178()
{
}

void sub_1002B51E4()
{
}

void sub_1002B5244(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 handle]);
  sub_1000434D0();
  sub_1000542E4( (void *)&_mh_execute_header,  a2,  v4,  "Not adding pending member since already tracking member in remoteMembers list: %@",  v5);

  sub_10004351C();
}

void sub_1002B52C4()
{
}

void sub_1002B5324()
{
}

void sub_1002B5384()
{
}

void sub_1002B53E4()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 activity]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
  sub_100021D5C();
  sub_1000117E4( (void *)&_mh_execute_header,  v0,  v4,  "Failed to delete image file after sending image for session %@ error %@",  v5);

  sub_100021D74();
}

void sub_1002B5478()
{
}

void sub_1002B54A4()
{
}

void sub_1002B54D0()
{
}

void sub_1002B54FC()
{
}

void sub_1002B5528()
{
}

void sub_1002B5554()
{
}

void sub_1002B5580()
{
}

void sub_1002B55E0()
{
  id v3 = objc_msgSend((id)sub_10010B960(), "typeAsString:");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000434D0();
  sub_1000542E4((void *)&_mh_execute_header, v0, v5, "Received an empty message of type: %@", v6);

  sub_10004351C();
}

void sub_1002B5664()
{
}

void sub_1002B56C4()
{
  id v3 = objc_msgSend((id)sub_10010B960(), "typeAsString:");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000434D0();
  sub_1000542E4((void *)&_mh_execute_header, v0, v5, "Originator not set on message type: %@", v6);

  sub_10004351C();
}

void sub_1002B5748()
{
}

void sub_1002B57A8()
{
}

void sub_1002B57D4()
{
}

void sub_1002B5800()
{
}

void sub_1002B582C()
{
}

void sub_1002B588C()
{
}

void sub_1002B58EC()
{
}

void sub_1002B594C()
{
  id v3 = objc_msgSend((id)sub_10010B960(), "typeAsString:");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000434D0();
  sub_1000542E4((void *)&_mh_execute_header, v0, v5, "Received an invalid count of participants on type: %@", v6);

  sub_10004351C();
}

void sub_1002B59D0()
{
}

void sub_1002B5A30()
{
}

void sub_1002B5A90()
{
}

void sub_1002B5AF0()
{
}

void sub_1002B5B1C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 addedMembers]);
  [v3 count];
  sub_1000434D0();
  sub_1000542E4((void *)&_mh_execute_header, a2, v4, "Invalid amount of members trying to be vouched (%lu)", v5);

  sub_10004351C();
}

void sub_1002B5BA0()
{
}

void sub_1002B5C00()
{
}

void sub_1002B5C64()
{
}

void sub_1002B5CC4()
{
}

void sub_1002B5CF0()
{
}

void sub_1002B5D1C()
{
}

void sub_1002B5D48()
{
}

void sub_1002B5D74()
{
}

void sub_1002B5DD4()
{
}

void sub_1002B5E34()
{
}

void sub_1002B5E94(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 UUID]);
  sub_1000434D0();
  sub_1000542E4( (void *)&_mh_execute_header,  a2,  v4,  "GreenTea devices are not supported to have this GFT conversation UUID: %@",  v5);

  sub_10004351C();
}

void sub_1002B5F14()
{
}

void sub_1002B5F40()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) handle]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 value]);
  sub_100021D5C();
  sub_1000117E4( (void *)&_mh_execute_header,  v0,  v4,  "Failed to sign complementary association voucher for member %@ due to error: %@",  v5);

  sub_100021D74();
}

void sub_1002B5FD8()
{
}

void sub_1002B6038()
{
}

void sub_1002B609C()
{
}

void sub_1002B60FC()
{
}

void sub_1002B615C()
{
}

void sub_1002B61BC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_10010B984(a1, a2), "activity");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v5;
  sub_10010B908((void *)&_mh_execute_header, v6, v7, "No image provided in update message for activity: %@");

  sub_10010B978();
}

void sub_1002B620C()
{
}

void sub_1002B626C()
{
}

void sub_1002B6298()
{
}

void sub_1002B6300()
{
}

void sub_1002B632C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_10010B984(a1, a2), "uniqueProxyIdentifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v5;
  sub_10010B908((void *)&_mh_execute_header, v6, v7, "Requesting to disconnect call %@");

  sub_10010B978();
}

void sub_1002B637C()
{
}

void sub_1002B63DC()
{
}

void sub_1002B643C()
{
}

void sub_1002B6468(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 URL]);
  sub_1000434D0();
  sub_1000542E4((void *)&_mh_execute_header, a2, v4, "Transfer already in progress for resource at url %@", v5);

  sub_10004351C();
}

void sub_1002B64E8()
{
}

void sub_1002B6514()
{
  uint64_t v2 = TULoggableStringForHandle(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v0 storageGuid]);
  sub_10010B8B4();
  sub_10010B924( (void *)&_mh_execute_header,  v5,  v6,  "service:account:incomingData:fromID:context: receiving proxied IDS message from %{mask.hash}@ with ID %{mask.hash}@",  v7,  v8,  v9,  v10,  v11);

  sub_10010B944();
}

void sub_1002B65A4()
{
  uint64_t v2 = TULoggableStringForHandle(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v0 storageGuid]);
  sub_10010B8B4();
  sub_10010B924( (void *)&_mh_execute_header,  v5,  v6,  "service:account:incomingResourceAtURL:metadata:fromID:context: receiving proxied IDS resource from %{mask.hash}@ wit h ID %{mask.hash}@",  v7,  v8,  v9,  v10,  v11);

  sub_10010B944();
}

void sub_1002B6634()
{
}

void sub_1002B6660()
{
}

void sub_1002B668C()
{
}

void sub_1002B66B8()
{
}

void sub_1002B66E4()
{
  id v3 = objc_msgSend((id)sub_10010B960(), "typeAsString:");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000434D0();
  sub_1000542E4( (void *)&_mh_execute_header,  v0,  v5,  "Dropping message since the type %@ is not allowed for lightweightMembers",  v6);

  sub_10004351C();
}

void sub_1002B6768()
{
}

void sub_1002B6794()
{
}

void sub_1002B67C0()
{
}

void sub_1002B67EC()
{
}

void sub_1002B6818()
{
}

void sub_1002B6844()
{
}

void sub_1002B6870()
{
}

void sub_1002B68D0()
{
}

void sub_1002B693C()
{
}

void sub_1002B6968()
{
}

void sub_1002B6994()
{
}

void sub_1002B69C0()
{
}

void sub_1002B6A20()
{
}

void sub_1002B6A4C()
{
}

void sub_1002B6A78()
{
}

void sub_1002B6AA4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to activate remote display discovery: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B6B18()
{
}

void sub_1002B6B7C()
{
}

void sub_1002B6BE0()
{
}

void sub_1002B6C40()
{
}

void sub_1002B6CA0()
{
}

void sub_1002B6D00()
{
}

void sub_1002B6D60()
{
}

void sub_1002B6DC0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to initialize CXCallDirectoryStore for reading: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B6E34(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error checking if call directory database contains blocking entry for source address %@: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1002B6EB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Received a malformed prominence relay message",  v1,  2u);
}

void sub_1002B6EF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B6F2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B6F60()
{
}

void sub_1002B6FC0()
{
}

void sub_1002B7020()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117DC();
}

void sub_1002B704C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B70AC()
{
}

void sub_1002B710C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B716C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117DC();
}

void sub_1002B7198()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117DC();
}

void sub_1002B71C4()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117DC();
}

void sub_1002B71F0()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B7250()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B72B0()
{
}

void sub_1002B7310()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117DC();
}

void sub_1002B733C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117DC();
}

void sub_1002B7368()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B73C8()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B7428()
{
}

void sub_1002B7488(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Not updating isSendingVideo: %d since not showing in-call ui",  (uint8_t *)v3,  8u);
  sub_1000117DC();
}

void sub_1002B74FC()
{
}

void sub_1002B755C()
{
}

void sub_1002B75BC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B7624( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B768C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Dropping notice %@ because of invalid bundleID",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B7700(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to load activated conversation links with error %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B7774(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Not creating activitySession -- bundleID not available",  v1,  2u);
}

void sub_1002B77B4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B781C(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 protoUpgradeSessionUUID]);
  sub_1000434D0();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while creating UUID from %@", v4, 0xCu);
}

void sub_1002B78B0()
{
}

void sub_1002B7910()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B7970()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000117C4();
}

void sub_1002B79D0()
{
}

void sub_1002B79FC()
{
}

void sub_1002B7A5C()
{
}

void sub_1002B7A88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B7AF0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B7B58( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B7BC0()
{
}

void sub_1002B7C20()
{
}

void sub_1002B7C4C(void *a1, uint64_t a2, os_log_s *a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 link]);
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "There's already an ongoing conversation %@ with the same groupUUID as the link %@, but the conversation does not hav e the same link %@",  (uint8_t *)&v7,  0x20u);
}

void sub_1002B7D04()
{
}

void sub_1002B7D64()
{
}

void sub_1002B7DC4()
{
}

void sub_1002B7E24()
{
}

void sub_1002B7E50()
{
}

void sub_1002B7E7C()
{
}

void sub_1002B7EA8()
{
}

void sub_1002B7F08()
{
}

void sub_1002B7F34()
{
}

void sub_1002B7F60()
{
}

void sub_1002B7FC0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1002B8028( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1002B8090()
{
}

void sub_1002B80F0()
{
}

void sub_1002B8150(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_1000434DC( (void *)&_mh_execute_header,  a2,  a3,  "Conference connection failed for call %@: %@. Disconnecting call with relay failed",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_1000117C4();
}

void sub_1002B81C0(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 uniqueProxyIdentifier]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Nil call returned when dialing call. Notifying client of failed dial call for %@",  (uint8_t *)&v4,  0xCu);
}

void sub_1002B8258()
{
}

void sub_1002B82BC()
{
  sub_1000117B4( (void *)&_mh_execute_header,  v0,  v1,  "Nil call returned when dialing call. Notifying client of failed dial call for %@ ",  v2,  v3,  v4,  v5,  v6);
  sub_1000117C4();
}

void sub_1002B8320()
{
  sub_1000117B4( (void *)&_mh_execute_header,  v0,  v1,  "Nil call returned when dialing call. Notifying client of failed join conversation request %@",  v2,  v3,  v4,  v5,  v6);
  sub_1000117C4();
}

void sub_1002B8384()
{
}

void sub_1002B83E8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "...and no hosted call was found with TUHardPauseDigitsStateDigitsAvailable, so not sending hard pause digits",  v1,  2u);
}

void sub_1002B8428()
{
}

void sub_1002B8488()
{
}

void sub_1002B84E8()
{
}

void sub_1002B8548(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_1002B85BC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412546;
  uint64_t v4 = @"Ringtones";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_1000117E4( (void *)&_mh_execute_header,  a2,  a3,  "Error creating '%@' sandbox extension directory: %@",  (uint8_t *)&v3);
  sub_1000117C4();
}

void sub_1002B8638()
{
}

void sub_1002B8698()
{
}

void sub_1002B86F8()
{
}

void sub_1002B8758(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Error removing links for filenames not in array (%@): %@",  (uint8_t *)&v3);
  sub_1000117C4();
}

void sub_1002B87D0()
{
}

void sub_1002B8830(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_opt_class(a1, a2);
  id v4 = sub_1001575FC(v3);
  sub_1000117E4((void *)&_mh_execute_header, a2, v5, "Registered providers object was of unexpected class %@: %@", v6);

  sub_10004351C();
}

void sub_1002B88B0()
{
}

void sub_1002B8910( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B8944( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B8978()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 remoteParticipantsByIdentifier]);
  sub_10016015C();
  sub_100021D48( (void *)&_mh_execute_header,  v2,  v3,  "Unknown participant identifier %llu current participants: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100021D74();
}

void sub_1002B89F4()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 remoteParticipantsByIdentifier]);
  sub_10016015C();
  sub_100021D48( (void *)&_mh_execute_header,  v2,  v3,  "Unknown participant identifier %lu current participants: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100021D74();
}

void sub_1002B8A70( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B8AD4()
{
}

void sub_1002B8B3C(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 remoteParticipantsByIdentifier]);
  sub_10016015C();
  sub_100021D48( (void *)&_mh_execute_header,  v3,  v4,  "removeParticipant: %@ Active remote participants: %@",  v5,  v6,  v7,  v8,  v9);

  sub_100021D74();
}

void sub_1002B8BC0()
{
}

void sub_1002B8C28()
{
}

void sub_1002B8C90()
{
}

void sub_1002B8CF0()
{
}

void sub_1002B8D50()
{
}

void sub_1002B8DB0()
{
}

void sub_1002B8E10()
{
}

void sub_1002B8E70()
{
}

void sub_1002B8ED0(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "screenCapture: %@ didStart: %d, captureWithError: %@",  (uint8_t *)&v6,  0x1Cu);
}

void sub_1002B8F68( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B8FD0()
{
}

void sub_1002B9030()
{
}

void sub_1002B9090()
{
}

void sub_1002B90F0()
{
}

void sub_1002B9150()
{
}

void sub_1002B91B0()
{
}

void sub_1002B9210()
{
}

void sub_1002B9270()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Conference connection failed for call %@: %@. Disconnecting call with relay failed",  v2,  0x16u);
  sub_1000117C4();
}

void sub_1002B92EC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error while querying file attributes: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B9360(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = *a1;
  id v7 = [a2 validationStatusForAlias:*a1];
  id v8 = [a2 validationErrorReasonForAlias:*a1];
  int v9 = (void *)objc_claimAutoreleasedReturnValue([a2 vettedAliases]);
  int v10 = 138413314;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  __int16 v13 = a2;
  __int16 v14 = 2048;
  id v15 = v7;
  __int16 v16 = 2048;
  id v17 = v8;
  __int16 v18 = 2112;
  uint64_t v19 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to add alias %@ to account %@. Validation status: %ld, validation error reason: %ld, vetted aliases: %@",  (uint8_t *)&v10,  0x34u);
}

void sub_1002B945C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error while saving _callerID %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B94D0(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 client]);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to get active contexts from client %@: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_1002B957C()
{
  sub_100176CB8( (void *)&_mh_execute_header,  v0,  v1,  "Error getting emergency callback mode (domain=%d, code=%d)",  v2,  v3);
  sub_1000117C4();
}

void sub_1002B95DC()
{
}

void sub_1002B963C()
{
}

void sub_1002B969C()
{
}

void sub_1002B96FC()
{
}

void sub_1002B975C()
{
}

void sub_1002B97C0()
{
}

void sub_1002B9824()
{
  sub_100176CB8((void *)&_mh_execute_header, v0, v1, "Error getting system capabilities (domain=%d, code=%d)", v2, v3);
  sub_1000117C4();
}

void sub_1002B9884()
{
}

void sub_1002B98E4()
{
}

void sub_1002B9944()
{
}

void sub_1002B99A4()
{
}

void sub_1002B9A04()
{
  sub_100176CB8((void *)&_mh_execute_header, v0, v1, "Error getting ISO country code (domain=%d, code=%d)", v2, v3);
  sub_1000117C4();
}

void sub_1002B9A64(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "JoinCallAction is not valid because there is not exactly one remote member %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1002B9AD8()
{
  uint64_t v3 = v0;
  sub_1000117E4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Not starting a new session for identifier %@ because an active session for the identifier already exists: %@",  v2);
}

void sub_1002B9B48(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 firstObject]);
  sub_1000117F0();
  uint64_t v8 = a2;
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  v6,  "Not starting a new session for identifier %@ because an active session for the identifier already exists: %@",  v7);
}

void sub_1002B9BE0()
{
}

void sub_1002B9C40()
{
}

void sub_1002B9CA0()
{
}

void sub_1002B9D08()
{
}

void sub_1002B9D70()
{
}

void sub_1002B9DD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B9E00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002B9E30(void *a1, os_log_s *a2)
{
}

void sub_1002B9EA4()
{
}

void sub_1002B9F04(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 transactionID]);
  sub_1000434D0();
  sub_1000542E4((void *)&_mh_execute_header, a2, v4, "Received an invalid request transaction ID: %@", v5);

  sub_10004351C();
}

void sub_1002B9F84()
{
}

void sub_1002B9FE4()
{
}

void sub_1002BA044(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 remoteIDSDestinations]);
  int v7 = 138412546;
  uint64_t v8 = a1;
  sub_100191840();
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  v6,  "failed to find remoteIDSDestination from request: %@ in session remoteIDSDestinations: %@",  (uint8_t *)&v7);

  sub_100021D74();
}

void sub_1002BA0D8()
{
}

void sub_1002BA138()
{
}

void sub_1002BA198()
{
}

void sub_1002BA200()
{
}

void sub_1002BA260()
{
}

void sub_1002BA2C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002BA2F0()
{
}

void sub_1002BA354()
{
}

void sub_1002BA3B8(uint64_t *a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 remoteIDSDestinations]);
  int v7 = 138412546;
  uint64_t v8 = v4;
  sub_100191840();
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  v6,  "Received moments resource from IDS destination %@ but expected %@",  (uint8_t *)&v7);

  sub_100021D74();
}

void sub_1002BA44C(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a2 sessionsByToken]);
  int v7 = 138412546;
  uint64_t v8 = a1;
  sub_100191840();
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  v6,  "Received moments resource with unknown transaction ID %@. All sessions: %@",  (uint8_t *)&v7);

  sub_100021D74();
}

void sub_1002BA4E0()
{
}

void sub_1002BA544()
{
}

void sub_1002BA5A4()
{
}

void sub_1002BA60C()
{
}

void sub_1002BA674()
{
}

void sub_1002BA6D4()
{
}

void sub_1002BA734()
{
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  sub_1000117E4((void *)&_mh_execute_header, v1, v2, "Error saving resources with photo url: %@ video url: %@", v3);
  sub_1000117C4();
}

void sub_1002BA7A8()
{
}

void sub_1002BA80C(void *a1, int a2, os_log_s *a3)
{
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  id v6 = [a1 callID];
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to initialize a new call with device role %d. Got callID=%ld",  (uint8_t *)v4,  0x12u);
}

void sub_1002BA8A4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "AVConference server died", v1, 2u);
}

void sub_1002BA8E4()
{
}

void sub_1002BA944()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Join call action failed: %@, faceTimeIDStatus: %d",  v2,  0x12u);
  sub_1000117C4();
}

void sub_1002BA9C0()
{
}

void sub_1002BAA20()
{
}

void sub_1002BAA80()
{
}

void sub_1002BAAE0(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 calls]);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  int v10 = v5;
  sub_1000117E4( (void *)&_mh_execute_header,  a3,  v6,  "Could not find call to group with for set group call action: %@. All call: %@",  (uint8_t *)&v7);

  sub_100021D74();
}

void sub_1002BAB7C()
{
}

void sub_1002BABDC()
{
}

void sub_1002BAC3C(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
  unsigned int v5 = [v4 isUplinkMuted];
  int v7 = @"NO";
  if (v5) {
    int v7 = @"YES";
  }
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  sub_1000117E4((void *)&_mh_execute_header, a2, v6, "Set muted call action failed: %@ %@", (uint8_t *)&v8);

  sub_100021D74();
}

void sub_1002BACF8()
{
}

void sub_1002BAD58()
{
}

void sub_1002BADB8()
{
}

void sub_1002BAE18()
{
}

void sub_1002BAE78( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002BAEE0()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_1000117E4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Error while determining process action for callSource: %@, action: %@",  v2);
  sub_1000117C4();
}

void sub_1002BAF54(id *a1, uint64_t a2, os_log_s *a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([*a1 machServiceName]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([*a1 requiredConnectionCapability]);
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Rejecting client for %@ because it lacks the %@ capability: %@",  (uint8_t *)&v8,  0x20u);
}

void sub_1002BB024(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)__int16 v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&uint8_t v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_1000434DC( (void *)&_mh_execute_header,  a2,  a3,  "Could not report new multiway call from %@: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
}

void sub_1002BB09C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)__int16 v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&uint8_t v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_1000434DC( (void *)&_mh_execute_header,  a2,  a3,  "Reporting call failure for conversation with conversationUUID %@ and callUUID %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
}

id objc_msgSend_ABTestConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ABTestConfiguration];
}

id objc_msgSend_AVCBlobRecoveryGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 AVCBlobRecoveryGracePeriod];
}

id objc_msgSend_AVCBlobRecoveryTimeout(void *a1, const char *a2, ...)
{
  return _[a1 AVCBlobRecoveryTimeout];
}

id objc_msgSend_DTMFKey(void *a1, const char *a2, ...)
{
  return _[a1 DTMFKey];
}

id objc_msgSend_FZIDType(void *a1, const char *a2, ...)
{
  return _[a1 FZIDType];
}

id objc_msgSend_GUID(void *a1, const char *a2, ...)
{
  return _[a1 GUID];
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _[a1 ID];
}

id objc_msgSend_IDSFormattedDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 IDSFormattedDestinationID];
}

id objc_msgSend_IMAVChatRemoteVideoPresentationStateFromCXVideoPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMAVChatRemoteVideoPresentationStateFromCXVideoPresentationState:");
}

id objc_msgSend_ISOCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 ISOCountryCode];
}

id objc_msgSend_ISOCountryCodeForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ISOCountryCodeForCallWithUUID:");
}

id objc_msgSend_ISOCountryCodeForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ISOCountryCodeForChat:");
}

id objc_msgSend_ISOCountryCodeForMobileCountryCode_mobileNetworkCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ISOCountryCodeForMobileCountryCode:mobileNetworkCode:");
}

id objc_msgSend_ISOCountryCodeForSubscriptionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ISOCountryCodeForSubscriptionUUID:");
}

id objc_msgSend_ITUCountryCodeForISOCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ITUCountryCodeForISOCountryCode:");
}

id objc_msgSend_SHA1HexString(void *a1, const char *a2, ...)
{
  return _[a1 SHA1HexString];
}

id objc_msgSend_SIMIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 SIMIdentifier];
}

id objc_msgSend_TLESampleRate(void *a1, const char *a2, ...)
{
  return _[a1 TLESampleRate];
}

id objc_msgSend_TUCallRemoteVideoPresentationStateFromCXVideoPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:");
}

id objc_msgSend_UIBackgroundModes(void *a1, const char *a2, ...)
{
  return _[a1 UIBackgroundModes];
}

id objc_msgSend_URI(void *a1, const char *a2, ...)
{
  return _[a1 URI];
}

id objc_msgSend_URIWithPrefixedURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URIWithPrefixedURI:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByStandardizingPath];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__FTCopyGzippedData(void *a1, const char *a2, ...)
{
  return _[a1 _FTCopyGzippedData];
}

id objc_msgSend__FTDecompressData(void *a1, const char *a2, ...)
{
  return _[a1 _FTDecompressData];
}

id objc_msgSend__FTOptionallyDecompressData(void *a1, const char *a2, ...)
{
  return _[a1 _FTOptionallyDecompressData];
}

id objc_msgSend__ISOCountryCodeForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ISOCountryCodeForCall:");
}

id objc_msgSend__ISOCountryCodeForCallWithUUID_provider_callUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ISOCountryCodeForCallWithUUID:provider:callUpdate:");
}

id objc_msgSend___imArrayByApplyingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imArrayByApplyingBlock:");
}

id objc_msgSend___imSetFromArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imSetFromArray");
}

id objc_msgSend__acceptInvitationWithData_alwaysSendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acceptInvitationWithData:alwaysSendData:");
}

id objc_msgSend__accountsMatchForSecondaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 _accountsMatchForSecondaryCalling];
}

id objc_msgSend__actionRequiresReasonableUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionRequiresReasonableUserIntent:");
}

id objc_msgSend__activeCallID(void *a1, const char *a2, ...)
{
  return _[a1 _activeCallID];
}

id objc_msgSend__addCallToCallHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addCallToCallHistory:");
}

id objc_msgSend__addParticipantsWaitingToBeAddedToAVCSession(void *a1, const char *a2, ...)
{
  return _[a1 _addParticipantsWaitingToBeAddedToAVCSession];
}

id objc_msgSend__addRemoteParticipantToAVCSessionIfPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRemoteParticipantToAVCSessionIfPossible:");
}

id objc_msgSend__addSupplementalActionsForRequestedTransaction_onCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addSupplementalActionsForRequestedTransaction:onCallSource:");
}

id objc_msgSend__allCalls(void *a1, const char *a2, ...)
{
  return _[a1 _allCalls];
}

id objc_msgSend__allMembers(void *a1, const char *a2, ...)
{
  return _[a1 _allMembers];
}

id objc_msgSend__allowMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowMember:");
}

id objc_msgSend__allowRevertingStateForCompletedTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowRevertingStateForCompletedTransactionGroup:");
}

id objc_msgSend__answerHostedCall_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_answerHostedCall:completionHandler:");
}

id objc_msgSend__answerIncomingCall_withBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_answerIncomingCall:withBehavior:");
}

id objc_msgSend__answerIncomingCallAsConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_answerIncomingCallAsConversation:");
}

id objc_msgSend__anyOtherCallHasAnEndpointElsewhere_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anyOtherCallHasAnEndpointElsewhere:");
}

id objc_msgSend__anyRoutePassesTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anyRoutePassesTest:");
}

id objc_msgSend__appearsToBeDSID(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBeDSID];
}

id objc_msgSend__applyUpdateFromDataBlobForRemoteParticipant_participantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyUpdateFromDataBlobForRemoteParticipant:participantIdentifier:");
}

id objc_msgSend__audioRouteCollectionForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_audioRouteCollectionForCall:");
}

id objc_msgSend__beginTimeoutForLeavingConversationWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginTimeoutForLeavingConversationWithReason:");
}

id objc_msgSend__bundleIdentifierForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundleIdentifierForCall:");
}

id objc_msgSend__callDirectoryPhoneNumberVariantsForSourceAddress_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callDirectoryPhoneNumberVariantsForSourceAddress:countryCode:");
}

id objc_msgSend__callFilterBlock(void *a1, const char *a2, ...)
{
  return _[a1 _callFilterBlock];
}

id objc_msgSend__callGroupsWithBackingCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callGroupsWithBackingCallSource:");
}

id objc_msgSend__callHistoryTransactionObjectWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callHistoryTransactionObjectWithIdentifier:");
}

id objc_msgSend__callWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callWithUUID:");
}

id objc_msgSend__callWithUUID_backingCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callWithUUID:backingCallSource:");
}

id objc_msgSend__callWithUUID_controllableByCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callWithUUID:controllableByCallSource:");
}

id objc_msgSend__callsWithUniqueProxyIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callsWithUniqueProxyIdentifiers:");
}

id objc_msgSend__canAddCallToCallHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canAddCallToCallHistory:");
}

id objc_msgSend__canReceiveGuestSessionInviteForMessageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canReceiveGuestSessionInviteForMessageType:");
}

id objc_msgSend__cancelInFlightAVCBlobRecoveryIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _cancelInFlightAVCBlobRecoveryIfNecessary];
}

id objc_msgSend__cancelInvitationWithData_reason_alwaysSendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelInvitationWithData:reason:alwaysSendData:");
}

id objc_msgSend__cancelTimeoutForLeavingConversation(void *a1, const char *a2, ...)
{
  return _[a1 _cancelTimeoutForLeavingConversation];
}

id objc_msgSend__cleanCallMediaCache(void *a1, const char *a2, ...)
{
  return _[a1 _cleanCallMediaCache];
}

id objc_msgSend__cleanUpAllConferenceConnectionsForConference_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpAllConferenceConnectionsForConference:withError:");
}

id objc_msgSend__cleanUpConferenceConnection_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpConferenceConnection:error:");
}

id objc_msgSend__cleanUpConversation(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpConversation];
}

id objc_msgSend__cleanUpFromAVCSessionFailure(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpFromAVCSessionFailure];
}

id objc_msgSend__cleanUpHandoffMetricsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpHandoffMetricsIfNecessary];
}

id objc_msgSend__cloudCallingDevices(void *a1, const char *a2, ...)
{
  return _[a1 _cloudCallingDevices];
}

id objc_msgSend__commitUncommittedTransactions(void *a1, const char *a2, ...)
{
  return _[a1 _commitUncommittedTransactions];
}

id objc_msgSend__conferenceConnectionsForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conferenceConnectionsForConference:");
}

id objc_msgSend__conferenceTransport_didStopForCall_cleanly_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conferenceTransport:didStopForCall:cleanly:error:");
}

id objc_msgSend__connectionEndedHandlerForXPCClient_withCustomBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionEndedHandlerForXPCClient:withCustomBlock:");
}

id objc_msgSend__contactForHandle_contactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactForHandle:contactStore:");
}

id objc_msgSend__contextDictionaryWithCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contextDictionaryWithCall:");
}

id objc_msgSend__conversationProviderForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationProviderForCall:");
}

id objc_msgSend__conversationsByGroupUUIDFilteredForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationsByGroupUUIDFilteredForClient:");
}

id objc_msgSend__createDelayedActionListIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDelayedActionListIfNecessary:");
}

id objc_msgSend__createJoinCallAction_outgoingCallerID_gftOneToOneDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createJoinCallAction:outgoingCallerID:gftOneToOneDestinations:");
}

id objc_msgSend__createSessionToDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSessionToDestinations:");
}

id objc_msgSend__createSessionToDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSessionToDevices:");
}

id objc_msgSend__createSessionsToAllDevicesSupportingProvider_requiresConversationRelaySupport_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSessionsToAllDevicesSupportingProvider:requiresConversationRelaySupport:");
}

id objc_msgSend__declineInvitationWithData_alwaysSendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_declineInvitationWithData:alwaysSendData:");
}

id objc_msgSend__defaultAppProviderForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultAppProviderForRemoteClients:");
}

id objc_msgSend__defaultOverrideForDisableDefault_forceDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultOverrideForDisableDefault:forceDefault:");
}

id objc_msgSend__deferCommittingTransactionsUntilAfterRunningBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deferCommittingTransactionsUntilAfterRunningBlock:");
}

id objc_msgSend__destroySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destroySession:");
}

id objc_msgSend__deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled];
}

id objc_msgSend__dial_displayContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dial:displayContext:completion:");
}

id objc_msgSend__dialDelayForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dialDelayForRequest:");
}

id objc_msgSend__disconnectOrPullExistingCallsForCallIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectOrPullExistingCallsForCallIfNecessary:");
}

id objc_msgSend__displaySharePlayUnableToStartWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_displaySharePlayUnableToStartWithMessage:");
}

id objc_msgSend__doNotDisturbAllowsCallFromSourceAddress_providerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doNotDisturbAllowsCallFromSourceAddress:providerIdentifier:");
}

id objc_msgSend__emitRTCConnectionSetupEvent_participantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emitRTCConnectionSetupEvent:participantIdentifier:");
}

id objc_msgSend__emitRTCConnectionSetupEventForAddActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emitRTCConnectionSetupEventForAddActiveParticipant:");
}

id objc_msgSend__endCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endCall:");
}

id objc_msgSend__endCallIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _endCallIfNecessary];
}

id objc_msgSend__endChatWithUUID_withEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endChatWithUUID:withEndedReason:");
}

id objc_msgSend__endMutuallyExclusiveCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endMutuallyExclusiveCalls:");
}

id objc_msgSend__endProxyCallsForConnectingVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 _endProxyCallsForConnectingVideoCall];
}

id objc_msgSend__endScreenCallIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _endScreenCallIfNecessary];
}

id objc_msgSend__endTransactionForObjectAfterCallHistoryDatabaseChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endTransactionForObjectAfterCallHistoryDatabaseChanges:");
}

id objc_msgSend__endedReasonForDidStopError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endedReasonForDidStopError:error:");
}

id objc_msgSend__errorToAVCProviderEndedReason_defaultProviderReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorToAVCProviderEndedReason:defaultProviderReason:");
}

id objc_msgSend__expanseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _expanseEnabled];
}

id objc_msgSend__faceTimeAudioAvailability(void *a1, const char *a2, ...)
{
  return _[a1 _faceTimeAudioAvailability];
}

id objc_msgSend__faceTimeVideoAvailability(void *a1, const char *a2, ...)
{
  return _[a1 _faceTimeVideoAvailability];
}

id objc_msgSend__failConversation_failureReason_providerEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_failConversation:failureReason:providerEndedReason:");
}

id objc_msgSend__filter_withClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filter:withClient:");
}

id objc_msgSend__findPendingConversationWithCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findPendingConversationWithCallUUID:");
}

id objc_msgSend__generateABTestConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _generateABTestConfiguration];
}

id objc_msgSend__generateHandoffReportIfNecessaryForUpdatedParticipantID_isAddParticipant_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:");
}

id objc_msgSend__getActivatedLinkWithHandle_updateGroupUUID_updateInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getActivatedLinkWithHandle:updateGroupUUID:updateInvitedHandles:");
}

id objc_msgSend__handleActiveCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActiveCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleAudioReadyForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAudioReadyForCall:");
}

id objc_msgSend__handleCallConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCallConnected:");
}

id objc_msgSend__handleCallDurationTimerFired(void *a1, const char *a2, ...)
{
  return _[a1 _handleCallDurationTimerFired];
}

id objc_msgSend__handleCallHasStartedOutgoingChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCallHasStartedOutgoingChanged:");
}

id objc_msgSend__handleCallHistoryChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handleCallHistoryChanged];
}

id objc_msgSend__handleCallMayRequireBreakBeforeMakeChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCallMayRequireBreakBeforeMakeChanged:");
}

id objc_msgSend__handleCallStartedConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCallStartedConnecting:");
}

id objc_msgSend__handleCallStatusChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCallStatusChanged:");
}

id objc_msgSend__handleCallWantsHoldMusicChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCallWantsHoldMusicChanged:");
}

id objc_msgSend__handleConnectedCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectedCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleConnectingCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectingCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleDeviceFirstUnlockNotification(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeviceFirstUnlockNotification];
}

id objc_msgSend__handleDeviceLockStatusNotification(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeviceLockStatusNotification];
}

id objc_msgSend__handleDisconnectedCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDisconnectedCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleDisconnectedCallStatusChangeForVoicemailCall(void *a1, const char *a2, ...)
{
  return _[a1 _handleDisconnectedCallStatusChangeForVoicemailCall];
}

id objc_msgSend__handleGroupUUIDChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGroupUUIDChangeForHostedCall:");
}

id objc_msgSend__handleHeldCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHeldCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleMessagingConnectionEndForCalls_withDisconnectedReason_didStartConnecting_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:");
}

id objc_msgSend__handlePairedDeviceChangedFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePairedDeviceChangedFrom:to:");
}

id objc_msgSend__handlePushTokensInvited_didSendInvitation_didCancelInvitation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePushTokensInvited:didSendInvitation:didCancelInvitation:");
}

id objc_msgSend__handleReceivedResourcesAtDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleReceivedResourcesAtDirectoryURL:");
}

id objc_msgSend__handleReceivedVideoURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleReceivedVideoURL:");
}

id objc_msgSend__handleRelayCallingChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handleRelayCallingChanged];
}

id objc_msgSend__handleRingingCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRingingCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleSendingCallStatusChangeForHostedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSendingCallStatusChangeForHostedCall:");
}

id objc_msgSend__handleStateChanged_oldState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStateChanged:oldState:");
}

id objc_msgSend__hasAlreadyDeniedSendingNameAndPhotoToHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasAlreadyDeniedSendingNameAndPhotoToHandles:");
}

id objc_msgSend__identifiersForCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifiersForCalls:");
}

id objc_msgSend__inactiveRemoteMemberForHandle_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inactiveRemoteMemberForHandle:conversation:");
}

id objc_msgSend__incomingPendingConversationsByGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 _incomingPendingConversationsByGroupUUID];
}

id objc_msgSend__initWithTypeIdentifier_suggestedActionType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithTypeIdentifier:suggestedActionType:options:");
}

id objc_msgSend__initWithUserActivityType_dynamicActivityType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithUserActivityType:dynamicActivityType:options:");
}

id objc_msgSend__initializeAudioRouteCollections(void *a1, const char *a2, ...)
{
  return _[a1 _initializeAudioRouteCollections];
}

id objc_msgSend__initializeAutomaticCarDNDStatusIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _initializeAutomaticCarDNDStatusIfNecessary];
}

id objc_msgSend__initializeLastKnownCallerID(void *a1, const char *a2, ...)
{
  return _[a1 _initializeLastKnownCallerID];
}

id objc_msgSend__initializePairedHostDeviceState(void *a1, const char *a2, ...)
{
  return _[a1 _initializePairedHostDeviceState];
}

id objc_msgSend__isActiveRemoteMemberForHandle_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isActiveRemoteMemberForHandle:conversation:");
}

id objc_msgSend__isAudioAccessoryDevice(void *a1, const char *a2, ...)
{
  return _[a1 _isAudioAccessoryDevice];
}

id objc_msgSend__isCTErrorFatal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCTErrorFatal:");
}

id objc_msgSend__isMuted(void *a1, const char *a2, ...)
{
  return _[a1 _isMuted];
}

id objc_msgSend__isNSErrorFatal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isNSErrorFatal:");
}

id objc_msgSend__isSendingAudio(void *a1, const char *a2, ...)
{
  return _[a1 _isSendingAudio];
}

id objc_msgSend__isSendingAudioData(void *a1, const char *a2, ...)
{
  return _[a1 _isSendingAudioData];
}

id objc_msgSend__isSendingVideo(void *a1, const char *a2, ...)
{
  return _[a1 _isSendingVideo];
}

id objc_msgSend__isSendingVideoExpected(void *a1, const char *a2, ...)
{
  return _[a1 _isSendingVideoExpected];
}

id objc_msgSend__isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:");
}

id objc_msgSend__isWaitingToJoinForConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isWaitingToJoinForConversationUUID:");
}

id objc_msgSend__isWatchDevice(void *a1, const char *a2, ...)
{
  return _[a1 _isWatchDevice];
}

id objc_msgSend__kickedOrRejectedMemberForHandle_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kickedOrRejectedMemberForHandle:conversation:");
}

id objc_msgSend__launchApplicationDueToActivityCreation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchApplicationDueToActivityCreation:");
}

id objc_msgSend__launchApplicationForActivityIfNecessary_shouldForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchApplicationForActivityIfNecessary:shouldForeground:");
}

id objc_msgSend__launchApplicationsForActivitiesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _launchApplicationsForActivitiesIfNecessary];
}

id objc_msgSend__launchApplicationsForActivitiesIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchApplicationsForActivitiesIfNecessary:");
}

id objc_msgSend__launchICSForScreeningIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _launchICSForScreeningIfNeeded];
}

id objc_msgSend__launchInCallApplicationForAnsweringCallIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchInCallApplicationForAnsweringCallIfNecessary:");
}

id objc_msgSend__launchInCallApplicationForCall_withURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchInCallApplicationForCall:withURL:");
}

id objc_msgSend__launchInCallApplicationForIncomingCallIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchInCallApplicationForIncomingCallIfNecessary:");
}

id objc_msgSend__launchInCallApplicationForOutgoingCallIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchInCallApplicationForOutgoingCallIfNecessary:");
}

id objc_msgSend__launchInCallApplicationForOutgoingCallOnHostIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _launchInCallApplicationForOutgoingCallOnHostIfNecessary];
}

id objc_msgSend__launchInCallApplicationForOutgoingConversationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchInCallApplicationForOutgoingConversationIfNecessary:");
}

id objc_msgSend__leaveConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_leaveConversation:");
}

id objc_msgSend__leaveConversation_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_leaveConversation:withContext:");
}

id objc_msgSend__linksEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _linksEnabled];
}

id objc_msgSend__nameAndPhotoSharingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _nameAndPhotoSharingEnabled];
}

id objc_msgSend__nonRingingCallExistsOnThisDevice(void *a1, const char *a2, ...)
{
  return _[a1 _nonRingingCallExistsOnThisDevice];
}

id objc_msgSend__notifyCLTMOfIncomingCall(void *a1, const char *a2, ...)
{
  return _[a1 _notifyCLTMOfIncomingCall];
}

id objc_msgSend__numberForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberForKey:");
}

id objc_msgSend__observeSignal_usingHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_observeSignal:usingHandler:");
}

id objc_msgSend__outgoingCallerID(void *a1, const char *a2, ...)
{
  return _[a1 _outgoingCallerID];
}

id objc_msgSend__parsePauseDigitsFromDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parsePauseDigitsFromDestinationID:");
}

id objc_msgSend__performBlock_onClients_coalescedByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlock:onClients:coalescedByIdentifier:");
}

id objc_msgSend__performDelegateCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performDelegateCallback:");
}

id objc_msgSend__performRequestedTransaction_onCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performRequestedTransaction:onCallSource:");
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return _[a1 _plugIn];
}

id objc_msgSend__postDidCloseNotificationForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postDidCloseNotificationForConference:");
}

id objc_msgSend__postDidCloseNotificationForConferenceIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postDidCloseNotificationForConferenceIfNecessary:");
}

id objc_msgSend__postNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotificationName:");
}

id objc_msgSend__prepareConferenceForConferenceConnection_remoteInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareConferenceForConferenceConnection:remoteInviteDictionary:");
}

id objc_msgSend__primaryThumperAccountRequiringAvailableDeviceSlots(void *a1, const char *a2, ...)
{
  return _[a1 _primaryThumperAccountRequiringAvailableDeviceSlots];
}

id objc_msgSend__primaryThumperAccountRequiringMatchingCallerID(void *a1, const char *a2, ...)
{
  return _[a1 _primaryThumperAccountRequiringMatchingCallerID];
}

id objc_msgSend__processCompletedCallAction_forCall_allowRevertingState_isOnenessActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCompletedCallAction:forCall:allowRevertingState:isOnenessActive:");
}

id objc_msgSend__processDelayedActionList_provider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processDelayedActionList:provider:");
}

id objc_msgSend__processRequestedTransaction_fromCallSource_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processRequestedTransaction:fromCallSource:completion:");
}

id objc_msgSend__providerForCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providerForCallSource:");
}

id objc_msgSend__providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providersByIdentifierByFilteringForRemoteClientsFromProvidersByIdentifier:");
}

id objc_msgSend__providersByIdentifierForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providersByIdentifierForRemoteClients:");
}

id objc_msgSend__providersForKeychainItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providersForKeychainItem:");
}

id objc_msgSend__providersForPreferenceKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providersForPreferenceKey:");
}

id objc_msgSend__pruneRemoteParticipantsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _pruneRemoteParticipantsIfNecessary];
}

id objc_msgSend__pushCallToAlternateDestinationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushCallToAlternateDestinationIfNecessary:");
}

id objc_msgSend__refreshFaceTimeIDSStatus(void *a1, const char *a2, ...)
{
  return _[a1 _refreshFaceTimeIDSStatus];
}

id objc_msgSend__refreshFaceTimeIDSStatusIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _refreshFaceTimeIDSStatusIfNecessary];
}

id objc_msgSend__refreshHasBeenUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 _refreshHasBeenUnlockedSinceBoot];
}

id objc_msgSend__registerCallBackgroundedEvent(void *a1, const char *a2, ...)
{
  return _[a1 _registerCallBackgroundedEvent];
}

id objc_msgSend__registerCallForegroundedEventForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerCallForegroundedEventForCall:");
}

id objc_msgSend__registerCallStartEventForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerCallStartEventForCall:");
}

id objc_msgSend__registerCallStopEvent(void *a1, const char *a2, ...)
{
  return _[a1 _registerCallStopEvent];
}

id objc_msgSend__registerEventWithContext_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerEventWithContext:status:");
}

id objc_msgSend__registerPluginsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _registerPluginsIfNecessary];
}

id objc_msgSend__registerUserActivityType_dynamicActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerUserActivityType:dynamicActivityType:");
}

id objc_msgSend__relayCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayCallWithUUID:");
}

id objc_msgSend__relayCallingDisabledForDeviceIDDefault(void *a1, const char *a2, ...)
{
  return _[a1 _relayCallingDisabledForDeviceIDDefault];
}

id objc_msgSend__relayCallingEnabledDefault(void *a1, const char *a2, ...)
{
  return _[a1 _relayCallingEnabledDefault];
}

id objc_msgSend__removeMemberFromPendingMemberListForParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeMemberFromPendingMemberListForParticipant:");
}

id objc_msgSend__removePendingConversationWithPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePendingConversationWithPseudonym:");
}

id objc_msgSend__removePendingConversationsWithTemporaryGroupUUIDIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePendingConversationsWithTemporaryGroupUUIDIfNecessary:");
}

id objc_msgSend__reportConversationFailedWithFailureReason_providerEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportConversationFailedWithFailureReason:providerEndedReason:");
}

id objc_msgSend__reportConversationFailedWithProviderEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportConversationFailedWithProviderEndedReason:");
}

id objc_msgSend__reportScreeningDurationEventForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportScreeningDurationEventForCall:");
}

id objc_msgSend__requestAVCBlobsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _requestAVCBlobsIfNecessary];
}

id objc_msgSend__requestCallStateFromHost(void *a1, const char *a2, ...)
{
  return _[a1 _requestCallStateFromHost];
}

id objc_msgSend__requestPendingInvites(void *a1, const char *a2, ...)
{
  return _[a1 _requestPendingInvites];
}

id objc_msgSend__restartIDSSessionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _restartIDSSessionIfNecessary];
}

id objc_msgSend__ringingTimerForCallWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ringingTimerForCallWithIdentifier:");
}

id objc_msgSend__routePassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_routePassingTest:");
}

id objc_msgSend__runCallbackIfNecessaryForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runCallbackIfNecessaryForMessage:");
}

id objc_msgSend__saveLastKnownFaceTimeCallerID(void *a1, const char *a2, ...)
{
  return _[a1 _saveLastKnownFaceTimeCallerID];
}

id objc_msgSend__saveLivePhotoWithPhotoURL_videoURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveLivePhotoWithPhotoURL:videoURL:completion:");
}

id objc_msgSend__savePairedHostDeviceState(void *a1, const char *a2, ...)
{
  return _[a1 _savePairedHostDeviceState];
}

id objc_msgSend__saveProviders_forKeychainItem_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveProviders:forKeychainItem:error:");
}

id objc_msgSend__saveVideoWithURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveVideoWithURL:completion:");
}

id objc_msgSend__sendClientsReceivedCallDTMFUpdate_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendClientsReceivedCallDTMFUpdate:forCall:");
}

id objc_msgSend__sendDTMFDigits_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDTMFDigits:type:");
}

id objc_msgSend__sendDelegateBytesOfDataUsageChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDelegateBytesOfDataUsageChanged:");
}

id objc_msgSend__sendDelegateConnectionClosed(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateConnectionClosed];
}

id objc_msgSend__sendDelegateFinishedPreparing(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateFinishedPreparing];
}

id objc_msgSend__sendDelegateMutedChanged(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateMutedChanged];
}

id objc_msgSend__sendDelegateReceivedFirstRemoteFrame(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateReceivedFirstRemoteFrame];
}

id objc_msgSend__sendDelegateRemoteMediaStalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDelegateRemoteMediaStalled:");
}

id objc_msgSend__sendDelegateRemoteVideoPaused(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateRemoteVideoPaused];
}

id objc_msgSend__sendDelegateSendingAudioChanged(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateSendingAudioChanged];
}

id objc_msgSend__sendDelegateStarted(void *a1, const char *a2, ...)
{
  return _[a1 _sendDelegateStarted];
}

id objc_msgSend__sendDelegationMessageTo_conversation_link_transactionUUID_forMember_withMessage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDelegationMessageTo:conversation:link:transactionUUID:forMember:withMessage:");
}

id objc_msgSend__sendInvitationWithData_declineOnError_alwaysSendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendInvitationWithData:declineOnError:alwaysSendData:");
}

id objc_msgSend__sendMessage_andCancelInvitationIfNecessaryForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessage:andCancelInvitationIfNecessaryForSession:");
}

id objc_msgSend__sendMessage_andDeclineInvitationIfNecessaryForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessage:andDeclineInvitationIfNecessaryForSession:");
}

id objc_msgSend__sendMessageOptionsWithTimeout_wantsAcknowledgement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessageOptionsWithTimeout:wantsAcknowledgement:");
}

id objc_msgSend__sendSoftPauseDigitsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _sendSoftPauseDigitsIfNecessary];
}

id objc_msgSend__senderIdentityCapabilitiesStateForSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_senderIdentityCapabilitiesStateForSubscription:");
}

id objc_msgSend__service_account_incomingData_fromID_context_attemptCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_service:account:incomingData:fromID:context:attemptCount:");
}

id objc_msgSend__setAllCallsToHeldExceptCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllCallsToHeldExceptCall:");
}

id objc_msgSend__setContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentType:");
}

id objc_msgSend__setContentUserAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentUserAction:");
}

id objc_msgSend__setDateEndedIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _setDateEndedIfNecessary];
}

id objc_msgSend__setEndedWithReason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEndedWithReason:error:");
}

id objc_msgSend__setIsOnHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIsOnHold:");
}

id objc_msgSend__setLocalAspectRatiosForVideoAspectRatioDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLocalAspectRatiosForVideoAspectRatioDescriptor:");
}

id objc_msgSend__setLocalLandscapeAspectRatio_localPortraitAspectRatio_forChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLocalLandscapeAspectRatio:localPortraitAspectRatio:forChat:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setRelayCallingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRelayCallingEnabled:");
}

id objc_msgSend__setRelayCallingEnabled_forDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRelayCallingEnabled:forDeviceWithID:");
}

id objc_msgSend__setRelayCallingEnabledDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRelayCallingEnabledDefault:");
}

id objc_msgSend__setRelayCallingEnabledDefault_forDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRelayCallingEnabledDefault:forDeviceWithID:");
}

id objc_msgSend__setRoutesFromRouteDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRoutesFromRouteDictionaries:");
}

id objc_msgSend__setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSubtitle:");
}

id objc_msgSend__setThumperCallingAllowed_onSecondaryDeviceWithID_forSenderIdentityWithUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:");
}

id objc_msgSend__setThumperCallingAllowedOnDefaultPairedDevice_forSenderIdentityWithUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setThumperCallingAllowedOnDefaultPairedDevice:forSenderIdentityWithUUID:");
}

id objc_msgSend__setThumperCallingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setThumperCallingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend__setUpCallDurationLimitIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _setUpCallDurationLimitIfNecessary];
}

id objc_msgSend__setUpDidStartTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _setUpDidStartTimeout];
}

id objc_msgSend__setUpLanguageChangeListener(void *a1, const char *a2, ...)
{
  return _[a1 _setUpLanguageChangeListener];
}

id objc_msgSend__setUpListeners(void *a1, const char *a2, ...)
{
  return _[a1 _setUpListeners];
}

id objc_msgSend__setUpSandbox(void *a1, const char *a2, ...)
{
  return _[a1 _setUpSandbox];
}

id objc_msgSend__setUpTemporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 _setUpTemporaryDirectory];
}

id objc_msgSend__setVoLTECallingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setVoLTECallingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend__setWiFiCallingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWiFiCallingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend__setWiFiCallingRoamingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend__sharingAudienceAllowsAutoSendNameAndPhoto(void *a1, const char *a2, ...)
{
  return _[a1 _sharingAudienceAllowsAutoSendNameAndPhoto];
}

id objc_msgSend__shouldAllowRequestedAction_forCallSource_shouldValidateUserIntent_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldAllowRequestedAction:forCallSource:shouldValidateUserIntent:error:");
}

id objc_msgSend__shouldAllowRequestedTransaction_forCallSource_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldAllowRequestedTransaction:forCallSource:error:");
}

id objc_msgSend__shouldBlockIfScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 _shouldBlockIfScreenSharing];
}

id objc_msgSend__shouldLaunchInCallApplicationForProviderOfCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldLaunchInCallApplicationForProviderOfCall:");
}

id objc_msgSend__shouldNotifyDelegatesOfMessage_localHandleAdded_isFromStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldNotifyDelegatesOfMessage:localHandleAdded:isFromStorage:");
}

id objc_msgSend__shouldRelayJoinConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldRelayJoinConversationRequest:");
}

id objc_msgSend__shouldRingForIncomingCallWithHandle_conversation_isFromPendingMessage_isOldMessage_isLetMeInApproved_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_shouldRingForIncomingCallWithHandle:conversation:isFromPendingMessage:isOldMessage:isLetMeInApproved:");
}

id objc_msgSend__shouldSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSend:");
}

id objc_msgSend__shouldSendToPairedIDSDevice(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendToPairedIDSDevice];
}

id objc_msgSend__shouldSendToPairedIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSendToPairedIDSDevice:");
}

id objc_msgSend__shouldSkipManualApprovalForHandle_conversation_responseKeyData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSkipManualApprovalForHandle:conversation:responseKeyData:");
}

id objc_msgSend__showLetMeInUIIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _showLetMeInUIIfNecessary];
}

id objc_msgSend__sortedProvidersForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortedProvidersForRemoteClients:");
}

id objc_msgSend__startAVCSessionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _startAVCSessionIfNecessary];
}

id objc_msgSend__startIDSSessionWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startIDSSessionWithContext:");
}

id objc_msgSend__startSession_withMessage_identifiers_timeout_declineOnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startSession:withMessage:identifiers:timeout:declineOnError:");
}

id objc_msgSend__startTimeoutForMomentsRequestWithTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTimeoutForMomentsRequestWithTransactionID:");
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return _[a1 _stop];
}

id objc_msgSend__stopAVCSession(void *a1, const char *a2, ...)
{
  return _[a1 _stopAVCSession];
}

id objc_msgSend__stopConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopConference:");
}

id objc_msgSend__stopListeningForBestAppSuggestionIfAppropriate(void *a1, const char *a2, ...)
{
  return _[a1 _stopListeningForBestAppSuggestionIfAppropriate];
}

id objc_msgSend__stopScreeningEventIfNecessaryForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopScreeningEventIfNecessaryForCall:");
}

id objc_msgSend__stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForKey:");
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return _[a1 _stripFZIDPrefix];
}

id objc_msgSend__stripPotentialTokenURIWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stripPotentialTokenURIWithToken:");
}

id objc_msgSend__subscriptionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subscriptionWithUUID:");
}

id objc_msgSend__supportsBasebandCalling(void *a1, const char *a2, ...)
{
  return _[a1 _supportsBasebandCalling];
}

id objc_msgSend__supportsCellularData(void *a1, const char *a2, ...)
{
  return _[a1 _supportsCellularData];
}

id objc_msgSend__supportsDisplayingFaceTimeAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 _supportsDisplayingFaceTimeAudioCalls];
}

id objc_msgSend__supportsDisplayingFaceTimeVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 _supportsDisplayingFaceTimeVideoCalls];
}

id objc_msgSend__supportsDisplayingTelephonyCalls(void *a1, const char *a2, ...)
{
  return _[a1 _supportsDisplayingTelephonyCalls];
}

id objc_msgSend__supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 _supportsPrimaryCalling];
}

id objc_msgSend__supportsRelayCalling(void *a1, const char *a2, ...)
{
  return _[a1 _supportsRelayCalling];
}

id objc_msgSend__supportsThumperCallingUsingSenderIdentityCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsThumperCallingUsingSenderIdentityCapabilitiesState:");
}

id objc_msgSend__supportslaunchingInCallApplicationForIncomingCall(void *a1, const char *a2, ...)
{
  return _[a1 _supportslaunchingInCallApplicationForIncomingCall];
}

id objc_msgSend__switchFromFailureReasonToDisconnectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchFromFailureReasonToDisconnectedReason:");
}

id objc_msgSend__switchToCXCallFailureReasonFromTUCallDisconnectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchToCXCallFailureReasonFromTUCallDisconnectedReason:");
}

id objc_msgSend__trackListenedActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackListenedActivityType:dynamicIdentifier:");
}

id objc_msgSend__transferFileAtURL_forSession_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transferFileAtURL:forSession:request:");
}

id objc_msgSend__unregisterUninstalledProvidersAndNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterUninstalledProvidersAndNotify:");
}

id objc_msgSend__unregisterUserActivityType_dynamicActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterUserActivityType:dynamicActivityType:");
}

id objc_msgSend__untrackListenedActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_untrackListenedActivityType:dynamicIdentifier:");
}

id objc_msgSend__untrackListenedActivityType_matchingDynamicIdentifierSubstring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_untrackListenedActivityType:matchingDynamicIdentifierSubstring:");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateBluetoothAudioFormatIfNecessaryDueToMVMChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBluetoothAudioFormatIfNecessaryDueToMVMChange:");
}

id objc_msgSend__updateCTCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _updateCTCapabilities];
}

id objc_msgSend__updateCallAvailability(void *a1, const char *a2, ...)
{
  return _[a1 _updateCallAvailability];
}

id objc_msgSend__updateCallCapabilitiesForSubscription_capabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCallCapabilitiesForSubscription:capabilitiesState:");
}

id objc_msgSend__updateCallMutingForHoldMusic(void *a1, const char *a2, ...)
{
  return _[a1 _updateCallMutingForHoldMusic];
}

id objc_msgSend__updateCarPlayDeviceConnected(void *a1, const char *a2, ...)
{
  return _[a1 _updateCarPlayDeviceConnected];
}

id objc_msgSend__updateClientsWithState(void *a1, const char *a2, ...)
{
  return _[a1 _updateClientsWithState];
}

id objc_msgSend__updateCurrentlyBroadcastedActivity(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentlyBroadcastedActivity];
}

id objc_msgSend__updateDefaultPairedDeviceUniqueIDDefault(void *a1, const char *a2, ...)
{
  return _[a1 _updateDefaultPairedDeviceUniqueIDDefault];
}

id objc_msgSend__updateDialingIDSDeviceWithHostIDSIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDialingIDSDeviceWithHostIDSIdentifier:");
}

id objc_msgSend__updateDynamicCapabilitiesAndUpdateClients(void *a1, const char *a2, ...)
{
  return _[a1 _updateDynamicCapabilitiesAndUpdateClients];
}

id objc_msgSend__updateEmergencyCallbackModeEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 _updateEmergencyCallbackModeEnabledState];
}

id objc_msgSend__updateHostingAndDisplayingSupport(void *a1, const char *a2, ...)
{
  return _[a1 _updateHostingAndDisplayingSupport];
}

id objc_msgSend__updateOutgoingCallerID(void *a1, const char *a2, ...)
{
  return _[a1 _updateOutgoingCallerID];
}

id objc_msgSend__updateParticipantDestinationIDForParticipant_members_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateParticipantDestinationIDForParticipant:members:");
}

id objc_msgSend__updateParticipantTypesForAddedParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateParticipantTypesForAddedParticipant:");
}

id objc_msgSend__updatePickableRoutes(void *a1, const char *a2, ...)
{
  return _[a1 _updatePickableRoutes];
}

id objc_msgSend__updateProviderForConnectedChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateProviderForConnectedChat:");
}

id objc_msgSend__updateProviderForEndedChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateProviderForEndedChat:");
}

id objc_msgSend__updateProvidersByIdentifierAndNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateProvidersByIdentifierAndNotify:");
}

id objc_msgSend__updateRelayCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _updateRelayCapabilities];
}

id objc_msgSend__updateRoutesForDisconnectedCall(void *a1, const char *a2, ...)
{
  return _[a1 _updateRoutesForDisconnectedCall];
}

id objc_msgSend__updateSessionPreferences(void *a1, const char *a2, ...)
{
  return _[a1 _updateSessionPreferences];
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return _[a1 _updateState];
}

id objc_msgSend__updateSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 _updateSubscriptions];
}

id objc_msgSend__updateSystemCapabilitiesStateForSubscription_capabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSystemCapabilitiesStateForSubscription:capabilitiesState:");
}

id objc_msgSend__updateThumperAccountState(void *a1, const char *a2, ...)
{
  return _[a1 _updateThumperAccountState];
}

id objc_msgSend__updateThumperCallingPreferences(void *a1, const char *a2, ...)
{
  return _[a1 _updateThumperCallingPreferences];
}

id objc_msgSend__updatedQOSBlockForBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatedQOSBlockForBlock:");
}

id objc_msgSend__userActivityTypeStringForActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userActivityTypeStringForActivityType:");
}

id objc_msgSend__waitForCallSourceWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_waitForCallSourceWithIdentifier:completion:");
}

id objc_msgSend__xpcClientForConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcClientForConnection:");
}

id objc_msgSend_aTVHandoff(void *a1, const char *a2, ...)
{
  return _[a1 aTVHandoff];
}

id objc_msgSend_abTestConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 abTestConfiguration];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptInvitation(void *a1, const char *a2, ...)
{
  return _[a1 acceptInvitation];
}

id objc_msgSend_acceptInvitationWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptInvitationWithData:");
}

id objc_msgSend_acceptPayloadData(void *a1, const char *a2, ...)
{
  return _[a1 acceptPayloadData];
}

id objc_msgSend_accessGroupName(void *a1, const char *a2, ...)
{
  return _[a1 accessGroupName];
}

id objc_msgSend_accessoryButtonEventsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 accessoryButtonEventsEnabled];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_account_aliasesChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:aliasesChanged:");
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return _[a1 accountDescription];
}

id objc_msgSend_accountForTelephonySubscriptionLabelIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForTelephonySubscriptionLabelIdentifier:");
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountISOCountryCodeForSubscriptionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountISOCountryCodeForSubscriptionUUID:");
}

id objc_msgSend_accountInfo(void *a1, const char *a2, ...)
{
  return _[a1 accountInfo];
}

id objc_msgSend_accountMatchingSimIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountMatchingSimIdentifier:");
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return _[a1 accountUUID];
}

id objc_msgSend_accountUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 accountUUIDString];
}

id objc_msgSend_accountWithCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithCallerID:");
}

id objc_msgSend_accountWithUUID_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithUUID:service:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_accountsChanged(void *a1, const char *a2, ...)
{
  return _[a1 accountsChanged];
}

id objc_msgSend_accountsController(void *a1, const char *a2, ...)
{
  return _[a1 accountsController];
}

id objc_msgSend_accountsMatchForSecondaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 accountsMatchForSecondaryCalling];
}

id objc_msgSend_accountsSupportSecondaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 accountsSupportSecondaryCalling];
}

id objc_msgSend_acquireAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 acquireAssertionIfNecessary];
}

id objc_msgSend_acquireProcessAssertionForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireProcessAssertionForBundleIdentifier:");
}

id objc_msgSend_actionDescription(void *a1, const char *a2, ...)
{
  return _[a1 actionDescription];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_activateConversationNoticeWithActionURL_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConversationNoticeWithActionURL:bundleIdentifier:");
}

id objc_msgSend_activateLink_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateLink:completionHandler:");
}

id objc_msgSend_activateLinkForPseudonym_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateLinkForPseudonym:completionHandler:");
}

id objc_msgSend_activateLinkForPseudonym_updateGroupUUID_updateInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateLinkForPseudonym:updateGroupUUID:updateInvitedHandles:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activatedConversationLinksWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedConversationLinksWithError:");
}

id objc_msgSend_activatedLinkForJoinCallAction_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedLinkForJoinCallAction:withError:");
}

id objc_msgSend_activatedLinksWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedLinksWithCompletionHandler:");
}

id objc_msgSend_activeAccountsChangedForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccountsChangedForService:");
}

id objc_msgSend_activeApprovedConversationWithLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeApprovedConversationWithLink:");
}

id objc_msgSend_activeConference(void *a1, const char *a2, ...)
{
  return _[a1 activeConference];
}

id objc_msgSend_activeConferenceConnectionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConferenceConnectionForIdentifier:");
}

id objc_msgSend_activeContexts(void *a1, const char *a2, ...)
{
  return _[a1 activeContexts];
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return _[a1 activeConversation];
}

id objc_msgSend_activeConversationForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConversationForCall:");
}

id objc_msgSend_activeConversationForCall_backedByGroupSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConversationForCall:backedByGroupSession:");
}

id objc_msgSend_activeConversationWithGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConversationWithGroupUUID:");
}

id objc_msgSend_activeConversations(void *a1, const char *a2, ...)
{
  return _[a1 activeConversations];
}

id objc_msgSend_activeIDSDestination(void *a1, const char *a2, ...)
{
  return _[a1 activeIDSDestination];
}

id objc_msgSend_activeLightweightParticipantDestinationsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activeLightweightParticipantDestinationsByIdentifier];
}

id objc_msgSend_activeLightweightParticipants(void *a1, const char *a2, ...)
{
  return _[a1 activeLightweightParticipants];
}

id objc_msgSend_activeLightweightParticipantsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeLightweightParticipantsAtIndex:");
}

id objc_msgSend_activeLightweightParticipantsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activeLightweightParticipantsByIdentifier];
}

id objc_msgSend_activeLightweightParticipantsCount(void *a1, const char *a2, ...)
{
  return _[a1 activeLightweightParticipantsCount];
}

id objc_msgSend_activeLocalHandles(void *a1, const char *a2, ...)
{
  return _[a1 activeLocalHandles];
}

id objc_msgSend_activeLocalHandlesForProvider(void *a1, const char *a2, ...)
{
  return _[a1 activeLocalHandlesForProvider];
}

id objc_msgSend_activeParticipantDestinationsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activeParticipantDestinationsByIdentifier];
}

id objc_msgSend_activeParticipantPruningTimeout(void *a1, const char *a2, ...)
{
  return _[a1 activeParticipantPruningTimeout];
}

id objc_msgSend_activeParticipantRefreshDelay(void *a1, const char *a2, ...)
{
  return _[a1 activeParticipantRefreshDelay];
}

id objc_msgSend_activeParticipants(void *a1, const char *a2, ...)
{
  return _[a1 activeParticipants];
}

id objc_msgSend_activeParticipantsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeParticipantsAtIndex:");
}

id objc_msgSend_activeParticipantsCount(void *a1, const char *a2, ...)
{
  return _[a1 activeParticipantsCount];
}

id objc_msgSend_activeRemoteParticipant(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipant];
}

id objc_msgSend_activeRemoteParticipantCXHandles(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipantCXHandles];
}

id objc_msgSend_activeRemoteParticipantCountMinusEligibleAVLess(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipantCountMinusEligibleAVLess];
}

id objc_msgSend_activeRemoteParticipantForCallUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeRemoteParticipantForCallUpdate:");
}

id objc_msgSend_activeRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipantHandles];
}

id objc_msgSend_activeRemoteParticipants(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipants];
}

id objc_msgSend_activeRemoteParticipantsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeRemoteParticipantsAtIndex:");
}

id objc_msgSend_activeRemoteParticipantsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipantsByIdentifier];
}

id objc_msgSend_activeRemoteParticipantsCount(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipantsCount];
}

id objc_msgSend_activeRequestCount(void *a1, const char *a2, ...)
{
  return _[a1 activeRequestCount];
}

id objc_msgSend_activeRequestsByTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 activeRequestsByTransactionID];
}

id objc_msgSend_activeSessionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeSessionForIdentifier:");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityAuthorizationManager(void *a1, const char *a2, ...)
{
  return _[a1 activityAuthorizationManager];
}

id objc_msgSend_activityAuthorizedBundleIdentifierState(void *a1, const char *a2, ...)
{
  return _[a1 activityAuthorizedBundleIdentifierState];
}

id objc_msgSend_activityCommunicator(void *a1, const char *a2, ...)
{
  return _[a1 activityCommunicator];
}

id objc_msgSend_activityContext(void *a1, const char *a2, ...)
{
  return _[a1 activityContext];
}

id objc_msgSend_activityContextWithDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityContextWithDescriptionIdentifier:");
}

id objc_msgSend_activityContextWithTUActivityContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityContextWithTUActivityContext:");
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityIdentifier];
}

id objc_msgSend_activityMetadata(void *a1, const char *a2, ...)
{
  return _[a1 activityMetadata];
}

id objc_msgSend_activityMetadataWithDataBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityMetadataWithDataBlob:");
}

id objc_msgSend_activityQueue(void *a1, const char *a2, ...)
{
  return _[a1 activityQueue];
}

id objc_msgSend_activitySession(void *a1, const char *a2, ...)
{
  return _[a1 activitySession];
}

id objc_msgSend_activitySessionManager(void *a1, const char *a2, ...)
{
  return _[a1 activitySessionManager];
}

id objc_msgSend_activitySessionManager_activitySessionChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySessionManager:activitySessionChanged:");
}

id objc_msgSend_activitySessionParticipantMonitor(void *a1, const char *a2, ...)
{
  return _[a1 activitySessionParticipantMonitor];
}

id objc_msgSend_activitySessionWithCSDConversationActivitySession_fromConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySessionWithCSDConversationActivitySession:fromConversation:");
}

id objc_msgSend_activitySessionWithCSDConversationActivitySession_fromConversation_forStorage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySessionWithCSDConversationActivitySession:fromConversation:forStorage:");
}

id objc_msgSend_activitySessionWithTUConversationActivitySession_fromConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySessionWithTUConversationActivitySession:fromConversation:");
}

id objc_msgSend_activitySessionWithTUConversationActivitySession_fromConversation_forStorage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySessionWithTUConversationActivitySession:fromConversation:forStorage:");
}

id objc_msgSend_activitySessions(void *a1, const char *a2, ...)
{
  return _[a1 activitySessions];
}

id objc_msgSend_activitySessionsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySessionsAtIndex:");
}

id objc_msgSend_activitySessionsCount(void *a1, const char *a2, ...)
{
  return _[a1 activitySessionsCount];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_activityTypeForUserActivityTypeString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityTypeForUserActivityTypeString:");
}

id objc_msgSend_activityTypeRequiresBestAppSuggestionListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityTypeRequiresBestAppSuggestionListener:");
}

id objc_msgSend_activityTypeSupportsDynamicIdentifierRegistration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityTypeSupportsDynamicIdentifierRegistration:");
}

id objc_msgSend_activityWithCSDConversationActivity_fromConversation_forStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithCSDConversationActivity:fromConversation:forStorage:");
}

id objc_msgSend_activityWithTUConversationActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithTUConversationActivity:");
}

id objc_msgSend_activityWithType_dynamicIdentifier_userInfo_originatingDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:");
}

id objc_msgSend_addAction_toUncommittedTransactionForCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:toUncommittedTransactionForCallSource:");
}

id objc_msgSend_addActiveLightweightParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActiveLightweightParticipants:");
}

id objc_msgSend_addActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActiveParticipant:");
}

id objc_msgSend_addActiveParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActiveParticipants:");
}

id objc_msgSend_addActiveRemoteParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActiveRemoteParticipants:");
}

id objc_msgSend_addActivitySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActivitySessions:");
}

id objc_msgSend_addAddedMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAddedMembers:");
}

id objc_msgSend_addAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAlias:");
}

id objc_msgSend_addAliasesToConversationContainer_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAliasesToConversationContainer:forBundleIdentifier:");
}

id objc_msgSend_addAliasesToConversationContainer_withSalt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAliasesToConversationContainer:withSalt:");
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBarrierBlock:");
}

id objc_msgSend_addCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCall:");
}

id objc_msgSend_addCallAllowed(void *a1, const char *a2, ...)
{
  return _[a1 addCallAllowed];
}

id objc_msgSend_addCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCallSource:");
}

id objc_msgSend_addCalls_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCalls:forIdentifier:");
}

id objc_msgSend_addClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:");
}

id objc_msgSend_addContactIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContactIdentifiers:");
}

id objc_msgSend_addConversationMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConversationMembers:");
}

id objc_msgSend_addConversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConversations:");
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:");
}

id objc_msgSend_addDelegate_forService_listenerID_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:forService:listenerID:queue:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addDelegate_withQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:withQueue:");
}

id objc_msgSend_addEmergencyHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEmergencyHandles:");
}

id objc_msgSend_addEmergencyLabeledHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEmergencyLabeledHandles:");
}

id objc_msgSend_addEndpointIDSDestinationURIs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndpointIDSDestinationURIs:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addGenerateDescriptorInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGenerateDescriptorInfos:");
}

id objc_msgSend_addGeneratorDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGeneratorDescriptors:");
}

id objc_msgSend_addHandlesToInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHandlesToInvite:");
}

id objc_msgSend_addHandoffIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHandoffIdentifier:");
}

id objc_msgSend_addIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIdentifier:");
}

id objc_msgSend_addIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIdentifiers:");
}

id objc_msgSend_addInvitationPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInvitationPreferences:");
}

id objc_msgSend_addInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInvitedHandles:");
}

id objc_msgSend_addInvitedHandles_pseudonym_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInvitedHandles:pseudonym:completionHandler:");
}

id objc_msgSend_addInvitedMemberHandles_toConversationLink_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInvitedMemberHandles:toConversationLink:completionHandler:");
}

id objc_msgSend_addInvitedMemberHandlesFromAddedRemoteMembers_toConversationLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInvitedMemberHandlesFromAddedRemoteMembers:toConversationLink:");
}

id objc_msgSend_addLightweightMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLightweightMembers:");
}

id objc_msgSend_addLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLink:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_addListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerID:forService:");
}

id objc_msgSend_addLocalClientObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLocalClientObject:");
}

id objc_msgSend_addMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMembers:");
}

id objc_msgSend_addMembers_toExistingMembers_activeParticipants_activitySessions_link_otherInvitedHandles_report_invitationPreferences_requiredCapabilities_messagesGroupUUID_messagesGroupName_addingFromLetMeIn_triggeredLocally_highlightIdentifier_stagedActivitySession_avMode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addMembers:toExistingMembers:activeParticipants:activitySessions:link:otherInvitedHandles:report:invitationPr eferences:requiredCapabilities:messagesGroupUUID:messagesGroupName:addingFromLetMeIn:triggeredLocally:highlig htIdentifier:stagedActivitySession:avMode:");
}

id objc_msgSend_addMembers_toExistingMembers_participantDestinationIDs_webDestinationIDs_activeParticipants_activitySessions_link_otherInvitedHandles_report_invitationPreferences_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addMembers:toExistingMembers:participantDestinationIDs:webDestinationIDs:activeParticipants:activitySessions: link:otherInvitedHandles:report:invitationPreferences:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:queue:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserver_withQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:withQueue:");
}

id objc_msgSend_addOrUpdateCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateCall:");
}

id objc_msgSend_addOtherInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOtherInvitedHandles:");
}

id objc_msgSend_addOtherUniqueProxyIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOtherUniqueProxyIdentifiers:");
}

id objc_msgSend_addParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParticipant:");
}

id objc_msgSend_addParticipant_withVideoEnabled_audioPaused_screenEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParticipant:withVideoEnabled:audioPaused:screenEnabled:");
}

id objc_msgSend_addParticipantFromQRTime(void *a1, const char *a2, ...)
{
  return _[a1 addParticipantFromQRTime];
}

id objc_msgSend_addPendingMembers_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingMembers:triggeredLocally:");
}

id objc_msgSend_addPrioritizedSenderIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPrioritizedSenderIdentities:");
}

id objc_msgSend_addProminenceEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProminenceEntry:");
}

id objc_msgSend_addProtoCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProtoCall:");
}

id objc_msgSend_addProtoSupportedHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProtoSupportedHandleType:");
}

id objc_msgSend_addProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 addProtocolVersion];
}

id objc_msgSend_addProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProviders:");
}

id objc_msgSend_addPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPseudonym:");
}

id objc_msgSend_addPseudonym_forCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPseudonym:forCallUUID:");
}

id objc_msgSend_addRegistrationDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRegistrationDelegate:queue:");
}

id objc_msgSend_addRemoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemoteMembers:");
}

id objc_msgSend_addRemoteMembers_otherInvitedHandles_invitationPreferences_addingFromLetMeIn_triggeredLocally_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addRemoteMembers:otherInvitedHandles:invitationPreferences:addingFromLetMeIn:triggeredLocally:");
}

id objc_msgSend_addRemoteMembers_otherInvitedHandles_toConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemoteMembers:otherInvitedHandles:toConversationWithUUID:");
}

id objc_msgSend_addRemoteMembers_otherInvitedHandles_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemoteMembers:otherInvitedHandles:triggeredLocally:");
}

id objc_msgSend_addRemoteParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemoteParticipantHandles:");
}

id objc_msgSend_addRemovedMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemovedMembers:");
}

id objc_msgSend_addReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReporter:");
}

id objc_msgSend_addRequiredCapabilities_requiredLackOfCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRequiredCapabilities:requiredLackOfCapabilities:");
}

id objc_msgSend_addResourceWithType_fileURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResourceWithType:fileURL:options:");
}

id objc_msgSend_addRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRoutes:");
}

id objc_msgSend_addScreenSharingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScreenSharingRequest:");
}

id objc_msgSend_addScreenSharingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScreenSharingType:");
}

id objc_msgSend_addScreenSharingType_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScreenSharingType:forConversationUUID:");
}

id objc_msgSend_addSecondaryThumperDeviceWithIDSDeviceIdentifier_toSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSecondaryThumperDeviceWithIDSDeviceIdentifier:toSubscription:");
}

id objc_msgSend_addServiceDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceDelegate:queue:");
}

id objc_msgSend_addThumperRegisteredDeviceID_forThumperAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addThumperRegisteredDeviceID:forThumperAccountID:");
}

id objc_msgSend_addToCallHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToCallHistory:");
}

id objc_msgSend_addUserInfoEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserInfoEntriesFromDictionary:");
}

id objc_msgSend_addUserNotification_listener_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserNotification:listener:completionHandler:");
}

id objc_msgSend_addVirtualParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVirtualParticipant:");
}

id objc_msgSend_addedHandoffParticipantToTime(void *a1, const char *a2, ...)
{
  return _[a1 addedHandoffParticipantToTime];
}

id objc_msgSend_addedHandoffParticipants(void *a1, const char *a2, ...)
{
  return _[a1 addedHandoffParticipants];
}

id objc_msgSend_addedMembers(void *a1, const char *a2, ...)
{
  return _[a1 addedMembers];
}

id objc_msgSend_addedMembersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedMembersAtIndex:");
}

id objc_msgSend_addedMembersCount(void *a1, const char *a2, ...)
{
  return _[a1 addedMembersCount];
}

id objc_msgSend_addedRemoteParticipantWithIdentifier_updatedAudioEnabled_updatedVideoEnabled_streamToken_screenToken_captionsToken_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addedRemoteParticipantWithIdentifier:updatedAudioEnabled:updatedVideoEnabled:streamToken:screenToken:captionsToken:");
}

id objc_msgSend_aliasStrings(void *a1, const char *a2, ...)
{
  return _[a1 aliasStrings];
}

id objc_msgSend_aliases(void *a1, const char *a2, ...)
{
  return _[a1 aliases];
}

id objc_msgSend_allActions(void *a1, const char *a2, ...)
{
  return _[a1 allActions];
}

id objc_msgSend_allActiveConversationParticipantsSupportSharePlay(void *a1, const char *a2, ...)
{
  return _[a1 allActiveConversationParticipantsSupportSharePlay];
}

id objc_msgSend_allAliases(void *a1, const char *a2, ...)
{
  return _[a1 allAliases];
}

id objc_msgSend_allCallHistoryDeleted(void *a1, const char *a2, ...)
{
  return _[a1 allCallHistoryDeleted];
}

id objc_msgSend_allCalls(void *a1, const char *a2, ...)
{
  return _[a1 allCalls];
}

id objc_msgSend_allCallsBackgroundedForReportingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allCallsBackgroundedForReportingController:");
}

id objc_msgSend_allCallsPassTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allCallsPassTest:");
}

id objc_msgSend_allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID_participantIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:");
}

id objc_msgSend_allIDSTelephonyDevices(void *a1, const char *a2, ...)
{
  return _[a1 allIDSTelephonyDevices];
}

id objc_msgSend_allIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 allIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allParticipantsSupportSharePlay(void *a1, const char *a2, ...)
{
  return _[a1 allParticipantsSupportSharePlay];
}

id objc_msgSend_allTUConversationMembers(void *a1, const char *a2, ...)
{
  return _[a1 allTUConversationMembers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowAnyNetwork(void *a1, const char *a2, ...)
{
  return _[a1 allowAnyNetwork];
}

id objc_msgSend_allowCallForDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 allowCallForDestinationID];
}

id objc_msgSend_allowCallForDestinationID_providerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowCallForDestinationID:providerIdentifier:");
}

id objc_msgSend_allowMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowMember:");
}

id objc_msgSend_allowParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowParticipants:");
}

id objc_msgSend_allowScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 allowScreenSharing];
}

id objc_msgSend_allowScreenSharingInitiation(void *a1, const char *a2, ...)
{
  return _[a1 allowScreenSharingInitiation];
}

id objc_msgSend_allowSharePlay(void *a1, const char *a2, ...)
{
  return _[a1 allowSharePlay];
}

id objc_msgSend_allowedSecondaryDeviceIDs(void *a1, const char *a2, ...)
{
  return _[a1 allowedSecondaryDeviceIDs];
}

id objc_msgSend_allowsScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 allowsScreenSharing];
}

id objc_msgSend_allowsScreenSharingBlock(void *a1, const char *a2, ...)
{
  return _[a1 allowsScreenSharingBlock];
}

id objc_msgSend_allowsVideo(void *a1, const char *a2, ...)
{
  return _[a1 allowsVideo];
}

id objc_msgSend_ambiguityState(void *a1, const char *a2, ...)
{
  return _[a1 ambiguityState];
}

id objc_msgSend_announceCalls(void *a1, const char *a2, ...)
{
  return _[a1 announceCalls];
}

id objc_msgSend_answerCall_withRequest_whileDisconnectingActiveCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerCall:withRequest:whileDisconnectingActiveCalls:");
}

id objc_msgSend_answerCall_withRequest_whileDisconnectingHeldCalls_andHoldingCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerCall:withRequest:whileDisconnectingHeldCalls:andHoldingCalls:");
}

id objc_msgSend_answerCall_withRequest_whileHoldingActiveCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerCall:withRequest:whileHoldingActiveCalls:");
}

id objc_msgSend_answerWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerWithRequest:");
}

id objc_msgSend_answerWithVideoAspectRatioDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerWithVideoAspectRatioDescriptor:");
}

id objc_msgSend_answeringMachineStreamToken(void *a1, const char *a2, ...)
{
  return _[a1 answeringMachineStreamToken];
}

id objc_msgSend_anyActiveAccount(void *a1, const char *a2, ...)
{
  return _[a1 anyActiveAccount];
}

id objc_msgSend_anyActiveParticipantHasAV(void *a1, const char *a2, ...)
{
  return _[a1 anyActiveParticipantHasAV];
}

id objc_msgSend_anyCallIsEndpointOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 anyCallIsEndpointOnCurrentDevice];
}

id objc_msgSend_anyCallPassesTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyCallPassesTest:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appHistoryActivityWithTitle_subtitle_keywords_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appHistoryActivityWithTitle:subtitle:keywords:userInfo:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleAccountRebrandEnabled(void *a1, const char *a2, ...)
{
  return _[a1 appleAccountRebrandEnabled];
}

id objc_msgSend_applicationContext(void *a1, const char *a2, ...)
{
  return _[a1 applicationContext];
}

id objc_msgSend_applicationLaunchPolicyManager(void *a1, const char *a2, ...)
{
  return _[a1 applicationLaunchPolicyManager];
}

id objc_msgSend_applicationLauncher(void *a1, const char *a2, ...)
{
  return _[a1 applicationLauncher];
}

id objc_msgSend_applicationPolicyManager(void *a1, const char *a2, ...)
{
  return _[a1 applicationPolicyManager];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_applicationStateForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationStateForApplication:");
}

id objc_msgSend_applicationStateForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationStateForBundleIdentifier:");
}

id objc_msgSend_applicationStateMonitor(void *a1, const char *a2, ...)
{
  return _[a1 applicationStateMonitor];
}

id objc_msgSend_approvePendingMember_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "approvePendingMember:forConversationUUID:");
}

id objc_msgSend_approvedSecondaryDeviceIDs(void *a1, const char *a2, ...)
{
  return _[a1 approvedSecondaryDeviceIDs];
}

id objc_msgSend_approverHandle(void *a1, const char *a2, ...)
{
  return _[a1 approverHandle];
}

id objc_msgSend_archivedDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithError:");
}

id objc_msgSend_areCTCapabilitiesValid(void *a1, const char *a2, ...)
{
  return _[a1 areCTCapabilitiesValid];
}

id objc_msgSend_areCapabilitiesValid(void *a1, const char *a2, ...)
{
  return _[a1 areCapabilitiesValid];
}

id objc_msgSend_areRelayCallingFeaturesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areRelayCallingFeaturesEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayByApplyingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByApplyingSelector:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return _[a1 assetId];
}

id objc_msgSend_associateCallUUID_withConversationUUID_waitingToJoin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateCallUUID:withConversationUUID:waitingToJoin:");
}

id objc_msgSend_associatedPseudonym(void *a1, const char *a2, ...)
{
  return _[a1 associatedPseudonym];
}

id objc_msgSend_associatedThumperAccountID(void *a1, const char *a2, ...)
{
  return _[a1 associatedThumperAccountID];
}

id objc_msgSend_association(void *a1, const char *a2, ...)
{
  return _[a1 association];
}

id objc_msgSend_associationAVCIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 associationAVCIdentifier];
}

id objc_msgSend_associationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 associationIdentifier];
}

id objc_msgSend_associationVoucher(void *a1, const char *a2, ...)
{
  return _[a1 associationVoucher];
}

id objc_msgSend_asynchronousExportedObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 asynchronousExportedObjectProxy];
}

id objc_msgSend_attemptToPlayKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToPlayKey:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_audioAndVideoCallsWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioAndVideoCallsWithStatus:");
}

id objc_msgSend_audioCategory(void *a1, const char *a2, ...)
{
  return _[a1 audioCategory];
}

id objc_msgSend_audioController(void *a1, const char *a2, ...)
{
  return _[a1 audioController];
}

id objc_msgSend_audioDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 audioDeviceController];
}

id objc_msgSend_audioInterruptionOperationMode(void *a1, const char *a2, ...)
{
  return _[a1 audioInterruptionOperationMode];
}

id objc_msgSend_audioInterruptionProvider(void *a1, const char *a2, ...)
{
  return _[a1 audioInterruptionProvider];
}

id objc_msgSend_audioInterruptionProviderType(void *a1, const char *a2, ...)
{
  return _[a1 audioInterruptionProviderType];
}

id objc_msgSend_audioMode(void *a1, const char *a2, ...)
{
  return _[a1 audioMode];
}

id objc_msgSend_audioPriority(void *a1, const char *a2, ...)
{
  return _[a1 audioPriority];
}

id objc_msgSend_audioRouteCollections(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteCollections];
}

id objc_msgSend_audioRoutePolicyManager(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutePolicyManager];
}

id objc_msgSend_audioRouteUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteUniqueIdentifier];
}

id objc_msgSend_audioRoutesByParticipantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutesByParticipantIdentifier];
}

id objc_msgSend_audioSessionID(void *a1, const char *a2, ...)
{
  return _[a1 audioSessionID];
}

id objc_msgSend_audioSourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 audioSourceIdentifier];
}

id objc_msgSend_audioVideoMode(void *a1, const char *a2, ...)
{
  return _[a1 audioVideoMode];
}

id objc_msgSend_authTagSampleRate(void *a1, const char *a2, ...)
{
  return _[a1 authTagSampleRate];
}

id objc_msgSend_authorizedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 authorizedBundleIdentifiers];
}

id objc_msgSend_autoSharePlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 autoSharePlayEnabled];
}

id objc_msgSend_automaticNameAndPhotoQueue(void *a1, const char *a2, ...)
{
  return _[a1 automaticNameAndPhotoQueue];
}

id objc_msgSend_avChat(void *a1, const char *a2, ...)
{
  return _[a1 avChat];
}

id objc_msgSend_avLessSharePlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 avLessSharePlayEnabled];
}

id objc_msgSend_avMode(void *a1, const char *a2, ...)
{
  return _[a1 avMode];
}

id objc_msgSend_availability(void *a1, const char *a2, ...)
{
  return _[a1 availability];
}

id objc_msgSend_availabilityForListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availabilityForListenerID:forService:");
}

id objc_msgSend_availabilityWithRemoteAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availabilityWithRemoteAvailable:");
}

id objc_msgSend_availableDeviceSlots(void *a1, const char *a2, ...)
{
  return _[a1 availableDeviceSlots];
}

id objc_msgSend_availableOutgoingRelayCallerIDs(void *a1, const char *a2, ...)
{
  return _[a1 availableOutgoingRelayCallerIDs];
}

id objc_msgSend_avcBlobRecoveryStartedForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avcBlobRecoveryStartedForConversation:");
}

id objc_msgSend_avcBlobRecoveryTimedOutForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avcBlobRecoveryTimedOutForConversation:");
}

id objc_msgSend_avcBlobRequestMessageRetryFailedForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avcBlobRequestMessageRetryFailedForConversationGroupUUID:");
}

id objc_msgSend_avcBlobRequestMessageRetryStartedForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avcBlobRequestMessageRetryStartedForConversationGroupUUID:");
}

id objc_msgSend_avcBlobRequestMessageRetrySucceededForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avcBlobRequestMessageRetrySucceededForConversationGroupUUID:");
}

id objc_msgSend_avcData(void *a1, const char *a2, ...)
{
  return _[a1 avcData];
}

id objc_msgSend_avcIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 avcIdentifier];
}

id objc_msgSend_avcLocalCaptionsToken(void *a1, const char *a2, ...)
{
  return _[a1 avcLocalCaptionsToken];
}

id objc_msgSend_avcRequest(void *a1, const char *a2, ...)
{
  return _[a1 avcRequest];
}

id objc_msgSend_avcScreenCapture(void *a1, const char *a2, ...)
{
  return _[a1 avcScreenCapture];
}

id objc_msgSend_avcScreenCaptureConfigurationForScreenAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avcScreenCaptureConfigurationForScreenAttributes:");
}

id objc_msgSend_avcSession(void *a1, const char *a2, ...)
{
  return _[a1 avcSession];
}

id objc_msgSend_avcSessionCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 avcSessionCreationBlock];
}

id objc_msgSend_avcSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 avcSessionIdentifier];
}

id objc_msgSend_avcSessionInProgress(void *a1, const char *a2, ...)
{
  return _[a1 avcSessionInProgress];
}

id objc_msgSend_avcSessionParticipantCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 avcSessionParticipantCreationBlock];
}

id objc_msgSend_avcSessionToken(void *a1, const char *a2, ...)
{
  return _[a1 avcSessionToken];
}

id objc_msgSend_backingCallSource(void *a1, const char *a2, ...)
{
  return _[a1 backingCallSource];
}

id objc_msgSend_baseDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 baseDestinationID];
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _[a1 becomeCurrent];
}

id objc_msgSend_becomeEndpointForPullFromRemoteDevice(void *a1, const char *a2, ...)
{
  return _[a1 becomeEndpointForPullFromRemoteDevice];
}

id objc_msgSend_beginDailyMaintenanceWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginDailyMaintenanceWithActivity:");
}

id objc_msgSend_beginListeningBlock(void *a1, const char *a2, ...)
{
  return _[a1 beginListeningBlock];
}

id objc_msgSend_beginListeningOnService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginListeningOnService:");
}

id objc_msgSend_beginMatchingExtensions(void *a1, const char *a2, ...)
{
  return _[a1 beginMatchingExtensions];
}

id objc_msgSend_beginObserving(void *a1, const char *a2, ...)
{
  return _[a1 beginObserving];
}

id objc_msgSend_beginParticipantConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 beginParticipantConfiguration];
}

id objc_msgSend_beginParticipantUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginParticipantUpdates];
}

id objc_msgSend_beginTransactionIfNecessaryForObject_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionIfNecessaryForObject:withReason:");
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return _[a1 behavior];
}

id objc_msgSend_bestAppSuggestionManager(void *a1, const char *a2, ...)
{
  return _[a1 bestAppSuggestionManager];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_blockCallReasonForHandles_providerIdentifier_callDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockCallReasonForHandles:providerIdentifier:callDataSource:");
}

id objc_msgSend_blockListContainsMembers_providerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockListContainsMembers:providerIdentifier:");
}

id objc_msgSend_blockToExecuteAfterPendingCoalescingBlocksByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 blockToExecuteAfterPendingCoalescingBlocksByIdentifier];
}

id objc_msgSend_blockUtilities(void *a1, const char *a2, ...)
{
  return _[a1 blockUtilities];
}

id objc_msgSend_blockedByExtension(void *a1, const char *a2, ...)
{
  return _[a1 blockedByExtension];
}

id objc_msgSend_blockedByExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockedByExtension:");
}

id objc_msgSend_blocksPendingTransportAvailability(void *a1, const char *a2, ...)
{
  return _[a1 blocksPendingTransportAvailability];
}

id objc_msgSend_bluetoothAudioFormat(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAudioFormat];
}

id objc_msgSend_bluetoothEndpointType(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothEndpointType];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_breakBeforeMakeTimeout(void *a1, const char *a2, ...)
{
  return _[a1 breakBeforeMakeTimeout];
}

id objc_msgSend_broadcastActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastActivity:");
}

id objc_msgSend_broadcastActivity_withTimeout_shouldPrioritize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastActivity:withTimeout:shouldPrioritize:");
}

id objc_msgSend_broadcastAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastAttributes:");
}

id objc_msgSend_broadcastData_onConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastData:onConversation:");
}

id objc_msgSend_broadcastData_onConversation_additionalOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastData:onConversation:additionalOptions:");
}

id objc_msgSend_broadcastFile_onConversation_additionalOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastFile:onConversation:additionalOptions:");
}

id objc_msgSend_broadcastImageForSession_onConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastImageForSession:onConversation:");
}

id objc_msgSend_broadcastLightweightEndorsementForAddedMembers_onConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastLightweightEndorsementForAddedMembers:onConversation:");
}

id objc_msgSend_broadcastLocalParticipantData(void *a1, const char *a2, ...)
{
  return _[a1 broadcastLocalParticipantData];
}

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_filter:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleIdentifierForProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierForProvider:");
}

id objc_msgSend_bundleIdentifierToApplicationState(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifierToApplicationState];
}

id objc_msgSend_bundleRecordWithApplicationIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithApplicationIdentifier:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleURLString(void *a1, const char *a2, ...)
{
  return _[a1 bundleURLString];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_buzzMember_conversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buzzMember:conversationUUID:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_bytesOfDataUsed(void *a1, const char *a2, ...)
{
  return _[a1 bytesOfDataUsed];
}

id objc_msgSend_cachedCallUUIDsToConversationAVMode(void *a1, const char *a2, ...)
{
  return _[a1 cachedCallUUIDsToConversationAVMode];
}

id objc_msgSend_cachedCalls(void *a1, const char *a2, ...)
{
  return _[a1 cachedCalls];
}

id objc_msgSend_cachedChats(void *a1, const char *a2, ...)
{
  return _[a1 cachedChats];
}

id objc_msgSend_call(void *a1, const char *a2, ...)
{
  return _[a1 call];
}

id objc_msgSend_callCapabilitiesClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callCapabilitiesClientXPCInterface];
}

id objc_msgSend_callCapabilitiesForCTCallCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCapabilitiesForCTCallCapabilities:");
}

id objc_msgSend_callCapabilitiesForSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCapabilitiesForSubscription:");
}

id objc_msgSend_callCapabilitiesServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callCapabilitiesServerXPCInterface];
}

id objc_msgSend_callCapabilitiesState(void *a1, const char *a2, ...)
{
  return _[a1 callCapabilitiesState];
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return _[a1 callCenter];
}

id objc_msgSend_callCenterObserver(void *a1, const char *a2, ...)
{
  return _[a1 callCenterObserver];
}

id objc_msgSend_callClass(void *a1, const char *a2, ...)
{
  return _[a1 callClass];
}

id objc_msgSend_callContainer(void *a1, const char *a2, ...)
{
  return _[a1 callContainer];
}

id objc_msgSend_callController(void *a1, const char *a2, ...)
{
  return _[a1 callController];
}

id objc_msgSend_callControllerHost(void *a1, const char *a2, ...)
{
  return _[a1 callControllerHost];
}

id objc_msgSend_callDataSource(void *a1, const char *a2, ...)
{
  return _[a1 callDataSource];
}

id objc_msgSend_callDirectoryAllowsCallFromSourceAddress(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryAllowsCallFromSourceAddress];
}

id objc_msgSend_callDirectoryAllowsCallFromSourceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryAllowsCallFromSourceAddress:");
}

id objc_msgSend_callDirectoryAllowsCallFromSourceAddress_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryAllowsCallFromSourceAddress:countryCode:");
}

id objc_msgSend_callDirectoryExtensionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryExtensionIdentifier];
}

id objc_msgSend_callDirectoryIdentityExtension(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryIdentityExtension];
}

id objc_msgSend_callDirectoryIdentityType(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryIdentityType];
}

id objc_msgSend_callDirectoryLabel(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryLabel];
}

id objc_msgSend_callDirectoryLocalizedExtensionContainingAppName(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryLocalizedExtensionContainingAppName];
}

id objc_msgSend_callDirectoryName(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryName];
}

id objc_msgSend_callDirectorySanitizer(void *a1, const char *a2, ...)
{
  return _[a1 callDirectorySanitizer];
}

id objc_msgSend_callDirectoryStore(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryStore];
}

id objc_msgSend_callDuration(void *a1, const char *a2, ...)
{
  return _[a1 callDuration];
}

id objc_msgSend_callDurationLimitTimer(void *a1, const char *a2, ...)
{
  return _[a1 callDurationLimitTimer];
}

id objc_msgSend_callFilterController(void *a1, const char *a2, ...)
{
  return _[a1 callFilterController];
}

id objc_msgSend_callForClient_usingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callForClient:usingCall:");
}

id objc_msgSend_callForConversation_withSessionToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callForConversation:withSessionToken:");
}

id objc_msgSend_callForConversationWithGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callForConversationWithGroupUUID:");
}

id objc_msgSend_callGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 callGroupUUID];
}

id objc_msgSend_callGroupUUIDToCalls(void *a1, const char *a2, ...)
{
  return _[a1 callGroupUUIDToCalls];
}

id objc_msgSend_callHistoryController(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryController];
}

id objc_msgSend_callHistoryControllerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryControllerClientXPCInterface];
}

id objc_msgSend_callHistoryControllerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryControllerServerXPCInterface];
}

id objc_msgSend_callHistoryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryIdentifier];
}

id objc_msgSend_callHistoryManager(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryManager];
}

id objc_msgSend_callHistoryManagerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryManagerClientXPCInterface];
}

id objc_msgSend_callHistoryManagerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryManagerServerXPCInterface];
}

id objc_msgSend_callHistoryManagerXPCServer(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryManagerXPCServer];
}

id objc_msgSend_callID(void *a1, const char *a2, ...)
{
  return _[a1 callID];
}

id objc_msgSend_callInfoBlob(void *a1, const char *a2, ...)
{
  return _[a1 callInfoBlob];
}

id objc_msgSend_callModel(void *a1, const char *a2, ...)
{
  return _[a1 callModel];
}

id objc_msgSend_callPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callPassingTest:");
}

id objc_msgSend_callProviderManager(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManager];
}

id objc_msgSend_callProviderManagerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManagerClientXPCInterface];
}

id objc_msgSend_callProviderManagerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManagerServerXPCInterface];
}

id objc_msgSend_callProviderManagerXPCServer(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManagerXPCServer];
}

id objc_msgSend_callScreenShareAttributesForAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callScreenShareAttributesForAction:");
}

id objc_msgSend_callScreeningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 callScreeningEnabled];
}

id objc_msgSend_callScreeningEnabledM3(void *a1, const char *a2, ...)
{
  return _[a1 callScreeningEnabledM3];
}

id objc_msgSend_callService(void *a1, const char *a2, ...)
{
  return _[a1 callService];
}

id objc_msgSend_callServicesClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callServicesClientXPCInterface];
}

id objc_msgSend_callServicesInterface(void *a1, const char *a2, ...)
{
  return _[a1 callServicesInterface];
}

id objc_msgSend_callServicesServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 callServicesServerXPCInterface];
}

id objc_msgSend_callSource(void *a1, const char *a2, ...)
{
  return _[a1 callSource];
}

id objc_msgSend_callSource_reportedCallWithUUID_endedAtDate_privateReason_failureContext_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callSource:reportedCallWithUUID:endedAtDate:privateReason:failureContext:");
}

id objc_msgSend_callSourceFetcher(void *a1, const char *a2, ...)
{
  return _[a1 callSourceFetcher];
}

id objc_msgSend_callSourceForDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callSourceForDialRequest:");
}

id objc_msgSend_callSourceForJoinConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callSourceForJoinConversationRequest:");
}

id objc_msgSend_callSourceManager(void *a1, const char *a2, ...)
{
  return _[a1 callSourceManager];
}

id objc_msgSend_callSourceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callSourceWithIdentifier:");
}

id objc_msgSend_callSources(void *a1, const char *a2, ...)
{
  return _[a1 callSources];
}

id objc_msgSend_callStateContext(void *a1, const char *a2, ...)
{
  return _[a1 callStateContext];
}

id objc_msgSend_callStateController(void *a1, const char *a2, ...)
{
  return _[a1 callStateController];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_callSubType(void *a1, const char *a2, ...)
{
  return _[a1 callSubType];
}

id objc_msgSend_callTokens(void *a1, const char *a2, ...)
{
  return _[a1 callTokens];
}

id objc_msgSend_callTypeForJoinContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callTypeForJoinContext:");
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return _[a1 callUUID];
}

id objc_msgSend_callUUIDToGroupWith(void *a1, const char *a2, ...)
{
  return _[a1 callUUIDToGroupWith];
}

id objc_msgSend_callUUIDsByConversationUUID(void *a1, const char *a2, ...)
{
  return _[a1 callUUIDsByConversationUUID];
}

id objc_msgSend_callUUIDsUpgradedForAVMode(void *a1, const char *a2, ...)
{
  return _[a1 callUUIDsUpgradedForAVMode];
}

id objc_msgSend_callUpdate(void *a1, const char *a2, ...)
{
  return _[a1 callUpdate];
}

id objc_msgSend_callUpdateForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callUpdateForChat:");
}

id objc_msgSend_callUpdateForPendingChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callUpdateForPendingChat:");
}

id objc_msgSend_callUpdateWithDefaultValuesSet(void *a1, const char *a2, ...)
{
  return _[a1 callUpdateWithDefaultValuesSet];
}

id objc_msgSend_callWithCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithCallUUID:");
}

id objc_msgSend_callWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithStatus:");
}

id objc_msgSend_callWithUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithUniqueProxyIdentifier:");
}

id objc_msgSend_callWithUniqueProxyIdentifier_fromCallsToAnswer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithUniqueProxyIdentifier:fromCallsToAnswer:");
}

id objc_msgSend_callerID(void *a1, const char *a2, ...)
{
  return _[a1 callerID];
}

id objc_msgSend_callerIDForLocalMember_forProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIDForLocalMember:forProvider:");
}

id objc_msgSend_callerIDHandleForSenderIdentityUUID_callerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIDHandleForSenderIdentityUUID:callerID:");
}

id objc_msgSend_callerNameFromNetwork(void *a1, const char *a2, ...)
{
  return _[a1 callerNameFromNetwork];
}

id objc_msgSend_calls(void *a1, const char *a2, ...)
{
  return _[a1 calls];
}

id objc_msgSend_callsForDataSource_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsForDataSource:identifier:");
}

id objc_msgSend_callsHostedElsewhere(void *a1, const char *a2, ...)
{
  return _[a1 callsHostedElsewhere];
}

id objc_msgSend_callsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsPassingTest:");
}

id objc_msgSend_callsWithAnEndpointElsewhere(void *a1, const char *a2, ...)
{
  return _[a1 callsWithAnEndpointElsewhere];
}

id objc_msgSend_callsWithGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithGroupUUID:");
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_canBeAnsweredWithAudioOrVideoRelayWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBeAnsweredWithAudioOrVideoRelayWithRequest:");
}

id objc_msgSend_canBeAnsweredWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBeAnsweredWithRequest:");
}

id objc_msgSend_canCreateConversations(void *a1, const char *a2, ...)
{
  return _[a1 canCreateConversations];
}

id objc_msgSend_canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:");
}

id objc_msgSend_canReceiveMessagesForCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canReceiveMessagesForCallProvider:");
}

id objc_msgSend_canReceiveRelayedCalls(void *a1, const char *a2, ...)
{
  return _[a1 canReceiveRelayedCalls];
}

id objc_msgSend_canReceiveRelayedGFTCalls(void *a1, const char *a2, ...)
{
  return _[a1 canReceiveRelayedGFTCalls];
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _[a1 canSend];
}

id objc_msgSend_canUpgradeChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canUpgradeChat:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelCallID:");
}

id objc_msgSend_cancelInvitationWithAnsweredElsewhere(void *a1, const char *a2, ...)
{
  return _[a1 cancelInvitationWithAnsweredElsewhere];
}

id objc_msgSend_cancelInvitationWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelInvitationWithData:");
}

id objc_msgSend_cancelInvitationWithDeclinedElsewhere(void *a1, const char *a2, ...)
{
  return _[a1 cancelInvitationWithDeclinedElsewhere];
}

id objc_msgSend_cancelInvitationWithLocalHangup(void *a1, const char *a2, ...)
{
  return _[a1 cancelInvitationWithLocalHangup];
}

id objc_msgSend_cancelInvitationWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelInvitationWithReason:");
}

id objc_msgSend_cancelInvitationWithRemoteEndedReasonOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelInvitationWithRemoteEndedReasonOverride:");
}

id objc_msgSend_cancelOrDeclineInvitation(void *a1, const char *a2, ...)
{
  return _[a1 cancelOrDeclineInvitation];
}

id objc_msgSend_cancelOrDeclineInvitationForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelOrDeclineInvitationForIdentifier:");
}

id objc_msgSend_cancelOrDenyScreenShareRequest_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelOrDenyScreenShareRequest:forConversationUUID:");
}

id objc_msgSend_cancelPinRequests(void *a1, const char *a2, ...)
{
  return _[a1 cancelPinRequests];
}

id objc_msgSend_cancelPreviouslySentScreenShareRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviouslySentScreenShareRequests:");
}

id objc_msgSend_cannotBeAnswered(void *a1, const char *a2, ...)
{
  return _[a1 cannotBeAnswered];
}

id objc_msgSend_cannotRelayAudioOrVideo(void *a1, const char *a2, ...)
{
  return _[a1 cannotRelayAudioOrVideo];
}

id objc_msgSend_cannotRelayAudioOrVideoOnPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 cannotRelayAudioOrVideoOnPairedDevice];
}

id objc_msgSend_canonicalizedPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalizedPhoneNumber:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_capabilityInfoForSubscription_capability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capabilityInfoForSubscription:capability:");
}

id objc_msgSend_capabilitySendMessageOptions(void *a1, const char *a2, ...)
{
  return _[a1 capabilitySendMessageOptions];
}

id objc_msgSend_capabilityStateUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capabilityStateUpdated:");
}

id objc_msgSend_captionsToken(void *a1, const char *a2, ...)
{
  return _[a1 captionsToken];
}

id objc_msgSend_captureCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 captureCapabilities];
}

id objc_msgSend_captureSessionCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 captureSessionCreationBlock];
}

id objc_msgSend_captureSessionQueue(void *a1, const char *a2, ...)
{
  return _[a1 captureSessionQueue];
}

id objc_msgSend_capturingLocalVideo(void *a1, const char *a2, ...)
{
  return _[a1 capturingLocalVideo];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_chManager(void *a1, const char *a2, ...)
{
  return _[a1 chManager];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return _[a1 changeType];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_chat_changedBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:changedBytesOfDataUsed:");
}

id objc_msgSend_chat_inputFrequencyLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:inputFrequencyLevelChangedTo:");
}

id objc_msgSend_chat_inputLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:inputLevelChangedTo:");
}

id objc_msgSend_chat_outputFrequencyLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:outputFrequencyLevelChangedTo:");
}

id objc_msgSend_chat_outputLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:outputLevelChangedTo:");
}

id objc_msgSend_chat_receivedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:receivedData:");
}

id objc_msgSend_chatConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatConnected:");
}

id objc_msgSend_chatEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatEnded:");
}

id objc_msgSend_chatReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatReceived:");
}

id objc_msgSend_chatSentInvitation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatSentInvitation:");
}

id objc_msgSend_chatStartedConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatStartedConnecting:");
}

id objc_msgSend_chatWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatWithUUID:");
}

id objc_msgSend_chats(void *a1, const char *a2, ...)
{
  return _[a1 chats];
}

id objc_msgSend_chatsPendingUpgrade(void *a1, const char *a2, ...)
{
  return _[a1 chatsPendingUpgrade];
}

id objc_msgSend_checkAndSetTUActivityActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAndSetTUActivityActive:");
}

id objc_msgSend_checkLinkValidity_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkLinkValidity:completionHandler:");
}

id objc_msgSend_checkLinkValidityWithPseudonym_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkLinkValidityWithPseudonym:completionHandler:");
}

id objc_msgSend_checkShouldIgnoreSessionInviteWithMessage_fromDestination_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkShouldIgnoreSessionInviteWithMessage:fromDestination:completion:");
}

id objc_msgSend_checkValidityForSelfPseudonymString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkValidityForSelfPseudonymString:");
}

id objc_msgSend_cleanUpConversationIfNecessaryForConversationUUID_failureContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpConversationIfNecessaryForConversationUUID:failureContext:");
}

id objc_msgSend_cleanUpForMomentIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpForMomentIfNecessary:");
}

id objc_msgSend_cleanUpIDSSessionState(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpIDSSessionState];
}

id objc_msgSend_cleanUpLiveLookupDataWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpLiveLookupDataWithCompletionHandler:");
}

id objc_msgSend_cleanUpTemporaryFileIfExistsForClientFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpTemporaryFileIfExistsForClientFileURL:");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_cleanupConversationWithCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupConversationWithCallUUID:");
}

id objc_msgSend_cleanupExpiredPendingConversations(void *a1, const char *a2, ...)
{
  return _[a1 cleanupExpiredPendingConversations];
}

id objc_msgSend_clearActiveLightweightParticipants(void *a1, const char *a2, ...)
{
  return _[a1 clearActiveLightweightParticipants];
}

id objc_msgSend_clearActiveParticipants(void *a1, const char *a2, ...)
{
  return _[a1 clearActiveParticipants];
}

id objc_msgSend_clearActiveRemoteParticipants(void *a1, const char *a2, ...)
{
  return _[a1 clearActiveRemoteParticipants];
}

id objc_msgSend_clearActivitySessions(void *a1, const char *a2, ...)
{
  return _[a1 clearActivitySessions];
}

id objc_msgSend_clearAddedMembers(void *a1, const char *a2, ...)
{
  return _[a1 clearAddedMembers];
}

id objc_msgSend_clearContactIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 clearContactIdentifiers];
}

id objc_msgSend_clearConversationMembers(void *a1, const char *a2, ...)
{
  return _[a1 clearConversationMembers];
}

id objc_msgSend_clearConversations(void *a1, const char *a2, ...)
{
  return _[a1 clearConversations];
}

id objc_msgSend_clearEmergencyHandles(void *a1, const char *a2, ...)
{
  return _[a1 clearEmergencyHandles];
}

id objc_msgSend_clearEmergencyLabeledHandles(void *a1, const char *a2, ...)
{
  return _[a1 clearEmergencyLabeledHandles];
}

id objc_msgSend_clearEndpointIDSDestinationURIs(void *a1, const char *a2, ...)
{
  return _[a1 clearEndpointIDSDestinationURIs];
}

id objc_msgSend_clearGenerateDescriptorInfos(void *a1, const char *a2, ...)
{
  return _[a1 clearGenerateDescriptorInfos];
}

id objc_msgSend_clearGeneratorDescriptors(void *a1, const char *a2, ...)
{
  return _[a1 clearGeneratorDescriptors];
}

id objc_msgSend_clearHandlesToInvites(void *a1, const char *a2, ...)
{
  return _[a1 clearHandlesToInvites];
}

id objc_msgSend_clearHandoffIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 clearHandoffIdentifiers];
}

id objc_msgSend_clearInvitationPreferences(void *a1, const char *a2, ...)
{
  return _[a1 clearInvitationPreferences];
}

id objc_msgSend_clearInvitedHandles(void *a1, const char *a2, ...)
{
  return _[a1 clearInvitedHandles];
}

id objc_msgSend_clearLightweightMembers(void *a1, const char *a2, ...)
{
  return _[a1 clearLightweightMembers];
}

id objc_msgSend_clearLinks(void *a1, const char *a2, ...)
{
  return _[a1 clearLinks];
}

id objc_msgSend_clearMembers(void *a1, const char *a2, ...)
{
  return _[a1 clearMembers];
}

id objc_msgSend_clearMuteCacheDelay(void *a1, const char *a2, ...)
{
  return _[a1 clearMuteCacheDelay];
}

id objc_msgSend_clearNotificationsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 clearNotificationsIfNecessary];
}

id objc_msgSend_clearOtherInvitedHandles(void *a1, const char *a2, ...)
{
  return _[a1 clearOtherInvitedHandles];
}

id objc_msgSend_clearOtherUniqueProxyIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 clearOtherUniqueProxyIdentifiers];
}

id objc_msgSend_clearPendingMembershipFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingMembershipFor:");
}

id objc_msgSend_clearPrioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 clearPrioritizedSenderIdentities];
}

id objc_msgSend_clearProminenceEntrys(void *a1, const char *a2, ...)
{
  return _[a1 clearProminenceEntrys];
}

id objc_msgSend_clearProtoCalls(void *a1, const char *a2, ...)
{
  return _[a1 clearProtoCalls];
}

id objc_msgSend_clearProtoSupportedHandleTypes(void *a1, const char *a2, ...)
{
  return _[a1 clearProtoSupportedHandleTypes];
}

id objc_msgSend_clearProviders(void *a1, const char *a2, ...)
{
  return _[a1 clearProviders];
}

id objc_msgSend_clearPseudonyms(void *a1, const char *a2, ...)
{
  return _[a1 clearPseudonyms];
}

id objc_msgSend_clearReadNotificationsIgnoringHandleIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReadNotificationsIgnoringHandleIds:");
}

id objc_msgSend_clearRemoteMembers(void *a1, const char *a2, ...)
{
  return _[a1 clearRemoteMembers];
}

id objc_msgSend_clearRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 clearRemoteParticipantHandles];
}

id objc_msgSend_clearRemovedMembers(void *a1, const char *a2, ...)
{
  return _[a1 clearRemovedMembers];
}

id objc_msgSend_clearRoutes(void *a1, const char *a2, ...)
{
  return _[a1 clearRoutes];
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return _[a1 clearState];
}

id objc_msgSend_clearUplinkMutedCache(void *a1, const char *a2, ...)
{
  return _[a1 clearUplinkMutedCache];
}

id objc_msgSend_clearUplinkMutedCacheIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 clearUplinkMutedCacheIfNecessary];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_client_capabilitiesDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client:capabilitiesDidChange:");
}

id objc_msgSend_client_subscription_callCapabilitiesDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client:subscription:callCapabilitiesDidChange:");
}

id objc_msgSend_client_subscription_capabilitiesDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client:subscription:capabilitiesDidChange:");
}

id objc_msgSend_clientContextData(void *a1, const char *a2, ...)
{
  return _[a1 clientContextData];
}

id objc_msgSend_clientFileURLByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientFileURLByIdentifier];
}

id objc_msgSend_clientInvalidationHandler(void *a1, const char *a2, ...)
{
  return _[a1 clientInvalidationHandler];
}

id objc_msgSend_clientManager(void *a1, const char *a2, ...)
{
  return _[a1 clientManager];
}

id objc_msgSend_clientMessagingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 clientMessagingDelegate];
}

id objc_msgSend_clientUUID(void *a1, const char *a2, ...)
{
  return _[a1 clientUUID];
}

id objc_msgSend_clientUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 clientUUIDString];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return _[a1 clients];
}

id objc_msgSend_clientsByObject(void *a1, const char *a2, ...)
{
  return _[a1 clientsByObject];
}

id objc_msgSend_clientsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientsPassingTest:");
}

id objc_msgSend_closeConnectionTimeout(void *a1, const char *a2, ...)
{
  return _[a1 closeConnectionTimeout];
}

id objc_msgSend_cloudCallingDevices(void *a1, const char *a2, ...)
{
  return _[a1 cloudCallingDevices];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collaborationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 collaborationIdentifier];
}

id objc_msgSend_combinedAudioStreamToken(void *a1, const char *a2, ...)
{
  return _[a1 combinedAudioStreamToken];
}

id objc_msgSend_commitParticipantUpdates(void *a1, const char *a2, ...)
{
  return _[a1 commitParticipantUpdates];
}

id objc_msgSend_commitUncommittedTransactions(void *a1, const char *a2, ...)
{
  return _[a1 commitUncommittedTransactions];
}

id objc_msgSend_commonMessagingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 commonMessagingDelegate];
}

id objc_msgSend_compactStoreWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compactStoreWithCompletionHandler:");
}

id objc_msgSend_companyDepartment(void *a1, const char *a2, ...)
{
  return _[a1 companyDepartment];
}

id objc_msgSend_companyImageURL(void *a1, const char *a2, ...)
{
  return _[a1 companyImageURL];
}

id objc_msgSend_companyLogoURL(void *a1, const char *a2, ...)
{
  return _[a1 companyLogoURL];
}

id objc_msgSend_companyName(void *a1, const char *a2, ...)
{
  return _[a1 companyName];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completedDescription(void *a1, const char *a2, ...)
{
  return _[a1 completedDescription];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_conduit(void *a1, const char *a2, ...)
{
  return _[a1 conduit];
}

id objc_msgSend_conference(void *a1, const char *a2, ...)
{
  return _[a1 conference];
}

id objc_msgSend_conference_changedBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:changedBytesOfDataUsed:");
}

id objc_msgSend_conference_didReceiveData_forCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:didReceiveData:forCallID:");
}

id objc_msgSend_conference_endedWithReason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:endedWithReason:error:");
}

id objc_msgSend_conference_inputFrequencyLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:inputFrequencyLevelChangedTo:");
}

id objc_msgSend_conference_inputLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:inputLevelChangedTo:");
}

id objc_msgSend_conference_outputFrequencyLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:outputFrequencyLevelChangedTo:");
}

id objc_msgSend_conference_outputLevelChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:outputLevelChangedTo:");
}

id objc_msgSend_conference_remoteMediaStalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conference:remoteMediaStalled:");
}

id objc_msgSend_conferenceConnectionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceConnectionForIdentifier:");
}

id objc_msgSend_conferenceConnections(void *a1, const char *a2, ...)
{
  return _[a1 conferenceConnections];
}

id objc_msgSend_conferenceCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 conferenceCreationBlock];
}

id objc_msgSend_conferenceFinishedPreparing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceFinishedPreparing:");
}

id objc_msgSend_conferenceID(void *a1, const char *a2, ...)
{
  return _[a1 conferenceID];
}

id objc_msgSend_conferenceProvider(void *a1, const char *a2, ...)
{
  return _[a1 conferenceProvider];
}

id objc_msgSend_conferenceProvider_didPauseAudio_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:didPauseAudio:error:");
}

id objc_msgSend_conferenceProvider_didPauseVideo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:didPauseVideo:error:");
}

id objc_msgSend_conferenceProvider_didReceiveData_forCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:didReceiveData:forCallID:");
}

id objc_msgSend_conferenceProvider_didStartSession_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:didStartSession:error:");
}

id objc_msgSend_conferenceProvider_didStopWithError_callMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:didStopWithError:callMetadata:");
}

id objc_msgSend_conferenceProvider_remoteMediaStalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:remoteMediaStalled:");
}

id objc_msgSend_conferenceProvider_remoteVideoPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:remoteVideoPaused:");
}

id objc_msgSend_conferenceProvider_updateInputFrequencyLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:updateInputFrequencyLevel:");
}

id objc_msgSend_conferenceProvider_updateInputLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:updateInputLevel:");
}

id objc_msgSend_conferenceProvider_updateOutputFrequencyLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:updateOutputFrequencyLevel:");
}

id objc_msgSend_conferenceProvider_updateOutputLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProvider:updateOutputLevel:");
}

id objc_msgSend_conferenceProviderCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 conferenceProviderCreationBlock];
}

id objc_msgSend_conferenceProviderReceivedFirstRemoteFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceProviderReceivedFirstRemoteFrame:");
}

id objc_msgSend_conferenceStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conferenceStarted:");
}

id objc_msgSend_conferencesAwaitingConnectionClose(void *a1, const char *a2, ...)
{
  return _[a1 conferencesAwaitingConnectionClose];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_connectToDaemon(void *a1, const char *a2, ...)
{
  return _[a1 connectToDaemon];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionClosedForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionClosedForConference:");
}

id objc_msgSend_connectionClosedForConferenceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionClosedForConferenceProvider:");
}

id objc_msgSend_connectionSetupReportReceived_eventType_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionSetupReportReceived:eventType:forConversation:");
}

id objc_msgSend_connectionTimeout(void *a1, const char *a2, ...)
{
  return _[a1 connectionTimeout];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifier];
}

id objc_msgSend_contactIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifiers];
}

id objc_msgSend_contactIdentifiersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactIdentifiersAtIndex:");
}

id objc_msgSend_contactIdentifiersCount(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifiersCount];
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return _[a1 contactLabel];
}

id objc_msgSend_contactName(void *a1, const char *a2, ...)
{
  return _[a1 contactName];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_containsMemberWithHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsMemberWithHandle:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsOutgoingRestrictedHandle_forBundleIdentifier_performSynchronously_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsOutgoingRestrictedHandle:forBundleIdentifier:performSynchronously:");
}

id objc_msgSend_containsRegisteredDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsRegisteredDeviceID:");
}

id objc_msgSend_containsRemoteParticipantWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsRemoteParticipantWithIdentifier:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentsOfDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_context_addPhoneServicesDevice_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context:addPhoneServicesDevice:withCompletion:");
}

id objc_msgSend_context_getCapability_status_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context:getCapability:status:with:");
}

id objc_msgSend_context_getSystemCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context:getSystemCapabilities:");
}

id objc_msgSend_context_recheckPhoneServicesAccountStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context:recheckPhoneServicesAccountStatus:");
}

id objc_msgSend_context_removePhoneServicesDevice_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context:removePhoneServicesDevice:withCompletion:");
}

id objc_msgSend_context_setCapability_enabled_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context:setCapability:enabled:with:");
}

id objc_msgSend_contextIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contextIdentifier];
}

id objc_msgSend_contextWithSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithSlot:");
}

id objc_msgSend_continueHandoffAudioRouteForIdentifier_participantLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueHandoffAudioRouteForIdentifier:participantLeft:");
}

id objc_msgSend_continueHandoffAudioRouteNotification(void *a1, const char *a2, ...)
{
  return _[a1 continueHandoffAudioRouteNotification];
}

id objc_msgSend_continuityCameraDidConnect(void *a1, const char *a2, ...)
{
  return _[a1 continuityCameraDidConnect];
}

id objc_msgSend_controlMessageOverQREnabled(void *a1, const char *a2, ...)
{
  return _[a1 controlMessageOverQREnabled];
}

id objc_msgSend_conversation_activityChangedOnSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:activityChangedOnSession:");
}

id objc_msgSend_conversation_activitySessionChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:activitySessionChanged:");
}

id objc_msgSend_conversation_activitySessionRemoved_userOriginated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:activitySessionRemoved:userOriginated:");
}

id objc_msgSend_conversation_addedActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:addedActiveParticipant:");
}

id objc_msgSend_conversation_addedMembers_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:addedMembers:triggeredLocally:");
}

id objc_msgSend_conversation_appLaunchState_forActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:appLaunchState:forActivitySession:");
}

id objc_msgSend_conversation_changedBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:changedBytesOfDataUsed:");
}

id objc_msgSend_conversation_didChangeLocalParticipant_broadcastActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didChangeLocalParticipant:broadcastActivitySession:");
}

id objc_msgSend_conversation_didChangeSceneAssociationForActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didChangeSceneAssociationForActivitySession:");
}

id objc_msgSend_conversation_didChangeStateForActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didChangeStateForActivitySession:");
}

id objc_msgSend_conversation_failedWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:failedWithContext:");
}

id objc_msgSend_conversation_mediaPrioritiesChangedForParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:mediaPrioritiesChangedForParticipant:");
}

id objc_msgSend_conversation_participant_didReact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:participant:didReact:");
}

id objc_msgSend_conversation_participantDidStopReacting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:participantDidStopReacting:");
}

id objc_msgSend_conversation_receivedActivitySessionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:receivedActivitySessionEvent:");
}

id objc_msgSend_conversation_remoteMembersChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:remoteMembersChanged:");
}

id objc_msgSend_conversation_removedActiveParticipant_withLeaveReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:removedActiveParticipant:withLeaveReason:");
}

id objc_msgSend_conversation_requestBlobRecoveryForParticipantDestination_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:requestBlobRecoveryForParticipantDestination:completion:");
}

id objc_msgSend_conversation_requestedEndpointWithIdentifier_activitySession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:requestedEndpointWithIdentifier:activitySession:completion:");
}

id objc_msgSend_conversation_screenShareAttributesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:screenShareAttributesUpdated:");
}

id objc_msgSend_conversation_sendDeclineMessageToParticipantDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:sendDeclineMessageToParticipantDestination:");
}

id objc_msgSend_conversation_sendResourceAtURL_toParticipants_metadata_activitySessionUUID_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:sendResourceAtURL:toParticipants:metadata:activitySessionUUID:completion:");
}

id objc_msgSend_conversation_updatedActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:updatedActiveParticipant:");
}

id objc_msgSend_conversation_updatedActiveParticipantWithScreenSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:updatedActiveParticipantWithScreenSharing:");
}

id objc_msgSend_conversationChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationChanged:");
}

id objc_msgSend_conversationConnectionDidStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationConnectionDidStart:");
}

id objc_msgSend_conversationContainsScreenShareRequest_localRequest_requestHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationContainsScreenShareRequest:localRequest:requestHandle:");
}

id objc_msgSend_conversationCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 conversationCreationBlock];
}

id objc_msgSend_conversationDidLeave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationDidLeave:");
}

id objc_msgSend_conversationDidStopScreenCapture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationDidStopScreenCapture:");
}

id objc_msgSend_conversationDidTriggerJoin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationDidTriggerJoin:");
}

id objc_msgSend_conversationGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 conversationGroupUUID];
}

id objc_msgSend_conversationGroupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 conversationGroupUUIDString];
}

id objc_msgSend_conversationHandoffEnabled(void *a1, const char *a2, ...)
{
  return _[a1 conversationHandoffEnabled];
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return _[a1 conversationID];
}

id objc_msgSend_conversationInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationInvalidated:");
}

id objc_msgSend_conversationLink(void *a1, const char *a2, ...)
{
  return _[a1 conversationLink];
}

id objc_msgSend_conversationLinkBaseURL(void *a1, const char *a2, ...)
{
  return _[a1 conversationLinkBaseURL];
}

id objc_msgSend_conversationLinkDescriptorsWithGroupUUIDs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorsWithGroupUUIDs:error:");
}

id objc_msgSend_conversationLinkForGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkForGroupUUID:");
}

id objc_msgSend_conversationLinkForPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkForPseudonym:");
}

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return _[a1 conversationManager];
}

id objc_msgSend_conversationManager_activatedConversationLinksChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:activatedConversationLinksChanged:");
}

id objc_msgSend_conversationManager_avModeChanged_toAVMode_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:avModeChanged:toAVMode:forConversation:");
}

id objc_msgSend_conversationManager_avModeChanged_toAVMode_forParticipantWithHandle_forConversation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:avModeChanged:toAVMode:forParticipantWithHandle:forConversation:");
}

id objc_msgSend_conversationManager_connectionDidStartForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:connectionDidStartForConversation:");
}

id objc_msgSend_conversationManager_conversation_addedActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:addedActiveParticipant:");
}

id objc_msgSend_conversationManager_conversation_addedMembersLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:addedMembersLocally:");
}

id objc_msgSend_conversationManager_conversation_appLaunchState_forActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:appLaunchState:forActivitySession:");
}

id objc_msgSend_conversationManager_conversation_buzzedMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:buzzedMember:");
}

id objc_msgSend_conversationManager_conversation_changedBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:changedBytesOfDataUsed:");
}

id objc_msgSend_conversationManager_conversation_didChangeSceneAssociationForActivitySession_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:didChangeSceneAssociationForActivitySession:");
}

id objc_msgSend_conversationManager_conversation_didChangeStateForActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:didChangeStateForActivitySession:");
}

id objc_msgSend_conversationManager_conversation_failedWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:failedWithContext:");
}

id objc_msgSend_conversationManager_conversation_mediaPrioritiesDidChangeForParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:mediaPrioritiesDidChangeForParticipant:");
}

id objc_msgSend_conversationManager_conversation_participant_addedNotice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:participant:addedNotice:");
}

id objc_msgSend_conversationManager_conversation_participant_didReact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:participant:didReact:");
}

id objc_msgSend_conversationManager_conversation_participantDidStopReacting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:participantDidStopReacting:");
}

id objc_msgSend_conversationManager_conversation_receivedActivitySessionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:receivedActivitySessionEvent:");
}

id objc_msgSend_conversationManager_conversation_receivedMessage_fromHandle_withUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:receivedMessage:fromHandle:withUpdate:");
}

id objc_msgSend_conversationManager_conversation_removedActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:removedActiveParticipant:");
}

id objc_msgSend_conversationManager_conversation_removedActiveParticipant_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversation:removedActiveParticipant:withReason:");
}

id objc_msgSend_conversationManager_conversationChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversationChanged:");
}

id objc_msgSend_conversationManager_conversationScreenSharingChanged_forParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversationScreenSharingChanged:forParticipant:");
}

id objc_msgSend_conversationManager_conversationUpdateMessagesGroupPhoto_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:conversationUpdateMessagesGroupPhoto:");
}

id objc_msgSend_conversationManager_remoteMembersChanged_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:remoteMembersChanged:forConversation:");
}

id objc_msgSend_conversationManager_reportedHandedOffConversation_replacedByIdentifier_localizedHandoffRecipientDeviceCategory_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "conversationManager:reportedHandedOffConversation:replacedByIdentifier:localizedHandoffRecipientDeviceCategory:");
}

id objc_msgSend_conversationManager_reportedInvalidLinkForPendingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:reportedInvalidLinkForPendingConversation:");
}

id objc_msgSend_conversationManager_reportedLetMeInRejectedForPendingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:reportedLetMeInRejectedForPendingConversation:");
}

id objc_msgSend_conversationManager_reportedNewIncomingConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:reportedNewIncomingConversation:fromHandle:");
}

id objc_msgSend_conversationManager_reportedRemoteDoesHandedOffForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:reportedRemoteDoesHandedOffForConversation:");
}

id objc_msgSend_conversationManager_requestedEndpointWithIdentifier_activitySession_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationManager:requestedEndpointWithIdentifier:activitySession:completion:");
}

id objc_msgSend_conversationManagerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 conversationManagerClientXPCInterface];
}

id objc_msgSend_conversationManagerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 conversationManagerServerXPCInterface];
}

id objc_msgSend_conversationManagerXPCServer(void *a1, const char *a2, ...)
{
  return _[a1 conversationManagerXPCServer];
}

id objc_msgSend_conversationMembers(void *a1, const char *a2, ...)
{
  return _[a1 conversationMembers];
}

id objc_msgSend_conversationMembersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationMembersAtIndex:");
}

id objc_msgSend_conversationMembersCount(void *a1, const char *a2, ...)
{
  return _[a1 conversationMembersCount];
}

id objc_msgSend_conversationNoticeManger(void *a1, const char *a2, ...)
{
  return _[a1 conversationNoticeManger];
}

id objc_msgSend_conversationOneToOneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 conversationOneToOneModeEnabled];
}

id objc_msgSend_conversationProviderForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationProviderForIdentifier:");
}

id objc_msgSend_conversationProviderIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 conversationProviderIdentifier];
}

id objc_msgSend_conversationProviderManager(void *a1, const char *a2, ...)
{
  return _[a1 conversationProviderManager];
}

id objc_msgSend_conversationProviderManagerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 conversationProviderManagerClientXPCInterface];
}

id objc_msgSend_conversationProviderManagerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 conversationProviderManagerServerXPCInterface];
}

id objc_msgSend_conversationRepresentedByRemoteMembers_andLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationRepresentedByRemoteMembers:andLink:");
}

id objc_msgSend_conversationServerBag(void *a1, const char *a2, ...)
{
  return _[a1 conversationServerBag];
}

id objc_msgSend_conversationUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUIDs];
}

id objc_msgSend_conversationUUIDsAwaitingActiveAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUIDsAwaitingActiveAudioSession];
}

id objc_msgSend_conversationUUIDsByCallUUID(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUIDsByCallUUID];
}

id objc_msgSend_conversationUUIDsUpgradedFromAVLess(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUIDsUpgradedFromAVLess];
}

id objc_msgSend_conversationUUIDsWaitingForRemoteJoin(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUIDsWaitingForRemoteJoin];
}

id objc_msgSend_conversationUUIDsWaitingToJoin(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUIDsWaitingToJoin];
}

id objc_msgSend_conversationWithGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationWithGroupUUID:");
}

id objc_msgSend_conversationWithGroupUUID_orMemberIdentifiers_orRemoteMembers_andLink_andVideo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationWithGroupUUID:orMemberIdentifiers:orRemoteMembers:andLink:andVideo:");
}

id objc_msgSend_conversationWithGroupUUID_orRepresentedByRemoteMembers_andLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationWithGroupUUID:orRepresentedByRemoteMembers:andLink:");
}

id objc_msgSend_conversations(void *a1, const char *a2, ...)
{
  return _[a1 conversations];
}

id objc_msgSend_conversationsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationsAtIndex:");
}

id objc_msgSend_conversationsByGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 conversationsByGroupUUID];
}

id objc_msgSend_conversationsByUUID(void *a1, const char *a2, ...)
{
  return _[a1 conversationsByUUID];
}

id objc_msgSend_conversationsCount(void *a1, const char *a2, ...)
{
  return _[a1 conversationsCount];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyFileAtURL_toTemporaryFileWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyFileAtURL:toTemporaryFileWithName:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileCountryCode:error:");
}

id objc_msgSend_copyMobileNetworkCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileNetworkCode:error:");
}

id objc_msgSend_copyMobileSubscriberCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileSubscriberCountryCode:error:");
}

id objc_msgSend_copyMobileSubscriberIsoCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileSubscriberIsoCountryCode:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_coreTelephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyClient];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForIdentifier:");
}

id objc_msgSend_countOfCallsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfCallsPassingTest:");
}

id objc_msgSend_countOfNotificationsReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfNotificationsReceived];
}

id objc_msgSend_cpApplicationController(void *a1, const char *a2, ...)
{
  return _[a1 cpApplicationController];
}

id objc_msgSend_createActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivitySession:");
}

id objc_msgSend_createActivitySession_onConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivitySession:onConversation:fromHandle:");
}

id objc_msgSend_createActivitySession_onConversationWithUUID_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivitySession:onConversationWithUUID:withCompletion:");
}

id objc_msgSend_createActivitySessionOnConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivitySessionOnConversation:");
}

id objc_msgSend_createActivitySessionWithTuActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivitySessionWithTuActivitySession:");
}

id objc_msgSend_createAliasForParticipantID_salt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAliasForParticipantID:salt:");
}

id objc_msgSend_createCPActivitySessionForActivitySession_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createCPActivitySessionForActivitySession:onConversationWithUUID:");
}

id objc_msgSend_createContentSharingSessionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 createContentSharingSessionIfNecessary];
}

id objc_msgSend_createConversationIfNecessaryWithUUID_groupUUID_messagesGroupUUID_locallyCreated_localMember_remoteMembers_pendingMembers_otherInvitedHandles_remotePushTokens_lightweightMembers_link_activity_avMode_presentationMode_provider_screenSharingRequest_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "createConversationIfNecessaryWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:remoteMembers:pe ndingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:link:activity:avMode:presentationMode:pr ovider:screenSharingRequest:");
}

id objc_msgSend_createConversationReportingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConversationReportingSession:");
}

id objc_msgSend_createConversationWithUUID_groupUUID_messagesGroupUUID_locallyCreated_localMember_initiator_remoteMembers_pendingMembers_otherInvitedHandles_remotePushTokens_lightweightMembers_activity_link_report_fromStorage_avMode_presentationMode_provider_screenSharingRequest_isInitiator_isOldMessage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pen dingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:report:fromStorage:avMode:p resentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createGroupSessionProviderWithGroupID_participantDestinationIDs_callerID_account_queue_isOneToOneModeEnabled_localMember_avLess_isScreenSharingRequest_ABTestConfiguration_isInitiator_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "createGroupSessionProviderWithGroupID:participantDestinationIDs:callerID:account:queue:isOneToOneModeEnabled: localMember:avLess:isScreenSharingRequest:ABTestConfiguration:isInitiator:");
}

id objc_msgSend_createLinkIfNecessaryWithFilename_toURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createLinkIfNecessaryWithFilename:toURL:");
}

id objc_msgSend_createLinkIfNecessaryWithFilename_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createLinkIfNecessaryWithFilename:toURL:error:");
}

id objc_msgSend_createOneToOneFTReportingSessionForCallWithUUID_withReportingHierarchyToken_withVideo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOneToOneFTReportingSessionForCallWithUUID:withReportingHierarchyToken:withVideo:");
}

id objc_msgSend_createProcessMonitorIfNecessary_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createProcessMonitorIfNecessary:forClient:");
}

id objc_msgSend_createScreenCapturePickerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 createScreenCapturePickerIfNecessary];
}

id objc_msgSend_createStagedActivitySessionForActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createStagedActivitySessionForActivity:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_creationDateEpochTime(void *a1, const char *a2, ...)
{
  return _[a1 creationDateEpochTime];
}

id objc_msgSend_creationRequestForAsset(void *a1, const char *a2, ...)
{
  return _[a1 creationRequestForAsset];
}

id objc_msgSend_crossDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 crossDeviceIdentifier];
}

id objc_msgSend_csCallingCapabilitiesState(void *a1, const char *a2, ...)
{
  return _[a1 csCallingCapabilitiesState];
}

id objc_msgSend_csdConversationParticipant(void *a1, const char *a2, ...)
{
  return _[a1 csdConversationParticipant];
}

id objc_msgSend_csd_ISOCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_ISOCountryCode");
}

id objc_msgSend_csd_UUIDv5(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_UUIDv5");
}

id objc_msgSend_csd_UUIDv5ForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_UUIDv5ForString:");
}

id objc_msgSend_csd_aliasStrings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_aliasStrings");
}

id objc_msgSend_csd_applicationRecordForApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_applicationRecordForApplicationIdentifier:");
}

id objc_msgSend_csd_applicationRecordForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_applicationRecordForBundleIdentifier:");
}

id objc_msgSend_csd_destinationForAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_destinationForAlias:");
}

id objc_msgSend_csd_isExpired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_isExpired");
}

id objc_msgSend_csd_isSymbolicLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_isSymbolicLink");
}

id objc_msgSend_csd_isTelephony(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_isTelephony");
}

id objc_msgSend_csd_isUnknown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_isUnknown");
}

id objc_msgSend_csd_localizedDeviceCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_localizedDeviceCategory");
}

id objc_msgSend_csd_pseudonym(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_pseudonym");
}

id objc_msgSend_csd_stringWithCSDVoIPApplicationMessageTransportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_stringWithCSDVoIPApplicationMessageTransportType:");
}

id objc_msgSend_csd_unknownContextInfoForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csd_unknownContextInfoForAccountID:");
}

id objc_msgSend_ctEmergencyCallbackModeStatusChangedWithUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctEmergencyCallbackModeStatusChangedWithUserInfo:");
}

id objc_msgSend_currentAudioAndVideoCallCount(void *a1, const char *a2, ...)
{
  return _[a1 currentAudioAndVideoCallCount];
}

id objc_msgSend_currentAudioAndVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 currentAudioAndVideoCalls];
}

id objc_msgSend_currentCallCount(void *a1, const char *a2, ...)
{
  return _[a1 currentCallCount];
}

id objc_msgSend_currentCallGroups(void *a1, const char *a2, ...)
{
  return _[a1 currentCallGroups];
}

id objc_msgSend_currentCallSet(void *a1, const char *a2, ...)
{
  return _[a1 currentCallSet];
}

id objc_msgSend_currentCalls(void *a1, const char *a2, ...)
{
  return _[a1 currentCalls];
}

id objc_msgSend_currentCallsForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCallsForClient:");
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return _[a1 currentClient];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentDeviceFamily(void *a1, const char *a2, ...)
{
  return _[a1 currentDeviceFamily];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentIDStatusForDestination_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIDStatusForDestination:service:listenerID:queue:completionBlock:");
}

id objc_msgSend_currentLocalScreenShareAttributes(void *a1, const char *a2, ...)
{
  return _[a1 currentLocalScreenShareAttributes];
}

id objc_msgSend_currentParticipantPresentationContexts(void *a1, const char *a2, ...)
{
  return _[a1 currentParticipantPresentationContexts];
}

id objc_msgSend_currentProxyCalls(void *a1, const char *a2, ...)
{
  return _[a1 currentProxyCalls];
}

id objc_msgSend_currentServerTimeDate(void *a1, const char *a2, ...)
{
  return _[a1 currentServerTimeDate];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 currentVideoCalls];
}

id objc_msgSend_currentlyPickedRouteIdForCategory_andMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentlyPickedRouteIdForCategory:andMode:");
}

id objc_msgSend_currentlyTrackedA2DPRouteIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentlyTrackedA2DPRouteIdentifier];
}

id objc_msgSend_customizeForProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customizeForProtocolVersion:");
}

id objc_msgSend_cxCall(void *a1, const char *a2, ...)
{
  return _[a1 cxCall];
}

id objc_msgSend_cxScreenShareAttributesForCallAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cxScreenShareAttributesForCallAttributes:");
}

id objc_msgSend_cx_incomingCallErrorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cx_incomingCallErrorWithCode:");
}

id objc_msgSend_cx_requestTransactionErrorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cx_requestTransactionErrorWithCode:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataDownloaded(void *a1, const char *a2, ...)
{
  return _[a1 dataDownloaded];
}

id objc_msgSend_dataForProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForProviders:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataSourceToIdentifierToCalls(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceToIdentifierToCalls];
}

id objc_msgSend_dataSources(void *a1, const char *a2, ...)
{
  return _[a1 dataSources];
}

id objc_msgSend_dataUploaded(void *a1, const char *a2, ...)
{
  return _[a1 dataUploaded];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateAnsweredOrDialed(void *a1, const char *a2, ...)
{
  return _[a1 dateAnsweredOrDialed];
}

id objc_msgSend_dateConnected(void *a1, const char *a2, ...)
{
  return _[a1 dateConnected];
}

id objc_msgSend_dateCreated(void *a1, const char *a2, ...)
{
  return _[a1 dateCreated];
}

id objc_msgSend_dateDialed(void *a1, const char *a2, ...)
{
  return _[a1 dateDialed];
}

id objc_msgSend_dateEnded(void *a1, const char *a2, ...)
{
  return _[a1 dateEnded];
}

id objc_msgSend_dateReceivedFirstRemoteFrame(void *a1, const char *a2, ...)
{
  return _[a1 dateReceivedFirstRemoteFrame];
}

id objc_msgSend_dateSentInvitation(void *a1, const char *a2, ...)
{
  return _[a1 dateSentInvitation];
}

id objc_msgSend_dateStarted(void *a1, const char *a2, ...)
{
  return _[a1 dateStarted];
}

id objc_msgSend_dateStartedConnecting(void *a1, const char *a2, ...)
{
  return _[a1 dateStartedConnecting];
}

id objc_msgSend_dateStartedOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 dateStartedOutgoing];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_declineConversation_reason_destinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineConversation:reason:destinations:");
}

id objc_msgSend_declineInvitation(void *a1, const char *a2, ...)
{
  return _[a1 declineInvitation];
}

id objc_msgSend_declineInvitationWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineInvitationWithData:");
}

id objc_msgSend_declineInvitationWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineInvitationWithResponse:");
}

id objc_msgSend_declineRemoteDevicesForConversation_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineRemoteDevicesForConversation:reason:");
}

id objc_msgSend_declineRemoteMembersForConversation_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineRemoteMembersForConversation:reason:");
}

id objc_msgSend_decryptLetMeInRequest_pseudonym_fromHandle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptLetMeInRequest:pseudonym:fromHandle:completionHandler:");
}

id objc_msgSend_decryptLetMeInResponse_pseudonym_requestorKeyAgreement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptLetMeInResponse:pseudonym:requestorKeyAgreement:");
}

id objc_msgSend_defaultAppProviderForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAppProviderForRemoteClients:");
}

id objc_msgSend_defaultAttributes(void *a1, const char *a2, ...)
{
  return _[a1 defaultAttributes];
}

id objc_msgSend_defaultBehavior(void *a1, const char *a2, ...)
{
  return _[a1 defaultBehavior];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultNotificationCenter];
}

id objc_msgSend_defaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 defaultPairedDevice];
}

id objc_msgSend_defaultPairedDeviceExists(void *a1, const char *a2, ...)
{
  return _[a1 defaultPairedDeviceExists];
}

id objc_msgSend_defaultProviders(void *a1, const char *a2, ...)
{
  return _[a1 defaultProviders];
}

id objc_msgSend_defaultScreenShareAttributes(void *a1, const char *a2, ...)
{
  return _[a1 defaultScreenShareAttributes];
}

id objc_msgSend_defaultSessionMode(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionMode];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deferCommittingTransactions(void *a1, const char *a2, ...)
{
  return _[a1 deferCommittingTransactions];
}

id objc_msgSend_deferReportingAudioFinishedForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferReportingAudioFinishedForCallWithUUID:");
}

id objc_msgSend_delayedActionsByCallUUID(void *a1, const char *a2, ...)
{
  return _[a1 delayedActionsByCallUUID];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateController(void *a1, const char *a2, ...)
{
  return _[a1 delegateController];
}

id objc_msgSend_delegateQueue(void *a1, const char *a2, ...)
{
  return _[a1 delegateQueue];
}

id objc_msgSend_delegateToQueue(void *a1, const char *a2, ...)
{
  return _[a1 delegateToQueue];
}

id objc_msgSend_deleteCallsWithPredicate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCallsWithPredicate:completion:");
}

id objc_msgSend_deleteContentsAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteContentsAtURL:");
}

id objc_msgSend_deletedConversationLinksWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletedConversationLinksWithError:");
}

id objc_msgSend_deletedLinkForJoinCallAction_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletedLinkForJoinCallAction:withError:");
}

id objc_msgSend_denyScreenShareRequestFrom_screenShareRequest_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denyScreenShareRequestFrom:screenShareRequest:conversation:");
}

id objc_msgSend_dequeueAllPauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 dequeueAllPauseDigits];
}

id objc_msgSend_dequeueNextPauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 dequeueNextPauseDigits];
}

id objc_msgSend_deregisterHandoffIdentifiersForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterHandoffIdentifiersForConversation:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_destinationID(void *a1, const char *a2, ...)
{
  return _[a1 destinationID];
}

id objc_msgSend_destinationIDsCanUseV2Blobs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationIDsCanUseV2Blobs:");
}

id objc_msgSend_destinationIdIsEmailAddress(void *a1, const char *a2, ...)
{
  return _[a1 destinationIdIsEmailAddress];
}

id objc_msgSend_destinationIdIsPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 destinationIdIsPhoneNumber];
}

id objc_msgSend_destinationIdIsPseudonym(void *a1, const char *a2, ...)
{
  return _[a1 destinationIdIsPseudonym];
}

id objc_msgSend_destinationIdIsTemporary(void *a1, const char *a2, ...)
{
  return _[a1 destinationIdIsTemporary];
}

id objc_msgSend_destinationURIs(void *a1, const char *a2, ...)
{
  return _[a1 destinationURIs];
}

id objc_msgSend_destinationWithActiveSession(void *a1, const char *a2, ...)
{
  return _[a1 destinationWithActiveSession];
}

id objc_msgSend_destinationWithDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationWithDestinations:");
}

id objc_msgSend_destinationWithStringURI_isLightWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationWithStringURI:isLightWeight:");
}

id objc_msgSend_destinationWithTUConversationMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationWithTUConversationMember:");
}

id objc_msgSend_destinationWithTUConversationParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationWithTUConversationParticipant:");
}

id objc_msgSend_destinationWithURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationWithURI:");
}

id objc_msgSend_destroyScreenCapturePickerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 destroyScreenCapturePickerIfNecessary];
}

id objc_msgSend_deviceDestinationsWithCapability_localHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDestinationsWithCapability:localHandle:");
}

id objc_msgSend_deviceFamily(void *a1, const char *a2, ...)
{
  return _[a1 deviceFamily];
}

id objc_msgSend_deviceForFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForFromID:");
}

id objc_msgSend_deviceForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForService:");
}

id objc_msgSend_deviceHomeButtonType(void *a1, const char *a2, ...)
{
  return _[a1 deviceHomeButtonType];
}

id objc_msgSend_deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider_needsConversationRelaySupport_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:needsConversationRelaySupport:");
}

id objc_msgSend_deviceRole(void *a1, const char *a2, ...)
{
  return _[a1 deviceRole];
}

id objc_msgSend_deviceSupport(void *a1, const char *a2, ...)
{
  return _[a1 deviceSupport];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_deviceWithActiveSession(void *a1, const char *a2, ...)
{
  return _[a1 deviceWithActiveSession];
}

id objc_msgSend_deviceWithUniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceWithUniqueID:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dialDelayForRequest(void *a1, const char *a2, ...)
{
  return _[a1 dialDelayForRequest];
}

id objc_msgSend_dialRequest(void *a1, const char *a2, ...)
{
  return _[a1 dialRequest];
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return _[a1 dialType];
}

id objc_msgSend_dialWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialWithRequest:completion:");
}

id objc_msgSend_dialWithRequest_displayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialWithRequest:displayContext:");
}

id objc_msgSend_dialingIDSDestination(void *a1, const char *a2, ...)
{
  return _[a1 dialingIDSDestination];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didCleanUp(void *a1, const char *a2, ...)
{
  return _[a1 didCleanUp];
}

id objc_msgSend_didEndSession_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEndSession:startDate:endDate:");
}

id objc_msgSend_didErrorOccur(void *a1, const char *a2, ...)
{
  return _[a1 didErrorOccur];
}

id objc_msgSend_didPerformUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 didPerformUplinkMuted];
}

id objc_msgSend_didPrepareHandler(void *a1, const char *a2, ...)
{
  return _[a1 didPrepareHandler];
}

id objc_msgSend_didReceiveResultsWithTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveResultsWithTransactionID:");
}

id objc_msgSend_didStartHandler(void *a1, const char *a2, ...)
{
  return _[a1 didStartHandler];
}

id objc_msgSend_didStartRequestWithTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartRequestWithTransactionID:");
}

id objc_msgSend_didStopHandler(void *a1, const char *a2, ...)
{
  return _[a1 didStopHandler];
}

id objc_msgSend_didUpdateCapabilities_forVideoStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateCapabilities:forVideoStreamToken:");
}

id objc_msgSend_digits(void *a1, const char *a2, ...)
{
  return _[a1 digits];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_disconnectActiveCallsBasedOnCallStatusForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectActiveCallsBasedOnCallStatusForCall:");
}

id objc_msgSend_disconnectAllCalls(void *a1, const char *a2, ...)
{
  return _[a1 disconnectAllCalls];
}

id objc_msgSend_disconnectAllCalls_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectAllCalls:withReason:");
}

id objc_msgSend_disconnectAllCallsBesides_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectAllCallsBesides:");
}

id objc_msgSend_disconnectCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCall:");
}

id objc_msgSend_disconnectCall_whileUngroupingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCall:whileUngroupingCall:");
}

id objc_msgSend_disconnectCall_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCall:withReason:");
}

id objc_msgSend_disconnectCallWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCallWithReason:");
}

id objc_msgSend_disconnectCalls_whileHoldingCalls_andUnholdingCalls_andUngroupingCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCalls:whileHoldingCalls:andUnholdingCalls:andUngroupingCalls:");
}

id objc_msgSend_disconnectCalls_withReason_whileHoldingCalls_andUnholdingCalls_andUngroupingCalls_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCalls:withReason:whileHoldingCalls:andUnholdingCalls:andUngroupingCalls:");
}

id objc_msgSend_disconnectCurrentCallAndActivateHeld(void *a1, const char *a2, ...)
{
  return _[a1 disconnectCurrentCallAndActivateHeld];
}

id objc_msgSend_disconnectMessagingConnectionForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectMessagingConnectionForCall:");
}

id objc_msgSend_disconnectWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectWithReason:");
}

id objc_msgSend_disconnectedReason(void *a1, const char *a2, ...)
{
  return _[a1 disconnectedReason];
}

id objc_msgSend_displayContext(void *a1, const char *a2, ...)
{
  return _[a1 displayContext];
}

id objc_msgSend_displayContextByMergingWithDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayContextByMergingWithDisplayContext:");
}

id objc_msgSend_displayErrorNotificationWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayErrorNotificationWithMessage:");
}

id objc_msgSend_displayGreenTeaAlertForAppleTV(void *a1, const char *a2, ...)
{
  return _[a1 displayGreenTeaAlertForAppleTV];
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return _[a1 displayID];
}

id objc_msgSend_displayIncomingPinCode_fromID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayIncomingPinCode:fromID:completionHandler:");
}

id objc_msgSend_displayMismatchedAccountsNotification(void *a1, const char *a2, ...)
{
  return _[a1 displayMismatchedAccountsNotification];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayPinErrorNotification(void *a1, const char *a2, ...)
{
  return _[a1 displayPinErrorNotification];
}

id objc_msgSend_displayPinMessageForDevice_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayPinMessageForDevice:completionHandler:");
}

id objc_msgSend_displayPinRequestFailure(void *a1, const char *a2, ...)
{
  return _[a1 displayPinRequestFailure];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_displayServiceConfirmationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayServiceConfirmationWithCompletionHandler:");
}

id objc_msgSend_displaySharePlayUnableToStartAlert(void *a1, const char *a2, ...)
{
  return _[a1 displaySharePlayUnableToStartAlert];
}

id objc_msgSend_displaySlotsFullNotification(void *a1, const char *a2, ...)
{
  return _[a1 displaySlotsFullNotification];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_dndAllowsCall(void *a1, const char *a2, ...)
{
  return _[a1 dndAllowsCall];
}

id objc_msgSend_doesHandle_correspondToConversationProvider_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesHandle:correspondToConversationProvider:completionHandler:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donateUserIntentForCallProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateUserIntentForCallProviderIdentifier:");
}

id objc_msgSend_donateUserIntentForProviderWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateUserIntentForProviderWithIdentifier:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downgradeToAudio(void *a1, const char *a2, ...)
{
  return _[a1 downgradeToAudio];
}

id objc_msgSend_downgradeToOneToOneAfterDelayBlock(void *a1, const char *a2, ...)
{
  return _[a1 downgradeToOneToOneAfterDelayBlock];
}

id objc_msgSend_downlinkStreamToken(void *a1, const char *a2, ...)
{
  return _[a1 downlinkStreamToken];
}

id objc_msgSend_dtmfSoundPlayer(void *a1, const char *a2, ...)
{
  return _[a1 dtmfSoundPlayer];
}

id objc_msgSend_dtmfUpdateDigits(void *a1, const char *a2, ...)
{
  return _[a1 dtmfUpdateDigits];
}

id objc_msgSend_dynamicDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 dynamicDisplayContext];
}

id objc_msgSend_dynamicIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dynamicIdentifier];
}

id objc_msgSend_dynamicIdentifierForConversation_uplinkMuted_sendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicIdentifierForConversation:uplinkMuted:sendingVideo:");
}

id objc_msgSend_eligibleCallsByFilteringCalls_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eligibleCallsByFilteringCalls:forClient:");
}

id objc_msgSend_emergencyCallbackCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 emergencyCallbackCapabilities];
}

id objc_msgSend_emergencyCallbackModeDidChangeForAllSubscriptionsForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencyCallbackModeDidChangeForAllSubscriptionsForClient:");
}

id objc_msgSend_emergencyCallbackPossible(void *a1, const char *a2, ...)
{
  return _[a1 emergencyCallbackPossible];
}

id objc_msgSend_emergencyHandles(void *a1, const char *a2, ...)
{
  return _[a1 emergencyHandles];
}

id objc_msgSend_emergencyHandlesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencyHandlesAtIndex:");
}

id objc_msgSend_emergencyHandlesCount(void *a1, const char *a2, ...)
{
  return _[a1 emergencyHandlesCount];
}

id objc_msgSend_emergencyLabeledHandles(void *a1, const char *a2, ...)
{
  return _[a1 emergencyLabeledHandles];
}

id objc_msgSend_emergencyLabeledHandlesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencyLabeledHandlesAtIndex:");
}

id objc_msgSend_emergencyLabeledHandlesCount(void *a1, const char *a2, ...)
{
  return _[a1 emergencyLabeledHandlesCount];
}

id objc_msgSend_emergencyMediaItems(void *a1, const char *a2, ...)
{
  return _[a1 emergencyMediaItems];
}

id objc_msgSend_emergencyMediaType(void *a1, const char *a2, ...)
{
  return _[a1 emergencyMediaType];
}

id objc_msgSend_emergencyTUHandles(void *a1, const char *a2, ...)
{
  return _[a1 emergencyTUHandles];
}

id objc_msgSend_emergencyTULabeledHandles(void *a1, const char *a2, ...)
{
  return _[a1 emergencyTULabeledHandles];
}

id objc_msgSend_emptyConversationWithGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyConversationWithGroupUUID:");
}

id objc_msgSend_enableEmergencyModeIfNecessaryForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableEmergencyModeIfNecessaryForCall:");
}

id objc_msgSend_enableEmergencyModeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableEmergencyModeWithError:");
}

id objc_msgSend_enclosedEncryptedType(void *a1, const char *a2, ...)
{
  return _[a1 enclosedEncryptedType];
}

id objc_msgSend_encryptLetMeInRequest_link_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptLetMeInRequest:link:completionHandler:");
}

id objc_msgSend_encryptLetMeInResponse_pseudonym_responseKeyData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptLetMeInResponse:pseudonym:responseKeyData:");
}

id objc_msgSend_encryptedData(void *a1, const char *a2, ...)
{
  return _[a1 encryptedData];
}

id objc_msgSend_encryptedMessage(void *a1, const char *a2, ...)
{
  return _[a1 encryptedMessage];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endActiveAndAnswerCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endActiveAndAnswerCall:");
}

id objc_msgSend_endActivitySession_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endActivitySession:onConversationWithUUID:");
}

id objc_msgSend_endCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endCallWithUUID:");
}

id objc_msgSend_endCallWithUUIDAsAnsweredElsewhere_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endCallWithUUIDAsAnsweredElsewhere:");
}

id objc_msgSend_endCallWithUUIDAsDeclinedElsewhere_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endCallWithUUIDAsDeclinedElsewhere:");
}

id objc_msgSend_endCallWithUUIDAsLocalHangup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endCallWithUUIDAsLocalHangup:");
}

id objc_msgSend_endChatWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endChatWithReason:");
}

id objc_msgSend_endEmergencyCallbackMode(void *a1, const char *a2, ...)
{
  return _[a1 endEmergencyCallbackMode];
}

id objc_msgSend_endEndingSessions(void *a1, const char *a2, ...)
{
  return _[a1 endEndingSessions];
}

id objc_msgSend_endHandoffActivity(void *a1, const char *a2, ...)
{
  return _[a1 endHandoffActivity];
}

id objc_msgSend_endHeldAndAnswerCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endHeldAndAnswerCall:");
}

id objc_msgSend_endObserving(void *a1, const char *a2, ...)
{
  return _[a1 endObserving];
}

id objc_msgSend_endParticipantConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 endParticipantConfiguration];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _[a1 endSession];
}

id objc_msgSend_endTransactionIfNecessaryForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransactionIfNecessaryForObject:");
}

id objc_msgSend_endWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endWithError:");
}

id objc_msgSend_endedError(void *a1, const char *a2, ...)
{
  return _[a1 endedError];
}

id objc_msgSend_endedReason(void *a1, const char *a2, ...)
{
  return _[a1 endedReason];
}

id objc_msgSend_endedReasonUserInfoForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endedReasonUserInfoForCall:");
}

id objc_msgSend_endpointIDSDestination(void *a1, const char *a2, ...)
{
  return _[a1 endpointIDSDestination];
}

id objc_msgSend_endpointIDSDestinationURIs(void *a1, const char *a2, ...)
{
  return _[a1 endpointIDSDestinationURIs];
}

id objc_msgSend_endpointIDSDestinationURIsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointIDSDestinationURIsAtIndex:");
}

id objc_msgSend_endpointIDSDestinationURIsCount(void *a1, const char *a2, ...)
{
  return _[a1 endpointIDSDestinationURIsCount];
}

id objc_msgSend_endpointOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 endpointOnCurrentDevice];
}

id objc_msgSend_endpointRapportEffectiveIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 endpointRapportEffectiveIdentifier];
}

id objc_msgSend_endpointRapportMediaSystemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 endpointRapportMediaSystemIdentifier];
}

id objc_msgSend_enqueueConversationWaitingForAudioWithConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueConversationWaitingForAudioWithConversationUUID:");
}

id objc_msgSend_enqueueMessageRetryAttemptForMessageID_message_attemptCount_messageProcessingBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueMessageRetryAttemptForMessageID:message:attemptCount:messageProcessingBlock:");
}

id objc_msgSend_enqueueOrStartAudioForConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueOrStartAudioForConversationUUID:");
}

id objc_msgSend_enrollDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 enrollDefaultPairedDevice];
}

id objc_msgSend_enrollDefaultPairedDeviceForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollDefaultPairedDeviceForAccountID:");
}

id objc_msgSend_enrollDevice_forSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollDevice:forSenderIdentityUUID:");
}

id objc_msgSend_entitledCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 entitledCapabilities];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumerateActiveConversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateActiveConversations:");
}

id objc_msgSend_enumerateDelegatesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateDelegatesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateRoutesInvokingBlock_forRoutesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRoutesInvokingBlock:forRoutesPassingTest:");
}

id objc_msgSend_errorForDisabledPseudonyms(void *a1, const char *a2, ...)
{
  return _[a1 errorForDisabledPseudonyms];
}

id objc_msgSend_errorForUnregisteredProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorForUnregisteredProviderIdentifier:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateConversation:");
}

id objc_msgSend_eventBlock(void *a1, const char *a2, ...)
{
  return _[a1 eventBlock];
}

id objc_msgSend_eventTypeNameFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventTypeNameFrom:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeSessionDidStart(void *a1, const char *a2, ...)
{
  return _[a1 executeSessionDidStart];
}

id objc_msgSend_expanseBTSwitchingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 expanseBTSwitchingEnabled];
}

id objc_msgSend_expanseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 expanseEnabled];
}

id objc_msgSend_expanseProvider(void *a1, const char *a2, ...)
{
  return _[a1 expanseProvider];
}

id objc_msgSend_expectedAudioEnabled(void *a1, const char *a2, ...)
{
  return _[a1 expectedAudioEnabled];
}

id objc_msgSend_expectedAudioPaused(void *a1, const char *a2, ...)
{
  return _[a1 expectedAudioPaused];
}

id objc_msgSend_expectedRelayClientDestination(void *a1, const char *a2, ...)
{
  return _[a1 expectedRelayClientDestination];
}

id objc_msgSend_expectedScreenEnabled(void *a1, const char *a2, ...)
{
  return _[a1 expectedScreenEnabled];
}

id objc_msgSend_expectedVideoEnabled(void *a1, const char *a2, ...)
{
  return _[a1 expectedVideoEnabled];
}

id objc_msgSend_expectedVideoPaused(void *a1, const char *a2, ...)
{
  return _[a1 expectedVideoPaused];
}

id objc_msgSend_expediteDeferredEndInterruptionForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expediteDeferredEndInterruptionForCallWithUUID:");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return _[a1 exportedInterface];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return _[a1 exportedObject];
}

id objc_msgSend_extensionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionWithIdentifier:error:");
}

id objc_msgSend_faceTimeAppUUID(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeAppUUID];
}

id objc_msgSend_faceTimeAudioAvailable(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeAudioAvailable];
}

id objc_msgSend_faceTimeAvailabilityChanged(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeAvailabilityChanged];
}

id objc_msgSend_faceTimeCallSource(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeCallSource];
}

id objc_msgSend_faceTimeConversationProviderDelegate(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeConversationProviderDelegate];
}

id objc_msgSend_faceTimeDemuxerDelegate(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeDemuxerDelegate];
}

id objc_msgSend_faceTimeIDMatchesAppleID(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeIDMatchesAppleID];
}

id objc_msgSend_faceTimeIDSProviderDelegate(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeIDSProviderDelegate];
}

id objc_msgSend_faceTimeIDStatus(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeIDStatus];
}

id objc_msgSend_faceTimeIDStatusRefreshed(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeIDStatusRefreshed];
}

id objc_msgSend_faceTimeIMAVProviderDelegate(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeIMAVProviderDelegate];
}

id objc_msgSend_faceTimeIMAccount(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeIMAccount];
}

id objc_msgSend_faceTimeInviteDemuxer(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeInviteDemuxer];
}

id objc_msgSend_faceTimeInviteDictionary(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeInviteDictionary];
}

id objc_msgSend_faceTimeLaunchForIncomingCallURL(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeLaunchForIncomingCallURL];
}

id objc_msgSend_faceTimeMultiwayAvailabilityForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeMultiwayAvailabilityForDestination:");
}

id objc_msgSend_faceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeProvider];
}

id objc_msgSend_faceTimeProviderDelegate(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeProviderDelegate];
}

id objc_msgSend_faceTimeShowInCallUIURL(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeShowInCallUIURL];
}

id objc_msgSend_faceTimeShowSystemCallControlsURL(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeShowSystemCallControlsURL];
}

id objc_msgSend_faceTimeSupported(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeSupported];
}

id objc_msgSend_faceTimeVideoAvailable(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeVideoAvailable];
}

id objc_msgSend_facetimeIDSServiceGenerator(void *a1, const char *a2, ...)
{
  return _[a1 facetimeIDSServiceGenerator];
}

id objc_msgSend_facetimeService(void *a1, const char *a2, ...)
{
  return _[a1 facetimeService];
}

id objc_msgSend_fail(void *a1, const char *a2, ...)
{
  return _[a1 fail];
}

id objc_msgSend_failOutstandingActionsForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failOutstandingActionsForCallWithUUID:");
}

id objc_msgSend_failureContext(void *a1, const char *a2, ...)
{
  return _[a1 failureContext];
}

id objc_msgSend_failureContextForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failureContextForChat:");
}

id objc_msgSend_failureReason(void *a1, const char *a2, ...)
{
  return _[a1 failureReason];
}

id objc_msgSend_fallbackApplicationName(void *a1, const char *a2, ...)
{
  return _[a1 fallbackApplicationName];
}

id objc_msgSend_fallbackURL(void *a1, const char *a2, ...)
{
  return _[a1 fallbackURL];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fetchActivatedLinksWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchActivatedLinksWithError:");
}

id objc_msgSend_fetchApplicationStateForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchApplicationStateForBundleIdentifier:");
}

id objc_msgSend_fetchCallSourceForIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallSourceForIdentifier:completion:");
}

id objc_msgSend_fetchCurrentProcessStatesForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCurrentProcessStatesForBundleIdentifier:");
}

id objc_msgSend_fetchDeletedLinksWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeletedLinksWithError:");
}

id objc_msgSend_fetchLiveBlockingInfoForHandle_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLiveBlockingInfoForHandle:timeout:");
}

id objc_msgSend_fetchPreferredFaceTimeAccountID(void *a1, const char *a2, ...)
{
  return _[a1 fetchPreferredFaceTimeAccountID];
}

id objc_msgSend_fetchUpcomingNoticeFromQueue(void *a1, const char *a2, ...)
{
  return _[a1 fetchUpcomingNoticeFromQueue];
}

id objc_msgSend_fetchUpcomingNoticeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUpcomingNoticeWithCompletionHandler:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return _[a1 fileManager];
}

id objc_msgSend_fileTransferController(void *a1, const char *a2, ...)
{
  return _[a1 fileTransferController];
}

id objc_msgSend_fileTransferer_didReceiveResourcesAtURL_withMetadata_isZipped_fromIDSDestination_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferer:didReceiveResourcesAtURL:withMetadata:isZipped:fromIDSDestination:");
}

id objc_msgSend_fileTransferer_didTransferFileAtURL_successfully_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferer:didTransferFileAtURL:successfully:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_filterClientsEntitledForCapability_andPerformBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterClientsEntitledForCapability:andPerformBlock:");
}

id objc_msgSend_filterClientsUsingPredicate_andPerformBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterClientsUsingPredicate:andPerformBlock:");
}

id objc_msgSend_filterClientsUsingPredicate_andPerformBlock_coalescedByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterClientsUsingPredicate:andPerformBlock:coalescedByIdentifier:");
}

id objc_msgSend_filterGFTaaSCalls(void *a1, const char *a2, ...)
{
  return _[a1 filterGFTaaSCalls];
}

id objc_msgSend_filterStatusForAddresses_withBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterStatusForAddresses:withBundleIdentifier:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredOutReason(void *a1, const char *a2, ...)
{
  return _[a1 filteredOutReason];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return _[a1 filters];
}

id objc_msgSend_findConversationLinkMatchingPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findConversationLinkMatchingPseudonym:");
}

id objc_msgSend_findOrCreateConversationWithGroupUUID_messagesGroupUUID_remoteMembers_otherInvitedHandles_localMember_remotePushTokens_link_activity_avMode_presentationMode_conversationProvider_screenSharingRequest_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "findOrCreateConversationWithGroupUUID:messagesGroupUUID:remoteMembers:otherInvitedHandles:localMember:remoteP ushTokens:link:activity:avMode:presentationMode:conversationProvider:screenSharingRequest:");
}

id objc_msgSend_firstEnabledBlockingExtensionIdentifierForPhoneNumber_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstEnabledBlockingExtensionIdentifierForPhoneNumber:error:");
}

id objc_msgSend_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:timeout:");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstIndex];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstUnlockCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 firstUnlockCallbacks];
}

id objc_msgSend_firstUnlockObserver(void *a1, const char *a2, ...)
{
  return _[a1 firstUnlockObserver];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceExpanseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 forceExpanseEnabled];
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_frameRate(void *a1, const char *a2, ...)
{
  return _[a1 frameRate];
}

id objc_msgSend_fromHandle(void *a1, const char *a2, ...)
{
  return _[a1 fromHandle];
}

id objc_msgSend_fromServer(void *a1, const char *a2, ...)
{
  return _[a1 fromServer];
}

id objc_msgSend_fromServerStorage(void *a1, const char *a2, ...)
{
  return _[a1 fromServerStorage];
}

id objc_msgSend_frontmostAudioOrVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 frontmostAudioOrVideoCall];
}

id objc_msgSend_frontmostCall(void *a1, const char *a2, ...)
{
  return _[a1 frontmostCall];
}

id objc_msgSend_fulfill(void *a1, const char *a2, ...)
{
  return _[a1 fulfill];
}

id objc_msgSend_fulfillLocalScreenShareRequests(void *a1, const char *a2, ...)
{
  return _[a1 fulfillLocalScreenShareRequests];
}

id objc_msgSend_fulfillPendingScreenSharingRequestsForRemoteParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fulfillPendingScreenSharingRequestsForRemoteParticipant:");
}

id objc_msgSend_fulfillWithDateConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fulfillWithDateConnected:");
}

id objc_msgSend_fullfillPendingJoinActionsForCallUUIDIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullfillPendingJoinActionsForCallUUIDIfNecessary:");
}

id objc_msgSend_fuzzyPhotoRequestFailureCount(void *a1, const char *a2, ...)
{
  return _[a1 fuzzyPhotoRequestFailureCount];
}

id objc_msgSend_fuzzyPhotoRequestSuccessCount(void *a1, const char *a2, ...)
{
  return _[a1 fuzzyPhotoRequestSuccessCount];
}

id objc_msgSend_generateAllInactiveLinks(void *a1, const char *a2, ...)
{
  return _[a1 generateAllInactiveLinks];
}

id objc_msgSend_generateAllInactiveLinksFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAllInactiveLinksFor:");
}

id objc_msgSend_generateDescriptorInfosAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateDescriptorInfosAtIndex:");
}

id objc_msgSend_generateDescriptorInfosCount(void *a1, const char *a2, ...)
{
  return _[a1 generateDescriptorInfosCount];
}

id objc_msgSend_generateInactiveLinkFor_afterActivation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateInactiveLinkFor:afterActivation:");
}

id objc_msgSend_generateLinkForConversationUUID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateLinkForConversationUUID:completionHandler:");
}

id objc_msgSend_generateLinkWithGroupUUID_invitedHandles_originatorHandle_linkLifetimeScope_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "generateLinkWithGroupUUID:invitedHandles:originatorHandle:linkLifetimeScope:completionHandler:");
}

id objc_msgSend_generateLinkWithInvitedHandles_originatorHandle_linkLifetimeScope_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateLinkWithInvitedHandles:originatorHandle:linkLifetimeScope:completionHandler:");
}

id objc_msgSend_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateLinkWithInvitedMemberHandles:linkLifetimeScope:completionHandler:");
}

id objc_msgSend_generatePreviewImageFromData_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePreviewImageFromData:completionHandler:");
}

id objc_msgSend_generatePseudonymHandleForConversationProvider_expiryDuration_URI_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePseudonymHandleForConversationProvider:expiryDuration:URI:completionHandler:");
}

id objc_msgSend_generatePseudonymHandleForConversationWithExpiryDuration_URI_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePseudonymHandleForConversationWithExpiryDuration:URI:completionHandler:");
}

id objc_msgSend_generatorDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 generatorDescriptor];
}

id objc_msgSend_generatorDescriptorsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatorDescriptorsAtIndex:");
}

id objc_msgSend_generatorDescriptorsCount(void *a1, const char *a2, ...)
{
  return _[a1 generatorDescriptorsCount];
}

id objc_msgSend_generatorID(void *a1, const char *a2, ...)
{
  return _[a1 generatorID];
}

id objc_msgSend_generatorVersion(void *a1, const char *a2, ...)
{
  return _[a1 generatorVersion];
}

id objc_msgSend_getActiveContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveContexts:");
}

id objc_msgSend_getActiveLinksWithCreatedOnly_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveLinksWithCreatedOnly:completionHandler:");
}

id objc_msgSend_getCallCapabilities_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCallCapabilities:error:");
}

id objc_msgSend_getInactiveLinkForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInactiveLinkForHandle:");
}

id objc_msgSend_getInactiveLinkForHandle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInactiveLinkForHandle:completionHandler:");
}

id objc_msgSend_getInactiveLinkWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInactiveLinkWithCompletionHandler:");
}

id objc_msgSend_getIsAudioPaused_callID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIsAudioPaused:callID:error:");
}

id objc_msgSend_getIsSendingAudio_callID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIsSendingAudio:callID:error:");
}

id objc_msgSend_getIsVideoPaused_callID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIsVideoPaused:callID:error:");
}

id objc_msgSend_getLatestRemoteScreenShareAttributesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLatestRemoteScreenShareAttributesWithCompletionHandler:");
}

id objc_msgSend_getLinkDescriptorWithPseudonym_includeInactive_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLinkDescriptorWithPseudonym:includeInactive:completionHandler:");
}

id objc_msgSend_getParticipantIDForAlias_salt_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getParticipantIDForAlias:salt:completionHandler:");
}

id objc_msgSend_getPersonalNicknameBlock(void *a1, const char *a2, ...)
{
  return _[a1 getPersonalNicknameBlock];
}

id objc_msgSend_getPhoneServicesDeviceInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPhoneServicesDeviceInfo:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getRoamingStatus_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRoamingStatus:error:");
}

id objc_msgSend_gftDowngradeToOneToOne(void *a1, const char *a2, ...)
{
  return _[a1 gftDowngradeToOneToOne];
}

id objc_msgSend_gftaasPseudonymsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gftaasPseudonymsEnabled:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_greenTeaHandoffTimeout(void *a1, const char *a2, ...)
{
  return _[a1 greenTeaHandoffTimeout];
}

id objc_msgSend_greenTeaLeaveContext(void *a1, const char *a2, ...)
{
  return _[a1 greenTeaLeaveContext];
}

id objc_msgSend_groupActivitiesReportsReceived_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupActivitiesReportsReceived:forConversation:");
}

id objc_msgSend_groupCall_withOtherCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupCall:withOtherCall:");
}

id objc_msgSend_groupCalls_withCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupCalls:withCalls:");
}

id objc_msgSend_groupFaceTimeServiceProviderDelegate(void *a1, const char *a2, ...)
{
  return _[a1 groupFaceTimeServiceProviderDelegate];
}

id objc_msgSend_groupFaceTimeTLESampleRate(void *a1, const char *a2, ...)
{
  return _[a1 groupFaceTimeTLESampleRate];
}

id objc_msgSend_groupFacetimeAsAServiceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 groupFacetimeAsAServiceEnabled];
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _[a1 groupID];
}

id objc_msgSend_groupSessionProviderCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 groupSessionProviderCreationBlock];
}

id objc_msgSend_groupUUID(void *a1, const char *a2, ...)
{
  return _[a1 groupUUID];
}

id objc_msgSend_groupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 groupUUIDString];
}

id objc_msgSend_groupWithOtherCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithOtherCall:");
}

id objc_msgSend_guestModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 guestModeEnabled];
}

id objc_msgSend_handedOff(void *a1, const char *a2, ...)
{
  return _[a1 handedOff];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleAddMemberMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAddMemberMessageFromClient:");
}

id objc_msgSend_handleAnswerCallMessageFromClient_destination_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAnswerCallMessageFromClient:destination:device:");
}

id objc_msgSend_handleApplicationUninstalledNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleApplicationUninstalledNotification:");
}

id objc_msgSend_handleAudioSessionActivationStateChangedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAudioSessionActivationStateChangedTo:");
}

id objc_msgSend_handleBuzzMemberMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBuzzMemberMessageFromClient:");
}

id objc_msgSend_handleByFullyQualifyingHandle_usingCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleByFullyQualifyingHandle:usingCountryCode:");
}

id objc_msgSend_handleBytesOfDataUsedChanged_forCallWithUniqueProxyIdentifier_callHistoryIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBytesOfDataUsedChanged:forCallWithUniqueProxyIdentifier:callHistoryIdentifier:");
}

id objc_msgSend_handleCallAnsweredElsewhereMessageFromHost_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCallAnsweredElsewhereMessageFromHost:fromPairedDevice:");
}

id objc_msgSend_handleCallConnectedMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCallConnectedMessageFromHost:");
}

id objc_msgSend_handleCallDialedMessageFromHost_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCallDialedMessageFromHost:fromPairedDevice:");
}

id objc_msgSend_handleCallDisconnectedMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCallDisconnectedMessageFromHost:");
}

id objc_msgSend_handleCallSourcesChanged(void *a1, const char *a2, ...)
{
  return _[a1 handleCallSourcesChanged];
}

id objc_msgSend_handleCallStartedConnectingMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCallStartedConnectingMessageFromHost:");
}

id objc_msgSend_handleClientDisconnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleClientDisconnected:");
}

id objc_msgSend_handleConversation_addHighlight_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:addHighlight:fromHandle:");
}

id objc_msgSend_handleConversation_participantUpdateMessage_fromNormalizedHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:participantUpdateMessage:fromNormalizedHandle:");
}

id objc_msgSend_handleConversation_receivedActivitySession_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:receivedActivitySession:fromHandle:");
}

id objc_msgSend_handleConversation_receivedBlobRecoveryRequest_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:receivedBlobRecoveryRequest:fromHandle:");
}

id objc_msgSend_handleConversation_receivedBlobRecoveryResponse_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:receivedBlobRecoveryResponse:fromHandle:");
}

id objc_msgSend_handleConversation_receivedEndorsementForMember_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:receivedEndorsementForMember:fromHandle:");
}

id objc_msgSend_handleConversation_registerMessagesGroupUUIDMessage_fromNormalizedHandle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:registerMessagesGroupUUIDMessage:fromNormalizedHandle:");
}

id objc_msgSend_handleConversation_removeActivitySession_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:removeActivitySession:fromHandle:");
}

id objc_msgSend_handleConversation_removeHighlight_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:removeHighlight:fromHandle:");
}

id objc_msgSend_handleConversation_screenShareRequest_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:screenShareRequest:fromHandle:");
}

id objc_msgSend_handleConversation_screenShareResponse_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:screenShareResponse:fromHandle:");
}

id objc_msgSend_handleConversation_updateActivity_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:updateActivity:fromHandle:");
}

id objc_msgSend_handleConversation_updateActivityImage_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:updateActivityImage:fromHandle:");
}

id objc_msgSend_handleConversation_updateGuestMode_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversation:updateGuestMode:fromHandle:");
}

id objc_msgSend_handleConversationProminenceMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConversationProminenceMessageFromHost:");
}

id objc_msgSend_handleConversationStateUpdated(void *a1, const char *a2, ...)
{
  return _[a1 handleConversationStateUpdated];
}

id objc_msgSend_handleCurrentCallsChanged_callDisconnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCurrentCallsChanged:callDisconnected:");
}

id objc_msgSend_handleDeclineMessage_forConversation_fromHandle_withUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDeclineMessage:forConversation:fromHandle:withUpdate:");
}

id objc_msgSend_handleDelegatedPendingMember_forConversation_withGroupUUID_from_transactionUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDelegatedPendingMember:forConversation:withGroupUUID:from:transactionUUID:");
}

id objc_msgSend_handleDelegatedPendingMemberIfNecessary_conversation_groupUUID_fromHandle_transactionUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDelegatedPendingMemberIfNecessary:conversation:groupUUID:fromHandle:transactionUUID:");
}

id objc_msgSend_handleDeviceUnavailableMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDeviceUnavailableMessageFromHost:");
}

id objc_msgSend_handleDialCallMessageFromClient_destination_device_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDialCallMessageFromClient:destination:device:completion:");
}

id objc_msgSend_handleDisconnectAllCallsMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDisconnectAllCallsMessageFromClient:");
}

id objc_msgSend_handleDisconnectCallMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDisconnectCallMessageFromClient:");
}

id objc_msgSend_handleDisconnectCurrentCallAndActivateHeldMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDisconnectCurrentCallAndActivateHeldMessageFromClient:");
}

id objc_msgSend_handleEncryptedLetMeInRequest_fromHandle_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEncryptedLetMeInRequest:fromHandle:context:");
}

id objc_msgSend_handleEncryptedLetMeInResponse_fromHandle_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEncryptedLetMeInResponse:fromHandle:context:");
}

id objc_msgSend_handleEncryptedMessageWithin_fromHandle_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEncryptedMessageWithin:fromHandle:context:");
}

id objc_msgSend_handleEndActiveAndAnswerMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEndActiveAndAnswerMessageFromClient:");
}

id objc_msgSend_handleEndHeldAndAnswerMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEndHeldAndAnswerMessageFromClient:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleFrequencyChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFrequencyChangedTo:inDirection:forCallsWithUniqueProxyIdentifiers:");
}

id objc_msgSend_handleFrequencyDataChanged_inDirection_forCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFrequencyDataChanged:inDirection:forCalls:");
}

id objc_msgSend_handleGroupCallMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGroupCallMessageFromClient:");
}

id objc_msgSend_handleHardPauseDigitsAvailabilityMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHardPauseDigitsAvailabilityMessageFromHost:");
}

id objc_msgSend_handleHoldActiveAndAnswerMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHoldActiveAndAnswerMessageFromClient:");
}

id objc_msgSend_handleHoldCallMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHoldCallMessageFromClient:");
}

id objc_msgSend_handleIncomingCallMessageFromHost_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingCallMessageFromHost:fromPairedDevice:");
}

id objc_msgSend_handleInvitationMessage_forConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInvitationMessage:forConversation:fromHandle:");
}

id objc_msgSend_handleInvitationMessageForLetMeIn_forConversation_pendingConversation_link_fromHandle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInvitationMessageForLetMeIn:forConversation:pendingConversation:link:fromHandle:");
}

id objc_msgSend_handleInvitationSentMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInvitationSentMessageFromHost:");
}

id objc_msgSend_handleInvocation_synchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInvocation:synchronously:");
}

id objc_msgSend_handleIsDeniedForSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIsDeniedForSharing:");
}

id objc_msgSend_handleLocalApprovalOfMember_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLocalApprovalOfMember:forConversation:");
}

id objc_msgSend_handleLocalRejectionOfMember_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLocalRejectionOfMember:forConversation:");
}

id objc_msgSend_handleLocalRoutesByUniqueIdentifierUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLocalRoutesByUniqueIdentifierUpdated:");
}

id objc_msgSend_handleMessage_forConversation_fromHandle_withUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMessage:forConversation:fromHandle:withUpdate:");
}

id objc_msgSend_handleMeterLevelChanged_inDirection_forCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMeterLevelChanged:inDirection:forCalls:");
}

id objc_msgSend_handleMeterLevelChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMeterLevelChangedTo:inDirection:forCallsWithUniqueProxyIdentifiers:");
}

id objc_msgSend_handleNeedsManualInCallSoundsChangeMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNeedsManualInCallSoundsChangeMessageFromHost:");
}

id objc_msgSend_handleNewPendingMember_responseKey_forConversation_withLink_dateInitiatedLMI_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNewPendingMember:responseKey:forConversation:withLink:dateInitiatedLMI:");
}

id objc_msgSend_handleNicknameUpdateMessage_forConversation_fromHandle_withUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNicknameUpdateMessage:forConversation:fromHandle:withUpdate:");
}

id objc_msgSend_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotificationName:forCallWithUniqueProxyIdentifier:userInfo:");
}

id objc_msgSend_handleOngoingConversationMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOngoingConversationMessageFromHost:");
}

id objc_msgSend_handlePINCodeEnteredSuccessfully_canceled_fromDevice_isPrimaryDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePINCodeEnteredSuccessfully:canceled:fromDevice:isPrimaryDevice:");
}

id objc_msgSend_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePairedHostDeviceRoutesByUniqueIdentifierUpdated:");
}

id objc_msgSend_handleParticipantWithIdentifier_leftConversationWithGroupUUID_fromHandle_withGroupSessionUpdate_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "handleParticipantWithIdentifier:leftConversationWithGroupUUID:fromHandle:withGroupSessionUpdate:");
}

id objc_msgSend_handleParticipants_joinedConversationWithUpdate_joinContext_fromHandle_isFromPendingMessage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "handleParticipants:joinedConversationWithUpdate:joinContext:fromHandle:isFromPendingMessage:");
}

id objc_msgSend_handlePickRouteMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePickRouteMessageFromClient:");
}

id objc_msgSend_handlePlayDTMFToneForKeyMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePlayDTMFToneForKeyMessage:");
}

id objc_msgSend_handlePullHostedCallsMessageFromClient_destination_fromPairedDevice_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePullHostedCallsMessageFromClient:destination:fromPairedDevice:completion:");
}

id objc_msgSend_handlePullRelayingCallsMessageFromHost_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePullRelayingCallsMessageFromHost:fromPairedDevice:");
}

id objc_msgSend_handlePushHostedCallsMessageFromHost_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushHostedCallsMessageFromHost:completion:");
}

id objc_msgSend_handlePushRelayingCallsMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushRelayingCallsMessageFromClient:");
}

id objc_msgSend_handleReceivedCallDTMFUpdate_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedCallDTMFUpdate:forCall:");
}

id objc_msgSend_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedCallDTMFUpdate:forCallWithUniqueProxyIdentifier:");
}

id objc_msgSend_handleReceivedDTMFUpdateMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedDTMFUpdateMessageFromHost:");
}

id objc_msgSend_handleReceivedLMIDelegateMessage_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedLMIDelegateMessage:fromHandle:");
}

id objc_msgSend_handleReceivedLetMeInRequest_toPseudonym_fromHandle_responseKeyData_dateInitiated_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedLetMeInRequest:toPseudonym:fromHandle:responseKeyData:dateInitiated:");
}

id objc_msgSend_handleReceivedLetMeInResponse_pendingConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedLetMeInResponse:pendingConversation:fromHandle:");
}

id objc_msgSend_handleReceivedLinkCreatedOrChangedMessage_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedLinkCreatedOrChangedMessage:fromHandle:");
}

id objc_msgSend_handleReceivedLinkInvalidatedMessage_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedLinkInvalidatedMessage:fromHandle:");
}

id objc_msgSend_handleReceivedUpdateJoinedMetadataMessage_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedUpdateJoinedMetadataMessage:fromHandle:");
}

id objc_msgSend_handleReceivedVideoUpgradeMessage_forConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedVideoUpgradeMessage:forConversation:fromHandle:");
}

id objc_msgSend_handleRemoteApprovalOfMember_forConversation_from_transactionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteApprovalOfMember:forConversation:from:transactionUUID:");
}

id objc_msgSend_handleRemoteRejectionOfMember_forConversation_from_transactionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteRejectionOfMember:forConversation:from:transactionUUID:");
}

id objc_msgSend_handleRemoveMembersMessage_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoveMembersMessage:forConversation:");
}

id objc_msgSend_handleRemovedLinkDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemovedLinkDescriptors:");
}

id objc_msgSend_handleRequestActionMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRequestActionMessage:");
}

id objc_msgSend_handleRequestCallContextMessageFromClient_fromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRequestCallContextMessageFromClient:fromDevice:");
}

id objc_msgSend_handleRequestedAnswerMessage_withBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRequestedAnswerMessage:withBehavior:");
}

id objc_msgSend_handleResetStateMessageFromHost_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResetStateMessageFromHost:fromPairedDevice:");
}

id objc_msgSend_handleResetWantsHoldMusicFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResetWantsHoldMusicFromHost:");
}

id objc_msgSend_handleRespondedElsewhereMessage_forConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRespondedElsewhereMessage:forConversation:fromHandle:");
}

id objc_msgSend_handleRespondedElsewhereMessage_forConversation_fromHandle_withAliases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRespondedElsewhereMessage:forConversation:fromHandle:withAliases:");
}

id objc_msgSend_handleSendHardPauseDigitsMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSendHardPauseDigitsMessageFromClient:");
}

id objc_msgSend_handleSetTTYTypeMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetTTYTypeMessage:");
}

id objc_msgSend_handleSetUplinkMutedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetUplinkMutedMessage:");
}

id objc_msgSend_handleSuppressRingtoneMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSuppressRingtoneMessage:");
}

id objc_msgSend_handleSwapCallsMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSwapCallsMessageFromClient:");
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _[a1 handleType];
}

id objc_msgSend_handleTypeForTUHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTypeForTUHandle:");
}

id objc_msgSend_handleUIXPCEndpointChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUIXPCEndpointChanged:");
}

id objc_msgSend_handleUngroupCallMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUngroupCallMessageFromClient:");
}

id objc_msgSend_handleUnholdCallMessageFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUnholdCallMessageFromClient:");
}

id objc_msgSend_handleUpdateCallContextAvailableMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateCallContextAvailableMessageFromHost:");
}

id objc_msgSend_handleUpdateCallDisplayContextMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateCallDisplayContextMessageFromHost:");
}

id objc_msgSend_handleUpdateCallModelMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateCallModelMessageFromHost:");
}

id objc_msgSend_handleUpdateConversationsMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateConversationsMessageFromHost:");
}

id objc_msgSend_handleUpdateFailureExpectedMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateFailureExpectedMessageFromHost:");
}

id objc_msgSend_handleUpdateRemoteCallStateMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateRemoteCallStateMessageFromHost:");
}

id objc_msgSend_handleUpdateRemoteUplinkMutedMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateRemoteUplinkMutedMessageFromHost:");
}

id objc_msgSend_handleUpdateRoutesMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateRoutesMessageFromHost:");
}

id objc_msgSend_handleUpdateSupportsDTMFUpdatesMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateSupportsDTMFUpdatesMessageFromHost:");
}

id objc_msgSend_handleUpdateSupportsEmergencyFallbackMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateSupportsEmergencyFallbackMessageFromHost:");
}

id objc_msgSend_handleUpdateSupportsTTYWithVoiceMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateSupportsTTYWithVoiceMessageFromHost:");
}

id objc_msgSend_handleUpdateSystemVolumeMessageFromHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdateSystemVolumeMessageFromHost:");
}

id objc_msgSend_handleUpdatedPairedHostDeviceRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdatedPairedHostDeviceRoutes:");
}

id objc_msgSend_handleUpdatedPropertiesAfterChangesInBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdatedPropertiesAfterChangesInBlock:");
}

id objc_msgSend_handleUpgradeMessage_forConversation_fromHandle_withUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpgradeMessage:forConversation:fromHandle:withUpdate:");
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithDestinationID:");
}

id objc_msgSend_handleWithTUHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithTUHandle:");
}

id objc_msgSend_handleWithTULabeledHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithTULabeledHandle:");
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return _[a1 handles];
}

id objc_msgSend_handlesToInviteAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesToInviteAtIndex:");
}

id objc_msgSend_handlesToInvites(void *a1, const char *a2, ...)
{
  return _[a1 handlesToInvites];
}

id objc_msgSend_handlesToInvitesCount(void *a1, const char *a2, ...)
{
  return _[a1 handlesToInvitesCount];
}

id objc_msgSend_handoffActivity(void *a1, const char *a2, ...)
{
  return _[a1 handoffActivity];
}

id objc_msgSend_handoffActivityUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 handoffActivityUserInfo];
}

id objc_msgSend_handoffContext(void *a1, const char *a2, ...)
{
  return _[a1 handoffContext];
}

id objc_msgSend_handoffDynamicIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 handoffDynamicIdentifier];
}

id objc_msgSend_handoffEligibility(void *a1, const char *a2, ...)
{
  return _[a1 handoffEligibility];
}

id objc_msgSend_handoffIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 handoffIdentifier];
}

id objc_msgSend_handoffIdentifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handoffIdentifierAtIndex:");
}

id objc_msgSend_handoffIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 handoffIdentifiers];
}

id objc_msgSend_handoffIdentifiersCount(void *a1, const char *a2, ...)
{
  return _[a1 handoffIdentifiersCount];
}

id objc_msgSend_handoffRecipientParticipant(void *a1, const char *a2, ...)
{
  return _[a1 handoffRecipientParticipant];
}

id objc_msgSend_handoffReportReceived_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handoffReportReceived:forConversation:");
}

id objc_msgSend_handoffUPlusOneLeaveDelay(void *a1, const char *a2, ...)
{
  return _[a1 handoffUPlusOneLeaveDelay];
}

id objc_msgSend_handoffUPlusOneLeaveTimeout(void *a1, const char *a2, ...)
{
  return _[a1 handoffUPlusOneLeaveTimeout];
}

id objc_msgSend_hardPauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 hardPauseDigits];
}

id objc_msgSend_hardPauseDigitsState(void *a1, const char *a2, ...)
{
  return _[a1 hardPauseDigitsState];
}

id objc_msgSend_hardPauseState(void *a1, const char *a2, ...)
{
  return _[a1 hardPauseState];
}

id objc_msgSend_hasActionDescription(void *a1, const char *a2, ...)
{
  return _[a1 hasActionDescription];
}

id objc_msgSend_hasActiveAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 hasActiveAudioSession];
}

id objc_msgSend_hasAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAlias:");
}

id objc_msgSend_hasAudioInterruption(void *a1, const char *a2, ...)
{
  return _[a1 hasAudioInterruption];
}

id objc_msgSend_hasAvMode(void *a1, const char *a2, ...)
{
  return _[a1 hasAvMode];
}

id objc_msgSend_hasBeenExpiredForAtLeast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenExpiredForAtLeast:");
}

id objc_msgSend_hasBeenRedirected(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenRedirected];
}

id objc_msgSend_hasBeenUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenUnlockedSinceBoot];
}

id objc_msgSend_hasBeenUnlockedSinceBootBlock(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenUnlockedSinceBootBlock];
}

id objc_msgSend_hasCallStartedConnectingWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCallStartedConnectingWithUUID:");
}

id objc_msgSend_hasCalledStop(void *a1, const char *a2, ...)
{
  return _[a1 hasCalledStop];
}

id objc_msgSend_hasCellularSettingsRemediation(void *a1, const char *a2, ...)
{
  return _[a1 hasCellularSettingsRemediation];
}

id objc_msgSend_hasCleanedUp(void *a1, const char *a2, ...)
{
  return _[a1 hasCleanedUp];
}

id objc_msgSend_hasCompletedDescription(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedDescription];
}

id objc_msgSend_hasConnected(void *a1, const char *a2, ...)
{
  return _[a1 hasConnected];
}

id objc_msgSend_hasContextIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hasContextIdentifier];
}

id objc_msgSend_hasConversationGroupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 hasConversationGroupUUIDString];
}

id objc_msgSend_hasConversationID(void *a1, const char *a2, ...)
{
  return _[a1 hasConversationID];
}

id objc_msgSend_hasCreationDateEpochTime(void *a1, const char *a2, ...)
{
  return _[a1 hasCreationDateEpochTime];
}

id objc_msgSend_hasCurrentCalls(void *a1, const char *a2, ...)
{
  return _[a1 hasCurrentCalls];
}

id objc_msgSend_hasCurrentVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 hasCurrentVideoCalls];
}

id objc_msgSend_hasDateAndTimeSettingsRemediation(void *a1, const char *a2, ...)
{
  return _[a1 hasDateAndTimeSettingsRemediation];
}

id objc_msgSend_hasDtmfUpdateDigits(void *a1, const char *a2, ...)
{
  return _[a1 hasDtmfUpdateDigits];
}

id objc_msgSend_hasEmergencyVideoStream(void *a1, const char *a2, ...)
{
  return _[a1 hasEmergencyVideoStream];
}

id objc_msgSend_hasEnclosedEncryptedType(void *a1, const char *a2, ...)
{
  return _[a1 hasEnclosedEncryptedType];
}

id objc_msgSend_hasEncryptedMessage(void *a1, const char *a2, ...)
{
  return _[a1 hasEncryptedMessage];
}

id objc_msgSend_hasEnded(void *a1, const char *a2, ...)
{
  return _[a1 hasEnded];
}

id objc_msgSend_hasGeneratorDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 hasGeneratorDescriptor];
}

id objc_msgSend_hasGeneratorID(void *a1, const char *a2, ...)
{
  return _[a1 hasGeneratorID];
}

id objc_msgSend_hasGeneratorVersion(void *a1, const char *a2, ...)
{
  return _[a1 hasGeneratorVersion];
}

id objc_msgSend_hasGroupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 hasGroupUUIDString];
}

id objc_msgSend_hasGuestModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hasGuestModeEnabled];
}

id objc_msgSend_hasHandleType(void *a1, const char *a2, ...)
{
  return _[a1 hasHandleType];
}

id objc_msgSend_hasIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hasIdentifier];
}

id objc_msgSend_hasIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIdentifier:");
}

id objc_msgSend_hasImage(void *a1, const char *a2, ...)
{
  return _[a1 hasImage];
}

id objc_msgSend_hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch(void *a1, const char *a2, ...)
{
  return _[a1 hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch];
}

id objc_msgSend_hasInEarRouteInTipiWithCompanionWatch(void *a1, const char *a2, ...)
{
  return _[a1 hasInEarRouteInTipiWithCompanionWatch];
}

id objc_msgSend_hasIsActivated(void *a1, const char *a2, ...)
{
  return _[a1 hasIsActivated];
}

id objc_msgSend_hasIsLetMeInApproved(void *a1, const char *a2, ...)
{
  return _[a1 hasIsLetMeInApproved];
}

id objc_msgSend_hasJoined(void *a1, const char *a2, ...)
{
  return _[a1 hasJoined];
}

id objc_msgSend_hasLink(void *a1, const char *a2, ...)
{
  return _[a1 hasLink];
}

id objc_msgSend_hasLinkName(void *a1, const char *a2, ...)
{
  return _[a1 hasLinkName];
}

id objc_msgSend_hasListenerForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasListenerForID:");
}

id objc_msgSend_hasLocationSettingsRemediation(void *a1, const char *a2, ...)
{
  return _[a1 hasLocationSettingsRemediation];
}

id objc_msgSend_hasMessagesGroupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 hasMessagesGroupUUIDString];
}

id objc_msgSend_hasNickname(void *a1, const char *a2, ...)
{
  return _[a1 hasNickname];
}

id objc_msgSend_hasNotificationStyles(void *a1, const char *a2, ...)
{
  return _[a1 hasNotificationStyles];
}

id objc_msgSend_hasOngoingDescription(void *a1, const char *a2, ...)
{
  return _[a1 hasOngoingDescription];
}

id objc_msgSend_hasOptions(void *a1, const char *a2, ...)
{
  return _[a1 hasOptions];
}

id objc_msgSend_hasOriginatorHandle(void *a1, const char *a2, ...)
{
  return _[a1 hasOriginatorHandle];
}

id objc_msgSend_hasPaddingForHashedValue(void *a1, const char *a2, ...)
{
  return _[a1 hasPaddingForHashedValue];
}

id objc_msgSend_hasParticipantAssociation(void *a1, const char *a2, ...)
{
  return _[a1 hasParticipantAssociation];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasPresentationMode(void *a1, const char *a2, ...)
{
  return _[a1 hasPresentationMode];
}

id objc_msgSend_hasPrivateKey(void *a1, const char *a2, ...)
{
  return _[a1 hasPrivateKey];
}

id objc_msgSend_hasProtoProvider(void *a1, const char *a2, ...)
{
  return _[a1 hasProtoProvider];
}

id objc_msgSend_hasProtoUpgradeSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 hasProtoUpgradeSessionUUID];
}

id objc_msgSend_hasProtoVideo(void *a1, const char *a2, ...)
{
  return _[a1 hasProtoVideo];
}

id objc_msgSend_hasProtoWantsVideo(void *a1, const char *a2, ...)
{
  return _[a1 hasProtoWantsVideo];
}

id objc_msgSend_hasPseudonymExpirationDateEpochTime(void *a1, const char *a2, ...)
{
  return _[a1 hasPseudonymExpirationDateEpochTime];
}

id objc_msgSend_hasQueuedHardPauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 hasQueuedHardPauseDigits];
}

id objc_msgSend_hasReceivedAccept(void *a1, const char *a2, ...)
{
  return _[a1 hasReceivedAccept];
}

id objc_msgSend_hasReceivedLetMeInRequest(void *a1, const char *a2, ...)
{
  return _[a1 hasReceivedLetMeInRequest];
}

id objc_msgSend_hasRelaySupport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRelaySupport:");
}

id objc_msgSend_hasRequestBlobRecoveryOptions(void *a1, const char *a2, ...)
{
  return _[a1 hasRequestBlobRecoveryOptions];
}

id objc_msgSend_hasRestrictionsInRetailEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 hasRestrictionsInRetailEnvironment];
}

id objc_msgSend_hasSceneAssociationBehavior(void *a1, const char *a2, ...)
{
  return _[a1 hasSceneAssociationBehavior];
}

id objc_msgSend_hasScreenSharingRequest(void *a1, const char *a2, ...)
{
  return _[a1 hasScreenSharingRequest];
}

id objc_msgSend_hasSentInvitation(void *a1, const char *a2, ...)
{
  return _[a1 hasSentInvitation];
}

id objc_msgSend_hasSet(void *a1, const char *a2, ...)
{
  return _[a1 hasSet];
}

id objc_msgSend_hasSourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hasSourceIdentifier];
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return _[a1 hasStarted];
}

id objc_msgSend_hasStartedConnecting(void *a1, const char *a2, ...)
{
  return _[a1 hasStartedConnecting];
}

id objc_msgSend_hasStartedOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 hasStartedOutgoing];
}

id objc_msgSend_hasSystemVolume(void *a1, const char *a2, ...)
{
  return _[a1 hasSystemVolume];
}

id objc_msgSend_hasTimestampAsTimeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 hasTimestampAsTimeIntervalSinceReferenceDate];
}

id objc_msgSend_hasType(void *a1, const char *a2, ...)
{
  return _[a1 hasType];
}

id objc_msgSend_hasVideo(void *a1, const char *a2, ...)
{
  return _[a1 hasVideo];
}

id objc_msgSend_hasVideoEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hasVideoEnabled];
}

id objc_msgSend_hasWiFiSettingsRemediation(void *a1, const char *a2, ...)
{
  return _[a1 hasWiFiSettingsRemediation];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashForParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashForParticipantIdentifier:");
}

id objc_msgSend_hold(void *a1, const char *a2, ...)
{
  return _[a1 hold];
}

id objc_msgSend_holdActiveAndAnswerCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdActiveAndAnswerCall:");
}

id objc_msgSend_holdAllowed(void *a1, const char *a2, ...)
{
  return _[a1 holdAllowed];
}

id objc_msgSend_holdCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdCall:");
}

id objc_msgSend_holdCalls_whileUnholdingCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdCalls:whileUnholdingCalls:");
}

id objc_msgSend_holdOrEndOtherCallsBecauseCallWillBeginOutgoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdOrEndOtherCallsBecauseCallWillBeginOutgoing:");
}

id objc_msgSend_hostCallCreationTime(void *a1, const char *a2, ...)
{
  return _[a1 hostCallCreationTime];
}

id objc_msgSend_hostIDSIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hostIDSIdentifier];
}

id objc_msgSend_hostMessagingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 hostMessagingDelegate];
}

id objc_msgSend_hostOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 hostOnCurrentDevice];
}

id objc_msgSend_hostedOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 hostedOnCurrentDevice];
}

id objc_msgSend_iCloudAccount(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccount];
}

id objc_msgSend_iMessageService(void *a1, const char *a2, ...)
{
  return _[a1 iMessageService];
}

id objc_msgSend_iconTemplateImageData(void *a1, const char *a2, ...)
{
  return _[a1 iconTemplateImageData];
}

id objc_msgSend_idQueryController(void *a1, const char *a2, ...)
{
  return _[a1 idQueryController];
}

id objc_msgSend_identificationCategory(void *a1, const char *a2, ...)
{
  return _[a1 identificationCategory];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 identifierUUIDString];
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_identifiersForSessionInvitationWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiersForSessionInvitationWithMessage:");
}

id objc_msgSend_identifiersWaitingForAcknowledgement(void *a1, const char *a2, ...)
{
  return _[a1 identifiersWaitingForAcknowledgement];
}

id objc_msgSend_identifiersWithPendingCoalescingBlocks(void *a1, const char *a2, ...)
{
  return _[a1 identifiersWithPendingCoalescingBlocks];
}

id objc_msgSend_identities(void *a1, const char *a2, ...)
{
  return _[a1 identities];
}

id objc_msgSend_idsDestination(void *a1, const char *a2, ...)
{
  return _[a1 idsDestination];
}

id objc_msgSend_idsDestinationForActiveParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDestinationForActiveParticipant:");
}

id objc_msgSend_idsDestinations(void *a1, const char *a2, ...)
{
  return _[a1 idsDestinations];
}

id objc_msgSend_idsDeviceFromUniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceFromUniqueID:");
}

id objc_msgSend_idsFromID(void *a1, const char *a2, ...)
{
  return _[a1 idsFromID];
}

id objc_msgSend_idsPeersForHandle_video_fromID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsPeersForHandle:video:fromID:completionHandler:");
}

id objc_msgSend_idsQueryController(void *a1, const char *a2, ...)
{
  return _[a1 idsQueryController];
}

id objc_msgSend_idsReportsReceived_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsReportsReceived:forConversation:");
}

id objc_msgSend_idsReportsReceived_forSessionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsReportsReceived:forSessionWithUUID:");
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return _[a1 idsService];
}

id objc_msgSend_idsSession(void *a1, const char *a2, ...)
{
  return _[a1 idsSession];
}

id objc_msgSend_ignoreLMIRequests(void *a1, const char *a2, ...)
{
  return _[a1 ignoreLMIRequests];
}

id objc_msgSend_ignoresBluetoothDeviceUID(void *a1, const char *a2, ...)
{
  return _[a1 ignoresBluetoothDeviceUID];
}

id objc_msgSend_imAccountForActionBlock(void *a1, const char *a2, ...)
{
  return _[a1 imAccountForActionBlock];
}

id objc_msgSend_imHandleWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imHandleWithID:");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _[a1 imageData];
}

id objc_msgSend_imageTranscoder(void *a1, const char *a2, ...)
{
  return _[a1 imageTranscoder];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_imageURLForCXSandboxExtendedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURLForCXSandboxExtendedURL:");
}

id objc_msgSend_inCallSoundRegion(void *a1, const char *a2, ...)
{
  return _[a1 inCallSoundRegion];
}

id objc_msgSend_inFrequencyLevel(void *a1, const char *a2, ...)
{
  return _[a1 inFrequencyLevel];
}

id objc_msgSend_inProcess_isCallingSupported(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inProcess_isCallingSupported");
}

id objc_msgSend_includesCallsInRecents(void *a1, const char *a2, ...)
{
  return _[a1 includesCallsInRecents];
}

id objc_msgSend_incomingCallAndNotificationInvitationPreferences(void *a1, const char *a2, ...)
{
  return _[a1 incomingCallAndNotificationInvitationPreferences];
}

id objc_msgSend_incomingCallFilter(void *a1, const char *a2, ...)
{
  return _[a1 incomingCallFilter];
}

id objc_msgSend_incomingCallInvitationPreferences(void *a1, const char *a2, ...)
{
  return _[a1 incomingCallInvitationPreferences];
}

id objc_msgSend_incomingChatGenerator(void *a1, const char *a2, ...)
{
  return _[a1 incomingChatGenerator];
}

id objc_msgSend_incomingPendingConversationsByGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 incomingPendingConversationsByGroupUUID];
}

id objc_msgSend_incomingPendingMessageGUIDs(void *a1, const char *a2, ...)
{
  return _[a1 incomingPendingMessageGUIDs];
}

id objc_msgSend_incomingScreenShareRequestFromParticipant_handleEligibilityBlock_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incomingScreenShareRequestFromParticipant:handleEligibilityBlock:error:");
}

id objc_msgSend_incomingSessionProviderGenerator(void *a1, const char *a2, ...)
{
  return _[a1 incomingSessionProviderGenerator];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_inflightAVCBlobRecoveryBlocksByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 inflightAVCBlobRecoveryBlocksByIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initAddRemoteMemberMessageWithMembers_otherInvitedHandles_conversationWithUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initAddRemoteMemberMessageWithMembers:otherInvitedHandles:conversationWithUUID:");
}

id objc_msgSend_initAsInitiatorWithSessionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initAsInitiatorWithSessionProvider:");
}

id objc_msgSend_initAsInitiatorWithSessionProvider_identifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initAsInitiatorWithSessionProvider:identifiers:");
}

id objc_msgSend_initAsReceiverWithSessionProvider_remoteDestination_remoteDevice_remoteProtocolVersion_identifiers_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initAsReceiverWithSessionProvider:remoteDestination:remoteDevice:remoteProtocolVersion:identifiers:");
}

id objc_msgSend_initAsReceiverWithSessionProvider_remoteFromID_remoteProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initAsReceiverWithSessionProvider:remoteFromID:remoteProtocolVersion:");
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initForReadingWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingWithError:");
}

id objc_msgSend_initIncomingWithBackingCallSource_UUID_update_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initIncomingWithBackingCallSource:UUID:update:");
}

id objc_msgSend_initIncomingWithSession_remoteHandle_wantsVideo_remoteInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initIncomingWithSession:remoteHandle:wantsVideo:remoteInviteDictionary:");
}

id objc_msgSend_initOutgoingRequestWithScreenSharingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingRequestWithScreenSharingRequest:");
}

id objc_msgSend_initOutgoingTo_isVideo_isRelayed_GUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingTo:isVideo:isRelayed:GUID:");
}

id objc_msgSend_initOutgoingWithDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingWithDialRequest:");
}

id objc_msgSend_initOutgoingWithJoinConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingWithJoinConversationRequest:");
}

id objc_msgSend_initOutgoingWithRequestedStartCallAction_backingCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingWithRequestedStartCallAction:backingCallSource:");
}

id objc_msgSend_initOutgoingWithSession_UUID_remoteHandle_wantsVideo_isRelaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingWithSession:UUID:remoteHandle:wantsVideo:isRelaying:");
}

id objc_msgSend_initOutgoingWithUniqueProxyIdentifier_backingCallSourceIdentifier_callUpdate_isVideo_endpointOnCurrentDevice_originatingUIType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice: originatingUIType:");
}

id objc_msgSend_initOutgoingWithUniqueProxyIdentifier_backingCallSourceIdentifier_callUpdate_isVideo_endpointOnCurrentDevice_originatingUIType_configuration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice: originatingUIType:configuration:");
}

id objc_msgSend_initOutgoingWithUpdate_callUUID_backingCallSource_isExpanseProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOutgoingWithUpdate:callUUID:backingCallSource:isExpanseProvider:");
}

id objc_msgSend_initWithAVCRequest_session_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAVCRequest:session:");
}

id objc_msgSend_initWithAccount_destinations_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:destinations:options:");
}

id objc_msgSend_initWithAccount_destinations_transportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:destinations:transportType:");
}

id objc_msgSend_initWithAccount_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:");
}

id objc_msgSend_initWithAccountID_primaryDeviceID_phoneNumberURI_availableDeviceSlots_allowedSecondaryDeviceIDs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:");
}

id objc_msgSend_initWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAction:");
}

id objc_msgSend_initWithActivity_locallyInitiated_timestamp_isFirstJoin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivity:locallyInitiated:timestamp:isFirstJoin:");
}

id objc_msgSend_initWithActivity_uuid_locallyInitiated_timestamp_isFirstJoin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:");
}

id objc_msgSend_initWithActivitySessionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivitySessionManager:");
}

id objc_msgSend_initWithApplicationController_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithApplicationController:queue:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAssetId_mediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetId:mediaType:");
}

id objc_msgSend_initWithAvailability_photoRequestSuccessCount_photoRequestFailureCount_medianRequestDuration_meanRequestDuration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithAvailability:photoRequestSuccessCount:photoRequestFailureCount:medianRequestDuration:meanRequestDuration:");
}

id objc_msgSend_initWithAvailability_supportedMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAvailability:supportedMediaTypes:");
}

id objc_msgSend_initWithBundleIDs_states_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIDs:states:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_metadata_applicationContext_activityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:metadata:applicationContext:activityIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_metadata_applicationContext_uuid_activityIdentifier_fallbackApplicationName_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:");
}

id objc_msgSend_initWithCHManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCHManager:");
}

id objc_msgSend_initWithCHManager_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCHManager:queue:");
}

id objc_msgSend_initWithCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCall:");
}

id objc_msgSend_initWithCall_contactIdentifier_serialQueue_cacheOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCall:contactIdentifier:serialQueue:cacheOnly:");
}

id objc_msgSend_initWithCallCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCapabilitiesState:");
}

id objc_msgSend_initWithCallCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCenter:");
}

id objc_msgSend_initWithCallCenter_featureFlags_serverBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCenter:featureFlags:serverBag:");
}

id objc_msgSend_initWithCallCenterObserver_transactionManager_queue_chManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCenterObserver:transactionManager:queue:chManager:");
}

id objc_msgSend_initWithCallDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallDisplayContext:");
}

id objc_msgSend_initWithCallFilterController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallFilterController:");
}

id objc_msgSend_initWithCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallSource:");
}

id objc_msgSend_initWithCallSource_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallSource:configuration:");
}

id objc_msgSend_initWithCallSource_queue_chManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallSource:queue:chManager:");
}

id objc_msgSend_initWithCallSource_queue_featureFlags_blockUtilities_shouldUseIDSDemuxer_chManager_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallSource:queue:featureFlags:blockUtilities:shouldUseIDSDemuxer:chManager:");
}

id objc_msgSend_initWithCallSource_withCallUpdate_withProvider_callUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallSource:withCallUpdate:withProvider:callUUID:");
}

id objc_msgSend_initWithCallStateController_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallStateController:queue:");
}

id objc_msgSend_initWithCallStateController_queue_coreTelephonyClient_chManager_callSourceManager_protectedAppsUtilities_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithCallStateController:queue:coreTelephonyClient:chManager:callSourceManager:protectedAppsUtilities:");
}

id objc_msgSend_initWithCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:");
}

id objc_msgSend_initWithCallUUID_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:attributes:");
}

id objc_msgSend_initWithCallUUID_callUUIDToGroupWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:callUUIDToGroupWith:");
}

id objc_msgSend_initWithCallUUID_digits_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:digits:type:");
}

id objc_msgSend_initWithCallUUID_groupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:groupUUID:");
}

id objc_msgSend_initWithCallUUID_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:handle:");
}

id objc_msgSend_initWithCallUUID_muted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:muted:");
}

id objc_msgSend_initWithCallUUID_muted_bottomUpMute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:muted:bottomUpMute:");
}

id objc_msgSend_initWithCallUUID_onHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:onHold:");
}

id objc_msgSend_initWithCallUUID_relaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:relaying:");
}

id objc_msgSend_initWithCallUUID_screening_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:screening:");
}

id objc_msgSend_initWithCallUUID_sendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:sendingVideo:");
}

id objc_msgSend_initWithCallUUID_sharingScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:sharingScreen:");
}

id objc_msgSend_initWithCallUUID_ttyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:ttyType:");
}

id objc_msgSend_initWithCallUUID_videoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:videoEnabled:");
}

id objc_msgSend_initWithCallUUID_videoPresentationSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:videoPresentationSize:");
}

id objc_msgSend_initWithCallUUID_videoPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:videoPresentationState:");
}

id objc_msgSend_initWithCallUUID_willInject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallUUID:willInject:");
}

id objc_msgSend_initWithCapabilities_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapabilities:queue:");
}

id objc_msgSend_initWithCapabilityInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapabilityInfo:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCategory_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:mode:");
}

id objc_msgSend_initWithCategory_mode_routeManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:mode:routeManager:");
}

id objc_msgSend_initWithClientUUID_serialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientUUID:serialQueue:");
}

id objc_msgSend_initWithClientUUID_transportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientUUID:transportType:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_callSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:callSource:");
}

id objc_msgSend_initWithConnection_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:queue:");
}

id objc_msgSend_initWithContactsDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactsDataSource:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContext_linkMetadata_fallbackURL_invitationURL_supportsContinuationOnTV_title_subTitle_imageData_preferredBroadcastingAttributes_sceneAssociationBehavior_supportsActivityPreviews_lifetimePolicy_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:pref erredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:");
}

id objc_msgSend_initWithContextIdentifier_actionDescription_ongoingDescription_completedDescription_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextIdentifier:actionDescription:ongoingDescription:completedDescription:");
}

id objc_msgSend_initWithConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversation:");
}

id objc_msgSend_initWithConversation_idsGroupSession_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversation:idsGroupSession:queue:");
}

id objc_msgSend_initWithConversation_originatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversation:originatingUIType:");
}

id objc_msgSend_initWithConversation_startDate_avMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversation:startDate:avMode:");
}

id objc_msgSend_initWithConversationID_padding_timebase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationID:padding:timebase:");
}

id objc_msgSend_initWithConversationLink_localMember_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationLink:localMember:queue:");
}

id objc_msgSend_initWithConversationManager_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationManager:featureFlags:");
}

id objc_msgSend_initWithConversationManager_queue_invitationResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationManager:queue:invitationResolver:");
}

id objc_msgSend_initWithConversationProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationProviderManager:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDataSource_deviceLockObserver_callCenterObserver_callDirectoryStoreBuilder_callDirectoryManager_contactStore_queue_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithDataSource:deviceLockObserver:callCenterObserver:callDirectoryStoreBuilder:callDirectoryManager:contactStore:queue:");
}

id objc_msgSend_initWithDataSource_parentQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:parentQueue:");
}

id objc_msgSend_initWithDataSource_queue_appPolicyManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:queue:appPolicyManager:");
}

id objc_msgSend_initWithDataSource_serialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:serialQueue:");
}

id objc_msgSend_initWithDataSource_serialQueue_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:serialQueue:featureFlags:");
}

id objc_msgSend_initWithDataSources_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSources:queue:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:delegateQueue:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDelegate_queue_videoEnabled_oneToOneModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:videoEnabled:oneToOneModeEnabled:");
}

id objc_msgSend_initWithDelegate_withConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:withConfig:");
}

id objc_msgSend_initWithDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDescriptor:");
}

id objc_msgSend_initWithDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestination:");
}

id objc_msgSend_initWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestinationID:");
}

id objc_msgSend_initWithDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDialRequest:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDigits:");
}

id objc_msgSend_initWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDigits:countryCode:");
}

id objc_msgSend_initWithDigits_isHardPause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDigits:isHardPause:");
}

id objc_msgSend_initWithDisplayContext_call_serialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayContext:call:serialQueue:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEncryptedMessage_enclosedType_link_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEncryptedMessage:enclosedType:link:");
}

id objc_msgSend_initWithExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExportedObject:");
}

id objc_msgSend_initWithFaceTimeIDSChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFaceTimeIDSChat:");
}

id objc_msgSend_initWithFaceTimeInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFaceTimeInviteDictionary:");
}

id objc_msgSend_initWithFeatureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureFlags:");
}

id objc_msgSend_initWithFirstUnlockObserver_whenUnlockedObserver_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstUnlockObserver:whenUnlockedObserver:queue:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithGroupID_participantDestinationIDs_callerID_account_queue_isOneToOneModeEnabled_isLightweightMember_avLess_isScreenSharingRequest_ABTestConfiguration_isInitiator_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithGroupID:participantDestinationIDs:callerID:account:queue:isOneToOneModeEnabled:isLightweightMember:av Less:isScreenSharingRequest:ABTestConfiguration:isInitiator:");
}

id objc_msgSend_initWithGroupSessionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupSessionProvider:");
}

id objc_msgSend_initWithGroupSessionProvider_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupSessionProvider:featureFlags:");
}

id objc_msgSend_initWithGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupUUID:");
}

id objc_msgSend_initWithGroupUUID_originator_pseudonym_publicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupUUID:originator:pseudonym:publicKey:");
}

id objc_msgSend_initWithHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:");
}

id objc_msgSend_initWithHandle_label_isSuggested_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:label:isSuggested:");
}

id objc_msgSend_initWithHandle_nickname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:nickname:");
}

id objc_msgSend_initWithHandle_nickname_joinedFromLetMeIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:nickname:joinedFromLetMeIn:");
}

id objc_msgSend_initWithHandle_shareMyScreen_originType_shouldSendLegacyInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:shareMyScreen:originType:shouldSendLegacyInvite:");
}

id objc_msgSend_initWithHandle_tokenPrefixedURI_data_encryptedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:tokenPrefixedURI:data:encryptedData:");
}

id objc_msgSend_initWithHandle_type_originType_UUID_participantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:type:originType:UUID:participantIdentifier:");
}

id objc_msgSend_initWithHandleType_notificationStyles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandleType:notificationStyles:");
}

id objc_msgSend_initWithHandoffActivityUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandoffActivityUserInfo:");
}

id objc_msgSend_initWithHandoffContext_backingCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandoffContext:backingCallSource:");
}

id objc_msgSend_initWithHandoffIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandoffIdentifier:");
}

id objc_msgSend_initWithIDSChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSChat:");
}

id objc_msgSend_initWithIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSDevice:");
}

id objc_msgSend_initWithIMAVChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIMAVChat:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_bundleIdentifier_fallbackLocalizedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:bundleIdentifier:fallbackLocalizedName:");
}

id objc_msgSend_initWithIdentifier_groupUUID_activities_applicationController_delegate_queue_systemStateObserver_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIdentifier:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:");
}

id objc_msgSend_initWithIdentifier_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:handle:");
}

id objc_msgSend_initWithIdentifier_handle_avcData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:handle:avcData:");
}

id objc_msgSend_initWithIdentifier_handle_avcData_senderCorrelationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:handle:avcData:senderCorrelationIdentifier:");
}

id objc_msgSend_initWithIdentifier_handle_senderCorrelationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:handle:senderCorrelationIdentifier:");
}

id objc_msgSend_initWithIdentifier_pluginName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:pluginName:");
}

id objc_msgSend_initWithIdentifier_revision_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:revision:handle:");
}

id objc_msgSend_initWithIdentifier_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:version:");
}

id objc_msgSend_initWithIdsService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdsService:");
}

id objc_msgSend_initWithInputURL_outputURL_identifier_operation_completionBlock_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputURL:outputURL:identifier:operation:completionBlock:queue:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithJoinConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJoinConversationRequest:");
}

id objc_msgSend_initWithLeaveReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLeaveReason:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithManager:");
}

id objc_msgSend_initWithMetadata_applicationContext_uuid_activityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadata:applicationContext:uuid:activityIdentifier:");
}

id objc_msgSend_initWithMoments_remoteIDSDestinations_callCenterObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMoments:remoteIDSDestinations:callCenterObserver:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:error:");
}

id objc_msgSend_initWithName_fileManager_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:fileManager:error:");
}

id objc_msgSend_initWithName_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:service:");
}

id objc_msgSend_initWithName_service_queryController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:service:queryController:");
}

id objc_msgSend_initWithNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationCenter:");
}

id objc_msgSend_initWithNotificationName_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationName:queue:");
}

id objc_msgSend_initWithObject_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:queue:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithParticipantID_data_delegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParticipantID:data:delegate:queue:");
}

id objc_msgSend_initWithPersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonNameComponents:");
}

id objc_msgSend_initWithPhotosAppAssetIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotosAppAssetIdentifier:");
}

id objc_msgSend_initWithPrefixedURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrefixedURI:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProviderIdentifier:");
}

id objc_msgSend_initWithProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProviderManager:");
}

id objc_msgSend_initWithPseudonym_publicKey_groupUUID_originatorHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPseudonym:publicKey:groupUUID:originatorHandle:");
}

id objc_msgSend_initWithPseudonym_publicKey_groupUUID_originatorHandle_creationDate_deletionDate_expirationDate_invitedMemberHandles_locallyCreated_linkName_linkLifetimeScope_deleteReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMember Handles:locallyCreated:linkName:linkLifetimeScope:deleteReason:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_UUID_groupUUID_groupSession_messagesGroupUUID_locallyCreated_localMember_initiator_remoteMembers_pendingMembers_otherInvitedHandles_lightweightMembers_remotePushTokens_activity_link_report_fromStorage_avMode_presentationMode_applicationController_featureFlags_systemStateObserver_applicationPolicyManager_screenSharingRequest_testConfiguration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMember s:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avM ode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSh aringRequest:testConfiguration:");
}

id objc_msgSend_initWithQueue_UUID_groupUUID_groupSession_messagesGroupUUID_locallyCreated_localMember_initiator_remoteMembers_pendingMembers_otherInvitedHandles_lightweightMembers_remotePushTokens_activity_link_report_fromStorage_avMode_presentationMode_applicationController_featureFlags_systemStateObserver_applicationPolicyManager_screenSharingRequest_testConfiguration_isOldMessage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMember s:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avM ode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSh aringRequest:testConfiguration:isOldMessage:");
}

id objc_msgSend_initWithQueue_activityCommunicator_callCenter_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:activityCommunicator:callCenter:featureFlags:");
}

id objc_msgSend_initWithQueue_callContainer_sessionMessenger_localRouteController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:callContainer:sessionMessenger:localRouteController:");
}

id objc_msgSend_initWithQueue_chManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:chManager:");
}

id objc_msgSend_initWithQueue_conversationManager_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:conversationManager:featureFlags:");
}

id objc_msgSend_initWithQueue_conversationManager_networkSupport_serverBag_featureFlags_invitationResolver_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithQueue:conversationManager:networkSupport:serverBag:featureFlags:invitationResolver:");
}

id objc_msgSend_initWithQueue_coreTelephonyClient_emergencyCallbackCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:coreTelephonyClient:emergencyCallbackCapabilities:");
}

id objc_msgSend_initWithQueue_featureFlags_serverBag_chManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:featureFlags:serverBag:chManager:");
}

id objc_msgSend_initWithQueue_fileTransferController_mediaAssetManager_callCenterObserver_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:fileTransferController:mediaAssetManager:callCenterObserver:");
}

id objc_msgSend_initWithQueue_localRouteController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:localRouteController:");
}

id objc_msgSend_initWithQueue_reportingController_persistenceController_linkManager_cpApplicationController_invitationResolver_pendingMembershipTracker_featureFlags_applicationPolicyManager_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithQueue:reportingController:persistenceController:linkManager:cpApplicationController:invitationResolve r:pendingMembershipTracker:featureFlags:applicationPolicyManager:");
}

id objc_msgSend_initWithQueue_shouldRegisterForECBMNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:shouldRegisterForECBMNotification:");
}

id objc_msgSend_initWithRelayInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRelayInviteDictionary:");
}

id objc_msgSend_initWithRelayMessage_outgoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRelayMessage:outgoing:");
}

id objc_msgSend_initWithRelayService_thumperService_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRelayService:thumperService:featureFlags:");
}

id objc_msgSend_initWithRemoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteMembers:");
}

id objc_msgSend_initWithReportingController_cpApplicationController_invitationResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReportingController:cpApplicationController:invitationResolver:");
}

id objc_msgSend_initWithRequiredCapabilities_requiredMissingCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequiredCapabilities:requiredMissingCapabilities:");
}

id objc_msgSend_initWithScreenCaptureAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScreenCaptureAttributes:");
}

id objc_msgSend_initWithSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSenderIdentityUUID:");
}

id objc_msgSend_initWithSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSerialQueue:");
}

id objc_msgSend_initWithSerialQueue_localKeychainItem_pairedHostKeychainItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSerialQueue:localKeychainItem:pairedHostKeychainItem:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithService_account_accessGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:account:accessGroup:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithSession_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:queue:");
}

id objc_msgSend_initWithSession_remoteHandle_wantsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:remoteHandle:wantsVideo:");
}

id objc_msgSend_initWithSessionCreationBlock_transportToken_delegate_queue_reportingHierarchyToken_avMode_videoEnabled_captureSessionCreationBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSessionCreationBlock:transportToken:delegate:queue:reportingHierarchyToken:avMode:videoEnabled:captur eSessionCreationBlock:");
}

id objc_msgSend_initWithSessionProvider_isInitiator_remoteDestination_remoteDevice_remoteProtocolVersion_identifiers_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSessionProvider:isInitiator:remoteDestination:remoteDevice:remoteProtocolVersion:identifiers:");
}

id objc_msgSend_initWithSessionProvider_isInitiator_remoteFromID_remoteProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionProvider:isInitiator:remoteFromID:remoteProtocolVersion:");
}

id objc_msgSend_initWithSessionProvider_isInitiator_remoteProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionProvider:isInitiator:remoteProtocolVersion:");
}

id objc_msgSend_initWithSessionUUID_originator_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionUUID:originator:type:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithSocket_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSocket:");
}

id objc_msgSend_initWithStartCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartCallAction:");
}

id objc_msgSend_initWithStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamToken:");
}

id objc_msgSend_initWithStreamToken_requesterID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamToken:requesterID:");
}

id objc_msgSend_initWithStreamToken_requesterID_delegate_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamToken:requesterID:delegate:dispatchQueue:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTUConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTUConversation:");
}

id objc_msgSend_initWithTUConversationReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTUConversationReport:");
}

id objc_msgSend_initWithTURoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTURoute:");
}

id objc_msgSend_initWithTUSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTUSenderIdentity:");
}

id objc_msgSend_initWithTargetContentIdentifier_shouldAssociateScene_preferredSceneSessionRole_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetContentIdentifier:shouldAssociateScene:preferredSceneSessionRole:");
}

id objc_msgSend_initWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeIntervalSince1970:");
}

id objc_msgSend_initWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_initWithTransportToken_configuration_delegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransportToken:configuration:delegate:queue:");
}

id objc_msgSend_initWithTransportToken_delegate_queue_reportingHierarchyToken_oneToOneModeEnabled_avMode_videoEnabled_report_serviceName_ABTestConfiguration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTransportToken:delegate:queue:reportingHierarchyToken:oneToOneModeEnabled:avMode:videoEnabled:report: serviceName:ABTestConfiguration:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithType_groupUUID_link_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:groupUUID:link:");
}

id objc_msgSend_initWithType_uniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:uniqueProxyIdentifier:");
}

id objc_msgSend_initWithType_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:");
}

id objc_msgSend_initWithType_value_siriDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:siriDisplayName:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:");
}

id objc_msgSend_initWithUUID_accountUUID_ISOCountryCode_localizedName_localizedShortName_localizedServiceName_handle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:");
}

id objc_msgSend_initWithUUID_andAccountID_andSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:andAccountID:andSlot:");
}

id objc_msgSend_initWithUUID_description_serviceName_isoCountryCode_handle_shortLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:");
}

id objc_msgSend_initWithUUID_groupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:groupUUID:");
}

id objc_msgSend_initWithUUID_groupUUID_provider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:groupUUID:provider:");
}

id objc_msgSend_initWithUUID_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:handle:");
}

id objc_msgSend_initWithUUID_isVideo_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:isVideo:handle:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUniqueIdentifier_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniqueIdentifier:name:");
}

id objc_msgSend_initWithUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniqueProxyIdentifier:");
}

id objc_msgSend_initWithUniqueProxyIdentifier_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniqueProxyIdentifier:configuration:");
}

id objc_msgSend_initWithUniqueProxyIdentifier_configuration_idQueryController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniqueProxyIdentifier:configuration:idQueryController:");
}

id objc_msgSend_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:");
}

id objc_msgSend_initWithUnprefixedURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnprefixedURI:");
}

id objc_msgSend_initWithVoiceOverObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVoiceOverObserver:");
}

id objc_msgSend_initWithVoucherManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVoucherManager:");
}

id objc_msgSend_initialLinkType(void *a1, const char *a2, ...)
{
  return _[a1 initialLinkType];
}

id objc_msgSend_initializeNewCallWithDeviceRole_reportingHierarchyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeNewCallWithDeviceRole:reportingHierarchyToken:");
}

id objc_msgSend_initiateModernFTInviteForAction_destinations_excludedIMAVDestinations_joinCallActionToFulfill_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:");
}

id objc_msgSend_initiatePendingConversationForLink_localMember_isVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatePendingConversationForLink:localMember:isVideoEnabled:");
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return _[a1 initiator];
}

id objc_msgSend_inputAudioPowerSpectrumToken(void *a1, const char *a2, ...)
{
  return _[a1 inputAudioPowerSpectrumToken];
}

id objc_msgSend_inputAudioPowerSpectrumTokenForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputAudioPowerSpectrumTokenForIdentifier:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installedProvidersChangedForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedProvidersChangedForDataSource:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return _[a1 interruptionHandler];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndRefreshThumperCallingCapabilitiesForSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndRefreshThumperCallingCapabilitiesForSenderIdentityWithUUID:");
}

id objc_msgSend_invalidateAndRefreshWiFiCallingCapabilitiesForSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndRefreshWiFiCallingCapabilitiesForSenderIdentityWithUUID:");
}

id objc_msgSend_invalidateLink_deleteReason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLink:deleteReason:completionHandler:");
}

id objc_msgSend_invalidateLinkWithPseudonym_deleteReason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLinkWithPseudonym:deleteReason:completionHandler:");
}

id objc_msgSend_invalidateLocalParticipantBlobWantsDeliveryOverPush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLocalParticipantBlobWantsDeliveryOverPush:");
}

id objc_msgSend_invalidateProcessAssertionForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateProcessAssertionForBundleIdentifier:");
}

id objc_msgSend_invalidateProvisioningURL(void *a1, const char *a2, ...)
{
  return _[a1 invalidateProvisioningURL];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return _[a1 invalidationHandler];
}

id objc_msgSend_invitationPreferenceWithTUConversationInvitationPreference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationPreferenceWithTUConversationInvitationPreference:");
}

id objc_msgSend_invitationPreferences(void *a1, const char *a2, ...)
{
  return _[a1 invitationPreferences];
}

id objc_msgSend_invitationPreferencesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationPreferencesAtIndex:");
}

id objc_msgSend_invitationPreferencesCount(void *a1, const char *a2, ...)
{
  return _[a1 invitationPreferencesCount];
}

id objc_msgSend_invitationResolver(void *a1, const char *a2, ...)
{
  return _[a1 invitationResolver];
}

id objc_msgSend_invitationTimeOut(void *a1, const char *a2, ...)
{
  return _[a1 invitationTimeOut];
}

id objc_msgSend_invitationTimeout(void *a1, const char *a2, ...)
{
  return _[a1 invitationTimeout];
}

id objc_msgSend_invite_additionalPeers_excludingPushTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invite:additionalPeers:excludingPushTokens:");
}

id objc_msgSend_inviteCompletion(void *a1, const char *a2, ...)
{
  return _[a1 inviteCompletion];
}

id objc_msgSend_inviteData(void *a1, const char *a2, ...)
{
  return _[a1 inviteData];
}

id objc_msgSend_inviteDictionaryForCallID_remoteInviteDictionary_nonCellularCandidateTimeout_block_queue_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteDictionaryForCallID:remoteInviteDictionary:nonCellularCandidateTimeout:block:queue:");
}

id objc_msgSend_inviteIDSPeersWithAction_destinations_joinCallActionToFulfill_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteIDSPeersWithAction:destinations:joinCallActionToFulfill:completion:");
}

id objc_msgSend_inviteIMAVPeersWithAction_tokensToExclude_joinCallActionToFulfill_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteIMAVPeersWithAction:tokensToExclude:joinCallActionToFulfill:");
}

id objc_msgSend_invitedHandles(void *a1, const char *a2, ...)
{
  return _[a1 invitedHandles];
}

id objc_msgSend_invitedHandlesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitedHandlesAtIndex:");
}

id objc_msgSend_invitedHandlesCount(void *a1, const char *a2, ...)
{
  return _[a1 invitedHandlesCount];
}

id objc_msgSend_invitedMemberHandles(void *a1, const char *a2, ...)
{
  return _[a1 invitedMemberHandles];
}

id objc_msgSend_invitedPushTokens(void *a1, const char *a2, ...)
{
  return _[a1 invitedPushTokens];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_invokeDidPrepareIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeDidPrepareIfNecessary:");
}

id objc_msgSend_invokeDidStartIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeDidStartIfNecessary:error:");
}

id objc_msgSend_invokeDidStopIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeDidStopIfNecessary:error:");
}

id objc_msgSend_isA2DPRoute(void *a1, const char *a2, ...)
{
  return _[a1 isA2DPRoute];
}

id objc_msgSend_isAVLess(void *a1, const char *a2, ...)
{
  return _[a1 isAVLess];
}

id objc_msgSend_isAccountActive(void *a1, const char *a2, ...)
{
  return _[a1 isAccountActive];
}

id objc_msgSend_isActivated(void *a1, const char *a2, ...)
{
  return _[a1 isActivated];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAirplaneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAirplaneModeEnabled];
}

id objc_msgSend_isAnyBluetoothHeadphoneRouteAvailableForAnyCall(void *a1, const char *a2, ...)
{
  return _[a1 isAnyBluetoothHeadphoneRouteAvailableForAnyCall];
}

id objc_msgSend_isAnyOtherAccountDeviceActive(void *a1, const char *a2, ...)
{
  return _[a1 isAnyOtherAccountDeviceActive];
}

id objc_msgSend_isAnyRouteAvailableWithBluetoothEndpointType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnyRouteAvailableWithBluetoothEndpointType:");
}

id objc_msgSend_isAnyRouteAvailableWithUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnyRouteAvailableWithUniqueIdentifier:");
}

id objc_msgSend_isAnyRouteAvailableWithUniqueIdentifier_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnyRouteAvailableWithUniqueIdentifier:forCall:");
}

id objc_msgSend_isAnyVehicleRouteAvailableForAnyCall(void *a1, const char *a2, ...)
{
  return _[a1 isAnyVehicleRouteAvailableForAnyCall];
}

id objc_msgSend_isAnyVehicleRouteAvailableForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnyVehicleRouteAvailableForCall:");
}

id objc_msgSend_isApproved(void *a1, const char *a2, ...)
{
  return _[a1 isApproved];
}

id objc_msgSend_isAssociated(void *a1, const char *a2, ...)
{
  return _[a1 isAssociated];
}

id objc_msgSend_isAudioAccessoryDevice(void *a1, const char *a2, ...)
{
  return _[a1 isAudioAccessoryDevice];
}

id objc_msgSend_isAudioDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isAudioDisabled];
}

id objc_msgSend_isAudioEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAudioEnabled];
}

id objc_msgSend_isAudioInjectionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAudioInjectionAllowed];
}

id objc_msgSend_isAudioMuted(void *a1, const char *a2, ...)
{
  return _[a1 isAudioMuted];
}

id objc_msgSend_isAudioMutedForHoldMusic(void *a1, const char *a2, ...)
{
  return _[a1 isAudioMutedForHoldMusic];
}

id objc_msgSend_isAudioPaused(void *a1, const char *a2, ...)
{
  return _[a1 isAudioPaused];
}

id objc_msgSend_isAudioReady(void *a1, const char *a2, ...)
{
  return _[a1 isAudioReady];
}

id objc_msgSend_isAudioSessionActive(void *a1, const char *a2, ...)
{
  return _[a1 isAudioSessionActive];
}

id objc_msgSend_isAuthTagEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAuthTagEnabled];
}

id objc_msgSend_isAutomaticUpgradingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticUpgradingEnabled];
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isBlocked];
}

id objc_msgSend_isBluetoothLE(void *a1, const char *a2, ...)
{
  return _[a1 isBluetoothLE];
}

id objc_msgSend_isBottomUpMute(void *a1, const char *a2, ...)
{
  return _[a1 isBottomUpMute];
}

id objc_msgSend_isCSCallingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCSCallingAvailable];
}

id objc_msgSend_isCallEligible_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCallEligible:forClient:");
}

id objc_msgSend_isCaller(void *a1, const char *a2, ...)
{
  return _[a1 isCaller];
}

id objc_msgSend_isCameraMixedWithScreen(void *a1, const char *a2, ...)
{
  return _[a1 isCameraMixedWithScreen];
}

id objc_msgSend_isCarModeActive(void *a1, const char *a2, ...)
{
  return _[a1 isCarModeActive];
}

id objc_msgSend_isCarPlayDeviceConnected(void *a1, const char *a2, ...)
{
  return _[a1 isCarPlayDeviceConnected];
}

id objc_msgSend_isCarPlayRouteAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCarPlayRouteAvailable];
}

id objc_msgSend_isCellularDataAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isCellularDataAllowed];
}

id objc_msgSend_isCellularDataAllowedForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCellularDataAllowedForChat:");
}

id objc_msgSend_isCellularDataAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCellularDataAvailable];
}

id objc_msgSend_isCellularDataPreferred(void *a1, const char *a2, ...)
{
  return _[a1 isCellularDataPreferred];
}

id objc_msgSend_isCellularDataPreferredForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCellularDataPreferredForChat:");
}

id objc_msgSend_isClientAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClientAllowed:");
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _[a1 isComplete];
}

id objc_msgSend_isConferenceActive(void *a1, const char *a2, ...)
{
  return _[a1 isConferenceActive];
}

id objc_msgSend_isConferenced(void *a1, const char *a2, ...)
{
  return _[a1 isConferenced];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return _[a1 isConnecting];
}

id objc_msgSend_isContinuitySession(void *a1, const char *a2, ...)
{
  return _[a1 isContinuitySession];
}

id objc_msgSend_isControlMessageOverQREnabled(void *a1, const char *a2, ...)
{
  return _[a1 isControlMessageOverQREnabled];
}

id objc_msgSend_isConversation(void *a1, const char *a2, ...)
{
  return _[a1 isConversation];
}

id objc_msgSend_isConversationJoiningOrJoined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConversationJoiningOrJoined:");
}

id objc_msgSend_isConversationWithUUIDRedirectingAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConversationWithUUIDRedirectingAudio:");
}

id objc_msgSend_isConversationWithUUIDRelaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConversationWithUUIDRelaying:");
}

id objc_msgSend_isConversationWithUUIDScreening_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConversationWithUUIDScreening:");
}

id objc_msgSend_isCurrentlyPicked(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentlyPicked];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isDefaultProvider(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultProvider];
}

id objc_msgSend_isDialAssisted(void *a1, const char *a2, ...)
{
  return _[a1 isDialAssisted];
}

id objc_msgSend_isDirectFaceTimeAudioCallingCurrentlyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDirectFaceTimeAudioCallingCurrentlyAvailable];
}

id objc_msgSend_isDirectFaceTimeVideoCallingCurrentlyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDirectFaceTimeVideoCallingCurrentlyAvailable];
}

id objc_msgSend_isDirectTelephonyCallingCurrentlyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDirectTelephonyCallingCurrentlyAvailable];
}

id objc_msgSend_isDownlinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 isDownlinkMuted];
}

id objc_msgSend_isEligibleForCall(void *a1, const char *a2, ...)
{
  return _[a1 isEligibleForCall];
}

id objc_msgSend_isEligibleRouteAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isEligibleRouteAvailable];
}

id objc_msgSend_isEligibleRouteAvailableForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEligibleRouteAvailableForCall:");
}

id objc_msgSend_isEmergency(void *a1, const char *a2, ...)
{
  return _[a1 isEmergency];
}

id objc_msgSend_isEmergencyCallbackModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEmergencyCallbackModeEnabled];
}

id objc_msgSend_isEmergencyCallbackPossible(void *a1, const char *a2, ...)
{
  return _[a1 isEmergencyCallbackPossible];
}

id objc_msgSend_isEmergencyCallingOnWifiAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isEmergencyCallingOnWifiAllowed];
}

id objc_msgSend_isEmergencyCallingOnWifiAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isEmergencyCallingOnWifiAvailable];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEndpointOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 isEndpointOnCurrentDevice];
}

id objc_msgSend_isEntitledForCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEntitledForCapability:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAccount:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToAssociation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAssociation:");
}

id objc_msgSend_isEqualToCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToCall:");
}

id objc_msgSend_isEqualToCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToCallProvider:");
}

id objc_msgSend_isEqualToCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToCapabilities:");
}

id objc_msgSend_isEqualToConversationLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToConversationLink:");
}

id objc_msgSend_isEqualToConversationProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToConversationProvider:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToHandle:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToMessage:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToParticipant:");
}

id objc_msgSend_isEqualToScreenShareAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToScreenShareAttributes:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToTransport:");
}

id objc_msgSend_isEquivalentToConversationLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEquivalentToConversationLink:");
}

id objc_msgSend_isEquivalentToHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEquivalentToHandle:");
}

id objc_msgSend_isEquivalentToPseudonym_andPublicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEquivalentToPseudonym:andPublicKey:");
}

id objc_msgSend_isExhausted(void *a1, const char *a2, ...)
{
  return _[a1 isExhausted];
}

id objc_msgSend_isExpectedEndpointOnMessagingDevice(void *a1, const char *a2, ...)
{
  return _[a1 isExpectedEndpointOnMessagingDevice];
}

id objc_msgSend_isFaceTimeAudioAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeAudioAvailable];
}

id objc_msgSend_isFaceTimeMyselfEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeMyselfEnabled];
}

id objc_msgSend_isFaceTimePhotosAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimePhotosAvailable];
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isFaceTimeVideoAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeVideoAvailable];
}

id objc_msgSend_isFailureExpected(void *a1, const char *a2, ...)
{
  return _[a1 isFailureExpected];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFromBlockList(void *a1, const char *a2, ...)
{
  return _[a1 isFromBlockList];
}

id objc_msgSend_isFromStorage(void *a1, const char *a2, ...)
{
  return _[a1 isFromStorage];
}

id objc_msgSend_isGFTDowngradeToOneToOneAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isGFTDowngradeToOneToOneAvailable];
}

id objc_msgSend_isGondolaCallingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isGondolaCallingAvailable];
}

id objc_msgSend_isGreenTea(void *a1, const char *a2, ...)
{
  return _[a1 isGreenTea];
}

id objc_msgSend_isGuest(void *a1, const char *a2, ...)
{
  return _[a1 isGuest];
}

id objc_msgSend_isGuestModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isGuestModeEnabled];
}

id objc_msgSend_isGuestModeSupported(void *a1, const char *a2, ...)
{
  return _[a1 isGuestModeSupported];
}

id objc_msgSend_isHSATrusted(void *a1, const char *a2, ...)
{
  return _[a1 isHSATrusted];
}

id objc_msgSend_isHandleEligibleForScreenSharingRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHandleEligibleForScreenSharingRequests:");
}

id objc_msgSend_isHandleLocalPseudonym_provider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHandleLocalPseudonym:provider:");
}

id objc_msgSend_isHandleStringLocalPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHandleStringLocalPseudonym:");
}

id objc_msgSend_isHandleStringLocalPseudonym_provider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHandleStringLocalPseudonym:provider:");
}

id objc_msgSend_isHardPause(void *a1, const char *a2, ...)
{
  return _[a1 isHardPause];
}

id objc_msgSend_isHeld(void *a1, const char *a2, ...)
{
  return _[a1 isHeld];
}

id objc_msgSend_isHoldAndAnswerAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isHoldAndAnswerAllowed];
}

id objc_msgSend_isHost(void *a1, const char *a2, ...)
{
  return _[a1 isHost];
}

id objc_msgSend_isHostedOnCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 isHostedOnCurrentDevice];
}

id objc_msgSend_isIMDaemonConnected(void *a1, const char *a2, ...)
{
  return _[a1 isIMDaemonConnected];
}

id objc_msgSend_isInCallUIActive(void *a1, const char *a2, ...)
{
  return _[a1 isInCallUIActive];
}

id objc_msgSend_isInCanvas(void *a1, const char *a2, ...)
{
  return _[a1 isInCanvas];
}

id objc_msgSend_isInEarAudioRouteAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isInEarAudioRouteAvailable];
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return _[a1 isIncoming];
}

id objc_msgSend_isIncomingCommunicationBlockedForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIncomingCommunicationBlockedForHandle:");
}

id objc_msgSend_isInitiator(void *a1, const char *a2, ...)
{
  return _[a1 isInitiator];
}

id objc_msgSend_isInjectingAudio(void *a1, const char *a2, ...)
{
  return _[a1 isInjectingAudio];
}

id objc_msgSend_isInputFrequencyMeteringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isInputFrequencyMeteringEnabled];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isInternational(void *a1, const char *a2, ...)
{
  return _[a1 isInternational];
}

id objc_msgSend_isInvitation(void *a1, const char *a2, ...)
{
  return _[a1 isInvitation];
}

id objc_msgSend_isJoined(void *a1, const char *a2, ...)
{
  return _[a1 isJoined];
}

id objc_msgSend_isJoiningConversationWithLink(void *a1, const char *a2, ...)
{
  return _[a1 isJoiningConversationWithLink];
}

id objc_msgSend_isJunk(void *a1, const char *a2, ...)
{
  return _[a1 isJunk];
}

id objc_msgSend_isKnownCaller(void *a1, const char *a2, ...)
{
  return _[a1 isKnownCaller];
}

id objc_msgSend_isLetMeIn(void *a1, const char *a2, ...)
{
  return _[a1 isLetMeIn];
}

id objc_msgSend_isLetMeInApproved(void *a1, const char *a2, ...)
{
  return _[a1 isLetMeInApproved];
}

id objc_msgSend_isLetMeInRequestUIForUnknownParticipantEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLetMeInRequestUIForUnknownParticipantEnabled];
}

id objc_msgSend_isLightweight(void *a1, const char *a2, ...)
{
  return _[a1 isLightweight];
}

id objc_msgSend_isLightweightMember(void *a1, const char *a2, ...)
{
  return _[a1 isLightweightMember];
}

id objc_msgSend_isLightweightPrimaryInitiated(void *a1, const char *a2, ...)
{
  return _[a1 isLightweightPrimaryInitiated];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isLocalAccountHandle(void *a1, const char *a2, ...)
{
  return _[a1 isLocalAccountHandle];
}

id objc_msgSend_isLocalClientActive(void *a1, const char *a2, ...)
{
  return _[a1 isLocalClientActive];
}

id objc_msgSend_isLocalMemberOf_associatedTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalMemberOf:associatedTo:");
}

id objc_msgSend_isLocalParticipant(void *a1, const char *a2, ...)
{
  return _[a1 isLocalParticipant];
}

id objc_msgSend_isLocallyCreated(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyCreated];
}

id objc_msgSend_isLocallyInitiated(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyInitiated];
}

id objc_msgSend_isLocallyOriginated(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyOriginated];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isManagingCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManagingCallWithUUID:");
}

id objc_msgSend_isManagingPendingConversationForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManagingPendingConversationForCallWithUUID:");
}

id objc_msgSend_isMediaAllowedForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMediaAllowedForChat:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isMicrophoneMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMicrophoneMuted];
}

id objc_msgSend_isMomentsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isMomentsAvailable];
}

id objc_msgSend_isMomentsAvailableForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMomentsAvailableForChat:");
}

id objc_msgSend_isMomentsDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isMomentsDisabled];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMuted];
}

id objc_msgSend_isMutedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMutedForIdentifier:");
}

id objc_msgSend_isMutuallyExclusiveCall(void *a1, const char *a2, ...)
{
  return _[a1 isMutuallyExclusiveCall];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isNoConversationParticipantEndCallEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isNoConversationParticipantEndCallEnabled];
}

id objc_msgSend_isObserving(void *a1, const char *a2, ...)
{
  return _[a1 isObserving];
}

id objc_msgSend_isOnHold(void *a1, const char *a2, ...)
{
  return _[a1 isOnHold];
}

id objc_msgSend_isOneToOneEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isOneToOneEnabled];
}

id objc_msgSend_isOneToOneHandoffOngoing(void *a1, const char *a2, ...)
{
  return _[a1 isOneToOneHandoffOngoing];
}

id objc_msgSend_isOneToOneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isOneToOneModeEnabled];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 isOutgoing];
}

id objc_msgSend_isOutputFrequencyMeteringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isOutputFrequencyMeteringEnabled];
}

id objc_msgSend_isPTT(void *a1, const char *a2, ...)
{
  return _[a1 isPTT];
}

id objc_msgSend_isPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isPairedDevice];
}

id objc_msgSend_isParticipantIDToURIIncludedInPush(void *a1, const char *a2, ...)
{
  return _[a1 isParticipantIDToURIIncludedInPush];
}

id objc_msgSend_isPendingConversation(void *a1, const char *a2, ...)
{
  return _[a1 isPendingConversation];
}

id objc_msgSend_isPersonaAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isPersonaAvailable];
}

id objc_msgSend_isPhotosSharePlayAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isPhotosSharePlayAvailable];
}

id objc_msgSend_isPlaceholderActivity(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholderActivity];
}

id objc_msgSend_isPreferred(void *a1, const char *a2, ...)
{
  return _[a1 isPreferred];
}

id objc_msgSend_isPreferredAndActive(void *a1, const char *a2, ...)
{
  return _[a1 isPreferredAndActive];
}

id objc_msgSend_isPreferredDevice(void *a1, const char *a2, ...)
{
  return _[a1 isPreferredDevice];
}

id objc_msgSend_isPreparedToStop(void *a1, const char *a2, ...)
{
  return _[a1 isPreparedToStop];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return _[a1 isPrimary];
}

id objc_msgSend_isProcessSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isProcessSuspended];
}

id objc_msgSend_isProviderForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProviderForeground:");
}

id objc_msgSend_isProviderInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProviderInstalled:");
}

id objc_msgSend_isPseudonym(void *a1, const char *a2, ...)
{
  return _[a1 isPseudonym];
}

id objc_msgSend_isPseudonymHandleForProvider_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPseudonymHandleForProvider:completionHandler:");
}

id objc_msgSend_isQuickRelaySupported(void *a1, const char *a2, ...)
{
  return _[a1 isQuickRelaySupported];
}

id objc_msgSend_isRTT(void *a1, const char *a2, ...)
{
  return _[a1 isRTT];
}

id objc_msgSend_isReRing(void *a1, const char *a2, ...)
{
  return _[a1 isReRing];
}

id objc_msgSend_isRedial(void *a1, const char *a2, ...)
{
  return _[a1 isRedial];
}

id objc_msgSend_isRedirectingAudio(void *a1, const char *a2, ...)
{
  return _[a1 isRedirectingAudio];
}

id objc_msgSend_isRegionBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isRegionBlocked];
}

id objc_msgSend_isRegistered(void *a1, const char *a2, ...)
{
  return _[a1 isRegistered];
}

id objc_msgSend_isRelay(void *a1, const char *a2, ...)
{
  return _[a1 isRelay];
}

id objc_msgSend_isRelayCallingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isRelayCallingEnabled];
}

id objc_msgSend_isRelayCallingEnabledForDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRelayCallingEnabledForDeviceWithID:");
}

id objc_msgSend_isRelayCallingGuaranteed(void *a1, const char *a2, ...)
{
  return _[a1 isRelayCallingGuaranteed];
}

id objc_msgSend_isRelaying(void *a1, const char *a2, ...)
{
  return _[a1 isRelaying];
}

id objc_msgSend_isRemote(void *a1, const char *a2, ...)
{
  return _[a1 isRemote];
}

id objc_msgSend_isRemoteMomentsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRemoteMomentsAvailable];
}

id objc_msgSend_isRemoteScreenEnabledForParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRemoteScreenEnabledForParticipant:");
}

id objc_msgSend_isRemoteUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 isRemoteUplinkMuted];
}

id objc_msgSend_isRepresentedByRemoteMembers_andLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRepresentedByRemoteMembers:andLink:");
}

id objc_msgSend_isRetry(void *a1, const char *a2, ...)
{
  return _[a1 isRetry];
}

id objc_msgSend_isRoamingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isRoamingEnabled];
}

id objc_msgSend_isSIMRemoved(void *a1, const char *a2, ...)
{
  return _[a1 isSIMRemoved];
}

id objc_msgSend_isSOS(void *a1, const char *a2, ...)
{
  return _[a1 isSOS];
}

id objc_msgSend_isScreenEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isScreenEnabled];
}

id objc_msgSend_isScreenSharingActivity(void *a1, const char *a2, ...)
{
  return _[a1 isScreenSharingActivity];
}

id objc_msgSend_isScreenSharingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isScreenSharingAvailable];
}

id objc_msgSend_isScreenSharingInitiationAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isScreenSharingInitiationAvailable];
}

id objc_msgSend_isScreenSharingRequest(void *a1, const char *a2, ...)
{
  return _[a1 isScreenSharingRequest];
}

id objc_msgSend_isScreening(void *a1, const char *a2, ...)
{
  return _[a1 isScreening];
}

id objc_msgSend_isScreeningDueToUserInteraction(void *a1, const char *a2, ...)
{
  return _[a1 isScreeningDueToUserInteraction];
}

id objc_msgSend_isSendingAudio(void *a1, const char *a2, ...)
{
  return _[a1 isSendingAudio];
}

id objc_msgSend_isSendingAudioData(void *a1, const char *a2, ...)
{
  return _[a1 isSendingAudioData];
}

id objc_msgSend_isSendingAudioForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSendingAudioForIdentifier:");
}

id objc_msgSend_isSendingVideo(void *a1, const char *a2, ...)
{
  return _[a1 isSendingVideo];
}

id objc_msgSend_isServiceEnabledForTelephonySubscriptionLabelIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isServiceEnabledForTelephonySubscriptionLabelIdentifier:");
}

id objc_msgSend_isSharePlayAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isSharePlayAvailable];
}

id objc_msgSend_isSharingScreen(void *a1, const char *a2, ...)
{
  return _[a1 isSharingScreen];
}

id objc_msgSend_isShortMKIEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isShortMKIEnabled];
}

id objc_msgSend_isSignificantChangeFromAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSignificantChangeFromAttributes:");
}

id objc_msgSend_isSilenceUnknownFaceTimeCallersEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSilenceUnknownFaceTimeCallersEnabled];
}

id objc_msgSend_isSilenceUnknownTelephonyCallersEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSilenceUnknownTelephonyCallersEnabled];
}

id objc_msgSend_isSpatialPersonaEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSpatialPersonaEnabled];
}

id objc_msgSend_isStaticActivity(void *a1, const char *a2, ...)
{
  return _[a1 isStaticActivity];
}

id objc_msgSend_isSuperboxProvider(void *a1, const char *a2, ...)
{
  return _[a1 isSuperboxProvider];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSupported];
}

id objc_msgSend_isSymbolicLinkAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSymbolicLinkAtURL:");
}

id objc_msgSend_isSynchronous(void *a1, const char *a2, ...)
{
  return _[a1 isSynchronous];
}

id objc_msgSend_isSystemActivity(void *a1, const char *a2, ...)
{
  return _[a1 isSystemActivity];
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return _[a1 isSystemProvider];
}

id objc_msgSend_isTLEEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isTLEEnabled];
}

id objc_msgSend_isTTY(void *a1, const char *a2, ...)
{
  return _[a1 isTTY];
}

id objc_msgSend_isTelephonyDevice(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyDevice];
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyProvider];
}

id objc_msgSend_isThirdPartyVideo(void *a1, const char *a2, ...)
{
  return _[a1 isThirdPartyVideo];
}

id objc_msgSend_isThumperCallingSupportedForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThumperCallingSupportedForAccountID:");
}

id objc_msgSend_isThumperRegisteredDeviceID_forThumperAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThumperRegisteredDeviceID:forThumperAccountID:");
}

id objc_msgSend_isTinCan(void *a1, const char *a2, ...)
{
  return _[a1 isTinCan];
}

id objc_msgSend_isUPlusNDowngradeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isUPlusNDowngradeAvailable];
}

id objc_msgSend_isUPlusOneAVLessAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isUPlusOneAVLessAvailable];
}

id objc_msgSend_isUPlusOneScreenShareAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isUPlusOneScreenShareAvailable];
}

id objc_msgSend_isUPlusOneScreenSharingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isUPlusOneScreenSharingAvailable];
}

id objc_msgSend_isUPlusOneSessionCapabilitiesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isUPlusOneSessionCapabilitiesEnabled];
}

id objc_msgSend_isUPlusOneVisionToVisionAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isUPlusOneVisionToVisionAvailable];
}

id objc_msgSend_isUnansweredOutgoingOneToOneConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnansweredOutgoingOneToOneConversation:");
}

id objc_msgSend_isUnderlyingLinksConnected(void *a1, const char *a2, ...)
{
  return _[a1 isUnderlyingLinksConnected];
}

id objc_msgSend_isUnderlyingUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 isUnderlyingUplinkMuted];
}

id objc_msgSend_isUnknownAddress_normalizedAddress_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnknownAddress:normalizedAddress:forBundleIdentifier:");
}

id objc_msgSend_isUnknownCaller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnknownCaller:");
}

id objc_msgSend_isUpgrade(void *a1, const char *a2, ...)
{
  return _[a1 isUpgrade];
}

id objc_msgSend_isUpgradingCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpgradingCallWithUUID:");
}

id objc_msgSend_isUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 isUplinkMuted];
}

id objc_msgSend_isUsingAirplay(void *a1, const char *a2, ...)
{
  return _[a1 isUsingAirplay];
}

id objc_msgSend_isUsingBaseband(void *a1, const char *a2, ...)
{
  return _[a1 isUsingBaseband];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidLocalHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidLocalHandle:");
}

id objc_msgSend_isValidLocalHandle_activeLocalHandles_provider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidLocalHandle:activeLocalHandles:provider:");
}

id objc_msgSend_isValidLocalHandle_forProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidLocalHandle:forProvider:");
}

id objc_msgSend_isValidOutgoingCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidOutgoingCallerID:");
}

id objc_msgSend_isValidScreenSharingRequest(void *a1, const char *a2, ...)
{
  return _[a1 isValidScreenSharingRequest];
}

id objc_msgSend_isValidated(void *a1, const char *a2, ...)
{
  return _[a1 isValidated];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _[a1 isVideo];
}

id objc_msgSend_isVideoEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isVideoEnabled];
}

id objc_msgSend_isVideoPaused(void *a1, const char *a2, ...)
{
  return _[a1 isVideoPaused];
}

id objc_msgSend_isVideoPausedToStart(void *a1, const char *a2, ...)
{
  return _[a1 isVideoPausedToStart];
}

id objc_msgSend_isVideoUpgradeFromCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVideoUpgradeFromCall:");
}

id objc_msgSend_isVoLTECallingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isVoLTECallingAvailable];
}

id objc_msgSend_isVoiceRoaming(void *a1, const char *a2, ...)
{
  return _[a1 isVoiceRoaming];
}

id objc_msgSend_isVoicemail(void *a1, const char *a2, ...)
{
  return _[a1 isVoicemail];
}

id objc_msgSend_isWaitingForRemoteJoinForConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWaitingForRemoteJoinForConversationUUID:");
}

id objc_msgSend_isWaitingToPruneParticipants(void *a1, const char *a2, ...)
{
  return _[a1 isWaitingToPruneParticipants];
}

id objc_msgSend_isWatchDevice(void *a1, const char *a2, ...)
{
  return _[a1 isWatchDevice];
}

id objc_msgSend_isWebCapableFaceTimeAvailableForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWebCapableFaceTimeAvailableForDestination:");
}

id objc_msgSend_isWiFiAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiAllowed];
}

id objc_msgSend_isWiFiAllowedForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWiFiAllowedForChat:");
}

id objc_msgSend_isWiFiAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiAvailable];
}

id objc_msgSend_isWiFiCallingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiCallingAvailable];
}

id objc_msgSend_isWiFiCallingCurrentlyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiCallingCurrentlyAvailable];
}

id objc_msgSend_isWiFiEmergencyCallingAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiEmergencyCallingAllowed];
}

id objc_msgSend_isWiFiEmergencyCallingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiEmergencyCallingAvailable];
}

id objc_msgSend_isWifiCallingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isWifiCallingAvailable];
}

id objc_msgSend_isWindowed(void *a1, const char *a2, ...)
{
  return _[a1 isWindowed];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_joinCallAction(void *a1, const char *a2, ...)
{
  return _[a1 joinCallAction];
}

id objc_msgSend_joinCallActivity(void *a1, const char *a2, ...)
{
  return _[a1 joinCallActivity];
}

id objc_msgSend_joinConversationRequest(void *a1, const char *a2, ...)
{
  return _[a1 joinConversationRequest];
}

id objc_msgSend_joinConversationRequestURLString(void *a1, const char *a2, ...)
{
  return _[a1 joinConversationRequestURLString];
}

id objc_msgSend_joinConversationWithConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinConversationWithConversationRequest:");
}

id objc_msgSend_joinConversationWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinConversationWithRequest:");
}

id objc_msgSend_joinExistingConversationWithUUID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinExistingConversationWithUUID:context:");
}

id objc_msgSend_joinUsingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinUsingContext:");
}

id objc_msgSend_joinUsingContext_localParticipantAVCData_members_otherInvitedHandles_participantDestinationIDs_link_report_stagedActivitySession_personaHandshakeBlob_activitySession_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "joinUsingContext:localParticipantAVCData:members:otherInvitedHandles:participantDestinationIDs:link:report:st agedActivitySession:personaHandshakeBlob:activitySession:");
}

id objc_msgSend_joinWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinWithOptions:");
}

id objc_msgSend_joinedFromLetMeIn(void *a1, const char *a2, ...)
{
  return _[a1 joinedFromLetMeIn];
}

id objc_msgSend_joinedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 joinedMetadata];
}

id objc_msgSend_junkConfidence(void *a1, const char *a2, ...)
{
  return _[a1 junkConfidence];
}

id objc_msgSend_keychainItem(void *a1, const char *a2, ...)
{
  return _[a1 keychainItem];
}

id objc_msgSend_kickMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickMember:");
}

id objc_msgSend_kickMember_conversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickMember:conversationUUID:");
}

id objc_msgSend_kickMemberRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 kickMemberRetryCount];
}

id objc_msgSend_kickParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickParticipants:");
}

id objc_msgSend_kickedMembers(void *a1, const char *a2, ...)
{
  return _[a1 kickedMembers];
}

id objc_msgSend_kickedParticipants(void *a1, const char *a2, ...)
{
  return _[a1 kickedParticipants];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _[a1 labelID];
}

id objc_msgSend_lagunaEnabled(void *a1, const char *a2, ...)
{
  return _[a1 lagunaEnabled];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastRebroadcastTime(void *a1, const char *a2, ...)
{
  return _[a1 lastRebroadcastTime];
}

id objc_msgSend_lastSavedAccountIDByCapability(void *a1, const char *a2, ...)
{
  return _[a1 lastSavedAccountIDByCapability];
}

id objc_msgSend_latestRemoteAttributes(void *a1, const char *a2, ...)
{
  return _[a1 latestRemoteAttributes];
}

id objc_msgSend_launchAppForActivitySession_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppForActivitySession:options:completion:");
}

id objc_msgSend_launchAppForDialRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppForDialRequest:completion:");
}

id objc_msgSend_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:");
}

id objc_msgSend_launchScreenSharingAppIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 launchScreenSharingAppIfNecessary];
}

id objc_msgSend_leave(void *a1, const char *a2, ...)
{
  return _[a1 leave];
}

id objc_msgSend_leaveAVLessConversationsIfNecessaryForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveAVLessConversationsIfNecessaryForCall:");
}

id objc_msgSend_leaveActivitySession_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveActivitySession:onConversationWithUUID:");
}

id objc_msgSend_leaveActivitySessionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveActivitySessionWithUUID:");
}

id objc_msgSend_leaveAllConversations(void *a1, const char *a2, ...)
{
  return _[a1 leaveAllConversations];
}

id objc_msgSend_leaveConversation_withCallUUID_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveConversation:withCallUUID:reason:");
}

id objc_msgSend_leaveConversationForCallUUID_endedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveConversationForCallUUID:endedReason:");
}

id objc_msgSend_leaveConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveConversationWithUUID:");
}

id objc_msgSend_leaveConversationWithUUID_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveConversationWithUUID:withContext:");
}

id objc_msgSend_leaveGroupSession(void *a1, const char *a2, ...)
{
  return _[a1 leaveGroupSession];
}

id objc_msgSend_leaveGroupSessionWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveGroupSessionWithContext:");
}

id objc_msgSend_leaveGroupSessionWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveGroupSessionWithOptions:");
}

id objc_msgSend_leaveReason(void *a1, const char *a2, ...)
{
  return _[a1 leaveReason];
}

id objc_msgSend_leaveUsingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveUsingContext:");
}

id objc_msgSend_leaveWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveWithOptions:");
}

id objc_msgSend_leaveWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveWithReason:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_letMeInDelegationHandle(void *a1, const char *a2, ...)
{
  return _[a1 letMeInDelegationHandle];
}

id objc_msgSend_letMeInDelegationUUID(void *a1, const char *a2, ...)
{
  return _[a1 letMeInDelegationUUID];
}

id objc_msgSend_letMeInKeyAgreement(void *a1, const char *a2, ...)
{
  return _[a1 letMeInKeyAgreement];
}

id objc_msgSend_letMeInRequestState(void *a1, const char *a2, ...)
{
  return _[a1 letMeInRequestState];
}

id objc_msgSend_letMeInRequestUINotificationBlock(void *a1, const char *a2, ...)
{
  return _[a1 letMeInRequestUINotificationBlock];
}

id objc_msgSend_letMeInRequestUINotificationGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 letMeInRequestUINotificationGracePeriod];
}

id objc_msgSend_letMeInResponseInvitationPreferences(void *a1, const char *a2, ...)
{
  return _[a1 letMeInResponseInvitationPreferences];
}

id objc_msgSend_lifetimePolicy(void *a1, const char *a2, ...)
{
  return _[a1 lifetimePolicy];
}

id objc_msgSend_lightweightMembers(void *a1, const char *a2, ...)
{
  return _[a1 lightweightMembers];
}

id objc_msgSend_lightweightMembersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightweightMembersAtIndex:");
}

id objc_msgSend_lightweightMembersCount(void *a1, const char *a2, ...)
{
  return _[a1 lightweightMembersCount];
}

id objc_msgSend_lightweightPrimary(void *a1, const char *a2, ...)
{
  return _[a1 lightweightPrimary];
}

id objc_msgSend_lightweightPrimaryParticipantID(void *a1, const char *a2, ...)
{
  return _[a1 lightweightPrimaryParticipantID];
}

id objc_msgSend_lightweightPrimaryParticipantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 lightweightPrimaryParticipantIdentifier];
}

id objc_msgSend_lightweightRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 lightweightRetryCount];
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return _[a1 link];
}

id objc_msgSend_linkAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkAtIndex:");
}

id objc_msgSend_linkForJoinCallAction_inLinks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkForJoinCallAction:inLinks:");
}

id objc_msgSend_linkForJoinCallAction_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkForJoinCallAction:withError:");
}

id objc_msgSend_linkLifetimeScope(void *a1, const char *a2, ...)
{
  return _[a1 linkLifetimeScope];
}

id objc_msgSend_linkManager(void *a1, const char *a2, ...)
{
  return _[a1 linkManager];
}

id objc_msgSend_linkName(void *a1, const char *a2, ...)
{
  return _[a1 linkName];
}

id objc_msgSend_linkSyncStateIncludeLinks_WithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkSyncStateIncludeLinks:WithCompletion:");
}

id objc_msgSend_linkSyncStateWithIncludeLinks_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkSyncStateWithIncludeLinks:completion:");
}

id objc_msgSend_linkWithTUConversationLink_includeGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithTUConversationLink:includeGroupUUID:");
}

id objc_msgSend_linkedUserURIs(void *a1, const char *a2, ...)
{
  return _[a1 linkedUserURIs];
}

id objc_msgSend_linksCount(void *a1, const char *a2, ...)
{
  return _[a1 linksCount];
}

id objc_msgSend_listenForActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenForActivityType:dynamicIdentifier:");
}

id objc_msgSend_listeningIdentifiersByActivityType(void *a1, const char *a2, ...)
{
  return _[a1 listeningIdentifiersByActivityType];
}

id objc_msgSend_liveIDLookupEnabled(void *a1, const char *a2, ...)
{
  return _[a1 liveIDLookupEnabled];
}

id objc_msgSend_liveLookupTimeoutSeconds(void *a1, const char *a2, ...)
{
  return _[a1 liveLookupTimeoutSeconds];
}

id objc_msgSend_liveVoicemailUnavailableReason(void *a1, const char *a2, ...)
{
  return _[a1 liveVoicemailUnavailableReason];
}

id objc_msgSend_localBundleIDForActivityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localBundleIDForActivityIdentifier:");
}

id objc_msgSend_localCSDConversationParticipant(void *a1, const char *a2, ...)
{
  return _[a1 localCSDConversationParticipant];
}

id objc_msgSend_localCallerID(void *a1, const char *a2, ...)
{
  return _[a1 localCallerID];
}

id objc_msgSend_localCallerIDForProvider(void *a1, const char *a2, ...)
{
  return _[a1 localCallerIDForProvider];
}

id objc_msgSend_localCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 localCapabilities];
}

id objc_msgSend_localCaptionToken(void *a1, const char *a2, ...)
{
  return _[a1 localCaptionToken];
}

id objc_msgSend_localCaptionsToken(void *a1, const char *a2, ...)
{
  return _[a1 localCaptionsToken];
}

id objc_msgSend_localConversationParticipantWithDataToSendToDestinationIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localConversationParticipantWithDataToSendToDestinationIDs:");
}

id objc_msgSend_localDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceID];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localIdentifier];
}

id objc_msgSend_localInviteDictionary(void *a1, const char *a2, ...)
{
  return _[a1 localInviteDictionary];
}

id objc_msgSend_localLandscapeAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 localLandscapeAspectRatio];
}

id objc_msgSend_localLightweightSecondaryMember(void *a1, const char *a2, ...)
{
  return _[a1 localLightweightSecondaryMember];
}

id objc_msgSend_localMember(void *a1, const char *a2, ...)
{
  return _[a1 localMember];
}

id objc_msgSend_localMemberForProvider_fromHandle_members_lightweightMembers_activeLocalHandles_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localMemberForProvider:fromHandle:members:lightweightMembers:activeLocalHandles:");
}

id objc_msgSend_localMemberHandleValue(void *a1, const char *a2, ...)
{
  return _[a1 localMemberHandleValue];
}

id objc_msgSend_localParticipant(void *a1, const char *a2, ...)
{
  return _[a1 localParticipant];
}

id objc_msgSend_localParticipantAssociation(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantAssociation];
}

id objc_msgSend_localParticipantBlobTracker(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantBlobTracker];
}

id objc_msgSend_localParticipantCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantCapabilities];
}

id objc_msgSend_localParticipantData(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantData];
}

id objc_msgSend_localParticipantDataToSendToDestinationIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localParticipantDataToSendToDestinationIDs:");
}

id objc_msgSend_localParticipantDataWithVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localParticipantDataWithVersion:");
}

id objc_msgSend_localParticipantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantIdentifier];
}

id objc_msgSend_localParticipantType(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantType];
}

id objc_msgSend_localPortraitAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 localPortraitAspectRatio];
}

id objc_msgSend_localPortraitAspectRatioForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localPortraitAspectRatioForChat:");
}

id objc_msgSend_localProviderWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localProviderWithIdentifier:");
}

id objc_msgSend_localProvidersByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localProvidersByIdentifier];
}

id objc_msgSend_localProvidersByIdentifierForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localProvidersByIdentifierForClient:");
}

id objc_msgSend_localProvidersByIdentifierForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localProvidersByIdentifierForRemoteClients:");
}

id objc_msgSend_localRouteController(void *a1, const char *a2, ...)
{
  return _[a1 localRouteController];
}

id objc_msgSend_localScreenShareAttributes(void *a1, const char *a2, ...)
{
  return _[a1 localScreenShareAttributes];
}

id objc_msgSend_localScreenSharingRequest(void *a1, const char *a2, ...)
{
  return _[a1 localScreenSharingRequest];
}

id objc_msgSend_localSenderIdentity(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentity];
}

id objc_msgSend_localSenderIdentityAccountUUID(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityAccountUUID];
}

id objc_msgSend_localSenderIdentityAccountUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityAccountUUIDString];
}

id objc_msgSend_localSenderIdentityUUID(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityUUID];
}

id objc_msgSend_localSenderIdentityUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityUUIDString];
}

id objc_msgSend_localSenderSubscriptionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localSenderSubscriptionIdentifier];
}

id objc_msgSend_localThumperAccounts(void *a1, const char *a2, ...)
{
  return _[a1 localThumperAccounts];
}

id objc_msgSend_localThumperDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 localThumperDeviceID];
}

id objc_msgSend_localizedCallerImageURL(void *a1, const char *a2, ...)
{
  return _[a1 localizedCallerImageURL];
}

id objc_msgSend_localizedCallerName(void *a1, const char *a2, ...)
{
  return _[a1 localizedCallerName];
}

id objc_msgSend_localizedContainingName(void *a1, const char *a2, ...)
{
  return _[a1 localizedContainingName];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return _[a1 localizedLabel];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedServiceName(void *a1, const char *a2, ...)
{
  return _[a1 localizedServiceName];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortName];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locallyInitiated(void *a1, const char *a2, ...)
{
  return _[a1 locallyInitiated];
}

id objc_msgSend_locallyPersistedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 locallyPersistedMetadata];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lockStateObserver(void *a1, const char *a2, ...)
{
  return _[a1 lockStateObserver];
}

id objc_msgSend_lockdownModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 lockdownModeEnabled];
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_machOUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 machOUUIDs];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return _[a1 machServiceName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_makeLocalRouteController(void *a1, const char *a2, ...)
{
  return _[a1 makeLocalRouteController];
}

id objc_msgSend_makePairedHostDeviceRouteController(void *a1, const char *a2, ...)
{
  return _[a1 makePairedHostDeviceRouteController];
}

id objc_msgSend_manageDesignatedMembers_withType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manageDesignatedMembers:withType:");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_mappedLifetimePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mappedLifetimePolicy:");
}

id objc_msgSend_matchesDefaultProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesDefaultProviderIdentifier:");
}

id objc_msgSend_matchingSim(void *a1, const char *a2, ...)
{
  return _[a1 matchingSim];
}

id objc_msgSend_maxActiveParticipantFetchRetries(void *a1, const char *a2, ...)
{
  return _[a1 maxActiveParticipantFetchRetries];
}

id objc_msgSend_maxJunkLevel(void *a1, const char *a2, ...)
{
  return _[a1 maxJunkLevel];
}

id objc_msgSend_maxKickMemberRetries(void *a1, const char *a2, ...)
{
  return _[a1 maxKickMemberRetries];
}

id objc_msgSend_maxVideoDecodesAllowed(void *a1, const char *a2, ...)
{
  return _[a1 maxVideoDecodesAllowed];
}

id objc_msgSend_maximumCallGroups(void *a1, const char *a2, ...)
{
  return _[a1 maximumCallGroups];
}

id objc_msgSend_maximumCallsPerCallGroup(void *a1, const char *a2, ...)
{
  return _[a1 maximumCallsPerCallGroup];
}

id objc_msgSend_maximumNumberOfInvitedMembers(void *a1, const char *a2, ...)
{
  return _[a1 maximumNumberOfInvitedMembers];
}

id objc_msgSend_mayRequireBreakBeforeMake(void *a1, const char *a2, ...)
{
  return _[a1 mayRequireBreakBeforeMake];
}

id objc_msgSend_maybeAddComplementaryAssociationVoucherFor_toLocalMemberOf_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maybeAddComplementaryAssociationVoucherFor:toLocalMemberOf:completion:");
}

id objc_msgSend_meanFromDoubleNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meanFromDoubleNumbers:");
}

id objc_msgSend_meanRequestDuration(void *a1, const char *a2, ...)
{
  return _[a1 meanRequestDuration];
}

id objc_msgSend_mediaAssetManager(void *a1, const char *a2, ...)
{
  return _[a1 mediaAssetManager];
}

id objc_msgSend_mediaBlob(void *a1, const char *a2, ...)
{
  return _[a1 mediaBlob];
}

id objc_msgSend_mediaPlaybackOnExternalDevice(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlaybackOnExternalDevice];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_medianFromNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "medianFromNumbers:");
}

id objc_msgSend_medianRequestDuration(void *a1, const char *a2, ...)
{
  return _[a1 medianRequestDuration];
}

id objc_msgSend_memberExistsForParticipantDestination_groupSessionParticipantUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memberExistsForParticipantDestination:groupSessionParticipantUpdate:");
}

id objc_msgSend_memberExistsForParticipantDestination_members_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memberExistsForParticipantDestination:members:");
}

id objc_msgSend_memberHandlesAwaitingInvitesToLink(void *a1, const char *a2, ...)
{
  return _[a1 memberHandlesAwaitingInvitesToLink];
}

id objc_msgSend_memberHandlesEligibleForLinkApproval(void *a1, const char *a2, ...)
{
  return _[a1 memberHandlesEligibleForLinkApproval];
}

id objc_msgSend_memberIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 memberIdentifiers];
}

id objc_msgSend_memberWithHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memberWithHandle:");
}

id objc_msgSend_memberWithTUConversationMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memberWithTUConversationMember:");
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return _[a1 members];
}

id objc_msgSend_membersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "membersAtIndex:");
}

id objc_msgSend_membersCount(void *a1, const char *a2, ...)
{
  return _[a1 membersCount];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_mergeSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeSession:");
}

id objc_msgSend_mergeable(void *a1, const char *a2, ...)
{
  return _[a1 mergeable];
}

id objc_msgSend_mergedActiveRemoteParticipants(void *a1, const char *a2, ...)
{
  return _[a1 mergedActiveRemoteParticipants];
}

id objc_msgSend_mergedCallUpdate(void *a1, const char *a2, ...)
{
  return _[a1 mergedCallUpdate];
}

id objc_msgSend_mergedRemoteMembers(void *a1, const char *a2, ...)
{
  return _[a1 mergedRemoteMembers];
}

id objc_msgSend_mergedRemoteMembers_withLocalMember_removingLocallyAssociatedMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergedRemoteMembers:withLocalMember:removingLocallyAssociatedMember:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageProxy(void *a1, const char *a2, ...)
{
  return _[a1 messageProxy];
}

id objc_msgSend_messageRetryFailedForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageRetryFailedForConversationGroupUUID:");
}

id objc_msgSend_messageRetryIntervalMillis(void *a1, const char *a2, ...)
{
  return _[a1 messageRetryIntervalMillis];
}

id objc_msgSend_messageRetryMaxAttempts(void *a1, const char *a2, ...)
{
  return _[a1 messageRetryMaxAttempts];
}

id objc_msgSend_messageRetryStartedForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageRetryStartedForConversationGroupUUID:");
}

id objc_msgSend_messageRetrySucceededForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageRetrySucceededForConversationGroupUUID:");
}

id objc_msgSend_messageSendTime(void *a1, const char *a2, ...)
{
  return _[a1 messageSendTime];
}

id objc_msgSend_messagesGroupName(void *a1, const char *a2, ...)
{
  return _[a1 messagesGroupName];
}

id objc_msgSend_messagesGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 messagesGroupUUID];
}

id objc_msgSend_messagesGroupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 messagesGroupUUIDString];
}

id objc_msgSend_messagingConnectionCouldNotEstablishLinkForCalls_didStartConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagingConnectionCouldNotEstablishLinkForCalls:didStartConnecting:");
}

id objc_msgSend_messagingConnectionEndedForCalls_didStartConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagingConnectionEndedForCalls:didStartConnecting:");
}

id objc_msgSend_messagingConnectionFailedForCalls_didStartConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagingConnectionFailedForCalls:didStartConnecting:");
}

id objc_msgSend_messagingHandleTypeFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagingHandleTypeFor:");
}

id objc_msgSend_messenger_handledMessage_fromDestination_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messenger:handledMessage:fromDestination:device:");
}

id objc_msgSend_messengerConnectionCouldNotEstablishLink_forIdentifiers_didStartConnecting_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messengerConnectionCouldNotEstablishLink:forIdentifiers:didStartConnecting:");
}

id objc_msgSend_messengerConnectionEnded_forIdentifiers_didStartConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messengerConnectionEnded:forIdentifiers:didStartConnecting:");
}

id objc_msgSend_messengerConnectionFailed_forIdentifiers_didStartConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messengerConnectionFailed:forIdentifiers:didStartConnecting:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_migrateAnnounceCalls(void *a1, const char *a2, ...)
{
  return _[a1 migrateAnnounceCalls];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mixesVoiceWithMedia(void *a1, const char *a2, ...)
{
  return _[a1 mixesVoiceWithMedia];
}

id objc_msgSend_mobileCodesToISOCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 mobileCodesToISOCountryCode];
}

id objc_msgSend_mobileCountryCodeForSubscription_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mobileCountryCodeForSubscription:error:");
}

id objc_msgSend_mobileKeyLockState(void *a1, const char *a2, ...)
{
  return _[a1 mobileKeyLockState];
}

id objc_msgSend_mobileKeyLockStateBlock(void *a1, const char *a2, ...)
{
  return _[a1 mobileKeyLockStateBlock];
}

id objc_msgSend_mobileNetworkCodeForSubscription_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mobileNetworkCodeForSubscription:error:");
}

id objc_msgSend_mochiEnabled(void *a1, const char *a2, ...)
{
  return _[a1 mochiEnabled];
}

id objc_msgSend_mockCallWithNotificationCenter_fromBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockCallWithNotificationCenter:fromBlock:");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifier];
}

id objc_msgSend_moments(void *a1, const char *a2, ...)
{
  return _[a1 moments];
}

id objc_msgSend_momentsController_didCleanUpForStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentsController:didCleanUpForStream:");
}

id objc_msgSend_momentsController_didReceiveResultsForStream_withTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentsController:didReceiveResultsForStream:withTransactionID:");
}

id objc_msgSend_momentsController_didStartRequestForStream_withTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentsController:didStartRequestForStream:withTransactionID:");
}

id objc_msgSend_momentsController_registeredStream_withAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentsController:registeredStream:withAvailability:");
}

id objc_msgSend_momentsControllerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 momentsControllerClientXPCInterface];
}

id objc_msgSend_momentsControllerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 momentsControllerServerXPCInterface];
}

id objc_msgSend_momentsGenerator(void *a1, const char *a2, ...)
{
  return _[a1 momentsGenerator];
}

id objc_msgSend_momentsReportingSession_didGenerateUsageReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentsReportingSession:didGenerateUsageReport:");
}

id objc_msgSend_momentsRequestTimeout(void *a1, const char *a2, ...)
{
  return _[a1 momentsRequestTimeout];
}

id objc_msgSend_monitorForDeath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorForDeath:");
}

id objc_msgSend_mostRecentBestAppSuggestion(void *a1, const char *a2, ...)
{
  return _[a1 mostRecentBestAppSuggestion];
}

id objc_msgSend_mostRecentCompletedOneToOneEnabledValue(void *a1, const char *a2, ...)
{
  return _[a1 mostRecentCompletedOneToOneEnabledValue];
}

id objc_msgSend_mostRecentScreenShareAttributes(void *a1, const char *a2, ...)
{
  return _[a1 mostRecentScreenShareAttributes];
}

id objc_msgSend_moveExistingPreferencesToKeychain(void *a1, const char *a2, ...)
{
  return _[a1 moveExistingPreferencesToKeychain];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableChats(void *a1, const char *a2, ...)
{
  return _[a1 mutableChats];
}

id objc_msgSend_mutableConversationsByUUID(void *a1, const char *a2, ...)
{
  return _[a1 mutableConversationsByUUID];
}

id objc_msgSend_mutableConversationsRequestingUpgradeWithPreferences(void *a1, const char *a2, ...)
{
  return _[a1 mutableConversationsRequestingUpgradeWithPreferences];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutablePendingConversationsByPseudonym(void *a1, const char *a2, ...)
{
  return _[a1 mutablePendingConversationsByPseudonym];
}

id objc_msgSend_mutablePseudonymsByCallUUID(void *a1, const char *a2, ...)
{
  return _[a1 mutablePseudonymsByCallUUID];
}

id objc_msgSend_mutablePseudonymsByRequestIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 mutablePseudonymsByRequestIdentifiers];
}

id objc_msgSend_mutableSendDataCallbacksByRequestIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 mutableSendDataCallbacksByRequestIdentifiers];
}

id objc_msgSend_muteSessionInput_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "muteSessionInput:error:");
}

id objc_msgSend_mutedChangedForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutedChangedForConference:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameAndPhotoBackwardsCompatibilityEnabled(void *a1, const char *a2, ...)
{
  return _[a1 nameAndPhotoBackwardsCompatibilityEnabled];
}

id objc_msgSend_nameAndPhotoEnabled(void *a1, const char *a2, ...)
{
  return _[a1 nameAndPhotoEnabled];
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return _[a1 namePrefix];
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return _[a1 nameSuffix];
}

id objc_msgSend_needsConversationOrVideoRelaySupport(void *a1, const char *a2, ...)
{
  return _[a1 needsConversationOrVideoRelaySupport];
}

id objc_msgSend_needsConversationRelaySupport(void *a1, const char *a2, ...)
{
  return _[a1 needsConversationRelaySupport];
}

id objc_msgSend_needsManualInCallSounds(void *a1, const char *a2, ...)
{
  return _[a1 needsManualInCallSounds];
}

id objc_msgSend_negotiationDataForProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "negotiationDataForProtocolVersion:");
}

id objc_msgSend_neighborhoodActivityConduit(void *a1, const char *a2, ...)
{
  return _[a1 neighborhoodActivityConduit];
}

id objc_msgSend_networkCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 networkCountryCode];
}

id objc_msgSend_networkSupport(void *a1, const char *a2, ...)
{
  return _[a1 networkSupport];
}

id objc_msgSend_newHierarchyTokenFromParentToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHierarchyTokenFromParentToken:");
}

id objc_msgSend_newRequestWithMediaType_mode_requesteeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRequestWithMediaType:mode:requesteeID:");
}

id objc_msgSend_nextPauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 nextPauseDigits];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return _[a1 nickname];
}

id objc_msgSend_nicknameProvider(void *a1, const char *a2, ...)
{
  return _[a1 nicknameProvider];
}

id objc_msgSend_noConversationParticipantTimeout(void *a1, const char *a2, ...)
{
  return _[a1 noConversationParticipantTimeout];
}

id objc_msgSend_noConversationParticipantTimeoutBlock(void *a1, const char *a2, ...)
{
  return _[a1 noConversationParticipantTimeoutBlock];
}

id objc_msgSend_nonWifiFaceTimeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 nonWifiFaceTimeAvailable];
}

id objc_msgSend_normalizedDeviceType(void *a1, const char *a2, ...)
{
  return _[a1 normalizedDeviceType];
}

id objc_msgSend_normalizedEmailAddressHandleForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedEmailAddressHandleForValue:");
}

id objc_msgSend_normalizedGenericHandleForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedGenericHandleForValue:");
}

id objc_msgSend_normalizedHandleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedHandleWithDestinationID:");
}

id objc_msgSend_normalizedPhoneNumberHandleForValue_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedPhoneNumberHandleForValue:isoCountryCode:");
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notPredicateWithSubpredicate:");
}

id objc_msgSend_noteDismissedHandle_completionHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteDismissedHandle:completionHandle:");
}

id objc_msgSend_noteReportedNewIncomingVoIPCallForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteReportedNewIncomingVoIPCallForBundleIdentifier:");
}

id objc_msgSend_noticeManager_conversation_participant_addedNotice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noticeManager:conversation:participant:addedNotice:");
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 notificationCenter];
}

id objc_msgSend_notificationDisplayInformationForAudioPolicyManager_activity_conversation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationDisplayInformationForAudioPolicyManager:activity:conversation:");
}

id objc_msgSend_notificationStyles(void *a1, const char *a2, ...)
{
  return _[a1 notificationStyles];
}

id objc_msgSend_notificationStylesByHandleType(void *a1, const char *a2, ...)
{
  return _[a1 notificationStylesByHandleType];
}

id objc_msgSend_notifyClientsToConnectIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 notifyClientsToConnectIfNecessary];
}

id objc_msgSend_notifyDelegatesOfAVModeChanged_toAVMode_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfAVModeChanged:toAVMode:forConversation:");
}

id objc_msgSend_notifyDelegatesOfChangedLink_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfChangedLink:conversation:");
}

id objc_msgSend_notifyDelegatesOfChangedLinkDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfChangedLinkDescriptors:");
}

id objc_msgSend_notifyDelegatesOfInvalidLinkForPendingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfInvalidLinkForPendingConversation:");
}

id objc_msgSend_notifyDelegatesOfLetMeInRejectedForPendingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfLetMeInRejectedForPendingConversation:");
}

id objc_msgSend_notifyDelegatesOfMessage_fromHandle_forConversation_withUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfMessage:fromHandle:forConversation:withUpdate:");
}

id objc_msgSend_notifyDelegatesOfNewConversation_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfNewConversation:fromHandle:");
}

id objc_msgSend_notifyDelegatesOfRemoteScreenShareAttributes_isLocallySharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfRemoteScreenShareAttributes:isLocallySharing:");
}

id objc_msgSend_notifyDelegatesOfRemoteScreenShareEndedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfRemoteScreenShareEndedWithReason:");
}

id objc_msgSend_notifyDelegatesOfRemovedConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfRemovedConversationWithUUID:");
}

id objc_msgSend_notifyDelegatesOfTrackedPendingMember_forConversationLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesOfTrackedPendingMember:forConversationLink:");
}

id objc_msgSend_notifyDelegatesOfUpdatePendingConversations(void *a1, const char *a2, ...)
{
  return _[a1 notifyDelegatesOfUpdatePendingConversations];
}

id objc_msgSend_notifyPendingMembershipTrackerOfDelegatedMember(void *a1, const char *a2, ...)
{
  return _[a1 notifyPendingMembershipTrackerOfDelegatedMember];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberValue(void *a1, const char *a2, ...)
{
  return _[a1 numberValue];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForBlock(void *a1, const char *a2, ...)
{
  return _[a1 objectForBlock];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_valuesOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:valuesOfClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_observerToQueue(void *a1, const char *a2, ...)
{
  return _[a1 observerToQueue];
}

id objc_msgSend_oneToOneFaceTimeMyselfEnabled(void *a1, const char *a2, ...)
{
  return _[a1 oneToOneFaceTimeMyselfEnabled];
}

id objc_msgSend_oneToOneModeSwitchFailureForConversation_isOneToOneMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oneToOneModeSwitchFailureForConversation:isOneToOneMode:");
}

id objc_msgSend_ongoingDescription(void *a1, const char *a2, ...)
{
  return _[a1 ongoingDescription];
}

id objc_msgSend_onlyAvailableSessionConversationParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onlyAvailableSessionConversationParticipant:");
}

id objc_msgSend_openTransactions(void *a1, const char *a2, ...)
{
  return _[a1 openTransactions];
}

id objc_msgSend_openUserActivity_usingApplicationRecord_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openUserActivity:usingApplicationRecord:configuration:completionHandler:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_orderedSetWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithCapacity:");
}

id objc_msgSend_originType(void *a1, const char *a2, ...)
{
  return _[a1 originType];
}

id objc_msgSend_originalGUID(void *a1, const char *a2, ...)
{
  return _[a1 originalGUID];
}

id objc_msgSend_originalPauseDigitsString(void *a1, const char *a2, ...)
{
  return _[a1 originalPauseDigitsString];
}

id objc_msgSend_originalResolution(void *a1, const char *a2, ...)
{
  return _[a1 originalResolution];
}

id objc_msgSend_originalRingtoneSoundURL(void *a1, const char *a2, ...)
{
  return _[a1 originalRingtoneSoundURL];
}

id objc_msgSend_originalRingtoneSoundURLString(void *a1, const char *a2, ...)
{
  return _[a1 originalRingtoneSoundURLString];
}

id objc_msgSend_originatingDeviceType(void *a1, const char *a2, ...)
{
  return _[a1 originatingDeviceType];
}

id objc_msgSend_originatingUIType(void *a1, const char *a2, ...)
{
  return _[a1 originatingUIType];
}

id objc_msgSend_originator(void *a1, const char *a2, ...)
{
  return _[a1 originator];
}

id objc_msgSend_originatorHandle(void *a1, const char *a2, ...)
{
  return _[a1 originatorHandle];
}

id objc_msgSend_originatorTUHandle(void *a1, const char *a2, ...)
{
  return _[a1 originatorTUHandle];
}

id objc_msgSend_otherIMHandle(void *a1, const char *a2, ...)
{
  return _[a1 otherIMHandle];
}

id objc_msgSend_otherInvitedHandles(void *a1, const char *a2, ...)
{
  return _[a1 otherInvitedHandles];
}

id objc_msgSend_otherInvitedHandlesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otherInvitedHandlesAtIndex:");
}

id objc_msgSend_otherInvitedHandlesCount(void *a1, const char *a2, ...)
{
  return _[a1 otherInvitedHandlesCount];
}

id objc_msgSend_otherInvitedTUHandles(void *a1, const char *a2, ...)
{
  return _[a1 otherInvitedTUHandles];
}

id objc_msgSend_otherUniqueProxyIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 otherUniqueProxyIdentifiers];
}

id objc_msgSend_otherUniqueProxyIdentifiersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otherUniqueProxyIdentifiersAtIndex:");
}

id objc_msgSend_otherUniqueProxyIdentifiersCount(void *a1, const char *a2, ...)
{
  return _[a1 otherUniqueProxyIdentifiersCount];
}

id objc_msgSend_outFrequencyLevel(void *a1, const char *a2, ...)
{
  return _[a1 outFrequencyLevel];
}

id objc_msgSend_outIdentifierToConversationInfo(void *a1, const char *a2, ...)
{
  return _[a1 outIdentifierToConversationInfo];
}

id objc_msgSend_outgoingCallFromDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingCallFromDialRequest:");
}

id objc_msgSend_outgoingCallFromJoinRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingCallFromJoinRequest:");
}

id objc_msgSend_outgoingCallerID(void *a1, const char *a2, ...)
{
  return _[a1 outgoingCallerID];
}

id objc_msgSend_outgoingCallerIDChanged(void *a1, const char *a2, ...)
{
  return _[a1 outgoingCallerIDChanged];
}

id objc_msgSend_outgoingChatGenerator(void *a1, const char *a2, ...)
{
  return _[a1 outgoingChatGenerator];
}

id objc_msgSend_outgoingPinRequestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 outgoingPinRequestIdentifier];
}

id objc_msgSend_outgoingRelayCallerID(void *a1, const char *a2, ...)
{
  return _[a1 outgoingRelayCallerID];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 outgoingResponseIdentifier];
}

id objc_msgSend_outgoingSessionProviderGenerator(void *a1, const char *a2, ...)
{
  return _[a1 outgoingSessionProviderGenerator];
}

id objc_msgSend_outputAudioPowerSpectrumToken(void *a1, const char *a2, ...)
{
  return _[a1 outputAudioPowerSpectrumToken];
}

id objc_msgSend_outputAudioPowerSpectrumTokenForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputAudioPowerSpectrumTokenForIdentifier:");
}

id objc_msgSend_paddingForHashedValue(void *a1, const char *a2, ...)
{
  return _[a1 paddingForHashedValue];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevice];
}

id objc_msgSend_pairedDeviceExists(void *a1, const char *a2, ...)
{
  return _[a1 pairedDeviceExists];
}

id objc_msgSend_pairedDeviceMessenger(void *a1, const char *a2, ...)
{
  return _[a1 pairedDeviceMessenger];
}

id objc_msgSend_pairedDeviceUniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 pairedDeviceUniqueIDOverride];
}

id objc_msgSend_pairedDeviceUniqueIDOverrideExists(void *a1, const char *a2, ...)
{
  return _[a1 pairedDeviceUniqueIDOverrideExists];
}

id objc_msgSend_pairedHostDeviceProvidersByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pairedHostDeviceProvidersByIdentifier];
}

id objc_msgSend_pairedHostDeviceProvidersByIdentifierForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairedHostDeviceProvidersByIdentifierForClient:");
}

id objc_msgSend_pairedHostDeviceProvidersByIdentifierForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairedHostDeviceProvidersByIdentifierForRemoteClients:");
}

id objc_msgSend_pairedHostDeviceRouteController(void *a1, const char *a2, ...)
{
  return _[a1 pairedHostDeviceRouteController];
}

id objc_msgSend_pairedHostDeviceState(void *a1, const char *a2, ...)
{
  return _[a1 pairedHostDeviceState];
}

id objc_msgSend_pairedHostKeychainItem(void *a1, const char *a2, ...)
{
  return _[a1 pairedHostKeychainItem];
}

id objc_msgSend_participantAssociation(void *a1, const char *a2, ...)
{
  return _[a1 participantAssociation];
}

id objc_msgSend_participantAssociationWithTUConversationParticipantAssociation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantAssociationWithTUConversationParticipantAssociation:");
}

id objc_msgSend_participantData(void *a1, const char *a2, ...)
{
  return _[a1 participantData];
}

id objc_msgSend_participantDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 participantDestinationID];
}

id objc_msgSend_participantDestinationIDs(void *a1, const char *a2, ...)
{
  return _[a1 participantDestinationIDs];
}

id objc_msgSend_participantGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 participantGroupUUID];
}

id objc_msgSend_participantID(void *a1, const char *a2, ...)
{
  return _[a1 participantID];
}

id objc_msgSend_participantIDForAlias_salt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantIDForAlias:salt:");
}

id objc_msgSend_participantIDForAlias_salt_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantIDForAlias:salt:completion:");
}

id objc_msgSend_participantIDToURIRemovedEnabled(void *a1, const char *a2, ...)
{
  return _[a1 participantIDToURIRemovedEnabled];
}

id objc_msgSend_participantIDs(void *a1, const char *a2, ...)
{
  return _[a1 participantIDs];
}

id objc_msgSend_participantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 participantIdentifier];
}

id objc_msgSend_participantPushToken(void *a1, const char *a2, ...)
{
  return _[a1 participantPushToken];
}

id objc_msgSend_participantRefreshBlock(void *a1, const char *a2, ...)
{
  return _[a1 participantRefreshBlock];
}

id objc_msgSend_participantURI(void *a1, const char *a2, ...)
{
  return _[a1 participantURI];
}

id objc_msgSend_participantUpdateSanitizer(void *a1, const char *a2, ...)
{
  return _[a1 participantUpdateSanitizer];
}

id objc_msgSend_participantUpdateSubtype(void *a1, const char *a2, ...)
{
  return _[a1 participantUpdateSubtype];
}

id objc_msgSend_participantUpdateType(void *a1, const char *a2, ...)
{
  return _[a1 participantUpdateType];
}

id objc_msgSend_participantWithCSDConversationJoinContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantWithCSDConversationJoinContext:");
}

id objc_msgSend_participantWithCSDConversationParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantWithCSDConversationParticipant:");
}

id objc_msgSend_participantWithTUConversationParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantWithTUConversationParticipant:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 pauseDigits];
}

id objc_msgSend_pauseDigitsQueue(void *a1, const char *a2, ...)
{
  return _[a1 pauseDigitsQueue];
}

id objc_msgSend_pauseDigitsQueueChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseDigitsQueueChanged:");
}

id objc_msgSend_pauseVideoToStart(void *a1, const char *a2, ...)
{
  return _[a1 pauseVideoToStart];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_pendData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendData:completion:");
}

id objc_msgSend_pendingAllowedMembers(void *a1, const char *a2, ...)
{
  return _[a1 pendingAllowedMembers];
}

id objc_msgSend_pendingCallActionsOfClass_withCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingCallActionsOfClass:withCallUUID:");
}

id objc_msgSend_pendingCallInfoDict(void *a1, const char *a2, ...)
{
  return _[a1 pendingCallInfoDict];
}

id objc_msgSend_pendingCallsToChatUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 pendingCallsToChatUUIDs];
}

id objc_msgSend_pendingCodesToDevicesForApproval(void *a1, const char *a2, ...)
{
  return _[a1 pendingCodesToDevicesForApproval];
}

id objc_msgSend_pendingCompletions(void *a1, const char *a2, ...)
{
  return _[a1 pendingCompletions];
}

id objc_msgSend_pendingConversationCleanupTimer(void *a1, const char *a2, ...)
{
  return _[a1 pendingConversationCleanupTimer];
}

id objc_msgSend_pendingConversationParticipantsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pendingConversationParticipantsByIdentifier];
}

id objc_msgSend_pendingConversationUUIDForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingConversationUUIDForCallWithUUID:");
}

id objc_msgSend_pendingConversationUUIDWithPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingConversationUUIDWithPseudonym:");
}

id objc_msgSend_pendingConversationWithPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingConversationWithPseudonym:");
}

id objc_msgSend_pendingData(void *a1, const char *a2, ...)
{
  return _[a1 pendingData];
}

id objc_msgSend_pendingKickedMembersByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pendingKickedMembersByIdentifier];
}

id objc_msgSend_pendingMemberHandles(void *a1, const char *a2, ...)
{
  return _[a1 pendingMemberHandles];
}

id objc_msgSend_pendingMembers(void *a1, const char *a2, ...)
{
  return _[a1 pendingMembers];
}

id objc_msgSend_pendingMembersByGroup(void *a1, const char *a2, ...)
{
  return _[a1 pendingMembersByGroup];
}

id objc_msgSend_pendingMembershipTracker(void *a1, const char *a2, ...)
{
  return _[a1 pendingMembershipTracker];
}

id objc_msgSend_pendingPulledCallContexts(void *a1, const char *a2, ...)
{
  return _[a1 pendingPulledCallContexts];
}

id objc_msgSend_pendingRemoteMembers(void *a1, const char *a2, ...)
{
  return _[a1 pendingRemoteMembers];
}

id objc_msgSend_pendingRemovedParticipantsByID(void *a1, const char *a2, ...)
{
  return _[a1 pendingRemovedParticipantsByID];
}

id objc_msgSend_pendingRemovedRemoteParticipantByIdentififer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingRemovedRemoteParticipantByIdentififer:");
}

id objc_msgSend_pendingRequestCount(void *a1, const char *a2, ...)
{
  return _[a1 pendingRequestCount];
}

id objc_msgSend_pendingTransactions(void *a1, const char *a2, ...)
{
  return _[a1 pendingTransactions];
}

id objc_msgSend_performAnswerCall_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnswerCall:withRequest:");
}

id objc_msgSend_performAnswerCallAsAudioDowngrade_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnswerCallAsAudioDowngrade:withRequest:");
}

id objc_msgSend_performAnswerCallAsVideoUpgrade_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnswerCallAsVideoUpgrade:withRequest:");
}

id objc_msgSend_performAsynchronousBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAsynchronousBlock:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlock_coalescedByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:coalescedByIdentifier:");
}

id objc_msgSend_performBlockAfterCoalescing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAfterCoalescing:");
}

id objc_msgSend_performBlockAfterFirstUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAfterFirstUnlock:");
}

id objc_msgSend_performBlockOnClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockOnClients:");
}

id objc_msgSend_performBlockOnClients_coalescedByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockOnClients:coalescedByIdentifier:");
}

id objc_msgSend_performBlockOnQueue_andWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockOnQueue:andWait:");
}

id objc_msgSend_performBlockOnTransportAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockOnTransportAvailability:");
}

id objc_msgSend_performBlockOnTransportAvailability_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockOnTransportAvailability:forIdentifier:");
}

id objc_msgSend_performCallAction_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallAction:forCall:");
}

id objc_msgSend_performChanges_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performChanges:completionHandler:");
}

id objc_msgSend_performDialCall_displayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDialCall:displayContext:");
}

id objc_msgSend_performDisconnectAllCallsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDisconnectAllCallsWithReason:");
}

id objc_msgSend_performDisconnectCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDisconnectCall:");
}

id objc_msgSend_performDisconnectCurrentCallAndActivateHeld(void *a1, const char *a2, ...)
{
  return _[a1 performDisconnectCurrentCallAndActivateHeld];
}

id objc_msgSend_performEndActiveAndAnswerCall_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performEndActiveAndAnswerCall:withRequest:");
}

id objc_msgSend_performEndHeldAndAnswerCall_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performEndHeldAndAnswerCall:withRequest:");
}

id objc_msgSend_performFileCopierOperation_onInputURL_outputURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFileCopierOperation:onInputURL:outputURL:completion:");
}

id objc_msgSend_performGroupCall_withCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performGroupCall:withCall:");
}

id objc_msgSend_performHoldActiveAndAnswerCall_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHoldActiveAndAnswerCall:withRequest:");
}

id objc_msgSend_performHoldCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHoldCall:");
}

id objc_msgSend_performJoinCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performJoinCallAction:");
}

id objc_msgSend_performJoinConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performJoinConversation:");
}

id objc_msgSend_performPlayDTMFToneForCall_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPlayDTMFToneForCall:key:");
}

id objc_msgSend_performPullCallFromClientUsingHandoffActivityUserInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPullCallFromClientUsingHandoffActivityUserInfo:completion:");
}

id objc_msgSend_performPullHostedCallsFromPairedHostDevice(void *a1, const char *a2, ...)
{
  return _[a1 performPullHostedCallsFromPairedHostDevice];
}

id objc_msgSend_performPullRelayingCallsFromClientAndUpdateEndpoint_updateExpectedDestination_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPullRelayingCallsFromClientAndUpdateEndpoint:updateExpectedDestination:");
}

id objc_msgSend_performPullRelayingCallsFromClientAndUpdateEndpoint_updateExpectedDestination_onlyIfNeedsEndpointConversationRelaySupport_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "performPullRelayingCallsFromClientAndUpdateEndpoint:updateExpectedDestination:onlyIfNeedsEndpointConversationRelaySupport:");
}

id objc_msgSend_performPushHostedCallsToDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPushHostedCallsToDestination:");
}

id objc_msgSend_performPushRelayingCallsToHostWithSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPushRelayingCallsToHostWithSourceIdentifier:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSendMMIOrUSSDCodeWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSendMMIOrUSSDCodeWithRequest:");
}

id objc_msgSend_performSetLiveVoicemailUnavailableReason_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSetLiveVoicemailUnavailableReason:forCall:");
}

id objc_msgSend_performSetTTYType_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSetTTYType:forCall:");
}

id objc_msgSend_performSetUplinkMuted_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSetUplinkMuted:forCall:");
}

id objc_msgSend_performStartCallAction_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performStartCallAction:forCall:");
}

id objc_msgSend_performSwapCalls(void *a1, const char *a2, ...)
{
  return _[a1 performSwapCalls];
}

id objc_msgSend_performSynchronousBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSynchronousBlock:");
}

id objc_msgSend_performUngroupCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUngroupCall:");
}

id objc_msgSend_performUnholdCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUnholdCall:");
}

id objc_msgSend_performUpdateCallWithProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUpdateCallWithProxy:");
}

id objc_msgSend_permitJoin(void *a1, const char *a2, ...)
{
  return _[a1 permitJoin];
}

id objc_msgSend_persistenceController(void *a1, const char *a2, ...)
{
  return _[a1 persistenceController];
}

id objc_msgSend_personNameComponents(void *a1, const char *a2, ...)
{
  return _[a1 personNameComponents];
}

id objc_msgSend_personaHandshakeBlobCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 personaHandshakeBlobCreationBlock];
}

id objc_msgSend_personalNickname(void *a1, const char *a2, ...)
{
  return _[a1 personalNickname];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_phoneNumberMCCToISOCountryCodeTransformBlock(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumberMCCToISOCountryCodeTransformBlock];
}

id objc_msgSend_phoneNumberURI(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumberURI];
}

id objc_msgSend_phoneNumberWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithDigits:countryCode:");
}

id objc_msgSend_phoneticRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 phoneticRepresentation];
}

id objc_msgSend_photoRequestDurations(void *a1, const char *a2, ...)
{
  return _[a1 photoRequestDurations];
}

id objc_msgSend_photoRequestFailureCount(void *a1, const char *a2, ...)
{
  return _[a1 photoRequestFailureCount];
}

id objc_msgSend_photoRequestSuccessCount(void *a1, const char *a2, ...)
{
  return _[a1 photoRequestSuccessCount];
}

id objc_msgSend_pickInitiatorFromActiveParticipants_forUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickInitiatorFromActiveParticipants:forUpdate:");
}

id objc_msgSend_pickRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickRoute:");
}

id objc_msgSend_pickRouteForRapportDeviceWithMediaSystemIdentifier_effectiveIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickRouteForRapportDeviceWithMediaSystemIdentifier:effectiveIdentifier:");
}

id objc_msgSend_pickRouteWithUniqueIdentifier_shouldWaitUntilAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickRouteWithUniqueIdentifier:shouldWaitUntilAvailable:");
}

id objc_msgSend_pickableRoutesForCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickableRoutesForCategory:");
}

id objc_msgSend_pickableRoutesForCategory_andMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickableRoutesForCategory:andMode:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pidToCachedProviderIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 pidToCachedProviderIdentifiers];
}

id objc_msgSend_pidToProcessHandle(void *a1, const char *a2, ...)
{
  return _[a1 pidToProcessHandle];
}

id objc_msgSend_pidToProviderIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 pidToProviderIdentifiers];
}

id objc_msgSend_pinCodeEnteredSuccessfully_cancelled_onPrimaryDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinCodeEnteredSuccessfully:cancelled:onPrimaryDevice:");
}

id objc_msgSend_pinExchangeDelegate(void *a1, const char *a2, ...)
{
  return _[a1 pinExchangeDelegate];
}

id objc_msgSend_placeholderForCreatedAsset(void *a1, const char *a2, ...)
{
  return _[a1 placeholderForCreatedAsset];
}

id objc_msgSend_playLocalDTMFToneForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playLocalDTMFToneForKey:");
}

id objc_msgSend_playRemoteDTMFToneForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playRemoteDTMFToneForKey:");
}

id objc_msgSend_pluginName(void *a1, const char *a2, ...)
{
  return _[a1 pluginName];
}

id objc_msgSend_postEndEventForSession_originator_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postEndEventForSession:originator:conversation:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postSessionStartedForSession_originator_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postSessionStartedForSession:originator:conversation:");
}

id objc_msgSend_postSharePlayActivityDidChangeNotificationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postSharePlayActivityDidChangeNotificationIfNecessary:");
}

id objc_msgSend_postUserNotificationForUnsupportedScreenSharingActivity_alternateReponseHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postUserNotificationForUnsupportedScreenSharingActivity:alternateReponseHandler:");
}

id objc_msgSend_predicateForCallsWithAnyServiceProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithAnyServiceProviders:");
}

id objc_msgSend_predicateForCallsWithStatusRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithStatusRead:");
}

id objc_msgSend_predicateForInEarAudioRoute(void *a1, const char *a2, ...)
{
  return _[a1 predicateForInEarAudioRoute];
}

id objc_msgSend_predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch(void *a1, const char *a2, ...)
{
  return _[a1 predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch];
}

id objc_msgSend_predicateForInEarRouteInTipiWithCompanionWatch(void *a1, const char *a2, ...)
{
  return _[a1 predicateForInEarRouteInTipiWithCompanionWatch];
}

id objc_msgSend_predicateForPreferredRoute(void *a1, const char *a2, ...)
{
  return _[a1 predicateForPreferredRoute];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return _[a1 preferences];
}

id objc_msgSend_preferencesForKeyBlock(void *a1, const char *a2, ...)
{
  return _[a1 preferencesForKeyBlock];
}

id objc_msgSend_preferredAndActiveRoute(void *a1, const char *a2, ...)
{
  return _[a1 preferredAndActiveRoute];
}

id objc_msgSend_preferredBroadcastingAttributes(void *a1, const char *a2, ...)
{
  return _[a1 preferredBroadcastingAttributes];
}

id objc_msgSend_preferredRoute(void *a1, const char *a2, ...)
{
  return _[a1 preferredRoute];
}

id objc_msgSend_preferredRouteForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredRouteForCall:");
}

id objc_msgSend_preferredSceneSessionRole(void *a1, const char *a2, ...)
{
  return _[a1 preferredSceneSessionRole];
}

id objc_msgSend_preferredVoiceSubscriptionUUID(void *a1, const char *a2, ...)
{
  return _[a1 preferredVoiceSubscriptionUUID];
}

id objc_msgSend_prefersExclusiveAccessToCellularNetwork(void *a1, const char *a2, ...)
{
  return _[a1 prefersExclusiveAccessToCellularNetwork];
}

id objc_msgSend_prefersToPlayDuringWombat(void *a1, const char *a2, ...)
{
  return _[a1 prefersToPlayDuringWombat];
}

id objc_msgSend_prefixedURI(void *a1, const char *a2, ...)
{
  return _[a1 prefixedURI];
}

id objc_msgSend_prepareAdditionOfActiveParticipant_toInvitedMembersForLinkOnConversation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareAdditionOfActiveParticipant:toInvitedMembersForLinkOnConversation:");
}

id objc_msgSend_prepareConference(void *a1, const char *a2, ...)
{
  return _[a1 prepareConference];
}

id objc_msgSend_prepareConferenceConnection_remoteInviteDictionary_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareConferenceConnection:remoteInviteDictionary:completion:");
}

id objc_msgSend_prepareConferenceForCall_remoteInviteDictionary_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareConferenceForCall:remoteInviteDictionary:completion:");
}

id objc_msgSend_prepareConnectedSessionsToEnd(void *a1, const char *a2, ...)
{
  return _[a1 prepareConnectedSessionsToEnd];
}

id objc_msgSend_prepareConversationWithUUID_withHandoffContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareConversationWithUUID:withHandoffContext:");
}

id objc_msgSend_prepareSessionToEndForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSessionToEndForIdentifier:");
}

id objc_msgSend_prepareToDisconnectMessagingConnectionForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareToDisconnectMessagingConnectionForCall:");
}

id objc_msgSend_prepareToEnd(void *a1, const char *a2, ...)
{
  return _[a1 prepareToEnd];
}

id objc_msgSend_prepareToStopConferenceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareToStopConferenceForIdentifier:");
}

id objc_msgSend_prepareToStopTimeout(void *a1, const char *a2, ...)
{
  return _[a1 prepareToStopTimeout];
}

id objc_msgSend_prepareWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareWithConfiguration:");
}

id objc_msgSend_presentDismissalAlertForActivitySessionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDismissalAlertForActivitySessionWithUUID:");
}

id objc_msgSend_presentDismissalAlertForActivitySessionWithUUID_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDismissalAlertForActivitySessionWithUUID:onConversationWithUUID:");
}

id objc_msgSend_presentSessionDismissalAlertForActivitySessionUUID_allowingCancellation_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentSessionDismissalAlertForActivitySessionUUID:allowingCancellation:completionHandler:");
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return _[a1 presentationContext];
}

id objc_msgSend_presentationInfo(void *a1, const char *a2, ...)
{
  return _[a1 presentationInfo];
}

id objc_msgSend_presentationLayoutForGridDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationLayoutForGridDisplayMode:");
}

id objc_msgSend_presentationMode(void *a1, const char *a2, ...)
{
  return _[a1 presentationMode];
}

id objc_msgSend_presentationRect(void *a1, const char *a2, ...)
{
  return _[a1 presentationRect];
}

id objc_msgSend_presentationState(void *a1, const char *a2, ...)
{
  return _[a1 presentationState];
}

id objc_msgSend_presentationStateForConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationStateForConversationWithUUID:");
}

id objc_msgSend_primaryAvcIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 primaryAvcIdentifier];
}

id objc_msgSend_primaryDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 primaryDeviceID];
}

id objc_msgSend_primaryHandle(void *a1, const char *a2, ...)
{
  return _[a1 primaryHandle];
}

id objc_msgSend_primaryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 primaryIdentifier];
}

id objc_msgSend_primaryThumperAccountUsingDevices_outgoingCallerIDURI_requireMatchingCallerIDURI_requireAvailableDeviceSlots_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "primaryThumperAccountUsingDevices:outgoingCallerIDURI:requireMatchingCallerIDURI:requireAvailableDeviceSlots:");
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedSenderIdentities];
}

id objc_msgSend_prioritizedSenderIdentitiesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prioritizedSenderIdentitiesAtIndex:");
}

id objc_msgSend_prioritizedSenderIdentitiesCount(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedSenderIdentitiesCount];
}

id objc_msgSend_prioritizedTUSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedTUSenderIdentities];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return _[a1 privateKey];
}

id objc_msgSend_proceedToJoinForConversation_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proceedToJoinForConversation:action:");
}

id objc_msgSend_proceedToNewPendingConversationForLink_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proceedToNewPendingConversationForLink:action:");
}

id objc_msgSend_processAssertionManager(void *a1, const char *a2, ...)
{
  return _[a1 processAssertionManager];
}

id objc_msgSend_processBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processBundleIdentifier];
}

id objc_msgSend_processGroupSessionParticipantUpdate_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processGroupSessionParticipantUpdate:context:");
}

id objc_msgSend_processHandle(void *a1, const char *a2, ...)
{
  return _[a1 processHandle];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processJoinUpdate_fromHandle_senderCorrelationIdentifier_isFromPendingMessage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processJoinUpdate:fromHandle:senderCorrelationIdentifier:isFromPendingMessage:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processObserver(void *a1, const char *a2, ...)
{
  return _[a1 processObserver];
}

id objc_msgSend_processParticipantDataUpdate_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processParticipantDataUpdate:fromHandle:");
}

id objc_msgSend_processStatusChangeAsHandedOffIfNecessaryForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processStatusChangeAsHandedOffIfNecessaryForCall:");
}

id objc_msgSend_processUpdateMembersUpdate_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUpdateMembersUpdate:fromHandle:");
}

id objc_msgSend_processUpdatedNickname_forHandle_conversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUpdatedNickname:forHandle:conversationUUID:");
}

id objc_msgSend_profileID(void *a1, const char *a2, ...)
{
  return _[a1 profileID];
}

id objc_msgSend_prominence(void *a1, const char *a2, ...)
{
  return _[a1 prominence];
}

id objc_msgSend_prominenceEntryAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prominenceEntryAtIndex:");
}

id objc_msgSend_prominenceEntrys(void *a1, const char *a2, ...)
{
  return _[a1 prominenceEntrys];
}

id objc_msgSend_prominenceEntrysCount(void *a1, const char *a2, ...)
{
  return _[a1 prominenceEntrysCount];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_propertiesChanged(void *a1, const char *a2, ...)
{
  return _[a1 propertiesChanged];
}

id objc_msgSend_propertiesChangedForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesChangedForCall:");
}

id objc_msgSend_propertiesDescription(void *a1, const char *a2, ...)
{
  return _[a1 propertiesDescription];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protectedAppsUtilities(void *a1, const char *a2, ...)
{
  return _[a1 protectedAppsUtilities];
}

id objc_msgSend_protoCallAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protoCallAtIndex:");
}

id objc_msgSend_protoCallCapabilitiesState(void *a1, const char *a2, ...)
{
  return _[a1 protoCallCapabilitiesState];
}

id objc_msgSend_protoCallModel(void *a1, const char *a2, ...)
{
  return _[a1 protoCallModel];
}

id objc_msgSend_protoCallModelState(void *a1, const char *a2, ...)
{
  return _[a1 protoCallModelState];
}

id objc_msgSend_protoCalls(void *a1, const char *a2, ...)
{
  return _[a1 protoCalls];
}

id objc_msgSend_protoCallsCount(void *a1, const char *a2, ...)
{
  return _[a1 protoCallsCount];
}

id objc_msgSend_protoCannotBeAnswered(void *a1, const char *a2, ...)
{
  return _[a1 protoCannotBeAnswered];
}

id objc_msgSend_protoCannotRelayAudioOrVideoOnPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 protoCannotRelayAudioOrVideoOnPairedDevice];
}

id objc_msgSend_protoConferenced(void *a1, const char *a2, ...)
{
  return _[a1 protoConferenced];
}

id objc_msgSend_protoCurrentlyPicked(void *a1, const char *a2, ...)
{
  return _[a1 protoCurrentlyPicked];
}

id objc_msgSend_protoDTMFKey(void *a1, const char *a2, ...)
{
  return _[a1 protoDTMFKey];
}

id objc_msgSend_protoDisconnectedReason(void *a1, const char *a2, ...)
{
  return _[a1 protoDisconnectedReason];
}

id objc_msgSend_protoDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 protoDisplayContext];
}

id objc_msgSend_protoEmergency(void *a1, const char *a2, ...)
{
  return _[a1 protoEmergency];
}

id objc_msgSend_protoExpectedEndpointOnMessagingDevice(void *a1, const char *a2, ...)
{
  return _[a1 protoExpectedEndpointOnMessagingDevice];
}

id objc_msgSend_protoFailureExpected(void *a1, const char *a2, ...)
{
  return _[a1 protoFailureExpected];
}

id objc_msgSend_protoGuest(void *a1, const char *a2, ...)
{
  return _[a1 protoGuest];
}

id objc_msgSend_protoHasSentInvitation(void *a1, const char *a2, ...)
{
  return _[a1 protoHasSentInvitation];
}

id objc_msgSend_protoMomentsV2Available(void *a1, const char *a2, ...)
{
  return _[a1 protoMomentsV2Available];
}

id objc_msgSend_protoNeedsManualInCallSounds(void *a1, const char *a2, ...)
{
  return _[a1 protoNeedsManualInCallSounds];
}

id objc_msgSend_protoOriginatingUIType(void *a1, const char *a2, ...)
{
  return _[a1 protoOriginatingUIType];
}

id objc_msgSend_protoOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 protoOutgoing];
}

id objc_msgSend_protoPersonNameComponents(void *a1, const char *a2, ...)
{
  return _[a1 protoPersonNameComponents];
}

id objc_msgSend_protoProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 protoProtocolVersion];
}

id objc_msgSend_protoProvider(void *a1, const char *a2, ...)
{
  return _[a1 protoProvider];
}

id objc_msgSend_protoRemoteUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 protoRemoteUplinkMuted];
}

id objc_msgSend_protoSOS(void *a1, const char *a2, ...)
{
  return _[a1 protoSOS];
}

id objc_msgSend_protoSenderMuteUplink(void *a1, const char *a2, ...)
{
  return _[a1 protoSenderMuteUplink];
}

id objc_msgSend_protoService(void *a1, const char *a2, ...)
{
  return _[a1 protoService];
}

id objc_msgSend_protoShouldSuppressInCallUI(void *a1, const char *a2, ...)
{
  return _[a1 protoShouldSuppressInCallUI];
}

id objc_msgSend_protoShouldSuppressRingtone(void *a1, const char *a2, ...)
{
  return _[a1 protoShouldSuppressRingtone];
}

id objc_msgSend_protoStatus(void *a1, const char *a2, ...)
{
  return _[a1 protoStatus];
}

id objc_msgSend_protoSupportedHandleTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protoSupportedHandleTypeAtIndex:");
}

id objc_msgSend_protoSupportedHandleTypesCount(void *a1, const char *a2, ...)
{
  return _[a1 protoSupportedHandleTypesCount];
}

id objc_msgSend_protoSupportsDTMFUpdates(void *a1, const char *a2, ...)
{
  return _[a1 protoSupportsDTMFUpdates];
}

id objc_msgSend_protoSupportsEmergencyFallback(void *a1, const char *a2, ...)
{
  return _[a1 protoSupportsEmergencyFallback];
}

id objc_msgSend_protoSupportsRelay(void *a1, const char *a2, ...)
{
  return _[a1 protoSupportsRelay];
}

id objc_msgSend_protoSupportsTTYWithVoice(void *a1, const char *a2, ...)
{
  return _[a1 protoSupportsTTYWithVoice];
}

id objc_msgSend_protoTTYType(void *a1, const char *a2, ...)
{
  return _[a1 protoTTYType];
}

id objc_msgSend_protoTimeConnected(void *a1, const char *a2, ...)
{
  return _[a1 protoTimeConnected];
}

id objc_msgSend_protoUUID(void *a1, const char *a2, ...)
{
  return _[a1 protoUUID];
}

id objc_msgSend_protoUpgradeSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 protoUpgradeSessionUUID];
}

id objc_msgSend_protoUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 protoUplinkMuted];
}

id objc_msgSend_protoVoicemail(void *a1, const char *a2, ...)
{
  return _[a1 protoVoicemail];
}

id objc_msgSend_protoWantsHoldMusic(void *a1, const char *a2, ...)
{
  return _[a1 protoWantsHoldMusic];
}

id objc_msgSend_protoWantsVideo(void *a1, const char *a2, ...)
{
  return _[a1 protoWantsVideo];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 protocolVersion];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_provider_didActivateAudioSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:didActivateAudioSession:");
}

id objc_msgSend_provider_didDeactivateAudioSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:didDeactivateAudioSession:");
}

id objc_msgSend_provider_performAnswerCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performAnswerCallAction:");
}

id objc_msgSend_provider_performEnableVideoCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performEnableVideoCallAction:");
}

id objc_msgSend_provider_performEndCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performEndCallAction:");
}

id objc_msgSend_provider_performJoinCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performJoinCallAction:");
}

id objc_msgSend_provider_performJoinCallAction_shouldUseIDSDemuxer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performJoinCallAction:shouldUseIDSDemuxer:");
}

id objc_msgSend_provider_performSetAllowUplinkAudioInjectionAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetAllowUplinkAudioInjectionAction:");
}

id objc_msgSend_provider_performSetHeldCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetHeldCallAction:");
}

id objc_msgSend_provider_performSetMutedCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetMutedCallAction:");
}

id objc_msgSend_provider_performSetRelayingCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetRelayingCallAction:");
}

id objc_msgSend_provider_performSetScreenShareAttributesCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetScreenShareAttributesCallAction:");
}

id objc_msgSend_provider_performSetScreeningCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetScreeningCallAction:");
}

id objc_msgSend_provider_performSetSendingVideoCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetSendingVideoCallAction:");
}

id objc_msgSend_provider_performSetSharingScreenCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetSharingScreenCallAction:");
}

id objc_msgSend_provider_performSetVideoPresentationSizeCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetVideoPresentationSizeCallAction:");
}

id objc_msgSend_provider_performSetVideoPresentationStateCallAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performSetVideoPresentationStateCallAction:");
}

id objc_msgSend_provider_performStartCallAction_shouldUseIDSDemuxer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider:performStartCallAction:shouldUseIDSDemuxer:");
}

id objc_msgSend_providerCallDataSource(void *a1, const char *a2, ...)
{
  return _[a1 providerCallDataSource];
}

id objc_msgSend_providerCallDelegate(void *a1, const char *a2, ...)
{
  return _[a1 providerCallDelegate];
}

id objc_msgSend_providerConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 providerConfiguration];
}

id objc_msgSend_providerContext(void *a1, const char *a2, ...)
{
  return _[a1 providerContext];
}

id objc_msgSend_providerDelegate_callWithUUID_connectedAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:callWithUUID:connectedAtDate:");
}

id objc_msgSend_providerDelegate_callWithUUID_endedAtDate_withReason_failureContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:callWithUUID:endedAtDate:withReason:failureContext:");
}

id objc_msgSend_providerDelegate_callWithUUID_startedConnectingAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:callWithUUID:startedConnectingAtDate:");
}

id objc_msgSend_providerDelegate_endOtherProvidersCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:endOtherProvidersCallWithUUID:");
}

id objc_msgSend_providerDelegate_isExclusivelyManagingCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:isExclusivelyManagingCallWithUUID:");
}

id objc_msgSend_providerDelegate_isManagingCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:isManagingCallWithUUID:");
}

id objc_msgSend_providerDelegate_requestedTransaction_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDelegate:requestedTransaction:completion:");
}

id objc_msgSend_providerDelegate_requestedUpgradeToExistingCallForConversation_withSessionToken_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "providerDelegate:requestedUpgradeToExistingCallForConversation:withSessionToken:completion:");
}

id objc_msgSend_providerDidBegin(void *a1, const char *a2, ...)
{
  return _[a1 providerDidBegin];
}

id objc_msgSend_providerDidBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDidBegin:");
}

id objc_msgSend_providerDidReset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerDidReset:");
}

id objc_msgSend_providerEndedReason(void *a1, const char *a2, ...)
{
  return _[a1 providerEndedReason];
}

id objc_msgSend_providerErrorCode(void *a1, const char *a2, ...)
{
  return _[a1 providerErrorCode];
}

id objc_msgSend_providerForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForIdentifier:");
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_providerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 providerIdentifier];
}

id objc_msgSend_providerIdentifierForHandoffActivityUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerIdentifierForHandoffActivityUserInfo:");
}

id objc_msgSend_providerIdentifierToProvider(void *a1, const char *a2, ...)
{
  return _[a1 providerIdentifierToProvider];
}

id objc_msgSend_providerIdentifiersForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerIdentifiersForClient:");
}

id objc_msgSend_providerManager(void *a1, const char *a2, ...)
{
  return _[a1 providerManager];
}

id objc_msgSend_providerSource(void *a1, const char *a2, ...)
{
  return _[a1 providerSource];
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithIdentifier:");
}

id objc_msgSend_providerWithService_video_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithService:video:");
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _[a1 providers];
}

id objc_msgSend_providersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providersAtIndex:");
}

id objc_msgSend_providersByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 providersByIdentifier];
}

id objc_msgSend_providersByIdentifierForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providersByIdentifierForClient:");
}

id objc_msgSend_providersByIdentifierForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providersByIdentifierForRemoteClients:");
}

id objc_msgSend_providersCount(void *a1, const char *a2, ...)
{
  return _[a1 providersCount];
}

id objc_msgSend_provisionPseudonymForHandle_featureID_scopeID_expiryDuration_allowedServices_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "provisionPseudonymForHandle:featureID:scopeID:expiryDuration:allowedServices:completionHandler:");
}

id objc_msgSend_provisionPseudonymForURI_withProperties_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provisionPseudonymForURI:withProperties:completion:");
}

id objc_msgSend_proxyAVAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 proxyAVAudioSession];
}

id objc_msgSend_proxyCallWithCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyCallWithCall:");
}

id objc_msgSend_proxyGroupUpdate_forConversationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyGroupUpdate:forConversationManager:");
}

id objc_msgSend_pseudonym(void *a1, const char *a2, ...)
{
  return _[a1 pseudonym];
}

id objc_msgSend_pseudonymAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pseudonymAtIndex:");
}

id objc_msgSend_pseudonymExpirationDateEpochTime(void *a1, const char *a2, ...)
{
  return _[a1 pseudonymExpirationDateEpochTime];
}

id objc_msgSend_pseudonymFeatureID(void *a1, const char *a2, ...)
{
  return _[a1 pseudonymFeatureID];
}

id objc_msgSend_pseudonymForPseudonymString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pseudonymForPseudonymString:");
}

id objc_msgSend_pseudonymForPseudonymURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pseudonymForPseudonymURI:");
}

id objc_msgSend_pseudonymPropertiesWithFeatureID_scopeID_expiryDurationInSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pseudonymPropertiesWithFeatureID:scopeID:expiryDurationInSeconds:");
}

id objc_msgSend_pseudonymURIMap(void *a1, const char *a2, ...)
{
  return _[a1 pseudonymURIMap];
}

id objc_msgSend_pseudonyms(void *a1, const char *a2, ...)
{
  return _[a1 pseudonyms];
}

id objc_msgSend_pseudonymsByCallUUID(void *a1, const char *a2, ...)
{
  return _[a1 pseudonymsByCallUUID];
}

id objc_msgSend_pseudonymsCount(void *a1, const char *a2, ...)
{
  return _[a1 pseudonymsCount];
}

id objc_msgSend_publicIntentAction(void *a1, const char *a2, ...)
{
  return _[a1 publicIntentAction];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _[a1 publicKey];
}

id objc_msgSend_publiclyAccessibleCopy(void *a1, const char *a2, ...)
{
  return _[a1 publiclyAccessibleCopy];
}

id objc_msgSend_pullCallWithHandoffActivityUserInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pullCallWithHandoffActivityUserInfo:completion:");
}

id objc_msgSend_pullRelayingCallsFromClient(void *a1, const char *a2, ...)
{
  return _[a1 pullRelayingCallsFromClient];
}

id objc_msgSend_pullRelayingGFTCallsFromClientIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 pullRelayingGFTCallsFromClientIfNecessary];
}

id objc_msgSend_pullRemotelyHostedCallsForMessage_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pullRemotelyHostedCallsForMessage:completion:");
}

id objc_msgSend_pushHostedCallsForRemoteInviteDictionary_destination_toPairedDevice_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushHostedCallsForRemoteInviteDictionary:destination:toPairedDevice:completion:");
}

id objc_msgSend_pushHostedCallsToDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushHostedCallsToDestination:");
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return _[a1 pushToken];
}

id objc_msgSend_pushTokenForSelf(void *a1, const char *a2, ...)
{
  return _[a1 pushTokenForSelf];
}

id objc_msgSend_queryHasWebOnlyEndpointsForDestinations_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryHasWebOnlyEndpointsForDestinations:completionBlock:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueAddParticipantRetryBlock_withVideoEnabled_audioPaused_screenEnabled_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueAddParticipantRetryBlock:withVideoEnabled:audioPaused:screenEnabled:");
}

id objc_msgSend_queueContext(void *a1, const char *a2, ...)
{
  return _[a1 queueContext];
}

id objc_msgSend_queueItemType(void *a1, const char *a2, ...)
{
  return _[a1 queueItemType];
}

id objc_msgSend_queuedActivitiesOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queuedActivitiesOfType:");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_randomSixDigitCode(void *a1, const char *a2, ...)
{
  return _[a1 randomSixDigitCode];
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readDataAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataAndReturnError:");
}

id objc_msgSend_readPasswordAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readPasswordAndReturnError:");
}

id objc_msgSend_rebroadcastTimeThreshold(void *a1, const char *a2, ...)
{
  return _[a1 rebroadcastTimeThreshold];
}

id objc_msgSend_receivedBroadcastedActivityType_dynamicIdentifier_originatingDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedBroadcastedActivityType:dynamicIdentifier:originatingDeviceType:");
}

id objc_msgSend_receivedFirstRemoteFrameForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFirstRemoteFrameForConference:");
}

id objc_msgSend_receivedInvitationAccept(void *a1, const char *a2, ...)
{
  return _[a1 receivedInvitationAccept];
}

id objc_msgSend_receivedLetMeInRequestForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedLetMeInRequestForConversation:");
}

id objc_msgSend_receivedMessageType(void *a1, const char *a2, ...)
{
  return _[a1 receivedMessageType];
}

id objc_msgSend_receivedResourceAtURL_withMetadata_fromParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedResourceAtURL:withMetadata:fromParticipantIdentifier:");
}

id objc_msgSend_receivedSuccessfulDidStart(void *a1, const char *a2, ...)
{
  return _[a1 receivedSuccessfulDidStart];
}

id objc_msgSend_recentCallJunkIdentificationCategoryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallJunkIdentificationCategoryString:");
}

id objc_msgSend_recentCallsDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallsDeleted:");
}

id objc_msgSend_recentlyDeletedCallUUIDsByConversationUUID(void *a1, const char *a2, ...)
{
  return _[a1 recentlyDeletedCallUUIDsByConversationUUID];
}

id objc_msgSend_recentlyLeftParticipantIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 recentlyLeftParticipantIdentifiers];
}

id objc_msgSend_recentsController(void *a1, const char *a2, ...)
{
  return _[a1 recentsController];
}

id objc_msgSend_recentsManager(void *a1, const char *a2, ...)
{
  return _[a1 recentsManager];
}

id objc_msgSend_recheckAccountStatusForSubscription_capability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recheckAccountStatusForSubscription:capability:");
}

id objc_msgSend_reconnect(void *a1, const char *a2, ...)
{
  return _[a1 reconnect];
}

id objc_msgSend_reconnectSession(void *a1, const char *a2, ...)
{
  return _[a1 reconnectSession];
}

id objc_msgSend_recoverLinksForPseudonyms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverLinksForPseudonyms:");
}

id objc_msgSend_reducedInfoMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reducedInfoMembers:");
}

id objc_msgSend_refreshActiveParticipantsList(void *a1, const char *a2, ...)
{
  return _[a1 refreshActiveParticipantsList];
}

id objc_msgSend_refreshActivitySessionActiveParticipants(void *a1, const char *a2, ...)
{
  return _[a1 refreshActivitySessionActiveParticipants];
}

id objc_msgSend_refreshDataCryptors(void *a1, const char *a2, ...)
{
  return _[a1 refreshDataCryptors];
}

id objc_msgSend_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:");
}

id objc_msgSend_regionBasePhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 regionBasePhoneNumber];
}

id objc_msgSend_registerActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerActivityType:dynamicIdentifier:");
}

id objc_msgSend_registerCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerCall:");
}

id objc_msgSend_registerChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerChat:");
}

id objc_msgSend_registerConversationProvider_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerConversationProvider:completionHandler:");
}

id objc_msgSend_registerForSecureMicEvents(void *a1, const char *a2, ...)
{
  return _[a1 registerForSecureMicEvents];
}

id objc_msgSend_registerLocalProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerLocalProvider:");
}

id objc_msgSend_registerMessagesGroupAssociation(void *a1, const char *a2, ...)
{
  return _[a1 registerMessagesGroupAssociation];
}

id objc_msgSend_registerMessagesGroupUUIDForConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerMessagesGroupUUIDForConversationUUID:");
}

id objc_msgSend_registerPairedHostDeviceProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPairedHostDeviceProviders:");
}

id objc_msgSend_registerPluginWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPluginWithOptions:");
}

id objc_msgSend_registerSecureMicrophoneEngagedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSecureMicrophoneEngagedHandler:");
}

id objc_msgSend_registerWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithCompletionHandler:");
}

id objc_msgSend_registerWithIDSWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithIDSWithCompletionHandler:");
}

id objc_msgSend_registeredLocalProvidersByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 registeredLocalProvidersByIdentifier];
}

id objc_msgSend_registeredPairedHostDeviceProvidersByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 registeredPairedHostDeviceProvidersByIdentifier];
}

id objc_msgSend_registeredStreamWithAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredStreamWithAvailability:");
}

id objc_msgSend_registrationRestrictionReason(void *a1, const char *a2, ...)
{
  return _[a1 registrationRestrictionReason];
}

id objc_msgSend_rejectPendingMember_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rejectPendingMember:forConversationUUID:");
}

id objc_msgSend_rejectedMembers(void *a1, const char *a2, ...)
{
  return _[a1 rejectedMembers];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return _[a1 relativePath];
}

id objc_msgSend_relayCall_didAnswerWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCall:didAnswerWithRequest:");
}

id objc_msgSend_relayCall_didGroupWithOtherCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCall:didGroupWithOtherCall:");
}

id objc_msgSend_relayCall_didPlayLocalDTMFToneForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCall:didPlayLocalDTMFToneForKey:");
}

id objc_msgSend_relayCallConferenceDidStartSuccessfullyForIncomingAnsweredCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallConferenceDidStartSuccessfullyForIncomingAnsweredCall:");
}

id objc_msgSend_relayCallConferenceDidStartSuccessfullyForOutgoingDialedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallConferenceDidStartSuccessfullyForOutgoingDialedCall:");
}

id objc_msgSend_relayCallConferenceDidStartSuccessfullyForPulledCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallConferenceDidStartSuccessfullyForPulledCall:");
}

id objc_msgSend_relayCallConferenceDidStop_cleanly_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallConferenceDidStop:cleanly:error:");
}

id objc_msgSend_relayCallConferenceFailedToStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallConferenceFailedToStart:");
}

id objc_msgSend_relayCallDataSource(void *a1, const char *a2, ...)
{
  return _[a1 relayCallDataSource];
}

id objc_msgSend_relayCallDelegate(void *a1, const char *a2, ...)
{
  return _[a1 relayCallDelegate];
}

id objc_msgSend_relayCallDidBecomeEndpointForPull_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidBecomeEndpointForPull:");
}

id objc_msgSend_relayCallDidDial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidDial:");
}

id objc_msgSend_relayCallDidDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidDisconnect:");
}

id objc_msgSend_relayCallDidHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidHold:");
}

id objc_msgSend_relayCallDidJoin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidJoin:");
}

id objc_msgSend_relayCallDidPerformUplinkMuted_uplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidPerformUplinkMuted:uplinkMuted:");
}

id objc_msgSend_relayCallDidSendHardPauseDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidSendHardPauseDigits:");
}

id objc_msgSend_relayCallDidUngroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidUngroup:");
}

id objc_msgSend_relayCallDidUnhold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallDidUnhold:");
}

id objc_msgSend_relayCallingAvailability(void *a1, const char *a2, ...)
{
  return _[a1 relayCallingAvailability];
}

id objc_msgSend_relayCallingDisabledForDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 relayCallingDisabledForDeviceID];
}

id objc_msgSend_relayCallingStateChangedForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCallingStateChangedForDataSource:");
}

id objc_msgSend_relayCapableDeviceExists(void *a1, const char *a2, ...)
{
  return _[a1 relayCapableDeviceExists];
}

id objc_msgSend_relayClientController(void *a1, const char *a2, ...)
{
  return _[a1 relayClientController];
}

id objc_msgSend_relayClientTransport(void *a1, const char *a2, ...)
{
  return _[a1 relayClientTransport];
}

id objc_msgSend_relayCommonController(void *a1, const char *a2, ...)
{
  return _[a1 relayCommonController];
}

id objc_msgSend_relayDelegate(void *a1, const char *a2, ...)
{
  return _[a1 relayDelegate];
}

id objc_msgSend_relayHostController(void *a1, const char *a2, ...)
{
  return _[a1 relayHostController];
}

id objc_msgSend_relayInviteDictionary(void *a1, const char *a2, ...)
{
  return _[a1 relayInviteDictionary];
}

id objc_msgSend_relayMessagingController(void *a1, const char *a2, ...)
{
  return _[a1 relayMessagingController];
}

id objc_msgSend_relayService(void *a1, const char *a2, ...)
{
  return _[a1 relayService];
}

id objc_msgSend_remoteDestination(void *a1, const char *a2, ...)
{
  return _[a1 remoteDestination];
}

id objc_msgSend_remoteDevice(void *a1, const char *a2, ...)
{
  return _[a1 remoteDevice];
}

id objc_msgSend_remoteFromID(void *a1, const char *a2, ...)
{
  return _[a1 remoteFromID];
}

id objc_msgSend_remoteHandle(void *a1, const char *a2, ...)
{
  return _[a1 remoteHandle];
}

id objc_msgSend_remoteIDSDestinations(void *a1, const char *a2, ...)
{
  return _[a1 remoteIDSDestinations];
}

id objc_msgSend_remoteInviteDictionary(void *a1, const char *a2, ...)
{
  return _[a1 remoteInviteDictionary];
}

id objc_msgSend_remoteMemberForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteMemberForHandle:");
}

id objc_msgSend_remoteMemberHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteMemberHandles];
}

id objc_msgSend_remoteMemberNotInMemberListForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteMemberNotInMemberListForConversation:");
}

id objc_msgSend_remoteMembers(void *a1, const char *a2, ...)
{
  return _[a1 remoteMembers];
}

id objc_msgSend_remoteMembersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteMembersAtIndex:");
}

id objc_msgSend_remoteMembersCount(void *a1, const char *a2, ...)
{
  return _[a1 remoteMembersCount];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectInterface];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteParticipantForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantForHandle:");
}

id objc_msgSend_remoteParticipantForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantForIdentifier:");
}

id objc_msgSend_remoteParticipantForLightweightParticipantHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantForLightweightParticipantHandle:");
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_remoteParticipantHandlesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantHandlesAtIndex:");
}

id objc_msgSend_remoteParticipantHandlesCount(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandlesCount];
}

id objc_msgSend_remoteParticipantTUHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantTUHandles];
}

id objc_msgSend_remoteParticipantWithIdentifier_cameraMixedWithScreenDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantWithIdentifier:cameraMixedWithScreenDidChange:");
}

id objc_msgSend_remoteParticipantWithIdentifier_didChangeAudioPriority_videoPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantWithIdentifier:didChangeAudioPriority:videoPriority:");
}

id objc_msgSend_remoteParticipantWithIdentifier_didReact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantWithIdentifier:didReact:");
}

id objc_msgSend_remoteParticipantWithIdentifier_updatedAudioEnabled_streamToken_screenToken_captionsToken_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantWithIdentifier:updatedAudioEnabled:streamToken:screenToken:captionsToken:");
}

id objc_msgSend_remoteParticipantWithIdentifier_updatedAudioPaused_streamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantWithIdentifier:updatedAudioPaused:streamToken:");
}

id objc_msgSend_remoteParticipantWithIdentifier_updatedScreenEnabled_streamToken_screenToken_captionsToken_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "remoteParticipantWithIdentifier:updatedScreenEnabled:streamToken:screenToken:captionsToken:");
}

id objc_msgSend_remoteParticipantWithIdentifier_updatedVideoEnabled_streamToken_screenToken_captionsToken_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantWithIdentifier:updatedVideoEnabled:streamToken:screenToken:captionsToken:");
}

id objc_msgSend_remoteParticipantsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantsByIdentifier];
}

id objc_msgSend_remoteProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 remoteProtocolVersion];
}

id objc_msgSend_remoteProtocolVersionNumber(void *a1, const char *a2, ...)
{
  return _[a1 remoteProtocolVersionNumber];
}

id objc_msgSend_remotePushTokens(void *a1, const char *a2, ...)
{
  return _[a1 remotePushTokens];
}

id objc_msgSend_remoteRequesteeIDSDestinationFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteRequesteeIDSDestinationFor:");
}

id objc_msgSend_remoteRequesterIDSDestinationFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteRequesterIDSDestinationFor:");
}

id objc_msgSend_remoteVideoPausedForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteVideoPausedForConference:");
}

id objc_msgSend_removeActiveAudioSessionObjectForConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActiveAudioSessionObjectForConversationWithUUID:");
}

id objc_msgSend_removeActiveRequestForTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActiveRequestForTransactionID:");
}

id objc_msgSend_removeActivitySessionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 removeActivitySessionIfNecessary];
}

id objc_msgSend_removeActivitySessionWithUUID_usingHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActivitySessionWithUUID:usingHandle:");
}

id objc_msgSend_removeActivitySessionWithUUID_usingTerminatingHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActivitySessionWithUUID:usingTerminatingHandle:");
}

id objc_msgSend_removeAllConversations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllConversations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAllPendingConversations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllPendingConversations];
}

id objc_msgSend_removeCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCall:");
}

id objc_msgSend_removeCallerIDFromPreferences(void *a1, const char *a2, ...)
{
  return _[a1 removeCallerIDFromPreferences];
}

id objc_msgSend_removeClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeClient:");
}

id objc_msgSend_removeConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConversation:");
}

id objc_msgSend_removeConversationNoticeWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConversationNoticeWithUUID:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeEmergencyAddressDisclaimerOnSecondaryDevice(void *a1, const char *a2, ...)
{
  return _[a1 removeEmergencyAddressDisclaimerOnSecondaryDevice];
}

id objc_msgSend_removeErrorNotifications(void *a1, const char *a2, ...)
{
  return _[a1 removeErrorNotifications];
}

id objc_msgSend_removeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIdentifier:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeLink_deleteReason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLink:deleteReason:completionHandler:");
}

id objc_msgSend_removeLink_reason_withConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLink:reason:withConversation:");
}

id objc_msgSend_removeLinksForFilenamesNotInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLinksForFilenamesNotInArray:");
}

id objc_msgSend_removeLinksForFilenamesNotInArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLinksForFilenamesNotInArray:error:");
}

id objc_msgSend_removeListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListenerID:forService:");
}

id objc_msgSend_removeLocalClientObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLocalClientObject:");
}

id objc_msgSend_removeLocalScreenSharingSessions(void *a1, const char *a2, ...)
{
  return _[a1 removeLocalScreenSharingSessions];
}

id objc_msgSend_removeMembers_fromExistingMembers_activeParticipants_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMembers:fromExistingMembers:activeParticipants:triggeredLocally:");
}

id objc_msgSend_removeNonIndefiniteLinks(void *a1, const char *a2, ...)
{
  return _[a1 removeNonIndefiniteLinks];
}

id objc_msgSend_removeNotificationsForServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationsForServiceIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeParticipant:");
}

id objc_msgSend_removeParticipantWithIdentifier_fromHandle_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeParticipantWithIdentifier:fromHandle:withReason:");
}

id objc_msgSend_removeParticipantsForMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeParticipantsForMember:");
}

id objc_msgSend_removePendingConversationWithPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingConversationWithPseudonym:");
}

id objc_msgSend_removePendingData(void *a1, const char *a2, ...)
{
  return _[a1 removePendingData];
}

id objc_msgSend_removePendingMemberMatchingActiveParticipant_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingMemberMatchingActiveParticipant:conversation:");
}

id objc_msgSend_removePendingMembers_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingMembers:triggeredLocally:");
}

id objc_msgSend_removePseudonym_forCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePseudonym:forCallUUID:");
}

id objc_msgSend_removeReminderNotificationOnSecondaryDevice(void *a1, const char *a2, ...)
{
  return _[a1 removeReminderNotificationOnSecondaryDevice];
}

id objc_msgSend_removeRemoteMembers_fromConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRemoteMembers:fromConversationWithUUID:");
}

id objc_msgSend_removeRemoteMembers_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRemoteMembers:triggeredLocally:");
}

id objc_msgSend_removeRequiredCapabilities_requiredLackOfCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRequiredCapabilities:requiredLackOfCapabilities:");
}

id objc_msgSend_removeScreenShareRequestFromParticipant_conversation_screenShareContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeScreenShareRequestFromParticipant:conversation:screenShareContext:");
}

id objc_msgSend_removeScreenSharingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeScreenSharingRequest:");
}

id objc_msgSend_removeScreenSharingSessions(void *a1, const char *a2, ...)
{
  return _[a1 removeScreenSharingSessions];
}

id objc_msgSend_removeSecondaryThumperDeviceWithIDSDeviceIdentifier_fromSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSecondaryThumperDeviceWithIDSDeviceIdentifier:fromSubscription:");
}

id objc_msgSend_removeServiceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeServiceDelegate:");
}

id objc_msgSend_removeThumperRegisteredDeviceID_forThumperAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeThumperRegisteredDeviceID:forThumperAccountID:");
}

id objc_msgSend_removeVirtualParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeVirtualParticipant:");
}

id objc_msgSend_removedHandoffParticipantToTime(void *a1, const char *a2, ...)
{
  return _[a1 removedHandoffParticipantToTime];
}

id objc_msgSend_removedHandoffParticipants(void *a1, const char *a2, ...)
{
  return _[a1 removedHandoffParticipants];
}

id objc_msgSend_removedMembers(void *a1, const char *a2, ...)
{
  return _[a1 removedMembers];
}

id objc_msgSend_removedMembersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removedMembersAtIndex:");
}

id objc_msgSend_removedMembersCount(void *a1, const char *a2, ...)
{
  return _[a1 removedMembersCount];
}

id objc_msgSend_removedRemoteParticipantWithIdentifier_didSucceed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removedRemoteParticipantWithIdentifier:didSucceed:");
}

id objc_msgSend_renamedResourceURL_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renamedResourceURL:withName:");
}

id objc_msgSend_renewLink_expirationDate_reason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewLink:expirationDate:reason:completionHandler:");
}

id objc_msgSend_renewLinkIfNeeded_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewLinkIfNeeded:completionHandler:");
}

id objc_msgSend_renewLinkWithPseudonym_expirationDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewLinkWithPseudonym:expirationDate:completionHandler:");
}

id objc_msgSend_renewPseudonym_expirationDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPseudonym:expirationDate:completionHandler:");
}

id objc_msgSend_renewPseudonym_forUpdatedExpiryEpoch_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPseudonym:forUpdatedExpiryEpoch:completion:");
}

id objc_msgSend_renewPseudonymHandle_expirationDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPseudonymHandle:expirationDate:completionHandler:");
}

id objc_msgSend_renewPseudonymHandle_forConversationProvider_expirationDate_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPseudonymHandle:forConversationProvider:expirationDate:completionHandler:");
}

id objc_msgSend_renewPseudonymIfNeeded_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPseudonymIfNeeded:completionHandler:");
}

id objc_msgSend_renewPseudonymString_expirationDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPseudonymString:expirationDate:completionHandler:");
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _[a1 report];
}

id objc_msgSend_reportAction_ofTempURI_fromURI_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportAction:ofTempURI:fromURI:withCompletion:");
}

id objc_msgSend_reportAllCallsBackgrounded(void *a1, const char *a2, ...)
{
  return _[a1 reportAllCallsBackgrounded];
}

id objc_msgSend_reportAudioFinishedForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportAudioFinishedForCallWithUUID:");
}

id objc_msgSend_reportCallEnteredForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallEnteredForeground:");
}

id objc_msgSend_reportCallWithUUID_changedFrequencyData_forDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:changedFrequencyData:forDirection:");
}

id objc_msgSend_reportCallWithUUID_changedMeterLevel_forDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:changedMeterLevel:forDirection:");
}

id objc_msgSend_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:");
}

id objc_msgSend_reportCallWithUUID_endedAtDate_privateReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:endedAtDate:privateReason:");
}

id objc_msgSend_reportCallWithUUID_endedAtDate_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:endedAtDate:reason:");
}

id objc_msgSend_reportCallWithUUID_failedAtDate_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:failedAtDate:withContext:");
}

id objc_msgSend_reportCallWithUUID_updated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCallWithUUID:updated:");
}

id objc_msgSend_reportData(void *a1, const char *a2, ...)
{
  return _[a1 reportData];
}

id objc_msgSend_reportDataCollectionCompleteIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 reportDataCollectionCompleteIfNecessary];
}

id objc_msgSend_reportFailureForReason_provider_callUUID_actionToFail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFailureForReason:provider:callUUID:actionToFail:");
}

id objc_msgSend_reportJoinDurationLongerThanThreasholdForCallUUID_report_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportJoinDurationLongerThanThreasholdForCallUUID:report:");
}

id objc_msgSend_reportNewIncomingCallForConversation_fromHandle_callUUID_isReRing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportNewIncomingCallForConversation:fromHandle:callUUID:isReRing:");
}

id objc_msgSend_reportNewIncomingCallForConversation_fromHandle_isReRing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportNewIncomingCallForConversation:fromHandle:isReRing:");
}

id objc_msgSend_reportNewIncomingCallWithUUID_update_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportNewIncomingCallWithUUID:update:completion:");
}

id objc_msgSend_reportNewOutgoingCallWithUUID_update_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportNewOutgoingCallWithUUID:update:");
}

id objc_msgSend_reportOutgoingCallWithUUID_connectedAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportOutgoingCallWithUUID:connectedAtDate:");
}

id objc_msgSend_reportOutgoingCallWithUUID_sentInvitationAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportOutgoingCallWithUUID:sentInvitationAtDate:");
}

id objc_msgSend_reportOutgoingCallWithUUID_startedConnectingAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportOutgoingCallWithUUID:startedConnectingAtDate:");
}

id objc_msgSend_reportProviderFailedWithAction_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportProviderFailedWithAction:forCall:");
}

id objc_msgSend_reportRecentCallForConversation_withStartDate_avMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRecentCallForConversation:withStartDate:avMode:");
}

id objc_msgSend_reportRelayMessageReceived_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRelayMessageReceived:fromPairedDevice:");
}

id objc_msgSend_reportRouteWasPicked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRouteWasPicked:");
}

id objc_msgSend_reportRouteWasPickedByAnyTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRouteWasPickedByAnyTrigger:");
}

id objc_msgSend_reportTimedOutPickingRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportTimedOutPickingRoute:");
}

id objc_msgSend_reportTransactionGroupCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportTransactionGroupCompleted:");
}

id objc_msgSend_reporters(void *a1, const char *a2, ...)
{
  return _[a1 reporters];
}

id objc_msgSend_reportingController(void *a1, const char *a2, ...)
{
  return _[a1 reportingController];
}

id objc_msgSend_reportingController_AVCBlobRecoveryStartedForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:AVCBlobRecoveryStartedForConversation:");
}

id objc_msgSend_reportingController_AVCBlobRecoveryTimedOutForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:AVCBlobRecoveryTimedOutForConversation:");
}

id objc_msgSend_reportingController_activeRemoteParticipantsChangedForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:activeRemoteParticipantsChangedForConversation:");
}

id objc_msgSend_reportingController_addedActivatedLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:addedActivatedLink:");
}

id objc_msgSend_reportingController_addedActiveConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:addedActiveConversation:");
}

id objc_msgSend_reportingController_avcBlobRequestMessageRetryFailedForConversationGroupUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:avcBlobRequestMessageRetryFailedForConversationGroupUUID:");
}

id objc_msgSend_reportingController_avcBlobRequestMessageRetryStartedForConversationGroupUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:avcBlobRequestMessageRetryStartedForConversationGroupUUID:");
}

id objc_msgSend_reportingController_avcBlobRequestMessageRetrySucceededForConversationGroupUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:avcBlobRequestMessageRetrySucceededForConversationGroupUUID:");
}

id objc_msgSend_reportingController_callEnteredForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:callEnteredForeground:");
}

id objc_msgSend_reportingController_callUUID_withUserScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:callUUID:withUserScore:");
}

id objc_msgSend_reportingController_capturedMomentsUsageReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:capturedMomentsUsageReport:");
}

id objc_msgSend_reportingController_createConversationReportingSessionForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:createConversationReportingSessionForConversation:");
}

id objc_msgSend_reportingController_createOneToOneFTReportingSessionForCallWithUUID_withReportingHierarchyToken_withVideo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "reportingController:createOneToOneFTReportingSessionForCallWithUUID:withReportingHierarchyToken:withVideo:");
}

id objc_msgSend_reportingController_didEndSession_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:didEndSession:startDate:endDate:");
}

id objc_msgSend_reportingController_forCallUUID_report_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:forCallUUID:report:");
}

id objc_msgSend_reportingController_letMeInRequestStateChangedForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:letMeInRequestStateChangedForConversation:");
}

id objc_msgSend_reportingController_messageRetryFailedForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:messageRetryFailedForConversationGroupUUID:");
}

id objc_msgSend_reportingController_messageRetryStartedForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:messageRetryStartedForConversationGroupUUID:");
}

id objc_msgSend_reportingController_messageRetrySucceededForConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:messageRetrySucceededForConversationGroupUUID:");
}

id objc_msgSend_reportingController_oneToOneModeSwitchFailureForConversation_isOneToOneMode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:oneToOneModeSwitchFailureForConversation:isOneToOneMode:");
}

id objc_msgSend_reportingController_pickedRoute_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:pickedRoute:forCall:");
}

id objc_msgSend_reportingController_pickedRoute_updatedByAnyTriggerForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:pickedRoute:updatedByAnyTriggerForCall:");
}

id objc_msgSend_reportingController_providerFailedWithAction_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:providerFailedWithAction:forCall:");
}

id objc_msgSend_reportingController_receivedConnectionSetupReport_eventType_forConversation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedConnectionSetupReport:eventType:forConversation:");
}

id objc_msgSend_reportingController_receivedGroupActivitiesReports_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedGroupActivitiesReports:forConversation:");
}

id objc_msgSend_reportingController_receivedHandoffReport_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedHandoffReport:forConversation:");
}

id objc_msgSend_reportingController_receivedIDSChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedIDSChat:");
}

id objc_msgSend_reportingController_receivedIDSReports_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedIDSReports:forConversation:");
}

id objc_msgSend_reportingController_receivedIDSReports_forSessionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedIDSReports:forSessionWithUUID:");
}

id objc_msgSend_reportingController_receivedLetMeInRequestForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:receivedLetMeInRequestForConversation:");
}

id objc_msgSend_reportingController_relayMessageReceived_fromPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:relayMessageReceived:fromPairedDevice:");
}

id objc_msgSend_reportingController_remoteMemberNotInMemberListForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:remoteMemberNotInMemberListForConversation:");
}

id objc_msgSend_reportingController_remoteMembersChangedForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:remoteMembersChangedForConversation:");
}

id objc_msgSend_reportingController_removedActiveConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:removedActiveConversation:");
}

id objc_msgSend_reportingController_screeningChangedForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:screeningChangedForCall:");
}

id objc_msgSend_reportingController_sentLetMeInResponseForConversation_isApproved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:sentLetMeInResponseForConversation:isApproved:");
}

id objc_msgSend_reportingController_stateChangedForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:stateChangedForConversation:");
}

id objc_msgSend_reportingController_statusChangedForCall_totalCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:statusChangedForCall:totalCallCount:");
}

id objc_msgSend_reportingController_timedOutPickingRoute_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:timedOutPickingRoute:forCall:");
}

id objc_msgSend_reportingController_transactionGroupCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:transactionGroupCompleted:");
}

id objc_msgSend_reportingController_transitionAttemptForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:transitionAttemptForConversation:");
}

id objc_msgSend_reportingController_voipAppBecameDisabledFromLaunching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:voipAppBecameDisabledFromLaunching:");
}

id objc_msgSend_reportingController_voipAppFailedToPostIncomingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:voipAppFailedToPostIncomingCall:");
}

id objc_msgSend_reportingController_voipDOSCallIgnored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:voipDOSCallIgnored:");
}

id objc_msgSend_reportingController_voipPushDroppedOnTheFloor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingController:voipPushDroppedOnTheFloor:");
}

id objc_msgSend_reportingControllerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 reportingControllerServerXPCInterface];
}

id objc_msgSend_reportingHierarchySubToken(void *a1, const char *a2, ...)
{
  return _[a1 reportingHierarchySubToken];
}

id objc_msgSend_reportingHierarchyToken(void *a1, const char *a2, ...)
{
  return _[a1 reportingHierarchyToken];
}

id objc_msgSend_reportingSessionByStreamToken(void *a1, const char *a2, ...)
{
  return _[a1 reportingSessionByStreamToken];
}

id objc_msgSend_representsTransitionFromPending(void *a1, const char *a2, ...)
{
  return _[a1 representsTransitionFromPending];
}

id objc_msgSend_requestActionType(void *a1, const char *a2, ...)
{
  return _[a1 requestActionType];
}

id objc_msgSend_requestActiveParticipants(void *a1, const char *a2, ...)
{
  return _[a1 requestActiveParticipants];
}

id objc_msgSend_requestAnswerForRequest_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAnswerForRequest:forCall:");
}

id objc_msgSend_requestAuthorizationForApplicationLaunchWithActivity_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationForApplicationLaunchWithActivity:completionHandler:");
}

id objc_msgSend_requestAuthorizationForApplicationWithBundleIdentifier_preparing_overrides_currentScreenShareAttributes_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "requestAuthorizationForApplicationWithBundleIdentifier:preparing:overrides:currentScreenShareAttributes:completionHandler:");
}

id objc_msgSend_requestBlobRecoveryOptions(void *a1, const char *a2, ...)
{
  return _[a1 requestBlobRecoveryOptions];
}

id objc_msgSend_requestCLTMThrottleUncapToken(void *a1, const char *a2, ...)
{
  return _[a1 requestCLTMThrottleUncapToken];
}

id objc_msgSend_requestDataCryptorForTopic_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDataCryptorForTopic:completionHandler:");
}

id objc_msgSend_requestEncryptionKeyForParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestEncryptionKeyForParticipants:");
}

id objc_msgSend_requestEncryptionKeyForParticipants_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestEncryptionKeyForParticipants:topic:");
}

id objc_msgSend_requestLetMeInApprovalForPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestLetMeInApprovalForPseudonym:");
}

id objc_msgSend_requestParticipant_toCancelScreenShareRequest_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestParticipant:toCancelScreenShareRequest:conversation:");
}

id objc_msgSend_requestParticipant_toScreenShareWithRequest_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestParticipant:toScreenShareWithRequest:conversation:");
}

id objc_msgSend_requestParticipantToShareScreen_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestParticipantToShareScreen:forConversationUUID:");
}

id objc_msgSend_requestPendingACInvitations(void *a1, const char *a2, ...)
{
  return _[a1 requestPendingACInvitations];
}

id objc_msgSend_requestPendingVCInvitations(void *a1, const char *a2, ...)
{
  return _[a1 requestPendingVCInvitations];
}

id objc_msgSend_requestPhraseSpotterBypassing_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPhraseSpotterBypassing:timeout:");
}

id objc_msgSend_requestPinFromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPinFromDevice:");
}

id objc_msgSend_requestStartDateByTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 requestStartDateByTransactionID];
}

id objc_msgSend_requestTimeoutBlockByTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 requestTimeoutBlockByTransactionID];
}

id objc_msgSend_requestToScreenShareEnabled(void *a1, const char *a2, ...)
{
  return _[a1 requestToScreenShareEnabled];
}

id objc_msgSend_requestToShareMyScreen(void *a1, const char *a2, ...)
{
  return _[a1 requestToShareMyScreen];
}

id objc_msgSend_requestToShareScreen(void *a1, const char *a2, ...)
{
  return _[a1 requestToShareScreen];
}

id objc_msgSend_requestTransaction_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTransaction:completion:");
}

id objc_msgSend_requesterID(void *a1, const char *a2, ...)
{
  return _[a1 requesterID];
}

id objc_msgSend_requiredCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 requiredCapabilities];
}

id objc_msgSend_requiredConnectionCapability(void *a1, const char *a2, ...)
{
  return _[a1 requiredConnectionCapability];
}

id objc_msgSend_requiredLackOfCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 requiredLackOfCapabilities];
}

id objc_msgSend_requiresAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 requiresAuthentication];
}

id objc_msgSend_requiresInCallSounds(void *a1, const char *a2, ...)
{
  return _[a1 requiresInCallSounds];
}

id objc_msgSend_requiresInviteDictionary(void *a1, const char *a2, ...)
{
  return _[a1 requiresInviteDictionary];
}

id objc_msgSend_resetActivitySessionSceneAssociationsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetActivitySessionSceneAssociationsForBundleID:");
}

id objc_msgSend_resetClientCallProvisionalStates(void *a1, const char *a2, ...)
{
  return _[a1 resetClientCallProvisionalStates];
}

id objc_msgSend_resetContentSharingSessionContent(void *a1, const char *a2, ...)
{
  return _[a1 resetContentSharingSessionContent];
}

id objc_msgSend_resetNonScreenSharingSessions(void *a1, const char *a2, ...)
{
  return _[a1 resetNonScreenSharingSessions];
}

id objc_msgSend_resetOneTimeMessage(void *a1, const char *a2, ...)
{
  return _[a1 resetOneTimeMessage];
}

id objc_msgSend_resetSceneAssociationsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSceneAssociationsForBundleID:");
}

id objc_msgSend_resetSessions(void *a1, const char *a2, ...)
{
  return _[a1 resetSessions];
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return _[a1 resignCurrent];
}

id objc_msgSend_resolvedAudioVideoMode(void *a1, const char *a2, ...)
{
  return _[a1 resolvedAudioVideoMode];
}

id objc_msgSend_resolvedPresentationMode(void *a1, const char *a2, ...)
{
  return _[a1 resolvedPresentationMode];
}

id objc_msgSend_resourceTransferCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 resourceTransferCallbacks];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseInformation(void *a1, const char *a2, ...)
{
  return _[a1 responseInformation];
}

id objc_msgSend_restart(void *a1, const char *a2, ...)
{
  return _[a1 restart];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return _[a1 retainArguments];
}

id objc_msgSend_retreiveActiveConversations(void *a1, const char *a2, ...)
{
  return _[a1 retreiveActiveConversations];
}

id objc_msgSend_retrievePendingMembersFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePendingMembersFor:");
}

id objc_msgSend_retrieveSavedProvidersByIdentifierAndNotify_unregister_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveSavedProvidersByIdentifierAndNotify:unregister:");
}

id objc_msgSend_retrieveSessionWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveSessionWithID:");
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _[a1 retryCount];
}

id objc_msgSend_reviveOrInvalidateCachedConversationIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 reviveOrInvalidateCachedConversationIfNecessary];
}

id objc_msgSend_revokeBackgroundAuthorizationForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokeBackgroundAuthorizationForBundleID:");
}

id objc_msgSend_revokePseudonym_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePseudonym:completion:");
}

id objc_msgSend_revokePseudonym_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePseudonym:completionHandler:");
}

id objc_msgSend_revokePseudonymHandle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePseudonymHandle:completionHandler:");
}

id objc_msgSend_revokePseudonymHandle_forConversationProvider_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePseudonymHandle:forConversationProvider:completionHandler:");
}

id objc_msgSend_revokePseudonymString_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePseudonymString:completionHandler:");
}

id objc_msgSend_ringtoneSoundURL(void *a1, const char *a2, ...)
{
  return _[a1 ringtoneSoundURL];
}

id objc_msgSend_ringtoneSoundURLString(void *a1, const char *a2, ...)
{
  return _[a1 ringtoneSoundURLString];
}

id objc_msgSend_ringtoneSuppressedRemotely(void *a1, const char *a2, ...)
{
  return _[a1 ringtoneSuppressedRemotely];
}

id objc_msgSend_ringtonesSandboxExtensionDirectory(void *a1, const char *a2, ...)
{
  return _[a1 ringtonesSandboxExtensionDirectory];
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return _[a1 route];
}

id objc_msgSend_routeController(void *a1, const char *a2, ...)
{
  return _[a1 routeController];
}

id objc_msgSend_routeIdentifierChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 routeIdentifierChangedNotification];
}

id objc_msgSend_routeManager(void *a1, const char *a2, ...)
{
  return _[a1 routeManager];
}

id objc_msgSend_routes(void *a1, const char *a2, ...)
{
  return _[a1 routes];
}

id objc_msgSend_routesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routesAtIndex:");
}

id objc_msgSend_routesByUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 routesByUniqueIdentifier];
}

id objc_msgSend_routesCount(void *a1, const char *a2, ...)
{
  return _[a1 routesCount];
}

id objc_msgSend_rtcKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rtcKey:");
}

id objc_msgSend_runBlocksPendingTransportAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runBlocksPendingTransportAvailability:");
}

id objc_msgSend_runBlocksPendingTransportAvailabilityIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runBlocksPendingTransportAvailabilityIfNecessary:");
}

id objc_msgSend_sKEBlob(void *a1, const char *a2, ...)
{
  return _[a1 sKEBlob];
}

id objc_msgSend_sandboxExtendedImageURL(void *a1, const char *a2, ...)
{
  return _[a1 sandboxExtendedImageURL];
}

id objc_msgSend_sandboxExtensionHandle(void *a1, const char *a2, ...)
{
  return _[a1 sandboxExtensionHandle];
}

id objc_msgSend_sanitize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitize:completion:");
}

id objc_msgSend_sanitizeAndProcessParticipantUpdate_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeAndProcessParticipantUpdate:context:");
}

id objc_msgSend_sanitizeJoinConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeJoinConversationRequest:");
}

id objc_msgSend_sanitizedCallUpdate(void *a1, const char *a2, ...)
{
  return _[a1 sanitizedCallUpdate];
}

id objc_msgSend_sanitizedCopy(void *a1, const char *a2, ...)
{
  return _[a1 sanitizedCopy];
}

id objc_msgSend_sanitizedHandles(void *a1, const char *a2, ...)
{
  return _[a1 sanitizedHandles];
}

id objc_msgSend_saveData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveData:error:");
}

id objc_msgSend_saveImageToDisk(void *a1, const char *a2, ...)
{
  return _[a1 saveImageToDisk];
}

id objc_msgSend_saveLivePhotoWithPhotoURL_videoURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveLivePhotoWithPhotoURL:videoURL:completion:");
}

id objc_msgSend_savePassword_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePassword:error:");
}

id objc_msgSend_saveThumperCapabilitiesStates_forPreferenceKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveThumperCapabilitiesStates:forPreferenceKey:");
}

id objc_msgSend_saveVideoWithURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveVideoWithURL:completion:");
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return _[a1 scaleFactor];
}

id objc_msgSend_sceneAssociationBehavior(void *a1, const char *a2, ...)
{
  return _[a1 sceneAssociationBehavior];
}

id objc_msgSend_scheduleConversationLinkCheckInInitial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleConversationLinkCheckInInitial:");
}

id objc_msgSend_sckSystemPickerEnabled(void *a1, const char *a2, ...)
{
  return _[a1 sckSystemPickerEnabled];
}

id objc_msgSend_screenCaptureQueue(void *a1, const char *a2, ...)
{
  return _[a1 screenCaptureQueue];
}

id objc_msgSend_screenShareAttributes(void *a1, const char *a2, ...)
{
  return _[a1 screenShareAttributes];
}

id objc_msgSend_screenShareContext(void *a1, const char *a2, ...)
{
  return _[a1 screenShareContext];
}

id objc_msgSend_screenShareRequestType(void *a1, const char *a2, ...)
{
  return _[a1 screenShareRequestType];
}

id objc_msgSend_screenShareUUID(void *a1, const char *a2, ...)
{
  return _[a1 screenShareUUID];
}

id objc_msgSend_screenSharingActivityManager(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingActivityManager];
}

id objc_msgSend_screenSharingDeskViewEnabled(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingDeskViewEnabled];
}

id objc_msgSend_screenSharingIntention(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingIntention];
}

id objc_msgSend_screenSharingRequest(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingRequest];
}

id objc_msgSend_screenSharingRequests(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingRequests];
}

id objc_msgSend_screenSharingRequestsByUUID(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingRequestsByUUID];
}

id objc_msgSend_screenSharingType(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingType];
}

id objc_msgSend_screenToken(void *a1, const char *a2, ...)
{
  return _[a1 screenToken];
}

id objc_msgSend_screening(void *a1, const char *a2, ...)
{
  return _[a1 screening];
}

id objc_msgSend_screeningAnnouncementHasFinished(void *a1, const char *a2, ...)
{
  return _[a1 screeningAnnouncementHasFinished];
}

id objc_msgSend_screeningCall(void *a1, const char *a2, ...)
{
  return _[a1 screeningCall];
}

id objc_msgSend_screeningCalls(void *a1, const char *a2, ...)
{
  return _[a1 screeningCalls];
}

id objc_msgSend_secondaryThumperAccountForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryThumperAccountForAccountID:");
}

id objc_msgSend_secondaryThumperAccounts(void *a1, const char *a2, ...)
{
  return _[a1 secondaryThumperAccounts];
}

id objc_msgSend_selectiveSharingSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 selectiveSharingSessionUUID];
}

id objc_msgSend_sendAnswerCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnswerCallMessageToHostForCall:");
}

id objc_msgSend_sendApprovalDisplayPinToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendApprovalDisplayPinToDevice:");
}

id objc_msgSend_sendApprovalResponseToDevice_enteredCorrectly_wasCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendApprovalResponseToDevice:enteredCorrectly:wasCancelled:");
}

id objc_msgSend_sendAutomaticNameAndPhotoUsingDialRequestIfPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAutomaticNameAndPhotoUsingDialRequestIfPossible:");
}

id objc_msgSend_sendAutomaticNameAndPhotoUsingJoinRequestIfPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:");
}

id objc_msgSend_sendCallAnsweredElsewhereMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCallAnsweredElsewhereMessageToClientForCall:");
}

id objc_msgSend_sendCallConnectedMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCallConnectedMessageToClientForCall:");
}

id objc_msgSend_sendCallDialedMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCallDialedMessageToClientForCall:");
}

id objc_msgSend_sendCallDisconnectedMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCallDisconnectedMessageToClientForCall:");
}

id objc_msgSend_sendCallStartedConnectingMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCallStartedConnectingMessageToClientForCall:");
}

id objc_msgSend_sendClientsNotificationName_forCall_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendClientsNotificationName:forCall:userInfo:");
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:");
}

id objc_msgSend_sendData_forCallID_encrypted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:forCallID:encrypted:");
}

id objc_msgSend_sendData_fromAccount_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:fromAccount:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendData_onConversation_toDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:onConversation:toDestinationID:");
}

id objc_msgSend_sendData_onConversation_toDestinationID_fromMember_additionalOptions_isBlobResponse_callback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:");
}

id objc_msgSend_sendData_onConversation_toHandle_isBlobResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:onConversation:toHandle:isBlobResponse:");
}

id objc_msgSend_sendData_onConversation_toMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:onConversation:toMember:");
}

id objc_msgSend_sendData_onConversation_toMember_additionalOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:onConversation:toMember:additionalOptions:");
}

id objc_msgSend_sendData_toDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:toDestinations:");
}

id objc_msgSend_sendData_toDestinations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:toDestinations:completion:");
}

id objc_msgSend_sendData_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendData_waitUntilConnected_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:waitUntilConnected:completion:");
}

id objc_msgSend_sendDataAndAcceptInvitationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataAndAcceptInvitationIfNecessary:");
}

id objc_msgSend_sendDataAndCancelInvitationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataAndCancelInvitationIfNecessary:");
}

id objc_msgSend_sendDataAndDeclineInvitationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataAndDeclineInvitationIfNecessary:");
}

id objc_msgSend_sendDataAndSendInvitationIfNecessary_declineOnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataAndSendInvitationIfNecessary:declineOnError:");
}

id objc_msgSend_sendDataBlock(void *a1, const char *a2, ...)
{
  return _[a1 sendDataBlock];
}

id objc_msgSend_sendDataForScreenShareMessage_toParticipant_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataForScreenShareMessage:toParticipant:conversation:");
}

id objc_msgSend_sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:");
}

id objc_msgSend_sendDialCallFailedForScreenTimeForUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:");
}

id objc_msgSend_sendDialCallFailedForUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDialCallFailedForUniqueProxyIdentifier:");
}

id objc_msgSend_sendDialCallFailedForUniqueProxyIdentifier_withDisconnectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDialCallFailedForUniqueProxyIdentifier:withDisconnectedReason:");
}

id objc_msgSend_sendDialCallMessageToHostForCall_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDialCallMessageToHostForCall:completionHandler:");
}

id objc_msgSend_sendDisconnectAllCallsMessageToHostForDisconnectedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDisconnectAllCallsMessageToHostForDisconnectedCall:");
}

id objc_msgSend_sendDisconnectCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDisconnectCallMessageToHostForCall:");
}

id objc_msgSend_sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:");
}

id objc_msgSend_sendEndActiveAndAnswerCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEndActiveAndAnswerCallMessageToHostForCall:");
}

id objc_msgSend_sendEndHeldAndAnswerCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEndHeldAndAnswerCallMessageToHostForCall:");
}

id objc_msgSend_sendGroupCallMessageToHostForCall_otherCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendGroupCallMessageToHostForCall:otherCall:");
}

id objc_msgSend_sendHardPauseAvailabilityMessageToClientForState_digits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHardPauseAvailabilityMessageToClientForState:digits:");
}

id objc_msgSend_sendHardPauseDigits(void *a1, const char *a2, ...)
{
  return _[a1 sendHardPauseDigits];
}

id objc_msgSend_sendHoldActiveAndAnswerCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHoldActiveAndAnswerCallMessageToHostForCall:");
}

id objc_msgSend_sendHoldCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHoldCallMessageToHostForCall:");
}

id objc_msgSend_sendIDSAction_toDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIDSAction:toDevice:");
}

id objc_msgSend_sendIDSAction_toDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIDSAction:toDevices:");
}

id objc_msgSend_sendIncomingCallMessageToClientForCall_cannotBeAnswered_cannotRelayAudioOrVideoOnPairedDevice_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendIncomingCallMessageToClientForCall:cannotBeAnswered:cannotRelayAudioOrVideoOnPairedDevice:");
}

id objc_msgSend_sendInvitationMessageToMember_forConversation_includeAllAttributes_invitationPreferences_additionalOptions_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendInvitationMessageToMember:forConversation:includeAllAttributes:invitationPreferences:additionalOptions:");
}

id objc_msgSend_sendInvitationSentMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendInvitationSentMessageToClientForCall:");
}

id objc_msgSend_sendInvitationWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendInvitationWithData:");
}

id objc_msgSend_sendInvitationWithData_declineOnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendInvitationWithData:declineOnError:");
}

id objc_msgSend_sendJoinConversationMessageToHostForCall_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendJoinConversationMessageToHostForCall:completionHandler:");
}

id objc_msgSend_sendLetMeInRequest(void *a1, const char *a2, ...)
{
  return _[a1 sendLetMeInRequest];
}

id objc_msgSend_sendLetMeInResponseToPendingMember_forConversation_usingResponseKeyData_approved_callback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:");
}

id objc_msgSend_sendMMIOrUSSDCodeWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMMIOrUSSDCodeWithRequest:");
}

id objc_msgSend_sendManualLaunchAttemptEventWithActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendManualLaunchAttemptEventWithActivitySession:");
}

id objc_msgSend_sendManualLaunchNeededEventWithActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendManualLaunchNeededEventWithActivitySession:");
}

id objc_msgSend_sendMessage_andAcceptInvitationIfNecessaryForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:andAcceptInvitationIfNecessaryForIdentifier:");
}

id objc_msgSend_sendMessage_andCancelOrDeclineInvitationIfNecessaryForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:andCancelOrDeclineInvitationIfNecessaryForIdentifier:");
}

id objc_msgSend_sendMessage_andStartSessionIfNecessaryForIdentifier_toDestination_timeout_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendMessage:andStartSessionIfNecessaryForIdentifier:toDestination:timeout:completionHandler:");
}

id objc_msgSend_sendMessage_andStartSessionIfNecessaryForIdentifier_toDevicesSupportingProvider_requiresConversationRelay_withTimeout_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendMessage:andStartSessionIfNecessaryForIdentifier:toDevicesSupportingProvider:requiresConversationRelay:withTimeout:");
}

id objc_msgSend_sendMessage_andStartSessionIfNecessaryForIdentifiers_toDestination_timeout_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendMessage:andStartSessionIfNecessaryForIdentifiers:toDestination:timeout:completionHandler:");
}

id objc_msgSend_sendMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:completionHandler:");
}

id objc_msgSend_sendMessage_forConversation_withActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:forConversation:withActivitySession:");
}

id objc_msgSend_sendMessage_forConversation_withActivitySession_additionalOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:forConversation:withActivitySession:additionalOptions:");
}

id objc_msgSend_sendMessage_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:forIdentifier:");
}

id objc_msgSend_sendMessage_forIdentifier_customizedForRemoteProtocolVersion_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:forIdentifier:customizedForRemoteProtocolVersion:completionHandler:");
}

id objc_msgSend_sendMessage_forIdentifier_customizedForRemoteProtocolVersion_waitUntilConnected_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendMessage:forIdentifier:customizedForRemoteProtocolVersion:waitUntilConnected:completionHandler:");
}

id objc_msgSend_sendMessage_forIdentifier_toDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:forIdentifier:toDestinations:");
}

id objc_msgSend_sendMessage_fromAccount_toDestinations_priority_options_identifier_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMessage_timeout_wantsAcknowledgement_maximumRetryAttempts_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:");
}

id objc_msgSend_sendMessage_wantsAcknowledgement_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:wantsAcknowledgement:completionHandler:");
}

id objc_msgSend_sendMessagesForCreatedOrChangedLink_conversation_messageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessagesForCreatedOrChangedLink:conversation:messageType:");
}

id objc_msgSend_sendMessagesForInvalidatedLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessagesForInvalidatedLink:");
}

id objc_msgSend_sendNameAndPhotoToHandles_fromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNameAndPhotoToHandles:fromID:");
}

id objc_msgSend_sendNeedsManualInCallSoundsChangeMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNeedsManualInCallSoundsChangeMessageToClientForCall:");
}

id objc_msgSend_sendParticipantData_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendParticipantData:withContext:");
}

id objc_msgSend_sendPendingData(void *a1, const char *a2, ...)
{
  return _[a1 sendPendingData];
}

id objc_msgSend_sendPersonalNicknameToHandleID_fromHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPersonalNicknameToHandleID:fromHandleID:");
}

id objc_msgSend_sendPickRouteMessageToHostForRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPickRouteMessageToHostForRoute:");
}

id objc_msgSend_sendPinCodeAndPromptForResponseToDevice_forSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPinCodeAndPromptForResponseToDevice:forSenderIdentityUUID:");
}

id objc_msgSend_sendPlayDTMFToneForKeyMessageForCall_DTMFKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPlayDTMFToneForKeyMessageForCall:DTMFKey:");
}

id objc_msgSend_sendPullCallsMessageToHost(void *a1, const char *a2, ...)
{
  return _[a1 sendPullCallsMessageToHost];
}

id objc_msgSend_sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:");
}

id objc_msgSend_sendPushCallsMessageToClientDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPushCallsMessageToClientDestination:");
}

id objc_msgSend_sendPushRelayingCallsMessageToHostForSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPushRelayingCallsMessageToHostForSourceIdentifier:");
}

id objc_msgSend_sendReceivedDTMFUpdateForCall_dtmfUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReceivedDTMFUpdateForCall:dtmfUpdate:");
}

id objc_msgSend_sendResetStateMessageToClient(void *a1, const char *a2, ...)
{
  return _[a1 sendResetStateMessageToClient];
}

id objc_msgSend_sendResetWantsHoldMusicMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResetWantsHoldMusicMessageToClientForCall:");
}

id objc_msgSend_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendSendHardPauseDigitsMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSendHardPauseDigitsMessageToHostForCall:");
}

id objc_msgSend_sendSessionMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSessionMessage:");
}

id objc_msgSend_sendSessionMessage_toDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSessionMessage:toDestinations:");
}

id objc_msgSend_sendSessionServerTerminatedEventWithActivitySession_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSessionServerTerminatedEventWithActivitySession:code:");
}

id objc_msgSend_sendSetTTYTypeCallMessageForCall_ttyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSetTTYTypeCallMessageForCall:ttyType:");
}

id objc_msgSend_sendSetUplinkMutedCallMessageForCall_uplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSetUplinkMutedCallMessageForCall:uplinkMuted:");
}

id objc_msgSend_sendSuppressRingtoneMessageForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSuppressRingtoneMessageForCall:");
}

id objc_msgSend_sendSwapCallsMessageToHost(void *a1, const char *a2, ...)
{
  return _[a1 sendSwapCallsMessageToHost];
}

id objc_msgSend_sendToScreening(void *a1, const char *a2, ...)
{
  return _[a1 sendToScreening];
}

id objc_msgSend_sendToVoicemailAllowed(void *a1, const char *a2, ...)
{
  return _[a1 sendToVoicemailAllowed];
}

id objc_msgSend_sendUngroupCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUngroupCallMessageToHostForCall:");
}

id objc_msgSend_sendUnholdCallMessageToHostForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUnholdCallMessageToHostForCall:");
}

id objc_msgSend_sendUpdateCallContextMessageToClientForCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateCallContextMessageToClientForCallProviderManager:");
}

id objc_msgSend_sendUpdateCallDisplayContextMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateCallDisplayContextMessageToClientForCall:");
}

id objc_msgSend_sendUpdateCallModelMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateCallModelMessageToClientForCall:");
}

id objc_msgSend_sendUpdateConversationsMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateConversationsMessageToClient:");
}

id objc_msgSend_sendUpdateFailureExpectedMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateFailureExpectedMessageToClientForCall:");
}

id objc_msgSend_sendUpdateRemoteCallStateMessageToClient(void *a1, const char *a2, ...)
{
  return _[a1 sendUpdateRemoteCallStateMessageToClient];
}

id objc_msgSend_sendUpdateRemoteCallStateMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateRemoteCallStateMessageToClient:");
}

id objc_msgSend_sendUpdateRemoteUplinkMutedCallMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateRemoteUplinkMutedCallMessageToClientForCall:");
}

id objc_msgSend_sendUpdateSupportsDTMFUpdatesToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateSupportsDTMFUpdatesToClientForCall:");
}

id objc_msgSend_sendUpdateSupportsEmergencyFallbackToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateSupportsEmergencyFallbackToClientForCall:");
}

id objc_msgSend_sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:");
}

id objc_msgSend_sendUserScoreToRTCReporting_withScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUserScoreToRTCReporting:withScore:");
}

id objc_msgSend_sendVideoUpgradeMessageforConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendVideoUpgradeMessageforConversationWithUUID:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _[a1 sender];
}

id objc_msgSend_senderCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 senderCorrelationIdentifier];
}

id objc_msgSend_senderIdentitiesBlock(void *a1, const char *a2, ...)
{
  return _[a1 senderIdentitiesBlock];
}

id objc_msgSend_senderIdentityCapabilitiesStateByUUID(void *a1, const char *a2, ...)
{
  return _[a1 senderIdentityCapabilitiesStateByUUID];
}

id objc_msgSend_senderIdentityCapabilitiesWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityCapabilitiesWithUUID:");
}

id objc_msgSend_senderIdentityForAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityForAccountUUID:");
}

id objc_msgSend_senderIdentityForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityForUUID:");
}

id objc_msgSend_senderIdentityUUID(void *a1, const char *a2, ...)
{
  return _[a1 senderIdentityUUID];
}

id objc_msgSend_senderIdentityUUIDForCallerIDHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityUUIDForCallerIDHandle:");
}

id objc_msgSend_sendingAudioChangedForConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendingAudioChangedForConference:");
}

id objc_msgSend_sentLetMeInRequestForConversation_isApproved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentLetMeInRequestForConversation:isApproved:");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_serializedData(void *a1, const char *a2, ...)
{
  return _[a1 serializedData];
}

id objc_msgSend_serverBag(void *a1, const char *a2, ...)
{
  return _[a1 serverBag];
}

id objc_msgSend_serverDate(void *a1, const char *a2, ...)
{
  return _[a1 serverDate];
}

id objc_msgSend_serverDiedForConferenceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDiedForConferenceProvider:");
}

id objc_msgSend_serverDisconnectedForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDisconnectedForSession:");
}

id objc_msgSend_serverProvidedLightweightParticipantIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 serverProvidedLightweightParticipantIdentifiers];
}

id objc_msgSend_serverProvidedParticipantIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 serverProvidedParticipantIdentifiers];
}

id objc_msgSend_serverReceivedTime(void *a1, const char *a2, ...)
{
  return _[a1 serverReceivedTime];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_service_account_incomingResourceAtURL_fromID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service:account:incomingResourceAtURL:fromID:context:");
}

id objc_msgSend_service_pseudonymRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service:pseudonymRemoved:");
}

id objc_msgSend_service_pseudonymUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service:pseudonymUpdated:");
}

id objc_msgSend_serviceDescription(void *a1, const char *a2, ...)
{
  return _[a1 serviceDescription];
}

id objc_msgSend_serviceForProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceForProvider:");
}

id objc_msgSend_serviceForProvider_video_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceForProvider:video:");
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serviceIdentifier];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceStatus(void *a1, const char *a2, ...)
{
  return _[a1 serviceStatus];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_session_cameraMixedWithScreenDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:cameraMixedWithScreenDidChange:");
}

id objc_msgSend_session_changedBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:changedBytesOfDataUsed:");
}

id objc_msgSend_session_changedLocalAudioEnabled_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:changedLocalAudioEnabled:didSucceed:error:");
}

id objc_msgSend_session_changedLocalAudioPaused_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:changedLocalAudioPaused:didSucceed:error:");
}

id objc_msgSend_session_changedLocalVideoEnabled_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:changedLocalVideoEnabled:didSucceed:error:");
}

id objc_msgSend_session_changedLocalVideoPaused_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:changedLocalVideoPaused:didSucceed:error:");
}

id objc_msgSend_session_changedScreenEnabled_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:changedScreenEnabled:didSucceed:error:");
}

id objc_msgSend_session_conversationParticipantWithParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:conversationParticipantWithParticipantIdentifier:");
}

id objc_msgSend_session_didDetectError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didDetectError:");
}

id objc_msgSend_session_didJoinGroup_participantIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didJoinGroup:participantIdentifiers:error:");
}

id objc_msgSend_session_didLeaveGroupWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didLeaveGroupWithError:");
}

id objc_msgSend_session_didReceiveData_dataType_forParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveData:dataType:forParticipant:");
}

id objc_msgSend_session_didReceiveDataBlob_forParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveDataBlob:forParticipant:");
}

id objc_msgSend_session_didReceiveJoinedParticipantID_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveJoinedParticipantID:withContext:");
}

id objc_msgSend_session_didReceiveKickedParticipantIDs_withCode_withType_isTruncated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveKickedParticipantIDs:withCode:withType:isTruncated:");
}

id objc_msgSend_session_didReceiveLeftParticipantID_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveLeftParticipantID:withContext:");
}

id objc_msgSend_session_didReceiveLocalParticipantType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveLocalParticipantType:error:");
}

id objc_msgSend_session_didReceiveReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveReport:");
}

id objc_msgSend_session_didReceiveServerErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveServerErrorCode:");
}

id objc_msgSend_session_didRegisterPluginAllocationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didRegisterPluginAllocationInfo:");
}

id objc_msgSend_session_didStart_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didStart:error:");
}

id objc_msgSend_session_didStopWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didStopWithError:");
}

id objc_msgSend_session_didStopWithError_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didStopWithError:metadata:");
}

id objc_msgSend_session_didUnregisterPluginAllocationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUnregisterPluginAllocationInfo:");
}

id objc_msgSend_session_endedWithError_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:endedWithError:reason:");
}

id objc_msgSend_session_endedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:endedWithReason:");
}

id objc_msgSend_session_invitationSentToPushTokens_shouldBreakBeforeMake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:invitationSentToPushTokens:shouldBreakBeforeMake:");
}

id objc_msgSend_session_localParticipantDidReact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:localParticipantDidReact:");
}

id objc_msgSend_session_receivedActiveLightweightParticipantDestinationsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedActiveLightweightParticipantDestinationsByIdentifier:");
}

id objc_msgSend_session_receivedActiveParticipantDestinationsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedActiveParticipantDestinationsByIdentifier:");
}

id objc_msgSend_session_receivedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedData:");
}

id objc_msgSend_session_receivedData_fromDestination_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedData:fromDestination:device:");
}

id objc_msgSend_session_receivedInvitationAcceptWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedInvitationAcceptWithData:");
}

id objc_msgSend_session_receivedInvitationAcceptWithData_fromDestination_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedInvitationAcceptWithData:fromDestination:device:");
}

id objc_msgSend_session_receivedInvitationCancelWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedInvitationCancelWithData:");
}

id objc_msgSend_session_receivedInvitationCancelWithData_fromDestination_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedInvitationCancelWithData:fromDestination:device:");
}

id objc_msgSend_session_receivedInvitationDeclineWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedInvitationDeclineWithData:");
}

id objc_msgSend_session_receivedInvitationDeclineWithData_fromDestination_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:receivedInvitationDeclineWithData:fromDestination:device:");
}

id objc_msgSend_session_requestedOneToOneModeEnabled_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:requestedOneToOneModeEnabled:didSucceed:error:");
}

id objc_msgSend_session_screenCaptureDidStart_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:screenCaptureDidStart:withError:");
}

id objc_msgSend_session_screenCaptureDidStop_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:screenCaptureDidStop:withError:");
}

id objc_msgSend_session_screenShareAttributesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:screenShareAttributesUpdated:");
}

id objc_msgSend_sessionCleanupTimeout(void *a1, const char *a2, ...)
{
  return _[a1 sessionCleanupTimeout];
}

id objc_msgSend_sessionDidReceiveKeyUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidReceiveKeyUpdate:");
}

id objc_msgSend_sessionDidTerminate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidTerminate:");
}

id objc_msgSend_sessionEndedReason(void *a1, const char *a2, ...)
{
  return _[a1 sessionEndedReason];
}

id objc_msgSend_sessionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForIdentifier:");
}

id objc_msgSend_sessionForTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForTransactionID:");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _[a1 sessionID];
}

id objc_msgSend_sessionIDAliasWithSalt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIDAliasWithSalt:");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_sessionLocalParticipantDidStopReacting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionLocalParticipantDidStopReacting:");
}

id objc_msgSend_sessionMessenger(void *a1, const char *a2, ...)
{
  return _[a1 sessionMessenger];
}

id objc_msgSend_sessionProtocolVersionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProtocolVersionForIdentifier:");
}

id objc_msgSend_sessionProvider(void *a1, const char *a2, ...)
{
  return _[a1 sessionProvider];
}

id objc_msgSend_sessionProvider_didJoinGroupWithParticipantIdentifiers_localParticipantIdentifier_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didJoinGroupWithParticipantIdentifiers:localParticipantIdentifier:error:");
}

id objc_msgSend_sessionProvider_didLeaveGroupWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didLeaveGroupWithError:");
}

id objc_msgSend_sessionProvider_didReceiveActiveLightweightParticipants_success_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveActiveLightweightParticipants:success:");
}

id objc_msgSend_sessionProvider_didReceiveActiveParticipants_success_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveActiveParticipants:success:");
}

id objc_msgSend_sessionProvider_didReceiveData_dataType_forParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveData:dataType:forParticipant:");
}

id objc_msgSend_sessionProvider_didReceiveDataBlob_forParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveDataBlob:forParticipant:");
}

id objc_msgSend_sessionProvider_didReceiveJoinedParticipantID_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveJoinedParticipantID:withContext:");
}

id objc_msgSend_sessionProvider_didReceiveKickedParticipantIDs_withCode_withType_isTruncated_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveKickedParticipantIDs:withCode:withType:isTruncated:");
}

id objc_msgSend_sessionProvider_didReceiveLeftParticipantID_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveLeftParticipantID:withContext:");
}

id objc_msgSend_sessionProvider_didReceiveLocalParticipantType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveLocalParticipantType:error:");
}

id objc_msgSend_sessionProvider_didReceiveReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveReport:");
}

id objc_msgSend_sessionProvider_didReceiveServerErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveServerErrorCode:");
}

id objc_msgSend_sessionProvider_didReceiveUnderlyingLinksStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didReceiveUnderlyingLinksStatus:");
}

id objc_msgSend_sessionProvider_didRegisterPluginAllocationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didRegisterPluginAllocationInfo:");
}

id objc_msgSend_sessionProvider_didUnregisterPluginAllocationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:didUnregisterPluginAllocationInfo:");
}

id objc_msgSend_sessionProvider_endedWithReason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:endedWithReason:error:");
}

id objc_msgSend_sessionProvider_invitationSentToPushTokens_shouldBreakBeforeMake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:invitationSentToPushTokens:shouldBreakBeforeMake:");
}

id objc_msgSend_sessionProvider_receivedInvitationAcceptFromID_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:receivedInvitationAcceptFromID:withData:");
}

id objc_msgSend_sessionProvider_receivedInvitationCancelFromID_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:receivedInvitationCancelFromID:withData:");
}

id objc_msgSend_sessionProvider_receivedInvitationDeclineFromID_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:receivedInvitationDeclineFromID:withData:");
}

id objc_msgSend_sessionProvider_receivedSessionMessageFromID_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProvider:receivedSessionMessageFromID:withData:");
}

id objc_msgSend_sessionProviderDidReceiveKeyUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProviderDidReceiveKeyUpdate:");
}

id objc_msgSend_sessionProviderDidTerminate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProviderDidTerminate:");
}

id objc_msgSend_sessionProviderStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionProviderStarted:");
}

id objc_msgSend_sessionShouldReconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionShouldReconnect:");
}

id objc_msgSend_sessionStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStarted:");
}

id objc_msgSend_sessionSwitchTimeout(void *a1, const char *a2, ...)
{
  return _[a1 sessionSwitchTimeout];
}

id objc_msgSend_sessionToken(void *a1, const char *a2, ...)
{
  return _[a1 sessionToken];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 sessionUUID];
}

id objc_msgSend_sessionUpdateCompletionQueue(void *a1, const char *a2, ...)
{
  return _[a1 sessionUpdateCompletionQueue];
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return _[a1 sessions];
}

id objc_msgSend_sessionsByToken(void *a1, const char *a2, ...)
{
  return _[a1 sessionsByToken];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setABTestConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setABTestConfiguration:");
}

id objc_msgSend_setAcceptPayloadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptPayloadData:");
}

id objc_msgSend_setAccessoryButtonEventsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryButtonEventsEnabled:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountID:");
}

id objc_msgSend_setAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountUUID:");
}

id objc_msgSend_setAccountUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountUUIDString:");
}

id objc_msgSend_setAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccounts:");
}

id objc_msgSend_setAccountsMatchForSecondaryCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountsMatchForSecondaryCalling:");
}

id objc_msgSend_setAccountsSupportSecondaryCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountsSupportSecondaryCalling:");
}

id objc_msgSend_setActionDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionDescription:");
}

id objc_msgSend_setActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionURL:");
}

id objc_msgSend_setActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivated:");
}

id objc_msgSend_setActiveCategoryVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCategoryVolume:");
}

id objc_msgSend_setActiveContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveContexts:");
}

id objc_msgSend_setActiveIDSDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveIDSDestination:");
}

id objc_msgSend_setActiveLightweightParticipantDestinationsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveLightweightParticipantDestinationsByIdentifier:");
}

id objc_msgSend_setActiveLightweightParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveLightweightParticipants:");
}

id objc_msgSend_setActiveParticipantDestinationsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveParticipantDestinationsByIdentifier:");
}

id objc_msgSend_setActiveParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveParticipants:");
}

id objc_msgSend_setActiveRemoteParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRemoteParticipant:");
}

id objc_msgSend_setActiveRemoteParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRemoteParticipantHandles:");
}

id objc_msgSend_setActiveRemoteParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRemoteParticipants:");
}

id objc_msgSend_setActiveRequest_forTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRequest:forTransactionID:");
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivity:");
}

id objc_msgSend_setActivityAuthorization_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityAuthorization:forBundleID:");
}

id objc_msgSend_setActivityContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityContext:");
}

id objc_msgSend_setActivityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIdentifier:");
}

id objc_msgSend_setActivityMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityMetadata:");
}

id objc_msgSend_setActivityQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityQueue:");
}

id objc_msgSend_setActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivitySession:");
}

id objc_msgSend_setActivitySessionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivitySessionManager:");
}

id objc_msgSend_setActivitySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivitySessions:");
}

id objc_msgSend_setAddCallAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddCallAllowed:");
}

id objc_msgSend_setAmbiguityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmbiguityState:");
}

id objc_msgSend_setAnnounceCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceCalls:");
}

id objc_msgSend_setAnsweringMachineAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnsweringMachineAvailable:");
}

id objc_msgSend_setApplicationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationContext:");
}

id objc_msgSend_setApplicationPolicyManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationPolicyManager:");
}

id objc_msgSend_setApplicationState_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationState:forBundleIdentifier:");
}

id objc_msgSend_setApproved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApproved:");
}

id objc_msgSend_setApprovedSecondaryDeviceIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApprovedSecondaryDeviceIDs:");
}

id objc_msgSend_setApproverHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApproverHandle:");
}

id objc_msgSend_setAssociated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociated:");
}

id objc_msgSend_setAssociatedPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociatedPseudonym:");
}

id objc_msgSend_setAssociatedThumperAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociatedThumperAccountID:");
}

id objc_msgSend_setAssociation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociation:");
}

id objc_msgSend_setAssociationAVCIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociationAVCIdentifier:");
}

id objc_msgSend_setAssociationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociationIdentifier:");
}

id objc_msgSend_setAssociationVoucher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociationVoucher:");
}

id objc_msgSend_setAsynchronousExportedObjectProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAsynchronousExportedObjectProxy:");
}

id objc_msgSend_setAsynchronousServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAsynchronousServer:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:");
}

id objc_msgSend_setAudioAndVideoMuted_forParticipantWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioAndVideoMuted:forParticipantWithIdentifier:");
}

id objc_msgSend_setAudioCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioCategory:");
}

id objc_msgSend_setAudioController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioController:");
}

id objc_msgSend_setAudioDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioDisabled:");
}

id objc_msgSend_setAudioEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioEnabled:");
}

id objc_msgSend_setAudioInjectionAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioInjectionAllowed:");
}

id objc_msgSend_setAudioInjectionAllowed_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioInjectionAllowed:forConversationWithUUID:");
}

id objc_msgSend_setAudioInterruptionOperationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioInterruptionOperationMode:");
}

id objc_msgSend_setAudioInterruptionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioInterruptionProvider:");
}

id objc_msgSend_setAudioMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioMode:");
}

id objc_msgSend_setAudioMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioMuted:");
}

id objc_msgSend_setAudioMutedForHoldMusic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioMutedForHoldMusic:");
}

id objc_msgSend_setAudioPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioPaused:");
}

id objc_msgSend_setAudioPaused_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioPaused:forConversationWithUUID:");
}

id objc_msgSend_setAudioPaused_forParticipantWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioPaused:forParticipantWithIdentifier:");
}

id objc_msgSend_setAudioPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioPriority:");
}

id objc_msgSend_setAudioReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioReady:");
}

id objc_msgSend_setAudioRouteCollections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRouteCollections:");
}

id objc_msgSend_setAudioRouteUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRouteUniqueIdentifier:");
}

id objc_msgSend_setAudioSessionActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioSessionActive:");
}

id objc_msgSend_setAudioSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioSessionID:");
}

id objc_msgSend_setAudioSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioSourceIdentifier:");
}

id objc_msgSend_setAudioVideoMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioVideoMode:");
}

id objc_msgSend_setAuthorization_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthorization:forBundleID:");
}

id objc_msgSend_setAutoSharePlayEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoSharePlayEnabled:");
}

id objc_msgSend_setAvMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvMode:");
}

id objc_msgSend_setAvcData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcData:");
}

id objc_msgSend_setAvcIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcIdentifier:");
}

id objc_msgSend_setAvcScreenCapture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcScreenCapture:");
}

id objc_msgSend_setAvcSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcSession:");
}

id objc_msgSend_setAvcSessionCreationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcSessionCreationBlock:");
}

id objc_msgSend_setAvcSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcSessionIdentifier:");
}

id objc_msgSend_setAvcSessionInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcSessionInProgress:");
}

id objc_msgSend_setAvcSessionToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvcSessionToken:");
}

id objc_msgSend_setBackingCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingCallSource:");
}

id objc_msgSend_setBaseDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseDestinationID:");
}

id objc_msgSend_setBeginListeningBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBeginListeningBlock:");
}

id objc_msgSend_setBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBehavior:");
}

id objc_msgSend_setBestAppSuggestionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBestAppSuggestionManager:");
}

id objc_msgSend_setBlockIncomingInvitationsDuringCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockIncomingInvitationsDuringCall:");
}

id objc_msgSend_setBlockMultipleIncomingInvitations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockMultipleIncomingInvitations:");
}

id objc_msgSend_setBlockedByExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockedByExtension:");
}

id objc_msgSend_setBlockedByExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockedByExtensionName:");
}

id objc_msgSend_setBluetoothAudioFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothAudioFormat:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleURL:");
}

id objc_msgSend_setBundleURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleURLString:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesOfDataUsed:");
}

id objc_msgSend_setCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCall:");
}

id objc_msgSend_setCallCapabilities_forSenderIdentityCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallCapabilities:forSenderIdentityCapabilitiesState:");
}

id objc_msgSend_setCallCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallCapabilitiesState:");
}

id objc_msgSend_setCallChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallChanged:");
}

id objc_msgSend_setCallDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDataSource:");
}

id objc_msgSend_setCallDelegatesIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDelegatesIfNeeded:");
}

id objc_msgSend_setCallDirectoryExtensionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDirectoryExtensionIdentifier:");
}

id objc_msgSend_setCallDirectoryIdentityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDirectoryIdentityType:");
}

id objc_msgSend_setCallDirectoryLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDirectoryLabel:");
}

id objc_msgSend_setCallDirectoryLocalizedExtensionContainingAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDirectoryLocalizedExtensionContainingAppName:");
}

id objc_msgSend_setCallDurationLimitTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDurationLimitTimer:");
}

id objc_msgSend_setCallGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallGroupUUID:");
}

id objc_msgSend_setCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallID:");
}

id objc_msgSend_setCallInfoBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallInfoBlob:");
}

id objc_msgSend_setCallModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallModel:");
}

id objc_msgSend_setCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallProviderManager:");
}

id objc_msgSend_setCallScreeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallScreeningMode:");
}

id objc_msgSend_setCallStateContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallStateContext:");
}

id objc_msgSend_setCallStateController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallStateController:");
}

id objc_msgSend_setCallStateMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallStateMonitor:");
}

id objc_msgSend_setCallStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallStatus:");
}

id objc_msgSend_setCallSubType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallSubType:");
}

id objc_msgSend_setCallTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallTokens:");
}

id objc_msgSend_setCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallUUID:");
}

id objc_msgSend_setCallUUID_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallUUID:forConversationUUID:");
}

id objc_msgSend_setCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallback:");
}

id objc_msgSend_setCaller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaller:");
}

id objc_msgSend_setCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerID:");
}

id objc_msgSend_setCallerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerId:");
}

id objc_msgSend_setCallerIdAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerIdAvailability:");
}

id objc_msgSend_setCallerNameFromNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerNameFromNetwork:");
}

id objc_msgSend_setCameraMixedWithScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraMixedWithScreen:");
}

id objc_msgSend_setCannotBeAnswered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCannotBeAnswered:");
}

id objc_msgSend_setCannotRelayAudioOrVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCannotRelayAudioOrVideo:");
}

id objc_msgSend_setCannotRelayAudioOrVideoOnPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCannotRelayAudioOrVideoOnPairedDevice:");
}

id objc_msgSend_setCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapabilities:");
}

id objc_msgSend_setCapabilitiesValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapabilitiesValid:");
}

id objc_msgSend_setCapability_enabled_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapability:enabled:info:");
}

id objc_msgSend_setCapabilityInfo_forSubscription_senderIdentityCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapabilityInfo:forSubscription:senderIdentityCapabilitiesState:");
}

id objc_msgSend_setCaptionsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionsToken:");
}

id objc_msgSend_setCapturingLocalVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapturingLocalVideo:");
}

id objc_msgSend_setCarPlayDeviceConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarPlayDeviceConnected:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCellularDataAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularDataAllowed:");
}

id objc_msgSend_setCellularDataPreferred_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularDataPreferred:");
}

id objc_msgSend_setChManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChManager:");
}

id objc_msgSend_setCheckInMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCheckInMessage:");
}

id objc_msgSend_setClientManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientManager:");
}

id objc_msgSend_setClientMessageReceiveTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientMessageReceiveTime:");
}

id objc_msgSend_setClientMessagingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientMessagingDelegate:");
}

id objc_msgSend_setClientUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientUUID:");
}

id objc_msgSend_setCloudCallingDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudCallingDevices:");
}

id objc_msgSend_setCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCode:");
}

id objc_msgSend_setCollaborationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollaborationIdentifier:");
}

id objc_msgSend_setCombinedAudioStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCombinedAudioStreamToken:");
}

id objc_msgSend_setCommonMessagingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommonMessagingDelegate:");
}

id objc_msgSend_setCompanyDepartment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompanyDepartment:");
}

id objc_msgSend_setCompanyImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompanyImageURL:");
}

id objc_msgSend_setCompanyLogoURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompanyLogoURL:");
}

id objc_msgSend_setCompanyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompanyName:");
}

id objc_msgSend_setCompletedDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletedDescription:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConference:");
}

id objc_msgSend_setConferenceActiveForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConferenceActiveForIdentifier:");
}

id objc_msgSend_setConferenceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConferenceProvider:");
}

id objc_msgSend_setConferenceState_forCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConferenceState:forCallID:");
}

id objc_msgSend_setConferenceVisualRectangle_forCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConferenceVisualRectangle:forCallID:");
}

id objc_msgSend_setConferenced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConferenced:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConnectionTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionTimeout:");
}

id objc_msgSend_setConnectionTimeoutTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionTimeoutTime:");
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifier:");
}

id objc_msgSend_setContactIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifiers:");
}

id objc_msgSend_setContactLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactLabel:");
}

id objc_msgSend_setContactName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactName:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setContextIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextIdentifier:");
}

id objc_msgSend_setConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversation:");
}

id objc_msgSend_setConversationFailureContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationFailureContext:");
}

id objc_msgSend_setConversationGridDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationGridDisplayMode:");
}

id objc_msgSend_setConversationGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationGroupUUID:");
}

id objc_msgSend_setConversationGroupUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationGroupUUIDString:");
}

id objc_msgSend_setConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationID:");
}

id objc_msgSend_setConversationLink_allowUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationLink:allowUpdate:");
}

id objc_msgSend_setConversationLink_forConversation_replyToCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationLink:forConversation:replyToCompletionHandler:");
}

id objc_msgSend_setConversationLinkBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationLinkBaseURL:");
}

id objc_msgSend_setConversationMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationMembers:");
}

id objc_msgSend_setConversationMessageBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationMessageBytes:");
}

id objc_msgSend_setConversationProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationProviderIdentifier:");
}

id objc_msgSend_setConversationTimeBase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationTimeBase:");
}

id objc_msgSend_setConversationUUID_forCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationUUID:forCallUUID:");
}

id objc_msgSend_setConversationUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationUUIDString:");
}

id objc_msgSend_setConversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversations:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountOfNotificationsReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfNotificationsReceived:");
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreationDate:");
}

id objc_msgSend_setCreationDateEpochTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreationDateEpochTime:");
}

id objc_msgSend_setCrossDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCrossDeviceIdentifier:");
}

id objc_msgSend_setCsCallingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCsCallingAvailable:");
}

id objc_msgSend_setCtCapabilitiesValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCtCapabilitiesValid:");
}

id objc_msgSend_setCurrentAudioInputDeviceToDeviceWithUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentAudioInputDeviceToDeviceWithUID:");
}

id objc_msgSend_setCurrentAudioOutputDeviceToDeviceWithUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentAudioOutputDeviceToDeviceWithUID:");
}

id objc_msgSend_setCurrentLocalScreenShareAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentLocalScreenShareAttributes:");
}

id objc_msgSend_setCurrentParticipantPresentationContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentParticipantPresentationContexts:");
}

id objc_msgSend_setCurrentlyAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyAvailable:");
}

id objc_msgSend_setCurrentlyPicked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyPicked:");
}

id objc_msgSend_setCurrentlyTrackedA2DPRouteIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyTrackedA2DPRouteIdentifier:");
}

id objc_msgSend_setDTMFKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDTMFKey:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateAnsweredOrDialed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateAnsweredOrDialed:");
}

id objc_msgSend_setDateConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateConnected:");
}

id objc_msgSend_setDateEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateEnded:");
}

id objc_msgSend_setDateReceivedFirstRemoteFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateReceivedFirstRemoteFrame:");
}

id objc_msgSend_setDateScreeningEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateScreeningEnded:");
}

id objc_msgSend_setDateSentInvitation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateSentInvitation:");
}

id objc_msgSend_setDateStartedConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStartedConnecting:");
}

id objc_msgSend_setDateStartedOutgoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStartedOutgoing:");
}

id objc_msgSend_setDefaultPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultPairedDevice:");
}

id objc_msgSend_setDeferCommittingTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferCommittingTransactions:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateQueue:");
}

id objc_msgSend_setDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationID:");
}

id objc_msgSend_setDeviceFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFamily:");
}

id objc_msgSend_setDeviceHomeButtonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceHomeButtonType:");
}

id objc_msgSend_setDeviceRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceRole:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialRequest:");
}

id objc_msgSend_setDialType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialType:");
}

id objc_msgSend_setDialingIDSDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialingIDSDestination:");
}

id objc_msgSend_setDidPrepareHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidPrepareHandler:");
}

id objc_msgSend_setDidStartHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidStartHandler:");
}

id objc_msgSend_setDidStopHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidStopHandler:");
}

id objc_msgSend_setDisconnectedCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisconnectedCause:");
}

id objc_msgSend_setDisconnectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisconnectedReason:");
}

id objc_msgSend_setDiscoverySessionStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoverySessionStateChangedHandler:");
}

id objc_msgSend_setDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayContext:");
}

id objc_msgSend_setDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayID:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplayScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayScale:");
}

id objc_msgSend_setDowngradeToAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDowngradeToAudio:");
}

id objc_msgSend_setDowngradeToOneToOneAfterDelayBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDowngradeToOneToOneAfterDelayBlock:");
}

id objc_msgSend_setDownlinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownlinkMuted:");
}

id objc_msgSend_setDownlinkMuted_forParticipantWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownlinkMuted:forParticipantWithIdentifier:");
}

id objc_msgSend_setDownlinkMuted_forRemoteParticipantsOnConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownlinkMuted:forRemoteParticipantsOnConversationWithUUID:");
}

id objc_msgSend_setDownlinkStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownlinkStreamToken:");
}

id objc_msgSend_setDtmfUpdateDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDtmfUpdateDigits:");
}

id objc_msgSend_setDummyPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDummyPayload:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setDynamicDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicDisplayContext:");
}

id objc_msgSend_setDynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicIdentifier:");
}

id objc_msgSend_setEligibleForHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForHandoff:");
}

id objc_msgSend_setEligibleForPublicIndexing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForPublicIndexing:");
}

id objc_msgSend_setEligibleForSearch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForSearch:");
}

id objc_msgSend_setEmergency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergency:");
}

id objc_msgSend_setEmergencyCallbackCapabilitiesDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyCallbackCapabilitiesDidChange:");
}

id objc_msgSend_setEmergencyCallbackModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyCallbackModeEnabled:");
}

id objc_msgSend_setEmergencyCallbackPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyCallbackPossible:");
}

id objc_msgSend_setEmergencyCurrentlyAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyCurrentlyAvailable:");
}

id objc_msgSend_setEmergencyHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyHandles:");
}

id objc_msgSend_setEmergencyLabeledHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyLabeledHandles:");
}

id objc_msgSend_setEmergencyMediaItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyMediaItems:");
}

id objc_msgSend_setEmergencySupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencySupported:");
}

id objc_msgSend_setEmergencyTUHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyTUHandles:");
}

id objc_msgSend_setEmergencyTULabeledHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmergencyTULabeledHandles:");
}

id objc_msgSend_setEnableCriticalReliability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableCriticalReliability:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnclosedEncryptedType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnclosedEncryptedType:");
}

id objc_msgSend_setEncryptedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEncryptedData:");
}

id objc_msgSend_setEncryptedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEncryptedMessage:");
}

id objc_msgSend_setEndAndAnswerAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndAndAnswerAllowed:");
}

id objc_msgSend_setEndDueToHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndDueToHandoff:");
}

id objc_msgSend_setEndedError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndedError:");
}

id objc_msgSend_setEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndedReason:");
}

id objc_msgSend_setEndpointIDSDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointIDSDestination:");
}

id objc_msgSend_setEndpointIDSDestinationURIs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointIDSDestinationURIs:");
}

id objc_msgSend_setEndpointOnCurrentDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointOnCurrentDevice:");
}

id objc_msgSend_setExpectedAudioEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedAudioEnabled:");
}

id objc_msgSend_setExpectedAudioPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedAudioPaused:");
}

id objc_msgSend_setExpectedEndpointOnMessagingDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedEndpointOnMessagingDevice:");
}

id objc_msgSend_setExpectedRelayClientDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedRelayClientDestination:");
}

id objc_msgSend_setExpectedScreenEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedScreenEnabled:");
}

id objc_msgSend_setExpectedVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedVideoEnabled:");
}

id objc_msgSend_setExpectedVideoPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedVideoPaused:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFaceTimeAudioAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeAudioAvailable:");
}

id objc_msgSend_setFaceTimeDemuxerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeDemuxerDelegate:");
}

id objc_msgSend_setFaceTimeIDStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeIDStatus:");
}

id objc_msgSend_setFaceTimeIDStatusRefreshed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeIDStatusRefreshed:");
}

id objc_msgSend_setFaceTimeTransportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeTransportType:");
}

id objc_msgSend_setFaceTimeVideoAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeVideoAvailable:");
}

id objc_msgSend_setFailureContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailureContext:");
}

id objc_msgSend_setFailureExpected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailureExpected:");
}

id objc_msgSend_setFailureReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailureReason:");
}

id objc_msgSend_setFallbackApplicationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackApplicationName:");
}

id objc_msgSend_setFallbackURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackURL:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFeatureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureFlags:");
}

id objc_msgSend_setFilterBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterBlock:");
}

id objc_msgSend_setFilteredOutReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteredOutReason:");
}

id objc_msgSend_setFrameRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameRate:");
}

id objc_msgSend_setFromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromHandle:");
}

id objc_msgSend_setFromStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromStorage:");
}

id objc_msgSend_setFrontBoardOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrontBoardOptions:");
}

id objc_msgSend_setGeneratorDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratorDescriptor:");
}

id objc_msgSend_setGeneratorID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratorID:");
}

id objc_msgSend_setGeneratorVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratorVersion:");
}

id objc_msgSend_setGftDowngradeToOneToOneAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGftDowngradeToOneToOneAvailable:");
}

id objc_msgSend_setGftTLEEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGftTLEEnabled:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setGondolaCallingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGondolaCallingAvailable:");
}

id objc_msgSend_setGridDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridDisplayMode:");
}

id objc_msgSend_setGridDisplayMode_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridDisplayMode:forConversationWithUUID:");
}

id objc_msgSend_setGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupUUID:");
}

id objc_msgSend_setGroupUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupUUIDString:");
}

id objc_msgSend_setGuest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuest:");
}

id objc_msgSend_setGuestModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuestModeEnabled:");
}

id objc_msgSend_setHandedOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandedOff:");
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandle:");
}

id objc_msgSend_setHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleType:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHandlesToInvites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlesToInvites:");
}

id objc_msgSend_setHandoffActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffActivity:");
}

id objc_msgSend_setHandoffAudioController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffAudioController:");
}

id objc_msgSend_setHandoffContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffContext:");
}

id objc_msgSend_setHandoffEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffEligibility:");
}

id objc_msgSend_setHandoffIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffIdentifiers:");
}

id objc_msgSend_setHandoffRecipientParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffRecipientParticipant:");
}

id objc_msgSend_setHardPauseAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardPauseAvailable:");
}

id objc_msgSend_setHardPauseDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardPauseDigits:");
}

id objc_msgSend_setHardPauseDigitsState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardPauseDigitsState:");
}

id objc_msgSend_setHasAudioFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasAudioFinished:");
}

id objc_msgSend_setHasAudioInterruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasAudioInterruption:");
}

id objc_msgSend_setHasBeenUnlockedSinceBoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenUnlockedSinceBoot:");
}

id objc_msgSend_setHasCalledStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCalledStop:");
}

id objc_msgSend_setHasCellularSettingsRemediation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCellularSettingsRemediation:");
}

id objc_msgSend_setHasCleanedUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCleanedUp:");
}

id objc_msgSend_setHasConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasConnected:");
}

id objc_msgSend_setHasDateAndTimeSettingsRemediation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasDateAndTimeSettingsRemediation:");
}

id objc_msgSend_setHasEmergencyVideoStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasEmergencyVideoStream:");
}

id objc_msgSend_setHasEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasEnded:");
}

id objc_msgSend_setHasJoined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasJoined:");
}

id objc_msgSend_setHasLocationSettingsRemediation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasLocationSettingsRemediation:");
}

id objc_msgSend_setHasReceivedAccept_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasReceivedAccept:");
}

id objc_msgSend_setHasReceivedFirstRemoteFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasReceivedFirstRemoteFrame:");
}

id objc_msgSend_setHasReceivedLetMeInRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasReceivedLetMeInRequest:");
}

id objc_msgSend_setHasSentInvitation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSentInvitation:");
}

id objc_msgSend_setHasStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasStarted:");
}

id objc_msgSend_setHasStartedConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasStartedConnecting:");
}

id objc_msgSend_setHasVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasVideo:");
}

id objc_msgSend_setHasWiFiSettingsRemediation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasWiFiSettingsRemediation:");
}

id objc_msgSend_setHeld_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeld:");
}

id objc_msgSend_setHeySiriEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeySiriEnabled:");
}

id objc_msgSend_setHighlightIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightIdentifier:");
}

id objc_msgSend_setHoldAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHoldAllowed:");
}

id objc_msgSend_setHoldAndAnswerAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHoldAndAnswerAllowed:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHostCallCreationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostCallCreationTime:");
}

id objc_msgSend_setHostCreationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostCreationTime:");
}

id objc_msgSend_setHostMessageSendTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostMessageSendTime:");
}

id objc_msgSend_setHostMessagingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostMessagingDelegate:");
}

id objc_msgSend_setHostedOnCurrentDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostedOnCurrentDevice:");
}

id objc_msgSend_setIDSAliasingSalt_onContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIDSAliasingSalt:onContainer:");
}

id objc_msgSend_setIMAVCapabilities_toCaps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIMAVCapabilities:toCaps:");
}

id objc_msgSend_setIMDaemonConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIMDaemonConnected:");
}

id objc_msgSend_setISOCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setISOCountryCode:");
}

id objc_msgSend_setIconTemplateImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconTemplateImageData:");
}

id objc_msgSend_setIdentificationCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentificationCategory:");
}

id objc_msgSend_setIdentifiedSpamInCallerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifiedSpamInCallerName:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifierUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifierUUIDString:");
}

id objc_msgSend_setIdentityExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentityExtension:");
}

id objc_msgSend_setIdsAliasingSalt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsAliasingSalt:");
}

id objc_msgSend_setIgnoreLMIRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreLMIRequests:");
}

id objc_msgSend_setIgnoreLetMeInRequests_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreLetMeInRequests:forConversationUUID:");
}

id objc_msgSend_setIgnoreStartPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreStartPreview:");
}

id objc_msgSend_setIgnoresBluetoothDeviceUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoresBluetoothDeviceUID:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageData:");
}

id objc_msgSend_setImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageURL:");
}

id objc_msgSend_setInitialLinkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialLinkType:");
}

id objc_msgSend_setInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitiator:");
}

id objc_msgSend_setInjectingAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInjectingAudio:");
}

id objc_msgSend_setInputAudioPowerSpectrumToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputAudioPowerSpectrumToken:");
}

id objc_msgSend_setInputFrequencyMeteringEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputFrequencyMeteringEnabled:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setInvitationPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationPreferences:");
}

id objc_msgSend_setInvitationTimeOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationTimeOut:");
}

id objc_msgSend_setInvitationTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationTimeout:");
}

id objc_msgSend_setInvitationTimeoutTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationTimeoutTime:");
}

id objc_msgSend_setInviteCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInviteCompletion:");
}

id objc_msgSend_setInviteData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInviteData:");
}

id objc_msgSend_setInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedHandles:");
}

id objc_msgSend_setInvitedMemberHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedMemberHandles:");
}

id objc_msgSend_setInvitedPushTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedPushTokens:");
}

id objc_msgSend_setIsActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActivated:");
}

id objc_msgSend_setIsAnyOtherAccountDeviceActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAnyOtherAccountDeviceActive:");
}

id objc_msgSend_setIsAudioEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAudioEnabled:");
}

id objc_msgSend_setIsAudioPausedToStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAudioPausedToStart:");
}

id objc_msgSend_setIsAuthTagEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAuthTagEnabled:");
}

id objc_msgSend_setIsCursorCaptured_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCursorCaptured:");
}

id objc_msgSend_setIsDuplexAudioOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDuplexAudioOnly:");
}

id objc_msgSend_setIsGFTDowngradeToOneToOneAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGFTDowngradeToOneToOneAvailable:");
}

id objc_msgSend_setIsGondolaCallingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGondolaCallingAvailable:");
}

id objc_msgSend_setIsKeyExchangeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsKeyExchangeEnabled:");
}

id objc_msgSend_setIsKnownCaller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsKnownCaller:");
}

id objc_msgSend_setIsLetMeInApproved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLetMeInApproved:");
}

id objc_msgSend_setIsLightweight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLightweight:");
}

id objc_msgSend_setIsLightweightMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLightweightMember:");
}

id objc_msgSend_setIsLightweightPrimaryInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLightweightPrimaryInitiated:");
}

id objc_msgSend_setIsLocallyInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLocallyInitiated:");
}

id objc_msgSend_setIsMomentsAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMomentsAvailable:");
}

id objc_msgSend_setIsOtherInvitedHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsOtherInvitedHandle:");
}

id objc_msgSend_setIsPersonaAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPersonaAvailable:");
}

id objc_msgSend_setIsPhotosSharePlayAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPhotosSharePlayAvailable:");
}

id objc_msgSend_setIsReRing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsReRing:");
}

id objc_msgSend_setIsRegistered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRegistered:");
}

id objc_msgSend_setIsRelayEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRelayEnabled:");
}

id objc_msgSend_setIsRelayForced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRelayForced:");
}

id objc_msgSend_setIsScreenSharingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsScreenSharingAvailable:");
}

id objc_msgSend_setIsSendingAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSendingAudio:");
}

id objc_msgSend_setIsSendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSendingVideo:");
}

id objc_msgSend_setIsShortMKIEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsShortMKIEnabled:");
}

id objc_msgSend_setIsSpatialPersonaEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSpatialPersonaEnabled:");
}

id objc_msgSend_setIsSystemActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSystemActivity:");
}

id objc_msgSend_setIsTLEEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTLEEnabled:");
}

id objc_msgSend_setIsUPlusNDowngradeAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUPlusNDowngradeAvailable:");
}

id objc_msgSend_setIsUPlusOneAVLessAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUPlusOneAVLessAvailable:");
}

id objc_msgSend_setIsUPlusOneScreenSharingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUPlusOneScreenSharingAvailable:");
}

id objc_msgSend_setIsUPlusOneVisionToVisionAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUPlusOneVisionToVisionAvailable:");
}

id objc_msgSend_setIsUnderlyingLinksConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUnderlyingLinksConnected:");
}

id objc_msgSend_setIsVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsVideoEnabled:");
}

id objc_msgSend_setIsVideoPausedToStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsVideoPausedToStart:");
}

id objc_msgSend_setIsWindowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWindowed:");
}

id objc_msgSend_setIsoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsoCountryCode:");
}

id objc_msgSend_setItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItem:");
}

id objc_msgSend_setJoinCallActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinCallActivity:");
}

id objc_msgSend_setJoinConversationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinConversationRequest:");
}

id objc_msgSend_setJoinConversationRequestURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinConversationRequestURLString:");
}

id objc_msgSend_setJoined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoined:");
}

id objc_msgSend_setJoinedFromLetMeIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinedFromLetMeIn:");
}

id objc_msgSend_setJoinedFromLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinedFromLink:");
}

id objc_msgSend_setJoinedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinedMetadata:");
}

id objc_msgSend_setJoiningConversationWithLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoiningConversationWithLink:");
}

id objc_msgSend_setJunkConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJunkConfidence:");
}

id objc_msgSend_setJunkIdentificationCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJunkIdentificationCategory:");
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeywords:");
}

id objc_msgSend_setKickMemberRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKickMemberRetryCount:");
}

id objc_msgSend_setKickedMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKickedMembers:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLastRebroadcastTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRebroadcastTime:");
}

id objc_msgSend_setLeaveReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeaveReason:");
}

id objc_msgSend_setLegacyCapability_enabled_capabilityInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLegacyCapability:enabled:capabilityInformation:");
}

id objc_msgSend_setLetMeIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLetMeIn:");
}

id objc_msgSend_setLetMeInDelegationHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLetMeInDelegationHandle:");
}

id objc_msgSend_setLetMeInDelegationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLetMeInDelegationUUID:");
}

id objc_msgSend_setLetMeInKeyAgreement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLetMeInKeyAgreement:");
}

id objc_msgSend_setLetMeInRequestState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLetMeInRequestState:");
}

id objc_msgSend_setLetMeInRequestUINotificationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLetMeInRequestUINotificationBlock:");
}

id objc_msgSend_setLifetimePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLifetimePolicy:");
}

id objc_msgSend_setLightweight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightweight:");
}

id objc_msgSend_setLightweightMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightweightMembers:");
}

id objc_msgSend_setLightweightPrimary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightweightPrimary:");
}

id objc_msgSend_setLightweightPrimaryParticipantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightweightPrimaryParticipantID:");
}

id objc_msgSend_setLightweightPrimaryParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightweightPrimaryParticipantIdentifier:");
}

id objc_msgSend_setLightweightRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightweightRetryCount:");
}

id objc_msgSend_setLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLink:");
}

id objc_msgSend_setLinkLifetimeScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkLifetimeScope:");
}

id objc_msgSend_setLinkName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkName:");
}

id objc_msgSend_setLinkName_forConversationLink_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkName:forConversationLink:completionHandler:");
}

id objc_msgSend_setLinkName_forLink_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkName:forLink:completionHandler:");
}

id objc_msgSend_setLinkedUserURIs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkedUserURIs:");
}

id objc_msgSend_setListeningIdentifiersByActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeningIdentifiersByActivityType:");
}

id objc_msgSend_setLocalAccountHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalAccountHandle:");
}

id objc_msgSend_setLocalCaptionToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalCaptionToken:");
}

id objc_msgSend_setLocalClientActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalClientActive:");
}

id objc_msgSend_setLocalDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceID:");
}

id objc_msgSend_setLocalInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalInviteDictionary:");
}

id objc_msgSend_setLocalLandscapeAspectRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalLandscapeAspectRatio:");
}

id objc_msgSend_setLocalLightweightSecondaryMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalLightweightSecondaryMember:");
}

id objc_msgSend_setLocalMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalMember:");
}

id objc_msgSend_setLocalMemberHandleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalMemberHandleValue:");
}

id objc_msgSend_setLocalParticipantAssociation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantAssociation:");
}

id objc_msgSend_setLocalParticipantAudioVideoMode_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantAudioVideoMode:forConversationUUID:");
}

id objc_msgSend_setLocalParticipantAudioVideoMode_presentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantAudioVideoMode:presentationMode:");
}

id objc_msgSend_setLocalParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantIdentifier:");
}

id objc_msgSend_setLocalParticipantType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantType:");
}

id objc_msgSend_setLocalParticipantType_memberDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantType:memberDestinations:");
}

id objc_msgSend_setLocalParticipantUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantUUID:");
}

id objc_msgSend_setLocalPortraitAspectRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalPortraitAspectRatio:");
}

id objc_msgSend_setLocalPortraitAspectRatio_localLandscapeAspectRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalPortraitAspectRatio:localLandscapeAspectRatio:");
}

id objc_msgSend_setLocalSenderIdentityAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityAccountUUID:");
}

id objc_msgSend_setLocalSenderIdentityAccountUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityAccountUUIDString:");
}

id objc_msgSend_setLocalSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityUUID:");
}

id objc_msgSend_setLocalSenderIdentityUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityUUIDString:");
}

id objc_msgSend_setLocalSenderSubscriptionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderSubscriptionIdentifier:");
}

id objc_msgSend_setLocalThumperAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalThumperAccounts:");
}

id objc_msgSend_setLocalThumperDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalThumperDeviceID:");
}

id objc_msgSend_setLocalUserInHomeCountry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalUserInHomeCountry:");
}

id objc_msgSend_setLocalizedHandoffRecipientDeviceCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedHandoffRecipientDeviceCategory:");
}

id objc_msgSend_setLocalizedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedName:");
}

id objc_msgSend_setLocalizedServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedServiceName:");
}

id objc_msgSend_setLocalizedShortName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedShortName:");
}

id objc_msgSend_setLocallyConnected(void *a1, const char *a2, ...)
{
  return _[a1 setLocallyConnected];
}

id objc_msgSend_setLocallyConnecting(void *a1, const char *a2, ...)
{
  return _[a1 setLocallyConnecting];
}

id objc_msgSend_setLocallyCreated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocallyCreated:");
}

id objc_msgSend_setLocallyDisconnectedWithReasonIfNone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocallyDisconnectedWithReasonIfNone:");
}

id objc_msgSend_setLocallyDisconnectedWithReasonIfNone_stopConference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocallyDisconnectedWithReasonIfNone:stopConference:");
}

id objc_msgSend_setLocallyHasSentInvitation(void *a1, const char *a2, ...)
{
  return _[a1 setLocallyHasSentInvitation];
}

id objc_msgSend_setLocallyHasStartedOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 setLocallyHasStartedOutgoing];
}

id objc_msgSend_setLocallyInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocallyInitiated:");
}

id objc_msgSend_setLocallyPersistedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocallyPersistedMetadata:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMachServiceName:");
}

id objc_msgSend_setManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManager:");
}

id objc_msgSend_setMapName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapName:");
}

id objc_msgSend_setMaxVideoDecodesAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxVideoDecodesAllowed:");
}

id objc_msgSend_setMaximumCallGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumCallGroups:");
}

id objc_msgSend_setMaximumCallsPerCallGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumCallsPerCallGroup:");
}

id objc_msgSend_setMayRequireBreakBeforeMake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMayRequireBreakBeforeMake:");
}

id objc_msgSend_setMediaBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaBlob:");
}

id objc_msgSend_setMediaPlaybackOnExternalDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaPlaybackOnExternalDevice:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMemberIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemberIdentifiers:");
}

id objc_msgSend_setMergeable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMergeable:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMessageSendTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageSendTime:");
}

id objc_msgSend_setMessagesGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessagesGroupName:");
}

id objc_msgSend_setMessagesGroupName_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessagesGroupName:onConversationWithUUID:");
}

id objc_msgSend_setMessagesGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessagesGroupUUID:");
}

id objc_msgSend_setMessagesGroupUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessagesGroupUUIDString:");
}

id objc_msgSend_setMessenger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessenger:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMicrophoneMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicrophoneMuted:");
}

id objc_msgSend_setMiddleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMiddleName:");
}

id objc_msgSend_setMixesVoiceWithMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMixesVoiceWithMedia:");
}

id objc_msgSend_setMobileKeyLockState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMobileKeyLockState:");
}

id objc_msgSend_setMockBlockedByExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockBlockedByExtension:");
}

id objc_msgSend_setMockCallDirectoryIdentityExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockCallDirectoryIdentityExtension:");
}

id objc_msgSend_setMockCallStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockCallStatus:");
}

id objc_msgSend_setMockCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockCallUUID:");
}

id objc_msgSend_setMockCallerNameFromNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockCallerNameFromNetwork:");
}

id objc_msgSend_setMockContactIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockContactIdentifiers:");
}

id objc_msgSend_setMockConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockConversation:");
}

id objc_msgSend_setMockDateConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockDateConnected:");
}

id objc_msgSend_setMockEndpointOnCurrentDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockEndpointOnCurrentDevice:");
}

id objc_msgSend_setMockFailureExpected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockFailureExpected:");
}

id objc_msgSend_setMockFilteredOutReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockFilteredOutReason:");
}

id objc_msgSend_setMockHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockHandle:");
}

id objc_msgSend_setMockHasBeenRedirected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockHasBeenRedirected:");
}

id objc_msgSend_setMockHostedOnCurrentDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockHostedOnCurrentDevice:");
}

id objc_msgSend_setMockIsThirdPartyVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockIsThirdPartyVideo:");
}

id objc_msgSend_setMockNeedsManualInCallSounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockNeedsManualInCallSounds:");
}

id objc_msgSend_setMockPrefersExclusiveAccessToCellularNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockPrefersExclusiveAccessToCellularNetwork:");
}

id objc_msgSend_setMockProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockProvider:");
}

id objc_msgSend_setMockScreenShareAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockScreenShareAttributes:");
}

id objc_msgSend_setMockScreening_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockScreening:");
}

id objc_msgSend_setMockScreeningAnnouncementHasFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockScreeningAnnouncementHasFinished:");
}

id objc_msgSend_setMockSharingScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockSharingScreen:");
}

id objc_msgSend_setMockShouldSuppressRingtone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockShouldSuppressRingtone:");
}

id objc_msgSend_setMockSupportsEmergencyFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockSupportsEmergencyFallback:");
}

id objc_msgSend_setMockSupportsTTYWithVoice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockSupportsTTYWithVoice:");
}

id objc_msgSend_setMockTTYType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockTTYType:");
}

id objc_msgSend_setMockUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockUniqueProxyIdentifier:");
}

id objc_msgSend_setMockUsingBaseband_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockUsingBaseband:");
}

id objc_msgSend_setMockVideoStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockVideoStreamToken:");
}

id objc_msgSend_setMockVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockVoicemail:");
}

id objc_msgSend_setMockWasScreened_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockWasScreened:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setModelIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelIdentifier:");
}

id objc_msgSend_setMomentsAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMomentsAvailable:");
}

id objc_msgSend_setMostRecentBestAppSuggestion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMostRecentBestAppSuggestion:");
}

id objc_msgSend_setMostRecentCompletedOneToOneEnabledValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMostRecentCompletedOneToOneEnabledValue:");
}

id objc_msgSend_setMostRecentScreenShareAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMostRecentScreenShareAttributes:");
}

id objc_msgSend_setMute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMute:");
}

id objc_msgSend_setMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuted:");
}

id objc_msgSend_setMuted_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuted:forIdentifier:");
}

id objc_msgSend_setMutuallyExclusiveCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMutuallyExclusiveCall:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNamePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNamePrefix:");
}

id objc_msgSend_setNameSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameSuffix:");
}

id objc_msgSend_setNeedsManualInCallSounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsManualInCallSounds:");
}

id objc_msgSend_setNeedsSave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsSave:");
}

id objc_msgSend_setNickname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNickname:");
}

id objc_msgSend_setNoConversationParticipantTimeoutBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoConversationParticipantTimeoutBlock:");
}

id objc_msgSend_setNotificationStyles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationStyles:");
}

id objc_msgSend_setNotificationStylesByHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationStylesByHandleType:");
}

id objc_msgSend_setOBSOLETEConferenceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOBSOLETEConferenceIdentifier:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnHold:");
}

id objc_msgSend_setOneToOneAuthenticationTagEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOneToOneAuthenticationTagEnabled:");
}

id objc_msgSend_setOneToOneHandoffOngoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOneToOneHandoffOngoing:");
}

id objc_msgSend_setOneToOneModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOneToOneModeEnabled:");
}

id objc_msgSend_setOneToOneModeEnabled_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOneToOneModeEnabled:withCompletionBlock:");
}

id objc_msgSend_setOngoingDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOngoingDescription:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOriginType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginType:");
}

id objc_msgSend_setOriginalPauseDigitsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalPauseDigitsString:");
}

id objc_msgSend_setOriginalResolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalResolution:");
}

id objc_msgSend_setOriginalRingtoneSoundURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRingtoneSoundURL:");
}

id objc_msgSend_setOriginalRingtoneSoundURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRingtoneSoundURLString:");
}

id objc_msgSend_setOriginatingDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatingDeviceType:");
}

id objc_msgSend_setOriginatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatingUIType:");
}

id objc_msgSend_setOriginator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginator:");
}

id objc_msgSend_setOriginatorHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatorHandle:");
}

id objc_msgSend_setOtherInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherInvitedHandles:");
}

id objc_msgSend_setOtherInvitedTUHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherInvitedTUHandles:");
}

id objc_msgSend_setOtherUniqueProxyIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherUniqueProxyIdentifiers:");
}

id objc_msgSend_setOutgoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoing:");
}

id objc_msgSend_setOutgoingLocalParticipantUUID_forRecentCallsMatchingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingLocalParticipantUUID:forRecentCallsMatchingPredicate:");
}

id objc_msgSend_setOutgoingPinRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingPinRequestIdentifier:");
}

id objc_msgSend_setOutgoingRelayCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingRelayCallerID:");
}

id objc_msgSend_setOutputAudioPowerSpectrumToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputAudioPowerSpectrumToken:");
}

id objc_msgSend_setOutputFrequencyMeteringEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputFrequencyMeteringEnabled:");
}

id objc_msgSend_setPaddingForHashedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaddingForHashedValue:");
}

id objc_msgSend_setPairedHostDeviceState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairedHostDeviceState:");
}

id objc_msgSend_setParticipantAssociation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantAssociation:");
}

id objc_msgSend_setParticipantAudioVideoMode_presentationMode_forParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantAudioVideoMode:presentationMode:forParticipant:");
}

id objc_msgSend_setParticipantDestinationIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantDestinationIDs:");
}

id objc_msgSend_setParticipantGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantGroupUUID:");
}

id objc_msgSend_setParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantHandles:");
}

id objc_msgSend_setParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantIdentifier:");
}

id objc_msgSend_setParticipantRefreshBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantRefreshBlock:");
}

id objc_msgSend_setParticipantType_forParticipant_members_isLocalParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantType:forParticipant:members:isLocalParticipant:");
}

id objc_msgSend_setParticipantType_forRemoteMemberDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantType:forRemoteMemberDestinations:");
}

id objc_msgSend_setPauseAudio_callID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseAudio:callID:error:");
}

id objc_msgSend_setPauseVideo_callID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseVideo:callID:error:");
}

id objc_msgSend_setPauseVideoToStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseVideoToStart:");
}

id objc_msgSend_setPeerReportingIdentifier_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerReportingIdentifier:sessionIdentifier:");
}

id objc_msgSend_setPeerReportingIdentifier_sessionIdentifier_forCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerReportingIdentifier:sessionIdentifier:forCallID:");
}

id objc_msgSend_setPendingCodesToDevicesForApproval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingCodesToDevicesForApproval:");
}

id objc_msgSend_setPendingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingConversation:");
}

id objc_msgSend_setPendingConversationCleanupTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingConversationCleanupTimer:");
}

id objc_msgSend_setPendingConversationParticipantsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingConversationParticipantsByIdentifier:");
}

id objc_msgSend_setPendingKickedMembersByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingKickedMembersByIdentifier:");
}

id objc_msgSend_setPendingMemberHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingMemberHandles:");
}

id objc_msgSend_setPendingMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingMembers:");
}

id objc_msgSend_setPendingRemoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingRemoteMembers:");
}

id objc_msgSend_setPersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonNameComponents:");
}

id objc_msgSend_setPersonaAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaAvailable:");
}

id objc_msgSend_setPersonaHandshakeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaHandshakeData:");
}

id objc_msgSend_setPhoneticRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneticRepresentation:");
}

id objc_msgSend_setPhotoRequestFailureCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoRequestFailureCount:");
}

id objc_msgSend_setPhotoRequestSuccessCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoRequestSuccessCount:");
}

id objc_msgSend_setPhotosSharePlayAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotosSharePlayAvailable:");
}

id objc_msgSend_setPickedRouteDidChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPickedRouteDidChangeHandler:");
}

id objc_msgSend_setPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferences:");
}

id objc_msgSend_setPreferredBroadcastingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredBroadcastingAttributes:");
}

id objc_msgSend_setPreferredSceneSessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredSceneSessionRole:");
}

id objc_msgSend_setPrefersToPlayDuringWombat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersToPlayDuringWombat:");
}

id objc_msgSend_setPreparedToStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreparedToStop:");
}

id objc_msgSend_setPresentationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationInfo:");
}

id objc_msgSend_setPresentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationMode:");
}

id objc_msgSend_setPresentationRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationRect:");
}

id objc_msgSend_setPresentationRect_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationRect:forConversationWithUUID:");
}

id objc_msgSend_setPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationState:");
}

id objc_msgSend_setPresentationState_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationState:forConversationWithUUID:");
}

id objc_msgSend_setPrimary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimary:");
}

id objc_msgSend_setPrimaryAvcIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryAvcIdentifier:");
}

id objc_msgSend_setPrimaryHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryHandle:");
}

id objc_msgSend_setPrimaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryIdentifier:");
}

id objc_msgSend_setPrioritizedSenderIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrioritizedSenderIdentities:");
}

id objc_msgSend_setPrioritizedTUSenderIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrioritizedTUSenderIdentities:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPrivateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivateKey:");
}

id objc_msgSend_setProcessHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessHandle:");
}

id objc_msgSend_setProcessStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessStateChanged:");
}

id objc_msgSend_setProminenceEntrys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProminenceEntrys:");
}

id objc_msgSend_setProminenceIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProminenceIndex:");
}

id objc_msgSend_setProtoCallCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoCallCapabilitiesState:");
}

id objc_msgSend_setProtoCallModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoCallModel:");
}

id objc_msgSend_setProtoCallModelState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoCallModelState:");
}

id objc_msgSend_setProtoDTMFKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoDTMFKey:");
}

id objc_msgSend_setProtoDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoDisplayContext:");
}

id objc_msgSend_setProtoPersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoPersonNameComponents:");
}

id objc_msgSend_setProtoProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoProvider:");
}

id objc_msgSend_setProtoUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoUUID:");
}

id objc_msgSend_setProtoUpgradeSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoUpgradeSessionUUID:");
}

id objc_msgSend_setProtoVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoVideo:");
}

id objc_msgSend_setProtoWantsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtoWantsVideo:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setProviderCallDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderCallDelegate:");
}

id objc_msgSend_setProviderEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderEndedReason:");
}

id objc_msgSend_setProviderErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderErrorCode:");
}

id objc_msgSend_setProviderFailureReasonIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderFailureReasonIfNecessary:");
}

id objc_msgSend_setProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderIdentifier:");
}

id objc_msgSend_setProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviders:");
}

id objc_msgSend_setProvidersByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvidersByIdentifier:");
}

id objc_msgSend_setPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPseudonym:");
}

id objc_msgSend_setPseudonymExpirationDateEpochTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPseudonymExpirationDateEpochTime:");
}

id objc_msgSend_setPseudonymFeatureID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPseudonymFeatureID:");
}

id objc_msgSend_setPublicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublicKey:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setQueueItemType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueItemType:");
}

id objc_msgSend_setRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRead:");
}

id objc_msgSend_setRebroadcastTimeThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRebroadcastTimeThreshold:");
}

id objc_msgSend_setReceivedInvitationAccept_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedInvitationAccept:");
}

id objc_msgSend_setReceivedSuccessfulDidStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedSuccessfulDidStart:");
}

id objc_msgSend_setReceiverProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiverProtocolVersion:");
}

id objc_msgSend_setRecoverMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecoverMessage:");
}

id objc_msgSend_setRegisteredLocalProvidersByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredLocalProvidersByIdentifier:");
}

id objc_msgSend_setRegisteredPairedHostDeviceProvidersByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredPairedHostDeviceProvidersByIdentifier:");
}

id objc_msgSend_setRejectedMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRejectedMembers:");
}

id objc_msgSend_setRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelay:");
}

id objc_msgSend_setRelayCallDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCallDataSource:");
}

id objc_msgSend_setRelayCallingAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCallingAvailability:");
}

id objc_msgSend_setRelayCallingDisabledForDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCallingDisabledForDeviceID:");
}

id objc_msgSend_setRelayCallingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCallingEnabled:");
}

id objc_msgSend_setRelayCallingEnabled_forDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCallingEnabled:forDeviceWithID:");
}

id objc_msgSend_setRelayCallingFeaturesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCallingFeaturesEnabled:");
}

id objc_msgSend_setRelayClientController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayClientController:");
}

id objc_msgSend_setRelayClientTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayClientTransport:");
}

id objc_msgSend_setRelayCommonController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayCommonController:");
}

id objc_msgSend_setRelayDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayDelegate:");
}

id objc_msgSend_setRelayHostController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayHostController:");
}

id objc_msgSend_setRelayMessagingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayMessagingController:");
}

id objc_msgSend_setRelayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelayed:");
}

id objc_msgSend_setRelaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelaying:");
}

id objc_msgSend_setRelaying_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelaying:forConversationWithUUID:");
}

id objc_msgSend_setRemoteDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteDestination:");
}

id objc_msgSend_setRemoteDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteDevice:");
}

id objc_msgSend_setRemoteDoesHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteDoesHandoff:");
}

id objc_msgSend_setRemoteFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteFromID:");
}

id objc_msgSend_setRemoteHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteHandle:");
}

id objc_msgSend_setRemoteIDSDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteIDSDestination:");
}

id objc_msgSend_setRemoteIDSDestinationURI_crossDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteIDSDestinationURI:crossDeviceIdentifier:");
}

id objc_msgSend_setRemoteIDSDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteIDSDestinations:");
}

id objc_msgSend_setRemoteInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteInviteDictionary:");
}

id objc_msgSend_setRemoteMemberHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteMemberHandles:");
}

id objc_msgSend_setRemoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteMembers:");
}

id objc_msgSend_setRemoteMomentsAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteMomentsAvailable:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteParticipantCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteParticipantCount:");
}

id objc_msgSend_setRemoteParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteParticipantHandles:");
}

id objc_msgSend_setRemoteParticipantTUHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteParticipantTUHandles:");
}

id objc_msgSend_setRemoteParticipantType_participant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteParticipantType:participant:");
}

id objc_msgSend_setRemoteParticipantsDownlinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteParticipantsDownlinkMuted:");
}

id objc_msgSend_setRemoteProtocolVersionNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteProtocolVersionNumber:");
}

id objc_msgSend_setRemotePushTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemotePushTokens:");
}

id objc_msgSend_setRemoteUplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteUplinkMuted:");
}

id objc_msgSend_setRemoteVideoPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteVideoPaused:");
}

id objc_msgSend_setRemoteVideoPresentationSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteVideoPresentationSize:");
}

id objc_msgSend_setRemoteVideoPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteVideoPresentationState:");
}

id objc_msgSend_setReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReport:");
}

id objc_msgSend_setReportData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportData:");
}

id objc_msgSend_setReportingHierarchySubToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportingHierarchySubToken:");
}

id objc_msgSend_setReportingHierarchyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportingHierarchyToken:");
}

id objc_msgSend_setRepresentedApplicationBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepresentedApplicationBundle:");
}

id objc_msgSend_setRepresentsTransitionFromPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepresentsTransitionFromPending:");
}

id objc_msgSend_setRequestActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestActionType:");
}

id objc_msgSend_setRequestBlobRecoveryOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestBlobRecoveryOptions:");
}

id objc_msgSend_setRequiredCapabilities_requiredLackOfCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiredCapabilities:requiredLackOfCapabilities:");
}

id objc_msgSend_setRequiredConnectionCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiredConnectionCapability:");
}

id objc_msgSend_setRequiresAuthentication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresAuthentication:");
}

id objc_msgSend_setRequiresInCallSounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresInCallSounds:");
}

id objc_msgSend_setRequiresInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresInviteDictionary:");
}

id objc_msgSend_setRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetry:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setRingtoneSoundURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRingtoneSoundURL:");
}

id objc_msgSend_setRingtoneSoundURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRingtoneSoundURLString:");
}

id objc_msgSend_setRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoute:");
}

id objc_msgSend_setRouteWasPickedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteWasPickedHandler:");
}

id objc_msgSend_setRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoutes:");
}

id objc_msgSend_setRoutesDidChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoutesDidChangeHandler:");
}

id objc_msgSend_setSKEBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSKEBlob:");
}

id objc_msgSend_setSOS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSOS:");
}

id objc_msgSend_setSandboxExtensionHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSandboxExtensionHandle:");
}

id objc_msgSend_setScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScaleFactor:");
}

id objc_msgSend_setSceneAssociationBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSceneAssociationBehavior:");
}

id objc_msgSend_setScreenCaptureDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenCaptureDisplayID:");
}

id objc_msgSend_setScreenEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenEnabled:");
}

id objc_msgSend_setScreenEnabled_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenEnabled:attributes:");
}

id objc_msgSend_setScreenEnabled_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenEnabled:forConversationWithUUID:");
}

id objc_msgSend_setScreenEnabled_forParticipantWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenEnabled:forParticipantWithIdentifier:");
}

id objc_msgSend_setScreenEnabled_screenShareAttributes_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenEnabled:screenShareAttributes:forConversationWithUUID:");
}

id objc_msgSend_setScreenShareAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShareAttributes:");
}

id objc_msgSend_setScreenShareAttributes_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShareAttributes:forConversationWithUUID:");
}

id objc_msgSend_setScreenShareContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShareContext:");
}

id objc_msgSend_setScreenShareRequestType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShareRequestType:");
}

id objc_msgSend_setScreenShareUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShareUUID:");
}

id objc_msgSend_setScreenSharingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingAvailable:");
}

id objc_msgSend_setScreenSharingIntention_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingIntention:");
}

id objc_msgSend_setScreenSharingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingRequest:");
}

id objc_msgSend_setScreenSharingRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingRequests:");
}

id objc_msgSend_setScreenSharingRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 setScreenSharingRetryCount];
}

id objc_msgSend_setScreenSharingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingType:");
}

id objc_msgSend_setScreenToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenToken:");
}

id objc_msgSend_setScreening_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreening:");
}

id objc_msgSend_setScreening_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreening:forConversationWithUUID:");
}

id objc_msgSend_setSecondaryThumperAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryThumperAccounts:");
}

id objc_msgSend_setSelectiveScreenUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectiveScreenUUID:");
}

id objc_msgSend_setSendToVoicemailAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendToVoicemailAllowed:");
}

id objc_msgSend_setSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSender:");
}

id objc_msgSend_setSenderIDSIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderIDSIdentifier:");
}

id objc_msgSend_setSenderIdentityCapabilitiesStateByUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderIdentityCapabilitiesStateByUUID:");
}

id objc_msgSend_setSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderIdentityUUID:");
}

id objc_msgSend_setSendingAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingAudio:");
}

id objc_msgSend_setSendingAudio_callID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingAudio:callID:error:");
}

id objc_msgSend_setSendingAudio_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingAudio:forIdentifier:");
}

id objc_msgSend_setSendingAudioData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingAudioData:");
}

id objc_msgSend_setSendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingVideo:");
}

id objc_msgSend_setSendingVideoExpected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingVideoExpected:");
}

id objc_msgSend_setServerProvidedLightweightParticipantIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerProvidedLightweightParticipantIdentifiers:");
}

id objc_msgSend_setServerProvidedParticipantIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerProvidedParticipantIdentifiers:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceName:");
}

id objc_msgSend_setServiceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceProvider:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionEventType:");
}

id objc_msgSend_setSessionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionMode:");
}

id objc_msgSend_setSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionUUID:");
}

id objc_msgSend_setSetScreenSharingRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetScreenSharingRetryCount:");
}

id objc_msgSend_setSharePlayHandedOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharePlayHandedOff:");
}

id objc_msgSend_setSharePlayHandedOff_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharePlayHandedOff:onConversationWithUUID:");
}

id objc_msgSend_setSharePlayProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharePlayProtocolVersion:");
}

id objc_msgSend_setSharingModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingModeEnabled:");
}

id objc_msgSend_setSharingScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingScreen:");
}

id objc_msgSend_setSharingScreen_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingScreen:attributes:");
}

id objc_msgSend_setShouldAcceptDateConnectedProviderUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAcceptDateConnectedProviderUpdates:");
}

id objc_msgSend_setShouldAssociateScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAssociateScene:");
}

id objc_msgSend_setShouldMoveFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldMoveFile:");
}

id objc_msgSend_setShouldSendLegacyScreenSharingInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSendLegacyScreenSharingInvite:");
}

id objc_msgSend_setShouldStartAudioPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldStartAudioPaused:");
}

id objc_msgSend_setShouldStartVideoPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldStartVideoPaused:");
}

id objc_msgSend_setShouldSuppressInCallUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressInCallUI:");
}

id objc_msgSend_setShouldSuppressRingtone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressRingtone:");
}

id objc_msgSend_setSignalHandlerDispatchSources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalHandlerDispatchSources:");
}

id objc_msgSend_setSilencingUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSilencingUserInfo:");
}

id objc_msgSend_setSiriDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriDisplayName:");
}

id objc_msgSend_setSoundRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoundRegion:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setSpatialPersonaEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpatialPersonaEnabled:");
}

id objc_msgSend_setSpatialPersonaGenerationCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpatialPersonaGenerationCounter:");
}

id objc_msgSend_setSplitSessionSecondary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSplitSessionSecondary:");
}

id objc_msgSend_setSplitSessionUserProfileState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSplitSessionUserProfileState:");
}

id objc_msgSend_setStagedActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStagedActivitySession:");
}

id objc_msgSend_setStagedActivitySessionForActivitySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStagedActivitySessionForActivitySession:");
}

id objc_msgSend_setStartAsHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartAsHandoff:");
}

id objc_msgSend_setStartAsOneToOneMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartAsOneToOneMode:");
}

id objc_msgSend_setStartCallBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartCallBlock:");
}

id objc_msgSend_setStartWhenStaged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartWhenStaged:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStreamPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamPreferences:");
}

id objc_msgSend_setStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamToken:");
}

id objc_msgSend_setStreamTokensByParticipantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamTokensByParticipantID:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubscription_capability_enabled_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscription:capability:enabled:info:");
}

id objc_msgSend_setSubscriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptions:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSuggestedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedName:");
}

id objc_msgSend_setSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupported:");
}

id objc_msgSend_setSupportedHandleTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedHandleTypes:");
}

id objc_msgSend_setSupportedMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedMediaTypes:");
}

id objc_msgSend_setSupportsActivityPreviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsActivityPreviews:");
}

id objc_msgSend_setSupportsAddCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsAddCall:");
}

id objc_msgSend_setSupportsAudioAndVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsAudioAndVideo:");
}

id objc_msgSend_setSupportsAudioOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsAudioOnly:");
}

id objc_msgSend_setSupportsBasebandCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsBasebandCalling:");
}

id objc_msgSend_setSupportsCellularData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsCellularData:");
}

id objc_msgSend_setSupportsClientAssertions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsClientAssertions:");
}

id objc_msgSend_setSupportsContinuationOnTV_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsContinuationOnTV:");
}

id objc_msgSend_setSupportsCurrentPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsCurrentPlatform:");
}

id objc_msgSend_setSupportsDTMF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDTMF:");
}

id objc_msgSend_setSupportsDTMFUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDTMFUpdates:");
}

id objc_msgSend_setSupportsDefaultPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDefaultPairedDevice:");
}

id objc_msgSend_setSupportsDisplayingFaceTimeAudioCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDisplayingFaceTimeAudioCalls:");
}

id objc_msgSend_setSupportsDisplayingFaceTimeVideoCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDisplayingFaceTimeVideoCalls:");
}

id objc_msgSend_setSupportsDisplayingTelephonyCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDisplayingTelephonyCalls:");
}

id objc_msgSend_setSupportsDynamicSystemUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDynamicSystemUI:");
}

id objc_msgSend_setSupportsEmergency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsEmergency:");
}

id objc_msgSend_setSupportsEmergencyFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsEmergencyFallback:");
}

id objc_msgSend_setSupportsFaceTimeAudioRelayCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsFaceTimeAudioRelayCalling:");
}

id objc_msgSend_setSupportsFaceTimeVideoRelayCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsFaceTimeVideoRelayCalling:");
}

id objc_msgSend_setSupportsGrouping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsGrouping:");
}

id objc_msgSend_setSupportsHolding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsHolding:");
}

id objc_msgSend_setSupportsLeaveContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsLeaveContext:");
}

id objc_msgSend_setSupportsMessagesGroupProviding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsMessagesGroupProviding:");
}

id objc_msgSend_setSupportsPrimaryCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsPrimaryCalling:");
}

id objc_msgSend_setSupportsRecents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRecents:");
}

id objc_msgSend_setSupportsRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRelay:");
}

id objc_msgSend_setSupportsRelayCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRelayCalling:");
}

id objc_msgSend_setSupportsRequestToScreenShare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRequestToScreenShare:");
}

id objc_msgSend_setSupportsRestrictingSecondaryCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRestrictingSecondaryCalling:");
}

id objc_msgSend_setSupportsRinging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRinging:");
}

id objc_msgSend_setSupportsScreening_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsScreening:");
}

id objc_msgSend_setSupportsSendingToVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsSendingToVoicemail:");
}

id objc_msgSend_setSupportsSimultaneousVoiceAndData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsSimultaneousVoiceAndData:");
}

id objc_msgSend_setSupportsTTYWithVoice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsTTYWithVoice:");
}

id objc_msgSend_setSupportsTelephonyRelayCalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsTelephonyRelayCalling:");
}

id objc_msgSend_setSupportsUnambiguousMultiPartyState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsUnambiguousMultiPartyState:");
}

id objc_msgSend_setSupportsUngrouping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsUngrouping:");
}

id objc_msgSend_setSupportsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsVideo:");
}

id objc_msgSend_setSupportsVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsVoicemail:");
}

id objc_msgSend_setSwappable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwappable:");
}

id objc_msgSend_setSynchronous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynchronous:");
}

id objc_msgSend_setSynchronousServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynchronousServer:");
}

id objc_msgSend_setSystemActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemActivity:");
}

id objc_msgSend_setSystemActivitySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemActivitySessions:");
}

id objc_msgSend_setSystemRootLayerTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemRootLayerTransform:");
}

id objc_msgSend_setSystemVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemVolume:");
}

id objc_msgSend_setTTYType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTTYType:");
}

id objc_msgSend_setTTYType_forCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTTYType:forCalls:");
}

id objc_msgSend_setTUInvitationPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTUInvitationPreferences:");
}

id objc_msgSend_setTURouteDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTURouteDeviceType:");
}

id objc_msgSend_setTakingCallsPrivateAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTakingCallsPrivateAllowed:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTargetContentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetContentIdentifier:");
}

id objc_msgSend_setTelephonySenderIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTelephonySenderIdentities:");
}

id objc_msgSend_setTemporaryRequireInCallSounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemporaryRequireInCallSounds:");
}

id objc_msgSend_setThumperCallingAllowed_onSecondaryDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumperCallingAllowed:onSecondaryDeviceWithID:");
}

id objc_msgSend_setThumperCallingAllowed_onSecondaryDeviceWithID_forSenderIdentityWithUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:");
}

id objc_msgSend_setThumperCallingAssociatedAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumperCallingAssociatedAccountID:");
}

id objc_msgSend_setThumperCallingCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumperCallingCapabilitiesState:");
}

id objc_msgSend_setThumperCallingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumperCallingEnabled:");
}

id objc_msgSend_setThumperCallingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumperCallingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend_setTimeToEstablish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeToEstablish:");
}

id objc_msgSend_setTimebase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimebase:");
}

id objc_msgSend_setTimedOutPickingRouteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimedOutPickingRouteHandler:");
}

id objc_msgSend_setTimeoutBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutBlock:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTimestampAsTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestampAsTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTokenPrefixedURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenPrefixedURI:");
}

id objc_msgSend_setTransitionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionStatus:");
}

id objc_msgSend_setTransmissionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransmissionMode:");
}

id objc_msgSend_setTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransport:");
}

id objc_msgSend_setTriggers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggers:");
}

id objc_msgSend_setTrustedFromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedFromHandle:");
}

id objc_msgSend_setTtyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTtyType:");
}

id objc_msgSend_setTuConversationMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTuConversationMembers:");
}

id objc_msgSend_setTuHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTuHandle:");
}

id objc_msgSend_setTuProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTuProvider:");
}

id objc_msgSend_setTuProvider_isVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTuProvider:isVideo:");
}

id objc_msgSend_setTuProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTuProviders:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUPlusNDowngradeAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPlusNDowngradeAvailable:");
}

id objc_msgSend_setUPlusOneAVLessAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPlusOneAVLessAvailable:");
}

id objc_msgSend_setUPlusOneScreenShareAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPlusOneScreenShareAvailable:");
}

id objc_msgSend_setUPlusOneVisionToVisionAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPlusOneVisionToVisionAvailable:");
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUUID:");
}

id objc_msgSend_setUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUUIDString:");
}

id objc_msgSend_setUiXPCEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUiXPCEndpoint:");
}

id objc_msgSend_setUnderlyingUplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingUplinkMuted:");
}

id objc_msgSend_setUnderlyingUplinkMuted_bottomUpMute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingUplinkMuted:bottomUpMute:");
}

id objc_msgSend_setUniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueID:");
}

id objc_msgSend_setUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueId:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueProxyIdentifier:");
}

id objc_msgSend_setUnreliableMessengerConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnreliableMessengerConfig:");
}

id objc_msgSend_setUnsafeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnsafeData:");
}

id objc_msgSend_setUpBreakBeforeMakeTimeout(void *a1, const char *a2, ...)
{
  return _[a1 setUpBreakBeforeMakeTimeout];
}

id objc_msgSend_setUpSession(void *a1, const char *a2, ...)
{
  return _[a1 setUpSession];
}

id objc_msgSend_setUpdateMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateMessage:");
}

id objc_msgSend_setUpdatedDateEpochTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedDateEpochTime:");
}

id objc_msgSend_setUpgrade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpgrade:");
}

id objc_msgSend_setUpgradeSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpgradeSessionUUID:");
}

id objc_msgSend_setUplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:");
}

id objc_msgSend_setUplinkMuted_forCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:forCalls:");
}

id objc_msgSend_setUplinkMuted_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:forConversationWithUUID:");
}

id objc_msgSend_setUplinkMuted_forPendingConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:forPendingConversationWithUUID:");
}

id objc_msgSend_setUplinkStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkStreamToken:");
}

id objc_msgSend_setUplinkWasExplicitlyMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkWasExplicitlyMuted:");
}

id objc_msgSend_setUsedEmergencyVideoStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsedEmergencyVideoStreaming:");
}

id objc_msgSend_setUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserActivity:");
}

id objc_msgSend_setUserConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserConfiguration:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUsesNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesNotificationCenter:");
}

id objc_msgSend_setUsingAirplay_forActivitySessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingAirplay:forActivitySessionUUID:");
}

id objc_msgSend_setUsingAirplay_forActivitySessionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingAirplay:forActivitySessionWithUUID:");
}

id objc_msgSend_setUsingAirplay_onActivitySession_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingAirplay:onActivitySession:onConversationWithUUID:");
}

id objc_msgSend_setUsingBaseband_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingBaseband:");
}

id objc_msgSend_setValidationSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidationSource:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setVerificationStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerificationStatus:");
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:");
}

id objc_msgSend_setVideo_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:forConversationWithUUID:");
}

id objc_msgSend_setVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEnabled:");
}

id objc_msgSend_setVideoEnabled_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEnabled:forConversationWithUUID:");
}

id objc_msgSend_setVideoEnabled_forPendingConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEnabled:forPendingConversationWithUUID:");
}

id objc_msgSend_setVideoPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoPaused:");
}

id objc_msgSend_setVideoPaused_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoPaused:forConversationWithUUID:");
}

id objc_msgSend_setVideoPositionalInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoPositionalInfo:");
}

id objc_msgSend_setVideoPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoPriority:");
}

id objc_msgSend_setVideoQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoQuality:");
}

id objc_msgSend_setVideoQuality_visibility_prominence_spatialPosition_isInCanvas_forParticipantWithIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "setVideoQuality:visibility:prominence:spatialPosition:isInCanvas:forParticipantWithIdentifier:");
}

id objc_msgSend_setVideoStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoStreamToken:");
}

id objc_msgSend_setVirtualParticipantConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVirtualParticipantConfig:");
}

id objc_msgSend_setVirtualParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVirtualParticipants:");
}

id objc_msgSend_setVisibilityContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibilityContext:");
}

id objc_msgSend_setVisibilityIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibilityIndex:");
}

id objc_msgSend_setVisionCallEstablishmentVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisionCallEstablishmentVersion:");
}

id objc_msgSend_setVisionFeatureVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisionFeatureVersion:");
}

id objc_msgSend_setVoLTECallingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoLTECallingAvailable:");
}

id objc_msgSend_setVoLTECallingCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoLTECallingCapabilitiesState:");
}

id objc_msgSend_setVoLTECallingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoLTECallingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend_setVoiceOverObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoiceOverObserver:");
}

id objc_msgSend_setVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoicemail:");
}

id objc_msgSend_setVoipApplicationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoipApplicationController:");
}

id objc_msgSend_setWaitingForRemoteJoin_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingForRemoteJoin:forConversationUUID:");
}

id objc_msgSend_setWaitingToJoin_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingToJoin:forConversationUUID:");
}

id objc_msgSend_setWaitingToPruneParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingToPruneParticipants:");
}

id objc_msgSend_setWantsCallDisconnectionOnInvalidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsCallDisconnectionOnInvalidation:");
}

id objc_msgSend_setWantsHoldMusic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsHoldMusic:");
}

id objc_msgSend_setWantsStagingArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsStagingArea:");
}

id objc_msgSend_setWasDialAssisted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasDialAssisted:");
}

id objc_msgSend_setWasEmergencyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasEmergencyCall:");
}

id objc_msgSend_setWasScreened_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasScreened:");
}

id objc_msgSend_setWiFiAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiAllowed:");
}

id objc_msgSend_setWiFiCallingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiCallingAvailable:");
}

id objc_msgSend_setWiFiCallingCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiCallingCapabilitiesState:");
}

id objc_msgSend_setWiFiCallingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiCallingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend_setWiFiCallingRoamingEnabled_forSenderIdentityWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:");
}

id objc_msgSend_setWiFiEmergencyCallingAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiEmergencyCallingAllowed:");
}

id objc_msgSend_setWiFiEmergencyCallingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiEmergencyCallingAvailable:");
}

id objc_msgSend_setWindowUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowUUID:");
}

id objc_msgSend_setWindowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowed:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setXpcListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcListener:");
}

id objc_msgSend_setupIMAVController(void *a1, const char *a2, ...)
{
  return _[a1 setupIMAVController];
}

id objc_msgSend_setupInputMuteHandlerWithFeatureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupInputMuteHandlerWithFeatureFlags:");
}

id objc_msgSend_setupNewAVCSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNewAVCSession:");
}

id objc_msgSend_setupPendingConversationCleanupTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupPendingConversationCleanupTimer];
}

id objc_msgSend_sharePlayCanEndWhenInitiatorLeaves(void *a1, const char *a2, ...)
{
  return _[a1 sharePlayCanEndWhenInitiatorLeaves];
}

id objc_msgSend_sharePlayInFaceTimeCanvasEnabled(void *a1, const char *a2, ...)
{
  return _[a1 sharePlayInFaceTimeCanvasEnabled];
}

id objc_msgSend_sharePlayProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 sharePlayProtocolVersion];
}

id objc_msgSend_sharePlaySupported(void *a1, const char *a2, ...)
{
  return _[a1 sharePlaySupported];
}

id objc_msgSend_sharePlaySystemStateObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharePlaySystemStateObserver];
}

id objc_msgSend_sharePlayWithAirplayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 sharePlayWithAirplayEnabled];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedAudioSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAudioSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstanceWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceWithQueue:");
}

id objc_msgSend_sharedInstanceWithQueue_server_shouldRegister_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceWithQueue:server:shouldRegister:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 sharedPhotoLibrary];
}

id objc_msgSend_sharedPrivacyManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrivacyManager];
}

id objc_msgSend_sharingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 sharingEnabled];
}

id objc_msgSend_shortLabel(void *a1, const char *a2, ...)
{
  return _[a1 shortLabel];
}

id objc_msgSend_shouldAcceptDateConnectedProviderUpdates(void *a1, const char *a2, ...)
{
  return _[a1 shouldAcceptDateConnectedProviderUpdates];
}

id objc_msgSend_shouldAcceptIncomingInvite(void *a1, const char *a2, ...)
{
  return _[a1 shouldAcceptIncomingInvite];
}

id objc_msgSend_shouldAcceptMembershipUpdateFromHandle_joinContext_participantUpdate_existingConversation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptMembershipUpdateFromHandle:joinContext:participantUpdate:existingConversation:");
}

id objc_msgSend_shouldAcceptMessageFromHandle_messageContext_message_existingConversation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptMessageFromHandle:messageContext:message:existingConversation:");
}

id objc_msgSend_shouldAdvertiseConversationHandoff(void *a1, const char *a2, ...)
{
  return _[a1 shouldAdvertiseConversationHandoff];
}

id objc_msgSend_shouldAllowIncomingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAllowIncomingCall:");
}

id objc_msgSend_shouldAssociateScene(void *a1, const char *a2, ...)
{
  return _[a1 shouldAssociateScene];
}

id objc_msgSend_shouldAutoLaunchAppForActivity_onConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutoLaunchAppForActivity:onConversation:");
}

id objc_msgSend_shouldAutomaticallyLeaveConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutomaticallyLeaveConversation:");
}

id objc_msgSend_shouldAutomaticallySendNameAndPhotoToHandles_callProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutomaticallySendNameAndPhotoToHandles:callProvider:");
}

id objc_msgSend_shouldAutomaticallySendNameAndPhotoToHandles_conversationProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutomaticallySendNameAndPhotoToHandles:conversationProvider:");
}

id objc_msgSend_shouldAutomaticallySendNameAndPhotoToHandles_isDefaultProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:");
}

id objc_msgSend_shouldBlockCallWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldBlockCallWithBundleIdentifier:");
}

id objc_msgSend_shouldCreatePendingChatForMessageType_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCreatePendingChatForMessageType:fromHandle:");
}

id objc_msgSend_shouldDeclineSecondSessionInviteWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDeclineSecondSessionInviteWithMessage:");
}

id objc_msgSend_shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled:");
}

id objc_msgSend_shouldDisableOneToOneModeForScreenShare(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisableOneToOneModeForScreenShare];
}

id objc_msgSend_shouldEnrollDefaultPairedDeviceForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEnrollDefaultPairedDeviceForAccountID:");
}

id objc_msgSend_shouldFilterCall(void *a1, const char *a2, ...)
{
  return _[a1 shouldFilterCall];
}

id objc_msgSend_shouldFilterClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldFilterClient:");
}

id objc_msgSend_shouldFilterIncomingCall_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldFilterIncomingCall:from:");
}

id objc_msgSend_shouldHandleCarPlayControlEvents(void *a1, const char *a2, ...)
{
  return _[a1 shouldHandleCarPlayControlEvents];
}

id objc_msgSend_shouldHandleMuteRequests(void *a1, const char *a2, ...)
{
  return _[a1 shouldHandleMuteRequests];
}

id objc_msgSend_shouldHandleProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleProvider:");
}

id objc_msgSend_shouldHandleSecureMicrophoneEvents(void *a1, const char *a2, ...)
{
  return _[a1 shouldHandleSecureMicrophoneEvents];
}

id objc_msgSend_shouldHandleUpdateForProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleUpdateForProvider:");
}

id objc_msgSend_shouldIgnoreBenignErrorOnStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreBenignErrorOnStart:");
}

id objc_msgSend_shouldIgnoreIDSMessage_fromID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreIDSMessage:fromID:context:");
}

id objc_msgSend_shouldIgnoreIDSResource_metadata_fromID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreIDSResource:metadata:fromID:context:");
}

id objc_msgSend_shouldIgnoreMessageForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreMessageForConversation:");
}

id objc_msgSend_shouldOverrideCallStatus(void *a1, const char *a2, ...)
{
  return _[a1 shouldOverrideCallStatus];
}

id objc_msgSend_shouldOverrideNetworkAsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 shouldOverrideNetworkAsAvailable];
}

id objc_msgSend_shouldPreferRelayOverDirectSecondaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 shouldPreferRelayOverDirectSecondaryCalling];
}

id objc_msgSend_shouldPreferRelayOverDirectSecondaryCallingForProvider_isVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPreferRelayOverDirectSecondaryCallingForProvider:isVideo:");
}

id objc_msgSend_shouldPreserveMomentsFile(void *a1, const char *a2, ...)
{
  return _[a1 shouldPreserveMomentsFile];
}

id objc_msgSend_shouldProcessRelayMessageOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldProcessRelayMessageOfType:");
}

id objc_msgSend_shouldRelayToOtherDevices(void *a1, const char *a2, ...)
{
  return _[a1 shouldRelayToOtherDevices];
}

id objc_msgSend_shouldRestrictAddresses_forBundleIdentifier_performSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:");
}

id objc_msgSend_shouldRingForIncomingCallEnabled(void *a1, const char *a2, ...)
{
  return _[a1 shouldRingForIncomingCallEnabled];
}

id objc_msgSend_shouldScreenTimeRestrictMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldScreenTimeRestrictMessage:");
}

id objc_msgSend_shouldSendCall_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSendCall:forClient:");
}

id objc_msgSend_shouldSendLegacyScreenSharingInvite(void *a1, const char *a2, ...)
{
  return _[a1 shouldSendLegacyScreenSharingInvite];
}

id objc_msgSend_shouldShowInvitationRingingUIForConversation_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowInvitationRingingUIForConversation:handle:");
}

id objc_msgSend_shouldShowInvitationRingingUIForConversation_handle_invitationMessagePreferences_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowInvitationRingingUIForConversation:handle:invitationMessagePreferences:");
}

id objc_msgSend_shouldStartAudioPaused(void *a1, const char *a2, ...)
{
  return _[a1 shouldStartAudioPaused];
}

id objc_msgSend_shouldStartRingingTimeoutForConversation_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldStartRingingTimeoutForConversation:handle:");
}

id objc_msgSend_shouldStartVideoPaused(void *a1, const char *a2, ...)
{
  return _[a1 shouldStartVideoPaused];
}

id objc_msgSend_shouldSuppressInCallUI(void *a1, const char *a2, ...)
{
  return _[a1 shouldSuppressInCallUI];
}

id objc_msgSend_shouldSuppressRingtone(void *a1, const char *a2, ...)
{
  return _[a1 shouldSuppressRingtone];
}

id objc_msgSend_shouldTraceSingposts(void *a1, const char *a2, ...)
{
  return _[a1 shouldTraceSingposts];
}

id objc_msgSend_shouldTrackCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldTrackCall:");
}

id objc_msgSend_shouldUnenrollDefaultPairedDeviceForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUnenrollDefaultPairedDeviceForAccountID:");
}

id objc_msgSend_shouldUpdateSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpdateSubscriptions];
}

id objc_msgSend_shouldUseIDSDemuxer(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseIDSDemuxer];
}

id objc_msgSend_shouldUseSocketForTransport(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseSocketForTransport];
}

id objc_msgSend_showEmergencyAddressDisclaimerOnSecondaryDevice(void *a1, const char *a2, ...)
{
  return _[a1 showEmergencyAddressDisclaimerOnSecondaryDevice];
}

id objc_msgSend_showReminderNotificationOnSecondaryDevice(void *a1, const char *a2, ...)
{
  return _[a1 showReminderNotificationOnSecondaryDevice];
}

id objc_msgSend_sign_as_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sign:as:completion:");
}

id objc_msgSend_signalHandlerDispatchSources(void *a1, const char *a2, ...)
{
  return _[a1 signalHandlerDispatchSources];
}

id objc_msgSend_silenceUnknownCallersEnabled(void *a1, const char *a2, ...)
{
  return _[a1 silenceUnknownCallersEnabled];
}

id objc_msgSend_silenceUnknownFaceTimeCallersEnabled(void *a1, const char *a2, ...)
{
  return _[a1 silenceUnknownFaceTimeCallersEnabled];
}

id objc_msgSend_silencingUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 silencingUserInfo];
}

id objc_msgSend_simulateCrashReportFromPID_withKillCode_usingReasonWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateCrashReportFromPID:withKillCode:usingReasonWithFormat:");
}

id objc_msgSend_simulateCrashReportWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateCrashReportWithFormat:");
}

id objc_msgSend_simulateCrashReportWithReason_pid_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateCrashReportWithReason:pid:code:");
}

id objc_msgSend_simulateInternationalCall(void *a1, const char *a2, ...)
{
  return _[a1 simulateInternationalCall];
}

id objc_msgSend_siriDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 siriDisplayName];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_socket(void *a1, const char *a2, ...)
{
  return _[a1 socket];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedProvidersForRemoteClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedProvidersForRemoteClients:");
}

id objc_msgSend_soundRegion(void *a1, const char *a2, ...)
{
  return _[a1 soundRegion];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sourceIdentifier];
}

id objc_msgSend_sourceIdentifierForRouteID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceIdentifierForRouteID:");
}

id objc_msgSend_spatialAudioSourceIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialAudioSourceIdentifierForIdentifier:");
}

id objc_msgSend_spatialPersonaGenerationCounter(void *a1, const char *a2, ...)
{
  return _[a1 spatialPersonaGenerationCounter];
}

id objc_msgSend_spatialPosition(void *a1, const char *a2, ...)
{
  return _[a1 spatialPosition];
}

id objc_msgSend_splitSessionSecondary(void *a1, const char *a2, ...)
{
  return _[a1 splitSessionSecondary];
}

id objc_msgSend_splitSessionUserProfileState(void *a1, const char *a2, ...)
{
  return _[a1 splitSessionUserProfileState];
}

id objc_msgSend_stableBundleIdentifierForLocalBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stableBundleIdentifierForLocalBundleIdentifier:");
}

id objc_msgSend_stagedActivitySession(void *a1, const char *a2, ...)
{
  return _[a1 stagedActivitySession];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAVCScreenCaptureWithAttributes_preferImmediateActivation_screenControlEnabled_capturesCursor_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "startAVCScreenCaptureWithAttributes:preferImmediateActivation:screenControlEnabled:capturesCursor:");
}

id objc_msgSend_startActivitySessionFor_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startActivitySessionFor:with:");
}

id objc_msgSend_startAddingHandoffParticipantToTime(void *a1, const char *a2, ...)
{
  return _[a1 startAddingHandoffParticipantToTime];
}

id objc_msgSend_startAudio(void *a1, const char *a2, ...)
{
  return _[a1 startAudio];
}

id objc_msgSend_startAudioForConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAudioForConversationWithUUID:");
}

id objc_msgSend_startAudioForConversationsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 startAudioForConversationsIfNecessary];
}

id objc_msgSend_startBagLoad(void *a1, const char *a2, ...)
{
  return _[a1 startBagLoad];
}

id objc_msgSend_startCallActionWithDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCallActionWithDialRequest:");
}

id objc_msgSend_startCallBlock(void *a1, const char *a2, ...)
{
  return _[a1 startCallBlock];
}

id objc_msgSend_startCapture(void *a1, const char *a2, ...)
{
  return _[a1 startCapture];
}

id objc_msgSend_startConferenceForAnsweredCallWithTransport_remoteInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConferenceForAnsweredCallWithTransport:remoteInviteDictionary:");
}

id objc_msgSend_startConferenceForDialedCallWithTransport_remoteInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConferenceForDialedCallWithTransport:remoteInviteDictionary:");
}

id objc_msgSend_startConferenceForIdentifier_usingTransport_remoteInviteDictionary_didStartHandler_didStopHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "startConferenceForIdentifier:usingTransport:remoteInviteDictionary:didStartHandler:didStopHandler:");
}

id objc_msgSend_startConferenceForPulledCallWithTransport_remoteInviteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConferenceForPulledCallWithTransport:remoteInviteDictionary:");
}

id objc_msgSend_startConnectionAsCaller_capabilities_socket_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConnectionAsCaller:capabilities:socket:error:");
}

id objc_msgSend_startConnectionAsCaller_remoteInviteDictionary_capabilities_destination_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConnectionAsCaller:remoteInviteDictionary:capabilities:destination:error:");
}

id objc_msgSend_startConnectionWithCallID_inviteData_isCaller_capabilities_destination_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConnectionWithCallID:inviteData:isCaller:capabilities:destination:error:");
}

id objc_msgSend_startConnectionWithCallID_usingInviteData_isCaller_relayResponseDict_didOriginateRelayRequest_capabilities_idsSocket_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "startConnectionWithCallID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:error:");
}

id objc_msgSend_startConnectionWithTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConnectionWithTransport:");
}

id objc_msgSend_startListeningForBestAppSuggestions(void *a1, const char *a2, ...)
{
  return _[a1 startListeningForBestAppSuggestions];
}

id objc_msgSend_startListeningOnMachServiceWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListeningOnMachServiceWithName:");
}

id objc_msgSend_startOutgoingOneToOneTimeoutIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOutgoingOneToOneTimeoutIfNecessary:");
}

id objc_msgSend_startSuppressRingtoneActivityBroadcastingForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSuppressRingtoneActivityBroadcastingForCall:");
}

id objc_msgSend_startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:");
}

id objc_msgSend_startTrackingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTrackingCall:");
}

id objc_msgSend_startTrackingClient_forProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTrackingClient:forProviderIdentifier:");
}

id objc_msgSend_startWhenStaged(void *a1, const char *a2, ...)
{
  return _[a1 startWhenStaged];
}

id objc_msgSend_startWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithError:");
}

id objc_msgSend_startWithVideoAspectRatioDescriptor_inviteCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithVideoAspectRatioDescriptor:inviteCompletion:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_staticIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 staticIdentifier];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopActivitySession(void *a1, const char *a2, ...)
{
  return _[a1 stopActivitySession];
}

id objc_msgSend_stopAdvertisingForRemovedConversationIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAdvertisingForRemovedConversationIfNecessary:");
}

id objc_msgSend_stopBroadcastingActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBroadcastingActivity:");
}

id objc_msgSend_stopCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopCallID:");
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return _[a1 stopCapture];
}

id objc_msgSend_stopConference(void *a1, const char *a2, ...)
{
  return _[a1 stopConference];
}

id objc_msgSend_stopConferenceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopConferenceForIdentifier:");
}

id objc_msgSend_stopContentSharingSession(void *a1, const char *a2, ...)
{
  return _[a1 stopContentSharingSession];
}

id objc_msgSend_stopListeningForActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopListeningForActivityType:dynamicIdentifier:");
}

id objc_msgSend_stopListeningForActivityType_matchingDynamicIdentifierSubstring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopListeningForActivityType:matchingDynamicIdentifierSubstring:");
}

id objc_msgSend_stopListeningForBestAppSuggestions(void *a1, const char *a2, ...)
{
  return _[a1 stopListeningForBestAppSuggestions];
}

id objc_msgSend_stopTrackingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTrackingCall:");
}

id objc_msgSend_stopTrackingPendingMember_forConversation_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTrackingPendingMember:forConversation:triggeredLocally:");
}

id objc_msgSend_stopWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWithError:");
}

id objc_msgSend_stoppedReceivingActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stoppedReceivingActivityType:dynamicIdentifier:");
}

id objc_msgSend_storageGuid(void *a1, const char *a2, ...)
{
  return _[a1 storageGuid];
}

id objc_msgSend_storeReceivedLink_fromHandle_isUpdate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeReceivedLink:fromHandle:isUpdate:completionHandler:");
}

id objc_msgSend_streamToken(void *a1, const char *a2, ...)
{
  return _[a1 streamToken];
}

id objc_msgSend_streamTokenForStreamGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamTokenForStreamGroupID:");
}

id objc_msgSend_streamTokensByCSDClient(void *a1, const char *a2, ...)
{
  return _[a1 streamTokensByCSDClient];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForIDSSessionEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForIDSSessionEndedReason:");
}

id objc_msgSend_stringForIMAVChatEndedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForIMAVChatEndedReason:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringForSignatureType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForSignatureType:");
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return _[a1 stringGUID];
}

id objc_msgSend_stringRepresentationForTUCallDisconnectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringRepresentationForTUCallDisconnectedReason:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCharacters:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subTitle(void *a1, const char *a2, ...)
{
  return _[a1 subTitle];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _[a1 subscriptions];
}

id objc_msgSend_subscriptionsDidChangeForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsDidChangeForClient:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_suggestedName(void *a1, const char *a2, ...)
{
  return _[a1 suggestedName];
}

id objc_msgSend_superboxCallSource(void *a1, const char *a2, ...)
{
  return _[a1 superboxCallSource];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_supportedHandleTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedHandleTypes];
}

id objc_msgSend_supportedMediaTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedMediaTypes];
}

id objc_msgSend_supportedTUHandleTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedTUHandleTypes];
}

id objc_msgSend_supportsAVMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsAVMode:");
}

id objc_msgSend_supportsActivityPreviews(void *a1, const char *a2, ...)
{
  return _[a1 supportsActivityPreviews];
}

id objc_msgSend_supportsAddCall(void *a1, const char *a2, ...)
{
  return _[a1 supportsAddCall];
}

id objc_msgSend_supportsAudioAndVideo(void *a1, const char *a2, ...)
{
  return _[a1 supportsAudioAndVideo];
}

id objc_msgSend_supportsAudioOnly(void *a1, const char *a2, ...)
{
  return _[a1 supportsAudioOnly];
}

id objc_msgSend_supportsBasebandCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsBasebandCalling];
}

id objc_msgSend_supportsCellularData(void *a1, const char *a2, ...)
{
  return _[a1 supportsCellularData];
}

id objc_msgSend_supportsClientAssertions(void *a1, const char *a2, ...)
{
  return _[a1 supportsClientAssertions];
}

id objc_msgSend_supportsContinuationOnTV(void *a1, const char *a2, ...)
{
  return _[a1 supportsContinuationOnTV];
}

id objc_msgSend_supportsConversations(void *a1, const char *a2, ...)
{
  return _[a1 supportsConversations];
}

id objc_msgSend_supportsCurrentPlatform(void *a1, const char *a2, ...)
{
  return _[a1 supportsCurrentPlatform];
}

id objc_msgSend_supportsDTMF(void *a1, const char *a2, ...)
{
  return _[a1 supportsDTMF];
}

id objc_msgSend_supportsDTMFUpdates(void *a1, const char *a2, ...)
{
  return _[a1 supportsDTMFUpdates];
}

id objc_msgSend_supportsDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 supportsDefaultPairedDevice];
}

id objc_msgSend_supportsDisplayingFaceTimeAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsDisplayingFaceTimeAudioCalls];
}

id objc_msgSend_supportsDisplayingFaceTimeVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsDisplayingFaceTimeVideoCalls];
}

id objc_msgSend_supportsDynamicSystemUI(void *a1, const char *a2, ...)
{
  return _[a1 supportsDynamicSystemUI];
}

id objc_msgSend_supportsEmergency(void *a1, const char *a2, ...)
{
  return _[a1 supportsEmergency];
}

id objc_msgSend_supportsEmergencyFallback(void *a1, const char *a2, ...)
{
  return _[a1 supportsEmergencyFallback];
}

id objc_msgSend_supportsGrouping(void *a1, const char *a2, ...)
{
  return _[a1 supportsGrouping];
}

id objc_msgSend_supportsHolding(void *a1, const char *a2, ...)
{
  return _[a1 supportsHolding];
}

id objc_msgSend_supportsLeaveContext(void *a1, const char *a2, ...)
{
  return _[a1 supportsLeaveContext];
}

id objc_msgSend_supportsLinks(void *a1, const char *a2, ...)
{
  return _[a1 supportsLinks];
}

id objc_msgSend_supportsNonWiFiCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsNonWiFiCalling];
}

id objc_msgSend_supportsNonWiFiFaceTime(void *a1, const char *a2, ...)
{
  return _[a1 supportsNonWiFiFaceTime];
}

id objc_msgSend_supportsPhoneCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsPhoneCalls];
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsPrimaryCalling];
}

id objc_msgSend_supportsRecents(void *a1, const char *a2, ...)
{
  return _[a1 supportsRecents];
}

id objc_msgSend_supportsRelay(void *a1, const char *a2, ...)
{
  return _[a1 supportsRelay];
}

id objc_msgSend_supportsRelayCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsRelayCalling];
}

id objc_msgSend_supportsRelayCallingWithoutLocalRelayCallingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 supportsRelayCallingWithoutLocalRelayCallingEnabled];
}

id objc_msgSend_supportsRelayingToOtherDevices(void *a1, const char *a2, ...)
{
  return _[a1 supportsRelayingToOtherDevices];
}

id objc_msgSend_supportsRequestToScreenShare(void *a1, const char *a2, ...)
{
  return _[a1 supportsRequestToScreenShare];
}

id objc_msgSend_supportsRestrictingSecondaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsRestrictingSecondaryCalling];
}

id objc_msgSend_supportsRinging(void *a1, const char *a2, ...)
{
  return _[a1 supportsRinging];
}

id objc_msgSend_supportsScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 supportsScreenSharing];
}

id objc_msgSend_supportsScreening(void *a1, const char *a2, ...)
{
  return _[a1 supportsScreening];
}

id objc_msgSend_supportsSendingToVoicemail(void *a1, const char *a2, ...)
{
  return _[a1 supportsSendingToVoicemail];
}

id objc_msgSend_supportsSharePlay(void *a1, const char *a2, ...)
{
  return _[a1 supportsSharePlay];
}

id objc_msgSend_supportsSimultaneousVoiceAndData(void *a1, const char *a2, ...)
{
  return _[a1 supportsSimultaneousVoiceAndData];
}

id objc_msgSend_supportsTTYWithVoice(void *a1, const char *a2, ...)
{
  return _[a1 supportsTTYWithVoice];
}

id objc_msgSend_supportsUnambiguousMultiPartyState(void *a1, const char *a2, ...)
{
  return _[a1 supportsUnambiguousMultiPartyState];
}

id objc_msgSend_supportsUngrouping(void *a1, const char *a2, ...)
{
  return _[a1 supportsUngrouping];
}

id objc_msgSend_supportsVideo(void *a1, const char *a2, ...)
{
  return _[a1 supportsVideo];
}

id objc_msgSend_supportsVoicemail(void *a1, const char *a2, ...)
{
  return _[a1 supportsVoicemail];
}

id objc_msgSend_supportsWLAN(void *a1, const char *a2, ...)
{
  return _[a1 supportsWLAN];
}

id objc_msgSend_suppressRingtone(void *a1, const char *a2, ...)
{
  return _[a1 suppressRingtone];
}

id objc_msgSend_suppressRingtoneDueToRemoteSuppression(void *a1, const char *a2, ...)
{
  return _[a1 suppressRingtoneDueToRemoteSuppression];
}

id objc_msgSend_swapCalls(void *a1, const char *a2, ...)
{
  return _[a1 swapCalls];
}

id objc_msgSend_switchBackToOneToOneIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 switchBackToOneToOneIfPossible];
}

id objc_msgSend_switchBackToOneToOneIfPossibleUsingDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchBackToOneToOneIfPossibleUsingDelay:");
}

id objc_msgSend_switchBluetoothAudioFormats(void *a1, const char *a2, ...)
{
  return _[a1 switchBluetoothAudioFormats];
}

id objc_msgSend_switchToSpeakerRouteIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 switchToSpeakerRouteIfNecessary];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeExtensionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeExtensionsWithCompletionHandler:");
}

id objc_msgSend_synchronousExportedObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 synchronousExportedObjectProxy];
}

id objc_msgSend_systemCapabilitiesForSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemCapabilitiesForSubscription:");
}

id objc_msgSend_systemController(void *a1, const char *a2, ...)
{
  return _[a1 systemController];
}

id objc_msgSend_systemControllerSetUplinkMutedBlock(void *a1, const char *a2, ...)
{
  return _[a1 systemControllerSetUplinkMutedBlock];
}

id objc_msgSend_systemControllerUplinkMutedBlock(void *a1, const char *a2, ...)
{
  return _[a1 systemControllerUplinkMutedBlock];
}

id objc_msgSend_systemRootLayerTransform(void *a1, const char *a2, ...)
{
  return _[a1 systemRootLayerTransform];
}

id objc_msgSend_systemVolume(void *a1, const char *a2, ...)
{
  return _[a1 systemVolume];
}

id objc_msgSend_takingCallsPrivateAllowed(void *a1, const char *a2, ...)
{
  return _[a1 takingCallsPrivateAllowed];
}

id objc_msgSend_targetContentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 targetContentIdentifier];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_telephoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 telephoneNumber];
}

id objc_msgSend_telephonyCallCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 telephonyCallCapabilities];
}

id objc_msgSend_telephonyCallCapabilitiesChanged(void *a1, const char *a2, ...)
{
  return _[a1 telephonyCallCapabilitiesChanged];
}

id objc_msgSend_telephonyCallSource(void *a1, const char *a2, ...)
{
  return _[a1 telephonyCallSource];
}

id objc_msgSend_telephonyCapableDeviceExists(void *a1, const char *a2, ...)
{
  return _[a1 telephonyCapableDeviceExists];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 telephonyProvider];
}

id objc_msgSend_telephonySenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 telephonySenderIdentities];
}

id objc_msgSend_telephonySubscriptionLabelIdentifierForSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonySubscriptionLabelIdentifierForSenderIdentityUUID:");
}

id objc_msgSend_telephonySubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 telephonySubscriptions];
}

id objc_msgSend_temporaryDateStartedOutgoing(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDateStartedOutgoing];
}

id objc_msgSend_temporaryFilePath(void *a1, const char *a2, ...)
{
  return _[a1 temporaryFilePath];
}

id objc_msgSend_temporaryFileURLByClientFileURL(void *a1, const char *a2, ...)
{
  return _[a1 temporaryFileURLByClientFileURL];
}

id objc_msgSend_temporaryGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 temporaryGroupUUID];
}

id objc_msgSend_temporaryRequireInCallSounds(void *a1, const char *a2, ...)
{
  return _[a1 temporaryRequireInCallSounds];
}

id objc_msgSend_terminatingHandle(void *a1, const char *a2, ...)
{
  return _[a1 terminatingHandle];
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 testConfiguration];
}

id objc_msgSend_thumperCallingAllowedOnDefaultPairedDeviceDefault(void *a1, const char *a2, ...)
{
  return _[a1 thumperCallingAllowedOnDefaultPairedDeviceDefault];
}

id objc_msgSend_thumperCallingCapabilitiesState(void *a1, const char *a2, ...)
{
  return _[a1 thumperCallingCapabilitiesState];
}

id objc_msgSend_thumperCallingCapabilitiesStateByUUID(void *a1, const char *a2, ...)
{
  return _[a1 thumperCallingCapabilitiesStateByUUID];
}

id objc_msgSend_thumperCallingCapabilitiesStateForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumperCallingCapabilitiesStateForAccountID:");
}

id objc_msgSend_thumperCapabilitiesMonitor(void *a1, const char *a2, ...)
{
  return _[a1 thumperCapabilitiesMonitor];
}

id objc_msgSend_thumperCapabilitiesStatesForPreferenceKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumperCapabilitiesStatesForPreferenceKey:");
}

id objc_msgSend_thumperDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 thumperDeviceInfo];
}

id objc_msgSend_thumperPinExchangeController(void *a1, const char *a2, ...)
{
  return _[a1 thumperPinExchangeController];
}

id objc_msgSend_thumperService(void *a1, const char *a2, ...)
{
  return _[a1 thumperService];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timebase(void *a1, const char *a2, ...)
{
  return _[a1 timebase];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timeoutBlock(void *a1, const char *a2, ...)
{
  return _[a1 timeoutBlock];
}

id objc_msgSend_timeoutForInvitationWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutForInvitationWithMessage:");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 timeoutTimer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_timestampAsTimeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timestampAsTimeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toCHEmergencyMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toCHEmergencyMediaType:");
}

id objc_msgSend_toID(void *a1, const char *a2, ...)
{
  return _[a1 toID];
}

id objc_msgSend_tokenPrefixedURI(void *a1, const char *a2, ...)
{
  return _[a1 tokenPrefixedURI];
}

id objc_msgSend_trace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trace:");
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return _[a1 transactionID];
}

id objc_msgSend_transactionManager(void *a1, const char *a2, ...)
{
  return _[a1 transactionManager];
}

id objc_msgSend_transactionObjectsAwaitingCallHistory(void *a1, const char *a2, ...)
{
  return _[a1 transactionObjectsAwaitingCallHistory];
}

id objc_msgSend_transferFileAtSandboxExtendedURL_toDestinations_withMetadata_fromMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferFileAtSandboxExtendedURL:toDestinations:withMetadata:fromMember:");
}

id objc_msgSend_transferFileAtTemporaryURL_toDestinations_withMetadata_fromMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferFileAtTemporaryURL:toDestinations:withMetadata:fromMember:");
}

id objc_msgSend_transferFileAtURL_toDestinations_withMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferFileAtURL:toDestinations:withMetadata:");
}

id objc_msgSend_transitionAttemptForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionAttemptForConversation:");
}

id objc_msgSend_transitionStatus(void *a1, const char *a2, ...)
{
  return _[a1 transitionStatus];
}

id objc_msgSend_transmissionMode(void *a1, const char *a2, ...)
{
  return _[a1 transmissionMode];
}

id objc_msgSend_transmissionState(void *a1, const char *a2, ...)
{
  return _[a1 transmissionState];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return _[a1 transport];
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return _[a1 transportType];
}

id objc_msgSend_trustedFromHandle(void *a1, const char *a2, ...)
{
  return _[a1 trustedFromHandle];
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return _[a1 ttyType];
}

id objc_msgSend_tuAVMode(void *a1, const char *a2, ...)
{
  return _[a1 tuAVMode];
}

id objc_msgSend_tuActivity(void *a1, const char *a2, ...)
{
  return _[a1 tuActivity];
}

id objc_msgSend_tuActivitySessions(void *a1, const char *a2, ...)
{
  return _[a1 tuActivitySessions];
}

id objc_msgSend_tuAssociationForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuAssociationForHandle:");
}

id objc_msgSend_tuCallDTMFUpdate(void *a1, const char *a2, ...)
{
  return _[a1 tuCallDTMFUpdate];
}

id objc_msgSend_tuCallUpdateWithProvider_withCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuCallUpdateWithProvider:withCallUUID:");
}

id objc_msgSend_tuConversation(void *a1, const char *a2, ...)
{
  return _[a1 tuConversation];
}

id objc_msgSend_tuConversationActivity(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationActivity];
}

id objc_msgSend_tuConversationActivityContext(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationActivityContext];
}

id objc_msgSend_tuConversationActivitySession(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationActivitySession];
}

id objc_msgSend_tuConversationLink(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationLink];
}

id objc_msgSend_tuConversationMember(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationMember];
}

id objc_msgSend_tuConversationMembers(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationMembers];
}

id objc_msgSend_tuConversationParticipant(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationParticipant];
}

id objc_msgSend_tuConversationParticipantAssociation(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationParticipantAssociation];
}

id objc_msgSend_tuConversationParticipants(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationParticipants];
}

id objc_msgSend_tuConversationProviderForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuConversationProviderForIdentifier:");
}

id objc_msgSend_tuConversationReport(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationReport];
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _[a1 tuHandle];
}

id objc_msgSend_tuHandleType(void *a1, const char *a2, ...)
{
  return _[a1 tuHandleType];
}

id objc_msgSend_tuHandlesWithHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuHandlesWithHandles:");
}

id objc_msgSend_tuInvitationPreference(void *a1, const char *a2, ...)
{
  return _[a1 tuInvitationPreference];
}

id objc_msgSend_tuInvitationPreferences(void *a1, const char *a2, ...)
{
  return _[a1 tuInvitationPreferences];
}

id objc_msgSend_tuLabeledHandle(void *a1, const char *a2, ...)
{
  return _[a1 tuLabeledHandle];
}

id objc_msgSend_tuLightweightMembers(void *a1, const char *a2, ...)
{
  return _[a1 tuLightweightMembers];
}

id objc_msgSend_tuMediaTokens(void *a1, const char *a2, ...)
{
  return _[a1 tuMediaTokens];
}

id objc_msgSend_tuProvider(void *a1, const char *a2, ...)
{
  return _[a1 tuProvider];
}

id objc_msgSend_tuProviders(void *a1, const char *a2, ...)
{
  return _[a1 tuProviders];
}

id objc_msgSend_tuRoute(void *a1, const char *a2, ...)
{
  return _[a1 tuRoute];
}

id objc_msgSend_tuRouteDeviceType(void *a1, const char *a2, ...)
{
  return _[a1 tuRouteDeviceType];
}

id objc_msgSend_tuScreenShareAttributesForScreenAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuScreenShareAttributesForScreenAttributes:");
}

id objc_msgSend_tuScreenSharingRequest(void *a1, const char *a2, ...)
{
  return _[a1 tuScreenSharingRequest];
}

id objc_msgSend_tuSenderIdentity(void *a1, const char *a2, ...)
{
  return _[a1 tuSenderIdentity];
}

id objc_msgSend_tuState(void *a1, const char *a2, ...)
{
  return _[a1 tuState];
}

id objc_msgSend_tuSystemActivitySessions(void *a1, const char *a2, ...)
{
  return _[a1 tuSystemActivitySessions];
}

id objc_msgSend_tuVoucher(void *a1, const char *a2, ...)
{
  return _[a1 tuVoucher];
}

id objc_msgSend_tu_UUIDv5ForString_namespaceUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_UUIDv5ForString:namespaceUUID:");
}

id objc_msgSend_tu_anyObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_anyObjectPassingTest:");
}

id objc_msgSend_tu_containsObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_containsObjectPassingTest:");
}

id objc_msgSend_tu_conversationHandoffDynamicIdentifierWithGroupUUID_participantIdentifier_uplinkMuted_sendingVideo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:");
}

id objc_msgSend_tu_defaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_defaults");
}

id objc_msgSend_tu_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_firstObjectPassingTest:");
}

id objc_msgSend_tu_handoffEligibility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_handoffEligibility");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeAsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeAsString:");
}

id objc_msgSend_typeString(void *a1, const char *a2, ...)
{
  return _[a1 typeString];
}

id objc_msgSend_uPlusNDowngrade(void *a1, const char *a2, ...)
{
  return _[a1 uPlusNDowngrade];
}

id objc_msgSend_uPlusOneAuthTagSampleRate(void *a1, const char *a2, ...)
{
  return _[a1 uPlusOneAuthTagSampleRate];
}

id objc_msgSend_uPlusOneScreenSharing(void *a1, const char *a2, ...)
{
  return _[a1 uPlusOneScreenSharing];
}

id objc_msgSend_uPlusOneSessionWithCapabilitiesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 uPlusOneSessionWithCapabilitiesEnabled];
}

id objc_msgSend_uUIDString(void *a1, const char *a2, ...)
{
  return _[a1 uUIDString];
}

id objc_msgSend_uiXPCEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 uiXPCEndpoint];
}

id objc_msgSend_unarchivedObjectFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectFromData:error:");
}

id objc_msgSend_underlyingErrorCode(void *a1, const char *a2, ...)
{
  return _[a1 underlyingErrorCode];
}

id objc_msgSend_unenrollDefaultPairedDeviceForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unenrollDefaultPairedDeviceForAccountID:");
}

id objc_msgSend_unenrollDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unenrollDevice:");
}

id objc_msgSend_unformattedInternationalRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 unformattedInternationalRepresentation];
}

id objc_msgSend_ungroup(void *a1, const char *a2, ...)
{
  return _[a1 ungroup];
}

id objc_msgSend_ungroupCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ungroupCall:");
}

id objc_msgSend_ungroupCall_fromOtherCallsInGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ungroupCall:fromOtherCallsInGroup:");
}

id objc_msgSend_unhold(void *a1, const char *a2, ...)
{
  return _[a1 unhold];
}

id objc_msgSend_unholdCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unholdCall:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_uniqueProxyIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueProxyIdentifier];
}

id objc_msgSend_uniqueProxyIdentifierToCallTable(void *a1, const char *a2, ...)
{
  return _[a1 uniqueProxyIdentifierToCallTable];
}

id objc_msgSend_uniqueProxyIdentifierToCallTableSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 uniqueProxyIdentifierToCallTableSemaphore];
}

id objc_msgSend_uniqueProxyIdentifierUUID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueProxyIdentifierUUID];
}

id objc_msgSend_uniqueRingtoneSoundLinkFilenameWithOriginalFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueRingtoneSoundLinkFilenameWithOriginalFilename:");
}

id objc_msgSend_unknownProvider(void *a1, const char *a2, ...)
{
  return _[a1 unknownProvider];
}

id objc_msgSend_unmuteAfterDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 unmuteAfterDisconnect];
}

id objc_msgSend_unregisterActivityType_dynamicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterActivityType:dynamicIdentifier:");
}

id objc_msgSend_unregisterStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterStreamToken:");
}

id objc_msgSend_unreliableMessengerConfig(void *a1, const char *a2, ...)
{
  return _[a1 unreliableMessengerConfig];
}

id objc_msgSend_unsafeData(void *a1, const char *a2, ...)
{
  return _[a1 unsafeData];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsuppressRingtoneIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 unsuppressRingtoneIfNecessary];
}

id objc_msgSend_unzipArchiveAtURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unzipArchiveAtURL:completion:");
}

id objc_msgSend_updateActivityAuthorizedBundleIdentifierState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActivityAuthorizedBundleIdentifierState:");
}

id objc_msgSend_updateActivityImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActivityImage:");
}

id objc_msgSend_updateActivitySessionWithUUID_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActivitySessionWithUUID:activity:");
}

id objc_msgSend_updateAllowedHandlesForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllowedHandlesForConversation:");
}

id objc_msgSend_updateAppHistoryActivityForCall(void *a1, const char *a2, ...)
{
  return _[a1 updateAppHistoryActivityForCall];
}

id objc_msgSend_updateApplicationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateApplicationState:");
}

id objc_msgSend_updateAudioArbitration(void *a1, const char *a2, ...)
{
  return _[a1 updateAudioArbitration];
}

id objc_msgSend_updateAudioVideoHandoffPreferencesForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAudioVideoHandoffPreferencesForCall:");
}

id objc_msgSend_updateBytesOfDataUsed_forCallWithUniqueProxyIdentifier_callHistoryIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBytesOfDataUsed:forCallWithUniqueProxyIdentifier:callHistoryIdentifier:");
}

id objc_msgSend_updateBytesOfDataUsedFor_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBytesOfDataUsedFor:with:");
}

id objc_msgSend_updateCacheWithChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithChat:");
}

id objc_msgSend_updateCallHandoffRegistration(void *a1, const char *a2, ...)
{
  return _[a1 updateCallHandoffRegistration];
}

id objc_msgSend_updateCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCapabilities:");
}

id objc_msgSend_updateCapabilities_forCallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCapabilities:forCallID:");
}

id objc_msgSend_updateClientsWithCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientsWithCall:");
}

id objc_msgSend_updateClientsWithFrequency_inDirection_forCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientsWithFrequency:inDirection:forCalls:");
}

id objc_msgSend_updateClientsWithMeterLevel_inDirection_forCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientsWithMeterLevel:inDirection:forCalls:");
}

id objc_msgSend_updateConferenceForIdentifier_isUsingBaseband_disableAudio_isTinCan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateConfigurationSessionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfigurationSessionMode:");
}

id objc_msgSend_updateConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConversation:");
}

id objc_msgSend_updateConversationParticipantToHaveMatchingSiriDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConversationParticipantToHaveMatchingSiriDisplayName:");
}

id objc_msgSend_updateConversationsByGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConversationsByGroupUUID:");
}

id objc_msgSend_updateFilteredOutReasonForCall_WithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFilteredOutReasonForCall:WithError:");
}

id objc_msgSend_updateForDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 updateForDisconnection];
}

id objc_msgSend_updateHandoffActivityStateForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandoffActivityStateForCall:");
}

id objc_msgSend_updateHandoffAdvertisementForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandoffAdvertisementForCall:");
}

id objc_msgSend_updateHandoffAdvertisementForConversation_fromOldConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandoffAdvertisementForConversation:fromOldConversation:");
}

id objc_msgSend_updateHandoffAdvertisementForConversation_fromOldConversation_uplinkMuted_sendingVideo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:");
}

id objc_msgSend_updateHandoffRegistrationForConversation_fromOldConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandoffRegistrationForConversation:fromOldConversation:");
}

id objc_msgSend_updateInterestedBundleIDs_states_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInterestedBundleIDs:states:");
}

id objc_msgSend_updateLetMeInRequestState_addLink_forConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLetMeInRequestState:addLink:forConversationWithUUID:");
}

id objc_msgSend_updateLightweightMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLightweightMember:");
}

id objc_msgSend_updateLocalAspectRatios(void *a1, const char *a2, ...)
{
  return _[a1 updateLocalAspectRatios];
}

id objc_msgSend_updateLocalMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocalMember:");
}

id objc_msgSend_updateLocalParticipantToAVLessWithPresentationMode_forConversationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocalParticipantToAVLessWithPresentationMode:forConversationUUID:");
}

id objc_msgSend_updateMemberValidationSource_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMemberValidationSource:source:");
}

id objc_msgSend_updateMembers_withContext_messagingCapabilities_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMembers:withContext:messagingCapabilities:triggeredLocally:");
}

id objc_msgSend_updateMembers_withContext_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMembers:withContext:triggeredLocally:");
}

id objc_msgSend_updateMessagesGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMessagesGroupName:");
}

id objc_msgSend_updateMessagesGroupName_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMessagesGroupName:onConversationWithUUID:");
}

id objc_msgSend_updateMessagesGroupPhotoOnConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMessagesGroupPhotoOnConversationWithUUID:");
}

id objc_msgSend_updateNetworkCriticalStateIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 updateNetworkCriticalStateIfNecessary];
}

id objc_msgSend_updateOneToOneModeForParticipantUpdateType_participant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOneToOneModeForParticipantUpdateType:participant:");
}

id objc_msgSend_updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary];
}

id objc_msgSend_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOutgoingLocalParticipantUUID:forCallsWithOutgoingLocalParticipantUUID:");
}

id objc_msgSend_updatePairedHostDeviceCallCapabilitiesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePairedHostDeviceCallCapabilitiesState:");
}

id objc_msgSend_updateParticipantData_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantData:withContext:");
}

id objc_msgSend_updateParticipantDestinationIDs_withContextData_requiredCapabilities_requiredLackOfCapabilities_triggeredLocally_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateParticipantDestinationIDs:withContextData:requiredCapabilities:requiredLackOfCapabilities:triggeredLocally:");
}

id objc_msgSend_updateParticipantDestinationIDs_withContextData_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantDestinationIDs:withContextData:triggeredLocally:");
}

id objc_msgSend_updateParticipantInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantInfo:");
}

id objc_msgSend_updateParticipantPresentationContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantPresentationContexts:");
}

id objc_msgSend_updateParticipantPresentationContexts_onConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantPresentationContexts:onConversationWithUUID:");
}

id objc_msgSend_updateParticipantType_members_withContext_triggeredLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantType:members:withContext:triggeredLocally:");
}

id objc_msgSend_updateParticipantsWithDestinationIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateParticipantsWithDestinationIdentifiers:");
}

id objc_msgSend_updatePickableRoutes(void *a1, const char *a2, ...)
{
  return _[a1 updatePickableRoutes];
}

id objc_msgSend_updatePropertiesForVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePropertiesForVideo:");
}

id objc_msgSend_updateProviderConfigurationWithAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProviderConfigurationWithAccounts:");
}

id objc_msgSend_updateProviderConfigurationWithAccounts_senderIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProviderConfigurationWithAccounts:senderIdentities:");
}

id objc_msgSend_updateProviderConfigurationWithSenderIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProviderConfigurationWithSenderIdentities:");
}

id objc_msgSend_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateProvidersByIdentifier:localProvidersByIdentifier:pairedHostDeviceProvidersByIdentifier:");
}

id objc_msgSend_updateRelayCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRelayCall:");
}

id objc_msgSend_updateRemoteMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRemoteMember:");
}

id objc_msgSend_updateReportInfoForHandoffParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateReportInfoForHandoffParticipant:");
}

id objc_msgSend_updateScreenCaptureWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScreenCaptureWithConfig:");
}

id objc_msgSend_updateScreenEnabledForRemoteParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScreenEnabledForRemoteParticipants:");
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return _[a1 updateState];
}

id objc_msgSend_updateSuppressRingtoneActivityListeningState(void *a1, const char *a2, ...)
{
  return _[a1 updateSuppressRingtoneActivityListeningState];
}

id objc_msgSend_updateUINotification(void *a1, const char *a2, ...)
{
  return _[a1 updateUINotification];
}

id objc_msgSend_updateUplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUplinkMuted:");
}

id objc_msgSend_updateVirtualParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVirtualParticipantIdentifier:");
}

id objc_msgSend_updateWithCallUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithCallUpdate:");
}

id objc_msgSend_updateWithProxyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithProxyCall:");
}

id objc_msgSend_updateWithRelayMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRelayMessage:");
}

id objc_msgSend_updateWithUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithUpdate:");
}

id objc_msgSend_updatedDateEpochTime(void *a1, const char *a2, ...)
{
  return _[a1 updatedDateEpochTime];
}

id objc_msgSend_upgradeCallForConversation_withSessionToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeCallForConversation:withSessionToken:");
}

id objc_msgSend_upgradeChatIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeChatIfNecessary:");
}

id objc_msgSend_upgradeSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 upgradeSessionUUID];
}

id objc_msgSend_upgradeSessionUUIDForCallWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeSessionUUIDForCallWithUUID:");
}

id objc_msgSend_upgradeTimeout(void *a1, const char *a2, ...)
{
  return _[a1 upgradeTimeout];
}

id objc_msgSend_uplinkStreamToken(void *a1, const char *a2, ...)
{
  return _[a1 uplinkStreamToken];
}

id objc_msgSend_uplinkWasExplicitlyMuted(void *a1, const char *a2, ...)
{
  return _[a1 uplinkWasExplicitlyMuted];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_uriForFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uriForFromID:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_urlForFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlForFilename:");
}

id objc_msgSend_urlFromResources_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlFromResources:withExtension:");
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return _[a1 userActivity];
}

id objc_msgSend_userConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 userConfiguration];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userIntentManager(void *a1, const char *a2, ...)
{
  return _[a1 userIntentManager];
}

id objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:");
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:");
}

id objc_msgSend_usesAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 usesAudioSession];
}

id objc_msgSend_usesModernScreenSharingFromMessages(void *a1, const char *a2, ...)
{
  return _[a1 usesModernScreenSharingFromMessages];
}

id objc_msgSend_usesSystemMuting(void *a1, const char *a2, ...)
{
  return _[a1 usesSystemMuting];
}

id objc_msgSend_usesSystemMutingBlock(void *a1, const char *a2, ...)
{
  return _[a1 usesSystemMutingBlock];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validNetworkReachable(void *a1, const char *a2, ...)
{
  return _[a1 validNetworkReachable];
}

id objc_msgSend_validateAllLinks(void *a1, const char *a2, ...)
{
  return _[a1 validateAllLinks];
}

id objc_msgSend_validateLinkForJoinCallActionIfNecessary_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateLinkForJoinCallActionIfNecessary:withError:");
}

id objc_msgSend_validateUserIntentForCallSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateUserIntentForCallSource:");
}

id objc_msgSend_validationErrorReasonForAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationErrorReasonForAlias:");
}

id objc_msgSend_validationSource(void *a1, const char *a2, ...)
{
  return _[a1 validationSource];
}

id objc_msgSend_validationStatusForAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationStatusForAlias:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForCapability:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithRect:");
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 verificationStatus];
}

id objc_msgSend_verifyActivitySessionOriginatorFromHandle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyActivitySessionOriginatorFromHandle:message:");
}

id objc_msgSend_verifyAllLightweightmembersAssociated_remoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyAllLightweightmembersAssociated:remoteMembers:");
}

id objc_msgSend_verifyBlobResponseFromHandle_message_existingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyBlobResponseFromHandle:message:existingConversation:");
}

id objc_msgSend_verifyEndorseRepresentsMemberFromHandle_message_existingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyEndorseRepresentsMemberFromHandle:message:existingConversation:");
}

id objc_msgSend_verifyGroupSessionParticipantUpdateAllowedFromHandle_participantUpdate_message_existingConversation_lightweightMembers_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "verifyGroupSessionParticipantUpdateAllowedFromHandle:participantUpdate:message:existingConversation:lightweightMembers:");
}

id objc_msgSend_verifyKickMemberPermittedFromHandle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyKickMemberPermittedFromHandle:message:");
}

id objc_msgSend_verifyLightweightMessageTypeFromHandle_message_existingConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyLightweightMessageTypeFromHandle:message:existingConversation:");
}

id objc_msgSend_verifyMessageIntentKeyFromContext_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyMessageIntentKeyFromContext:message:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_vettedAliases(void *a1, const char *a2, ...)
{
  return _[a1 vettedAliases];
}

id objc_msgSend_video(void *a1, const char *a2, ...)
{
  return _[a1 video];
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 videoDeviceController];
}

id objc_msgSend_videoDeviceControllerCreationBlock(void *a1, const char *a2, ...)
{
  return _[a1 videoDeviceControllerCreationBlock];
}

id objc_msgSend_videoEnabled(void *a1, const char *a2, ...)
{
  return _[a1 videoEnabled];
}

id objc_msgSend_videoPresentationSize(void *a1, const char *a2, ...)
{
  return _[a1 videoPresentationSize];
}

id objc_msgSend_videoPresentationState(void *a1, const char *a2, ...)
{
  return _[a1 videoPresentationState];
}

id objc_msgSend_videoPriority(void *a1, const char *a2, ...)
{
  return _[a1 videoPriority];
}

id objc_msgSend_videoQuality(void *a1, const char *a2, ...)
{
  return _[a1 videoQuality];
}

id objc_msgSend_videoStreamToken(void *a1, const char *a2, ...)
{
  return _[a1 videoStreamToken];
}

id objc_msgSend_videoToken(void *a1, const char *a2, ...)
{
  return _[a1 videoToken];
}

id objc_msgSend_virtualParticipantConfig(void *a1, const char *a2, ...)
{
  return _[a1 virtualParticipantConfig];
}

id objc_msgSend_virtualParticipants(void *a1, const char *a2, ...)
{
  return _[a1 virtualParticipants];
}

id objc_msgSend_virtualParticipantsByPluginName(void *a1, const char *a2, ...)
{
  return _[a1 virtualParticipantsByPluginName];
}

id objc_msgSend_visibility(void *a1, const char *a2, ...)
{
  return _[a1 visibility];
}

id objc_msgSend_visibilityContext(void *a1, const char *a2, ...)
{
  return _[a1 visibilityContext];
}

id objc_msgSend_visionCallEstablishmentVersion(void *a1, const char *a2, ...)
{
  return _[a1 visionCallEstablishmentVersion];
}

id objc_msgSend_visionFeatureVersion(void *a1, const char *a2, ...)
{
  return _[a1 visionFeatureVersion];
}

id objc_msgSend_voLTECallingCapabilitiesState(void *a1, const char *a2, ...)
{
  return _[a1 voLTECallingCapabilitiesState];
}

id objc_msgSend_voiceOverObserver(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverObserver];
}

id objc_msgSend_voicePreferred(void *a1, const char *a2, ...)
{
  return _[a1 voicePreferred];
}

id objc_msgSend_voipApplicationController(void *a1, const char *a2, ...)
{
  return _[a1 voipApplicationController];
}

id objc_msgSend_voucherManager(void *a1, const char *a2, ...)
{
  return _[a1 voucherManager];
}

id objc_msgSend_voucherWithTUVoucher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voucherWithTUVoucher:");
}

id objc_msgSend_waitingChatWithHandle_isOutgoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitingChatWithHandle:isOutgoing:");
}

id objc_msgSend_wantsBreakBeforeMakeForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wantsBreakBeforeMakeForCall:");
}

id objc_msgSend_wantsCallDisconnectionOnInvalidation(void *a1, const char *a2, ...)
{
  return _[a1 wantsCallDisconnectionOnInvalidation];
}

id objc_msgSend_wantsCallNotificationsDisabledWhileSuspended(void *a1, const char *a2, ...)
{
  return _[a1 wantsCallNotificationsDisabledWhileSuspended];
}

id objc_msgSend_wantsCallStopStreamingOnInvalidation(void *a1, const char *a2, ...)
{
  return _[a1 wantsCallStopStreamingOnInvalidation];
}

id objc_msgSend_wantsFrequencyChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 wantsFrequencyChangeNotifications];
}

id objc_msgSend_wantsHoldMusic(void *a1, const char *a2, ...)
{
  return _[a1 wantsHoldMusic];
}

id objc_msgSend_wantsLeaveOnInvalidation(void *a1, const char *a2, ...)
{
  return _[a1 wantsLeaveOnInvalidation];
}

id objc_msgSend_wantsStagingArea(void *a1, const char *a2, ...)
{
  return _[a1 wantsStagingArea];
}

id objc_msgSend_wantsToScreenCalls(void *a1, const char *a2, ...)
{
  return _[a1 wantsToScreenCalls];
}

id objc_msgSend_wasDeclined(void *a1, const char *a2, ...)
{
  return _[a1 wasDeclined];
}

id objc_msgSend_wasDialAssisted(void *a1, const char *a2, ...)
{
  return _[a1 wasDialAssisted];
}

id objc_msgSend_wasScreened(void *a1, const char *a2, ...)
{
  return _[a1 wasScreened];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_webNicknameLengthLimit(void *a1, const char *a2, ...)
{
  return _[a1 webNicknameLengthLimit];
}

id objc_msgSend_whenUnlockedCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 whenUnlockedCallbacks];
}

id objc_msgSend_whenUnlockedObserver(void *a1, const char *a2, ...)
{
  return _[a1 whenUnlockedObserver];
}

id objc_msgSend_wiFiActiveAndReachable(void *a1, const char *a2, ...)
{
  return _[a1 wiFiActiveAndReachable];
}

id objc_msgSend_wiFiCallingCapabilitiesState(void *a1, const char *a2, ...)
{
  return _[a1 wiFiCallingCapabilitiesState];
}

id objc_msgSend_willCaptureRemoteRequestFromRequesterID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willCaptureRemoteRequestFromRequesterID:");
}

id objc_msgSend_willInject(void *a1, const char *a2, ...)
{
  return _[a1 willInject];
}

id objc_msgSend_willRestrictAddresses_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willRestrictAddresses:forBundleIdentifier:");
}

id objc_msgSend_windowUUID(void *a1, const char *a2, ...)
{
  return _[a1 windowUUID];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return _[a1 xpcListener];
}

id objc_msgSend_zipDirectoryAtURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zipDirectoryAtURL:completion:");
}