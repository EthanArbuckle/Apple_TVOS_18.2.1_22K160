uint64_t static FilePath.temporaryDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  type metadata accessor for URL();
  MEMORY[0x1895F8858]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilePath?);
  MEMORY[0x1895F8858]();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v5 = objc_msgSend(v4, sel_temporaryDirectory);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  FilePath.init(_:)();
  v6 = type metadata accessor for FilePath();
  v7 = *(void *)(v6 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v3, 1LL, v6);
  if ((_DWORD)result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v3, v6);
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E2430]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t static FilePath.newTemporaryPath()@<X0>(uint64_t a1@<X8>)
{
  v15[1] = a1;
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858]();
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for URL();
  MEMORY[0x1895F8858]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilePath?);
  MEMORY[0x1895F8858]();
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for FilePath();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858]();
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  id v12 = objc_msgSend(v11, sel_temporaryDirectory);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  FilePath.init(_:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    strcpy((char *)v16, "darwin-init-");
    HIBYTE(v16[6]) = 0;
    v16[7] = -5120;
    UUID.init()();
    lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UUID and conformance UUID,  (uint64_t (*)(uint64_t))MEMORY[0x189606F20],  MEMORY[0x189606F70]);
    v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return FilePath.appending(_:)();
  }

  return result;
}

uint64_t FilePath.loadData()()
{
  uint64_t v2 = type metadata accessor for URL.DirectoryHint();
  uint64_t v35 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  v37 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1895F8858](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for FilePath();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  v34 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v9);
  id v12 = (char *)&v29 - v11;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)logger);
  Swift::String v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v36 = v0;
  v33 = v14;
  v14(v12, v0, v7);
  v15 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v31 = v2;
    v18 = (uint8_t *)v17;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v39 = v30;
    uint64_t v32 = v1;
    *(_DWORD *)v18 = 136315138;
    v29 = v18 + 4;
    lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type FilePath and conformance FilePath,  (uint64_t (*)(uint64_t))MEMORY[0x18961BBF0],  MEMORY[0x18961BC00]);
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    _os_log_impl(&dword_1891C4000, v15, v16, "Loading raw data of file at %s", v18, 0xCu);
    uint64_t v21 = v30;
    swift_arrayDestroy();
    MEMORY[0x1895E2484](v21, -1LL, -1LL);
    v22 = v18;
    uint64_t v2 = v31;
    MEMORY[0x1895E2484](v22, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }

  uint64_t v23 = (uint64_t)v34;
  v33(v34, v36, v7);
  uint64_t v24 = (uint64_t)v37;
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v37, *MEMORY[0x189606998], v2);
  URL.init(filePath:directoryHint:)(v23, v24, (uint64_t)v6);
  uint64_t v25 = type metadata accessor for URL();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48))(v6, 1LL, v25);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v28 = Data.init(contentsOf:options:)();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v25);
    return v28;
  }

  return result;
}

uint64_t URL.init(filePath:directoryHint:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1895F8858]();
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL.DirectoryHint();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for FilePath();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858]();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))( (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v11);
  uint64_t v14 = String.init(validating:)();
  if (v15)
  {
    os_log_type_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v25[1] = v14;
    v16(v10, a2, v7);
    uint64_t v17 = type metadata accessor for URL();
    uint64_t v26 = a1;
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v17 - 8);
    unint64_t v20 = v6;
    uint64_t v21 = v27;
    v25[0] = v7;
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
    v22(v20, 1LL, 1LL, v17);
    URL.init(filePath:directoryHint:relativeTo:)();
    (*(void (**)(uint64_t, void))(v8 + 8))(a2, v25[0]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v26, v11);
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v22)(v21, 0LL, 1LL, v18);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v7);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
    uint64_t v24 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56LL))( v27,  1LL,  1LL,  v24);
  }
}

uint64_t default argument 1 of FilePath.save(_:append:)()
{
  return 0LL;
}

{
  return 0LL;
}

