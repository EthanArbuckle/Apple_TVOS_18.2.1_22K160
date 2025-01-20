uint64_t variable initialization expression of MLServerDelegate.mediaML()
{
  uint64_t v0;
  uint64_t v2;
  v2 = 0LL;
  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  return OSAllocatedUnfairLock<A>.init(initialState:)((uint64_t)&v2, v0);
}

uint64_t OSAllocatedUnfairLock<A>.init(initialState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v11 = a2;
  uint64_t v7 = *(void *)(a2 - 8);
  unint64_t v5 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v6 = (uint64_t)&v4 - v5;
  (*(void (**)(void))(v2 + 16))();
  uint64_t v10 = OSAllocatedUnfairLock.init(uncheckedState:)(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0LL);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }

  return v4;
}

void key path getter for MLServerDelegate.mediaML : MLServerDelegate(id *a1@<X0>, void *a2@<X8>)
{
  v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & swift_isaMask) + 0x58LL))(v2);
}

void key path setter for MLServerDelegate.mediaML : MLServerDelegate(uint64_t *a1, id *a2)
{
  uint64_t v5 = v6;
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t))((*v4 & swift_isaMask) + 0x60LL))(v5);
}

uint64_t MLServerDelegate.mediaML.getter()
{
  uint64_t v5 = 0LL;
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess(v4);
  return v3;
}

uint64_t MLServerDelegate.mediaML.setter(uint64_t a1)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = a1;
  swift_retain();
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML);
  swift_beginAccess();
  uint64_t v2 = *v4;
  *uint64_t v4 = a1;
  swift_release(v2);
  swift_endAccess(v6);
  return swift_release(a1);
}

uint64_t (*MLServerDelegate.mediaML.modify())(uint64_t a1)
{
  return MLServerDelegate.mediaML.modify;
}

uint64_t MLServerDelegate.mediaML.modify(uint64_t a1)
{
  return swift_endAccess(a1);
}

uint64_t one-time initialization function for logger()
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v3, static MLServerDelegate.logger);
  __swift_project_value_buffer(v3, (uint64_t)static MLServerDelegate.logger);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MLServerDelegate", 0x10uLL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

{
  Swift::String v0;
  Swift::String v1;
  uint64_t v3;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v3, static MLServer.logger);
  __swift_project_value_buffer(v3, (uint64_t)static MLServer.logger);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.mediamlxpc", 0x14uLL, 1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MLServer", 8uLL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc( *(void *)(*(void *)(a1 - 8) + 64LL),  *(_DWORD *)(*(void *)(a1 - 8) + 80LL));
    *a2 = v2;
    return v2;
  }

  return (uint64_t)v5;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t MLServerDelegate.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)( &one-time initialization token for logger,  one-time initialization function for logger);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)static MLServerDelegate.logger);
}

uint64_t static MLServerDelegate.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = MLServerDelegate.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16LL))(a1, v3);
}

Swift::Void __swiftcall MLServerDelegate.ensureMediaML()()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = 0LL;
  unint64_t v8 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                              - 8)
                  + 64LL)
      + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v10 = (char *)&v8 - v8;
  uint64_t v11 = v0;
  uint64_t v1 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 56LL))(v10, 1LL);
  id v2 = v0;
  uint64_t v3 = swift_allocObject(&unk_100010450, 48LL, 7LL);
  uint64_t v4 = ObjectType;
  uint64_t v5 = (void *)v3;
  uint64_t v6 = (uint64_t)v10;
  v5[2] = 0LL;
  v5[3] = 0LL;
  v5[4] = v0;
  v5[5] = v4;
  uint64_t v7 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( v6,  (uint64_t)&async function pointer to partial apply for closure #1 in MLServerDelegate.ensureMediaML(),  (uint64_t)v5,  (uint64_t)&type metadata for () + 8);
  swift_release(v7);
}

uint64_t closure #1 in MLServerDelegate.ensureMediaML()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  v4[2] = v4;
  v4[3] = 0LL;
  v4[4] = 0LL;
  v4[6] = 0LL;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[9] = v6;
  v4[10] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v4[3] = a4;
  type metadata accessor for MediaML(0LL);
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to MediaML.__allocating_init()[1]);
  *(void *)(v10 + 88) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = closure #1 in MLServerDelegate.ensureMediaML();
  return MediaML.__allocating_init()();
}

uint64_t closure #1 in MLServerDelegate.ensureMediaML()(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 88LL);
  v4[2] = *(void *)v2;
  v4[12] = a1;
  v4[13] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    return swift_task_switch(closure #1 in MLServerDelegate.ensureMediaML(), 0LL);
  }
  else {
    return swift_task_switch(closure #1 in MLServerDelegate.ensureMediaML(), 0LL);
  }
}

void closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t v1 = v0[13];
  uint64_t v6 = v0[12];
  uint64_t v2 = (void *)v0[7];
  v0[2] = v0;
  v0[6] = v6;
  uint64_t v7 = (*(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x58LL))();
  swift_retain(v6);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  OSAllocatedUnfairLock.withLock<A>(_:)( (void (*)(uint64_t))partial apply for closure #1 in closure #1 in MLServerDelegate.ensureMediaML(),  v6,  v7,  v3,  (uint64_t)&type metadata for () + 8);
  if (!v1)
  {
    uint64_t v4 = v5[12];
    swift_release(v4);
    swift_release(v7);
    swift_release(v4);
    swift_task_dealloc(v5[10]);
    (*(void (**)(void))(v5[2] + 8LL))();
  }
}

uint64_t closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v17 = *(void *)(v0 + 72);
  uint64_t v18 = *(void *)(v0 + 64);
  *(void *)(v0 + 16) = v0;
  ((void (*)(void))swift_errorRetain)();
  *(void *)(v0 + 32) = v19;
  uint64_t v2 = MLServerDelegate.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v2, v18);
  swift_errorRetain(v19);
  uint64_t v23 = swift_allocObject(&unk_100010578, 24LL, 7LL);
  *(void *)(v23 + 16) = v19;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  uint64_t v4 = swift_bridgeObjectRelease(v3);
  v31 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v32 = static os_log_type_t.error.getter();
  *(void *)(v0 + 40) = 12LL;
  unint64_t v20 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v21 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v5 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v0 + 40, &type metadata for UInt32, &type metadata for Int, v20, v21, v5);
  uint32_t size = *(_DWORD *)(v0 + 112);
  uint64_t v26 = swift_allocObject(&unk_1000105A0, 17LL, 7LL);
  *(_BYTE *)(v26 + 16) = 64;
  uint64_t v27 = swift_allocObject(&unk_1000105C8, 17LL, 7LL);
  *(_BYTE *)(v27 + 16) = 8;
  uint64_t v24 = swift_allocObject(&unk_1000105F0, 32LL, 7LL);
  *(void *)(v24 + 16) = partial apply for implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML();
  *(void *)(v24 + 24) = v23;
  uint64_t v25 = swift_allocObject(&unk_100010618, 32LL, 7LL);
  *(void *)(v25 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(void *)(v25 + 24) = v24;
  uint64_t v29 = swift_allocObject(&unk_100010640, 32LL, 7LL);
  *(void *)(v29 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(void *)(v29 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v28 = _allocateUninitializedArray<A>(_:)(3LL);
  v30 = v6;
  swift_retain(v26);
  void *v30 = partial apply for closure #1 in OSLogArguments.append(_:);
  v30[1] = v26;
  swift_retain(v27);
  v30[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[3] = v27;
  swift_retain(v29);
  v30[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v30[5] = v29;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v28);
  if (os_log_type_enabled(v31, v32))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v14 = createStorage<A>(capacity:type:)(1LL, v12, v12);
    uint64_t v15 = createStorage<A>(capacity:type:)( 0LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    v33 = buf;
    uint64_t v34 = v14;
    uint64_t v35 = v15;
    serialize(_:at:)(2LL, &v33);
    serialize(_:at:)(1LL, &v33);
    v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v37 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v37 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to init MediaML due to error=%@", buf, size);
    destroyStorage<A>(_:count:)(v14, 1LL);
    destroyStorage<A>(_:count:)(v15, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_release(v26);
    swift_release(v27);
    swift_release(v29);
  }

  else
  {
    swift_release(v26);
    swift_release(v27);
    swift_release(v29);
  }

  uint64_t v11 = v16[13];
  uint64_t v9 = v16[10];
  uint64_t v8 = v16[9];
  uint64_t v10 = v16[8];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease(v11);
  swift_errorRelease(v11);
  swift_task_dealloc(v16[10]);
  return (*(uint64_t (**)(void))(v16[2] + 8LL))();
}

uint64_t sub_1000031F0()
{
  return swift_deallocObject(v2, 48LL, 7LL);
}

uint64_t partial apply for closure #1 in MLServerDelegate.ensureMediaML()(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_10001479C);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = partial apply for closure #1 in MLServerDelegate.ensureMediaML();
  return closure #1 in MLServerDelegate.ensureMediaML()(a1, v5, v6, v7);
}

uint64_t partial apply for closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t closure #1 in closure #1 in MLServerDelegate.ensureMediaML()(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  return swift_release(v2);
}

void OSAllocatedUnfairLock.withLock<A>(_:)( void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML()()
{
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1)._countAndFlagsBits;
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    outlined destroy of TaskPriority?(a1);
    uint64_t v16 = 0LL;
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
    uint64_t v16 = v15;
  }

  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v14)
  {
    uint64_t ObjectType = swift_getObjectType(v14);
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v13);
    uint64_t v10 = v5;
    swift_unknownObjectRelease(v14);
    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  uint64_t v7 = (void *)swift_allocObject(&unk_100010550, 40LL, 7LL);
  v7[2] = a4;
  v7[3] = a2;
  v7[4] = a3;
  uint64_t v8 = 0LL;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v23[2] = v11;
    v23[3] = v12;
    uint64_t v8 = v23;
  }

  return swift_task_create(v16 | 0x1C00, v8, a4, &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATu, v7);
}

id MLServerDelegate.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void *MLServerDelegate.init()()
{
  id v1 = v0;
  id v11 = v0;
  uint64_t v6 = OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML;
  uint64_t v10 = 0LL;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  *(void *)&v7[v6] = OSAllocatedUnfairLock<A>.init(initialState:)((uint64_t)&v10, v2);

  v9.receiver = v11;
  v9.super_class = (Class)type metadata accessor for MLServerDelegate();
  uint64_t v8 = objc_msgSendSuper2(&v9, "init");
  uint64_t v3 = v8;
  uint64_t v4 = v8;
  id v11 = v8;
  (*(void (**)(void))((*v8 & swift_isaMask) + 0x70LL))();

  return v8;
}

uint64_t type metadata accessor for MLServerDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC10mediamlxpc16MLServerDelegate);
}

