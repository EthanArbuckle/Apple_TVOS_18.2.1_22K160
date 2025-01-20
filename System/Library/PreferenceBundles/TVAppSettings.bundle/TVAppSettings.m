void sub_4884( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
  uint64_t v28;
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v28 - 112));
  _Unwind_Resume(a1);
}
}

void sub_4D74(_Unwind_Exception *a1)
{
}

void sub_4FE4(_Unwind_Exception *a1)
{
}

void sub_51A4(_Unwind_Exception *a1)
{
}

void sub_5814( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

void sub_5F34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_6A68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_7124( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_74C4(_Unwind_Exception *a1)
{
}

void sub_7784( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_7C6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_7DF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_7EF8(_Unwind_Exception *a1)
{
}

unint64_t VUIUserConsentStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0LL;
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance VUIUserConsentStatus( void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance VUIUserConsentStatus()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance VUIUserConsentStatus()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance VUIUserConsentStatus( uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t *protocol witness for RawRepresentable.init(rawValue:) in conformance VUIUserConsentStatus@<X0>( uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance VUIUserConsentStatus( void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t VUIUserConsentState.status.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC13TVAppSettings19VUIUserConsentState_status);
}

uint64_t VUIUserConsentState.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of Date?( v1 + OBJC_IVAR____TtC13TVAppSettings19VUIUserConsentState_lastModifiedDate,  a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t VUIUserConsentState.init(from:)(uint64_t a1)
{
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for SportsFavoriteService.UserConsent.Status(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v20 - v10;
  v12 = v1;
  SportsFavoriteService.UserConsent.State.status.getter();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
  uint64_t v14 = 0LL;
  if (v13 == enum case for SportsFavoriteService.UserConsent.Status.unknown(_:)) {
    goto LABEL_6;
  }
  if (v13 == enum case for SportsFavoriteService.UserConsent.Status.declined(_:))
  {
    uint64_t v14 = 1LL;
LABEL_6:
    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    *(void *)&v12[OBJC_IVAR____TtC13TVAppSettings19VUIUserConsentState_status] = v14;
    SportsFavoriteService.UserConsent.State.lastModifiedDate.getter(v15);
    outlined init with take of Date?( (uint64_t)v4,  (uint64_t)&v12[OBJC_IVAR____TtC13TVAppSettings19VUIUserConsentState_lastModifiedDate]);

    uint64_t v16 = (objc_class *)type metadata accessor for VUIUserConsentState(0LL);
    v20.receiver = v12;
    v20.super_class = v16;
    id v17 = objc_msgSendSuper2(&v20, "init");
    uint64_t v18 = type metadata accessor for SportsFavoriteService.UserConsent.State(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8LL))(a1, v18);
    return (uint64_t)v17;
  }

  if (v13 == enum case for SportsFavoriteService.UserConsent.Status.accepted(_:))
  {
    uint64_t v14 = 2LL;
    goto LABEL_6;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "TVAppSettings/VUISportsFavoriteService.swift",  44LL,  2LL,  25LL,  0);
  __break(1u);
  return result;
}

id VUIUserConsentState.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void VUIUserConsentState.init()()
{
}

id VUIUserConsentState.__deallocating_deinit()
{
  return VUIUserConsentState.__deallocating_deinit( 0LL,  (uint64_t (*)(void))type metadata accessor for VUIUserConsentState);
}

uint64_t type metadata accessor for VUIUserConsentState(uint64_t a1)
{
  uint64_t result = type metadata singleton initialization cache for VUIUserConsentState;
  if (!type metadata singleton initialization cache for VUIUserConsentState) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VUIUserConsentState);
  }
  return result;
}

uint64_t static VUISportsFavoriteService.userConsent()()
{
  uint64_t v1 = (void *)swift_task_alloc(unk_152A4);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = static VUISportsFavoriteService.userConsent();
  return v3();
}

uint64_t static VUISportsFavoriteService.userConsent()(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t @objc closure #1 in static VUISportsFavoriteService.userConsent()(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v2 = (void *)swift_task_alloc(unk_152A4);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = @objc closure #1 in static VUISportsFavoriteService.userConsent();
  return v4();
}

uint64_t @objc closure #1 in static VUISportsFavoriteService.userConsent()(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*v2 + 24);
  uint64_t v6 = *v2;
  swift_task_dealloc(v5);
  uint64_t v7 = *(void (***)(void, void, void))(v6 + 16);
  if (v3)
  {
    uint64_t v8 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    ((void (**)(void, void, void *))v7)[2](v7, 0LL, v8);

    _Block_release(v7);
  }

  else
  {
    ((void (**)(void, void *, void))v7)[2](v7, a1, 0LL);
    _Block_release(v7);
  }

  return (*(uint64_t (**)(void))(v6 + 8))();
}

id VUISportsFavoriteService.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUISportsFavoriteService();
  return objc_msgSendSuper2(&v2, "init");
}

id VUISportsFavoriteService.__deallocating_deinit(uint64_t a1)
{
  return VUIUserConsentState.__deallocating_deinit(a1, type metadata accessor for VUISportsFavoriteService);
}

id VUIUserConsentState.__deallocating_deinit(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  objc_super v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *objc_super v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    outlined destroy of Date?(a1, &demangling cache variable for type metadata for TaskPriority?);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_10C68, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    id v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    id v17 = 0LL;
  }

  return swift_task_create( v8,  v17,  (char *)&type metadata for () + 8,  &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TATu,  v16);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t specialized static VUISportsFavoriteService.userConsent()()
{
  uint64_t v1 = type metadata accessor for SportsFavoriteService(0LL);
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for SportsFavoriteService.UserConsent.State(0LL);
  v0[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[6] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v0[7] = swift_task_alloc(v5);
  v0[8] = swift_task_alloc(v5);
  return swift_task_switch(specialized static VUISportsFavoriteService.userConsent(), 0LL, 0LL);
}

{
  uint64_t v0;
  void *v1;
  static SportsFavoriteService.default.getter();
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to SportsFavoriteService.userConsent()[1]);
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = specialized static VUISportsFavoriteService.userConsent();
  return SportsFavoriteService.userConsent()(*(void *)(v0 + 64));
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v2 = *(void *)(*(void *)v1 + 72LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 24LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 32LL);
  unint64_t v5 = *(void *)(*(void *)v1 + 16LL);
  *(void *)(*(void *)v1 + 8_swift_stdlib_reportUnimplementedInitializer("TVAppSettings.VUIUserConsentState", 33LL, "init()", 6LL, 0LL) = v0;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v6 = specialized static VUISportsFavoriteService.userConsent();
  }
  else {
    uint64_t v6 = specialized static VUISportsFavoriteService.userConsent();
  }
  return swift_task_switch(v6, 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  unint64_t v5 = *(void *)(v0 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v6 = objc_allocWithZone((Class)type metadata accessor for VUIUserConsentState(0LL));
  uint64_t v7 = VUIUserConsentState.init(from:)(v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_task_dealloc(*(void *)(v0 + 64));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for VUISportsFavoriteService()
{
  return objc_opt_self(&OBJC_CLASS____TtC13TVAppSettings24VUISportsFavoriteService);
}

unint64_t lazy protocol witness table accessor for type VUIUserConsentStatus and conformance VUIUserConsentStatus()
{
  unint64_t result = lazy protocol witness table cache variable for type VUIUserConsentStatus and conformance VUIUserConsentStatus;
  if (!lazy protocol witness table cache variable for type VUIUserConsentStatus and conformance VUIUserConsentStatus)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for VUIUserConsentStatus,  &type metadata for VUIUserConsentStatus);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type VUIUserConsentStatus and conformance VUIUserConsentStatus);
  }

  return result;
}

ValueMetadata *type metadata accessor for VUIUserConsentStatus()
{
  return &type metadata for VUIUserConsentStatus;
}

uint64_t ObjC metadata update function for VUIUserConsentState()
{
  return type metadata accessor for VUIUserConsentState(0LL);
}

void type metadata completion function for VUIUserConsentState(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  type metadata accessor for Date?(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }

void type metadata accessor for Date?(uint64_t a1)
{
  if (!lazy cache variable for type metadata for Date?)
  {
    uint64_t v2 = type metadata accessor for Date(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for Date?);
    }
  }

uint64_t sub_AC6C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t partial apply for @objc closure #1 in static VUISportsFavoriteService.userConsent()()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  unint64_t v3 = (void *)swift_task_alloc(dword_15314);
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = partial apply for @objc closure #1 in static VUISportsFavoriteService.userConsent();
}

{
  uint64_t *v0;
  uint64_t v2;
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc(dword_15324);
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu))( v2,  v3,  v4);
}

uint64_t objectdestroy_5Tm()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_15334);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu
                                                                   + _sIeAgH_ytIeAgHr_TRTu))( a1,  v4,  v5,  v6);
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_AEA8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_15344);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for @objc closure #1 in static VUISportsFavoriteService.userConsent();
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu))( a1,  v4);
}