uint64_t FilePath.save(_:append:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v47 = a1;
  uint64_t v5 = type metadata accessor for URL.DirectoryHint();
  uint64_t v43 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for FilePath();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = MEMORY[0x1895F8858](v12);
  uint64_t v17 = (char *)&v37 - v16;
  MEMORY[0x1895F8858](v15);
  uint64_t v19 = (char *)&v37 - v18;
  if ((a3 & 1) != 0)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)logger);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v46, v10);
    uint64_t v21 = v47;
    outlined copy of Data._Representation(v47, a2);
    v22 = (os_log_s *)Logger.logObject.getter();
    int v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, (os_log_type_t)v23))
    {
      LODWORD(v44) = v23;
      uint64_t v24 = (_DWORD *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v48 = v43;
      *uint64_t v24 = 134218242;
      __asm { BR              X10 }
    }

    outlined consume of Data._Representation(v21, a2);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);

    MEMORY[0x1895F8858](v30);
    *(&v37 - 2) = 0x20800000001LL;
    *((_DWORD *)&v37 - 2) = 16777636;
    uint64_t v31 = v45;
    uint64_t result = FilePath.withCString<A>(_:)();
    if (!v31)
    {
      MEMORY[0x1895F8858](result);
      *((_DWORD *)&v37 - 8) = v33;
      *(&v37 - 3) = v47;
      *(&v37 - 2) = a2;
      return FileDescriptor.closeAfter<A>(_:)();
    }
  }

  else
  {
    uint64_t v42 = v5;
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)logger);
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v26(v19, v46, v10);
    uint64_t v27 = v47;
    outlined copy of Data._Representation(v47, a2);
    uint64_t v28 = (os_log_s *)Logger.logObject.getter();
    int v41 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, (os_log_type_t)v41))
    {
      uint64_t v39 = v28;
      v29 = (_DWORD *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v48 = v38;
      _DWORD *v29 = 134218242;
      v40 = v26;
      __asm { BR              X10 }
    }

    outlined consume of Data._Representation(v27, a2);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);

    v26(v17, v46, v10);
    uint64_t v34 = (uint64_t)v44;
    (*(void (**)(char *, void, uint64_t))(v43 + 104))(v44, *MEMORY[0x189606998], v42);
    URL.init(filePath:directoryHint:)((uint64_t)v17, v34, (uint64_t)v9);
    uint64_t v35 = type metadata accessor for URL();
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v9, 1LL, v35) == 1)
    {
      __break(1u);
      JUMPOUT(0x1891C60E8LL);
    }

    Data.write(to:options:)();
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v9, v35);
  }

  return result;
}

uint64_t closure #1 in FilePath.save(_:append:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FileDescriptor._writeAll<A>(_:)();
  int v3 = result;
  if ((v4 & 1) != 0)
  {
    lazy protocol witness table accessor for type Errno and conformance Errno();
    swift_willThrowTypedImpl();
    uint64_t result = swift_allocError();
    *uint64_t v5 = v3;
  }

  else
  {
    *a1 = result;
  }

  return result;
}