Swift::Bool __swiftcall MLServerDelegate.listener(_:shouldAcceptNewConnection:)( NSXPCListener *_, NSXPCConnection *shouldAcceptNewConnection)
{
  uint64_t v12 = (*(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x58LL))();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  OSAllocatedUnfairLock.withLock<A>(_:)( (void (*)(uint64_t))closure #1 in MLServerDelegate.listener(_:shouldAcceptNewConnection:),  0LL,  v12,  v3,  v3);
  uint64_t v4 = swift_release();
  if (v14)
  {
    type metadata accessor for MLServer();
    swift_retain();
    id v13 = MLServer.__allocating_init(mediaML:)(v14);
    type metadata accessor for NSXPCInterface();
    uint64_t v5 = &OBJC_PROTOCOL____TtP10mediamlxpc16MLServerProtocol_;
    id v8 = @nonobjc NSXPCInterface.__allocating_init(with:)(&OBJC_PROTOCOL____TtP10mediamlxpc16MLServerProtocol_);
    -[NSXPCConnection setExportedInterface:](shouldAcceptNewConnection, "setExportedInterface:");

    id v6 = v13;
    -[NSXPCConnection setExportedObject:](shouldAcceptNewConnection, "setExportedObject:", v13);
    swift_unknownObjectRelease(v13);
    -[NSXPCConnection activate](shouldAcceptNewConnection, "activate");

    swift_release();
    return 1;
  }

  else
  {
    (*(void (**)(uint64_t))((*v11 & swift_isaMask) + 0x70LL))(v4);
    return 0;
  }

void *closure #1 in MLServerDelegate.listener(_:shouldAcceptNewConnection:)@<X0>( uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of MediaML?(a1, a2);
}

unint64_t type metadata accessor for NSXPCInterface()
{
  uint64_t v3 = lazy cache variable for type metadata for NSXPCInterface;
  if (!lazy cache variable for type metadata for NSXPCInterface)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___NSXPCInterface);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSXPCInterface);
    return ObjCClassMetadata;
  }

  return v3;
}

id @nonobjc NSXPCInterface.__allocating_init(with:)(void *a1)
{
  id v4 = [(id)swift_getObjCClassFromMetadata(v1) interfaceWithProtocol:a1];

  return v4;
}

id MLServerDelegate.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MLServerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of OSAllocatedUnfairLock<MediaML?>( void *a1)
{
}

void *outlined init with copy of OSAllocatedUnfairLock<MediaML?>(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  result = a2;
  *a2 = v4;
  return result;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void destroyStorage<A>(_:count:)(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }

uint64_t OSAllocatedUnfairLock.init(uncheckedState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a2;
  uint64_t v2 = type metadata accessor for os_unfair_lock_s(255LL);
  type metadata accessor for ManagedBuffer(0LL, a2, v2);
  uint64_t v8 = a1;
  uint64_t v6 = static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)( 1LL,  partial apply for closure #1 in OSAllocatedUnfairLock.init(uncheckedState:),  v7);
  (*(void (**)(uint64_t))(*(void *)(a2 - 8) + 8LL))(a1);
  return v6;
}

uint64_t closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3LL) & 0xFFFFFFFFFFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v4 + class metadata base offset for ManagedBuffer)
                                                        - 8LL)
                                            + 16LL))(a2);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v5(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

void OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)( void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[1] = a5;
  closure #1 in OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)( a3 + *(void *)(*(void *)a3 + class metadata base offset for ManagedBuffer + 16LL),  (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48LL) + 3LL) & 0xFFFFFFFFFFFFFFFCLL)),  a1,  a2,  a4,  a5,  v5);
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)( uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  uint64_t v4 = (void *)_swift_stdlib_bridgeErrorToNSError(v1);
  id v2 = v4;
  swift_unknownObjectRelease(v4);
  return v4;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)( uint64_t (*a1)(void))
{
  return a1();
}

void closure #1 in OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)( uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (v10) {
    *a7 = v10;
  }
}

void *outlined init with copy of MediaML?(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  result = a2;
  *a2 = v4;
  return result;
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_100004180()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_10001483C);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu))( a1,  v5);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000042D8()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML()();
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for UInt32,  &type metadata for UInt32);
    atomic_store( v0,  (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return v0;
  }

  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }

  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }

  return v2;
}

Swift::Void __swiftcall Array._endMutation()()
{
  *unint64_t v0 = *v0;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t sub_100004474()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **partial apply for closure #1 in OSLogArguments.append(_:)(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000044A4()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **closure #1 in OSLogArguments.append(_:)partial apply(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000044D4()
{
  return swift_deallocObject(v2, 32LL);
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000451C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v7 = (id)a4();
  uint64_t v8 = *a1;
  uint64_t v9 = *a1 + 8;
  if (v7)
  {
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8, v9);
  }

  else
  {
    uint64_t v11 = 0LL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8, v9);
  }

  *a1 = v8 + 8;
  uint64_t v4 = *a2;
  if (*a2)
  {
    *uint64_t v4 = v7;
    *a2 = v4 + 1;
  }

  else
  {
  }

uint64_t sub_1000046A0()
{
  return swift_deallocObject(v2, 32LL);
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
}

uint64_t partial apply for closure #1 in closure #1 in MLServerDelegate.ensureMediaML()(uint64_t *a1)
{
  return closure #1 in closure #1 in MLServerDelegate.ensureMediaML()(a1, v1);
}

uint64_t type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  uint64_t v5 = lazy cache variable for type metadata for os_unfair_lock_s;
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100010668);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
      return v2;
    }
  }

  return v5;
}

uint64_t partial apply for closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)(a1, a2);
}

uint64_t one-time initialization function for semaphoreTimeoutValue()
{
  uint64_t v1 = type metadata accessor for DispatchTimeInterval(0LL);
  __swift_allocate_value_buffer(v1, semaphoreTimeoutValue);
  *(void *)__swift_project_value_buffer(v1, (uint64_t)semaphoreTimeoutValue) = 1LL;
  return (*(uint64_t (**)(void))(*(void *)(v1 - 8) + 104LL))();
}

uint64_t semaphoreTimeoutValue.unsafeMutableAddressor()
{
  if (one-time initialization token for semaphoreTimeoutValue != -1) {
    swift_once( &one-time initialization token for semaphoreTimeoutValue,  one-time initialization function for semaphoreTimeoutValue);
  }
  uint64_t v0 = type metadata accessor for DispatchTimeInterval(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)semaphoreTimeoutValue);
}

uint64_t one-time initialization function for priority()
{
  uint64_t v1 = type metadata accessor for TaskPriority(0LL);
  __swift_allocate_value_buffer(v1, priority);
  __swift_project_value_buffer(v1, (uint64_t)priority);
  return static TaskPriority.high.getter();
}

uint64_t priority.unsafeMutableAddressor()
{
  if (one-time initialization token for priority != -1) {
    swift_once(&one-time initialization token for priority, one-time initialization function for priority);
  }
  uint64_t v0 = type metadata accessor for TaskPriority(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)priority);
}

uint64_t MLServer.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return __swift_project_value_buffer(v0, (uint64_t)static MLServer.logger);
}

uint64_t static MLServer.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16LL))(a1, v3);
}

uint64_t MLServer.mediaML.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  return v2;
}

id MLServer.__allocating_init(mediaML:)(uint64_t a1)
{
  id v2 = objc_allocWithZone(v1);
  return MLServer.init(mediaML:)(a1);
}

id MLServer.init(mediaML:)(uint64_t a1)
{
  uint64_t v9 = a1;
  id v2 = v1;
  id v10 = v1;
  swift_retain(a1);
  *(void *)&v5[OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML] = a1;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for MLServer();
  id v7 = objc_msgSendSuper2(&v8, "init");
  id v3 = v7;
  id v10 = v7;
  swift_release(a1);

  return v7;
}

uint64_t type metadata accessor for MLServer()
{
  return objc_opt_self(&OBJC_CLASS____TtC10mediamlxpc8MLServer);
}

