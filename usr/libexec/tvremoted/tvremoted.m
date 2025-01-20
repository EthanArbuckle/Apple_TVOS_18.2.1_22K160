LABEL_11:
  return (TVSBluetoothDevice *)v3;
}
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = _TVRDXPCLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "The tvremote daemon is starting.", v13, 2u);
  }

  v5 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.tvremoted") & 1) == 0)
  {
    id v6 = _TVRDXPCLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      main_cold_1(v7);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVRDLaunchEventHandlers_tvOS sharedInstance]( &OBJC_CLASS___TVRDLaunchEventHandlers_tvOS,  "sharedInstance"));
  [v8 setupHandlers];

  v9 = objc_alloc_init(&OBJC_CLASS___TVRDServer_tvOS);
  v10 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.tvremotecore.xpc");
  -[NSXPCListener setDelegate:](v10, "setDelegate:", v9);
  -[NSXPCListener resume](v10, "resume");
  objc_autoreleasePoolPop(v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v11 run];

  return 0;
}

id _TVRDXPCLog()
{
  if (_TVRDXPCLog_onceToken != -1) {
    dispatch_once(&_TVRDXPCLog_onceToken, &__block_literal_global_3);
  }
  return (id)_TVRDXPCLog_log;
}

id _TVRDNPLog()
{
  if (_TVRDNPLog_onceToken != -1) {
    dispatch_once(&_TVRDNPLog_onceToken, &__block_literal_global_6);
  }
  return (id)_TVRDNPLog_log;
}

void sub_100004C10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

LABEL_58:
    v46 = _TVRDNPLog();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v82 = v28;
      v83 = 2114;
      v84 = v64;
      v85 = 2114;
      v86 = v30;
      v87 = 2114;
      v88 = v29;
      v89 = 1026;
      v90 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Unable to determine best language code, given preferredLanguageCode %{public}@, availableLanguageCodes: %{public }@, bestLanguageCode: %{public}@, systemLanguageCode: %{public}@, containsOnlyForcedCharacteristic: %{BOOL,public}d",  buf,  0x30u);
    }

    v27 = 0LL;
    goto LABEL_61;
  }

  v44 = _TVRDNPLog();
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v82 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "No valid legible options found on content item: %@",  buf,  0xCu);
  }

  v11 = 0LL;
  v27 = 0LL;
LABEL_62:
  v48 = v27;

  return v48;
}
}

void sub_1000079AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100007D98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100008358( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100008DE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000930C(_Unwind_Exception *a1)
{
}

void sub_10000A304( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20)
{
}

void sub_10000A3C0()
{
}

void sub_10000A3C8()
{
}

void sub_10000A3D0()
{
}

void sub_10000A3D8()
{
}

void sub_10000A3E0()
{
}

void sub_10000A3E8()
{
}

void sub_10000A3F4()
{
}

void sub_10000A400()
{
}

void sub_10000A408()
{
}

void sub_10000A410()
{
}

void sub_10000A418()
{
}

void sub_10000A420()
{
}

void sub_10000A42C()
{
}

LABEL_12:
  return v4;
}

void sub_10000DA28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
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

LABEL_16:
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef?, Data>);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  id v6 = (unint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v8 = (void *)*(v6 - 2);
    uint64_t v7 = *(v6 - 1);
    unint64_t v9 = *v6;
    id v10 = v8;
    outlined copy of Data._Representation(v7, v9);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    v13 = (uint64_t *)(v4[7] + 16 * result);
    uint64_t *v13 = v7;
    v13[1] = v9;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v6 += 3;
    v4[2] = v16;
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

id MediaRemoteCommandCenter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaRemoteCommandCenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MediaRemoteCommandCenter()
{
  return objc_opt_self(&OBJC_CLASS___TVRDMediaRemoteCommandCenter);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CFStringRef(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for CFStringRef, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CFStringRef(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for CFStringRef, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CFStringRef( uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for CFStringRef, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CFStringRef( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for CFStringRef, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(void *a1)
{
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFStringRef();
    uint64_t v3 = v2;
    uint64_t v4 = lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef( &lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef,  (uint64_t)&protocol conformance descriptor for CFStringRef);
    id v5 = a1;
    _CFObject.hash(into:)(v8, v3, v4);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

  Swift::Int v6 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)((uint64_t)a1, v6);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v6 = v2;
    uint64_t v8 = ~v4;
    do
    {
      unint64_t v9 = *(void **)(*(void *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFStringRef();
          uint64_t v11 = v10;
          uint64_t v12 = lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef( &lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef,  (uint64_t)&protocol conformance descriptor for CFStringRef);
          id v13 = v9;
          LOBYTE(v11) = static _CFObject.== infix(_:_:)(v13, a1, v11, v12);

          if ((v11 & 1) != 0) {
            return v5;
          }
        }
      }

      else if (!a1)
      {
        return v5;
      }

      unint64_t v5 = (v5 + 1) & v8;
    }

    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0);
  }

  return v5;
}

Class specialized MediaRemoteCommandCenter.serializedLanguageOption(_:)(uint64_t a1)
{
  id v13 = 0LL;
  Class isa = (Class) [(id)objc_opt_self(NSKeyedArchiver) archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v13];
  id v2 = v13;
  if (isa)
  {
    uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(isa);
    unint64_t v5 = v4;

    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, Data)>);
    uint64_t inited = swift_initStackObject(v6, v14);
    *(_OWORD *)(inited + 16) = xmmword_1000198B0;
    uint64_t v8 = (void *)kMRMediaRemoteOptionLanguageOptionData;
    *(void *)(inited + 32) = kMRMediaRemoteOptionLanguageOptionData;
    *(void *)(inited + 40) = v3;
    *(void *)(inited + 4_Block_object_dispose(va, 8) = v5;
    id v9 = v8;
    outlined copy of Data._Representation(v3, v5);
    unint64_t v10 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CFStringRef?);
    lazy protocol witness table accessor for type CFStringRef? and conformance <A> A?();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v3, v5);
    swift_bridgeObjectRelease(v10);
  }

  else
  {
    uint64_t v11 = v2;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  return isa;
}

void specialized MediaRemoteCommandCenter.enableLanguageOption(_:)(void *a1)
{
  if (one-time initialization token for mediaRemoteCommands != -1) {
    swift_once( &one-time initialization token for mediaRemoteCommands,  one-time initialization function for mediaRemoteCommands);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v2, (uint64_t)static Logger.mediaRemoteCommands);
  id v3 = a1;
  unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v6 = 138543362;
    id v11 = v3;
    id v8 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    void *v7 = v3;

    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "Requesting MediaRemote enable media option: %{public}@",  v6,  0xCu);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v7, 1LL, v9);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
  }

  Class v10 = specialized MediaRemoteCommandCenter.serializedLanguageOption(_:)((uint64_t)v3);
  MRMediaRemoteSendCommand(27LL, v10);
}

void specialized MediaRemoteCommandCenter.disableCaptions()()
{
  if (one-time initialization token for remoteMonitor != -1) {
    swift_once(&one-time initialization token for remoteMonitor, one-time initialization function for remoteMonitor);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static Logger.remoteMonitor);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    uint64_t v12 = v5;
    *(_DWORD *)unint64_t v4 = 136446210;
    uint64_t v10 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000011LL, 0x800000010001E770LL, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy(v5, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  id v6 = objc_allocWithZone(&OBJC_CLASS___MRLanguageOption);
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 initWithType:1 languageTag:0 characteristics:0 displayName:0 identifier:v7];

  Class v9 = specialized MediaRemoteCommandCenter.serializedLanguageOption(_:)((uint64_t)v8);
  MRMediaRemoteSendCommand(28LL, v9);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
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

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t lazy protocol witness table accessor for type CFStringRef? and conformance <A> A?()
{
  unint64_t result = lazy protocol witness table cache variable for type CFStringRef? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type CFStringRef? and conformance <A> A?)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for CFStringRef?);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef( &lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef,  (uint64_t)&protocol conformance descriptor for CFStringRef);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CFStringRef? and conformance <A> A?);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void type metadata accessor for CFStringRef()
{
  if (!lazy cache variable for type metadata for CFStringRef)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100021290);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for CFStringRef);
    }
  }

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t base witness table accessor for Hashable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef( &lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef,  (uint64_t)&protocol conformance descriptor for CFStringRef);
}

uint64_t base witness table accessor for Equatable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef( &lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef,  (uint64_t)&protocol conformance descriptor for CFStringRef);
}

uint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef( unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFStringRef();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t one-time initialization function for log()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v0, log);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)log);
  if (one-time initialization token for xpc != -1) {
    swift_once(&one-time initialization token for xpc, one-time initialization function for xpc);
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.xpc);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v0 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v0, log);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)log);
  if (one-time initialization token for xpc != -1) {
    swift_once(&one-time initialization token for xpc, one-time initialization function for xpc);
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.xpc);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v0 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v0, log);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)log);
  if (one-time initialization token for remoteMonitor != -1) {
    swift_once(&one-time initialization token for remoteMonitor, one-time initialization function for remoteMonitor);
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.remoteMonitor);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t one-time initialization function for prefsDirectoryURL()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __swift_allocate_value_buffer(v0, static TVRDUtils.prefsDirectoryURL);
  uint64_t v1 = (char *)__swift_project_value_buffer(v0, (uint64_t)static TVRDUtils.prefsDirectoryURL);
  return closure #1 in variable initialization expression of static TVRDUtils.prefsDirectoryURL(v1);
}

uint64_t closure #1 in variable initialization expression of static TVRDUtils.prefsDirectoryURL@<X0>( char *a1@<X8>)
{
  v31 = a1;
  uint64_t v30 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v1 = *(void *)(v30 - 8);
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  id v13 = (char *)&v30 - v12;
  __chkstk_darwin(v11);
  BOOL v15 = (char *)&v30 - v14;
  id v16 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v32 = 0LL;
  id v17 = [v16 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:&v32];

  id v18 = (id)v32;
  if (!v17)
  {
    id v27 = (id)v32;
    uint64_t v28 = _convertNSErrorToError(_:)(v18);

    swift_willThrow();
    swift_errorRelease(v28);
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v21(v5, 1LL, 1LL, v6);
    goto LABEL_5;
  }

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);
  id v19 = v18;

  v20 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v20(v5, v13, v6);
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v21(v5, 0LL, 1LL, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
  {
LABEL_5:
    outlined destroy of URL?((uint64_t)v5);
    v25 = v31;
    uint64_t v26 = 1LL;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v21)(v25, v26, 1LL, v6);
  }

  v20(v15, v5, v6);
  uint64_t v32 = 0x65746F6D65727674LL;
  unint64_t v33 = 0xE900000000000064LL;
  uint64_t v22 = v30;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for URL.DirectoryHint.inferFromPath(_:),  v30);
  unint64_t v23 = lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(path:directoryHint:)(&v32, v3, &type metadata for String, v23);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v22);
  swift_bridgeObjectRelease(v33);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  v24 = v31;
  v20(v31, v10, v6);
  v25 = v24;
  uint64_t v26 = 0LL;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v21)(v25, v26, 1LL, v6);
}