{
  uint64_t v2;
  char v3;
  uint64_t result;
  _DWORD *v5;
  lazy protocol witness table accessor for type String.UTF8View and conformance String.UTF8View();
  swift_bridgeObjectRetain();
  uint64_t v2 = FileDescriptor._writeAll<A>(_:)();
  if ((v3 & 1) != 0)
  {
    lazy protocol witness table accessor for type Errno and conformance Errno();
    swift_willThrowTypedImpl();
    swift_allocError();
    *uint64_t v5 = v2;
    return swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *a1 = v2;
  }

  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FilePath.loadString()()
{
  int v3 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = type metadata accessor for URL.DirectoryHint();
  uint64_t v40 = *(void *)(v42 - 8);
  ((void (*)(void))MEMORY[0x1895F8858])();
  int v41 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  ((void (*)(void))MEMORY[0x1895F8858])();
  uint64_t v6 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for FilePath();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v39 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)v34 - v11;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)logger);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v43 = v0;
  uint64_t v38 = v14;
  v14(v12, v0, v7);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v35 = v6;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v36 = v3;
    uint64_t v20 = v19;
    uint64_t v45 = v19;
    uint64_t v37 = v1;
    *(_DWORD *)uint64_t v18 = 136315138;
    v34[1] = v18 + 4;
    lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type FilePath and conformance FilePath,  (uint64_t (*)(uint64_t))MEMORY[0x18961BBF0],  MEMORY[0x18961BC00]);
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    _os_log_impl(&dword_1891C4000, v15, v16, "Loading utf8 data of file at %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E2484](v20, -1LL, -1LL);
    int v23 = v18;
    uint64_t v6 = v35;
    MEMORY[0x1895E2484](v23, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }

  uint64_t v24 = (uint64_t)v39;
  v38(v39, v43, v7);
  uint64_t v25 = (uint64_t)v41;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v41, *MEMORY[0x189606998], v42);
  URL.init(filePath:directoryHint:)(v24, v25, (uint64_t)v6);
  uint64_t v26 = type metadata accessor for URL();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48))(v6, 1LL, v26);
  if ((_DWORD)v28 == 1)
  {
    __break(1u);
  }

  else
  {
    static String.Encoding.utf8.getter();
    uint64_t v30 = String.init(contentsOf:encoding:)();
    uint64_t v32 = v31;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v26);
    uint64_t v28 = v30;
    v29 = v32;
  }

  result._object = v29;
  result._countAndFlagsBits = v28;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FilePath.save(_:append:)( Swift::String _, Swift::Bool append)
{
  uint64_t v3 = v2;
  uint64_t countAndFlagsBits = _._countAndFlagsBits;
  unint64_t object = (unint64_t)_._object;
  uint64_t v6 = type metadata accessor for String.Encoding();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  MEMORY[0x1895F8858](v6);
  v61 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = type metadata accessor for URL.DirectoryHint();
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x1895F8858](v64);
  v63 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for FilePath();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  os_log_type_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  uint64_t v19 = (char *)&v51 - v18;
  MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v51 - v20;
  if (append)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    __swift_project_value_buffer(v22, (uint64_t)logger);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v66, v12);
    swift_bridgeObjectRetain();
    int v23 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    BOOL v25 = os_log_type_enabled(v23, v24);
    unint64_t v56 = object;
    if (v25)
    {
      unint64_t v26 = object;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v67[0] = v28;
      *(_DWORD *)uint64_t v27 = 134218242;
      uint64_t v58 = v2;
      uint64_t v64 = v28;
      if ((v26 & 0x1000000000000000LL) != 0)
      {
        Swift::Int v29 = String.UTF8View._foreignCount()();
      }

      else if ((v26 & 0x2000000000000000LL) != 0)
      {
        Swift::Int v29 = HIBYTE(v26) & 0xF;
      }

      else
      {
        Swift::Int v29 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
      }

      uint64_t v68 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type FilePath and conformance FilePath,  (uint64_t (*)(uint64_t))MEMORY[0x18961BBF0],  MEMORY[0x18961BC00]);
      uint64_t v38 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      _os_log_impl(&dword_1891C4000, v23, v24, "Appending %ld bytes of string to file at %s", (uint8_t *)v27, 0x16u);
      uint64_t v40 = v64;
      swift_arrayDestroy();
      MEMORY[0x1895E2484](v40, -1LL, -1LL);
      MEMORY[0x1895E2484](v27, -1LL, -1LL);

      uint64_t v3 = v58;
    }

    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    }

    MEMORY[0x1895F8858](v35);
    *(&v51 - 2) = 0x20800000001LL;
    *((_DWORD *)&v51 - 2) = 16777636;
    uint64_t v41 = FilePath.withCString<A>(_:)();
    if (!v3)
    {
      MEMORY[0x1895F8858](v41);
      *((_DWORD *)&v51 - 8) = v42;
      unint64_t v43 = v56;
      *(&v51 - 3) = countAndFlagsBits;
      *(&v51 - 2) = v43;
      FileDescriptor.closeAfter<A>(_:)();
    }
  }

  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v30 = type metadata accessor for Logger();
    __swift_project_value_buffer(v30, (uint64_t)logger);
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v31(v21, v66, v12);
    swift_bridgeObjectRetain();
    uint64_t v32 = (os_log_s *)Logger.logObject.getter();
    int v57 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v32, (os_log_type_t)v57))
    {
      uint64_t v53 = v13;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v67[0] = v52;
      *(_DWORD *)uint64_t v33 = 134218242;
      uint64_t v58 = v2;
      os_log_t v54 = v32;
      v55 = v31;
      if ((object & 0x1000000000000000LL) != 0)
      {
        Swift::Int v34 = String.UTF8View._foreignCount()();
      }

      else if ((object & 0x2000000000000000LL) != 0)
      {
        Swift::Int v34 = HIBYTE(object) & 0xF;
      }

      else
      {
        Swift::Int v34 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
      }

      uint64_t v68 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type FilePath and conformance FilePath,  (uint64_t (*)(uint64_t))MEMORY[0x18961BBF0],  MEMORY[0x18961BC00]);
      uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v21, v12);
      os_log_t v46 = v54;
      _os_log_impl( &dword_1891C4000,  v54,  (os_log_type_t)v57,  "Saving %ld bytes of data to file at %s",  (uint8_t *)v33,  0x16u);
      uint64_t v47 = v52;
      swift_arrayDestroy();
      MEMORY[0x1895E2484](v47, -1LL, -1LL);
      MEMORY[0x1895E2484](v33, -1LL, -1LL);

      uint64_t v37 = (uint64_t)v63;
      uint64_t v36 = v64;
      uint64_t v31 = v55;
    }

    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);

      uint64_t v37 = (uint64_t)v63;
      uint64_t v36 = v64;
    }

    v67[0] = countAndFlagsBits;
    v67[1] = object;
    v31(v19, v66, v12);
    (*(void (**)(uint64_t, void, uint64_t))(v62 + 104))(v37, *MEMORY[0x189606998], v36);
    URL.init(filePath:directoryHint:)((uint64_t)v19, v37, (uint64_t)v11);
    uint64_t v48 = type metadata accessor for URL();
    uint64_t v49 = *(void *)(v48 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v11, 1LL, v48) == 1)
    {
      __break(1u);
    }

    else
    {
      v50 = v61;
      static String.Encoding.utf8.getter();
      lazy protocol witness table accessor for type String and conformance String();
      StringProtocol.write(to:atomically:encoding:)();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v50, v60);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v11, v48);
    }
  }

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t closure #1 in static FileDescriptor.open(_:_:options:permissions:retryOnInterrupt:)@<X0>( _DWORD *a1@<X8>)
{
  uint64_t result = static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)();
  int v3 = result;
  if ((result & 0x100000000LL) != 0)
  {
    lazy protocol witness table accessor for type Errno and conformance Errno();
    swift_willThrowTypedImpl();
    uint64_t result = swift_allocError();
    _DWORD *v4 = v3;
  }

  else
  {
    *a1 = result;
  }

  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
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
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
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
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
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
    *a1 = v12;
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

  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
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

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
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
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type UUID and conformance UUID( unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895E243C](a3, v6);
    atomic_store(result, a1);
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
    swift_retain();
  }

  return swift_retain();
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t partial apply for closure #1 in static FileDescriptor.open(_:_:options:permissions:retryOnInterrupt:)@<X0>( _DWORD *a1@<X8>)
{
  return partial apply for closure #1 in static FileDescriptor.open(_:_:options:permissions:retryOnInterrupt:)(a1);
}