void MLServer.getPrediction(inputFeatures:with:)( uint64_t a1, void (*a2)(void, double), uint64_t a3)
{
  uint64_t v130 = a1;
  v121 = a2;
  uint64_t v119 = a3;
  id v120 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v167 = 0LL;
  uint64_t v165 = 0LL;
  uint64_t v166 = 0LL;
  uint64_t v164 = 0LL;
  dispatch_semaphore_t v161 = 0LL;
  char v160 = 0;
  uint64_t v105 = 0LL;
  uint64_t v116 = 0LL;
  uint64_t v106 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v107 = *(void *)(v106 - 8);
  unint64_t v108 = (*(void *)(v107 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(0LL);
  v109 = (char *)&v64 - v108;
  uint64_t v110 = type metadata accessor for DispatchTime(v4);
  uint64_t v111 = *(void *)(v110 - 8);
  unint64_t v112 = (*(void *)(v111 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v110);
  v113 = (char *)&v64 - v112;
  unint64_t v114 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin((char *)&v64 - v112);
  v115 = (char *)&v64 - v114;
  unint64_t v117 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64LL)
        + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v116);
  v118 = (char *)&v64 - v117;
  uint64_t v128 = type metadata accessor for Logger(v6);
  v127 = *(void **)(v128 - 8);
  uint64_t v123 = v127[8];
  unint64_t v122 = (v123 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v130);
  v124 = (char *)&v64 - v122;
  unint64_t v125 = (v123 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v64 - v125;
  v126 = (char *)&v64 - v125;
  uint64_t v167 = v8;
  uint64_t v165 = v10;
  uint64_t v166 = v11;
  uint64_t v164 = v12;
  uint64_t v13 = MLServer.logger.unsafeMutableAddressor();
  v129 = (void (*)(char *, uint64_t, uint64_t))v127[2];
  v129(v9, v13, v128);
  swift_bridgeObjectRetain(v130);
  uint64_t v139 = 7LL;
  uint64_t v131 = swift_allocObject(&unk_100010690, 24LL, 7LL);
  *(void *)(v131 + 16) = v130;
  swift_retain();
  uint64_t v138 = 32LL;
  uint64_t v14 = swift_allocObject(&unk_1000106B8, 32LL, v139);
  uint64_t v15 = v131;
  uint64_t v140 = v14;
  *(void *)(v14 + 16) = partial apply for implicit closure #1 in MLServer.getPrediction(inputFeatures:with:);
  *(void *)(v14 + 24) = v15;
  uint64_t v16 = swift_release();
  v148 = (os_log_s *)Logger.logObject.getter(v16);
  int v149 = static os_log_type_t.debug.getter();
  v134 = &v162;
  uint64_t v162 = 12LL;
  unint64_t v132 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v133 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v135 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v134, &type metadata for UInt32, &type metadata for Int, v132, v133, v135);
  uint32_t v136 = v163;
  uint64_t v137 = 17LL;
  uint64_t v17 = swift_allocObject(&unk_1000106E0, 17LL, v139);
  uint64_t v18 = v137;
  uint64_t v19 = v139;
  uint64_t v142 = v17;
  *(_BYTE *)(v17 + 16) = 32;
  uint64_t v20 = swift_allocObject(&unk_100010708, v18, v19);
  uint64_t v21 = v138;
  uint64_t v22 = v139;
  uint64_t v143 = v20;
  *(_BYTE *)(v20 + 16) = 8;
  uint64_t v23 = swift_allocObject(&unk_100010730, v21, v22);
  uint64_t v24 = v138;
  uint64_t v25 = v139;
  uint64_t v26 = v23;
  uint64_t v27 = v140;
  uint64_t v141 = v26;
  *(void *)(v26 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
  *(void *)(v26 + 24) = v27;
  uint64_t v28 = swift_allocObject(&unk_100010758, v24, v25);
  uint64_t v29 = v141;
  uint64_t v145 = v28;
  *(void *)(v28 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v28 + 24) = v29;
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v144 = _allocateUninitializedArray<A>(_:)(3LL);
  v146 = v30;
  swift_retain();
  uint64_t v31 = v142;
  os_log_type_t v32 = v146;
  void *v146 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v32[1] = v31;
  swift_retain();
  uint64_t v33 = v143;
  uint64_t v34 = v146;
  v146[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v34[3] = v33;
  swift_retain();
  uint64_t v35 = v144;
  uint64_t v36 = v145;
  uint64_t v37 = v146;
  v146[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v37[5] = v36;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v35);
  if (os_log_type_enabled(v148, (os_log_type_t)v149))
  {
    uint64_t v38 = v105;
    v97 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v98 = createStorage<A>(capacity:type:)(0LL, v96, v96);
    uint64_t v99 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    v100 = v154;
    v154[0] = v97;
    v101 = &v153;
    uint64_t v153 = v98;
    v102 = &v152;
    uint64_t v152 = v99;
    serialize(_:at:)(2LL, v154);
    serialize(_:at:)(1LL, v100);
    v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    uint64_t v151 = v142;
    closure #1 in osLogInternal(_:log:type:)(&v150, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102);
    uint64_t v103 = v38;
    if (v38)
    {
      __break(1u);
    }

    else
    {
      v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v151 = v143;
      closure #1 in osLogInternal(_:log:type:)(&v150, (uint64_t)v154, (uint64_t)&v153, (uint64_t)&v152);
      uint64_t v94 = 0LL;
      uint64_t v40 = v94;
      v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v151 = v145;
      closure #1 in osLogInternal(_:log:type:)(&v150, (uint64_t)v154, (uint64_t)&v153, (uint64_t)&v152);
      uint64_t v93 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v148,  (os_log_type_t)v149,  "Called into getPrediction with inputFeatures: %s",  v97,  v136);
      destroyStorage<A>(_:count:)(v98, 0LL);
      destroyStorage<A>(_:count:)(v99, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v95 = v93;
    }
  }

  else
  {
    uint64_t v39 = v105;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v95 = v39;
  }

  uint64_t v82 = v95;

  v83 = (void (*)(char *, uint64_t))v127[1];
  v83(v126, v128);
  uint64_t v85 = 0LL;
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v84 = v41;
  dispatch_semaphore_t v161 = v41;
  uint64_t v86 = priority.unsafeMutableAddressor();
  uint64_t v88 = type metadata accessor for TaskPriority(v85);
  uint64_t v87 = *(void *)(v88 - 8);
  (*(void (**)(char *, uint64_t))(v87 + 16))(v118, v86);
  v42 = *(void (**)(char *, void))(v87 + 56);
  int v92 = 1;
  v42(v118, 0LL);
  id v43 = v120;
  swift_bridgeObjectRetain(v130);
  swift_retain();
  v44 = v41;
  uint64_t v45 = swift_allocObject(&unk_100010780, 88LL, 7LL);
  id v46 = v120;
  uint64_t v47 = v130;
  v48 = v121;
  uint64_t v49 = v119;
  uint64_t v50 = ObjectType;
  v51 = (void *)v45;
  uint64_t v52 = (uint64_t)v118;
  v89 = v51;
  v51[2] = 0LL;
  v51[3] = 0LL;
  v51[4] = v46;
  v51[5] = v47;
  v51[6] = v48;
  v51[7] = v49;
  v51[8] = v41;
  v51[9] = 0LL;
  v51[10] = v50;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( v52,  (uint64_t)&async function pointer to partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:),  (uint64_t)v51,  (uint64_t)&type metadata for () + 8);
  uint64_t v53 = swift_release();
  static DispatchTime.now()(v53);
  uint64_t v54 = semaphoreTimeoutValue.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v109, v54, v106);
  + infix(_:_:)(v113, v109);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v109, v106);
  v90 = *(void (**)(char *, uint64_t))(v111 + 8);
  v90(v113, v110);
  int v91 = OS_dispatch_semaphore.wait(timeout:)(v115);
  v90(v115, v110);
  char v160 = v91 & 1 & v92;
  if ((static DispatchTimeoutResult.== infix(_:_:)(v91 & 1) & 1) != 0)
  {
    v55 = v124;
    uint64_t v56 = MLServer.logger.unsafeMutableAddressor();
    uint64_t v57 = ((uint64_t (*)(char *, uint64_t, uint64_t))v129)(v55, v56, v128);
    v80 = (os_log_s *)Logger.logObject.getter(v57);
    int v79 = static os_log_type_t.error.getter();
    uint64_t v158 = 2LL;
    UnsignedInteger<>.init<A>(_:)(&v158, &type metadata for UInt32, &type metadata for Int, v132, v133, v135);
    uint32_t v78 = v159;
    v81 = (_BYTE *)_allocateUninitializedArray<A>(_:)(0LL);
    if (os_log_type_enabled(v80, (os_log_type_t)v79))
    {
      uint64_t v58 = v82;
      v68 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v67 = 0LL;
      uint64_t v69 = createStorage<A>(capacity:type:)(0LL, v66, v66);
      uint64_t v70 = createStorage<A>(capacity:type:)( v67,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      v74 = &v157;
      v157 = v68;
      v75 = &v156;
      uint64_t v156 = v69;
      v72 = &v155;
      uint64_t v155 = v70;
      unsigned int v71 = 0;
      serialize(_:at:)(0LL, &v157);
      serialize(_:at:)(v71, v74);
      v154[1] = v81;
      v73 = &v64;
      __chkstk_darwin(&v64);
      v59 = v75;
      v60 = &v64 - 6;
      v76 = &v64 - 6;
      v60[2] = (uint64_t)v74;
      v60[3] = (uint64_t)v59;
      v60[4] = v61;
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      unint64_t v62 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)(partial apply for closure #1 in osLogInternal(_:log:type:), v76, v77, v62);
      if (v58)
      {
        __break(1u);
      }

      else
      {
        _os_log_impl((void *)&_mh_execute_header, v80, (os_log_type_t)v79, "getPrediction timed-out", v68, v78);
        uint64_t v65 = 0LL;
        destroyStorage<A>(_:count:)(v69, 0LL);
        destroyStorage<A>(_:count:)(v70, v65);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease(v81);
      }
    }

    else
    {
      swift_bridgeObjectRelease(v81);
    }

    v83(v124, v128);
    uint64_t v63 = swift_retain();
    v121(v63, 0.0);
    swift_release();
  }
}

uint64_t implicit closure #1 in MLServer.getPrediction(inputFeatures:with:)@<X0>( uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_100005A98()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #1 in MLServer.getPrediction(inputFeatures:with:)@<X0>( void *a1@<X8>)
{
  return implicit closure #1 in MLServer.getPrediction(inputFeatures:with:)(*(void *)(v1 + 16), a1);
}

uint64_t closure #1 in MLServer.getPrediction(inputFeatures:with:)( double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(double *)(v9 + 144) = a1;
  *(void *)(v9 + 136) = a9;
  *(void *)(v9 + 128) = a8;
  *(void *)(v9 + 120) = a7;
  *(void *)(v9 + 112) = a6;
  *(void *)(v9 + 104) = a5;
  *(void *)(v9 + 32) = v9;
  *(void *)(v9 + 40) = 0LL;
  *(void *)(v9 + 48) = 0LL;
  *(void *)(v9 + 16) = 0LL;
  *(void *)(v9 + 24) = 0LL;
  *(void *)(v9 + 56) = 0LL;
  *(void *)(v9 + 64) = 0LL;
  *(void *)(v9 + 80) = 0LL;
  *(void *)(v9 + 96) = 0LL;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  *(void *)(v9 + 152) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v9 + 160) = v11;
  *(void *)(v9 + 168) = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v9 + 40) = a5;
  *(void *)(v9 + 48) = a6;
  *(void *)(v9 + 16) = a7;
  *(void *)(v9 + 24) = a8;
  *(void *)(v9 + 56) = a9;
  *(double *)(v9 + 64) = a1;
  return swift_task_switch(closure #1 in MLServer.getPrediction(inputFeatures:with:), 0LL);
}

uint64_t closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
  uint64_t v1 = v0[13];
  v0[4] = v0;
  v0[22] = *(void *)(v1 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to MediaML.getPrediction(data:)[1]);
  v4[23] = v2;
  *uint64_t v2 = v4[4];
  v2[1] = closure #1 in MLServer.getPrediction(inputFeatures:with:);
  return MediaML.getPrediction(data:)(v4[14]);
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  double v5;
  void (*v6)(uint64_t, double);
  uint64_t v7;
  double *v8;
  uint64_t v1 = *(_BYTE *)(v0 + 212);
  uint64_t v2 = *(void *)(v0 + 200);
  *(void *)(v0 + 32) = v0;
  if ((v1 & 1) != 0) {
    v8[9] = 0.0;
  }
  else {
    *((void *)v8 + 9) = v2;
  }
  uint64_t v7 = *((void *)v8 + 16);
  uint64_t v6 = (void (*)(uint64_t, double))*((void *)v8 + 15);
  uint64_t v5 = v8[9];
  v8[12] = v5;
  id v3 = swift_retain(v7);
  v6(v3, v5);
  swift_release(v7);
  OS_dispatch_semaphore.signal()();
  swift_task_dealloc(*((void *)v8 + 21));
  return (*(uint64_t (**)(void))(*((void *)v8 + 4) + 8LL))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void (*v13)(uint64_t, double);
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  os_log_s *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v20 = *(void *)(v0 + 160);
  uint64_t v21 = *(void *)(v0 + 152);
  *(void *)(v0 + 32) = v0;
  swift_release();
  swift_errorRetain(v22);
  *(void *)(v0 + 80) = v22;
  uint64_t v2 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v2, v21);
  swift_errorRetain(v22);
  uint64_t v26 = swift_allocObject(&unk_100010C80, 24LL, 7LL);
  *(void *)(v26 + 16) = v22;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  uint64_t v4 = swift_bridgeObjectRelease(v3);
  uint64_t v34 = (os_log_s *)Logger.logObject.getter(v4);
  uint64_t v35 = static os_log_type_t.error.getter();
  *(void *)(v0 + 88) = 12LL;
  uint64_t v23 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  uint64_t v24 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  uint64_t v5 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v0 + 88, &type metadata for UInt32, &type metadata for Int, v23, v24, v5);
  uint64_t v25 = *(_DWORD *)(v0 + 208);
  uint64_t v29 = swift_allocObject(&unk_100010CA8, 17LL, 7LL);
  *(_BYTE *)(v29 + 16) = 64;
  v30 = swift_allocObject(&unk_100010CD0, 17LL, 7LL);
  *(_BYTE *)(v30 + 16) = 8;
  uint64_t v27 = swift_allocObject(&unk_100010CF8, 32LL, 7LL);
  *(void *)(v27 + 16) = partial apply for implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:);
  *(void *)(v27 + 24) = v26;
  uint64_t v28 = swift_allocObject(&unk_100010D20, 32LL, 7LL);
  *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v28 + 24) = v27;
  os_log_type_t v32 = swift_allocObject(&unk_100010D48, 32LL, 7LL);
  *(void *)(v32 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v32 + 24) = v28;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v31 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v33 = v6;
  swift_retain();
  uint8_t *v33 = closure #1 in OSLogArguments.append(_:)partial apply;
  v33[1] = v29;
  swift_retain();
  v33[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v33[3] = v30;
  swift_retain();
  v33[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v33[5] = v32;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v31);
  if (os_log_type_enabled(v34, v35))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v17 = createStorage<A>(capacity:type:)(1LL, v15, v15);
    uint64_t v18 = createStorage<A>(capacity:type:)( 0LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v36 = buf;
    uint64_t v37 = v17;
    uint64_t v38 = v18;
    serialize(_:at:)(2LL, &v36);
    serialize(_:at:)(1LL, &v36);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v40 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v36, (uint64_t)&v37, (uint64_t)&v38);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v40 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v36, (uint64_t)&v37, (uint64_t)&v38);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v40 = v32;
    closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v36, (uint64_t)&v37, (uint64_t)&v38);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to get prediction with error=%@", buf, v25);
    destroyStorage<A>(_:count:)(v17, 1LL);
    destroyStorage<A>(_:count:)(v18, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }

  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  uint64_t v14 = *((void *)v19 + 24);
  uint64_t v10 = *((void *)v19 + 21);
  uint64_t v9 = *((void *)v19 + 20);
  uint64_t v11 = *((void *)v19 + 19);
  uint64_t v12 = v19[18];
  uint64_t v13 = (void (*)(uint64_t, double))*((void *)v19 + 15);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  uint64_t v7 = swift_retain();
  v13(v7, v12);
  swift_release();
  swift_errorRelease(v14);
  swift_errorRelease(v14);
  swift_task_dealloc(*((void *)v19 + 21));
  return (*(uint64_t (**)(void))(*((void *)v19 + 4) + 8LL))();
}