uint64_t outlined init with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void VUIUserConsentState.__allocating_init(from:)()
{
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__accessFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _accessFormatter];
}

id objc_msgSend__appGroup(void *a1, const char *a2, ...)
{
  return _[a1 _appGroup];
}

id objc_msgSend__autoPlayGroup(void *a1, const char *a2, ...)
{
  return _[a1 _autoPlayGroup];
}

id objc_msgSend__configuration(void *a1, const char *a2, ...)
{
  return _[a1 _configuration];
}

id objc_msgSend__handleDidUpdateAutoplayVideoSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDidUpdateAutoplayVideoSound:");
}

id objc_msgSend__loadConfigurationSync_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadConfigurationSync:withCompletion:");
}

id objc_msgSend__loadPostPlayAutoPlaySettingsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadPostPlayAutoPlaySettingsWithCompletion:");
}

id objc_msgSend__negateBooleanFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _negateBooleanFormatter];
}

id objc_msgSend__notificationsGroup(void *a1, const char *a2, ...)
{
  return _[a1 _notificationsGroup];
}

id objc_msgSend__promptToDisableChannel_withExternalID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptToDisableChannel:withExternalID:");
}

id objc_msgSend__promptToEnableChannel_withExternalID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptToEnableChannel:withExternalID:");
}