{
  return closure #1 in static FileDescriptor.open(_:_:options:permissions:retryOnInterrupt:)(a1);
}

uint64_t partial apply for closure #1 in FilePath.save(_:append:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in FilePath.save(_:append:)(a1);
}

{
  return closure #1 in FilePath.save(_:append:)(a1);
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = MEMORY[0x1895E243C](MEMORY[0x189617FF0], MEMORY[0x189617FA8]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type String.UTF8View and conformance String.UTF8View()
{
  unint64_t result = lazy protocol witness table cache variable for type String.UTF8View and conformance String.UTF8View;
  if (!lazy protocol witness table cache variable for type String.UTF8View and conformance String.UTF8View)
  {
    unint64_t result = MEMORY[0x1895E243C](MEMORY[0x189617F00], MEMORY[0x189617EF0]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type String.UTF8View and conformance String.UTF8View);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type Errno and conformance Errno()
{
  unint64_t result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    unint64_t result = MEMORY[0x1895E243C](MEMORY[0x18961BB90], MEMORY[0x18961BB88]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = MEMORY[0x1895E243C](MEMORY[0x189606D98], MEMORY[0x189606D70]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }

  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
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

uint64_t logger.unsafeMutableAddressor()
{
  return logger.unsafeMutableAddressor(&one-time initialization token for logger, (uint64_t)logger);
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)logger);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.default);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t Logger.default.unsafeMutableAddressor()
{
  return logger.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Logger.default);
}

uint64_t logger.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

void *Logger.subsystem.unsafeMutableAddressor()
{
  return &static Logger.subsystem;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t one-time initialization function for default()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.default);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.default);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init(category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.default.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.default);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

unint64_t DarwinInitClientFailure.description.getter()
{
  return 0xD000000000000052LL;
}

uint64_t static DarwinInitClientFailure.== infix(_:_:)()
{
  return 1LL;
}

void DarwinInitClientFailure.hash(into:)()
{
}

Swift::Int DarwinInitClientFailure.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DarwinInitClientFailure()
{
  return 1LL;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinInitClientFailure()
{
  return 0xD000000000000052LL;
}

uint64_t DarwinInitApplyFailureInfo.errorString.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

DarwinInitClient::DarwinInitApplyFailureInfo __swiftcall DarwinInitApplyFailureInfo.init(errorString:)( DarwinInitClient::DarwinInitApplyFailureInfo errorString)
{
  *uint64_t v1 = errorString;
  return errorString;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DarwinInitApplyFailureInfo.CodingKeys@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = specialized DarwinInitApplyFailureInfo.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance DarwinInitApplyFailureInfo.CodingKeys()
{
  return 0LL;
}

void protocol witness for CodingKey.init(intValue:) in conformance DarwinInitApplyFailureInfo.CodingKeys( _BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinInitApplyFailureInfo.CodingKeys()
{
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DarwinInitApplyFailureInfo.CodingKeys()
{
  return CodingKey.debugDescription.getter();
}

uint64_t DarwinInitApplyFailureInfo.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DarwinInitApplyFailureInfo.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  size_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t lazy protocol witness table accessor for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyFailureInfo.CodingKeys,  &unk_18A35E4D0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyFailureInfo.CodingKeys,  &unk_18A35E4D0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyFailureInfo.CodingKeys,  &unk_18A35E4D0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyFailureInfo.CodingKeys,  &unk_18A35E4D0);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys);
  }

  return result;
}

uint64_t DarwinInitApplyFailureInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DarwinInitApplyFailureInfo.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  int64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance DarwinInitApplyFailureInfo@<X0>( void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DarwinInitApplyFailureInfo.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance DarwinInitApplyFailureInfo(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DarwinInitApplyFailureInfo.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DarwinInitApplyFailureInfo.CodingKeys and conformance DarwinInitApplyFailureInfo.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t one-time initialization function for kDInitStatusFilepath()
{
  uint64_t v0 = type metadata accessor for FilePath();
  __swift_allocate_value_buffer(v0, static DarwinInitApplyStatus.kDInitStatusFilepath);
  __swift_project_value_buffer(v0, (uint64_t)static DarwinInitApplyStatus.kDInitStatusFilepath);
  return FilePath.init(stringLiteral:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DarwinInitApplyStatus.save()()
{
  uint64_t v2 = type metadata accessor for FilePath();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *v0;
  uint64_t v7 = v0[1];
  if (one-time initialization token for kDInitStatusFilepath != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)static DarwinInitApplyStatus.kDInitStatusFilepath);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  v13[0] = v6;
  v13[1] = v7;
  lazy protocol witness table accessor for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus();
  uint64_t v9 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (v1)
  {
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  else
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    swift_release();
    FilePath.save(_:append:)(v11, v12, 0);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    outlined consume of Data._Representation(v11, v12);
  }

unint64_t lazy protocol witness table accessor for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus,  &type metadata for DarwinInitApplyStatus);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus,  &type metadata for DarwinInitApplyStatus);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus);
  }

  return result;
}

uint64_t static DarwinInitApplyStatus.loadBootStatus()()
{
  if (one-time initialization token for kDInitStatusFilepath != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for FilePath();
  __swift_project_value_buffer(v1, (uint64_t)static DarwinInitApplyStatus.kDInitStatusFilepath);
  uint64_t v2 = FilePath.loadData()();
  if (v0)
  {
    lazy protocol witness table accessor for type DarwinInitClientFailure and conformance DarwinInitClientFailure();
    swift_allocError();
    swift_willThrow();
    return MEMORY[0x1895E2418](v0);
  }

  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    type metadata accessor for JSONDecoder();
    swift_allocObject();
    outlined copy of Data._Representation(v5, v6);
    JSONDecoder.init()();
    lazy protocol witness table accessor for type DarwinInitApplyStatus and conformance DarwinInitApplyStatus();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    swift_release();
    outlined consume of Data._Representation(v5, v6);
    return outlined consume of Data._Representation(v5, v6);
  }

unint64_t lazy protocol witness table accessor for type DarwinInitClientFailure and conformance DarwinInitClientFailure()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitClientFailure and conformance DarwinInitClientFailure;
  if (!lazy protocol witness table cache variable for type DarwinInitClientFailure and conformance DarwinInitClientFailure)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitClientFailure,  &type metadata for DarwinInitClientFailure);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitClientFailure and conformance DarwinInitClientFailure);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitClientFailure and conformance DarwinInitClientFailure;
  if (!lazy protocol witness table cache variable for type DarwinInitClientFailure and conformance DarwinInitClientFailure)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitClientFailure,  &type metadata for DarwinInitClientFailure);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitClientFailure and conformance DarwinInitClientFailure);
  }

  return result;
}