id TVRDUtils.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVRDUtils();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TVRDUtils()
{
  return objc_opt_self(&OBJC_CLASS____TtC9tvremoted9TVRDUtils);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }

  return result;
}

void specialized static TVRDUtils.createPrefsDirectoryIfNeeded()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v60 - v4;
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v60 - v11;
  if (one-time initialization token for prefsDirectoryURL != -1) {
    swift_once( &one-time initialization token for prefsDirectoryURL,  one-time initialization function for prefsDirectoryURL);
  }
  uint64_t v13 = __swift_project_value_buffer(v0, (uint64_t)static TVRDUtils.prefsDirectoryURL);
  outlined init with copy of URL?(v13, (uint64_t)v5);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v14(v5, 1LL, v6) == 1)
  {
    outlined destroy of URL?((uint64_t)v5);
    if (one-time initialization token for log != -1) {
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)log);
    id v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v20 = (void *)swift_slowAlloc(32LL, -1LL);
      id v65 = v20;
      *(_DWORD *)id v19 = 136315138;
      outlined init with copy of URL?(v13, (uint64_t)v3);
      if (v14(v3, 1LL, v6) == 1)
      {
        outlined destroy of URL?((uint64_t)v3);
        uint64_t v21 = 0LL;
        unint64_t v22 = 0xE000000000000000LL;
      }

      else
      {
        uint64_t v21 = URL.absoluteString.getter();
        unint64_t v22 = v49;
        (*(void (**)(char *, uint64_t))(v7 + 8))(v3, v6);
      }

      uint64_t v64 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, (uint64_t *)&v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v22);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Incorrect prefs directory URL: %s", v19, 0xCu);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    return;
  }

  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
  id v23 = [(id)objc_opt_self(NSFileManager) defaultManager];
  unsigned __int8 v63 = 0;
  object = URL.path(percentEncoded:)(1)._object;
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  unsigned int v26 = [v23 fileExistsAtPath:v25 isDirectory:&v63];

  if (v63 == 1 && v26)
  {
    if (one-time initialization token for log != -1) {
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    uint64_t v28 = __swift_project_value_buffer(v27, (uint64_t)log);
    v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "tvremoted preferences directory exists", v31, 2u);
      swift_slowDealloc(v31, -1LL, -1LL);
    }

LABEL_32:
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    return;
  }

  URL._bridgeToObjectiveC()((NSURL *)v63);
  unint64_t v33 = v32;
  id v65 = 0LL;
  unsigned int v34 = [v23 createDirectoryAtURL:v32 withIntermediateDirectories:0 attributes:0 error:&v65];

  id v35 = v65;
  if (!v34)
  {
    id v50 = v65;
    uint64_t v51 = _convertNSErrorToError(_:)(v35);

    swift_willThrow();
    if (one-time initialization token for log != -1) {
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    }
    uint64_t v52 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v52, (uint64_t)log);
    swift_errorRetain(v51);
    uint64_t v53 = swift_errorRetain(v51);
    v54 = (os_log_s *)Logger.logObject.getter(v53);
    os_log_type_t v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v62 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)v56 = 138412290;
      v61 = v56 + 4;
      swift_errorRetain(v51);
      v57 = (void *)_swift_stdlib_bridgeErrorToNSError(v51);
      id v65 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v61, v56 + 12);
      v58 = v62;
      void *v62 = v57;
      swift_errorRelease(v51);
      swift_errorRelease(v51);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Failed to create prefs directory: %@", v56, 0xCu);
      uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v58, 1LL, v59);
      swift_slowDealloc(v58, -1LL, -1LL);
      swift_slowDealloc(v56, -1LL, -1LL);
    }

    else
    {

      swift_errorRelease(v51);
      swift_errorRelease(v51);
    }

    swift_errorRelease(v51);
    goto LABEL_32;
  }

  uint64_t v36 = one-time initialization token for log;
  id v37 = v65;
  if (v36 != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v38 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v38, (uint64_t)log);
  uint64_t v39 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v62 = (void *)swift_slowAlloc(32LL, -1LL);
    id v65 = v62;
    *(_DWORD *)v42 = 136315138;
    v61 = v42 + 4;
    unint64_t v43 = lazy protocol witness table accessor for type URL and conformance URL();
    uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter(v6, v43);
    unint64_t v46 = v45;
    uint64_t v64 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, (uint64_t *)&v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v61, v42 + 12);
    swift_bridgeObjectRelease(v46);
    v47 = *(void (**)(char *, uint64_t))(v7 + 8);
    v47(v10, v6);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Created tvremoted prefs directory at %s", v42, 0xCu);
    v48 = v62;
    swift_arrayDestroy(v62, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1LL, -1LL);
    swift_slowDealloc(v42, -1LL, -1LL);
  }

  else
  {

    v47 = *(void (**)(char *, uint64_t))(v7 + 8);
    v47(v10, v6);
  }

  v47(v12, v6);
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }

  return result;
}

uint64_t one-time initialization function for keepAliveFileURL()
{
  uint64_t v0 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_allocate_value_buffer(v5, static TVRDKeepAlive.keepAliveFileURL);
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)static TVRDKeepAlive.keepAliveFileURL);
  if (one-time initialization token for prefsDirectoryURL != -1) {
    swift_once( &one-time initialization token for prefsDirectoryURL,  one-time initialization function for prefsDirectoryURL);
  }
  uint64_t v9 = __swift_project_value_buffer(v4, (uint64_t)static TVRDUtils.prefsDirectoryURL);
  outlined init with copy of URL?(v9, (uint64_t)v7);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1LL, v10) == 1)
  {
    outlined destroy of URL?((uint64_t)v7);
    uint64_t v12 = 1LL;
  }

  else
  {
    unint64_t v15 = 0xD00000000000001DLL;
    unint64_t v16 = 0x800000010001E8B0LL;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for URL.DirectoryHint.inferFromPath(_:),  v0);
    unint64_t v13 = lazy protocol witness table accessor for type String and conformance String();
    URL.appending<A>(path:directoryHint:)(&v15, v3, &type metadata for String, v13);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    swift_bridgeObjectRelease(v16);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    uint64_t v12 = 0LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v8, v12, 1LL, v10);
}

uint64_t one-time initialization function for keepAliveFilePath()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (one-time initialization token for keepAliveFileURL != -1) {
    swift_once( &one-time initialization token for keepAliveFileURL,  one-time initialization function for keepAliveFileURL);
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)static TVRDKeepAlive.keepAliveFileURL);
  outlined init with copy of URL?(v3, (uint64_t)v2);
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1LL, v4) == 1)
  {
    uint64_t result = outlined destroy of URL?((uint64_t)v2);
    uint64_t countAndFlagsBits = 0LL;
    object = 0LL;
  }

  else
  {
    Swift::String v9 = URL.path(percentEncoded:)(1);
    uint64_t countAndFlagsBits = v9._countAndFlagsBits;
    object = v9._object;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
  }

  static TVRDKeepAlive.keepAliveFilePath = countAndFlagsBits;
  qword_100026CE8 = (uint64_t)object;
  return result;
}

id TVRDKeepAlive.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVRDKeepAlive();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TVRDKeepAlive()
{
  return objc_opt_self(&OBJC_CLASS____TtC9tvremoted13TVRDKeepAlive);
}

void specialized static TVRDKeepAlive.enable()()
{
  if (one-time initialization token for log != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)log);
  objc_super v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Enabling KeepAlive", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  id v5 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v17 = v5;
  if (!static TVRDKeepAlive.tvremotedKeepAliveTransaction)
  {
    uint64_t v6 = os_transaction_create("com.apple.tvremoted.keepalive");
    uint64_t v7 = static TVRDKeepAlive.tvremotedKeepAliveTransaction;
    static TVRDKeepAlive.tvremotedKeepAliveTransaction = v6;
    id v5 = (id)swift_unknownObjectRelease(v7);
  }

  if (one-time initialization token for keepAliveFilePath != -1) {
    id v5 = (id)swift_once( &one-time initialization token for keepAliveFilePath,  one-time initialization function for keepAliveFilePath);
  }
  if (qword_100026CE8)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    unsigned __int8 v9 = [v17 fileExistsAtPath:v8];

    if ((v9 & 1) == 0)
    {
      NSString v14 = String._bridgeToObjectiveC()();
      unsigned int v15 = [v17 createFileAtPath:v14 contents:0 attributes:0];

      uint64_t v10 = (os_log_s *)Logger.logObject.getter(v16);
      if (v15)
      {
        LOBYTE(v11) = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v10, (os_log_type_t)v11)) {
          goto LABEL_14;
        }
        uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v12 = 0;
        unint64_t v13 = "Enabled KeepAlive";
      }

      else
      {
        int v11 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v10, (os_log_type_t)v11)) {
          goto LABEL_14;
        }
        uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v12 = 0;
        unint64_t v13 = "Failed to create KeepAlive file";
      }

      goto LABEL_13;
    }
  }

  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v5);
  LOBYTE(v11) = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    unint64_t v13 = "KeepAlive file already exists";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v11, v13, v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

LABEL_14:
}