id objc_msgSend__purchasesAndRentalsGroup(void *a1, const char *a2, ...)
{
  return _[a1 _purchasesAndRentalsGroup];
}

id objc_msgSend__recordEvent_field_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordEvent:field:value:");
}

id objc_msgSend__refreshAppGroup(void *a1, const char *a2, ...)
{
  return _[a1 _refreshAppGroup];
}

id objc_msgSend__showVppaExpiredPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showVppaExpiredPrompt:");
}

id objc_msgSend__topShelfGroup(void *a1, const char *a2, ...)
{
  return _[a1 _topShelfGroup];
}

id objc_msgSend__updateAppDisplayNames_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAppDisplayNames:withCompletion:");
}

id objc_msgSend__updateDisplayNamesForUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDisplayNamesForUI:");
}

id objc_msgSend__videoAudioGroup(void *a1, const char *a2, ...)
{
  return _[a1 _videoAudioGroup];
}

id objc_msgSend_accessStatus(void *a1, const char *a2, ...)
{
  return _[a1 accessStatus];
}

id objc_msgSend_actionItemWithTitle_description_representedObject_keyPath_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionItemWithTitle:description:representedObject:keyPath:target:action:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_channelForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelForID:");
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return _[a1 channelID];
}

id objc_msgSend_channelIDForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelIDForBundleID:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_currentAutoPlayBgVideoSoundValue(void *a1, const char *a2, ...)
{
  return _[a1 currentAutoPlayBgVideoSoundValue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultSettings];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllHistoryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllHistoryWithCompletion:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didFetchConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 didFetchConfiguration];
}

id objc_msgSend_didFetchPostPlayAutoPlaySettings(void *a1, const char *a2, ...)
{
  return _[a1 didFetchPostPlayAutoPlaySettings];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return _[a1 externalID];
}

id objc_msgSend_fetchConfigurationWithOptions_cachePolicy_queryParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:");
}

id objc_msgSend_fetchStatusForAllTypesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStatusForAllTypesWithCompletion:");
}

id objc_msgSend_flow(void *a1, const char *a2, ...)
{
  return _[a1 flow];
}

id objc_msgSend_formatterWithOnTitle_offTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatterWithOnTitle:offTitle:");
}

id objc_msgSend_iTunesFileVideoResolution(void *a1, const char *a2, ...)
{
  return _[a1 iTunesFileVideoResolution];
}