uint64_t DarwinInitApplyStatus.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x73736563637573LL;
  }
  else {
    return 0x6572756C696166LL;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DarwinInitApplyStatus.CodingKeys( unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance DarwinInitApplyStatus.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance DarwinInitApplyStatus.CodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DarwinInitApplyStatus.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance DarwinInitApplyStatus.CodingKeys()
{
  return DarwinInitApplyStatus.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DarwinInitApplyStatus.CodingKeys@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = specialized DarwinInitApplyStatus.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance DarwinInitApplyStatus.CodingKeys( _BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinInitApplyStatus.CodingKeys()
{
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DarwinInitApplyStatus.CodingKeys()
{
  return CodingKey.debugDescription.getter();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance DarwinInitClientFailure()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance DarwinInitApplyStatus.FailureCodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DarwinInitClientFailure()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DarwinInitApplyStatus.FailureCodingKeys@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = specialized DarwinInitApplyStatus.FailureCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinInitApplyStatus.FailureCodingKeys()
{
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DarwinInitApplyStatus.FailureCodingKeys()
{
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance DarwinInitApplyStatus.SuccessCodingKeys()
{
  return 0LL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DarwinInitApplyStatus.SuccessCodingKeys@<X0>( _BYTE *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinInitApplyStatus.SuccessCodingKeys()
{
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DarwinInitApplyStatus.SuccessCodingKeys()
{
  return CodingKey.debugDescription.getter();
}

uint64_t DarwinInitApplyStatus.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DarwinInitApplyStatus.SuccessCodingKeys>);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DarwinInitApplyStatus.FailureCodingKeys>);
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DarwinInitApplyStatus.CodingKeys>);
  uint64_t v20 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = v1[1];
  uint64_t v15 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v12 == 1)
  {
    LOBYTE(v21) = 1;
    lazy protocol witness table accessor for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }

  else
  {
    LOBYTE(v21) = 0;
    lazy protocol witness table accessor for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v21 = v15;
    uint64_t v22 = v12;
    lazy protocol witness table accessor for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo();
    uint64_t v14 = v19;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v14);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v11, v9);
}

unint64_t lazy protocol witness table accessor for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C](&protocol conformance descriptor for DarwinInitApplyStatus.CodingKeys, &unk_18A35E390);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C](&protocol conformance descriptor for DarwinInitApplyStatus.CodingKeys, &unk_18A35E390);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C](&protocol conformance descriptor for DarwinInitApplyStatus.CodingKeys, &unk_18A35E390);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C](&protocol conformance descriptor for DarwinInitApplyStatus.CodingKeys, &unk_18A35E390);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.SuccessCodingKeys,  &unk_18A35E440);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.SuccessCodingKeys,  &unk_18A35E440);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.SuccessCodingKeys,  &unk_18A35E440);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.FailureCodingKeys,  &unk_18A35E420);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.FailureCodingKeys,  &unk_18A35E420);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.FailureCodingKeys,  &unk_18A35E420);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyStatus.FailureCodingKeys,  &unk_18A35E420);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo()
{
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyFailureInfo,  &type metadata for DarwinInitApplyFailureInfo);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo;
  if (!lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo)
  {
    unint64_t result = MEMORY[0x1895E243C]( &protocol conformance descriptor for DarwinInitApplyFailureInfo,  &type metadata for DarwinInitApplyFailureInfo);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo);
  }

  return result;
}