void specialized static TVRDKeepAlive.disable()()
{
  if (one-time initialization token for log != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)log);
  objc_super v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Disabling KeepAlive", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  id v5 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v29 = v5;
  if (one-time initialization token for keepAliveFilePath != -1) {
    id v5 = (id)swift_once( &one-time initialization token for keepAliveFilePath,  one-time initialization function for keepAliveFilePath);
  }
  if (qword_100026CE8
    && (NSString v6 = String._bridgeToObjectiveC()(),
        unsigned int v7 = [v29 fileExistsAtPath:v6],
        v6,
        v7))
  {
    NSString v8 = String._bridgeToObjectiveC()();
    id v30 = 0LL;
    unsigned int v9 = [v29 removeItemAtPath:v8 error:&v30];

    id v10 = v30;
    if (v9)
    {
      uint64_t v11 = static TVRDKeepAlive.tvremotedKeepAliveTransaction;
      static TVRDKeepAlive.tvremotedKeepAliveTransaction = 0LL;
      id v12 = v30;
      uint64_t v13 = swift_unknownObjectRelease(v11);
      NSString v14 = (os_log_s *)Logger.logObject.getter(v13);
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Disabled KeepAlive", v16, 2u);
        swift_slowDealloc(v16, -1LL, -1LL);
      }
    }

    else
    {
      id v20 = v30;
      uint64_t v21 = _convertNSErrorToError(_:)(v10);

      swift_willThrow();
      swift_errorRetain(v21);
      uint64_t v22 = swift_errorRetain(v21);
      id v23 = (os_log_s *)Logger.logObject.getter(v22);
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        NSString v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        unsigned int v26 = (void *)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)NSString v25 = 138412290;
        swift_errorRetain(v21);
        uint64_t v27 = (void *)_swift_stdlib_bridgeErrorToNSError(v21);
        id v30 = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v25 + 4, v25 + 12);
        *unsigned int v26 = v27;
        swift_errorRelease(v21);
        swift_errorRelease(v21);
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to remove KeepAlive file: %@", v25, 0xCu);
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy(v26, 1LL, v28);
        swift_slowDealloc(v26, -1LL, -1LL);
        swift_slowDealloc(v25, -1LL, -1LL);

        swift_errorRelease(v21);
      }

      else
      {

        swift_errorRelease(v21);
        swift_errorRelease(v21);
        swift_errorRelease(v21);
      }
    }
  }

  else
  {
    id v17 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "KeepAlive file not found", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }
  }

void one-time initialization function for xpc(uint64_t a1)
{
}

void one-time initialization function for mediaRemoteCommands()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v0, static Logger.mediaRemoteCommands);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.mediaRemoteCommands);
  id v1 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    uint64_t v5 = v4;

    Logger.init(subsystem:category:)(v3, v5, 0xD000000000000013LL, 0x800000010001E8D0LL);
  }

  else
  {
    __break(1u);
  }

void one-time initialization function for remoteMonitor(uint64_t a1)
{
}

void one-time initialization function for xpc(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  id v8 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v9 = [v8 bundleIdentifier];

  if (v9)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;

    Logger.init(subsystem:category:)(v10, v12, a3, a4);
  }

  else
  {
    __break(1u);
  }

uint64_t closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a8;
  void v8[9] = v16;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  uint64_t v9 = ((uint64_t (*)(void))type metadata accessor for UpNextItem)(0LL);
  v8[10] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[11] = v10;
  v8[12] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = ((uint64_t (*)(void))type metadata accessor for UpNextCollection)(0LL);
  v8[13] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v8[14] = v12;
  v8[15] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = ((uint64_t (*)(void))type metadata accessor for UpNextRequest)(0LL);
  v8[16] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v8[17] = v14;
  v8[18] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch( closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:),  0LL,  0LL);
}

uint64_t closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:)()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v3);
  UpNextRequest.init(paginationToken:playerContentId:)(v4, v3, v2, v1);
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to UpNextRequest.response()[1]);
  v0[19] = v5;
  void *v5 = v0;
  v5[1] = closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:);
  return UpNextRequest.response()(v0[15]);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v2 = *(void *)(*(void *)v1 + 152LL);
  *(void *)(*(void *)v1 + 160LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:);
  }
  else {
    uint64_t v3 = closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:);
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, unint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v1 = UpNextCollection.items.getter();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 88);
    specialized ContiguousArray.reserveCapacity(_:)(v3);
    uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    NSString v6 = *(void *)(v4 + 72);
    uint64_t v7 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    do
    {
      id v8 = *(void *)(v0 + 96);
      uint64_t v9 = *(void *)(v0 + 80);
      v7(v8, v5, v9);
      uint64_t v10 = UpNextItem.toTVRCUpNextInfo()();
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v9);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v11);
      uint64_t v12 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v12);
      uint64_t v13 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
      specialized ContiguousArray._endMutation()(v13);
      v5 += v6;
      --v3;
    }

    while (v3);
    uint64_t v14 = swift_bridgeObjectRelease(v2);
  }

  else
  {
    uint64_t v14 = swift_bridgeObjectRelease(v1);
  }

  os_log_type_t v15 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 120);
  unsigned int v26 = *(void *)(v0 + 128);
  uint64_t v27 = *(void *)(v0 + 144);
  os_log_type_t v18 = *(void *)(v0 + 104);
  id v17 = *(void *)(v0 + 112);
  id v19 = *(void (**)(uint64_t))(v0 + 64);
  id v20 = UpNextCollection.paginationToken.getter(v14);
  uint64_t v22 = v21;
  v19(v20);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v27, v26);
  id v23 = *(void *)(v0 + 120);
  os_log_type_t v24 = *(void *)(v0 + 96);
  swift_task_dealloc(*(void *)(v0 + 144));
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void (*v5)(void, void, void *, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v1 = *(void *)(v0 + 160);
  (*(void (**)(void, void))(*(void *)(v0 + 136) + 8LL))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  uint64_t v3 = type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for NSError,  &OBJC_CLASS___NSError_ptr);
  uint64_t result = swift_dynamicCast(v0 + 24, v0 + 16, v2, v3, 0LL);
  if ((_DWORD)result)
  {
    uint64_t v5 = *(void (**)(void, void, void *, void *))(v0 + 64);
    NSString v6 = *(void **)(v0 + 24);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    id v8 = swift_allocObject(v7, 64LL, 7LL);
    *(_OWORD *)(v8 + 16) = xmmword_1000198B0;
    _StringGuts.grow(_:)(26LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v9 = [v6 localizedDescription];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;

    v13._uint64_t countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v12);
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 32) = 0xD000000000000018LL;
    *(void *)(v8 + 40) = 0x800000010001E930LL;
    print(_:separator:terminator:)(v8, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
    swift_bridgeObjectRelease(v8);
    uint64_t v14 = v6;
    v5(0LL, 0LL, _swiftEmptyArrayStorage, v6);

    swift_errorRelease(*(void *)(v0 + 16));
    os_log_type_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 96);
    swift_task_dealloc(*(void *)(v0 + 144));
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  return result;
}

id UpNextItem.toTVRCUpNextInfo()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v1 = __chkstk_darwin(v0);
  v154 = (char *)&v143 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v167 = (uint64_t)&v143 - v4;
  __chkstk_darwin(v3);
  uint64_t v166 = (uint64_t)&v143 - v5;
  uint64_t v152 = type metadata accessor for ChannelType(0LL);
  uint64_t v163 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  v143 = (char *)&v143 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ChannelType?, ChannelType?));
  __chkstk_darwin(v149);
  uint64_t v151 = (uint64_t)&v143 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Channel?);
  uint64_t v9 = __chkstk_darwin(v8);
  v146 = (char *)&v143 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v148 = (char *)&v143 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ChannelType?);
  uint64_t v13 = __chkstk_darwin(v12);
  v150 = (char *)&v143 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v164 = (uint64_t)&v143 - v16;
  __chkstk_darwin(v15);
  v162 = (char *)&v143 - v17;
  uint64_t ItemOverlay = type metadata accessor for UpNextItemOverlay(0LL);
  p_Class isa = *(void **)(ItemOverlay - 8);
  uint64_t v18 = __chkstk_darwin(ItemOverlay);
  v153 = (char *)&v143 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v18);
  v144 = (objc_class *)((char *)&v143 - v21);
  uint64_t v22 = __chkstk_darwin(v20);
  v155 = (objc_class *)((char *)&v143 - v23);
  uint64_t v24 = __chkstk_darwin(v22);
  v145 = (objc_class *)((char *)&v143 - v25);
  __chkstk_darwin(v24);
  Class v160 = (Class)((char *)&v143 - v26);
  uint64_t v27 = type metadata accessor for ImageTemplate(0LL);
  uint64_t v158 = *(void *)(v27 - 8);
  v159 = (void (*)(void, void))v27;
  __chkstk_darwin(v27);
  id v29 = (char *)&v143 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = type metadata accessor for VideoItemType(0LL);
  uint64_t v156 = *(void *)(v30 - 8);
  v157 = (uint64_t (*)(void, void, void))v30;
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v143 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UpNextEpisodeDetails?);
  uint64_t v34 = __chkstk_darwin(v33);
  v147 = (char *)&v143 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v38 = (char *)&v143 - v37;
  uint64_t v39 = __chkstk_darwin(v36);
  os_log_type_t v41 = (char *)&v143 - v40;
  __chkstk_darwin(v39);
  unint64_t v43 = (char *)&v143 - v42;
  id v44 = [objc_allocWithZone(TVRCMediaInfo) init];
  UpNextItem.id.getter();
  uint64_t v46 = v45;
  NSString v47 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v46);
  v170 = v44;
  [v44 setIdentifier:v47];

  ((void (*)(void))UpNextItem.episodeDetails.getter)();
  uint64_t EpisodeDetails = type metadata accessor for UpNextEpisodeDetails(0LL);
  uint64_t v49 = *(void *)(EpisodeDetails - 8);
  v171 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
  int v50 = v171(v43, 1LL, EpisodeDetails);
  uint64_t v168 = EpisodeDetails;
  uint64_t v165 = v49;
  if (v50 == 1)
  {
    outlined destroy of TaskPriority?( (uint64_t)v43,  &demangling cache variable for type metadata for UpNextEpisodeDetails?);
  }

  else
  {
    UpNextEpisodeDetails.showId.getter();
    uint64_t v52 = v51;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v43, EpisodeDetails);
    if (v52)
    {
      NSString v53 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v52);
      goto LABEL_6;
    }
  }

  NSString v53 = 0LL;