uint64_t closure #1 in MLServer.getPrediction(inputFeatures:with:)(uint64_t a1, char a2)
{
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 184);
  *(void *)(v5 + 32) = *v3;
  v5 += 32LL;
  *(void *)(v5 + 160) = v2;
  *(void *)(v5 + 168) = a1;
  *(_BYTE *)(v5 + 180) = a2;
  swift_task_dealloc(v6);
  if (v2) {
    return swift_task_switch(closure #1 in MLServer.getPrediction(inputFeatures:with:), 0LL);
  }
  swift_release();
  return swift_task_switch(closure #1 in MLServer.getPrediction(inputFeatures:with:), 0LL);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
}

uint64_t thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v143 = a1;
  v134 = a2;
  uint64_t v132 = a3;
  id v133 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v181 = 0LL;
  uint64_t v179 = 0LL;
  uint64_t v180 = 0LL;
  uint64_t v178 = 0LL;
  dispatch_semaphore_t v175 = 0LL;
  uint64_t v174 = 0LL;
  char v173 = 0;
  uint64_t v118 = 0LL;
  uint64_t v129 = 0LL;
  uint64_t v119 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v120 = *(void *)(v119 - 8);
  unint64_t v121 = (*(void *)(v120 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(0LL);
  unint64_t v122 = (char *)&v70 - v121;
  uint64_t v123 = type metadata accessor for DispatchTime(v4);
  uint64_t v124 = *(void *)(v123 - 8);
  unint64_t v125 = (*(void *)(v124 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v123);
  v126 = (char *)&v70 - v125;
  unint64_t v127 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin((char *)&v70 - v125);
  uint64_t v128 = (char *)&v70 - v127;
  unint64_t v130 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64LL)
        + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v129);
  uint64_t v131 = (char *)&v70 - v130;
  uint64_t v141 = type metadata accessor for Logger(v6);
  uint64_t v140 = *(void **)(v141 - 8);
  uint64_t v136 = v140[8];
  unint64_t v135 = (v136 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v143);
  uint64_t v137 = (char *)&v70 - v135;
  unint64_t v138 = (v136 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v70 - v138;
  uint64_t v139 = (char *)&v70 - v138;
  uint64_t v181 = v8;
  uint64_t v179 = v10;
  uint64_t v180 = v11;
  uint64_t v178 = v12;
  uint64_t v13 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v142 = (void (*)(char *, uint64_t, uint64_t))v140[2];
  v142(v9, v13, v141);
  swift_bridgeObjectRetain(v143);
  uint64_t v152 = 7LL;
  uint64_t v144 = swift_allocObject(&unk_1000107D0, 24LL, 7LL);
  *(void *)(v144 + 16) = v143;
  swift_retain();
  uint64_t v151 = 32LL;
  uint64_t v14 = swift_allocObject(&unk_1000107F8, 32LL, v152);
  uint64_t v15 = v144;
  uint64_t v153 = v14;
  *(void *)(v14 + 16) = partial apply for implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  *(void *)(v14 + 24) = v15;
  uint64_t v16 = swift_release();
  dispatch_semaphore_t v161 = (os_log_s *)Logger.logObject.getter(v16);
  int v162 = static os_log_type_t.debug.getter();
  uint64_t v147 = &v176;
  uint64_t v176 = 12LL;
  unint64_t v145 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v146 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v148 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v147, &type metadata for UInt32, &type metadata for Int, v145, v146, v148);
  uint32_t v149 = v177;
  uint64_t v150 = 17LL;
  uint64_t v17 = swift_allocObject(&unk_100010820, 17LL, v152);
  uint64_t v18 = v150;
  uint64_t v19 = v152;
  uint64_t v155 = v17;
  *(_BYTE *)(v17 + 16) = 32;
  uint64_t v20 = swift_allocObject(&unk_100010848, v18, v19);
  uint64_t v21 = v151;
  uint64_t v22 = v152;
  uint64_t v156 = v20;
  *(_BYTE *)(v20 + 16) = 8;
  uint64_t v23 = swift_allocObject(&unk_100010870, v21, v22);
  uint64_t v24 = v151;
  uint64_t v25 = v152;
  uint64_t v26 = v23;
  uint64_t v27 = v153;
  uint64_t v154 = v26;
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(void *)(v26 + 24) = v27;
  uint64_t v28 = swift_allocObject(&unk_100010898, v24, v25);
  uint64_t v29 = v154;
  uint64_t v158 = v28;
  *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(void *)(v28 + 24) = v29;
  uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v157 = _allocateUninitializedArray<A>(_:)(3LL);
  uint32_t v159 = v30;
  swift_retain();
  uint64_t v31 = v155;
  os_log_type_t v32 = v159;
  *uint32_t v159 = closure #1 in OSLogArguments.append(_:)partial apply;
  v32[1] = v31;
  swift_retain();
  uint64_t v33 = v156;
  uint64_t v34 = v159;
  v159[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v34[3] = v33;
  swift_retain();
  uint64_t v35 = v157;
  uint64_t v36 = v158;
  uint64_t v37 = v159;
  v159[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v37[5] = v36;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v35);
  if (os_log_type_enabled(v161, (os_log_type_t)v162))
  {
    uint64_t v38 = v118;
    uint64_t v110 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v111 = createStorage<A>(capacity:type:)(0LL, v109, v109);
    uint64_t v112 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    v113 = v167;
    v167[0] = v110;
    unint64_t v114 = &v166;
    uint64_t v166 = v111;
    v115 = &v165;
    uint64_t v165 = v112;
    serialize(_:at:)(2LL, v167);
    serialize(_:at:)(1LL, v113);
    uint32_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v164 = v155;
    closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)v113, (uint64_t)v114, (uint64_t)v115);
    uint64_t v116 = v38;
    if (v38)
    {
      __break(1u);
    }

    else
    {
      uint32_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v156;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)v167, (uint64_t)&v166, (uint64_t)&v165);
      uint64_t v107 = 0LL;
      uint64_t v40 = v107;
      uint32_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v158;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)v167, (uint64_t)&v166, (uint64_t)&v165);
      uint64_t v106 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v161,  (os_log_type_t)v162,  "Called into getPredictionDictionary with inputFeatures: %s",  v110,  v149);
      destroyStorage<A>(_:count:)(v111, 0LL);
      destroyStorage<A>(_:count:)(v112, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v108 = v106;
    }
  }

  else
  {
    uint64_t v39 = v118;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v108 = v39;
  }

  uint64_t v89 = v108;

  v90 = (void (*)(char *, uint64_t))v140[1];
  v90(v139, v141);
  uint64_t v97 = 0LL;
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v91 = v41;
  dispatch_semaphore_t v175 = v41;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
  uint64_t v96 = _allocateUninitializedArray<A>(_:)(2LL);
  uint64_t v93 = v42;
  id v43 = (void *)kMediaML_throughputPrediction.unsafeMutableAddressor();
  v44 = outlined init with copy of String(v43, v93);
  uint64_t v45 = v93;
  uint64_t v94 = 0LL;
  v93[2] = 0LL;
  int v92 = v45 + 3;
  id v46 = (void *)kMediaML_throughputStdDev.unsafeMutableAddressor(v44);
  outlined init with copy of String(v46, v92);
  uint64_t v47 = v96;
  v93[5] = v94;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v101 = Dictionary.init(dictionaryLiteral:)( v47,  &type metadata for String,  &type metadata for Double,  &protocol witness table for String);
  uint64_t v174 = v101;
  uint64_t v98 = priority.unsafeMutableAddressor();
  uint64_t v100 = type metadata accessor for TaskPriority(v97);
  uint64_t v99 = *(void *)(v100 - 8);
  (*(void (**)(char *, uint64_t))(v99 + 16))(v131, v98);
  v48 = *(void (**)(char *, void))(v99 + 56);
  int v105 = 1;
  v48(v131, 0LL);
  id v49 = v133;
  swift_bridgeObjectRetain(v143);
  swift_bridgeObjectRetain(v101);
  swift_retain();
  uint64_t v50 = v41;
  uint64_t v51 = swift_allocObject(&unk_1000108C0, 88LL, 7LL);
  id v52 = v133;
  uint64_t v53 = v143;
  uint64_t v54 = v101;
  v55 = v134;
  uint64_t v56 = v132;
  uint64_t v57 = ObjectType;
  uint64_t v58 = (void *)v51;
  uint64_t v59 = (uint64_t)v131;
  v102 = v58;
  v58[2] = 0LL;
  v58[3] = 0LL;
  v58[4] = v52;
  v58[5] = v53;
  v58[6] = v54;
  v58[7] = v55;
  v58[8] = v56;
  v58[9] = v41;
  v58[10] = v57;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( v59,  (uint64_t)&async function pointer to partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:),  (uint64_t)v58,  (uint64_t)&type metadata for () + 8);
  uint64_t v60 = swift_release();
  static DispatchTime.now()(v60);
  uint64_t v61 = semaphoreTimeoutValue.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v120 + 16))(v122, v61, v119);
  + infix(_:_:)(v126, v122);
  (*(void (**)(char *, uint64_t))(v120 + 8))(v122, v119);
  uint64_t v103 = *(void (**)(char *, uint64_t))(v124 + 8);
  v103(v126, v123);
  int v104 = OS_dispatch_semaphore.wait(timeout:)(v128);
  v103(v128, v123);
  char v173 = v104 & 1 & v105;
  if ((static DispatchTimeoutResult.== infix(_:_:)(v104 & 1) & 1) != 0)
  {
    unint64_t v62 = v137;
    uint64_t v63 = MLServer.logger.unsafeMutableAddressor();
    uint64_t v64 = ((uint64_t (*)(char *, uint64_t, uint64_t))v142)(v62, v63, v141);
    uint64_t v87 = (os_log_s *)Logger.logObject.getter(v64);
    int v86 = static os_log_type_t.error.getter();
    uint64_t v171 = 2LL;
    UnsignedInteger<>.init<A>(_:)(&v171, &type metadata for UInt32, &type metadata for Int, v145, v146, v148);
    uint32_t v85 = v172;
    uint64_t v88 = (_BYTE *)_allocateUninitializedArray<A>(_:)(0LL);
    if (os_log_type_enabled(v87, (os_log_type_t)v86))
    {
      uint64_t v65 = v89;
      v75 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v74 = 0LL;
      uint64_t v76 = createStorage<A>(capacity:type:)(0LL, v73, v73);
      uint64_t v77 = createStorage<A>(capacity:type:)( v74,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
      v81 = &v170;
      v170 = v75;
      uint64_t v82 = &v169;
      uint64_t v169 = v76;
      int v79 = &v168;
      uint64_t v168 = v77;
      unsigned int v78 = 0;
      serialize(_:at:)(0LL, &v170);
      serialize(_:at:)(v78, v81);
      v167[1] = v88;
      v80 = &v70;
      __chkstk_darwin(&v70);
      uint64_t v66 = v82;
      uint64_t v67 = &v70 - 6;
      v83 = &v70 - 6;
      v67[2] = (uint64_t)v81;
      v67[3] = (uint64_t)v66;
      v67[4] = v68;
      uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      unint64_t v69 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v83, v84, v69);
      if (v65)
      {
        __break(1u);
      }

      else
      {
        _os_log_impl( (void *)&_mh_execute_header,  v87,  (os_log_type_t)v86,  "getPredictionDictionary timed-out",  v75,  v85);
        uint64_t v72 = 0LL;
        destroyStorage<A>(_:count:)(v76, 0LL);
        destroyStorage<A>(_:count:)(v77, v72);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease(v88);
      }
    }

    else
    {
      swift_bridgeObjectRelease(v88);
    }

    v90(v137, v141);
    swift_retain();
    swift_bridgeObjectRetain(v101);
    uint64_t v71 = _dictionaryUpCast<A, B, C, D>(_:)( v101,  &type metadata for String,  &type metadata for Double,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    v134();
    swift_bridgeObjectRelease(v71);
    swift_bridgeObjectRelease(v101);
    swift_release();
  }

  swift_bridgeObjectRelease(v101);
}