uint64_t DarwinInitApplyStatus.init(from:)@<X0>(void *a1@<X0>, __int128 *a2@<X8>)
{
  BOOL v25 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DarwinInitApplyStatus.SuccessCodingKeys>);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x1895F8858](v27);
  unint64_t v26 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DarwinInitApplyStatus.FailureCodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DarwinInitApplyStatus.CodingKeys>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v28 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  lazy protocol witness table accessor for type DarwinInitApplyStatus.CodingKeys and conformance DarwinInitApplyStatus.CodingKeys();
  uint64_t v13 = v30;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v23 = v5;
  uint64_t v14 = v26;
  uint64_t v15 = v27;
  uint64_t v30 = v9;
  uint64_t v16 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v16 + 16) != 1LL)
  {
    uint64_t v18 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v20 = &type metadata for DarwinInitApplyStatus;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104LL))( v20,  *MEMORY[0x189619358],  v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
LABEL_9:
    uint64_t v21 = (uint64_t)v28;
    return __swift_destroy_boxed_opaque_existential_0(v21);
  }

  if ((*(_BYTE *)(v16 + 32) & 1) != 0)
  {
    LOBYTE(v29) = 1;
    lazy protocol witness table accessor for type DarwinInitApplyStatus.SuccessCodingKeys and conformance DarwinInitApplyStatus.SuccessCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    __int128 v17 = xmmword_1891C9D10;
  }

  else
  {
    LOBYTE(v29) = 0;
    lazy protocol witness table accessor for type DarwinInitApplyStatus.FailureCodingKeys and conformance DarwinInitApplyStatus.FailureCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type DarwinInitApplyFailureInfo and conformance DarwinInitApplyFailureInfo();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    __int128 v17 = v29;
  }

  uint64_t v21 = (uint64_t)v28;
  *BOOL v25 = v17;
  return __swift_destroy_boxed_opaque_existential_0(v21);
}