LABEL_6:
  v54 = v159;
  os_log_type_t v55 = v157;
  v56 = v170;
  [v170 setShowIdentifier:v53];

  UpNextItem.title.getter();
  uint64_t v58 = v57;
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v58);
  [v56 setTitle:v59];

  UpNextItem.type.getter();
  uint64_t v60 = VideoItemType.toTVRCMediaInfoKind()();
  (*(void (**)(char *, uint64_t (*)(void, void, void)))(v156 + 8))(v32, v55);
  uint64_t v61 = UpNextItem.image.getter([v56 setKind:v60]);
  ImageTemplate.urlTemplate.getter(v61);
  uint64_t v63 = v62;
  (*(void (**)(char *, void))(v158 + 8))(v29, v54);
  NSString v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v63);
  [v56 setImageURLTemplate:v64];

  ((void (*)(void))UpNextItem.episodeDetails.getter)();
  uint64_t v65 = v168;
  if (v171(v41, 1LL, v168) == 1)
  {
    uint64_t v66 = outlined destroy of TaskPriority?( (uint64_t)v41,  &demangling cache variable for type metadata for UpNextEpisodeDetails?);
    uint64_t v67 = ItemOverlay;
    uint64_t v69 = v164;
    uint64_t v68 = v165;
  }

  else
  {
    Swift::Int Episode = UpNextEpisodeDetails.seasonNumber.getter();
    char v72 = v71;
    uint64_t v68 = v165;
    uint64_t v66 = (*(uint64_t (**)(char *, uint64_t))(v165 + 8))(v41, v65);
    uint64_t v67 = ItemOverlay;
    uint64_t v69 = v164;
    if ((v72 & 1) == 0)
    {
      type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
      Class isa = NSNumber.init(integerLiteral:)(Episode).super.super.isa;
      [v170 setSeasonNumber:isa];
    }
  }

  UpNextItem.episodeDetails.getter(v66);
  int v74 = v171(v38, 1LL, v65);
  uint64_t v75 = (uint64_t)v162;
  if (v74 == 1)
  {
    uint64_t v76 = outlined destroy of TaskPriority?( (uint64_t)v38,  &demangling cache variable for type metadata for UpNextEpisodeDetails?);
  }

  else
  {
    Swift::Double v77 = COERCE_DOUBLE(UpNextEpisodeDetails.episodeNumber.getter());
    char v79 = v78;
    uint64_t v76 = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v38, v65);
    if ((v79 & 1) == 0)
    {
      type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
      Class v80 = NSNumber.init(floatLiteral:)(v77).super.super.isa;
      [v170 setEpisodeNumber:v80];
    }
  }

  Class v81 = v160;
  uint64_t v82 = UpNextItem.overlay.getter(v76);
  UpNextItemOverlay.progress.getter(v82);
  char v84 = v83;
  v85 = (uint64_t (*)(Class, uint64_t))p_isa[1];
  Class v86 = (Class)v85(v81, v67);
  uint64_t v87 = v163;
  if ((v84 & 1) != 0)
  {
    p_Class isa = 0LL;
  }

  else
  {
    v88 = v145;
    uint64_t v89 = UpNextItem.overlay.getter(v86);
    Swift::Double v90 = COERCE_DOUBLE(UpNextItemOverlay.progress.getter(v89));
    char v92 = v91;
    id result = (id)v85(v88, v67);
    if ((v92 & 1) != 0)
    {
      __break(1u);
      goto LABEL_41;
    }

    type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
    Class v86 = NSNumber.init(floatLiteral:)(v90).super.super.isa;
    p_Class isa = &v86->isa;
  }

  v94 = v155;
  uint64_t v95 = UpNextItem.overlay.getter(v86);
  UpNextItemOverlay.timeRemaining.getter(v95);
  char v97 = v96;
  uint64_t v98 = v85(v94, v67);
  if ((v97 & 1) == 0)
  {
    v99 = v144;
    uint64_t v100 = UpNextItem.overlay.getter(v98);
    Swift::Double v101 = COERCE_DOUBLE(UpNextItemOverlay.timeRemaining.getter(v100));
    char v103 = v102;
    id result = (id)v85(v99, v67);
    if ((v103 & 1) == 0)
    {
      type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
      Class v160 = NSNumber.init(floatLiteral:)(v101).super.super.isa;
      goto LABEL_22;
    }

LABEL_41:
    __break(1u);
    return result;
  }

  Class v160 = 0LL;
LABEL_22:
  uint64_t v104 = v152;
  uint64_t v105 = (uint64_t)v148;
  ((void (*)(void))UpNextItem.channel.getter)();
  uint64_t v106 = type metadata accessor for Channel(0LL);
  uint64_t v107 = *(void *)(v106 - 8);
  v157 = *(uint64_t (**)(void, void, void))(v107 + 48);
  int v108 = v157(v105, 1LL, v106);
  uint64_t v158 = v107;
  v159 = (void (*)(void, void))v85;
  if (v108 == 1)
  {
    outlined destroy of TaskPriority?(v105, &demangling cache variable for type metadata for Channel?);
    v109 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v87 + 56);
    v109(v75, 1LL, 1LL, v104);
  }

  else
  {
    Channel.channelType.getter();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v105, v106);
    v109 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v87 + 56);
    v109(v75, 0LL, 1LL, v104);
  }

  uint64_t v110 = (uint64_t)v150;
  (*(void (**)(uint64_t, void, uint64_t))(v87 + 104))(v69, enum case for ChannelType.iTunes(_:), v104);
  v109(v69, 0LL, 1LL, v104);
  uint64_t v111 = v151;
  uint64_t v112 = v151 + *(int *)(v149 + 48);
  outlined init with copy of ChannelType?(v75, v151);
  outlined init with copy of ChannelType?(v69, v112);
  uint64_t v113 = v69;
  v114 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48);
  if (v114(v111, 1LL, v104) == 1)
  {
    outlined destroy of TaskPriority?(v113, &demangling cache variable for type metadata for ChannelType?);
    outlined destroy of TaskPriority?(v75, &demangling cache variable for type metadata for ChannelType?);
    if (v114(v112, 1LL, v104) == 1)
    {
      uint64_t v115 = outlined destroy of TaskPriority?(v111, &demangling cache variable for type metadata for ChannelType?);
LABEL_35:
      uint64_t v120 = 0LL;
      uint64_t v121 = 0LL;
      uint64_t v119 = (uint64_t)v147;
      goto LABEL_36;
    }

    goto LABEL_30;
  }

  outlined init with copy of ChannelType?(v111, v110);
  if (v114(v112, 1LL, v104) == 1)
  {
    outlined destroy of TaskPriority?(v164, &demangling cache variable for type metadata for ChannelType?);
    outlined destroy of TaskPriority?(v75, &demangling cache variable for type metadata for ChannelType?);
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v110, v104);
LABEL_30:
    uint64_t v115 = outlined destroy of TaskPriority?( v111,  &demangling cache variable for type metadata for (ChannelType?, ChannelType?));
    uint64_t v116 = (uint64_t)v146;
    uint64_t v117 = v158;
    goto LABEL_31;
  }

  uint64_t v123 = v75;
  v124 = v143;
  (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v143, v112, v104);
  uint64_t v125 = lazy protocol witness table accessor for type ChannelType and conformance ChannelType( &lazy protocol witness table cache variable for type ChannelType and conformance ChannelType,  (uint64_t (*)(uint64_t))&type metadata accessor for ChannelType,  (uint64_t)&protocol conformance descriptor for ChannelType);
  LODWORD(v156) = dispatch thunk of static Equatable.== infix(_:_:)(v110, v124, v104, v125);
  v126 = *(void (**)(char *, uint64_t))(v87 + 8);
  v126(v124, v104);
  outlined destroy of TaskPriority?(v164, &demangling cache variable for type metadata for ChannelType?);
  outlined destroy of TaskPriority?(v123, &demangling cache variable for type metadata for ChannelType?);
  v126((char *)v110, v104);
  uint64_t v115 = outlined destroy of TaskPriority?(v111, &demangling cache variable for type metadata for ChannelType?);
  uint64_t v116 = (uint64_t)v146;
  uint64_t v117 = v158;
  if ((v156 & 1) != 0) {
    goto LABEL_35;
  }
LABEL_31:
  UpNextItem.channel.getter(v115);
  int v118 = v157(v116, 1LL, v106);
  uint64_t v119 = (uint64_t)v147;
  if (v118 == 1)
  {
    uint64_t v115 = outlined destroy of TaskPriority?(v116, &demangling cache variable for type metadata for Channel?);
    uint64_t v120 = 0LL;
    uint64_t v121 = 0LL;
  }

  else
  {
    uint64_t v120 = Channel.title.getter();
    uint64_t v121 = v122;
    uint64_t v115 = (*(uint64_t (**)(uint64_t, uint64_t))(v117 + 8))(v116, v106);
  }

LABEL_36:
  uint64_t v127 = UpNextItem.contextString.getter(v115);
  uint64_t v129 = v128;
  uint64_t v130 = v166;
  UpNextItem.actionURL.getter();
  uint64_t v131 = type metadata accessor for URL(0LL);
  v132 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v131 - 8) + 56LL);
  uint64_t v133 = v132(v130, 0LL, 1LL, v131);
  uint64_t v134 = UpNextItem.shareURL.getter(v133);
  UpNextItem.episodeDetails.getter(v134);
  uint64_t v135 = v168;
  if (v171((char *)v119, 1LL, v168) == 1)
  {
    outlined destroy of TaskPriority?(v119, &demangling cache variable for type metadata for UpNextEpisodeDetails?);
    v136 = v154;
    v132((uint64_t)v154, 1LL, 1LL, v131);
    uint64_t v137 = (uint64_t)v136;
  }

  else
  {
    uint64_t v137 = (uint64_t)v154;
    UpNextEpisodeDetails.shareShowURL.getter();
    (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v119, v135);
  }

  uint64_t v138 = ItemOverlay;
  uint64_t v139 = type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for TVRCUpNextInfo,  &OBJC_CLASS___TVRCUpNextInfo_ptr);
  v140 = v153;
  uint64_t v141 = UpNextItem.overlay.getter(v139);
  char Item = UpNextItemOverlay.needsCornerBlur.getter(v141);
  v159(v140, v138);
  return @nonobjc TVRCUpNextInfo.__allocating_init(mediaInfo:reason:service:isAppleOriginal:progress:timeRemaining:actionURL:share:shareShow:artworkNeedsCornerBlur:)( v170,  v127,  v129,  v120,  v121,  0,  p_isa,  v160,  v166,  v167,  v137,  Item & 1);
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    outlined destroy of TaskPriority?(a1, &demangling cache variable for type metadata for TaskPriority?);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100021358, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create( v8,  v18,  (char *)&type metadata for () + 8,  &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATu,  v17);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSString?, @unowned NSArray, @unowned NSError?) -> ()( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2) {
    NSString v7 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v7 = 0LL;
  }
  type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for TVRCUpNextInfo,  &OBJC_CLASS___TVRCUpNextInfo_ptr);
  v8.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  if (a4) {
    uint64_t v9 = _convertErrorToNSError(_:)(a4);
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = (id)v9;
  (*(void (**)(uint64_t, NSString, Class))(a5 + 16))(a5, v7, v8.super.isa);
}

id AppServicesUpNextController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppServicesUpNextController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppServicesUpNextController()
{
  return objc_opt_self(&OBJC_CLASS___TVRDAppServicesUpNextController);
}

uint64_t sub_1000128A4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString?, @unowned NSArray, @unowned NSError?) -> ()( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1000128D0()
{
  return swift_deallocObject(v0, 80LL, 7LL);
}

uint64_t partial apply for closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:)( uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc(dword_1000269D4);
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = partial apply for closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:);
  return closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:)( a1,  v4,  v5,  v6,  v7,  v8,  v9,  v10);
}