id objc_msgSend_initWithApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithApplicationBundleIdentifier:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDomain_notifyChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:notifyChanges:");
}

id objc_msgSend_initWithFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFlow:");
}

id objc_msgSend_initWithInputs_outputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputs:outputs:");
}

id objc_msgSend_initWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:");
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettings:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isOnboarded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOnboarded:");
}

id objc_msgSend_isOptOutAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isOptOutAvailable];
}

id objc_msgSend_isRefreshingAppGroup(void *a1, const char *a2, ...)
{
  return _[a1 isRefreshingAppGroup];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithBundleIdentifier:");
}

id objc_msgSend_listGroupWithTitle_representedObject_keyPath_configurationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listGroupWithTitle:representedObject:keyPath:configurationBlock:");
}

id objc_msgSend_loadIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadIfNeededWithCompletion:");
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedButtonTitle];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedDescriptionForItemInViewController_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescriptionForItemInViewController:atIndexPath:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_offTitle(void *a1, const char *a2, ...)
{
  return _[a1 offTitle];
}

id objc_msgSend_onOffFormatter(void *a1, const char *a2, ...)
{
  return _[a1 onOffFormatter];
}

id objc_msgSend_onTitle(void *a1, const char *a2, ...)
{
  return _[a1 onTitle];
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_orderedChannels(void *a1, const char *a2, ...)
{
  return _[a1 orderedChannels];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presenterForPrivacySplashWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:");
}

id objc_msgSend_recordSettingsChange_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordSettingsChange:value:");
}

id objc_msgSend_reloadSettings(void *a1, const char *a2, ...)
{
  return _[a1 reloadSettings];
}

id objc_msgSend_reloadSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 reloadSettingsIfNeeded];
}

id objc_msgSend_representedObject(void *a1, const char *a2, ...)
{
  return _[a1 representedObject];
}

id objc_msgSend_requestInvalidation(void *a1, const char *a2, ...)
{
  return _[a1 requestInvalidation];
}

id objc_msgSend_requestReload(void *a1, const char *a2, ...)
{
  return _[a1 requestReload];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_setAccessoryTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryTypes:");
}

id objc_msgSend_setAutoHide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoHide:");
}

id objc_msgSend_setAvailableValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableValues:");
}

id objc_msgSend_setComparesArrayDeeply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComparesArrayDeeply:");
}

id objc_msgSend_setCurrentAutoPlayBgVideoSoundValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentAutoPlayBgVideoSoundValue:");
}

id objc_msgSend_setDescriptionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionText:");
}

id objc_msgSend_setDidFetchConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidFetchConfiguration:");
}

id objc_msgSend_setDidFetchPostPlayAutoPlaySettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidFetchPostPlayAutoPlaySettings:");
}

id objc_msgSend_setDynamicDeepLinkKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicDeepLinkKey:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setITunesFileVideoResolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesFileVideoResolution:");
}

id objc_msgSend_setITunesMaxHLSVideoResolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesMaxHLSVideoResolution:");
}

id objc_msgSend_setLocalizedDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedDescription:");
}

id objc_msgSend_setLocalizedValueFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedValueFormatter:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptInStatus_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptInStatus:completion:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setRefreshingAppGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshingAppGroup:");
}

id objc_msgSend_setSettingItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingItems:");
}

id objc_msgSend_setShouldPresentChildController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPresentChildController:");
}

id objc_msgSend_setStatus_forChannelID_externalID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:forChannelID:externalID:");
}

id objc_msgSend_setSyncMySportsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncMySportsEnabled:");
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBlock:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_settingItems(void *a1, const char *a2, ...)
{
  return _[a1 settingItems];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsForChannelID_externalID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForChannelID:externalID:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _[a1 sharedSettings];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportsUHDAndHDR(void *a1, const char *a2, ...)
{
  return _[a1 supportsUHDAndHDR];
}

id objc_msgSend_syncMySportsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 syncMySportsEnabled];
}

id objc_msgSend_synchronize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronize:completion:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleItemWithTitle_description_representedObject_keyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleItemWithTitle:description:representedObject:keyPath:");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_updateCloudStoreAppSettings_deleteHistory_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudStoreAppSettings:deleteHistory:completion:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vppaStatus(void *a1, const char *a2, ...)
{
  return _[a1 vppaStatus];
}