uint64_t implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)@<X0>( uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = v17;
  v8[18] = a8;
  v8[17] = a7;
  v8[16] = a6;
  v8[15] = a5;
  v8[14] = a4;
  v8[4] = v8;
  v8[5] = 0LL;
  v8[6] = 0LL;
  v8[7] = 0LL;
  v8[2] = 0LL;
  v8[3] = 0LL;
  v8[8] = 0LL;
  v8[10] = 0LL;
  v8[13] = 0LL;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v8[20] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[21] = v10;
  v8[22] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[2] = a7;
  v8[3] = a8;
  v8[8] = v17;
  return swift_task_switch(closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:), 0LL);
}

uint64_t closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
  uint64_t v1 = v0[14];
  v0[4] = v0;
  v0[23] = *(void *)(v1 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to MediaML.getPredictionDictionary(data:)[1]);
  _BYTE v4[24] = v2;
  *uint64_t v2 = v4[4];
  v2[1] = closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  return MediaML.getPredictionDictionary(data:)(v4[15]);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[16];
  v0[4] = v0;
  v0[12] = v1;
  swift_bridgeObjectRetain(v2);
  if (v0[12])
  {
    v7[9] = v7[12];
  }

  else
  {
    uint64_t v6 = v7[16];
    swift_bridgeObjectRetain(v6);
    v7[9] = _dictionaryUpCast<A, B, C, D>(_:)( v6,  &type metadata for String,  &type metadata for Double,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    swift_bridgeObjectRelease(v6);
    outlined destroy of [String : Any]?(v7 + 12);
  }

  uint64_t v4 = (void (*)(uint64_t))v7[17];
  swift_bridgeObjectRelease(v7[16]);
  uint64_t v5 = v7[9];
  v7[13] = v5;
  swift_retain();
  v4(v5);
  swift_release();
  OS_dispatch_semaphore.signal()();
  swift_bridgeObjectRelease(v5);
  swift_task_dealloc(v7[22]);
  return (*(uint64_t (**)(void))(v7[4] + 8LL))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  os_log_s *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v22 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v20 = *(void *)(v0 + 168);
  uint64_t v21 = *(void *)(v0 + 160);
  *(void *)(v0 + 32) = v0;
  swift_release();
  swift_errorRetain(v22);
  *(void *)(v0 + 80) = v22;
  uint64_t v2 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v2, v21);
  swift_errorRetain(v22);
  uint64_t v26 = swift_allocObject(&unk_100010B90, 24LL, 7LL);
  *(void *)(v26 + 16) = v22;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  uint64_t v4 = swift_bridgeObjectRelease(v3);
  uint64_t v34 = (os_log_s *)Logger.logObject.getter(v4);
  uint64_t v35 = static os_log_type_t.error.getter();
  *(void *)(v0 + 88) = 12LL;
  uint64_t v23 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  uint64_t v24 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  uint64_t v5 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v0 + 88, &type metadata for UInt32, &type metadata for Int, v23, v24, v5);
  uint64_t v25 = *(_DWORD *)(v0 + 216);
  uint64_t v29 = swift_allocObject(&unk_100010BB8, 17LL, 7LL);
  *(_BYTE *)(v29 + 16) = 64;
  v30 = swift_allocObject(&unk_100010BE0, 17LL, 7LL);
  *(_BYTE *)(v30 + 16) = 8;
  uint64_t v27 = swift_allocObject(&unk_100010C08, 32LL, 7LL);
  *(void *)(v27 + 16) = partial apply for implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  *(void *)(v27 + 24) = v26;
  uint64_t v28 = swift_allocObject(&unk_100010C30, 32LL, 7LL);
  *(void *)(v28 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0;
  *(void *)(v28 + 24) = v27;
  os_log_type_t v32 = swift_allocObject(&unk_100010C58, 32LL, 7LL);
  *(void *)(v32 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0;
  *(void *)(v32 + 24) = v28;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v31 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v33 = v6;
  swift_retain();
  uint8_t *v33 = closure #1 in OSLogArguments.append(_:)partial apply;
  v33[1] = v29;
  swift_retain();
  v33[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v33[3] = v30;
  swift_retain();
  v33[4] = _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
  v33[5] = v32;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v31);
  if (os_log_type_enabled(v34, v35))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v17 = createStorage<A>(capacity:type:)(1LL, v15, v15);
    uint64_t v18 = createStorage<A>(capacity:type:)( 0LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v36 = buf;
    uint64_t v37 = v17;
    uint64_t v38 = v18;
    serialize(_:at:)(2LL, &v36);
    serialize(_:at:)(1LL, &v36);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v40 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v36, (uint64_t)&v37, (uint64_t)&v38);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v40 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v36, (uint64_t)&v37, (uint64_t)&v38);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
    uint64_t v40 = v32;
    closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v36, (uint64_t)&v37, (uint64_t)&v38);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to get prediction with error=%@", buf, v25);
    destroyStorage<A>(_:count:)(v17, 1LL);
    destroyStorage<A>(_:count:)(v18, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }

  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  uint64_t v14 = v19[26];
  uint64_t v9 = v19[22];
  uint64_t v8 = v19[21];
  uint64_t v10 = v19[20];
  uint64_t v11 = (void (*)(void))v19[17];
  uint64_t v13 = v19[16];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_retain();
  swift_bridgeObjectRetain(v13);
  uint64_t v12 = _dictionaryUpCast<A, B, C, D>(_:)( v13,  &type metadata for String,  &type metadata for Double,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v11();
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_release();
  swift_errorRelease(v14);
  swift_errorRelease(v14);
  swift_task_dealloc(v19[22]);
  return (*(uint64_t (**)(void))(v19[4] + 8LL))();
}

uint64_t closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 192LL);
  v4[4] = *(void *)v2;
  v4 += 4;
  v4[21] = a1;
  v4[22] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    return swift_task_switch(closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:), 0LL);
  }
  swift_release();
  return swift_task_switch(closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:), 0LL);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> ()( uint64_t a1, uint64_t a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(void))(a2 + 16))();
}

uint64_t MLServer.write(data:with:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v51 = a1;
  uint64_t v50 = a2;
  uint64_t v48 = a3;
  id v49 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v73 = 0LL;
  uint64_t v71 = 0LL;
  uint64_t v72 = 0LL;
  uint64_t v70 = 0LL;
  uint64_t v45 = 0LL;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  unint64_t v46 = (*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v4);
  uint64_t v47 = &v28[-v46];
  uint64_t v60 = 0LL;
  uint64_t v55 = type metadata accessor for Logger(0LL);
  uint64_t v54 = *(void *)(v55 - 8);
  unint64_t v52 = (*(void *)(v54 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v51);
  uint64_t v6 = &v28[-v52];
  uint64_t v53 = &v28[-v52];
  uint64_t v73 = v5;
  uint64_t v71 = v7;
  uint64_t v72 = v8;
  uint64_t v70 = v9;
  uint64_t v10 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v11 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v54 + 16))(v6, v10, v55);
  unint64_t v62 = (os_log_s *)Logger.logObject.getter(v11);
  int v61 = static os_log_type_t.debug.getter();
  uint64_t v58 = &v68;
  uint64_t v68 = 2LL;
  unint64_t v56 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v57 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v12 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v58, &type metadata for UInt32, &type metadata for Int, v56, v57, v12);
  uint32_t v59 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v63 = _allocateUninitializedArray<A>(_:)(v60);
  if (os_log_type_enabled(v62, (os_log_type_t)v61))
  {
    uint64_t v13 = v45;
    uint64_t v34 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v33 = 0LL;
    uint64_t v35 = createStorage<A>(capacity:type:)(0LL, v32, v32);
    uint64_t v36 = createStorage<A>(capacity:type:)( v33,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v40 = &v67;
    uint64_t v67 = v34;
    dispatch_semaphore_t v41 = &v66;
    uint64_t v66 = v35;
    uint64_t v38 = &v65;
    uint64_t v65 = v36;
    unsigned int v37 = 0;
    serialize(_:at:)(0LL, &v67);
    serialize(_:at:)(v37, v40);
    uint64_t v64 = v63;
    uint64_t v39 = v28;
    __chkstk_darwin(v28);
    uint64_t v14 = v41;
    uint64_t v15 = &v28[-48];
    v42 = &v28[-48];
    v15[2] = v40;
    v15[3] = v14;
    v15[4] = v16;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t v17 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v42, v43, v17);
    if (v13)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v61, "Called into writeData", v34, v59);
      uint64_t v31 = 0LL;
      destroyStorage<A>(_:count:)(v35, 0LL);
      destroyStorage<A>(_:count:)(v36, v31);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v63);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v63);
  }

  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v53, v55);
  uint64_t v18 = *(void (**)(_BYTE *, uint64_t))(*(void *)(type metadata accessor for TaskPriority(0LL) - 8) + 56LL);
  int v29 = 1;
  v18(v47, 1LL);
  swift_bridgeObjectRetain(v51);
  id v19 = v49;
  uint64_t v20 = swift_allocObject(&unk_100010910, 56LL, 7LL);
  uint64_t v21 = v51;
  id v22 = v49;
  uint64_t v23 = ObjectType;
  uint64_t v24 = (void *)v20;
  uint64_t v25 = (uint64_t)v47;
  v24[2] = 0LL;
  v24[3] = 0LL;
  v24[4] = v21;
  v24[5] = v22;
  v24[6] = v23;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC( v25,  (uint64_t)&async function pointer to partial apply for closure #1 in MLServer.write(data:with:),  (uint64_t)v24,  (uint64_t)&type metadata for () + 8);
  swift_release();
  swift_retain();
  Swift::String v26 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Dispatched write data task", 0x1AuLL, v29 & 1);
  object = v26._object;
  v50(v26._countAndFlagsBits);
  swift_bridgeObjectRelease(object);
  return swift_release();
}