uint64_t partial apply for closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:)()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t VideoItemType.toTVRCMediaInfoKind()()
{
  uint64_t v0 = type metadata accessor for VideoItemType(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v39 = (char *)&v37 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v37 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v40 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  v40((char *)&v37 - v13, enum case for VideoItemType.movie(_:), v0);
  uint64_t v15 = lazy protocol witness table accessor for type ChannelType and conformance ChannelType( &lazy protocol witness table cache variable for type VideoItemType and conformance VideoItemType,  (uint64_t (*)(uint64_t))&type metadata accessor for VideoItemType,  (uint64_t)&protocol conformance descriptor for VideoItemType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v43, v0, v15);
  dispatch thunk of RawRepresentable.rawValue.getter(&v41, v0, v15);
  uint64_t v16 = v44;
  uint64_t v17 = v42;
  if (v43 == v41 && v44 == v42)
  {
    uint64_t v18 = 2LL;
    swift_bridgeObjectRelease_n(v44, 2LL);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }

  else
  {
    uint64_t v38 = v4;
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v44);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v17);
    uint64_t v20 = *(void (**)(char *, uint64_t))(v1 + 8);
    v20(v14, v0);
    if ((v19 & 1) != 0)
    {
      return 2LL;
    }

    else
    {
      v40(v12, enum case for VideoItemType.episode(_:), v0);
      dispatch thunk of RawRepresentable.rawValue.getter(&v43, v0, v15);
      dispatch thunk of RawRepresentable.rawValue.getter(&v41, v0, v15);
      uint64_t v21 = v44;
      uint64_t v22 = v42;
      if (v43 == v41 && v44 == v42)
      {
        swift_bridgeObjectRelease_n(v44, 2LL);
        v20(v12, v0);
        return 1LL;
      }

      else
      {
        char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v44);
        swift_bridgeObjectRelease(v21);
        swift_bridgeObjectRelease(v22);
        v20(v12, v0);
        if ((v23 & 1) != 0)
        {
          return 1LL;
        }

        else
        {
          v40(v9, enum case for VideoItemType.song(_:), v0);
          dispatch thunk of RawRepresentable.rawValue.getter(&v43, v0, v15);
          dispatch thunk of RawRepresentable.rawValue.getter(&v41, v0, v15);
          uint64_t v24 = v44;
          uint64_t v25 = v42;
          if (v43 == v41 && v44 == v42)
          {
            swift_bridgeObjectRelease_n(v44, 2LL);
            v20(v9, v0);
            return 4LL;
          }

          else
          {
            char v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v44);
            swift_bridgeObjectRelease(v24);
            swift_bridgeObjectRelease(v25);
            v20(v9, v0);
            if ((v26 & 1) != 0)
            {
              return 4LL;
            }

            else
            {
              uint64_t v27 = v39;
              v40(v39, enum case for VideoItemType.tvshow(_:), v0);
              dispatch thunk of RawRepresentable.rawValue.getter(&v43, v0, v15);
              dispatch thunk of RawRepresentable.rawValue.getter(&v41, v0, v15);
              uint64_t v28 = v44;
              uint64_t v29 = v42;
              if (v43 == v41 && v44 == v42)
              {
                swift_bridgeObjectRelease_n(v44, 2LL);
                v20(v27, v0);
                return 3LL;
              }

              else
              {
                char v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v44);
                swift_bridgeObjectRelease(v28);
                swift_bridgeObjectRelease(v29);
                v20(v27, v0);
                if ((v30 & 1) != 0)
                {
                  return 3LL;
                }

                else
                {
                  uint64_t v31 = v38;
                  v40(v38, enum case for VideoItemType.sportingEvent(_:), v0);
                  dispatch thunk of RawRepresentable.rawValue.getter(&v43, v0, v15);
                  dispatch thunk of RawRepresentable.rawValue.getter(&v41, v0, v15);
                  uint64_t v32 = v44;
                  uint64_t v33 = v42;
                  if (v43 == v41 && v44 == v42)
                  {
                    swift_bridgeObjectRelease_n(v44, 2LL);
                    uint64_t v18 = 5LL;
                  }

                  else
                  {
                    char v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v44);
                    swift_bridgeObjectRelease(v32);
                    swift_bridgeObjectRelease(v33);
                    BOOL v35 = (v34 & 1) == 0;
                    uint64_t v31 = v38;
                    if (v35) {
                      uint64_t v18 = 2LL;
                    }
                    else {
                      uint64_t v18 = 5LL;
                    }
                  }

                  v20(v31, v0);
                }
              }
            }
          }
        }
      }
    }
  }

  return v18;
}

id @nonobjc TVRCUpNextInfo.__allocating_init(mediaInfo:reason:service:isAppleOriginal:progress:timeRemaining:actionURL:share:shareShow:artworkNeedsCornerBlur:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a3)
  {
    NSString v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }

  else
  {
    NSString v34 = 0LL;
  }

  BOOL v35 = a7;
  uint64_t v36 = a8;
  if (a5)
  {
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a5);
  }

  else
  {
    NSString v17 = 0LL;
  }

  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  uint64_t v22 = 0LL;
  if (v20(a9, 1LL, v18) != 1)
  {
    URL._bridgeToObjectiveC()(v21);
    uint64_t v22 = v23;
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a9, v18);
  }

  if (v20(a10, 1LL, v18) == 1)
  {
    uint64_t v25 = 0LL;
  }

  else
  {
    URL._bridgeToObjectiveC()(v24);
    uint64_t v25 = v26;
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a10, v18);
  }

  if (v20(a11, 1LL, v18) == 1)
  {
    uint64_t v28 = 0LL;
  }

  else
  {
    URL._bridgeToObjectiveC()(v27);
    uint64_t v28 = v29;
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a11, v18);
  }

  LOBYTE(v32) = a12 & 1;
  id v30 =  [(id)((uint64_t (*)())swift_getObjCClassFromMetadata)() upNextInfoWithMediaInfo:a1 reason:v34 service:v17 isAppleOriginal:a6 & 1 progress:v35 timeRemaining:v36 actionURL:v22 shareURL:v25 shareShowUR L:v28 artworkNeedsCornerBlur:v32];

  return v30;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100013168()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000269E4);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))( a1,  v4);
}

uint64_t outlined init with copy of ChannelType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ChannelType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for NSError(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t lazy protocol witness table accessor for type ChannelType and conformance ChannelType( unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void closure #1 in SiriRemoteMonitor.cbDeviceForPairedRemote(_:)( uint64_t a1, void (*a2)(void, uint64_t), uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    swift_errorRetain(a1);
    if (one-time initialization token for log != -1) {
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v9, (uint64_t)log);
    swift_errorRetain(a1);
    uint64_t v10 = swift_errorRetain(a1);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v14 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v13 = 138412290;
      swift_errorRetain(a1);
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError(a1);
      uint64_t v24 = (void **)v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v13 + 4, v13 + 12);
      uint64_t *v14 = v15;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error activating CBController: %@", v13, 0xCu);
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v14, 1LL, v16);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    swift_errorRetain(a1);
    a2(0LL, a1);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  else
  {
    uint64_t v20 = (void *)swift_allocObject(&unk_1000213F8, 56LL, 7LL);
    v20[2] = a4;
    v20[3] = a2;
    void v20[4] = a3;
    v20[5] = a5;
    v20[6] = a6;
    v25[3] = partial apply for closure #1 in closure #1 in SiriRemoteMonitor.cbDeviceForPairedRemote(_:);
    char v26 = v20;
    uint64_t v24 = _NSConcreteStackBlock;
    v25[0] = 1107296256LL;
    v25[1] = thunk for @escaping @callee_guaranteed (@guaranteed [CBDevice]?, @guaranteed Error?) -> ();
    v25[2] = &block_descriptor_9;
    uint64_t v21 = _Block_copy(&v24);
    uint64_t v22 = v26;
    id v23 = a4;
    swift_retain(a3);
    swift_bridgeObjectRetain(a6);
    swift_release(v22);
    [v23 getDevicesWithFlags:1 completionHandler:v21];
    _Block_release(v21);
  }

void closure #1 in closure #1 in SiriRemoteMonitor.cbDeviceForPairedRemote(_:)( uint64_t a1, uint64_t a2, id a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a2)
  {
    if (a1)
    {
      swift_bridgeObjectRetain(a7);
      uint64_t v20 = swift_bridgeObjectRetain(a1);
      uint64_t v21 = (uint64_t)specialized _ArrayProtocol.filter(_:)(v20, a6, a7);
      swift_bridgeObjectRelease(a1);
      swift_bridgeObjectRelease(a7);
      if ((unint64_t)v21 >> 62)
      {
        if (v21 < 0) {
          uint64_t v27 = v21;
        }
        else {
          uint64_t v27 = v21 & 0xFFFFFFFFFFFFFF8LL;
        }
        uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v27);
        if (v22)
        {
LABEL_9:
          BOOL v23 = __OFSUB__(v22, 1LL);
          unint64_t v24 = v22 - 1;
          if (v23)
          {
            __break(1u);
          }

          else if ((v21 & 0xC000000000000001LL) == 0)
          {
            if ((v24 & 0x8000000000000000LL) != 0)
            {
              __break(1u);
            }

            else if (v24 < *(void *)((v21 & 0xFFFFFFFFFFFFF8LL) + 0x10))
            {
              id v25 = *(id *)(v21 + 8 * v24 + 32);
LABEL_14:
              id v28 = v25;
              swift_bridgeObjectRelease(v21);
              id v26 = v28;
LABEL_23:
              id v29 = v26;
              a4();

              return;
            }

            __break(1u);
            return;
          }

          id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v21);
          goto LABEL_14;
        }
      }

      else
      {
        uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        if (v22) {
          goto LABEL_9;
        }
      }

      swift_bridgeObjectRelease(v21);
    }

    id v26 = 0LL;
    goto LABEL_23;
  }

  swift_errorRetain(a2);
  if (one-time initialization token for log != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v12, (uint64_t)log);
  swift_errorRetain(a2);
  uint64_t v13 = swift_errorRetain(a2);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    NSString v17 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v16 = 138412290;
    swift_errorRetain(a2);
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError(a2);
    uint64_t v30 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v16 + 4, v16 + 12);
    *NSString v17 = v18;
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Error getting cbDevices: %@", v16, 0xCu);
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v17, 1LL, v19);
    swift_slowDealloc(v17, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }

  swift_errorRetain(a2);
  ((void (*)(void, uint64_t))a4)(0LL, a2);
  swift_errorRelease(a2);
  swift_errorRelease(a2);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [CBDevice]?, @guaranteed Error?) -> ()( uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v7 = type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for CBDevice,  &OBJC_CLASS___CBDevice_ptr);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }

  swift_retain(v5);
  id v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4(a2);
  swift_release(v3);
}

