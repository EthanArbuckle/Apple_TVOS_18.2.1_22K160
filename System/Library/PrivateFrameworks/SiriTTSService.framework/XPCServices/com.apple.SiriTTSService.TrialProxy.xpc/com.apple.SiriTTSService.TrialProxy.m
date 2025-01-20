int main(int argc, const char **argv, const char **envp)
{
  sub_1000039CC(0LL, &qword_1000082F0, &OBJC_CLASS___OS_os_log_ptr);
  qword_1000083E0 = OS_os_log.init(subsystem:category:)( 0xD000000000000012LL,  0x8000000100003C00LL,  0x7465737361LL,  0xE500000000000000LL);
  xpc_main((xpc_connection_handler_t)sub_100003358);
}

uint64_t sub_100003358(_xpc_connection_s *a1)
{
  uint64_t v2 = swift_unknownObjectRetain(a1);
  uint64_t v3 = static os_log_type_t.info.getter(v2);
  os_log(_:dso:log:_:_:)( v3,  &_mh_execute_header,  qword_1000083E0,  "Starting xpc connection handler",  31LL,  2LL,  &_swiftEmptyArrayStorage);
  uint64_t v4 = swift_allocObject(&unk_100004240, 24LL, 7LL);
  *(void *)(v4 + 16) = a1;
  v8[4] = sub_10000377C;
  uint64_t v9 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_1000037B0;
  v8[3] = &unk_100004258;
  v5 = _Block_copy(v8);
  uint64_t v6 = v9;
  swift_unknownObjectRetain(a1);
  swift_release(v6);
  xpc_connection_set_event_handler(a1, v5);
  _Block_release(v5);
  xpc_connection_resume(a1);
  return swift_unknownObjectRelease(a1);
}

uint64_t sub_10000344C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v33 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  __chkstk_darwin();
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  xpc_type_t type = xpc_get_type(a1);
  if (type != (xpc_type_t)XPC_TYPE_ERROR.getter())
  {
    sub_1000039CC(0LL, &qword_100008358, &OBJC_CLASS___OS_dispatch_queue_ptr);
    (*(void (**)(char *, void, uint64_t))(v12 + 104))( v14,  enum case for DispatchQoS.QoSClass.userInitiated(_:),  v11);
    uint64_t v16 = static OS_dispatch_queue.global(qos:)(v14);
    uint64_t v32 = v5;
    v17 = (void *)v16;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v18 = swift_allocObject(&unk_100004290, 32LL, 7LL);
    *(void *)(v18 + 16) = a1;
    *(void *)(v18 + 24) = a2;
    aBlock[4] = sub_10000383C;
    uint64_t v37 = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100003784;
    aBlock[3] = &unk_1000042A8;
    v19 = _Block_copy(aBlock);
    swift_unknownObjectRetain(a1);
    uint64_t v20 = swift_unknownObjectRetain(a2);
    static DispatchQoS.unspecified.getter(v20);
    v35 = &_swiftEmptyArrayStorage;
    unint64_t v21 = sub_1000038B4();
    uint64_t v22 = sub_1000038FC(&qword_100008368);
    unint64_t v23 = sub_10000393C();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v35, v22, v23, v4, v21);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v10, v7, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v34);
    return swift_release(v37);
  }

  uint64_t v25 = XPC_ERROR_CONNECTION_INVALID.getter();
  uint64_t v26 = swift_unknownObjectRelease(v25);
  if ((void *)v25 == a1)
  {
    uint64_t v28 = static os_log_type_t.info.getter(v26);
    uint64_t v29 = qword_1000083E0;
    v30 = "Peer has gone away, get rid of any resources we may have allocated for them";
    uint64_t v31 = 75LL;
    return os_log(_:dso:log:_:_:)(v28, &_mh_execute_header, v29, v30, v31, 2LL, &_swiftEmptyArrayStorage);
  }

  uint64_t v27 = XPC_ERROR_TERMINATION_IMMINENT.getter(v26);
  uint64_t result = swift_unknownObjectRelease(v27);
  if ((void *)v27 == a1)
  {
    uint64_t v28 = static os_log_type_t.info.getter(result);
    uint64_t v29 = qword_1000083E0;
    v30 = "Peer about to go away, shut down gracefully";
    uint64_t v31 = 43LL;
    return os_log(_:dso:log:_:_:)(v28, &_mh_execute_header, v29, v30, v31, 2LL, &_swiftEmptyArrayStorage);
  }

  return result;
}

uint64_t sub_100003758()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000377C(void *a1)
{
  return sub_10000344C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100003784(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_1000037B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000037F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003808(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100003810()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000383C()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(_xpc_connection_s **)(v0 + 24);
  xpc_object_t reply = xpc_dictionary_create_reply(v2);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create_empty();
  }
  sub_1000039CC(0LL, &qword_100008378, &OBJC_CLASS___TTSAsset_ptr);
  static TTSAsset.handleProxy(event:reply:connection:)(v2, reply, v1);
  xpc_connection_send_message(v1, reply);
  return swift_unknownObjectRelease(reply);
}

unint64_t sub_1000038B4()
{
  unint64_t result = qword_100008360;
  if (!qword_100008360)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100008360);
  }

  return result;
}

uint64_t sub_1000038FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10000393C()
{
  unint64_t result = qword_100008370;
  if (!qword_100008370)
  {
    uint64_t v1 = sub_100003988(&qword_100008368);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100008370);
  }

  return result;
}

uint64_t sub_100003988(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000039CC(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}