uint64_t closure #1 in MLServer.write(data:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a5;
  v5[7] = a4;
  v5[2] = v5;
  void v5[3] = 0LL;
  v5[4] = 0LL;
  uint64_t v6 = type metadata accessor for DispatchTime(0LL);
  v5[9] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[10] = v7;
  uint64_t v11 = *(void *)(v7 + 64);
  v5[11] = v11;
  v5[12] = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5[13] = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5[14] = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5[15] = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Logger(0LL);
  v5[16] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v5[17] = v9;
  uint64_t v12 = *(void *)(v9 + 64);
  v5[18] = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5[19] = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  void v5[3] = a4;
  v5[4] = a5;
  return swift_task_switch(closure #1 in MLServer.write(data:with:), 0LL);
}

uint64_t closure #1 in MLServer.write(data:with:)()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v59 = *(void *)(v0 + 136);
  uint64_t v60 = *(void *)(v0 + 128);
  uint64_t v62 = *(void *)(v0 + 56);
  *(void *)(v0 + 16) = v0;
  uint64_t v2 = MLServer.logger.unsafeMutableAddressor();
  int v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16);
  v61(v1, v2, v60);
  swift_bridgeObjectRetain(v62);
  uint64_t v63 = swift_allocObject(&unk_1000109D8, 24LL, 7LL);
  *(void *)(v63 + 16) = v62;
  swift_retain();
  uint64_t v68 = swift_allocObject(&unk_100010A00, 32LL, 7LL);
  *(void *)(v68 + 16) = partial apply for implicit closure #1 in closure #1 in MLServer.write(data:with:);
  *(void *)(v68 + 24) = v63;
  uint64_t v3 = swift_release();
  v75 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v76 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 40) = 12LL;
  unint64_t v64 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v65 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v66 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v0 + 40, &type metadata for UInt32, &type metadata for Int, v64, v65, v66);
  uint32_t v67 = *(_DWORD *)(v0 + 176);
  uint64_t v70 = swift_allocObject(&unk_100010A28, 17LL, 7LL);
  *(_BYTE *)(v70 + 16) = 32;
  uint64_t v71 = swift_allocObject(&unk_100010A50, 17LL, 7LL);
  *(_BYTE *)(v71 + 16) = 8;
  uint64_t v69 = swift_allocObject(&unk_100010A78, 32LL, 7LL);
  *(void *)(v69 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(void *)(v69 + 24) = v68;
  uint64_t v73 = swift_allocObject(&unk_100010AA0, 32LL, 7LL);
  *(void *)(v73 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(void *)(v73 + 24) = v69;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v72 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v74 = v4;
  swift_retain();
  *uint64_t v74 = closure #1 in OSLogArguments.append(_:)partial apply;
  v74[1] = v70;
  swift_retain();
  v74[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v74[3] = v71;
  swift_retain();
  v74[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v74[5] = v73;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v72);
  if (os_log_type_enabled(v75, v76))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v56 = createStorage<A>(capacity:type:)(0LL, v54, v54);
    uint64_t v57 = createStorage<A>(capacity:type:)( 1LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v82 = buf;
    uint64_t v83 = v56;
    uint64_t v84 = v57;
    serialize(_:at:)(2LL, &v82);
    serialize(_:at:)(1LL, &v82);
    uint32_t v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v86 = v70;
    closure #1 in osLogInternal(_:log:type:)(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
    uint32_t v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v86 = v71;
    closure #1 in osLogInternal(_:log:type:)(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
    uint32_t v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v86 = v73;
    closure #1 in osLogInternal(_:log:type:)(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
    _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "Checking text and numerical input validity for data dictionary: %s",  buf,  v67);
    destroyStorage<A>(_:count:)(v56, 0LL);
    destroyStorage<A>(_:count:)(v57, 1LL);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }

  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  uint64_t v49 = *(void *)(v58 + 152);
  uint64_t v48 = *(void *)(v58 + 136);
  uint64_t v50 = *(void *)(v58 + 128);
  data._rawValue = *(void **)(v58 + 56);

  uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t))(v48 + 8);
  uint64_t v5 = v51(v49, v50);
  static DispatchTime.now()(v5);
  Swift::Bool v53 = checkValidTextInputs(data:)(data);
  swift_bridgeObjectRetain(data._rawValue);
  if (!v53)
  {
    swift_bridgeObjectRelease(*(void *)(v58 + 56));
LABEL_12:
    (*(void (**)(void, void))(*(void *)(v58 + 80) + 8LL))( *(void *)(v58 + 120),  *(void *)(v58 + 72));
    uint64_t v13 = *(void *)(v58 + 144);
    uint64_t v14 = *(void *)(v58 + 120);
    uint64_t v15 = *(void *)(v58 + 112);
    uint64_t v16 = *(void *)(v58 + 104);
    uint64_t v17 = *(void *)(v58 + 96);
    swift_task_dealloc(*(void *)(v58 + 152));
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    return (*(uint64_t (**)(void))(*(void *)(v58 + 16) + 8LL))();
  }

  BOOL v47 = checkValidTextInputs(data:)(*(Swift::OpaquePointer *)(v58 + 56));
  swift_bridgeObjectRelease(*(void *)(v58 + 56));
  if (!v47) {
    goto LABEL_12;
  }
  uint64_t v6 = *(void *)(v58 + 144);
  uint64_t v25 = *(void *)(v58 + 128);
  uint64_t v27 = *(void *)(v58 + 120);
  uint64_t v26 = *(void *)(v58 + 112);
  uint64_t v32 = *(void *)(v58 + 104);
  uint64_t v34 = *(void *)(v58 + 96);
  uint64_t v29 = *(void *)(v58 + 88);
  uint64_t v31 = *(void *)(v58 + 80);
  uint64_t v35 = *(void *)(v58 + 72);
  static DispatchTime.now()(v47);
  uint64_t v7 = MLServer.logger.unsafeMutableAddressor();
  v61(v6, v7, v25);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  v28(v32, v26, v35);
  v28(v34, v27, v35);
  uint64_t v8 = *(_DWORD *)(v31 + 80);
  uint64_t v30 = (v8 + 16) & ~v8;
  uint64_t v33 = (v30 + v29 + v8) & ~v8;
  uint64_t v38 = swift_allocObject(&unk_100010AC8, v33 + v29, v8 | 7);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32);
  v36(v38 + v30, v32, v35);
  uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v36)(v38 + v33, v34, v35);
  oslog = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v46 = static os_log_type_t.info.getter();
  *(void *)(v58 + 48) = 12LL;
  UnsignedInteger<>.init<A>(_:)(v58 + 48, &type metadata for UInt32, &type metadata for Int, v64, v65, v66);
  uint32_t size = *(_DWORD *)(v58 + 180);
  uint64_t v40 = swift_allocObject(&unk_100010AF0, 17LL, 7LL);
  *(_BYTE *)(v40 + 16) = 0;
  uint64_t v41 = swift_allocObject(&unk_100010B18, 17LL, 7LL);
  *(_BYTE *)(v41 + 16) = 8;
  uint64_t v39 = swift_allocObject(&unk_100010B40, 32LL, 7LL);
  *(void *)(v39 + 16) = partial apply for implicit closure #3 in closure #1 in MLServer.write(data:with:);
  *(void *)(v39 + 24) = v38;
  uint64_t v43 = swift_allocObject(&unk_100010B68, 32LL, 7LL);
  *(void *)(v43 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
  *(void *)(v43 + 24) = v39;
  uint64_t v42 = _allocateUninitializedArray<A>(_:)(3LL);
  v44 = v10;
  swift_retain();
  void *v44 = closure #1 in OSLogArguments.append(_:)partial apply;
  v44[1] = v40;
  swift_retain();
  v44[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v44[3] = v41;
  swift_retain();
  v44[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v44[5] = v43;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v42);
  if (os_log_type_enabled(oslog, v46))
  {
    id v22 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v23 = createStorage<A>(capacity:type:)(0LL, v21, v21);
    uint64_t v24 = createStorage<A>(capacity:type:)( 0LL,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v77 = v22;
    uint64_t v78 = v23;
    uint64_t v79 = v24;
    serialize(_:at:)(0LL, &v77);
    serialize(_:at:)(1LL, &v77);
    v80 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v81 = v40;
    closure #1 in osLogInternal(_:log:type:)(&v80, (uint64_t)&v77, (uint64_t)&v78, (uint64_t)&v79);
    v80 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v81 = v41;
    closure #1 in osLogInternal(_:log:type:)(&v80, (uint64_t)&v77, (uint64_t)&v78, (uint64_t)&v79);
    v80 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v81 = v43;
    closure #1 in osLogInternal(_:log:type:)(&v80, (uint64_t)&v77, (uint64_t)&v78, (uint64_t)&v79);
    _os_log_impl((void *)&_mh_execute_header, oslog, v46, "Validity check in MLServer Time taken = %f [ns]", v22, size);
    destroyStorage<A>(_:count:)(v23, 0LL);
    destroyStorage<A>(_:count:)(v24, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }

  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  uint64_t v18 = *(void *)(v58 + 144);
  uint64_t v19 = *(void *)(v58 + 128);
  uint64_t v20 = *(void *)(v58 + 64);

  v51(v18, v19);
  *(void *)(v58 + 160) = *(void *)(v20 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to MediaML.writeData(data:)[1]);
  *(void *)(v58 + 168) = v11;
  *uint64_t v11 = *(void *)(v58 + 16);
  v11[1] = closure #1 in MLServer.write(data:with:);
  return MediaML.writeData(data:)(*(void *)(v58 + 56));
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v1 = *(void *)(*(void *)v0 + 168LL);
  *(void *)(*(void *)v0 + 16LL) = *(void *)v0;
  swift_task_dealloc(v1);
  swift_release();
  return swift_task_switch(closure #1 in MLServer.write(data:with:), 0LL);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v4 = v0[15];
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[10];
  uint64_t v5 = v0[9];
  v0[2] = v0;
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 8);
  v6(v1);
  ((void (*)(uint64_t, uint64_t))v6)(v4, v5);
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[15];
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[12];
  swift_task_dealloc(v0[19]);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0[2] + 8LL))();
}

uint64_t implicit closure #1 in closure #1 in MLServer.write(data:with:)@<X0>( uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t implicit closure #3 in closure #1 in MLServer.write(data:with:)()
{
  unint64_t v3 = DispatchTime.uptimeNanoseconds.getter();
  unint64_t v0 = DispatchTime.uptimeNanoseconds.getter();
  uint64_t result = v3;
  if (v3 < v0)
  {
    __break(1u);
  }

  else
  {
    unint64_t v4 = v3 - v0;
    unint64_t v2 = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)(&v4, &type metadata for UInt64, v2);
  }

  return result;
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()( uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = String._bridgeToObjectiveC()();
  (*(void (**)(void))(a3 + 16))();
}

uint64_t MLServer.wakeRemoteService(with:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v29 = a1;
  uint64_t v28 = a2;
  uint64_t v49 = 0LL;
  uint64_t v50 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v33 = type metadata accessor for Logger(0LL);
  uint64_t v32 = *(void *)(v33 - 8);
  unint64_t v30 = (*(void *)(v32 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v2 = (char *)&v14 - v30;
  uint64_t v31 = (char *)&v14 - v30;
  uint64_t v49 = __chkstk_darwin(v29);
  uint64_t v50 = v3;
  uint64_t v48 = v4;
  uint64_t v5 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 16))(v2, v5, v33);
  uint64_t v40 = (os_log_s *)Logger.logObject.getter(v6);
  int v39 = static os_log_type_t.default.getter();
  uint64_t v36 = &v46;
  uint64_t v46 = 2LL;
  unint64_t v34 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v36, &type metadata for UInt32, &type metadata for Int, v34, v35, v7);
  uint32_t v37 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v41 = _allocateUninitializedArray<A>(_:)(v38);
  if (os_log_type_enabled(v40, (os_log_type_t)v39))
  {
    uint64_t v8 = v27;
    uint64_t v17 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v16 = 0LL;
    uint64_t v18 = createStorage<A>(capacity:type:)(0LL, v15, v15);
    uint64_t v19 = createStorage<A>(capacity:type:)( v16,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v23 = &v45;
    uint64_t v45 = v17;
    uint64_t v24 = &v44;
    uint64_t v44 = v18;
    uint64_t v21 = &v43;
    uint64_t v43 = v19;
    unsigned int v20 = 0;
    serialize(_:at:)(0LL, &v45);
    serialize(_:at:)(v20, v23);
    uint64_t v42 = v41;
    id v22 = &v14;
    __chkstk_darwin(&v14);
    uint64_t v9 = v24;
    uint64_t v10 = &v14 - 6;
    uint64_t v25 = &v14 - 6;
    v10[2] = (uint64_t)v23;
    v10[3] = (uint64_t)v9;
    v10[4] = v11;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v25, v26, v12);
    if (v8)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v39, "Starting mediamlxpc service", v17, v37);
      uint64_t v14 = 0LL;
      destroyStorage<A>(_:count:)(v18, 0LL);
      destroyStorage<A>(_:count:)(v19, v14);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v41);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v41);
  }

  (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v33);
  swift_retain();
  v29(1LL);
  return swift_release();
}