Swift::Void __swiftcall SiriRemoteMonitor.activate()()
{
  uint64_t v1 = v0;
  if (one-time initialization token for log != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)log);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Activating SiriRemoteMonitor", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___NSNotificationCenter);
  id v8 = [v7 defaultCenter];
  [v8 addObserver:v1 selector:"handleNotification:" name:TVSBluetoothManagerDidUpdateNotification object:0];

  id v9 = [v7 defaultCenter];
  [v9 addObserver:v1 selector:"handleNotification:" name:TVSBluetoothRemoteDidConnectNotification object:0];

  [(id)objc_opt_self(TVSBluetoothRemoteUtilities) startConnectionMonitoring];
}

Swift::Void __swiftcall SiriRemoteMonitor.invalidate()()
{
  uint64_t v1 = v0;
  if (one-time initialization token for log != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)log);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalidating SiriRemoteMonitor", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  id v7 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  [v7 removeObserver:v1];

  [(id)objc_opt_self(TVSBluetoothRemoteUtilities) stopConnectionMonitoring];
}

void SiriRemoteMonitor.handleNotification(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (one-time initialization token for log != -1) {
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v4, (uint64_t)log);
  id v5 = a1;
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v9;
    *(_DWORD *)id v8 = 136315138;
    id v10 = [v5 name];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    unint64_t v13 = v12;

    uint64_t v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v13, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, aBlock, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v14 = swift_allocObject(&unk_100021380, 24LL, 7LL);
  *(void *)(v14 + 16) = v2;
  os_log_type_t v15 = *(void **)&v2[OBJC_IVAR___TVRDSiriRemoteMonitor_btManager];
  uint64_t v16 = v2;
  id v17 = [v15 pairedRemote];
  if (v17
    && (uint64_t v18 = v17, v19 = [v17 identifier], v18, v19))
  {
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    uint64_t v22 = v21;

    id v23 = [objc_allocWithZone(CBController) init];
    unint64_t v24 = (void *)swift_allocObject(&unk_1000213A8, 56LL, 7LL);
    v24[2] = partial apply for closure #1 in SiriRemoteMonitor.updatePairedRemote();
    v24[3] = v14;
    v24[4] = v23;
    v24[5] = v20;
    v24[6] = v22;
    aBlock[4] = (uint64_t)partial apply for closure #1 in SiriRemoteMonitor.cbDeviceForPairedRemote(_:);
    uint64_t v33 = v24;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    aBlock[3] = (uint64_t)&block_descriptor;
    id v25 = _Block_copy(aBlock);
    id v26 = v33;
    swift_retain(v14);
    id v27 = v23;
    swift_release(v26);
    [v27 activateWithCompletion:v25];
    _Block_release(v25);

    swift_release(v14);
  }

  else
  {
    id v28 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "No paired remote found", v30, 2u);
      swift_slowDealloc(v30, -1LL, -1LL);
    }

    closure #1 in SiriRemoteMonitor.updatePairedRemote()(0LL, 0LL, v16);
    swift_release(v14);
  }

void closure #1 in SiriRemoteMonitor.updatePairedRemote()(void *a1, uint64_t a2, char *a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  os_log_type_t v7 = *(os_log_s **)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2)
  {
    swift_errorRetain(a2);
    if (one-time initialization token for log != -1) {
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v14, (uint64_t)log);
    swift_errorRetain(a2);
    uint64_t v15 = swift_errorRetain(a2);
    Class v80 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v80, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v18 = (void ***)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)id v17 = 138412290;
      swift_errorRetain(a2);
      id v19 = (void **)_swift_stdlib_bridgeErrorToNSError(a2);
      aBlock = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v83, v17 + 4, v17 + 12);
      *uint64_t v18 = v19;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v80, v16, "Error fetching CBDevice for Remote: %@", v17, 0xCu);
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v18, 1LL, v20);
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);

      swift_errorRelease(a2);
    }

    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }
  }

  else
  {
    Class v80 = v7;
    if (a1)
    {
      char v79 = (void **)v10;
      uint64_t v21 = (void *)objc_opt_self(&OBJC_CLASS___TVRCSiriRemoteInfo);
      Swift::Double v77 = a1;
      id v78 = a1;
      id v22 = objc_msgSend(v21, "siriRemoteInfoFromCBDevice:");
      id v23 = [*(id *)&a3[OBJC_IVAR___TVRDSiriRemoteMonitor_btManager] pairedRemote];
      if (v23)
      {
        unint64_t v24 = v23;
        [v22 updateWithTVSBluetoothDevice:v23];
      }

      uint64_t v25 = swift_allocObject(&unk_100021498, 32LL, 7LL);
      *(void *)(v25 + 16) = a3;
      *(void *)(v25 + 24) = v22;
      Class v86 = partial apply for closure #1 in closure #1 in SiriRemoteMonitor.updatePairedRemote();
      uint64_t v87 = v25;
      aBlock = _NSConcreteStackBlock;
      uint64_t v83 = 1107296256LL;
      char v84 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      v85 = &block_descriptor_21;
      id v26 = _Block_copy(&aBlock);
      id v27 = a3;
      id v28 = v22;
      static DispatchQoS.unspecified.getter(v28);
      Class v81 = _swiftEmptyArrayStorage;
      uint64_t v29 = lazy protocol witness table accessor for type ChannelType and conformance ChannelType( &lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      uint64_t v31 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]( &lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A],  &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      dispatch thunk of SetAlgebra.init<A>(_:)(&v81, v30, v31, v6, v29);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v13, v9, v26);
      _Block_release(v26);
      (*((void (**)(char *, uint64_t))v80 + 1))(v9, v6);
      (*(void (**)(char *, void **))(v11 + 8))(v13, v79);
      swift_release(v87);
      if (one-time initialization token for log != -1) {
        swift_once(&one-time initialization token for log, one-time initialization function for log);
      }
      uint64_t v32 = type metadata accessor for Logger(0LL);
      __swift_project_value_buffer(v32, (uint64_t)log);
      uint64_t v33 = (void **)v28;
      NSString v34 = (os_log_s *)Logger.logObject.getter(v33);
      os_log_type_t v35 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v37 = (void ***)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)uint64_t v36 = 138477827;
        aBlock = v33;
        uint64_t v38 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v83, v36 + 4, v36 + 12);
        *uint64_t v37 = v33;

        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Update SiriRemoteInfo: %{private}@", v36, 0xCu);
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy(v37, 1LL, v39);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {

        NSString v34 = (os_log_s *)v33;
      }

      id v50 = v78;

      id v51 = [v50 irkData];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v51);
        unint64_t v55 = v54;

        id v56 = v50;
        outlined copy of Data._Representation(v53, v55);
        uint64_t v57 = v56;
        uint64_t v58 = outlined copy of Data._Representation(v53, v55);
        NSString v59 = (os_log_s *)Logger.logObject.getter(v58);
        os_log_type_t v60 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v59, v60))
        {
          uint64_t v61 = swift_slowAlloc(22LL, -1LL);
          uint64_t v62 = (void *)swift_slowAlloc(8LL, -1LL);
          char v79 = (void **)swift_slowAlloc(32LL, -1LL);
          Class v81 = v57;
          aBlock = v79;
          *(_DWORD *)uint64_t v61 = 138478083;
          Class v80 = (os_log_s *)v33;
          uint64_t v63 = v57;
          id v78 = v63;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &aBlock, v61 + 4, v61 + 12);
          void *v62 = v77;

          *(_WORD *)(v61 + 12) = 2081;
          outlined copy of Data._Representation(v53, v55);
          uint64_t v64 = Data.description.getter(v53, v55);
          unint64_t v66 = v65;
          outlined consume of Data._Representation(v53, v55);
          Class v81 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v66, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &aBlock, v61 + 14, v61 + 22);
          swift_bridgeObjectRelease(v66);
          outlined consume of Data._Representation(v53, v55);
          outlined consume of Data._Representation(v53, v55);
          _os_log_impl( (void *)&_mh_execute_header,  v59,  v60,  "Found remote %{private}@) with irk %{private}s",  (uint8_t *)v61,  0x16u);
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy(v62, 1LL, v67);
          swift_slowDealloc(v62, -1LL, -1LL);
          uint64_t v68 = v79;
          swift_arrayDestroy(v79, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v68, -1LL, -1LL);
          swift_slowDealloc(v61, -1LL, -1LL);

          outlined consume of Data._Representation(v53, v55);
        }

        else
        {

          outlined consume of Data._Representation(v53, v55);
          outlined consume of Data._Representation(v53, v55);
          outlined consume of Data._Representation(v53, v55);
        }
      }

      else
      {
        uint64_t v69 = (void **)v50;
        v70 = (os_log_s *)Logger.logObject.getter(v69);
        os_log_type_t v71 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v70, v71))
        {
          char v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          v73 = (void *)swift_slowAlloc(8LL, -1LL);
          *(_DWORD *)char v72 = 138412290;
          aBlock = v69;
          int v74 = v69;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v83, v72 + 4, v72 + 12);
          void *v73 = v77;

          _os_log_impl((void *)&_mh_execute_header, v70, v71, "found remote %@ with no irk data", v72, 0xCu);
          uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy(v73, 1LL, v75);
          swift_slowDealloc(v73, -1LL, -1LL);
          swift_slowDealloc(v72, -1LL, -1LL);
        }

        else
        {
        }
      }
    }

    else
    {
      if (one-time initialization token for log != -1) {
        swift_once(&one-time initialization token for log, one-time initialization function for log);
      }
      uint64_t v40 = type metadata accessor for Logger(0LL);
      uint64_t v41 = __swift_project_value_buffer(v40, (uint64_t)log);
      uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
      os_log_type_t v43 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "No paired siri remote found. Clearing existing SiriRemoteInfo",  v44,  2u);
        swift_slowDealloc(v44, -1LL, -1LL);
      }

      uint64_t v45 = swift_allocObject(&unk_100021448, 24LL, 7LL);
      *(void *)(v45 + 16) = a3;
      Class v86 = partial apply for closure #2 in closure #1 in SiriRemoteMonitor.updatePairedRemote();
      uint64_t v87 = v45;
      aBlock = _NSConcreteStackBlock;
      uint64_t v83 = 1107296256LL;
      char v84 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      v85 = &block_descriptor_15;
      uint64_t v46 = _Block_copy(&aBlock);
      static DispatchQoS.unspecified.getter(a3);
      Class v81 = _swiftEmptyArrayStorage;
      uint64_t v47 = lazy protocol witness table accessor for type ChannelType and conformance ChannelType( &lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      uint64_t v49 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]( &lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A],  &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      dispatch thunk of SetAlgebra.init<A>(_:)(&v81, v48, v49, v6, v47);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v13, v9, v46);
      _Block_release(v46);
      (*((void (**)(char *, uint64_t))v80 + 1))(v9, v6);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      swift_release(v87);
    }
  }

