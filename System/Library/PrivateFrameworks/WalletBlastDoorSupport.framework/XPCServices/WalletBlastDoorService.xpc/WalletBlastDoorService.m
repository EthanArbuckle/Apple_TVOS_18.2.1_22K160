int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  sub_100003DC0(&qword_100008000);
  __chkstk_darwin();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5 = type metadata accessor for WalletOrderPreviewUnpacker(0LL);
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  _CFPrefsSetDirectModeEnabled(1LL);
  _CFPrefsSetReadOnly(1LL);
  qword_100008010 = (uint64_t)&off_100004160;
  BlastDoorServer.setImageRestrictions(allowedImageFormats:increasedRestrictions:)( (Swift::OpaquePointer)&off_100004160,  1);
  qword_100008020 = (uint64_t)&_swiftEmptyArrayStorage;
  BlastDoorServer.setVideoRestrictions(codecs:)((Swift::OpaquePointer)&_swiftEmptyArrayStorage);
  type metadata accessor for BlastDoorServer(0LL);
  qword_100008018 = static BlastDoorServer.service.getter();
  WalletOrderPreviewUnpacker.init()();
  v9 = type metadata accessor for WalletOrderPreview(0LL);
  v10 = sub_100003E00();
  BlastDoorServer.register<A, B>(unpacker:for:)(v8, v9, v5, v9, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = enum case for SandboxID.blastdoor(_:);
  v12 = type metadata accessor for SandboxID(0LL);
  v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v4, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v4, 0LL, 1LL, v12);
  dispatch thunk of BlastDoorServer.resume(sandboxID:)(v4);
  sub_100003E48((uint64_t)v4);
  return 0;
}

uint64_t sub_100003DC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003E00()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    uint64_t v1 = type metadata accessor for WalletOrderPreviewUnpacker(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for WalletOrderPreviewUnpacker, v1);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }

  return result;
}

uint64_t sub_100003E48(uint64_t a1)
{
  uint64_t v2 = sub_100003DC0(&qword_100008000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}