uint64_t thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ()( char a1, uint64_t a2)
{
  char v2 = _convertBoolToObjCBool(_:)(a1 & 1);
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v2 & 1);
}

uint64_t MLServer.getModelStats(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = a1;
  uint64_t v44 = a2;
  uint64_t v65 = 0LL;
  uint64_t v66 = 0LL;
  uint64_t v64 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  unint64_t v41 = (*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v2);
  uint64_t v42 = (char *)&v23 - v41;
  uint64_t v54 = 0LL;
  uint64_t v49 = type metadata accessor for Logger(0LL);
  uint64_t v48 = *(void *)(v49 - 8);
  unint64_t v46 = (*(void *)(v48 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v45);
  uint64_t v4 = (char *)&v23 - v46;
  uint32_t v47 = (char *)&v23 - v46;
  uint64_t v65 = v3;
  uint64_t v66 = v5;
  uint64_t v64 = v6;
  uint64_t v7 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 16))(v4, v7, v49);
  uint64_t v56 = (os_log_s *)Logger.logObject.getter(v8);
  int v55 = static os_log_type_t.info.getter();
  unint64_t v52 = &v62;
  uint64_t v62 = 2LL;
  unint64_t v50 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v51 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v9 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(v52, &type metadata for UInt32, &type metadata for Int, v50, v51, v9);
  uint32_t v53 = v63;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v57 = _allocateUninitializedArray<A>(_:)(v54);
  if (os_log_type_enabled(v56, (os_log_type_t)v55))
  {
    uint64_t v10 = v40;
    unint64_t v30 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v29 = 0LL;
    uint64_t v31 = createStorage<A>(capacity:type:)(0LL, v28, v28);
    uint64_t v32 = createStorage<A>(capacity:type:)( v29,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Any + 8);
    uint64_t v36 = &v61;
    int v61 = v30;
    uint32_t v37 = &v60;
    uint64_t v60 = v31;
    unint64_t v34 = &v59;
    uint64_t v59 = v32;
    unsigned int v33 = 0;
    serialize(_:at:)(0LL, &v61);
    serialize(_:at:)(v33, v36);
    uint64_t v58 = v57;
    unint64_t v35 = &v23;
    __chkstk_darwin(&v23);
    uint64_t v11 = v37;
    unint64_t v12 = &v23 - 6;
    uint64_t v38 = &v23 - 6;
    v12[2] = (uint64_t)v36;
    v12[3] = (uint64_t)v11;
    v12[4] = v13;
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t v14 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v38, v39, v14);
    if (v10)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v55, "Getting model stats", v30, v53);
      uint64_t v27 = 0LL;
      destroyStorage<A>(_:count:)(v31, 0LL);
      destroyStorage<A>(_:count:)(v32, v27);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v57);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v57);
  }

  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  uint64_t v24 = priority.unsafeMutableAddressor();
  uint64_t v26 = type metadata accessor for TaskPriority(0LL);
  uint64_t v25 = *(void *)(v26 - 8);
  (*(void (**)(char *, uint64_t))(v25 + 16))(v42, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v42, 0LL, 1LL, v26);
  id v15 = v43;
  swift_retain();
  uint64_t v16 = swift_allocObject(&unk_100010988, 56LL, 7LL);
  id v17 = v43;
  uint64_t v18 = v45;
  uint64_t v19 = v44;
  unsigned int v20 = (void *)v16;
  uint64_t v21 = (uint64_t)v42;
  v20[2] = 0LL;
  v20[3] = 0LL;
  v20[4] = v17;
  v20[5] = v18;
  v20[6] = v19;
  _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC( v21,  (uint64_t)&async function pointer to partial apply for closure #1 in MLServer.getModelStats(with:),  (uint64_t)v20,  (uint64_t)&type metadata for () + 8);
  return swift_release();
}

uint64_t closure #1 in MLServer.getModelStats(with:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a6;
  v6[8] = a5;
  v6[7] = a4;
  v6[4] = v6;
  v6[5] = 0LL;
  v6[2] = 0LL;
  v6[3] = 0LL;
  v6[6] = 0LL;
  v6[5] = a4;
  v6[2] = a5;
  v6[3] = a6;
  return swift_task_switch(closure #1 in MLServer.getModelStats(with:), 0LL);
}

uint64_t closure #1 in MLServer.getModelStats(with:)()
{
  uint64_t v1 = v0[7];
  v0[4] = v0;
  v0[10] = *(void *)(v1 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to MediaML.getModelStats()[1]);
  *(void *)(v4 + 88) = v2;
  *uint64_t v2 = *(void *)(v4 + 32);
  v2[1] = closure #1 in MLServer.getModelStats(with:);
  return MediaML.getModelStats()();
}

{
  void *v0;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v4 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v2 = (void (*)(uint64_t))v0[8];
  v0[4] = v0;
  v0[6] = v4;
  swift_retain(v3);
  v2(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v4);
  return (*(uint64_t (**)(void))(v0[4] + 8LL))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v1 = *(void *)(v0 + 80);
  *(void *)(v0 + 32) = v0;
  swift_release(v1);
  return (*(uint64_t (**)(void))(*(void *)(v0 + 32) + 8LL))();
}

uint64_t closure #1 in MLServer.getModelStats(with:)(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 88LL);
  v4[4] = *(void *)v2;
  v4 += 4;
  v4[8] = a1;
  v4[9] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    return swift_task_switch(closure #1 in MLServer.getModelStats(with:), 0LL);
  }
  swift_release();
  return swift_task_switch(closure #1 in MLServer.getModelStats(with:), 0LL);
}

uint64_t _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[4] = a4;
  uint64_t v20 = type metadata accessor for TaskPriority(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 48))(a1, 1LL) == 1)
  {
    outlined destroy of TaskPriority?(a1);
    uint64_t v15 = 0LL;
  }

  else
  {
    unsigned __int8 v14 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a1, v20);
    uint64_t v15 = v14;
  }

  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v13)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
    uint64_t v9 = v5;
    swift_unknownObjectRelease(v13);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  uint64_t v7 = 0LL;
  if (v10 != 0 || v11 != 0)
  {
    v22[0] = 0LL;
    v22[1] = 0LL;
    v22[2] = v10;
    v22[3] = v11;
    uint64_t v7 = v22;
  }

  return swift_task_create(v15 | 0x1C00, v7, a4, a2, a3);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?) -> ()( uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    Class v3 = isa;
  }

  else
  {
    Class v3 = 0LL;
  }

  (*(void (**)(void))(a2 + 16))();
}

id MLServer.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

uint64_t MLServer.init()()
{
  if (!"mediamlxpc.MLServer")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( (uint64_t)"mediamlxpc.MLServer",  19LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"mediamlxpc/MLServer.swift",  25LL,  2,  v2,  0xFuLL,  7uLL);
  __break(1u);
  return result;
}

id MLServer.__deallocating_deinit()
{
  Class v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MLServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = a3;
  uint64_t v9 = a4;
  uint64_t v10 = *(void *)(a3 - 8);
  unint64_t v8 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = (void (*)(void))__chkstk_darwin();
  uint64_t v11 = (char *)&v7 - v8;
  v4();
  uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter(v12, v9);
  uint64_t v14 = v5;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  return v13;
}

uint64_t sub_10000ABAC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)*a1,  -(*a1 >> 32),  0LL);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }

  return v4;
}