void closure #1 in closure #1 in SiriRemoteMonitor.updatePairedRemote()(char *a1, void *a2)
{
  id v4 = a2;
  NSString v5 = String._bridgeToObjectiveC()();
  [a1 willChangeValueForKey:v5];

  uint64_t v6 = *(void **)&a1[OBJC_IVAR___TVRDSiriRemoteMonitor__siriRemoteInfo];
  *(void *)&a1[OBJC_IVAR___TVRDSiriRemoteMonitor__siriRemoteInfo] = a2;
  id v7 = v4;

  id v8 = String._bridgeToObjectiveC()();
  [a1 didChangeValueForKey:v8];
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void closure #2 in closure #1 in SiriRemoteMonitor.updatePairedRemote()(char *a1)
{
  NSString v2 = String._bridgeToObjectiveC()();
  [a1 willChangeValueForKey:v2];

  uint64_t v3 = *(void **)&a1[OBJC_IVAR___TVRDSiriRemoteMonitor__siriRemoteInfo];
  *(void *)&a1[OBJC_IVAR___TVRDSiriRemoteMonitor__siriRemoteInfo] = 0LL;

  id v4 = String._bridgeToObjectiveC()();
  [a1 didChangeValueForKey:v4];
}

id SiriRemoteMonitor.init()()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v20 = *(void *)(v1 - 8);
  uint64_t v21 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)&v0[OBJC_IVAR___TVRDSiriRemoteMonitor_cbDevice] = 0LL;
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___TVSBluetoothManager);
  uint64_t v11 = v0;
  id result = [v10 sharedInstance];
  if (result)
  {
    *(void *)&v11[OBJC_IVAR___TVRDSiriRemoteMonitor_btManager] = result;
    uint64_t v13 = OBJC_IVAR___TVRDSiriRemoteMonitor_queue;
    uint64_t v14 = type metadata accessor for NSError( 0LL,  &lazy cache variable for type metadata for OS_dispatch_queue,  &OBJC_CLASS___OS_dispatch_queue_ptr);
    static DispatchQoS.unspecified.getter(v14);
    id v23 = _swiftEmptyArrayStorage;
    uint64_t v15 = lazy protocol witness table accessor for type ChannelType and conformance ChannelType( &lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    uint64_t v17 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]( &lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A],  &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v23, v16, v17, v4, v15);
    (*(void (**)(char *, void, uint64_t))(v20 + 104))( v3,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v21);
    *(void *)&v11[v13] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000021LL,  0x800000010001EC60LL,  v9,  v6,  v3,  0LL);
    *(void *)&v11[OBJC_IVAR___TVRDSiriRemoteMonitor__siriRemoteInfo] = 0LL;

    uint64_t v18 = (objc_class *)type metadata accessor for SiriRemoteMonitor();
    v22.receiver = v11;
    v22.super_class = v18;
    return objc_msgSendSuper2(&v22, "init");
  }

  else
  {
    __break(1u);
  }

  return result;
}

id SiriRemoteMonitor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemoteMonitor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriRemoteMonitor()
{
  return objc_opt_self(&OBJC_CLASS___TVRDSiriRemoteMonitor);
}

uint64_t sub_100015130()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void partial apply for closure #1 in SiriRemoteMonitor.updatePairedRemote()(void *a1, uint64_t a2)
{
}

uint64_t sub_10001515C()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

void partial apply for closure #1 in SiriRemoteMonitor.cbDeviceForPairedRemote(_:)(uint64_t a1)
{
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)( uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0,  *(void *)(v2 + 16) + 1LL,  1,  (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v3 > 1,  v4 + 1,  1,  (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0LL);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)( uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_100015858()
{
  swift_release(*(void *)(v0 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

void partial apply for closure #1 in closure #1 in SiriRemoteMonitor.cbDeviceForPairedRemote(_:)( uint64_t a1, uint64_t a2)
{
}

void *specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0LL;
      while ((a1 & 0xC000000000000001LL) != 0)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
LABEL_9:
        int64_t v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1LL)) {
          goto LABEL_22;
        }
        id v10 = [v7 identifier];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v14 = v13;

          if (v12 == a2 && v14 == a3)
          {
            uint64_t v17 = swift_bridgeObjectRelease(a3);
LABEL_18:
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
            uint64_t v18 = _swiftEmptyArrayStorage[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
            uint64_t v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v8);
            specialized ContiguousArray._endMutation()(v19);
            goto LABEL_5;
          }

          char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14);
          uint64_t v17 = swift_bridgeObjectRelease(v14);
          if ((v16 & 1) != 0) {
            goto LABEL_18;
          }
        }

LABEL_5:
        ++v6;
        if (v9 == v5) {
          return _swiftEmptyArrayStorage;
        }
      }

      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      if (a1 < 0) {
        uint64_t v21 = a1;
      }
      else {
        uint64_t v21 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v21);
      if (!v5) {
        return _swiftEmptyArrayStorage;
      }
    }

    id v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }

  return _swiftEmptyArrayStorage;
}

void partial apply for closure #2 in closure #1 in SiriRemoteMonitor.updatePairedRemote()()
{
}

uint64_t sub_100015A5C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void partial apply for closure #1 in closure #1 in SiriRemoteMonitor.updatePairedRemote()()
{
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]( unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

id partial apply for closure #1 in SiriRemoteMonitor.siriRemoteInfo.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(*(void *)(v1 + 16) + OBJC_IVAR___TVRDSiriRemoteMonitor__siriRemoteInfo);
  *a1 = v2;
  return v2;
}

void main_cold_1(os_log_s *a1)
{
  int v2 = *__error();
  unint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  id v7 = v4;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_FAULT,  "_set_user_dir_suffix failed. Error code: %d, Error: %s",  (uint8_t *)v5,  0x12u);
}

id objc_msgSend__currentLegibleTrackFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentLegibleTrackFromOptions:");
}

id objc_msgSend__currentSiriRemoteInfoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _currentSiriRemoteInfoDictionary];
}

id objc_msgSend__enableFindingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableFindingMode:");
}

id objc_msgSend__enableReduceLoudSounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableReduceLoudSounds:");
}

id objc_msgSend__fetchLaunchableApplications(void *a1, const char *a2, ...)
{
  return _[a1 _fetchLaunchableApplications];
}

id objc_msgSend__fetchUserAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _fetchUserAccounts];
}

id objc_msgSend__foregroundAppBundleID(void *a1, const char *a2, ...)
{
  return _[a1 _foregroundAppBundleID];
}

id objc_msgSend__foregroundAppSupportsGuideButton(void *a1, const char *a2, ...)
{
  return _[a1 _foregroundAppSupportsGuideButton];
}

id objc_msgSend__hasMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasMediaCharacteristic:");
}

id objc_msgSend__invokeUpdateHandlerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _invokeUpdateHandlerIfNeeded];
}

id objc_msgSend__invokeUpdateHandlerWithNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invokeUpdateHandlerWithNowPlayingInfo:");
}

id objc_msgSend__isPaused(void *a1, const char *a2, ...)
{
  return _[a1 _isPaused];
}

id objc_msgSend__preferredLanguageCodeFromLanguageCodes_preferredLanguageCode_systemLanguageCode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredLanguageCodeFromLanguageCodes:preferredLanguageCode:systemLanguageCode:");
}

id objc_msgSend__preferredLegibleTrackFromGroups_containsOnlyForcedCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:");
}

id objc_msgSend__pushSiriRemoteInfo(void *a1, const char *a2, ...)
{
  return _[a1 _pushSiriRemoteInfo];
}

id objc_msgSend__requestImageData(void *a1, const char *a2, ...)
{
  return _[a1 _requestImageData];
}

id objc_msgSend__reset(void *a1, const char *a2, ...)
{
  return _[a1 _reset];
}

id objc_msgSend__sendNowPlayingInfo(void *a1, const char *a2, ...)
{
  return _[a1 _sendNowPlayingInfo];
}

id objc_msgSend__sendNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendNowPlayingInfo:");
}

id objc_msgSend__sendSiriStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendSiriStatus:");
}

id objc_msgSend__sendSupportedActions(void *a1, const char *a2, ...)
{
  return _[a1 _sendSupportedActions];
}

id objc_msgSend__setupEventHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _setupEventHandlers];
}

id objc_msgSend__shouldUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUpdate];
}

id objc_msgSend__startMonitoringTVStatus(void *a1, const char *a2, ...)
{
  return _[a1 _startMonitoringTVStatus];
}

id objc_msgSend__switchSystemAppearenceMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchSystemAppearenceMode:");
}

id objc_msgSend__switchToUserAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchToUserAccountWithAltDSID:");
}

id objc_msgSend__switchToUserAccountWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchToUserAccountWithID:");
}

id objc_msgSend__toggleCaptionsIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleCaptionsIfNeeded:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_addItemWithMediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemWithMediaIdentifier:completion:");
}

id objc_msgSend_addNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNewConnection:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addPermanentObserverForProperty_notifyInitial_invokeOnMainThread_handler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_appInfos(void *a1, const char *a2, ...)
{
  return _[a1 appInfos];
}

id objc_msgSend_appServicesUpNextController(void *a1, const char *a2, ...)
{
  return _[a1 appServicesUpNextController];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attentionState(void *a1, const char *a2, ...)
{
  return _[a1 attentionState];
}

id objc_msgSend_availableLanguageOptions(void *a1, const char *a2, ...)
{
  return _[a1 availableLanguageOptions];
}

id objc_msgSend_beginLoadingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginLoadingUpdates];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_canonicalID(void *a1, const char *a2, ...)
{
  return _[a1 canonicalID];
}

id objc_msgSend_canonicalLanguageIdentifierFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalLanguageIdentifierFromString:");
}

id objc_msgSend_captionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 captionsEnabled];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _[a1 characteristics];
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsFromLocaleIdentifier:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _[a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsOnlyForcedSubtitles(void *a1, const char *a2, ...)
{
  return _[a1 containsOnlyForcedSubtitles];
}

id objc_msgSend_contentItem(void *a1, const char *a2, ...)
{
  return _[a1 contentItem];
}

id objc_msgSend_contentItems(void *a1, const char *a2, ...)
{
  return _[a1 contentItems];
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _[a1 controlFlags];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createPrefsDirectoryIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createPrefsDirectoryIfNeeded];
}