uint64_t protocol witness for Decodable.init(from:) in conformance DarwinInitApplyStatus@<X0>( void *a1@<X0>, __int128 *a2@<X8>)
{
  return DarwinInitApplyStatus.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance DarwinInitApplyStatus(void *a1)
{
  return DarwinInitApplyStatus.encode(to:)(a1);
}

uint64_t getEnumTag for DarwinInitClientFailure()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for DarwinInitClientFailure()
{
  return &type metadata for DarwinInitClientFailure;
}

void *initializeBufferWithCopyOfBuffer for DarwinInitApplyFailureInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DarwinInitApplyFailureInfo()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DarwinInitApplyFailureInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for DarwinInitApplyFailureInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DarwinInitApplyFailureInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DarwinInitApplyFailureInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for DarwinInitApplyFailureInfo()
{
  return &type metadata for DarwinInitApplyFailureInfo;
}

unint64_t destroy for DarwinInitApplyStatus(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DarwinInitApplyStatus(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }

  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  return a1;
}

void *assignWithCopy for DarwinInitApplyStatus(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }

    swift_bridgeObjectRelease();
    goto LABEL_11;
  }

  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for DarwinInitApplyStatus(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }

    swift_bridgeObjectRelease();
  }

  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for DarwinInitApplyStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for DarwinInitApplyStatus( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }

  return result;
}

