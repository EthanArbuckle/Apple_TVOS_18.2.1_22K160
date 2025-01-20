id SiriUserSegmentsPlugin.perform(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  unint64_t v6;
  id v7;
  Class isa;
  uint64_t v10;
  v1 = type metadata accessor for SegmentationTaskResult(0LL);
  v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5 = (id)type metadata accessor for SegmentationTask(0LL);
  static SegmentationTask.perform()();
  if (!v0)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v6 = sub_100003490((uint64_t)&_swiftEmptyArrayStorage);
    v7 = objc_allocWithZone(&OBJC_CLASS___MLRTaskResult);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    v5 = [v7 initWithJSONResult:isa unprivatizedVector:0];
  }

  return v5;
}

unint64_t sub_100003490(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100003810(&qword_1000084E8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (void *)v3;
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
    sub_1000038B4(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100003850(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_1000038FC(&v18, (_OWORD *)(v4[7] + 32 * result));
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

id SiriUserSegmentsPlugin.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id SiriUserSegmentsPlugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriUserSegmentsPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SiriUserSegmentsPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC22SiriUserSegmentsPlugin22SiriUserSegmentsPlugin);
}

id SiriUserSegmentsPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriUserSegmentsPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100003810(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003850(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000390C(a1, a2, v5);
}

uint64_t sub_1000038B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003810((uint64_t *)&unk_1000084F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000038FC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000390C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    v10 = (void *)(v9 + 16 * v6);
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