id objc_msgSend_currentCaptionTrack(void *a1, const char *a2, ...)
{
  return _[a1 currentCaptionTrack];
}

id objc_msgSend_currentCaptionsTrack(void *a1, const char *a2, ...)
{
  return _[a1 currentCaptionsTrack];
}

id objc_msgSend_currentLanguageOptions(void *a1, const char *a2, ...)
{
  return _[a1 currentLanguageOptions];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return _[a1 currentLayout];
}

id objc_msgSend_currentNowPlayingInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentNowPlayingInfo];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disable(void *a1, const char *a2, ...)
{
  return _[a1 disable];
}

id objc_msgSend_disableCaptions(void *a1, const char *a2, ...)
{
  return _[a1 disableCaptions];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_elapsedTimeTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeTimestamp];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_enable(void *a1, const char *a2, ...)
{
  return _[a1 enable];
}

id objc_msgSend_enableLanguageOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableLanguageOption:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_expectsTimedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 expectsTimedMetadata];
}

id objc_msgSend_fetchUpNextInfosWithPaginationToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUpNextInfosWithPaginationToken:completion:");
}

id objc_msgSend_fetchUpNextWithPaginationToken_playerContentId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUpNextWithPaginationToken:playerContentId:completion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_formattedFullName(void *a1, const char *a2, ...)
{
  return _[a1 formattedFullName];
}

id objc_msgSend_hasEffectiveCanonicalID(void *a1, const char *a2, ...)
{
  return _[a1 hasEffectiveCanonicalID];
}

id objc_msgSend_hasExpectsTimedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 hasExpectsTimedMetadata];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasUpdatedImageData(void *a1, const char *a2, ...)
{
  return _[a1 hasUpdatedImageData];
}

id objc_msgSend_hasValidCaptionOptions(void *a1, const char *a2, ...)
{
  return _[a1 hasValidCaptionOptions];
}

id objc_msgSend_iCloudAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAltDSID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _[a1 imageData];
}

id objc_msgSend_imageDataIsPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 imageDataIsPlaceholder];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initWithAccountStore_userProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:userProfile:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestination:");
}

id objc_msgSend_initWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandler:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithTimedMetadataUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimedMetadataUpdater:");
}

id objc_msgSend_initWithUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUpdateHandler:");
}

id objc_msgSend_initWithUserProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserProfile:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAutomaticLanguageOptionWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAutomaticLanguageOptionWithType:");
}

id objc_msgSend_isAuxiliaryContent(void *a1, const char *a2, ...)
{
  return _[a1 isAuxiliaryContent];
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return _[a1 isPlaying];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return _[a1 isUIApplicationElement];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_languageOptions(void *a1, const char *a2, ...)
{
  return _[a1 languageOptions];
}

id objc_msgSend_languageTag(void *a1, const char *a2, ...)
{
  return _[a1 languageTag];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_localDestination(void *a1, const char *a2, ...)
{
  return _[a1 localDestination];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_markAsWatchedWithMediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAsWatchedWithMediaIdentifier:completion:");
}

id objc_msgSend_mediaRemoteCommandCenter(void *a1, const char *a2, ...)
{
  return _[a1 mediaRemoteCommandCenter];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metadataFromContentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFromContentItem:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_msv_firstWhere_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msv_firstWhere:");
}

id objc_msgSend_nowPlayingInfoForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingInfoForCurrentState];
}

id objc_msgSend_nowPlayingMonitor(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingMonitor];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
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

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevices];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_playItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItem:completion:");
}

id objc_msgSend_playItemWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItemWithDictionary:");
}

id objc_msgSend_playbackNotificationToken(void *a1, const char *a2, ...)
{
  return _[a1 playbackNotificationToken];
}

id objc_msgSend_playbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 playbackQueue];
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return _[a1 playbackRate];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _[a1 playbackState];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _[a1 player];
}

id objc_msgSend_playerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 playerIdentifier];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferredCaptionTrack(void *a1, const char *a2, ...)
{
  return _[a1 preferredCaptionTrack];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_preferredOnlyForcedCaptionTrack(void *a1, const char *a2, ...)
{
  return _[a1 preferredOnlyForcedCaptionTrack];
}

id objc_msgSend_programID(void *a1, const char *a2, ...)
{
  return _[a1 programID];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return _[a1 proxy];
}

id objc_msgSend_rawData(void *a1, const char *a2, ...)
{
  return _[a1 rawData];
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_remoteMonitor(void *a1, const char *a2, ...)
{
  return _[a1 remoteMonitor];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemWithMediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemWithMediaIdentifier:completion:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_requestCanonicalIDForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCanonicalIDForIdentifier:");
}

id objc_msgSend_requestCanonicalIDForIdentifier_shouldExpectPlaybackSummaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCanonicalIDForIdentifier:shouldExpectPlaybackSummaries:");
}

id objc_msgSend_requestDecoratedNowPlayingSummaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDecoratedNowPlayingSummaries:");
}

id objc_msgSend_requestNowPlayingItemArtworkOnQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestNowPlayingItemArtworkOnQueue:completion:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_selectUserProfileWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectUserProfileWithIdentifier:completionHandler:");
}

id objc_msgSend_selectedUserProfile(void *a1, const char *a2, ...)
{
  return _[a1 selectedUserProfile];
}

id objc_msgSend_sendEventID_event_destinationID_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEventID:event:destinationID:options:completion:");
}

id objc_msgSend_sendEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEventID:event:options:completion:");
}

id objc_msgSend_setAdvertiseNonConnectableMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseNonConnectableMode:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setCanonicalID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanonicalID:");
}

id objc_msgSend_setCaptionsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionsEnabled:");
}

id objc_msgSend_setContentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentItem:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCurrentCaptionTrack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCaptionTrack:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExpectsTimedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectsTimedMetadata:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchUpNextInfosImpl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchUpNextInfosImpl:");
}

id objc_msgSend_setHasUpdatedImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasUpdatedImageData:");
}

id objc_msgSend_setHasValidCaptionOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasValidCaptionOptions:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageData:");
}

id objc_msgSend_setImageDataIsPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageDataIsPlaceholder:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLateNightModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLateNightModeEnabled:");
}

id objc_msgSend_setLocalDeviceUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceUpdatedHandler:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPlaybackRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackRate:");
}

id objc_msgSend_setPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackState:");
}

id objc_msgSend_setPlayerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerIdentifier:");
}

id objc_msgSend_setPreferredCaptionTrack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredCaptionTrack:");
}

id objc_msgSend_setPreferredOnlyForcedCaptionTrack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredOnlyForcedCaptionTrack:");
}

id objc_msgSend_setRawTimedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawTimedMetadata:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestClientProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestClientProperties:");
}

id objc_msgSend_setRequestPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestPlaybackQueue:");
}

id objc_msgSend_setRequestPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestPlaybackState:");
}

id objc_msgSend_setRssiThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssiThreshold:");
}

id objc_msgSend_setSiriStatusDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriStatusDict:");
}

id objc_msgSend_setSystemAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemAppearance:");
}

id objc_msgSend_setTimeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeOffset:");
}

id objc_msgSend_setTimedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimedMetadata:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setWantsChangeCallbacksDuringInitialLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsChangeCallbacksDuringInitialLoad:");
}

id objc_msgSend_setupHandlers(void *a1, const char *a2, ...)
{
  return _[a1 setupHandlers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_siriInfo(void *a1, const char *a2, ...)
{
  return _[a1 siriInfo];
}

id objc_msgSend_siriRemoteInfo(void *a1, const char *a2, ...)
{
  return _[a1 siriRemoteInfo];
}

id objc_msgSend_siriStatusDict(void *a1, const char *a2, ...)
{
  return _[a1 siriStatusDict];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return _[a1 summary];
}

id objc_msgSend_systemAttentionState(void *a1, const char *a2, ...)
{
  return _[a1 systemAttentionState];
}

id objc_msgSend_systemLanguage(void *a1, const char *a2, ...)
{
  return _[a1 systemLanguage];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return _[a1 tearDown];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDirectory];
}

id objc_msgSend_timedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 timedMetadata];
}

id objc_msgSend_timedMetadataUpdater(void *a1, const char *a2, ...)
{
  return _[a1 timedMetadataUpdater];
}

id objc_msgSend_timedMetadataWithIdentifier_rawData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timedMetadataWithIdentifier:rawData:");
}

id objc_msgSend_triggerUpdateForCaptionMetadata(void *a1, const char *a2, ...)
{
  return _[a1 triggerUpdateForCaptionMetadata];
}

id objc_msgSend_tvSystemMonitor(void *a1, const char *a2, ...)
{
  return _[a1 tvSystemMonitor];
}

id objc_msgSend_tvrd_filenameForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvrd_filenameForIdentifier:");
}

id objc_msgSend_tvrd_removeForRestoration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvrd_removeForRestoration");
}

id objc_msgSend_tvrd_restoredTimedMetadataForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvrd_restoredTimedMetadataForIdentifier:");
}

id objc_msgSend_tvrd_saveForRestoration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvrd_saveForRestoration");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_upNextController(void *a1, const char *a2, ...)
{
  return _[a1 upNextController];
}

id objc_msgSend_updateCanonicalIdentifier_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCanonicalIdentifier:bundleID:");
}

id objc_msgSend_updateCaptionOptionsWithCurrentLanguageOptions_availableLanguageGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCaptionOptionsWithCurrentLanguageOptions:availableLanguageGroups:");
}

id objc_msgSend_updateContentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentItem:");
}

id objc_msgSend_updateHandler(void *a1, const char *a2, ...)
{
  return _[a1 updateHandler];
}

id objc_msgSend_updateImageData_isPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateImageData:isPlaceholder:");
}

id objc_msgSend_updateMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMetadata:");
}

id objc_msgSend_updatePlaybackRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackRate:");
}

id objc_msgSend_updatePlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackState:");
}

id objc_msgSend_updatePlaybackStateWithPreviousMRPlaybackState_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackStateWithPreviousMRPlaybackState:to:");
}

id objc_msgSend_updatePlayerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlayerIdentifier:");
}

id objc_msgSend_updateTimedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimedMetadata:");
}

id objc_msgSend_userActivityTypes(void *a1, const char *a2, ...)
{
  return _[a1 userActivityTypes];
}

id objc_msgSend_userProfiles(void *a1, const char *a2, ...)
{
  return _[a1 userProfiles];
}

id objc_msgSend_userProfilesSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 userProfilesSnapshot];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}