uint64_t specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)( uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)( uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v6 = (a3 + 1);
  }

  else
  {
    int v8 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v6 = (v8 | (a3 >> 6)) + 33217;
    }

    else
    {
      int v7 = (v8 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v6 = (v7 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v6 = ((a3 >> 18) | ((v7 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }

  uint64_t v5 = 4 - ((uint64_t)__clz(v6) >> 3);
  uint64_t v9 = (v6 - 0x101010101010101LL) & ((1LL << ((8 * v5) & 0x3F)) - 1);
  if (v5 >= 0) {
    return a1(&v9, v5);
  }
  _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeBufferPointer with negative count",  39LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  1343LL,  0);
  __break(1u);
LABEL_12:
  LOBYTE(v4) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  v4,  3455LL,  0);
  __break(1u);
  return result;
}

uint64_t closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  unint64_t v24 = a6;
  uint64_t v25 = a7;
  int v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = a11;
  uint64_t v29 = "Fatal error";
  unint64_t v30 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v31 = "Swift/StaticString.swift";
  uint64_t v32 = "Not enough bits to represent the passed value";
  unsigned int v33 = "Swift/Integers.swift";
  unint64_t v34 = "UnsafeBufferPointer with negative count";
  unint64_t v35 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v36 = 0LL;
  unint64_t v38 = a6;
  uint64_t v39 = a7;
  char v40 = a8;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  unint64_t v43 = a10;
  unint64_t v44 = a11;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        id v17 = v16;
        __chkstk_darwin(v16);
        uint64_t v14 = partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
        uint64_t v15 = &v37;
        specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)( (uint64_t (*)(uint64_t *, uint64_t))partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:),  (uint64_t)&v13,  v11);
        return (uint64_t)v17;
      }

      LOBYTE(v13) = 2;
      _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v32, 45LL, 2LL, v33, 20LL, v13, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v45 = v22;
  }
  else {
    uint64_t v45 = 0LL;
  }
  v16[0] = v45;
  if (!v45)
  {
    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( v16[0],  v23,  v24,  v25,  v26,  v20,  v21,  v27,  v19,  v28);
  }
  LOBYTE(v13) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v29, 11LL, 2LL, v34, 39LL, 2LL, v35, 31LL, v13, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  unint64_t v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Unexpectedly found nil while unwrapping an Optional value";
  unint64_t v30 = "Swift/StaticString.swift";
  uint64_t v31 = "Not enough bits to represent the passed value";
  uint64_t v32 = "Swift/Integers.swift";
  unsigned int v33 = "UnsafeBufferPointer with negative count";
  unint64_t v34 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v35 = 0LL;
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  unint64_t v41 = a8;
  unint64_t v42 = a10;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        id v17 = &v15;
        __chkstk_darwin(&v15);
        int v13 = partial apply for closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
        uint64_t v14 = &v36;
        specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)( (uint64_t (*)(uint64_t *, uint64_t))closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply,  (uint64_t)&v12,  v10);
        return (uint64_t)v17;
      }

      LOBYTE(v12) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 45LL, 2LL, v32, 20LL, v12, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v43 = v22;
  }
  else {
    uint64_t v43 = 0LL;
  }
  uint64_t v16 = v43;
  if (!v43)
  {
    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( v16,  v23,  v24,  v25,  v20,  v21,  v26,  v27);
  }
  LOBYTE(v12) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v28, 11LL, 2LL, v33, 39LL, 2LL, v34, 31LL, v12, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  unint64_t v26 = a7;
  unint64_t v27 = a8;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Not enough bits to represent the passed value";
  unint64_t v30 = "Swift/Integers.swift";
  uint64_t v31 = "Not enough bits to represent a signed value";
  uint64_t v32 = "Unexpectedly found nil while unwrapping an Optional value";
  unsigned int v33 = "Swift/AssertCommon.swift";
  if (a3)
  {
    uint64_t v19 = v22;
  }

  else
  {
    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 230LL, 0);
    __break(1u);
  }

  uint64_t v18 = v19;
  if (v23 >= (uint64_t)0xFFFFFFFF80000000LL)
  {
    if (v23 <= 0x7FFFFFFF)
    {
      unsigned int v17 = v23;
      if (v24)
      {
        uint64_t v16 = v24;
      }

      else
      {
        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 231LL, 0);
        __break(1u);
      }

      uint64_t v15 = v16;
      if (v25 >= (uint64_t)0xFFFFFFFF80000000LL)
      {
        if (v25 <= 0x7FFFFFFF)
        {
          unsigned int v14 = v25;
          if (v20)
          {
            uint64_t v13 = v20;
          }

          else
          {
            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 232LL, 0);
            __break(1u);
          }

          uint64_t v12 = v13;
          if (v21 >= (uint64_t)0xFFFFFFFF80000000LL)
          {
            if (v21 <= 0x7FFFFFFF)
            {
              unsigned int v11 = v21;
              if (v26 <= 0xFFFFFFFF)
              {
                unsigned int v10 = v26;
                if (v27 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile(v18, v17, v15, v14, v12, v11, v10, v27, 0);
                }
                LOBYTE(v9) = 2;
                _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
                __break(1u);
              }

              LOBYTE(v9) = 2;
              _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
              __break(1u);
            }

            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
            __break(1u);
          }

          LOBYTE(v9) = 2;
          _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
          __break(1u);
        }

        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
        __break(1u);
      }

      LOBYTE(v9) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
      __break(1u);
    }

    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
    __break(1u);
  }

  LOBYTE(v9) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v10 = v5;
  uint64_t v6 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  uint64_t v11 = *a1;
  uint64_t v7 = *a1 + 8LL;
  uint64_t v13 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v11, v7);
  swift_bridgeObjectRelease(v10);
  uint64_t result = a1;
  *a1 = v11 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    __swift_destroy_boxed_opaque_existential_0(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    __swift_destroy_boxed_opaque_existential_0(v13);
  }

  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)( uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v25 = a6;
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }

      else
      {
        int64_t v16 = 0LL;
      }

      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0LL, v15, a2, a3);
          *uint64_t v17 = a2;
          uint64_t v11 = 0LL;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          char v23 = v13 & 1;
          char v24 = v14 & 1;
          return (uint64_t)v11;
        }

        goto LABEL_28;
      }
    }

LABEL_13:
    uint64_t v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }

    __break(1u);
  }

  uint64_t result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0LL;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }

  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)( const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  uint64_t v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain();
  uint64_t v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  v10[2] = a2;
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }

  else if ((a2 & 0x2000000000000000LL) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }

  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }

  if (!v7) {
    return specialized ContiguousArray.init()();
  }
  uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0LL);
  swift_retain();
  swift_release();
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  uint64_t v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v10;
    v10[0] = 0LL;
    v10[1] = 0xE000000000000000LL;
    outlined destroy of String.UTF8View((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = specialized Array.count.getter(*v3);
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0,  v2 + 1,  1,  *v3);
    uint64_t *v3 = result;
  }

  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( *(void *)(*(void *)v1 + 24LL) >> 1 != 0LL,  result + 1,  1,  *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release(v4);
  uint64_t v6 = *v2;
  swift_retain(*v2);
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release(v6);
}

void specialized Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)( uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }

    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }

    swift_release();
    return v6;
  }

  else
  {
    swift_retain();
    return &_swiftEmptyArrayStorage;
  }

void *specialized ContiguousArray.init()()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2LL) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }

      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }

    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (void)(v8 + 4));
    }

    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }

    swift_release();
    uint64_t v7 = (char *)v8;
  }

  else
  {
    swift_retain();
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease(a4);
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release();
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

uint64_t sub_10000CC0C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0( _BYTE **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000CC3C()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000CC6C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000CCB4()
{
  return swift_deallocObject(v2, 32LL);
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000CCFC()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  swift_release(*(void *)(v0 + 56));

  return swift_deallocObject(v2, 88LL);
}

uint64_t partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *((void *)v1 + 2);
  uint64_t v6 = *((void *)v1 + 3);
  uint64_t v7 = *((void *)v1 + 4);
  uint64_t v8 = *((void *)v1 + 5);
  uint64_t v9 = *((void *)v1 + 6);
  uint64_t v10 = *((void *)v1 + 7);
  uint64_t v11 = *((void *)v1 + 8);
  double v12 = v1[9];
  uint64_t v3 = (void *)swift_task_alloc(dword_1000148FC);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:);
  return closure #1 in MLServer.getPrediction(inputFeatures:with:)(v12, a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)( uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v3 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    uint64_t v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000CF38()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> ()()
{
  return thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> ()(*(void *)(v0 + 16));
}

uint64_t sub_10000CF7C()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)@<X0>( void *a1@<X8>)
{
  return implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_10000CFC0()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_10000D048()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000D078()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000D0A8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000D0F0()
{
  return swift_deallocObject(v2, 32LL);
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void *outlined init with copy of String(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000D174()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_release(*(void *)(v0 + 64));

  return swift_deallocObject(v2, 88LL);
}

uint64_t partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = v1[8];
  uint64_t v3 = (void *)swift_task_alloc(dword_100014924);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  return closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply( uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000D34C()
{
  return swift_deallocObject(v2, 24LL);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> ()( uint64_t a1)
{
}

uint64_t sub_10000D390()
{
  return swift_deallocObject(v2, 56LL);
}

uint64_t partial apply for closure #1 in MLServer.write(data:with:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100014934);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = partial apply for closure #1 in MLServer.write(data:with:);
  return closure #1 in MLServer.write(data:with:)(a1, v5, v6, v7, v8);
}

uint64_t partial apply for closure #1 in MLServer.write(data:with:)()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000D518()
{
  return swift_deallocObject(v2, 24LL);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()( uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000D588()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ()( char a1)
{
  return thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ()(a1 & 1, *(void *)(v1 + 16));
}

uint64_t sub_10000D5D0()
{
  swift_release(*(void *)(v0 + 48));
  return swift_deallocObject(v2, 56LL);
}

uint64_t partial apply for closure #1 in MLServer.getModelStats(with:)(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v3 = (void *)swift_task_alloc(dword_100014944);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = partial apply for closure #1 in MLServer.getModelStats(with:);
  return closure #1 in MLServer.getModelStats(with:)(a1, v5, v6, v7, v8, v9);
}

uint64_t partial apply for closure #1 in MLServer.getModelStats(with:)()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000D758()
{
  return swift_deallocObject(v2, 24LL);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?) -> ()( uint64_t a1)
{
}

uint64_t partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( a1,  a2,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(_BYTE *)(v3 + 32),  *(void *)(v3 + 40),  *(void *)(v3 + 48),  *(void *)(v3 + 56),  a3,  *(void *)(v3 + 64));
}

uint64_t partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)( uint64_t a1, uint64_t a2)
{
  return specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( uint64_t a1, uint64_t a2)
{
  return closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56));
}

uint64_t closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply(uint64_t a1, uint64_t a2)
{
  return specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_10000D848()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #1 in closure #1 in MLServer.write(data:with:)@<X0>( void *a1@<X8>)
{
  return implicit closure #1 in closure #1 in MLServer.write(data:with:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_10000D88C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000D914()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000D944()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000D974()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000D9BC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000DA04()
{
  uint64_t v6 = type metadata accessor for DispatchTime(0LL);
  uint64_t v1 = *(void *)(v6 - 8);
  unint64_t v2 = (*(_DWORD *)(v1 + 80) + 16LL) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  unint64_t v5 = (v2 + v3 + *(_DWORD *)(v1 + 80)) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  uint64_t v9 = v5 + v3;
  uint64_t v7 = *(void (**)(unint64_t))(v1 + 8);
  v7(v0 + v2);
  ((void (*)(unint64_t, uint64_t))v7)(v0 + v5, v6);
  return swift_deallocObject(v8, v9);
}

uint64_t partial apply for implicit closure #3 in closure #1 in MLServer.write(data:with:)()
{
  return implicit closure #3 in closure #1 in MLServer.write(data:with:)();
}

uint64_t sub_10000DAF8()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000DB28()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)( uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000DB78()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3, double (*a4)(void))
{
  double v4 = a4();
  uint64_t v7 = *a1;
  uint64_t v5 = *a1 + 8LL;
  double v9 = v4;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v7, v5);
  uint64_t result = a1;
  *a1 = v7 + 8;
  return result;
}

uint64_t sub_10000DC24()
{
  return swift_deallocObject(v2, 32LL);
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(double (**)(void))(v3 + 16));
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt64, &type metadata for UInt64);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_10000DCD4()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)();
  return result;
}

uint64_t sub_10000DD18()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000DD48()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000DD78()
{
  return swift_deallocObject(v2, 32LL);
}

void *_s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DDC0()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DE08()
{
  return swift_deallocObject(v2, 32LL);
}

void _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0( uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t sub_10000DE78()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t partial apply for implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:)();
  return result;
}

uint64_t sub_10000DEBC()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000DEEC()
{
  return swift_deallocObject(v0, 17LL);
}

uint64_t sub_10000DF1C()
{
  return swift_deallocObject(v2, 32LL);
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DF64()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DFAC()
{
  return swift_deallocObject(v2, 32LL);
}

void closure #1 in OSLogArguments.append(_:)partial apply(uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1LL;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View( uint64_t a1)
{
}

void static Main.main()()
{
  id v2 = MLServerDelegate.__allocating_init()();
  id v1 = [(id)objc_opt_self(NSXPCListener) serviceListener];
  id v0 = v2;
  [v1 setDelegate:v2];
  swift_unknownObjectRelease(v2);
  [v1 activate];
}

void static Main.$main()()
{
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}