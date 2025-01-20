@interface AdvertisementCacheTrampoline
- (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline)init;
- (void)advertisementCacheSimulation:(BOOL)a3 completion:(id)a4;
- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4;
- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6;
- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4;
- (void)clearCacheWithCompletion:(id)a3;
- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4;
- (void)markFilesProcessed:(id)a3 completion:(id)a4;
- (void)saveAdvertisements:(id)a3 completion:(id)a4;
- (void)saveBeaconPayloads:(id)a3 completion:(id)a4;
@end

@implementation AdvertisementCacheTrampoline

- (void)saveBeaconPayloads:(id)a3 completion:(id)a4
{
}

- (void)markFilesProcessed:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = swift_allocObject(&unk_10093BCF8, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  v10 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation,  v16,  0LL,  0LL);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[3];
  uint64_t ObjectType = swift_getObjectType(v11);
  v14 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v12 + 32);
  v15 = self;
  swift_unknownObjectRetain(v11);
  v14(v8, sub_10009C9E4, v9, ObjectType, v12);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
  swift_unknownObjectRelease(v11);
}

- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10093BCA8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation,  v21,  0LL,  0LL);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[3];
  uint64_t ObjectType = swift_getObjectType(*v8);
  id v12 = a3;
  v20 = self;
  swift_unknownObjectRetain(v9);
  uint64_t v13 = sub_10012C4B8();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = swift_allocObject(&unk_10093BCD0, 32LL, 7LL);
  *(void *)(v18 + 16) = sub_10009CA10;
  *(void *)(v18 + 24) = v7;
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v10 + 24);
  swift_bridgeObjectRetain(v15);
  swift_retain();
  v19(v13, v15, v17, sub_10009C670, v18, ObjectType, v10);

  swift_release(v7);
  swift_unknownObjectRelease(v9);
  swift_bridgeObjectRelease();
  swift_release(v18);
}

- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6
{
  v57 = a3;
  v60 = self;
  uint64_t v10 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v10);
  uint64_t v70 = (uint64_t)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v71 = *(void *)(v12 - 8);
  uint64_t v13 = *(void *)(v71 + 64);
  uint64_t v65 = v12;
  uint64_t v66 = v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v69 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v54 - v16;
  uint64_t v61 = type metadata accessor for UUID(0LL);
  uint64_t v59 = *(void *)(v61 - 8);
  uint64_t v63 = *(void *)(v59 + 64);
  uint64_t v18 = __chkstk_darwin(v61);
  v68 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  v21 = (char *)&v54 - v20;
  uint64_t v22 = type metadata accessor for URL(0LL);
  uint64_t v67 = *(void *)(v22 - 8);
  uint64_t v55 = v22;
  uint64_t v23 = *(void *)(v67 + 64);
  uint64_t v24 = __chkstk_darwin(v22);
  v56 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v24);
  v26 = (char *)&v54 - v25;
  v27 = _Block_copy(a6);
  v64 = v26;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v57);
  v62 = v21;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v28 = v17;
  v58 = v17;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v57 = (void *)swift_allocObject(&unk_10093BC58, 24LL, 7LL);
  v57[2] = v27;
  v29 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation,  v72,  0LL,  0LL);
  uint64_t v30 = *v29;
  uint64_t v31 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56LL))(v70, 1LL, 1LL, v31);
  uint64_t v32 = v67;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))( (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v26,  v22);
  uint64_t v33 = v59;
  v34 = v21;
  uint64_t v35 = v61;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v68, v34, v61);
  uint64_t v36 = v71;
  uint64_t v37 = v65;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v69, v28, v65);
  uint64_t v38 = *(unsigned __int8 *)(v32 + 80);
  uint64_t v39 = v32;
  uint64_t v40 = (v38 + 56) & ~v38;
  uint64_t v41 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v42 = (v23 + v41 + v40) & ~v41;
  uint64_t v43 = *(unsigned __int8 *)(v36 + 80);
  uint64_t v44 = (v63 + v43 + v42) & ~v43;
  v45 = (char *)swift_allocObject(&unk_10093BC80, v44 + v66, v38 | v41 | v43 | 7);
  *((void *)v45 + 2) = 0LL;
  *((void *)v45 + 3) = 0LL;
  *((void *)v45 + 4) = v30;
  *((void *)v45 + 5) = sub_10009C458;
  v46 = v56;
  v47 = v57;
  *((void *)v45 + 6) = v57;
  v48 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
  uint64_t v49 = v55;
  v48(&v45[v40], v46, v55);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v45[v42], v68, v35);
  v50 = &v45[v44];
  uint64_t v51 = v71;
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v50, v69, v37);
  swift_unknownObjectRetain_n(v30, 2LL);
  v52 = v60;
  swift_retain();
  uint64_t v53 = sub_1003EDB00(v70, (uint64_t)&unk_10099FB40, (uint64_t)v45);

  swift_release(v47);
  swift_unknownObjectRelease(v30);
  swift_release(v53);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v58, v37);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v62, v35);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v64, v49);
}

- (void)saveAdvertisements:(id)a3 completion:(id)a4
{
}

- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_10009B9D4(v8, (uint64_t)v9, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10093BC08, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10009C04C((uint64_t)sub_10009C440, v7);

  swift_release(v7);
}

- (void)advertisementCacheSimulation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = (char *)self
     + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation,  v15,  33LL,  0LL);
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *((void *)v7 + 1);
  uint64_t ObjectType = swift_getObjectType(*(void *)v7);
  uint64_t v11 = self;
  swift_unknownObjectRetain(v8);
  __int128 v13 = *((_OWORD *)v7 + 1);
  __int128 v14 = *((_OWORD *)v7 + 2);
  (*(void (**)(BOOL, uint64_t))(v13 + 16))(v4, ObjectType);
  uint64_t v12 = *(void *)v7;
  *(void *)uint64_t v7 = v8;
  *((void *)v7 + 1) = v9;
  *((_OWORD *)v7 + 1) = v13;
  *((_OWORD *)v7 + 2) = v14;
  swift_endAccess(v15);
  swift_unknownObjectRelease(v12);
  v6[2](v6, 0LL);
  _Block_release(v6);
}

- (void)clearCacheWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10093BB90, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10009C1D4((uint64_t)sub_10009C044, v5);

  swift_release(v5);
}

- (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline)init
{
  result = (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.AdvertisementCacheTrampoline",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation));
}

@end