uint64_t getEnumTag for DarwinInitApplyStatus(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *destructiveInjectEnumTag for DarwinInitApplyStatus(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = a2 - 0x7FFFFFFF;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = a2;
  }

  return result;
}

ValueMetadata *type metadata accessor for DarwinInitApplyStatus()
{
  return &type metadata for DarwinInitApplyStatus;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DarwinInitApplyStatus.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DarwinInitApplyStatus.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1891C919C + 4 * byte_1891C9D25[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891C91D0 + 4 * byte_1891C9D20[v4]))();
}

uint64_t sub_1891C91D0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891C91D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891C91E0LL);
  }
  return result;
}

uint64_t sub_1891C91EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891C91F4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1891C91F8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891C9200(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for DarwinInitApplyStatus.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for DarwinInitApplyStatus.CodingKeys(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for DarwinInitApplyStatus.CodingKeys()
{
  return &unk_18A35E390;
}

void *type metadata accessor for DarwinInitApplyStatus.FailureCodingKeys()
{
  return &unk_18A35E420;
}

void *type metadata accessor for DarwinInitApplyStatus.SuccessCodingKeys()
{
  return &unk_18A35E440;
}

uint64_t getEnumTagSinglePayload for DarwinInitClientFailure(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DarwinInitClientFailure(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1891C92E0 + 4 * byte_1891C9D2A[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1891C9300 + 4 * byte_1891C9D2F[v4]))();
  }
}

_BYTE *sub_1891C92E0(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1891C9300(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1891C9308(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1891C9310(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1891C9318(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1891C9320(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

void *type metadata accessor for DarwinInitApplyFailureInfo.CodingKeys()
{
  return &unk_18A35E4D0;
}

uint64_t specialized DarwinInitApplyFailureInfo.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x727453726F727265LL && a2 == 0xEB00000000676E69LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t specialized DarwinInitApplyFailureInfo.CodingKeys.stringValue.getter()
{
  return 0x727453726F727265LL;
}

uint64_t specialized DarwinInitApplyStatus.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6572756C696166LL && a2 == 0xE700000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x73736563637573LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t specialized DarwinInitApplyStatus.FailureCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 1868983913 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }

  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }

  return v4 & 1;
}

uint64_t specialized DarwinInitApplyStatus.FailureCodingKeys.stringValue.getter()
{
  return 1868983913LL;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x189606000]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x189606018]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x189606028]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1896060A8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1896060C0]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1896060D0]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x1896069A0]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x189606A48]();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x189606A70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x189606A90]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x189606B18]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x189606CE0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x189606F10]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x189606F20]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t FileDescriptor.closeAfter<A>(_:)()
{
  return MEMORY[0x18961BB68]();
}

uint64_t static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)()
{
  return MEMORY[0x18961BB70]();
}

uint64_t FileDescriptor._writeAll<A>(_:)()
{
  return MEMORY[0x18961BB78]();
}

uint64_t FilePath.init(_:)()
{
  return MEMORY[0x189607040]();
}

uint64_t FilePath.withCString<A>(_:)()
{
  return MEMORY[0x18961BB98]();
}

uint64_t FilePath.init(stringLiteral:)()
{
  return MEMORY[0x18961BBA8]();
}

uint64_t FilePath.appending(_:)()
{
  return MEMORY[0x18961BBE0]();
}

uint64_t type metadata accessor for FilePath()
{
  return MEMORY[0x18961BBF0]();
}

uint64_t String.init(contentsOf:encoding:)()
{
  return MEMORY[0x189607088]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x189607150]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x189607178]();
}

uint64_t String.init(validating:)()
{
  return MEMORY[0x18961BC10]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x189617EB0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x18961D220]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x189618D30]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x189618D50]();
}

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return MEMORY[0x189607350]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1896191F0]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x189619378]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1896193A0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x189619440]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x189619978]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x189619A68]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x189619A70]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x189619AB0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x189619AF8]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x189619B58]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x189619B98]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x189619BD8]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x189619BF0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x189619CC8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x18961A050]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x18961A950]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x18961A978]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x18961AF60]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x18961AF68]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}