void sub_2DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void v12[8];
  v1 = type metadata accessor for ActionFailure(0LL);
  v12[4] = *(void *)(v1 - 8);
  v12[5] = v1;
  v2 = __chkstk_darwin(v1);
  v12[0] = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  v12[3] = (char *)v12 - v4;
  v5 = type metadata accessor for AjaxMetadata(0LL);
  v12[1] = *(void *)(v5 - 8);
  v12[2] = v5;
  __chkstk_darwin(v5);
  v6 = type metadata accessor for SessionServerMessage(0LL);
  __chkstk_darwin(v6);
  v7 = type metadata accessor for MessagePayload.SessionError(0LL);
  __chkstk_darwin(v7);
  v8 = type metadata accessor for IFFlowError(0LL);
  __chkstk_darwin(v8);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_3400(v0, (uint64_t)v10);
  v11 = (char *)sub_2F98 + 4 * byte_31120[swift_getEnumCaseMultiPayload(v10, v8)];
  __asm { BR              X10 }
}

uint64_t sub_2F98()
{
  *(void *)(v4 - 96) = 0LL;
  *(void *)(v4 - 88) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(28LL);
  uint64_t v5 = *(void *)(v4 - 88);
  *(void *)(v4 - 96) = *(void *)(v4 - 96);
  *(void *)(v4 - 88) = v5;
  v6._object = (void *)0x8000000000033170LL;
  v6._countAndFlagsBits = 0xD00000000000001ALL;
  String.append(_:)(v6);
  ((void (*)(uint64_t, uint64_t, uint64_t, void *, void *))_print_unlocked<A, B>(_:_:))( v0,  v4 - 96,  v3,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  uint64_t v7 = *(void *)(v4 - 96);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v3);
  return v7;
}

void sub_32B0()
{
  uint64_t v1 = type metadata accessor for IFFlowError(0LL);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_3400(v0, (uint64_t)v3);
  uint64_t v4 = (char *)sub_3334 + 4 * byte_3112A[swift_getEnumCaseMultiPayload(v3, v1)];
  __asm { BR              X10 }

uint64_t sub_3334()
{
  return 0LL;
}

uint64_t type metadata accessor for IFFlowError(uint64_t a1)
{
  uint64_t result = qword_3D010;
  if (!qword_3D010) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for IFFlowError);
  }
  return result;
}

uint64_t sub_3400(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IFFlowError(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_3444(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IFFlowError(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t *sub_3480(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        uint64_t v8 = type metadata accessor for MessagePayload.SessionError(0LL);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
        swift_storeEnumTagMultiPayload(a1, a3, 0LL);
        break;
      case 1u:
        uint64_t v11 = type metadata accessor for SessionServerMessage(0LL);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
        swift_storeEnumTagMultiPayload(a1, a3, 1LL);
        break;
      case 2u:
        uint64_t v12 = type metadata accessor for AjaxMetadata(0LL);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
        swift_storeEnumTagMultiPayload(a1, a3, 2LL);
        break;
      case 3u:
        uint64_t v13 = type metadata accessor for Input(0LL);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16LL))(a1, a2, v13);
        swift_storeEnumTagMultiPayload(a1, a3, 3LL);
        break;
      case 4u:
        uint64_t v16 = a2[1];
        *a1 = *a2;
        a1[1] = v16;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload(a1, a3, 4LL);
        break;
      case 5u:
        uint64_t v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload(a1, a3, 5LL);
        break;
      case 7u:
        uint64_t v15 = type metadata accessor for ActionFailure(0LL);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v15 - 8) + 16LL))(a1, a2, v15);
        swift_storeEnumTagMultiPayload(a1, a3, 7LL);
        break;
      default:
        memcpy(a1, a2, *(void *)(v5 + 64));
        break;
    }
  }

  return a1;
}

uint64_t sub_3660(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  switch((int)result)
  {
    case 0:
      uint64_t v4 = type metadata accessor for MessagePayload.SessionError(0LL);
      goto LABEL_8;
    case 1:
      uint64_t v4 = type metadata accessor for SessionServerMessage(0LL);
      goto LABEL_8;
    case 2:
      uint64_t v4 = type metadata accessor for AjaxMetadata(0LL);
      goto LABEL_8;
    case 3:
      uint64_t v4 = type metadata accessor for Input(0LL);
      goto LABEL_8;
    case 4:
    case 5:
      return swift_bridgeObjectRelease(*(void *)(a1 + 8));
    case 7:
      uint64_t v4 = type metadata accessor for ActionFailure(0LL);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
      break;
    default:
      return result;
  }

  return result;
}

void *sub_3708(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      uint64_t v6 = type metadata accessor for MessagePayload.SessionError(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 0LL;
      goto LABEL_10;
    case 1u:
      uint64_t v10 = type metadata accessor for SessionServerMessage(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 1LL;
      goto LABEL_10;
    case 2u:
      uint64_t v11 = type metadata accessor for AjaxMetadata(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 2LL;
      goto LABEL_10;
    case 3u:
      uint64_t v12 = type metadata accessor for Input(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 3LL;
      goto LABEL_10;
    case 4u:
      uint64_t v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 4LL;
      goto LABEL_10;
    case 5u:
      uint64_t v13 = a2[1];
      *a1 = *a2;
      a1[1] = v13;
      swift_bridgeObjectRetain();
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 5LL;
      goto LABEL_10;
    case 7u:
      uint64_t v14 = type metadata accessor for ActionFailure(0LL);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16LL))(a1, a2, v14);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 7LL;
LABEL_10:
      swift_storeEnumTagMultiPayload(v7, v8, v9);
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      break;
  }

  return a1;
}

void *sub_38A8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_3444((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        uint64_t v6 = type metadata accessor for MessagePayload.SessionError(0LL);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 0LL;
        goto LABEL_11;
      case 1u:
        uint64_t v10 = type metadata accessor for SessionServerMessage(0LL);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 1LL;
        goto LABEL_11;
      case 2u:
        uint64_t v11 = type metadata accessor for AjaxMetadata(0LL);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 2LL;
        goto LABEL_11;
      case 3u:
        uint64_t v12 = type metadata accessor for Input(0LL);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 3LL;
        goto LABEL_11;
      case 4u:
        *a1 = *a2;
        uint64_t v13 = a2[1];
        a1[1] = v13;
        swift_bridgeObjectRetain(v13);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 4LL;
        goto LABEL_11;
      case 5u:
        *a1 = *a2;
        uint64_t v14 = a2[1];
        a1[1] = v14;
        swift_bridgeObjectRetain(v14);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 5LL;
        goto LABEL_11;
      case 7u:
        uint64_t v15 = type metadata accessor for ActionFailure(0LL);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16LL))(a1, a2, v15);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 7LL;
LABEL_11:
        swift_storeEnumTagMultiPayload(v7, v8, v9);
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        break;
    }
  }

  return a1;
}

void *sub_3A68(void *a1, const void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      uint64_t v6 = type metadata accessor for MessagePayload.SessionError(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 0LL;
      goto LABEL_8;
    case 1u:
      uint64_t v10 = type metadata accessor for SessionServerMessage(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(a1, a2, v10);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 1LL;
      goto LABEL_8;
    case 2u:
      uint64_t v11 = type metadata accessor for AjaxMetadata(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, a2, v11);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 2LL;
      goto LABEL_8;
    case 3u:
      uint64_t v12 = type metadata accessor for Input(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(a1, a2, v12);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 3LL;
      goto LABEL_8;
    case 7u:
      uint64_t v13 = type metadata accessor for ActionFailure(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(a1, a2, v13);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 7LL;
LABEL_8:
      swift_storeEnumTagMultiPayload(v7, v8, v9);
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      break;
  }

  return a1;
}

void *sub_3BD0(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_3444((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        uint64_t v6 = type metadata accessor for MessagePayload.SessionError(0LL);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 0LL;
        goto LABEL_9;
      case 1u:
        uint64_t v10 = type metadata accessor for SessionServerMessage(0LL);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(a1, a2, v10);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 1LL;
        goto LABEL_9;
      case 2u:
        uint64_t v11 = type metadata accessor for AjaxMetadata(0LL);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, a2, v11);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 2LL;
        goto LABEL_9;
      case 3u:
        uint64_t v12 = type metadata accessor for Input(0LL);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(a1, a2, v12);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 3LL;
        goto LABEL_9;
      case 7u:
        uint64_t v13 = type metadata accessor for ActionFailure(0LL);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(a1, a2, v13);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 7LL;
LABEL_9:
        swift_storeEnumTagMultiPayload(v7, v8, v9);
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        break;
    }
  }

  return a1;
}

uint64_t sub_3D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_3D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_3D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_3D78(uint64_t a1)
{
  uint64_t result = type metadata accessor for MessagePayload.SessionError(319LL);
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for SessionServerMessage(319LL);
    if (v4 <= 0x3F)
    {
      v8[1] = *(void *)(result - 8) + 64LL;
      uint64_t result = type metadata accessor for AjaxMetadata(319LL);
      if (v5 <= 0x3F)
      {
        v8[2] = *(void *)(result - 8) + 64LL;
        uint64_t result = type metadata accessor for Input(319LL);
        if (v6 <= 0x3F)
        {
          v8[3] = *(void *)(result - 8) + 64LL;
          v8[4] = &unk_31180;
          v8[5] = &unk_31180;
          v8[6] = &unk_31198;
          uint64_t result = type metadata accessor for ActionFailure(319LL);
          if (v7 <= 0x3F)
          {
            v8[7] = *(void *)(result - 8) + 64LL;
            swift_initEnumMetadataMultiPayload(a1, 256LL, 8LL, v8);
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_3E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ActionFailure.Failure(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for StatementOutcome(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v35 = a1;
  sub_257E4((uint64_t)&v33 - v15);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))( v9,  enum case for ActionFailure.Failure.actionCanceled(_:),  v6);
  ActionFailure.init(failure:)(v9);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for StatementOutcome.failure(_:), v10);
  unint64_t v17 = sub_4424();
  LOBYTE(a1) = dispatch thunk of static Equatable.== infix(_:_:)(v16, v14, v10, v17);
  v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  v18(v16, v10);
  if ((a1 & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 104))( v36,  enum case for RequestSummary.ExecutionSource.intelligenceFlow(_:),  v3);
  }
  uint64_t v20 = v4;
  uint64_t v21 = v36;
  uint64_t v22 = v3;
  uint64_t v23 = sub_259D0();
  if (!v24) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 104))( v21,  enum case for RequestSummary.ExecutionSource.intelligenceFlow(_:),  v3);
  }
  uint64_t v25 = v23;
  uint64_t v26 = v24;
  if (v23 == 0xD000000000000062LL && v24 == 0x8000000000033190LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000062LL, 0x8000000000033190LL, v23, v24, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(v26);
    v27 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentFromMediaIntentTool(_:);
  }

  else if (v25 == 0xD000000000000059LL && v26 == 0x8000000000033200LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000059LL, 0x8000000000033200LL, v25, v26, 0LL) & 1) != 0
  }
         || v25 == 0xD000000000000053LL && v26 == 0x8000000000033260LL
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000053LL, 0x8000000000033260LL, v25, v26, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(v26);
    v27 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentTool(_:);
  }

  else
  {
    if ((v25 != 0xD00000000000005FLL || v26 != 0x80000000000332C0LL)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000005FLL, 0x80000000000332C0LL, v25, v26, 0LL) & 1) == 0)
    {
      if (v25 == 0xD000000000000033LL && v26 == 0x8000000000033320LL)
      {
        swift_bridgeObjectRelease(v26);
        v31 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.searchTool(_:);
      }

      else
      {
        char v32 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000033LL, 0x8000000000033320LL, v25, v26, 0LL);
        swift_bridgeObjectRelease(v26);
        v31 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.planner(_:);
        if ((v32 & 1) != 0) {
          v31 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.searchTool(_:);
        }
      }

      v30 = v34;
      goto LABEL_18;
    }

    swift_bridgeObjectRelease(v26);
    v27 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateKnowledgeResponseIntentTool(_:);
  }

  uint64_t v28 = *v27;
  uint64_t v29 = type metadata accessor for RequestSummary.PrescribedGenAITool(0LL);
  v30 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104LL))(v34, v28, v29);
  v31 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.genAI(_:);
LABEL_18:
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v30, *v31, v22);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v21, v30, v22);
}

uint64_t sub_4284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != enum case for MessagePayload.RequestPrescribedPlan.searchTool(_:))
  {
    if (v8 != enum case for MessagePayload.RequestPrescribedPlan.lowConfidenceKnowledgeTool(_:))
    {
      if (v8 == enum case for MessagePayload.RequestPrescribedPlan.textTool(_:)) {
        goto LABEL_9;
      }
      if (v8 == enum case for MessagePayload.RequestPrescribedPlan.convertTool(_:))
      {
        uint64_t v10 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentFromMediaIntentTool(_:);
        goto LABEL_10;
      }

      if (v8 == enum case for MessagePayload.RequestPrescribedPlan.displayTool(_:))
      {
LABEL_9:
        uint64_t v10 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentTool(_:);
        goto LABEL_10;
      }

      if (v8 != enum case for MessagePayload.RequestPrescribedPlan.knowledgeTool(_:))
      {
        uint64_t v9 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.planner(_:);
        goto LABEL_11;
      }
    }

    uint64_t v10 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateKnowledgeResponseIntentTool(_:);
LABEL_10:
    uint64_t v11 = *v10;
    uint64_t v12 = type metadata accessor for RequestSummary.PrescribedGenAITool(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104LL))(a2, v11, v12);
    uint64_t v9 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.genAI(_:);
    goto LABEL_11;
  }

  uint64_t v9 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.searchTool(_:);
LABEL_11:
  uint64_t v13 = *v9;
  uint64_t v14 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104LL))(a2, v13, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_4424()
{
  unint64_t result = qword_3D0B0;
  if (!qword_3D0B0)
  {
    uint64_t v1 = type metadata accessor for StatementOutcome(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for StatementOutcome, v1);
    atomic_store(result, (unint64_t *)&qword_3D0B0);
  }

  return result;
}

void sub_446C()
{
  qword_3E300 = 0x776F6C464649LL;
  *(void *)algn_3E308 = 0xE600000000000000LL;
}

uint64_t sub_448C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_454C(v0, qword_3E310);
  sub_458C(v0, (uint64_t)qword_3E310);
  sub_45A4();
  if (qword_3CF30 != -1) {
    swift_once(&qword_3CF30, sub_446C);
  }
  uint64_t v1 = qword_3E300;
  uint64_t v2 = *(void *)algn_3E308;
  swift_bridgeObjectRetain(*(void *)algn_3E308);
  uint64_t v3 = OS_os_log.init(subsystem:category:)(0xD000000000000021LL, 0x8000000000033360LL, v1, v2);
  return Logger.init(_:)(v3);
}

uint64_t *sub_454C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_458C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_45A4()
{
  unint64_t result = qword_3D0B8;
  if (!qword_3D0B8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_3D0B8);
  }

  return result;
}

uint64_t sub_45E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_466C( a1,  a2,  a3,  (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.TextTool,  (void (*)(uint64_t, uint64_t, void, __n128))&MessagePayload.RequestPrescribedPlan.TextTool.init(query:isExplicit:),  (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.textTool(_:),  a4);
}

uint64_t sub_45FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_466C( a1,  a2,  a3,  (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.ConvertTool,  (void (*)(uint64_t, uint64_t, void, __n128))&MessagePayload.RequestPrescribedPlan.ConvertTool.init(query:isExplicit:),  (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.convertTool(_:),  a4);
}

uint64_t sub_4618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_466C( a1,  a2,  a3,  (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.DisplayTool,  (void (*)(uint64_t, uint64_t, void, __n128))&MessagePayload.RequestPrescribedPlan.DisplayTool.init(query:isExplicit:),  (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.displayTool(_:),  a4);
}

uint64_t sub_4634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_466C( a1,  a2,  a3,  (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.KnowledgeTool,  (void (*)(uint64_t, uint64_t, void, __n128))&MessagePayload.RequestPrescribedPlan.KnowledgeTool.init(query:isExplicit:),  (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.knowledgeTool(_:),  a4);
}

uint64_t sub_4650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_466C( a1,  a2,  a3,  (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.SearchTool,  (void (*)(uint64_t, uint64_t, void, __n128))&MessagePayload.RequestPrescribedPlan.SearchTool.init(query:isLowConfidenceKnowledge:),  (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.searchTool(_:),  a4);
}

uint64_t sub_466C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t (*a4)(void)@<X3>, void (*a5)(uint64_t, uint64_t, void, __n128)@<X4>, unsigned int *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v36 = a5;
  v37 = a6;
  unsigned int v35 = a3;
  uint64_t v34 = a1;
  uint64_t v40 = a7;
  uint64_t v9 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v9);
  v39 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v11);
  v38 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v16 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = a4(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v33 - v25;
  __n128 v27 = swift_bridgeObjectRetain(a2);
  v36(v34, a2, v35, v27);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v22, v26, v23);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, *v37, v19);
  MessagePayload.RequestContent.TextContent.init(text:)(0LL, 0xE000000000000000LL);
  (*(void (**)(char *, void, uint64_t))(v16 + 104))( v18,  enum case for MessagePayload.RequestContent.text(_:),  v33);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v15, v22, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v15, 0LL, 1LL, v19);
  uint64_t v28 = type metadata accessor for UUID(0LL);
  uint64_t v29 = v38;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56LL))(v38, 1LL, 1LL, v28);
  uint64_t v30 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
  v31 = v39;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56LL))(v39, 1LL, 1LL, v30);
  MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v18,  0LL,  0LL,  v15,  v29,  v31);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v26, v23);
}

uint64_t sub_494C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_498C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v123 = a2;
  uint64_t v3 = type metadata accessor for Input(0LL);
  uint64_t v125 = *(void *)(v3 - 8);
  uint64_t v126 = v3;
  __chkstk_darwin(v3);
  uint64_t v119 = (uint64_t)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v5);
  v110 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v7);
  v109 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v9);
  v108 = (char *)&v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v106 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  v107 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for AjaxMetadata(0LL);
  uint64_t v112 = *(void *)(v12 - 8);
  uint64_t v113 = v12;
  __chkstk_darwin(v12);
  v111 = (char *)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v116 = type metadata accessor for NLRoutingDecisionMessage.RoutingDecision(0LL);
  uint64_t v114 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  v115 = (uint64_t *)((char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = type metadata accessor for NLRouterParse.InputCandidate(0LL);
  uint64_t v117 = *(void *)(v15 - 8);
  uint64_t v118 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (uint64_t *)((char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v18 = type metadata accessor for Parse(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v105 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v122 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v120 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  v121 = (char *)&v105 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_494C(&qword_3D0D8);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v105 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for MessagePayload.Request(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1998C((uint64_t)v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1LL, v26) == 1)
  {
    uint64_t v30 = sub_5540((uint64_t)v25);
    Input.parse.getter(v30);
    uint64_t v31 = a1;
    if ((*(unsigned int (**)(char *, uint64_t))(v19 + 88))(v21, v18) == enum case for Parse.nlRouter(_:))
    {
      (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
      uint64_t v33 = v120;
      char v32 = v121;
      uint64_t v34 = v21;
      uint64_t v35 = v122;
      uint64_t v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v120 + 32))(v121, v34, v122);
      NLRouterParse.input.getter(v36);
      uint64_t v38 = v117;
      uint64_t v37 = v118;
      if ((*(unsigned int (**)(uint64_t *, uint64_t))(v117 + 88))(v17, v118) != enum case for NLRouterParse.InputCandidate.text(_:))
      {
        (*(void (**)(uint64_t *, uint64_t))(v38 + 8))(v17, v37);
        goto LABEL_18;
      }

      uint64_t v39 = (*(uint64_t (**)(uint64_t *, uint64_t))(v38 + 96))(v17, v37);
      uint64_t v40 = *v17;
      uint64_t v41 = v17[1];
      v42 = v115;
      NLRouterParse.nlRoutingDecision.getter(v39);
      uint64_t v43 = v114;
      uint64_t v44 = v116;
      int v45 = (*(uint64_t (**)(uint64_t *, uint64_t))(v114 + 88))(v42, v116);
      if (v45 == enum case for NLRoutingDecisionMessage.RoutingDecision.siriXRewrite(_:)
        || v45 == enum case for NLRoutingDecisionMessage.RoutingDecision.queryRewrite(_:))
      {
        swift_bridgeObjectRelease(v41);
        (*(void (**)(uint64_t *, uint64_t))(v43 + 96))(v42, v44);
        uint64_t v41 = *v42;
LABEL_7:
        swift_bridgeObjectRelease(v41);
LABEL_18:
        uint64_t v69 = type metadata accessor for IFFlowError(0LL);
        uint64_t v70 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
        swift_allocError(v69, v70, 0LL, 0LL);
        uint64_t v72 = v71;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v125 + 16))(v71, v31, v126);
        uint64_t v73 = swift_storeEnumTagMultiPayload(v72, v69, 3LL);
        swift_willThrow(v73);
        return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v32, v35);
      }

      if (v45 == enum case for NLRoutingDecisionMessage.RoutingDecision.ajax(_:))
      {
        (*(void (**)(uint64_t *, uint64_t))(v43 + 96))(v42, v44);
        uint64_t v80 = (uint64_t)v111;
        uint64_t v79 = v112;
        uint64_t v81 = v113;
        (*(void (**)(char *, uint64_t *, uint64_t))(v112 + 32))(v111, v42, v113);
        sub_5580(v80, v40, v41, v123);
        swift_bridgeObjectRelease(v41);
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v80, v81);
        return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v32, v35);
      }

      uint64_t v119 = v40;
      if (v45 == enum case for NLRoutingDecisionMessage.RoutingDecision.siriXFallback(_:)) {
        goto LABEL_7;
      }
      if (v45 == enum case for NLRoutingDecisionMessage.RoutingDecision.planner(_:))
      {
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v82 = type metadata accessor for Logger(0LL);
        uint64_t v83 = sub_458C(v82, (uint64_t)qword_3E310);
        v84 = (os_log_s *)Logger.logObject.getter(v83);
        os_log_type_t v85 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v84, v85))
        {
          v86 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)v86 = 0;
          _os_log_impl( &dword_0,  v84,  v85,  "IFFlow: #PrescribedPlanDecision no prescribed plan, falling back on planner",  v86,  2u);
          swift_slowDealloc(v86, -1LL, -1LL);
        }

        swift_bridgeObjectRetain(v41);
        v87 = v107;
        MessagePayload.RequestContent.TextContent.init(text:)(v119, v41);
        (*(void (**)(char *, void, uint64_t))(v105 + 104))( v87,  enum case for MessagePayload.RequestContent.text(_:),  v106);
        uint64_t v88 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
        v89 = v108;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56LL))(v108, 1LL, 1LL, v88);
        uint64_t v90 = type metadata accessor for UUID(0LL);
        v91 = v109;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56LL))(v109, 1LL, 1LL, v90);
        uint64_t v92 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
        v93 = v110;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56LL))(v110, 1LL, 1LL, v92);
        MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v87,  0LL,  0LL,  v89,  v91,  v93);
LABEL_37:
        swift_bridgeObjectRelease(v41);
        return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v32, v35);
      }

      if (v45 == enum case for NLRoutingDecisionMessage.RoutingDecision.search(_:))
      {
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v94 = type metadata accessor for Logger(0LL);
        uint64_t v95 = sub_458C(v94, (uint64_t)qword_3E310);
        v96 = (os_log_s *)Logger.logObject.getter(v95);
        os_log_type_t v97 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v96, v97))
        {
          v98 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)v98 = 0;
          _os_log_impl(&dword_0, v96, v97, "IFFlow: #PrescribedPlanDecision running the searchTool", v98, 2u);
          swift_slowDealloc(v98, -1LL, -1LL);
        }

        sub_4650(v119, v41, 0, v123);
        goto LABEL_37;
      }

      swift_bridgeObjectRelease(v41);
      uint64_t v99 = type metadata accessor for IFFlowError(0LL);
      uint64_t v100 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
      swift_allocError(v99, v100, 0LL, 0LL);
      uint64_t v101 = v43;
      uint64_t v103 = v102;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v125 + 16))(v102, v31, v126);
      uint64_t v104 = swift_storeEnumTagMultiPayload(v103, v99, 3LL);
      swift_willThrow(v104);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v35);
      return (*(uint64_t (**)(uint64_t *, uint64_t))(v101 + 8))(v42, v116);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      uint64_t v53 = v126;
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v54 = type metadata accessor for Logger(0LL);
      sub_458C(v54, (uint64_t)qword_3E310);
      uint64_t v55 = v125;
      v56 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v125 + 16);
      uint64_t v57 = v119;
      uint64_t v58 = v56(v119, v31, v53);
      v59 = (os_log_s *)Logger.logObject.getter(v58);
      os_log_type_t v60 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc(12LL, -1LL);
        uint64_t v124 = v31;
        v62 = (uint8_t *)v61;
        uint64_t v63 = swift_slowAlloc(32LL, -1LL);
        uint64_t v129 = v63;
        *(_DWORD *)v62 = 136315138;
        uint64_t v64 = sub_5E50( &qword_3D0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
        uint64_t v65 = dispatch thunk of CustomStringConvertible.description.getter(v126, v64);
        unint64_t v67 = v66;
        uint64_t v127 = sub_12A3C(v65, v66, &v129);
        uint64_t v53 = v126;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
        swift_bridgeObjectRelease(v67);
        (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v57, v53);
        _os_log_impl(&dword_0, v59, v60, "IFFlow not accepting input. Unsupported parse type received: %s", v62, 0xCu);
        swift_arrayDestroy(v63, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v63, -1LL, -1LL);
        v68 = v62;
        uint64_t v31 = v124;
        swift_slowDealloc(v68, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v57, v53);
      }

      uint64_t v74 = type metadata accessor for IFFlowError(0LL);
      uint64_t v75 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
      swift_allocError(v74, v75, 0LL, 0LL);
      uint64_t v77 = v76;
      v56(v76, v31, v53);
      uint64_t v78 = swift_storeEnumTagMultiPayload(v77, v74, 3LL);
      return swift_willThrow(v78);
    }
  }

  else
  {
    v46 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v46(v29, v25, v26);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v47 = type metadata accessor for Logger(0LL);
    uint64_t v48 = sub_458C(v47, (uint64_t)qword_3E310);
    v49 = (os_log_s *)Logger.logObject.getter(v48);
    os_log_type_t v50 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_0, v49, v50, "IFFlow valid directInvocation detected.", v51, 2u);
      swift_slowDealloc(v51, -1LL, -1LL);
    }

    return ((uint64_t (*)(uint64_t, char *, uint64_t))v46)(v123, v29, v26);
  }

uint64_t sub_5540(uint64_t a1)
{
  uint64_t v2 = sub_494C(&qword_3D0D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_5580@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v99 = a4;
  uint64_t v101 = a2;
  uint64_t v102 = a3;
  uint64_t v5 = type metadata accessor for PrescribedAjaxTool(0LL);
  uint64_t v104 = *(void *)(v5 - 8);
  uint64_t v105 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v100 = (char *)v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v103 = (char *)v89 - v8;
  uint64_t v9 = type metadata accessor for AjaxMetadata(0LL);
  uint64_t v96 = *(void *)(v9 - 8);
  uint64_t v97 = v9;
  __chkstk_darwin(v9);
  uint64_t v95 = (char *)v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for AjaxMetadata.AjaxQuery.ImplicitQuery(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v94 = (os_log_s *)type metadata accessor for AjaxMetadata.AjaxQuery.ExplicitQuery(0LL);
  uint64_t v15 = *((void *)v94 - 1);
  __chkstk_darwin(v94);
  uint64_t v17 = (char *)v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for AjaxMetadata.AjaxQuery(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  v93 = (char *)v89 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)v89 - v23;
  uint64_t v106 = a1;
  AjaxMetadata.query.getter(v22);
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v24, v18);
  LODWORD(v98) = v25 != enum case for AjaxMetadata.AjaxQuery.implicit(_:);
  if (v25 == enum case for AjaxMetadata.AjaxQuery.implicit(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v24, v18);
    uint64_t v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(v14, v24, v11);
    uint64_t v28 = AjaxMetadata.AjaxQuery.ImplicitQuery.rewrittenUtterance.getter(v32);
    uint64_t v30 = v33;
    uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

  else
  {
    if (v25 != enum case for AjaxMetadata.AjaxQuery.explicit(_:))
    {
      uint64_t v98 = v18;
      uint64_t v35 = v102;
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v40 = type metadata accessor for Logger(0LL);
      sub_458C(v40, (uint64_t)qword_3E310);
      v42 = v95;
      uint64_t v41 = v96;
      uint64_t v43 = v97;
      uint64_t v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v96 + 16))(v95, v106, v97);
      int v45 = (os_log_s *)Logger.logObject.getter(v44);
      os_log_type_t v46 = static os_log_type_t.error.getter();
      int v47 = v46;
      BOOL v48 = os_log_type_enabled(v45, v46);
      uint64_t v36 = v104;
      if (v48)
      {
        uint64_t v94 = v45;
        uint64_t v49 = swift_slowAlloc(12LL, -1LL);
        int v91 = v47;
        os_log_type_t v50 = (uint8_t *)v49;
        uint64_t v51 = swift_slowAlloc(32LL, -1LL);
        uint64_t v92 = v51;
        uint64_t v109 = v51;
        *(_DWORD *)os_log_type_t v50 = 136315138;
        v89[1] = v50 + 4;
        uint64_t v90 = v50;
        v52 = v93;
        AjaxMetadata.query.getter(v51);
        uint64_t v53 = v52;
        uint64_t v54 = v98;
        uint64_t v55 = String.init<A>(describing:)(v53, v98);
        unint64_t v57 = v56;
        uint64_t v107 = sub_12A3C(v55, v56, &v109);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108);
        swift_bridgeObjectRelease(v57);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v97);
        os_log_t v58 = v94;
        v59 = v90;
        _os_log_impl(&dword_0, v94, (os_log_type_t)v91, "Unhandled genAI query type: %s", v90, 0xCu);
        uint64_t v60 = v92;
        swift_arrayDestroy(v92, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v60, -1LL, -1LL);
        swift_slowDealloc(v59, -1LL, -1LL);

        uint64_t v37 = v100;
        uint64_t v38 = v101;
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);

        uint64_t v37 = v100;
        uint64_t v38 = v101;
        uint64_t v54 = v98;
      }

      (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v54);
      unsigned int v39 = 0;
      uint64_t v34 = v103;
      goto LABEL_13;
    }

    (*(void (**)(char *, uint64_t))(v19 + 96))(v24, v18);
    uint64_t v26 = v94;
    uint64_t v27 = (*(uint64_t (**)(char *, char *, os_log_s *))(v15 + 32))(v17, v24, v94);
    uint64_t v28 = AjaxMetadata.AjaxQuery.ExplicitQuery.rewrittenUtterance.getter(v27);
    uint64_t v30 = v29;
    uint64_t v31 = (*(uint64_t (**)(char *, os_log_s *))(v15 + 8))(v17, v26);
  }

  uint64_t v35 = v102;
  uint64_t v34 = v103;
  uint64_t v36 = v104;
  uint64_t v37 = v100;
  uint64_t v38 = v101;
  unsigned int v39 = v98;
  if (v30)
  {
    uint64_t v38 = v28;
    uint64_t v35 = v30;
    goto LABEL_14;
  }

LABEL_13:
  swift_bridgeObjectRetain(v35);
  uint64_t v31 = swift_bridgeObjectRelease(0LL);
LABEL_14:
  uint64_t v61 = v105;
  AjaxMetadata.prescribedAjaxTool.getter(v31);
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v37, v34, v61);
  int v62 = (*(uint64_t (**)(char *, uint64_t))(v36 + 88))(v37, v61);
  if (v62 == enum case for PrescribedAjaxTool.generateRichContentTool(_:))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v63 = type metadata accessor for Logger(0LL);
    uint64_t v64 = sub_458C(v63, (uint64_t)qword_3E310);
    uint64_t v65 = (os_log_s *)Logger.logObject.getter(v64);
    os_log_type_t v66 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v65, v66))
    {
      unint64_t v67 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v67 = 0;
      _os_log_impl(&dword_0, v65, v66, "IFFlow: #PrescribedPlanDecision running the generateRichContentTool", v67, 2u);
      swift_slowDealloc(v67, -1LL, -1LL);
    }

    sub_45E0(v38, v35, v39, v99);
LABEL_38:
    swift_bridgeObjectRelease(v35);
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v34, v61);
  }

  if (v62 == enum case for PrescribedAjaxTool.generateRichContentFromMediaIntentTool(_:))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v68 = type metadata accessor for Logger(0LL);
    uint64_t v69 = sub_458C(v68, (uint64_t)qword_3E310);
    uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
    os_log_type_t v71 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v72 = 0;
      _os_log_impl( &dword_0,  v70,  v71,  "IFFlow: #PrescribedPlanDecision running the generateRichContentFromMediaIntentTool",  v72,  2u);
      swift_slowDealloc(v72, -1LL, -1LL);
    }

    sub_45FC(v38, v35, v39, v99);
    goto LABEL_38;
  }

  if (v62 == enum case for PrescribedAjaxTool.generateImageIntentTool(_:))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v73 = type metadata accessor for Logger(0LL);
    uint64_t v74 = sub_458C(v73, (uint64_t)qword_3E310);
    uint64_t v75 = (os_log_s *)Logger.logObject.getter(v74);
    os_log_type_t v76 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v77 = 0;
      _os_log_impl(&dword_0, v75, v76, "IFFlow: #PrescribedPlanDecision running the generateImageIntentTool", v77, 2u);
      swift_slowDealloc(v77, -1LL, -1LL);
    }

    sub_4618(v38, v35, v39, v99);
    goto LABEL_38;
  }

  if (v62 == enum case for PrescribedAjaxTool.generateKnowledgeResponseIntentTool(_:))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v78 = type metadata accessor for Logger(0LL);
    uint64_t v79 = sub_458C(v78, (uint64_t)qword_3E310);
    uint64_t v80 = (os_log_s *)Logger.logObject.getter(v79);
    os_log_type_t v81 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v82 = 0;
      _os_log_impl( &dword_0,  v80,  v81,  "IFFlow: #PrescribedPlanDecision running the generateKnowledgeResponseIntentTool",  v82,  2u);
      swift_slowDealloc(v82, -1LL, -1LL);
    }

    sub_4634(v38, v35, v39, v99);
    goto LABEL_38;
  }

  swift_bridgeObjectRelease(v35);
  uint64_t v84 = type metadata accessor for IFFlowError(0LL);
  uint64_t v85 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
  swift_allocError(v84, v85, 0LL, 0LL);
  void *v86 = 0xD00000000000003ALL;
  v86[1] = 0x8000000000033390LL;
  uint64_t v87 = swift_storeEnumTagMultiPayload(v86, v84, 5LL);
  swift_willThrow(v87);
  uint64_t v88 = *(void (**)(char *, uint64_t))(v36 + 8);
  v88(v34, v61);
  return ((uint64_t (*)(char *, uint64_t))v88)(v37, v61);
}

    uint64_t result = sub_12CC4(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

    unint64_t v56 = v2[45];
    uint64_t v55 = v2[46];
    unint64_t v57 = v2[42];
    v59 = v2[38];
    os_log_t v58 = v2[39];
    uint64_t v60 = v2[37];
    int v62 = v2[33];
    uint64_t v61 = v2[34];
    uint64_t v63 = v2;
    uint64_t v64 = v2[30];
    uint64_t v65 = v63[27];
    v166 = v63[24];
    v169 = v63[23];
    v173 = v63[22];
    v177 = v63[19];
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v166);
    swift_task_dealloc(v169);
    swift_task_dealloc(v173);
    swift_task_dealloc(v177);
    return ((uint64_t (*)(void))v63[1])();
  }

  unint64_t v67 = v2[46];
  uint64_t v69 = v2[26];
  uint64_t v68 = v2[27];
  uint64_t v70 = v2[25];
  (*(void (**)(uint64_t, void))(v2[44] + 96LL))(v67, v2[43]);
  os_log_type_t v71 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v68, v67, v70);
  uint64_t v72 = CurrentRequest.executionRequestId.getter(v71);
  uint64_t v74 = v73;
  v2[47] = v73;
  uint64_t v75 = (void *)swift_task_alloc(dword_3DA14);
  v2[48] = v75;
  *uint64_t v75 = v2;
  v75[1] = sub_2BB44;
  os_log_type_t v76 = v2[27];
  uint64_t v77 = v2[16];
  uint64_t v78 = v2[13];
  uint64_t v79 = v2[14];
  uint64_t v80 = v2[11];
  os_log_type_t v81 = v2[12];
  uint64_t v82 = v2[10];
  v181[12] = v2[15];
  v181[13] = v77;
  return sub_2BCC4(v82, v80, v76, v81, v72, v74, v78, v79);
}

uint64_t sub_5E50(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_5E90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_10034() & 1) != 0)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_458C(v6, (uint64_t)qword_3E310);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( &dword_0,  v8,  v9,  "Input contains cancellation dialog act, returning .cancel() from actionForInput",  v10,  2u);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    return static ActionForInput.cancel()();
  }

  else
  {
    sub_103B8();
    if ((v12 & 1) != 0)
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v18 = type metadata accessor for Logger(0LL);
      sub_458C(v18, (uint64_t)qword_3E310);
      uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
      uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v23 = swift_slowAlloc(32LL, -1LL);
        uint64_t v30 = v23;
        *(_DWORD *)uint64_t v22 = 136315138;
        v28[1] = v22 + 4;
        uint64_t v24 = sub_5E50( &qword_3D0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
        uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter(v2, v24);
        unint64_t v27 = v26;
        uint64_t v29 = sub_12A3C(v25, v26, &v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);
        swift_bridgeObjectRelease(v27);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        _os_log_impl( &dword_0,  v20,  v21,  "Input does not appear to contain a disambiguation prompt response, returning ignore from actionForInput. Input: %s)",  v22,  0xCu);
        swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v23, -1LL, -1LL);
        swift_slowDealloc(v22, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }

      return static ActionForInput.ignore()();
    }

    else
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v13 = type metadata accessor for Logger(0LL);
      uint64_t v14 = sub_458C(v13, (uint64_t)qword_3E310);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( &dword_0,  v15,  v16,  "Input contains interoperable disambiguation response, returning handle",  v17,  2u);
        swift_slowDealloc(v17, -1LL, -1LL);
      }

      return static ActionForInput.handle()();
    }
  }

uint64_t sub_6254(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  return swift_task_switch(sub_6270, 0LL, 0LL);
}

uint64_t sub_6270()
{
  uint64_t result = sub_103B8();
  if ((v2 & 1) != 0)
  {
    uint64_t v5 = type metadata accessor for IFFlowError(0LL);
    uint64_t v6 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    swift_allocError(v5, v6, 0LL, 0LL);
    uint64_t v8 = v7;
    _StringGuts.grow(_:)(50LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v9 = type metadata accessor for Input(0LL);
    uint64_t v10 = sub_5E50( &qword_3D0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v9, v10);
    object = v11._object;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(object);
    *uint64_t v8 = 0xD000000000000030LL;
    v8[1] = 0x8000000000033420LL;
    uint64_t v13 = v8;
    uint64_t v14 = v5;
    goto LABEL_15;
  }

  uint64_t v3 = result;
  if ((result & 0x8000000000000000LL) == 0)
  {
    uint64_t v4 = result - 1;
    goto LABEL_6;
  }

  uint64_t v15 = *(void *)(v0[12] + 56LL);
  uint64_t v4 = v15 + result;
  if (!__OFADD__(v15, result))
  {
LABEL_6:
    v0[9] = v4;
    if ((v4 & 0x8000000000000000LL) == 0 && v4 < *(void *)(v0[12] + 56LL))
    {
      v0[2] = v4;
      static DisambiguationResult.chosenItem(_:)(v0 + 2, &type metadata for Int);
      os_log_type_t v16 = (uint64_t (*)(void))v0[1];
      return v16();
    }

    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v17 = v0 + 8;
    uint64_t v18 = v0[12];
    uint64_t v19 = type metadata accessor for Logger(0LL);
    sub_458C(v19, (uint64_t)qword_3E310);
    uint64_t v20 = swift_retain(v18);
    os_log_type_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = v0[12];
    if (v23)
    {
      uint64_t v25 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v25 = 134218240;
      swift_beginAccess(v0 + 9, v0 + 2, 0LL, 0LL);
      v0[5] = v0[9];
      uint64_t v17 = v0 + 8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 5, v0 + 6);
      *(_WORD *)(v25 + 12) = 2048;
      v0[5] = *(void *)(v24 + 56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 5, v0 + 6);
      swift_release(v24);
      _os_log_impl( &dword_0,  v21,  v22,  "Referenced list index (%ld) outside of choice range (count: %ld",  (uint8_t *)v25,  0x16u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      swift_release(v0[12]);
    }

    uint64_t v26 = type metadata accessor for IFFlowError(0LL);
    uint64_t v27 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    swift_allocError(v26, v27, 0LL, 0LL);
    uint64_t v29 = v28;
    _StringGuts.grow(_:)(90LL);
    v30._countAndFlagsBits = 0xD000000000000037LL;
    v30._object = (void *)0x8000000000033460LL;
    String.append(_:)(v30);
    swift_beginAccess(v0 + 9, v0 + 5, 0LL, 0LL);
    *uint64_t v17 = v0[9];
    v31._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    uint64_t v32 = v31._object;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(v32);
    v33._object = (void *)0x80000000000334A0LL;
    v33._countAndFlagsBits = 0xD00000000000001FLL;
    String.append(_:)(v33);
    *uint64_t v17 = v3;
    v34._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    uint64_t v35 = v34._object;
    String.append(_:)(v34);
    swift_bridgeObjectRelease(v35);
    *uint64_t v29 = 0LL;
    v29[1] = 0xE000000000000000LL;
    uint64_t v13 = v29;
    uint64_t v14 = v26;
LABEL_15:
    uint64_t v36 = swift_storeEnumTagMultiPayload(v13, v14, 4LL);
    swift_willThrow(v36);
    os_log_type_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }

  __break(1u);
  return result;
}

uint64_t sub_6698()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t type metadata accessor for DisambiguationStrategy()
{
  return objc_opt_self(&OBJC_CLASS____TtC12IFFlowPlugin22DisambiguationStrategy);
}

uint64_t sub_66E0(uint64_t a1)
{
  return sub_5E90(a1);
}

uint64_t sub_66F4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc(dword_3D1CC);
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_770C;
  v6[11] = a2;
  v6[12] = v2;
  v6[10] = a1;
  return swift_task_switch(sub_6270, 0LL, 0LL);
}

uint64_t sub_6764(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return swift_task_switch(sub_677C, 0LL, 0LL);
}

uint64_t sub_677C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_67B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to PromptForDisambiguationFlowStrategyAsync.makeRepromptOnEmptyParse(paginatedItems:)[1]);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_770C;
  return PromptForDisambiguationFlowStrategyAsync.makeRepromptOnEmptyParse(paginatedItems:)(a1, a2, v9, a4);
}

uint64_t sub_6830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to PromptForDisambiguationFlowStrategyAsync.makeRepromptOnLowConfidence(paginatedItems:)[1]);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_770C;
  return PromptForDisambiguationFlowStrategyAsync.makeRepromptOnLowConfidence(paginatedItems:)(a1, a2, v9, a4);
}

uint64_t sub_68AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PromptForDisambiguationFlowStrategyAsync.makeFlowCancelledResponse()[1]);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_6918;
  return PromptForDisambiguationFlowStrategyAsync.makeFlowCancelledResponse()(a1, v7, a3);
}

uint64_t sub_6918()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_6960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to PromptForDisambiguationFlowStrategyAsync.makeErrorResponse(_:)[1]);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_770C;
  return PromptForDisambiguationFlowStrategyAsync.makeErrorResponse(_:)(a1, a2, v9, a4);
}

uint64_t sub_69DC()
{
  return PromptForDisambiguationFlowStrategyAsync.pervasiveUseCaseDescription.getter(*v0);
}

uint64_t sub_69E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v131 = a3;
  uint64_t v122 = a2;
  v137 = a4;
  uint64_t v6 = *v4;
  uint64_t v116 = type metadata accessor for SystemResponse(0LL);
  uint64_t v115 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  uint64_t v114 = (char *)&v112 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v8);
  uint64_t v127 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v10);
  uint64_t v126 = (char *)&v112 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v123 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v121 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  uint64_t v124 = (char *)&v112 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v130 = type metadata accessor for MessagePayload(0LL);
  uint64_t v128 = *(void *)(v130 - 8);
  uint64_t v13 = __chkstk_darwin(v130);
  uint64_t v129 = (char *)&v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v125 = (char *)&v112 - v15;
  uint64_t v16 = sub_494C(&qword_3D1D0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v112 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for StatementID(0LL);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v20 = (char *)&v112 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v118 = type metadata accessor for SystemPromptResolution.UserAction(0LL);
  uint64_t v117 = *(void *)(v118 - 8);
  __chkstk_darwin(v118);
  os_log_type_t v22 = (uint64_t *)((char *)&v112 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v23 = type metadata accessor for UUID(0LL);
  uint64_t v132 = *(void *)(v23 - 8);
  uint64_t v133 = v23;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v112 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v112 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = type metadata accessor for SystemPromptResolution(0LL);
  uint64_t v135 = *(void *)(v29 - 8);
  uint64_t v136 = v29;
  __chkstk_darwin(v29);
  v134 = (char *)&v112 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = sub_494C(&qword_3D1D8);
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  Swift::String v34 = (char *)&v112 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  uint64_t v113 = a1;
  v35(v34, a1, v31);
  int v36 = (*(uint64_t (**)(char *, uint64_t))(v32 + 88))(v34, v31);
  if (v36 == enum case for PromptResult.answered<A>(_:))
  {
    uint64_t v113 = v6;
    (*(void (**)(char *, uint64_t))(v32 + 96))(v34, v31);
    uint64_t v37 = *(void *)v34;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    uint64_t v39 = sub_458C(v38, (uint64_t)qword_3E310);
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
    os_log_type_t v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "IFFlow Disambiguation item selected. Forwarding to IF", v42, 2u);
      swift_slowDealloc(v42, -1LL, -1LL);
    }

    uint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v132 + 56);
    uint64_t v44 = v43(v28, 1LL, 1LL, v133);
    SessionServerMessage.eventId.getter(v44);
    *os_log_type_t v22 = v37;
    (*(void (**)(uint64_t *, void, uint64_t))(v117 + 104))( v22,  enum case for SystemPromptResolution.UserAction.disambiguationIndexSelected(_:),  v118);
    (*(void (**)(char *, uint64_t, uint64_t))(v119 + 16))(v20, v122, v120);
    uint64_t v45 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
    uint64_t v46 = type metadata accessor for SystemPromptResolution.ResolutionInput(0LL);
    uint64_t v47 = *(void *)(v46 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 104))(v18, v45, v46);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v18, 0LL, 1LL, v46);
    BOOL v48 = v134;
    SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)( v28,  v25,  v22,  v20,  v18);
    uint64_t v49 = sub_494C(&qword_3D1E8);
    os_log_type_t v50 = v137;
    uint64_t v122 = (uint64_t)v137 + *(int *)(v49 + 48);
    SessionServerMessage.sessionId.getter();
    uint64_t v51 = v124;
    (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v124, v48, v136);
    (*(void (**)(char *, void, uint64_t))(v121 + 104))( v51,  enum case for MessagePayload.RequestContent.promptResolution(_:),  v123);
    uint64_t v52 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
    uint64_t v53 = v126;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56LL))(v126, 1LL, 1LL, v52);
    uint64_t v54 = v133;
    v43(v28, 1LL, 1LL, v133);
    uint64_t v55 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
    unint64_t v56 = v127;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56LL))(v127, 1LL, 1LL, v55);
    uint64_t v57 = (uint64_t)v125;
    MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v51,  0LL,  0LL,  v53,  v28,  v56);
    uint64_t v58 = v128;
    uint64_t v59 = v130;
    (*(void (**)(uint64_t, void, uint64_t))(v128 + 104))(v57, enum case for MessagePayload.request(_:), v130);
    sub_19E2C((uint64_t)v25, v57);
    uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    v60(v57, v59);
    uint64_t v61 = (*(uint64_t (**)(char *, uint64_t))(v132 + 8))(v25, v54);
    int v62 = v129;
    SessionServerMessage.payload.getter(v61);
    if ((*(unsigned int (**)(char *, uint64_t))(v58 + 88))(v62, v59) == enum case for MessagePayload.systemResponse(_:))
    {
      (*(void (**)(char *, uint64_t))(v58 + 96))(v62, v59);
      uint64_t v63 = v115;
      uint64_t v64 = (uint64_t)v114;
      uint64_t v65 = v116;
      (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v114, v62, v116);
      uint64_t v66 = v122;
      sub_3E74(v64, v122);
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v65);
      uint64_t v67 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56LL))(v66, 0LL, 1LL, v67);
    }

    else
    {
      v60((uint64_t)v62, v59);
      uint64_t v73 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56LL))(v122, 1LL, 1LL, v73);
    }

    uint64_t v74 = v113;
    (*(void (**)(char *, uint64_t))(v135 + 8))(v134, v136);
    uint64_t v71 = type metadata accessor for IFFlow.State(0LL, *(void *)(v74 + 80), *(void *)(v74 + 88), v75);
    uint64_t v72 = v50;
    uint64_t v76 = 0LL;
    return swift_storeEnumTagMultiPayload(v72, v71, v76);
  }

  if (v36 == enum case for PromptResult.error<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v32 + 96))(v34, v31);
    char v68 = v34[8];
    uint64_t v69 = v137;
    uint64_t *v137 = *(void *)v34;
    *((_BYTE *)v69 + 8) = (v68 & 1) == 0;
    uint64_t v71 = type metadata accessor for IFFlow.State(0LL, *(void *)(v6 + 80), *(void *)(v6 + 88), v70);
    uint64_t v72 = v69;
LABEL_24:
    uint64_t v76 = 2LL;
    return swift_storeEnumTagMultiPayload(v72, v71, v76);
  }

  if (v36 == enum case for PromptResult.cancelled<A>(_:))
  {
    uint64_t v77 = v6;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v78 = type metadata accessor for Logger(0LL);
    uint64_t v79 = sub_458C(v78, (uint64_t)qword_3E310);
    uint64_t v80 = (os_log_s *)Logger.logObject.getter(v79);
    os_log_type_t v81 = static os_log_type_t.debug.getter();
    BOOL v82 = os_log_type_enabled(v80, v81);
    uint64_t v83 = v137;
    if (v82)
    {
      uint64_t v84 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v84 = 0;
      _os_log_impl(&dword_0, v80, v81, "Exiting IFFlow, received userCancelled", v84, 2u);
      swift_slowDealloc(v84, -1LL, -1LL);
    }

    *uint64_t v83 = 0LL;
    *((_BYTE *)v83 + 8) = 0;
    uint64_t v71 = type metadata accessor for IFFlow.State(0LL, *(void *)(v77 + 80), *(void *)(v77 + 88), v85);
    uint64_t v72 = v83;
    uint64_t v76 = 3LL;
    return swift_storeEnumTagMultiPayload(v72, v71, v76);
  }

  if (v36 == enum case for PromptResult.unanswered<A>(_:))
  {
    uint64_t v86 = v6;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v87 = type metadata accessor for Logger(0LL);
    uint64_t v88 = sub_458C(v87, (uint64_t)qword_3E310);
    v89 = (os_log_s *)Logger.logObject.getter(v88);
    os_log_type_t v90 = static os_log_type_t.debug.getter();
    BOOL v91 = os_log_type_enabled(v89, v90);
    uint64_t v92 = v137;
    if (v91)
    {
      v93 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v93 = 0;
      _os_log_impl(&dword_0, v89, v90, "Exiting IFFlow, received .unaswered from PromptForDisambiguation", v93, 2u);
      swift_slowDealloc(v93, -1LL, -1LL);
    }

    uint64_t v94 = type metadata accessor for IFFlowError(0LL);
    uint64_t v95 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    uint64_t v96 = swift_allocError(v94, v95, 0LL, 0LL);
    *uint64_t v97 = 0;
    swift_storeEnumTagMultiPayload(v97, v94, 6LL);
    *uint64_t v92 = v96;
    *((_BYTE *)v92 + 8) = 1;
    uint64_t v71 = type metadata accessor for IFFlow.State(0LL, *(void *)(v86 + 80), *(void *)(v86 + 88), v98);
    uint64_t v72 = v92;
    goto LABEL_24;
  }

  uint64_t v100 = type metadata accessor for IFFlowError(0LL);
  uint64_t v101 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
  uint64_t v102 = swift_allocError(v100, v101, 0LL, 0LL);
  uint64_t v104 = v103;
  unint64_t v138 = 0LL;
  unint64_t v139 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(35LL);
  swift_bridgeObjectRelease(v139);
  unint64_t v138 = 0xD000000000000021LL;
  unint64_t v139 = 0x8000000000033540LL;
  unint64_t v105 = sub_765C();
  v106._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v31, v105);
  object = v106._object;
  String.append(_:)(v106);
  swift_bridgeObjectRelease(object);
  unint64_t v108 = v139;
  *uint64_t v104 = v138;
  v104[1] = v108;
  swift_storeEnumTagMultiPayload(v104, v100, 4LL);
  uint64_t v109 = v137;
  uint64_t *v137 = v102;
  *((_BYTE *)v109 + 8) = 1;
  uint64_t v111 = type metadata accessor for IFFlow.State(0LL, *(void *)(v6 + 80), *(void *)(v6 + 88), v110);
  swift_storeEnumTagMultiPayload(v109, v111, 2LL);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v34, v31);
}

uint64_t sub_754C(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_755C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_7590(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_75A0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v4 = a2 - (void)__src;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (!__dst)
  {
    if (v4 <= 0) {
      return __src;
    }
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawBufferPointer.copyMemory source has too many elements",  69LL,  2LL,  "Swift/UnsafeRawBufferPointer.swift",  34LL,  2,  487LL,  0);
    __break(1u);
    return __src;
  }

  if (__src) {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_7634@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_765C()
{
  unint64_t result = qword_3D1E0;
  if (!qword_3D1E0)
  {
    uint64_t v1 = sub_76A8(&qword_3D1D8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for PromptResult<A>, v1);
    atomic_store(result, (unint64_t *)&qword_3D1E0);
  }

  return result;
}

uint64_t sub_76A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_76EC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_7710()
{
  uint64_t v1 = sub_494C(&qword_3D200);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v47 - v5;
  id v7 = [objc_allocWithZone(DialogExecutionResult) init];
  id v8 = [objc_allocWithZone(DialogElement) init];
  uint64_t v49 = v0;
  ResponseOutput.printedDialogOutput.getter();
  uint64_t v9 = type metadata accessor for ResponseOutput.DialogType(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v6, 1LL, v9) == 1)
  {
    sub_8DCC((uint64_t)v6, &qword_3D200);
  }

  else
  {
    sub_7BA0();
    unint64_t v13 = v12;
    uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    if (v13) {
      goto LABEL_5;
    }
  }

  uint64_t v14 = swift_bridgeObjectRelease(0LL);
  unint64_t v13 = 0xE000000000000000LL;
LABEL_5:
  ResponseOutput.spokenDialogOutput.getter(v14);
  if (v11(v4, 1LL, v9) == 1)
  {
    sub_8DCC((uint64_t)v4, &qword_3D200);
  }

  else
  {
    sub_7BA0();
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v4, v9);
    if (v16) {
      goto LABEL_9;
    }
  }

  swift_bridgeObjectRelease(0LL);
  unint64_t v16 = 0xE000000000000000LL;
LABEL_9:
  NSString v17 = String._bridgeToObjectiveC()();
  [v8 setFullPrint:v17];

  NSString v18 = String._bridgeToObjectiveC()();
  [v8 setFullSpeak:v18];

  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  [v8 setSupportingPrint:v19];

  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  [v8 setSupportingSpeak:v20];

  uint64_t v21 = sub_494C(&qword_3D208);
  uint64_t v22 = swift_allocObject(v21, 40LL, 7LL);
  *(_OWORD *)(v22 + 16) = xmmword_312F0;
  *(void *)(v22 + 32) = v8;
  uint64_t v50 = v22;
  specialized Array._endMutation()();
  uint64_t v23 = v50;
  sub_8D48();
  id v47 = v8;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  [v7 setDialog:isa];

  ((void (*)(void))ResponseOutput.dialogIdentifier.getter)();
  if (v25) {
    unint64_t v26 = v25;
  }
  else {
    unint64_t v26 = 0xE000000000000000LL;
  }
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v26);
  [v7 setCatId:v27];

  id v28 = [v7 dialog];
  uint64_t v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v48 = v7;
  uint64_t v30 = *(void *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(v29);
  for (; v30; uint64_t v30 = _CocoaArrayWrapper.endIndex.getter(v45))
  {
    uint64_t v31 = 4LL;
    uint64_t v32 = 0LL;
    if ((v29 & 0xC000000000000001LL) != 0)
    {
LABEL_15:
      id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v32, v29);
      goto LABEL_17;
    }

    while (1)
    {
      id v33 = *(id *)(v29 + 8 * v31);
LABEL_17:
      Swift::String v34 = v33;
      uint64_t v35 = v32 + 1;
      if (__OFADD__(v32, 1LL)) {
        break;
      }
      id v36 = [v33 id];
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
      unint64_t v39 = v38;

      uint64_t v40 = swift_bridgeObjectRelease(v39);
      uint64_t v41 = HIBYTE(v39) & 0xF;
      if ((v39 & 0x2000000000000000LL) == 0) {
        uint64_t v41 = v37 & 0xFFFFFFFFFFFFLL;
      }
      if (v41 || (ResponseOutput.dialogIdentifier.getter(v40), !v42))
      {

        if (v35 == v30) {
          goto LABEL_32;
        }
      }

      else
      {
        uint64_t v43 = v42;
        NSString v44 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v43);
        [v34 setId:v44];

        if (v35 == v30) {
          goto LABEL_32;
        }
      }

      uint64_t v32 = ++v31 - 4;
      if ((v29 & 0xC000000000000001LL) != 0) {
        goto LABEL_15;
      }
    }

    __break(1u);
LABEL_28:
    if (v29 < 0) {
      uint64_t v45 = v29;
    }
    else {
      uint64_t v45 = v29 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v29);
  }

LABEL_32:
  swift_bridgeObjectRelease_n(v29, 2LL);
  return v48;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_7BA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ResponseOutput.DialogType(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for ResponseOutput.DialogType.staticText(_:)
    || v6 == enum case for ResponseOutput.DialogType.catDialog(_:)
    || v6 == enum case for ResponseOutput.DialogType.sonic(_:)
    || v6 == enum case for ResponseOutput.DialogType.generated(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    return *(void *)v5;
  }

  else
  {
    if (v6 != enum case for ResponseOutput.DialogType.unableToGenerate(_:)
      && v6 != enum case for ResponseOutput.DialogType.suppressed(_:))
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    return 0LL;
  }

uint64_t sub_7CC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = type metadata accessor for RGPluginModel(0LL);
  uint64_t v2 = *(void *)(v43 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v42 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ResponseOutput.VisualOutput.SystemSnippetOutputPayload(0LL);
  uint64_t v38 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v47 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = ResponseOutput.visualOutput.getter(v11);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(v14 + 16);
  if (v16)
  {
    uint64_t v41 = v2;
    uint64_t v36 = v14;
    uint64_t v37 = a1;
    unint64_t v17 = v14 + ((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    int v46 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
    int v39 = enum case for RGPluginModel.archivedView(_:);
    NSString v18 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v44 = *(void *)(v8 + 72);
    uint64_t v45 = v18;
    uint64_t v19 = v38;
    uint64_t v40 = v13;
    while (1)
    {
      uint64_t v22 = v45;
      v45(v13, (char *)v17, v7);
      uint64_t v23 = v47;
      v22(v47, v13, v7);
      int v24 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v23, v7);
      if (v24 == v46)
      {
        (*(void (**)(char *, uint64_t))(v8 + 96))(v23, v7);
        uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v6, v23, v4);
        unint64_t v26 = v42;
        ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter(v25);
        uint64_t v27 = v8;
        uint64_t v28 = v4;
        uint64_t v29 = v26;
        uint64_t v30 = v41;
        uint64_t v31 = v43;
        int v32 = (*(uint64_t (**)(char *, uint64_t))(v41 + 88))(v29, v43);
        if (v32 == v39)
        {
          (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
          (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v28);
          a1 = v37;
          (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v37, v40, v7);
          uint64_t v34 = 0LL;
          uint64_t v8 = v27;
          uint64_t v15 = v36;
          goto LABEL_11;
        }

        (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v28);
        (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
        id v33 = *(void (**)(char *, uint64_t))(v27 + 8);
        uint64_t v4 = v28;
        uint64_t v8 = v27;
        unint64_t v13 = v40;
        v33(v40, v7);
      }

      else
      {
        NSString v20 = v23;
        uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
        v21(v20, v7);
        v21(v13, v7);
      }

      v17 += v44;
      if (!--v16)
      {
        uint64_t v34 = 1LL;
        uint64_t v15 = v36;
        a1 = v37;
        goto LABEL_11;
      }
    }
  }

  uint64_t v34 = 1LL;
LABEL_11:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v34, 1LL, v7);
  return swift_bridgeObjectRelease(v15);
}

uint64_t sub_7FB8()
{
  uint64_t v0 = type metadata accessor for ResponseOutput.VisualOutput.PluginSnippetOutputPayload(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = sub_494C(&qword_3D218);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v39 = (uint64_t)&v33 - v18;
  uint64_t v19 = ResponseOutput.visualOutput.getter(v17);
  uint64_t v20 = *(void *)(v19 + 16);
  uint64_t v38 = v19;
  if (v20)
  {
    id v33 = v16;
    uint64_t v34 = v3;
    uint64_t v35 = v1;
    uint64_t v36 = v0;
    unint64_t v21 = v19 + ((*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    int v22 = enum case for ResponseOutput.VisualOutput.pluginSnippet(_:);
    uint64_t v40 = *(void *)(v5 + 72);
    uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    while (1)
    {
      v23(v12, v21, v4);
      v23(v10, (unint64_t)v12, v4);
      int v24 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v10, v4);
      uint64_t v25 = v5;
      unint64_t v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v10, v4);
      if (v24 == v22) {
        break;
      }
      v26(v12, v4);
      v21 += v40;
      --v20;
      uint64_t v5 = v25;
      if (!v20)
      {
        uint64_t v27 = 1LL;
        uint64_t v1 = v35;
        uint64_t v0 = v36;
        uint64_t v16 = v33;
        uint64_t v3 = v34;
        goto LABEL_7;
      }
    }

    uint64_t v5 = v25;
    uint64_t v28 = v39;
    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v39, v12, v4);
    uint64_t v27 = 0LL;
    uint64_t v1 = v35;
    uint64_t v0 = v36;
    uint64_t v16 = v33;
    uint64_t v3 = v34;
  }

  else
  {
    uint64_t v27 = 1LL;
LABEL_7:
    uint64_t v28 = v39;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v28, v27, 1LL, v4);
  swift_bridgeObjectRelease(v38);
  sub_8D84(v28, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v16, 1LL, v4) == 1)
  {
    sub_8DCC(v28, &qword_3D218);
    sub_8DCC((uint64_t)v16, &qword_3D218);
    return 0LL;
  }

  else
  {
    uint64_t v30 = v37;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v37, v16, v4);
    if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v30, v4) == enum case for ResponseOutput.VisualOutput.pluginSnippet(_:))
    {
      (*(void (**)(char *, uint64_t))(v5 + 96))(v30, v4);
      uint64_t v31 = (*(uint64_t (**)(char *, char *, uint64_t))(v1 + 32))(v3, v30, v0);
      uint64_t v29 = ResponseOutput.VisualOutput.PluginSnippetOutputPayload.pluginModelData.getter(v31);
      ResponseOutput.VisualOutput.PluginSnippetOutputPayload.bundleId.getter();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v30, v4);
      uint64_t v29 = 0LL;
    }

    sub_8DCC(v39, &qword_3D218);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
  }

  return v29;
}

uint64_t sub_8348()
{
  uint64_t v0 = type metadata accessor for RGPluginModel(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v33[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v39 = type metadata accessor for ResponseOutput.VisualOutput.SystemSnippetOutputPayload(0LL);
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v6 = &v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v45 = &v33[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v43 = &v33[-v12];
  uint64_t v13 = __chkstk_darwin(v11);
  id v47 = &v33[-v14];
  uint64_t result = ResponseOutput.visualOutput.getter(v13);
  uint64_t v16 = _swiftEmptyArrayStorage;
  id v48 = _swiftEmptyArrayStorage;
  uint64_t v44 = *(void *)(result + 16);
  if (!v44)
  {
LABEL_16:
    swift_bridgeObjectRelease(result);
    return (uint64_t)v16;
  }

  uint64_t v36 = v3;
  unint64_t v17 = 0LL;
  int v40 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
  int v34 = enum case for RGPluginModel.archivedView(_:);
  uint64_t v37 = v1;
  uint64_t v38 = v0;
  uint64_t v18 = v39;
  uint64_t v41 = result;
  uint64_t v42 = v4;
  uint64_t v35 = v6;
  while (v17 < *(void *)(result + 16))
  {
    uint64_t v19 = *(void *)(v8 + 72);
    unint64_t v46 = (*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v20 = *(void (**)(_BYTE *, unint64_t, uint64_t))(v8 + 16);
    unint64_t v21 = v47;
    v20(v47, result + v46 + v19 * v17, v7);
    int v22 = v43;
    v20(v43, (unint64_t)v21, v7);
    int v23 = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 88))(v22, v7);
    if (v23 != v40)
    {
      (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v22, v7);
      goto LABEL_10;
    }

    (*(void (**)(_BYTE *, uint64_t))(v8 + 96))(v22, v7);
    int v24 = v35;
    uint64_t v25 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v35, v22, v18);
    unint64_t v26 = v36;
    ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter(v25);
    uint64_t v27 = v37;
    int v28 = (*(uint64_t (**)(_BYTE *, uint64_t))(v37 + 88))(v26, v0);
    if (v28 != v34)
    {
      (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v24, v18);
      (*(void (**)(_BYTE *, uint64_t))(v27 + 8))(v26, v0);
LABEL_10:
      uint64_t v29 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32);
      v29(v45, v47, v7);
      uint64_t v30 = v48;
      if ((swift_isUniquelyReferenced_nonNull_native(v48) & 1) == 0)
      {
        sub_18ADC(0, v30[2] + 1LL, 1);
        uint64_t v30 = v48;
      }

      unint64_t v32 = v30[2];
      unint64_t v31 = v30[3];
      if (v32 >= v31 >> 1)
      {
        sub_18ADC(v31 > 1, v32 + 1, 1);
        uint64_t v30 = v48;
      }

      v30[2] = v32 + 1;
      v29((_BYTE *)v30 + v46 + v32 * v19, v45, v7);
      id v48 = v30;
      uint64_t v0 = v38;
      uint64_t v18 = v39;
      goto LABEL_4;
    }

    (*(void (**)(_BYTE *, uint64_t))(v27 + 8))(v26, v0);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v24, v18);
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v47, v7);
LABEL_4:
    ++v17;
    uint64_t result = v41;
    uint64_t v4 = v42;
    if (v44 == v17)
    {
      uint64_t v16 = v48;
      goto LABEL_16;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_86A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ResponseOutput.VisualOutput.SystemSnippetOutputPayload(0LL);
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  __chkstk_darwin(v2);
  uint64_t v50 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_494C(&qword_3D1F0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for RGPluginModel(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v57 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v49 = (char *)&v45 - v11;
  uint64_t v12 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v58 = (char *)&v45 - v18;
  uint64_t v19 = ResponseOutput.visualOutput.getter(v17);
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    uint64_t v45 = v19;
    uint64_t v46 = a1;
    unint64_t v21 = v19 + ((*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    int v56 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
    int v47 = enum case for RGPluginModel.actionConfirmationModel(_:);
    uint64_t v53 = *(void *)(v13 + 72);
    uint64_t v54 = v16;
    uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v48 = v12;
    while (1)
    {
      int v22 = v58;
      int v23 = v55;
      v55(v58, (char *)v21, v12);
      v23(v16, v22, v12);
      int v24 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v16, v12);
      if (v24 == v56)
      {
        (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
        uint64_t v25 = v13;
        uint64_t v26 = v7;
        uint64_t v27 = v8;
        int v28 = v6;
        uint64_t v29 = v50;
        uint64_t v30 = v51;
        uint64_t v31 = v52;
        uint64_t v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v51 + 32))(v50, v16, v52);
        ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter(v32);
        id v33 = *(void (**)(char *, uint64_t))(v30 + 8);
        uint64_t v6 = v28;
        uint64_t v8 = v27;
        uint64_t v7 = v26;
        uint64_t v13 = v25;
        uint64_t v12 = v48;
        uint64_t v16 = v54;
        v33(v29, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0LL, 1LL, v7);
        (*(void (**)(char *, uint64_t))(v13 + 8))(v58, v12);
      }

      else
      {
        int v34 = *(void (**)(char *, uint64_t))(v13 + 8);
        v34(v16, v12);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1LL, 1LL, v7);
        v34(v58, v12);
      }

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
      {
        sub_8DCC((uint64_t)v6, &qword_3D1F0);
      }

      else
      {
        uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        uint64_t v36 = v49;
        v35(v49, v6, v7);
        uint64_t v37 = v57;
        v35(v57, v36, v7);
        int v38 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v37, v7);
        if (v38 == v47)
        {
          swift_bridgeObjectRelease(v45);
          uint64_t v41 = v57;
          (*(void (**)(char *, uint64_t))(v8 + 96))(v57, v7);
          uint64_t v42 = type metadata accessor for RGActionConfirmationModel(0LL);
          uint64_t v43 = *(void *)(v42 - 8);
          uint64_t v44 = v46;
          (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v46, v41, v42);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v44, 0LL, 1LL, v42);
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v57, v7);
        uint64_t v16 = v54;
      }

      v21 += v53;
      if (!--v20)
      {
        swift_bridgeObjectRelease(v45);
        a1 = v46;
        goto LABEL_13;
      }
    }
  }

  swift_bridgeObjectRelease(v19);
LABEL_13:
  uint64_t v39 = type metadata accessor for RGActionConfirmationModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56LL))( a1,  1LL,  1LL,  v39);
}

uint64_t sub_8A9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for ResponseOutput.VisualOutput.InAppResponseOutputPayload(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v5 + 88))(v7, v4) == enum case for ResponseOutput.VisualOutput.inAppResponse(_:))
  {
    (*(void (**)(_BYTE *, uint64_t))(v5 + 96))(v7, v4);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v12 = type metadata accessor for FlowOutputMessage.InAppResponse(0LL);
    __chkstk_darwin(v12);
    *(void *)&v16[-16] = v11;
    unint64_t v13 = sub_8CD8();
    static Buildable.withBuilder(_:)(sub_8CC0, &v16[-32], v12, v13);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))( a1,  0LL,  1LL,  v12);
  }

  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v15 = type metadata accessor for FlowOutputMessage.InAppResponse(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))( a1,  1LL,  1LL,  v15);
  }

uint64_t sub_8C60()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_31300);
  v3[0] = ResponseOutput.VisualOutput.InAppResponseOutputPayload.bundleId.getter();
  v3[1] = v1;
  return Builder.subscript.setter(v3, KeyPath);
}

uint64_t sub_8CC0()
{
  return sub_8C60();
}

unint64_t sub_8CD8()
{
  unint64_t result = qword_3D1F8;
  if (!qword_3D1F8)
  {
    uint64_t v1 = type metadata accessor for FlowOutputMessage.InAppResponse(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for FlowOutputMessage.InAppResponse, v1);
    atomic_store(result, (unint64_t *)&qword_3D1F8);
  }

  return result;
}

uint64_t sub_8D20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FlowOutputMessage.InAppResponse.bundleId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_8D48()
{
  unint64_t result = qword_3D210;
  if (!qword_3D210)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___DialogElement);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_3D210);
  }

  return result;
}

uint64_t sub_8D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_3D218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_8DCC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_494C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

id sub_8E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v25[0] = a7;
  v25[1] = a8;
  v25[2] = a1;
  v25[3] = a2;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v12 = [objc_allocWithZone(SAUIPluginSnippet) init];
  uint64_t v13 = UUID.init()();
  UUID.uuidString.getter(v13);
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  [v12 setAceId:v16];

  id v17 = v12;
  NSString v18 = String._bridgeToObjectiveC()();
  [v17 setViewId:v18];

  NSString v19 = String._bridgeToObjectiveC()();
  [v17 setBundleName:v19];

  id v20 = v17;
  NSString v21 = String._bridgeToObjectiveC()();
  [v20 setItemType:v21];

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [v20 setModelData:isa];

  NSString v23 = String._bridgeToObjectiveC()();
  [v20 setResponseViewId:v23];

  return v20;
}

uint64_t sub_8FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(void *)(v8 + 288) = a6;
  *(void *)(v8 + 296) = v7;
  *(_BYTE *)(v8 + 680) = a7;
  *(void *)(v8 + 272) = a4;
  *(void *)(v8 + 280) = a5;
  *(void *)(v8 + 256) = a2;
  *(void *)(v8 + 264) = a3;
  *(void *)(v8 + 248) = a1;
  uint64_t v9 = sub_494C(&qword_3D228);
  *(void *)(v8 + 304) = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for ResponseOutput.VisualOutputOptions(0LL);
  *(void *)(v8 + 312) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v8 + 320) = v11;
  *(void *)(v8 + 328) = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_494C(&qword_3D230);
  *(void *)(v8 + 336) = swift_task_alloc((*(void *)(*(void *)(v12 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v13 = (*(void *)(*(void *)(sub_494C(&qword_3D218) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 344) = swift_task_alloc(v13);
  *(void *)(v8 + 352) = swift_task_alloc(v13);
  uint64_t v14 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  *(void *)(v8 + 360) = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  *(void *)(v8 + 368) = v15;
  *(void *)(v8 + 376) = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for ResponseOutput(0LL);
  *(void *)(v8 + 384) = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  *(void *)(v8 + 392) = v17;
  unint64_t v18 = (*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 400) = swift_task_alloc(v18);
  *(void *)(v8 + 408) = swift_task_alloc(v18);
  uint64_t v19 = type metadata accessor for OutputGenerationManifest(0LL);
  *(void *)(v8 + 416) = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  *(void *)(v8 + 424) = v20;
  *(void *)(v8 + 432) = swift_task_alloc((*(void *)(v20 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v21 = (*(void *)(*(void *)(sub_494C(&qword_3D238) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 440) = swift_task_alloc(v21);
  *(void *)(v8 + 448) = swift_task_alloc(v21);
  uint64_t v22 = sub_494C(&qword_3D240);
  *(void *)(v8 + 456) = swift_task_alloc((*(void *)(*(void *)(v22 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_494C(&qword_3D248);
  *(void *)(v8 + 464) = swift_task_alloc((*(void *)(*(void *)(v23 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  *(void *)(v8 + 472) = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  *(void *)(v8 + 480) = v25;
  *(void *)(v8 + 488) = swift_task_alloc((*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for ResponseType(0LL);
  *(void *)(v8 + 496) = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  *(void *)(v8 + 504) = v27;
  unint64_t v28 = (*(void *)(v27 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 512) = swift_task_alloc(v28);
  *(void *)(v8 + 520) = swift_task_alloc(v28);
  uint64_t v29 = type metadata accessor for StatementOutcome(0LL);
  *(void *)(v8 + 528) = v29;
  uint64_t v30 = *(void *)(v29 - 8);
  *(void *)(v8 + 536) = v30;
  unint64_t v31 = (*(void *)(v30 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 544) = swift_task_alloc(v31);
  *(void *)(v8 + 552) = swift_task_alloc(v31);
  *(void *)(v8 + 560) = swift_task_alloc(v31);
  *(void *)(v8 + 568) = swift_task_alloc(v31);
  *(void *)(v8 + 576) = swift_task_alloc(v31);
  *(void *)(v8 + 584) = swift_task_alloc(v31);
  uint64_t v32 = type metadata accessor for DialogPhase(0LL);
  *(void *)(v8 + 592) = v32;
  uint64_t v33 = *(void *)(v32 - 8);
  *(void *)(v8 + 600) = v33;
  unint64_t v34 = (*(void *)(v33 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 608) = swift_task_alloc(v34);
  *(void *)(v8 + 616) = swift_task_alloc(v34);
  return swift_task_switch(sub_92DC, 0LL, 0LL);
}

uint64_t sub_92DC()
{
  uint64_t v1 = *(void *)(v0 + 584);
  uint64_t v2 = *(void *)(v0 + 576);
  uint64_t v3 = *(void *)(v0 + 568);
  uint64_t v4 = *(void **)(v0 + 536);
  uint64_t v5 = *(void *)(v0 + 528);
  sub_257E4(v1);
  sub_16758();
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v4[1];
  v6(v1, v5);
  sub_257E4(v2);
  uint64_t v136 = (void (*)(uint64_t, uint64_t, uint64_t))v4[2];
  v136(v3, v2, v5);
  uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t))v4[11];
  int v7 = v132(v3, v5);
  int v8 = enum case for StatementOutcome.toolDisambiguation(_:);
  uint64_t v9 = *(void *)(v0 + 568);
  uint64_t v10 = *(void *)(v0 + 528);
  uint64_t v12 = *(void *)(v0 + 504);
  uint64_t v11 = *(void *)(v0 + 512);
  uint64_t v13 = *(void *)(v0 + 496);
  int v138 = enum case for StatementOutcome.valueDisambiguation(_:);
  int v134 = enum case for StatementOutcome.parameterDisambiguation(_:);
  if (v7 == enum case for StatementOutcome.toolDisambiguation(_:)
    || v7 == enum case for StatementOutcome.parameterDisambiguation(_:)
    || v7 == enum case for StatementOutcome.valueDisambiguation(_:))
  {
    v6(v9, v10);
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))( v11,  enum case for ResponseType.disambiguation(_:),  v13);
  }

  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for ResponseType.standard(_:), v13);
    v6(v9, v10);
  }

  uint64_t v14 = v6;
  uint64_t v15 = *(void *)(v0 + 576);
  uint64_t v16 = *(void *)(v0 + 560);
  uint64_t v17 = *(void *)(v0 + 552);
  uint64_t v18 = *(void *)(v0 + 528);
  uint64_t v19 = *(void *)(v0 + 488);
  uint64_t v20 = *(void *)(v0 + 448);
  uint64_t v127 = *(void *)(v0 + 544);
  uint64_t v129 = *(void *)(v0 + 392);
  uint64_t v130 = *(void *)(v0 + 384);
  uint64_t v21 = *(void *)(v0 + 256);
  (*(void (**)(void, void, void))(*(void *)(v0 + 504) + 32LL))( *(void *)(v0 + 520),  *(void *)(v0 + 512),  *(void *)(v0 + 496));
  v14(v15, v18);
  sub_257E4(v16);
  v136(v17, v16, v18);
  int v22 = v132(v17, v18);
  BOOL v29 = v22 == v8
     || v22 == enum case for StatementOutcome.actionConfirmation(_:)
     || v22 == enum case for StatementOutcome.parameterNeedsValue(_:)
     || v22 == enum case for StatementOutcome.parameterConfirmation(_:)
     || v22 == v134
     || v22 == enum case for StatementOutcome.parameterNotAllowed(_:)
     || v22 == v138;
  BOOL v139 = v29;
  v14(v17, v18);
  v14(v16, v18);
  sub_3E74(v21, v19);
  uint64_t v30 = sub_259D0();
  unint64_t v32 = 0xD000000000000012LL;
  if (v31) {
    unint64_t v32 = v30;
  }
  uint64_t v135 = v32;
  if (v31) {
    uint64_t v33 = v31;
  }
  else {
    uint64_t v33 = 0x8000000000033570LL;
  }
  uint64_t v34 = sub_257E4(v127);
  SystemResponse.responseOutput.getter(v34);
  v137 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v129 + 48);
  int v35 = v137(v20, 1LL, v130);
  uint64_t v37 = *(void *)(v0 + 448);
  uint64_t v36 = *(void *)(v0 + 456);
  v141 = v14;
  if (v35 == 1)
  {
    sub_8DCC(v37, &qword_3D238);
    uint64_t v38 = type metadata accessor for RGActionConfirmationModel(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56LL))(v36, 1LL, 1LL, v38);
  }

  else
  {
    uint64_t v40 = *(void *)(v0 + 384);
    uint64_t v39 = *(void *)(v0 + 392);
    sub_86A4(v36);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v40);
  }

  uint64_t v123 = *(void *)(v0 + 600);
  uint64_t v124 = *(void *)(v0 + 608);
  uint64_t v125 = *(void *)(v0 + 592);
  uint64_t v126 = *(void *)(v0 + 616);
  uint64_t v41 = *(void *)(v0 + 544);
  uint64_t v42 = *(void *)(v0 + 528);
  uint64_t v43 = *(void *)(v0 + 488);
  uint64_t v45 = *(void *)(v0 + 456);
  uint64_t v44 = *(void *)(v0 + 464);
  uint64_t v128 = *(void *)(v0 + 520);
  uint64_t v131 = *(void *)(v0 + 440);
  uint64_t v133 = *(void *)(v0 + 384);
  uint64_t v46 = *(void *)(v0 + 288);
  uint64_t v47 = *(void *)(v0 + 280);
  uint64_t v122 = *(void *)(v0 + 256);
  sub_A554(*(void *)(v0 + 264), *(void *)(v0 + 272), v135, v33, v41, v45, v44);
  swift_bridgeObjectRelease(v33);
  sub_8DCC(v45, &qword_3D240);
  v141(v41, v42);
  uint64_t v48 = sub_ACA0(v43, v47, v46);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v123 + 16))(v124, v126, v125);
  uint64_t v49 = swift_task_alloc(64LL);
  *(void *)(v49 + 16) = v128;
  *(void *)(v49 + 24) = v122;
  *(_BYTE *)(v49 + 32) = v139;
  *(void *)(v49 + 40) = v43;
  *(void *)(v49 + 48) = v44;
  *(void *)(v49 + 56) = v48;
  OutputGenerationManifest.init(dialogPhase:_:)(v124, sub_B15C, v49);
  swift_bridgeObjectRelease(v48);
  uint64_t v50 = swift_task_dealloc(v49);
  SystemResponse.responseOutput.getter(v50);
  if (v137(v131, 1LL, v133) == 1)
  {
    sub_8DCC(*(void *)(v0 + 440), &qword_3D238);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v51 = type metadata accessor for Logger(0LL);
    uint64_t v52 = sub_458C(v51, (uint64_t)qword_3E310);
    uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
    os_log_type_t v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v55 = 0;
      _os_log_impl( &dword_0,  v53,  v54,  "IFFlow received SystemResponse with no output, defaulting to minimally empty output",  v55,  2u);
      swift_slowDealloc(v55, -1LL, -1LL);
    }

    int v56 = *(void **)(v0 + 296);

    uint64_t v57 = v56[3];
    uint64_t v58 = v56[4];
    sub_B170(v56, v57);
    uint64_t v59 = (void *)swift_task_alloc(async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)[1]);
    *(void *)(v0 + 672) = v59;
    void *v59 = v0;
    v59[1] = sub_A310;
    return dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)( *(void *)(v0 + 248),  _swiftEmptyArrayStorage,  *(void *)(v0 + 432),  v57,  v58);
  }

  else
  {
    uint64_t v61 = *(void *)(v0 + 408);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 392) + 32LL))( v61,  *(void *)(v0 + 440),  *(void *)(v0 + 384));
    uint64_t v62 = sub_259D0();
    if (v63) {
      uint64_t v64 = v62;
    }
    else {
      uint64_t v64 = 0xD000000000000012LL;
    }
    if (v63) {
      uint64_t v65 = v63;
    }
    else {
      uint64_t v65 = 0x8000000000033570LL;
    }
    sub_B194(v61, v64, v65, v0 + 16);
    uint64_t v66 = swift_bridgeObjectRelease(v65);
    uint64_t v67 = ResponseOutput.visualOutput.getter(v66);
    if (*(void *)(v67 + 16))
    {
      (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 368) + 16LL))( *(void *)(v0 + 352),  v67 + ((*(unsigned __int8 *)(*(void *)(v0 + 368) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 368) + 80LL)),  *(void *)(v0 + 360));
      uint64_t v68 = 0LL;
    }

    else
    {
      uint64_t v68 = 1LL;
    }

    uint64_t v70 = *(void *)(v0 + 360);
    uint64_t v69 = *(void *)(v0 + 368);
    uint64_t v71 = *(void *)(v0 + 352);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v71, v68, 1LL, v70);
    swift_bridgeObjectRelease(v67);
    uint64_t v72 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48);
    if (v72(v71, 1LL, v70) == 1)
    {
      sub_8DCC(*(void *)(v0 + 352), &qword_3D218);
    }

    else
    {
      uint64_t v74 = *(void *)(v0 + 368);
      uint64_t v73 = *(void *)(v0 + 376);
      uint64_t v75 = *(void *)(v0 + 360);
      uint64_t v76 = *(void *)(v0 + 336);
      (*(void (**)(uint64_t, void, uint64_t))(v74 + 32))(v73, *(void *)(v0 + 352), v75);
      sub_8A9C(v76);
      OutputGenerationManifest.inAppResponse.setter(v76);
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
    }

    uint64_t v140 = v0 + 112;
    sub_F848(v0 + 16, v0 + 64, &qword_3D250);
    uint64_t v77 = *(void *)(v0 + 104);
    if (v77) {
      uint64_t v78 = &qword_3D258;
    }
    else {
      uint64_t v78 = &qword_3D250;
    }
    if (v77) {
      uint64_t v79 = *(void **)(v0 + 104);
    }
    else {
      uint64_t v79 = _swiftEmptyArrayStorage;
    }
    sub_8DCC(v0 + 64, v78);
    uint64_t v81 = *(void *)(v0 + 400);
    uint64_t v80 = *(void *)(v0 + 408);
    uint64_t v83 = *(void *)(v0 + 384);
    uint64_t v82 = *(void *)(v0 + 392);
    uint64_t v84 = *(void *)(v0 + 360);
    uint64_t v85 = *(void *)(v0 + 344);
    OutputGenerationManifest.additionalAceViews.setter(v79);
    sub_7CC8(v85);
    unsigned int v86 = v72(v85, 1LL, v84);
    sub_8DCC(v85, &qword_3D218);
    uint64_t v87 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v81, v80, v83);
    if (v86 == 1)
    {
      char v88 = 0;
    }

    else
    {
      uint64_t v89 = *(void *)(v0 + 320);
      uint64_t v90 = *(void *)(v0 + 328);
      uint64_t v91 = *(void *)(v0 + 312);
      uint64_t v92 = ResponseOutput.options.getter(v87);
      char v88 = ResponseOutput.VisualOutputOptions.canReplacePrintableText.getter(v92);
      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v90, v91);
    }

    uint64_t v93 = *(void *)(v0 + 400);
    uint64_t v94 = *(void *)(v0 + 384);
    int v95 = *(unsigned __int8 *)(v0 + 680);
    uint64_t v96 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 392) + 8LL);
    *(void *)(v0 + 624) = v96;
    v96(v93, v94);
    OutputGenerationManifest.useResultSnippetAsSmartDialogOverrideInSAE.setter(v88 & 1);
    if (v95 == 1)
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v97 = type metadata accessor for Logger(0LL);
      uint64_t v98 = sub_458C(v97, (uint64_t)qword_3E310);
      uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
      os_log_type_t v100 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v101 = 134217984;
        *(void *)(v0 + 240) = 25000LL;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248);
        _os_log_impl(&dword_0, v99, v100, "Setting minimumAutoDismissalTimeInMs to %ld", v101, 0xCu);
        swift_slowDealloc(v101, -1LL, -1LL);
      }

      uint64_t v102 = *(void *)(v0 + 304);

      DismissalSettings.init(_:)(sub_C10C, 0LL);
      uint64_t v103 = type metadata accessor for DismissalSettings(0LL);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56LL))(v102, 0LL, 1LL, v103);
      OutputGenerationManifest.dismissalSettings.setter(v102);
    }

    id v104 = sub_7710();
    *(void *)(v0 + 632) = v104;
    sub_F848(v0 + 16, v140, &qword_3D250);
    uint64_t v105 = *(void *)(v0 + 152);
    if (v105)
    {
      swift_bridgeObjectRelease(v105);
      sub_F994(v140, v0 + 200, &qword_3D258);
      if (*(void *)(v0 + 224))
      {
        Swift::String v106 = *(void **)(v0 + 296);
        sub_DB78((__int128 *)(v0 + 200), v0 + 160);
        uint64_t v107 = v106[3];
        uint64_t v108 = v106[4];
        sub_B170(v106, v107);
        uint64_t v109 = sub_494C(&qword_3D208);
        uint64_t v110 = swift_allocObject(v109, 40LL, 7LL);
        *(_OWORD *)(v110 + 16) = xmmword_312F0;
        *(void *)(v110 + 32) = v104;
        uint64_t v142 = v110;
        specialized Array._endMutation()(v110);
        *(void *)(v0 + 640) = v142;
        uint64_t v111 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)[1];
        id v112 = v104;
        uint64_t v113 = (void *)swift_task_alloc(v111);
        *(void *)(v0 + 648) = v113;
        *uint64_t v113 = v0;
        v113[1] = sub_9DBC;
        return dispatch thunk of ResponseGenerating.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)( *(void *)(v0 + 248),  v0 + 160,  v142,  *(void *)(v0 + 432),  v107,  v108);
      }
    }

    else
    {
      sub_8DCC(v140, &qword_3D250);
      *(_OWORD *)(v0 + 200) = 0u;
      *(_OWORD *)(v0 + 216) = 0u;
      *(void *)(v0 + 232) = 0LL;
    }

    uint64_t v114 = *(void **)(v0 + 296);
    sub_8DCC(v0 + 200, &qword_3D258);
    uint64_t v115 = v114[3];
    uint64_t v116 = v114[4];
    sub_B170(v114, v115);
    uint64_t v117 = sub_494C(&qword_3D208);
    uint64_t v118 = swift_allocObject(v117, 40LL, 7LL);
    *(_OWORD *)(v118 + 16) = xmmword_312F0;
    *(void *)(v118 + 32) = v104;
    uint64_t v143 = v118;
    specialized Array._endMutation()(v118);
    *(void *)(v0 + 656) = v143;
    uint64_t v119 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)[1];
    id v120 = v104;
    uint64_t v121 = (void *)swift_task_alloc(v119);
    *(void *)(v0 + 664) = v121;
    void *v121 = v0;
    v121[1] = sub_A070;
    return dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)( *(void *)(v0 + 248),  v143,  *(void *)(v0 + 432),  v115,  v116);
  }

uint64_t sub_9DBC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 640LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 648LL));
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_9E1C, 0LL, 0LL);
}

uint64_t sub_9E1C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
  uint64_t v23 = *(void *)(v0 + 600);
  uint64_t v25 = *(void *)(v0 + 592);
  uint64_t v27 = *(void *)(v0 + 616);
  uint64_t v39 = *(void *)(v0 + 520);
  uint64_t v35 = *(void *)(v0 + 504);
  uint64_t v37 = *(void *)(v0 + 496);
  uint64_t v29 = *(void *)(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 464);
  uint64_t v31 = *(void *)(v0 + 472);
  uint64_t v33 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 432);
  uint64_t v6 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 416);
  uint64_t v7 = *(void *)(v0 + 384);

  sub_76EC((void *)(v0 + 160));
  sub_8DCC(v0 + 16, &qword_3D250);
  v1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v27, v25);
  sub_8DCC(v2, &qword_3D248);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v33, v31);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v39, v37);
  uint64_t v8 = *(void *)(v0 + 608);
  uint64_t v9 = *(void *)(v0 + 584);
  uint64_t v10 = *(void *)(v0 + 576);
  uint64_t v11 = *(void *)(v0 + 568);
  uint64_t v12 = *(void *)(v0 + 560);
  uint64_t v13 = *(void *)(v0 + 552);
  uint64_t v14 = *(void *)(v0 + 544);
  uint64_t v15 = *(void *)(v0 + 520);
  uint64_t v16 = *(void *)(v0 + 512);
  uint64_t v18 = *(void *)(v0 + 488);
  uint64_t v19 = *(void *)(v0 + 464);
  uint64_t v20 = *(void *)(v0 + 456);
  uint64_t v21 = *(void *)(v0 + 448);
  uint64_t v22 = *(void *)(v0 + 440);
  uint64_t v24 = *(void *)(v0 + 432);
  uint64_t v26 = *(void *)(v0 + 408);
  uint64_t v28 = *(void *)(v0 + 400);
  uint64_t v30 = *(void *)(v0 + 376);
  uint64_t v32 = *(void *)(v0 + 352);
  uint64_t v34 = *(void *)(v0 + 344);
  uint64_t v36 = *(void *)(v0 + 336);
  uint64_t v38 = *(void *)(v0 + 328);
  uint64_t v40 = *(void *)(v0 + 304);
  swift_task_dealloc(*(void *)(v0 + 616));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v24);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v30);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  swift_task_dealloc(v36);
  swift_task_dealloc(v38);
  swift_task_dealloc(v40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_A070()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 656LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 664LL));
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_A0D0, 0LL, 0LL);
}

uint64_t sub_A0D0()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
  uint64_t v2 = *(void *)(v0 + 600);
  uint64_t v25 = *(void *)(v0 + 592);
  uint64_t v27 = *(void *)(v0 + 616);
  uint64_t v39 = *(void *)(v0 + 520);
  uint64_t v35 = *(void *)(v0 + 504);
  uint64_t v37 = *(void *)(v0 + 496);
  uint64_t v29 = *(void *)(v0 + 480);
  uint64_t v3 = *(void *)(v0 + 464);
  uint64_t v31 = *(void *)(v0 + 472);
  uint64_t v33 = *(void *)(v0 + 488);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 432);
  uint64_t v7 = *(void *)(v0 + 408);
  uint64_t v6 = *(void *)(v0 + 416);
  uint64_t v8 = *(void *)(v0 + 384);

  sub_8DCC(v0 + 16, &qword_3D250);
  v1(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v27, v25);
  sub_8DCC(v3, &qword_3D248);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v33, v31);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v39, v37);
  uint64_t v9 = *(void *)(v0 + 608);
  uint64_t v10 = *(void *)(v0 + 584);
  uint64_t v11 = *(void *)(v0 + 576);
  uint64_t v12 = *(void *)(v0 + 568);
  uint64_t v13 = *(void *)(v0 + 560);
  uint64_t v14 = *(void *)(v0 + 552);
  uint64_t v15 = *(void *)(v0 + 544);
  uint64_t v16 = *(void *)(v0 + 520);
  uint64_t v17 = *(void *)(v0 + 512);
  uint64_t v19 = *(void *)(v0 + 488);
  uint64_t v20 = *(void *)(v0 + 464);
  uint64_t v21 = *(void *)(v0 + 456);
  uint64_t v22 = *(void *)(v0 + 448);
  uint64_t v23 = *(void *)(v0 + 440);
  uint64_t v24 = *(void *)(v0 + 432);
  uint64_t v26 = *(void *)(v0 + 408);
  uint64_t v28 = *(void *)(v0 + 400);
  uint64_t v30 = *(void *)(v0 + 376);
  uint64_t v32 = *(void *)(v0 + 352);
  uint64_t v34 = *(void *)(v0 + 344);
  uint64_t v36 = *(void *)(v0 + 336);
  uint64_t v38 = *(void *)(v0 + 328);
  uint64_t v40 = *(void *)(v0 + 304);
  swift_task_dealloc(*(void *)(v0 + 616));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v30);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  swift_task_dealloc(v36);
  swift_task_dealloc(v38);
  swift_task_dealloc(v40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_A310()
{
  return swift_task_switch(sub_A364, 0LL, 0LL);
}

uint64_t sub_A364()
{
  uint64_t v1 = *(void *)(v0 + 616);
  uint64_t v2 = *(void *)(v0 + 600);
  uint64_t v3 = *(void *)(v0 + 592);
  uint64_t v33 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 496);
  uint64_t v5 = *(void *)(v0 + 504);
  uint64_t v6 = *(void *)(v0 + 480);
  uint64_t v7 = *(void *)(v0 + 488);
  uint64_t v9 = *(void *)(v0 + 464);
  uint64_t v8 = *(void *)(v0 + 472);
  (*(void (**)(void, void))(*(void *)(v0 + 424) + 8LL))(*(void *)(v0 + 432), *(void *)(v0 + 416));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_8DCC(v9, &qword_3D248);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v33, v4);
  uint64_t v10 = *(void *)(v0 + 608);
  uint64_t v11 = *(void *)(v0 + 584);
  uint64_t v12 = *(void *)(v0 + 576);
  uint64_t v13 = *(void *)(v0 + 568);
  uint64_t v14 = *(void *)(v0 + 560);
  uint64_t v15 = *(void *)(v0 + 552);
  uint64_t v16 = *(void *)(v0 + 544);
  uint64_t v17 = *(void *)(v0 + 520);
  uint64_t v18 = *(void *)(v0 + 512);
  uint64_t v20 = *(void *)(v0 + 488);
  uint64_t v21 = *(void *)(v0 + 464);
  uint64_t v22 = *(void *)(v0 + 456);
  uint64_t v23 = *(void *)(v0 + 448);
  uint64_t v24 = *(void *)(v0 + 440);
  uint64_t v25 = *(void *)(v0 + 432);
  uint64_t v26 = *(void *)(v0 + 408);
  uint64_t v27 = *(void *)(v0 + 400);
  uint64_t v28 = *(void *)(v0 + 376);
  uint64_t v29 = *(void *)(v0 + 352);
  uint64_t v30 = *(void *)(v0 + 344);
  uint64_t v31 = *(void *)(v0 + 336);
  uint64_t v32 = *(void *)(v0 + 328);
  uint64_t v34 = *(void *)(v0 + 304);
  swift_task_dealloc(*(void *)(v0 + 616));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_A554@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v90 = a7;
  uint64_t v91 = (void *)a6;
  uint64_t v87 = a3;
  uint64_t v88 = a4;
  uint64_t v85 = a1;
  uint64_t v86 = a2;
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v95 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v96 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v84 = (char *)&v82 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v94 = (char *)&v82 - v14;
  __chkstk_darwin(v13);
  v92.n128_u64[0] = (unint64_t)&v82 - v15;
  uint64_t v16 = sub_494C(&qword_3D2C0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v93 = (uint64_t *)((char *)&v82 - v21);
  uint64_t v22 = type metadata accessor for ParameterDisambiguation(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v82 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for StatementOutcome(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v89 = a5;
  v30(v29, a5, v26);
  int v31 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v29, v26);
  if (v31 == enum case for StatementOutcome.actionConfirmation(_:)
    || v31 == enum case for StatementOutcome.parameterConfirmation(_:))
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
    uint64_t v33 = (void *)sub_C35C((uint64_t)v91);
  }

  else
  {
    if (v31 == enum case for StatementOutcome.parameterDisambiguation(_:))
    {
      (*(void (**)(char *, uint64_t))(v27 + 96))(v29, v26);
      uint64_t v34 = v22;
      uint64_t v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v23 + 32))(v25, v29, v22);
      uint64_t v36 = ParameterDisambiguation.items.getter(v35);
      uint64_t v37 = *(void *)(v36 + 16);
      swift_bridgeObjectRelease(v36);
      uint64_t v38 = sub_494C(&qword_3D2D0);
      uint64_t v39 = *(unsigned __int8 *)(v17 + 80);
      uint64_t v40 = (v39 + 32) & ~v39;
      uint64_t v33 = (void *)swift_allocObject(v38, v40 + *(void *)(v17 + 72), v39 | 7);
      *((_OWORD *)v33 + 1) = xmmword_31350;
      uint64_t v41 = (uint64_t)v33 + v40;
      sub_10800(v37, v41);
      uint64_t v55 = v95;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v95 + 56))(v41, 0LL, 1LL, v8);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v34);
      uint64_t v42 = v33[2];
      if (!v42) {
        goto LABEL_23;
      }
      goto LABEL_11;
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
    uint64_t v33 = _swiftEmptyArrayStorage;
  }

  uint64_t v55 = v95;
  uint64_t v42 = v33[2];
  if (!v42)
  {
LABEL_23:
    uint64_t v53 = swift_bridgeObjectRelease(v33);
    os_log_type_t v54 = _swiftEmptyArrayStorage;
    goto LABEL_24;
  }

LABEL_11:
  uint64_t v43 = (uint64_t)v33 + ((*(unsigned __int8 *)(v17 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  uint64_t v44 = *(void *)(v17 + 72);
  uint64_t v91 = v33;
  swift_bridgeObjectRetain(v33);
  uint64_t v45 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v46 = (uint64_t)v93;
    sub_F848(v43, (uint64_t)v93, &qword_3D2C0);
    sub_F994(v46, (uint64_t)v20, &qword_3D2C0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v20, 1LL, v8) == 1)
    {
      sub_8DCC((uint64_t)v20, &qword_3D2C0);
    }

    else
    {
      uint64_t v47 = *(void (**)(unint64_t, char *, uint64_t))(v55 + 32);
      unint64_t v48 = v92.n128_u64[0];
      v47(v92.n128_u64[0], v20, v8);
      v47((unint64_t)v94, (char *)v48, v8);
      if ((swift_isUniquelyReferenced_nonNull_native(v45) & 1) != 0) {
        unint64_t v49 = (unint64_t)v45;
      }
      else {
        unint64_t v49 = sub_DBA4( 0,  v45[2] + 1LL,  1,  (unint64_t)v45,  &qword_3D330,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
      }
      unint64_t v51 = *(void *)(v49 + 16);
      unint64_t v50 = *(void *)(v49 + 24);
      if (v51 >= v50 >> 1) {
        unint64_t v49 = sub_DBA4( v50 > 1,  v51 + 1,  1,  v49,  &qword_3D330,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
      }
      *(void *)(v49 + 16) = v51 + 1;
      uint64_t v52 = v95;
      uint64_t v45 = (void *)v49;
      v47( v49 + ((*(unsigned __int8 *)(v52 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))
      + *(void *)(v95 + 72) * v51,
        v94,
        v8);
      uint64_t v55 = v52;
    }

    v43 += v44;
    --v42;
  }

  while (v42);
  uint64_t v53 = swift_bridgeObjectRelease_n(v91, 2LL);
  os_log_type_t v54 = v45;
LABEL_24:
  uint64_t v56 = v54[2];
  uint64_t v57 = v96;
  uint64_t v58 = v84;
  if (v56)
  {
    uint64_t v59 = (char *)v54 + ((*(unsigned __int8 *)(v55 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
    uint64_t v94 = *(char **)(v55 + 72);
    uint64_t v60 = *(uint64_t **)(v55 + 16);
    uint64_t v83 = v54;
    __n128 v61 = swift_bridgeObjectRetain(v54);
    v61.n128_u64[0] = 136315138LL;
    __n128 v92 = v61;
    uint64_t v91 = (void *)((char *)&type metadata for Any + 8);
    uint64_t v93 = v60;
    do
    {
      uint64_t v63 = v55;
      ((void (*)(char *, char *, uint64_t))v60)(v58, v59, v8);
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v64 = type metadata accessor for Logger(0LL);
      sub_458C(v64, (uint64_t)qword_3E310);
      uint64_t v65 = ((uint64_t (*)(char *, char *, uint64_t))v60)(v57, v58, v8);
      uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
      uint64_t v67 = v60;
      os_log_type_t v68 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v66, v68))
      {
        uint64_t v69 = swift_slowAlloc(12LL, -1LL);
        uint64_t v70 = swift_slowAlloc(32LL, -1LL);
        uint64_t v98 = v70;
        *(_DWORD *)uint64_t v69 = v92.n128_u32[0];
        type metadata accessor for SiriNLUTypesPrintUtils(0LL);
        v97[3] = v8;
        v97[4] = sub_5E50( &qword_3D2C8,  (uint64_t (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct,  (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_SystemDialogAct);
        uint64_t v71 = sub_DEBC(v97);
        ((void (*)(void *, char *, uint64_t))v67)(v71, v96, v8);
        uint64_t v72 = static SiriNLUTypesPrintUtils.printableProtoObject(object:)(v97);
        unint64_t v74 = v73;
        sub_76EC(v97);
        *(void *)(v69 + 4) = sub_12A3C(v72, v74, &v98);
        unint64_t v75 = v74;
        uint64_t v55 = v95;
        swift_bridgeObjectRelease(v75);
        uint64_t v76 = *(void (**)(char *, uint64_t))(v55 + 8);
        v76(v96, v8);
        _os_log_impl(&dword_0, v66, v68, "Posting SDA: %s", (uint8_t *)v69, 0xCu);
        swift_arrayDestroy(v70, 1LL, v91);
        swift_slowDealloc(v70, -1LL, -1LL);
        uint64_t v77 = v69;
        uint64_t v57 = v96;
        swift_slowDealloc(v77, -1LL, -1LL);

        v76(v58, v8);
      }

      else
      {

        uint64_t v55 = v63;
        uint64_t v62 = *(void (**)(char *, uint64_t))(v63 + 8);
        v62(v57, v8);
        v62(v58, v8);
      }

      uint64_t v60 = v93;
      uint64_t v59 = &v94[(void)v59];
      --v56;
    }

    while (v56);
    os_log_type_t v54 = v83;
    uint64_t v53 = swift_bridgeObjectRelease(v83);
  }

  uint64_t v78 = v90;
  NLContextUpdate.init()(v53);
  NLContextUpdate.nluSystemDialogActs.setter(v54);
  uint64_t v79 = sub_E600(v85, v86, v87, v88, v89);
  NLContextUpdate.rrEntities.setter(v79);
  uint64_t v80 = type metadata accessor for NLContextUpdate(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56LL))( v78,  0LL,  1LL,  v80);
}

void *sub_ACA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t result = _swiftEmptyArrayStorage;
  if (a3)
  {
    unint64_t v27 = (unint64_t)_swiftEmptyArrayStorage;
    (*(void (**)(char *, void, uint64_t))(v6 + 104))( v8,  enum case for RequestSummary.ExecutionSource.searchTool(_:),  v5);
    char v10 = static RequestSummary.ExecutionSource.== infix(_:_:)(a1, v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if ((v10 & 1) != 0)
    {
      v26[3] = &type metadata for FeatureEnablementProvider.Key;
      v26[4] = sub_F804();
      char v11 = isFeatureEnabled(_:)(v26);
      sub_76EC(v26);
      if ((v11 & 1) != 0)
      {
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v12 = type metadata accessor for Logger(0LL);
        uint64_t v13 = sub_458C(v12, (uint64_t)qword_3E310);
        uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
        os_log_type_t v15 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl( &dword_0,  v14,  v15,  "IFFlow SearchTool invoked + ShowASR FF Enabled. Appending Reveal ASR AceCommand",  v16,  2u);
          swift_slowDealloc(v16, -1LL, -1LL);
        }

        id v17 = [objc_allocWithZone(SAUIRevealRecognizedSpeech) init];
        CurrentRequest.rootRequestId.getter();
        if (v18) {
          unint64_t v19 = v18;
        }
        else {
          unint64_t v19 = 0xE000000000000000LL;
        }
        NSString v20 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v19);
        [v17 setRefId:v20];

        NSString v21 = String._bridgeToObjectiveC()();
        [v17 setOverriddenSpeech:v21];

        id v22 = v17;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v24 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v23 = *(void *)((char *)&dword_18 + (v27 & 0xFFFFFFFFFFFFFF8LL));
        if (v24 >= v23 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1LL);
        }
        uint64_t v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v22);
        specialized Array._endMutation()(v25);
      }
    }

    return (void *)v27;
  }

  return result;
}

uint64_t sub_AF2C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  unsigned int v33 = a4;
  uint64_t v10 = type metadata accessor for StatementOutcome(0LL);
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = sub_494C(&qword_3D248);
  __chkstk_darwin(v13);
  os_log_type_t v15 = &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = &v32[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v20 = type metadata accessor for ResponseType(0LL);
  __chkstk_darwin(v20);
  id v22 = &v32[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t))(v23 + 16))(v22, a2);
  OutputGenerationManifest.responseType.setter(v22);
  uint64_t v24 = sub_259D0();
  if (!v25)
  {
    uint64_t v24 = 0xD000000000000012LL;
    unint64_t v25 = 0x8000000000033570LL;
  }

  OutputGenerationManifest.responseViewId.setter(v24, v25);
  OutputGenerationManifest.listenAfterSpeaking.setter(v33);
  OutputGenerationManifest.printSupportingDialogInDisplayModes.setter(1LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v17 + 16))(v19, v34, v16);
  OutputGenerationManifest.executionSource.setter(v19);
  sub_F848(v35, (uint64_t)v15, &qword_3D248);
  OutputGenerationManifest.nlContextUpdate.setter(v15);
  __n128 v26 = swift_bridgeObjectRetain(a7);
  OutputGenerationManifest.additionalCommands.setter(v26);
  sub_257E4((uint64_t)v12);
  uint64_t v27 = sub_EA00((uint64_t)v12);
  uint64_t v29 = v28;
  (*(void (**)(_BYTE *, uint64_t))(v36 + 8))(v12, v37);
  id v30 = sub_F298(a3, v27, v29);
  swift_bridgeObjectRelease(v29);
  return OutputGenerationManifest.feedbackForm.setter(v30);
}

uint64_t sub_B15C(uint64_t a1)
{
  return sub_AF2C( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(unsigned __int8 *)(v1 + 32),  *(void *)(v1 + 40),  *(void *)(v1 + 48),  *(void *)(v1 + 56));
}

void *sub_B170(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_B194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v218 = a2;
  uint64_t v219 = a3;
  uint64_t v206 = type metadata accessor for ResponseOutput.VisualOutput.PluginSnippetOutputPayload(0LL);
  uint64_t v205 = *(void *)(v206 - 8);
  __chkstk_darwin(v206);
  v204 = (char *)&v194 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_494C(&qword_3D218);
  uint64_t v9 = __chkstk_darwin(v8);
  v214 = (char *)&v194 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v213 = (char *)&v194 - v11;
  uint64_t v12 = type metadata accessor for ResponseOutput.VisualOutput.SystemSnippetOutputPayload(0LL);
  uint64_t v222 = *(void *)(v12 - 8);
  uint64_t v223 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  v207 = (char *)&v194 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v13);
  v201 = (char *)&v194 - v16;
  __chkstk_darwin(v15);
  v221 = (char *)&v194 - v17;
  uint64_t v18 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v227 = v18;
  uint64_t v228 = v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v210 = (char *)&v194 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  v203 = (char *)&v194 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v209 = (char *)&v194 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v215 = (char *)&v194 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v230 = (uint64_t *)((char *)&v194 - v29);
  __chkstk_darwin(v28);
  v224 = (char *)&v194 - v30;
  v229 = (void (*)(char *, uint64_t))type metadata accessor for ResponseOutput.VisualOutputOptions(0LL);
  uint64_t v217 = *((void *)v229 - 1);
  __chkstk_darwin(v229);
  v212 = (char *)&v194 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v199 = type metadata accessor for SiriSDSViewModel(0LL);
  uint64_t v32 = *(void *)(v199 - 8);
  __chkstk_darwin(v199);
  v198 = (char *)&v194 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = sub_494C(&qword_3D1F0);
  uint64_t v35 = __chkstk_darwin(v34);
  v211 = (char *)&v194 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v35);
  uint64_t v38 = (char *)&v194 - v37;
  uint64_t v39 = type metadata accessor for RGPluginModel(0LL);
  uint64_t v225 = *(void *)(v39 - 8);
  uint64_t v226 = v39;
  uint64_t v40 = __chkstk_darwin(v39);
  v200 = (char *)&v194 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = __chkstk_darwin(v40);
  v202 = (char *)&v194 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  v220 = (char *)&v194 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  unint64_t v48 = (char *)&v194 - v47;
  __chkstk_darwin(v46);
  unint64_t v50 = (char *)&v194 - v49;
  uint64_t v51 = v4[14];
  uint64_t v52 = v4[15];
  sub_B170(v4 + 11, v51);
  uint64_t result = dispatch thunk of DeviceState.isCarPlay.getter(v51, v52);
  if ((result & 1) != 0)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(void *)(a4 + 32) = 0LL;
    *(void *)(a4 + 40) = _swiftEmptyArrayStorage;
    return result;
  }

  unint64_t v231 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v216 = a1;
  uint64_t v54 = sub_7FB8();
  uint64_t v58 = v228;
  uint64_t v208 = a4;
  if (v57)
  {
    unint64_t v59 = v55;
    uint64_t v196 = v56;
    uint64_t v197 = v57;
    uint64_t v60 = v54;
    uint64_t v61 = type metadata accessor for JSONDecoder(0LL);
    swift_allocObject(v61, *(unsigned int *)(v61 + 48), *(unsigned __int16 *)(v61 + 52));
    uint64_t v62 = JSONDecoder.init()();
    uint64_t v63 = sub_5E50( &qword_3D268,  (uint64_t (*)(uint64_t))&type metadata accessor for RGPluginModel,  (uint64_t)&protocol conformance descriptor for RGPluginModel);
    uint64_t v64 = v226;
    uint64_t v194 = v60;
    unint64_t v195 = v59;
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(v226, v60, v59, v226, v63);
    swift_release(v62);
    uint64_t v65 = v225;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v225 + 56))(v38, 0LL, 1LL, v64);
    (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v50, v38, v64);
    (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v48, v50, v64);
    if ((*(unsigned int (**)(char *, uint64_t))(v65 + 88))(v48, v64) == enum case for RGPluginModel.siriSDSView(_:))
    {
      swift_bridgeObjectRelease(v231);
      (*(void (**)(char *, uint64_t))(v65 + 96))(v48, v64);
      uint64_t v66 = (uint64_t)v198;
      uint64_t v67 = v199;
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v198, v48, v199);
      os_log_type_t v68 = sub_C134(v66, v218, v219);
      sub_DF50(v194, v195, v196, v197);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v66, v67);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v50, v64);
      unint64_t v231 = (unint64_t)v68;
      uint64_t v58 = v228;
    }

    else
    {
      uint64_t v69 = *(void (**)(char *, uint64_t))(v65 + 8);
      v69(v50, v64);
      uint64_t v70 = ((uint64_t (*)(char *, uint64_t))v69)(v48, v64);
      uint64_t v71 = v212;
      uint64_t v72 = ResponseOutput.options.getter(v70);
      LOBYTE(v69) = ResponseOutput.VisualOutputOptions.canReplacePrintableText.getter(v72);
      (*(void (**)(char *, void *))(v217 + 8))(v71, v229);
      unint64_t v73 = &SAAceViewUIItemTypeItemTypeSmartDialogValue;
      uint64_t v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v73);
      uint64_t v76 = v75;
      uint64_t v77 = v194;
      unint64_t v78 = v195;
      uint64_t v79 = v196;
      uint64_t v80 = v197;
      id v81 = sub_8E08(v194, v195, v196, v197, v218, v219, v74, v75);
      swift_bridgeObjectRelease(v76);
      id v82 = v81;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v84 = *(void *)((char *)&dword_10 + (v231 & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v83 = *(void *)((char *)&dword_18 + (v231 & 0xFFFFFFFFFFFFFF8LL));
      if (v84 >= v83 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v83 > 1, v84 + 1, 1LL);
      }
      uint64_t v85 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v84, v82);
      specialized Array._endMutation()(v85);

      sub_DF50(v77, v78, v79, v80);
      uint64_t v58 = v228;
      a4 = v208;
    }
  }

  v212 = (char *)sub_8348();
  uint64_t v86 = *((void *)v212 + 2);
  if (v86)
  {
    uint64_t v87 = &v212[(*(unsigned __int8 *)(v58 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80)];
    uint64_t v88 = *(void *)(v58 + 72);
    uint64_t v89 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
    LODWORD(v229) = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
    uint64_t v217 = SAAceViewUIItemTypeItemTypeResultValue;
    uint64_t v90 = v227;
    uint64_t v91 = v224;
    v89(v224, v87, v227);
    while (1)
    {
      uint64_t v92 = (uint64_t)v230;
      v89((char *)v230, v91, v90);
      int v93 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 88))(v92, v90);
      if (v93 == (_DWORD)v229)
      {
        uint64_t v94 = *(void (**)(uint64_t *, uint64_t))(v58 + 96);
        uint64_t v95 = (uint64_t)v230;
        v94(v230, v90);
        uint64_t v96 = v221;
        uint64_t v97 = v222;
        uint64_t v98 = v95;
        uint64_t v99 = v223;
        uint64_t v100 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v222 + 32))(v221, v98, v223);
        uint64_t v101 = v220;
        ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter(v100);
        uint64_t v102 = v99;
        uint64_t v58 = v228;
        (*(void (**)(char *, uint64_t))(v97 + 8))(v96, v102);
        uint64_t v103 = sub_5E50( &qword_3D260,  (uint64_t (*)(uint64_t))&type metadata accessor for RGPluginModel,  (uint64_t)&protocol conformance descriptor for RGPluginModel);
        uint64_t v104 = v226;
        uint64_t v105 = SnippetPluginModel.data.getter(v226, v103);
        unint64_t v107 = v106;
        uint64_t v90 = v227;
        uint64_t v108 = v104;
        uint64_t v91 = v224;
        uint64_t v109 = (*(uint64_t (**)(char *, uint64_t))(v225 + 8))(v101, v108);
        if (v107 >> 60 != 15)
        {
          uint64_t v110 = static RGPluginModel.bundleName.getter(v109);
          uint64_t v111 = v105;
          uint64_t v113 = v112;
          uint64_t v114 = static String._unconditionallyBridgeFromObjectiveC(_:)(v217);
          uint64_t v116 = v115;
          id v117 = sub_8E08(v111, v107, v110, v113, v218, v219, v114, v115);
          swift_bridgeObjectRelease(v113);
          swift_bridgeObjectRelease(v116);
          id v118 = v117;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          unint64_t v120 = *(void *)((char *)&dword_10 + (v231 & 0xFFFFFFFFFFFFFF8LL));
          unint64_t v119 = *(void *)((char *)&dword_18 + (v231 & 0xFFFFFFFFFFFFFF8LL));
          if (v120 >= v119 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v119 > 1, v120 + 1, 1LL);
          }
          uint64_t v121 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v120, v118);
          specialized Array._endMutation()(v121);
          sub_DEF8(v111, v107);

          uint64_t v90 = v227;
          uint64_t v58 = v228;
        }
      }

      else
      {
        (*(void (**)(uint64_t *, uint64_t))(v58 + 8))(v230, v90);
      }

      (*(void (**)(char *, uint64_t))(v58 + 8))(v91, v90);
      v87 += v88;
      if (!--v86) {
        break;
      }
      v89(v91, v87, v90);
    }

    uint64_t v122 = swift_bridgeObjectRelease(v212);
    uint64_t v123 = v208;
  }

  else
  {
    uint64_t v122 = swift_bridgeObjectRelease(v212);
    uint64_t v90 = v227;
    uint64_t v123 = a4;
  }

  uint64_t v124 = (uint64_t)v213;
  ResponseOutput.attribution.getter(v122);
  uint64_t v125 = *(uint64_t **)(v58 + 48);
  int v126 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v125)(v124, 1LL, v90);
  uint64_t v128 = (uint64_t)v214;
  uint64_t v127 = v215;
  if (v126 == 1)
  {
    sub_8DCC(v124, &qword_3D218);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v215, v124, v90);
    uint64_t v129 = v58;
    uint64_t v130 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
    uint64_t v131 = v209;
    v130(v209, v127, v90);
    uint64_t v132 = *(unsigned int (**)(char *, uint64_t))(v129 + 88);
    if (v132(v131, v90) == enum case for ResponseOutput.VisualOutput.pluginSnippet(_:))
    {
      (*(void (**)(char *, uint64_t))(v129 + 96))(v131, v90);
      uint64_t v133 = v205;
      int v134 = v204;
      uint64_t v135 = v206;
      uint64_t v136 = (*(uint64_t (**)(char *, char *, uint64_t))(v205 + 32))(v204, v131, v206);
      uint64_t v137 = ResponseOutput.VisualOutput.PluginSnippetOutputPayload.pluginModelData.getter(v136);
      unint64_t v139 = v138;
      uint64_t v140 = ResponseOutput.VisualOutput.PluginSnippetOutputPayload.bundleId.getter();
      uint64_t v142 = v141;
      (*(void (**)(char *, uint64_t))(v133 + 8))(v134, v135);
      uint64_t v143 = static String._unconditionallyBridgeFromObjectiveC(_:)(SAAceViewUIItemTypeItemTypeAttributionValue);
      uint64_t v145 = v144;
      v230 = (uint64_t *)v137;
      id v146 = sub_8E08(v137, v139, v140, v142, v218, v219, v143, v144);
      swift_bridgeObjectRelease(v145);
      id v147 = v146;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v149 = *(void *)((char *)&dword_10 + (v231 & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v148 = *(void *)((char *)&dword_18 + (v231 & 0xFFFFFFFFFFFFFF8LL));
      if (v149 >= v148 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v148 > 1, v149 + 1, 1LL);
      }
      uint64_t v150 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v149, v147);
      specialized Array._endMutation()(v150);
      sub_DF0C((uint64_t)v230, v139);

      swift_bridgeObjectRelease(v142);
      uint64_t v90 = v227;
      (*(void (**)(char *, uint64_t))(v129 + 8))(v215, v227);
      uint64_t v58 = v129;
      uint64_t v123 = v208;
    }

    else
    {
      v230 = v125;
      v151 = *(void (**)(char *, uint64_t))(v129 + 8);
      v151(v131, v90);
      v152 = v203;
      v130(v203, v127, v90);
      if (v132(v152, v90) == enum case for ResponseOutput.VisualOutput.systemSnippet(_:))
      {
        v229 = v151;
        (*(void (**)(char *, uint64_t))(v129 + 96))(v152, v90);
        uint64_t v153 = v222;
        v154 = v201;
        v155 = v152;
        uint64_t v156 = v223;
        uint64_t v157 = (*(uint64_t (**)(char *, char *, uint64_t))(v222 + 32))(v201, v155, v223);
        v158 = v200;
        ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter(v157);
        (*(void (**)(char *, uint64_t))(v153 + 8))(v154, v156);
        uint64_t v160 = v225;
        uint64_t v159 = v226;
        v161 = v202;
        (*(void (**)(char *, char *, uint64_t))(v225 + 32))(v202, v158, v226);
        uint64_t v162 = sub_5E50( &qword_3D260,  (uint64_t (*)(uint64_t))&type metadata accessor for RGPluginModel,  (uint64_t)&protocol conformance descriptor for RGPluginModel);
        uint64_t v163 = SnippetPluginModel.data.getter(v159, v162);
        if (v164 >> 60 == 15)
        {
          (*(void (**)(char *, uint64_t))(v160 + 8))(v161, v159);
          v229(v215, v90);
          uint64_t v58 = v228;
          uint64_t v125 = v230;
        }

        else
        {
          uint64_t v165 = v163;
          unint64_t v166 = v164;
          uint64_t v167 = static RGPluginModel.bundleName.getter(v163);
          uint64_t v169 = v168;
          uint64_t v170 = static String._unconditionallyBridgeFromObjectiveC(_:)(SAAceViewUIItemTypeItemTypeAttributionValue);
          uint64_t v172 = v171;
          id v173 = sub_8E08(v165, v166, v167, v169, v218, v219, v170, v171);
          swift_bridgeObjectRelease(v169);
          swift_bridgeObjectRelease(v172);
          id v174 = v173;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          unint64_t v176 = *(void *)((char *)&dword_10 + (v231 & 0xFFFFFFFFFFFFFF8LL));
          unint64_t v175 = *(void *)((char *)&dword_18 + (v231 & 0xFFFFFFFFFFFFFF8LL));
          uint64_t v177 = v165;
          v178 = v229;
          uint64_t v125 = v230;
          if (v176 >= v175 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v175 > 1, v176 + 1, 1LL);
          }
          uint64_t v179 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v176, v174);
          specialized Array._endMutation()(v179);
          sub_DEF8(v177, v166);

          (*(void (**)(char *, uint64_t))(v225 + 8))(v202, v226);
          uint64_t v90 = v227;
          v178(v215, v227);
          uint64_t v58 = v228;
        }
      }

      else
      {
        v151(v152, v90);
        v151(v127, v90);
        uint64_t v58 = v129;
        uint64_t v125 = v230;
      }
    }
  }

  sub_7CC8(v128);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v125)(v128, 1LL, v90) == 1)
  {
    v180 = &qword_3D218;
    uint64_t v181 = v128;
  }

  else
  {
    v182 = v210;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v210, v128, v90);
    if ((*(unsigned int (**)(char *, uint64_t))(v58 + 88))(v182, v90) == enum case for ResponseOutput.VisualOutput.systemSnippet(_:))
    {
      (*(void (**)(char *, uint64_t))(v58 + 96))(v182, v90);
      uint64_t v183 = v222;
      v184 = v207;
      v185 = v182;
      uint64_t v186 = v58;
      uint64_t v187 = v223;
      uint64_t v188 = (*(uint64_t (**)(char *, char *, uint64_t))(v222 + 32))(v207, v185, v223);
      v189 = v211;
      ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter(v188);
      (*(void (**)(char *, uint64_t))(v183 + 8))(v184, v187);
      uint64_t v191 = v225;
      uint64_t v190 = v226;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v225 + 56))(v189, 0LL, 1LL, v226);
      (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v128, v90);
    }

    else
    {
      v192 = *(void (**)(char *, uint64_t))(v58 + 8);
      v192(v182, v90);
      uint64_t v191 = v225;
      uint64_t v190 = v226;
      v189 = v211;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v225 + 56))(v211, 1LL, 1LL, v226);
      v192((char *)v128, v90);
    }

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v191 + 48))(v189, 1LL, v190) != 1)
    {
      *(void *)(v123 + 24) = v190;
      *(void *)(v123 + 32) = sub_5E50( &qword_3D260,  (uint64_t (*)(uint64_t))&type metadata accessor for RGPluginModel,  (uint64_t)&protocol conformance descriptor for RGPluginModel);
      v193 = sub_DEBC((void *)v123);
      uint64_t result = (*(uint64_t (**)(void *, char *, uint64_t))(v191 + 32))(v193, v189, v190);
      goto LABEL_45;
    }

    v180 = &qword_3D1F0;
    uint64_t v181 = (uint64_t)v189;
  }

  uint64_t result = sub_8DCC(v181, v180);
  *(void *)(v123 + 32) = 0LL;
  *(_OWORD *)uint64_t v123 = 0u;
  *(_OWORD *)(v123 + 16) = 0u;
LABEL_45:
  *(void *)(v123 + 40) = v231;
  return result;
}

uint64_t sub_C10C()
{
  return DismissalSettings.minimumAutoDismissalTimeInMs.setter(25000LL, 0LL);
}

void *sub_C134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = SiriSDSViewModel.sdsData.getter();
  unint64_t v7 = v6;
  uint64_t v8 = SiriSDSViewModel.sdsBundleId.getter();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(SAAceViewUIItemTypeItemTypeSmartDialogValue);
  uint64_t v13 = v12;
  id v14 = sub_8E08(v5, v7, v8, v10, a2, a3, v11, v12);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v13);
  sub_DF0C(v5, v7);
  id v15 = v14;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v17 = *(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v16 = *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
  if (v17 >= v16 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1LL);
  }
  uint64_t v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v15);
  uint64_t v19 = specialized Array._endMutation()(v18);
  uint64_t v20 = SiriSDSViewModel.snippetData.getter(v19);
  if (v21 >> 60 == 15)
  {
  }

  else
  {
    uint64_t v22 = v20;
    unint64_t v23 = v21;
    uint64_t v24 = SiriSDSViewModel.snippetBundleId.getter();
    if (v25)
    {
      uint64_t v26 = v24;
      uint64_t v27 = v25;
      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(SAAceViewUIItemTypeItemTypeResultValue);
      uint64_t v30 = v29;
      id v31 = sub_8E08(v22, v23, v26, v27, a2, a3, v28, v29);
      swift_bridgeObjectRelease(v30);
      swift_bridgeObjectRelease(v27);
      id v32 = v31;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v34 = *(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v33 = *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      if (v34 >= v33 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1LL);
      }
      uint64_t v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v32);
      specialized Array._endMutation()(v35);

      sub_DEF8(v22, v23);
    }

    else
    {

      sub_DEF8(v22, v23);
    }
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_C35C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v111 = *(void *)(v2 - 8);
  uint64_t v112 = v2;
  __chkstk_darwin(v2);
  uint64_t v110 = (char *)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed(0LL);
  uint64_t v106 = *(void *)(v4 - 8);
  uint64_t v107 = v4;
  __chkstk_darwin(v4);
  uint64_t v97 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_3D2D8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v105 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v114 = (char *)&v97 - v9;
  uint64_t v10 = sub_494C(&qword_3D2C0);
  uint64_t v108 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v109 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v103 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v113 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v102 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_3D2E0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v101 = (uint64_t)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v116 = (uint64_t)&v97 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v100 = (uint64_t)&v97 - v19;
  __chkstk_darwin(v18);
  uint64_t v115 = (uint64_t)&v97 - v20;
  uint64_t v21 = sub_494C(&qword_3D2E8);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v104 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = __chkstk_darwin(v22);
  id v117 = (char *)&v97 - v25;
  __chkstk_darwin(v24);
  id v118 = (char *)&v97 - v26;
  uint64_t v27 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v97 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = sub_494C(&qword_3D240);
  uint64_t v32 = __chkstk_darwin(v31);
  unint64_t v34 = (char *)&v97 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v97 - v35;
  uint64_t v37 = a1;
  sub_F848(a1, (uint64_t)&v97 - v35, &qword_3D240);
  uint64_t v38 = type metadata accessor for RGActionConfirmationModel(0LL);
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v40(v36, 1LL, v38) == 1)
  {
    sub_8DCC((uint64_t)v36, &qword_3D240);
    uint64_t v98 = 0LL;
    uint64_t v41 = 0LL;
  }

  else
  {
    RGActionConfirmationModel.affirmative.getter();
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v36, v38);
    uint64_t v98 = LocalizedStringResource.key.getter(v42);
    uint64_t v41 = v43;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  }

  sub_F848(v37, (uint64_t)v34, &qword_3D240);
  if (v40(v34, 1LL, v38) == 1)
  {
    sub_8DCC((uint64_t)v34, &qword_3D240);
    uint64_t v99 = 0LL;
    uint64_t v44 = 0LL;
  }

  else
  {
    RGActionConfirmationModel.negative.getter();
    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v34, v38);
    uint64_t v99 = LocalizedStringResource.key.getter(v45);
    uint64_t v44 = v46;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  }

  uint64_t v47 = v103;
  uint64_t v48 = (uint64_t)v104;
  uint64_t v49 = v115;
  sub_CD1C(v98, v41, v115);
  swift_bridgeObjectRelease(v41);
  uint64_t v50 = v49;
  uint64_t v51 = v100;
  sub_F848(v50, v100, &qword_3D2E0);
  uint64_t v52 = v113;
  uint64_t v53 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v113 + 48);
  if (v53(v51, 1LL, v47) == 1)
  {
    uint64_t v54 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56LL))(v118, 1LL, 1LL, v54);
  }

  else
  {
    unint64_t v55 = v102;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v102, v51, v47);
    uint64_t v56 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
    __chkstk_darwin(v56);
    *(&v97 - 2) = v55;
    uint64_t v58 = sub_5E50(&qword_3D2F0, v57, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_UserDialogAct);
    uint64_t v59 = (uint64_t)v118;
    static Message.with(_:)(sub_F8D4, &v97 - 4, v56, v58);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v47);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56LL))(v59, 0LL, 1LL, v56);
  }

  uint64_t v60 = v47;
  sub_8DCC(v115, &qword_3D2E0);
  uint64_t v61 = v116;
  sub_CD1C(v99, v44, v116);
  swift_bridgeObjectRelease(v44);
  uint64_t v62 = v101;
  sub_F848(v61, v101, &qword_3D2E0);
  if (v53(v62, 1LL, v60) == 1)
  {
    uint64_t v63 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56LL))(v117, 1LL, 1LL, v63);
  }

  else
  {
    uint64_t v64 = v60;
    uint64_t v65 = v113;
    uint64_t v66 = v102;
    (*(void (**)(char *, uint64_t, uint64_t))(v113 + 32))(v102, v62, v64);
    uint64_t v63 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
    __chkstk_darwin(v63);
    *(&v97 - 2) = v66;
    uint64_t v68 = sub_5E50(&qword_3D2F0, v67, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_UserDialogAct);
    uint64_t v69 = v117;
    static Message.with(_:)(sub_F8BC, &v97 - 4, v63, v68);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v64);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56LL))(v69, 0LL, 1LL, v63);
  }

  uint64_t v70 = (uint64_t)v109;
  uint64_t v71 = v107;
  uint64_t v72 = (uint64_t)v114;
  sub_8DCC(v116, &qword_3D2E0);
  sub_F848((uint64_t)v118, v48, &qword_3D2E8);
  type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v73 = *(void *)(v63 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v48, 1LL, v63) == 1)
  {
    sub_8DCC(v48, &qword_3D2E8);
    uint64_t v74 = 1LL;
  }

  else
  {
    Siri_Nlu_External_UserDialogAct.wantedToProceed.getter();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v48, v63);
    uint64_t v74 = 0LL;
  }

  uint64_t v75 = (uint64_t)v105;
  uint64_t v76 = v106;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56))(v72, v74, 1LL, v71);
  sub_F848(v72, v75, &qword_3D2D8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v75, 1LL, v71) == 1)
  {
    uint64_t v78 = v111;
    uint64_t v77 = v112;
    uint64_t v79 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v111 + 56);
    v79(v70, 1LL, 1LL, v112);
  }

  else
  {
    uint64_t v78 = v111;
    uint64_t v80 = v97;
    uint64_t v81 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v76 + 32))(v97, v75, v71);
    __chkstk_darwin(v81);
    *(&v97 - 2) = v80;
    uint64_t v82 = sub_5E50( &qword_3D2C8,  (uint64_t (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct,  (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_SystemDialogAct);
    uint64_t v77 = v112;
    static Message.with(_:)(sub_F8A4, &v97 - 4, v112, v82);
    unint64_t v83 = v80;
    uint64_t v72 = (uint64_t)v114;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v83, v71);
    uint64_t v79 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56);
    v79(v70, 0LL, 1LL, v77);
  }

  uint64_t v84 = sub_8DCC(v72, &qword_3D2D8);
  __chkstk_darwin(v84);
  uint64_t v85 = (uint64_t)v117;
  *(&v97 - 2) = v118;
  *(&v97 - 1) = (char *)v85;
  uint64_t v86 = sub_5E50( &qword_3D2C8,  (uint64_t (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct,  (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_SystemDialogAct);
  uint64_t v87 = v110;
  uint64_t v88 = v77;
  static Message.with(_:)(sub_F88C, &v97 - 4, v77, v86);
  uint64_t v89 = sub_494C(&qword_3D2D0);
  uint64_t v90 = *(void *)(v108 + 72);
  uint64_t v91 = *(unsigned __int8 *)(v108 + 80);
  uint64_t v92 = (v91 + 32) & ~v91;
  uint64_t v93 = swift_allocObject(v89, v92 + 2 * v90, v91 | 7);
  *(_OWORD *)(v93 + 16) = xmmword_31360;
  uint64_t v94 = v93 + v92;
  sub_F848(v70, v94, &qword_3D2C0);
  uint64_t v95 = v94 + v90;
  (*(void (**)(uint64_t, char *, uint64_t))(v78 + 16))(v95, v87, v88);
  v79(v95, 0LL, 1LL, v88);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v87, v88);
  sub_8DCC(v70, &qword_3D2C0);
  sub_8DCC(v85, &qword_3D2E8);
  sub_8DCC((uint64_t)v118, &qword_3D2E8);
  return v93;
}

uint64_t sub_CD1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_494C(&qword_3D328);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2)
  {
    uint64_t v9 = type metadata accessor for UsoTaskBuilder_authorise_common_App(0LL);
    swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
    uint64_t v10 = UsoTaskBuilder_authorise_common_App.init()();
    uint64_t v11 = type metadata accessor for UsoEntityBuilder_common_App(0LL);
    swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
    uint64_t v12 = UsoEntityBuilder_common_App.init()();
    dispatch thunk of UsoEntityBuilder_common_App.setName(value:)(a1, a2);
    dispatch thunk of Uso_VerbTemplateBuilder_ReferenceControl.setReference(value:)(v12);
    uint64_t v13 = sub_494C(&qword_3D208);
    uint64_t v14 = swift_allocObject(v13, 40LL, 7LL);
    *(_OWORD *)(v14 + 16) = xmmword_312F0;
    *(void *)(v14 + 32) = v10;
    uint64_t v22 = v14;
    specialized Array._endMutation()();
    uint64_t v15 = v22;
    uint64_t v16 = type metadata accessor for UsoBuilderOptions(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v8, 1LL, 1LL, v16);
    swift_retain(v10);
    uint64_t v17 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v15, v8);
    swift_bridgeObjectRelease(v15);
    sub_8DCC((uint64_t)v8, &qword_3D328);
    static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v17, 0LL);
    swift_release(v17);
    swift_release(v10);
    swift_release(v12);
    uint64_t v19 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))( a3,  0LL,  1LL,  v19);
  }

  else
  {
    uint64_t v18 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))( a3,  1LL,  1LL,  v18);
  }

uint64_t sub_CF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = a2;
  uint64_t v7 = sub_5E50(&qword_3D2F8, v6, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_UserWantedToProceed);
  static Message.with(_:)(sub_F8EC, v9, v3, v7);
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter(v5);
}

uint64_t sub_D018(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserRejected(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = a2;
  uint64_t v7 = sub_5E50(&qword_3D300, v6, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_UserRejected);
  static Message.with(_:)(sub_F914, v9, v3, v7);
  return Siri_Nlu_External_UserDialogAct.rejected.setter(v5);
}

uint64_t sub_D0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_SystemOffered(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = a2;
  uint64_t v7 = sub_5E50(&qword_3D308, v6, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_SystemOffered);
  static Message.with(_:)(sub_F93C, v9, v3, v7);
  return Siri_Nlu_External_SystemDialogAct.offered.setter(v5);
}

uint64_t sub_D1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = a2;
  uint64_t v7 = sub_5E50(&qword_3D2F0, v6, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_UserDialogAct);
  static Message.with(_:)(sub_F954, v9, v3, v7);
  return Siri_Nlu_External_SystemOffered.offeredAct.setter(v5);
}

uint64_t sub_D27C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(char *))
{
  uint64_t v6 = a3(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v11 - v7;
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)v11 - v7, a2);
  return a4(v8);
}

uint64_t sub_D30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_SystemGaveOptions(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v9 = sub_5E50(&qword_3D310, v8, (uint64_t)&protocol conformance descriptor for Siri_Nlu_External_SystemGaveOptions);
  static Message.with(_:)(sub_F97C, v11, v5, v9);
  return Siri_Nlu_External_SystemDialogAct.gaveOptions.setter(v7);
}

uint64_t sub_D3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = a1;
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - v7;
  uint64_t v42 = sub_494C(&qword_3D2E8);
  uint64_t v9 = *(void *)(v42 - 8);
  uint64_t v10 = __chkstk_darwin(v42);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = sub_494C(&qword_3D318);
  uint64_t v16 = *(void *)(v9 + 72);
  uint64_t v17 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = swift_allocObject(v15, v18 + 2 * v16, v17 | 7);
  *(_OWORD *)(v19 + 16) = xmmword_31360;
  uint64_t v20 = v19 + v18;
  sub_F848(v40, v20, &qword_3D2E8);
  uint64_t v39 = v20 + v16;
  sub_F848(v41, v20 + v16, &qword_3D2E8);
  uint64_t v40 = v20;
  sub_F848(v20, (uint64_t)v14, &qword_3D2E8);
  sub_F994((uint64_t)v14, (uint64_t)v12, &qword_3D2E8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  int v22 = v21(v12, 1LL, v3);
  uint64_t v41 = v4;
  if (v22 == 1)
  {
    sub_8DCC((uint64_t)v12, &qword_3D2E8);
    uint64_t v23 = (char *)_swiftEmptyArrayStorage;
    uint64_t v24 = v44;
  }

  else
  {
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v25(v8, v12, v3);
    uint64_t v38 = (void (*)(unint64_t, char *, uint64_t))v25;
    v25(v44, v8, v3);
    uint64_t v23 = (char *)_swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
      uint64_t v23 = (char *)sub_DBA4( 0,  _swiftEmptyArrayStorage[2] + 1LL,  1,  (unint64_t)_swiftEmptyArrayStorage,  &qword_3D320,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    unint64_t v27 = *((void *)v23 + 2);
    unint64_t v26 = *((void *)v23 + 3);
    if (v27 >= v26 >> 1) {
      uint64_t v23 = (char *)sub_DBA4( v26 > 1,  v27 + 1,  1,  (unint64_t)v23,  &qword_3D320,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    *((void *)v23 + 2) = v27 + 1;
    uint64_t v24 = v44;
    v38(v28, v44, v3);
  }

  sub_F848(v39, (uint64_t)v14, &qword_3D2E8);
  sub_F994((uint64_t)v14, (uint64_t)v12, &qword_3D2E8);
  if (v21(v12, 1LL, v3) == 1)
  {
    sub_8DCC((uint64_t)v12, &qword_3D2E8);
  }

  else
  {
    uint64_t v29 = v41;
    uint64_t v30 = v3;
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
    v31(v8, v12, v30);
    uint64_t v32 = v8;
    uint64_t v33 = v30;
    v31(v24, v32, v30);
    if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0) {
      uint64_t v23 = (char *)sub_DBA4( 0,  *((void *)v23 + 2) + 1LL,  1,  (unint64_t)v23,  &qword_3D320,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    unint64_t v35 = *((void *)v23 + 2);
    unint64_t v34 = *((void *)v23 + 3);
    if (v35 >= v34 >> 1) {
      uint64_t v23 = (char *)sub_DBA4( v34 > 1,  v35 + 1,  1,  (unint64_t)v23,  &qword_3D320,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    *((void *)v23 + 2) = v35 + 1;
    v31( &v23[((*(unsigned __int8 *)(v29 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))
         + *(void *)(v29 + 72) * v35],
      v24,
      v33);
  }

  swift_setDeallocating(v19);
  swift_arrayDestroy(v40, *(void *)(v19 + 16), v42);
  swift_deallocClassInstance(v19, 32LL, 7LL);
  return Siri_Nlu_External_SystemGaveOptions.choices.setter(v23);
}

uint64_t sub_D7DC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v33 = a5;
  uint64_t v34 = a3;
  uint64_t v31 = a4;
  uint64_t v32 = a1;
  uint64_t v10 = sub_494C(&qword_3D350);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_3D290);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for UUID(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = UUID.init()(v18);
  uint64_t v22 = UUID.uuidString.getter(v21);
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  uint64_t v25 = type metadata accessor for TypedValue(0LL);
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v15, a2, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v15, 0LL, 1LL, v25);
  uint64_t v27 = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRetain(a6);
  GroupIdentifier.init(id:seq:)(v33, a6, v32);
  uint64_t v28 = type metadata accessor for GroupIdentifier(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56LL))(v12, 0LL, 1LL, v28);
  RREntity.init(id:appBundleId:typedValue:dataType:data:group:)( v22,  v24,  v34,  v27,  v15,  0LL,  0LL,  0LL,  0xF000000000000000LL,  v12);
  uint64_t v29 = type metadata accessor for RREntity(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(a7, 0LL, 1LL, v29);
}

uint64_t sub_DB78(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_DB90(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_DBA4( a1,  a2,  a3,  a4,  &qword_3D320,  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
}

uint64_t sub_DBA4( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v10 = a2;
  }

  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_494C(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15) {
    goto LABEL_29;
  }
  if (v19 - v17 == 0x8000000000000000LL && v15 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = a6(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    unint64_t v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(void *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }

    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_E19C(0LL, v11, v24, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

void *sub_DDB0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_494C(&qword_3D2A8);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      void v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4]) {
          memmove(v14, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_E910(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_DEBC(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_DEF8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_DF0C(result, a2);
  }
  return result;
}

uint64_t sub_DF0C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_DF50(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    sub_DF0C(result, a2);
    return swift_bridgeObjectRelease(a4);
  }

  return result;
}

void *sub_DF7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ParameterDisambiguation(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ActionSuccess(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for StatementOutcome(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v14 == enum case for StatementOutcome.success(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    uint64_t v15 = sub_494C(&qword_3D2B0);
    uint64_t v16 = type metadata accessor for TypedValue(0LL);
    uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL))
          + *(void *)(*(void *)(v16 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_31350;
    ActionSuccess.returnValue.getter();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  else if (v14 == enum case for StatementOutcome.parameterDisambiguation(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    uint64_t v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    uint64_t v17 = ParameterDisambiguation.items.getter(v18);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return _swiftEmptyArrayStorage;
  }

  return (void *)v17;
}

uint64_t sub_E19C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(a5(0LL) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  uint64_t v13 = v11 * v5;
  unint64_t v14 = a3 + v13;
  unint64_t v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

void *sub_E2B4(uint64_t a1, void (*a2)(uint64_t, char *))
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_494C(&qword_3D338);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = type metadata accessor for RREntity(0LL);
  uint64_t v6 = *(void *)(v34 - 8);
  uint64_t v7 = __chkstk_darwin(v34);
  uint64_t v43 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v33 = (char *)&v32 - v9;
  uint64_t v42 = sub_494C(&qword_3D340);
  uint64_t v10 = __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v13 = (uint64_t *)((char *)&v32 - v12);
  uint64_t v14 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  uint64_t v40 = v14;
  uint64_t v32 = a1;
  if (v14)
  {
    uint64_t v38 = v5;
    uint64_t v45 = v6;
    uint64_t v15 = 0LL;
    uint64_t v39 = type metadata accessor for TypedValue(0LL);
    uint64_t v16 = *(void *)(v39 - 8);
    uint64_t v17 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    uint64_t v36 = *(void *)(v16 + 72);
    uint64_t v37 = v16;
    unint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    uint64_t v18 = _swiftEmptyArrayStorage;
    uint64_t v19 = v34;
    do
    {
      uint64_t v20 = v42;
      uint64_t v21 = &v41[*(int *)(v42 + 48)];
      uint64_t v22 = v39;
      v35(v21, v17, v39);
      unint64_t v23 = (char *)v13 + *(int *)(v20 + 48);
      *uint64_t v13 = v15;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v23, v21, v22);
      uint64_t v24 = (uint64_t)v38;
      v44(v15, v23);
      sub_8DCC((uint64_t)v13, &qword_3D340);
      uint64_t v25 = v45;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v24, 1LL, v19) == 1)
      {
        sub_8DCC(v24, &qword_3D338);
      }

      else
      {
        uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
        uint64_t v27 = v33;
        v26(v33, v24, v19);
        v26(v43, (uint64_t)v27, v19);
        if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0) {
          uint64_t v18 = (void *)sub_DBA4( 0,  v18[2] + 1LL,  1,  (unint64_t)v18,  &qword_3D348,  (uint64_t (*)(void))&type metadata accessor for RREntity);
        }
        unint64_t v29 = v18[2];
        unint64_t v28 = v18[3];
        if (v29 >= v28 >> 1) {
          uint64_t v18 = (void *)sub_DBA4( v28 > 1,  v29 + 1,  1,  (unint64_t)v18,  &qword_3D348,  (uint64_t (*)(void))&type metadata accessor for RREntity);
        }
        v18[2] = v29 + 1;
        unint64_t v30 = (unint64_t)v18
        uint64_t v19 = v34;
        v26((char *)v30, (uint64_t)v43, v34);
      }

      ++v15;
      v17 += v36;
    }

    while (v40 != v15);
  }

  else
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease(v32);
  return v18;
}

void *sub_E600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    uint64_t v5 = sub_DF7C(a5);
    uint64_t v6 = __chkstk_darwin(v5);
    uint64_t v7 = sub_E2B4(v6, (void (*)(uint64_t, char *))sub_F9D8);
    swift_bridgeObjectRelease(v5);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v8 = type metadata accessor for Logger(0LL);
    sub_458C(v8, (uint64_t)qword_3E310);
    uint64_t v9 = swift_bridgeObjectRetain_n(v7, 3LL);
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc(22LL, -1LL);
      uint64_t v13 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v12 = 134218242;
      uint64_t v25 = v7[2];
      v26[0] = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26);
      swift_bridgeObjectRelease(v7);
      *(_WORD *)(v12 + 12) = 2080;
      uint64_t v14 = type metadata accessor for RREntity(0LL);
      uint64_t v15 = swift_bridgeObjectRetain(v7);
      uint64_t v16 = Array.description.getter(v15, v14);
      unint64_t v18 = v17;
      swift_bridgeObjectRelease(v7);
      uint64_t v25 = sub_12A3C(v16, v18, v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26);
      swift_bridgeObjectRelease_n(v7, 2LL);
      swift_bridgeObjectRelease(v18);
      _os_log_impl(&dword_0, v10, v11, "IFFlow donating %ld RREntities: %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1LL, -1LL);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v7, 3LL);
    }
  }

  else
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_458C(v19, (uint64_t)qword_3E310);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "Nil requestId. Not donating entities to SRR", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    return _swiftEmptyArrayStorage;
  }

  return v7;
}

uint64_t sub_E910(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_EA00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TypedValue.PrimitiveValue(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_3D290);
  __chkstk_darwin(v6);
  uint64_t v69 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TypedValue.EntityValue(0LL);
  uint64_t v71 = *(void *)(v8 - 8);
  uint64_t v72 = v8;
  __chkstk_darwin(v8);
  uint64_t v70 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TypedValue(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v61 - v15;
  unint64_t v17 = sub_DF7C(a1);
  uint64_t v18 = v17[2];
  if (v18)
  {
    uint64_t v63 = (uint64_t *)v5;
    uint64_t v64 = v3;
    uint64_t v65 = v2;
    uint64_t v19 = (char *)v17 + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v20 = *(void *)(v11 + 72);
    uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v74 = v20;
    int v21 = enum case for TypedValue.entity(_:);
    int v67 = enum case for TypedValue.primitive(_:);
    int v62 = enum case for TypedValue.PrimitiveValue.string(_:);
    uint64_t v61 = v17;
    __n128 v22 = swift_bridgeObjectRetain(v17);
    uint64_t v66 = _swiftEmptyArrayStorage;
    int v68 = v21;
    while (1)
    {
      uint64_t v24 = v73;
      ((void (*)(char *, char *, uint64_t, __n128))v73)(v16, v19, v10, v22);
      v24(v14, v16, v10);
      uint64_t v25 = *(unsigned int (**)(char *, uint64_t))(v11 + 88);
      if (v25(v14, v10) == v21) {
        break;
      }
      unint64_t v23 = *(void (**)(char *, uint64_t))(v11 + 8);
      v23(v14, v10);
      v23(v16, v10);
LABEL_4:
      v19 += v74;
      if (!--v18)
      {
        swift_bridgeObjectRelease_n(v61, 2LL);
        uint64_t v49 = v66;
        goto LABEL_26;
      }
    }

    uint64_t v26 = *(void (**)(char *, uint64_t))(v11 + 96);
    v26(v14, v10);
    uint64_t v27 = *(void *)v14;
    uint64_t v28 = swift_projectBox(*(void *)v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v70, v28, v72);
    uint64_t v29 = swift_release(v27);
    uint64_t v30 = TypedValue.EntityValue.properties.getter(v29);
    if (*(void *)(v30 + 16) && (unint64_t v31 = sub_1307C(0x65736E6F70736572LL, 0xE800000000000000LL), (v32 & 1) != 0))
    {
      v73(v69, (char *)(*(void *)(v30 + 56) + v31 * v74), v10);
      uint64_t v33 = 0LL;
    }

    else
    {
      uint64_t v33 = 1LL;
    }

    uint64_t v34 = v69;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v69, v33, 1LL, v10);
    swift_bridgeObjectRelease(v30);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v72);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v34, 1LL, v10) == 1)
    {
      sub_8DCC((uint64_t)v34, &qword_3D290);
    }

    else
    {
      unsigned int v35 = v25(v34, v10);
      if (v35 == v67)
      {
        v26(v34, v10);
        uint64_t v36 = *(void *)v34;
        uint64_t v37 = swift_projectBox(*(void *)v34);
        uint64_t v38 = v63;
        uint64_t v39 = v64;
        uint64_t v40 = v65;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v64 + 16))(v63, v37, v65);
        int v41 = (*(uint64_t (**)(uint64_t *, uint64_t))(v39 + 88))(v38, v40);
        if (v41 == v62)
        {
          (*(void (**)(uint64_t *, uint64_t))(v39 + 96))(v38, v40);
          uint64_t v42 = v36;
          uint64_t v43 = *v38;
          uint64_t v44 = v38[1];
          swift_release(v42);
          (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
          if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) != 0) {
            uint64_t v45 = v66;
          }
          else {
            uint64_t v45 = sub_DDB0(0LL, v66[2] + 1LL, 1, v66);
          }
          unint64_t v47 = v45[2];
          unint64_t v46 = v45[3];
          if (v47 >= v46 >> 1) {
            uint64_t v45 = sub_DDB0((void *)(v46 > 1), v47 + 1, 1, v45);
          }
          v45[2] = v47 + 1;
          uint64_t v66 = v45;
          uint64_t v48 = &v45[2 * v47];
          v48[4] = v43;
          v48[5] = v44;
          goto LABEL_22;
        }

        (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v38, v40);
        swift_release(v36);
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v34, v10);
      }
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
LABEL_22:
    int v21 = v68;
    goto LABEL_4;
  }

  swift_bridgeObjectRelease(v17);
  uint64_t v49 = _swiftEmptyArrayStorage;
LABEL_26:
  uint64_t v75 = (uint64_t)v49;
  uint64_t v50 = sub_494C(&qword_3D298);
  unint64_t v51 = sub_F7B4();
  uint64_t v52 = BidirectionalCollection<>.joined(separator:)(10LL, 0xE100000000000000LL, v50, v51);
  uint64_t v54 = v53;
  swift_bridgeObjectRelease(v49);
  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v55 = type metadata accessor for Logger(0LL);
  sub_458C(v55, (uint64_t)qword_3E310);
  swift_bridgeObjectRetain(v54);
  uint64_t v57 = (os_log_s *)Logger.logObject.getter(v56);
  os_log_type_t v58 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v59 = 134217984;
    uint64_t v75 = String.count.getter(v52, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76);
    swift_bridgeObjectRelease(v54);
    _os_log_impl(&dword_0, v57, v58, "IFFlow retrieving string content for feedback form with length: %ld", v59, 0xCu);
    swift_slowDealloc(v59, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v54);
  }

  return v52;
}

uint64_t sub_EFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  unint64_t v2 = sub_F72C();
  uint64_t v3 = StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)( 46LL,  0xE100000000000000LL,  0x7FFFFFFFFFFFFFFFLL,  1LL,  &type metadata for String,  v2);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 + 16);
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = (uint64_t *)(v3 + 32 * v5);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v10 = v6[2];
  uint64_t v9 = v6[3];
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v4);
  uint64_t v25 = v7;
  uint64_t v26 = v8;
  uint64_t v27 = v10;
  uint64_t v28 = v9;
  uint64_t v23 = 0x65746172656E6547LL;
  unint64_t v24 = 0xE800000000000000LL;
  unint64_t v11 = sub_F770();
  if ((StringProtocol.contains<A>(_:)(&v23, &type metadata for Substring, &type metadata for String, v11, v2) & 1) == 0)
  {
    uint64_t v3 = v9;
LABEL_9:
    swift_bridgeObjectRelease(v3);
    return 0LL;
  }

  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  sub_458C(v12, (uint64_t)qword_3E310);
  uint64_t v13 = swift_bridgeObjectRetain_n(v9, 2LL);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_bridgeObjectRetain(v9);
    uint64_t v17 = static String._fromSubstring(_:)(v7, v8, v10, v9);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease(v9);
    uint64_t v23 = sub_12A3C(v17, v19, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
    swift_bridgeObjectRelease_n(v9, 2LL);
    swift_bridgeObjectRelease(v19);
    _os_log_impl(&dword_0, v14, v15, "IFFlow setting subFeature as: %s", v16, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v9, 2LL);
  }

  uint64_t v20 = static String._fromSubstring(_:)(v7, v8, v10, v9);
  swift_bridgeObjectRelease(v9);
  return v20;
}

id sub_F298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemResponse(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v41[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for StatementOutcome(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v41[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  sub_257E4((uint64_t)v13);
  id v14 = 0LL;
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v11 + 88))(v13, v10) == enum case for StatementOutcome.success(_:))
  {
    uint64_t v46 = a2;
    uint64_t v47 = a3;
    uint64_t v48 = a1;
    uint64_t v15 = sub_259D0();
    if (v16) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = 0xD000000000000012LL;
    }
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = 0x8000000000033570LL;
    }
    v51[0] = v17;
    v51[1] = v18;
    uint64_t v49 = 0xD000000000000022LL;
    unint64_t v50 = 0x8000000000033590LL;
    unint64_t v19 = sub_F6A4();
    unint64_t v20 = sub_F6E8();
    char v21 = BidirectionalCollection<>.starts<A>(with:)( &v49,  &type metadata for String,  &type metadata for String,  v19,  v20);
    swift_bridgeObjectRelease(v18);
    if ((v21 & 1) != 0)
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v22 = type metadata accessor for Logger(0LL);
      sub_458C(v22, (uint64_t)qword_3E310);
      uint64_t v23 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v48, v6);
      unint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
      os_log_type_t v25 = static os_log_type_t.debug.getter();
      int v26 = v25;
      BOOL v27 = os_log_type_enabled(v24, v25);
      unint64_t v45 = (unint64_t)"omptResult case: ";
      if (v27)
      {
        os_log_t v44 = v24;
        uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v43 = swift_slowAlloc(32LL, -1LL);
        v51[0] = v43;
        int v42 = v26;
        *(_DWORD *)uint64_t v28 = 136315138;
        unint64_t v29 = sub_259D0();
        if (v30)
        {
          unint64_t v31 = v30;
        }

        else
        {
          unint64_t v29 = 0xD000000000000012LL;
          unint64_t v31 = 0x8000000000033570LL;
        }

        uint64_t v49 = sub_12A3C(v29, v31, v51);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
        swift_bridgeObjectRelease(v31);
        (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
        unint64_t v24 = v44;
        _os_log_impl(&dword_0, v44, (os_log_type_t)v42, "IFFlow creating feedback form for toolId: %s", v28, 0xCu);
        uint64_t v32 = v43;
        swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v32, -1LL, -1LL);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
      }

      id v14 = [objc_allocWithZone(SAUIFeedbackForm) init];
      if (v47)
      {
        NSString v33 = String._bridgeToObjectiveC()();
        [v14 setOutput:v33];
      }

      [v14 setDomain:SAUIFeedbackFormDomainSiriWithChatGPTValue];
      unint64_t v34 = sub_259D0();
      if (v35)
      {
        unint64_t v36 = v35;
      }

      else
      {
        unint64_t v34 = 0xD000000000000012LL;
        unint64_t v36 = v45 | 0x8000000000000000LL;
      }

      sub_EFDC(v34, v36);
      uint64_t v38 = v37;
      swift_bridgeObjectRelease(v36);
      if (v38)
      {
        NSString v39 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v38);
        [v14 setSubFeature:v39];
      }
    }

    else
    {
      id v14 = 0LL;
    }
  }

  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v14;
}

unint64_t sub_F6A4()
{
  unint64_t result = qword_3D270;
  if (!qword_3D270)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_3D270);
  }

  return result;
}

unint64_t sub_F6E8()
{
  unint64_t result = qword_3D278;
  if (!qword_3D278)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_3D278);
  }

  return result;
}

unint64_t sub_F72C()
{
  unint64_t result = qword_3D280;
  if (!qword_3D280)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_3D280);
  }

  return result;
}

unint64_t sub_F770()
{
  unint64_t result = qword_3D288;
  if (!qword_3D288)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_3D288);
  }

  return result;
}

unint64_t sub_F7B4()
{
  unint64_t result = qword_3D2A0;
  if (!qword_3D2A0)
  {
    uint64_t v1 = sub_76A8(&qword_3D298);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_3D2A0);
  }

  return result;
}

unint64_t sub_F804()
{
  unint64_t result = qword_3D2B8;
  if (!qword_3D2B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_31454, &type metadata for FeatureEnablementProvider.Key);
    atomic_store(result, (unint64_t *)&qword_3D2B8);
  }

  return result;
}

uint64_t sub_F848(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_494C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_F88C(uint64_t a1)
{
  return sub_D30C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_F8A4(uint64_t a1)
{
  return sub_D0E4(a1, *(void *)(v1 + 16));
}

uint64_t sub_F8BC(uint64_t a1)
{
  return sub_D018(a1, *(void *)(v1 + 16));
}

uint64_t sub_F8D4(uint64_t a1)
{
  return sub_CF4C(a1, *(void *)(v1 + 16));
}

uint64_t sub_F8EC(uint64_t a1)
{
  return sub_D27C( a1,  *(void *)(v1 + 16),  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UsoGraph,  (uint64_t (*)(char *))&Siri_Nlu_External_UserWantedToProceed.reference.setter);
}

uint64_t sub_F914(uint64_t a1)
{
  return sub_D27C( a1,  *(void *)(v1 + 16),  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UsoGraph,  (uint64_t (*)(char *))&Siri_Nlu_External_UserRejected.reference.setter);
}

uint64_t sub_F93C(uint64_t a1)
{
  return sub_D1B0(a1, *(void *)(v1 + 16));
}

uint64_t sub_F954(uint64_t a1)
{
  return sub_D27C( a1,  *(void *)(v1 + 16),  (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserWantedToProceed,  (uint64_t (*)(char *))&Siri_Nlu_External_UserDialogAct.wantedToProceed.setter);
}

uint64_t sub_F97C(uint64_t a1)
{
  return sub_D3DC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_F994(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_494C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_F9D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_D7DC(a1, a2, v3[2], v3[3], v3[4], v3[5], a3);
}

uint64_t initializeBufferWithCopyOfBuffer for IFOutputBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for IFOutputBuilder(void *a1)
{
  return sub_76EC(a1 + 11);
}

uint64_t initializeWithCopy for IFOutputBuilder(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = a2 + 88;
  __int128 v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_retain(v6);
  v10(a1 + 88, v7, v9);
  return a1;
}

void *assignWithCopy for IFOutputBuilder(void *a1, void *a2)
{
  uint64_t v4 = a2[10];
  uint64_t v5 = a1[10];
  a1[10] = v4;
  swift_retain(v4);
  swift_release(v5);
  sub_FB4C(a1 + 11, a2 + 11);
  return a1;
}

void *sub_FB4C(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        unint64_t result = (void *)swift_release(v11);
        *uint64_t v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

__n128 initializeWithTake for IFOutputBuilder(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[1];
  __int128 v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  __int128 v6 = a2[5];
  __int128 v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for IFOutputBuilder(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_76EC((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  uint64_t v6 = *(void *)(a1 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_release(v6);
  sub_76EC((void *)(a1 + 88));
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for IFOutputBuilder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IFOutputBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0LL;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 128) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for IFOutputBuilder()
{
  return &type metadata for IFOutputBuilder;
}

uint64_t getEnumTagSinglePayload for FeatureEnablementProvider.Key(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for FeatureEnablementProvider.Key(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_FEA8 + 4 * asc_31390[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_FEC8 + 4 * byte_31395[v4]))();
  }
}

_BYTE *sub_FEA8(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_FEC8(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_FED0(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_FED8(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_FEE0(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_FEE8(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t sub_FEF4()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for FeatureEnablementProvider.Key()
{
  return &type metadata for FeatureEnablementProvider.Key;
}

ValueMetadata *type metadata accessor for FeatureEnablementProvider()
{
  return &type metadata for FeatureEnablementProvider;
}

unint64_t sub_FF20()
{
  unint64_t result = qword_3D360;
  if (!qword_3D360)
  {
    unint64_t result = swift_getWitnessTable(&unk_3142C, &type metadata for FeatureEnablementProvider.Key);
    atomic_store(result, (unint64_t *)&qword_3D360);
  }

  return result;
}

uint64_t sub_FF64()
{
  return 1LL;
}

Swift::Int sub_FF6C()
{
  return Hasher._finalize()();
}

void sub_FFAC()
{
}

Swift::Int sub_FFD0(uint64_t a1)
{
  return Hasher._finalize()();
}

const char *sub_1000C()
{
  return "SiriIFFlow";
}

const char *sub_10020()
{
  return "showASRForPQA";
}

uint64_t sub_10034()
{
  uint64_t v0 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v37 = *(void *)(v0 - 8);
  uint64_t v38 = v0;
  __chkstk_darwin(v0);
  unint64_t v36 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = type metadata accessor for USOParse(0LL);
  uint64_t v2 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_494C(&qword_3D368);
  __chkstk_darwin(v5);
  __int128 v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Parse(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v14);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v16, v12);
  if (v17 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
    unint64_t v19 = v36;
    uint64_t v18 = v37;
    uint64_t v20 = v38;
    uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v37 + 32))(v36, v16, v38);
    uint64_t v22 = Parse.DirectInvocation.identifier.getter(v21);
    uint64_t v24 = v23;
    os_log_type_t v25 = (void *)static SiriKitDirectInvocationPayloads.cancel.getter();
    id v26 = [v25 identifier];

    uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    uint64_t v29 = v28;

    if (v22 == v27 && v24 == v29)
    {
      char v30 = 1;
      uint64_t v29 = v24;
    }

    else
    {
      char v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v24, v27, v29, 0LL);
    }

    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease(v29);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
  }

  else
  {
    unint64_t v31 = v4;
    uint64_t v32 = v35;
    if (v17 == enum case for Parse.uso(_:))
    {
      (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v31, v16, v32);
      char v30 = sub_115C8();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v31, v32);
    }

    else
    {
      if (v17 == enum case for Parse.nlRouter(_:))
      {
        (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
        uint64_t v33 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v11, v16, v8);
        NLRouterParse.usoParse.getter(v33);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1LL, v32) != 1)
        {
          char v30 = sub_115C8();
          (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
          (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v32);
          return v30 & 1;
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        sub_8DCC((uint64_t)v7, &qword_3D368);
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      }

      char v30 = 0;
    }
  }

  return v30 & 1;
}

uint64_t sub_103B8()
{
  uint64_t v0 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v46 = *(void *)(v0 - 8);
  uint64_t v47 = v0;
  __chkstk_darwin(v0);
  unint64_t v45 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = type metadata accessor for USOParse(0LL);
  uint64_t v2 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_494C(&qword_3D368);
  __chkstk_darwin(v5);
  __int128 v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Parse(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v14);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v16, v12);
  if (v17 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
    unint64_t v19 = v45;
    uint64_t v18 = v46;
    uint64_t v20 = v47;
    uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v46 + 32))(v45, v16, v47);
    uint64_t v22 = Parse.DirectInvocation.identifier.getter(v21);
    uint64_t v24 = v23;
    uint64_t v25 = static SiriKitDirectInvocationPayloads.selectIndexIdentifier.getter();
    if (v22 == v25 && v24 == v26)
    {
      uint64_t v30 = swift_bridgeObjectRelease_n(v24, 2LL);
    }

    else
    {
      uint64_t v28 = v26;
      char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v24, v25, v26, 0LL);
      swift_bridgeObjectRelease(v24);
      uint64_t v30 = swift_bridgeObjectRelease(v28);
      if ((v29 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
        return 0LL;
      }
    }

    uint64_t v34 = Parse.DirectInvocation.userData.getter(v30);
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = static SiriKitDirectInvocationPayloads.keySelection.getter();
      uint64_t v38 = v37;
      if (*(void *)(v35 + 16) && (unint64_t v39 = sub_1307C(v36, v37), (v40 & 1) != 0))
      {
        sub_130E0(*(void *)(v35 + 56) + 32 * v39, (uint64_t)&v49);
      }

      else
      {
        __int128 v49 = 0u;
        __int128 v50 = 0u;
      }

      swift_bridgeObjectRelease(v38);
      swift_bridgeObjectRelease(v35);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
      if (*((void *)&v50 + 1))
      {
        if (swift_dynamicCast( &v48,  &v49,  (char *)&type metadata for Any + 8,  &type metadata for Int,  6LL)) {
          return v48;
        }
        else {
          return 0LL;
        }
      }
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
      __int128 v49 = 0u;
      __int128 v50 = 0u;
    }

    sub_8DCC((uint64_t)&v49, &qword_3D370);
    return 0LL;
  }

  unint64_t v31 = v4;
  uint64_t v32 = v44;
  if (v17 != enum case for Parse.uso(_:))
  {
    if (v17 == enum case for Parse.nlRouter(_:))
    {
      (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
      uint64_t v41 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v11, v16, v8);
      NLRouterParse.usoParse.getter(v41);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1LL, v32) != 1)
      {
        uint64_t v33 = sub_1197C();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v32);
        return v33;
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      sub_8DCC((uint64_t)v7, &qword_3D368);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    }

    return 0LL;
  }

  (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v31, v16, v32);
  uint64_t v33 = sub_1197C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v31, v32);
  return v33;
}

uint64_t sub_10800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v53 = a2;
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_SystemGaveOptions(0LL);
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  unint64_t v51 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v52 = (char *)&v48 - v5;
  uint64_t v57 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v6 = *(void *)(v57 - 8);
  uint64_t v7 = __chkstk_darwin(v57);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v61 = (char *)&v48 - v10;
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v60 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  uint64_t v14 = *(uint64_t (***)(char *, uint64_t))(v60 - 8);
  uint64_t v15 = __chkstk_darwin(v60);
  uint64_t v56 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v48 - v17;
  uint64_t v19 = sub_494C(&qword_3D328);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for UsoTaskBuilder_noVerb_common_AppEntity(0LL);
  swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
  uint64_t v23 = UsoTaskBuilder_noVerb_common_AppEntity.init()();
  uint64_t v24 = sub_494C(&qword_3D208);
  uint64_t v25 = swift_allocObject(v24, 40LL, 7LL);
  *(_OWORD *)(v25 + 16) = xmmword_312F0;
  *(void *)(v25 + 32) = v23;
  uint64_t v62 = v25;
  specialized Array._endMutation()();
  uint64_t v26 = v62;
  uint64_t v27 = type metadata accessor for UsoBuilderOptions(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56LL))(v21, 1LL, 1LL, v27);
  swift_retain(v23);
  uint64_t v28 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v26, v21);
  swift_bridgeObjectRelease(v26);
  uint64_t v29 = sub_8DCC((uint64_t)v21, &qword_3D328);
  Siri_Nlu_External_UserStatedTask.init()(v29);
  uint64_t v30 = v59;
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v28, 0LL);
  if (v30)
  {
    swift_release(v23);
    swift_release(v28);
    return v14[1](v18, v60);
  }

  else
  {
    uint64_t v49 = v28;
    uint64_t v50 = 0LL;
    uint64_t v59 = v23;
    uint64_t v32 = v57;
    uint64_t v33 = Siri_Nlu_External_UserStatedTask.task.setter(v13);
    Siri_Nlu_External_UserDialogAct.init()(v33);
    uint64_t v34 = v56;
    ((void (*)(char *, char *, uint64_t))v14[2])(v56, v18, v60);
    uint64_t result = Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v34);
    uint64_t v35 = v58;
    if (v58 < 1)
    {
LABEL_14:
      __break(1u);
    }

    else
    {
      uint64_t v48 = v18;
      uint64_t v56 = (char *)v14;
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
      uint64_t v37 = _swiftEmptyArrayStorage;
      uint64_t v38 = 1LL;
      uint64_t v39 = v32;
      while (1)
      {
        v36(v9, v61, v39);
        if ((swift_isUniquelyReferenced_nonNull_native(v37) & 1) == 0) {
          uint64_t v37 = (void *)sub_DB90(0, v37[2] + 1LL, 1, (unint64_t)v37);
        }
        unint64_t v41 = v37[2];
        unint64_t v40 = v37[3];
        if (v41 >= v40 >> 1) {
          uint64_t v37 = (void *)sub_DB90(v40 > 1, v41 + 1, 1, (unint64_t)v37);
        }
        v37[2] = v41 + 1;
        uint64_t v39 = v32;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( (unint64_t)v37 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
                 + *(void *)(v6 + 72) * v41,
                   v9,
                   v32);
        if (v35 == v38) {
          break;
        }
        if (__OFADD__(v38++, 1LL))
        {
          __break(1u);
          goto LABEL_14;
        }
      }

      uint64_t v43 = v52;
      Siri_Nlu_External_SystemGaveOptions.init()(result);
      uint64_t v44 = Siri_Nlu_External_SystemGaveOptions.choices.setter(v37);
      Siri_Nlu_External_SystemDialogAct.init()(v44);
      uint64_t v46 = v54;
      uint64_t v45 = v55;
      uint64_t v47 = v51;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v51, v43, v55);
      Siri_Nlu_External_SystemDialogAct.gaveOptions.setter(v47);
      swift_release(v59);
      swift_release(v49);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v61, v32);
      return (*((uint64_t (**)(char *, uint64_t))v56 + 1))(v48, v60);
    }
  }

  return result;
}

uint64_t sub_10C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v1 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v58 = v1;
  __chkstk_darwin(v1);
  uint64_t v56 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v55 = type metadata accessor for USOParse(0LL);
  uint64_t v3 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_3D368);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Parse(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v15);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v17, v13);
  if (v18 != enum case for Parse.directInvocation(_:))
  {
    unint64_t v31 = v12;
    uint64_t v32 = v55;
    if (v18 == enum case for Parse.uso(_:))
    {
      (*(void (**)(char *, uint64_t))(v14 + 96))(v17, v13);
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v17, v32);
      sub_1117C(v59);
      uint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      uint64_t v34 = v5;
    }

    else
    {
      if (v18 != enum case for Parse.nlRouter(_:))
      {
        uint64_t v50 = type metadata accessor for ConfirmationResponse(0LL);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56LL))(v59, 1LL, 1LL, v50);
        uint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
        uint64_t v34 = v17;
        uint64_t v35 = v13;
        return v33(v34, v35);
      }

      (*(void (**)(char *, uint64_t))(v14 + 96))(v17, v13);
      uint64_t v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v31, v17, v9);
      NLRouterParse.usoParse.getter(v43);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1LL, v32) == 1)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v31, v9);
        sub_8DCC((uint64_t)v8, &qword_3D368);
        uint64_t v44 = type metadata accessor for ConfirmationResponse(0LL);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56LL))( v59,  1LL,  1LL,  v44);
      }

      sub_1117C(v59);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v31, v9);
      uint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      uint64_t v34 = v8;
    }

    uint64_t v35 = v32;
    return v33(v34, v35);
  }

  (*(void (**)(char *, uint64_t))(v14 + 96))(v17, v13);
  uint64_t v20 = v56;
  uint64_t v19 = v57;
  uint64_t v21 = v58;
  uint64_t v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v57 + 32))(v56, v17, v58);
  uint64_t v23 = Parse.DirectInvocation.identifier.getter(v22);
  uint64_t v25 = v24;
  uint64_t v26 = (void *)static SiriKitDirectInvocationPayloads.reject.getter();
  id v27 = [v26 identifier];

  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  if (v28 == v23 && v30 == v25)
  {
    swift_bridgeObjectRelease(v25);
LABEL_9:
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
    swift_bridgeObjectRelease(v25);
    uint64_t v38 = enum case for ConfirmationResponse.rejected(_:);
    uint64_t v39 = type metadata accessor for ConfirmationResponse(0LL);
    uint64_t v40 = *(void *)(v39 - 8);
    uint64_t v41 = v59;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 104))(v59, v38, v39);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v41, 0LL, 1LL, v39);
  }

  char v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, v23, v25, 0LL);
  uint64_t v37 = swift_bridgeObjectRelease(v30);
  if ((v36 & 1) != 0) {
    goto LABEL_9;
  }
  uint64_t v45 = (void *)static SiriKitDirectInvocationPayloads.confirm.getter(v37);
  id v46 = [v45 identifier];

  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  uint64_t v49 = v48;

  if (v47 == v23 && v49 == v25)
  {
    swift_bridgeObjectRelease_n(v25, 2LL);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
    uint64_t v41 = v59;
LABEL_21:
    uint64_t v52 = enum case for ConfirmationResponse.confirmed(_:);
    uint64_t v39 = type metadata accessor for ConfirmationResponse(0LL);
    uint64_t v40 = *(void *)(v39 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 104))(v41, v52, v39);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v41, 0LL, 1LL, v39);
  }

  char v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v47, v49, v23, v25, 0LL);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v49);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
  uint64_t v41 = v59;
  if ((v51 & 1) != 0) {
    goto LABEL_21;
  }
  uint64_t v53 = type metadata accessor for ConfirmationResponse(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56LL))( v41,  1LL,  1LL,  v53);
}

uint64_t sub_1117C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v47 = a1;
  uint64_t v3 = type metadata accessor for USOParse(0LL);
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v44 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v45 = (char *)&v44 - v6;
  uint64_t v7 = sub_494C(&qword_3D2E8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  int v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = USOParse.userParse.getter(v16);
  uint64_t v20 = Siri_Nlu_External_UserParse.userDialogActs.getter(v19);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (*(void *)(v20 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))( v9,  v20 + ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)),  v14);
    uint64_t v21 = 0LL;
  }

  else
  {
    uint64_t v21 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v9, v21, 1LL, v14);
  swift_bridgeObjectRelease(v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1LL, v14) == 1)
  {
    sub_8DCC((uint64_t)v9, &qword_3D2E8);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v22 = type metadata accessor for Logger(0LL);
    sub_458C(v22, (uint64_t)qword_3E310);
    uint64_t v24 = v45;
    uint64_t v23 = v46;
    uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 16);
    uint64_t v26 = v25(v45, v2, v3);
    id v27 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v30 = swift_slowAlloc(32LL, -1LL);
      uint64_t v49 = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      unint64_t v31 = v44;
      v25(v44, (uint64_t)v24, v3);
      uint64_t v32 = String.init<A>(describing:)(v31, v3);
      unint64_t v34 = v33;
      uint64_t v48 = sub_12A3C(v32, v33, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49);
      swift_bridgeObjectRelease(v34);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v3);
      _os_log_impl( &dword_0,  v27,  v28,  "Invalid USOParse while looking for user confirmation. Parse has no UDAs: %s",  v29,  0xCu);
      swift_arrayDestroy(v30, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1LL, -1LL);
      swift_slowDealloc(v29, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v3);
    }

    goto LABEL_16;
  }

  uint64_t v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v18, v9, v14);
  if ((Siri_Nlu_External_UserDialogAct.hasRejected.getter(v35) & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    char v36 = (unsigned int *)&enum case for ConfirmationResponse.rejected(_:);
LABEL_15:
    uint64_t v38 = *v36;
    uint64_t v39 = type metadata accessor for ConfirmationResponse(0LL);
    uint64_t v40 = *(void *)(v39 - 8);
    uint64_t v41 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 104))(v47, v38, v39);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v41, 0LL, 1LL, v39);
  }

  char v37 = Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if ((v37 & 1) != 0)
  {
    char v36 = (unsigned int *)&enum case for ConfirmationResponse.confirmed(_:);
    goto LABEL_15;
  }

LABEL_16:
  uint64_t v43 = type metadata accessor for ConfirmationResponse(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56LL))( v47,  1LL,  1LL,  v43);
}

uint64_t sub_115C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for USOParse(0LL);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v38 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v39 = (char *)&v37 - v5;
  uint64_t v6 = sub_494C(&qword_3D2E8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = USOParse.userParse.getter(v15);
  uint64_t v19 = Siri_Nlu_External_UserParse.userDialogActs.getter(v18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (*(void *)(v19 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))( v8,  v19 + ((*(unsigned __int8 *)(v14 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)),  v13);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v8, v20, 1LL, v13);
  swift_bridgeObjectRelease(v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1LL, v13) == 1)
  {
    sub_8DCC((uint64_t)v8, &qword_3D2E8);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    sub_458C(v21, (uint64_t)qword_3E310);
    uint64_t v22 = v39;
    uint64_t v23 = v40;
    uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 16);
    uint64_t v25 = v24(v39, v1, v2);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v29 = swift_slowAlloc(32LL, -1LL);
      uint64_t v42 = v29;
      *(_DWORD *)os_log_type_t v28 = 136315138;
      uint64_t v30 = v38;
      v24(v38, (uint64_t)v22, v2);
      uint64_t v31 = String.init<A>(describing:)(v30, v2);
      unint64_t v33 = v32;
      uint64_t v41 = sub_12A3C(v31, v32, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
      swift_bridgeObjectRelease(v33);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v2);
      _os_log_impl( &dword_0,  v26,  v27,  "Invalid USOParse while looking for user cancellation. Parse has no UDAs: %s",  v28,  0xCu);
      swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v2);
    }

    char v35 = 0;
  }

  else
  {
    uint64_t v34 = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v17, v8, v13);
    char v35 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter(v34);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }

  return v35 & 1;
}

uint64_t sub_1197C()
{
  uint64_t v0 = sub_11DB0();
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = v0;
  uint64_t v2 = swift_retain(v0);
  static UsoTask_CodegenConverter.convert(task:)(v31, v2);
  swift_release(v1);
  if (!v31[3])
  {
    sub_8DCC((uint64_t)v31, &qword_3D370);
    goto LABEL_8;
  }

  uint64_t v3 = type metadata accessor for UsoTask_noVerb_uso_NoEntity(0LL);
  if ((swift_dynamicCast(&v30, v31, (char *)&type metadata for Any + 8, v3, 6LL) & 1) == 0)
  {
LABEL_8:
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    sub_458C(v10, (uint64_t)qword_3E310);
    uint64_t v11 = swift_retain_n(v1, 2LL);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      uint64_t v30 = v1;
      v31[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v16 = type metadata accessor for UsoTask(0LL);
      swift_retain(v1);
      uint64_t v17 = String.init<A>(describing:)(&v30, v16);
      unint64_t v19 = v18;
      uint64_t v30 = sub_12A3C(v17, v18, v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, v31);
      swift_release_n(v1, 2LL);
      swift_bridgeObjectRelease(v19);
      _os_log_impl(&dword_0, v12, v13, "Could not extract the usoNoEntity from the usoTask=%s", v14, 0xCu);
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_release(v1);

      return 0LL;
    }

    swift_release_n(v1, 3LL);
    return 0LL;
  }

  uint64_t v4 = v30;
  uint64_t v5 = swift_retain(v30);
  dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter(v31, v5);
  uint64_t v6 = swift_release(v4);
  uint64_t v7 = v31[0];
  if (!v31[0] || (uint64_t v8 = dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter(v6), swift_release(v7), !v8))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    sub_458C(v20, (uint64_t)qword_3E310);
    uint64_t v21 = swift_retain_n(v4, 2LL);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = swift_slowAlloc(32LL, -1LL);
      uint64_t v30 = v4;
      v31[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_retain(v4);
      uint64_t v26 = String.init<A>(describing:)(&v30, v3);
      unint64_t v28 = v27;
      uint64_t v30 = sub_12A3C(v26, v27, v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, v31);
      swift_release_n(v4, 2LL);
      swift_bridgeObjectRelease(v28);
      _os_log_impl(&dword_0, v22, v23, "Could not extract the listPosition from the usoNoEntity=%s", v24, 0xCu);
      swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_release(v1);
      swift_release(v4);

      return 0LL;
    }

    swift_release_n(v4, 3LL);
    swift_release(v1);
    return 0LL;
  }

  uint64_t v9 = sub_124C8();
  swift_release(v1);
  swift_release(v4);
  swift_release(v8);
  return v9;
}

uint64_t sub_11DB0()
{
  uint64_t v1 = type metadata accessor for USOParse(0LL);
  uint64_t v2 = *(char **)(v1 - 8);
  uint64_t v70 = (uint8_t *)v1;
  uint64_t v71 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v69 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v67 - v5;
  uint64_t v7 = sub_494C(&qword_3D2E8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  os_log_type_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  int v67 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  int v68 = (char *)&v67 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v67 - v21;
  uint64_t v23 = v0;
  uint64_t v24 = USOParse.userParse.getter(v20);
  uint64_t v25 = Siri_Nlu_External_UserParse.userDialogActs.getter(v24);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (*(void *)(v25 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))( v9,  v25 + ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)),  v14);
    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v26 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v9, v26, 1LL, v14);
  swift_bridgeObjectRelease(v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1LL, v14) == 1)
  {
    sub_8DCC((uint64_t)v9, &qword_3D2E8);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    sub_458C(v27, (uint64_t)qword_3E310);
    unint64_t v28 = v71;
    uint64_t v29 = (uint64_t (*)(char *, uint64_t, uint8_t *))*((void *)v71 + 2);
    uint64_t v30 = v23;
    uint64_t v31 = v70;
    uint64_t v32 = v29(v6, v30, v70);
    unint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      char v35 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      char v36 = v6;
      uint64_t v37 = swift_slowAlloc(32LL, -1LL);
      uint64_t v73 = v37;
      *(_DWORD *)char v35 = 136315138;
      int v68 = (char *)(v35 + 4);
      uint64_t v38 = v69;
      v29(v69, (uint64_t)v36, v31);
      uint64_t v39 = String.init<A>(describing:)(v38, v31);
      unint64_t v41 = v40;
      uint64_t v72 = sub_12A3C(v39, v40, &v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
      swift_bridgeObjectRelease(v41);
      (*((void (**)(char *, uint8_t *))v28 + 1))(v36, v31);
      _os_log_impl(&dword_0, v33, v34, "Cannot extract task: USO parse has no UDAs. %s", v35, 0xCu);
      swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1LL, -1LL);
      swift_slowDealloc(v35, -1LL, -1LL);
    }

    else
    {
      (*((void (**)(char *, uint8_t *))v28 + 1))(v6, v31);
    }

    return 0LL;
  }

  uint64_t v42 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v22, v9, v14);
  if ((Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter(v42) & 1) == 0)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v58 = type metadata accessor for Logger(0LL);
    sub_458C(v58, (uint64_t)qword_3E310);
    uint64_t v59 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
    os_log_type_t v60 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v61 = 0;
      _os_log_impl(&dword_0, v59, v60, "User dialog act does not have a user stated task", v61, 2u);
      swift_slowDealloc(v61, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
    return 0LL;
  }

  uint64_t result = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)(v22);
  uint64_t v64 = result;
  if (!((unint64_t)result >> 62))
  {
LABEL_35:
    swift_bridgeObjectRelease(v64);
    uint64_t v44 = v68;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v45 = type metadata accessor for Logger(0LL);
    sub_458C(v45, (uint64_t)qword_3E310);
    uint64_t v46 = *(uint64_t (**)(char *, char *, uint64_t))(v15 + 16);
    uint64_t v47 = v46(v44, v22, v14);
    uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
    uint64_t v49 = v22;
    os_log_type_t v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v50))
    {
      char v51 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v52 = swift_slowAlloc(32LL, -1LL);
      uint64_t v73 = v52;
      uint64_t v71 = v49;
      *(_DWORD *)char v51 = 136315138;
      uint64_t v70 = v51 + 4;
      uint64_t v53 = v67;
      v46(v67, v44, v14);
      uint64_t v54 = String.init<A>(describing:)(v53, v14);
      unint64_t v56 = v55;
      uint64_t v72 = sub_12A3C(v54, v55, &v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
      swift_bridgeObjectRelease(v56);
      uint64_t v57 = *(void (**)(char *, uint64_t))(v15 + 8);
      v57(v44, v14);
      _os_log_impl(&dword_0, v48, v50, "Cannot extract task: UDA -> Task conversion failed. %s", v51, 0xCu);
      swift_arrayDestroy(v52, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1LL, -1LL);
      swift_slowDealloc(v51, -1LL, -1LL);

      v57(v71, v14);
    }

    else
    {

      uint64_t v62 = *(void (**)(char *, uint64_t))(v15 + 8);
      v62(v44, v14);
      v62(v49, v14);
    }

    return 0LL;
  }

  if (result < 0) {
    uint64_t v65 = result;
  }
  else {
    uint64_t v65 = result & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(result);
  uint64_t v66 = _CocoaArrayWrapper.endIndex.getter(v65);
  uint64_t result = swift_bridgeObjectRelease(v64);
  if (!v66) {
    goto LABEL_35;
  }
LABEL_27:
  if ((v64 & 0xC000000000000001LL) != 0)
  {
    uint64_t v63 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v64);
    goto LABEL_30;
  }

  if (*(void *)((char *)&dword_10 + (v64 & 0xFFFFFFFFFFFFF8LL)))
  {
    uint64_t v63 = *(void *)(v64 + 32);
    swift_retain(v63);
LABEL_30:
    swift_bridgeObjectRelease(v64);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
    return v63;
  }

  __break(1u);
  return result;
}

uint64_t sub_124C8()
{
  uint64_t v0 = sub_494C(&qword_3D378);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for UsoEntity_common_ListPosition.DefinedValues(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v14 - v9;
  dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter(v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1LL, v3) == 1)
  {
    sub_8DCC((uint64_t)v2, &qword_3D378);
    return 0LL;
  }

  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v12(v10, v2, v3);
  v12(v7, v10, v3);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fourth(_:)) {
    return 4LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Second(_:)) {
    return 2LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Beginning(_:)) {
    return 1LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFourth(_:)) {
    return 24LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Seventeenth(_:)) {
    return 17LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eighth(_:)) {
    return 8LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_ThirdToLast(_:)) {
    return -3LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Sixth(_:)) {
    return 6LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Nineteenth(_:)) {
    return 19LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFifth(_:)) {
    return 25LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eleventh(_:)) {
    return 11LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_End(_:)) {
    return -1LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fourteenth(_:)) {
    return 14LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_SecondToLast(_:)) {
    return -2LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFirst(_:)) {
    return 21LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Thirteenth(_:)) {
    return 13LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Last(_:)) {
    return -1LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentySecond(_:)) {
    return 22LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fifteenth(_:)) {
    return 15LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Twentieth(_:)) {
    return 20LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fifth(_:)) {
    return 5LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Sixteenth(_:)) {
    return 16LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_First(_:)) {
    return 1LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Seventh(_:)) {
    return 7LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eighteenth(_:)) {
    return 18LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyThird(_:)) {
    return 23LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Twelfth(_:)) {
    return 12LL;
  }
  if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Third(_:)) {
    return 3LL;
  }
  if (v13 != enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Tenth(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return 0LL;
  }

  return 10LL;
}

uint64_t sub_129AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_129CC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_12A3C(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_12A3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_12B0C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_130E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_130E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_76EC(v12);
  return v7;
}

uint64_t sub_12B0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_12CC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_12D58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_12F30(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_12F30(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_12D58(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_12ECC(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_12ECC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_494C(&qword_3D380);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_12F30(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_494C(&qword_3D380);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_1307C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1311C(a1, a2, v5);
}

uint64_t sub_130E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1311C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_131FC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  unint64_t v3 = (*(void *)(*(void *)(sub_494C(&qword_3D478) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[4] = swift_task_alloc(v3);
  v2[5] = swift_task_alloc(v3);
  uint64_t v4 = type metadata accessor for ConfirmationResponse(0LL);
  v2[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[7] = v5;
  v2[8] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_13290, 0LL, 0LL);
}

uint64_t sub_13290()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  sub_10C78(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 64);
    uint64_t v5 = *(void *)(v0 + 32);
    uint64_t v6 = *(void *)(v0 + 40);
    sub_14D08(v6);
    uint64_t v7 = type metadata accessor for IFFlowError(0LL);
    uint64_t v8 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    swift_allocError(v7, v8, 0LL, 0LL);
    uint64_t v10 = v9;
    _StringGuts.grow(_:)(48LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v11 = type metadata accessor for Input(0LL);
    uint64_t v12 = sub_5E50( &qword_3D0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v11, v12);
    object = v13._object;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(object);
    *uint64_t v10 = 0xD00000000000002ELL;
    v10[1] = 0x8000000000033910LL;
    uint64_t v15 = swift_storeEnumTagMultiPayload(v10, v7, 4LL);
    swift_willThrow(v15);
    swift_task_dealloc(v4);
    swift_task_dealloc(v6);
    swift_task_dealloc(v5);
  }

  else
  {
    uint64_t v17 = *(void *)(v0 + 56);
    uint64_t v16 = *(void *)(v0 + 64);
    uint64_t v19 = *(void *)(v0 + 40);
    uint64_t v18 = *(void *)(v0 + 48);
    uint64_t v20 = *(void *)(v0 + 32);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v16, v19, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v20, v16, v18);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v20, 0LL, 1LL, v18);
    SimpleConfirmationResponseProvider.init(_:)(v20);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    swift_task_dealloc(v16);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_134B0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return swift_task_switch(sub_134C8, 0LL, 0LL);
}

uint64_t sub_134C8()
{
  if (*(_BYTE *)(*(void *)(v0 + 24) + 56LL) == 1)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v1 = type metadata accessor for Logger(0LL);
    uint64_t v2 = sub_458C(v1, (uint64_t)qword_3E310);
    uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
    os_log_type_t v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "IFFlow Confirmation for GenAI Media QnA won't re-prompt on empty parse.", v5, 2u);
      swift_slowDealloc(v5, -1LL, -1LL);
    }

    type metadata accessor for EmptyOutput(0LL);
    static EmptyOutput.instance.getter();
  }

  else
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_458C(v6, (uint64_t)qword_3E310);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "IFFlow Confirmation re-prompting on empty parse.", v10, 2u);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    uint64_t v11 = *(void *)(v0 + 16);
    uint64_t v12 = *(void *)(v0 + 24);

    sub_69E4(v12 + 16, v11);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_13688()
{
  return swift_deallocClassInstance(v0, 57LL, 7LL);
}

uint64_t type metadata accessor for ExternalServiceConfirmationStrategy()
{
  return objc_opt_self(&OBJC_CLASS____TtC12IFFlowPlugin35ExternalServiceConfirmationStrategy);
}

void *sub_136CC()
{
  return &protocol witness table for SimpleConfirmationResponseProvider;
}

uint64_t sub_136D8()
{
  uint64_t v0 = sub_494C(&qword_3D478);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_10034() & 1) != 0) {
    return static ActionForInput.cancel()();
  }
  sub_10C78((uint64_t)v2);
  uint64_t v4 = type metadata accessor for ConfirmationResponse(0LL);
  int v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(v2, 1LL, v4);
  uint64_t v6 = sub_14D08((uint64_t)v2);
  if (v5 == 1) {
    return static ActionForInput.ignore()(v6);
  }
  else {
    return static ActionForInput.handle()(v6);
  }
}

uint64_t sub_137A8(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)swift_task_alloc(dword_3D474);
  *(void *)(v2 + 16) = v5;
  *int v5 = v2;
  v5[1] = sub_770C;
  return sub_131FC(a1, a2);
}

uint64_t sub_13800(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_3D46C);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_770C;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch(sub_134C8, 0LL, 0LL);
}

uint64_t sub_13860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to PromptForConfirmationFlowStrategyAsync.makeRepromptOnLowConfidence(itemToConfirm:)[1]);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_770C;
  return PromptForConfirmationFlowStrategyAsync.makeRepromptOnLowConfidence(itemToConfirm:)(a1, a2, v9, a4);
}

uint64_t sub_138DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PromptForConfirmationFlowStrategyAsync.makeConfirmationRejectedResponse()[1]);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_6918;
  return PromptForConfirmationFlowStrategyAsync.makeConfirmationRejectedResponse()(a1, v7, a3);
}

uint64_t sub_13948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PromptForConfirmationFlowStrategyAsync.makeFlowCancelledResponse()[1]);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_770C;
  return PromptForConfirmationFlowStrategyAsync.makeFlowCancelledResponse()(a1, v7, a3);
}

uint64_t sub_139B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to PromptForConfirmationFlowStrategyAsync.makeErrorResponse(_:)[1]);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_770C;
  return PromptForConfirmationFlowStrategyAsync.makeErrorResponse(_:)(a1, a2, v9, a4);
}

uint64_t sub_13A30@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v210 = a5;
  uint64_t v204 = a3;
  uint64_t v192 = a2;
  v213 = a6;
  v214 = (char *)a1;
  uint64_t v212 = *v6;
  uint64_t v182 = type metadata accessor for SystemResponse(0LL);
  uint64_t v181 = *(void *)(v182 - 8);
  uint64_t v8 = __chkstk_darwin(v182);
  v178 = (char *)&v175 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  v180 = (char *)&v175 - v10;
  uint64_t v11 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v11);
  v201 = (char *)&v175 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v13);
  v200 = (char *)&v175 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v195 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v194 = *(void *)(v195 - 8);
  __chkstk_darwin(v195);
  v198 = (char *)&v175 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for MessagePayload(0LL);
  uint64_t v202 = *(void *)(v16 - 8);
  uint64_t v203 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v179 = (char *)&v175 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  v184 = (char *)&v175 - v20;
  __chkstk_darwin(v19);
  uint64_t v199 = (char *)&v175 - v21;
  uint64_t v22 = sub_494C(&qword_3D1D0);
  __chkstk_darwin(v22);
  uint64_t v191 = (char *)&v175 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v188 = type metadata accessor for StatementID(0LL);
  uint64_t v187 = *(void *)(v188 - 8);
  __chkstk_darwin(v188);
  uint64_t v190 = (char *)&v175 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v186 = type metadata accessor for SystemPromptResolution.UserAction(0LL);
  uint64_t v185 = *(void *)(v186 - 8);
  __chkstk_darwin(v186);
  v189 = (char *)&v175 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v197 = type metadata accessor for UUID(0LL);
  uint64_t v207 = *(void *)(v197 - 8);
  __chkstk_darwin(v197);
  uint64_t v196 = (char *)&v175 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v27);
  v193 = (char *)&v175 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = type metadata accessor for SystemPromptResolution(0LL);
  uint64_t v208 = *(void *)(v29 - 8);
  uint64_t v209 = v29;
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v183 = (char *)&v175 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v30);
  uint64_t v205 = (uint64_t)&v175 - v32;
  uint64_t v33 = sub_494C(&qword_3D478);
  __chkstk_darwin(v33);
  char v35 = (char *)&v175 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = type metadata accessor for ConfirmationResponse(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v206 = (char *)&v175 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = __chkstk_darwin(v38);
  v211 = (char *)&v175 - v41;
  uint64_t v42 = *(void *)(a4 - 8);
  __chkstk_darwin(v40);
  uint64_t v44 = (char *)&v175 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = type metadata accessor for PromptResult(0LL, a4);
  uint64_t v46 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v175 - v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))((char *)&v175 - v47, v214, v45);
  int v49 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v48, v45);
  if (v49 == enum case for PromptResult.answered<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v46 + 96))(v48, v45);
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v44, v48, a4);
    dispatch thunk of ConfirmationResponseProviding.confirmationResponse.getter(a4, v210);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1LL, v36) != 1)
    {
      uint64_t v59 = v36;
      os_log_type_t v60 = v211;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v211, v35, v36);
      uint64_t v61 = v206;
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v206, v60, v36);
      int v62 = (*(uint64_t (**)(char *, uint64_t))(v37 + 88))(v61, v36);
      uint64_t v177 = v37;
      if (v62 == enum case for ConfirmationResponse.confirmed(_:))
      {
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v206 = (char *)v36;
        uint64_t v210 = a4;
        v214 = v44;
        uint64_t v176 = v42;
        uint64_t v63 = type metadata accessor for Logger(0LL);
        uint64_t v64 = sub_458C(v63, (uint64_t)qword_3E310);
        uint64_t v65 = (os_log_s *)Logger.logObject.getter(v64);
        os_log_type_t v66 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v65, v66))
        {
          int v67 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)int v67 = 0;
          _os_log_impl(&dword_0, v65, v66, "IFFlow Confirmation confirmed. Forwarding to IF", v67, 2u);
          swift_slowDealloc(v67, -1LL, -1LL);
        }

        uint64_t v183 = *(char **)(v207 + 56);
        int v68 = v193;
        uint64_t v69 = v197;
        uint64_t v70 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v183)(v193, 1LL, 1LL, v197);
        uint64_t v71 = (uint64_t)v196;
        SessionServerMessage.eventId.getter(v70);
        uint64_t v72 = v189;
        _BYTE *v189 = 1;
        (*(void (**)(_BYTE *, void, uint64_t))(v185 + 104))( v72,  enum case for SystemPromptResolution.UserAction.actionConfirmed(_:),  v186);
        uint64_t v73 = v190;
        (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v190, v192, v188);
        uint64_t v74 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
        uint64_t v75 = type metadata accessor for SystemPromptResolution.ResolutionInput(0LL);
        uint64_t v76 = *(void *)(v75 - 8);
        uint64_t v77 = v191;
        (*(void (**)(char *, uint64_t, uint64_t))(v76 + 104))(v191, v74, v75);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v76 + 56))(v77, 0LL, 1LL, v75);
        uint64_t v78 = v205;
        SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)( v68,  v71,  v72,  v73,  v77);
        uint64_t v79 = sub_494C(&qword_3D1E8);
        uint64_t v80 = v213;
        uint64_t v192 = (uint64_t)v213 + *(int *)(v79 + 48);
        SessionServerMessage.sessionId.getter();
        uint64_t v81 = v198;
        (*(void (**)(char *, uint64_t, uint64_t))(v208 + 16))(v198, v78, v209);
        (*(void (**)(char *, void, uint64_t))(v194 + 104))( v81,  enum case for MessagePayload.RequestContent.promptResolution(_:),  v195);
        uint64_t v82 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
        unint64_t v83 = v200;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56LL))(v200, 1LL, 1LL, v82);
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v183)(v68, 1LL, 1LL, v69);
        uint64_t v84 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
        uint64_t v85 = v201;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56LL))(v201, 1LL, 1LL, v84);
        uint64_t v86 = (uint64_t)v199;
        MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v81,  0LL,  0LL,  v83,  v68,  v85);
        uint64_t v88 = v202;
        uint64_t v87 = v203;
        (*(void (**)(uint64_t, void, uint64_t))(v202 + 104))( v86,  enum case for MessagePayload.request(_:),  v203);
        sub_19E2C(v71, v86);
        uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
        v89(v86, v87);
        uint64_t v90 = (*(uint64_t (**)(uint64_t, uint64_t))(v207 + 8))(v71, v69);
        uint64_t v91 = v184;
        SessionServerMessage.payload.getter(v90);
        if ((*(unsigned int (**)(char *, uint64_t))(v88 + 88))(v91, v87) == enum case for MessagePayload.systemResponse(_:))
        {
          (*(void (**)(char *, uint64_t))(v88 + 96))(v91, v87);
          uint64_t v92 = v181;
          uint64_t v93 = (uint64_t)v180;
          uint64_t v94 = v182;
          (*(void (**)(char *, char *, uint64_t))(v181 + 32))(v180, v91, v182);
          uint64_t v95 = v192;
          sub_3E74(v93, v192);
          (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v93, v94);
          uint64_t v96 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56LL))(v95, 0LL, 1LL, v96);
        }

        else
        {
          v89((uint64_t)v91, v87);
          uint64_t v146 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v146 - 8) + 56LL))( v192,  1LL,  1LL,  v146);
        }

        uint64_t v147 = v210;
        unint64_t v148 = v206;
        (*(void (**)(uint64_t, uint64_t))(v208 + 8))(v205, v209);
      }

      else
      {
        if (v62 != enum case for ConfirmationResponse.rejected(_:))
        {
          uint64_t v149 = type metadata accessor for IFFlowError(0LL);
          uint64_t v150 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
          uint64_t v151 = swift_allocError(v149, v150, 0LL, 0LL);
          uint64_t v153 = v152;
          unint64_t v215 = 0LL;
          unint64_t v216 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(42LL);
          swift_bridgeObjectRelease(v216);
          unint64_t v215 = 0xD000000000000028LL;
          unint64_t v216 = 0x8000000000033940LL;
          uint64_t v154 = sub_5E50( &qword_3D480,  (uint64_t (*)(uint64_t))&type metadata accessor for ConfirmationResponse,  (uint64_t)&protocol conformance descriptor for ConfirmationResponse);
          uint64_t v155 = a4;
          uint64_t v156 = v211;
          v157._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v59, v154);
          v158 = v44;
          object = v157._object;
          String.append(_:)(v157);
          swift_bridgeObjectRelease(object);
          unint64_t v160 = v216;
          *uint64_t v153 = v215;
          v153[1] = v160;
          swift_storeEnumTagMultiPayload(v153, v149, 4LL);
          v161 = *(void (**)(char *, uint64_t))(v177 + 8);
          v161(v156, v59);
          (*(void (**)(char *, uint64_t))(v42 + 8))(v158, v155);
          uint64_t v162 = v213;
          uint64_t *v213 = v151;
          *((_BYTE *)v162 + 8) = 1;
          uint64_t v164 = type metadata accessor for IFFlow.State(0LL, *(void *)(v212 + 80), *(void *)(v212 + 88), v163);
          swift_storeEnumTagMultiPayload(v162, v164, 2LL);
          return ((uint64_t (*)(char *, uint64_t))v161)(v206, v59);
        }

        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v206 = (char *)v36;
        uint64_t v210 = a4;
        v214 = v44;
        uint64_t v176 = v42;
        uint64_t v107 = type metadata accessor for Logger(0LL);
        uint64_t v108 = sub_458C(v107, (uint64_t)qword_3E310);
        uint64_t v109 = (os_log_s *)Logger.logObject.getter(v108);
        os_log_type_t v110 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v109, v110))
        {
          uint64_t v111 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v111 = 0;
          _os_log_impl(&dword_0, v109, v110, "IFFlow Confirmation rejected. Forwarding to IF", v111, 2u);
          swift_slowDealloc(v111, -1LL, -1LL);
        }

        v184 = *(char **)(v207 + 56);
        uint64_t v112 = v193;
        uint64_t v113 = v197;
        uint64_t v114 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v184)(v193, 1LL, 1LL, v197);
        uint64_t v115 = (uint64_t)v196;
        SessionServerMessage.eventId.getter(v114);
        uint64_t v116 = v189;
        _BYTE *v189 = 0;
        (*(void (**)(_BYTE *, void, uint64_t))(v185 + 104))( v116,  enum case for SystemPromptResolution.UserAction.actionConfirmed(_:),  v186);
        id v117 = v190;
        (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v190, v192, v188);
        uint64_t v118 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
        uint64_t v119 = type metadata accessor for SystemPromptResolution.ResolutionInput(0LL);
        uint64_t v120 = *(void *)(v119 - 8);
        uint64_t v121 = v191;
        (*(void (**)(char *, uint64_t, uint64_t))(v120 + 104))(v191, v118, v119);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v120 + 56))(v121, 0LL, 1LL, v119);
        uint64_t v122 = v183;
        SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)( v112,  v115,  v116,  v117,  v121);
        uint64_t v123 = sub_494C(&qword_3D1E8);
        uint64_t v80 = v213;
        uint64_t v205 = (uint64_t)v213 + *(int *)(v123 + 48);
        SessionServerMessage.sessionId.getter();
        uint64_t v124 = v198;
        (*(void (**)(char *, char *, uint64_t))(v208 + 16))(v198, v122, v209);
        (*(void (**)(char *, void, uint64_t))(v194 + 104))( v124,  enum case for MessagePayload.RequestContent.promptResolution(_:),  v195);
        uint64_t v125 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
        int v126 = v200;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56LL))(v200, 1LL, 1LL, v125);
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v184)(v112, 1LL, 1LL, v113);
        uint64_t v127 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
        uint64_t v128 = v201;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 56LL))(v201, 1LL, 1LL, v127);
        uint64_t v129 = (uint64_t)v199;
        MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v124,  0LL,  0LL,  v126,  v112,  v128);
        uint64_t v131 = v202;
        uint64_t v130 = v203;
        (*(void (**)(uint64_t, void, uint64_t))(v202 + 104))( v129,  enum case for MessagePayload.request(_:),  v203);
        sub_19E2C(v115, v129);
        uint64_t v132 = *(void (**)(uint64_t, uint64_t))(v131 + 8);
        v132(v129, v130);
        uint64_t v133 = (*(uint64_t (**)(uint64_t, uint64_t))(v207 + 8))(v115, v113);
        int v134 = v179;
        SessionServerMessage.payload.getter(v133);
        if ((*(unsigned int (**)(char *, uint64_t))(v131 + 88))(v134, v130) == enum case for MessagePayload.systemResponse(_:))
        {
          (*(void (**)(char *, uint64_t))(v131 + 96))(v134, v130);
          uint64_t v135 = v181;
          uint64_t v136 = (uint64_t)v178;
          uint64_t v137 = v182;
          (*(void (**)(char *, char *, uint64_t))(v181 + 32))(v178, v134, v182);
          uint64_t v138 = v205;
          sub_3E74(v136, v205);
          (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v136, v137);
          uint64_t v139 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v139 - 8) + 56LL))( v138,  0LL,  1LL,  v139);
        }

        else
        {
          v132((uint64_t)v134, v130);
          uint64_t v173 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v173 - 8) + 56LL))( v205,  1LL,  1LL,  v173);
        }

        uint64_t v147 = v210;
        unint64_t v148 = v206;
        (*(void (**)(char *, uint64_t))(v208 + 8))(v183, v209);
      }

      (*(void (**)(char *, char *))(v177 + 8))(v211, v148);
      (*(void (**)(char *, uint64_t))(v176 + 8))(v214, v147);
      uint64_t v104 = type metadata accessor for IFFlow.State(0LL, *(void *)(v212 + 80), *(void *)(v212 + 88), v174);
      uint64_t v105 = v80;
      uint64_t v106 = 0LL;
      return swift_storeEnumTagMultiPayload(v105, v104, v106);
    }

    sub_14D08((uint64_t)v35);
    uint64_t v50 = type metadata accessor for IFFlowError(0LL);
    uint64_t v51 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    uint64_t v52 = swift_allocError(v50, v51, 0LL, 0LL);
    *uint64_t v53 = 0;
    swift_storeEnumTagMultiPayload(v53, v50, 6LL);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, a4);
    unint64_t v55 = v213;
    uint64_t *v213 = v52;
    *((_BYTE *)v55 + 8) = 1;
  }

  else
  {
    int v56 = v49;
    if (v49 == enum case for PromptResult.error<A>(_:))
    {
      (*(void (**)(char *, uint64_t))(v46 + 96))(v48, v45);
      char v57 = v48[8];
      unint64_t v55 = v213;
      uint64_t *v213 = *(void *)v48;
      BOOL v58 = (v57 & 1) == 0;
    }

    else
    {
      if (v49 == enum case for PromptResult.cancelled<A>(_:))
      {
        uint64_t v97 = v213;
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v98 = type metadata accessor for Logger(0LL);
        uint64_t v99 = sub_458C(v98, (uint64_t)qword_3E310);
        uint64_t v100 = (os_log_s *)Logger.logObject.getter(v99);
        os_log_type_t v101 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v100, v101))
        {
          uint64_t v102 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v102 = 0;
          _os_log_impl(&dword_0, v100, v101, "Exiting IFFlow, received userCancelled", v102, 2u);
          swift_slowDealloc(v102, -1LL, -1LL);
        }

        *uint64_t v97 = 0LL;
        *((_BYTE *)v97 + 8) = 0;
        uint64_t v104 = type metadata accessor for IFFlow.State(0LL, *(void *)(v212 + 80), *(void *)(v212 + 88), v103);
        uint64_t v105 = v97;
        uint64_t v106 = 3LL;
        return swift_storeEnumTagMultiPayload(v105, v104, v106);
      }

      int v140 = enum case for PromptResult.unanswered<A>(_:);
      uint64_t v141 = type metadata accessor for IFFlowError(0LL);
      uint64_t v142 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
      uint64_t v144 = swift_allocError(v141, v142, 0LL, 0LL);
      uint64_t v145 = v143;
      if (v56 != v140)
      {
        unint64_t v215 = 0LL;
        unint64_t v216 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(35LL);
        swift_bridgeObjectRelease(v216);
        unint64_t v215 = 0xD000000000000021LL;
        unint64_t v216 = 0x8000000000033540LL;
        uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PromptResult<A>, v45);
        v167._countAndFlagsBits = sub_25380((uint64_t)v214, v45, WitnessTable);
        uint64_t v168 = v167._object;
        String.append(_:)(v167);
        swift_bridgeObjectRelease(v168);
        unint64_t v169 = v216;
        *uint64_t v145 = v215;
        v145[1] = v169;
        swift_storeEnumTagMultiPayload(v145, v141, 4LL);
        uint64_t v170 = v213;
        uint64_t *v213 = v144;
        *((_BYTE *)v170 + 8) = 1;
        uint64_t v172 = type metadata accessor for IFFlow.State(0LL, *(void *)(v212 + 80), *(void *)(v212 + 88), v171);
        swift_storeEnumTagMultiPayload(v170, v172, 2LL);
        return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v48, v45);
      }

      *(_BYTE *)uint64_t v143 = 0;
      swift_storeEnumTagMultiPayload(v143, v141, 6LL);
      unint64_t v55 = v213;
      uint64_t *v213 = v144;
      BOOL v58 = 1;
    }

    *((_BYTE *)v55 + 8) = v58;
  }

  uint64_t v104 = type metadata accessor for IFFlow.State(0LL, *(void *)(v212 + 80), *(void *)(v212 + 88), v54);
  uint64_t v105 = v55;
  uint64_t v106 = 2LL;
  return swift_storeEnumTagMultiPayload(v105, v104, v106);
}

uint64_t sub_14D08(uint64_t a1)
{
  uint64_t v2 = sub_494C(&qword_3D478);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_14D48()
{
  uint64_t v1 = type metadata accessor for DeviceIdiom(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  int v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == enum case for DeviceIdiom.car(_:)) {
    return 1LL;
  }
  if (v5 == enum case for DeviceIdiom.homepod(_:)) {
    return 3LL;
  }
  if (v5 == enum case for DeviceIdiom.mac(_:)) {
    return 4LL;
  }
  if (v5 == enum case for DeviceIdiom.pad(_:)) {
    return 7LL;
  }
  if (v5 == enum case for DeviceIdiom.pod(_:)) {
    return 5LL;
  }
  if (v5 == enum case for DeviceIdiom.phone(_:)) {
    return 6LL;
  }
  if (v5 == enum case for DeviceIdiom.watch(_:)) {
    return 8LL;
  }
  if (v5 == enum case for DeviceIdiom.tv(_:)) {
    return 9LL;
  }
  if (v5 == enum case for DeviceIdiom.reality(_:)) {
    return 10LL;
  }
  if (v5 == enum case for DeviceIdiom.unknown(_:)) {
    return 0LL;
  }
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v1, v1);
  __break(1u);
  return result;
}

id sub_14EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v128 = a3;
  uint64_t v114 = a1;
  uint64_t v115 = a2;
  uint64_t v5 = type metadata accessor for DeviceIdiom(0LL);
  uint64_t v126 = *(void *)(v5 - 8);
  id v127 = (id)v5;
  __chkstk_darwin(v5);
  uint64_t v125 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for InteractionType(0LL);
  uint64_t v122 = *(void (***)(char *, void, NSString))(v7 - 8);
  NSString v123 = (NSString)v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v121 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v120 = (char *)&v106 - v10;
  uint64_t v11 = type metadata accessor for ResponseMode(0LL);
  Class isa = *(Class *)(v11 - 8);
  NSString v118 = (NSString)v11;
  __chkstk_darwin(v11);
  Class v116 = (Class)((char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v113 = type metadata accessor for InputOrigin(0LL);
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v111 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v110 = type metadata accessor for BargeInMode(0LL);
  uint64_t v109 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v107 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_494C(&qword_3D488);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_494C(&qword_3D490);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v106 - v22;
  uint64_t v24 = type metadata accessor for DeviceRestrictions(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v106 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = type metadata accessor for Restrictions(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v32 = (char *)&v106 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v129 = a4;
  uint64_t v33 = dispatch thunk of CurrentDevice.restrictedCommands.getter(v30);
  Restrictions.deviceRestrictions.getter(v33);
  uint64_t v34 = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v32, v28);
  uint64_t v35 = DeviceRestrictions.aceSet.getter(v34);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  uint64_t v36 = swift_bridgeObjectRetain(v35);
  uint64_t v37 = sub_15728(v36);
  swift_bridgeObjectRelease(v35);
  uint64_t v132 = v37;
  sub_1580C((uint64_t *)&v132);
  uint64_t v38 = swift_bridgeObjectRelease(v35);
  uint64_t v119 = (uint64_t)v132;
  CurrentRequest.bargeInContext.getter(v38);
  uint64_t v39 = type metadata accessor for BargeInContext(0LL);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v17, 1LL, v39) == 1)
  {
    sub_8DCC((uint64_t)v17, &qword_3D488);
    uint64_t v41 = 1LL;
  }

  else
  {
    BargeInContext.mode.getter();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v39);
    uint64_t v41 = 0LL;
  }

  uint64_t v42 = v122;
  NSString v43 = v123;
  uint64_t v45 = v120;
  uint64_t v44 = v121;
  uint64_t v46 = v109;
  uint64_t v47 = v110;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v23, v41, 1LL, v110);
  sub_15874((uint64_t)v23, (uint64_t)v21);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v21, 1LL, v47) == 1)
  {
    uint64_t v108 = 0LL;
    uint64_t v121 = 0LL;
  }

  else
  {
    uint64_t v48 = v44;
    int v49 = v45;
    uint64_t v50 = v42;
    uint64_t v51 = v107;
    uint64_t v52 = (*(uint64_t (**)(char *, char *, uint64_t))(v46 + 32))(v107, v21, v47);
    uint64_t v132 = (void *)BargeInMode.rawValue.getter(v52);
    uint64_t v108 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    uint64_t v121 = v53;
    uint64_t v54 = v51;
    uint64_t v42 = v50;
    uint64_t v45 = v49;
    uint64_t v44 = v48;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v54, v47);
  }

  sub_8DCC((uint64_t)v23, &qword_3D490);
  uint64_t v55 = v115;
  NSString v123 = String._bridgeToObjectiveC()();
  uint64_t v56 = swift_bridgeObjectRelease(v55);
  uint64_t v57 = CurrentRequest.executionRequestId.getter(v56);
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v122 = (void (**)(char *, void, NSString))String._bridgeToObjectiveC()();
    uint64_t v57 = swift_bridgeObjectRelease(v59);
  }

  else
  {
    uint64_t v122 = 0LL;
  }

  os_log_type_t v60 = v111;
  uint64_t v61 = CurrentRequest.inputOrigin.getter(v57);
  InputOrigin.aceInputOrigin.getter(v61);
  uint64_t v63 = v62;
  (*(void (**)(char *, uint64_t))(v112 + 8))(v60, v113);
  uint64_t v120 = (char *)String._bridgeToObjectiveC()();
  uint64_t v64 = swift_bridgeObjectRelease(v63);
  Class v65 = v116;
  uint64_t v66 = CurrentRequest.responseMode.getter(v64);
  ResponseMode.description.getter(v66);
  uint64_t v68 = v67;
  ((void (*)(Class, NSString))isa[1].isa)(v65, v118);
  NSString v118 = String._bridgeToObjectiveC()();
  uint64_t v69 = swift_bridgeObjectRelease(v68);
  CurrentRequest.interactionType.getter(v69);
  v42[13](v44, enum case for InteractionType.dialogDriven(_:), v43);
  unint64_t v70 = sub_158BC();
  dispatch thunk of RawRepresentable.rawValue.getter(&v132, v43, v70);
  dispatch thunk of RawRepresentable.rawValue.getter(&v130, v43, v70);
  uint64_t v71 = v133;
  uint64_t v72 = v131;
  if (v132 == v130 && v133 == v131) {
    uint64_t v72 = v133;
  }
  else {
    _stringCompareWithSmolCheck(_:_:expecting:)(v132, v133, v130, v131, 0LL);
  }
  swift_bridgeObjectRelease(v71);
  swift_bridgeObjectRelease(v72);
  uint64_t v73 = (void (*)(char *, NSString))v42[1];
  v73(v44, v43);
  v73(v45, v43);
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  sub_15904();
  Class v116 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
  dispatch thunk of CurrentDevice.isVoiceTriggerEnabled.getter();
  v74.super.super.Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  dispatch thunk of CurrentDevice.isTextToSpeechEnabled.getter();
  v75.super.super.Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  uint64_t v76 = CurrentRequest.voiceTriggerEventInfo.getter();
  if (v76)
  {
    swift_bridgeObjectRelease(v76);
    v77.super.super.Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  }

  else
  {
    v77.super.super.Class isa = 0LL;
  }

  uint64_t v78 = v119;
  v79.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v78);
  uint64_t v80 = v121;
  if (v121)
  {
    uint64_t v81 = sub_494C(&qword_3D2A8);
    uint64_t v82 = (void *)swift_allocObject(v81, 48LL, 7LL);
    *((_OWORD *)v82 + 1) = xmmword_31350;
    v82[4] = v108;
    v82[5] = v80;
  }

  else
  {
    uint64_t v82 = _swiftEmptyArrayStorage;
  }

  id v83 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v124));
  Class v84 = Array._bridgeToObjectiveC()().super.isa;
  Class v124 = v84;
  uint64_t v85 = swift_bridgeObjectRelease(v82);
  uint64_t v86 = v125;
  dispatch thunk of CurrentDevice.deviceIdiom.getter(v85);
  int v87 = sub_14D48();
  (*(void (**)(char *, id))(v126 + 8))(v86, v127);
  LODWORD(v105) = v87;
  Class v103 = v79.super.isa;
  Class v104 = v84;
  Class v101 = v75.super.super.isa;
  Class v102 = v77.super.super.isa;
  Class v100 = v74.super.super.isa;
  uint64_t v88 = v83;
  uint64_t v90 = v122;
  uint64_t v89 = v123;
  Class v91 = v79.super.isa;
  uint64_t v92 = v120;
  Class v94 = isa;
  uint64_t v93 = v118;
  Class v95 = v77.super.super.isa;
  Class v96 = v75.super.super.isa;
  Class v97 = v74.super.super.isa;
  Class v98 = v116;
  id v127 = [v88 initWithSessionID:v123 requestID:v122 inputOrigin:v120 responseMode:v118 isEyesFree:isa isMultiUser:v116 isVoiceTriggerEnabled:v100 isTextToSpe echEnabled:v101 isTriggerlessFollowup:v102 deviceRestrictions:v103 bargeInModes:v104 identifiedUser:0 encodedLocation:0 countryCode:0 s iriLocale:0 contentRestrictions:0 uiScale:0 temperatureUnit:0 allowUserGeneratedContent:0 censorSpeech:0 meCard:0 deviceIdiom:v105 didPSCFire:0];

  swift_release(v128);
  swift_release(v129);
  return v127;
}

void *sub_15728(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_494C(&qword_3D2A8);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_16540((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_1673C(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }

  return v4;
}

Swift::Int sub_1580C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_16744(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_15940(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_15874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_3D490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_158BC()
{
  unint64_t result = qword_3D498;
  if (!qword_3D498)
  {
    uint64_t v1 = type metadata accessor for InteractionType(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for InteractionType, v1);
    atomic_store(result, (unint64_t *)&qword_3D498);
  }

  return result;
}

unint64_t sub_15904()
{
  unint64_t result = qword_3D4A0;
  if (!qword_3D4A0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_3D4A0);
  }

  return result;
}

Swift::Int sub_15940(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_16028(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_154;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_162:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v111 = result;
  uint64_t v108 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_120:
      Class v101 = v11;
      uint64_t v110 = v8;
      if (v12 < 2) {
        goto LABEL_117;
      }
      uint64_t v102 = *v108;
      while (1)
      {
        unint64_t v103 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_149;
        }
        if (!v102) {
          goto LABEL_161;
        }
        Class v100 = v101;
        uint64_t v104 = *(void *)&v101[16 * v103 + 32];
        uint64_t v105 = *(void *)&v101[16 * v12 + 24];
        sub_160F4( (char *)(v102 + 16 * v104),  (char *)(v102 + 16LL * *(void *)&v101[16 * v12 + 16]),  v102 + 16 * v105,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v105 < v104) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0) {
          Class v100 = sub_1652C((uint64_t)v100);
        }
        if (v103 >= *((void *)v100 + 2)) {
          goto LABEL_151;
        }
        uint64_t v106 = &v100[16 * v103 + 32];
        *(void *)uint64_t v106 = v104;
        *((void *)v106 + 1) = v105;
        unint64_t v107 = *((void *)v100 + 2);
        if (v12 > v107) {
          goto LABEL_152;
        }
        memmove(&v100[16 * v12 + 16], &v100[16 * v12 + 32], 16 * (v107 - v12));
        Class v101 = v100;
        *((void *)v100 + 2) = v107 - 1;
        unint64_t v12 = v107 - 1;
        if (v107 <= 2) {
          goto LABEL_117;
        }
      }
    }

    uint64_t v110 = &_swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(void *)(v7 + 16) = v6;
    uint64_t v110 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v109 = v10 + 8;
  uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v112 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    uint64_t v18 = v17[1];
    if (v15 == *v17 && v16 == v18)
    {
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v20 = 0;
    }

    else
    {
      int v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, *v17, v18, 1LL);
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    uint64_t v22 = (uint64_t *)(v109 + 16 * v21);
    do
    {
      uint64_t v24 = *(v22 - 1);
      uint64_t v25 = *v22;
      uint64_t v26 = (void *)(v10 + 16 * v9);
      uint64_t v27 = v26[1];
      if (v24 == *v26 && v25 == v27)
      {
        if ((v20 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v20 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, *v26, v27, 1LL)) & 1) != 0)
      {
        goto LABEL_36;
      }

      v22 += 2;
      Swift::Int v23 = v21 + 1;
      Swift::Int v9 = v21;
      Swift::Int v21 = v23;
    }

    while (v23 < v3);
    Swift::Int v21 = v23;
LABEL_36:
    Swift::Int v9 = v21;
    if ((v20 & 1) != 0)
    {
LABEL_37:
      if (v21 < v13) {
        goto LABEL_157;
      }
      if (v13 < v21)
      {
        uint64_t v29 = 16 * v21;
        uint64_t v30 = 16 * v13;
        Swift::Int v31 = v21;
        Swift::Int v32 = v13;
        do
        {
          if (v32 != --v31)
          {
            if (!v10) {
              goto LABEL_160;
            }
            uint64_t v33 = v10 + v29;
            uint64_t v34 = *(void *)(v10 + v30);
            uint64_t v35 = *(void *)(v10 + v30 + 8);
            *(_OWORD *)(v10 + v30) = *(_OWORD *)(v10 + v29 - 16);
            *(void *)(v33 - 16) = v34;
            *(void *)(v33 - 8) = v35;
          }

          ++v32;
          v29 -= 16LL;
          v30 += 16LL;
        }

        while (v32 < v31);
      }

LABEL_45:
      Swift::Int v9 = v21;
    }

LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_153;
      }
      if (v9 - v13 < v111)
      {
        if (__OFADD__(v13, v111)) {
          goto LABEL_155;
        }
        if (v13 + v111 >= v3) {
          Swift::Int v36 = v3;
        }
        else {
          Swift::Int v36 = v13 + v111;
        }
        if (v36 < v13) {
          goto LABEL_156;
        }
        if (v9 != v36)
        {
          uint64_t v37 = (void *)(v10 + 16 * v9);
          do
          {
            uint64_t v38 = (uint64_t *)(v10 + 16 * v9);
            uint64_t v39 = *v38;
            uint64_t v40 = v38[1];
            Swift::Int v41 = v13;
            uint64_t v42 = v37;
            do
            {
              uint64_t v43 = *(v42 - 2);
              uint64_t v44 = *(v42 - 1);
              BOOL v45 = v39 == v43 && v40 == v44;
              if (v45 || (_stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v43, v44, 1LL) & 1) == 0) {
                break;
              }
              if (!v10) {
                goto LABEL_158;
              }
              uint64_t v39 = *v42;
              uint64_t v40 = v42[1];
              *(_OWORD *)uint64_t v42 = *((_OWORD *)v42 - 1);
              *(v42 - 1) = v40;
              *(v42 - 2) = v39;
              v42 -= 2;
              ++v41;
            }

            while (v9 != v41);
            ++v9;
            v37 += 2;
          }

          while (v9 != v36);
          Swift::Int v9 = v36;
        }
      }
    }

    if (v9 < v13)
    {
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
      goto LABEL_162;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      uint64_t v11 = sub_1638C(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v47 = *((void *)v11 + 2);
    unint64_t v46 = *((void *)v11 + 3);
    unint64_t v12 = v47 + 1;
    if (v47 >= v46 >> 1) {
      uint64_t v11 = sub_1638C((char *)(v46 > 1), v47 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v48 = v11 + 32;
    int v49 = &v11[16 * v47 + 32];
    *(void *)int v49 = v13;
    *((void *)v49 + 1) = v9;
    if (v47) {
      break;
    }
    unint64_t v12 = 1LL;
LABEL_15:
    Swift::Int v3 = v112;
    if (v9 >= v112)
    {
      uint64_t v8 = v110;
      goto LABEL_120;
    }
  }

  Swift::Int v113 = v9;
  while (1)
  {
    unint64_t v50 = v12 - 1;
    if (v12 >= 4)
    {
      uint64_t v55 = &v48[16 * v12];
      uint64_t v56 = *((void *)v55 - 8);
      uint64_t v57 = *((void *)v55 - 7);
      BOOL v61 = __OFSUB__(v57, v56);
      uint64_t v58 = v57 - v56;
      if (v61) {
        goto LABEL_137;
      }
      uint64_t v60 = *((void *)v55 - 6);
      uint64_t v59 = *((void *)v55 - 5);
      BOOL v61 = __OFSUB__(v59, v60);
      uint64_t v53 = v59 - v60;
      char v54 = v61;
      if (v61) {
        goto LABEL_138;
      }
      unint64_t v62 = v12 - 2;
      uint64_t v63 = &v48[16 * v12 - 32];
      uint64_t v65 = *(void *)v63;
      uint64_t v64 = *((void *)v63 + 1);
      BOOL v61 = __OFSUB__(v64, v65);
      uint64_t v66 = v64 - v65;
      if (v61) {
        goto LABEL_140;
      }
      BOOL v61 = __OFADD__(v53, v66);
      uint64_t v67 = v53 + v66;
      if (v61) {
        goto LABEL_143;
      }
      if (v67 >= v58)
      {
        uint64_t v85 = &v48[16 * v50];
        uint64_t v87 = *(void *)v85;
        uint64_t v86 = *((void *)v85 + 1);
        BOOL v61 = __OFSUB__(v86, v87);
        uint64_t v88 = v86 - v87;
        if (v61) {
          goto LABEL_147;
        }
        BOOL v78 = v53 < v88;
        goto LABEL_105;
      }
    }

    else
    {
      if (v12 != 3)
      {
        uint64_t v79 = *((void *)v11 + 4);
        uint64_t v80 = *((void *)v11 + 5);
        BOOL v61 = __OFSUB__(v80, v79);
        uint64_t v72 = v80 - v79;
        char v73 = v61;
        goto LABEL_99;
      }

      uint64_t v52 = *((void *)v11 + 4);
      uint64_t v51 = *((void *)v11 + 5);
      BOOL v61 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      char v54 = v61;
    }

    if ((v54 & 1) != 0) {
      goto LABEL_139;
    }
    unint64_t v62 = v12 - 2;
    uint64_t v68 = &v48[16 * v12 - 32];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    BOOL v71 = __OFSUB__(v69, v70);
    uint64_t v72 = v69 - v70;
    char v73 = v71;
    if (v71) {
      goto LABEL_142;
    }
    NSNumber v74 = &v48[16 * v50];
    uint64_t v76 = *(void *)v74;
    uint64_t v75 = *((void *)v74 + 1);
    BOOL v61 = __OFSUB__(v75, v76);
    uint64_t v77 = v75 - v76;
    if (v61) {
      goto LABEL_145;
    }
    if (__OFADD__(v72, v77)) {
      goto LABEL_146;
    }
    if (v72 + v77 >= v53)
    {
      BOOL v78 = v53 < v77;
LABEL_105:
      if (v78) {
        unint64_t v50 = v62;
      }
      goto LABEL_107;
    }

LABEL_99:
    if ((v73 & 1) != 0) {
      goto LABEL_141;
    }
    uint64_t v81 = &v48[16 * v50];
    uint64_t v83 = *(void *)v81;
    uint64_t v82 = *((void *)v81 + 1);
    BOOL v61 = __OFSUB__(v82, v83);
    uint64_t v84 = v82 - v83;
    if (v61) {
      goto LABEL_144;
    }
    if (v84 < v72) {
      goto LABEL_15;
    }
LABEL_107:
    unint64_t v89 = v50 - 1;
    if (v50 - 1 >= v12)
    {
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }

    uint64_t v90 = v10;
    if (!v10) {
      goto LABEL_159;
    }
    Class v91 = v11;
    uint64_t v92 = &v48[16 * v89];
    uint64_t v93 = *(void *)v92;
    Class v94 = v48;
    unint64_t v95 = v50;
    Class v96 = &v48[16 * v50];
    uint64_t v97 = *((void *)v96 + 1);
    uint64_t v98 = v90;
    sub_160F4((char *)(v90 + 16LL * *(void *)v92), (char *)(v90 + 16LL * *(void *)v96), v90 + 16 * v97, __dst);
    if (v1) {
      break;
    }
    if (v97 < v93) {
      goto LABEL_134;
    }
    if (v95 > *((void *)v91 + 2)) {
      goto LABEL_135;
    }
    *(void *)uint64_t v92 = v93;
    *(void *)&v94[16 * v89 + 8] = v97;
    unint64_t v99 = *((void *)v91 + 2);
    if (v95 >= v99) {
      goto LABEL_136;
    }
    uint64_t v11 = v91;
    unint64_t v12 = v99 - 1;
    memmove(v96, v96 + 16, 16 * (v99 - 1 - v95));
    uint64_t v48 = v94;
    *((void *)v91 + 2) = v99 - 1;
    uint64_t v10 = v98;
    Swift::Int v9 = v113;
    if (v99 <= 2) {
      goto LABEL_15;
    }
  }

  Class v100 = v91;
LABEL_116:
  Class v101 = v100;
LABEL_117:
  swift_bridgeObjectRelease(v101);
  *((void *)v110 + 2) = 0LL;
  return swift_bridgeObjectRelease(v110);
}

uint64_t sub_16028(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_160F4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  Swift::Int v31 = __src;
  uint64_t v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v19 = &v4[16 * v13];
      uint64_t v29 = v19;
      Swift::Int v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        int v20 = (char *)(a3 - 16);
        Swift::Int v21 = v6;
        while (1)
        {
          uint64_t v22 = v20 + 16;
          uint64_t v23 = *((void *)v19 - 2);
          uint64_t v24 = *((void *)v19 - 1);
          uint64_t v25 = *((void *)v21 - 2);
          uint64_t v26 = *((void *)v21 - 1);
          v21 -= 16;
          BOOL v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1LL) & 1) == 0)
          {
            uint64_t v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19) {
              *(_OWORD *)int v20 = *((_OWORD *)v19 - 1);
            }
            Swift::Int v21 = v6;
            v19 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v22 != v6 || v20 >= v6) {
              *(_OWORD *)int v20 = *(_OWORD *)v21;
            }
            Swift::Int v31 = v21;
            if (v21 <= v7) {
              goto LABEL_50;
            }
          }

          v20 -= 16;
          uint64_t v6 = v21;
          if (v19 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v29 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        uint64_t v15 = *((void *)v6 + 1);
        uint64_t v16 = *((void *)v4 + 1);
        BOOL v17 = *(void *)v6 == *(void *)v4 && v15 == v16;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v15, *(void *)v4, v16, 1LL) & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v30 = v4;
          uint64_t v18 = v6;
        }

        else
        {
          uint64_t v18 = v6 + 16;
          if (v7 < v6 || v7 >= v18 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v18;
      }

      while ((unint64_t)v18 < a3);
      Swift::Int v31 = v7;
    }

LABEL_50:
    sub_16484((void **)&v31, (const void **)&v30, &v29);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_1638C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_494C(&qword_3D4A8);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_16484(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

char *sub_1652C(uint64_t a1)
{
  return sub_1638C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_16540(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    int v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }

    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

LABEL_41:
  __break(1u);
  return result;
}

  uint64_t result = swift_release(v8);
  *Swift::Int v3 = v10;
  return result;
}

uint64_t sub_1673C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_16744(uint64_t a1)
{
  return sub_18CF4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_16758()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for StatementOutcome(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 != enum case for StatementOutcome.success(_:))
  {
    if (v6 == enum case for StatementOutcome.actionConfirmation(_:))
    {
LABEL_4:
      static DialogPhase.confirmation.getter();
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    if (v6 != enum case for StatementOutcome.toolDisambiguation(_:)
      && v6 != enum case for StatementOutcome.parameterNeedsValue(_:))
    {
      if (v6 == enum case for StatementOutcome.parameterConfirmation(_:)) {
        goto LABEL_4;
      }
      if (v6 != enum case for StatementOutcome.parameterDisambiguation(_:)
        && v6 != enum case for StatementOutcome.parameterNotAllowed(_:))
      {
        if (v6 == enum case for StatementOutcome.parameterCandidatesNotFound(_:)
          || v6 == enum case for StatementOutcome.actionRequirement(_:))
        {
          static DialogPhase.status.getter();
          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        }

        if (v6 != enum case for StatementOutcome.valueDisambiguation(_:))
        {
          if (v6 == enum case for StatementOutcome.failure(_:))
          {
            static DialogPhase.error.getter();
            return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          }

          goto LABEL_2;
        }
      }
    }

    static DialogPhase.clarification.getter();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

LABEL_2:
  static DialogPhase.completion.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *sub_1690C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    sub_18AF8(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain(v5);
      swift_dynamicCast(v10, v9, &type metadata for String, (char *)&type metadata for Any + 8, 7LL);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_18AF8(0, v2[2] + 1LL, 1);
        uint64_t v2 = v11;
      }

      unint64_t v7 = v2[2];
      unint64_t v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_18AF8(v6 > 1, v7 + 1, 1);
        uint64_t v2 = v11;
      }

      v4 += 2;
      v2[2] = v7 + 1;
      sub_1997C(v10, &v2[4 * v7 + 4]);
      --v1;
    }

    while (v1);
  }

  return v2;
}

uint64_t sub_16A30@<X0>( uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, char *a4@<X3>, char *a5@<X4>, char *a6@<X5>, char *a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v122 = a8;
  uint64_t v119 = a7;
  uint64_t v121 = a6;
  Class v124 = a5;
  NSString v123 = a4;
  NSString v118 = a2;
  uint64_t v140 = a1;
  uint64_t v141 = a9;
  uint64_t updated = type metadata accessor for IntelligenceFlowStatusUpdateMessage.StatusUpdate(0LL);
  uint64_t v135 = *(void *)(updated - 8);
  uint64_t v136 = updated;
  __chkstk_darwin(updated);
  int v134 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_494C(&qword_3D4C0);
  __chkstk_darwin(v12);
  uint64_t v114 = (char *)&v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v113 = type metadata accessor for IntelligenceFlowStatusUpdateMessage.ProgressUpdate(0LL);
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  Swift::Int v111 = (char *)&v111 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v117 = type metadata accessor for SessionStatusUpdate.ToolExecutionProgressUpdate(0LL);
  uint64_t v116 = *(void *)(v117 - 8);
  __chkstk_darwin(v117);
  uint64_t v115 = (char *)&v111 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v128 = type metadata accessor for SessionStatusUpdate.Payload(0LL);
  uint64_t v126 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  id v127 = (char *)&v111 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for SessionStatusUpdate(0LL);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v111 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_494C(&qword_3D4C8);
  __chkstk_darwin(v18);
  int v20 = (char *)&v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for IntelligenceFlowStatusUpdateMessage.ActionSummary(0LL);
  uint64_t v137 = *(void *)(v21 - 8);
  uint64_t v138 = v21;
  __chkstk_darwin(v21);
  uint64_t v125 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v111 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for MessagePayload.ActionSummaryUpdate(0LL);
  uint64_t v27 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v29 = (char *)&v111 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = type metadata accessor for MessagePayload(0LL);
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v111 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = sub_494C(&qword_3D4D0);
  uint64_t v35 = __chkstk_darwin(v34);
  uint64_t v132 = (uint64_t)&v111 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v35);
  uint64_t v133 = (char *)&v111 - v37;
  uint64_t v120 = a3;
  if (a3)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, v140, v30);
    int v38 = (*(uint64_t (**)(char *, uint64_t))(v31 + 88))(v33, v30);
    if (v38 == enum case for MessagePayload.actionSummaryUpdate(_:))
    {
      (*(void (**)(char *, uint64_t))(v31 + 96))(v33, v30);
      uint64_t v39 = v139;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v33, v139);
      id v40 = [objc_allocWithZone(NSListFormatter) init];
      uint64_t v41 = MessagePayload.ActionSummaryUpdate.summary.getter(v40);
      uint64_t v42 = MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.parameterSummaries.getter(v41);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      id v43 = v40;
      uint64_t v44 = sub_19330(v42, v43);
      swift_bridgeObjectRelease(v42);

      __chkstk_darwin(v45);
      *(&v111 - 2) = v29;
      *(&v111 - 1) = (char *)v44;
      IntelligenceFlowStatusUpdateMessage.ActionSummary.init(build:)(sub_1992C);
      swift_bridgeObjectRelease(v44);
      uint64_t v46 = v137;
      uint64_t v47 = v138;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v137 + 48))(v20, 1LL, v138) == 1)
      {
        sub_8DCC((uint64_t)v20, &qword_3D4C8);
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v48 = type metadata accessor for Logger(0LL);
        uint64_t v49 = sub_458C(v48, (uint64_t)qword_3E310);
        unint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
        os_log_type_t v51 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl( &dword_0,  v50,  v51,  "Could not build IntelligenceFlowStatusUpdateMessage from ActionSummary. Missing fields?",  v52,  2u);
          swift_slowDealloc(v52, -1LL, -1LL);
        }

        (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v39);
LABEL_41:
        uint64_t v110 = type metadata accessor for FlowMessageTransportableOutput(0LL);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56LL))( v141,  1LL,  1LL,  v110);
      }

      (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v39);
      uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      uint64_t v81 = v125;
      v80(v125, v20, v47);
      uint64_t v82 = (uint64_t)v133;
      v80(v133, v81, v47);
      uint64_t v83 = (unsigned int *)&enum case for IntelligenceFlowStatusUpdateMessage.StatusUpdate.actionSummary(_:);
      goto LABEL_30;
    }

    if (v38 != enum case for MessagePayload.statusUpdate(_:))
    {
      uint64_t v84 = type metadata accessor for FlowMessageTransportableOutput(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56LL))(v141, 1LL, 1LL, v84);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v33, v30);
    }

    (*(void (**)(char *, uint64_t))(v31 + 96))(v33, v30);
    uint64_t v60 = v130;
    BOOL v61 = v129;
    uint64_t v62 = v131;
    uint64_t v63 = (*(uint64_t (**)(char *, char *, uint64_t))(v130 + 32))(v129, v33, v131);
    uint64_t v64 = v127;
    SessionStatusUpdate.payload.getter(v63);
    uint64_t v65 = v126;
    uint64_t v66 = v128;
    int v67 = (*(uint64_t (**)(char *, uint64_t))(v126 + 88))(v64, v128);
    if (v67 == enum case for SessionStatusUpdate.Payload.executionProgressUpdate(_:))
    {
      (*(void (**)(char *, uint64_t))(v65 + 96))(v64, v66);
      uint64_t v68 = v116;
      uint64_t v69 = v115;
      uint64_t v70 = v117;
      uint64_t v71 = (*(uint64_t (**)(char *, char *, uint64_t))(v116 + 32))(v115, v64, v117);
      __chkstk_darwin(v71);
      *(&v111 - 2) = v69;
      uint64_t v72 = (uint64_t)v114;
      IntelligenceFlowStatusUpdateMessage.ProgressUpdate.init(build:)(sub_18A94);
      uint64_t v73 = v112;
      uint64_t v74 = v113;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v112 + 48))(v72, 1LL, v113) == 1)
      {
        sub_8DCC(v72, &qword_3D4C0);
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v75 = type metadata accessor for Logger(0LL);
        uint64_t v76 = sub_458C(v75, (uint64_t)qword_3E310);
        uint64_t v77 = (os_log_s *)Logger.logObject.getter(v76);
        os_log_type_t v78 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v77, v78))
        {
          uint64_t v79 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v79 = 0;
          _os_log_impl( &dword_0,  v77,  v78,  "Could not build IntelligenceFlowStatusUpdateMessage from ProgressUpdate. Missing fields?",  v79,  2u);
          swift_slowDealloc(v79, -1LL, -1LL);
        }

        (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v70);
        goto LABEL_41;
      }

      (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v70);
      Class v91 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 32);
      uint64_t v92 = v111;
      v91(v111, v72, v74);
      uint64_t v82 = (uint64_t)v133;
      v91(v133, (uint64_t)v92, v74);
      uint64_t v83 = (unsigned int *)&enum case for IntelligenceFlowStatusUpdateMessage.StatusUpdate.progressUpdate(_:);
LABEL_30:
      uint64_t v94 = v135;
      uint64_t v93 = v136;
      (*(void (**)(uint64_t, void, uint64_t))(v135 + 104))(v82, *v83, v136);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v94 + 56))(v82, 0LL, 1LL, v93);
      uint64_t v95 = v132;
      sub_F848(v82, v132, &qword_3D4D0);
      int v96 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v95, 1LL, v93);
      uint64_t v97 = v134;
      if (v96 == 1)
      {
        sub_8DCC(v82, &qword_3D4D0);
        sub_8DCC(v95, &qword_3D4D0);
      }

      else
      {
        uint64_t v98 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v94 + 32))(v134, v95, v93);
        __chkstk_darwin(v98);
        unint64_t v99 = v122;
        *(&v111 - 8) = v119;
        *(&v111 - 7) = v99;
        Class v100 = v118;
        *(&v111 - 6) = v121;
        *(&v111 - 5) = v100;
        Class v101 = v123;
        *(&v111 - 4) = v120;
        *(&v111 - 3) = v101;
        *(&v111 - 2) = v124;
        *(&v111 - 1) = v97;
        uint64_t v102 = (objc_class *)type metadata accessor for IntelligenceFlowStatusUpdateMessage(0LL);
        id v103 = objc_allocWithZone(v102);
        uint64_t v104 = IntelligenceFlowStatusUpdateMessage.init(build:)(sub_18A9C, &v111 - 10);
        if (v104)
        {
          v144[3] = v102;
          v144[4] = &protocol witness table for IntelligenceFlowStatusUpdateMessage;
          v144[0] = v104;
          uint64_t v143 = 0LL;
          memset(v142, 0, sizeof(v142));
          uint64_t v105 = v141;
          FlowMessageTransportableOutput.init(message:flowActivity:)(v144, v142);
          sub_8DCC(v82, &qword_3D4D0);
          (*(void (**)(char *, uint64_t))(v94 + 8))(v97, v93);
          uint64_t v106 = type metadata accessor for FlowMessageTransportableOutput(0LL);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56LL))( v105,  0LL,  1LL,  v106);
        }

        sub_8DCC(v82, &qword_3D4D0);
        (*(void (**)(char *, uint64_t))(v94 + 8))(v97, v93);
      }

      goto LABEL_41;
    }

    if (v67 == enum case for SessionStatusUpdate.Payload.intermediateQueryResult(_:))
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v85 = type metadata accessor for Logger(0LL);
      uint64_t v86 = sub_458C(v85, (uint64_t)qword_3E310);
      uint64_t v87 = (os_log_s *)Logger.logObject.getter(v86);
      os_log_type_t v88 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v87, v88)) {
        goto LABEL_39;
      }
      unint64_t v89 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v89 = 0;
      uint64_t v90 = "IntermediateQueryResult is not supported.";
    }

    else
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v107 = type metadata accessor for Logger(0LL);
      uint64_t v108 = sub_458C(v107, (uint64_t)qword_3E310);
      uint64_t v87 = (os_log_s *)Logger.logObject.getter(v108);
      os_log_type_t v88 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v87, v88)) {
        goto LABEL_39;
      }
      unint64_t v89 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v89 = 0;
      uint64_t v90 = "Unknown message payload type.";
    }

    _os_log_impl(&dword_0, v87, v88, v90, v89, 2u);
    swift_slowDealloc(v89, -1LL, -1LL);
LABEL_39:

    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
    uint64_t v109 = type metadata accessor for FlowMessageTransportableOutput(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56LL))(v141, 1LL, 1LL, v109);
    return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v64, v66);
  }

  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v53 = type metadata accessor for Logger(0LL);
  uint64_t v54 = sub_458C(v53, (uint64_t)qword_3E310);
  uint64_t v55 = (os_log_s *)Logger.logObject.getter(v54);
  os_log_type_t v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_0, v55, v56, "RequestId not set, skipping message posting.", v57, 2u);
    swift_slowDealloc(v57, -1LL, -1LL);
  }

  uint64_t v58 = type metadata accessor for FlowMessageTransportableOutput(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56LL))( v141,  1LL,  1LL,  v58);
}

uint64_t sub_17740@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v113 = a3;
  id v114 = a2;
  uint64_t v4 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues(0LL);
  uint64_t v5 = *(uint8_t **)(v4 - 8);
  uint64_t v109 = v4;
  uint64_t v110 = v5;
  uint64_t v6 = __chkstk_darwin(v4);
  id v103 = (char *)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v108 = (char *)&v99 - v8;
  uint64_t v9 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue(0LL);
  uint64_t v111 = *(void *)(v9 - 8);
  uint64_t v112 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder(0LL);
  uint64_t v105 = *(void *)(v12 - 8);
  uint64_t v106 = v12;
  __chkstk_darwin(v12);
  uint64_t v104 = (char *)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v102 = (char *)&v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v107 = (char *)&v99 - v19;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v99 - v20;
  uint64_t updated = type metadata accessor for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary(0LL);
  uint64_t v23 = *(void *)(updated - 8);
  uint64_t v24 = __chkstk_darwin(updated);
  uint64_t v26 = (uint64_t *)((char *)&v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v99 - v27;
  uint64_t v29 = a1;
  uint64_t v30 = a1;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v31(v21, v30, v14);
  int v32 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v21, v14);
  if (v32 != enum case for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.value(_:))
  {
    Class v100 = (uint64_t *)v28;
    uint64_t v101 = v23;
    uint64_t v111 = updated;
    uint64_t v112 = v15;
    uint64_t v41 = v29;
    if (v32 == enum case for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.values(_:))
    {
      uint64_t v42 = v112;
      id v43 = (char *)v14;
      (*(void (**)(char *, uint64_t))(v112 + 96))(v21, v14);
      uint64_t v45 = v109;
      uint64_t v44 = v110;
      uint64_t v46 = v108;
      uint64_t v47 = (*((uint64_t (**)(void))v110 + 4))();
      uint64_t v48 = MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.summaries.getter(v47);
      uint64_t v49 = sub_1690C(v48);
      swift_bridgeObjectRelease(v48);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v49);
      id v51 = v114;
      id v52 = [v114 stringFromItems:isa];

      if (v52)
      {
        uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
        uint64_t v55 = v54;

        (*(void (**)(uint64_t, char *))(v42 + 8))(v41, v43);
        (*((void (**)(char *, uint64_t))v44 + 1))(v46, v45);
        uint64_t v28 = (char *)v100;
        uint64_t v23 = v101;
        *Class v100 = v53;
        *((void *)v28 + 1) = v55;
        uint64_t updated = v111;
        (*(void (**)(char *, void, uint64_t))(v23 + 104))( v28,  enum case for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary.value(_:),  v111);
        id v40 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v23 + 32);
        goto LABEL_8;
      }

      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v80 = type metadata accessor for Logger(0LL);
      sub_458C(v80, (uint64_t)qword_3E310);
      uint64_t v81 = v110;
      uint64_t v82 = v103;
      uint64_t v83 = (*((uint64_t (**)(char *, char *, uint64_t))v110 + 2))(v103, v46, v45);
      uint64_t v84 = (os_log_s *)Logger.logObject.getter(v83);
      os_log_type_t v85 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v84, v85))
      {
        uint64_t v86 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v87 = swift_slowAlloc(32LL, -1LL);
        uint64_t v106 = v41;
        os_log_type_t v88 = v82;
        uint64_t v89 = v87;
        uint64_t v116 = v87;
        *(_DWORD *)uint64_t v86 = 136315138;
        uint64_t v107 = v43;
        uint64_t v90 = MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.summaries.getter(v87);
        uint64_t v91 = Array.description.getter(v90, &type metadata for String);
        unint64_t v93 = v92;
        swift_bridgeObjectRelease(v90);
        uint64_t v115 = sub_12A3C(v91, v93, &v116);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, &v116);
        swift_bridgeObjectRelease(v93);
        uint64_t v94 = (void (*)(char *, uint64_t))*((void *)v110 + 1);
        uint64_t v95 = v88;
        uint64_t v96 = v109;
        v94(v95, v109);
        _os_log_impl(&dword_0, v84, v85, "Couldn't concatenate parameter summaries: %s", v86, 0xCu);
        uint64_t v66 = 1LL;
        swift_arrayDestroy(v89, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v89, -1LL, -1LL);
        swift_slowDealloc(v86, -1LL, -1LL);

        (*(void (**)(uint64_t, char *))(v112 + 8))(v106, v107);
        v94(v108, v96);
      }

      else
      {

        uint64_t v97 = (void (*)(char *, uint64_t))*((void *)v81 + 1);
        v97(v82, v45);
        (*(void (**)(uint64_t, char *))(v112 + 8))(v41, v43);
        v97(v46, v45);
        uint64_t v66 = 1LL;
      }

      uint64_t v65 = v113;
    }

    else
    {
      uint64_t v56 = v14;
      uint64_t v57 = v112;
      if (v32 == enum case for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.placeholder(_:))
      {
        (*(void (**)(char *, uint64_t))(v112 + 96))(v21, v14);
        uint64_t v59 = v104;
        uint64_t v58 = v105;
        uint64_t v60 = v106;
        uint64_t v61 = (*(uint64_t (**)(char *, char *, uint64_t))(v105 + 32))(v104, v21, v106);
        uint64_t v62 = MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.summary.getter(v61);
        uint64_t v64 = v63;

        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v41, v56);
        (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
        *uint64_t v26 = v62;
        v26[1] = v64;
        uint64_t v23 = v101;
        uint64_t updated = v111;
        (*(void (**)(uint64_t *, void, uint64_t))(v101 + 104))( v26,  enum case for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary.placeholder(_:),  v111);
        id v40 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v23 + 32);
        uint64_t v28 = (char *)v100;
        v40(v100, v26, updated);
        goto LABEL_8;
      }

      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v67 = type metadata accessor for Logger(0LL);
      sub_458C(v67, (uint64_t)qword_3E310);
      uint64_t v68 = v107;
      uint64_t v69 = ((uint64_t (*)(char *, uint64_t, uint64_t))v31)(v107, v29, v14);
      uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
      os_log_type_t v71 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v106 = v29;
        uint64_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v73 = swift_slowAlloc(32LL, -1LL);
        uint64_t v116 = v73;
        *(_DWORD *)uint64_t v72 = 136315138;
        uint64_t v110 = v72 + 4;
        uint64_t v74 = v102;
        v31(v102, (uint64_t)v68, v14);
        uint64_t v75 = String.init<A>(describing:)(v74, v14);
        unint64_t v77 = v76;
        uint64_t v115 = sub_12A3C(v75, v76, &v116);
        uint64_t v56 = v14;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, &v116);
        swift_bridgeObjectRelease(v77);
        os_log_type_t v78 = *(void (**)(char *, uint64_t))(v112 + 8);
        v78(v68, v14);
        _os_log_impl(&dword_0, v70, v71, "Unknown ParameterSummary case: %s", v72, 0xCu);
        swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v73, -1LL, -1LL);
        swift_slowDealloc(v72, -1LL, -1LL);

        uint64_t v79 = v106;
      }

      else
      {

        os_log_type_t v78 = *(void (**)(char *, uint64_t))(v112 + 8);
        v78(v68, v14);
        uint64_t v79 = v41;
      }

      v78((char *)v79, v14);
      uint64_t v65 = v113;
      v78(v21, v56);
      uint64_t v66 = 1LL;
    }

    uint64_t updated = v111;
    uint64_t v23 = v101;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v65, v66, 1LL, updated);
  }

  (*(void (**)(char *, uint64_t))(v15 + 96))(v21, v14);
  uint64_t v33 = v21;
  uint64_t v35 = v111;
  uint64_t v34 = v112;
  uint64_t v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v111 + 32))(v11, v33, v112);
  uint64_t v37 = MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.summary.getter(v36);
  uint64_t v109 = v38;
  uint64_t v110 = (uint8_t *)v37;

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v14);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v34);
  uint64_t v39 = v109;
  *uint64_t v26 = (uint64_t)v110;
  v26[1] = v39;
  (*(void (**)(uint64_t *, void, uint64_t))(v23 + 104))( v26,  enum case for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary.value(_:),  updated);
  id v40 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v23 + 32);
  v40((uint64_t *)v28, v26, updated);
LABEL_8:
  uint64_t v65 = v113;
  v40(v113, (uint64_t *)v28, updated);
  uint64_t v66 = 0LL;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v65, v66, 1LL, updated);
}

uint64_t sub_17FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = MessagePayload.ActionSummaryUpdate.summary.getter(v6);
  uint64_t v10 = MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.formatString.getter(v9);
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  IntelligenceFlowStatusUpdateMessage.ActionSummary.Builder.formatString.setter(v10, v12);
  uint64_t v13 = swift_bridgeObjectRetain(a3);
  return IntelligenceFlowStatusUpdateMessage.ActionSummary.Builder.parameterSummaries.setter(v13);
}

uint64_t sub_180A8()
{
  *(float *)&unsigned int v0 = SessionStatusUpdate.ToolExecutionProgressUpdate.progress.getter();
  uint64_t updated = IntelligenceFlowStatusUpdateMessage.ProgressUpdate.Builder.progress.setter(v0);
  uint64_t v2 = SessionStatusUpdate.ToolExecutionProgressUpdate.progressDescription.getter(updated);
  uint64_t v3 = IntelligenceFlowStatusUpdateMessage.ProgressUpdate.Builder.progressDescription.setter(v2);
  uint64_t v4 = SessionStatusUpdate.ToolExecutionProgressUpdate.additionalProgressDescription.getter(v3);
  return IntelligenceFlowStatusUpdateMessage.ProgressUpdate.Builder.additionalProgressDescription.setter(v4);
}

uint64_t sub_18118( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v32 = a7;
  uint64_t v33 = a9;
  uint64_t v15 = sub_494C(&qword_3D4D0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_494C(&qword_3D4B8);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_bridgeObjectRetain(a3);
  IntelligenceFlowStatusUpdateMessage.Builder.assistantId.setter(a2, a3);
  uint64_t v24 = type metadata accessor for UUID(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v23, a4, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v23, 0LL, 1LL, v24);
  IntelligenceFlowStatusUpdateMessage.Builder.sessionId.setter(v23);
  swift_bridgeObjectRetain(a6);
  IntelligenceFlowStatusUpdateMessage.Builder.requestId.setter(a5, a6);
  swift_bridgeObjectRetain(a8);
  IntelligenceFlowStatusUpdateMessage.Builder.rootRequestId.setter(v32, a8);
  uint64_t v26 = enum case for MessageSource.ifFlow(_:);
  uint64_t v27 = type metadata accessor for MessageSource(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v20, v26, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v20, 0LL, 1LL, v27);
  IntelligenceFlowStatusUpdateMessage.Builder.source.setter(v20);
  uint64_t updated = type metadata accessor for IntelligenceFlowStatusUpdateMessage.StatusUpdate(0LL);
  uint64_t v30 = *(void *)(updated - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v17, v33, updated);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v17, 0LL, 1LL, updated);
  return IntelligenceFlowStatusUpdateMessage.Builder.statusUpdate.setter(v17);
}

uint64_t sub_18338@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v51 = a7;
  uint64_t v52 = a8;
  uint64_t v54 = a3;
  uint64_t v55 = a5;
  uint64_t v53 = a1;
  uint64_t v56 = a9;
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for UUID(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2 && a4 && a6)
  {
    UUID.init(uuidString:)(v55, a6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1LL, v20) != 1)
    {
      uint64_t v40 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 32))(v23, v19, v20);
      __chkstk_darwin(v40);
      uint64_t v41 = v52;
      *(&v51 - 8) = v51;
      *(&v51 - 7) = v41;
      uint64_t v42 = v53;
      *(&v51 - 6) = (uint64_t)v23;
      *(&v51 - 5) = v42;
      uint64_t v43 = v54;
      *(&v51 - 4) = a2;
      *(&v51 - 3) = v43;
      *(&v51 - 2) = a4;
      *(&v51 - 1) = a10;
      uint64_t v44 = (objc_class *)type metadata accessor for IntelligenceFlowTraceIdGeneratedMessage(0LL);
      id v45 = objc_allocWithZone(v44);
      uint64_t v46 = (void *)IntelligenceFlowTraceIdGeneratedMessage.init(build:)(sub_18A88, &v51 - 10);
      if (v46)
      {
        v59[3] = (uint64_t)v44;
        v59[4] = (uint64_t)&protocol witness table for IntelligenceFlowTraceIdGeneratedMessage;
        uint64_t v58 = 0LL;
        v59[0] = (uint64_t)v46;
        memset(v57, 0, sizeof(v57));
        id v47 = v46;
        uint64_t v48 = v56;
        FlowMessageTransportableOutput.init(message:flowActivity:)(v59, v57);
        uint64_t v49 = type metadata accessor for FlowMessageTransportableOutput(0LL);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56LL))(v48, 0LL, 1LL, v49);
      }

      else
      {
        uint64_t v50 = ((uint64_t (*)(void))type metadata accessor for FlowMessageTransportableOutput)();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56LL))(v56, 1LL, 1LL, v50);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    }

    sub_8DCC((uint64_t)v19, &qword_3D0C8);
  }

  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v24 = sub_458C(v13, (uint64_t)qword_3E310);
  uint64_t v25 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v24, v13);
  swift_bridgeObjectRetain_n(a6, 2LL);
  swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v26 = swift_bridgeObjectRetain_n(a4, 2LL);
  uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc(32LL, -1LL);
    uint64_t v52 = v13;
    uint64_t v30 = v29;
    uint64_t v51 = swift_slowAlloc(96LL, -1LL);
    v59[0] = v51;
    *(_DWORD *)uint64_t v30 = 136315650;
    if (a2) {
      uint64_t v31 = v53;
    }
    else {
      uint64_t v31 = 0x3E6C6C756E3CLL;
    }
    if (a2) {
      unint64_t v32 = a2;
    }
    else {
      unint64_t v32 = 0xE600000000000000LL;
    }
    uint64_t v53 = v25;
    swift_bridgeObjectRetain(a2);
    *(void *)&v57[0] = sub_12A3C(v31, v32, v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v57, (char *)v57 + 8);
    swift_bridgeObjectRelease_n(a2, 2LL);
    swift_bridgeObjectRelease(v32);
    *(_WORD *)(v30 + 12) = 2080;
    if (a4) {
      uint64_t v33 = v54;
    }
    else {
      uint64_t v33 = 0x3E6C6C756E3CLL;
    }
    if (a4) {
      unint64_t v34 = a4;
    }
    else {
      unint64_t v34 = 0xE600000000000000LL;
    }
    swift_bridgeObjectRetain(a4);
    *(void *)&v57[0] = sub_12A3C(v33, v34, v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v57, (char *)v57 + 8);
    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease(v34);
    *(_WORD *)(v30 + 22) = 2080;
    if (a6) {
      uint64_t v35 = v55;
    }
    else {
      uint64_t v35 = 0x3E6C6C756E3CLL;
    }
    if (a6) {
      unint64_t v36 = a6;
    }
    else {
      unint64_t v36 = 0xE600000000000000LL;
    }
    swift_bridgeObjectRetain(a6);
    *(void *)&v57[0] = sub_12A3C(v35, v36, v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v57, (char *)v57 + 8);
    swift_bridgeObjectRelease_n(a6, 2LL);
    swift_bridgeObjectRelease(v36);
    _os_log_impl( &dword_0,  v27,  v28,  "Can't construct IntelligenceFlowTraceIdGeneratedMessage from executionRequestId: %s, traceId: %s, sessionId: %s",  (uint8_t *)v30,  0x20u);
    uint64_t v37 = v51;
    swift_arrayDestroy(v51, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1LL, -1LL);
    swift_slowDealloc(v30, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v16, v52);
  }

  else
  {

    swift_bridgeObjectRelease_n(a6, 2LL);
    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v13);
  }

  uint64_t v38 = type metadata accessor for FlowMessageTransportableOutput(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56LL))( v56,  1LL,  1LL,  v38);
}

uint64_t sub_18890( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v30 = a9;
  uint64_t v31 = a7;
  uint64_t v15 = sub_494C(&qword_3D4B0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_494C(&qword_3D4B8);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_bridgeObjectRetain(a3);
  IntelligenceFlowTraceIdGeneratedMessage.Builder.assistantId.setter(a2, a3);
  uint64_t v24 = type metadata accessor for UUID(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v23, a4, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v23, 0LL, 1LL, v24);
  IntelligenceFlowTraceIdGeneratedMessage.Builder.sessionId.setter(v23);
  swift_bridgeObjectRetain(a6);
  IntelligenceFlowTraceIdGeneratedMessage.Builder.requestId.setter(a5, a6);
  uint64_t v26 = enum case for MessageSource.ifFlow(_:);
  uint64_t v27 = type metadata accessor for MessageSource(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v20, v26, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v20, 0LL, 1LL, v27);
  IntelligenceFlowTraceIdGeneratedMessage.Builder.source.setter(v20);
  swift_bridgeObjectRetain(a8);
  IntelligenceFlowTraceIdGeneratedMessage.Builder.traceId.setter(v31, a8);
  sub_F848(v30, (uint64_t)v17, &qword_3D4B0);
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.executionSource.setter(v17);
}

uint64_t sub_18A88(uint64_t a1)
{
  return sub_18AA8(a1, sub_18890);
}

uint64_t sub_18A94()
{
  return sub_180A8();
}

uint64_t sub_18A9C(uint64_t a1)
{
  return sub_18AA8(a1, sub_18118);
}

uint64_t sub_18AA8( uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9]);
}

uint64_t sub_18ADC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_18B14(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_18AF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_18E5C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_18B14(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_494C(qword_3D4F8);
  uint64_t v11 = *(void *)(type metadata accessor for ResponseOutput.VisualOutput(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for ResponseOutput.VisualOutput(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  swift_release(v8);
  uint64_t v3 = v41;
  if ((v44 & 1) != 0)
  {
    uint64_t v39 = 1LL << *(_BYTE *)(v8 + 32);
    if (v39 >= 64) {
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
    }
    else {
      *uint64_t v43 = -1LL << v39;
    }
    *(void *)(v8 + 16) = 0LL;
  }

uint64_t sub_18CF4(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_494C(&qword_3D2A8);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_18E5C(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_494C(&qword_3D4F0);
    uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

Swift::Int sub_18FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t updated = type metadata accessor for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary(0LL);
  uint64_t v6 = *(void *)(updated - 8);
  __chkstk_darwin(updated);
  id v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_494C(&qword_3D4E8);
  int v44 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v41 = v3;
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v43 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v42 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  Swift::Int result = swift_retain(v8);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v22 >= v42) {
      goto LABEL_36;
    }
    unint64_t v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_36;
      }
      unint64_t v23 = v43[v17];
      if (!v23) {
        break;
      }
    }

LABEL_23:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    uint64_t v25 = *(void *)(v8 + 56);
    uint64_t v26 = v8;
    uint64_t v27 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    uint64_t v30 = *(void *)(v6 + 72);
    uint64_t v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, updated);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, updated);
      swift_bridgeObjectRetain(v28);
    }

    Hasher.init(_seed:)(v47, *(void *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    Swift::Int result = Hasher._finalize()();
    uint64_t v32 = -1LL << *(_BYTE *)(v10 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0LL;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v15 + 8 * v34);
      }

      while (v38 == -1);
      unint64_t v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v28;
    Swift::Int result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v10 + 56) + v30 * v18,  v45,  updated);
    ++*(void *)(v10 + 16);
    uint64_t v8 = v26;
  }

  int64_t v24 = v22 + 2;
  if (v24 < v42)
  {
    unint64_t v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        int64_t v17 = v24 + 1;
        if (__OFADD__(v24, 1LL)) {
          goto LABEL_43;
        }
        if (v17 >= v42) {
          goto LABEL_36;
        }
        unint64_t v23 = v43[v17];
        ++v24;
        if (v23) {
          goto LABEL_23;
        }
      }
    }

    int64_t v17 = v24;
    goto LABEL_23;
  }

uint64_t sub_19330(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v75 = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_494C(&qword_3D4D8);
  __chkstk_darwin(v7);
  uint64_t v74 = (void *)((char *)v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t updated = type metadata accessor for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary(0LL);
  uint64_t v77 = *(void *)(updated - 8);
  uint64_t v9 = __chkstk_darwin(updated);
  uint64_t v69 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v66 = (char *)v60 - v11;
  uint64_t v71 = sub_494C(&qword_3D4E0);
  uint64_t v12 = __chkstk_darwin(v71);
  uint64_t v65 = (void *)((char *)v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = __chkstk_darwin(v12);
  size_t v16 = (char *)v60 - v15;
  __chkstk_darwin(v14);
  uint64_t v72 = (char *)v60 - v17;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v68 = a1 + 64;
  uint64_t v80 = &_swiftEmptyDictionarySingleton;
  uint64_t v19 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1LL << -(char)v19);
  }
  else {
    uint64_t v20 = -1LL;
  }
  unint64_t v21 = v20 & v18;
  v60[0] = -1LL << *(_BYTE *)(a1 + 32);
  int64_t v67 = (unint64_t)(63 - v19) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t i = 0LL;
  uint64_t v70 = a1;
  uint64_t v64 = a2;
  uint64_t v63 = v4;
  uint64_t v62 = v5;
  uint64_t v61 = v16;
  if (v21) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v24 = i + 1;
  if (!__OFADD__(i, 1LL))
  {
    if (v24 < v67)
    {
      unint64_t v25 = *(void *)(v68 + 8 * v24);
      int64_t v26 = i + 1;
      if (v25) {
        goto LABEL_23;
      }
      int64_t v26 = i + 2;
      if (i + 2 >= v67) {
        goto LABEL_39;
      }
      unint64_t v25 = *(void *)(v68 + 8 * v26);
      if (v25) {
        goto LABEL_23;
      }
      int64_t v26 = i + 3;
      if (i + 3 >= v67) {
        goto LABEL_39;
      }
      unint64_t v25 = *(void *)(v68 + 8 * v26);
      if (v25) {
        goto LABEL_23;
      }
      int64_t v26 = i + 4;
      if (i + 4 >= v67) {
        goto LABEL_39;
      }
      unint64_t v25 = *(void *)(v68 + 8 * v26);
      if (v25)
      {
LABEL_23:
        uint64_t v78 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
        for (i = v26; ; unint64_t v23 = __clz(__rbit64(v21)) | (i << 6))
        {
          uint64_t v28 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v23);
          uint64_t v29 = *v28;
          uint64_t v30 = v28[1];
          unint64_t v31 = *(void *)(a1 + 56) + *(void *)(v5 + 72) * v23;
          uint64_t v32 = v71;
          unint64_t v33 = v72;
          unint64_t v34 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
          v34(&v72[*(int *)(v71 + 48)], v31, v4);
          *unint64_t v33 = v29;
          v33[1] = v30;
          sub_19934((uint64_t)v33, (uint64_t)v16);
          char v35 = &v16[*(int *)(v32 + 48)];
          unint64_t v36 = v16;
          uint64_t v37 = (uint64_t)v75;
          v34(v75, (unint64_t)v35, v4);
          swift_bridgeObjectRetain(v30);
          id v38 = a2;
          uint64_t v39 = v74;
          sub_17740(v37, v38, v74);
          uint64_t v40 = v77;
          uint64_t v41 = updated;
          if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v77 + 48))(v39, 1LL, updated) == 1)
          {
            sub_8DCC((uint64_t)v36, &qword_3D4E0);
            uint64_t result = sub_8DCC((uint64_t)v39, &qword_3D4D8);
            size_t v16 = v36;
            a1 = v70;
            unint64_t v21 = v78;
            if (!v78) {
              goto LABEL_8;
            }
          }

          else
          {
            int64_t v42 = *(void (**)(char *, uint64_t *, uint64_t))(v40 + 32);
            uint64_t v43 = v66;
            v42(v66, v39, v41);
            int v44 = v65;
            id v45 = (char *)v65 + *(int *)(v32 + 48);
            uint64_t v46 = *(void *)v36;
            uint64_t v47 = *((void *)v36 + 1);
            *uint64_t v65 = v46;
            v44[1] = v47;
            (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v45, v35, v4);
            v42(v69, (uint64_t *)v43, v41);
            uint64_t v48 = v80;
            unint64_t v49 = v80[2];
            if (v80[3] <= v49)
            {
              sub_18FC8(v49 + 1, 1LL);
              uint64_t v48 = v80;
            }

            Hasher.init(_seed:)(v79, v48[5]);
            String.hash(into:)(v79, v46, v47);
            uint64_t result = Hasher._finalize()();
            uint64_t v50 = v48 + 8;
            uint64_t v51 = -1LL << *((_BYTE *)v48 + 32);
            unint64_t v52 = result & ~v51;
            unint64_t v53 = v52 >> 6;
            if (((-1LL << v52) & ~v48[(v52 >> 6) + 8]) != 0)
            {
              unint64_t v54 = __clz(__rbit64((-1LL << v52) & ~v48[(v52 >> 6) + 8])) | v52 & 0x7FFFFFFFFFFFFFC0LL;
            }

            else
            {
              char v55 = 0;
              unint64_t v56 = (unint64_t)(63 - v51) >> 6;
              do
              {
                if (++v53 == v56 && (v55 & 1) != 0)
                {
                  __break(1u);
                  goto LABEL_40;
                }

                BOOL v57 = v53 == v56;
                if (v53 == v56) {
                  unint64_t v53 = 0LL;
                }
                v55 |= v57;
                uint64_t v58 = v50[v53];
              }

              while (v58 == -1);
              unint64_t v54 = __clz(__rbit64(~v58)) + (v53 << 6);
            }

            *(void *)((char *)v50 + ((v54 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v54;
            uint64_t v59 = (void *)(v48[6] + 16 * v54);
            void *v59 = v46;
            v59[1] = v47;
            v42((char *)(v48[7] + *(void *)(v77 + 72) * v54), (uint64_t *)v69, v41);
            ++v48[2];
            uint64_t v5 = v62;
            uint64_t v4 = v63;
            uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v45, v63);
            a1 = v70;
            a2 = v64;
            size_t v16 = v61;
            unint64_t v21 = v78;
            if (!v78) {
              goto LABEL_8;
            }
          }

LABEL_7:
          uint64_t v78 = (v21 - 1) & v21;
        }
      }

      int64_t v27 = i + 5;
      if (i + 5 < v67)
      {
        unint64_t v25 = *(void *)(v68 + 8 * v27);
        if (v25)
        {
          int64_t v26 = i + 5;
          goto LABEL_23;
        }

        while (1)
        {
          int64_t v26 = v27 + 1;
          if (__OFADD__(v27, 1LL)) {
            goto LABEL_41;
          }
          if (v26 >= v67) {
            break;
          }
          unint64_t v25 = *(void *)(v68 + 8 * v26);
          ++v27;
          if (v25) {
            goto LABEL_23;
          }
        }
      }
    }

LABEL_39:
    sub_1673C(a1);
    return (uint64_t)v80;
  }

LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1992C(uint64_t a1)
{
  return sub_17FEC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_19934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_3D4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1997C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1998C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Parse(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v8);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    uint64_t v11 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
    uint64_t v13 = Parse.DirectInvocation.identifier.getter(v11);
    uint64_t v14 = v12;
    if (v13 == 0xD00000000000001FLL && v12 == 0x8000000000033A10LL)
    {
      uint64_t v15 = swift_bridgeObjectRelease(0x8000000000033A10LL);
      goto LABEL_7;
    }

    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001FLL, 0x8000000000033A10LL, v13, v12, 0LL);
    uint64_t v15 = swift_bridgeObjectRelease(v14);
    if ((v16 & 1) != 0)
    {
LABEL_7:
      uint64_t v17 = Parse.DirectInvocation.userData.getter(v15);
      if (v17)
      {
        uint64_t v18 = v17;
        if (*(void *)(v17 + 16) && (unint64_t v19 = sub_1307C(0x636E617265747475LL, 0xE900000000000065LL), (v20 & 1) != 0))
        {
          sub_130E0(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v27);
        }

        else
        {
          __int128 v27 = 0u;
          __int128 v28 = 0u;
        }

        swift_bridgeObjectRelease(v18);
        if (*((void *)&v28 + 1))
        {
          if (swift_dynamicCast( v26,  &v27,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL))
          {
            uint64_t v21 = v26[0];
            uint64_t v22 = v26[1];
LABEL_18:
            sub_45FC(v21, v22, 1u, a1);
            swift_bridgeObjectRelease(v22);
            (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
            uint64_t v23 = type metadata accessor for MessagePayload.Request(0LL);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))( a1,  0LL,  1LL,  v23);
          }

LABEL_17:
          uint64_t v21 = 0LL;
          uint64_t v22 = 0xE000000000000000LL;
          goto LABEL_18;
        }
      }

      else
      {
        __int128 v27 = 0u;
        __int128 v28 = 0u;
      }

      sub_19C38((uint64_t)&v27);
      goto LABEL_17;
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  uint64_t v25 = type metadata accessor for MessagePayload.Request(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56LL))( a1,  1LL,  1LL,  v25);
}

  uint64_t v6 = *a1;
  uint64_t v7 = v6 >= 2;
  uint64_t v8 = v6 - 2;
  if (!v7) {
    uint64_t v8 = -1;
  }
  return (v8 + 1);
}

uint64_t sub_19C38(uint64_t a1)
{
  uint64_t v2 = sub_494C(&qword_3D370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_19C7C(uint64_t a1)
{
  v16[0] = (char *)&value witness table for () + 64;
  v16[1] = "(";
  v16[2] = "(";
  v16[3] = "(";
  v16[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v16[5] = (char *)&value witness table for Builtin.NativeObject + 64;
  v16[6] = "(";
  v16[7] = &unk_31648;
  v16[8] = &unk_31660;
  v16[9] = (char *)&value witness table for Builtin.NativeObject + 64;
  v16[10] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t v2 = swift_checkMetadataState(319LL, *(void *)(a1 + 80));
  uint64_t v3 = v2;
  if (v4 <= 0x3F)
  {
    v16[11] = *(void *)(v2 - 8) + 64LL;
    uint64_t v5 = *(void *)(a1 + 88);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v5,  v2,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated type descriptor for IFSessionServiceClientProtocol.MessagesStream);
    uint64_t v7 = type metadata accessor for Optional(319LL, AssociatedTypeWitness);
    if (v8 > 0x3F) {
      return v7;
    }
    v16[12] = *(void *)(v7 - 8) + 64LL;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v5,  v3,  AssociatedTypeWitness,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated conformance descriptor for IFSessionServiceClientProtocol.IFSessionServiceClientProtocol.MessagesStream: AsyncSequence);
    uint64_t v10 = swift_getAssociatedTypeWitness( 255LL,  AssociatedConformanceWitness,  AssociatedTypeWitness,  &protocol requirements base descriptor for AsyncSequence,  &associated type descriptor for AsyncSequence.AsyncIterator);
    uint64_t v7 = type metadata accessor for Optional(319LL, v10);
    if (v12 > 0x3F)
    {
      return v7;
    }

    else
    {
      v16[13] = *(void *)(v7 - 8) + 64LL;
      uint64_t v13 = type metadata accessor for IFFlow.State(319LL, v3, v5, v11);
      uint64_t v3 = v13;
      if (v14 <= 0x3F)
      {
        v16[14] = *(void *)(v13 - 8) + 64LL;
        return swift_initClassMetadata2(a1, 0LL, 15LL, v16, a1 + 96);
      }
    }
  }

  return v3;
}

uint64_t sub_19E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessagePayload(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  uint64_t v12 = sub_1A070();
  uint64_t v13 = CurrentRequest.rootRequestId.getter();
  uint64_t v15 = v14;
  swift_release(v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  return SessionClientMessage.init(sessionId:clientRequestId:payload:)(v10, v13, v15, v7);
}

unint64_t sub_19F3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_494C(&qword_3D700);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_F848(v7, (uint64_t)&v16, &qword_3D708);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_1307C(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_1997C(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1A070()
{
  return sub_1A0A8(&qword_3D718, (uint64_t)&unk_31898, (uint64_t)&unk_318C8);
}

uint64_t sub_1A08C()
{
  return sub_1A0A8(&qword_3D728, (uint64_t)&unk_318E8, (uint64_t)&unk_31918);
}

uint64_t sub_1A0A8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(a2);
  uint64_t v7 = swift_getKeyPath(a3);
  uint64_t v9 = v3;
  swift_retain(v3);
  static SiriEnvironmentValue.subscript.getter(&v10, &v9, KeyPath, v7);
  swift_release(v3);
  swift_release(KeyPath);
  swift_release(v7);
  return v10;
}

uint64_t sub_1A158()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for IFFlowError(0LL);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (uint64_t *)((char *)&v41 - v6);
  uint64_t v9 = type metadata accessor for IFFlow.State(0LL, v1[10], v1[11], v8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v41 - v14;
  uint64_t v16 = (char *)v0 + v1[26];
  swift_beginAccess(v16, v44, 0LL, 0LL);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v17(v15, v16, v9);
  unint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v15, v9);
  uint64_t v42 = 0LL;
  unint64_t v43 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(57LL);
  v20._object = (void *)0x8000000000033B50LL;
  v20._countAndFlagsBits = 0xD000000000000037LL;
  String.append(_:)(v20);
  v17(v13, v16, v9);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_31700, v9);
  uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter(v9, WitnessTable);
  int64_t v24 = v23;
  v19(v13, v9);
  v25._countAndFlagsBits = v22;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease(v24);
  unint64_t v26 = v43;
  *uint64_t v7 = v42;
  v7[1] = v26;
  swift_storeEnumTagMultiPayload(v7, v2, 4LL);
  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v27 = type metadata accessor for Logger(0LL);
  sub_458C(v27, (uint64_t)qword_3E310);
  uint64_t v28 = sub_3400((uint64_t)v7, (uint64_t)v5);
  uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    unint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)unint64_t v31 = 138412290;
    uint64_t v33 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    uint64_t v34 = swift_allocError(v2, v33, 0LL, 0LL);
    sub_3400((uint64_t)v5, v35);
    uint64_t v36 = _swift_stdlib_bridgeErrorToNSError(v34);
    uint64_t v42 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43);
    *uint64_t v32 = v36;
    sub_3444((uint64_t)v5);
    _os_log_impl(&dword_0, v29, v30, "%@", v31, 0xCu);
    uint64_t v37 = sub_494C(&qword_3D358);
    swift_arrayDestroy(v32, 1LL, v37);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {
    sub_3444((uint64_t)v5);
  }

  uint64_t v38 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
  uint64_t v18 = swift_allocError(v2, v38, 0LL, 0LL);
  sub_253A8((uint64_t)v7, v39);
  return v18;
}

uint64_t sub_1A51C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v2 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v3,  v4,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated type descriptor for IFSessionServiceClientProtocol.MessagesStream);
  uint64_t v6 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&AssociatedConformanceWitness - v7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v3,  v4,  AssociatedTypeWitness,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated conformance descriptor for IFSessionServiceClientProtocol.IFSessionServiceClientProtocol.MessagesStream: AsyncSequence);
  uint64_t v9 = swift_getAssociatedTypeWitness( 255LL,  AssociatedConformanceWitness,  AssociatedTypeWitness,  &protocol requirements base descriptor for AsyncSequence,  &associated type descriptor for AsyncSequence.AsyncIterator);
  uint64_t v10 = type metadata accessor for Optional(0LL, v9);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&AssociatedConformanceWitness - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&AssociatedConformanceWitness - v15;
  uint64_t v17 = (uint64_t)v1 + *(void *)(v2 + 200);
  swift_beginAccess(v17, v26, 0LL, 0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v17, v10);
  uint64_t v18 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v8, (uint64_t)v1 + *(void *)(*v1 + 192), v23);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48LL))( v8,  1LL,  AssociatedTypeWitness);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v20 = v24;
    dispatch thunk of AsyncSequence.makeAsyncIterator()(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v14, v20, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0LL, 1LL, v9);
    swift_beginAccess(v17, v25, 33LL, 0LL);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v17, v14, v10);
    return swift_endAccess(v25);
  }

  return result;
}

uint64_t sub_1A790(uint64_t a1)
{
  uint64_t v4 = *(void *)(*(void *)v1 + 80LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 88LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v3,  v4,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated type descriptor for IFSessionServiceClientProtocol.MessagesStream);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v3,  v4,  AssociatedTypeWitness,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated conformance descriptor for IFSessionServiceClientProtocol.IFSessionServiceClientProtocol.MessagesStream: AsyncSequence);
  uint64_t v7 = swift_getAssociatedTypeWitness( 255LL,  AssociatedConformanceWitness,  AssociatedTypeWitness,  &protocol requirements base descriptor for AsyncSequence,  &associated type descriptor for AsyncSequence.AsyncIterator);
  uint64_t v8 = type metadata accessor for Optional(0LL, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v16[-v10 - 8];
  uint64_t v12 = *(void *)(v7 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 32))(&v16[-v10 - 8], a1, v7);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v12 + 56))(v11, 0LL, 1LL, v7);
  uint64_t v13 = v1 + *(void *)(*(void *)v1 + 200LL);
  swift_beginAccess(v13, v16, 33LL, 0LL);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 40))(v13, v11, v8);
  return swift_endAccess(v16);
}

void sub_1A8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for IFFlow.State( 0LL,  *(void *)(*(void *)v4 + 80LL),  *(void *)(*(void *)v4 + 88LL),  a4);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v44 - v8;
  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = sub_458C(v10, (uint64_t)qword_3E310);
  uint64_t v12 = swift_retain_n(v4, 2LL);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc(12LL, -1LL);
    uint64_t v46 = v11;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    uint64_t v45 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    v51[0] = v17;
    int v44 = v16 + 4;
    uint64_t v18 = v4 + *(void *)(*(void *)v4 + 208LL);
    swift_beginAccess(v5 + *(void *)(*(void *)v5 + 208LL), v47, 0LL, 0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v18, v6);
    uint64_t WitnessTable = swift_getWitnessTable(&unk_31700, v6);
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter(v6, WitnessTable);
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v49 = sub_12A3C(v20, v22, v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
    swift_release_n(v5, 2LL);
    swift_bridgeObjectRelease(v22);
    _os_log_impl(&dword_0, v13, v14, "IFFlow state transitioned to %s", v16, 0xCu);
    uint64_t v23 = v45;
    swift_arrayDestroy(v45, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v4, 2LL);
  }

  uint64_t v24 = v5 + *(void *)(*(void *)v5 + 208LL);
  swift_beginAccess(v24, v51, 0LL, 0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v24, v6);
  uint64_t v25 = swift_getWitnessTable(&unk_31700, v6);
  uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter(v6, v25);
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v49 = v26;
  uint64_t v50 = v28;
  unint64_t v29 = sub_F72C();
  os_log_type_t v30 = (void *)StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)( 40LL,  0xE100000000000000LL,  1LL,  0LL,  &type metadata for String,  v29);
  swift_bridgeObjectRelease(v28);
  if (v30[2])
  {
    uint64_t v31 = swift_bridgeObjectRetain(v30);
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v35 = swift_slowAlloc(32LL, -1LL);
      uint64_t v49 = v35;
      *(_DWORD *)uint64_t v34 = 136446210;
      if (v30[2])
      {
        uint64_t v36 = v35;
        uint64_t v37 = v30[4];
        uint64_t v38 = v30[5];
        uint64_t v39 = v30[6];
        uint64_t v40 = v30[7];
        swift_bridgeObjectRetain(v40);
        uint64_t v41 = static String._fromSubstring(_:)(v37, v38, v39, v40);
        unint64_t v43 = v42;
        swift_bridgeObjectRelease(v40);
        uint64_t v48 = sub_12A3C(v41, v43, &v49);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49);
        swift_bridgeObjectRelease_n(v30, 2LL);
        swift_bridgeObjectRelease(v43);
        _os_log_impl(&dword_0, v32, v33, "IFFlow state transitioned to %{public}s", v34, 0xCu);
        swift_arrayDestroy(v36, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v36, -1LL, -1LL);
        swift_slowDealloc(v34, -1LL, -1LL);
      }

      else
      {
        __break(1u);
      }
    }

    else
    {

      swift_bridgeObjectRelease_n(v30, 2LL);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v30);
  }

uint64_t sub_1AD48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_498C(a1, a2);
}

uint64_t sub_1AD5C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v4);
  uint64_t v130 = (char *)&v125 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
  uint64_t v129 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v125 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_494C(&qword_3D4B0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v128 = type metadata accessor for MessagePayload(0LL);
  uint64_t v127 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v126 = (char *)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v141 = type metadata accessor for SessionClientMessage(0LL);
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v12 = (char *)&v125 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v139 = type metadata accessor for MessagePayload.Request(0LL);
  uint64_t v138 = *(void *)(v139 - 8);
  uint64_t v13 = __chkstk_darwin(v139);
  uint64_t v142 = (char *)&v125 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v137 = (char *)&v125 - v15;
  uint64_t v16 = *(void *)(v3 + 80);
  uint64_t v158 = *(void *)(v3 + 88);
  uint64_t v159 = v16;
  uint64_t v18 = type metadata accessor for IFFlow.State(0LL, v16, v158, v17);
  v161 = *(void **)(v18 - 8);
  uint64_t v162 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v145 = (char *)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v156 = (uint64_t *)((char *)&v125 - v22);
  __chkstk_darwin(v21);
  unint64_t v160 = (char *)&v125 - v23;
  uint64_t v24 = type metadata accessor for StatementID(0LL);
  uint64_t v152 = *(void *)(v24 - 8);
  uint64_t v153 = v24;
  __chkstk_darwin(v24);
  uint64_t v147 = (char *)&v125 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for SessionServerMessage(0LL);
  uint64_t v150 = *(void *)(v26 - 8);
  uint64_t v151 = v26;
  __chkstk_darwin(v26);
  uint64_t v146 = (char *)&v125 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v154 = type metadata accessor for UUID(0LL);
  uint64_t v28 = *(void *)(v154 - 8);
  uint64_t v29 = __chkstk_darwin(v154);
  uint64_t v144 = (char *)&v125 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = __chkstk_darwin(v29);
  Swift::String v157 = (char *)&v125 - v32;
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v125 - v33;
  uint64_t v35 = type metadata accessor for Input(0LL);
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v135 = (char *)&v125 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v37);
  uint64_t v40 = (char *)&v125 - v39;
  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v133 = v12;
  uint64_t v132 = v9;
  uint64_t v41 = type metadata accessor for Logger(0LL);
  uint64_t v42 = sub_458C(v41, (uint64_t)qword_3E310);
  unint64_t v43 = *(uint64_t (**)(void, void, void))(v36 + 16);
  uint64_t v148 = a1;
  int v134 = v43;
  uint64_t v44 = v43(v40, a1, v35);
  uint64_t v155 = v42;
  uint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
  os_log_type_t v46 = static os_log_type_t.debug.getter();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v136 = v35;
  if (v47)
  {
    uint64_t v48 = swift_slowAlloc(12LL, -1LL);
    uint64_t v149 = v28;
    uint64_t v49 = (uint8_t *)v48;
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    uint64_t v143 = v34;
    uint64_t v51 = v50;
    uint64_t v165 = v50;
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v52 = sub_5E50( &qword_3D0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    uint64_t v53 = dispatch thunk of CustomStringConvertible.description.getter(v35, v52);
    unint64_t v55 = v54;
    uint64_t v164 = sub_12A3C(v53, v54, &v165);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v164, &v165);
    swift_bridgeObjectRelease(v55);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v40, v35);
    _os_log_impl(&dword_0, v45, v46, "IFFlow received input with %s", v49, 0xCu);
    swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v56 = v51;
    uint64_t v34 = v143;
    swift_slowDealloc(v56, -1LL, -1LL);
    BOOL v57 = v49;
    uint64_t v28 = v149;
    swift_slowDealloc(v57, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v40, v35);
  }

  uint64_t v58 = v161;
  uint64_t v59 = v157;
  dispatch thunk of IFSessionServiceClientProtocol.currentSessionIdentifier.getter(v159, v158);
  uint64_t v60 = v162;
  uint64_t v61 = v160;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v34, v59, v154);
  uint64_t v62 = v163 + *(void *)(*(void *)v163 + 208LL);
  swift_beginAccess(v62, &v165, 0LL, 0LL);
  uint64_t v63 = (void (*)(char *, uint64_t, uint64_t))v58[2];
  v63(v61, v62, v60);
  if (swift_getEnumCaseMultiPayload(v61, v60) == 1)
  {
    uint64_t v64 = &v61[*(int *)(sub_494C(qword_3D580) + 48)];
    uint64_t v65 = v146;
    (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v146, v61, v151);
    uint64_t v66 = (uint64_t)v147;
    uint64_t v67 = (*(uint64_t (**)(char *, char *, uint64_t))(v152 + 32))(v147, v64, v153);
    uint64_t v68 = (uint64_t)v144;
    SessionServerMessage.eventId.getter(v67);
    uint64_t v69 = sub_1BDA8();
    unint64_t v71 = v70;
    sub_1BF5C((uint64_t)v34, v68, v66, v69, v70);
    swift_bridgeObjectRelease(v71);
    v161 = *(void **)(v28 + 8);
    uint64_t v72 = v68;
    uint64_t v73 = v154;
    ((void (*)(uint64_t, uint64_t))v161)(v72, v154);
    uint64_t v74 = type metadata accessor for IFFlowError(0LL);
    uint64_t v75 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    unint64_t v76 = v34;
    uint64_t v77 = swift_allocError(v74, v75, 0LL, 0LL);
    *uint64_t v78 = 1;
    swift_storeEnumTagMultiPayload(v78, v74, 6LL);
    uint64_t v79 = (uint64_t)v156;
    *uint64_t v156 = v77;
    *(_BYTE *)(v79 + 8) = 1;
    swift_storeEnumTagMultiPayload(v79, v60, 3LL);
    sub_253EC(v79);
    ((void (*)(uint64_t, uint64_t))v58[1])(v79, v60);
    (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v66, v153);
    (*(void (**)(char *, uint64_t))(v150 + 8))(v65, v151);
    ((void (*)(char *, uint64_t))v161)(v76, v73);
    return 0LL;
  }

  uint64_t v149 = v28;
  uint64_t v80 = (void (*)(char *, uint64_t))v58[1];
  v80(v61, v60);
  uint64_t v81 = v145;
  v63(v145, v62, v60);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v81, v60);
  uint64_t v83 = ((uint64_t (*)(char *, uint64_t))v80)(v81, v60);
  if (EnumCaseMultiPayload != 4)
  {
    uint64_t v84 = (os_log_s *)Logger.logObject.getter(v83);
    os_log_type_t v85 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v86 = 0;
      _os_log_impl(&dword_0, v84, v85, "IFFlow can only accept input after it is first initialized. Ignoring.", v86, 2u);
      swift_slowDealloc(v86, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v149 + 8))(v34, v154);
    return 0LL;
  }

  (*(void (**)(uint64_t))(v163 + 16))(v148);
  uint64_t v143 = v34;
  uint64_t v87 = v138;
  os_log_type_t v88 = v137;
  uint64_t v89 = v139;
  (*(void (**)(char *, char *, uint64_t))(v138 + 32))(v137, v142, v139);
  uint64_t v90 = (uint64_t)v126;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v126, v88, v89);
  uint64_t v91 = v127;
  uint64_t v92 = v128;
  (*(void (**)(uint64_t, void, uint64_t))(v127 + 104))(v90, enum case for MessagePayload.request(_:), v128);
  unint64_t v93 = v133;
  sub_19E2C((uint64_t)v34, v90);
  uint64_t v94 = (*(uint64_t (**)(uint64_t, uint64_t))(v91 + 8))(v90, v92);
  uint64_t v95 = (uint64_t)v130;
  MessagePayload.Request.prescribedPlan.getter(v94);
  uint64_t v96 = v129;
  uint64_t v97 = v131;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v129 + 48))(v95, 1LL, v131) == 1)
  {
    sub_8DCC(v95, &qword_3D0D0);
    uint64_t v98 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
    uint64_t v99 = (uint64_t)v132;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 56LL))(v132, 1LL, 1LL, v98);
  }

  else
  {
    uint64_t v102 = (uint64_t)v125;
    (*(void (**)(char *, uint64_t, uint64_t))(v96 + 32))(v125, v95, v97);
    uint64_t v99 = (uint64_t)v132;
    sub_4284(v102, (uint64_t)v132);
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v102, v97);
    uint64_t v103 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56LL))(v99, 0LL, 1LL, v103);
  }

  uint64_t v104 = sub_494C(&qword_3D1E8);
  uint64_t v105 = (uint64_t)v156;
  uint64_t v106 = (uint64_t)v156 + *(int *)(v104 + 48);
  (*(void (**)(uint64_t *, char *, uint64_t))(v140 + 16))(v156, v93, v141);
  sub_F848(v99, v106, &qword_3D4B0);
  swift_storeEnumTagMultiPayload(v105, v60, 0LL);
  sub_253EC(v105);
  v80((char *)v105, v60);
  unint64_t v107 = sub_25738();
  uint64_t v108 = UUID.uuidString.getter(v107);
  uint64_t v110 = v109;
  uint64_t v111 = sub_1A070();
  uint64_t v112 = sub_1A08C();
  id v113 = sub_14EEC(v108, v110, v111, v112);
  id v114 = (os_log_s *)Logger.logObject.getter(v113);
  os_log_type_t v115 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v114, v115))
  {
    uint64_t v116 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v117 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v116 = 138412290;
    uint64_t v164 = (uint64_t)v113;
    id v118 = v113;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v164, &v165);
    *uint64_t v117 = v113;

    unint64_t v93 = v133;
    uint64_t v99 = (uint64_t)v132;
    _os_log_impl( &dword_0,  v114,  v115,  "BMSiriRequestContext event = %@. Going to send this to the Biome Siri Orchestration stream.",  v116,  0xCu);
    uint64_t v119 = sub_494C(&qword_3D358);
    swift_arrayDestroy(v117, 1LL, v119);
    swift_slowDealloc(v117, -1LL, -1LL);
    swift_slowDealloc(v116, -1LL, -1LL);
  }

  else
  {

    id v114 = (os_log_s *)v113;
  }

  uint64_t v120 = v163;
  [*(id *)(v163 + 152) sendEvent:v113];
  uint64_t v121 = sub_1BDA8();
  uint64_t v123 = v122;

  sub_8DCC(v99, &qword_3D4B0);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v93, v141);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v137, v139);
  (*(void (**)(char *, uint64_t))(v149 + 8))(v143, v154);
  uint64_t v124 = *(void *)(v120 + 224);
  *(void *)(v120 + 216) = v121;
  *(void *)(v120 + 224) = v123;
  swift_bridgeObjectRelease(v124);
  return 1LL;
}

uint64_t sub_1BDA8()
{
  uint64_t v0 = type metadata accessor for NLRouterParse.InputCandidate(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Parse(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v10);
  if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v7, v4) == enum case for Parse.nlRouter(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v4);
    uint64_t v13 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    NLRouterParse.input.getter(v13);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) == enum case for NLRouterParse.InputCandidate.text(_:))
    {
      (*(void (**)(char *, uint64_t))(v1 + 96))(v3, v0);
      return *(void *)v3;
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  return 0LL;
}

uint64_t sub_1BF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v77 = a5;
  uint64_t v78 = a4;
  uint64_t v75 = a3;
  uint64_t v73 = a2;
  uint64_t v6 = *v5;
  uint64_t v84 = a1;
  uint64_t v85 = v6;
  uint64_t v7 = type metadata accessor for MessagePayload(0LL);
  uint64_t v82 = *(void *)(v7 - 8);
  uint64_t v83 = v7;
  __chkstk_darwin(v7);
  uint64_t v81 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for SessionClientMessage(0LL);
  uint64_t v86 = *(void *)(v9 - 8);
  uint64_t v87 = v9;
  __chkstk_darwin(v9);
  uint64_t v79 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v11);
  uint64_t v80 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v13);
  unint64_t v76 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v74 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v72 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  unint64_t v71 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_494C(&qword_3D1D0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = type metadata accessor for StatementID(0LL);
  uint64_t v67 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v89 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v65 = type metadata accessor for SystemPromptResolution.UserAction(0LL);
  uint64_t v20 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for UUID(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = sub_494C(&qword_3D0C8);
  uint64_t v28 = __chkstk_darwin(v27);
  unint64_t v70 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v62 - v30;
  uint64_t v66 = type metadata accessor for SystemPromptResolution(0LL);
  uint64_t v64 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  os_log_type_t v88 = (char *)&v62 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v68 = type metadata accessor for MessagePayload.Request(0LL);
  uint64_t v33 = *(char **)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v35 = (char *)&v62 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
  uint64_t v63 = v23;
  v36(v31, 1LL, 1LL, v23);
  uint64_t v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v73, v23);
  SystemPromptResolution.ActionCancellation.init()(v37);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))( v22,  enum case for SystemPromptResolution.UserAction.actionCanceled(_:),  v65);
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v89, v75, v69);
  if (v77) {
    uint64_t v38 = v78;
  }
  else {
    uint64_t v38 = 0LL;
  }
  if (v77) {
    unint64_t v39 = v77;
  }
  else {
    unint64_t v39 = 0xE000000000000000LL;
  }
  swift_bridgeObjectRetain(v77);
  MessagePayload.RequestContent.TextContent.init(text:)(v38, v39);
  uint64_t v40 = enum case for SystemPromptResolution.ResolutionInput.text(_:);
  uint64_t v41 = type metadata accessor for SystemPromptResolution.ResolutionInput(0LL);
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = v40;
  uint64_t v44 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 104))(v18, v43, v41);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v18, 0LL, 1LL, v41);
  uint64_t v45 = v88;
  os_log_type_t v46 = v26;
  BOOL v47 = v79;
  SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)( v31,  v46,  v22,  v89,  v18);
  uint64_t v48 = v64;
  uint64_t v49 = v71;
  uint64_t v50 = v66;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v71, v45, v66);
  (*(void (**)(char *, void, uint64_t))(v72 + 104))( v49,  enum case for MessagePayload.RequestContent.promptResolution(_:),  v74);
  uint64_t v51 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
  uint64_t v52 = v76;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56LL))(v76, 1LL, 1LL, v51);
  uint64_t v53 = v70;
  v36(v70, 1LL, 1LL, v63);
  uint64_t v54 = v68;
  uint64_t v55 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
  uint64_t v56 = v80;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56LL))(v80, 1LL, 1LL, v55);
  MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v49,  0LL,  0LL,  v52,  v53,  v56);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v88, v50);
  uint64_t v89 = v33;
  BOOL v57 = (void (*)(char *, char *, uint64_t))*((void *)v33 + 2);
  uint64_t v58 = (uint64_t)v81;
  v57(v81, v44, v54);
  uint64_t v60 = v82;
  uint64_t v59 = v83;
  (*(void (**)(uint64_t, void, uint64_t))(v82 + 104))(v58, enum case for MessagePayload.request(_:), v83);
  sub_19E2C(v84, v58);
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v59);
  dispatch thunk of IFSessionServiceClientProtocol.send(message:)(v47, *(void *)(v85 + 80), *(void *)(v85 + 88));
  (*(void (**)(char *, uint64_t))(v86 + 8))(v47, v87);
  return (*((uint64_t (**)(char *, uint64_t))v89 + 1))(v44, v54);
}

uint64_t sub_1C700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5[2] = a1;
  v5[3] = v4;
  uint64_t v7 = type metadata accessor for IFFlow.State( 0LL,  *(void *)(*(void *)v4 + 80LL),  *(void *)(*(void *)v4 + 88LL),  a4);
  v5[4] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[5] = v8;
  v5[6] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = (void *)swift_task_alloc(dword_3D634);
  v5[7] = v9;
  *uint64_t v9 = v5;
  v9[1] = sub_1C784;
  return sub_1C898(a1);
}

uint64_t sub_1C784()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *v1;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    return swift_task_switch(sub_1C7F8, 0LL, 0LL);
  }
  swift_task_dealloc(*(void *)(v3 + 48));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1C7F8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  *(void *)uint64_t v2 = v1;
  *(_BYTE *)(v2 + 8) = 1;
  swift_storeEnumTagMultiPayload(v2, v4, 2LL);
  swift_errorRetain(v1);
  sub_253EC(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  static ExecuteResponse.ongoing(requireInput:)(0LL);
  swift_errorRelease(v1);
  swift_task_dealloc(*(void *)(v0 + 48));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C898(uint64_t a1)
{
  v2[49] = a1;
  v2[50] = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = type metadata accessor for FlowUnhandledReason(0LL);
  v2[51] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[52] = v5;
  v2[53] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_3D248);
  v2[54] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TemplatingResult(0LL);
  v2[55] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[56] = v8;
  v2[57] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for AceOutput(0LL);
  v2[58] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[59] = v10;
  v2[60] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_494C(&qword_3D638);
  v2[61] = swift_task_alloc((*(void *)(*(void *)(v11 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for IFFlowError(0LL);
  v2[62] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[63] = v13;
  v2[64] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for MessagePayload(0LL);
  v2[65] = v14;
  v2[66] = swift_task_alloc((*(void *)(*(void *)(v14 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for SessionServerMessage(0LL);
  v2[67] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[68] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[69] = swift_task_alloc(v17);
  v2[70] = swift_task_alloc(v17);
  v2[71] = swift_task_alloc(v17);
  uint64_t v18 = type metadata accessor for MessageXPCTransporter(0LL);
  v2[72] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[73] = v19;
  v2[74] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_494C(&qword_3D640);
  v2[75] = swift_task_alloc((*(void *)(*(void *)(v20 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for FlowMessageTransportableOutput(0LL);
  v2[76] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v2[77] = v22;
  unint64_t v23 = (*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[78] = swift_task_alloc(v23);
  v2[79] = swift_task_alloc(v23);
  uint64_t v24 = sub_494C(&qword_3D4B0);
  v2[80] = swift_task_alloc((*(void *)(*(void *)(v24 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = type metadata accessor for SessionClientMessage(0LL);
  v2[81] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v2[82] = v26;
  v2[83] = swift_task_alloc((*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = *(void *)(v3 + 80);
  v2[84] = v27;
  uint64_t v28 = *(void *)(v3 + 88);
  v2[85] = v28;
  uint64_t v30 = type metadata accessor for IFFlow.State(0LL, v27, v28, v29);
  v2[86] = v30;
  uint64_t v31 = *(void *)(v30 - 8);
  v2[87] = v31;
  unint64_t v32 = (*(void *)(v31 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[88] = swift_task_alloc(v32);
  v2[89] = swift_task_alloc(v32);
  uint64_t v33 = type metadata accessor for Logger(0LL);
  v2[90] = v33;
  uint64_t v34 = *(void *)(v33 - 8);
  v2[91] = v34;
  v2[92] = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1CB64, 0LL, 0LL);
}

void sub_1CB64()
{
  uint64_t v1 = v0 + 22;
  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v2 = v0[92];
  uint64_t v3 = v0[91];
  uint64_t v4 = v0[50];
  v0[93] = sub_458C(v0[90], (uint64_t)qword_3E310);
  (*(void (**)(uint64_t))(v3 + 16))(v2);
  uint64_t v5 = swift_retain(v4);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[92];
  uint64_t v10 = v0[91];
  uint64_t v11 = v0[90];
  if (v8)
  {
    uint64_t v30 = v0[90];
    uint64_t v31 = v0[92];
    uint64_t v12 = v0[89];
    uint64_t v27 = v0[87];
    uint64_t v13 = v0[86];
    uint64_t v14 = v0[50];
    uint64_t v29 = v0[91];
    uint64_t v15 = swift_slowAlloc(22LL, -1LL);
    uint64_t v28 = swift_slowAlloc(64LL, -1LL);
    v32[0] = v28;
    *(_DWORD *)uint64_t v15 = 136315394;
    v0[46] = sub_12A3C(0x657475636578655FLL, 0xEA00000000002928LL, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 46, v0 + 47);
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v16 = v14 + *(void *)(*(void *)v14 + 208LL);
    swift_beginAccess(v16, v0 + 25, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v12, v16, v13);
    sub_23B58(v13);
    uint64_t v18 = v17;
    unint64_t v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v12, v13);
    v0[48] = sub_12A3C(v18, v20, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 49);
    unint64_t v21 = v20;
    uint64_t v1 = v0 + 22;
    swift_bridgeObjectRelease(v21);
    swift_release(v14);
    _os_log_impl(&dword_0, v6, v7, "%s called for IFFlowPlugin with state - %s ", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v28, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v30);
  }

  else
  {
    swift_release(v0[50]);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }

  uint64_t v22 = v0[88];
  uint64_t v23 = v0[87];
  uint64_t v24 = v0[86];
  uint64_t v25 = v0[50] + *(void *)(*(void *)v0[50] + 208LL);
  swift_beginAccess(v25, v1, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v25, v24);
  uint64_t v26 = (char *)&loc_1CE80 + 4 * word_31580[swift_getEnumCaseMultiPayload(v22, v24)];
  __asm { BR              X10 }

uint64_t sub_1DCD4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 760);
  *(void *)(*v1 + 768) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1E898;
  }

  else
  {
    sub_76EC((void *)(v2 + 136));
    uint64_t v4 = sub_1DD40;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1DD40()
{
  uint64_t v1 = *(void *)(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 656);
  uint64_t v3 = *(void *)(v0 + 648);
  uint64_t v4 = *(void *)(v0 + 640);
  static ExecuteResponse.ongoing(requireInput:)(0LL);
  sub_8DCC(v4, &qword_3D4B0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = *(void *)(v0 + 712);
  uint64_t v6 = *(void *)(v0 + 704);
  uint64_t v7 = *(void *)(v0 + 664);
  uint64_t v8 = *(void *)(v0 + 640);
  uint64_t v9 = *(void *)(v0 + 632);
  uint64_t v10 = *(void *)(v0 + 624);
  uint64_t v11 = *(void *)(v0 + 600);
  uint64_t v12 = *(void *)(v0 + 592);
  uint64_t v13 = *(void *)(v0 + 568);
  uint64_t v15 = *(void *)(v0 + 560);
  uint64_t v16 = *(void *)(v0 + 552);
  uint64_t v17 = *(void *)(v0 + 528);
  uint64_t v18 = *(void *)(v0 + 512);
  uint64_t v19 = *(void *)(v0 + 488);
  uint64_t v20 = *(void *)(v0 + 480);
  uint64_t v21 = *(void *)(v0 + 456);
  uint64_t v22 = *(void *)(v0 + 432);
  uint64_t v23 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DECC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 776LL);
  *(void *)(*(void *)v1 + 784LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1EA2C;
  }
  else {
    uint64_t v3 = sub_1DF30;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1DF30()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0[68] + 16LL);
  uint64_t v2 = v1(v0[70], v0[71], v0[67]);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = v0[70];
    uint64_t v6 = v0[69];
    uint64_t v36 = v0[68];
    uint64_t v7 = v0[67];
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v37 = swift_slowAlloc(32LL, -1LL);
    uint64_t v9 = v37;
    *(_DWORD *)uint64_t v8 = 136315138;
    v1(v6, v5, v7);
    uint64_t v10 = String.init<A>(describing:)(v6, v7);
    unint64_t v12 = v11;
    v0[39] = sub_12A3C(v10, v11, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 39, v0 + 40);
    swift_bridgeObjectRelease(v12);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v13(v5, v7);
    _os_log_impl(&dword_0, v3, v4, "Event received from IntelligenceFlow: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0[68] + 8LL);
    v13(v0[70], v0[67]);
  }

  v0[99] = v13;
  uint64_t v14 = v0[66];
  uint64_t v15 = v0[65];
  SessionServerMessage.payload.getter(v16);
  uint64_t v17 = String.init<A>(describing:)(v14, v15);
  uint64_t v19 = v18;
  v0[34] = v17;
  v0[35] = v18;
  unint64_t v20 = sub_F72C();
  uint64_t v21 = (void *)StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)( 40LL,  0xE100000000000000LL,  1LL,  0LL,  &type metadata for String,  v20);
  swift_bridgeObjectRelease(v19);
  if (!v21[2])
  {
    swift_bridgeObjectRelease(v21);
LABEL_11:
    uint64_t v35 = (void *)swift_task_alloc(dword_3D664);
    v0[100] = v35;
    *uint64_t v35 = v0;
    v35[1] = sub_1E2D0;
    return sub_1FA94(v0[49], v0[71]);
  }

  swift_bridgeObjectRetain(v21);
  uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v23, v24))
  {
    swift_bridgeObjectRelease_n(v21, 2LL);
    goto LABEL_10;
  }

  uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t result = swift_slowAlloc(32LL, -1LL);
  uint64_t v37 = result;
  *(_DWORD *)uint64_t v25 = 136446210;
  if (v21[2])
  {
    uint64_t v27 = result;
    uint64_t v28 = v21[4];
    uint64_t v29 = v21[5];
    uint64_t v30 = v21[6];
    uint64_t v31 = v21[7];
    swift_bridgeObjectRetain(v31);
    uint64_t v32 = static String._fromSubstring(_:)(v28, v29, v30, v31);
    unint64_t v34 = v33;
    swift_bridgeObjectRelease(v31);
    v0[38] = sub_12A3C(v32, v34, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 38, v0 + 39);
    swift_bridgeObjectRelease(v34);
    swift_bridgeObjectRelease_n(v21, 2LL);
    _os_log_impl(&dword_0, v23, v24, "Event received from IntelligenceFlow: %{public}s", v25, 0xCu);
    swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
LABEL_10:

    goto LABEL_11;
  }

  __break(1u);
  return result;
}

uint64_t sub_1E2D0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 800LL);
  *(void *)(*(void *)v1 + 808LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1ECD0;
  }
  else {
    uint64_t v3 = sub_1E334;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1E334()
{
  uint64_t v1 = *(void *)(v0 + 712);
  uint64_t v2 = *(void *)(v0 + 704);
  uint64_t v3 = *(void *)(v0 + 664);
  uint64_t v4 = *(void *)(v0 + 640);
  uint64_t v5 = *(void *)(v0 + 632);
  uint64_t v6 = *(void *)(v0 + 624);
  uint64_t v7 = *(void *)(v0 + 600);
  uint64_t v8 = *(void *)(v0 + 592);
  uint64_t v9 = *(void *)(v0 + 568);
  uint64_t v11 = *(void *)(v0 + 560);
  uint64_t v12 = *(void *)(v0 + 552);
  uint64_t v13 = *(void *)(v0 + 528);
  uint64_t v14 = *(void *)(v0 + 512);
  uint64_t v15 = *(void *)(v0 + 488);
  uint64_t v16 = *(void *)(v0 + 480);
  uint64_t v17 = *(void *)(v0 + 456);
  uint64_t v18 = *(void *)(v0 + 432);
  uint64_t v19 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1E484()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 824LL);
  *(void *)(*(void *)v1 + 832LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1EF84;
  }
  else {
    uint64_t v3 = sub_1E4E8;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1E4E8()
{
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v17 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 456);
  uint64_t v2 = *(void *)(v0 + 464);
  uint64_t v4 = *(void *)(v0 + 432);
  uint64_t v15 = *(void *)(v0 + 448);
  uint64_t v16 = *(void *)(v0 + 440);
  uint64_t v5 = *(void **)(v0 + 400);
  uint64_t v7 = v5[7];
  uint64_t v6 = v5[8];
  sub_B170(v5 + 4, v7);
  char v8 = dispatch thunk of DeviceState.isTextToSpeechEnabled.getter(v7, v6);
  uint64_t v9 = type metadata accessor for NLContextUpdate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v4, 1LL, 1LL, v9);
  *(void *)(v0 + 48) = 0LL;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)( v3,  v5 + 4,  v8 & 1,  _swiftEmptyArrayStorage,  0LL,  1LL,  v4,  _swiftEmptyArrayStorage,  v0 + 16);
  sub_8DCC(v0 + 16, &qword_3D650);
  sub_8DCC(v4, &qword_3D248);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v16);
  uint64_t v10 = v5[12];
  uint64_t v11 = v5[13];
  sub_B170(v5 + 9, v10);
  *(void *)(v0 + 80) = v2;
  *(void *)(v0 + 88) = &protocol witness table for AceOutput;
  uint64_t v12 = sub_DEBC((void *)(v0 + 56));
  (*(void (**)(void *, uint64_t, uint64_t))(v17 + 16))(v12, v1, v2);
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  *(void *)(v0 + 840) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1E67C;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 56, v10, v11);
}

uint64_t sub_1E67C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 840);
  *(void *)(*v1 + 848) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1F264;
  }

  else
  {
    sub_76EC((void *)(v2 + 56));
    uint64_t v4 = sub_1E6E8;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1E6E8()
{
  uint64_t v1 = *(void *)(v0 + 816);
  uint64_t v2 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 696);
  uint64_t v4 = *(void *)(v0 + 688);
  *(void *)uint64_t v2 = v1;
  *(_BYTE *)(v2 + 8) = 1;
  swift_storeEnumTagMultiPayload(v2, v4, 3LL);
  swift_errorRetain(v1);
  sub_253EC(v2);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  static ExecuteResponse.complete()(v5);
  swift_errorRelease(v1);
  uint64_t v6 = *(void *)(v0 + 712);
  uint64_t v7 = *(void *)(v0 + 704);
  uint64_t v8 = *(void *)(v0 + 664);
  uint64_t v9 = *(void *)(v0 + 640);
  uint64_t v10 = *(void *)(v0 + 632);
  uint64_t v11 = *(void *)(v0 + 624);
  uint64_t v12 = *(void *)(v0 + 600);
  uint64_t v13 = *(void *)(v0 + 592);
  uint64_t v14 = *(void *)(v0 + 568);
  uint64_t v16 = *(void *)(v0 + 560);
  uint64_t v17 = *(void *)(v0 + 552);
  uint64_t v18 = *(void *)(v0 + 528);
  uint64_t v19 = *(void *)(v0 + 512);
  uint64_t v20 = *(void *)(v0 + 488);
  uint64_t v21 = *(void *)(v0 + 480);
  uint64_t v22 = *(void *)(v0 + 456);
  uint64_t v23 = *(void *)(v0 + 432);
  uint64_t v24 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1E898()
{
  uint64_t v1 = *(void *)(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 656);
  uint64_t v3 = *(void *)(v0 + 648);
  uint64_t v4 = *(void *)(v0 + 640);
  (*(void (**)(void, void))(v0 + 752))(*(void *)(v0 + 632), *(void *)(v0 + 608));
  sub_8DCC(v4, &qword_3D4B0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_76EC((void *)(v0 + 136));
  uint64_t v5 = *(void *)(v0 + 712);
  uint64_t v6 = *(void *)(v0 + 704);
  uint64_t v7 = *(void *)(v0 + 664);
  uint64_t v8 = *(void *)(v0 + 640);
  uint64_t v9 = *(void *)(v0 + 632);
  uint64_t v10 = *(void *)(v0 + 624);
  uint64_t v11 = *(void *)(v0 + 600);
  uint64_t v12 = *(void *)(v0 + 592);
  uint64_t v13 = *(void *)(v0 + 568);
  uint64_t v15 = *(void *)(v0 + 560);
  uint64_t v16 = *(void *)(v0 + 552);
  uint64_t v17 = *(void *)(v0 + 528);
  uint64_t v18 = *(void *)(v0 + 512);
  uint64_t v19 = *(void *)(v0 + 488);
  uint64_t v20 = *(void *)(v0 + 480);
  uint64_t v21 = *(void *)(v0 + 456);
  uint64_t v22 = *(void *)(v0 + 432);
  uint64_t v23 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1EA2C()
{
  uint64_t v1 = *(void *)(v0 + 784);
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v30 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getErrorValue(v1, v0 + 296, v0 + 248);
    uint64_t v7 = Error.localizedDescription.getter(*(void *)(v0 + 256), *(void *)(v0 + 264));
    unint64_t v9 = v8;
    *(void *)(v0 + 288) = sub_12A3C(v7, v8, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296);
    swift_bridgeObjectRelease(v9);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl(&dword_0, v3, v4, "Error while receiving event from Intelligence Flow %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  swift_willThrow(v10);
  uint64_t v11 = *(void *)(v0 + 712);
  uint64_t v12 = *(void *)(v0 + 704);
  uint64_t v13 = *(void *)(v0 + 664);
  uint64_t v14 = *(void *)(v0 + 640);
  uint64_t v15 = *(void *)(v0 + 632);
  uint64_t v16 = *(void *)(v0 + 624);
  uint64_t v17 = *(void *)(v0 + 600);
  uint64_t v18 = *(void *)(v0 + 592);
  uint64_t v19 = *(void *)(v0 + 568);
  uint64_t v21 = *(void *)(v0 + 560);
  uint64_t v22 = *(void *)(v0 + 552);
  uint64_t v23 = *(void *)(v0 + 528);
  uint64_t v24 = *(void *)(v0 + 512);
  uint64_t v25 = *(void *)(v0 + 488);
  uint64_t v26 = *(void *)(v0 + 480);
  uint64_t v27 = *(void *)(v0 + 456);
  uint64_t v28 = *(void *)(v0 + 432);
  uint64_t v29 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1ECD0()
{
  uint64_t v1 = *(void *)(v0 + 808);
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v30 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getErrorValue(v1, v0 + 296, v0 + 248);
    uint64_t v7 = Error.localizedDescription.getter(*(void *)(v0 + 256), *(void *)(v0 + 264));
    unint64_t v9 = v8;
    *(void *)(v0 + 288) = sub_12A3C(v7, v8, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296);
    swift_bridgeObjectRelease(v9);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl(&dword_0, v3, v4, "Error while receiving event from Intelligence Flow %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  swift_willThrow(v10);
  uint64_t v11 = *(void *)(v0 + 712);
  uint64_t v12 = *(void *)(v0 + 704);
  uint64_t v13 = *(void *)(v0 + 664);
  uint64_t v14 = *(void *)(v0 + 640);
  uint64_t v15 = *(void *)(v0 + 632);
  uint64_t v16 = *(void *)(v0 + 624);
  uint64_t v17 = *(void *)(v0 + 600);
  uint64_t v18 = *(void *)(v0 + 592);
  uint64_t v19 = *(void *)(v0 + 568);
  uint64_t v21 = *(void *)(v0 + 560);
  uint64_t v22 = *(void *)(v0 + 552);
  uint64_t v23 = *(void *)(v0 + 528);
  uint64_t v24 = *(void *)(v0 + 512);
  uint64_t v25 = *(void *)(v0 + 488);
  uint64_t v26 = *(void *)(v0 + 480);
  uint64_t v27 = *(void *)(v0 + 456);
  uint64_t v28 = *(void *)(v0 + 432);
  uint64_t v29 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1EF84()
{
  uint64_t v1 = *(void *)(v0 + 832);
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain(v1);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(void *)(v0 + 344) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 344, v0 + 352);
    *uint64_t v6 = v7;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl(&dword_0, v3, v4, "Unable to publish error output due to %@.", v5, 0xCu);
    uint64_t v8 = sub_494C(&qword_3D358);
    swift_arrayDestroy(v6, 1LL, v8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);

    swift_errorRelease(v1);
  }

  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  uint64_t v9 = *(void *)(v0 + 816);
  uint64_t v10 = *(void *)(v0 + 712);
  uint64_t v11 = *(void *)(v0 + 696);
  uint64_t v12 = *(void *)(v0 + 688);
  *(void *)uint64_t v10 = v9;
  *(_BYTE *)(v10 + 8) = 1;
  swift_storeEnumTagMultiPayload(v10, v12, 3LL);
  swift_errorRetain(v9);
  sub_253EC(v10);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  static ExecuteResponse.complete()(v13);
  swift_errorRelease(v9);
  uint64_t v14 = *(void *)(v0 + 712);
  uint64_t v15 = *(void *)(v0 + 704);
  uint64_t v16 = *(void *)(v0 + 664);
  uint64_t v17 = *(void *)(v0 + 640);
  uint64_t v18 = *(void *)(v0 + 632);
  uint64_t v19 = *(void *)(v0 + 624);
  uint64_t v20 = *(void *)(v0 + 600);
  uint64_t v21 = *(void *)(v0 + 592);
  uint64_t v22 = *(void *)(v0 + 568);
  uint64_t v24 = *(void *)(v0 + 560);
  uint64_t v25 = *(void *)(v0 + 552);
  uint64_t v26 = *(void *)(v0 + 528);
  uint64_t v27 = *(void *)(v0 + 512);
  uint64_t v28 = *(void *)(v0 + 488);
  uint64_t v29 = *(void *)(v0 + 480);
  uint64_t v30 = *(void *)(v0 + 456);
  uint64_t v31 = *(void *)(v0 + 432);
  uint64_t v32 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1F264()
{
  uint64_t v1 = *(void *)(v0 + 848);
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain(v1);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(void *)(v0 + 344) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 344, v0 + 352);
    *uint64_t v6 = v7;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl(&dword_0, v3, v4, "Unable to publish error output due to %@.", v5, 0xCu);
    uint64_t v8 = sub_494C(&qword_3D358);
    swift_arrayDestroy(v6, 1LL, v8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);

    swift_errorRelease(v1);
  }

  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  uint64_t v9 = *(void *)(v0 + 816);
  uint64_t v10 = *(void *)(v0 + 712);
  uint64_t v11 = *(void *)(v0 + 696);
  uint64_t v12 = *(void *)(v0 + 688);
  *(void *)uint64_t v10 = v9;
  *(_BYTE *)(v10 + 8) = 1;
  swift_storeEnumTagMultiPayload(v10, v12, 3LL);
  swift_errorRetain(v9);
  sub_253EC(v10);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  static ExecuteResponse.complete()(v13);
  swift_errorRelease(v9);
  uint64_t v14 = *(void *)(v0 + 712);
  uint64_t v15 = *(void *)(v0 + 704);
  uint64_t v16 = *(void *)(v0 + 664);
  uint64_t v17 = *(void *)(v0 + 640);
  uint64_t v18 = *(void *)(v0 + 632);
  uint64_t v19 = *(void *)(v0 + 624);
  uint64_t v20 = *(void *)(v0 + 600);
  uint64_t v21 = *(void *)(v0 + 592);
  uint64_t v22 = *(void *)(v0 + 568);
  uint64_t v24 = *(void *)(v0 + 560);
  uint64_t v25 = *(void *)(v0 + 552);
  uint64_t v26 = *(void *)(v0 + 528);
  uint64_t v27 = *(void *)(v0 + 512);
  uint64_t v28 = *(void *)(v0 + 488);
  uint64_t v29 = *(void *)(v0 + 480);
  uint64_t v30 = *(void *)(v0 + 456);
  uint64_t v31 = *(void *)(v0 + 432);
  uint64_t v32 = *(void *)(v0 + 424);
  swift_task_dealloc(*(void *)(v0 + 736));
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1F560()
{
  uint64_t v0 = sub_1A070();
  uint64_t v24 = CurrentRequest.rootRequestId.getter();
  uint64_t v2 = v1;
  swift_release(v0);
  uint64_t v3 = sub_1A070();
  uint64_t v4 = CurrentRequest.resultCandidateId.getter();
  uint64_t v6 = v5;
  swift_release(v3);
  uint64_t v7 = sub_1A070();
  uint64_t v8 = CurrentRequest.rootRequestId.getter();
  uint64_t v10 = v9;
  swift_release(v7);
  uint64_t v11 = sub_1A070();
  uint64_t v12 = CurrentRequest.executionRequestId.getter(v11);
  uint64_t v14 = v13;
  swift_release(v11);
  sub_27840(v8, v10, v12, v14, v24, v2, v4, v6);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v10);
  uint64_t v15 = sub_1A070();
  uint64_t v16 = CurrentRequest.executionRequestId.getter(v15);
  unint64_t v18 = v17;
  swift_release(v15);
  uint64_t v19 = sub_1A070();
  uint64_t v20 = CurrentRequest.rootRequestId.getter();
  unint64_t v22 = v21;
  swift_release(v19);
  sub_280D0(v16, v18, v20, v22);
  swift_bridgeObjectRelease(v22);
  return swift_bridgeObjectRelease(v18);
}

uint64_t sub_1F6D0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 80LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 88LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v4,  v3,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated type descriptor for IFSessionServiceClientProtocol.MessagesStream);
  v2[4] = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v4,  v3,  AssociatedTypeWitness,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated conformance descriptor for IFSessionServiceClientProtocol.IFSessionServiceClientProtocol.MessagesStream: AsyncSequence);
  v2[5] = AssociatedConformanceWitness;
  uint64_t v7 = swift_getAssociatedTypeWitness( 0LL,  AssociatedConformanceWitness,  AssociatedTypeWitness,  &protocol requirements base descriptor for AsyncSequence,  &associated type descriptor for AsyncSequence.AsyncIterator);
  v2[6] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[7] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[8] = swift_task_alloc(v9);
  void v2[9] = swift_task_alloc(v9);
  uint64_t v10 = sub_494C(&qword_3D710);
  v2[10] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1F7D8, 0LL, 0LL);
}

uint64_t sub_1F7D8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_1A51C(v0[9]);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v2,  v3,  v1,  &protocol requirements base descriptor for AsyncSequence,  &associated conformance descriptor for AsyncSequence.AsyncSequence.AsyncIterator: AsyncIteratorProtocol);
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1F86C;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[10], v0[6], AssociatedConformanceWitness);
}

uint64_t sub_1F86C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 88);
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1FA24;
  }

  else
  {
    sub_1A790(*(void *)(v2 + 72));
    uint64_t v4 = sub_1F8DC;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1F8DC()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = type metadata accessor for SessionServerMessage(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2) == 1)
  {
    sub_8DCC(v1, &qword_3D710);
    uint64_t v4 = type metadata accessor for IFFlowError(0LL);
    uint64_t v5 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    swift_allocError(v4, v5, 0LL, 0LL);
    *uint64_t v6 = 0xD000000000000023LL;
    v6[1] = 0x8000000000033D30LL;
    uint64_t v7 = swift_storeEnumTagMultiPayload(v6, v4, 4LL);
    swift_willThrow(v7);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 64);
    swift_task_dealloc(*(void *)(v0 + 80));
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
  }

  else
  {
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v10 = *(void *)(v0 + 72);
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(*(void *)(v0 + 16), v1, v2);
    swift_task_dealloc(v1);
    swift_task_dealloc(v10);
    swift_task_dealloc(v11);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1FA24()
{
  uint64_t v1 = *(void *)(v0 + 64);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 56) + 32LL))( v1,  *(void *)(v0 + 72),  *(void *)(v0 + 48));
  sub_1A790(v1);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_task_dealloc(*(void *)(v0 + 80));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1FA94(uint64_t a1, uint64_t a2)
{
  v3[95] = v2;
  v3[94] = a2;
  v3[93] = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = type metadata accessor for Parse(0LL);
  v3[96] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[97] = v6;
  v3[98] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Input(0LL);
  v3[99] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for PluginAction(0LL);
  v3[100] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[101] = v9;
  v3[102] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Parse.DirectInvocation(0LL);
  v3[103] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[104] = v11;
  v3[105] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for FlowUnhandledReason(0LL);
  v3[106] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[107] = v13;
  v3[108] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for ActionFailure(0LL);
  v3[109] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[110] = v15;
  unint64_t v16 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[111] = swift_task_alloc(v16);
  v3[112] = swift_task_alloc(v16);
  v3[113] = swift_task_alloc(v16);
  uint64_t v17 = sub_494C(&qword_3D638);
  v3[114] = swift_task_alloc((*(void *)(*(void *)(v17 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for IFFlowError(0LL);
  v3[115] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v3[116] = v19;
  unint64_t v20 = (*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[117] = swift_task_alloc(v20);
  v3[118] = swift_task_alloc(v20);
  uint64_t v21 = type metadata accessor for UnlockDevicePolicy(0LL);
  v3[119] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v3[120] = v22;
  v3[121] = swift_task_alloc((*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for SessionServerMessage(0LL);
  v3[122] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v3[123] = v24;
  uint64_t v25 = *(void *)(v24 + 64);
  v3[124] = v25;
  v3[125] = swift_task_alloc((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for StatementID(0LL);
  v3[126] = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  v3[127] = v27;
  uint64_t v28 = *(void *)(v27 + 64);
  v3[128] = v28;
  unint64_t v29 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v3[129] = swift_task_alloc(v29);
  v3[130] = swift_task_alloc(v29);
  v3[131] = swift_task_alloc(v29);
  v3[132] = swift_task_alloc(v29);
  v3[133] = swift_task_alloc(v29);
  uint64_t v30 = *(void *)(v4 + 80);
  v3[134] = v30;
  uint64_t v31 = *(void *)(v4 + 88);
  v3[135] = v31;
  uint64_t v33 = type metadata accessor for IFFlow.State(0LL, v30, v31, v32);
  v3[136] = v33;
  uint64_t v34 = *(void *)(v33 - 8);
  v3[137] = v34;
  v3[138] = swift_task_alloc((*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = type metadata accessor for MessagePayload(0LL);
  v3[139] = v35;
  uint64_t v36 = *(void *)(v35 - 8);
  v3[140] = v36;
  v3[141] = swift_task_alloc((*(void *)(v36 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v37 = (*(void *)(*(void *)(sub_494C(&qword_3D670) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[142] = swift_task_alloc(v37);
  v3[143] = swift_task_alloc(v37);
  return swift_task_switch(sub_1FD80, 0LL, 0LL);
}

uint64_t sub_1FD80()
{
  uint64_t v1 = v0[95];
  uint64_t v2 = sub_1A070();
  v0[144] = v2;
  uint64_t v3 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 224);
  v0[145] = v4;
  uint64_t v5 = dword_3DA0C;
  swift_bridgeObjectRetain(v4);
  uint64_t v6 = (uint64_t **)swift_task_alloc(v5);
  v0[146] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = (uint64_t *)sub_1FE20;
  return sub_2AD4C(v0[143], v0[94], v1 + 112, v2, v3, v4, v1 + 32);
}

uint64_t sub_1FE20()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1168);
  *(void *)(*v1 + 1176) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_22D28;
  }

  else
  {
    uint64_t v5 = *(void *)(v2 + 1160);
    swift_release(*(void *)(v2 + 1152));
    swift_bridgeObjectRelease(v5);
    uint64_t v4 = sub_1FE98;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1FE98()
{
  uint64_t v1 = v0;
  uint64_t v50 = v0 + 79;
  uint64_t v2 = sub_1A070();
  uint64_t v3 = CurrentRequest.rootRequestId.getter();
  unint64_t v5 = v4;
  uint64_t v6 = swift_release(v2);
  if (v5)
  {
    uint64_t v7 = (char *)v1[141];
    uint64_t v8 = v1[140];
    uint64_t v9 = v1[139];
    SessionServerMessage.payload.getter(v6);
    sub_28EC0(v7, v3, v5);
    swift_bridgeObjectRelease(v5);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v9);
  }

  else
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_458C(v10, (uint64_t)qword_3E310);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "Cannot attempt to apply redaction tag for empty rootRequestId", v14, 2u);
      swift_slowDealloc(v14, -1LL, -1LL);
    }
  }

  uint64_t v15 = v1[142];
  sub_F848(v1[143], v15, &qword_3D670);
  uint64_t v16 = type metadata accessor for FlowAction(0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48LL))(v15, 1LL, v16) != 1)
  {
    unint64_t v39 = (char *)&loc_203BC + 4 * word_3158C[swift_getEnumCaseMultiPayload(v1[142], v16)];
    __asm { BR              X10 }
  }

  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v18 = sub_458C(v17, (uint64_t)qword_3E310);
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    v53[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    v1[78] = sub_12A3C(0xD00000000000001BLL, 0x8000000000033C80LL, v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 78, v50);
    _os_log_impl(&dword_0, v19, v20, "In %s - next flow action is none", v21, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  uint64_t v23 = v1[143];
  uint64_t v24 = v1[138];
  uint64_t v25 = v1[137];
  uint64_t v26 = v1[136];
  swift_storeEnumTagMultiPayload(v24, v26, 5LL);
  sub_253EC(v24);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  static ExecuteResponse.ongoing(requireInput:)(0LL);
  sub_8DCC(v23, &qword_3D670);
  uint64_t v27 = v1[143];
  uint64_t v28 = v1[142];
  uint64_t v29 = v1[141];
  uint64_t v30 = v1[138];
  uint64_t v31 = v1[133];
  uint64_t v32 = v1[132];
  uint64_t v33 = v1[131];
  uint64_t v34 = v1[130];
  uint64_t v35 = v1[129];
  uint64_t v36 = v1;
  uint64_t v37 = v1[125];
  uint64_t v40 = v36[121];
  uint64_t v41 = v36[118];
  uint64_t v42 = v36[117];
  uint64_t v43 = v36[114];
  uint64_t v44 = v36[113];
  uint64_t v45 = v36[112];
  uint64_t v46 = v36[111];
  uint64_t v47 = v36[108];
  uint64_t v48 = v36[105];
  uint64_t v49 = v36[102];
  uint64_t v51 = v36[99];
  uint64_t v52 = v36[98];
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v37);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  return ((uint64_t (*)(void))v36[1])();
}

uint64_t sub_222C8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 1184LL);
  *(void *)(*(void *)v1 + 1192LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_22EAC;
  }
  else {
    uint64_t v3 = sub_2232C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_2232C()
{
  uint64_t v1 = *(void *)(v0 + 1144);
  uint64_t v2 = *(void *)(v0 + 1104);
  uint64_t v3 = *(void *)(v0 + 1096);
  uint64_t v4 = *(void *)(v0 + 1088);
  swift_storeEnumTagMultiPayload(v2, v4, 5LL);
  sub_253EC(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  static ExecuteResponse.ongoing(requireInput:)(0LL);
  sub_76EC((void *)(v0 + 136));
  sub_8DCC(v1, &qword_3D670);
  uint64_t v5 = *(void *)(v0 + 1136);
  uint64_t v6 = *(void *)(v0 + 1128);
  uint64_t v7 = *(void *)(v0 + 1104);
  uint64_t v8 = *(void *)(v0 + 1064);
  uint64_t v9 = *(void *)(v0 + 1056);
  uint64_t v10 = *(void *)(v0 + 1048);
  uint64_t v11 = *(void *)(v0 + 1040);
  uint64_t v12 = *(void *)(v0 + 1032);
  uint64_t v13 = *(void *)(v0 + 1000);
  uint64_t v15 = *(void *)(v0 + 968);
  uint64_t v16 = *(void *)(v0 + 944);
  uint64_t v17 = *(void *)(v0 + 936);
  uint64_t v18 = *(void *)(v0 + 912);
  uint64_t v19 = *(void *)(v0 + 904);
  uint64_t v20 = *(void *)(v0 + 896);
  uint64_t v21 = *(void *)(v0 + 888);
  uint64_t v22 = *(void *)(v0 + 864);
  uint64_t v23 = *(void *)(v0 + 840);
  uint64_t v24 = *(void *)(v0 + 816);
  uint64_t v25 = *(void *)(v0 + 792);
  uint64_t v26 = *(void *)(v0 + 784);
  swift_task_dealloc(*(void *)(v0 + 1144));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22500()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 1216LL);
  *(void *)(*(void *)v1 + 1224LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_23038;
  }
  else {
    uint64_t v3 = sub_22564;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_22564()
{
  uint64_t v1 = v0[150];
  if (v1)
  {
    uint64_t v2 = v0[116];
    uint64_t v3 = v0[115];
    uint64_t v4 = v0[114];
    v0[86] = v1;
    swift_errorRetain(v1);
    uint64_t v5 = sub_494C(&qword_3D648);
    int v6 = swift_dynamicCast(v4, v0 + 86, v5, v3, 6LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, v6 ^ 1u, 1LL, v3);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1LL, v3) != 1)
    {
      uint64_t v7 = v0[118];
      uint64_t v8 = v0[117];
      uint64_t v9 = v0[115];
      sub_253A8(v0[114], v7);
      sub_3400(v7, v8);
      if (swift_getEnumCaseMultiPayload(v8, v9) == 7)
      {
        uint64_t v103 = v1;
        uint64_t v10 = v0[113];
        uint64_t v11 = v0[112];
        uint64_t v12 = v0[110];
        uint64_t v13 = v0[109];
        (*(void (**)(uint64_t, void, uint64_t))(v12 + 32))(v10, v0[117], v13);
        uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
        uint64_t v15 = v14(v11, v10, v13);
        uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
        os_log_type_t v17 = static os_log_type_t.debug.getter();
        BOOL v18 = os_log_type_enabled(v16, v17);
        uint64_t v19 = v0[112];
        if (v18)
        {
          uint64_t v20 = v0[111];
          uint64_t v91 = v0[110];
          uint64_t v21 = v0[109];
          log = v16;
          uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v99 = swift_slowAlloc(32LL, -1LL);
          uint64_t v105 = v99;
          *(_DWORD *)uint64_t v22 = 136315138;
          v14(v20, v19, v21);
          uint64_t v23 = String.init<A>(describing:)(v20, v21);
          unint64_t v25 = v24;
          v0[83] = sub_12A3C(v23, v24, &v105);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 83, v0 + 84);
          swift_bridgeObjectRelease(v25);
          uint64_t v26 = *(os_log_s **)(v91 + 8);
          ((void (*)(uint64_t, uint64_t))v26)(v19, v21);
          _os_log_impl(&dword_0, log, v17, "Session completed with actionError: %s", v22, 0xCu);
          swift_arrayDestroy(v99, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v99, -1LL, -1LL);
          swift_slowDealloc(v22, -1LL, -1LL);
        }

        else
        {
          uint64_t v26 = *(os_log_s **)(v0[110] + 8LL);
          ((void (*)(void, void))v26)(v0[112], v0[109]);
        }

        os_log_t logb = v26;
        uint64_t v101 = v0[143];
        uint64_t v54 = v0[138];
        uint64_t v55 = v0[137];
        uint64_t v56 = v0[136];
        uint64_t v57 = v0[118];
        uint64_t v58 = v0[115];
        uint64_t v89 = v0[109];
        uint64_t v93 = v0[113];
        uint64_t v59 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
        uint64_t v60 = swift_allocError(v58, v59, 0LL, 0LL);
        sub_3400(v57, v61);
        *(void *)uint64_t v54 = v60;
        *(_BYTE *)(v54 + 8) = 1;
        swift_storeEnumTagMultiPayload(v54, v56, 3LL);
        sub_253EC(v54);
        uint64_t v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
        static ExecuteResponse.complete()(v62);
        swift_errorRelease(v103);
        ((void (*)(uint64_t, uint64_t))logb)(v93, v89);
        sub_3444(v57);
        sub_76EC(v0 + 37);
        sub_8DCC((uint64_t)(v0 + 32), &qword_3D680);
        uint64_t v36 = v101;
LABEL_17:
        sub_8DCC(v36, &qword_3D670);
        uint64_t v63 = v0[142];
        uint64_t v64 = v0[141];
        uint64_t v65 = v0[138];
        uint64_t v66 = v0[133];
        uint64_t v67 = v0[132];
        uint64_t v68 = v0[131];
        uint64_t v69 = v0[130];
        uint64_t v70 = v0[129];
        uint64_t v71 = v0[125];
        uint64_t v75 = v0[121];
        uint64_t v77 = v0[118];
        uint64_t v79 = v0[117];
        uint64_t v81 = v0[114];
        uint64_t v83 = v0[113];
        uint64_t v85 = v0[112];
        uint64_t v87 = v0[111];
        uint64_t v90 = v0[108];
        uint64_t v94 = v0[105];
        os_log_t logc = (os_log_t)v0[102];
        uint64_t v102 = v0[99];
        uint64_t v104 = v0[98];
        swift_task_dealloc(v0[143]);
        swift_task_dealloc(v63);
        swift_task_dealloc(v64);
        swift_task_dealloc(v65);
        swift_task_dealloc(v66);
        swift_task_dealloc(v67);
        swift_task_dealloc(v68);
        swift_task_dealloc(v69);
        swift_task_dealloc(v70);
        swift_task_dealloc(v71);
        swift_task_dealloc(v75);
        swift_task_dealloc(v77);
        swift_task_dealloc(v79);
        swift_task_dealloc(v81);
        swift_task_dealloc(v83);
        swift_task_dealloc(v85);
        swift_task_dealloc(v87);
        swift_task_dealloc(v90);
        swift_task_dealloc(v94);
        swift_task_dealloc(logc);
        swift_task_dealloc(v102);
        swift_task_dealloc(v104);
        uint64_t v53 = (uint64_t (*)(void))v0[1];
        return v53();
      }

      uint64_t v37 = v0[117];
      sub_3444(v0[118]);
      sub_76EC(v0 + 37);
      sub_3444(v37);
      goto LABEL_12;
    }
  }

  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[116] + 56LL))(v0[114], 1LL, 1LL, v0[115]);
  }

  uint64_t v27 = v0[114];
  sub_76EC(v0 + 37);
  sub_8DCC(v27, &qword_3D638);
  uint64_t v1 = v0[150];
  if (!v1)
  {
    uint64_t v28 = v0[138];
    uint64_t v29 = v0[137];
    uint64_t v30 = v0[136];
    *(void *)uint64_t v28 = 0LL;
    *(_BYTE *)(v28 + 8) = 0;
    swift_storeEnumTagMultiPayload(v28, v30, 3LL);
    sub_253EC(v28);
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_0, v32, v33, "Session completed without error and output. Exiting flow.", v34, 2u);
      swift_slowDealloc(v34, -1LL, -1LL);
    }

    uint64_t v35 = v0[143];

    ((void (*)(void))static ExecuteResponse.complete())();
    sub_8DCC((uint64_t)(v0 + 32), &qword_3D680);
    uint64_t v36 = v35;
    goto LABEL_17;
  }

LABEL_12:
  uint64_t v38 = swift_errorRetain(v1);
  unint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
  os_log_type_t v40 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl(&dword_0, v39, v40, "Session completed with error", v41, 2u);
    swift_slowDealloc(v41, -1LL, -1LL);
  }

  uint64_t v42 = v0[143];

  swift_willThrow(v43);
  swift_errorRelease(v1);
  sub_8DCC((uint64_t)(v0 + 32), &qword_3D680);
  sub_8DCC(v42, &qword_3D670);
  uint64_t v44 = v0[142];
  uint64_t v45 = v0[141];
  uint64_t v46 = v0[138];
  uint64_t v47 = v0[133];
  uint64_t v48 = v0[132];
  uint64_t v49 = v0[131];
  uint64_t v50 = v0[130];
  uint64_t v51 = v0[129];
  uint64_t v52 = v0[125];
  uint64_t v73 = v0[121];
  uint64_t v74 = v0[118];
  uint64_t v76 = v0[117];
  uint64_t v78 = v0[114];
  uint64_t v80 = v0[113];
  uint64_t v82 = v0[112];
  uint64_t v84 = v0[111];
  uint64_t v86 = v0[108];
  uint64_t v88 = v0[105];
  uint64_t v92 = v0[102];
  os_log_t loga = (os_log_t)v0[99];
  uint64_t v100 = v0[98];
  swift_task_dealloc(v0[143]);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v76);
  swift_task_dealloc(v78);
  swift_task_dealloc(v80);
  swift_task_dealloc(v82);
  swift_task_dealloc(v84);
  swift_task_dealloc(v86);
  swift_task_dealloc(v88);
  swift_task_dealloc(v92);
  swift_task_dealloc(loga);
  swift_task_dealloc(v100);
  uint64_t v53 = (uint64_t (*)(void))v0[1];
  return v53();
}

uint64_t sub_22D28()
{
  uint64_t v1 = *(void *)(v0 + 1160);
  swift_release(*(void *)(v0 + 1152));
  swift_bridgeObjectRelease(v1);
  uint64_t v2 = *(void *)(v0 + 1136);
  uint64_t v3 = *(void *)(v0 + 1128);
  uint64_t v4 = *(void *)(v0 + 1104);
  uint64_t v5 = *(void *)(v0 + 1064);
  uint64_t v6 = *(void *)(v0 + 1056);
  uint64_t v7 = *(void *)(v0 + 1048);
  uint64_t v8 = *(void *)(v0 + 1040);
  uint64_t v9 = *(void *)(v0 + 1032);
  uint64_t v10 = *(void *)(v0 + 1000);
  uint64_t v12 = *(void *)(v0 + 968);
  uint64_t v13 = *(void *)(v0 + 944);
  uint64_t v14 = *(void *)(v0 + 936);
  uint64_t v15 = *(void *)(v0 + 912);
  uint64_t v16 = *(void *)(v0 + 904);
  uint64_t v17 = *(void *)(v0 + 896);
  uint64_t v18 = *(void *)(v0 + 888);
  uint64_t v19 = *(void *)(v0 + 864);
  uint64_t v20 = *(void *)(v0 + 840);
  uint64_t v21 = *(void *)(v0 + 816);
  uint64_t v22 = *(void *)(v0 + 792);
  uint64_t v23 = *(void *)(v0 + 784);
  swift_task_dealloc(*(void *)(v0 + 1144));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22EAC()
{
  uint64_t v1 = *(void *)(v0 + 1144);
  sub_76EC((void *)(v0 + 136));
  sub_8DCC(v1, &qword_3D670);
  uint64_t v2 = *(void *)(v0 + 1136);
  uint64_t v3 = *(void *)(v0 + 1128);
  uint64_t v4 = *(void *)(v0 + 1104);
  uint64_t v5 = *(void *)(v0 + 1064);
  uint64_t v6 = *(void *)(v0 + 1056);
  uint64_t v7 = *(void *)(v0 + 1048);
  uint64_t v8 = *(void *)(v0 + 1040);
  uint64_t v9 = *(void *)(v0 + 1032);
  uint64_t v10 = *(void *)(v0 + 1000);
  uint64_t v12 = *(void *)(v0 + 968);
  uint64_t v13 = *(void *)(v0 + 944);
  uint64_t v14 = *(void *)(v0 + 936);
  uint64_t v15 = *(void *)(v0 + 912);
  uint64_t v16 = *(void *)(v0 + 904);
  uint64_t v17 = *(void *)(v0 + 896);
  uint64_t v18 = *(void *)(v0 + 888);
  uint64_t v19 = *(void *)(v0 + 864);
  uint64_t v20 = *(void *)(v0 + 840);
  uint64_t v21 = *(void *)(v0 + 816);
  uint64_t v22 = *(void *)(v0 + 792);
  uint64_t v23 = *(void *)(v0 + 784);
  swift_task_dealloc(*(void *)(v0 + 1144));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23038()
{
  uint64_t v1 = *(void *)(v0 + 1144);
  swift_errorRelease(*(void *)(v0 + 1200));
  sub_76EC((void *)(v0 + 296));
  sub_8DCC(v0 + 256, &qword_3D680);
  sub_8DCC(v1, &qword_3D670);
  uint64_t v2 = *(void *)(v0 + 1136);
  uint64_t v3 = *(void *)(v0 + 1128);
  uint64_t v4 = *(void *)(v0 + 1104);
  uint64_t v5 = *(void *)(v0 + 1064);
  uint64_t v6 = *(void *)(v0 + 1056);
  uint64_t v7 = *(void *)(v0 + 1048);
  uint64_t v8 = *(void *)(v0 + 1040);
  uint64_t v9 = *(void *)(v0 + 1032);
  uint64_t v10 = *(void *)(v0 + 1000);
  uint64_t v12 = *(void *)(v0 + 968);
  uint64_t v13 = *(void *)(v0 + 944);
  uint64_t v14 = *(void *)(v0 + 936);
  uint64_t v15 = *(void *)(v0 + 912);
  uint64_t v16 = *(void *)(v0 + 904);
  uint64_t v17 = *(void *)(v0 + 896);
  uint64_t v18 = *(void *)(v0 + 888);
  uint64_t v19 = *(void *)(v0 + 864);
  uint64_t v20 = *(void *)(v0 + 840);
  uint64_t v21 = *(void *)(v0 + 816);
  uint64_t v22 = *(void *)(v0 + 792);
  uint64_t v23 = *(void *)(v0 + 784);
  swift_task_dealloc(*(void *)(v0 + 1144));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_231E4(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for IFFlow.State( 0LL,  *(void *)(*(void *)a2 + 80LL),  *(void *)(*(void *)a2 + 88LL),  a4);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - v10;
  sub_25CA0(a1, a3, a4, a2[208], (uint64_t *)((char *)&v13 - v10));
  sub_253EC((uint64_t)v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_23294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for IFFlow.State( 0LL,  *(void *)(*(void *)a2 + 80LL),  *(void *)(*(void *)a2 + 88LL),  a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v13 - v9);
  uint64_t v11 = type metadata accessor for SimpleConfirmationResponseProvider(0LL);
  sub_13A30(a1, a3, a4, v11, (uint64_t)&protocol witness table for SimpleConfirmationResponseProvider, v10);
  sub_253EC((uint64_t)v10);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for IFFlow.State( 0LL,  *(void *)(*(void *)a2 + 80LL),  *(void *)(*(void *)a2 + 88LL),  a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - v9;
  sub_6A28(a1, a3, a4, (uint64_t *)((char *)&v12 - v9));
  sub_253EC((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23400(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for IFFlow.State( 0LL,  *(void *)(*(void *)a2 + 80LL),  *(void *)(*(void *)a2 + 88LL),  a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - v9;
  sub_234AC(*a1, a3, a4, (uint64_t)&v12 - v9);
  sub_253EC((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_234AC@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v77 = a3;
  uint64_t v86 = a2;
  uint64_t v82 = a4;
  LODWORD(v84) = a1 & 1;
  uint64_t v88 = *v4;
  uint64_t v67 = type metadata accessor for SystemResponse(0LL);
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v65 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v6);
  uint64_t v87 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v8);
  uint64_t v81 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v78 = *(void *)(v10 - 8);
  uint64_t v79 = v10;
  __chkstk_darwin(v10);
  uint64_t v76 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v85 = type metadata accessor for MessagePayload(0LL);
  uint64_t v83 = *(void *)(v85 - 8);
  uint64_t v12 = __chkstk_darwin(v85);
  uint64_t v72 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v80 = (char *)&v65 - v14;
  uint64_t v15 = sub_494C(&qword_3D1D0);
  __chkstk_darwin(v15);
  uint64_t v75 = (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v73 = type metadata accessor for StatementID(0LL);
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v68 = type metadata accessor for SystemPromptResolution.UserAction(0LL);
  uint64_t v19 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for UUID(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v69 = v22;
  uint64_t v74 = v23;
  __chkstk_darwin(v22);
  unint64_t v25 = (char *)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v65 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = type metadata accessor for SystemPromptResolution(0LL);
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)&v65 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v70 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v33 = v70(v28, 1LL, 1LL, v22);
  SessionServerMessage.eventId.getter(v33);
  char v34 = static GuardFlowResult.== infix(_:_:)(v84, 0LL);
  SystemPromptResolution.RequirementResolution.init(isRequirementSatisfied:)(v34 & 1);
  uint64_t v35 = *(void (**)(char *, void, uint64_t))(v19 + 104);
  uint64_t v36 = v72;
  v35(v21, enum case for SystemPromptResolution.UserAction.requirementAddressed(_:), v68);
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v18, v86, v73);
  uint64_t v37 = type metadata accessor for SystemPromptResolution.ResolutionInput(0LL);
  uint64_t v38 = v75;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56LL))(v75, 1LL, 1LL, v37);
  unint64_t v39 = v18;
  uint64_t v40 = v29;
  uint64_t v41 = v82;
  SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)( v28,  v25,  v21,  v39,  v38);
  uint64_t v75 = v41 + *(int *)(sub_494C(&qword_3D1E8) + 48);
  SessionServerMessage.sessionId.getter();
  uint64_t v86 = v30;
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  uint64_t v43 = v76;
  uint64_t v84 = v32;
  uint64_t v73 = v40;
  v42(v76, v32, v40);
  (*(void (**)(char *, void, uint64_t))(v78 + 104))( v43,  enum case for MessagePayload.RequestContent.promptResolution(_:),  v79);
  uint64_t v44 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
  uint64_t v45 = v81;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56LL))(v81, 1LL, 1LL, v44);
  uint64_t v46 = v69;
  v70(v28, 1LL, 1LL, v69);
  uint64_t v47 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
  uint64_t v48 = v87;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56LL))(v87, 1LL, 1LL, v47);
  uint64_t v49 = v80;
  MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v43,  0LL,  0LL,  v45,  v28,  v48);
  uint64_t v50 = v83;
  uint64_t v51 = v49;
  uint64_t v52 = (uint64_t)v49;
  uint64_t v53 = v85;
  (*(void (**)(char *, void, uint64_t))(v83 + 104))(v51, enum case for MessagePayload.request(_:), v85);
  sub_19E2C((uint64_t)v25, v52);
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
  v54(v52, v53);
  uint64_t v55 = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v25, v46);
  SessionServerMessage.payload.getter(v55);
  if ((*(unsigned int (**)(char *, uint64_t))(v50 + 88))(v36, v53) == enum case for MessagePayload.systemResponse(_:))
  {
    (*(void (**)(char *, uint64_t))(v50 + 96))(v36, v53);
    uint64_t v56 = v66;
    uint64_t v57 = (uint64_t)v65;
    uint64_t v58 = v67;
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v65, v36, v67);
    uint64_t v59 = v75;
    sub_3E74(v57, v75);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v58);
    uint64_t v60 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56LL))(v59, 0LL, 1LL, v60);
  }

  else
  {
    v54((uint64_t)v36, v53);
    uint64_t v61 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56LL))(v75, 1LL, 1LL, v61);
  }

  (*(void (**)(char *, uint64_t))(v86 + 8))(v84, v73);
  uint64_t v63 = type metadata accessor for IFFlow.State(0LL, *(void *)(v88 + 80), *(void *)(v88 + 88), v62);
  return swift_storeEnumTagMultiPayload(v41, v63, 0LL);
}

uint64_t sub_23AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t WitnessTable = swift_getWitnessTable(&unk_31790, *v2);
  return Flow.deferToExecuteAsync(_:)(a1, a2, v5, WitnessTable);
}

void sub_23B58(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_494C(&qword_3D4B0);
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for SessionClientMessage(0LL);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v2, a1);
  uint64_t v11 = (char *)sub_23C94 + 4 * byte_3159C[swift_getEnumCaseMultiPayload(v9, a1)];
  __asm { BR              X10 }

uint64_t sub_23C94()
{
  uint64_t v8 = v1 + *(int *)(sub_494C(&qword_3D1E8) + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v4, v1, v3);
  sub_F994(v8, v2, &qword_3D4B0);
  *(void *)(v7 - 96) = 0LL;
  *(void *)(v7 - 88) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(28LL);
  uint64_t v9 = *(void *)(v7 - 88);
  *(void *)(v7 - 96) = *(void *)(v7 - 96);
  *(void *)(v7 - 88) = v9;
  v10._object = (void *)0x8000000000033C60LL;
  v10._countAndFlagsBits = 0xD000000000000011LL;
  String.append(_:)(v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v4, v3);
  v11._countAndFlagsBits = String.init<A>(describing:)(v5, v3);
  object = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(object);
  v13._countAndFlagsBits = 0x206D6F72662029LL;
  v13._object = (void *)0xE700000000000000LL;
  String.append(_:)(v13);
  ((void (*)(uint64_t, uint64_t, uint64_t, void *, void *))_print_unlocked<A, B>(_:_:))( v2,  v7 - 96,  v0,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  uint64_t v14 = *(void *)(v7 - 96);
  sub_8DCC(v2, &qword_3D4B0);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v3);
  return v14;
}

uint64_t *sub_23F5C()
{
  uint64_t v1 = *v0;
  swift_release(v0[3]);
  sub_76EC(v0 + 4);
  sub_76EC(v0 + 9);
  sub_76EC(v0 + 14);

  swift_release(v0[20]);
  sub_76EC(v0 + 21);
  swift_bridgeObjectRelease(v0[28]);
  swift_release(v0[29]);
  swift_release(v0[30]);
  uint64_t v2 = *(void *)(v1 + 80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 184), v2);
  uint64_t v3 = (uint64_t)v0 + *(void *)(*v0 + 192);
  uint64_t v4 = *(void *)(v1 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v4,  v2,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated type descriptor for IFSessionServiceClientProtocol.MessagesStream);
  uint64_t v6 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v3, v6);
  uint64_t v7 = (uint64_t)v0 + *(void *)(*v0 + 200);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v4,  v2,  AssociatedTypeWitness,  &protocol requirements base descriptor for IFSessionServiceClientProtocol,  &associated conformance descriptor for IFSessionServiceClientProtocol.IFSessionServiceClientProtocol.MessagesStream: AsyncSequence);
  uint64_t v9 = swift_getAssociatedTypeWitness( 255LL,  AssociatedConformanceWitness,  AssociatedTypeWitness,  &protocol requirements base descriptor for AsyncSequence,  &associated type descriptor for AsyncSequence.AsyncIterator);
  uint64_t v10 = type metadata accessor for Optional(0LL, v9);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v7, v10);
  uint64_t v11 = (uint64_t)v0 + *(void *)(*v0 + 208);
  uint64_t v13 = type metadata accessor for IFFlow.State(0LL, v2, v4, v12);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8LL))(v11, v13);
  return v0;
}

uint64_t sub_240EC()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t type metadata accessor for IFFlow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257B4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IFFlow);
}

uint64_t type metadata accessor for IFFlow.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257B4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IFFlow.State);
}

_BYTE *initializeBufferWithCopyOfBuffer for ValueResolutionMode(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValueResolutionMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for ValueResolutionMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_24210 + 4 * byte_315A7[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24244 + 4 * byte_315A2[v4]))();
}

uint64_t sub_24244(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2424C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x24254LL);
  }
  return result;
}

uint64_t sub_24260(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x24268LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_2426C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24274(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24280(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24288(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ValueResolutionMode()
{
  return &type metadata for ValueResolutionMode;
}

uint64_t sub_242A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24LL);
}

uint64_t sub_242AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SessionClientMessage(319LL);
  if (v3 <= 0x3F)
  {
    sub_24E68(319LL);
    if (v5 > 0x3F) {
      return v4;
    }
    swift_getTupleTypeLayout2(v10, *(void *)(v2 - 8) + 64LL, *(void *)(v4 - 8) + 64LL);
    v11[0] = v10;
    uint64_t v2 = type metadata accessor for SessionServerMessage(319LL);
    if (v6 > 0x3F) {
      return v2;
    }
    uint64_t v4 = type metadata accessor for StatementID(319LL);
    if (v7 > 0x3F)
    {
      return v4;
    }

    else
    {
      swift_getTupleTypeLayout2(v9, *(void *)(v2 - 8) + 64LL, *(void *)(v4 - 8) + 64LL);
      v11[1] = v9;
      void v11[2] = "\t";
      v11[3] = &unk_316D8;
      swift_initEnumMetadataMultiPayload(a1, 0LL, 4LL, v11);
      return 0LL;
    }
  }

  return v2;
}

char *sub_243A0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v15 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v15);
  }

  else
  {
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        uint64_t v8 = type metadata accessor for SessionClientMessage(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
        uint64_t v9 = *(int *)(sub_494C(&qword_3D1E8) + 48);
        uint64_t v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        uint64_t v12 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12))
        {
          uint64_t v14 = sub_494C(&qword_3D4B0);
          memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64LL));
        }

        else
        {
          (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0LL, 1LL, v12);
        }

        swift_storeEnumTagMultiPayload(a1, a3, 0LL);
        break;
      case 1u:
        uint64_t v17 = type metadata accessor for SessionServerMessage(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16LL))(a1, a2, v17);
        uint64_t v18 = *(int *)(sub_494C(qword_3D580) + 48);
        uint64_t v19 = &a1[v18];
        uint64_t v20 = &a2[v18];
        uint64_t v21 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v19, v20, v21);
        swift_storeEnumTagMultiPayload(a1, a3, 1LL);
        break;
      case 2u:
        uint64_t v22 = *(void *)a2;
        swift_errorRetain(*(void *)a2);
        *(void *)a1 = v22;
        a1[8] = a2[8];
        swift_storeEnumTagMultiPayload(a1, a3, 2LL);
        break;
      case 3u:
        uint64_t v23 = *(void *)a2;
        char v24 = a2[8];
        sub_245D0(v23, v24);
        *(void *)a1 = v23;
        a1[8] = v24;
        swift_storeEnumTagMultiPayload(a1, a3, 3LL);
        break;
      default:
        memcpy(a1, a2, *(void *)(v5 + 64));
        break;
    }
  }

  return a1;
}

uint64_t sub_245D0(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_245DC(void *a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  switch((int)result)
  {
    case 0:
      uint64_t v4 = type metadata accessor for SessionClientMessage(0LL);
      (*(void (**)(void *, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
      uint64_t v5 = (char *)a1 + *(int *)(sub_494C(&qword_3D1E8) + 48);
      uint64_t v6 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      uint64_t v7 = *(void *)(v6 - 8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6);
      if (!(_DWORD)result)
      {
        uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
        uint64_t v12 = v5;
        uint64_t v10 = v6;
        goto LABEL_8;
      }

      break;
    case 1:
      uint64_t v8 = type metadata accessor for SessionServerMessage(0LL);
      (*(void (**)(void *, uint64_t))(*(void *)(v8 - 8) + 8LL))(a1, v8);
      uint64_t v9 = (char *)a1 + *(int *)(sub_494C(qword_3D580) + 48);
      uint64_t v10 = type metadata accessor for StatementID(0LL);
      uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8LL);
      uint64_t v12 = v9;
LABEL_8:
      uint64_t result = v11(v12, v10);
      break;
    case 2:
      uint64_t result = swift_errorRelease(*a1);
      break;
    case 3:
      uint64_t result = sub_24714(*a1, *((_BYTE *)a1 + 8));
      break;
    default:
      return result;
  }

  return result;
}

uint64_t sub_24714(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return swift_errorRelease();
  }
  return result;
}

char *sub_24720(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      uint64_t v6 = type metadata accessor for SessionClientMessage(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      uint64_t v7 = *(int *)(sub_494C(&qword_3D1E8) + 48);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10))
      {
        uint64_t v12 = sub_494C(&qword_3D4B0);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
      }

      uint64_t v18 = a1;
      uint64_t v19 = a3;
      uint64_t v20 = 0LL;
      goto LABEL_10;
    case 1u:
      uint64_t v13 = type metadata accessor for SessionServerMessage(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(a1, a2, v13);
      uint64_t v14 = *(int *)(sub_494C(qword_3D580) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      uint64_t v17 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v15, v16, v17);
      uint64_t v18 = a1;
      uint64_t v19 = a3;
      uint64_t v20 = 1LL;
      goto LABEL_10;
    case 2u:
      uint64_t v21 = *(void *)a2;
      swift_errorRetain(*(void *)a2);
      *(void *)a1 = v21;
      a1[8] = a2[8];
      uint64_t v18 = a1;
      uint64_t v19 = a3;
      uint64_t v20 = 2LL;
      goto LABEL_10;
    case 3u:
      uint64_t v22 = *(void *)a2;
      char v23 = a2[8];
      sub_245D0(v22, v23);
      *(void *)a1 = v22;
      a1[8] = v23;
      uint64_t v18 = a1;
      uint64_t v19 = a3;
      uint64_t v20 = 3LL;
LABEL_10:
      swift_storeEnumTagMultiPayload(v18, v19, v20);
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      break;
  }

  return a1;
}

char *sub_2491C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        uint64_t v7 = type metadata accessor for SessionClientMessage(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
        uint64_t v8 = *(int *)(sub_494C(&qword_3D1E8) + 48);
        uint64_t v9 = &a1[v8];
        uint64_t v10 = &a2[v8];
        uint64_t v11 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
        uint64_t v12 = *(void *)(v11 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11))
        {
          uint64_t v13 = sub_494C(&qword_3D4B0);
          memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64LL));
        }

        else
        {
          (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
        }

        uint64_t v19 = a1;
        uint64_t v20 = a3;
        uint64_t v21 = 0LL;
        goto LABEL_11;
      case 1u:
        uint64_t v14 = type metadata accessor for SessionServerMessage(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(a1, a2, v14);
        uint64_t v15 = *(int *)(sub_494C(qword_3D580) + 48);
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        uint64_t v18 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16LL))(v16, v17, v18);
        uint64_t v19 = a1;
        uint64_t v20 = a3;
        uint64_t v21 = 1LL;
        goto LABEL_11;
      case 2u:
        uint64_t v22 = *(void *)a2;
        swift_errorRetain(*(void *)a2);
        *(void *)a1 = v22;
        a1[8] = a2[8];
        uint64_t v19 = a1;
        uint64_t v20 = a3;
        uint64_t v21 = 2LL;
        goto LABEL_11;
      case 3u:
        uint64_t v23 = *(void *)a2;
        char v24 = a2[8];
        sub_245D0(v23, v24);
        *(void *)a1 = v23;
        a1[8] = v24;
        uint64_t v19 = a1;
        uint64_t v20 = a3;
        uint64_t v21 = 3LL;
LABEL_11:
        swift_storeEnumTagMultiPayload(v19, v20, v21);
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }

  return a1;
}

char *sub_24B30(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v14 = type metadata accessor for SessionServerMessage(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(a1, a2, v14);
    uint64_t v15 = *(int *)(sub_494C(qword_3D580) + 48);
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = type metadata accessor for StatementID(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32LL))(v16, v17, v18);
    uint64_t v19 = a1;
    uint64_t v20 = a3;
    uint64_t v21 = 1LL;
LABEL_9:
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    return a1;
  }

  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = type metadata accessor for SessionClientMessage(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(sub_494C(&qword_3D1E8) + 48);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11))
    {
      uint64_t v13 = sub_494C(&qword_3D4B0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
    }

    uint64_t v19 = a1;
    uint64_t v20 = a3;
    uint64_t v21 = 0LL;
    goto LABEL_9;
  }

  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  return a1;
}

char *sub_24CC0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(a1, a3);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v15 = type metadata accessor for SessionServerMessage(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32LL))(a1, a2, v15);
      uint64_t v16 = *(int *)(sub_494C(qword_3D580) + 48);
      uint64_t v17 = &a1[v16];
      uint64_t v18 = &a2[v16];
      uint64_t v19 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))(v17, v18, v19);
      uint64_t v20 = a1;
      uint64_t v21 = a3;
      uint64_t v22 = 1LL;
LABEL_10:
      swift_storeEnumTagMultiPayload(v20, v21, v22);
      return a1;
    }

    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = type metadata accessor for SessionClientMessage(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
      uint64_t v9 = *(int *)(sub_494C(&qword_3D1E8) + 48);
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12))
      {
        uint64_t v14 = sub_494C(&qword_3D4B0);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0LL, 1LL, v12);
      }

      uint64_t v20 = a1;
      uint64_t v21 = a3;
      uint64_t v22 = 0LL;
      goto LABEL_10;
    }

    memcpy(a1, a2, *(void *)(v6 + 64));
  }

  return a1;
}

void sub_24E68(uint64_t a1)
{
  if (!qword_3D608)
  {
    uint64_t v2 = type metadata accessor for RequestSummary.ExecutionSource(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_3D608);
    }
  }

unint64_t sub_24EC0()
{
  unint64_t result = qword_3D610[0];
  if (!qword_3D610[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_31768, &type metadata for ValueResolutionMode);
    atomic_store(result, qword_3D610);
  }

  return result;
}

uint64_t sub_24F04()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_24F24()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

void (*sub_24F44(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = SiriEnvironmentLocating<>.siriEnvironment.modify();
  return sub_24FA4;
}

void sub_24FA4(void *a1)
{
  __int16 v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t sub_24FD0(uint64_t a1)
{
  return sub_1AD5C(a1) & 1;
}

uint64_t sub_24FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2505C;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_2505C(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_250AC(uint64_t a1, uint64_t a2)
{
  return sub_23AF8(a1, a2);
}

uint64_t sub_250CC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_3D62C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6918;
  return sub_1C700(a1, v4, v5, v6);
}

uint64_t sub_25120@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1A158();
  *(void *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

BOOL sub_25154(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_2516C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_251B0()
{
}

Swift::Int sub_251D8(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_25218(uint64_t a1)
{
  return swift_getWitnessTable(&unk_31790, a1);
}

uint64_t sub_25228(uint64_t a1)
{
  return swift_getWitnessTable(&unk_317E8, a1);
}

uint64_t sub_25238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriEnvironment.currentRequest.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25260(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return SiriEnvironment.currentRequest.setter(v1);
}

uint64_t sub_25288@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A070();
  *a1 = result;
  return result;
}

uint64_t sub_252B0(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

void sub_252D0(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *a1 + 8;
  if (v6) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0LL;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  uint64_t v9 = *a2;
  if (*a2)
  {
    *uint64_t v9 = v7;
    *a2 = v9 + 1;
  }

  else
  {
  }

uint64_t sub_25380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of CustomStringConvertible.description.getter(a2, a3);
}

uint64_t sub_253A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IFFlowError(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_253EC(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 208);
  swift_beginAccess(v4, v11, 33LL, 0LL);
  uint64_t v6 = type metadata accessor for IFFlow.State(0LL, *(void *)(v3 + 80), *(void *)(v3 + 88), v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(v4, a1, v6);
  uint64_t v7 = swift_endAccess(v11);
  sub_1A8E0(v7, v8, v9, v10);
}

uint64_t sub_2546C(char *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for StatementID(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SessionServerMessage(0LL) - 8) + 80LL);
  return sub_23400(a1, *(void *)(v1 + 32), v1 + v4, v1 + ((v4 + v5 + v6) & ~v6));
}

uint64_t sub_254DC(uint64_t a1)
{
  return sub_2567C(a1, (uint64_t (*)(uint64_t, void, unint64_t, unint64_t))sub_23354);
}

uint64_t sub_254EC(uint64_t a1)
{
  return sub_2567C(a1, (uint64_t (*)(uint64_t, void, unint64_t, unint64_t))sub_23294);
}

uint64_t sub_254F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriEnvironment.currentRequest.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25520(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return SiriEnvironment.currentRequest.setter(v1);
}

uint64_t sub_25548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.utterance.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25570(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_76A8(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_255B4()
{
  uint64_t v1 = type metadata accessor for StatementID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for SessionServerMessage(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_25670(uint64_t a1)
{
  return sub_2567C(a1, (uint64_t (*)(uint64_t, void, unint64_t, unint64_t))sub_231E4);
}

uint64_t sub_2567C(uint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t, unint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for StatementID(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SessionServerMessage(0LL) - 8) + 80LL);
  return a2(a1, *(void *)(v2 + 32), v2 + v5, v2 + ((v5 + v6 + v7) & ~v7));
}

uint64_t sub_256F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A070();
  *a1 = result;
  return result;
}

uint64_t sub_25720()
{
  return 16LL;
}

__n128 sub_2572C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

unint64_t sub_25738()
{
  unint64_t result = qword_3D720;
  if (!qword_3D720)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___BMSiriRequestContext);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_3D720);
  }

  return result;
}

uint64_t sub_25774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A08C();
  *a1 = result;
  return result;
}

uint64_t sub_2579C()
{
  return 16LL;
}

__n128 sub_257A8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_257B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_257E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ActionFailure.Failure(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_3D730);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for InterpretedStatementResult(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = SystemResponse.interpretedStatementResults.getter(v11);
  uint64_t v15 = v14;
  if (*(void *)(v14 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))( v8,  v14 + ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)),  v9);
    uint64_t v16 = 0LL;
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v16, 1LL, v9);
  swift_bridgeObjectRelease(v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1LL, v9) == 1)
  {
    sub_25AFC((uint64_t)v8);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for ActionFailure.Failure.actionCanceled(_:),  v2);
    ActionFailure.init(failure:)(v5);
    uint64_t v17 = enum case for StatementOutcome.failure(_:);
    uint64_t v18 = type metadata accessor for StatementOutcome(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104LL))(a1, v17, v18);
  }

  else
  {
    uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
    InterpretedStatementResult.outcome.getter(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }

uint64_t sub_259D0()
{
  uint64_t v0 = sub_494C(&qword_3D730);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = SystemResponse.interpretedStatementResults.getter(v1);
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = type metadata accessor for InterpretedStatementResult(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (v5)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))( v3,  v4 + ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)),  v6);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v3, v8, 1LL, v6);
  swift_bridgeObjectRelease(v4);
  type metadata accessor for InterpretedStatementResult(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v3, 1LL, v6) == 1)
  {
    sub_25AFC((uint64_t)v3);
    return 0LL;
  }

  else
  {
    uint64_t v9 = InterpretedStatementResult.toolId.getter();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v3, v6);
  }

  return v9;
}

uint64_t sub_25AFC(uint64_t a1)
{
  uint64_t v2 = sub_494C(&qword_3D730);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_25B3C()
{
  uint64_t v0 = sub_494C(&qword_3D730);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for InterpretedStatementResult(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = SystemResponse.interpretedStatementResults.getter(v5);
  uint64_t v9 = v8;
  if (*(void *)(v8 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))( v2,  v8 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)),  v3);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, v10, 1LL, v3);
  swift_bridgeObjectRelease(v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1LL, v3) == 1)
  {
    sub_25AFC((uint64_t)v2);
    return StatementID.init(index:name:)(1LL, 0LL, 0LL);
  }

  else
  {
    uint64_t v12 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(v7, v2, v3);
    InterpretedStatementResult.originProgramStatementID.getter(v12);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

uint64_t sub_25CA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  LODWORD(v160) = a4;
  uint64_t v172 = a3;
  uint64_t v156 = a2;
  v178 = a5;
  uint64_t v177 = *v5;
  uint64_t v159 = type metadata accessor for SystemResponse(0LL);
  uint64_t v158 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  Swift::String v157 = (char *)&v144 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v171 = type metadata accessor for MessagePayload(0LL);
  uint64_t v169 = *(void *)(v171 - 8);
  uint64_t v8 = __chkstk_darwin(v171);
  uint64_t v170 = (char *)&v144 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v144 - v10;
  uint64_t v12 = sub_494C(&qword_3D1D0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v144 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v153 = type metadata accessor for StatementID(0LL);
  uint64_t v152 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  uint64_t v151 = (char *)&v144 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v150 = type metadata accessor for SystemPromptResolution.UserAction(0LL);
  uint64_t v149 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v17 = (char *)&v144 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for UUID(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v175 = v18;
  uint64_t v176 = v19;
  __chkstk_darwin(v18);
  uint64_t v168 = (char *)&v144 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v155 = type metadata accessor for SystemPromptResolution(0LL);
  uint64_t v154 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  uint64_t v148 = (char *)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for TypedValue(0LL);
  uint64_t v164 = *(void *)(v22 - 8);
  uint64_t v165 = v22;
  __chkstk_darwin(v22);
  char v24 = (uint64_t *)((char *)&v144 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v25 = sub_494C(&qword_3D0C0);
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v144 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v28);
  Swift::String v167 = (char *)&v144 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = sub_494C(&qword_3D0D0);
  __chkstk_darwin(v30);
  unint64_t v166 = (char *)&v144 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v162 = type metadata accessor for MessagePayload.RequestContent(0LL);
  uint64_t v161 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  uint64_t v163 = (char *)&v144 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = type metadata accessor for MessagePayload.Request(0LL);
  uint64_t v173 = *(void *)(v33 - 8);
  uint64_t v174 = v33;
  __chkstk_darwin(v33);
  uint64_t v179 = (char *)&v144 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = sub_494C(&qword_3D818);
  uint64_t v36 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v38 = (uint64_t *)((char *)&v144 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(void *, uint64_t, uint64_t))(v36 + 16))(v38, a1, v35);
  int v39 = (*(uint64_t (**)(void *, uint64_t))(v36 + 88))(v38, v35);
  if (v39 == enum case for PromptResult.answered<A>(_:))
  {
    (*(void (**)(void *, uint64_t))(v36 + 96))(v38, v35);
    uint64_t v41 = *v38;
    uint64_t v40 = v38[1];
    uint64_t v147 = v11;
    uint64_t v146 = v27;
    if ((v160 & 1) != 0)
    {
      uint64_t v69 = v176;
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v70 = type metadata accessor for Logger(0LL);
      uint64_t v71 = sub_458C(v70, (uint64_t)qword_3E310);
      uint64_t v72 = (os_log_s *)Logger.logObject.getter(v71);
      os_log_type_t v73 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v74 = 0;
        _os_log_impl( &dword_0,  v72,  v73,  "IFFlow.valueResolutionMode == .stringValue; passing prompt response to IF as a resolved parameter value",
          v74,
          2u);
        swift_slowDealloc(v74, -1LL, -1LL);
      }

      uint64_t v75 = type metadata accessor for TypedValue.PrimitiveValue(0LL);
      uint64_t v76 = swift_allocBox();
      *uint64_t v77 = v41;
      v77[1] = v40;
      (*(void (**)(void *, void, uint64_t))(*(void *)(v75 - 8) + 104LL))( v77,  enum case for TypedValue.PrimitiveValue.string(_:),  v75);
      *char v24 = v76;
      uint64_t v78 = *(void (**)(uint64_t *, void, uint64_t))(v164 + 104);
      uint64_t v79 = v164;
      uint64_t v80 = v24;
      uint64_t v145 = v24;
      uint64_t v81 = v165;
      v78(v24, enum case for TypedValue.primitive(_:), v165);
      unint64_t v160 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
      uint64_t v82 = v167;
      uint64_t v83 = v175;
      uint64_t v84 = v160(v167, 1LL, 1LL, v175);
      uint64_t v85 = v168;
      SessionServerMessage.eventId.getter(v84);
      (*(void (**)(char *, uint64_t *, uint64_t))(v79 + 16))(v17, v80, v81);
      (*(void (**)(char *, void, uint64_t))(v149 + 104))( v17,  enum case for SystemPromptResolution.UserAction.parameterValueSelected(_:),  v150);
      uint64_t v86 = v151;
      (*(void (**)(char *, uint64_t, uint64_t))(v152 + 16))(v151, v156, v153);
      uint64_t v87 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
      uint64_t v88 = type metadata accessor for SystemPromptResolution.ResolutionInput(0LL);
      uint64_t v89 = *(void *)(v88 - 8);
      uint64_t v90 = v87;
      uint64_t v63 = (uint64_t)v85;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 104))(v14, v90, v88);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v89 + 56))(v14, 0LL, 1LL, v88);
      uint64_t v91 = v148;
      SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)( v82,  v85,  v17,  v86,  v14);
      uint64_t v92 = v154;
      uint64_t v93 = v163;
      uint64_t v94 = v155;
      (*(void (**)(char *, char *, uint64_t))(v154 + 16))(v163, v91, v155);
      (*(void (**)(char *, void, uint64_t))(v161 + 104))( v93,  enum case for MessagePayload.RequestContent.promptResolution(_:),  v162);
      uint64_t v95 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
      uint64_t v96 = v166;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56LL))(v166, 1LL, 1LL, v95);
      v160(v82, 1LL, 1LL, v83);
      uint64_t v97 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
      uint64_t v98 = v146;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56LL))(v146, 1LL, 1LL, v97);
      uint64_t v44 = v179;
      MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v93,  0LL,  0LL,  v96,  v82,  v98);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v94);
      (*(void (**)(uint64_t *, uint64_t))(v164 + 8))(v145, v165);
      uint64_t v51 = v170;
      uint64_t v50 = v171;
      uint64_t v52 = v169;
    }

    else
    {
      uint64_t v42 = v41;
      uint64_t v43 = v40;
      uint64_t v44 = v179;
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v45 = type metadata accessor for Logger(0LL);
      uint64_t v46 = sub_458C(v45, (uint64_t)qword_3E310);
      uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
      os_log_type_t v48 = static os_log_type_t.debug.getter();
      BOOL v49 = os_log_type_enabled(v47, v48);
      uint64_t v51 = v170;
      uint64_t v50 = v171;
      uint64_t v52 = v169;
      uint64_t v53 = v175;
      if (v49)
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v54 = 0;
        _os_log_impl( &dword_0,  v47,  v48,  "IFFlow.valueResolutionMode == .passthrough; passing prompt response back to planner unresolved",
          v54,
          2u);
        uint64_t v55 = v54;
        uint64_t v44 = v179;
        swift_slowDealloc(v55, -1LL, -1LL);
      }

      uint64_t v56 = v43;
      swift_bridgeObjectRetain(v43);
      uint64_t v57 = v163;
      MessagePayload.RequestContent.TextContent.init(text:)(v42, v56);
      (*(void (**)(char *, void, uint64_t))(v161 + 104))( v57,  enum case for MessagePayload.RequestContent.text(_:),  v162);
      uint64_t v58 = type metadata accessor for MessagePayload.RequestPrescribedPlan(0LL);
      uint64_t v59 = v166;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56LL))(v166, 1LL, 1LL, v58);
      uint64_t v60 = v167;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v176 + 56))(v167, 1LL, 1LL, v53);
      uint64_t v61 = type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata(0LL);
      uint64_t v62 = v146;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56LL))(v146, 1LL, 1LL, v61);
      MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)( v57,  0LL,  0LL,  v59,  v60,  v62);
      swift_bridgeObjectRelease(v56);
      uint64_t v63 = (uint64_t)v168;
    }

    uint64_t v99 = sub_494C(&qword_3D1E8);
    uint64_t v100 = v178;
    uint64_t v101 = (uint64_t)v178 + *(int *)(v99 + 48);
    SessionServerMessage.sessionId.getter();
    uint64_t v102 = (uint64_t)v147;
    (*(void (**)(char *, char *, uint64_t))(v173 + 16))(v147, v44, v174);
    (*(void (**)(uint64_t, void, uint64_t))(v52 + 104))(v102, enum case for MessagePayload.request(_:), v50);
    sub_19E2C(v63, v102);
    uint64_t v103 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v103(v102, v50);
    uint64_t v104 = (*(uint64_t (**)(uint64_t, uint64_t))(v176 + 8))(v63, v175);
    SessionServerMessage.payload.getter(v104);
    if ((*(unsigned int (**)(char *, uint64_t))(v52 + 88))(v51, v50) == enum case for MessagePayload.systemResponse(_:))
    {
      (*(void (**)(char *, uint64_t))(v52 + 96))(v51, v50);
      uint64_t v105 = v158;
      uint64_t v106 = (uint64_t)v157;
      uint64_t v107 = v159;
      (*(void (**)(char *, char *, uint64_t))(v158 + 32))(v157, v51, v159);
      sub_3E74(v106, v101);
      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v106, v107);
      uint64_t v108 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v108 - 8) + 56LL))(v101, 0LL, 1LL, v108);
    }

    else
    {
      v103((uint64_t)v51, v50);
      uint64_t v117 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56LL))(v101, 1LL, 1LL, v117);
    }

    (*(void (**)(char *, uint64_t))(v173 + 8))(v179, v174);
    uint64_t v67 = type metadata accessor for IFFlow.State(0LL, *(void *)(v177 + 80), *(void *)(v177 + 88), v118);
    uint64_t v68 = v100;
    uint64_t v116 = 0LL;
    return swift_storeEnumTagMultiPayload(v68, v67, v116);
  }

  if (v39 == enum case for PromptResult.error<A>(_:))
  {
    (*(void (**)(void *, uint64_t))(v36 + 96))(v38, v35);
    char v64 = *((_BYTE *)v38 + 8);
    uint64_t v65 = v178;
    uint64_t *v178 = *v38;
    *((_BYTE *)v65 + 8) = (v64 & 1) == 0;
    uint64_t v67 = type metadata accessor for IFFlow.State(0LL, *(void *)(v177 + 80), *(void *)(v177 + 88), v66);
    uint64_t v68 = v65;
LABEL_31:
    uint64_t v116 = 2LL;
    return swift_storeEnumTagMultiPayload(v68, v67, v116);
  }

  if (v39 == enum case for PromptResult.cancelled<A>(_:))
  {
    uint64_t v109 = v178;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v110 = type metadata accessor for Logger(0LL);
    uint64_t v111 = sub_458C(v110, (uint64_t)qword_3E310);
    uint64_t v112 = (os_log_s *)Logger.logObject.getter(v111);
    os_log_type_t v113 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v112, v113))
    {
      id v114 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v114 = 0;
      _os_log_impl(&dword_0, v112, v113, "Exiting IFFlow, received userCancelled", v114, 2u);
      swift_slowDealloc(v114, -1LL, -1LL);
    }

    uint64_t *v109 = 0LL;
    *((_BYTE *)v109 + 8) = 0;
    uint64_t v67 = type metadata accessor for IFFlow.State(0LL, *(void *)(v177 + 80), *(void *)(v177 + 88), v115);
    uint64_t v68 = v109;
    uint64_t v116 = 3LL;
    return swift_storeEnumTagMultiPayload(v68, v67, v116);
  }

  if (v39 == enum case for PromptResult.unanswered<A>(_:))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v119 = type metadata accessor for Logger(0LL);
    uint64_t v120 = sub_458C(v119, (uint64_t)qword_3E310);
    uint64_t v121 = (os_log_s *)Logger.logObject.getter(v120);
    os_log_type_t v122 = static os_log_type_t.debug.getter();
    BOOL v123 = os_log_type_enabled(v121, v122);
    uint64_t v124 = v178;
    if (v123)
    {
      uint64_t v125 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v125 = 0;
      _os_log_impl(&dword_0, v121, v122, "Exiting IFFlow, received .unaswered from PromptForValueFlow", v125, 2u);
      swift_slowDealloc(v125, -1LL, -1LL);
    }

    uint64_t v126 = type metadata accessor for IFFlowError(0LL);
    uint64_t v127 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
    uint64_t v128 = swift_allocError(v126, v127, 0LL, 0LL);
    *uint64_t v129 = 0;
    swift_storeEnumTagMultiPayload(v129, v126, 6LL);
    *uint64_t v124 = v128;
    *((_BYTE *)v124 + 8) = 1;
    uint64_t v67 = type metadata accessor for IFFlow.State(0LL, *(void *)(v177 + 80), *(void *)(v177 + 88), v130);
    uint64_t v68 = v124;
    goto LABEL_31;
  }

  uint64_t v132 = type metadata accessor for IFFlowError(0LL);
  uint64_t v133 = sub_5E50((unint64_t *)&qword_3D0E0, type metadata accessor for IFFlowError, (uint64_t)&unk_311D8);
  uint64_t v134 = swift_allocError(v132, v133, 0LL, 0LL);
  uint64_t v136 = v135;
  unint64_t v180 = 0LL;
  unint64_t v181 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(35LL);
  swift_bridgeObjectRelease(v181);
  unint64_t v180 = 0xD000000000000021LL;
  unint64_t v181 = 0x8000000000033540LL;
  unint64_t v137 = sub_27748();
  v138._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v35, v137);
  object = v138._object;
  String.append(_:)(v138);
  swift_bridgeObjectRelease(object);
  unint64_t v140 = v181;
  *uint64_t v136 = v180;
  v136[1] = v140;
  swift_storeEnumTagMultiPayload(v136, v132, 4LL);
  uint64_t v141 = v178;
  uint64_t *v178 = v134;
  *((_BYTE *)v141 + 8) = 1;
  uint64_t v143 = type metadata accessor for IFFlow.State(0LL, *(void *)(v177 + 80), *(void *)(v177 + 88), v142);
  swift_storeEnumTagMultiPayload(v141, v143, 2LL);
  return (*(uint64_t (**)(void *, uint64_t))(v36 + 8))(v38, v35);
}

uint64_t sub_26B28()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_319F0);
  uint64_t v2 = swift_getKeyPath(&unk_31A18);
  uint64_t v4 = v0;
  swift_retain(v0);
  static SiriEnvironmentValue.subscript.getter(&v5, &v4, KeyPath, v2);
  swift_release(v0);
  swift_release(KeyPath);
  swift_release(v2);
  return v5;
}

uint64_t sub_26BC0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Input(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v8 = *(unsigned __int8 *)(v2 + 56);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if (v8 == 1)
  {
    char v9 = sub_10034();
    uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if ((v9 & 1) != 0) {
      return static ActionForInput.cancel()(v10);
    }
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_26D68();
  if (v12)
  {
    uint64_t v13 = swift_bridgeObjectRelease(v12);
    return static ActionForInput.handle()(v13);
  }

  else
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    uint64_t v15 = sub_458C(v14, (uint64_t)qword_3E310);
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_0, v16, v17, "IFFlow not accepting input. No supported utterance found.", v18, 2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    return static ActionForInput.ignore()(v19);
  }

uint64_t sub_26D68()
{
  uint64_t v39 = type metadata accessor for Logger(0LL);
  uint64_t v41 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v38 = (char *)&v34 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v1 = type metadata accessor for NLRouterParse.InputCandidate(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (uint64_t *)((char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Parse(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v11);
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v13, v9) == enum case for Parse.nlRouter(_:))
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v13, v9);
    uint64_t v14 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v8, v13, v5);
    NLRouterParse.input.getter(v14);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v2 + 88))(v4, v1) == enum case for NLRouterParse.InputCandidate.text(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v4, v1);
      uint64_t v15 = *v4;
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t))(v2 + 8))(v4, v1);
      uint64_t v15 = 0LL;
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  else
  {
    uint64_t v36 = v10;
    uint64_t v37 = v9;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v16 = v39;
    uint64_t v17 = sub_458C(v39, (uint64_t)qword_3E310);
    uint64_t v18 = v41;
    uint64_t v19 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v38, v17, v16);
    uint64_t v20 = v40;
    uint64_t v21 = swift_retain_n(v40, 2LL);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    int v24 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      int v35 = v24;
      uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = swift_slowAlloc(32LL, -1LL);
      uint64_t v43 = v34;
      *(_DWORD *)uint64_t v25 = 136315138;
      sub_494C(&qword_3D6E0);
      uint64_t KeyPath = swift_getKeyPath(&unk_319F0);
      uint64_t v27 = swift_getKeyPath(&unk_31A18);
      uint64_t v42 = v20;
      swift_retain(v20);
      static SiriEnvironmentValue.subscript.getter(&v44, &v42, KeyPath, v27);
      swift_release(v20);
      swift_release(KeyPath);
      swift_release(v27);
      if (v45) {
        uint64_t v28 = v44;
      }
      else {
        uint64_t v28 = 7104878LL;
      }
      if (v45) {
        unint64_t v29 = v45;
      }
      else {
        unint64_t v29 = 0xE300000000000000LL;
      }
      uint64_t v44 = sub_12A3C(v28, v29, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
      swift_release_n(v20, 2LL);
      swift_bridgeObjectRelease(v29);
      _os_log_impl( &dword_0,  v22,  (os_log_type_t)v35,  "IFFlow value prompt received direct SiriX input instead of NLRouterParse. Using observed utterance from environment (%s)",  v25,  0xCu);
      uint64_t v30 = v34;
      swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v16);
    }

    else
    {

      swift_release_n(v20, 2LL);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v16);
    }

    sub_494C(&qword_3D6E0);
    uint64_t v31 = swift_getKeyPath(&unk_319F0);
    uint64_t v32 = swift_getKeyPath(&unk_31A18);
    uint64_t v43 = v20;
    swift_retain(v20);
    static SiriEnvironmentValue.subscript.getter(&v44, &v43, v31, v32);
    swift_release(v20);
    swift_release(v31);
    swift_release(v32);
    uint64_t v15 = v44;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v37);
  }

  return v15;
}

uint64_t sub_271FC(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = type metadata accessor for Input(0LL);
  v2[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[6] = v4;
  v2[7] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_2725C, 0LL, 0LL);
}

uint64_t sub_2725C()
{
  uint64_t v1 = sub_26D68();
  uint64_t v3 = v2;
  if (!v2)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v6 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 24);
    uint64_t v8 = type metadata accessor for Logger(0LL);
    sub_458C(v8, (uint64_t)qword_3E310);
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.error.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 56);
    uint64_t v14 = *(void *)(v0 + 40);
    if (v12)
    {
      uint64_t v21 = *(void *)(v0 + 48);
      os_log_type_t type = v11;
      uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v22 = swift_slowAlloc(32LL, -1LL);
      uint64_t v24 = v22;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v16 = sub_5E50( &qword_3D0E8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
      uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter(v14, v16);
      unint64_t v19 = v18;
      *(void *)(v0 + 16) = sub_12A3C(v17, v18, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
      swift_bridgeObjectRelease(v19);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v13, v14);
      _os_log_impl( &dword_0,  v10,  type,  "Unexpectedly found nil criticalInfoValueResponse in %s (why didn't actionForInput ignore?)",  v15,  0xCu);
      swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 48) + 8LL))(*(void *)(v0 + 56), *(void *)(v0 + 40));
    }
  }

  swift_task_dealloc(*(void *)(v0 + 56));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v3);
}

uint64_t sub_27488()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t type metadata accessor for CriticalInfoPromptStrategy()
{
  return objc_opt_self(&OBJC_CLASS____TtC12IFFlowPlugin26CriticalInfoPromptStrategy);
}

uint64_t sub_274D8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc(dword_3D82C);
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_27528;
  return sub_271FC(a2);
}

uint64_t sub_27528(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *(void *)(*v3 + 24);
  uint64_t v8 = *v3;
  swift_task_dealloc(v7);
  if (!v2)
  {
    uint64_t v9 = *(void **)(v6 + 16);
    *uint64_t v9 = a1;
    v9[1] = a2;
  }

  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_27588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse()[1]);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_770C;
  return PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse()(a1, v7, a3);
}

uint64_t sub_275F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence()[1]);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_770C;
  return PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence()(a1, v7, a3);
}

uint64_t sub_27660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PromptForValueFlowStrategyAsync.makeFlowCancelledResponse()[1]);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_6918;
  return PromptForValueFlowStrategyAsync.makeFlowCancelledResponse()(a1, v7, a3);
}

uint64_t sub_276CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to PromptForValueFlowStrategyAsync.makeErrorResponse(_:)[1]);
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_770C;
  return PromptForValueFlowStrategyAsync.makeErrorResponse(_:)(a1, a2, v9, a4);
}

unint64_t sub_27748()
{
  unint64_t result = qword_3D820;
  if (!qword_3D820)
  {
    uint64_t v1 = sub_76A8(&qword_3D818);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for PromptResult<A>, v1);
    atomic_store(result, &qword_3D820);
  }

  return result;
}

double sub_27794@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_494C(&qword_3D6E0);
  uint64_t KeyPath = swift_getKeyPath(&unk_319F0);
  uint64_t v5 = swift_getKeyPath(&unk_31A18);
  uint64_t v7 = v3;
  swift_retain(v3);
  static SiriEnvironmentValue.subscript.getter(&v8, &v7, KeyPath, v5);
  swift_release(v3);
  swift_release(KeyPath);
  swift_release(v5);
  double result = *(double *)&v8;
  *a2 = v8;
  return result;
}

void sub_27840( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2
    || (uint64_t v9 = v8,
        (uint64_t v16 = ((uint64_t (*)(void))dispatch thunk of InstrumentationUtil.convertUUIDStringToSISchemaUUID(uuidStr:))()) == 0))
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v25 = type metadata accessor for Logger(0LL);
    uint64_t v26 = sub_458C(v25, (uint64_t)qword_3E310);
    uint64_t v54 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v29 = swift_slowAlloc(32LL, -1LL);
      uint64_t v56 = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v55 = sub_12A3C(0xD00000000000004BLL, 0x8000000000033EE0LL, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
      _os_log_impl(&dword_0, v54, v27, "The plannerTraceId is nil or not a valid UUID, stopping %s", v28, 0xCu);
      swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);

      return;
    }

    goto LABEL_39;
  }

  uint64_t v54 = (os_log_s *)v16;
  if (!a6)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v30 = type metadata accessor for Logger(0LL);
    uint64_t v31 = sub_458C(v30, (uint64_t)qword_3E310);
    unint64_t v18 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v18, v32)) {
      goto LABEL_38;
    }
    uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v34 = swift_slowAlloc(32LL, -1LL);
    uint64_t v56 = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v55 = sub_12A3C(0xD00000000000004BLL, 0x8000000000033EE0LL, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
    int v35 = "Could not build wrapper for %s because rootRequest is nil";
    goto LABEL_26;
  }

  uint64_t v17 = (os_log_s *)dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:logResourceUtilization:)( a5,  a6,  0LL);
  if (!v17)
  {
LABEL_22:
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v36 = type metadata accessor for Logger(0LL);
    uint64_t v37 = sub_458C(v36, (uint64_t)qword_3E310);
    unint64_t v18 = (os_log_s *)Logger.logObject.getter(v37);
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v18, v32)) {
      goto LABEL_38;
    }
    uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v34 = swift_slowAlloc(32LL, -1LL);
    uint64_t v56 = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v55 = sub_12A3C(0xD00000000000004BLL, 0x8000000000033EE0LL, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
    int v35 = "Could not build wrapper or eventMetadata when logging %s";
LABEL_26:
    _os_log_impl(&dword_0, v18, v32, v35, v33, 0xCu);
    swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1LL, -1LL);
    swift_slowDealloc(v33, -1LL, -1LL);

    return;
  }

  unint64_t v18 = v17;
  id v19 = -[os_log_s eventMetadata](v17, "eventMetadata");

  if (!v19)
  {

    goto LABEL_22;
  }

  if (!a4)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    uint64_t v39 = sub_458C(v38, (uint64_t)qword_3E310);
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v43 = swift_slowAlloc(32LL, -1LL);
      uint64_t v56 = v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      uint64_t v55 = sub_12A3C(0xD00000000000004BLL, 0x8000000000033EE0LL, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
      uint64_t v44 = "The requestId is nil, stopping %s";
LABEL_35:
      _os_log_impl(&dword_0, v40, v41, v44, v42, 0xCu);
      swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1LL, -1LL);
      swift_slowDealloc(v42, -1LL, -1LL);

LABEL_36:
      return;
    }

    goto LABEL_37;
  }

  uint64_t v20 = dispatch thunk of InstrumentationUtil.convertUUIDStringToSISchemaUUID(uuidStr:)(a3, a4);
  if (!v20)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v45 = type metadata accessor for Logger(0LL);
    uint64_t v46 = sub_458C(v45, (uint64_t)qword_3E310);
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v43 = swift_slowAlloc(32LL, -1LL);
      uint64_t v56 = v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      uint64_t v55 = sub_12A3C(0xD00000000000004BLL, 0x8000000000033EE0LL, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
      uint64_t v44 = "The requestId is not a valid UUID, stop %s";
      goto LABEL_35;
    }

LABEL_37:
LABEL_38:
    goto LABEL_39;
  }

  uint64_t v21 = (void *)v20;
  id v22 = [objc_allocWithZone(ORCHSchemaORCHIntelligenceFlowQuerySent) init];
  if (!v22)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v47 = type metadata accessor for Logger(0LL);
    uint64_t v48 = sub_458C(v47, (uint64_t)qword_3E310);
    uint64_t v40 = (os_log_s *)Logger.logObject.getter(v48);
    os_log_type_t v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v51 = swift_slowAlloc(32LL, -1LL);
      uint64_t v56 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v55 = sub_12A3C(0xD00000000000004BLL, 0x8000000000033EE0LL, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
      _os_log_impl(&dword_0, v40, v49, "Could not build schema event for %s", v50, 0xCu);
      swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1LL, -1LL);
      swift_slowDealloc(v50, -1LL, -1LL);

      goto LABEL_36;
    }

LABEL_39:
    return;
  }

  id v52 = v22;
  if (a8)
  {
    uint64_t v23 = dispatch thunk of InstrumentationUtil.convertUUIDStringToSISchemaUUID(uuidStr:)(a7, a8);
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      [v52 setTrpId:v23];
    }
  }

  objc_msgSend(v52, "setTraceId:", v54, v52);
  [v53 setSubRequestId:v21];
  -[os_log_s setIntelligenceFlowQuerySent:](v18, "setIntelligenceFlowQuerySent:", v53);
  [*(id *)(v9 + 16) emitMessage:v18];
}

void sub_280D0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!a4)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_458C(v11, (uint64_t)qword_3E310);
    oslog = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v13)) {
      goto LABEL_14;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v15 = swift_slowAlloc(32LL, -1LL);
    uint64_t v27 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v26 = sub_12A3C(0xD000000000000031LL, 0x8000000000033EA0LL, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    uint64_t v16 = "The plannerTraceId nil, stopping %s";
    goto LABEL_13;
  }

  if (!a2)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v17 = type metadata accessor for Logger(0LL);
    uint64_t v18 = sub_458C(v17, (uint64_t)qword_3E310);
    oslog = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v13)) {
      goto LABEL_14;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v15 = swift_slowAlloc(32LL, -1LL);
    uint64_t v27 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v26 = sub_12A3C(0xD000000000000031LL, 0x8000000000033EA0LL, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    uint64_t v16 = "The requestId nil, stopping %s";
LABEL_13:
    _os_log_impl(&dword_0, oslog, v13, v16, v14, 0xCu);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);

    return;
  }

  swift_bridgeObjectRetain(a4);
  __n128 v9 = swift_bridgeObjectRetain(a2);
  uint64_t v10 = dispatch thunk of InstrumentationUtil.buildRequestLinkEvent(sourceComponent:sourceUUID:targetComponent:targetUUID:)( 43LL,  a1,  a2,  46LL,  a3,  a4,  v9);
  if (v10)
  {
    oslog = (os_log_s *)v10;
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    [*(id *)(v4 + 16) emitMessage:oslog];
LABEL_14:

    return;
  }

  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  sub_458C(v19, (uint64_t)qword_3E310);
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a2);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc(22LL, -1LL);
    uint64_t v24 = swift_slowAlloc(64LL, -1LL);
    uint64_t v27 = v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    swift_bridgeObjectRetain(a2);
    uint64_t v26 = sub_12A3C(a1, a2, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    uint64_t v26 = sub_12A3C(a3, a4, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    swift_bridgeObjectRelease_n(a4, 3LL);
    _os_log_impl( &dword_0,  v21,  v22,  "Unable to logSubRequestTraceLink for subRequestId=%s and plannerTraceId=%s",  (uint8_t *)v23,  0x16u);
    swift_arrayDestroy(v24, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1LL, -1LL);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

void sub_2858C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_458C(v10, (uint64_t)qword_3E310);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v14 = swift_slowAlloc(32LL, -1LL);
      uint64_t v28 = v14;
      *(_DWORD *)os_log_type_t v13 = 136315138;
      uint64_t v27 = sub_12A3C(0xD00000000000002ALL, 0x8000000000033E70LL, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
      _os_log_impl(&dword_0, v26, v12, "Could not build wrapper for %s because rootRequest is nil", v13, 0xCu);
      swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);

      return;
    }

    goto LABEL_17;
  }

  uint64_t v3 = (os_log_s *)dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:logResourceUtilization:)( a1,  a2,  0LL);
  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v26 = v3;
  id v4 = -[os_log_s eventMetadata](v3, "eventMetadata");
  if (!v4)
  {

LABEL_13:
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_458C(v15, (uint64_t)qword_3E310);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl( &dword_0,  v26,  v17,  "Could not build wrapper or eventMetadata when logging logIFRequestFailed",  v18,  2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    goto LABEL_17;
  }

  id v25 = v4;
  id v5 = [objc_allocWithZone(ORCHSchemaORCHRequestFailed) init];
  if (!v5)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_458C(v19, (uint64_t)qword_3E310);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "Could not build schema event for logIFRequestFailed", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);

      return;
    }

LABEL_17:
    return;
  }

  uint64_t v6 = v5;
  [v5 setErrorDomain:15];
  sub_32B0();
  [v6 setOrchErrorCode:v7];
  id v8 = [objc_allocWithZone(ORCHSchemaORCHRequestContext) init];
  id v9 = v8;
  uint64_t v24 = v8;
  if (v8)
  {
    [v8 setFailed:v6];
    id v9 = v24;
  }

  -[os_log_s setRequestContext:](v26, "setRequestContext:", v9);
  [*(id *)(v2 + 16) emitMessage:v26];
}

void sub_28990(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_494C(&qword_3D0C8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  UUID.init(uuidString:)(a2, a3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11) == 1)
  {
    sub_2973C((uint64_t)v10);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    sub_458C(v15, (uint64_t)qword_3E310);
    uint64_t v16 = swift_bridgeObjectRetain_n(a3, 2LL);
    os_log_type_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v20 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      swift_bridgeObjectRetain(a3);
      uint64_t v43 = sub_12A3C(a2, a3, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      swift_bridgeObjectRelease_n(a3, 3LL);
      _os_log_impl(&dword_0, v17, v18, "Unable to apply log redaction due to invalid requestId %s", v19, 0xCu);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a3, 2LL);
    }
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    sub_458C(v21, (uint64_t)qword_3E310);
    uint64_t v22 = swift_bridgeObjectRetain_n(a3, 2LL);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc(22LL, -1LL);
      uint64_t v38 = a2;
      uint64_t v26 = v25;
      uint64_t v27 = swift_slowAlloc(64LL, -1LL);
      uint64_t v39 = v27;
      *(_DWORD *)uint64_t v26 = 136315394;
      uint64_t v41 = v4;
      aBlock[0] = v27;
      uint64_t v28 = SISchemaDeviceSensitivityState.description.getter(a1);
      unint64_t v30 = v29;
      uint64_t v43 = sub_12A3C(v28, v29, aBlock);
      unsigned int v40 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      swift_bridgeObjectRelease(v30);
      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain(a3);
      uint64_t v43 = sub_12A3C(v38, a3, aBlock);
      a1 = v40;
      uint64_t v4 = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      swift_bridgeObjectRelease_n(a3, 3LL);
      _os_log_impl( &dword_0,  v23,  v24,  "Apply redaction tag with sensitive state %s for requestId %s",  (uint8_t *)v26,  0x16u);
      uint64_t v31 = v39;
      swift_arrayDestroy(v39, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1LL, -1LL);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a3, 2LL);
    }

    id v32 = objc_allocWithZone(&OBJC_CLASS___SiriAnalyticsTag);
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v34 = [v32 initWithConditionType:a1 requestId:isa joined:1];

    int v35 = *(void **)(v4 + 32);
    aBlock[4] = (uint64_t)nullsub_1;
    aBlock[5] = 0LL;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_28E60;
    aBlock[3] = (uint64_t)&unk_3A1C8;
    uint64_t v36 = _Block_copy(aBlock);
    [v35 createTag:v34 completion:v36];
    _Block_release(v36);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

void sub_28E60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

uint64_t sub_28EC0(char *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v77 = a3;
  uint64_t v76 = a2;
  uint64_t v79 = a1;
  uint64_t v3 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v70 - v8;
  uint64_t v10 = type metadata accessor for MessagePayload(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for SystemResponse(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v74 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  os_log_type_t v73 = (char *)&v70 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v75 = (char *)&v70 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v70 - v22;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v79, v10);
  (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v23, v13, v14);
  sub_3E74((uint64_t)v23, (uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  uint64_t v25 = v15;
  if (v24 == enum case for RequestSummary.ExecutionSource.genAI(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 96))(v7, v3);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v79 = v7;
    uint64_t v26 = type metadata accessor for Logger(0LL);
    sub_458C(v26, (uint64_t)qword_3E310);
    uint64_t v27 = v75;
    uint64_t v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 16))(v75, v23, v14);
    unint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v72 = v25;
      uint64_t v31 = swift_slowAlloc(12LL, -1LL);
      uint64_t v74 = v9;
      uint64_t v70 = v3;
      uint64_t v71 = v4;
      id v32 = (uint8_t *)v31;
      uint64_t v33 = swift_slowAlloc(32LL, -1LL);
      unint64_t v81 = v33;
      *(_DWORD *)id v32 = 136315138;
      unint64_t v34 = sub_259D0();
      if (v35)
      {
        unint64_t v36 = v35;
      }

      else
      {
        unint64_t v34 = 0xD000000000000012LL;
        unint64_t v36 = 0x8000000000033570LL;
      }

      uint64_t v80 = sub_12A3C(v34, v36, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
      swift_bridgeObjectRelease(v36);
      uint64_t v37 = *(void (**)(char *, uint64_t))(v72 + 8);
      v37(v27, v14);
      _os_log_impl( &dword_0,  v29,  v30,  "Attempting to apply redaction tag for inferred toolId = %s which is a Montara use-case",  v32,  0xCu);
      swift_arrayDestroy(v33, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1LL, -1LL);
      uint64_t v38 = v32;
      uint64_t v3 = v70;
      uint64_t v4 = v71;
      uint64_t v9 = v74;
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    else
    {
      uint64_t v37 = *(void (**)(char *, uint64_t))(v25 + 8);
      v37(v27, v14);
    }

    sub_28990(9LL, v76, v77);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    v37(v23, v14);
    uint64_t v54 = type metadata accessor for RequestSummary.PrescribedGenAITool(0LL);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v54 - 8) + 8LL))(v79, v54);
  }

  else
  {
    if (v24 == enum case for RequestSummary.ExecutionSource.searchTool(_:))
    {
      uint64_t v74 = v9;
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v40 = type metadata accessor for Logger(0LL);
      sub_458C(v40, (uint64_t)qword_3E310);
      uint64_t v41 = *(uint64_t (**)(char *, char *, uint64_t))(v15 + 16);
      uint64_t v42 = v73;
      uint64_t v43 = v41(v73, v23, v14);
      uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
      os_log_type_t v45 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v47 = swift_slowAlloc(32LL, -1LL);
        uint64_t v70 = v3;
        uint64_t v71 = v4;
        uint64_t v48 = v47;
        unint64_t v81 = v47;
        uint64_t v72 = v25;
        *(_DWORD *)uint64_t v46 = 136315138;
        unint64_t v49 = sub_259D0();
        if (v50)
        {
          unint64_t v51 = v50;
        }

        else
        {
          unint64_t v49 = 0xD000000000000012LL;
          unint64_t v51 = 0x8000000000033570LL;
        }

        uint64_t v80 = sub_12A3C(v49, v51, (uint64_t *)&v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
        swift_bridgeObjectRelease(v51);
        id v52 = *(void (**)(char *, uint64_t))(v72 + 8);
        v52(v42, v14);
        _os_log_impl( &dword_0,  v44,  v45,  "Attempting to apply redaction tag for inferred toolId = %s which is a PQA use-case",  v46,  0xCu);
        swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v53 = v48;
        uint64_t v3 = v70;
        uint64_t v4 = v71;
        swift_slowDealloc(v53, -1LL, -1LL);
        swift_slowDealloc(v46, -1LL, -1LL);
      }

      else
      {
        id v52 = *(void (**)(char *, uint64_t))(v25 + 8);
        v52(v42, v14);
      }

      sub_28990(10LL, v76, v77);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v74, v3);
      uint64_t v68 = v23;
      uint64_t v69 = v14;
    }

    else
    {
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v79 = v7;
      uint64_t v55 = type metadata accessor for Logger(0LL);
      sub_458C(v55, (uint64_t)qword_3E310);
      uint64_t v56 = v74;
      uint64_t v57 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 16))(v74, v23, v14);
      uint64_t v58 = (os_log_s *)Logger.logObject.getter(v57);
      os_log_type_t v59 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v77 = swift_slowAlloc(32LL, -1LL);
        unint64_t v81 = v77;
        uint64_t v72 = v25;
        *(_DWORD *)uint64_t v60 = 136315138;
        unint64_t v61 = sub_259D0();
        if (v62)
        {
          unint64_t v63 = v62;
        }

        else
        {
          unint64_t v61 = 0xD000000000000012LL;
          unint64_t v63 = 0x8000000000033570LL;
        }

        uint64_t v78 = v23;
        uint64_t v80 = sub_12A3C(v61, v63, (uint64_t *)&v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
        swift_bridgeObjectRelease(v63);
        char v64 = *(void (**)(char *, uint64_t))(v72 + 8);
        v64(v74, v14);
        _os_log_impl(&dword_0, v58, v59, "Not attempting to apply redaction tag for inferred toolId = %s", v60, 0xCu);
        unint64_t v65 = v77;
        swift_arrayDestroy(v77, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v65, -1LL, -1LL);
        swift_slowDealloc(v60, -1LL, -1LL);

        id v52 = *(void (**)(char *, uint64_t))(v4 + 8);
        v52(v9, v3);
        uint64_t v66 = v78;
        uint64_t v67 = v14;
      }

      else
      {

        char v64 = *(void (**)(char *, uint64_t))(v25 + 8);
        v64(v56, v14);
        id v52 = *(void (**)(char *, uint64_t))(v4 + 8);
        v52(v9, v3);
        uint64_t v66 = v23;
        uint64_t v67 = v14;
      }

      v64(v66, v67);
      uint64_t v68 = v79;
      uint64_t v69 = v3;
    }

    return ((uint64_t (*)(char *, uint64_t))v52)(v68, v69);
  }

uint64_t sub_296E8()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for IFFlowInstrumentationUtil()
{
  return objc_opt_self(&OBJC_CLASS____TtC12IFFlowPlugin25IFFlowInstrumentationUtil);
}

uint64_t sub_2973C(uint64_t a1)
{
  uint64_t v2 = sub_494C(&qword_3D0C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_2977C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_2978C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_29794( uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v11 = v10;
  uint64_t v40 = a1;
  *(void *)(v10 + 216) = 0LL;
  *(void *)(v10 + 224) = 0LL;
  char v17 = a2 & 1;
  uint64_t KeyPath = swift_getKeyPath(&unk_31B38);
  uint64_t v19 = sub_494C(&qword_3D718);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  *(void *)(v11 + 232) = SiriEnvironmentValue.init(_:)(KeyPath);
  uint64_t v20 = swift_getKeyPath(&unk_31B68);
  uint64_t v21 = sub_494C(&qword_3D728);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  *(void *)(v11 + 240) = SiriEnvironmentValue.init(_:)(v20);
  *(void *)(v11 + 256) = 0LL;
  uint64_t v22 = v11 + *(void *)(*(void *)v11 + 200LL);
  uint64_t v23 = sub_494C(&qword_3D9E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))(v22, 1LL, 1LL, v23);
  uint64_t v24 = v11 + *(void *)(*(void *)v11 + 208LL);
  uint64_t v25 = sub_494C(&qword_3D9E8);
  swift_storeEnumTagMultiPayload(v24, v25, 4LL);
  *(void *)(v11 + 248) = a1;
  *(_BYTE *)(v11 + 208) = v17;
  uint64_t v38 = (void *)a3;
  sub_69E4(a3, v11 + 32);
  uint64_t v37 = (void *)a4;
  sub_69E4(a4, v11 + 72);
  sub_69E4((uint64_t)a5, v11 + 112);
  *(void *)(v11 + 152) = a7;
  *(void *)(v11 + 160) = a6;
  *(void *)(v11 + 16) = a8;
  *(void *)(v11 + 24) = a9;
  sub_69E4((uint64_t)a10, v11 + 168);
  uint64_t v26 = swift_allocObject(&unk_3A200, 24LL, 7LL);
  swift_weakInit(v26 + 16, v11);
  uint64_t v27 = type metadata accessor for IFSessionServiceClient(0LL);
  uint64_t v28 = sub_2ACF0( &qword_3DA00,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for IFSessionServiceClient,  (uint64_t)&protocol conformance descriptor for IFSessionServiceClient);
  swift_retain(a1);
  swift_retain(a6);
  id v29 = a7;
  swift_retain(a9);
  swift_retain(v26);
  dispatch thunk of IFSessionServiceClientProtocol.subscribe(filtering:)(&v39, &unk_3D9F8, v26, v27, v28);
  if (v36)
  {
    swift_release(v11);
    swift_release(a6);

    swift_release(a9);
    swift_release(v26);
    sub_76EC(a10);
    sub_76EC(a5);
    sub_76EC(v37);
    sub_76EC(v38);
    uint64_t v30 = v40;
    swift_release(v26);
    uint64_t v31 = v30;
  }

  else
  {
    swift_release(a6);

    swift_release(a9);
    swift_release(v26);
    sub_76EC(a10);
    sub_76EC(a5);
    sub_76EC(v37);
    sub_76EC(v38);
    uint64_t v32 = v40;
    swift_release(v26);
    swift_release(v32);
    uint64_t v31 = *(void *)(v11 + 256);
    *(void *)(v11 + 256) = v39;
  }

  swift_release(v31);
  return v11;
}

uint64_t sub_29AA0(uint64_t a1, uint64_t a2)
{
  void v2[9] = a1;
  v2[10] = a2;
  uint64_t v3 = type metadata accessor for SessionServerMessage(0LL);
  v2[11] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_29B00, 0LL, 0LL);
}

uint64_t sub_29B00()
{
  uint64_t v1 = *(void *)(v0 + 80) + 16LL;
  swift_beginAccess(v1, v0 + 16, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(v1);
  if (!Strong)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_458C(v19, (uint64_t)qword_3E310);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "IFFlow scope has ended, no IF server messages are passed thru", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    goto LABEL_22;
  }

  uint64_t v3 = Strong;
  sub_494C(&qword_3D718);
  uint64_t v4 = (uint64_t *)swift_task_alloc(16LL);
  uint64_t v5 = type metadata accessor for IFSessionServiceClient(0LL);
  *uint64_t v4 = v5;
  uint64_t v6 = sub_2ACF0( &qword_3DA00,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for IFSessionServiceClient,  (uint64_t)&protocol conformance descriptor for IFSessionServiceClient);
  v4[1] = v6;
  uint64_t KeyPath = swift_getKeyPath(&unk_31B98);
  swift_task_dealloc(v4);
  uint64_t v8 = (uint64_t *)swift_task_alloc(16LL);
  *uint64_t v8 = v5;
  v8[1] = v6;
  uint64_t v9 = swift_getKeyPath(&unk_31BC8);
  swift_task_dealloc(v8);
  *(void *)(v0 + 48) = v3;
  swift_retain(v3);
  static SiriEnvironmentValue.subscript.getter((void *)(v0 + 40), v0 + 48, KeyPath, v9);
  swift_release(v9);
  swift_release(KeyPath);
  uint64_t v10 = swift_release(v3);
  uint64_t v11 = *(void *)(v0 + 40);
  uint64_t v12 = CurrentRequest.rootRequestId.getter(v10);
  unint64_t v14 = v13;
  uint64_t v15 = swift_release(v11);
  if (!v14)
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v24 = type metadata accessor for Logger(0LL);
    uint64_t v25 = sub_458C(v24, (uint64_t)qword_3E310);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v21, v26)) {
      goto LABEL_21;
    }
    uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl( &dword_0,  v21,  v26,  "IFFlow does not have intelligenceFlowTraceId, waiting for another message",  v27,  2u);
    uint64_t v28 = (uint64_t)v27;
LABEL_20:
    swift_slowDealloc(v28, -1LL, -1LL);
LABEL_21:
    swift_release(v3);
LABEL_22:

LABEL_23:
    uint64_t v30 = 0LL;
    goto LABEL_24;
  }

  uint64_t v16 = SessionServerMessage.clientRequestId.getter(v15);
  uint64_t v18 = v17;
  if (v16 != v12 || v14 != v17)
  {
    char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v12, v14, 0LL);
    swift_bridgeObjectRelease(v18);
    if ((v29 & 1) != 0) {
      goto LABEL_15;
    }
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v32 = *(void *)(v0 + 96);
    uint64_t v31 = *(void *)(v0 + 104);
    uint64_t v33 = *(void *)(v0 + 88);
    uint64_t v34 = *(void *)(v0 + 72);
    uint64_t v35 = type metadata accessor for Logger(0LL);
    sub_458C(v35, (uint64_t)qword_3E310);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v34, v33);
    swift_bridgeObjectRetain(v14);
    uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.debug.getter();
    BOOL v39 = os_log_type_enabled(v37, v38);
    uint64_t v41 = *(void *)(v0 + 96);
    uint64_t v40 = *(void *)(v0 + 104);
    if (!v39)
    {
      (*(void (**)(void, void))(v41 + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
      swift_bridgeObjectRelease_n(v14, 2LL);
      swift_release(v3);

      goto LABEL_23;
    }

    uint64_t v47 = *(void *)(v0 + 88);
    os_log_type_t type = v38;
    uint64_t v42 = swift_slowAlloc(22LL, -1LL);
    uint64_t v50 = swift_slowAlloc(64LL, -1LL);
    uint64_t v51 = v50;
    *(_DWORD *)uint64_t v42 = 136315394;
    uint64_t v43 = SessionServerMessage.clientRequestId.getter(v50);
    log = v37;
    unint64_t v45 = v44;
    *(void *)(v0 + 56) = sub_12A3C(v43, v44, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64);
    swift_bridgeObjectRelease(v45);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v47);
    *(_WORD *)(v42 + 12) = 2080;
    swift_bridgeObjectRetain(v14);
    *(void *)(v0 + 64) = sub_12A3C(v12, v14, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72);
    swift_bridgeObjectRelease_n(v14, 3LL);
    uint64_t v21 = log;
    _os_log_impl( &dword_0,  log,  type,  "IFFlow received a message with foreign clientRequestId of %s. IntelligenceFlowTraceId: %s",  (uint8_t *)v42,  0x16u);
    swift_arrayDestroy(v50, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1LL, -1LL);
    uint64_t v28 = v42;
    goto LABEL_20;
  }

  swift_bridgeObjectRelease(v17);
LABEL_15:
  swift_bridgeObjectRelease(v14);
  swift_release(v3);
  uint64_t v30 = 1LL;
LABEL_24:
  swift_task_dealloc(*(void *)(v0 + 104));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v30);
}

uint64_t sub_2A02C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a1;
  uint64_t v85 = a2;
  uint64_t v2 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v79 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v80 = (char *)&v79 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v79 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v79 - v11;
  uint64_t v84 = type metadata accessor for NLRoutingDecisionMessage.RoutingDecision(0LL);
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  unint64_t v14 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v82 = type metadata accessor for NLRouterParse(0LL);
  uint64_t v15 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v17 = (char *)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for Parse(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v21, v86, v18);
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v21, v18);
  if (v22 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v12, v21, v2);
    uint64_t v23 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v24 = v23(v10, v12, v2);
    uint64_t v26 = Parse.DirectInvocation.identifier.getter(v24);
    uint64_t v27 = v25;
    uint64_t v28 = v10;
    if (v26 == 0xD00000000000001FLL && v25 == 0x8000000000033A10LL)
    {
      swift_bridgeObjectRelease(0x8000000000033A10LL);
      char v29 = *(void (**)(char *, uint64_t))(v3 + 8);
      v29(v10, v2);
LABEL_8:
      v29(v12, v2);
      LODWORD(v86) = 1;
      goto LABEL_9;
    }

    char v34 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001FLL, 0x8000000000033A10LL, v26, v25, 0LL);
    swift_bridgeObjectRelease(v27);
    char v29 = *(void (**)(char *, uint64_t))(v3 + 8);
    v29(v28, v2);
    if ((v34 & 1) != 0) {
      goto LABEL_8;
    }
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v63 = type metadata accessor for Logger(0LL);
    sub_458C(v63, (uint64_t)qword_3E310);
    char v64 = v80;
    uint64_t v65 = v23(v80, v12, v2);
    uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v69 = swift_slowAlloc(32LL, -1LL);
      v91[0] = v69;
      uint64_t v86 = v12;
      *(_DWORD *)uint64_t v68 = 136315138;
      uint64_t v84 = (uint64_t)(v68 + 4);
      uint64_t v70 = v79;
      v23(v79, v64, v2);
      uint64_t v71 = String.init<A>(describing:)(v70, v2);
      uint64_t v72 = v64;
      unint64_t v74 = v73;
      uint64_t v89 = sub_12A3C(v71, v73, v91);
      uint64_t v12 = v86;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90);
      swift_bridgeObjectRelease(v74);
      v29(v72, v2);
      _os_log_impl( &dword_0,  v66,  v67,  "IFFlowPlugin does not support direct invocation %s. Returning .noFlow",  v68,  0xCu);
      swift_arrayDestroy(v69, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v69, -1LL, -1LL);
      swift_slowDealloc(v68, -1LL, -1LL);
    }

    else
    {
      v29(v64, v2);
    }

    static FlowSearchResult.noFlow.getter();
    return ((uint64_t (*)(char *, uint64_t))v29)(v12, v2);
  }

  else
  {
    if (v22 == enum case for Parse.nlRouter(_:))
    {
      (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
      uint64_t v30 = v82;
      uint64_t v31 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v17, v21, v82);
      NLRouterParse.nlRoutingDecision.getter(v31);
      uint64_t v32 = v83;
      uint64_t v33 = v84;
      LODWORD(v86) = (*(uint64_t (**)(char *, uint64_t))(v83 + 88))(v14, v84) == enum case for NLRoutingDecisionMessage.RoutingDecision.ajax(_:);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v30);
LABEL_9:
      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v35 = type metadata accessor for Logger(0LL);
      uint64_t v36 = sub_458C(v35, (uint64_t)qword_3E310);
      uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
      os_log_type_t v38 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v37, v38))
      {
        BOOL v39 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v40 = swift_slowAlloc(32LL, -1LL);
        v91[0] = v40;
        *(_DWORD *)BOOL v39 = 136315138;
        LOBYTE(v89) = (_BYTE)v86;
        uint64_t v41 = String.init<A>(describing:)(&v89, &type metadata for ValueResolutionMode);
        unint64_t v43 = v42;
        uint64_t v89 = sub_12A3C(v41, v42, v91);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90);
        swift_bridgeObjectRelease(v43);
        _os_log_impl(&dword_0, v37, v38, "IFFlowPlugin building IFFlow with routing mode %s", v39, 0xCu);
        swift_arrayDestroy(v40, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v40, -1LL, -1LL);
        swift_slowDealloc(v39, -1LL, -1LL);
      }

      type metadata accessor for IFSessionServiceClient(0LL);
      uint64_t v44 = IFSessionServiceClient.__allocating_init()();
      uint64_t v45 = v81;
      sub_69E4(v81 + 56, (uint64_t)v91);
      sub_69E4(v45 + 16, (uint64_t)&v89);
      uint64_t v46 = type metadata accessor for IFFlowInstrumentationUtil();
      uint64_t v47 = (void *)swift_allocObject(v46, 40LL, 7LL);
      uint64_t v48 = (void *)objc_opt_self(&OBJC_CLASS___AssistantSiriAnalytics);
      v47[2] = [v48 sharedStream];
      uint64_t v49 = type metadata accessor for InstrumentationUtil(0LL);
      swift_allocObject(v49, *(unsigned int *)(v49 + 48), *(unsigned __int16 *)(v49 + 52));
      v47[3] = InstrumentationUtil.init()();
      v47[4] = [v48 sharedAnalytics];
      uint64_t v50 = type metadata accessor for ResponseFactory(0LL);
      swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
      uint64_t v51 = ResponseFactory.init()();
      v88[3] = v50;
      v88[4] = &protocol witness table for ResponseFactory;
      v88[0] = v51;
      id v52 = (id)BiomeLibrary();
      id v53 = [v52 Siri];
      swift_unknownObjectRelease(v52);
      id v54 = [v53 Orchestration];
      swift_unknownObjectRelease(v53);
      id v55 = [v54 RequestContext];
      swift_unknownObjectRelease(v54);
      id v56 = [v55 source];

      v87[3] = &type metadata for FeatureEnablementProvider;
      v87[4] = &off_39D90;
      uint64_t v57 = sub_494C(&qword_3D9D0);
      swift_allocObject(v57, *(unsigned int *)(v57 + 48), *(unsigned __int16 *)(v57 + 52));
      uint64_t v75 = sub_29794(v44, (char)v86, (uint64_t)v91, (uint64_t)&v89, v88, (uint64_t)v47, v56, (uint64_t)sub_1AD48, 0LL, v87);
      v91[0] = v75;
      unint64_t v76 = sub_2ABD8();
      uint64_t v77 = Flow.eraseToAnyFlow()(v57, v76);
      static FlowSearchResult.flow(_:)();
      swift_release(v75);
      return swift_release(v77);
    }

    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v58 = type metadata accessor for Logger(0LL);
    uint64_t v59 = sub_458C(v58, (uint64_t)qword_3E310);
    uint64_t v60 = (os_log_s *)Logger.logObject.getter(v59);
    os_log_type_t v61 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v60, v61))
    {
      unint64_t v62 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v62 = 0;
      _os_log_impl(&dword_0, v60, v61, "IFFlowPlugin returning .noFlow", v62, 2u);
      swift_slowDealloc(v62, -1LL, -1LL);
    }

    static FlowSearchResult.noFlow.getter();
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }

uint64_t sub_2AAE8()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for IFFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC12IFFlowPlugin12IFFlowPlugin);
}

uint64_t sub_2AB34@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2A02C(a1, a2);
}

uint64_t sub_2AB54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = swift_allocObject(v1, 96LL, 7LL);
  uint64_t v4 = static OutputPublisherFactory.makeOutputPublisherAsync()();
  uint64_t result = static Device.current.getter(v4);
  *a1 = v3;
  return result;
}

uint64_t sub_2ABAC(uint64_t a1, uint64_t a2)
{
  return sub_2ACF0( &qword_3D9C8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for IFFlowPlugin,  (uint64_t)&unk_31AB8);
}

unint64_t sub_2ABD8()
{
  unint64_t result = qword_3D9D8;
  if (!qword_3D9D8)
  {
    uint64_t v1 = sub_76A8(&qword_3D9D0);
    unint64_t result = swift_getWitnessTable(&unk_31790, v1);
    atomic_store(result, (unint64_t *)&qword_3D9D8);
  }

  return result;
}

uint64_t sub_2AC2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriEnvironment.currentDevice.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2AC54(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return SiriEnvironment.currentDevice.setter(v1);
}

uint64_t sub_2AC7C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_2ACA0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_3D9F4);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2505C;
  return sub_29AA0(a1, v1);
}

uint64_t sub_2ACF0(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_2AD34()
{
  return 16LL;
}

__n128 sub_2AD40(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2AD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[15] = a6;
  v7[16] = a7;
  v7[13] = a4;
  v7[14] = a5;
  v7[11] = a2;
  v7[12] = a3;
  v7[10] = a1;
  uint64_t v8 = type metadata accessor for MessagePayload.SessionError(0LL);
  v7[17] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[18] = v9;
  v7[19] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MessagePayload.EndOfPlan(0LL);
  v7[20] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v7[21] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[22] = swift_task_alloc(v12);
  v7[23] = swift_task_alloc(v12);
  v7[24] = swift_task_alloc(v12);
  uint64_t v13 = type metadata accessor for SystemResponse(0LL);
  v7[25] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v7[26] = v14;
  v7[27] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for Logger(0LL);
  v7[28] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v7[29] = v16;
  v7[30] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for MessageXPCTransporter(0LL);
  v7[31] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v7[32] = v18;
  v7[33] = swift_task_alloc((*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_494C(&qword_3D640);
  v7[34] = swift_task_alloc((*(void *)(*(void *)(v19 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for FlowMessageTransportableOutput(0LL);
  v7[35] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v7[36] = v21;
  unint64_t v22 = (*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[37] = swift_task_alloc(v22);
  v7[38] = swift_task_alloc(v22);
  uint64_t v23 = sub_494C(&qword_3D0C8);
  v7[39] = swift_task_alloc((*(void *)(*(void *)(v23 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = type metadata accessor for UUID(0LL);
  v7[40] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  v7[41] = v25;
  v7[42] = swift_task_alloc((*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for MessagePayload(0LL);
  v7[43] = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  v7[44] = v27;
  unint64_t v28 = (*(void *)(v27 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[45] = swift_task_alloc(v28);
  v7[46] = swift_task_alloc(v28);
  return swift_task_switch(sub_2AF54, 0LL, 0LL);
}

uint64_t sub_2AF54(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = v1[46];
  uint64_t v4 = v1[44];
  uint64_t v5 = v2[43];
  SessionServerMessage.payload.getter(a1);
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5);
  if (v6 == enum case for MessagePayload.terminate(_:))
  {
    uint64_t v7 = v2[46];
    uint64_t v8 = v2[43];
    uint64_t v9 = v2[44];
    uint64_t v10 = v2[10];
    uint64_t v11 = type metadata accessor for IFFlowError(0LL);
    unint64_t v12 = sub_2E7C4();
    uint64_t v13 = swift_allocError(v11, v12, 0LL, 0LL);
    swift_storeEnumTagMultiPayload(v14, v11, 9LL);
    *(void *)uint64_t v10 = v13;
    uint64_t v15 = type metadata accessor for FlowAction(0LL);
    *(_OWORD *)(v10 + 8) = 0u;
    *(_OWORD *)(v10 + 24) = 0u;
    *(void *)(v10 + 40) = 0LL;
    swift_storeEnumTagMultiPayload(v10, v15, 6LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v10, 0LL, 1LL, v15);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    goto LABEL_13;
  }

  uint64_t v16 = v2 + 8;
  if (v6 == enum case for MessagePayload.endOfPlan(_:))
  {
    uint64_t v17 = v2[46];
    uint64_t v18 = v2[24];
    uint64_t v20 = v2[20];
    uint64_t v19 = v2[21];
    (*(void (**)(uint64_t, void))(v2[44] + 96LL))(v17, v2[43]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v18, v17, v20);
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v22 = v2[23];
    uint64_t v21 = v2[24];
    uint64_t v24 = v2[20];
    uint64_t v23 = v2[21];
    sub_458C(v2[28], (uint64_t)qword_3E310);
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
    uint64_t v26 = v25(v22, v21, v24);
    uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v28 = static os_log_type_t.debug.getter();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v31 = v2[23];
    uint64_t v30 = v2[24];
    if (v29)
    {
      uint64_t v32 = v2[22];
      uint64_t v162 = v2 + 7;
      uint64_t v165 = v2[21];
      uint64_t v33 = v2[20];
      char v34 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v176 = v2;
      v181[0] = swift_slowAlloc(32LL, -1LL);
      uint64_t v35 = v181[0];
      *(_DWORD *)char v34 = 136315138;
      v25(v32, v31, v33);
      uint64_t v36 = String.init<A>(describing:)(v32, v33);
      unint64_t v38 = v37;
      v176[7] = sub_12A3C(v36, v37, v181);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v162, v16);
      swift_bridgeObjectRelease(v38);
      BOOL v39 = *(void (**)(uint64_t, uint64_t))(v165 + 8);
      v39(v31, v33);
      _os_log_impl(&dword_0, v27, v28, "IFFlow received endOfPlan message %s", v34, 0xCu);
      swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v40 = v35;
      uint64_t v2 = v176;
      swift_slowDealloc(v40, -1LL, -1LL);
      swift_slowDealloc(v34, -1LL, -1LL);

      v39(v30, v33);
    }

    else
    {
      uint64_t v52 = v2[20];
      uint64_t v53 = v2[21];

      id v54 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v54(v31, v52);
      v54(v30, v52);
    }

    uint64_t v45 = v2[10];
    uint64_t v51 = type metadata accessor for FlowAction(0LL);
    *(_OWORD *)uint64_t v45 = 0u;
    *(_OWORD *)(v45 + swift_weakDestroy(v0 + 16) = 0u;
    *(_OWORD *)(v45 + 32) = 0u;
    goto LABEL_12;
  }

  if (v6 == enum case for MessagePayload.error(_:))
  {
    uint64_t v41 = v2[46];
    uint64_t v43 = v2[18];
    uint64_t v42 = v2[19];
    uint64_t v44 = v2[17];
    uint64_t v45 = v2[10];
    (*(void (**)(uint64_t, void))(v2[44] + 96LL))(v41, v2[43]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v42, v41, v44);
    uint64_t v46 = type metadata accessor for IFFlowError(0LL);
    unint64_t v47 = sub_2E7C4();
    uint64_t v48 = swift_allocError(v46, v47, 0LL, 0LL);
    uint64_t v50 = v49;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v49, v42, v44);
    swift_storeEnumTagMultiPayload(v50, v46, 0LL);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    *(void *)uint64_t v45 = v48;
    uint64_t v51 = type metadata accessor for FlowAction(0LL);
    *(_OWORD *)(v45 + 8) = 0u;
    *(_OWORD *)(v45 + 24) = 0u;
    *(void *)(v45 + 40) = 0LL;
LABEL_12:
    swift_storeEnumTagMultiPayload(v45, v51, 6LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56LL))(v45, 0LL, 1LL, v51);
    goto LABEL_13;
  }

  if (v6 != enum case for MessagePayload.systemResponse(_:))
  {
    uint64_t v83 = v2[46];
    uint64_t v85 = v2[43];
    uint64_t v84 = v2[44];
    if (v6 == enum case for MessagePayload.actionSummaryUpdate(_:)
      || v6 == enum case for MessagePayload.statusUpdate(_:))
    {
      uint64_t v87 = v2 + 9;
      uint64_t v88 = *(uint64_t (**)(uint64_t, uint64_t))(v84 + 8);
      uint64_t v89 = v88(v2[46], v2[43]);
      uint64_t v90 = CurrentRequest.sessionId.getter(v89);
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v94 = v2[40];
        uint64_t v93 = v2[41];
        uint64_t v95 = v2[39];
        UUID.init(uuidString:)(v90, v91);
        swift_bridgeObjectRelease(v92);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v95, 1LL, v94) == 1)
        {
          sub_8DCC(v2[39], &qword_3D0C8);
        }

        else
        {
          uint64_t v98 = v2[45];
          uint64_t v99 = (char *)v2[42];
          uint64_t v170 = v2[43];
          uint64_t v167 = v2[36];
          uint64_t v178 = v2[35];
          uint64_t v163 = v2[34];
          uint64_t v100 = (*(uint64_t (**)(char *, void, void))(v2[41] + 32LL))(v99, v2[39], v2[40]);
          uint64_t v101 = SessionServerMessage.payload.getter(v100);
          uint64_t v102 = (char *)CurrentRequest.executionRequestId.getter(v101);
          uint64_t v104 = v103;
          uint64_t v105 = (char *)CurrentRequest.rootRequestId.getter();
          uint64_t v107 = v106;
          uint64_t v108 = (char *)CurrentRequest.currentDeviceAssistantId.getter();
          uint64_t v110 = v109;
          sub_16A30(v98, v102, v104, v105, v107, v99, v108, v109, v163);
          swift_bridgeObjectRelease(v110);
          swift_bridgeObjectRelease(v107);
          swift_bridgeObjectRelease(v104);
          v88(v98, v170);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v167 + 48))(v163, 1LL, v178) != 1)
          {
            uint64_t v134 = *(void (**)(void, void, void))(v2[36] + 32LL);
            v134(v2[38], v2[34], v2[35]);
            if (qword_3CF38 != -1) {
              swift_once(&qword_3CF38, sub_448C);
            }
            uint64_t v135 = v2[37];
            uint64_t v136 = v2[38];
            uint64_t v137 = v2[35];
            uint64_t v138 = v2[36];
            sub_458C(v2[28], (uint64_t)qword_3E310);
            uint64_t v139 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 16))(v135, v136, v137);
            unint64_t v140 = (os_log_s *)Logger.logObject.getter(v139);
            os_log_type_t v141 = static os_log_type_t.debug.getter();
            BOOL v142 = os_log_type_enabled(v140, v141);
            uint64_t v143 = v2[37];
            if (v142)
            {
              uint64_t v144 = v2[33];
              uint64_t v160 = v2[32];
              uint64_t v164 = v2[31];
              uint64_t v168 = v2[36];
              uint64_t v172 = v2[35];
              uint64_t v175 = v140;
              unint64_t v180 = v134;
              uint64_t v145 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
              uint64_t v161 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
              *(_DWORD *)uint64_t v145 = 138412290;
              FlowMessageTransportableOutput.message.getter();
              uint64_t v147 = v2[5];
              uint64_t v146 = v2[6];
              sub_B170(v2 + 2, v147);
              uint64_t v148 = dispatch thunk of MessageXPCTransportable.toMessageXPCTransporter()(v147, v146);
              uint64_t v149 = MessageXPCTransporter.toMessageBase()(v148);
              (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v144, v164);
              sub_76EC(v2 + 2);
              void v2[9] = v149;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 9, v2 + 10);
              uint64_t *v161 = v149;
              unint64_t v140 = v175;
              (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v143, v172);
              _os_log_impl( &dword_0,  v175,  v141,  "Publishing IntelligenceFlowStatusUpdateMessage Message: %@",  v145,  0xCu);
              uint64_t v150 = sub_494C(&qword_3D358);
              swift_arrayDestroy(v161, 1LL, v150);
              swift_slowDealloc(v161, -1LL, -1LL);
              uint64_t v151 = v145;
              uint64_t v134 = v180;
              swift_slowDealloc(v151, -1LL, -1LL);
            }

            else
            {
              (*(void (**)(void, void))(v2[36] + 8LL))(v2[37], v2[35]);
            }

            uint64_t v153 = v2[41];
            uint64_t v152 = v2[42];
            uint64_t v154 = v2[40];
            uint64_t v155 = v2[38];
            uint64_t v156 = v2[35];
            Swift::String v157 = (void *)v2[10];
            v157[3] = v156;
            v157[4] = &protocol witness table for FlowMessageTransportableOutput;
            uint64_t v158 = sub_DEBC(v157);
            v134(v158, v155, v156);
            (*(void (**)(uint64_t, uint64_t))(v153 + 8))(v152, v154);
            uint64_t v159 = type metadata accessor for FlowAction(0LL);
            swift_storeEnumTagMultiPayload(v157, v159, 0LL);
            (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v159 - 8) + 56LL))( v157,  0LL,  1LL,  v159);
            goto LABEL_13;
          }

          uint64_t v111 = v2[34];
          (*(void (**)(void, void))(v2[41] + 8LL))(v2[42], v2[40]);
          sub_8DCC(v111, &qword_3D640);
          uint64_t v16 = v2 + 8;
          uint64_t v87 = v2 + 9;
        }
      }

      if (qword_3CF38 != -1) {
        swift_once(&qword_3CF38, sub_448C);
      }
      uint64_t v113 = v2[29];
      uint64_t v112 = v2[30];
      uint64_t v114 = v2[28];
      uint64_t v115 = v2[13];
      uint64_t v116 = sub_458C(v114, (uint64_t)qword_3E310);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 16))(v112, v116, v114);
      uint64_t v117 = swift_retain_n(v115, 2LL);
      uint64_t v118 = (os_log_s *)Logger.logObject.getter(v117);
      os_log_type_t v119 = static os_log_type_t.error.getter();
      BOOL v120 = os_log_type_enabled(v118, v119);
      uint64_t v121 = v2[29];
      uint64_t v122 = v2[30];
      uint64_t v123 = v2[28];
      uint64_t v124 = v2[13];
      if (v120)
      {
        uint64_t v174 = v2[28];
        uint64_t v179 = v2;
        uint64_t v125 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v171 = v122;
        uint64_t v126 = v87;
        uint64_t v127 = swift_slowAlloc(32LL, -1LL);
        v181[0] = v127;
        *(_DWORD *)uint64_t v125 = 136315138;
        uint64_t v128 = CurrentRequest.sessionId.getter(v127);
        if (v129)
        {
          unint64_t v130 = v129;
        }

        else
        {
          uint64_t v128 = 1819047278LL;
          unint64_t v130 = 0xE400000000000000LL;
        }

        *uint64_t v16 = sub_12A3C(v128, v130, v181);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v16, v126);
        swift_bridgeObjectRelease(v130);
        swift_release_n(v124, 2LL);
        _os_log_impl( &dword_0,  v118,  v119,  "Failed to compose IntelligenceFlowStatusUpdateMessage with sessionId - %s",  v125,  0xCu);
        swift_arrayDestroy(v127, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v127, -1LL, -1LL);
        uint64_t v131 = v125;
        uint64_t v2 = v179;
        swift_slowDealloc(v131, -1LL, -1LL);

        (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v171, v174);
      }

      else
      {
        swift_release_n(v2[13], 2LL);

        (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v122, v123);
      }

      uint64_t v132 = v2[10];
      uint64_t v133 = type metadata accessor for FlowAction(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v133 - 8) + 56LL))(v132, 1LL, 1LL, v133);
    }

    else
    {
      uint64_t v96 = v2[10];
      uint64_t v97 = type metadata accessor for FlowAction(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56LL))(v96, 1LL, 1LL, v97);
      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
    }

uint64_t sub_2BB44()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 376LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 384LL));
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_2BBA0, 0LL, 0LL);
}

uint64_t sub_2BBA0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  (*(void (**)(void, void))(*(void *)(v0 + 208) + 8LL))(*(void *)(v0 + 216), *(void *)(v0 + 200));
  uint64_t v2 = type metadata accessor for FlowAction(0LL);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(v1, 0LL, 1LL, v2);
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v7 = *(void *)(v0 + 296);
  uint64_t v9 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 272);
  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v11 = *(void *)(v0 + 216);
  uint64_t v13 = *(void *)(v0 + 192);
  uint64_t v14 = *(void *)(v0 + 184);
  uint64_t v15 = *(void *)(v0 + 176);
  uint64_t v16 = *(void *)(v0 + 152);
  swift_task_dealloc(*(void *)(v0 + 368));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2BCC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[129] = v37;
  v8[128] = v36;
  v8[127] = a8;
  v8[126] = a7;
  v8[125] = a6;
  v8[124] = a5;
  v8[123] = a4;
  v8[122] = a3;
  v8[121] = a2;
  v8[120] = a1;
  uint64_t v9 = type metadata accessor for SystemResponse(0LL);
  v8[130] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[131] = v10;
  v8[132] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for ActionRequirement(0LL);
  v8[133] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v8[134] = v12;
  v8[135] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for ActionFailure.Failure(0LL);
  v8[136] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v8[137] = v14;
  unint64_t v15 = (*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[138] = swift_task_alloc(v15);
  v8[139] = swift_task_alloc(v15);
  uint64_t v16 = type metadata accessor for ActionFailure(0LL);
  v8[140] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v8[141] = v17;
  unint64_t v18 = (*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[142] = swift_task_alloc(v18);
  v8[143] = swift_task_alloc(v18);
  v8[144] = swift_task_alloc(v18);
  uint64_t v19 = ((uint64_t (*)(void))type metadata accessor for ParameterNeedsValue)(0LL);
  v8[145] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v8[146] = v20;
  unint64_t v21 = (*(void *)(v20 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[147] = swift_task_alloc(v21);
  v8[148] = swift_task_alloc(v21);
  uint64_t v22 = ((uint64_t (*)(void))type metadata accessor for ParameterNotAllowed)(0LL);
  v8[149] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v8[150] = v23;
  unint64_t v24 = (*(void *)(v23 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[151] = swift_task_alloc(v24);
  v8[152] = swift_task_alloc(v24);
  uint64_t v25 = type metadata accessor for ParameterDisambiguation(0LL);
  v8[153] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v8[154] = v26;
  v8[155] = swift_task_alloc((*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for RequestSummary.ExecutionSource(0LL);
  v8[156] = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  v8[157] = v28;
  unint64_t v29 = (*(void *)(v28 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[158] = swift_task_alloc(v29);
  v8[159] = swift_task_alloc(v29);
  uint64_t v30 = ((uint64_t (*)(void))type metadata accessor for ActionConfirmation)(0LL);
  v8[160] = v30;
  uint64_t v31 = *(void *)(v30 - 8);
  v8[161] = v31;
  v8[162] = swift_task_alloc((*(void *)(v31 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = type metadata accessor for StatementOutcome(0LL);
  v8[163] = v32;
  uint64_t v33 = *(void *)(v32 - 8);
  v8[164] = v33;
  unint64_t v34 = (*(void *)(v33 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[165] = swift_task_alloc(v34);
  v8[166] = swift_task_alloc(v34);
  return swift_task_switch(sub_2BF20, 0LL, 0LL);
}

uint64_t sub_2BF20()
{
  if (qword_3CF38 != -1) {
    swift_once(&qword_3CF38, sub_448C);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_458C(v1, (uint64_t)qword_3E310);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc(22LL, -1LL);
    uint64_t v6 = swift_slowAlloc(64LL, -1LL);
    uint64_t v203 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)(v0 + 944) = sub_12A3C(0xD00000000000001DLL, 0x8000000000033F60LL, &v203);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 944, v0 + 952);
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v0 + 952) = sub_12A3C(0xD000000000000073LL, 0x8000000000033F80LL, &v203);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960);
    _os_log_impl(&dword_0, v3, v4, "%s:%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy(v6, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v0 + 1328);
  uint64_t v8 = *(void *)(v0 + 1312);
  uint64_t v9 = *(void *)(v0 + 1304);
  sub_257E4(v7);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9);
  if ((_DWORD)v10 == enum case for StatementOutcome.success(_:))
  {
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_0, v11, v12, "IFFlow Publishing success output", v13, 2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    uint64_t v14 = *(void *)(v0 + 1032);
    uint64_t v15 = *(void *)(v0 + 1008);
    uint64_t v16 = *(void *)(v0 + 984);
    uint64_t v17 = *(void **)(v0 + 960);

    *uint64_t v17 = 0LL;
    sub_69E4(v16, v0 + 144);
    sub_69E4(v14, v0 + 232);
    *(void *)(v0 + 208) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 2swift_weakDestroy(v0 + 16) = &off_39D90;
    *(void *)(v0 + 224) = v15;
    uint64_t v18 = dword_3D224;
    swift_retain(v15);
    uint64_t v19 = (void *)swift_task_alloc(v18);
    *(void *)(v0 + 1336) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_2D180;
    uint64_t v20 = *(void *)(v0 + 1024);
    uint64_t v21 = *(void *)(v0 + 1016);
    uint64_t v22 = *(void *)(v0 + 1000);
    uint64_t v23 = *(void *)(v0 + 992);
    uint64_t v24 = *(void *)(v0 + 976);
    uint64_t v25 = (uint64_t)(v17 + 1);
    goto LABEL_25;
  }

  if ((_DWORD)v10 == enum case for StatementOutcome.actionConfirmation(_:))
  {
    uint64_t v26 = *(void *)(v0 + 1328);
    uint64_t v27 = *(void *)(v0 + 1296);
    uint64_t v28 = *(void *)(v0 + 1288);
    uint64_t v29 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1312) + 96LL))(v26, *(void *)(v0 + 1304));
    uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v27, v26, v29);
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "IFFlow inferredOutcome action confirmation", v33, 2u);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    uint64_t v34 = *(void *)(v0 + 1272);
    uint64_t v35 = *(void *)(v0 + 1264);
    uint64_t v36 = *(void *)(v0 + 1256);
    uint64_t v37 = *(void *)(v0 + 1248);
    uint64_t v38 = *(void *)(v0 + 976);

    sub_3E74(v38, v34);
    uint64_t v39 = enum case for RequestSummary.PrescribedGenAITool.generateRichContentFromMediaIntentTool(_:);
    uint64_t v40 = type metadata accessor for RequestSummary.PrescribedGenAITool(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104LL))(v35, v39, v40);
    (*(void (**)(uint64_t, void, uint64_t))(v36 + 104))( v35,  enum case for RequestSummary.ExecutionSource.genAI(_:),  v37);
    char v41 = static RequestSummary.ExecutionSource.== infix(_:_:)(v34, v35);
    int v42 = v41 & 1;
    *(_BYTE *)(v0 + 1448) = v41 & 1;
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v43(v35, v37);
    uint64_t v44 = ((uint64_t (*)(uint64_t, uint64_t))v43)(v34, v37);
    uint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
    os_log_type_t v46 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v45, v46))
    {
      unint64_t v47 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unint64_t v47 = 67109120;
      *(_DWORD *)(v0 + 1424) = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1424, v0 + 1428);
      _os_log_impl(&dword_0, v45, v46, "IFFlow pushing confirmation flow, isGenAIMediaQnA: %{BOOL}d", v47, 8u);
      swift_slowDealloc(v47, -1LL, -1LL);
    }

    uint64_t v48 = *(void *)(v0 + 1032);
    uint64_t v49 = *(void *)(v0 + 1008);
    uint64_t v50 = *(void *)(v0 + 984);

    uint64_t v51 = sub_494C(&qword_3D6B8);
    *(_DWORD *)(v0 + 1428) = *(_DWORD *)(v51 + 48);
    *(_DWORD *)(v0 + 1432) = *(_DWORD *)(v51 + 64);
    sub_69E4(v50, v0 + 400);
    sub_69E4(v48, v0 + 488);
    *(void *)(v0 + 464) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 472) = &off_39D90;
    *(void *)(v0 + 480) = v49;
    uint64_t v52 = dword_3D224;
    swift_retain(v49);
    uint64_t v53 = (void *)swift_task_alloc(v52);
    *(void *)(v0 + 1344) = v53;
    *uint64_t v53 = v0;
    v53[1] = sub_2D338;
    uint64_t v20 = *(void *)(v0 + 1024);
    uint64_t v21 = *(void *)(v0 + 1016);
    uint64_t v22 = *(void *)(v0 + 1000);
    uint64_t v23 = *(void *)(v0 + 992);
    uint64_t v24 = *(void *)(v0 + 976);
    uint64_t v25 = *(void *)(v0 + 960);
    char v54 = v42;
    return sub_8FEC(v25, v24, v23, v22, v21, v20, v54);
  }

  if ((_DWORD)v10 == enum case for StatementOutcome.parameterNeedsValue(_:))
  {
    uint64_t v55 = *(void *)(v0 + 1328);
    uint64_t v56 = *(void *)(v0 + 1184);
    uint64_t v57 = *(void *)(v0 + 1176);
    uint64_t v58 = *(void *)(v0 + 1168);
    uint64_t v59 = *(void *)(v0 + 1160);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1312) + 96LL))(v55, *(void *)(v0 + 1304));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32))(v56, v55, v59);
    uint64_t v60 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v57, v56, v59);
    uint64_t v61 = (os_log_s *)Logger.logObject.getter(v60);
    os_log_type_t v62 = static os_log_type_t.info.getter();
    BOOL v63 = os_log_type_enabled(v61, v62);
    uint64_t v64 = *(void *)(v0 + 1176);
    uint64_t v65 = *(void *)(v0 + 1168);
    if (v63)
    {
      uint64_t v196 = *(void *)(v0 + 1160);
      uint64_t v66 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v199 = swift_slowAlloc(32LL, -1LL);
      uint64_t v203 = v199;
      *(_DWORD *)uint64_t v66 = 136315138;
      uint64_t v67 = ParameterNeedsValue.parameterId.getter();
      unint64_t v69 = v68;
      *(void *)(v0 + 920) = sub_12A3C(v67, v68, &v203);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 920, v0 + 928);
      swift_bridgeObjectRelease(v69);
      uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      v70(v64, v196);
      _os_log_impl(&dword_0, v61, v62, "IFFlow pushing needsValue flow for %s", v66, 0xCu);
      swift_arrayDestroy(v199, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v199, -1LL, -1LL);
      swift_slowDealloc(v66, -1LL, -1LL);
    }

    else
    {
      uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      v70(*(void *)(v0 + 1176), *(void *)(v0 + 1160));
    }

    *(void *)(v0 + 1384) = v70;
    uint64_t v86 = *(void *)(v0 + 1032);
    uint64_t v87 = *(void *)(v0 + 1008);
    uint64_t v88 = *(void *)(v0 + 984);
    *(_DWORD *)(v0 + 1444) = *(_DWORD *)(sub_494C(&qword_3D6D8) + 48);
    sub_69E4(v88, v0 + 528);
    sub_69E4(v86, v0 + 616);
    *(void *)(v0 + 592) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 600) = &off_39D90;
    *(void *)(v0 + 608) = v87;
    uint64_t v89 = dword_3D224;
    swift_retain(v87);
    uint64_t v90 = (void *)swift_task_alloc(v89);
    *(void *)(v0 + 1392) = v90;
    uint64_t v91 = sub_2D8A0;
LABEL_24:
    *uint64_t v90 = v0;
    v90[1] = v91;
    uint64_t v20 = *(void *)(v0 + 1024);
    uint64_t v21 = *(void *)(v0 + 1016);
    uint64_t v22 = *(void *)(v0 + 1000);
    uint64_t v23 = *(void *)(v0 + 992);
    uint64_t v24 = *(void *)(v0 + 976);
    uint64_t v25 = *(void *)(v0 + 960);
LABEL_25:
    char v54 = 0;
    return sub_8FEC(v25, v24, v23, v22, v21, v20, v54);
  }

  if ((_DWORD)v10 == enum case for StatementOutcome.parameterDisambiguation(_:))
  {
    uint64_t v71 = *(void *)(v0 + 1328);
    uint64_t v72 = *(void *)(v0 + 1240);
    uint64_t v73 = *(void *)(v0 + 1232);
    uint64_t v74 = *(void *)(v0 + 1224);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1312) + 96LL))(v71, *(void *)(v0 + 1304));
    uint64_t v75 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v72, v71, v74);
    uint64_t v76 = (os_log_s *)Logger.logObject.getter(v75);
    os_log_type_t v77 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v78 = 0;
      _os_log_impl(&dword_0, v76, v77, "IFFlow pushing disambiguation flow", v78, 2u);
      swift_slowDealloc(v78, -1LL, -1LL);
    }

    uint64_t v79 = *(void *)(v0 + 1032);
    uint64_t v80 = *(void *)(v0 + 1008);
    uint64_t v81 = *(void *)(v0 + 984);

    uint64_t v83 = ParameterDisambiguation.items.getter(v82);
    *(void *)(v0 + 1352) = *(void *)(v83 + 16);
    swift_bridgeObjectRelease(v83);
    *(_DWORD *)(v0 + 1436) = *(_DWORD *)(sub_494C(&qword_3D698) + 64);
    sub_69E4(v81, v0 + 656);
    sub_69E4(v79, v0 + 744);
    *(void *)(v0 + 720) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 728) = &off_39D90;
    *(void *)(v0 + 736) = v80;
    uint64_t v84 = dword_3D224;
    swift_retain(v80);
    uint64_t v85 = (void *)swift_task_alloc(v84);
    *(void *)(v0 + 1360) = v85;
    *uint64_t v85 = v0;
    v85[1] = sub_2D50C;
    uint64_t v20 = *(void *)(v0 + 1024);
    uint64_t v21 = *(void *)(v0 + 1016);
    uint64_t v22 = *(void *)(v0 + 1000);
    uint64_t v23 = *(void *)(v0 + 992);
    uint64_t v24 = *(void *)(v0 + 976);
    uint64_t v25 = *(void *)(v0 + 960);
    char v54 = 0;
    return sub_8FEC(v25, v24, v23, v22, v21, v20, v54);
  }

  if ((_DWORD)v10 == enum case for StatementOutcome.parameterNotAllowed(_:))
  {
    uint64_t v93 = *(void *)(v0 + 1328);
    uint64_t v94 = *(void *)(v0 + 1216);
    uint64_t v95 = *(void *)(v0 + 1208);
    uint64_t v96 = *(void *)(v0 + 1200);
    uint64_t v97 = *(void *)(v0 + 1192);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1312) + 96LL))(v93, *(void *)(v0 + 1304));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 32))(v94, v93, v97);
    uint64_t v98 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v96 + 16))(v95, v94, v97);
    uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
    os_log_type_t v100 = static os_log_type_t.info.getter();
    BOOL v101 = os_log_type_enabled(v99, v100);
    uint64_t v102 = *(void *)(v0 + 1208);
    uint64_t v103 = *(void *)(v0 + 1200);
    if (v101)
    {
      uint64_t v200 = *(void *)(v0 + 1192);
      uint64_t v104 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v105 = swift_slowAlloc(32LL, -1LL);
      uint64_t v203 = v105;
      *(_DWORD *)uint64_t v104 = 136315138;
      uint64_t v106 = ParameterNotAllowed.parameterId.getter();
      unint64_t v108 = v107;
      *(void *)(v0 + 912) = sub_12A3C(v106, v107, &v203);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 912, v0 + 920);
      swift_bridgeObjectRelease(v108);
      uint64_t v109 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
      v109(v102, v200);
      _os_log_impl( &dword_0,  v99,  v100,  "IFFlow received parameterNotAllowed pushing needsValue flow for %s",  v104,  0xCu);
      swift_arrayDestroy(v105, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v105, -1LL, -1LL);
      swift_slowDealloc(v104, -1LL, -1LL);
    }

    else
    {
      uint64_t v109 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
      v109(*(void *)(v0 + 1208), *(void *)(v0 + 1192));
    }

    *(void *)(v0 + 1368) = v109;
    uint64_t v126 = *(void *)(v0 + 1032);
    uint64_t v127 = *(void *)(v0 + 1008);
    uint64_t v128 = *(void *)(v0 + 984);
    *(_DWORD *)(v0 + 1440) = *(_DWORD *)(sub_494C(&qword_3D6D8) + 48);
    sub_69E4(v128, v0 + 784);
    sub_69E4(v126, v0 + 872);
    *(void *)(v0 + 848) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 856) = &off_39D90;
    *(void *)(v0 + 864) = v127;
    uint64_t v129 = dword_3D224;
    swift_retain(v127);
    uint64_t v90 = (void *)swift_task_alloc(v129);
    *(void *)(v0 + 1376) = v90;
    uint64_t v91 = sub_2D6DC;
    goto LABEL_24;
  }

  if ((_DWORD)v10 == enum case for StatementOutcome.actionRequirement(_:))
  {
    uint64_t v110 = *(void *)(v0 + 1328);
    uint64_t v111 = *(void *)(v0 + 1080);
    uint64_t v112 = *(void *)(v0 + 1072);
    uint64_t v113 = *(void *)(v0 + 1064);
    uint64_t v114 = *(uint8_t **)(v0 + 976);
    uint64_t v115 = *(void *)(v0 + 968);
    uint64_t v116 = *(uint8_t **)(v0 + 960);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1312) + 96LL))(v110, *(void *)(v0 + 1304));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 32))(v111, v110, v113);
    sub_2DDC8(v115, v114, v111, v116);
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
LABEL_32:
    uint64_t v117 = *(void *)(v0 + 1320);
    uint64_t v118 = *(void *)(v0 + 1296);
    uint64_t v119 = *(void *)(v0 + 1272);
    uint64_t v120 = *(void *)(v0 + 1264);
    uint64_t v121 = *(void *)(v0 + 1240);
    uint64_t v122 = *(void *)(v0 + 1216);
    uint64_t v123 = *(void *)(v0 + 1208);
    uint64_t v124 = *(void *)(v0 + 1184);
    uint64_t v125 = *(void *)(v0 + 1176);
    uint64_t v188 = *(void *)(v0 + 1152);
    uint64_t v189 = *(void *)(v0 + 1144);
    uint64_t v190 = *(void *)(v0 + 1136);
    uint64_t v191 = *(void *)(v0 + 1112);
    uint64_t v193 = *(void *)(v0 + 1104);
    uint64_t v197 = *(void *)(v0 + 1080);
    uint64_t v201 = *(void *)(v0 + 1056);
    swift_task_dealloc(*(void *)(v0 + 1328));
    swift_task_dealloc(v117);
    swift_task_dealloc(v118);
    swift_task_dealloc(v119);
    swift_task_dealloc(v120);
    swift_task_dealloc(v121);
    swift_task_dealloc(v122);
    swift_task_dealloc(v123);
    swift_task_dealloc(v124);
    swift_task_dealloc(v125);
    swift_task_dealloc(v188);
    swift_task_dealloc(v189);
    swift_task_dealloc(v190);
    swift_task_dealloc(v191);
    swift_task_dealloc(v193);
    swift_task_dealloc(v197);
    swift_task_dealloc(v201);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  if ((_DWORD)v10 != enum case for StatementOutcome.failure(_:))
  {
    uint64_t v149 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 1048) + 16LL))( *(void *)(v0 + 1056),  *(void *)(v0 + 976),  *(void *)(v0 + 1040));
    uint64_t v150 = (os_log_s *)Logger.logObject.getter(v149);
    os_log_type_t v151 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v150, v151))
    {
      uint64_t v152 = *(void *)(v0 + 1320);
      uint64_t v153 = *(void *)(v0 + 1056);
      uint64_t v192 = *(void *)(v0 + 1304);
      uint64_t v194 = *(void *)(v0 + 1048);
      uint64_t v198 = *(void *)(v0 + 1040);
      uint64_t v154 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v155 = swift_slowAlloc(32LL, -1LL);
      uint64_t v203 = v155;
      *(_DWORD *)uint64_t v154 = 136315138;
      sub_257E4(v152);
      uint64_t v156 = String.init<A>(describing:)(v152, v192);
      unint64_t v158 = v157;
      *(void *)(v0 + 936) = sub_12A3C(v156, v157, &v203);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 936, v0 + 944);
      swift_bridgeObjectRelease(v158);
      (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v153, v198);
      _os_log_impl(&dword_0, v150, v151, "IFFlow received unsupported outcomeType %s", v154, 0xCu);
      swift_arrayDestroy(v155, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v155, -1LL, -1LL);
      swift_slowDealloc(v154, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 1048) + 8LL))( *(void *)(v0 + 1056),  *(void *)(v0 + 1040));
    }

    uint64_t v173 = *(void *)(v0 + 1032);
    uint64_t v174 = *(void *)(v0 + 1008);
    sub_69E4(*(void *)(v0 + 984), v0 + 16);
    sub_69E4(v173, v0 + 104);
    *(void *)(v0 + 80) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 88) = &off_39D90;
    *(void *)(v0 + 96) = v174;
    uint64_t v175 = dword_3D224;
    swift_retain(v174);
    uint64_t v90 = (void *)swift_task_alloc(v175);
    *(void *)(v0 + 14swift_weakDestroy(v0 + 16) = v90;
    uint64_t v91 = sub_2DC10;
    goto LABEL_24;
  }

  uint64_t v130 = *(void *)(v0 + 1328);
  uint64_t v131 = *(void *)(v0 + 1152);
  uint64_t v132 = *(void *)(v0 + 1128);
  uint64_t v133 = *(void *)(v0 + 1120);
  uint64_t v134 = *(void *)(v0 + 1112);
  uint64_t v135 = *(void *)(v0 + 1104);
  uint64_t v136 = *(void *)(v0 + 1096);
  uint64_t v137 = *(void *)(v0 + 1088);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 1312) + 96LL))(v130, *(void *)(v0 + 1304));
  uint64_t v138 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v132 + 32))(v131, v130, v133);
  ActionFailure.failure.getter(v138);
  (*(void (**)(uint64_t, void, uint64_t))(v136 + 104))( v135,  enum case for ActionFailure.Failure.noMatchingTool(_:),  v137);
  LOBYTE(v130) = static ActionFailure.Failure.== infix(_:_:)(v134, v135);
  uint64_t v139 = *(void (**)(uint64_t, uint64_t))(v136 + 8);
  v139(v135, v137);
  uint64_t v140 = ((uint64_t (*)(uint64_t, uint64_t))v139)(v134, v137);
  if ((v130 & 1) != 0)
  {
    os_log_type_t v141 = (os_log_s *)Logger.logObject.getter(v140);
    os_log_type_t v142 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v141, v142))
    {
      uint64_t v143 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v143 = 0;
      _os_log_impl( &dword_0,  v141,  v142,  "IntelligenceFlow couldn't find any matching tools, falling back to SiriX",  v143,  2u);
      swift_slowDealloc(v143, -1LL, -1LL);
    }

    uint64_t v144 = *(void *)(v0 + 1152);
    uint64_t v145 = *(void *)(v0 + 1128);
    uint64_t v146 = *(void *)(v0 + 1120);
    uint64_t v147 = *(void *)(v0 + 960);

    (*(void (**)(uint64_t, uint64_t))(v145 + 8))(v144, v146);
    uint64_t v148 = type metadata accessor for FlowAction(0LL);
    swift_storeEnumTagMultiPayload(v147, v148, 7LL);
    goto LABEL_32;
  }

  uint64_t v195 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1128) + 16LL);
  uint64_t v159 = v195(*(void *)(v0 + 1144), *(void *)(v0 + 1152), *(void *)(v0 + 1120));
  uint64_t v160 = (os_log_s *)Logger.logObject.getter(v159);
  os_log_type_t v161 = static os_log_type_t.info.getter();
  BOOL v162 = os_log_type_enabled(v160, v161);
  uint64_t v163 = *(void *)(v0 + 1144);
  if (v162)
  {
    uint64_t v164 = *(void *)(v0 + 1136);
    uint64_t v165 = *(void *)(v0 + 1128);
    uint64_t v166 = *(void *)(v0 + 1120);
    uint64_t v167 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v168 = swift_slowAlloc(32LL, -1LL);
    uint64_t v203 = v168;
    *(_DWORD *)uint64_t v167 = 136315138;
    v195(v164, v163, v166);
    uint64_t v169 = String.init<A>(describing:)(v164, v166);
    unint64_t v171 = v170;
    *(void *)(v0 + 928) = sub_12A3C(v169, v170, &v203);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 928, v0 + 936);
    swift_bridgeObjectRelease(v171);
    uint64_t v172 = *(void (**)(uint64_t, uint64_t))(v165 + 8);
    v172(v163, v166);
    _os_log_impl(&dword_0, v160, v161, "IFFlow Publishing failure output for %s", v167, 0xCu);
    swift_arrayDestroy(v168, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v168, -1LL, -1LL);
    swift_slowDealloc(v167, -1LL, -1LL);
  }

  else
  {
    uint64_t v172 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1128) + 8LL);
    v172(*(void *)(v0 + 1144), *(void *)(v0 + 1120));
  }

  *(void *)(v0 + 1400) = v172;
  uint64_t v176 = *(void *)(v0 + 1152);
  uint64_t v177 = *(void *)(v0 + 1120);
  uint64_t v202 = *(void *)(v0 + 1032);
  uint64_t v178 = *(void *)(v0 + 1008);
  uint64_t v179 = *(void *)(v0 + 984);
  unint64_t v180 = *(uint64_t **)(v0 + 960);
  uint64_t v181 = type metadata accessor for IFFlowError(0LL);
  unint64_t v182 = sub_2E7C4();
  uint64_t v183 = swift_allocError(v181, v182, 0LL, 0LL);
  uint64_t v185 = v184;
  v195(v184, v176, v177);
  swift_storeEnumTagMultiPayload(v185, v181, 7LL);
  uint64_t *v180 = v183;
  sub_69E4(v179, v0 + 272);
  sub_69E4(v202, v0 + 360);
  *(void *)(v0 + 336) = &type metadata for FeatureEnablementProvider;
  *(void *)(v0 + 344) = &off_39D90;
  *(void *)(v0 + 352) = v178;
  uint64_t v186 = dword_3D224;
  swift_retain(v178);
  uint64_t v187 = (void *)swift_task_alloc(v186);
  *(void *)(v0 + 1408) = v187;
  *uint64_t v187 = v0;
  v187[1] = sub_2DA64;
  return sub_8FEC( (uint64_t)(v180 + 1),  *(void *)(v0 + 976),  *(void *)(v0 + 992),  *(void *)(v0 + 1000),  *(void *)(v0 + 1016),  *(void *)(v0 + 1024),  0);
}

uint64_t sub_2D180()
{
  uint64_t v1 = (void *)(*(void *)v0 + 144LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1336LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2D1E0, 0LL, 0LL);
}

uint64_t sub_2D1E0()
{
  uint64_t v1 = *(void *)(v0 + 1328);
  uint64_t v2 = *(void *)(v0 + 1312);
  uint64_t v3 = *(void *)(v0 + 1304);
  uint64_t v4 = *(void *)(v0 + 960);
  uint64_t v5 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v4, v5, 6LL);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v6 = *(void *)(v0 + 1320);
  uint64_t v7 = *(void *)(v0 + 1296);
  uint64_t v8 = *(void *)(v0 + 1272);
  uint64_t v9 = *(void *)(v0 + 1264);
  uint64_t v10 = *(void *)(v0 + 1240);
  uint64_t v11 = *(void *)(v0 + 1216);
  uint64_t v12 = *(void *)(v0 + 1208);
  uint64_t v13 = *(void *)(v0 + 1184);
  uint64_t v14 = *(void *)(v0 + 1176);
  uint64_t v16 = *(void *)(v0 + 1152);
  uint64_t v17 = *(void *)(v0 + 1144);
  uint64_t v18 = *(void *)(v0 + 1136);
  uint64_t v19 = *(void *)(v0 + 1112);
  uint64_t v20 = *(void *)(v0 + 1104);
  uint64_t v21 = *(void *)(v0 + 1080);
  uint64_t v22 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2D338()
{
  uint64_t v1 = (void *)(*(void *)v0 + 400LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1344LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2D398, 0LL, 0LL);
}

uint64_t sub_2D398()
{
  uint64_t v1 = *(int *)(v0 + 1432);
  char v2 = *(_BYTE *)(v0 + 1448);
  uint64_t v3 = *(void *)(v0 + 1296);
  uint64_t v4 = *(void *)(v0 + 1288);
  uint64_t v5 = *(void *)(v0 + 1280);
  uint64_t v6 = *(void *)(v0 + 960);
  sub_25B3C();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  *(_BYTE *)(v6 + v1) = v2;
  uint64_t v7 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v6, v7, 1LL);
  uint64_t v8 = *(void *)(v0 + 1320);
  uint64_t v9 = *(void *)(v0 + 1296);
  uint64_t v10 = *(void *)(v0 + 1272);
  uint64_t v11 = *(void *)(v0 + 1264);
  uint64_t v12 = *(void *)(v0 + 1240);
  uint64_t v13 = *(void *)(v0 + 1216);
  uint64_t v14 = *(void *)(v0 + 1208);
  uint64_t v15 = *(void *)(v0 + 1184);
  uint64_t v16 = *(void *)(v0 + 1176);
  uint64_t v18 = *(void *)(v0 + 1152);
  uint64_t v19 = *(void *)(v0 + 1144);
  uint64_t v20 = *(void *)(v0 + 1136);
  uint64_t v21 = *(void *)(v0 + 1112);
  uint64_t v22 = *(void *)(v0 + 1104);
  uint64_t v23 = *(void *)(v0 + 1080);
  uint64_t v24 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2D50C()
{
  uint64_t v1 = (void *)(*(void *)v0 + 656LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1360LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2D56C, 0LL, 0LL);
}

uint64_t sub_2D56C()
{
  uint64_t v1 = *(void *)(v0 + 1240);
  uint64_t v2 = *(void *)(v0 + 1232);
  uint64_t v3 = *(void *)(v0 + 1224);
  uint64_t v4 = *(void *)(v0 + 960);
  *(void *)(v4 + 40) = *(void *)(v0 + 1352);
  sub_25B3C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v4, v5, 3LL);
  uint64_t v6 = *(void *)(v0 + 1320);
  uint64_t v7 = *(void *)(v0 + 1296);
  uint64_t v8 = *(void *)(v0 + 1272);
  uint64_t v9 = *(void *)(v0 + 1264);
  uint64_t v10 = *(void *)(v0 + 1240);
  uint64_t v11 = *(void *)(v0 + 1216);
  uint64_t v12 = *(void *)(v0 + 1208);
  uint64_t v13 = *(void *)(v0 + 1184);
  uint64_t v14 = *(void *)(v0 + 1176);
  uint64_t v16 = *(void *)(v0 + 1152);
  uint64_t v17 = *(void *)(v0 + 1144);
  uint64_t v18 = *(void *)(v0 + 1136);
  uint64_t v19 = *(void *)(v0 + 1112);
  uint64_t v20 = *(void *)(v0 + 1104);
  uint64_t v21 = *(void *)(v0 + 1080);
  uint64_t v22 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2D6DC()
{
  uint64_t v1 = (void *)(*(void *)v0 + 784LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1376LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2D73C, 0LL, 0LL);
}

uint64_t sub_2D73C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1368);
  uint64_t v2 = *(void *)(v0 + 1216);
  uint64_t v3 = *(void *)(v0 + 1192);
  uint64_t v4 = *(void *)(v0 + 960);
  sub_25B3C();
  v1(v2, v3);
  uint64_t v5 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v4, v5, 2LL);
  uint64_t v6 = *(void *)(v0 + 1320);
  uint64_t v7 = *(void *)(v0 + 1296);
  uint64_t v8 = *(void *)(v0 + 1272);
  uint64_t v9 = *(void *)(v0 + 1264);
  uint64_t v10 = *(void *)(v0 + 1240);
  uint64_t v11 = *(void *)(v0 + 1216);
  uint64_t v12 = *(void *)(v0 + 1208);
  uint64_t v13 = *(void *)(v0 + 1184);
  uint64_t v14 = *(void *)(v0 + 1176);
  uint64_t v16 = *(void *)(v0 + 1152);
  uint64_t v17 = *(void *)(v0 + 1144);
  uint64_t v18 = *(void *)(v0 + 1136);
  uint64_t v19 = *(void *)(v0 + 1112);
  uint64_t v20 = *(void *)(v0 + 1104);
  uint64_t v21 = *(void *)(v0 + 1080);
  uint64_t v22 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2D8A0()
{
  uint64_t v1 = (void *)(*(void *)v0 + 528LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1392LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2D900, 0LL, 0LL);
}

uint64_t sub_2D900()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
  uint64_t v2 = *(void *)(v0 + 1184);
  uint64_t v3 = *(void *)(v0 + 1160);
  uint64_t v4 = *(void *)(v0 + 960);
  sub_25B3C();
  v1(v2, v3);
  uint64_t v5 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v4, v5, 2LL);
  uint64_t v6 = *(void *)(v0 + 1320);
  uint64_t v7 = *(void *)(v0 + 1296);
  uint64_t v8 = *(void *)(v0 + 1272);
  uint64_t v9 = *(void *)(v0 + 1264);
  uint64_t v10 = *(void *)(v0 + 1240);
  uint64_t v11 = *(void *)(v0 + 1216);
  uint64_t v12 = *(void *)(v0 + 1208);
  uint64_t v13 = *(void *)(v0 + 1184);
  uint64_t v14 = *(void *)(v0 + 1176);
  uint64_t v16 = *(void *)(v0 + 1152);
  uint64_t v17 = *(void *)(v0 + 1144);
  uint64_t v18 = *(void *)(v0 + 1136);
  uint64_t v19 = *(void *)(v0 + 1112);
  uint64_t v20 = *(void *)(v0 + 1104);
  uint64_t v21 = *(void *)(v0 + 1080);
  uint64_t v22 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2DA64()
{
  uint64_t v1 = (void *)(*(void *)v0 + 272LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1408LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2DAC4, 0LL, 0LL);
}

uint64_t sub_2DAC4()
{
  uint64_t v1 = *(void *)(v0 + 960);
  (*(void (**)(void, void))(v0 + 1400))(*(void *)(v0 + 1152), *(void *)(v0 + 1120));
  uint64_t v2 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v1, v2, 6LL);
  uint64_t v3 = *(void *)(v0 + 1320);
  uint64_t v4 = *(void *)(v0 + 1296);
  uint64_t v5 = *(void *)(v0 + 1272);
  uint64_t v6 = *(void *)(v0 + 1264);
  uint64_t v7 = *(void *)(v0 + 1240);
  uint64_t v8 = *(void *)(v0 + 1216);
  uint64_t v9 = *(void *)(v0 + 1208);
  uint64_t v10 = *(void *)(v0 + 1184);
  uint64_t v11 = *(void *)(v0 + 1176);
  uint64_t v13 = *(void *)(v0 + 1152);
  uint64_t v14 = *(void *)(v0 + 1144);
  uint64_t v15 = *(void *)(v0 + 1136);
  uint64_t v16 = *(void *)(v0 + 1112);
  uint64_t v17 = *(void *)(v0 + 1104);
  uint64_t v18 = *(void *)(v0 + 1080);
  uint64_t v19 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2DC10()
{
  uint64_t v1 = (void *)(*(void *)v0 + 16LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 1416LL));
  sub_2E80C(v1);
  return swift_task_switch(sub_2DC70, 0LL, 0LL);
}

uint64_t sub_2DC70()
{
  uint64_t v1 = *(void *)(v0 + 1328);
  uint64_t v2 = *(void *)(v0 + 1312);
  uint64_t v3 = *(void *)(v0 + 1304);
  uint64_t v4 = *(void *)(v0 + 960);
  uint64_t v5 = type metadata accessor for FlowAction(0LL);
  swift_storeEnumTagMultiPayload(v4, v5, 0LL);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v6 = *(void *)(v0 + 1320);
  uint64_t v7 = *(void *)(v0 + 1296);
  uint64_t v8 = *(void *)(v0 + 1272);
  uint64_t v9 = *(void *)(v0 + 1264);
  uint64_t v10 = *(void *)(v0 + 1240);
  uint64_t v11 = *(void *)(v0 + 1216);
  uint64_t v12 = *(void *)(v0 + 1208);
  uint64_t v13 = *(void *)(v0 + 1184);
  uint64_t v14 = *(void *)(v0 + 1176);
  uint64_t v16 = *(void *)(v0 + 1152);
  uint64_t v17 = *(void *)(v0 + 1144);
  uint64_t v18 = *(void *)(v0 + 1136);
  uint64_t v19 = *(void *)(v0 + 1112);
  uint64_t v20 = *(void *)(v0 + 1104);
  uint64_t v21 = *(void *)(v0 + 1080);
  uint64_t v22 = *(void *)(v0 + 1056);
  swift_task_dealloc(*(void *)(v0 + 1328));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2DDC8@<X0>(uint64_t a1@<X0>, uint8_t *a2@<X1>, uint64_t a3@<X2>, uint8_t *a4@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v6 = type metadata accessor for SystemRequirement(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for ActionRequirement(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v35 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v34 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v19((char *)&v34 - v17, a3, v10);
  if ((*(unsigned int (**)(char *, uint64_t))(v11 + 88))(v18, v10) == enum case for ActionRequirement.systemRequirement(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v18, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v18, v6);
    sub_2E104(v37, (uint64_t)v9, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  else
  {
    uint64_t v37 = a4;
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    sub_458C(v21, (uint64_t)qword_3E310);
    uint64_t v22 = ((uint64_t (*)(char *, uint64_t, uint64_t))v19)(v16, a3, v10);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v36 = swift_slowAlloc(32LL, -1LL);
      uint64_t v39 = v36;
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v34 = v25 + 4;
      uint64_t v26 = v35;
      v19(v35, (uint64_t)v16, v10);
      uint64_t v27 = String.init<A>(describing:)(v26, v10);
      unint64_t v29 = v28;
      uint64_t v38 = sub_12A3C(v27, v28, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
      swift_bridgeObjectRelease(v29);
      uint64_t v30 = *(void (**)(char *, uint64_t))(v11 + 8);
      v30(v16, v10);
      _os_log_impl(&dword_0, v23, v24, "IFFlow received unsupported ActionRequirement %s", v25, 0xCu);
      uint64_t v31 = v36;
      swift_arrayDestroy(v36, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      uint64_t v30 = *(void (**)(char *, uint64_t))(v11 + 8);
      v30(v16, v10);
    }

    os_log_type_t v32 = v37;
    uint64_t v33 = type metadata accessor for FlowAction(0LL);
    *(_OWORD *)os_log_type_t v32 = 0u;
    *((_OWORD *)v32 + 1) = 0u;
    *((_OWORD *)v32 + 2) = 0u;
    swift_storeEnumTagMultiPayload(v32, v33, 6LL);
    return ((uint64_t (*)(char *, uint64_t))v30)(v18, v10);
  }

uint64_t sub_2E104@<X0>(uint8_t *a1@<X1>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  os_log_type_t v77 = a1;
  uint64_t v79 = a3;
  uint64_t v72 = type metadata accessor for SystemRequirement.AuthenticationRequest.AuthenticationLevel(0LL);
  uint64_t v78 = *(void *)(v72 - 8);
  uint64_t v4 = __chkstk_darwin(v72);
  unint64_t v69 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v66 - v6;
  uint64_t v8 = type metadata accessor for UnlockDevicePolicy(0LL);
  uint64_t v75 = *(void *)(v8 - 8);
  uint64_t v76 = v8;
  __chkstk_darwin(v8);
  uint64_t v74 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for SystemRequirement.AuthenticationRequest(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v70 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v66 - v14;
  uint64_t v16 = type metadata accessor for SystemRequirement(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v71 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v73 = (char *)&v66 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v66 - v22;
  os_log_type_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v24((char *)&v66 - v22, a2, v16);
  if ((*(unsigned int (**)(char *, uint64_t))(v17 + 88))(v23, v16) == enum case for SystemRequirement.userAuthenticationRequired(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v23, v16);
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v11 + 32))(v15, v23, v10);
    SystemRequirement.AuthenticationRequest.authenticationLevel.getter(v25);
    uint64_t v26 = v78;
    uint64_t v27 = v72;
    int v28 = (*(uint64_t (**)(char *, uint64_t))(v78 + 88))(v7, v72);
    uint64_t v29 = v11;
    uint64_t v30 = v15;
    if (v28 == enum case for SystemRequirement.AuthenticationRequest.AuthenticationLevel.alternativeAuthenticationPermitted(_:))
    {
      uint64_t v31 = v74;
      static UnlockDevicePolicy.default.getter();
    }

    else
    {
      uint64_t v31 = v74;
      if (v28 == enum case for SystemRequirement.AuthenticationRequest.AuthenticationLevel.originDeviceAuthenticationRequired(_:))
      {
        static UnlockDevicePolicy.requiringDeviceUnlock.getter();
      }

      else
      {
        uint64_t v47 = v27;
        if (qword_3CF38 != -1) {
          swift_once(&qword_3CF38, sub_448C);
        }
        uint64_t v48 = type metadata accessor for Logger(0LL);
        sub_458C(v48, (uint64_t)qword_3E310);
        uint64_t v49 = v70;
        uint64_t v50 = (*(uint64_t (**)(char *, char *, uint64_t))(v29 + 16))(v70, v15, v10);
        uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
        os_log_type_t v52 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v51, v52))
        {
          os_log_t v68 = v51;
          uint64_t v53 = swift_slowAlloc(12LL, -1LL);
          uint64_t v73 = v30;
          uint64_t v71 = v7;
          char v54 = (uint8_t *)v53;
          uint64_t v55 = swift_slowAlloc(32LL, -1LL);
          uint64_t v67 = v55;
          uint64_t v81 = v55;
          *(_DWORD *)char v54 = 136315138;
          uint64_t v66 = v54 + 4;
          uint64_t v56 = v69;
          SystemRequirement.AuthenticationRequest.authenticationLevel.getter(v55);
          uint64_t v57 = String.init<A>(describing:)(v56, v47);
          unint64_t v59 = v58;
          uint64_t v80 = sub_12A3C(v57, v58, &v81);
          uint64_t v26 = v78;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
          swift_bridgeObjectRelease(v59);
          (*(void (**)(char *, uint64_t))(v29 + 8))(v49, v10);
          uint64_t v51 = v68;
          _os_log_impl( &dword_0,  v68,  v52,  "IFFlow received unknown SystemRequirement.AuthenticationLevel %s. Defaulting to requiring full unlock.",  v54,  0xCu);
          uint64_t v60 = v67;
          swift_arrayDestroy(v67, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v60, -1LL, -1LL);
          uint64_t v61 = v54;
          uint64_t v7 = v71;
          uint64_t v30 = v73;
          swift_slowDealloc(v61, -1LL, -1LL);
        }

        else
        {
          (*(void (**)(char *, uint64_t))(v29 + 8))(v49, v10);
        }

        static UnlockDevicePolicy.requiringDeviceUnlock.getter();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v47);
      }
    }

    sub_494C(&qword_3D688);
    os_log_type_t v62 = v79;
    uint64_t v64 = v75;
    uint64_t v63 = v76;
    (*(void (**)(_OWORD *, char *, uint64_t))(v75 + 16))(v79, v31, v76);
    sub_25B3C();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v31, v63);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v10);
    uint64_t v65 = type metadata accessor for FlowAction(0LL);
    return swift_storeEnumTagMultiPayload(v62, v65, 4LL);
  }

  else
  {
    if (qword_3CF38 != -1) {
      swift_once(&qword_3CF38, sub_448C);
    }
    uint64_t v32 = type metadata accessor for Logger(0LL);
    sub_458C(v32, (uint64_t)qword_3E310);
    uint64_t v33 = v73;
    uint64_t v34 = ((uint64_t (*)(char *, uint64_t, uint64_t))v24)(v73, a2, v16);
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v78 = swift_slowAlloc(32LL, -1LL);
      uint64_t v81 = v78;
      *(_DWORD *)uint64_t v37 = 136315138;
      os_log_type_t v77 = v37 + 4;
      uint64_t v38 = v71;
      v24(v71, (uint64_t)v33, v16);
      uint64_t v39 = String.init<A>(describing:)(v38, v16);
      unint64_t v41 = v40;
      uint64_t v80 = sub_12A3C(v39, v40, &v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
      swift_bridgeObjectRelease(v41);
      int v42 = *(void (**)(char *, uint64_t))(v17 + 8);
      v42(v33, v16);
      _os_log_impl(&dword_0, v35, v36, "IFFlow received unsupported SystemRequirement %s", v37, 0xCu);
      uint64_t v43 = v78;
      swift_arrayDestroy(v78, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    else
    {
      int v42 = *(void (**)(char *, uint64_t))(v17 + 8);
      v42(v33, v16);
    }

    uint64_t v44 = type metadata accessor for FlowAction(0LL);
    uint64_t v45 = v79;
    *uint64_t v79 = 0u;
    v45[1] = 0u;
    v45[2] = 0u;
    swift_storeEnumTagMultiPayload(v45, v44, 6LL);
    return ((uint64_t (*)(char *, uint64_t))v42)(v23, v16);
  }

uint64_t type metadata accessor for FlowAction(uint64_t a1)
{
  uint64_t result = qword_3DA88;
  if (!qword_3DA88) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FlowAction);
  }
  return result;
}

unint64_t sub_2E7C4()
{
  unint64_t result = qword_3D0E0;
  if (!qword_3D0E0)
  {
    uint64_t v1 = type metadata accessor for IFFlowError(255LL);
    unint64_t result = swift_getWitnessTable(&unk_311D8, v1);
    atomic_store(result, (unint64_t *)&qword_3D0E0);
  }

  return result;
}

void *sub_2E80C(void *a1)
{
  return a1;
}

char *sub_2E840(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v9 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v9 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v9);
  }

  else
  {
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        __int128 v8 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v8;
        (**(void (***)(void *, const void *))(v8 - 8))(a1, a2);
        swift_storeEnumTagMultiPayload(a1, a3, 0LL);
        break;
      case 1u:
        __int128 v11 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v11;
        (**(void (***)(void *, const void *))(v11 - 8))(a1, a2);
        uint64_t v12 = sub_494C(&qword_3D6B8);
        uint64_t v13 = *(int *)(v12 + 48);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        uint64_t v16 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
        a1[*(int *)(v12 + 64)] = a2[*(int *)(v12 + 64)];
        swift_storeEnumTagMultiPayload(a1, a3, 1LL);
        break;
      case 2u:
        __int128 v17 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v17;
        (**(void (***)(void *, const void *))(v17 - 8))(a1, a2);
        uint64_t v18 = *(int *)(sub_494C(&qword_3D6D8) + 48);
        uint64_t v19 = &a1[v18];
        uint64_t v20 = &a2[v18];
        uint64_t v21 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v19, v20, v21);
        swift_storeEnumTagMultiPayload(a1, a3, 2LL);
        break;
      case 3u:
        __int128 v22 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v22;
        (**(void (***)(void *, const void *))(v22 - 8))(a1, a2);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        uint64_t v23 = *(int *)(sub_494C(&qword_3D698) + 64);
        os_log_type_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        uint64_t v26 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16LL))(v24, v25, v26);
        swift_storeEnumTagMultiPayload(a1, a3, 3LL);
        break;
      case 4u:
        uint64_t v27 = type metadata accessor for UnlockDevicePolicy(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16LL))(a1, a2, v27);
        uint64_t v28 = *(int *)(sub_494C(&qword_3D688) + 48);
        uint64_t v29 = &a1[v28];
        uint64_t v30 = &a2[v28];
        uint64_t v31 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16LL))(v29, v30, v31);
        swift_storeEnumTagMultiPayload(a1, a3, 4LL);
        break;
      case 5u:
        uint64_t v32 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v32;
        swift_bridgeObjectRetain(v32);
        swift_storeEnumTagMultiPayload(a1, a3, 5LL);
        break;
      case 6u:
        uint64_t v33 = *(void *)a2;
        swift_errorRetain(*(void *)a2);
        *(void *)a1 = v33;
        uint64_t v34 = a1 + 8;
        uint64_t v35 = a2 + 8;
        uint64_t v36 = *((void *)a2 + 4);
        if (v36)
        {
          uint64_t v37 = *((void *)a2 + 5);
          *((void *)a1 + 4) = v36;
          *((void *)a1 + 5) = v37;
          (**(void (***)(_OWORD *, _OWORD *))(v36 - 8))(v34, v35);
        }

        else
        {
          __int128 v38 = *(_OWORD *)(a2 + 24);
          _OWORD *v34 = *v35;
          *(_OWORD *)(a1 + 24) = v38;
          *((void *)a1 + 5) = *((void *)a2 + 5);
        }

        swift_storeEnumTagMultiPayload(a1, a3, 6LL);
        break;
      default:
        memcpy(a1, a2, *(void *)(v5 + 64));
        break;
    }
  }

  return a1;
}

uint64_t sub_2EB5C(void *a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  switch((int)result)
  {
    case 0:
      return sub_76EC(a1);
    case 1:
      sub_76EC(a1);
      uint64_t v4 = &qword_3D6B8;
      goto LABEL_7;
    case 2:
      sub_76EC(a1);
      uint64_t v4 = &qword_3D6D8;
      goto LABEL_7;
    case 3:
      sub_76EC(a1);
      uint64_t v5 = *(int *)(sub_494C(&qword_3D698) + 64);
      goto LABEL_8;
    case 4:
      uint64_t v6 = type metadata accessor for UnlockDevicePolicy(0LL);
      (*(void (**)(void *, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
      uint64_t v4 = &qword_3D688;
LABEL_7:
      uint64_t v5 = *(int *)(sub_494C(v4) + 48);
LABEL_8:
      uint64_t v7 = (char *)a1 + v5;
      uint64_t v8 = type metadata accessor for StatementID(0LL);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
      break;
    case 5:
      uint64_t result = swift_bridgeObjectRelease(a1[1]);
      break;
    case 6:
      uint64_t result = swift_errorRelease(*a1);
      if (a1[4]) {
        uint64_t result = sub_76EC(a1 + 1);
      }
      break;
    default:
      return result;
  }

  return result;
}

char *sub_2EC70(char *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      __int128 v6 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v6;
      (**(void (***)(void *, const void *))(v6 - 8))(a1, a2);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 0LL;
      goto LABEL_13;
    case 1u:
      __int128 v10 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v10;
      (**(void (***)(void *, const void *))(v10 - 8))(a1, a2);
      uint64_t v11 = sub_494C(&qword_3D6B8);
      uint64_t v12 = *(int *)(v11 + 48);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
      a1[*(int *)(v11 + 64)] = *((_BYTE *)a2 + *(int *)(v11 + 64));
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 1LL;
      goto LABEL_13;
    case 2u:
      __int128 v16 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v16;
      (**(void (***)(void *, const void *))(v16 - 8))(a1, a2);
      uint64_t v17 = *(int *)(sub_494C(&qword_3D6D8) + 48);
      uint64_t v18 = &a1[v17];
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16LL))(v18, v19, v20);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 2LL;
      goto LABEL_13;
    case 3u:
      __int128 v21 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v21;
      (**(void (***)(void *, const void *))(v21 - 8))(a1, a2);
      *((void *)a1 + 5) = a2[5];
      uint64_t v22 = *(int *)(sub_494C(&qword_3D698) + 64);
      uint64_t v23 = &a1[v22];
      os_log_type_t v24 = (char *)a2 + v22;
      uint64_t v25 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16LL))(v23, v24, v25);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 3LL;
      goto LABEL_13;
    case 4u:
      uint64_t v26 = type metadata accessor for UnlockDevicePolicy(0LL);
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v26 - 8) + 16LL))(a1, a2, v26);
      uint64_t v27 = *(int *)(sub_494C(&qword_3D688) + 48);
      uint64_t v28 = &a1[v27];
      uint64_t v29 = (char *)a2 + v27;
      uint64_t v30 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16LL))(v28, v29, v30);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 4LL;
      goto LABEL_13;
    case 5u:
      uint64_t v31 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v31;
      swift_bridgeObjectRetain(v31);
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 5LL;
      goto LABEL_13;
    case 6u:
      uint64_t v32 = *a2;
      swift_errorRetain(*a2);
      *(void *)a1 = v32;
      uint64_t v33 = a1 + 8;
      uint64_t v34 = a2 + 1;
      uint64_t v35 = a2[4];
      if (v35)
      {
        uint64_t v36 = a2[5];
        *((void *)a1 + 4) = v35;
        *((void *)a1 + 5) = v36;
        (**(void (***)(_OWORD *, _OWORD *))(v35 - 8))(v33, v34);
      }

      else
      {
        __int128 v37 = *(_OWORD *)(a2 + 3);
        *uint64_t v33 = *v34;
        *(_OWORD *)(a1 + 24) = v37;
        *((void *)a1 + 5) = a2[5];
      }

      uint64_t v7 = a1;
      uint64_t v8 = a3;
      uint64_t v9 = 6LL;
LABEL_13:
      swift_storeEnumTagMultiPayload(v7, v8, v9);
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      break;
  }

  return a1;
}

void *sub_2EF4C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2F254((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        uint64_t v6 = a2[3];
        a1[3] = v6;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v6 - 8))(a1, a2);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 0LL;
        goto LABEL_14;
      case 1u:
        uint64_t v10 = a2[3];
        a1[3] = v10;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v10 - 8))(a1, a2);
        uint64_t v11 = sub_494C(&qword_3D6B8);
        uint64_t v12 = *(int *)(v11 + 48);
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
        *((_BYTE *)a1 + *(int *)(v11 + swift_release(*(void *)(v0 + 64)) = *((_BYTE *)a2 + *(int *)(v11 + 64));
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 1LL;
        goto LABEL_14;
      case 2u:
        uint64_t v16 = a2[3];
        a1[3] = v16;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v16 - 8))(a1, a2);
        uint64_t v17 = *(int *)(sub_494C(&qword_3D6D8) + 48);
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        uint64_t v20 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16LL))(v18, v19, v20);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 2LL;
        goto LABEL_14;
      case 3u:
        uint64_t v21 = a2[3];
        a1[3] = v21;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v21 - 8))(a1, a2);
        a1[5] = a2[5];
        uint64_t v22 = *(int *)(sub_494C(&qword_3D698) + 64);
        uint64_t v23 = (char *)a1 + v22;
        os_log_type_t v24 = (char *)a2 + v22;
        uint64_t v25 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16LL))(v23, v24, v25);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 3LL;
        goto LABEL_14;
      case 4u:
        uint64_t v26 = type metadata accessor for UnlockDevicePolicy(0LL);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16LL))(a1, a2, v26);
        uint64_t v27 = *(int *)(sub_494C(&qword_3D688) + 48);
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16LL))(v28, v29, v30);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 4LL;
        goto LABEL_14;
      case 5u:
        *a1 = *a2;
        uint64_t v31 = a2[1];
        a1[1] = v31;
        swift_bridgeObjectRetain(v31);
        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 5LL;
        goto LABEL_14;
      case 6u:
        uint64_t v32 = *a2;
        swift_errorRetain(*a2);
        *a1 = v32;
        uint64_t v33 = a1 + 1;
        uint64_t v34 = (__int128 *)(a2 + 1);
        uint64_t v35 = a2[4];
        if (v35)
        {
          a1[4] = v35;
          a1[5] = a2[5];
          (**(void (***)(_OWORD *, __int128 *))(v35 - 8))(v33, v34);
        }

        else
        {
          __int128 v36 = *v34;
          __int128 v37 = *(_OWORD *)(a2 + 3);
          a1[5] = a2[5];
          *uint64_t v33 = v36;
          *(_OWORD *)(a1 + 3) = v37;
        }

        uint64_t v7 = a1;
        uint64_t v8 = a3;
        uint64_t v9 = 6LL;
LABEL_14:
        swift_storeEnumTagMultiPayload(v7, v8, v9);
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        break;
    }
  }

  return a1;
}

uint64_t sub_2F254(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FlowAction(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

_OWORD *sub_2F290(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 1u:
      __int128 v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v7 = sub_494C(&qword_3D6B8);
      uint64_t v8 = *(int *)(v7 + 48);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
      *((_BYTE *)a1 + *(int *)(v7 + swift_release(*(void *)(v0 + 64)) = *((_BYTE *)a2 + *(int *)(v7 + 64));
      uint64_t v12 = a1;
      uint64_t v13 = a3;
      uint64_t v14 = 1LL;
      goto LABEL_7;
    case 2u:
      __int128 v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v16 = *(int *)(sub_494C(&qword_3D6D8) + 48);
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))(v17, v18, v19);
      uint64_t v12 = a1;
      uint64_t v13 = a3;
      uint64_t v14 = 2LL;
      goto LABEL_7;
    case 3u:
      __int128 v20 = a2[1];
      *a1 = *a2;
      a1[1] = v20;
      uint64_t v21 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v21;
      uint64_t v22 = *(int *)(sub_494C(&qword_3D698) + 64);
      uint64_t v23 = (char *)a1 + v22;
      os_log_type_t v24 = (char *)a2 + v22;
      uint64_t v25 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32LL))(v23, v24, v25);
      uint64_t v12 = a1;
      uint64_t v13 = a3;
      uint64_t v14 = 3LL;
      goto LABEL_7;
    case 4u:
      uint64_t v26 = type metadata accessor for UnlockDevicePolicy(0LL);
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v26 - 8) + 32LL))(a1, a2, v26);
      uint64_t v27 = *(int *)(sub_494C(&qword_3D688) + 48);
      uint64_t v28 = (char *)a1 + v27;
      uint64_t v29 = (char *)a2 + v27;
      uint64_t v30 = type metadata accessor for StatementID(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32LL))(v28, v29, v30);
      uint64_t v12 = a1;
      uint64_t v13 = a3;
      uint64_t v14 = 4LL;
LABEL_7:
      swift_storeEnumTagMultiPayload(v12, v13, v14);
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      break;
  }

  return a1;
}

_OWORD *sub_2F490(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2F254((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 1u:
        __int128 v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        *((void *)a1 + 4) = *((void *)a2 + 4);
        uint64_t v7 = sub_494C(&qword_3D6B8);
        uint64_t v8 = *(int *)(v7 + 48);
        uint64_t v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
        *((_BYTE *)a1 + *(int *)(v7 + swift_release(*(void *)(v0 + 64)) = *((_BYTE *)a2 + *(int *)(v7 + 64));
        uint64_t v12 = a1;
        uint64_t v13 = a3;
        uint64_t v14 = 1LL;
        goto LABEL_8;
      case 2u:
        __int128 v15 = a2[1];
        *a1 = *a2;
        a1[1] = v15;
        *((void *)a1 + 4) = *((void *)a2 + 4);
        uint64_t v16 = *(int *)(sub_494C(&qword_3D6D8) + 48);
        uint64_t v17 = (char *)a1 + v16;
        uint64_t v18 = (char *)a2 + v16;
        uint64_t v19 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))(v17, v18, v19);
        uint64_t v12 = a1;
        uint64_t v13 = a3;
        uint64_t v14 = 2LL;
        goto LABEL_8;
      case 3u:
        __int128 v20 = a2[1];
        *a1 = *a2;
        a1[1] = v20;
        uint64_t v21 = *((void *)a2 + 5);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = v21;
        uint64_t v22 = *(int *)(sub_494C(&qword_3D698) + 64);
        uint64_t v23 = (char *)a1 + v22;
        os_log_type_t v24 = (char *)a2 + v22;
        uint64_t v25 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32LL))(v23, v24, v25);
        uint64_t v12 = a1;
        uint64_t v13 = a3;
        uint64_t v14 = 3LL;
        goto LABEL_8;
      case 4u:
        uint64_t v26 = type metadata accessor for UnlockDevicePolicy(0LL);
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v26 - 8) + 32LL))(a1, a2, v26);
        uint64_t v27 = *(int *)(sub_494C(&qword_3D688) + 48);
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = type metadata accessor for StatementID(0LL);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32LL))(v28, v29, v30);
        uint64_t v12 = a1;
        uint64_t v13 = a3;
        uint64_t v14 = 4LL;
LABEL_8:
        swift_storeEnumTagMultiPayload(v12, v13, v14);
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        break;
    }
  }

  return a1;
}

uint64_t sub_2F6A0(uint64_t a1)
{
  v10[0] = "(";
  uint64_t result = type metadata accessor for StatementID(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_getTupleTypeLayout3(v9, "(", v4, &unk_31C48);
    v10[1] = v9;
    swift_getTupleTypeLayout2(v8, "(", v4);
    _OWORD v10[2] = v8;
    swift_getTupleTypeLayout3(v7, "(", (char *)&value witness table for Builtin.Int64 + 64, v4);
    v10[3] = v7;
    uint64_t result = type metadata accessor for UnlockDevicePolicy(319LL);
    if (v5 <= 0x3F)
    {
      swift_getTupleTypeLayout2(v6, *(void *)(result - 8) + 64LL, v4);
      v10[4] = v6;
      v10[5] = &unk_31C60;
      v10[6] = &unk_31C78;
      swift_initEnumMetadataMultiPayload(a1, 256LL, 7LL, v10);
      return 0LL;
    }
  }

  return result;
}